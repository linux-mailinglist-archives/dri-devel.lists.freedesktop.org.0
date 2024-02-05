Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACDD84A17B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 18:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A3910FB37;
	Mon,  5 Feb 2024 17:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cgAndRvh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8728310FAF3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 17:55:45 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-40fdb18ffc7so11254905e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 09:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707155744; x=1707760544; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fpZ1u2+bVNzAT3eWYSmp4vx9viRRZYpXPKY6TeLyQEI=;
 b=cgAndRvhpUdh5eDRNtNlzWgCzGHAUv7utp5/YmqHLyc6xbzOwrXuI0WYDfgexLBhyw
 +k6k/5/wZ30EFTG0ClqnM+O5XlkyTdOb7fYvAwes2H9GtDKnoPIf55Dw39senoltirCe
 g7DTEecq5HA/c9ucD/RcHUvpFOePp9BjwxGg3DFkxO1ZROy8zMEdl+44kuaDT8YkEPYQ
 uRu6JbJmNL4XfVRW5cnIb3bWHm7JEkEZOGV8OwBOrUCyU+2yaiYEUH/0wrypBWqNfnlP
 /FBy2thIsRF+P+xP1CJEws1bB5+ihr7merERDnYnoR/qJ4nZqM4zQZhFVHqX5CnuDzw5
 eYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707155744; x=1707760544;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fpZ1u2+bVNzAT3eWYSmp4vx9viRRZYpXPKY6TeLyQEI=;
 b=jdLODyD/SYIwQ2pt8PR7IgIuLO8Cr/hRPC/ea5i7Wbm39j4ovZs9Id+sNS9qebALMA
 hTNigJE1odIiCAalRTkImIcgFNhnmBVgyge9TVSNES2ElB+kUQLrh6WgcFLVUFzcwzfZ
 Ce4UXxAqOGcnLjjUfMAU6lfCFiaCjoaCtMuoFK3dHpDELje17lbVwynnViy0qlh1lv6J
 7PDV/jX6Gsbfyid0edYE0HTg/vm+TcJCncg5zP2hBEbv3etinX3YKO7IusfiQVjIdu9T
 UTR+aPbUoBCAz16qFNGQZt1iwrtPH2JDkKaQIm2Rw6JKtAKfUrVxzIM7UO36A2ijqsKA
 VWJA==
X-Gm-Message-State: AOJu0Yzyj8rGV65FAZF1N3wEYbYj+IX2AmngARxd6qzWjdgKej4oG3Xn
 8bGINNAX7dxdjZzzhKRBYJlCyQ6oyTkgCE78yFd4jZ9MD3sQdyFiO4clWlJ1EIs=
X-Google-Smtp-Source: AGHT+IGMawpNhtBNlj/DIThK1IdOGLKErx9wrqn011RATd8Gcn5Mb2osk8v0MvYCtAnpElqyEzv96g==
X-Received: by 2002:a05:600c:1e1f:b0:40e:f736:8152 with SMTP id
 ay31-20020a05600c1e1f00b0040ef7368152mr391015wmb.14.1707155743988; 
 Mon, 05 Feb 2024 09:55:43 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUvlgUiiRbjZJ9ZcR725O++iGzXJoEOLZeeIR+LvnKxgwv6M+D0/hzsZmEq/xuRx+59px9XI/fCDICC3BUpD2PZ4/LecLa/3N6bxpyNKjGrvBuyTx/2l9UyYG7HNR3SzCV2GYEWlxTUGXzxpcrnGJEs0P2j0ZRgOISCfWwaJofK88vfoYVgobmurL6zm6SS4zk+GRN75/F8WvD5JGGlpsUWmxQWnYIczm4tYlkcKFZSl8Fn5Xd+EBqurx9S4/803rg8/gsJX/f9CU2dDm96J72jLpiLcDJA82/eZ1b6S3BfpDZ3DVDB3BQ1bkhDka+UdEkrZGybNa211lctY4IkbRh2D2jDYq/x1pceLihA2UmLKfFRa8Uh+YV9FN4JDtJMa8unwmAbPFVzAKNr/IOMZMm3o9Nx2V92sbt0R3Wp4SnVurff4NXHcBoyWyxbPNXgvvVv5p2Rcq64GL1OhLBnlCphub895w0mwktm4srRcbWYyHSMtr/FCKKA9m937ZkO9BgAe9QMqYzgZcYFfPgyeML7XCTNJMeyZnBk9YSHFW6zW4awi+5we8fcpYlOQhO5RyQUORy1Otn6gjpuYqF8wDE7CRI/erhbuFmcNelTSxin41hHORyoYzqbV0z7BSiMMv56XveFDnHY4OODj71L4WBm/rfHO4vCgjMWHVugY/58zAJcDBRuCe/3G6pshyWFNc66aB1Lf1F7JpsqxwqmZ82iCS2oRJWmnCThrhmOlU0/4Rf/Clkya4WA4N5rUR5uGsQ=
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 je16-20020a05600c1f9000b0040ee8765901sm517556wmb.43.2024.02.05.09.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 09:55:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 05 Feb 2024 18:55:33 +0100
Subject: [PATCH v10 6/7] arm64: meson: khadas-vim3l: add TS050 DSI panel
 overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-6-dc06073d5330@linaro.org>
References: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-0-dc06073d5330@linaro.org>
In-Reply-To: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-0-dc06073d5330@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3677;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DPGGuaJdRW3xL473nMSjoqE2TG+EWGQ6YkhOzqtm1Do=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlwSEWDKhUeQ70VFCVlU06YKjKhY3IDBxtFeyvbTgh
 uLcwGWmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZcEhFgAKCRB33NvayMhJ0dgoD/
 9ygCnRpWwsl+EqlWTo6p9gyHPg4glwK5RKRWhekTcgM8QejnAqphIh0gKKbZa7zj3aUEjtniNSLIZN
 ajOyAxeoSb+tmVIn1Av81VY2tvI7Vip2piimUtgXvRbgEA2rtEXyJpZNjznlP9KdUoLMPnXw8j8BLw
 UQx3ofKhBONPDcFp3sajaexIbvBUJ3lETFxYSPGnoDCR7OlCjL7D9NA20lzz+FUggespijK8tr86ar
 Ytvd6Nlr/kgzjhtNUeg3/yXsZqGf1RCWtkCCaF2s1974VbqVxZH6AXsI3uPV6raNIi0/ICf1vUKBuL
 rS/Bh2dsF84IborkjYFcsRoy7bvg6b+whQ7zRplT117Mdetw1MHaHLAa1vb0sKvOaZx1zLfb8S6wox
 E/wrhKw9HsLu8X+rhfmAcidrTr1gypATJix6J+Y6cR8rTpM2/+dVfGfblm3cNxNzdYP3RHo2EDsudS
 qAZr4nfhPHcaisSt51i0SlCkc0yWusS2OEvn3eY19f6ry4TI2Sv1joeyiz0nBP5qExCe1/yxu/oYUB
 8zF3DVLjbSm67nKvpTlIUWr684dMAM0EhN642RqItpGIbPdaIf56fDQdJqrUUdik6QEy5ABZNUV1nn
 5rDtK6pMiWaTT4hZwr9dkDWHhlbhaK5u83gY4xyUWZM4hcsL0KPlkZKR1Ecw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

This add dtbo overlay to support the Khadas TS050 panel on the
Khadas VIM3 & VIM3L boards.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/Makefile               |   3 +
 .../boot/dts/amlogic/meson-khadas-vim3-ts050.dtso  | 108 +++++++++++++++++++++
 2 files changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index cc8b34bd583d..5e5ea0f14fe2 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -80,3 +80,6 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air-gbit.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
+
+# Overlays
+dtb-$(CONFIG_ARCH_MESON) += meson-khadas-vim3-ts050.dtbo
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-ts050.dtso b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-ts050.dtso
new file mode 100644
index 000000000000..a41b4e619580
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-ts050.dtso
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/g12a-clkc.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/amlogic,meson-g12a-gpio-intc.h>
+
+/dts-v1/;
+/plugin/;
+
+/*
+ * Enable Khadas TS050 DSI Panel + Touch Controller
+ * on Khadas VIM3 (A311D) and VIM3L (S905D3)
+ */
+
+&{/} {
+	panel_backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm_AO_cd 0 25000 0>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <200>;
+	};
+};
+
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	touch-controller@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <IRQID_GPIOA_5 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio_expander 6 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <1920>;
+		status = "okay";
+	};
+};
+
+&mipi_dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	assigned-clocks = <&clkc CLKID_GP0_PLL>,
+			  <&clkc CLKID_MIPI_DSI_PXCLK_SEL>,
+			  <&clkc CLKID_MIPI_DSI_PXCLK>,
+			  <&clkc CLKID_CTS_ENCL_SEL>,
+			  <&clkc CLKID_VCLK2_SEL>;
+	assigned-clock-parents = <0>,
+				 <&clkc CLKID_GP0_PLL>,
+				 <0>,
+				 <&clkc CLKID_VCLK2_DIV1>,
+				 <&clkc CLKID_GP0_PLL>;
+	assigned-clock-rates = <960000000>,
+			       <0>,
+			       <960000000>,
+			       <0>,
+			       <0>;
+
+	panel@0 {
+		compatible = "khadas,ts050";
+		reset-gpios = <&gpio_expander 0 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&gpio_expander 1 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vcc_3v3>;
+		backlight = <&panel_backlight>;
+		reg = <0>;
+
+		port {
+			mipi_in_panel: endpoint {
+				remote-endpoint = <&mipi_out_panel>;
+			};
+		};
+	};
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			mipi_out_panel: endpoint {
+				remote-endpoint = <&mipi_in_panel>;
+			};
+		};
+	};
+};
+
+&mipi_analog_dphy {
+	status = "okay";
+};
+
+&mipi_dphy {
+	status = "okay";
+};
+
+&pwm_AO_cd {
+	pinctrl-0 = <&pwm_ao_c_6_pins>, <&pwm_ao_d_e_pins>;
+};

-- 
2.34.1

