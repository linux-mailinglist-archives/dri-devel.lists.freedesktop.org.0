Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D7021E9C9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910546E925;
	Tue, 14 Jul 2020 07:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FD56E925
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 07:13:22 +0000 (UTC)
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.194.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B48F722224;
 Tue, 14 Jul 2020 07:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594710801;
 bh=LPMXYSBHUc5/3XxljcDu6A64UBHu6QfCt9odX/hhY2g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p5M5EJ3Nwu5Eq7uDgnT3rD5zedmq+5BhhvtpjGKsK7qL15GzdaukZXkIHdxI7l2XD
 LoCGLKNYPNvdSECPxg+A/mptGjd5Gi2JSQtwAV+oX12AqlS/Kfn2/qnQYIqamvOxiX
 w5C43kj9hiO97LMz5GorUMjNqOH100oezmZXZOyY=
Received: by wens.tw (Postfix, from userid 1000)
 id 1C7AA5FD4B; Tue, 14 Jul 2020 15:13:14 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 5/5] ARM: dts: sun7i: Add MSI Primo73 tablet
Date: Tue, 14 Jul 2020 15:13:05 +0800
Message-Id: <20200714071305.18492-6-wens@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714071305.18492-1-wens@kernel.org>
References: <20200714071305.18492-1-wens@kernel.org>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Siarhei Siamashka <siarhei.siamashka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chen-Yu Tsai <wens@csie.org>

The Primo73 is an MSI branded Allwinner A20-based 7-inch tablet. It has
a metal back case with a plastic insert around where the WiFi antenna is.
The tablet is (as of July of 2020) no longer available from retailers.
Kernel sources (as required by GPL) are no longer available from the
vendor, MSI. The device support page still lists the link, but it is
dead.

The tablet features a non-identifiable 1024x600 7" MIPI DPI TFT panel,
Goodix GT911-based capacitive touchscreen, 1GB DRAM, 8GB MLC NAND,
RTL8188ETV-based WiFi, an NXP MMA8452 accelerometer for orientation,
a GC2035 2 megapixel rear camera, a GC0308 0.3 megapixel front camera,
a mini-HDMI output, a micro-USB port, a headphone jack and single speaker.

The board design is believe to follow Allwinner's reference design. This
judgement is based on the fact that the I/O pins and GPIO lines used
match up with the reference design. Assumptions about the regulator tree
are based on this.

The LCD panel only has some serial number markings, and what appears to
be a part number: "OS1N71J003", which is also a prefix for one of the
serial number markings. Searching for this part number yielded no
results. As such, the color depth display timings are directly listed
in the device tree. The timing are from the FEX file recovered from the
device. The color depth was derived from the dithering setting from the
FEX file, as well as independent testing with a color gradient image.
The internal board, as well as the ribbon cable for the panel, route the
full 24 bits of color. So the 2 extra bits are dropped either by the
panel itself or somewhere within the LCD panel module casing.

Add a device tree for this tablet. Almost the whole device is supported.
The only things missing are the two cameras, which don't have device
tree bindings or driver support. The vendor for the LCD panel is left
out, since there is nothing to go with.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---

The panel-dpi binding requires a more-specific compatible string.
However given the vendor of the panel is unknown, I'm not sure what
the best course of action is here. I opted to put the part number in
without a vendor prefix.

---
 arch/arm/boot/dts/Makefile              |   1 +
 arch/arm/boot/dts/sun7i-a20-primo73.dts | 279 ++++++++++++++++++++++++
 2 files changed, 280 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun7i-a20-primo73.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index e6a1cac0bfc7..c09cda958db5 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1133,6 +1133,7 @@ dtb-$(CONFIG_MACH_SUN7I) += \
 	sun7i-a20-orangepi-mini.dtb \
 	sun7i-a20-pcduino3.dtb \
 	sun7i-a20-pcduino3-nano.dtb \
+	sun7i-a20-primo73.dtb \
 	sun7i-a20-wexler-tab7200.dtb \
 	sun7i-a20-wits-pro-a20-dkt.dtb
 dtb-$(CONFIG_MACH_SUN8I) += \
diff --git a/arch/arm/boot/dts/sun7i-a20-primo73.dts b/arch/arm/boot/dts/sun7i-a20-primo73.dts
new file mode 100644
index 000000000000..f3b1002ceb50
--- /dev/null
+++ b/arch/arm/boot/dts/sun7i-a20-primo73.dts
@@ -0,0 +1,279 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2020 Chen-Yu Tsai <wens@csie.org>
+ */
+
+/dts-v1/;
+#include "sun7i-a20.dtsi"
+#include "sunxi-common-regulators.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pwm/pwm.h>
+
+/{
+	model = "MSI Primo73 Tablet";
+	compatible = "msi,primo73", "allwinner,sun7i-a20";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 0 50000 PWM_POLARITY_INVERTED>;
+		enable-gpios = <&pio 7 7 GPIO_ACTIVE_HIGH>; /* PH7 */
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "b";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
+	panel: panel {
+		compatible = "os1n71j003", "panel-dpi";
+		backlight = <&backlight>;
+		power-supply = <&reg_vcc5v0>; /* Actually driven from IPSOUT */
+		enable-gpios = <&pio 7 8 GPIO_ACTIVE_HIGH>; /* PH8 */
+		height-mm = <86>;
+		width-mm = <155>;
+		bits-per-color = <6>;
+
+		panel-timing {
+			clock-frequency = <60000000>;
+			hactive = <1024>;
+			vactive = <600>;
+			hfront-porch = <160>;
+			hback-porch = <60>;
+			hsync-len = <100>;
+			vback-porch = <13>;
+			vfront-porch = <10>;
+			vsync-len = <10>;
+			de-active = <1>;
+			pixelclk-active = <0>;
+		};
+
+		port {
+			panel_input: endpoint {
+				remote-endpoint = <&tcon0_out_lcd>;
+			};
+		};
+	};
+};
+
+&ccu {
+	pinctrl-0 = <&csi0_clk_pin>;
+	pinctrl-names = "default";
+};
+
+&codec {
+	allwinner,pa-gpios = <&pio 7 15 GPIO_ACTIVE_HIGH>; /* PH15 */
+	status = "okay";
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&de {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+
+	axp209: pmic@34 {
+		reg = <0x34>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+#include "axp209.dtsi"
+
+&battery_power_supply {
+	status = "okay";
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	accelerometer@1c {
+		compatible = "fsl,mma8452";
+		reg = <0x1c>;
+		vdd-supply = <&reg_vcc3v0>;
+		vddio-supply = <&reg_vcc3v0>;
+		#io-channel-cells = <1>;
+	};
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		interrupt-parent = <&pio>;
+		interrupts = <7 21 IRQ_TYPE_EDGE_FALLING>; /* EINT21 (PH21) */
+		irq-gpios = <&pio 7 21 GPIO_ACTIVE_HIGH>; /* INT (PH21) */
+		reset-gpios = <&pio 1 13 GPIO_ACTIVE_HIGH>; /* RST (PB13) */
+		touchscreen-swapped-x-y; /* Match LCD panel orientation */
+	};
+};
+
+&lradc {
+	vref-supply = <&reg_vcc3v0>;
+	status = "okay";
+
+	button-200 {
+		label = "Volume Up";
+		linux,code = <KEY_VOLUMEUP>;
+		channel = <0>;
+		voltage = <200000>;
+	};
+
+	button-400 {
+		label = "Volume Down";
+		linux,code = <KEY_VOLUMEDOWN>;
+		channel = <0>;
+		voltage = <400000>;
+	};
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_vcc3v0>;
+	bus-width = <4>;
+	cd-gpios = <&pio 7 1 GPIO_ACTIVE_LOW>; /* PH1 */
+	status = "okay";
+};
+
+&otg_sram {
+	status = "okay";
+};
+
+&pio {
+	vcc-pa-supply = <&reg_vcc3v0>;
+	vcc-pc-supply = <&reg_vcc3v0>;
+	vcc-pe-supply = <&reg_ldo3>;
+	vcc-pf-supply = <&reg_vcc3v0>;
+	vcc-pg-supply = <&reg_ldo3>;
+};
+
+&pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm0_pin>;
+	status = "okay";
+};
+
+&reg_dcdc2 {
+	regulator-always-on;
+	regulator-min-microvolt = <1000000>;
+	regulator-max-microvolt = <1400000>;
+	regulator-name = "vdd-cpu";
+};
+
+&reg_dcdc3 {
+	regulator-always-on;
+	regulator-min-microvolt = <1000000>;
+	regulator-max-microvolt = <1400000>;
+	regulator-name = "vdd-int-dll";
+};
+
+&reg_ldo1 {
+	regulator-name = "vdd-rtc";
+};
+
+&reg_ldo2 {
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "avcc";
+};
+
+&reg_ldo3 {
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+	regulator-name = "csi-iovdd";
+};
+
+&reg_ldo4 {
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+	regulator-name = "csi-avdd";
+};
+
+&reg_usb0_vbus {
+	gpio = <&pio 1 9 GPIO_ACTIVE_HIGH>; /* PB09 */
+	status = "okay";
+};
+
+&reg_usb2_vbus {
+	gpio = <&pio 7 12 GPIO_ACTIVE_HIGH>; /* PH12 */
+	status = "okay";
+};
+
+&reg_vcc3v3 {
+	status = "disabled";
+};
+
+&tcon0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&lcd0_rgb888_pins>;
+};
+
+&tcon0_out {
+	tcon0_out_lcd: endpoint@0 {
+		reg = <0>;
+		remote-endpoint = <&panel_input>;
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usb_power_supply {
+	status = "okay";
+};
+
+&usbphy {
+	usb0_id_det-gpios = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
+	usb0_vbus_power-supply = <&usb_power_supply>;
+	usb0_vbus-supply = <&reg_usb0_vbus>;
+	usb2_vbus-supply = <&reg_usb2_vbus>;
+	status = "okay";
+};
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
