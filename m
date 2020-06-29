Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DAC20EF6E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E14F89C94;
	Tue, 30 Jun 2020 07:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 365 seconds by postgrey-1.36 at gabe;
 Mon, 29 Jun 2020 13:58:15 UTC
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4B489DB5;
 Mon, 29 Jun 2020 13:58:15 +0000 (UTC)
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 29 Jun 2020 06:52:09 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 29 Jun 2020 06:52:08 -0700
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
 by ironmsg02-blr.qualcomm.com with ESMTP; 29 Jun 2020 19:21:47 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id 31D671FC2; Mon, 29 Jun 2020 19:21:46 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v4] arm64: dts: sc7180: add nodes for idp display
Date: Mon, 29 Jun 2020 19:21:44 +0530
Message-Id: <20200629135144.8265-1-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:54 +0000
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
Cc: Harigovindan P <harigovi@codeaurora.org>, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add nodes for IDP display. The display is Visionox RM69299.

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---
Changes in v2:
	- Adding dependency patchwork series
	- Removing suspend configuration
	- Adding blank before space curly brace
Changes in v3:
	- Updating status for mdp and mdss node to get the
	display working
	- Change in commit text
Changes in v4:
	- Added pinconf subnode
	- Using macros for function and drive-strength

 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 65 +++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 39dbfc89689e..5e0b7e4b2545 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -9,6 +9,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include "sc7180.dtsi"
 #include "pm6150.dtsi"
 #include "pm6150l.dtsi"
@@ -287,6 +288,57 @@ vreg_bob: bob {
 	};
 };
 
+&dsi0 {
+	status = "okay";
+
+	vdda-supply = <&vreg_l3c_1p2>;
+
+	panel@0 {
+		compatible = "visionox,rm69299-1080p-display";
+		reg = <0>;
+
+		vdda-supply = <&vreg_l8c_1p8>;
+		vdd3p3-supply = <&vreg_l18a_2p8>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&disp_pins>;
+
+		reset-gpios = <&pm6150l_gpio 3 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				panel0_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+		};
+	};
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&panel0_in>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&dsi_phy {
+	status = "okay";
+};
+
+&mdp {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
 &qspi {
 	status = "okay";
 	pinctrl-names = "default";
@@ -402,6 +454,19 @@ wifi-firmware {
 
 /* PINCTRL - additions to nodes defined in sc7180.dtsi */
 
+&pm6150l_gpio {
+	disp_pins: disp-pins {
+		pinconf {
+			pins = "gpio3";
+			function = PMIC_GPIO_FUNC_FUNC1;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_MED>;
+			power-source = <0>;
+			bias-disable;
+			output-low;
+		};
+	};
+};
+
 &qspi_clk {
 	pinconf {
 		pins = "gpio63";
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
