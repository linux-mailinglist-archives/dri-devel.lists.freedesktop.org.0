Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1719245D57
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE766E500;
	Mon, 17 Aug 2020 07:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E7F96E212
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 14:00:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.76,308,1592838000"; d="scan'208";a="54305209"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 13 Aug 2020 23:00:45 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0634B4004CF4;
 Thu, 13 Aug 2020 23:00:42 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2] ARM: dts: r8a7742-iwg21d-q7: Add LCD support
Date: Thu, 13 Aug 2020 15:00:41 +0100
Message-Id: <20200813140041.5082-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The iwg21d comes with a 7" capacitive touch screen, therefore
add support for it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
v1->v2
* This patch is part of series [1] (rest of the patches have be accepted
  by Geert [2]).
* Added regulator for lvds
* Added reset pin for touchpanel
* This patch is based on series [3]

[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/
    ?series=330277
[2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
    renesas-devel.git/log/?h=renesas-arm-dt-for-v5.10
[3] https://patchwork.kernel.org/project/linux-renesas-soc/list/
    ?series=330957
---
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 99 +++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
index b3461a61a4bf..9bf4fbd9c736 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
@@ -30,6 +30,7 @@
 
 /dts-v1/;
 #include "r8a7742-iwg21m.dtsi"
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "iWave Systems RainboW-G21D-Qseven board based on RZ/G1H";
@@ -52,6 +53,51 @@
 		clock-frequency = <26000000>;
 	};
 
+	lcd_backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&tpu 2 5000000 0>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		pinctrl-0 = <&backlight_pins>;
+		pinctrl-names = "default";
+		default-brightness-level = <7>;
+		enable-gpios = <&gpio3 11 GPIO_ACTIVE_HIGH>;
+	};
+
+	lvds-receiver {
+		compatible = "ti,ds90cf384a", "lvds-decoder";
+		vcc-supply = <&vcc_3v3_tft1>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				lvds_receiver_in: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				lvds_receiver_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+	};
+
+	panel {
+		compatible = "edt,etm0700g0dh6";
+		backlight = <&lcd_backlight>;
+		power-supply = <&vcc_3v3_tft1>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lvds_receiver_out>;
+			};
+		};
+	};
+
 	reg_1p5v: 1p5v {
 		compatible = "regulator-fixed";
 		regulator-name = "1P5V";
@@ -75,6 +121,17 @@
 		};
 	};
 
+	vcc_3v3_tft1: regulator-panel {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vcc-3v3-tft1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		startup-delay-us = <500>;
+		gpio = <&gpio5 28 GPIO_ACTIVE_HIGH>;
+	};
+
 	vcc_sdhi2: regulator-vcc-sdhi2 {
 		compatible = "regulator-fixed";
 
@@ -129,12 +186,34 @@
 		VDDIO-supply = <&reg_3p3v>;
 		VDDD-supply = <&reg_1p5v>;
 	};
+
+	touch: touchpanel@38 {
+		compatible = "edt,edt-ft5406";
+		reg = <0x38>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
+		/* GP1_29 is also shared with audio codec reset pin */
+		reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vcc_3v3_tft1>;
+	};
 };
 
 &cmt0 {
 	status = "okay";
 };
 
+&du {
+	status = "okay";
+};
+
+&gpio0 {
+	touch-interrupt {
+		gpio-hog;
+		gpios = <24 GPIO_ACTIVE_LOW>;
+		input;
+	};
+};
+
 &hsusb {
 	pinctrl-0 = <&usb0_pins>;
 	pinctrl-names = "default";
@@ -165,6 +244,11 @@
 		function = "avb";
 	};
 
+	backlight_pins: backlight {
+		groups = "tpu0_to2";
+		function = "tpu0";
+	};
+
 	i2c2_pins: i2c2 {
 		groups = "i2c2_b";
 		function = "i2c2";
@@ -208,6 +292,17 @@
 	};
 };
 
+&lvds0 {
+	status = "okay";
+	ports {
+		port@1 {
+			lvds0_out: endpoint {
+				remote-endpoint = <&lvds_receiver_in>;
+			};
+		};
+	};
+};
+
 &rcar_sound {
 	pinctrl-0 = <&sound_pins>;
 	pinctrl-names = "default";
@@ -261,6 +356,10 @@
 	shared-pin;
 };
 
+&tpu {
+	status = "okay";
+};
+
 &usbphy {
 	status = "okay";
 };
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
