Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13660488AE6
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jan 2022 18:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10C010FAC4;
	Sun,  9 Jan 2022 17:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ixit.cz (ixit.cz [94.230.151.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB7D10FAC4;
 Sun,  9 Jan 2022 17:18:24 +0000 (UTC)
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz
 [89.176.96.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id 8D7BB2243C;
 Sun,  9 Jan 2022 18:18:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1641748701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=1neQMH4UzNAqauJdDad8SbWmvmqaMSnRi7ODRmIgqZc=;
 b=KAglRMact6mEBZWDewf3xQaQpwdkkMxOVw13HBLKw9vI6q/b4XFb5aUPMhcdMchTSvVwDz
 P7fTe4IlW22Of8Eu5Waq3f7QPYlpPEFQI20EPOvwXkAY/t5IaAaJS8/3jxwiHETMzboNyV
 eqsrh1RMGSLp1NWgf1wK8hYBBspHNsA=
From: David Heidelberg <david@ixit.cz>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] dt-bindings: msm/mdp4: convert to yaml format
Date: Sun,  9 Jan 2022 18:18:13 +0100
Message-Id: <20220109171814.16103-1-david@ixit.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Heidelberg <david@ixit.cz>, freedreno@lists.freedesktop.org,
 ~okias/devicetree@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert mdp4 binding into yaml format.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/display/msm/mdp4.txt  | 114 ----------------
 .../devicetree/bindings/display/msm/mdp4.yaml | 124 ++++++++++++++++++
 2 files changed, 124 insertions(+), 114 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp4.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdp4.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/mdp4.txt b/Documentation/devicetree/bindings/display/msm/mdp4.txt
deleted file mode 100644
index b07eeb38f709..000000000000
--- a/Documentation/devicetree/bindings/display/msm/mdp4.txt
+++ /dev/null
@@ -1,114 +0,0 @@
-Qualcomm adreno/snapdragon MDP4 display controller
-
-Description:
-
-This is the bindings documentation for the MDP4 display controller found in
-SoCs like MSM8960, APQ8064 and MSM8660.
-
-Required properties:
-- compatible:
-  * "qcom,mdp4" - mdp4
-- reg: Physical base address and length of the controller's registers.
-- interrupts: The interrupt signal from the display controller.
-- clocks: device clocks
-  See ../clocks/clock-bindings.txt for details.
-- clock-names: the following clocks are required.
-  * "core_clk"
-  * "iface_clk"
-  * "bus_clk"
-  * "lut_clk"
-  * "hdmi_clk"
-  * "tv_clk"
-- ports: contains the list of output ports from MDP. These connect to interfaces
-  that are external to the MDP hardware, such as HDMI, DSI, EDP etc (LVDS is a
-  special case since it is a part of the MDP block itself).
-
-  Each output port contains an endpoint that describes how it is connected to an
-  external interface. These are described by the standard properties documented
-  here:
-	Documentation/devicetree/bindings/graph.txt
-	Documentation/devicetree/bindings/media/video-interfaces.txt
-
-  The output port mappings are:
-	Port 0 -> LCDC/LVDS
-	Port 1 -> DSI1 Cmd/Video
-	Port 2 -> DSI2 Cmd/Video
-	Port 3 -> DTV
-
-Optional properties:
-- clock-names: the following clocks are optional:
-  * "lut_clk"
-- qcom,lcdc-align-lsb: Boolean value indicating that LSB alignment should be
-  used for LCDC. This is only valid for 18bpp panels.
-
-Example:
-
-/ {
-	...
-
-	hdmi: hdmi@4a00000 {
-		...
-		ports {
-			...
-			port@0 {
-				reg = <0>;
-				hdmi_in: endpoint {
-					remote-endpoint = <&mdp_dtv_out>;
-				};
-			};
-			...
-		};
-		...
-	};
-
-	...
-
-	mdp: mdp@5100000 {
-		compatible = "qcom,mdp4";
-		reg = <0x05100000 0xf0000>;
-		interrupts = <GIC_SPI 75 0>;
-		clock-names =
-		    "core_clk",
-		    "iface_clk",
-		    "lut_clk",
-		    "hdmi_clk",
-		    "tv_clk";
-		clocks =
-		    <&mmcc MDP_CLK>,
-		    <&mmcc MDP_AHB_CLK>,
-		    <&mmcc MDP_AXI_CLK>,
-		    <&mmcc MDP_LUT_CLK>,
-		    <&mmcc HDMI_TV_CLK>,
-		    <&mmcc MDP_TV_CLK>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					mdp_lvds_out: endpoint {
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-					mdp_dsi1_out: endpoint {
-					};
-				};
-
-				port@2 {
-					reg = <2>;
-					mdp_dsi2_out: endpoint {
-					};
-				};
-
-				port@3 {
-					reg = <3>;
-					mdp_dtv_out: endpoint {
-						remote-endpoint = <&hdmi_in>;
-					};
-				};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/msm/mdp4.yaml b/Documentation/devicetree/bindings/display/msm/mdp4.yaml
new file mode 100644
index 000000000000..f63f60fea27c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/mdp4.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/msm/mdp4.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Adreno/Snapdragon MDP4 display controller
+
+description: >
+  MDP4 display controller found in SoCs like MSM8960, APQ8064 and MSM8660.
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+
+properties:
+  compatible:
+    const: qcom,mdp4
+
+  clocks:
+    minItems: 6
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: core_clk
+      - const: iface_clk
+      - const: bus_clk
+      - const: lut_clk
+      - const: hdmi_clk
+      - const: tv_clk
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: LCDC/LVDS
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DSI1 Cmd / Video
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DSI2 Cmd / Video
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Digital TV
+
+  qcom,lcdc-align-lsb:
+    type: boolean
+    description: >
+      Indication that LSB alignment should be used for LCDC.
+      This is only valid for 18bpp panels.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    mdp: mdp@5100000 {
+        compatible = "qcom,mdp4";
+        reg = <0x05100000 0xf0000>;
+        interrupts = <0 75 0>;
+        clock-names =
+            "core_clk",
+            "iface_clk",
+            "bus_clk",
+            "lut_clk",
+            "hdmi_clk",
+            "tv_clk";
+        clocks =
+            <&mmcc 77>,
+            <&mmcc 86>,
+            <&mmcc 102>,
+            <&mmcc 75>,
+            <&mmcc 97>,
+            <&mmcc 12>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                mdp_lvds_out: endpoint {
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                mdp_dsi1_out: endpoint {
+                };
+            };
+
+            port@2 {
+                reg = <2>;
+                mdp_dsi2_out: endpoint {
+                };
+            };
+
+            port@3 {
+                reg = <3>;
+                mdp_dtv_out: endpoint {
+                    remote-endpoint = <&hdmi_in>;
+                };
+            };
+        };
+    };
-- 
2.34.1

