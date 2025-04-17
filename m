Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20200A914FA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 09:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240B710EA36;
	Thu, 17 Apr 2025 07:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ai62URvx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3886610EA59;
 Thu, 17 Apr 2025 05:39:35 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLBhsx024742;
 Thu, 17 Apr 2025 05:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=13h3yuofy+5
 tUM+TX0+TpcT8Guoo3ux/GqhlG9cZNq8=; b=Ai62URvx5+HwvkpJswYn/zh9y3S
 E9KssKpZRlBSUuxdLj3tP8h3OCvCtz6veOh2+dRwM6n14/IJu6Yczhs2Ati7SWL2
 vXimI3a2V38XYP36iF942fFmq4DJ7HjIZPwRIP5a/MCVy6HEgbO/py6jsJ71aygs
 C3WTKVkf1xLPqv8OF146HWnchRPLqo+ztPuvFXz2UkMBenIzJU3E6KOnagj8ZXgD
 Ny9W3c91Cl/1i1cymQdtekgwQIttmt9aHhU716YZXIkc9kQTBbjhkjwxK4DXX5nK
 jnoA1GIaAbanyP5eEjoqHnRxvb9I1UUPkAtk6/8NJmMB61UNxEfOddtuP8A==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjdyqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Apr 2025 05:39:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5dFYK023943; 
 Thu, 17 Apr 2025 05:39:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 462f5dnuhb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Apr 2025 05:39:17 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53H5dGkv024002;
 Thu, 17 Apr 2025 05:39:16 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 53H5dFX9023987
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Apr 2025 05:39:16 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id B65A559B; Thu, 17 Apr 2025 11:09:13 +0530 (+0530)
From: Ayushi Makhija <amakhija@qti.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
 dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com, Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 06/11] arm64: dts: qcom: sa8775p: add Display Serial
 Interface device nodes
Date: Thu, 17 Apr 2025 11:09:04 +0530
Message-Id: <20250417053909.1051416-7-amakhija@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417053909.1051416-1-amakhija@qti.qualcomm.com>
References: <20250417053909.1051416-1-amakhija@qti.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=68009409 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=eurTFl4nLlV8CEor4r0A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: T7PIJ32PgWBGHViGXDwc-KRYOo_uANEu
X-Proofpoint-ORIG-GUID: T7PIJ32PgWBGHViGXDwc-KRYOo_uANEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170042
X-Mailman-Approved-At: Thu, 17 Apr 2025 07:22:17 +0000
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

From: Ayushi Makhija <quic_amakhija@quicinc.com>

Add device tree nodes for the DSI0 and DSI1 controllers
with their corresponding PHYs found on Qualcomm SA8775P SoC.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 186 +++++++++++++++++++++++++-
 1 file changed, 185 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 3394ae2d1300..edc5130f4bae 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
 #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
@@ -3890,6 +3891,22 @@ dpu_intf4_out: endpoint {
 							remote-endpoint = <&mdss0_dp1_in>;
 						};
 					};
+
+					port@2 {
+						reg = <2>;
+
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss0_dsi0_in>;
+						};
+					};
+
+					port@3 {
+						reg = <3>;
+
+						dpu_intf2_out: endpoint {
+							remote-endpoint = <&mdss0_dsi1_in>;
+						};
+					};
 				};
 
 				mdss0_mdp_opp_table: opp-table {
@@ -3917,6 +3934,170 @@ opp-650000000 {
 				};
 			};
 
+			mdss0_dsi0: dsi@ae94000 {
+				compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x0ae94000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss0>;
+				interrupts = <4>;
+
+				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>;
+				phys = <&mdss0_dsi0_phy>;
+
+				operating-points-v2 = <&dsi0_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss0_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss0_dsi0_out: endpoint{ };
+					};
+				};
+
+				dsi0_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-358000000 {
+						opp-hz = /bits/ 64 <358000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
+			};
+
+			mdss0_dsi0_phy: phy@ae94400 {
+				compatible = "qcom,sa8775p-dsi-phy-5nm";
+				reg = <0x0 0x0ae94400 0x0 0x200>,
+				      <0x0 0x0ae94600 0x0 0x280>,
+				      <0x0 0x0ae94900 0x0 0x27c>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
+			mdss0_dsi1: dsi@ae96000 {
+				compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x0ae96000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss0>;
+				interrupts = <5>;
+
+				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_INTF_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK1_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_ESC1_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
+				phys = <&mdss0_dsi1_phy>;
+
+				operating-points-v2 = <&dsi1_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss0_dsi1_in: endpoint {
+							remote-endpoint = <&dpu_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss0_dsi1_out: endpoint { };
+					};
+				};
+
+				dsi1_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-358000000 {
+						opp-hz = /bits/ 64 <358000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
+			};
+
+			mdss0_dsi1_phy: phy@ae96400 {
+				compatible = "qcom,sa8775p-dsi-phy-5nm";
+				reg = <0x0 0x0ae96400 0x0 0x200>,
+				      <0x0 0x0ae96600 0x0 0x280>,
+				      <0x0 0x0ae96900 0x0 0x27c>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
 			mdss0_dp0_phy: phy@aec2a00 {
 				compatible = "qcom,sa8775p-edp-phy";
 
@@ -4123,7 +4304,10 @@ dispcc0: clock-controller@af00000 {
 				 <&sleep_clk>,
 				 <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>,
 				 <&mdss0_dp1_phy 0>, <&mdss0_dp1_phy 1>,
-				 <0>, <0>, <0>, <0>;
+				 <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
 			power-domains = <&rpmhpd SA8775P_MMCX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-- 
2.34.1

