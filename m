Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A8619EEA2
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 01:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D676E218;
	Sun,  5 Apr 2020 23:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5866E218
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 23:39:52 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4FDB11F3;
 Mon,  6 Apr 2020 01:39:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586129991;
 bh=WaXqZPMWcYZzmvWaPwaATkCp5hTGbqBIyJX34xRQTUk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fi1fb5vJPqNwmhApjsVrBvJWhkjcB3y0YitV+gYkEeW4raauO0PxG6V9D4C9Ts288
 RzMjODh0m2zNQy0cu0gTjt0DRR6es4bCnVXrObDWuIw85gRpCCD7kMnu/qFu0ppHM6
 FCtFe5qajP9lhRtfvitKqrX1OTioV9IIiYam0U9o=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: devicetree@vger.kernel.org
Subject: [PATCH/RFC 3/6] dt-bindings: display: imx: hdmi: Convert binding to
 YAML
Date: Mon,  6 Apr 2020 02:39:32 +0300
Message-Id: <20200405233935.27599-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Mark Yao <mark.yao@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the i.MX6 HDMI TX text binding to YAML.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../bindings/display/imx/fsl,imx6-hdmi.yaml   | 143 ++++++++++++++++++
 .../devicetree/bindings/display/imx/hdmi.txt  |  65 --------
 2 files changed, 143 insertions(+), 65 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/imx/hdmi.txt

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
new file mode 100644
index 000000000000..209ebb11dd80
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
@@ -0,0 +1,143 @@
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
+  reg: true
+
+  reg-io-width:
+    const: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: iahb
+      - const: isfr
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
+  interrupts: true
+
+  ports:
+    type: object
+    description: |
+      This device has four video ports, corresponding to the four inputs of the
+      HDMI multiplexer. Their connections are modelled using the OF graph
+      bindings specified in Documentation/devicetree/bindings/graph.txt.
+      Each port shall have a single endpoint.
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      port@0:
+        type: object
+        description: First input of the HDMI multiplexer
+
+      port@1:
+        type: object
+        description: Second input of the HDMI multiplexer
+
+      port@2:
+        type: object
+        description: Third input of the HDMI multiplexer
+
+      port@3:
+        type: object
+        description: Fourth input of the HDMI multiplexer
+
+    anyOf:
+      - required:
+        - port@0
+      - required:
+        - port@1
+      - required:
+        - port@2
+      - required:
+        - port@3
+
+    additionalProperties: false
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
