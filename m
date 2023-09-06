Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1097942E8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 20:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116F510E066;
	Wed,  6 Sep 2023 18:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 431 seconds by postgrey-1.36 at gabe;
 Wed, 06 Sep 2023 16:30:32 UTC
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209C610E055
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 16:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1694017832;
 x=1725553832;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=KrG2MZOvGizkIauCc3KWNFT1LrSe5AapyjWhd8HHjzw=;
 b=UUCSLxzD2XgSN3hTFO+yXm5apKUDp1abEbxUUZKKRJf6HHwFI3e1rSom
 7B8G/nhDKne6aXYcIzkliN2PIyqhekoxgm1k4SO84ky4QEAol0UFcMxza
 XYgnlCE8cL2wFnJM4Ab0xJByIGnKAS3hadLW1jUQPSKGvSPd3M/3tGZGr
 jBsnvxT7imag9RiJyUDXFoT3mgE7rOH1iYR4IBFGl/oDkZHBbbSwHSIx0
 bBXU+nxGB155k+/H3bF2RGkk2/mzMCdVSxNMj1H5rKdvamYXw2z1JlFiZ
 zdWjRraY7umzpGrNgTe5SzQtd1tKQVQcfV3cu5qqBUuKPeNNgTpg25LOO Q==;
From: Stefan x Nilsson <stefan.x.nilsson@axis.com>
Date: Wed, 6 Sep 2023 18:22:16 +0200
Subject: [PATCH 1/2] dt-bindings: display: Add st7735s driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230906-st7735s-v1-1-add92677c190@axis.com>
References: <20230906-st7735s-v1-0-add92677c190@axis.com>
In-Reply-To: <20230906-st7735s-v1-0-add92677c190@axis.com>
To: David Lechner <david@lechnology.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>
X-Mailer: b4 0.12.3
X-Mailman-Approved-At: Wed, 06 Sep 2023 18:15:36 +0000
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
Cc: Stefan x Nilsson <stefan.x.nilsson@axis.com>, devicetree@vger.kernel.org,
 kernel@axis.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for a driver for Sitronix st7735s display controller, as
well as for a Winstar wf0096atyaa3dnn0 0.96" 80x160 TFT panel.

Signed-off-by: Stefan x Nilsson <stefan.x.nilsson@axis.com>
---
 .../bindings/display/sitronix,st7735s.yaml         | 81 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735s.yaml b/Documentation/devicetree/bindings/display/sitronix,st7735s.yaml
new file mode 100644
index 000000000000..36234ec22fe2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7735s.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7735s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7735S Display Panels
+
+maintainers:
+  - Stefan x Nilsson <stefan.x.nilsson@axis.com>
+
+description:
+  This binding is for display panels using a Sitronix ST7735S
+  controller in SPI mode.
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - description:
+          Winstar WF0096ATYAA3DNN0 0.96" 80x160 Color TFT
+        items:
+          - enum:
+              - winstar,wf0096atyaa3dnn0
+          - const: sitronix,st7735s
+
+  dc-gpios:
+    maxItems: 1
+    description: Display data/command selection (D/CX)
+
+  backlight: true
+  reg: true
+  spi-max-frequency: true
+  reset-gpios: true
+  rotation: true
+
+required:
+  - compatible
+  - reg
+  - dc-gpios
+
+additionalProperties: true
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
+    regdisplay: regulatordisplay {
+            compatible = "regulator-fixed";
+            regulator-name = "display";
+            regulator-min-microvolt = <3300000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <100000>;
+            enable-active-high;
+    };
+
+    spi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            display@0 {
+                    compatible = "winstar,wf0096atyaa3dnn0","sitronix,st7735s";
+                    reg = <0>;
+                    spi-max-frequency = <12000000>;
+                    dc-gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
+                    reset-gpios = <&gpio 23 GPIO_ACTIVE_HIGH>;
+                    backlight = <&backlight>;
+                    power-supply = <&regdsiplay>;
+                    rotation = <270>;
+            };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 6308efa121e1..c00b2b9086f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6728,6 +6728,12 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
 F:	drivers/gpu/drm/tiny/st7735r.c
 
+DRM DRIVER FOR SITRONIX ST7735S PANELS
+M:	Stefan x Nilsson <stefan.x.nilsson@axis.com>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/sitronix,st7735s.yaml
+
 DRM DRIVER FOR SOLOMON SSD130X OLED DISPLAYS
 M:	Javier Martinez Canillas <javierm@redhat.com>
 S:	Maintained

-- 
2.30.2

