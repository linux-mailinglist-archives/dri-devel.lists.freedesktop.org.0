Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8F81CD24C
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048C06E212;
	Mon, 11 May 2020 07:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 526 seconds by postgrey-1.36 at gabe;
 Sat, 09 May 2020 11:27:01 UTC
Received: from pruto.48.io (48.io [37.205.10.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB8B6E33C
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 11:27:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by pruto.48.io (Postfix) with ESMTPSA id AA1599167A;
 Sat,  9 May 2020 13:19:16 +0200 (CEST)
DMARC-Filter: OpenDMARC Filter v1.3.2 pruto.48.io AA1599167A
Authentication-Results: pruto.48.io;
 dmarc=none (p=none dis=none) header.from=48.io
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=48.io; s=default;
 t=1589023156; bh=PD4G1VYzdYofQB3xLNm3Mdoe2zymwjMy9UKjQHmAphY=;
 h=From:To:Cc:Subject:Date;
 b=xCPj/SzfAgpQ7IypVAykco6zMAZCdBHNDnx0EZZVwCVNE0rD7DTCIvdg2WMCzlguZ
 /YJsGK5UjY2YgVkdKKqaETxN6QUVMqT4fEpqzLSJOnTvAv665NvGtTNnhO8iBfj9yn
 DyWBwnzwYYaMrYGmC84w+ADoSyoR0D7a0sNUK4r8=
From: srk@48.io
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/1] ARM: dts: novena: Add LVDS-to-eDP bridge bindings
Date: Sat,  9 May 2020 13:19:07 +0200
Message-Id: <20200509111907.26685-1-srk@48.io>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:28 +0000
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Richard Marko <srk@48.io>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Marek Vasut <marex@denx.de>

Add bindings for the LVDS-to-eDP bridge chip, IT6251, which is
used to connect the standard 1920x1080 panel on Novena laptop.

Tested on a Kosagi Novena laptop with imx6 display controller.

Based on v5.7-rc2, applies to drm-misc-next 5e6ed29d72d2

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Richard Marko <srk@48.io>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
---
 arch/arm/boot/dts/imx6q-novena.dts | 57 +++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6q-novena.dts b/arch/arm/boot/dts/imx6q-novena.dts
index 69f170ff31c5..803a97e04dc4 100644
--- a/arch/arm/boot/dts/imx6q-novena.dts
+++ b/arch/arm/boot/dts/imx6q-novena.dts
@@ -109,6 +109,12 @@ heartbeat {
 	panel: panel {
 		compatible = "innolux,n133hse-ea1";
 		backlight = <&backlight>;
+
+		port {
+			panel_in_edp0: endpoint {
+				remote-endpoint = <&bridge_out_edp0>;
+			};
+		};
 	};
 
 	reg_2p5v: regulator-2p5v {
@@ -146,6 +152,7 @@ reg_display: regulator-display {
 		startup-delay-us = <200000>;
 		gpio = <&gpio5 28 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		regulator-always-on;
 	};
 
 	reg_lvds_lcd: regulator-lvds-lcd {
@@ -155,6 +162,7 @@ reg_lvds_lcd: regulator-lvds-lcd {
 		regulator-max-microvolt = <3300000>;
 		gpio = <&gpio4 15 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		regulator-always-on;
 	};
 
 	reg_pcie: regulator-pcie {
@@ -212,6 +220,17 @@ &audmux {
 	status = "okay";
 };
 
+&clks {
+	assigned-clocks = <&clks IMX6QDL_CLK_LDB_DI0_SEL>,
+			  <&clks IMX6QDL_CLK_LDB_DI1_SEL>,
+			  <&clks IMX6QDL_CLK_IPU1_DI0_PRE_SEL>,
+			  <&clks IMX6QDL_CLK_IPU2_DI0_PRE_SEL>;
+	assigned-clock-parents = <&clks IMX6QDL_CLK_PLL5_VIDEO_DIV>,
+				 <&clks IMX6QDL_CLK_PLL5_VIDEO_DIV>,
+				 <&clks IMX6QDL_CLK_PLL2_PFD2_396M>,
+				 <&clks IMX6QDL_CLK_PLL2_PFD2_396M>;
+};
+
 &ecspi3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi3_novena>;
@@ -423,6 +442,29 @@ codec: es8328@11 {
 					 <&clks IMX6QDL_CLK_CKO1_PODF>;
 		assigned-clock-rates = <0 0 722534400 22579200>;
 	};
+
+	it6251@5c {
+		compatible = "ite,it6251";
+		reg = <0x5c>, <0x5e>;
+		reg-names = "bridge", "lvds";
+		power-supply = <&reg_display>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lvdsbridge_novena>;
+
+		ports {
+			port@0 {
+				bridge_out_edp0: endpoint {
+					remote-endpoint = <&panel_in_edp0>;
+				};
+			};
+
+			port@1 {
+				bridge_in_lvds0: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+		};
+	};
 };
 
 &kpp {
@@ -443,6 +485,14 @@ lvds-channel@0 {
 		fsl,data-width = <24>;
 		fsl,panel = <&panel>;
 		status = "okay";
+
+		port@4 {
+			reg = <4>;
+
+			lvds0_out: endpoint {
+				remote-endpoint = <&bridge_in_lvds0>;
+			};
+		};
 	};
 };
 
@@ -529,10 +579,15 @@ MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS		0x130b0
 		>;
 	};
 
+	pinctrl_lvdsbridge_novena: lvdsbridgegrp-novena {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT10__GPIO5_IO28	0x1b0b1
+		>;
+	};
+
 	pinctrl_backlight_novena: backlightgrp-novena {
 		fsl,pins = <
 			MX6QDL_PAD_DISP0_DAT8__PWM1_OUT		0x1b0b0
-			MX6QDL_PAD_CSI0_DAT10__GPIO5_IO28	0x1b0b1
 			MX6QDL_PAD_KEY_ROW4__GPIO4_IO15		0x1b0b1
 		>;
 	};
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
