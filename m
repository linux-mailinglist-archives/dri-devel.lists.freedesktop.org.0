Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 843143E3D96
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BDD89907;
	Mon,  9 Aug 2021 01:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5A4898EE
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:05 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7144B49A;
 Mon,  9 Aug 2021 03:35:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472903;
 bh=uCBShDtLpso1PQR1G9Zecj3wg6s5dGIqupTC1B356Eg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N7AJi5LOEfNDk530uvAewKgnVehMMY8lbHqAP/K0sQqxbZZN4NMcJqiAQ5Qx0anS7
 pbZL+/nCqYDymY07SRFgVpyQPUaG/he8enOBCsUU5jaDavRVtZ0+FlCum5LNEJH1hK
 LCTmKOlc0Mx7Rxm5c6XsJoWlYkfDjjK3UJBaa98E=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org
Subject: [PATCH 01/36] dt-bindings: display: xlnx: zynqmp-dpsub: Add OF graph
 ports
Date: Mon,  9 Aug 2021 04:34:22 +0300
Message-Id: <20210809013457.11266-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
References: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DPSUB doesn't live in isolation, but is connected to the
programmable logic for live inputs and outputs, and also has a
DisplayPort output. Model all those using OF graph.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../display/xlnx/xlnx,zynqmp-dpsub.yaml       | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
index d88bd93f4b80..5000c5fda027 100644
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
                <&psgtr 0 PHY_TYPE_DP 1 3 27000000>;
 
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

