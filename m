Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3E578994D
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 23:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507D910E10C;
	Sat, 26 Aug 2023 21:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0EF10E0FC
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 21:54:34 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id
 2adb3069b0e04-4fe61ae020bso3107261e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 14:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693086873; x=1693691673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rRUr43u5mncZKeY5wUuI8fRVQoJKtSh0LykkxK2zpKo=;
 b=w22MzstfL8ZE4Vazt9LPPCkvBqF2dkDrVtsPWL6jUhI1q7iSVaSwIeM0ZVdEEAkHql
 Xc9Grg3lu5MGC0Gkg2GfBckfRY7taN4Ki8mUZh69EWJ6WkHckQxQ3N/YzXmXQash1O+o
 IhOLGx6wxmA0kwQl9Ffwi9AMCfwj2/qgSE/2iO5TEVq9G3UKCcqLzxF9xvoYASjzMn4w
 GLjtZB0azGPRRn07Y0tEer4H7jC/iP8tsgRuD24uswvntUKWdBNrNlhvHkm1Pct4t4JT
 Zjr3zcLzjKyMETN5MmgV20zUWr6BGlPt6WQSUo6ZV/MTWocF0hC3uHCMq/agIJHOrPwy
 J6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693086873; x=1693691673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rRUr43u5mncZKeY5wUuI8fRVQoJKtSh0LykkxK2zpKo=;
 b=kLXrG+oY785PVA//0HHsrwRL/mMpVB1p5kCXnTGO/FKY7+p2olJ+J9LxNxZy9zUtHr
 hH5xWw4+Cw4O/xx30C0nWMIxDdsuiuPIwF+0A7RaL+jPjPzfDrdUD+Nn9CF6MDZwlDoi
 mOCL/F+2nUmJVBUyF2kZTUULyaFhK0KBT/4M44fIAanyueof19GjGY4/kM3yadY3iIcQ
 slZAOlhrpm5GjQbDlfuFnlXekxoXuxedvchqcFOCBiepskRJl1juBdI0khWuMqt1M5On
 LSj7FxAuRhe4+3eKsWFH3R/FzoneUuKpiMX45hj58957hjhFW0kb7izNhbLzVAyYVRnp
 eeyw==
X-Gm-Message-State: AOJu0YzPQCm5yWy/N582PDA7d+qw0M9RGLcbKWeSp6UTdb0UFRPB25wd
 uUV5+d0FDgz0/K4uUCoEhVUlzg==
X-Google-Smtp-Source: AGHT+IFWIX0OrDeQfHGqWQsp599dlIWflBwzPuBwkAVHGM+JpyE141KrvCKv7sg3FEtYpcOxhpsZCQ==
X-Received: by 2002:ac2:5979:0:b0:4ff:75f7:27ff with SMTP id
 h25-20020ac25979000000b004ff75f727ffmr15187121lfp.18.1693086872407; 
 Sat, 26 Aug 2023 14:54:32 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 d17-20020ac244d1000000b0050096cc3ba1sm860280lfm.255.2023.08.26.14.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Aug 2023 14:54:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH 2/2] ARM: dts: imx: add support for the ATM0700D4 panel
 attached to sk-imx53
Date: Sun, 27 Aug 2023 00:54:29 +0300
Message-Id: <20230826215429.1905599-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230826215429.1905599-1-dmitry.baryshkov@linaro.org>
References: <20230826215429.1905599-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SK-ATM0700D4-Plug is an extension board (provided by the same
manufacturer, [1]) which can be connected to the SK-IMX53 panel kit. The
panel can be connected either using the RGB parallel bus or using the
LVDS connector (recommended). Add DT files describing this "shield",
both RGB and LVDS connections.

[1] http://starterkit.ru/html/index.php?name=shop&op=view&id=64

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../nxp/imx/imx53-sk-imx53-atm0700d4-lvds.dts |  97 +++++++++++++++
 .../nxp/imx/imx53-sk-imx53-atm0700d4-rgb.dts  | 112 ++++++++++++++++++
 .../dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi |  45 +++++++
 4 files changed, 256 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4-lvds.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4-rgb.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 3629e343d322..7532ed6468a0 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -47,6 +47,8 @@ dtb-$(CONFIG_SOC_IMX53) += \
 	imx53-qsb.dtb \
 	imx53-qsrb.dtb \
 	imx53-sk-imx53.dtb \
+	imx53-sk-imx53-atm0700d4-lvds.dtb \
+	imx53-sk-imx53-atm0700d4-rgb.dtb \
 	imx53-smd.dtb \
 	imx53-tx53-x03x.dtb \
 	imx53-tx53-x13x.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4-lvds.dts b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4-lvds.dts
new file mode 100644
index 000000000000..b1c1e7c759b3
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4-lvds.dts
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright 2023 Linaro Ltd.
+
+/dts-v1/;
+
+#include <dt-bindings/pwm/pwm.h>
+#include "imx53-sk-imx53-atm0700d4.dtsi"
+
+/ {
+	lvds-decoder {
+		compatible = "ti,sn65lvds94", "lvds-decoder";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lvds_decoder_in: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lvds_decoder_out: endpoint {
+					remote-endpoint = <&panel_rgb_in>;
+				};
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_lvds0: lvds0grp {
+		/* LVDS pins only have pin mux configuration */
+		fsl,pins = <
+			MX53_PAD_LVDS0_CLK_P__LDB_LVDS0_CLK	0x80000000
+			MX53_PAD_LVDS0_TX0_P__LDB_LVDS0_TX0	0x80000000
+			MX53_PAD_LVDS0_TX1_P__LDB_LVDS0_TX1	0x80000000
+			MX53_PAD_LVDS0_TX2_P__LDB_LVDS0_TX2	0x80000000
+			MX53_PAD_LVDS0_TX3_P__LDB_LVDS0_TX3	0x80000000
+		>;
+	};
+
+	pinctrl_spi_gpio: spigrp {
+		fsl,pins = <
+			MX53_PAD_EIM_A22__GPIO2_16		0x1f4
+			MX53_PAD_EIM_A21__GPIO2_17		0x1f4
+			MX53_PAD_EIM_A16__GPIO2_22		0x1f4
+			MX53_PAD_EIM_A18__GPIO2_20		0x1f4
+		>;
+	};
+};
+
+&ldb {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lvds0>;
+	status = "okay";
+
+	lvds0: lvds-channel@0 {
+		reg = <0>;
+		fsl,data-mapping = "spwg";
+		fsl,data-width = <24>;
+		status = "okay";
+
+		port@2 {
+			reg = <2>;
+
+			lvds0_out: endpoint {
+				remote-endpoint = <&lvds_decoder_in>;
+			};
+		};
+	};
+};
+
+&panel_rgb_in {
+	remote-endpoint = <&lvds_decoder_out>;
+};
+
+&spi_ts {
+	pinctrl-0 = <&pinctrl_spi_gpio>;
+	pinctrl-names = "default";
+
+	sck-gpios = <&gpio2 16 GPIO_ACTIVE_HIGH>;
+	miso-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
+	mosi-gpios = <&gpio2 17 GPIO_ACTIVE_HIGH>;
+	cs-gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+};
+
+&touchscreen {
+	interrupts-extended = <&gpio3 22 IRQ_TYPE_EDGE_BOTH>;
+	pendown-gpio = <&gpio3 22 GPIO_ACTIVE_LOW>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4-rgb.dts b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4-rgb.dts
new file mode 100644
index 000000000000..2559ada7e401
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4-rgb.dts
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright 2023 Linaro Ltd.
+
+/dts-v1/;
+
+#include <dt-bindings/pwm/pwm.h>
+#include "imx53-sk-imx53-atm0700d4.dtsi"
+
+/ {
+	display: disp0 {
+		compatible = "fsl,imx-parallel-display";
+		interface-pix-fmt = "rgb24";
+		pinctrl-0 = <&pinctrl_rgb24>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			display0_in: endpoint {
+				remote-endpoint = <&ipu_di0_disp0>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			display_out: endpoint {
+				remote-endpoint = <&panel_rgb_in>;
+			};
+		};
+	};
+
+};
+
+&iomuxc {
+	pinctrl_rgb24: rgb24grp {
+		fsl,pins = <
+			MX53_PAD_DI0_DISP_CLK__IPU_DI0_DISP_CLK		0x5
+			MX53_PAD_DI0_PIN15__IPU_DI0_PIN15		0x5
+			MX53_PAD_DI0_PIN2__IPU_DI0_PIN2			0x5
+			MX53_PAD_DI0_PIN3__IPU_DI0_PIN3			0x5
+			MX53_PAD_DISP0_DAT0__IPU_DISP0_DAT_0		0x5
+			MX53_PAD_DISP0_DAT1__IPU_DISP0_DAT_1		0x5
+			MX53_PAD_DISP0_DAT2__IPU_DISP0_DAT_2		0x5
+			MX53_PAD_DISP0_DAT3__IPU_DISP0_DAT_3		0x5
+			MX53_PAD_DISP0_DAT4__IPU_DISP0_DAT_4		0x5
+			MX53_PAD_DISP0_DAT5__IPU_DISP0_DAT_5		0x5
+			MX53_PAD_DISP0_DAT6__IPU_DISP0_DAT_6		0x5
+			MX53_PAD_DISP0_DAT7__IPU_DISP0_DAT_7		0x5
+			MX53_PAD_DISP0_DAT8__IPU_DISP0_DAT_8		0x5
+			MX53_PAD_DISP0_DAT9__IPU_DISP0_DAT_9		0x5
+			MX53_PAD_DISP0_DAT10__IPU_DISP0_DAT_10		0x5
+			MX53_PAD_DISP0_DAT11__IPU_DISP0_DAT_11		0x5
+			MX53_PAD_DISP0_DAT12__IPU_DISP0_DAT_12		0x5
+			MX53_PAD_DISP0_DAT13__IPU_DISP0_DAT_13		0x5
+			MX53_PAD_DISP0_DAT14__IPU_DISP0_DAT_14		0x5
+			MX53_PAD_DISP0_DAT15__IPU_DISP0_DAT_15		0x5
+			MX53_PAD_DISP0_DAT16__IPU_DISP0_DAT_16		0x5
+			MX53_PAD_DISP0_DAT17__IPU_DISP0_DAT_17		0x5
+			MX53_PAD_DISP0_DAT18__IPU_DISP0_DAT_18		0x5
+			MX53_PAD_DISP0_DAT19__IPU_DISP0_DAT_19		0x5
+			MX53_PAD_DISP0_DAT20__IPU_DISP0_DAT_20		0x5
+			MX53_PAD_DISP0_DAT21__IPU_DISP0_DAT_21		0x5
+			MX53_PAD_DISP0_DAT22__IPU_DISP0_DAT_22		0x5
+			MX53_PAD_DISP0_DAT23__IPU_DISP0_DAT_23		0x5
+		>;
+	};
+
+	pinctrl_spi_gpio: spigrp {
+		fsl,pins = <
+			MX53_PAD_SD1_DATA1__GPIO1_17		0x1f4
+			MX53_PAD_GPIO_7__GPIO1_7		0x1f4
+			MX53_PAD_PATA_DATA3__GPIO2_3		0x1f4
+			MX53_PAD_PATA_DATA8__GPIO2_8		0x1f4
+		>;
+	};
+};
+
+&ipu_di0_disp0 {
+	remote-endpoint = <&display0_in>;
+};
+
+&panel {
+	enable-gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+};
+
+&panel_rgb_in {
+	remote-endpoint = <&display_out>;
+};
+
+&pwm1 {
+	status = "disabled";
+};
+
+&spi_ts {
+	pinctrl-0 = <&pinctrl_spi_gpio>;
+	pinctrl-names = "default";
+
+	sck-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+	mosi-gpios = <&gpio2 3 GPIO_ACTIVE_HIGH>;
+	miso-gpios = <&gpio1 17 GPIO_ACTIVE_HIGH>;
+	cs-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+};
+
+&touchscreen {
+	interrupts-extended = <&gpio2 6 IRQ_TYPE_EDGE_BOTH>;
+	pendown-gpio = <&gpio2 6 GPIO_ACTIVE_LOW>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi
new file mode 100644
index 000000000000..e395004e80e6
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright 2023 Linaro Ltd.
+
+/dts-v1/;
+
+#include <dt-bindings/pwm/pwm.h>
+#include "imx53-sk-imx53.dts"
+
+/ {
+	panel: panel-rgb {
+		compatible = "powertip,ph800480t013-idf02";
+
+		port {
+			panel_rgb_in: endpoint {
+			};
+		};
+	};
+
+	spi_ts: spi {
+		compatible = "spi-gpio";
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		num-chipselects = <1>;
+
+		touchscreen: touchscreen@0 {
+			reg = <0>;
+			compatible = "ti,ads7843";
+			spi-max-frequency = <300000>;
+
+			ti,vref-mv = /bits/ 16 <3300>;
+			ti,x-plate-ohms = /bits/ 16 <450>;
+			ti,y-plate-ohms = /bits/ 16 <250>;
+			ti,debounce-tol = /bits/ 16 <10>;
+			ti,debounce-rep = /bits/ 16 <0>;
+			touchscreen-size-x = <4096>;
+			touchscreen-size-y = <4096>;
+			touchscreen-swapped-x-y;
+			touchscreen-max-pressure = <100>;
+
+			wakeup-source;
+		};
+	};
+};
-- 
2.39.2

