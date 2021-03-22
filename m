Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C7B343D63
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 11:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510FC89AD2;
	Mon, 22 Mar 2021 10:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
 by gabe.freedesktop.org (Postfix) with ESMTP id C5A4089C89
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 10:02:33 +0000 (UTC)
Received: from hq-00021.fritz.box (p57bc9f6a.dip0.t-ipconnect.de
 [87.188.159.106])
 by mail.bugwerft.de (Postfix) with ESMTPSA id 0FF8C4C3074;
 Mon, 22 Mar 2021 09:52:31 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v3 1/2] dt-bindings: display: add bindings for newhaven,
 1.8-128160EF
Date: Mon, 22 Mar 2021 10:52:22 +0100
Message-Id: <20210322095223.3607627-2-daniel@zonque.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322095223.3607627-1-daniel@zonque.org>
References: <20210322095223.3607627-1-daniel@zonque.org>
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
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org,
 Daniel Mack <daniel@zonque.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds documentation for a new ILI9163 based, SPI connected display.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 .../bindings/display/ilitek,ili9163.yaml      | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9163.yaml

diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9163.yaml b/Documentation/devicetree/bindings/display/ilitek,ili9163.yaml
new file mode 100644
index 0000000000000..edf1f925bc0cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ilitek,ili9163.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ilitek,ili9486.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI9163 display panels device tree bindings
+
+maintainers:
+  - Daniel Mack <daniel@zonque.org>
+
+description:
+  This binding is for display panels using an Ilitek ILI9163 controller in SPI
+  mode.
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - newhaven,1.8-128160EF
+          - ilitek,ili9163
+      - const: ilitek,ili9163
+
+  spi-max-frequency:
+    maximum: 32000000
+
+  dc-gpios:
+    maxItems: 1
+    description: Display data/command selection (D/CX)
+
+  backlight: true
+  reg: true
+  reset-gpios: true
+  rotation: true
+
+required:
+  - compatible
+  - reg
+  - dc-gpios
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    backlight: backlight {
+            compatible = "gpio-backlight";
+            gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
+    };
+    spi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            display@0{
+                    compatible = "waveshare,rpi-lcd-35", "ilitek,ili9486";
+                    reg = <0>;
+                    spi-max-frequency = <32000000>;
+                    dc-gpios = <&gpio0 24 GPIO_ACTIVE_HIGH>;
+                    reset-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
+                    rotation = <180>;
+                    backlight = <&backlight>;
+            };
+    };
+
+...
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
