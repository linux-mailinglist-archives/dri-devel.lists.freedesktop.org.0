Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D5B285647
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 03:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170766E848;
	Wed,  7 Oct 2020 01:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1716E848
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 01:25:26 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC98E1980;
 Wed,  7 Oct 2020 03:25:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1602033925;
 bh=guksI4ZR9eU9whYYDMP4VS6Cj9EfLTnzcj7cKLS22Ko=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XVxm1XFFAZ3Jjz82laxbiPQYEtKvSiF/6+tdij5Nx64OAV1IWU/YJGd9V7mYS6FFk
 HoO0n5ZyIIObjdA7t3ruQUS9Wo2hnpq7s3yKdejInhgB/ny9qFgTVnFObLQFgqjrMM
 PQUmfO5Floj95gk5JrrA05wWQ5Bp3jAXpFEsIr/I=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/7] dt-bindings: display: mxsfb: Convert binding to YAML
Date: Wed,  7 Oct 2020 04:24:32 +0300
Message-Id: <20201007012438.27970-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007012438.27970-1-laurent.pinchart@ideasonboard.com>
References: <20201007012438.27970-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the mxsfb binding to YAML. The deprecated binding is dropped, as
neither the DT sources nor the driver support it anymore. The converted
binding is named fsl,lcdif.yaml to match the usual bindings naming
scheme.

The compatible strings are messy, and DT sources use different kinds of
combination of documented and undocumented values. Keep it simple for
now, and update the example to make it valid. Aligning the binding with
the existing DT sources will be performed separately.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
--
Changes since v1:

- Drop unneeded quotes in string
- Replace minItems with maxItems in conditional check
- Add blank line before ...
- Squash the rename in this commit
---
 .../bindings/display/fsl,lcdif.yaml           | 116 ++++++++++++++++++
 .../devicetree/bindings/display/mxsfb.txt     |  87 -------------
 MAINTAINERS                                   |   2 +-
 3 files changed, 117 insertions(+), 88 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/fsl,lcdif.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mxsfb.txt

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
new file mode 100644
index 000000000000..063bb8c58114
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale/NXP i.MX LCD Interface (LCDIF)
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+  - Stefan Agner <stefan@agner.ch>
+
+description: |
+  (e)LCDIF display controller found in the Freescale/NXP i.MX SoCs.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx23-lcdif
+      - fsl,imx28-lcdif
+      - fsl,imx6sx-lcdif
+      - fsl,imx8mq-lcdif
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Pixel clock
+      - description: Bus clock
+      - description: Display AXI clock
+    minItems: 1
+
+  clock-names:
+    items:
+      - const: pix
+      - const: axi
+      - const: disp_axi
+    minItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  port:
+    description: The LCDIF output port
+    type: object
+
+    properties:
+      endpoint:
+        type: object
+
+        properties:
+          remote-endpoint:
+            $ref: /schemas/types.yaml#/definitions/phandle
+
+        required:
+          - remote-endpoint
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - port
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx6sx-lcdif
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 3
+        clock-names:
+          minItems: 2
+          maxItems: 3
+      required:
+        - clock-names
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx6sx-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    display-controller@2220000 {
+        compatible = "fsl,imx6sx-lcdif";
+        reg = <0x02220000 0x4000>;
+        interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
+                 <&clks IMX6SX_CLK_LCDIF_APB>,
+                 <&clks IMX6SX_CLK_DISPLAY_AXI>;
+        clock-names = "pix", "axi", "disp_axi";
+
+        port {
+            endpoint {
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/mxsfb.txt b/Documentation/devicetree/bindings/display/mxsfb.txt
deleted file mode 100644
index c985871c46b3..000000000000
--- a/Documentation/devicetree/bindings/display/mxsfb.txt
+++ /dev/null
@@ -1,87 +0,0 @@
-* Freescale MXS LCD Interface (LCDIF)
-
-New bindings:
-=============
-Required properties:
-- compatible:	Should be "fsl,imx23-lcdif" for i.MX23.
-		Should be "fsl,imx28-lcdif" for i.MX28.
-		Should be "fsl,imx6sx-lcdif" for i.MX6SX.
-		Should be "fsl,imx8mq-lcdif" for i.MX8MQ.
-- reg:		Address and length of the register set for LCDIF
-- interrupts:	Should contain LCDIF interrupt
-- clocks:	A list of phandle + clock-specifier pairs, one for each
-		entry in 'clock-names'.
-- clock-names:	A list of clock names. For MXSFB it should contain:
-    - "pix" for the LCDIF block clock
-    - (MX6SX-only) "axi", "disp_axi" for the bus interface clock
-
-Required sub-nodes:
-  - port: The connection to an encoder chip.
-
-Example:
-
-	lcdif1: display-controller@2220000 {
-		compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
-		reg = <0x02220000 0x4000>;
-		interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
-			 <&clks IMX6SX_CLK_LCDIF_APB>,
-			 <&clks IMX6SX_CLK_DISPLAY_AXI>;
-		clock-names = "pix", "axi", "disp_axi";
-
-		port {
-			parallel_out: endpoint {
-				remote-endpoint = <&panel_in_parallel>;
-			};
-		};
-	};
-
-Deprecated bindings:
-====================
-Required properties:
-- compatible:	Should be "fsl,imx23-lcdif" for i.MX23.
-		Should be "fsl,imx28-lcdif" for i.MX28.
-- reg:		Address and length of the register set for LCDIF
-- interrupts:	Should contain LCDIF interrupts
-- display:	phandle to display node (see below for details)
-
-* display node
-
-Required properties:
-- bits-per-pixel:	<16> for RGB565, <32> for RGB888/666.
-- bus-width:		number of data lines.  Could be <8>, <16>, <18> or <24>.
-
-Required sub-node:
-- display-timings:	Refer to binding doc display-timing.txt for details.
-
-Examples:
-
-lcdif@80030000 {
-	compatible = "fsl,imx28-lcdif";
-	reg = <0x80030000 2000>;
-	interrupts = <38 86>;
-
-	display: display {
-		bits-per-pixel = <32>;
-		bus-width = <24>;
-
-		display-timings {
-			native-mode = <&timing0>;
-			timing0: timing0 {
-				clock-frequency = <33500000>;
-				hactive = <800>;
-				vactive = <480>;
-				hfront-porch = <164>;
-				hback-porch = <89>;
-				hsync-len = <10>;
-				vback-porch = <23>;
-				vfront-porch = <10>;
-				vsync-len = <10>;
-				hsync-active = <0>;
-				vsync-active = <0>;
-				de-active = <1>;
-				pixelclk-active = <0>;
-			};
-		};
-	};
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index f0dd1f01703a..87e20680c104 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11910,7 +11910,7 @@ M:	Stefan Agner <stefan@agner.ch>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-F:	Documentation/devicetree/bindings/display/mxsfb.txt
+F:	Documentation/devicetree/bindings/display/fsl,lcdif.yaml
 F:	drivers/gpu/drm/mxsfb/
 
 MYLEX DAC960 PCI RAID Controller
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
