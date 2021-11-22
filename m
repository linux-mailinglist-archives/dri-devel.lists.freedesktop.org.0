Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6001458E95
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 13:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A33389FDE;
	Mon, 22 Nov 2021 12:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48CF89FA5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 12:43:34 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1mp8fD-0006T2-NM; Mon, 22 Nov 2021 13:43:15 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ore@pengutronix.de>)
 id 1mp8fB-00BjWK-20; Mon, 22 Nov 2021 13:43:13 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 2/4] ARM: dts: imx6dl-prtvt7: Add missing tvp5150 video
 decoder node
Date: Mon, 22 Nov 2021 13:43:08 +0100
Message-Id: <20211122124310.2796505-2-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211122124310.2796505-1-o.rempel@pengutronix.de>
References: <20211122124310.2796505-1-o.rempel@pengutronix.de>
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
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Jander <david@protonic.nl>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robin van der Gracht <robin@protonic.nl>

Signed-off-by: Robin van der Gracht <robin@protonic.nl>
---
 arch/arm/boot/dts/imx6dl-prtvt7.dts | 40 +++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl-prtvt7.dts b/arch/arm/boot/dts/imx6dl-prtvt7.dts
index be7c4cb339e7..02b53df03e6f 100644
--- a/arch/arm/boot/dts/imx6dl-prtvt7.dts
+++ b/arch/arm/boot/dts/imx6dl-prtvt7.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 #include "imx6dl.dtsi"
 #include "imx6qdl-prti6q.dtsi"
+#include <dt-bindings/display/sdtv-standards.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/sound/fsl-imx-audmux.h>
@@ -171,6 +172,18 @@ panel_in: endpoint {
 		};
 	};
 
+	connector {
+		compatible = "composite-video-connector";
+		label = "Composite0";
+		sdtv-standards = <SDTV_STD_PAL_B>;
+
+		port {
+			comp0_out: endpoint {
+				remote-endpoint = <&tvp5150_comp0_in>;
+			};
+		};
+	};
+
 	reg_bl_12v0: regulator-bl-12v0 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -295,6 +308,29 @@ sgtl5000: audio-codec@a {
 		VDDIO-supply = <&reg_3v3>;
 		VDDD-supply = <&reg_1v8>;
 	};
+
+	video@5c {
+		compatible = "ti,tvp5150";
+		reg = <0x5c>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			tvp5150_comp0_in: endpoint {
+				remote-endpoint = <&comp0_out>;
+			};
+		};
+
+		/* Output port 2 is video output pad */
+		port@2 {
+			reg = <2>;
+			tvp5151_to_ipu1_csi0_mux: endpoint {
+				remote-endpoint = <&ipu1_csi0_mux_from_parallel_sensor>;
+			};
+		};
+	};
 };
 
 &i2c3 {
@@ -322,6 +358,10 @@ &ipu1_di0_disp0 {
 	remote-endpoint = <&display_in>;
 };
 
+&ipu1_csi0_mux_from_parallel_sensor {
+	remote-endpoint = <&tvp5151_to_ipu1_csi0_mux>;
+};
+
 &pwm1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm1>;
-- 
2.30.2

