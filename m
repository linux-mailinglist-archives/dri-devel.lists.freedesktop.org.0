Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7092F5ACA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 07:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E9F89725;
	Thu, 14 Jan 2021 06:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD1889722
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 06:45:03 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6A4DB77;
 Thu, 14 Jan 2021 07:45:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610606701;
 bh=ZDwCgQO+VcXgvcvNPTfzrpeC0b40fMrYFfkOCyeyk7k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aAx6lBcLpVeWsoeo/Smvs8y2tOiazMZPAEGXtLTN0V7PeuD4ifRhTQ7AEll1u9zC5
 yMpGhTazOvj6ALHN9tBaKlcawnOMtSh4022VUruTPnIwY5mrZPX+gPL9SNIXz5xzSK
 spFRV64IvosHgyPOdQNPhxUHQqdR6LJwHwQaVO7g=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/7] dt-bindings: display: imx: hdmi: Convert binding to
 YAML
Date: Thu, 14 Jan 2021 08:44:34 +0200
Message-Id: <20210114064437.5793-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210114064437.5793-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210114064437.5793-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mark Yao <markyao0591@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the i.MX6 HDMI TX text binding to YAML.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v3:

- Use port instead of port-base

Changes since v1:

- Only specify maxItems for clocks
- Drop reg and interrupts as they're checked in the base schema
- Rebase on top of OF graph schema, dropped redundant properties
- Fix identation for enum entries
- Drop clock-names items, use maxItems only
---
 .../bindings/display/imx/fsl,imx6-hdmi.yaml   | 126 ++++++++++++++++++
 .../devicetree/bindings/display/imx/hdmi.txt  |  65 ---------
 2 files changed, 126 insertions(+), 65 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/imx/hdmi.txt

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
new file mode 100644
index 000000000000..af7fe9c4d196
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx6-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX6 DWC HDMI TX Encoder
+
+maintainers:
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |
+  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
+  with a companion PHY IP.
+
+allOf:
+  - $ref: ../bridge/synopsys,dw-hdmi.yaml#
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx6dl-hdmi
+      - fsl,imx6q-hdmi
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
+  ddc-i2c-bus:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The HDMI DDC bus can be connected to either a system I2C master or the
+      functionally-reduced I2C master contained in the DWC HDMI. When connected
+      to a system I2C master this property contains a phandle to that I2C
+      master controller.
+
+  gpr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the iomuxc-gpr region containing the HDMI multiplexer control
+      register.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      This device has four video ports, corresponding to the four inputs of the
+      HDMI multiplexer. Each port shall have a single endpoint.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: First input of the HDMI multiplexer
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Second input of the HDMI multiplexer
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Third input of the HDMI multiplexer
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Fourth input of the HDMI multiplexer
+
+    anyOf:
+      - required:
+          - port@0
+      - required:
+          - port@1
+      - required:
+          - port@2
+      - required:
+          - port@3
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - gpr
+  - interrupts
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx6qdl-clock.h>
+
+    hdmi: hdmi@120000 {
+        reg = <0x00120000 0x9000>;
+        interrupts = <0 115 0x04>;
+        gpr = <&gpr>;
+        clocks = <&clks IMX6QDL_CLK_HDMI_IAHB>,
+                 <&clks IMX6QDL_CLK_HDMI_ISFR>;
+        clock-names = "iahb", "isfr";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                hdmi_mux_0: endpoint {
+                    remote-endpoint = <&ipu1_di0_hdmi>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                hdmi_mux_1: endpoint {
+                    remote-endpoint = <&ipu1_di1_hdmi>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/imx/hdmi.txt b/Documentation/devicetree/bindings/display/imx/hdmi.txt
deleted file mode 100644
index 6d021e71c9cf..000000000000
--- a/Documentation/devicetree/bindings/display/imx/hdmi.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-Freescale i.MX6 DWC HDMI TX Encoder
-===================================
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
-- compatible : Shall be one of "fsl,imx6q-hdmi" or "fsl,imx6dl-hdmi".
-- reg: See dw_hdmi.txt.
-- interrupts: HDMI interrupt number
-- clocks: See dw_hdmi.txt.
-- clock-names: Shall contain "iahb" and "isfr" as defined in dw_hdmi.txt.
-- ports: See dw_hdmi.txt. The DWC HDMI shall have between one and four ports,
-  numbered 0 to 3, corresponding to the four inputs of the HDMI multiplexer.
-  Each port shall have a single endpoint.
-- gpr : Shall contain a phandle to the iomuxc-gpr region containing the HDMI
-  multiplexer control register.
-
-Optional properties
-
-- ddc-i2c-bus: The HDMI DDC bus can be connected to either a system I2C master
-  or the functionally-reduced I2C master contained in the DWC HDMI. When
-  connected to a system I2C master this property contains a phandle to that
-  I2C master controller.
-
-
-Example:
-
-	gpr: iomuxc-gpr@20e0000 {
-		/* ... */
-	};
-
-        hdmi: hdmi@120000 {
-                #address-cells = <1>;
-                #size-cells = <0>;
-                compatible = "fsl,imx6q-hdmi";
-                reg = <0x00120000 0x9000>;
-                interrupts = <0 115 0x04>;
-                gpr = <&gpr>;
-                clocks = <&clks 123>, <&clks 124>;
-                clock-names = "iahb", "isfr";
-                ddc-i2c-bus = <&i2c2>;
-
-                port@0 {
-                        reg = <0>;
-
-                        hdmi_mux_0: endpoint {
-                                remote-endpoint = <&ipu1_di0_hdmi>;
-                        };
-                };
-
-                port@1 {
-                        reg = <1>;
-
-                        hdmi_mux_1: endpoint {
-                                remote-endpoint = <&ipu1_di1_hdmi>;
-                        };
-                };
-        };
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
