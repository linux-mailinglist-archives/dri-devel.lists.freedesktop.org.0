Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AA33F01D4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 12:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405286E91C;
	Wed, 18 Aug 2021 10:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5746E51A;
 Wed, 18 Aug 2021 10:36:04 +0000 (UTC)
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 18 Aug 2021 03:27:43 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 18 Aug 2021 03:27:41 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg01-blr.qualcomm.com with ESMTP; 18 Aug 2021 15:57:09 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id 655E021FCF; Wed, 18 Aug 2021 15:57:07 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, kalyan_t@codeaurora.org,
 sbillaka@codeaurora.org, abhinavk@codeaurora.org, robdclark@gmail.com,
 swboyd@chromium.org, bjorn.andersson@linaro.org, khsieh@codeaurora.org,
 rajeevny@codeaurora.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Subject: [PATCH v1 2/4] arm64: dts: qcom: sc7280: add display dt nodes
Date: Wed, 18 Aug 2021 15:57:02 +0530
Message-Id: <1629282424-4070-2-git-send-email-mkrishn@codeaurora.org>
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

Add mdss and mdp DT nodes for sc7280.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 85 ++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 53a21d0..fd7ff1c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -5,6 +5,7 @@
  * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,dispcc-sc7280.h>
 #include <dt-bindings/clock/qcom,gcc-sc7280.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interconnect/qcom,sc7280.h>
@@ -1424,6 +1425,90 @@
 			#power-domain-cells = <1>;
 		};
 
+		mdss: mdss@ae00000 {
+			compatible = "qcom,sc7280-mdss";
+			reg = <0 0x0ae00000 0 0x1000>;
+			reg-names = "mdss";
+
+			power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
+
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				<&dispcc DISP_CC_MDSS_MDP_CLK>;
+			clock-names = "iface", "ahb", "core";
+
+			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
+			assigned-clock-rates = <300000000>;
+
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "mdp0-mem";
+
+			iommus = <&apps_smmu 0x900 0x402>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdp: mdp@ae01000 {
+				compatible = "qcom,sc7280-dpu";
+				reg = <0 0x0ae01000 0 0x8f030>,
+					<0 0x0aeb0000 0 0x2008>;
+				reg-names = "mdp", "vbif";
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					<&gcc GCC_DISP_SF_AXI_CLK>,
+					<&dispcc DISP_CC_MDSS_AHB_CLK>,
+					<&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+					<&dispcc DISP_CC_MDSS_MDP_CLK>,
+					<&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "bus", "nrt_bus", "iface", "lut", "core",
+					      "vsync";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
+						<&dispcc DISP_CC_MDSS_VSYNC_CLK>,
+						<&dispcc DISP_CC_MDSS_AHB_CLK>;
+				assigned-clock-rates = <300000000>,
+							<19200000>,
+							<19200000>;
+				operating-points-v2 = <&mdp_opp_table>;
+				power-domains = <&rpmhpd SC7280_CX>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0>;
+
+				status = "disabled";
+
+				mdp_opp_table: mdp-opp-table {
+					compatible = "operating-points-v2";
+
+					opp-200000000 {
+						opp-hz = /bits/ 64 <200000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-380000000 {
+						opp-hz = /bits/ 64 <380000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-506666667 {
+						opp-hz = /bits/ 64 <506666667>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7280-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>;
-- 
2.7.4

