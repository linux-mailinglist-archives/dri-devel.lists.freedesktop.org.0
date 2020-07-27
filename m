Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5FC22FDE8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 01:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033D86E0CE;
	Mon, 27 Jul 2020 23:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A7A89CE0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 16:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1595868389; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mA0DRhoXYfyoP4lmizj2glYU71M+JBHynLFFki0MJG8=;
 b=XIm9XgIArDbF4XmISOig7RvqAcx2s2zsdQ/st5sKUc3lnzQLwZGgWB2dnrlViJ29MyFxjH
 5++A+qejU3P8LvWhrRnc1te9rNuHOWdv4oO1kS01RJ137rB8EVNyTYPnqe+bEkzlOkgHez
 D2mA/+gq9Eovh2JDYJochFF/yY3rK0k=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH 1/6] dt-bindings: display: Document NewVision NV3052C DT node
Date: Mon, 27 Jul 2020 18:46:08 +0200
Message-Id: <20200727164613.19744-2-paul@crapouillou.net>
In-Reply-To: <20200727164613.19744-1-paul@crapouillou.net>
References: <20200727164613.19744-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 Jul 2020 23:32:42 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation for the Device Tree node for LCD panels based on the
NewVision NV3052C controller.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../display/panel/newvision,nv3052c.yaml      | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3052c.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3052c.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3052c.yaml
new file mode 100644
index 000000000000..751a28800fc2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3052c.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/newvision,nv3052c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NewVision NV3052C TFT LCD panel driver with SPI control bus
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+description: |
+  This is a driver for 320x240 TFT panels, accepting a variety of input
+  streams that get adapted and scaled to the panel. The panel output has
+  960 TFT source driver pins and 240 TFT gate driver pins, VCOM, VCOML and
+  VCOMH outputs.
+
+  The panel must obey the rules for a SPI slave device as specified in
+  spi/spi-controller.yaml
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - leadtek,ltk035c5444t-spi
+
+      - const: newvision,nv3052c
+
+  reg:
+    maxItems: 1
+
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      display@0 {
+        compatible = "leadtek,ltk035c5444t-spi", "newvision,nv3052c";
+        reg = <0>;
+
+        spi-max-frequency = <15000000>;
+        spi-3wire;
+        reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;
+        backlight = <&backlight>;
+        power-supply = <&vcc>;
+
+        port {
+          panel_input: endpoint {
+              remote-endpoint = <&panel_output>;
+          };
+        };
+      };
+    };
+
+...
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
