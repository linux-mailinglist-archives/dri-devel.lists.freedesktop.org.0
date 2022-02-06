Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD544AB73F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 10:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF0E10F195;
	Mon,  7 Feb 2022 09:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5C710E5AD
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 08:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H+K0Mw+aNVES2mwMvkXQigdI4Z1BakCZfSJdbqJXbHk=; b=CTKDc/bBJVb0on6YJ2r18su6vX
 oB7E9DXsZ72LdaPVMBMqqQnauWLOjmQDjiw4vGSYhEcAWs05AhCOhBHX8ZQ8oUI1HxXxp/R2WU48Q
 bcrTj8t7lggqehOIckOFhO9EjAwPx1VlyY4cZLWZIZWNZCDyGwB7qjMVdxucDR1DiLR0=;
Received: from p200300ccff05f6001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff05:f600:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1nGcTJ-0006V0-KG; Sun, 06 Feb 2022 09:00:33 +0100
Received: from andi by aktux with local (Exim 4.94.2)
 (envelope-from <andreas@kemnade.info>)
 id 1nGcTJ-003LEe-4H; Sun, 06 Feb 2022 09:00:33 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 andreas@kemnade.info, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, alistair@alistair23.me, samuel@sholland.org,
 josua.mayer@jm0.eu, letux-kernel@openphoenux.org
Subject: [RFC PATCH 1/6] dt-bindings: display: imx: Add EPDC
Date: Sun,  6 Feb 2022 09:00:11 +0100
Message-Id: <20220206080016.796556-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220206080016.796556-1-andreas@kemnade.info>
References: <20220206080016.796556-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Mon, 07 Feb 2022 09:09:20 +0000
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

Add a binding for the Electrophoretic Display Controller found at least
in the i.MX6.
The timing subnode is directly here to avoid having display parameters
spread all over the plate.

Supplies are organized the same way as in the fbdev driver in the
NXP/Freescale kernel forks. The regulators used for that purpose,
like the TPS65185, the SY7636A and MAX17135 have typically a single bit to
start a bunch of regulators of higher or negative voltage with a
well-defined timing. VCOM can be handled separately, but can also be
incorporated into that single bit.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../bindings/display/imx/fsl,mxc-epdc.yaml    | 159 ++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml
new file mode 100644
index 000000000000..7e0795cc3f70
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml
@@ -0,0 +1,159 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,mxc-epdc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX6 EPDC
+
+maintainers:
+  - Andreas Kemnade <andreas@kemnade.info>
+
+description: |
+  The EPDC is a controller for handling electronic paper displays found in
+  i.MX6 SoCs.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx6sl-epdc
+      - fsl,imx6sll-epdc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus clock
+      - description: Pixel clock
+
+  clock-names:
+    items:
+      - const: axi
+      - const: pix
+
+  interrupts:
+    maxItems: 1
+
+  vscan-holdoff:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+
+  sdoed-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+
+  sdoed-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+
+  sdoez-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+
+  sdoez-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+
+  gdclk-hp-offs:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+
+  gdsp-offs:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+
+  gdoe-offs:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+
+  gdclk-offs:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+
+  num-ce:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+
+  timing:
+    $ref: /display/panel/panel-timing.yaml#
+
+  DISPLAY-supply:
+    description:
+      A couple of +/- voltages automatically powered on in a defintive order
+
+  VCOM-supply:
+    description: compensation voltage
+
+  V3P3-supply:
+    description: V3P3 supply
+
+  epd-thermal-zone:
+    description:
+      Zone to get temperature of the EPD from, practically ambient temperature.
+
+
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - vscan-holdoff
+  - sdoed-width
+  - sdoed-delay
+  - sdoez-width
+  - sdoez-delay
+  - gdclk-hp-offs
+  - gdsp-offs
+  - gdoe-offs
+  - gdclk-offs
+  - num-ce
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx6sl-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    epdc: epdc@20f4000 {
+        compatible = "fsl,imx6sl-epdc";
+        reg = <0x020f4000 0x4000>;
+        interrupts = <0 97 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks IMX6SL_CLK_EPDC_AXI>, <&clks IMX6SL_CLK_EPDC_PIX>;
+        clock-names = "axi", "pix";
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_epdc0>;
+        V3P3-supply = <&V3P3_reg>;
+        VCOM-supply = <&VCOM_reg>;
+        DISPLAY-supply = <&DISPLAY_reg>;
+        epd-thermal-zone = "epd-thermal";
+
+        vscan-holdoff = <4>;
+        sdoed-width = <10>;
+        sdoed-delay = <20>;
+        sdoez-width = <10>;
+        sdoez-delay = <20>;
+        gdclk-hp-offs = <562>;
+        gdsp-offs = <662>;
+        gdoe-offs = <0>;
+        gdclk-offs = <225>;
+        num-ce = <3>;
+        status = "okay";
+
+        timing {
+                clock-frequency = <80000000>;
+                hactive = <1448>;
+                hback-porch = <16>;
+                hfront-porch = <102>;
+                hsync-len = <28>;
+                vactive = <1072>;
+                vback-porch = <4>;
+                vfront-porch = <4>;
+                vsync-len = <2>;
+        };
+    };
+...
-- 
2.30.2

