Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E444A402A
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 11:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93EC10E7D6;
	Mon, 31 Jan 2022 10:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C6910E732
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 10:29:08 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1nETvR-0008WH-Oh; Mon, 31 Jan 2022 11:28:45 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ore@pengutronix.de>)
 id 1nETvO-008CcJ-Fp; Mon, 31 Jan 2022 11:28:42 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 4/5] ARM: dts: imx6dl: plym2m, prtvt7,
 victgo: make use of new resistive-adc-touch driver
Date: Mon, 31 Jan 2022 11:28:40 +0100
Message-Id: <20220131102841.1955032-5-o.rempel@pengutronix.de>
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

The tsc2046 is an ADC used as touchscreen controller. To share as mach
code as possible, we should use it as actual ADC + virtual touchscreen
controller.
With this patch we make use of the new kernel IIO and HID infrastructure.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/arm/boot/dts/imx6dl-plym2m.dts | 59 +++++++++++++++++++++--------
 arch/arm/boot/dts/imx6dl-prtvt7.dts | 57 +++++++++++++++++++++-------
 arch/arm/boot/dts/imx6dl-victgo.dts | 59 ++++++++++++++++++++++-------
 3 files changed, 132 insertions(+), 43 deletions(-)

diff --git a/arch/arm/boot/dts/imx6dl-plym2m.dts b/arch/arm/boot/dts/imx6dl-plym2m.dts
index 60fe5f14666e..73c7622bfe0f 100644
--- a/arch/arm/boot/dts/imx6dl-plym2m.dts
+++ b/arch/arm/boot/dts/imx6dl-plym2m.dts
@@ -101,6 +101,18 @@ reg_12v0: regulator-12v0 {
 		regulator-min-microvolt = <12000000>;
 		regulator-max-microvolt = <12000000>;
 	};
+
+	touchscreen {
+		compatible = "resistive-adc-touch";
+		io-channels = <&adc_ts 1>, <&adc_ts 3>, <&adc_ts 4>,
+                              <&adc_ts 5>;
+		io-channel-names = "y", "z1", "z2", "x";
+		touchscreen-min-pressure = <64687>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		touchscreen-x-plate-ohms = <300>;
+		touchscreen-y-plate-ohms = <800>;
+	};
 };
 
 &can1 {
@@ -129,26 +141,41 @@ &ecspi2 {
 	pinctrl-0 = <&pinctrl_ecspi2>;
 	status = "okay";
 
-	touchscreen@0 {
-		compatible = "ti,tsc2046";
+	adc_ts: adc@0 {
+		compatible = "ti,tsc2046e-adc";
 		reg = <0>;
 		pinctrl-0 = <&pinctrl_tsc2046>;
 		pinctrl-names ="default";
-		spi-max-frequency = <100000>;
-		interrupts-extended = <&gpio3 20 IRQ_TYPE_EDGE_FALLING>;
-		pendown-gpio = <&gpio3 20 GPIO_ACTIVE_LOW>;
+		spi-max-frequency = <1000000>;
+		interrupts-extended = <&gpio3 20 IRQ_TYPE_LEVEL_LOW>;
+		#io-channel-cells = <1>;
 
-		touchscreen-inverted-x;
-		touchscreen-inverted-y;
-		touchscreen-max-pressure = <4095>;
-
-		ti,vref-delay-usecs = /bits/ 16 <100>;
-		ti,x-plate-ohms = /bits/ 16 <800>;
-		ti,y-plate-ohms = /bits/ 16 <300>;
-		ti,debounce-max = /bits/ 16 <3>;
-		ti,debounce-tol = /bits/ 16 <70>;
-		ti,debounce-rep = /bits/ 16 <3>;
-		wakeup-source;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		channel@1 {
+			reg = <1>;
+			settling-time-us = <700>;
+			oversampling-ratio = <5>;
+		};
+
+		channel@3 {
+			reg = <3>;
+			settling-time-us = <700>;
+			oversampling-ratio = <5>;
+		};
+
+		channel@4 {
+			reg = <4>;
+			settling-time-us = <700>;
+			oversampling-ratio = <5>;
+		};
+
+		channel@5 {
+			reg = <5>;
+			settling-time-us = <700>;
+			oversampling-ratio = <5>;
+		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/imx6dl-prtvt7.dts b/arch/arm/boot/dts/imx6dl-prtvt7.dts
index baaa6ffc4df9..59e0674420a1 100644
--- a/arch/arm/boot/dts/imx6dl-prtvt7.dts
+++ b/arch/arm/boot/dts/imx6dl-prtvt7.dts
@@ -235,6 +235,18 @@ simple-audio-card,codec {
 			frame-master;
 		};
 	};
+
+	touchscreen {
+		compatible = "resistive-adc-touch";
+		io-channels = <&adc_ts 1>, <&adc_ts 3>, <&adc_ts 4>,
+                              <&adc_ts 5>;
+		io-channel-names = "y", "z1", "z2", "x";
+		touchscreen-min-pressure = <64687>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		touchscreen-x-plate-ohms = <300>;
+		touchscreen-y-plate-ohms = <800>;
+	};
 };
 
 &audmux {
@@ -277,22 +289,41 @@ &ecspi2 {
 	pinctrl-0 = <&pinctrl_ecspi2>;
 	status = "okay";
 
-	touchscreen@0 {
-		compatible = "ti,tsc2046";
+	adc_ts: adc@0 {
+		compatible = "ti,tsc2046e-adc";
 		reg = <0>;
 		pinctrl-0 = <&pinctrl_tsc>;
 		pinctrl-names ="default";
-		spi-max-frequency = <100000>;
-		interrupts-extended = <&gpio3 20 IRQ_TYPE_EDGE_FALLING>;
-		pendown-gpio = <&gpio3 20 GPIO_ACTIVE_LOW>;
-		touchscreen-max-pressure = <4095>;
-		ti,vref-delay-usecs = /bits/ 16 <100>;
-		ti,x-plate-ohms = /bits/ 16 <800>;
-		ti,y-plate-ohms = /bits/ 16 <300>;
-		ti,debounce-max = /bits/ 16 <3>;
-		ti,debounce-tol = /bits/ 16 <70>;
-		ti,debounce-rep = /bits/ 16 <3>;
-		wakeup-source;
+		spi-max-frequency = <1000000>;
+		interrupts-extended = <&gpio3 20 IRQ_TYPE_LEVEL_LOW>;
+		#io-channel-cells = <1>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		channel@1 {
+			reg = <1>;
+			settling-time-us = <700>;
+			oversampling-ratio = <5>;
+		};
+
+		channel@3 {
+			reg = <3>;
+			settling-time-us = <700>;
+			oversampling-ratio = <5>;
+		};
+
+		channel@4 {
+			reg = <4>;
+			settling-time-us = <700>;
+			oversampling-ratio = <5>;
+		};
+
+		channel@5 {
+			reg = <5>;
+			settling-time-us = <700>;
+			oversampling-ratio = <5>;
+		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/imx6dl-victgo.dts b/arch/arm/boot/dts/imx6dl-victgo.dts
index d37ba4ed847d..52de091ea452 100644
--- a/arch/arm/boot/dts/imx6dl-victgo.dts
+++ b/arch/arm/boot/dts/imx6dl-victgo.dts
@@ -181,6 +181,18 @@ simple-audio-card,codec {
 			frame-master;
 		};
 	};
+
+	touchscreen {
+		compatible = "resistive-adc-touch";
+		io-channels = <&adc_ts 1>, <&adc_ts 3>, <&adc_ts 4>,
+                              <&adc_ts 5>;
+		io-channel-names = "y", "z1", "z2", "x";
+		touchscreen-min-pressure = <64687>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		touchscreen-x-plate-ohms = <300>;
+		touchscreen-y-plate-ohms = <800>;
+	};
 };
 
 &audmux {
@@ -244,22 +256,41 @@ &ecspi2 {
 	pinctrl-0 = <&pinctrl_ecspi2>;
 	status = "okay";
 
-	touchscreen@0 {
-		compatible = "ti,tsc2046";
+	adc_ts: adc@0 {
+		compatible = "ti,tsc2046e-adc";
 		reg = <0>;
-		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_touchscreen>;
-		spi-max-frequency = <200000>;
-		interrupts-extended = <&gpio5 8 IRQ_TYPE_EDGE_FALLING>;
-		pendown-gpio = <&gpio5 8 GPIO_ACTIVE_LOW>;
-		touchscreen-size-x = <800>;
-		touchscreen-size-y = <480>;
-		touchscreen-inverted-y;
-		touchscreen-max-pressure = <4095>;
-		ti,vref-delay-usecs = /bits/ 16 <100>;
-		ti,x-plate-ohms = /bits/ 16 <800>;
-		ti,y-plate-ohms = /bits/ 16 <300>;
-		wakeup-source;
+		pinctrl-names ="default";
+		spi-max-frequency = <1000000>;
+		interrupts-extended = <&gpio5 8 IRQ_TYPE_LEVEL_LOW>;
+		#io-channel-cells = <1>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		channel@1 {
+			reg = <1>;
+			settling-time-us = <700>;
+			oversampling-ratio = <5>;
+		};
+
+		channel@3 {
+			reg = <3>;
+			settling-time-us = <700>;
+			oversampling-ratio = <5>;
+		};
+
+		channel@4 {
+			reg = <4>;
+			settling-time-us = <700>;
+			oversampling-ratio = <5>;
+		};
+
+		channel@5 {
+			reg = <5>;
+			settling-time-us = <700>;
+			oversampling-ratio = <5>;
+		};
 	};
 };
 
-- 
2.30.2

