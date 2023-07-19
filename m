Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95556759974
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 17:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4CB10E4C7;
	Wed, 19 Jul 2023 15:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 15772 seconds by postgrey-1.36 at gabe;
 Wed, 19 Jul 2023 15:22:02 UTC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DBB10E4C7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 15:22:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id B481B1C0006;
 Wed, 19 Jul 2023 15:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1689780121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=99wH+vey50DngufvBEte5SfRinX7I5E5R5JRlIDEi1s=;
 b=U9DkZbPDgqJw5yvQZnLPqRpyfLrpUQV3Tuckf19C7rBPjMvtD5TWzeSh7/y7a/BGEHYqrv
 qxVjrZV76FMvhtYwLMfxPTOsWPpTsPJyTQQAHyMZlCLZ+gqWk7NQO4iU6Hyzrn4qDLggTT
 Xx1USkh+ftS/34NfF8rztyErvPYrBZK2Bamk+w/gNOLZsednmEbIRY32MBfIsKojEBdbSS
 E0iuBzgcMSQF6PAzfZjCkJEClSB9wKACCZaqET40hFfIzvBYyyF8uymvoG5Ml874Urvx0z
 rX56v9HyN0G7sArJwwLYAlpc8YQF028V3uD+B8eDszArWgleLnw+uNR99fxcnA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 2/3] dt-bindings: display: panel: Add panels based on ILITEK
 ILI9806E
Date: Wed, 19 Jul 2023 17:21:46 +0200
Message-Id: <20230719152147.355486-2-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719152147.355486-1-luca.ceresoli@bootlin.com>
References: <20230719152147.355486-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for LCD panels based on the ILITEK ILI9806E RGB controller
connected over SPI and the "ShenZhen New Display Co NDS040480800-V3"
480x800 panel based on it.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 .../display/panel/ilitek,ili9806e.yaml        | 69 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
new file mode 100644
index 000000000000..42abc6923065
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili9806e.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI9806E display panels
+
+maintainers:
+  - Luca Ceresoli <luca.ceresoli@bootlin.com>
+
+description:
+  This binding is for display panels using an Ilitek ILI9806E controller in
+  SPI mode.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          # ShenZhen New Display Co 3.97" 480x800 RGB a-SI TFT LCD
+          - newdisplay,nds040480800-v3
+      - const: ilitek,ili9806e
+
+  reg: true
+  spi-max-frequency: true
+  reset-gpios: true
+  backlight: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    backlight: backlight {
+        compatible = "gpio-backlight";
+        gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
+    };
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "newdisplay,nds040480800-v3", "ilitek,ili9806e";
+            reg = <0>;
+            spi-max-frequency = <1000000>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_lcdgpios>;
+            reset-gpios = <&gpio 26 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
+
+            port {
+                ili9806e_in: endpoint {
+                    remote-endpoint = <&lcdif_out>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index aee340630eca..3c38699ee821 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6515,6 +6515,12 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
 F:	drivers/gpu/drm/tiny/ili9486.c
 
+DRM DRIVER FOR ILITEK ILI9806E PANELS
+M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+
 DRM DRIVER FOR JADARD JD9365DA-H3 MIPI-DSI LCD PANELS
 M:	Jagan Teki <jagan@edgeble.ai>
 S:	Maintained
-- 
2.34.1

