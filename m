Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B624B2725
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 14:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8F710EC27;
	Fri, 11 Feb 2022 13:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED0210EC26
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 13:30:58 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1nIW0V-0005x0-IV; Fri, 11 Feb 2022 14:30:39 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ore@pengutronix.de>)
 id 1nIW0T-009juX-5m; Fri, 11 Feb 2022 14:30:37 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 3/5] ARM: dts: imx6qdl-vicut1: add CAN termination support
Date: Fri, 11 Feb 2022 14:30:33 +0100
Message-Id: <20220211133035.2321330-4-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220211133035.2321330-1-o.rempel@pengutronix.de>
References: <20220211133035.2321330-1-o.rempel@pengutronix.de>
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

The gpio1 0 pin is controlling CAN termination, not USB H1 VBUS. So,
remove wrong regulator and assign this gpio to new DT CAN termnation
property.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/arm/boot/dts/imx6qdl-vicut1.dtsi | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-vicut1.dtsi b/arch/arm/boot/dts/imx6qdl-vicut1.dtsi
index b9e305774fed..1ac7e13249d2 100644
--- a/arch/arm/boot/dts/imx6qdl-vicut1.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-vicut1.dtsi
@@ -126,15 +126,6 @@ reg_3v3: regulator-3v3 {
 		regulator-max-microvolt = <3300000>;
 	};
 
-	reg_h1_vbus: regulator-h1-vbus {
-		compatible = "regulator-fixed";
-		regulator-name = "h1-vbus";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
 	reg_otg_vbus: regulator-otg-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "otg-vbus";
@@ -212,6 +203,8 @@ IMX_AUDMUX_V2_PTCR_SYN		IMX_AUDMUX_V2_PDCR_RXDSEL(0)
 &can1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_can1>;
+	termination-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
+	termination-ohms = <150>;
 	status = "okay";
 };
 
@@ -492,7 +485,6 @@ &uart5 {
 };
 
 &usbh1 {
-	vbus-supply = <&reg_h1_vbus>;
 	pinctrl-names = "default";
 	phy_type = "utmi";
 	dr_mode = "host";
-- 
2.30.2

