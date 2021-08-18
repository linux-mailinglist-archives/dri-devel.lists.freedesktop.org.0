Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BED3F01D9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 12:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3C08898A;
	Wed, 18 Aug 2021 10:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD556E519;
 Wed, 18 Aug 2021 10:35:35 +0000 (UTC)
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 18 Aug 2021 03:27:40 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 18 Aug 2021 03:27:38 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg01-blr.qualcomm.com with ESMTP; 18 Aug 2021 15:57:10 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id EC86C21FCF; Wed, 18 Aug 2021 15:57:08 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Sankeerth Billakanti <sbillaka@codeaurora.org>, kalyan_t@codeaurora.org,
 abhinavk@codeaurora.org, robdclark@gmail.com, swboyd@chromium.org,
 bjorn.andersson@linaro.org, khsieh@codeaurora.org, rajeevny@codeaurora.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org
Subject: [PATCH v1 4/4] arm64: dts: qcom: sc7280: add edp display dt nodes
Date: Wed, 18 Aug 2021 15:57:04 +0530
Message-Id: <1629282424-4070-4-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sankeerth Billakanti <sbillaka@codeaurora.org>

Add edp controller and phy DT nodes for sc7280.

Signed-off-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 127 ++++++++++++++++++++++++++++++++++-
 1 file changed, 126 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index aadf55d..5be318e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -1412,7 +1412,7 @@
 			reg = <0 0xaf00000 0 0x20000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
-				 <0>, <0>, <0>, <0>, <0>, <0>;
+				 <0>, <0>, <0>, <0>, <&edp_phy 0>, <&edp_phy 1>;
 			clock-names = "bi_tcxo", "gcc_disp_gpll0_clk",
 				      "dsi0_phy_pll_out_byteclk",
 				      "dsi0_phy_pll_out_dsiclk",
@@ -1493,6 +1493,12 @@
 							remote-endpoint = <&dsi0_in>;
 						};
 					};
+					port@1 {
+						reg = <1>;
+						dpu_intf5_out: endpoint {
+							remote-endpoint = <&edp_in>;
+						};
+					};
 				};
 
 				mdp_opp_table: mdp-opp-table {
@@ -1608,6 +1614,101 @@
 
 				status = "disabled";
 			};
+
+			msm_edp: edp@aea0000 {
+				status = "disabled";
+				compatible = "qcom,sc7280-edp";
+				reg = <0 0xaea0000 0 0x200>,
+				      <0 0xaea0200 0 0x200>,
+				      <0 0xaea0400 0 0xc00>,
+				      <0 0xaea1000 0 0x400>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <14 IRQ_TYPE_NONE>;
+
+				clocks = <&rpmhcc RPMH_CXO_CLK>,
+					 <&gcc GCC_EDP_CLKREF_EN>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_EDP_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_EDP_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_EDP_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK>;
+				clock-names = "core_xo", "core_ref",
+					      "core_iface", "core_aux", "ctrl_link",
+					      "ctrl_link_iface", "stream_pixel";
+				#clock-cells = <1>;
+				assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
+				assigned-clock-parents = <&edp_phy 0>, <&edp_phy 1>;
+
+				phys = <&edp_phy>;
+				phy-names = "dp";
+
+				vdda-1p2-supply = <&vreg_l6b_1p2>;
+				vdda-0p9-supply = <&vreg_l10c_0p8>;
+				operating-points-v2 = <&edp_opp_table>;
+				power-domains = <&rpmhpd SC7280_CX>;
+
+				pinctrl-names = "default";
+				pinctrl-0 = <&edp_hot_plug_det>, <&edp_panel_power_on>;
+
+				panel-bklt-gpio = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
+				panel-pwm-gpio = <&pm8350c_gpios 8 GPIO_ACTIVE_HIGH>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						edp_in: endpoint {
+							remote-endpoint = <&dpu_intf5_out>;
+						};
+					};
+				};
+
+				edp_opp_table: edp-opp-table {
+					compatible = "operating-points-v2";
+
+					opp-160000000 {
+						opp-hz = /bits/ 64 <160000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
+			edp_phy: phy@aec2000 {
+				status = "disabled";
+				compatible = "qcom,sc7280-edp-phy";
+				reg = <0 0xaec2a00 0 0x19c>,
+				      <0 0xaec2200 0 0xa0>,
+				      <0 0xaec2600 0 0xa0>,
+				      <0 0xaec2000 0 0x1c0>;
+
+				clocks = <&rpmhcc RPMH_CXO_CLK>,
+					 <&gcc GCC_EDP_CLKREF_EN>;
+				clock-names = "aux", "cfg_ahb";
+
+				vdda-pll-supply = <&vreg_l6b_1p2>;
+				vdda-phy-supply = <&vreg_l10c_0p8>;
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+			};
 		};
 
 		pdc: interrupt-controller@b220000 {
@@ -1704,6 +1805,30 @@
 				function = "qup13";
 			};
 
+			edp_hot_plug_det: edp-hot-plug-det {
+				pinmux {
+					pins = "gpio60";
+					function = "edp_hot";
+				};
+				pinconf {
+					pins = "gpio60";
+					bias-pull-down;
+					input-enable;
+				};
+			};
+
+			edp_panel_power_on: edp-panel-power-on {
+				pinmux {
+					pins = "gpio80";
+					function = "gpio";
+				};
+				pinconf {
+					pins = "gpio80";
+					bias-disable;
+					output-high;
+				};
+			};
+
 			sdc1_on: sdc1-on {
 				clk {
 					pins = "sdc1_clk";
-- 
2.7.4

