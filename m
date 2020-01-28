Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C99114C72F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 09:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34C06F478;
	Wed, 29 Jan 2020 08:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E156E05F;
 Tue, 28 Jan 2020 13:37:21 +0000 (UTC)
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 28 Jan 2020 19:07:19 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
 by ironmsg01-blr.qualcomm.com with ESMTP; 28 Jan 2020 19:06:58 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id 3F74E282F; Tue, 28 Jan 2020 19:06:58 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v1] arm64: dts: sc7180: add dsi controller and phy entries for idp
 dts
Date: Tue, 28 Jan 2020 19:06:57 +0530
Message-Id: <1580218617-30293-1-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 29 Jan 2020 08:06:22 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding dsi controller and phy entries for idp dt.

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 388f50a..9f42367 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sc7180.dtsi"
 #include "pm6150.dtsi"
@@ -232,6 +233,50 @@
 	};
 };
 
+&dsi_controller {
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
+		pinctrl-names = "default", "suspend";
+		pinctrl-0 = <&disp_pins_default>;
+		pinctrl-1 = <&disp_pins_default>;
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
 &qspi {
 	status = "okay";
 	pinctrl-names = "default";
@@ -289,6 +334,17 @@
 
 /* PINCTRL - additions to nodes defined in sc7180.dtsi */
 
+&pm6150l_gpio {
+	disp_pins_default: disp-pins-default{
+		pins = "gpio3";
+		function = "func1";
+		qcom,drive-strength = <2>;
+		power-source = <0>;
+		bias-disable;
+		output-low;
+	};
+};
+
 &qspi_clk {
 	pinconf {
 		pins = "gpio63";
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
