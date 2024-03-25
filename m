Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 831F388A2F6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 14:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FD310E8CA;
	Mon, 25 Mar 2024 13:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PLaxA4Fc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FFB10E137
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 13:50:11 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-6e6cf03a76dso1128964a34.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 06:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711374611; x=1711979411; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Myxzqa3EkVTS56GMqlhd0l8iTPqf0adbaLrmdDa0/Q=;
 b=PLaxA4FcN+QxrCsRzKizzxU/TWsh+nSX+OLMhzbaq2eKj2tobvpj9XIrtIM7ythcqg
 nIqWs0Z2jYS0j+zRNlXgXz5cA3rEyaTWzsZsCtd0190ZZvdslwbxTUnmZS4Fog7sZEh5
 Z+Uq4AaIxnEjszY4poWBrxn4fjhL2xM24g8uhf1U9uY5N4rL5Y4zjsXetSrcrNcbIA0I
 xrenrzS7739pKcMg6e5nXDBcgv62QBgSW9R43qj7j+bP6cM7jwPgbojHaVgMo+bDybfC
 gbiYqbNtv5lFJZqG7OPZ6ovKExUK0uciDNYKIX9aCh6loU4I6j7aMwc6NOpxg0lLaDoG
 oTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711374611; x=1711979411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Myxzqa3EkVTS56GMqlhd0l8iTPqf0adbaLrmdDa0/Q=;
 b=IRY2YX7zdTYm/2BByoWtxj6DdLCwrG6FalJ/AN4+yiJgWhpnqDpsy+cZN2ljBsqIKg
 27kYg0oyzB4qi8C30y6k3PFyDcYKt8UiHZvu1fie7XrnkDYfIGXmAjDqQcIf8xbZm9AL
 tocaGsez1YWRTeIer5ZbtQrtO8Bf7x2cLmM9B99AwiPK2ZzKrr3D+ilpCeRTo8c4x83A
 nnSaOkQ1bqlKRRPMu/blPEfI8HYd8HC8CxPZOYMNg1dHk6p/4qbRivdsBLS+00JN7z8L
 RGECEPCL1ZJDcJVf/vjq2Un7PRKpHPY7qd4YrCaDjC9+in8kH4ARyD17ToE2ZAMOsd/9
 +LLA==
X-Gm-Message-State: AOJu0YxUxf6gWH6/SdXrAwlizYSBzqKkdVAOvFawp/nj5E4sVTE+ik5H
 LahEzcYGlmKpbQNNBk4VZA4XspTPWjra2WKUqjIsKNMvrUePDLI7vze8Wcpu
X-Google-Smtp-Source: AGHT+IHmddrSZZB2SCJRUO3C2MC0iOFn7e2y/reQwi23NtKWTFC2Zrjz6D9vdouSjoyKsapManJtTg==
X-Received: by 2002:a05:6830:4426:b0:6e6:e19e:387 with SMTP id
 q38-20020a056830442600b006e6e19e0387mr905007otv.34.1711374610727; 
 Mon, 25 Mar 2024 06:50:10 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a05683010c800b006e673e2d2a3sm1118250oto.77.2024.03.25.06.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 06:50:10 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, megi@xff.cz,
 kernel@puri.sm, agx@sigxcpu.org, heiko@sntech.de, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 5/5] arm64: dts: rockchip: Add GameForce Chi
Date: Mon, 25 Mar 2024 08:49:59 -0500
Message-Id: <20240325134959.11807-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325134959.11807-1-macroalpha82@gmail.com>
References: <20240325134959.11807-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the GameForce Chi, which is a handheld gaming console
from GameForce with a Rockchip RK3326 SoC. The device has a 640x480
3.5" dual-lane DSI display, one analog joystick connected to the SoC
SARADC controller and a second analog joystick connected to an unknown
UART based ADC, a single SD card slot, a single USB-C port for
charging, and onboard RTL8723BS WiFi/Bluetooth combo, multiple face
buttons, and an array of R/G/B LEDs used for key backlighting.

The vendor was unable to provide details on the unknown UART based
ADC which I have documented via a comment in the device-tree, and
the vendor also does not have available Bluetooth firmware (the BT
was not previously working on the vendor's OS, this has also been
noted in a device-tree comment).

Aside from the right analog ADC joystick and bluetooth all hardware has
been tested and is working as expected.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3326-gameforce-chi.dts     | 811 ++++++++++++++++++
 2 files changed, 812 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index f906a868b71a..584ee35da180 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3308-rock-pi-s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3318-a95x-z2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3326-anbernic-rg351m.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3326-anbernic-rg351v.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3326-gameforce-chi.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3326-odroid-go2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3326-odroid-go2-v11.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3326-odroid-go3.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts b/arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts
new file mode 100644
index 000000000000..f7a9e763fba0
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts
@@ -0,0 +1,811 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2024 Chris Morgan <macromorgan@hotmail.com>
+ */
+
+/dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include "rk3326.dtsi"
+
+/ {
+	model = "GameForce Chi";
+
+	compatible = "gameforce,chi", "rockchip,rk3326";
+
+	chassis-type = "handset";
+
+	aliases {
+		mmc0 = &sdmmc;
+		mmc1 = &sdio;
+	};
+
+	chosen {
+		stdout-path = "serial2:115200n8";
+	};
+
+	adc_joystick: adc-joystick {
+		compatible = "adc-joystick";
+		io-channels = <&saradc 0>,
+			      <&saradc 1>;
+		poll-interval = <100>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		axis@0 {
+			reg = <0>;
+			abs-flat = <10>;
+			abs-fuzz = <10>;
+			abs-range = <850 175>;
+			linux,code = <ABS_Y>;
+		};
+
+		axis@1 {
+			reg = <1>;
+			abs-flat = <10>;
+			abs-fuzz = <10>;
+			abs-range = <800 190>;
+			linux,code = <ABS_X>;
+		};
+	};
+
+	adc_keys: adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 2>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <60>;
+
+		button-1 {
+			label = "HAPPY1";
+			linux,code = <BTN_TRIGGER_HAPPY1>;
+			press-threshold-microvolt = <15000>;
+		};
+
+		button-2 {
+			label = "HAPPY2";
+			linux,code = <BTN_TRIGGER_HAPPY2>;
+			press-threshold-microvolt = <300000>;
+		};
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		power-supply = <&vcc_bl>;
+		pwms = <&pwm1 0 25000 0>;
+	};
+
+	battery: battery {
+		compatible = "simple-battery";
+		charge-full-design-microamp-hours = <3000000>;
+		charge-term-current-microamp = <300000>;
+		constant-charge-current-max-microamp = <1500000>;
+		constant-charge-voltage-max-microvolt = <4200000>;
+		factory-internal-resistance-micro-ohms = <180000>;
+		voltage-max-design-microvolt = <4250000>;
+		voltage-min-design-microvolt = <3400000>;
+
+		ocv-capacity-celsius = <20>;
+		ocv-capacity-table-0 =  <4106000 100>, <4071000 95>, <4018000 90>, <3975000 85>,
+					<3946000 80>, <3908000 75>, <3877000 70>, <3853000 65>,
+					<3834000 60>, <3816000 55>, <3802000 50>, <3788000 45>,
+					<3774000 40>, <3760000 35>, <3748000 30>, <3735000 25>,
+					<3718000 20>, <3697000 15>, <3685000 10>, <3625000 5>,
+					<3400000 0>;
+	};
+
+	gpio_leds: gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+
+		red_led: led-0 {
+			color = <LED_COLOR_ID_RED>;
+			gpios = <&gpio3 RK_PC4 GPIO_ACTIVE_HIGH>;
+		};
+
+		green_led: led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio3 RK_PC5 GPIO_ACTIVE_HIGH>;
+		};
+
+		blue_led: led-2 {
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_HIGH>;
+		};
+
+		white_led: led-3 {
+			color = <LED_COLOR_ID_WHITE>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio3 RK_PB3 GPIO_ACTIVE_HIGH>;
+		};
+
+		chg_led: led-4 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_CHARGING;
+			gpios = <&gpio3 RK_PB2 GPIO_ACTIVE_HIGH>;
+		};
+
+	};
+
+	gpio_keys: gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&btn_pins_ctrl>;
+		pinctrl-names = "default";
+
+		button-a {
+			gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_LOW>;
+			label = "EAST";
+			linux,code = <BTN_EAST>;
+		};
+
+		button-b {
+			gpios = <&gpio2 RK_PB1 GPIO_ACTIVE_LOW>;
+			label = "SOUTH";
+			linux,code = <BTN_SOUTH>;
+		};
+
+		button-down {
+			gpios = <&gpio1 RK_PB5 GPIO_ACTIVE_LOW>;
+			label = "DPAD-DOWN";
+			linux,code = <BTN_DPAD_DOWN>;
+		};
+
+		button-home {
+			gpios = <&gpio2 RK_PA0 GPIO_ACTIVE_LOW>;
+			label = "HOME";
+			linux,code = <BTN_MODE>;
+		};
+
+		button-l1 {
+			gpios = <&gpio2 RK_PA6 GPIO_ACTIVE_LOW>;
+			label = "TL";
+			linux,code = <BTN_TL>;
+		};
+
+		button-l2 {
+			gpios = <&gpio2 RK_PA4 GPIO_ACTIVE_LOW>;
+			label = "TL2";
+			linux,code = <BTN_TL2>;
+		};
+
+		button-left {
+			gpios = <&gpio1 RK_PB6 GPIO_ACTIVE_LOW>;
+			label = "DPAD-LEFT";
+			linux,code = <BTN_DPAD_LEFT>;
+		};
+
+		button-r1 {
+			gpios = <&gpio2 RK_PA7 GPIO_ACTIVE_LOW>;
+			label = "TR";
+			linux,code = <BTN_TR>;
+		};
+
+		button-r2 {
+			gpios = <&gpio2 RK_PA5 GPIO_ACTIVE_LOW>;
+			label = "TR2";
+			linux,code = <BTN_TR2>;
+		};
+
+		button-right {
+			gpios = <&gpio1 RK_PB7 GPIO_ACTIVE_LOW>;
+			label = "DPAD-RIGHT";
+			linux,code = <BTN_DPAD_RIGHT>;
+		};
+
+		button-select {
+			gpios = <&gpio2 RK_PA3 GPIO_ACTIVE_LOW>;
+			label = "SELECT";
+			linux,code = <BTN_SELECT>;
+		};
+
+		button-start {
+			gpios = <&gpio2 RK_PA2 GPIO_ACTIVE_LOW>;
+			label = "START";
+			linux,code = <BTN_START>;
+		};
+
+		button-up {
+			gpios = <&gpio1 RK_PB4 GPIO_ACTIVE_LOW>;
+			label = "DPAD-UP";
+			linux,code = <BTN_DPAD_UP>;
+		};
+
+		button-x {
+			gpios = <&gpio2 RK_PB3 GPIO_ACTIVE_LOW>;
+			label = "NORTH";
+			linux,code = <BTN_NORTH>;
+		};
+
+		button-y {
+			gpios = <&gpio2 RK_PB2 GPIO_ACTIVE_LOW>;
+			label = "WEST";
+			linux,code = <BTN_WEST>;
+		};
+	};
+
+	multi-led {
+		compatible = "leds-group-multicolor";
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_KBD_BACKLIGHT;
+		leds = <&red_led>, <&green_led>, <&blue_led>;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		pinctrl-0 = <&hp_det>;
+		pinctrl-names = "default";
+		simple-audio-card,name = "rk817_ext";
+		simple-audio-card,aux-devs = <&spk_amp>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,hp-det-gpio = <&gpio2 RK_PC6 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,widgets =
+			"Microphone", "Mic Jack",
+			"Headphone", "Headphones",
+			"Speaker", "Internal Speakers";
+		simple-audio-card,routing =
+			"MICL", "Mic Jack",
+			"Headphones", "HPOL",
+			"Headphones", "HPOR",
+			"Internal Speakers", "Speaker Amp OUTL",
+			"Internal Speakers", "Speaker Amp OUTR",
+			"Speaker Amp INL", "HPOL",
+			"Speaker Amp INR", "HPOR";
+		simple-audio-card,pin-switches = "Internal Speakers";
+
+		simple-audio-card,codec {
+			sound-dai = <&rk817>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s1_2ch>;
+		};
+	};
+
+	spk_amp: audio-amplifier {
+		compatible = "simple-audio-amplifier";
+		enable-gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&spk_amp_enable_h>;
+		pinctrl-names = "default";
+		sound-name-prefix = "Speaker Amp";
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rk817 1>;
+		clock-names = "ext_clock";
+		pinctrl-0 = <&wifi_enable_h>;
+		pinctrl-names = "default";
+		post-power-on-delay-ms = <200>;
+		reset-gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_LOW>;
+	};
+
+	vccsys: vccsys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v8_sys";
+		regulator-always-on;
+		regulator-min-microvolt = <3800000>;
+		regulator-max-microvolt = <3800000>;
+	};
+
+	vibrator_left: pwm-vibrator-l {
+		compatible = "pwm-vibrator";
+		pwm-names = "enable";
+		pwms = <&pwm4 0 25000 0>;
+	};
+
+	vibrator_right: pwm-vibrator-r {
+		compatible = "pwm-vibrator";
+		pwm-names = "enable";
+		pwms = <&pwm5 0 25000 0>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&cpu1 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&cpu2 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&cpu3 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&display_subsystem {
+	status = "okay";
+};
+
+&dsi {
+	status = "okay";
+
+	ports {
+		mipi_out: port@1 {
+			reg = <1>;
+
+			mipi_out_panel: endpoint {
+				remote-endpoint = <&mipi_in_panel>;
+			};
+		};
+	};
+
+	internal_display: panel@0 {
+		reg = <0>;
+		compatible = "gameforce,chi-panel";
+		backlight = <&backlight>;
+		iovcc-supply = <&vcc_lcd>;
+		vcc-supply = <&vcc_lcd>;
+		reset-gpios = <&gpio3 RK_PA0 GPIO_ACTIVE_LOW>;
+
+		port {
+			mipi_in_panel: endpoint {
+				remote-endpoint = <&mipi_out_panel>;
+			};
+		};
+	};
+};
+
+&dsi_dphy {
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&vdd_logic>;
+	status = "okay";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	i2c-scl-falling-time-ns = <16>;
+	i2c-scl-rising-time-ns = <280>;
+	status = "okay";
+
+	rk817: pmic@20 {
+		compatible = "rockchip,rk817";
+		reg = <0x20>;
+		#clock-cells = <1>;
+		clock-names = "mclk";
+		clock-output-names = "rk808-clkout1", "xin32k";
+		clocks = <&cru SCLK_I2S1_OUT>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PC1 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pmic_int>, <&i2s1_2ch_mclk>;
+		pinctrl-names = "default";
+		#sound-dai-cells = <0>;
+		system-power-controller;
+		wakeup-source;
+
+		vcc1-supply = <&vccsys>;
+		vcc2-supply = <&vccsys>;
+		vcc3-supply = <&vccsys>;
+		vcc4-supply = <&vccsys>;
+		vcc5-supply = <&vccsys>;
+		vcc6-supply = <&vccsys>;
+		vcc7-supply = <&vcc_3v0>;
+		vcc8-supply = <&vccsys>;
+		vcc9-supply = <&dcdc_boost>;
+
+		regulators {
+			vdd_logic: DCDC_REG1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1150000>;
+				regulator-min-microvolt = <950000>;
+				regulator-name = "vdd_logic";
+				regulator-ramp-delay = <6001>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <950000>;
+				};
+			};
+
+			vdd_arm: DCDC_REG2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1350000>;
+				regulator-min-microvolt = <950000>;
+				regulator-name = "vdd_arm";
+				regulator-ramp-delay = <6001>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <950000>;
+				};
+			};
+
+			vcc_ddr: DCDC_REG3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vcc_ddr";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vcc_3v0: DCDC_REG4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3000000>;
+				regulator-min-microvolt = <3000000>;
+				regulator-name = "vcc_3v0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <3000000>;
+				};
+			};
+
+			vcc_1v8: LDO_REG2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "vcc_1v8";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vdd_1v0: LDO_REG3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1000000>;
+				regulator-min-microvolt = <1000000>;
+				regulator-name = "vdd_1v0";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1000000>;
+				};
+			};
+
+			vcc_3v0_pmu: LDO_REG4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3000000>;
+				regulator-min-microvolt = <3000000>;
+				regulator-name = "vcc_3v0_pmu";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3000000>;
+				};
+			};
+
+			vccio_sd: LDO_REG5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "vccio_sd";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vcc_sd: LDO_REG6 {
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-name = "vcc_sd";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vcc_bl: LDO_REG7 {
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-name = "vcc_bl";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vcc_lcd: LDO_REG8 {
+				regulator-max-microvolt = <2800000>;
+				regulator-min-microvolt = <2800000>;
+				regulator-name = "vcc_lcd";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <2800000>;
+				};
+			};
+
+			vcc_wifi: LDO_REG9 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-name = "vcc_wifi";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			dcdc_boost: BOOST {
+				regulator-max-microvolt = <5000000>;
+				regulator-min-microvolt = <5000000>;
+				regulator-name = "dcdc_boost";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			otg_switch: OTG_SWITCH {
+				regulator-name = "otg_switch";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+
+		rk817_charger: charger {
+			monitored-battery = <&battery>;
+			rockchip,resistor-sense-micro-ohms = <10000>;
+			rockchip,sleep-enter-current-microamp = <300000>;
+			rockchip,sleep-filter-current-microamp = <100000>;
+		};
+	};
+};
+
+&i2s1_2ch {
+	status = "okay";
+};
+
+&io_domains {
+	vccio1-supply = <&vcc_3v0_pmu>;
+	vccio2-supply = <&vccio_sd>;
+	vccio3-supply = <&vcc_3v0>;
+	vccio4-supply = <&vcc_3v0>;
+	vccio5-supply = <&vcc_3v0>;
+	vccio6-supply = <&vcc_3v0>;
+	status = "okay";
+};
+
+&pinctrl {
+	bluetooth-pins {
+		bt_reset: bt-reset {
+			rockchip,pins =
+				<0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		bt_wake_dev: bt-wake-dev {
+			rockchip,pins =
+				<0 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_host: bt-wake-host {
+			rockchip,pins =
+				<0 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	headphone {
+		hp_det: hp-det {
+			rockchip,pins =
+				<2 RK_PC6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	gpio-btns {
+		btn_pins_ctrl: btn-pins-ctrl {
+			rockchip,pins =
+				<1 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>,
+				<1 RK_PB5 RK_FUNC_GPIO &pcfg_pull_up>,
+				<1 RK_PB6 RK_FUNC_GPIO &pcfg_pull_up>,
+				<1 RK_PB7 RK_FUNC_GPIO &pcfg_pull_up>,
+				<2 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>,
+				<2 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>,
+				<2 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>,
+				<2 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>,
+				<2 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>,
+				<2 RK_PA6 RK_FUNC_GPIO &pcfg_pull_up>,
+				<2 RK_PA7 RK_FUNC_GPIO &pcfg_pull_up>,
+				<2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>,
+				<2 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up>,
+				<2 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>,
+				<2 RK_PB3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	gpio-leds {
+		led_pins: led-pins {
+			rockchip,pins =
+				<3 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>,
+				<3 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>,
+				<3 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>,
+				<3 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>,
+				<3 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pmic {
+		pmic_int: pmic-int {
+			rockchip,pins =
+				<0 RK_PC1 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		soc_slppin_gpio: soc_slppin_gpio {
+			rockchip,pins =
+				<0 RK_PA4 RK_FUNC_GPIO &pcfg_output_low>;
+		};
+
+		soc_slppin_rst: soc_slppin_rst {
+			rockchip,pins =
+				<0 RK_PA4 2 &pcfg_pull_none>;
+		};
+
+		soc_slppin_slp: soc_slppin_slp {
+			rockchip,pins =
+				<0 RK_PA4 1 &pcfg_pull_none>;
+		};
+	};
+
+	sdio-pwrseq {
+		wifi_enable_h: wifi-enable-h {
+			rockchip,pins =
+				<0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	speaker {
+		spk_amp_enable_h: spk-amp-enable-h {
+			rockchip,pins =
+				<2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&pmu_io_domains {
+	pmuio1-supply = <&vcc_1v8>;
+	pmuio2-supply = <&vcc_3v0_pmu>;
+	status = "okay";
+};
+
+&pwm1 {
+	status = "okay";
+};
+
+&pwm4 {
+	status = "okay";
+};
+
+&pwm5 {
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sdio {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	disable-wp;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	no-mmc;
+	no-sd;
+	non-removable;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&sdmmc {
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	no-sdio;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_sd>;
+	vqmmc-supply = <&vccio_sd>;
+	status = "okay";
+};
+
+&sfc {
+	#address-cells = <1>;
+	pinctrl-0 = <&sfc_clk &sfc_cs0 &sfc_bus2>;
+	pinctrl-names = "default";
+	#size-cells = <0>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <108000000>;
+		spi-rx-bus-width = <2>;
+		spi-tx-bus-width = <1>;
+	};
+};
+
+&tsadc {
+	status = "okay";
+};
+
+&u2phy {
+	status = "okay";
+
+	u2phy_otg: otg-port {
+		status = "okay";
+	};
+};
+
+&usb20_otg {
+	status = "okay";
+};
+
+/*
+ * The right ADC joystick exists connected to an unknown ADC
+ * controller which can be communicated with via uart0. This ADC device
+ * is an 8-pin SOIC with no markings located right next to the left ADC
+ * joystick ribbon cable. The pinout for this ADC controller appears to
+ * be pin 1 - VCC (2.8v), pin 2 - 1.8v (clk maybe?), pin 3 - GPIO 10,
+ * pin 4 - unknown, pin 5 - unknown, pin 6 - analog in, pin 7 - analog in,
+ * pin 8 - ground. There is currently a userspace UART driver for this
+ * device but it only works with the BSP joystick driver.
+ */
+&uart0 {
+	status = "okay";
+};
+
+/* Bluetooth was not working on BSP and is not currently working on
+ * mainline due to missing firmware. Bluetooth requires removal of DMA
+ * or else it will not probe.
+ */
+&uart1 {
+	/delete-property/ dma-names;
+	/delete-property/ dmas;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth: bluetooth {
+		compatible = "realtek,rtl8723ds-bt";
+		device-wake-gpios = <&gpio0 RK_PA1 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
+		host-wake-gpios = <&gpio0 RK_PA7 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&bt_reset>, <&bt_wake_dev>, <&bt_wake_host>;
+		pinctrl-names = "default";
+	};
+};
+
+&uart2 {
+	pinctrl-0 = <&uart2m1_xfer>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&vopb {
+	status = "okay";
+};
+
+&vopb_mmu {
+	status = "okay";
+};
-- 
2.34.1

