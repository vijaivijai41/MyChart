//
//  CircleProgressView.swift
//  ChartSample
//
//  Created by Vijay on 01/07/21.
//

import Foundation
import UIKit


public class FICircleProgressView: UIView {
    
    let progressLineWidth: CGFloat = 5.0
    
    public func showFICircleProgress(bgColor: UIColor, progressColor: UIColor, progressValue: CGFloat) {
        self.createCicularPath(bgColor: bgColor, progressColor: progressColor, progressValue: progressValue)
    }
    
    private func createCicularPath(bgColor: UIColor, progressColor: UIColor, progressValue: CGFloat) {
        let outerLayer = CAShapeLayer()
        let progressLayer = CAShapeLayer()
        let center = self.center
       
        let outerLayerPath = UIBezierPath(arcCenter: center, radius: self.frame.size.width / 2, startAngle: -.pi/2, endAngle: 1.5 * .pi , clockwise: true)
        outerLayer.path = outerLayerPath.cgPath
        outerLayer.fillColor = bgColor.cgColor
        outerLayer.strokeColor = bgColor.cgColor
        outerLayer.lineCap = .round
        outerLayer.lineWidth = 0.0
        
        // progress Layer
        let progressLayerPath = UIBezierPath(arcCenter: center, radius: (self.frame.size.width/2 - progressLineWidth/2), startAngle: -.pi/2, endAngle: 1.5 * .pi, clockwise: true)
        progressLayer.path = progressLayerPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = progressLineWidth
        progressLayer.fillMode = .both
        progressLayer.strokeEnd = 0.0
        
        self.layer.addSublayer(progressLayer)
        self.layer.addSublayer(outerLayer)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = progressValue
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        progressLayer.add(animation, forKey: "progressAnim")
        
    }
}
