Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 391F25EE98E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE41510E120;
	Wed, 28 Sep 2022 22:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A5E10E097
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:47:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE19A6BE;
 Thu, 29 Sep 2022 00:47:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405243;
 bh=XOEVBAFnPFMh/tyYzRh1ZHo0A71aiIwx9p74RfBRUE8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b4Kqzl92tQGq2rmNFFzkJ4yMeSeweItBFps5l7+PFW8vOYgtQdS7PZrEkBQrf72JM
 aO7S1EWPEaNc+1gXoeDwAZCjlr21+G1y4URJvkYxqZ9fEVlGZ6arfF2uO4NQtvi+r+
 0+5ojSIW2wDlMTXkdxPRMIAnqoxnaRfZ6LK5koLI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/37] dt-bindings: display: xlnx: zynqmp-dpsub: Add OF
 graph ports
Date: Thu, 29 Sep 2022 01:46:43 +0300
Message-Id: <20220928224719.3291-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
References: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Jianqiang Chen <jianqian@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DPSUB doesn't live in isolation, but is connected to the
programmable logic for live inputs and outputs, and also has a
DisplayPort output. Model all those using OF graph.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/xlnx/xlnx,zynqmp-dpsub.yaml       | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
index 10ec78ca1c65..554f9d5809d4 100644
--- a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
+++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
@@ -117,6 +117,45 @@ properties:
       - const: dp-phy0
       - const: dp-phy1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      Connections to the programmable logic and the DisplayPort PHYs. Each port
+      shall have a single endpoint.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The live video input from the programmable logic
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The live graphics input from the programmable logic
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The live audio input from the programmable logic
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The blended video output to the programmable logic
+
+      port@4:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The mixed audio output to the programmable logic
+
+      port@5:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The DisplayPort output
+
+    required:
+      - port@0
+      - port@1
+      - port@2
+      - port@3
+      - port@4
+      - port@5
+
 required:
   - compatible
   - reg
@@ -130,6 +169,7 @@ required:
   - dma-names
   - phys
   - phy-names
+  - ports
 
 additionalProperties: false
 
@@ -164,6 +204,33 @@ examples:
                <&psgtr 0 PHY_TYPE_DP 1 3>;
 
         phy-names = "dp-phy0", "dp-phy1";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+            };
+            port@1 {
+                reg = <1>;
+            };
+            port@2 {
+                reg = <2>;
+            };
+            port@3 {
+                reg = <3>;
+            };
+            port@4 {
+                reg = <4>;
+            };
+            port@5 {
+                reg = <5>;
+                dpsub_dp_out: endpoint {
+                    remote-endpoint = <&dp_connector>;
+                };
+            };
+        };
     };
 
 ...
-- 
Regards,

Laurent Pinchart

