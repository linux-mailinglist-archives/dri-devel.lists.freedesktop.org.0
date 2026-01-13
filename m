Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD1BD1B200
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 20:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7024910E542;
	Tue, 13 Jan 2026 19:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iEp2T0Wc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5555710E546
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 19:59:54 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-450b2715b6cso4621105b6e.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 11:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768334393; x=1768939193; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vgIEVZtjguzd4gq2BiIIgofkbm/ZkGaOmbNZNeCxYN4=;
 b=iEp2T0Wc81FSjnH1HY4k5tCNsVAr1L4BN6UEwodo2gYiA4oUV7UGDNUSRjPnEjXwpn
 Rjl0VITHoLmwvAPRu6tZBIOy1VuMgY+H6dHa3mBZZL/sZjaeNSi9GMhsqFLah9ZHFFdp
 q1SRruHwZebHBUhDDlxZD7HGo6CydtOcyQSXod2vGZQuRSXKUivnCHus9jcPGjr6/5O8
 eWUii679V3h9ny7eDLMx7jWOPEuo2gZedtpnJTgoW3AwH335P9MlkG4FGuGOZEvi+6iS
 W1C5lVKKQCX7ShAVjJ4HuFDIqRUTZgzS6ytqc9MpNqIfcwxvjTuaL/blQim84xwdYXEx
 YZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768334393; x=1768939193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vgIEVZtjguzd4gq2BiIIgofkbm/ZkGaOmbNZNeCxYN4=;
 b=lZBc9Crw3Gxjka1keB0JPSyl8HuVO6MNb9WUBvSRXzASc2dKtgDaoTY9fzqy/6Cimr
 vJjHpQEf/Bv+8uITF55y1Rfmx6uWdB1corMgUvRH6Ao4jiLHzJbUQrtXzxuNxBLWyg9p
 myNP1P3d6Yjn4AS5AhIOaF/bYakvMRLlor1u8XusxiNpJfpMIW0NLclD/p3i8ZIYUxHs
 2Wiz2YFCSohNiyglSKuRtg7544FPOkjIBb2UP4D9oVvI1x/fX+rStWvOOTD71lzWd0mf
 YXvJXBum24fonW9zzuKDmCJUroPE4KlSuGZ2bnw+fm6ViF8O4MzpoDa5pZo1piQW/cc6
 cnxQ==
X-Gm-Message-State: AOJu0YzvCbG9PPoiTUWMeuzrARN+V3tKynaz2yf0/YMIXIRtHxS/UmLj
 RnBCPOfMhMVddGTRTiqWqoOni9EkVsuQKz9+z3WAmTJLsB58L7ZhnRg+
X-Gm-Gg: AY/fxX6/CJCrXYPVM/OHiu23v2umSQ3au8qkFJtyKY9exHbPY3DtXpLiwBiYBdmHf4f
 a9uVLU3w/dZSVsizSxQOPC8k0Irhl4Z5QQV71v5xqJKJwWjIz1S6fhQshpyrnBES5/yPOXfaKpF
 nHgSeavTrzkmg/xGM+wzpUaI8yVTi2F0MKObhEd+OwYBaWVf+Ceyx4tbWdU+yO15RgiVoeKlqna
 l3z3Mh7S2YVIivqBOOH5kbGaSDnuAz1MLCJze+Qt4wd6cTXx40n8Oa68i5tvOOnvmywQ5K+LY/I
 dNRvTo7wDYHbD4qdQY2v6CWuMMKwuaHpI4Cb7AQzyFuqz7oYhNiM13qFwpfhAph7+a2J1K9rpxQ
 lCXp6OxubhHsWH75n2qxSMriMcM0Z91ktYvMH3x7bmb1mQ3X2EmjdSJZVpjX6KUujdfHD06inex
 QySP6lPD9y
X-Received: by 2002:a05:6808:bd4:b0:450:d120:fe4e with SMTP id
 5614622812f47-45c714984a2mr87600b6e.27.1768334393193; 
 Tue, 13 Jan 2026 11:59:53 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7ce47801d4dsm16221119a34.5.2026.01.13.11.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 11:59:52 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 dmitry.torokhov@gmail.com, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jesszhan0024@gmail.com, neil.armstrong@linaro.org, jagan@edgeble.ai,
 heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 aweinzerl13@yahoo.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 6/6] arm64: dts: rockchip: Add Anbernic RG-DS
Date: Tue, 13 Jan 2026 13:57:21 -0600
Message-ID: <20260113195721.151205-7-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113195721.151205-1-macroalpha82@gmail.com>
References: <20260113195721.151205-1-macroalpha82@gmail.com>
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

Add device tree for the Anbernic RG-DS, based on the Rockchip RK3568.
All hardware is currently working except for the accelerometer, the
speaker output, and one of the two battery gauges. A bug in the
Rockchip VOP2 driver is currently causing the device to pause for 30
seconds at boot and is being investigated.

The Anbernic RG-DS includes the following (supported) hardware:
 - 2 640x480 DSI display screens with touch.
 - 21 buttons.
 - 2 Analog joysticks.
 - 3 LEDs (red and green LED share the same housing).
 - 32GB eMMC, 1 SDMMC slot.
 - RTL8821CS WiFi/Bluetooth combo
 - 1 USB 2.0 port in host mode, 1 USB 2.0 port in peripheral mode.
 - 3.5mm headphone jack with play button support.
 - 4000mAH battery

The following hardware has incomplete driver support and is not yet
working:
 - An Invensense icm42607p accelerometer.
 - Two Awinic aw87391 speaker amplifiers.
 - A Cellwise cw2015 battery monitor, which appears to conflict with
   the rk817 charger driver at the moment.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Co-developed-by: Alexander Weinzerl <aweinzerl13@yahoo.com>
Signed-off-by: Alexander Weinzerl <aweinzerl13@yahoo.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../dts/rockchip/rk3568-anbernic-rg-ds.dts    | 1237 +++++++++++++++++
 2 files changed, 1238 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index dbdda9783e93..32dbb6b7e24f 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -133,6 +133,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-bigtreetech-pi2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-tinker-board-3.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-tinker-board-3s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-9tripod-x3568-v4.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-anbernic-rg-ds.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-bpi-r2-pro.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-easepi-r1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-evb1-v10.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
new file mode 100644
index 000000000000..6ac1fe0d3c98
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
@@ -0,0 +1,1237 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include "rk3568.dtsi"
+
+/ {
+	model = "Anbernic RG DS";
+	chassis-type = "handset";
+	compatible = "anbernic,rg-ds", "rockchip,rk3568";
+
+	aliases {
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc0;
+		mmc2 = &sdmmc2;
+	};
+
+	chosen: chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	adc_keys_home: adc-keys-home {
+		compatible = "adc-keys";
+		io-channel-names = "buttons";
+		io-channels = <&saradc 0>;
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <60>;
+
+		button-home {
+			label = "HOME";
+			linux,code = <BTN_MODE>;
+			press-threshold-microvolt = <1750>;
+		};
+	};
+
+	adc_keys_play: adc-keys-play {
+		compatible = "adc-keys";
+		io-channel-names = "buttons";
+		io-channels = <&saradc 2>;
+		keyup-threshold-microvolt = <1300000>;
+		poll-interval = <60>;
+
+		button-play {
+			label = "PLAY";
+			linux,code = <KEY_PLAYPAUSE>;
+			press-threshold-microvolt = <1750>;
+		};
+	};
+
+	adc_mux: adc-mux {
+		compatible = "io-channel-mux";
+		channels = "left_x", "right_x", "left_y", "right_y";
+		#io-channel-cells = <1>;
+		io-channels = <&saradc 3>;
+		io-channel-names = "parent";
+		mux-controls = <&gpio_mux>;
+		settle-time-us = <100>;
+	};
+
+	adc-joystick {
+		compatible = "adc-joystick";
+		#address-cells = <1>;
+		io-channels = <&adc_mux 0>,
+			      <&adc_mux 1>,
+			      <&adc_mux 2>,
+			      <&adc_mux 3>;
+		pinctrl-0 = <&joy_mux_en>;
+		pinctrl-names = "default";
+		poll-interval = <60>;
+		#size-cells = <0>;
+
+		axis@0 {
+			reg = <0>;
+			abs-flat = <32>;
+			abs-fuzz = <32>;
+			abs-range = <1023 15>;
+			linux,code = <ABS_X>;
+		};
+
+		axis@1 {
+			reg = <1>;
+			abs-flat = <32>;
+			abs-fuzz = <32>;
+			abs-range = <15 1023>;
+			linux,code = <ABS_RY>;
+		};
+
+		axis@2 {
+			reg = <2>;
+			abs-flat = <32>;
+			abs-fuzz = <32>;
+			abs-range = <15 1023>;
+			linux,code = <ABS_Y>;
+		};
+
+		axis@3 {
+			reg = <3>;
+			abs-flat = <32>;
+			abs-fuzz = <32>;
+			abs-range = <15 1023>;
+			linux,code = <ABS_RX>;
+		};
+	};
+
+	backlight0: backlight0 {
+		compatible = "pwm-backlight";
+		enable-gpios = <&gpio4 RK_PA4 GPIO_ACTIVE_HIGH>;
+		pwms = <&pwm12 0 25000 0>;
+	};
+
+	backlight1: backlight1 {
+		compatible = "pwm-backlight";
+		enable-gpios = <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
+		pwms = <&pwm13 0 25000 0>;
+	};
+
+	/*
+	 * Values taken from BSP device-tree except for
+	 * "charge-full-design-microamp-hours" which was set
+	 * incorrectly at 2500000 (based on markings on the battery it
+	 * should be 4000000), "factory-internal-resistance-micro-ohms"
+	 * which was set at 8 but based on context should likely be 80000.
+	 *
+	 * "constant-charge-current-max-microamp" is set at 10 AMPs
+	 * which is likely incorrect but I cannot validate; furthermore
+	 * the onboard charger of the rk817 cannot charge past 3.5A
+	 * anyway.
+	 */
+	battery: battery {
+		compatible = "simple-battery";
+		charge-full-design-microamp-hours = <4000000>;
+		charge-term-current-microamp = <300000>;
+		constant-charge-current-max-microamp = <10000000>;
+		constant-charge-voltage-max-microvolt = <4350000>;
+		factory-internal-resistance-micro-ohms = <80000>;
+		precharge-current-microamp = <180000>;
+		precharge-upper-limit-microvolt = <3600000>;
+		voltage-max-design-microvolt = <4350000>;
+		voltage-min-design-microvolt = <3000000>;
+
+		/*
+		 * BSP device-tree missing value for 5 percent, so I
+		 * picked a value between 10 and 0.
+		 */
+		ocv-capacity-celsius = <20>;
+		ocv-capacity-table-0 =  <4338000 100>, <4251000 95>,
+					<4191000 90>, <4136000 85>,
+					<4083000 80>, <4039000 75>,
+					<3978000 70>, <3947000 65>,
+					<3908000 60>, <3861000 55>,
+					<3826000 50>, <3786000 45>,
+					<3772000 40>, <3761000 35>,
+					<3749000 30>, <3731000 25>,
+					<3707000 20>, <3677000 15>,
+					<3663000 10>, <3446000 5>,
+					<3400000 0>;
+	};
+
+	gpio_keys_control: gpio-keys-control {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gamepad_keys_l>;
+		pinctrl-names = "default";
+
+		button-a {
+			gpios = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
+			label = "EAST";
+			linux,code = <BTN_EAST>;
+		};
+
+		button-b {
+			gpios = <&gpio3 RK_PC0 GPIO_ACTIVE_LOW>;
+			label = "SOUTH";
+			linux,code = <BTN_SOUTH>;
+		};
+
+		button-down {
+			gpios = <&gpio2 RK_PD5 GPIO_ACTIVE_LOW>;
+			label = "DPAD-DOWN";
+			linux,code = <BTN_DPAD_DOWN>;
+		};
+
+		button-l1 {
+			gpios = <&gpio3 RK_PA3 GPIO_ACTIVE_LOW>;
+			label = "TL";
+			linux,code = <BTN_TL>;
+		};
+
+		button-l2 {
+			gpios = <&gpio3 RK_PA4 GPIO_ACTIVE_LOW>;
+			label = "TL2";
+			linux,code = <BTN_TL2>;
+		};
+
+		button-left {
+			gpios = <&gpio2 RK_PD7 GPIO_ACTIVE_LOW>;
+			label = "DPAD-LEFT";
+			linux,code = <BTN_DPAD_LEFT>;
+		};
+
+		button-menu {
+			gpios = <&gpio2 RK_PD1 GPIO_ACTIVE_LOW>;
+			label = "HOME";
+			linux,code = <KEY_HOME>;
+		};
+
+		button-right {
+			gpios = <&gpio2 RK_PD6 GPIO_ACTIVE_LOW>;
+			label = "DPAD-RIGHT";
+			linux,code = <BTN_DPAD_RIGHT>;
+		};
+
+		button-r1 {
+			gpios = <&gpio3 RK_PA5 GPIO_ACTIVE_LOW>;
+			label = "T2";
+			linux,code = <BTN_TR>;
+		};
+
+		button-r2 {
+			gpios = <&gpio3 RK_PA6 GPIO_ACTIVE_LOW>;
+			label = "TR2";
+			linux,code = <BTN_TR2>;
+		};
+
+		button-select {
+			gpios = <&gpio3 RK_PB2 GPIO_ACTIVE_LOW>;
+			label = "SELECT";
+			linux,code = <BTN_SELECT>;
+		};
+
+		button-start {
+			gpios = <&gpio3 RK_PB1 GPIO_ACTIVE_LOW>;
+			label = "START";
+			linux,code = <BTN_START>;
+		};
+
+		button-thumbl {
+			gpios = <&gpio2 RK_PD2 GPIO_ACTIVE_LOW>;
+			label = "THUMBL";
+			linux,code = <BTN_THUMBL>;
+		};
+
+		button-thumbr {
+			gpios = <&gpio2 RK_PD3 GPIO_ACTIVE_LOW>;
+			label = "THUMBR";
+			linux,code = <BTN_THUMBR>;
+		};
+
+		button-up {
+			gpios = <&gpio2 RK_PD4 GPIO_ACTIVE_LOW>;
+			label = "DPAD-UP";
+			linux,code = <BTN_DPAD_UP>;
+		};
+
+		button-x {
+			gpios = <&gpio3 RK_PA7 GPIO_ACTIVE_LOW>;
+			label = "NORTH";
+			linux,code = <BTN_NORTH>;
+		};
+
+		button-y {
+			gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
+			label = "WEST";
+			linux,code = <BTN_WEST>;
+		};
+	};
+
+	gpio_keys_hall: gpio-keys-hall {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&hall_int_l>;
+		pinctrl-names = "default";
+
+		lid-switch {
+			gpios = <&gpio0 RK_PC3 GPIO_ACTIVE_LOW>;
+			label = "LID";
+			linux,code = <SW_LID>;
+			linux,input-type = <EV_SW>;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+			wakeup-source;
+		};
+	};
+
+	gpio_keys_volume: gpio-keys-volume {
+		compatible = "gpio-keys";
+		autorepeat;
+		pinctrl-0 = <&vol_keys_l>;
+		pinctrl-names = "default";
+
+		vol-down-key {
+			gpios = <&gpio3 RK_PA2 GPIO_ACTIVE_LOW>;
+			label = "VOLUMEDOWN";
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		vol-up-key {
+			gpios = <&gpio3 RK_PA1 GPIO_ACTIVE_LOW>;
+			label = "VOLUMEUP";
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
+	gpio_mux: mux-controller {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		mux-gpios = <&gpio3 RK_PC2 GPIO_ACTIVE_LOW>,
+			    <&gpio3 RK_PC3 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&joy_mux_config>;
+		pinctrl-names = "default";
+	};
+
+	leds: pwm-leds {
+		compatible = "pwm-leds";
+
+		green_led: led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			function = LED_FUNCTION_POWER;
+			max-brightness = <255>;
+			pwms = <&pwm5 0 25000 0>;
+		};
+
+		amber_led: led-1 {
+			color = <LED_COLOR_ID_AMBER>;
+			function = LED_FUNCTION_CHARGING;
+			max-brightness = <255>;
+			pwms = <&pwm6 0 25000 0>;
+		};
+
+		red_led: led-2 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			max-brightness = <255>;
+			pwms = <&pwm7 0 25000 0>;
+		};
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clock-names = "ext_clock";
+		clocks = <&rk817 1>;
+		pinctrl-0 = <&wifi_enable_h>;
+		pinctrl-names = "default";
+		post-power-on-delay-ms = <200>;
+		reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_LOW>;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		pinctrl-0 = <&hp_det>;
+		pinctrl-names = "default";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,hp-det-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "rk817_ext";
+		simple-audio-card,pin-switches = "Internal Speakers";
+		simple-audio-card,routing =
+			"MICL", "Mic Jack",
+			"Headphones", "HPOL",
+			"Headphones", "HPOR",
+			"Internal Speakers", "HPOL",
+			"Internal Speakers", "HPOR";
+		simple-audio-card,widgets =
+			"Microphone", "Mic Jack",
+			"Headphone", "Headphones",
+			"Speaker", "Internal Speakers";
+
+		simple-audio-card,codec {
+			sound-dai = <&rk817>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s1_8ch>;
+		};
+	};
+
+	vdd_lcd0: regulator-vdd-lcd0 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 RK_PC7 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vdd_lcd0_h>;
+		pinctrl-names = "default";
+		regulator-name = "vdd_lcd0";
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vccio_lcd0: regulator-vccio-lcd0 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 RK_PB0 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vccio_lcd0_h>;
+		pinctrl-names = "default";
+		regulator-name = "vccio_lcd0";
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vdd_lcd1: regulator-vdd-lcd1 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 RK_PC2 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vdd_lcd1_h>;
+		pinctrl-names = "default";
+		regulator-name = "vdd_lcd1";
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vccio_lcd1: regulator-vccio-lcd1 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 RK_PC1 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vccio_lcd1_h>;
+		pinctrl-names = "default";
+		regulator-name = "vccio_lcd1";
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vcc3v3_sd: regulator-vcc3v3-sd {
+		compatible = "regulator-fixed";
+		gpio = <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&sdmmc_pwren_l>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-name = "vcc3v3_sd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vccio_sd>;
+	};
+
+	vcc_sys: regulator-vcc-sys {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3800000>;
+		regulator-max-microvolt = <3800000>;
+		regulator-name = "vcc_sys";
+	};
+
+	vibrator: pwm-vibrator {
+		compatible = "pwm-vibrator";
+		pwm-names = "enable";
+		pwms = <&pwm14 0 100000 0>;
+		vcc-supply = <&vcc_sys>;
+	};
+
+	vcc_wifi: regulator-vcc-wifi {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vcc_wifi_h>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "vcc_wifi";
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu1 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu2 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu3 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cru {
+	assigned-clocks = <&pmucru CLK_RTC_32K>, <&cru PLL_GPLL>,
+			  <&pmucru PLL_PPLL>, <&cru PLL_VPLL>;
+	assigned-clock-rates = <32768>, <1200000000>,
+			       <200000000>, <292500000>;
+};
+
+&dsi0 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ports {
+		dsi0_in: port@0 {
+			reg = <0>;
+			dsi0_in_vp0: endpoint {
+				remote-endpoint = <&vp0_out_dsi0>;
+			};
+		};
+
+		dsi0_out: port@1 {
+			reg = <1>;
+			mipi_out_panel0: endpoint {
+				remote-endpoint = <&mipi_in_panel0>;
+			};
+		};
+	};
+
+	panel0: panel@0 {
+		compatible = "anbernic,rg-ds-display-bottom", "jadard,jd9365da-h3";
+		reg = <0>;
+		backlight = <&backlight0>;
+		pinctrl-0 = <&lcd0_rst>;
+		pinctrl-names = "default";
+		reset-gpios = <&gpio0 RK_PB3 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&vdd_lcd0>;
+		vccio-supply = <&vccio_lcd0>;
+
+		port {
+			mipi_in_panel0: endpoint {
+				remote-endpoint = <&mipi_out_panel0>;
+			};
+		};
+	};
+};
+
+&dsi1 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ports {
+		dsi1_in: port@0 {
+			reg = <0>;
+			dsi1_in_vp1: endpoint {
+				remote-endpoint = <&vp1_out_dsi1>;
+			};
+		};
+
+		dsi1_out: port@1 {
+			reg = <1>;
+			mipi_out_panel1: endpoint {
+				remote-endpoint = <&mipi_in_panel1>;
+			};
+		};
+	};
+
+	panel1: panel@0 {
+		compatible = "anbernic,rg-ds-display-top", "jadard,jd9365da-h3";
+		reg = <0>;
+		backlight = <&backlight1>;
+		pinctrl-0 = <&lcd1_rst>;
+		pinctrl-names = "default";
+		reset-gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&vdd_lcd1>;
+		vccio-supply = <&vccio_lcd1>;
+
+		port {
+			mipi_in_panel1: endpoint {
+				remote-endpoint = <&mipi_out_panel1>;
+			};
+		};
+	};
+};
+
+&dsi_dphy0 {
+	status = "okay";
+};
+
+&dsi_dphy1 {
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu>;
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	rk817: pmic@20 {
+		compatible = "rockchip,rk817";
+		reg = <0x20>;
+		assigned-clock-parents = <&cru CLK_I2S1_8CH_TX>;
+		assigned-clocks = <&cru I2S1_MCLKOUT_TX>;
+		#clock-cells = <1>;
+		clock-names = "mclk";
+		clock-output-names = "rk808-clkout1", "rk808-clkout2";
+		clocks = <&cru I2S1_MCLKOUT_TX>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&i2s1m0_mclk &pmic_int_l>;
+		pinctrl-names = "default";
+		#sound-dai-cells = <0>;
+		system-power-controller;
+		wakeup-source;
+
+		vcc1-supply = <&vcc_sys>;
+		vcc2-supply = <&vcc_sys>;
+		vcc3-supply = <&vcc_sys>;
+		vcc4-supply = <&vcc_sys>;
+		vcc5-supply = <&vcc_sys>;
+		vcc6-supply = <&vcc_sys>;
+		vcc7-supply = <&vcc_sys>;
+		vcc8-supply = <&vcc_sys>;
+		vcc9-supply = <&dcdc_boost>;
+
+		regulators {
+			vdd_logic: DCDC_REG1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-max-microvolt = <1350000>;
+				regulator-min-microvolt = <900000>;
+				regulator-name = "vdd_logic";
+				regulator-ramp-delay = <6001>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <900000>;
+				};
+			};
+
+			vdd_gpu: DCDC_REG2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-max-microvolt = <1350000>;
+				regulator-min-microvolt = <825000>;
+				regulator-name = "vdd_gpu";
+				regulator-ramp-delay = <6001>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_ddr: DCDC_REG3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-name = "vcc_ddr";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vcc_3v3: DCDC_REG4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-name = "vcc_3v3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vcca1v8_pmu: LDO_REG1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "vcca1v8_pmu";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vdda_0v9: LDO_REG2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <900000>;
+				regulator-min-microvolt = <900000>;
+				regulator-name = "vdda_0v9";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda0v9_pmu: LDO_REG3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <900000>;
+				regulator-min-microvolt = <900000>;
+				regulator-name = "vdda0v9_pmu";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <900000>;
+				};
+			};
+
+			vccio_acodec: LDO_REG4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-name = "vccio_acodec";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd: LDO_REG5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "vccio_sd";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc3v3_pmu: LDO_REG6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-name = "vcc3v3_pmu";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vcc_1v8: LDO_REG7 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "vcc_1v8";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vcc1v8_dvp: LDO_REG8 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "vcc1v8_dvp";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc2v8_dvp: LDO_REG9 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <2800000>;
+				regulator-min-microvolt = <2800000>;
+				regulator-name = "vcc2v8_dvp";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			dcdc_boost: BOOST {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <5400000>;
+				regulator-min-microvolt = <4700000>;
+				regulator-name = "boost";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			otg_switch: OTG_SWITCH {
+				regulator-name = "otg_switch";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+
+	       rk817_charger: charger {
+			monitored-battery = <&battery>;
+			rockchip,resistor-sense-micro-ohms = <10000>;
+			rockchip,sleep-enter-current-microamp = <150000>;
+			rockchip,sleep-filter-current-microamp = <100000>;
+		};
+	};
+
+	vdd_cpu: regulator@40 {
+		compatible = "silergy,syr827";
+		reg = <0x40>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1390000>;
+		regulator-min-microvolt = <712500>;
+		regulator-name = "vdd_cpu";
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc_sys>;
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	/*
+	 * Currently the rk817_charger and the cw2015 don't work together.
+	 * Disable the cw2015 for now because it performs the same function
+	 * as the rk817_charger for battery monitoring.
+	 */
+	cw2015: battery@62 {
+		compatible = "cellwise,cw2015";
+		reg = <0x62>;
+		cellwise,battery-profile = /bits/ 8
+				< 0x17 0x67 0x81 0x6F 0x69 0x65 0x63 0x54
+				 0x75 0x50 0x57 0x56 0x4E 0x4F 0x44 0x35
+				 0x2C 0x24 0x1E 0x1B 0x24 0x32 0x41 0x4D
+				 0x1C 0x57 0x0B 0x85 0x34 0x54 0x59 0x6D
+				 0x85 0x81 0x81 0x84 0x3C 0x1B 0x6C 0x6C
+				 0x0B 0x41 0x1C 0x4D 0x80 0x95 0xA0 0x14
+				 0x38 0x7E 0x98 0xA3 0x80 0x89 0x97 0xCB
+				 0x2F 0x00 0x64 0xA5 0xB5 0xC1 0x46 0xAE>;
+		cellwise,monitor-interval-ms = <5000>;
+		monitored-battery = <&battery>;
+		power-supplies = <&rk817_charger>;
+		status = "disabled";
+	};
+};
+
+&i2c2 {
+	clock-frequency = <200000>;
+	pinctrl-0 = <&i2c2m1_xfer>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	/* awinic,aw87391 at 0x58 */
+	/* awinic,aw87391 at 0x5b */
+	/* invensense,icm42607p at 0x68 */
+};
+
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c3m1_xfer>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	touch1: touchscreen@14 {
+		compatible = "goodix,gt911";
+		reg = <0x14>;
+		AVDD28-supply = <&vcc2v8_dvp>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PC0 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpios = <&gpio0 RK_PC0 GPIO_ACTIVE_HIGH>;
+		panel = <&panel1>;
+		reset-gpios = <&gpio0 RK_PB7 GPIO_ACTIVE_HIGH>;
+		touchscreen-size-x = <640>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		pinctrl-0 = <&touch1_rst &touch1_irq>;
+		pinctrl-names = "default";
+		VDDIO-supply = <&vcc3v3_pmu>;
+	};
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c5m0_xfer>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	touch0: touchscreen@14 {
+		compatible = "goodix,gt911";
+		reg = <0x14>;
+		AVDD28-supply = <&vcc2v8_dvp>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB6 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
+		panel = <&panel0>;
+		reset-gpios = <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
+		touchscreen-size-x = <640>;
+		touchscreen-size-y = <480>;
+		pinctrl-0 = <&touch0_rst &touch0_irq>;
+		pinctrl-names = "default";
+		VDDIO-supply = <&vcc3v3_pmu>;
+	};
+
+	/* Unused iSmartWare SW2001 encryption device at 0x3c */
+};
+
+&i2s1_8ch {
+	pinctrl-0 = <&i2s1m0_sclktx &i2s1m0_lrcktx &i2s1m0_sdi0 &i2s1m0_sdo0>;
+	pinctrl-names = "default";
+	rockchip,trcm-sync-tx-only;
+	status = "okay";
+};
+
+&pinctrl {
+	gpio-keys {
+		vol_keys_l: vol-keys_l {
+			rockchip,pins =
+				<3 RK_PA1 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		gamepad_keys_l: gamepad-keys-l {
+			rockchip,pins =
+				<2 RK_PD1 RK_FUNC_GPIO &pcfg_pull_up>,
+				<2 RK_PD2 RK_FUNC_GPIO &pcfg_pull_up>,
+				<2 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>,
+				<2 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>,
+				<2 RK_PD5 RK_FUNC_GPIO &pcfg_pull_up>,
+				<2 RK_PD6 RK_FUNC_GPIO &pcfg_pull_up>,
+				<2 RK_PD7 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PA6 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PA7 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PB7 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PC0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	gpio-lcd {
+		lcd0_rst: lcd0-rst {
+			rockchip,pins =
+				<0 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		lcd1_rst: lcd1-rst {
+			rockchip,pins =
+				<0 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	hall-sensor {
+		hall_int_l: hal-int-l {
+			rockchip,pins =
+				<0 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	hp-detect {
+		hp_det: hp-det {
+			rockchip,pins =
+				<4 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	joy-mux {
+		joy_mux_en: joy-mux-en {
+			rockchip,pins =
+				<3 RK_PC1 RK_FUNC_GPIO &pcfg_output_low>;
+		};
+
+		joy_mux_config: joy-mux-config {
+			rockchip,pins =
+				<3 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>,
+				<3 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pmic {
+		pmic_int_l: pmic-int-l {
+			rockchip,pins =
+				<0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	sdio-pwrseq {
+		wifi_enable_h: wifi-enable-h {
+			rockchip,pins =
+				<4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	sdmmc {
+		sdmmc_pwren_l: sdmmc-pwren-l {
+			rockchip,pins =
+				<0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	touch {
+		touch0_rst: touch0-rst {
+			rockchip,pins =
+				<0 RK_PB5 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		touch0_irq: touch0-irq {
+			rockchip,pins =
+				<0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		touch1_rst: touch1-rst {
+			rockchip,pins =
+				<0 RK_PB7 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		touch1_irq: touch1-irq {
+			rockchip,pins =
+				<0 RK_PC0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	vcc-lcd {
+		vdd_lcd0_h: vdd-lcd0-h {
+			rockchip,pins =
+				<0 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		vccio_lcd0_h: vccio-lcd0-h {
+			rockchip,pins =
+				<0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		vdd_lcd1_h: vdd-lcd1-h {
+			rockchip,pins =
+				<0 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		vccio_lcd1_h: vccio-lcd1-h {
+			rockchip,pins =
+				<0 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	vcc-wifi {
+		vcc_wifi_h: vcc-wifi-h {
+			rockchip,pins =
+				<0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wifi-irq {
+		wifi_host_wake_irq: wifi-host-wake-irq {
+			rockchip,pins =
+				<4 RK_PA1 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+};
+
+&pmu_io_domains {
+	status = "okay";
+	pmuio1-supply = <&vcc3v3_pmu>;
+	pmuio2-supply = <&vcc3v3_pmu>;
+	vccio1-supply = <&vccio_acodec>;
+	vccio3-supply = <&vccio_sd>;
+	vccio4-supply = <&vcc_3v3>;
+	vccio5-supply = <&vcc_3v3>;
+	vccio6-supply = <&vcc_1v8>;
+	vccio7-supply = <&vcc_3v3>;
+};
+
+&pwm5 {
+	pinctrl-0 = <&pwm5_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm6 {
+	pinctrl-0 = <&pwm6_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm7 {
+	pinctrl-0 = <&pwm7_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm12 {
+	pinctrl-0 = <&pwm12m1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm13 {
+	pinctrl-0 = <&pwm13m1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm14 {
+	pinctrl-0 = <&pwm14m0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sdhci {
+	bus-width = <8>;
+	max-frequency = <200000000>;
+	no-sd;
+	no-sdio;
+	non-removable;
+	pinctrl-0 = <&emmc_bus8 &emmc_clk &emmc_cmd &emmc_datastrobe &emmc_rstnout>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sdmmc0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	pinctrl-0 = <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det>;
+	pinctrl-names = "default";
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc3v3_sd>;
+	vqmmc-supply = <&vccio_sd>;
+	status = "okay";
+};
+
+&sdmmc2 {
+	#address-cells = <1>;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	max-frequency = <100000000>;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	non-removable;
+	pinctrl-0 = <&sdmmc2m0_bus4 &sdmmc2m0_clk &sdmmc2m0_cmd>;
+	pinctrl-names = "default";
+	sd-uhs-sdr104;
+	#size-cells = <0>;
+	vmmc-supply = <&vcc_wifi>;
+	status = "okay";
+
+	sdio_wifi: wifi@1 {
+		reg = <1>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PA1 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "host-wake";
+		pinctrl-0 = <&wifi_host_wake_irq>;
+		pinctrl-names = "default";
+	};
+};
+
+&tsadc {
+	rockchip,hw-tshut-mode = <0>;
+	rockchip,hw-tshut-polarity = <0>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-0 = <&uart1m1_xfer &uart1m1_ctsn &uart1m1_rtsn>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "realtek,rtl8821cs-bt", "realtek,rtl8723bs-bt";
+		device-wake-gpios = <&gpio0 RK_PD3 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio0 RK_PD5 GPIO_ACTIVE_HIGH>;
+		host-wake-gpios = <&gpio0 RK_PD4 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+/* No DMA for a debug serial console. */
+&uart2 {
+	/delete-property/ dmas;
+	status = "okay";
+};
+
+&usb_host0_xhci {
+	dr_mode = "peripheral";
+	phy-names = "usb2-phy";
+	phys = <&usb2phy0_otg>;
+	maximum-speed = "high-speed";
+	status = "okay";
+};
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
+	status = "okay";
+};
+
+&usb2phy0 {
+	status = "okay";
+};
+
+&usb2phy0_otg {
+	status = "okay";
+};
+
+&usb2phy1 {
+	status = "okay";
+};
+
+&usb2phy1_otg {
+	status = "okay";
+};
+
+&vop {
+	assigned-clocks = <&cru DCLK_VOP0>, <&cru DCLK_VOP1>;
+	assigned-clock-parents = <&cru PLL_VPLL>, <&cru PLL_VPLL>;
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_dsi0: endpoint@ROCKCHIP_VOP2_EP_MIPI0 {
+		reg = <ROCKCHIP_VOP2_EP_MIPI0>;
+		remote-endpoint = <&dsi0_in_vp0>;
+	};
+};
+
+&vp1 {
+	vp1_out_dsi1: endpoint@ROCKCHIP_VOP2_EP_MIPI1 {
+		reg = <ROCKCHIP_VOP2_EP_MIPI1>;
+		remote-endpoint = <&dsi1_in_vp1>;
+	};
+};
-- 
2.43.0

