Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15085211CE6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AC06EA5D;
	Thu,  2 Jul 2020 07:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA32E6E957
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 16:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1593620976; bh=LENCEp5fH5Lf53MpYepSnIefkapyPUTQ0yif1AiTbd0=;
 h=From:To:Cc:Subject:Date:References:From;
 b=U1P9b/F4I5y7fn+SKKcMnjcsKU/BY/Yfkq0whrvyk9FiPV3KNRss1Zdxa3/OamRAq
 GGda854xNg3yVg5Zu6mMby89Uberb3H2641gmUQ2QN883ouiKzfGywi0X29wwfnFyu
 oW4uW/Vn0LJYVgNiNSoxRWyu58zme4AN7yn6iiM4=
From: Ondrej Jirman <megous@megous.com>
To: linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v7 12/13] arm64: dts: sun50i-a64-pinephone: Enable LCD support
 on PinePhone
Date: Wed,  1 Jul 2020 18:29:27 +0200
Message-Id: <20200701162928.1638874-13-megous@megous.com>
In-Reply-To: <20200701162928.1638874-1-megous@megous.com>
References: <20200701162928.1638874-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Bhushan Shah <bshah@kde.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca@z3ntu.xyz>, Martijn Braam <martijn@brixit.nl>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Icenowy Zheng <icenowy@aosc.io>

PinePhone uses PWM backlight and a XBD599 LCD panel over DSI for
display.

Backlight levels curve was optimized by Martijn Braam using a
lux meter.

Add its device nodes.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Martijn Braam <martijn@brixit.nl>
Signed-off-by: Ondrej Jirman <megous@megous.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../allwinner/sun50i-a64-pinephone-1.1.dts    | 19 ++++++++++
 .../dts/allwinner/sun50i-a64-pinephone.dtsi   | 35 +++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts
index 06a775c41664..3e99a87e9ce5 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts
@@ -9,3 +9,22 @@ / {
 	model = "Pine64 PinePhone Braveheart (1.1)";
 	compatible = "pine64,pinephone-1.1", "allwinner,sun50i-a64";
 };
+
+&backlight {
+	power-supply = <&reg_ldo_io0>;
+	/*
+	 * PWM backlight circuit on this PinePhone revision was changed since
+	 * 1.0, and the lowest PWM duty cycle that doesn't lead to backlight
+	 * being off is around 20%. Duty cycle for the lowest brightness level
+	 * also varries quite a bit between individual boards, so the lowest
+	 * value here was chosen as a safe default.
+	 */
+	brightness-levels = <
+		774  793  814  842
+		882  935  1003 1088
+		1192 1316 1462 1633
+		1830 2054 2309 2596
+		2916 3271 3664 4096>;
+	num-interpolated-steps = <50>;
+	default-brightness-level = <400>;
+};
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
index cefda145c3c9..85a7aa5efd32 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
@@ -16,6 +16,13 @@ aliases {
 		serial0 = &uart0;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&r_pwm 0 50000 PWM_POLARITY_INVERTED>;
+		enable-gpios = <&pio 7 10 GPIO_ACTIVE_HIGH>; /* PH10 */
+		/* Backlight configuration differs per PinePhone revision. */
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -84,6 +91,30 @@ &dai {
 	status = "okay";
 };
 
+&de {
+	status = "okay";
+};
+
+&dphy {
+	status = "okay";
+};
+
+&dsi {
+	vcc-dsi-supply = <&reg_dldo1>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "xingbangda,xbd599";
+		reg = <0>;
+		reset-gpios = <&pio 3 23 GPIO_ACTIVE_LOW>; /* PD23 */
+		iovcc-supply = <&reg_dldo2>;
+		vcc-supply = <&reg_ldo_io0>;
+		backlight = <&backlight>;
+	};
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -188,6 +219,10 @@ &r_pio {
 	 */
 };
 
+&r_pwm {
+	status = "okay";
+};
+
 &r_rsb {
 	status = "okay";
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
