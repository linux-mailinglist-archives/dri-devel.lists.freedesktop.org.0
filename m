Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5C44A402B
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 11:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0FC10E7DD;
	Mon, 31 Jan 2022 10:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E309F10E7DD
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 10:29:15 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1nETvR-0008WE-Oi; Mon, 31 Jan 2022 11:28:45 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ore@pengutronix.de>)
 id 1nETvO-008Cbr-CS; Mon, 31 Jan 2022 11:28:42 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/5] ARM: dts: imx6dl-prtvt7: Add display and panel nodes
Date: Mon, 31 Jan 2022 11:28:37 +0100
Message-Id: <20220131102841.1955032-2-o.rempel@pengutronix.de>
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

Add Innolux G070Y2-T02 panel to the Protonic VT7 board.

Signed-off-by: Robin van der Gracht <robin@protonic.nl>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/arm/boot/dts/imx6dl-prtvt7.dts | 47 +++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl-prtvt7.dts b/arch/arm/boot/dts/imx6dl-prtvt7.dts
index 190d26642bc8..be7c4cb339e7 100644
--- a/arch/arm/boot/dts/imx6dl-prtvt7.dts
+++ b/arch/arm/boot/dts/imx6dl-prtvt7.dts
@@ -28,6 +28,30 @@ backlight_lcd: backlight-lcd {
 		power-supply = <&reg_bl_12v0>;
 	};
 
+	display {
+		compatible = "fsl,imx-parallel-display";
+		pinctrl-0 = <&pinctrl_ipu1_disp>;
+		pinctrl-names = "default";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			display_in: endpoint {
+				remote-endpoint = <&ipu1_di0_disp0>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			display_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+
 	keys {
 		compatible = "gpio-keys";
 		autorepeat;
@@ -135,6 +159,18 @@ led-debug0 {
 		};
 	};
 
+	panel {
+		compatible = "innolux,g070y2-t02";
+		backlight = <&backlight_lcd>;
+		power-supply = <&reg_3v3>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&display_out>;
+			};
+		};
+	};
+
 	reg_bl_12v0: regulator-bl-12v0 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -146,6 +182,13 @@ reg_bl_12v0: regulator-bl-12v0 {
 		enable-active-high;
 	};
 
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	reg_1v8: regulator-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "1v8";
@@ -275,6 +318,10 @@ &ipu1 {
 	status = "okay";
 };
 
+&ipu1_di0_disp0 {
+	remote-endpoint = <&display_in>;
+};
+
 &pwm1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm1>;
-- 
2.30.2

