Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9F587AF95
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 19:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B714310E93B;
	Wed, 13 Mar 2024 18:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W7AvSEqs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3BA10E93B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 18:29:01 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-33e9990da78so88046f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 11:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710354540; x=1710959340; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cumHnSAU0uyTVlzJRc7lws76GfX96Vv3WFCUpPGbENc=;
 b=W7AvSEqs5w09BMhbNBSbGZ0lEeVWjG/ZV+dhZqRA2KQedH80HS37QFGsC7h04qootC
 1V8Y0wkGt3Jm88AUwSy9PN6ERLriWAV+hnRBJ/EnZ8r6pLhEyW9e1f5D6Wps0QZOC5/V
 mUua/haBS8gN0Hgt1cgshpCtzKoQkfIH6pUnsEbspx6t8hUzI2xDXf6XZgi+XOdyv43X
 Y6zinFwG6nyADYJfkXTCnrGe4Zy+yfLmUkOqINS3Gc+ooq7Fc40IRMYFE1Tz6sSBg3VS
 sYdHbGlVD8YOpZjEqIZx5yv3o5EvOylIeJ3ChI1fcFWvclPg6CghHvYtbVT1RwPTRNQl
 S9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710354540; x=1710959340;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cumHnSAU0uyTVlzJRc7lws76GfX96Vv3WFCUpPGbENc=;
 b=hPmKqd74NlXFnFO8FtVzM9QJ+bbwOUGIgQsMUpgyFRf8cQN4kxDGZ7OZWHOT1Mzkw5
 W7MiQ/Uih2DYyjT1hZrArdNAWGHsb9EZnT/GnUMbatLE3uyhdBs2T6wwPyCyKPg+oesy
 YnwEjXT+GuI9R2yq5Kt+bWWidLBfFxrfo0clpWh9xaxn3eHFv5wZQLAKBkXdHfKS6BDO
 q3BJYOanMGPEy5v5TsauK4p/Yzp40hQbgX7Nkw+HTbE0jcBIT8A1ITUIedQmiPDjL39g
 wEzZEgzmUNFpXLcHGN89th5bLdCW9l86uEJZNi3ZG8dJQWrgtOYw4hE4DHdn0SjgZ5qy
 ho8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwxB0/Sc+URcZUlRlQhUk6foqpCHNOhou2OsFaOfU91S81EmreddByeAy6oHc3Ovp7m5MEv0KfFGdxc7XF2sQkO6z20vdCixrA/zOeDOJh
X-Gm-Message-State: AOJu0YygyerFF8CoD1BvZCrOl9HN7aQstQEBnBEip9O+eamfteSNBPS7
 SmQ6KrAA5JqCMecPzglYpTKMtJnCYODACfJ7iX0Lfaciy6IKFYnmNJD/k7BEHvgYAWTjbw3demp
 T
X-Google-Smtp-Source: AGHT+IGaE5/7m97Nm1cHOLOaHT9aDnr7ULEzW5g83EPcGdB1e1IkqWmmmUrcRYQgLIheC701iDYxBA==
X-Received: by 2002:a5d:6a52:0:b0:33e:7942:4139 with SMTP id
 t18-20020a5d6a52000000b0033e79424139mr2723567wrw.61.1710354540100; 
 Wed, 13 Mar 2024 11:29:00 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.97]) by smtp.gmail.com with ESMTPSA id
 z4-20020adff744000000b0033e7910ae23sm12218118wrp.49.2024.03.13.11.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 11:28:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: display: samsung,
 exynos5-dp: convert to DT Schema
Date: Wed, 13 Mar 2024 19:28:55 +0100
Message-Id: <20240313182855.14140-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Convert Samsung Exynos5250/5420 SoC Display Port Controller bindings to
DT schema with a change: add power-domains, already used in DTS.

This Display Port controller is actually variant of Analogix Display
Port bridge, however new DT Schema does not reference analogix,dp.yaml,
because of incompatibilities in the driver.  The analogix,dp.yaml
expects two ports, input and output, but Linux Exynos DP DRM driver and
DTS use only one port: output.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Document deprecated samsung,hpd-gpios
---
 .../bindings/display/exynos/exynos_dp.txt     | 112 ------------
 .../display/samsung/samsung,exynos5-dp.yaml   | 163 ++++++++++++++++++
 2 files changed, 163 insertions(+), 112 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
 create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos5-dp.yaml

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
deleted file mode 100644
index 3a401590320f..000000000000
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
+++ /dev/null
@@ -1,112 +0,0 @@
-The Exynos display port interface should be configured based on
-the type of panel connected to it.
-
-We use two nodes:
-	-dp-controller node
-	-dptx-phy node(defined inside dp-controller node)
-
-For the DP-PHY initialization, we use the dptx-phy node.
-Required properties for dptx-phy: deprecated, use phys and phy-names
-	-reg: deprecated
-		Base address of DP PHY register.
-	-samsung,enable-mask: deprecated
-		The bit-mask used to enable/disable DP PHY.
-
-For the Panel initialization, we read data from dp-controller node.
-Required properties for dp-controller:
-	-compatible:
-		should be "samsung,exynos5-dp".
-	-reg:
-		physical base address of the controller and length
-		of memory mapped region.
-	-interrupts:
-		interrupt combiner values.
-	-clocks:
-		from common clock binding: handle to dp clock.
-	-clock-names:
-		from common clock binding: Shall be "dp".
-	-phys:
-		from general PHY binding: the phandle for the PHY device.
-	-phy-names:
-		from general PHY binding: Should be "dp".
-
-Optional properties for dp-controller:
-	-interlaced:
-		interlace scan mode.
-			Progressive if defined, Interlaced if not defined
-	-vsync-active-high:
-		VSYNC polarity configuration.
-			High if defined, Low if not defined
-	-hsync-active-high:
-		HSYNC polarity configuration.
-			High if defined, Low if not defined
-	-samsung,hpd-gpio:
-		Hotplug detect GPIO.
-			Indicates which GPIO should be used for hotplug
-			detection
-	-video interfaces: Device node can contain video interface port
-			nodes according to [1].
-	- display-timings: timings for the connected panel as described by
-		Documentation/devicetree/bindings/display/panel/display-timing.txt
-
-For the below properties, please refer to Analogix DP binding document:
- * Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
-	-phys (required)
-	-phy-names (required)
-	-hpd-gpios (optional)
-	 force-hpd (optional)
-
-Deprecated properties for DisplayPort:
--interlaced:            deprecated prop that can parsed from drm_display_mode.
--vsync-active-high:     deprecated prop that can parsed from drm_display_mode.
--hsync-active-high:     deprecated prop that can parsed from drm_display_mode.
--samsung,ycbcr-coeff:   deprecated prop that can parsed from drm_display_mode.
--samsung,dynamic-range: deprecated prop that can parsed from drm_display_mode.
--samsung,color-space:   deprecated prop that can parsed from drm_display_info.
--samsung,color-depth:   deprecated prop that can parsed from drm_display_info.
--samsung,link-rate:     deprecated prop that can reading from monitor by dpcd method.
--samsung,lane-count:    deprecated prop that can reading from monitor by dpcd method.
--samsung,hpd-gpio:      deprecated name for hpd-gpios.
-
--------------------------------------------------------------------------------
-
-Example:
-
-SOC specific portion:
-	dp-controller {
-		compatible = "samsung,exynos5-dp";
-		reg = <0x145b0000 0x10000>;
-		interrupts = <10 3>;
-		interrupt-parent = <&combiner>;
-		clocks = <&clock 342>;
-		clock-names = "dp";
-
-		phys = <&dp_phy>;
-		phy-names = "dp";
-	};
-
-Board Specific portion:
-	dp-controller {
-		display-timings {
-			native-mode = <&lcd_timing>;
-			lcd_timing: 1366x768 {
-				clock-frequency = <70589280>;
-				hactive = <1366>;
-				vactive = <768>;
-				hfront-porch = <40>;
-				hback-porch = <40>;
-				hsync-len = <32>;
-				vback-porch = <10>;
-				vfront-porch = <12>;
-				vsync-len = <6>;
-			};
-		};
-
-		ports {
-			port@0 {
-				dp_out: endpoint {
-					remote-endpoint = <&bridge_in>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos5-dp.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos5-dp.yaml
new file mode 100644
index 000000000000..dda9097a7911
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos5-dp.yaml
@@ -0,0 +1,163 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/samsung/samsung,exynos5-dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos5250/Exynos5420 SoC Display Port
+
+maintainers:
+  - Inki Dae <inki.dae@samsung.com>
+  - Seung-Woo Kim <sw0312.kim@samsung.com>
+  - Kyungmin Park <kyungmin.park@samsung.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+properties:
+  compatible:
+    const: samsung,exynos5-dp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: dp
+
+  display-timings:
+    $ref: /schemas/display/panel/display-timings.yaml#
+
+  interrupts:
+    maxItems: 1
+
+  hpd-gpios:
+    description:
+      Hotplug detect GPIO.
+      Indicates which GPIO should be used for hotplug detection
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: dp
+
+  power-domains:
+    maxItems: 1
+
+  interlaced:
+    type: boolean
+    deprecated: true
+    description:
+      Interlace scan mode. Progressive if defined, interlaced if not defined.
+
+  vsync-active-high:
+    type: boolean
+    deprecated: true
+    description:
+      VSYNC polarity configuration. High if defined, low if not defined
+
+  hsync-active-high:
+    type: boolean
+    deprecated: true
+    description:
+      HSYNC polarity configuration. High if defined, low if not defined
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Port node with one endpoint connected to a dp-connector node.
+
+    required:
+      - port
+
+  samsung,hpd-gpios:
+    maxItems: 1
+    deprecated: true
+
+  samsung,ycbcr-coeff:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
+    description:
+      Deprecated prop that can parsed from drm_display_mode.
+
+  samsung,dynamic-range:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
+    description:
+      Deprecated prop that can parsed from drm_display_mode.
+
+  samsung,color-space:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
+    description:
+      Deprecated prop that can parsed from drm_display_info.
+
+  samsung,color-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
+    description:
+      Deprecated prop that can parsed from drm_display_info.
+
+  samsung,link-rate:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
+    description:
+      Deprecated prop that can reading from monitor by dpcd method.
+
+  samsung,lane-count:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
+    description:
+      Deprecated prop that can reading from monitor by dpcd method.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - phys
+  - phy-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos5250.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dp-controller@145b0000 {
+        compatible = "samsung,exynos5-dp";
+        reg = <0x145b0000 0x1000>;
+        clocks = <&clock CLK_DP>;
+        clock-names = "dp";
+        interrupts = <10 3>;
+        interrupt-parent = <&combiner>;
+        phys = <&dp_phy>;
+        phy-names = "dp";
+        pinctrl-0 = <&dp_hpd>;
+        pinctrl-names = "default";
+        power-domains = <&pd_disp1>;
+
+        samsung,color-space = <0>;
+        samsung,color-depth = <1>;
+        samsung,link-rate = <0x0a>;
+        samsung,lane-count = <2>;
+        hpd-gpios = <&gpx0 7 GPIO_ACTIVE_HIGH>;
+
+        ports {
+            port {
+                dp_out: endpoint {
+                    remote-endpoint = <&bridge_in>;
+                };
+            };
+        };
+    };
-- 
2.34.1

