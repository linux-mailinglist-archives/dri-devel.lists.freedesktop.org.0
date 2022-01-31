Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE9C4A4028
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 11:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C0F10E7BC;
	Mon, 31 Jan 2022 10:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D94B10E7BC
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 10:29:08 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1nETvR-0008WI-Oj; Mon, 31 Jan 2022 11:28:45 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ore@pengutronix.de>)
 id 1nETvO-008CcS-H4; Mon, 31 Jan 2022 11:28:42 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 5/5] ARM: dts: imx6dl: plym2m, prtvt7,
 victgo: add thermal zones and hwmon
Date: Mon, 31 Jan 2022 11:28:41 +0100
Message-Id: <20220131102841.1955032-6-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220131102841.1955032-1-o.rempel@pengutronix.de>
References: <20220131102841.1955032-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, Robin van der Gracht <robin@protonic.nl>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Jander <david@protonic.nl>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add thermal zones and hwmon connected to the ADC-touchscreen controller.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/arm/boot/dts/imx6dl-plym2m.dts | 74 ++++++++++++++++++++++++++++-
 arch/arm/boot/dts/imx6dl-prtvt7.dts | 57 ++++++++++++++++++++++
 arch/arm/boot/dts/imx6dl-victgo.dts | 62 +++++++++++++++++++++++-
 3 files changed, 191 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6dl-plym2m.dts b/arch/arm/boot/dts/imx6dl-plym2m.dts
index 73c7622bfe0f..c4ce23d8ac9f 100644
--- a/arch/arm/boot/dts/imx6dl-plym2m.dts
+++ b/arch/arm/boot/dts/imx6dl-plym2m.dts
@@ -50,6 +50,11 @@ display_out: endpoint {
 		};
 	};
 
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&vdiv_vaccu>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -102,6 +107,26 @@ reg_12v0: regulator-12v0 {
 		regulator-max-microvolt = <12000000>;
 	};
 
+	thermal-zones {
+		chassis-thermal {
+			polling-delay = <20000>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&tsens0>;
+		};
+
+		touch-thermal0 {
+			polling-delay = <20000>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&touch_temp0>;
+		};
+
+		touch-thermal1 {
+			polling-delay = <20000>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&touch_temp1>;
+		};
+	};
+
 	touchscreen {
 		compatible = "resistive-adc-touch";
 		io-channels = <&adc_ts 1>, <&adc_ts 3>, <&adc_ts 4>,
@@ -113,6 +138,32 @@ touchscreen {
 		touchscreen-x-plate-ohms = <300>;
 		touchscreen-y-plate-ohms = <800>;
 	};
+
+	touch_temp0: touch-temperature-sensor0 {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&adc_ts 0>;
+		io-channel-names = "sensor-channel";
+		temperature-lookup-table = <    (-40000) 736
+						85000 474>;
+	};
+
+	touch_temp1: touch-temperature-sensor1 {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&adc_ts 7>;
+		io-channel-names = "sensor-channel";
+		temperature-lookup-table = <    (-40000) 826
+						85000 609>;
+	};
+
+	vdiv_vaccu: voltage-divider-vaccu {
+		compatible = "voltage-divider";
+		io-channels = <&adc_ts 2>;
+		output-ohms = <2500>;
+		full-ohms = <64000>;
+		#io-channel-cells = <0>;
+	};
 };
 
 &can1 {
@@ -153,12 +204,24 @@ adc_ts: adc@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		channel@0 {
+			reg = <0>;
+			settling-time-us = <300>;
+			oversampling-ratio = <5>;
+		};
+
 		channel@1 {
 			reg = <1>;
 			settling-time-us = <700>;
 			oversampling-ratio = <5>;
 		};
 
+		channel@2 {
+			reg = <2>;
+			settling-time-us = <300>;
+			oversampling-ratio = <5>;
+		};
+
 		channel@3 {
 			reg = <3>;
 			settling-time-us = <700>;
@@ -176,6 +239,14 @@ channel@5 {
 			settling-time-us = <700>;
 			oversampling-ratio = <5>;
 		};
+
+		/* channel 6 is not connected */
+
+		channel@7 {
+			reg = <7>;
+			settling-time-us = <300>;
+			oversampling-ratio = <5>;
+		};
 	};
 };
 
@@ -260,9 +331,10 @@ &i2c3 {
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
 
-	temperature-sensor@70 {
+	tsens0: temperature-sensor@70 {
 		compatible = "ti,tmp103";
 		reg = <0x70>;
+		#thermal-sensor-cells = <0>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/imx6dl-prtvt7.dts b/arch/arm/boot/dts/imx6dl-prtvt7.dts
index 59e0674420a1..b86deebef7b7 100644
--- a/arch/arm/boot/dts/imx6dl-prtvt7.dts
+++ b/arch/arm/boot/dts/imx6dl-prtvt7.dts
@@ -53,6 +53,11 @@ display_out: endpoint {
 		};
 	};
 
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&vdiv_vaccu>;
+	};
+
 	keys {
 		compatible = "gpio-keys";
 		autorepeat;
@@ -236,6 +241,26 @@ simple-audio-card,codec {
 		};
 	};
 
+	thermal-zones {
+		chassis-thermal {
+			polling-delay = <20000>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&tsens0>;
+		};
+
+		touch-thermal0 {
+			polling-delay = <20000>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&touch_temp0>;
+		};
+
+		touch-thermal1 {
+			polling-delay = <20000>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&touch_temp1>;
+		};
+	};
+
 	touchscreen {
 		compatible = "resistive-adc-touch";
 		io-channels = <&adc_ts 1>, <&adc_ts 3>, <&adc_ts 4>,
@@ -247,6 +272,32 @@ touchscreen {
 		touchscreen-x-plate-ohms = <300>;
 		touchscreen-y-plate-ohms = <800>;
 	};
+
+	touch_temp0: touch-temperature-sensor0 {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&adc_ts 0>;
+		io-channel-names = "sensor-channel";
+		temperature-lookup-table = <    (-40000) 736
+						85000 474>;
+	};
+
+	touch_temp1: touch-temperature-sensor1 {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&adc_ts 7>;
+		io-channel-names = "sensor-channel";
+		temperature-lookup-table = <    (-40000) 826
+						85000 609>;
+	};
+
+	vdiv_vaccu: voltage-divider-vaccu {
+		compatible = "voltage-divider";
+		io-channels = <&adc_ts 2>;
+		output-ohms = <2500>;
+		full-ohms = <64000>;
+		#io-channel-cells = <0>;
+	};
 };
 
 &audmux {
@@ -372,6 +423,12 @@ rtc@51 {
 		reg = <0x51>;
 	};
 
+	tsens0: temperature-sensor@70 {
+		compatible = "ti,tmp103";
+		reg = <0x70>;
+		#thermal-sensor-cells = <0>;
+	};
+
 	gpio_pca: gpio@74 {
 		compatible = "nxp,pca9539";
 		reg = <0x74>;
diff --git a/arch/arm/boot/dts/imx6dl-victgo.dts b/arch/arm/boot/dts/imx6dl-victgo.dts
index 52de091ea452..227c952543d4 100644
--- a/arch/arm/boot/dts/imx6dl-victgo.dts
+++ b/arch/arm/boot/dts/imx6dl-victgo.dts
@@ -66,6 +66,11 @@ enter {
 		};
 	};
 
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&vdiv_vaccu>, <&vdiv_hitch_pos>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -182,6 +187,26 @@ simple-audio-card,codec {
 		};
 	};
 
+	thermal-zones {
+		chassis-thermal {
+			polling-delay = <20000>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&tsens0>;
+		};
+
+		touch-thermal0 {
+			polling-delay = <20000>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&touch_temp0>;
+		};
+
+		touch-thermal1 {
+			polling-delay = <20000>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&touch_temp1>;
+		};
+	};
+
 	touchscreen {
 		compatible = "resistive-adc-touch";
 		io-channels = <&adc_ts 1>, <&adc_ts 3>, <&adc_ts 4>,
@@ -193,6 +218,40 @@ touchscreen {
 		touchscreen-x-plate-ohms = <300>;
 		touchscreen-y-plate-ohms = <800>;
 	};
+
+	touch_temp0: touch-temperature-sensor0 {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&adc_ts 0>;
+		io-channel-names = "sensor-channel";
+		temperature-lookup-table = <    (-40000) 736
+						85000 474>;
+	};
+
+	touch_temp1: touch-temperature-sensor1 {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&adc_ts 7>;
+		io-channel-names = "sensor-channel";
+		temperature-lookup-table = <    (-40000) 826
+						85000 609>;
+	};
+
+	vdiv_vaccu: voltage-divider-vaccu {
+		compatible = "voltage-divider";
+		io-channels = <&adc_ts 2>;
+		output-ohms = <2500>;
+		full-ohms = <64000>;
+		#io-channel-cells = <0>;
+	};
+
+	vdiv_hitch_pos: voltage-divider-hitch-pos {
+		compatible = "voltage-divider";
+		io-channels = <&adc_ts 6>;
+		output-ohms = <3300>;
+		full-ohms = <13300>;
+		#io-channel-cells = <0>;
+	};
 };
 
 &audmux {
@@ -477,9 +536,10 @@ rtc@51 {
 		reg = <0x51>;
 	};
 
-	temperature-sensor@70 {
+	tsens0: temperature-sensor@70 {
 		compatible = "ti,tmp103";
 		reg = <0x70>;
+		#thermal-sensor-cells = <0>;
 	};
 };
 
-- 
2.30.2

