Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 417FB47A858
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 12:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622AC10FA51;
	Mon, 20 Dec 2021 11:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EB710EA33
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 11:07:09 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1mzGVH-0004xG-7k; Mon, 20 Dec 2021 12:06:51 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1mzGVA-00EmEk-QX; Mon, 20 Dec 2021 12:06:44 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 17/22] arm64: dts: rockchip: enable vop2 and hdmi tx on
 quartz64a
Date: Mon, 20 Dec 2021 12:06:25 +0100
Message-Id: <20211220110630.3521121-18-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211220110630.3521121-1-s.hauer@pengutronix.de>
References: <20211220110630.3521121-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Riesch <michael.riesch@wolfvision.net>

Enable the RK356x Video Output Processor (VOP) 2 on the Pine64
Quartz64 Model A.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../boot/dts/rockchip/rk3566-quartz64-a.dts   | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
index 4d4b2a301b1a4..29748537cdbd0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3566.dtsi"
 
 / {
@@ -35,6 +36,17 @@ fan: gpio_fan {
 		#cooling-cells = <2>;
 	};
 
+	hdmi-con {
+		compatible = "hdmi-connector";
+		type = "c";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -205,6 +217,18 @@ &gmac1m0_clkinout
 	status = "okay";
 };
 
+&hdmi {
+	avdd-0v9-supply = <&vdda_0v9>;
+	avdd-1v8-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -546,3 +570,27 @@ bluetooth {
 &uart2 {
 	status = "okay";
 };
+
+&vop {
+	assigned-clocks = <&cru DCLK_VOP0>, <&cru DCLK_VOP1>;
+	assigned-clock-parents = <&pmucru PLL_HPLL>, <&cru PLL_VPLL>;
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&hdmi_in {
+	hdmi_in_vp0: endpoint@0 {
+		reg = <0>;
+		remote-endpoint = <&vp0_out_hdmi>;
+	};
+};
+
+&vp0 {
+	vp0_out_hdmi: endpoint@RK3568_VOP2_EP_HDMI {
+		reg = <RK3568_VOP2_EP_HDMI>;
+		remote-endpoint = <&hdmi_in_vp0>;
+	};
+};
-- 
2.30.2

