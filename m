Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0262315A34F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0C16F497;
	Wed, 12 Feb 2020 08:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-blr-02.qualcomm.com (alexa-out-blr-02.qualcomm.com
 [103.229.18.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27EE6EE3B;
 Tue, 11 Feb 2020 11:38:02 +0000 (UTC)
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA;
 11 Feb 2020 17:07:58 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
 by ironmsg01-blr.qualcomm.com with ESMTP; 11 Feb 2020 17:07:38 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id 5290D1CC5; Tue, 11 Feb 2020 17:07:37 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v2] arm64: dts: sc7180: add dsi controller and phy entries for idp
 dts
Date: Tue, 11 Feb 2020 17:07:35 +0530
Message-Id: <20200211113735.6840-1-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Feb 2020 08:25:13 +0000
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

Adding dsi controller and phy entries for idp dt.

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---

Changes in v1:
	- Added dsi controller and dsi phy entries for idp dts

Changes in v2:
	- Adding dependency patchwork series
	- Removing suspend configuration
	- Adding blank before curly brace

This patch depends on following patchwork series:

https://patchwork.kernel.org/patch/11364687/
https://patchwork.kernel.org/patch/11366303/

 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 55 +++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 388f50ad4fde..6ccf8c3603ab 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sc7180.dtsi"
 #include "pm6150.dtsi"
@@ -232,6 +233,49 @@ vreg_bob: bob {
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
 &qspi {
 	status = "okay";
 	pinctrl-names = "default";
@@ -289,6 +333,17 @@ &usb_1_qmpphy {
 
 /* PINCTRL - additions to nodes defined in sc7180.dtsi */
 
+&pm6150l_gpio {
+	disp_pins: disp-pins {
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
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
