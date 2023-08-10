Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5D0777AFC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 16:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BF510E542;
	Thu, 10 Aug 2023 14:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7911810E53F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 14:41:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id DDBB6FF808;
 Thu, 10 Aug 2023 14:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1691678487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=43vnQBR2KS8SqaomNNWpPAxrNsBiEbiI0oMhAMJc4f8=;
 b=PtpWr7bsRF04hV2V7F4lz5rDT+aPb9VSIG0T5EuvMg1Use6IFBC77u7cPz17+APSkwEfW8
 ArOj9WmvtLiw+dSQSMw9vmx4JY2Vp3iRLs7xD2/R4aJNzqVuqhFvXNpyPsOAyJcGK1jq1w
 pPBDx9J22d/ORYUlyRuFC0lin98QeXvXETq+TOgmvmhQWC3wp8BQc9IVNtJK2vlnkExueh
 1ZF+j0unyhIAQfb2ZYfiEYtatARGAlkUw/lUAEJ0jt8GWVG41GKX6w52AztCJqjVnnKofG
 /hMG7j7JDduQSTHXhCygxnuYyuwNvJqI7tCE5CUYeIVFJXVu3yMGtFa18rDw3g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: display: panel: Add panels based on
 ILITEK ILI9806E
Date: Thu, 10 Aug 2023 16:41:15 +0200
Message-Id: <20230810144116.855951-2-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810144116.855951-1-luca.ceresoli@bootlin.com>
References: <20230810144116.855951-1-luca.ceresoli@bootlin.com>
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

Changes in v2:
 - remove T: line form MAINTAINERS entry
 - reference spi-peripheral-props.yaml
 - add 'maxItems: 1' to reg
 - use unevaluatedProperties
 - remove out of scope backlight node
---
 .../display/panel/ilitek,ili9806e.yaml        | 63 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
new file mode 100644
index 000000000000..83d177be4e7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -0,0 +1,63 @@
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
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          # ShenZhen New Display Co 3.97" 480x800 RGB a-SI TFT LCD
+          - newdisplay,nds040480800-v3
+      - const: ilitek,ili9806e
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
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
index 0f966f05fb0d..085e44a7b5e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6516,6 +6516,11 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
 F:	drivers/gpu/drm/tiny/ili9486.c
 
+DRM DRIVER FOR ILITEK ILI9806E PANELS
+M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+
 DRM DRIVER FOR JADARD JD9365DA-H3 MIPI-DSI LCD PANELS
 M:	Jagan Teki <jagan@edgeble.ai>
 S:	Maintained
-- 
2.34.1

