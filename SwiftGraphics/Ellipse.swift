//
//  Ellipse.swift
//  Newton
//
//  Created by Jonathan Wight on 9/14/14.
//  Copyright (c) 2014 toxicsoftware. All rights reserved.
//

import CoreGraphics

public struct Ellipse {
    public let center:CGPoint
    public let a:CGFloat // Semi major axis
    public let b:CGFloat // Semi minor axis
    public let e:CGFloat // Eccentricity
    public let F:CGFloat // Distance to foci
    public let rotation:CGFloat

    public init(center:CGPoint, semiMajorAxis a:CGFloat, eccentricity e:CGFloat, rotation:CGFloat = 0.0) {
        self.center = center
        self.a = a
        self.b = a * sqrt(1.0 - e * e)
        self.e = e
        self.F = a * e
        self.rotation = rotation
    }

//    public var F1: CGPoint { get { return CGPoint(x:self.center.x - self.F, y:self.center.y) } }
//    public var F2: CGPoint { get { return CGPoint(x:self.center.x + self.F, y:self.center.y) } }

    public var foci:(CGPoint, CGPoint) {
        get {
            let t = CGAffineTransform(rotation: rotation)
            return (
                center + CGPoint(x:-F) * t,
                center + CGPoint(x:+F) * t
            )
        }
    }

//    public var size:CGSize {
//        get {
//            return CGSize(width:a * 2, height:b * 2)
//        }
//    }
//
//    public var frame:CGRect {
//        get {
//            let size = CGSize(width:a * 2, height:b * 2)
//            let origin = CGPoint(x:center.x - size.width * 0.5, y:center.y - size.height * 0.5)
//            return CGRect(origin:origin, size:size)
//        }
//    }

}

public extension Ellipse {
    var asCircle : Circle? {
        get {
            return nil
        }
    }
}

//public extension Ellipse {
//    var path:CGPath { get { return CGPathCreateWithEllipseInRect(frame, nil) } }
//}
//
