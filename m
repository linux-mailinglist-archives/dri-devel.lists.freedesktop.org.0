Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C68BD39CF2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 04:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8168910E337;
	Mon, 19 Jan 2026 03:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="inboU/3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDA210E337
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 03:30:52 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-8c6ac42b91eso260705085a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 19:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768793451; x=1769398251; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J+m79ms1+ZU6BketBY4ns1XwOXkI6LYaomtsCg3P4i8=;
 b=inboU/3f6o/PCMsxgNe9VXKfadoosH6EO11ce1XjnOkh8K45lnEd4cz1Ih7NY+1zQz
 9Uk4PtpyYnsmvCf9QpSPxd4VFd/2G5YMHRQTTNItmDiDZTWAAqHLjj637t9eMZy+rUXB
 QB+fy9DgdxGYXpLm60haFmgzQt70gVPYj+N9cTyCLvRB0OK/N8HPDJvNz7+oSc+0wYwM
 5Ce9Rh0SiHHfPkxz9dR9vEjZPxRB24RPPjtPmuGFvjzizuPQg9svlhn1q+3BESfBPPqV
 HdZVUBRF6c+paHVLFsyh0qNXg78IM3qRP5nnSQCEMzEHR7quJQwkrc1PjNOIkoSgrWyl
 00dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768793451; x=1769398251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J+m79ms1+ZU6BketBY4ns1XwOXkI6LYaomtsCg3P4i8=;
 b=hpSHoQhQGhICe6Vqkhf6gTASvFL2b7bUDbwfszOzwZn7D2Fx1XiRAqWc/AoISfDDc3
 a53kEzaIqkWUtw64ImUJgKtmAXZf5MsjAARsW5skm6XwlKyeH+bhTM2i+MXrtFY5vVE8
 NHSLUBpP+pD+F0/Cj0Ixda8UlwQ9BrdSUEL3HNrrVIsXKwNM7iWFVtr5Azvn/v7Ab5uN
 elJ8X4ohS6iwAxOaXspbzHCWXnKCEmt/qTSJcgDIAfuPw8e7B9gPQzn8LJdObhzMu+ac
 yNwGcFnBhsiBDCWhrqOE9ViDLpuWdZl/vD+h+ArfI1h+sKdb9mDF3T4taaGFvKpebsG8
 RNnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6fzzLL5yN3/PZpX+Q9MWZsSGfKvxPboxOGetPL0FcUIDq6d7E/B1aIUKVsTk7huv1zbu1svoq/oo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxNdumfd+wzmCSK3XkN6xEfAN7ZLa3yb546gHrxkPHMzfWa9In
 Kj5HHX36J4ALZfiXksskk0TCRbHpufwqDup6kztpScnpXaisG85sQlw+
X-Gm-Gg: AY/fxX4ytSCwKw0C2KikOm+cvL9GuJuFghlvestvFc+XS13bcfN6rFhGWBX4GgieKXO
 9WSFIhD/FISZ4bDku4zF0FTc1j/kGm6jsplq/pJj3TMYY1iwmmE50bvFQ95IPVuLzE+wNWNwr2/
 Lv22AWDGpPU+/kNe5f3BkPKuwtZDjUzd9pWvXbrvBtAhebUkZUwu6UgYhGZsdg3LsTtdLqW6FXD
 m/Jw+ZrU6Qffkk8mti7tKJHQ/Ra8EfyWIJRfR2oRKln3Eau5o/F99AsLLYs9nKYUQbRrBdQQJlP
 /V6DIjYBtd3gWjx2s8niq4fCr06KKdG3Wgw6/VDKe+7jNO/3R/dmTrRMeQFbNav5MSSH3F6fqMm
 ALeB0oLciDIGjbQnFc/vtZtxmmA0iYIRbCE//1JIKnyDut0swxhLAczU67AGHPlZ51cSioceKs1
 FgkGKUecqXN2rZ0xHmS/2lCkVuXBJoVln58nUFlOub4hTGSMFC9GblDra7n3/3MEBNJSbaYycFF
 7CgjA==
X-Received: by 2002:a05:620a:459f:b0:8b2:ddeb:99c with SMTP id
 af79cd13be357-8c6a6780578mr1430702385a.63.1768793450921; 
 Sun, 18 Jan 2026 19:30:50 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 19:30:50 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com,
 rogerq@kernel.org, tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_jesszhan@quicinc.com, bavishimithil@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, thierry.reding@gmail.com
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH v4 06/10] ARM: dts: ti: omap: espresso-common: Add common
 device tree for Samsung Galaxy Tab 2 series
Date: Sun, 18 Jan 2026 22:30:31 -0500
Message-ID: <20260119033035.57538-8-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119033035.57538-1-bavishimithil@gmail.com>
References: <20260119033035.57538-1-bavishimithil@gmail.com>
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

Create common device tree for Samsung Espresso series devices

Let's create a common tree for all the variants first. Later we can
device specific trees based on their screen sizes.

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 .../omap/omap4-samsung-espresso-common.dtsi   | 762 ++++++++++++++++++
 1 file changed, 762 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi

diff --git a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
new file mode 100644
index 000000000..381638b9f
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
@@ -0,0 +1,762 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+#include "dt-bindings/gpio/gpio.h"
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/input/input.h>
+#include "omap443x.dtsi"
+
+/ {
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>; /* 1 GB */
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		continuous_splash: framebuffer@bef00000{
+			reg = <0xbef00000 (1024 * 600 * 4)>;
+			no-map;
+		};
+	};
+
+	chosen {
+		stdout-path = &uart3;
+		#address-cells = <1>;
+	};
+
+	i2c-gpio5 {
+		compatible = "i2c-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c5_pins>;
+		sda-gpios = <&gpio4 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpio4 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <10>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* TODO: SMB136 Charger for 7" variant at 0x4d */
+	};
+
+	i2c-gpio6 {
+		compatible = "i2c-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c6_pins>;
+		sda-gpios = <&gpio3 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpio3 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <10>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* TODO: STMPE811 ADC at 0x41 */
+	};
+
+	i2c-gpio7 {
+		compatible = "i2c-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c7_pins>;
+		sda-gpios = <&gpio2 30 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <3>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		fuel-gauge@36 {
+			compatible = "maxim,max17042";
+			reg = <0x36>;
+			pinctrl-0 = <&fuel_alert_irq>;
+			pinctrl-names = "default";
+			interrupt-parent = <&gpio2>;
+			interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+			maxim,rsns-microohm = <10000>;
+			maxim,over-heat-temp = <500>;
+			maxim,dead-volt = <2500>;
+			maxim,over-volt = <4300>;
+		};
+	};
+
+	reg_espresso_wlan: regulator-espresso-wlan {
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlanen_gpio>;
+		compatible = "regulator-fixed";
+		regulator-name = "espresso_wlan";
+		regulator-max-microvolt = <2000000>;
+		regulator-min-microvolt = <2000000>;
+		gpio = <&gpio4 8 GPIO_ACTIVE_HIGH>; /* GPIO_104 */
+		startup-delay-us = <70000>;
+		regulator-always-on;
+		enable-active-high;
+	};
+
+	wlan_pwrseq: wlan-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&twl 0>;
+		clock-names = "ext_clock";
+	};
+
+	reg_espresso_internal: regulator-espresso-internal {
+		compatible = "regulator-fixed";
+		regulator-name = "eMMC_LDO";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>; /* GPIO_63 */
+		startup-delay-us = <100000>;
+		regulator-boot-on;
+		regulator-always-on;
+		enable-active-high;
+	};
+
+	reg_espresso_external: regulator-espresso-external {
+		compatible = "regulator-fixed";
+		regulator-name = "vmmc1";
+		regulator-max-microvolt = <2800000>;
+		regulator-min-microvolt = <2800000>;
+		gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>; /* GPIO_34 */
+		enable-active-high;
+	};
+
+	reg_touch_ldo_en: regulator-touch-ldo-en  {
+		compatible = "regulator-fixed";
+		regulator-name = "touch_ldo_en";
+		regulator-max-microvolt = <2800000>;
+		regulator-min-microvolt = <2800000>;
+		gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>; /* GPIO_54 */
+		regulator-always-on;
+		enable-active-high;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys>;
+
+		key-power {
+			label = "power";
+
+			gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>; /* GPIO_wk3 */
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-volup {
+			linux,code = <KEY_VOLUMEUP>;
+			label = "volume_up"; /* GPIO_wk30 */
+			gpios = <&gpio1 30 GPIO_ACTIVE_LOW>;
+		};
+
+		button-voldown {
+			linux,code = <KEY_VOLUMEDOWN>;
+			label = "volume_down"; /* GPIO_wk8 */
+			gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	reg_lcd: regulator-lcd	{
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_en";
+		gpios = <&gpio5 7 GPIO_ACTIVE_HIGH>; /* GPIO_135 */
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
+	pwm10: pwm-10 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm10_default>;
+		compatible = "ti,omap-dmtimer-pwm";
+		#pwm-cells = <3>;
+		ti,timers = <&timer10>;
+		ti,clock-source = <0x00>;
+	};
+
+	lvds-encoder {
+		compatible = "doestek,dtc34lm85am", "lvds-encoder";
+		powerdown-gpios = <&gpio5 8 GPIO_ACTIVE_LOW>; /* GPIO_136 */
+		power-supply = <&reg_lcd>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				bridge_in: endpoint {
+					remote-endpoint = <&dpi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				bridge_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+	};
+
+	vibrator {
+		compatible = "gpio-vibrator";
+		enable-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>; /* GPIO_38 */
+		pinctrl-names = "default";
+		pinctrl-0 = <&vibrator_default>;
+	};
+
+	gp2a_shunt: current-sense-shunt {
+		compatible = "current-sense-shunt";
+		io-channels = <&gpadc 4>;
+		shunt-resistor-micro-ohms = <24000000>; /* 24 ohms */
+		#io-channel-cells = <0>;
+	};
+
+	led-ir {
+		compatible = "gpio-ir-tx";
+		gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>; /* GPIO_59 */
+		pinctrl-names = "default";
+		pinctrl-0 = <&ledir_pins>;
+	};
+};
+
+&omap4_pmx_wkup {
+	gpio_keys: gpio-keys-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x046, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
+			/* sim_cd.gpio_wk3 - EXT_WAKEUP */
+			OMAP4_IOPAD(0x056, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
+			/* fref_clk3_req.gpio_wk30 - VOL_UP */
+			OMAP4_IOPAD(0x05C, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
+			/* fref_clk4_out.gpio_wk8 - VOL_DN */
+		>;
+	};
+
+	prox_irq: prox-irq-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x042, WAKEUP_EN | PIN_INPUT_PULLUP | MUX_MODE3)
+			/* sim_clk.gpio_wk1 - PS_VOUT */
+		>;
+	};
+};
+
+&omap4_pmx_core {
+	backlight_pins: pinmux-backlight-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0X0D8, PIN_OUTPUT | PIN_OFF_OUTPUT_LOW | MUX_MODE3)
+			/* usbb1_ulpitll_dat7.gpio_95 - LED_BACKLIGHT_RESET */
+		>;
+	};
+
+	bluetooth_pins: pinmux-bluetooth-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x094, PIN_OUTPUT | MUX_MODE3)
+			/* gpmc_ncs6.gpio_103 - BT_EN */
+			OMAP4_IOPAD(0x0be, PIN_OUTPUT | MUX_MODE3)
+			/* cam_strobe.gpio_82 - BT_nRST */
+			OMAP4_IOPAD(0x0c0, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
+			/* cam_globalreset.gpio_83 - BT_HOST_WAKE */
+			OMAP4_IOPAD(0x0d4, PIN_OUTPUT | MUX_MODE3)
+			/* usbb1_ulpitll_dat5.gpio_93 - BT_WAKE */
+		>;
+	};
+
+	dss_dpi_pins: pinmux-dss-dpi-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x162, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data23 */
+			OMAP4_IOPAD(0x164, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data22 */
+			OMAP4_IOPAD(0x166, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data21 */
+			OMAP4_IOPAD(0x168, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data20 */
+			OMAP4_IOPAD(0x16a, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data19 */
+			OMAP4_IOPAD(0x16c, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data18 */
+			OMAP4_IOPAD(0x16e, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data15 */
+			OMAP4_IOPAD(0x170, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data14 */
+			OMAP4_IOPAD(0x172, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data13 */
+			OMAP4_IOPAD(0x174, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data12 */
+			OMAP4_IOPAD(0x176, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data11 */
+			OMAP4_IOPAD(0x1b4, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data10 */
+			OMAP4_IOPAD(0x1b6, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data9 */
+			OMAP4_IOPAD(0x1b8, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data16 */
+			OMAP4_IOPAD(0x1ba, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data17 */
+			OMAP4_IOPAD(0x1bc, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_hsync */
+			OMAP4_IOPAD(0x1be, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_pclk */
+			OMAP4_IOPAD(0x1c0, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_vsync */
+			OMAP4_IOPAD(0x1c2, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_de */
+			OMAP4_IOPAD(0x1c4, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data8 */
+			OMAP4_IOPAD(0x1c6, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data7 */
+			OMAP4_IOPAD(0x1c8, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data6 */
+			OMAP4_IOPAD(0x1ca, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data5 */
+			OMAP4_IOPAD(0x1cc, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data4 */
+			OMAP4_IOPAD(0x1ce, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data3 */
+
+			OMAP4_IOPAD(0x1d0, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data2 */
+			OMAP4_IOPAD(0x1d2, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data1 */
+			OMAP4_IOPAD(0x1d4, PIN_OFF_OUTPUT_LOW | MUX_MODE5)
+			/* dispc2_data0 */
+		>;
+	};
+
+	fuel_alert_irq: pinmux-fuel-alert-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x068, WAKEUP_EN | PIN_INPUT_PULLUP | MUX_MODE3)
+			/* gpmc_a20.gpio_44 */
+		>;
+	};
+
+	gp2a_irq: pinmux-gp2a-irq-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x052, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
+			/* gpmc_ad9.gpio_33 - ALS_INT_18 */
+		>;
+	};
+
+	i2c1_pins: pinmux-i2c1-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x122, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* i2c1_scl */
+			OMAP4_IOPAD(0x124, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* i2c1_sda */
+		>;
+	};
+
+	i2c2_pins: pinmux-i2c2-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x126, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* i2c2_scl */
+			OMAP4_IOPAD(0x128, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* i2c2_sda */
+		>;
+	};
+
+	i2c3_pins: pinmux-i2c3-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x12a, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* i2c3_scl */
+			OMAP4_IOPAD(0x12c, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* i2c3_sda */
+		>;
+	};
+
+	i2c4_pins: pinmux-i2c4-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x12e, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* i2c4_scl */
+			OMAP4_IOPAD(0x130, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* i2c4_sda */
+		>;
+	};
+
+	i2c5_pins: pinmux-i2c5-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x0de, PIN_INPUT_PULLUP | MUX_MODE3)
+			/* usbc1_icusb_dp.gpio_98 */
+			OMAP4_IOPAD(0x0e0, PIN_INPUT_PULLUP | MUX_MODE3)
+			/* usbc1_icusb_dm.gpio_99 */
+		>;
+	};
+
+	i2c6_pins: pinmux-i2c6-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x09c, PIN_INPUT_PULLUP | MUX_MODE3)
+			/* hdmi_ddc_scl.gpio_65 */
+			OMAP4_IOPAD(0x09e, PIN_INPUT_PULLUP | MUX_MODE3)
+			/* hdmi_ddc_sda.gpio_66 */
+		>;
+	};
+
+	i2c7_pins: pinmux-i2c7-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x08a, PIN_INPUT_PULLUP | MUX_MODE3)
+			/* gpmc_wait0.gpio_61 */
+			OMAP4_IOPAD(0x08c, PIN_INPUT_PULLUP | MUX_MODE3)
+			/* gpmc_wait1.gpio_62 */
+		>;
+	};
+
+	ledir_pins: pimux-ledir-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x086, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			/* gpmc_nbe0_cle.gpio_59 */
+			OMAP4_IOPAD(0x156, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			/* mcspi4_simo.gpio_152 */
+		>;
+	};
+
+	lvds_pins: pinmux-lvds-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0X136, PIN_OUTPUT | MUX_MODE3)
+			/* mcspi1_simo.gpio_136 - LVDS_nSHDN */
+		>;
+	};
+
+	mmc1_pins: pinmux-mmc1-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x0e2, PIN_INPUT_PULLDOWN | MUX_MODE0)
+			/* sdmmc1_clk */
+			OMAP4_IOPAD(0x0e4, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* sdmcc1_cmd */
+			OMAP4_IOPAD(0x0e6, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* sdmcc1_dat0 */
+			OMAP4_IOPAD(0x0e8, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* sdmmc1_dat1 */
+			OMAP4_IOPAD(0x0ea, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* sdmmc1_dat2 */
+			OMAP4_IOPAD(0x0ec, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* sdmmc1_dat3 */
+		>;
+	};
+
+	mmc2_pins: pinmux-mmc2-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x040, PIN_INPUT_PULLUP | MUX_MODE1)
+			/* sdmmc2_dat0 */
+			OMAP4_IOPAD(0x042, PIN_INPUT_PULLUP | MUX_MODE1)
+			/* sdmmc2_dat1 */
+			OMAP4_IOPAD(0x044, PIN_INPUT_PULLUP | MUX_MODE1)
+			/* sdmmc2_dat2 */
+			OMAP4_IOPAD(0x046, PIN_INPUT_PULLUP | MUX_MODE1)
+			/* sdmmc2_dat3 */
+			OMAP4_IOPAD(0x048, PIN_INPUT_PULLUP | MUX_MODE1)
+			/* sdmmc2_dat4 */
+			OMAP4_IOPAD(0x04a, PIN_INPUT_PULLUP | MUX_MODE1)
+			/* sdmmc2_dat5 */
+			OMAP4_IOPAD(0x04c, PIN_INPUT_PULLUP | MUX_MODE1)
+			/* sdmmc2_dat6 */
+			OMAP4_IOPAD(0x04e, PIN_INPUT_PULLUP | MUX_MODE1)
+			/* sdmmc2_dat7 */
+			OMAP4_IOPAD(0x082, PIN_INPUT_PULLUP | MUX_MODE1)
+			/* sdmmc2_clk */
+			OMAP4_IOPAD(0x084, PIN_INPUT_PULLUP | MUX_MODE1)
+			/* sdmmc2_cmd */
+		>;
+	};
+
+	mmc5_pins: pinmux-mmc5-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x148, PIN_INPUT_PULLDOWN | MUX_MODE0)
+			/* sdmmc5_clk.sdmmc5_clk */
+			OMAP4_IOPAD(0x14a, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* sdmmc5_cmd.sdmmc5_cmd */
+			OMAP4_IOPAD(0x14c, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* sdmmc5_dat0.sdmmc5_dat0 */
+			OMAP4_IOPAD(0x14e, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* sdmmc5_dat1.sdmmc5_dat1 */
+			OMAP4_IOPAD(0x150, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* sdmmc5_dat2.sdmmc5_dat2 */
+			OMAP4_IOPAD(0x152, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* sdmmc5_dat3.sdmmc5_dat3 */
+		>;
+	};
+
+	pwm10_default: pinmux-pwm10-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0X0D6, PIN_OUTPUT | PIN_OFF_OUTPUT_LOW | MUX_MODE1)
+			/* usbb1_ulpitll_dat6.dmtimer10_pwm_evt - LED_BACKLIGHT_PWM */
+		>;
+	};
+
+	touch_pins: pinmux-touch-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x06c, PIN_INPUT | MUX_MODE3)
+			/* gpmc_a22.gpio_46 - TSP_INT */
+		>;
+	};
+
+	uart2_pins: pinmux-uart2-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x118, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* uart2_cts.uart2_cts */
+			OMAP4_IOPAD(0x11a, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* uart2_rts.uart2_rts */
+			OMAP4_IOPAD(0x11c, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* uart2_rx.uart2_rx */
+			OMAP4_IOPAD(0x11e, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* uart2_tx.uart2_tx */
+		>;
+	};
+
+	uart3_pins: pinmux-uart3-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x144, PIN_INPUT | MUX_MODE0)
+			/* uart3_rx_irrx */
+			OMAP4_IOPAD(0x146, PIN_OUTPUT | MUX_MODE0)
+			/* uart3_tx_irtx */
+		>;
+	};
+
+	vibrator_default: pinmux-vibrator-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x05c, PIN_INPUT_PULLDOWN | MUX_MODE3)
+			/* gpmc_ad14.gpio_38 - MOTOR_EN */
+		>;
+	};
+
+	wlanen_gpio: pinmux-wlanen-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x096, PIN_OUTPUT | MUX_MODE3)
+			/* gpmc_ncs7.gpio_104 */
+		>;
+	};
+
+	wlan_host_wake: pinmux-wlan-host-wake-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x0bc, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
+			/* cam_shutter.gpio_81 - WLAN_HOST_WAKE */
+		>;
+	};
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+
+	interrupts-extended = <&wakeupgen GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH
+				   &omap4_pmx_core OMAP4_UART3_RX>;
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+
+	clock-frequency = <400000>;
+
+	twl: pmic@48 {
+		reg = <0x48>;
+		#clock-cells = <1>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <
+			&twl6030_pins
+			&twl6030_wkup_pins
+		>;
+
+		/* SPI = 0, IRQ# = 7, 4 = active high level-sensitive */
+		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>; /* IRQ_SYS_1N cascaded to gic */
+		interrupt-parent = <&gic>;
+		system-power-controller;
+	};
+};
+
+#include "twl6032.dtsi"
+#include "twl6030_omap4.dtsi"
+
+&ldo1 {
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+	regulator-always-on;
+	regulator-state-mem {
+		regulator-off-in-suspend;
+	};
+};
+
+&ldo3 {
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-always-on;
+	regulator-state-mem {
+		regulator-off-in-suspend;
+	};
+};
+
+&ldo4 {
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+	regulator-always-on;
+};
+
+&ldo5 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-always-on;
+};
+
+&ldo6 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-always-on;
+	regulator-state-mem {
+		regulator-off-in-suspend;
+	};
+};
+
+&smps4 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-always-on;
+};
+
+&ldousb {
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-always-on;
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+};
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+};
+
+&i2c4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins>;
+
+	accelerometer@18 {
+		compatible = "bosch,bma254";
+		reg = <0x18>;
+		vdd-supply = <&ldo4>;
+		vddio-supply = <&ldo5>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <25 (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_EDGE_RISING)>,
+			<26 (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_EDGE_RISING)>;
+		mount-matrix =	"-1", "0", "0",
+				"0", "1", "0",
+				"0", "0", "1";
+		};
+
+	magnetometer@2e {
+		compatible = "yamaha,yas530";
+		reg = <0x2e>;
+		vdd-supply = <&ldo4>;
+		iovdd-supply = <&ldo5>;
+		reset-gpios = <&gpio5 29 GPIO_ACTIVE_LOW>;
+		interrupts = <&gpio6 10 IRQ_TYPE_EDGE_RISING>;
+	};
+
+	light-sensor@44 {
+		compatible = "sharp,gp2ap002a00f";
+		reg = <0x44>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		vdd-supply = <&ldo4>;
+		vio-supply = <&ldo4>;
+		io-channels = <&gp2a_shunt>;
+		io-channel-names = "alsout";
+		sharp,proximity-far-hysteresis = /bits/ 8 <0x40>;
+		sharp,proximity-close-hysteresis = /bits/ 8 <0x20>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gp2a_irq &prox_irq>;
+	};
+};
+
+&dss {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&dss_dpi_pins>;
+
+	port {
+		dpi_out: endpoint {
+			remote-endpoint = <&bridge_in>;
+			data-lines = <24>;
+		};
+	};
+};
+
+&twl_usb_comparator {
+	usb-supply = <&ldousb>;
+};
+
+&usb_otg_hs {
+	interface-type = <1>;
+	mode = <3>;
+	power = <50>;
+};
+
+&mmc1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+
+	vmmc-supply = <&reg_espresso_external>;
+	bus-width = <4>;
+};
+
+&mmc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc2_pins>;
+
+	vmmc-supply = <&reg_espresso_internal>;
+	ti,non-removable;
+	bus-width = <8>;
+};
+
+&mmc3 {
+	status = "disabled";
+};
+
+&mmc4 {
+	status = "disabled";
+};
+
+&mmc5 {
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	non-removable;
+	bus-width = <4>;
+	vmmc-supply = <&reg_espresso_wlan>;
+	mmc-pwrseq = <&wlan_pwrseq>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc5_pins>;
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm4330-fmac", "brcm,bcm4329-fmac";
+		reg = <1>;
+
+		interrupt-parent = <&gpio3>;
+		interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_host_wake>;
+	};
+};
+
+&uart2 {
+	interrupts-extended = <&wakeupgen GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH
+				&omap4_pmx_core OMAP4_UART2_RX>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		pinctrl-names = "default";
+		pinctrl-0 = <&bluetooth_pins>;
+		shutdown-gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio3 18 GPIO_ACTIVE_LOW>;
+		device-wakeup-gpios = <&gpio3 29 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <19 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
-- 
2.43.0

