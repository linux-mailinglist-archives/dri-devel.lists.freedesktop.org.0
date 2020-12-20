Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 350FC2DF6B0
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 20:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA606E1CD;
	Sun, 20 Dec 2020 19:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135A86E1CD
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Dec 2020 19:50:22 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B41B8593;
 Sun, 20 Dec 2020 20:50:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608493820;
 bh=JsxbkkWKe7BruBY+YPjY/YvDcD50JT8oxET1iy4246Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pqhc+ulYanwhfwI4Z7bvscfnoSyYqCkndsUxgbMTiLV2zniXPLSJd4B6xWDzgBb6m
 dJOqcIOix3ZmMGAyftM1GHBBCN8E5bcd/HN1UbTtojyztEEbbvlJC3SHQnvG1j9TLn
 2uLxnTfWZ4ohWqSkv0u766drlvhTayCqyT5lbToo=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/6] dt-bindings: display: bridge: renesas,
 dw-hdmi: Convert binding to YAML
Date: Sun, 20 Dec 2020 21:50:01 +0200
Message-Id: <20201220195005.26438-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201220195005.26438-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201220195005.26438-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Sandy Huang <hjc@rock-chips.com>, linux-renesas-soc@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Mark Yao <mark.yao@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the Renesas R-Car DWC HDMI TX text binding to YAML.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Drop the part numbers in comments, only keep the SoC names
- Use unevaluatedProperties instead of additionalProperties
- Only specify maxItems for clocks and clock-names
- Drop reg, interrupts, #address-cells and #size-cells as they're
  checked in the base schema
- Use one size and address cell in example
- Rebase on top of OF graph schema, dropped redundant properties
- Fix identation for enum entries
---
 .../display/bridge/renesas,dw-hdmi.txt        |  88 ------------
 .../display/bridge/renesas,dw-hdmi.yaml       | 128 ++++++++++++++++++
 2 files changed, 128 insertions(+), 88 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
deleted file mode 100644
index 3f6072651182..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
+++ /dev/null
@@ -1,88 +0,0 @@
-Renesas Gen3 DWC HDMI TX Encoder
-================================
-
-The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
-with a companion PHY IP.
-
-These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
-Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt with the
-following device-specific properties.
-
-
-Required properties:
-
-- compatible : Shall contain one or more of
-  - "renesas,r8a774a1-hdmi" for R8A774A1 (RZ/G2M) compatible HDMI TX
-  - "renesas,r8a774b1-hdmi" for R8A774B1 (RZ/G2N) compatible HDMI TX
-  - "renesas,r8a774e1-hdmi" for R8A774E1 (RZ/G2H) compatible HDMI TX
-  - "renesas,r8a7795-hdmi" for R8A7795 (R-Car H3) compatible HDMI TX
-  - "renesas,r8a7796-hdmi" for R8A7796 (R-Car M3-W) compatible HDMI TX
-  - "renesas,r8a77961-hdmi" for R8A77961 (R-Car M3-W+) compatible HDMI TX
-  - "renesas,r8a77965-hdmi" for R8A77965 (R-Car M3-N) compatible HDMI TX
-  - "renesas,rcar-gen3-hdmi" for the generic R-Car Gen3 and RZ/G2 compatible
-			     HDMI TX
-
-    When compatible with generic versions, nodes must list the SoC-specific
-    version corresponding to the platform first, followed by the
-    family-specific version.
-
-- reg: See dw_hdmi.txt.
-- interrupts: HDMI interrupt number
-- clocks: See dw_hdmi.txt.
-- clock-names: Shall contain "iahb" and "isfr" as defined in dw_hdmi.txt.
-- ports: See dw_hdmi.txt. The DWC HDMI shall have one port numbered 0
-  corresponding to the video input of the controller and one port numbered 1
-  corresponding to its HDMI output, and one port numbered 2 corresponding to
-  sound input of the controller. Each port shall have a single endpoint.
-
-Optional properties:
-
-- power-domains: Shall reference the power domain that contains the DWC HDMI,
-  if any.
-
-
-Example:
-
-	hdmi0: hdmi@fead0000 {
-		compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
-		reg = <0 0xfead0000 0 0x10000>;
-		interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 729>;
-		clock-names = "iahb", "isfr";
-		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			port@0 {
-				reg = <0>;
-				dw_hdmi0_in: endpoint {
-					remote-endpoint = <&du_out_hdmi0>;
-				};
-			};
-			port@1 {
-				reg = <1>;
-				rcar_dw_hdmi0_out: endpoint {
-					remote-endpoint = <&hdmi0_con>;
-				};
-			};
-			port@2 {
-				reg = <2>;
-				rcar_dw_hdmi0_sound_in: endpoint {
-					remote-endpoint = <&hdmi_sound_out>;
-				};
-			};
-		};
-	};
-
-	hdmi0-out {
-		compatible = "hdmi-connector";
-		label = "HDMI0 OUT";
-		type = "a";
-
-		port {
-			hdmi0_con: endpoint {
-				remote-endpoint = <&rcar_dw_hdmi0_out>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
new file mode 100644
index 000000000000..23b940c3aff6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/renesas,dw-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car DWC HDMI TX Encoder
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+
+description: |
+  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
+  with a companion PHY IP.
+
+allOf:
+  - $ref: synopsys,dw-hdmi.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r8a774a1-hdmi # for RZ/G2M compatible HDMI TX
+          - renesas,r8a774b1-hdmi # for RZ/G2N compatible HDMI TX
+          - renesas,r8a774e1-hdmi # for RZ/G2H compatible HDMI TX
+          - renesas,r8a7795-hdmi # for R-Car H3 compatible HDMI TX
+          - renesas,r8a7796-hdmi # for R-Car M3-W compatible HDMI TX
+          - renesas,r8a77961-hdmi # for R-Car M3-W+ compatible HDMI TX
+          - renesas,r8a77965-hdmi # for R-Car M3-N compatible HDMI TX
+      - const: renesas,rcar-gen3-hdmi
+
+  reg-io-width:
+    const: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    maxItems: 2
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Parallel RGB input port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: HDMI output port
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Sound input port
+
+    required:
+      - port@0
+      - port@1
+      - port@2
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/r8a7795-sysc.h>
+
+    hdmi@fead0000 {
+        compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
+        reg = <0xfead0000 0x10000>;
+        interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 729>;
+        clock-names = "iahb", "isfr";
+        power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>;
+                dw_hdmi0_in: endpoint {
+                    remote-endpoint = <&du_out_hdmi0>;
+                };
+            };
+            port@1 {
+                reg = <1>;
+                rcar_dw_hdmi0_out: endpoint {
+                    remote-endpoint = <&hdmi0_con>;
+                };
+            };
+            port@2 {
+                reg = <2>;
+                rcar_dw_hdmi0_sound_in: endpoint {
+                    remote-endpoint = <&hdmi_sound_out>;
+                };
+            };
+        };
+    };
+
+    hdmi0-out {
+        compatible = "hdmi-connector";
+        label = "HDMI0 OUT";
+        type = "a";
+
+        port {
+            hdmi0_con: endpoint {
+                remote-endpoint = <&rcar_dw_hdmi0_out>;
+            };
+        };
+    };
+
+...
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
