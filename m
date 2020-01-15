Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8F513C179
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 13:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4BE6E9B3;
	Wed, 15 Jan 2020 12:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB84C6E9B0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 12:46:00 +0000 (UTC)
Received: from ramsan ([84.195.182.253])
 by baptiste.telenet-ops.be with bizsmtp
 id qclq210045USYZQ01clqd9; Wed, 15 Jan 2020 13:45:57 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iri3S-0003yz-3C; Wed, 15 Jan 2020 13:45:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iri3S-00012Z-1m; Wed, 15 Jan 2020 13:45:50 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 David Lechner <david@lechnology.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 1/5] dt-bindings: display: sitronix,
 st7735r: Convert to DT schema
Date: Wed, 15 Jan 2020 13:45:44 +0100
Message-Id: <20200115124548.3951-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115124548.3951-1-geert+renesas@glider.be>
References: <20200115124548.3951-1-geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the DT binding documentation for Sitronix ST7735R displays to DT
schema.

Add a reference to the Adafruit 1.8" LCD while at it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 .../bindings/display/sitronix,st7735r.txt     | 35 ----------
 .../bindings/display/sitronix,st7735r.yaml    | 65 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 66 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/sitronix,st7735r.txt
 create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7735r.yaml

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.txt b/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
deleted file mode 100644
index cd5c7186890a2be7..0000000000000000
--- a/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Sitronix ST7735R display panels
-
-This binding is for display panels using a Sitronix ST7735R controller in SPI
-mode.
-
-Required properties:
-- compatible:	"jianda,jd-t18003-t01", "sitronix,st7735r"
-- dc-gpios:	Display data/command selection (D/CX)
-- reset-gpios:	Reset signal (RSTX)
-
-The node for this driver must be a child node of a SPI controller, hence
-all mandatory properties described in ../spi/spi-bus.txt must be specified.
-
-Optional properties:
-- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)
-- backlight:	phandle of the backlight device attached to the panel
-
-Example:
-
-	backlight: backlight {
-		compatible = "gpio-backlight";
-		gpios = <&gpio 44 GPIO_ACTIVE_HIGH>;
-	};
-
-	...
-
-	display@0{
-		compatible = "jianda,jd-t18003-t01", "sitronix,st7735r";
-		reg = <0>;
-		spi-max-frequency = <32000000>;
-		dc-gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&gpio 80 GPIO_ACTIVE_HIGH>;
-		rotation = <270>;
-		backlight = &backlight;
-	};
diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
new file mode 100644
index 0000000000000000..21bccc91f74255e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7735r.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7735R Display Panels Device Tree Bindings
+
+maintainers:
+  - David Lechner <david@lechnology.com>
+
+description:
+  This binding is for display panels using a Sitronix ST7735R controller in
+  SPI mode.
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - description:
+          Adafruit 1.8" 160x128 Color TFT LCD (Product ID 358 or 618)
+        items:
+          - enum:
+              - jianda,jd-t18003-t01
+          - const: sitronix,st7735r
+
+  spi-max-frequency:
+    maximum: 32000000
+
+  dc-gpios:
+    maxItems: 1
+    description: Display data/command selection (D/CX)
+
+required:
+  - compatible
+  - reg
+  - dc-gpios
+  - reset-gpios
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    backlight: backlight {
+            compatible = "gpio-backlight";
+            gpios = <&gpio 44 GPIO_ACTIVE_HIGH>;
+    };
+
+    spi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            display@0{
+                    compatible = "jianda,jd-t18003-t01", "sitronix,st7735r";
+                    reg = <0>;
+                    spi-max-frequency = <32000000>;
+                    dc-gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
+                    reset-gpios = <&gpio 80 GPIO_ACTIVE_HIGH>;
+                    rotation = <270>;
+            };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index ea8262509bdd21ac..3007f83bd504194a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5382,7 +5382,7 @@ M:	David Lechner <david@lechnology.com>
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 S:	Maintained
 F:	drivers/gpu/drm/tiny/st7735r.c
-F:	Documentation/devicetree/bindings/display/sitronix,st7735r.txt
+F:	Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
 
 DRM DRIVER FOR SONY ACX424AKP PANELS
 M:	Linus Walleij <linus.walleij@linaro.org>
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
