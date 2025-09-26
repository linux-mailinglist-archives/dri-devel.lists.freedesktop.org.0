Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26411BA30B4
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 11:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA5410E337;
	Fri, 26 Sep 2025 09:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="PIY6UrXn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F17610E337;
 Fri, 26 Sep 2025 09:00:28 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8wgwc004224;
 Fri, 26 Sep 2025 09:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=MetohwjwvOY
 A1z+2un8SEpyxdESThTLxbBvqw+Nz3Ss=; b=PIY6UrXnlbVk2vUlUFYrZ0UVC1W
 KaFXQe8pqK4Jnx0TchDyopW1xfqlIz+RSGLlXc0GzzXc8xMByAcF1+P7/pbKRrOk
 VY+yDopiGkiY0TrbqWEXi3ghvt4fEW+7zD8PnHlWod02MJo8GJELoOtxPKVgNtLl
 8tLYNUbBrVlnTWdl5PxIsM185aifxX6WI5U/of7CD2tAQ4pCCV/P2h7HCGYaz+Oe
 vssIJFYguwKRnh/h189Vp4GuJITR884gVcr/Z168KZYz7skBX1feyRyNlsc0yBL0
 s0vBiXlJPjJOcBWJK5nxd0o4R1k1VDxdJ5lrVQ+eS/C9/brh/bpxQVLvr9g==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u26s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Sep 2025 09:00:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q90AAn008598; 
 Fri, 26 Sep 2025 09:00:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 499nbmgtnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Sep 2025 09:00:10 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58Q90Atg008574;
 Fri, 26 Sep 2025 09:00:10 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mkuntuma-hyd.qualcomm.com
 [10.213.97.145])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 58Q90AiM008570
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Sep 2025 09:00:10 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4582077)
 id 8F658587; Fri, 26 Sep 2025 14:30:09 +0530 (+0530)
From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
 swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
 sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
 alex.vinarskis@gmail.com
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
Subject: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort device
 nodes
Date: Fri, 26 Sep 2025 14:29:54 +0530
Message-Id: <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7yMejbh05JZB-ATB_HOhn8l0HL69M7h-
X-Authority-Analysis: v=2.4 cv=PYXyRyhd c=1 sm=1 tr=0 ts=68d65624 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=JTynpAiUPC9epHm8WU0A:9
 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX3iu3vgPfhlKq
 Onm6V1HRFx5rQDY3YQL8lxGkwNyKPoRBbmij2ilrNrGOG2Ucc+jRO7DjH+SIpmwWj8mpnDQ7boO
 XVMBYRXtyBaFyyuEXNWo/DaOVtkiUUdq6p+v6DMoA9PQQ7NvEbj+KYHBChtv6T62mSKWjBUuuSo
 YXFe5ZYPy1nuT2sfBieG3PYBG319vHrDhy+BuYXaoSNMF6dYRDjIG7/gO5HLG4W9UzSQx+po1Hv
 ke5H/yoIlK+NPPr5pDUllldP7E+64+CZNDKXJwrnwu966Z1xIrAEf07JIRmf/mUNpfQLpFo66EG
 diQDMgoSYE+4rwXfzT18vmOE5xniDIulVjWAbNN+hlWtdkQv7S3LzgCn5/wpqpgnj/24dQGcPkW
 N386yb1fqlQdReoy3ft2DDk8tADcrQ==
X-Proofpoint-ORIG-GUID: 7yMejbh05JZB-ATB_HOhn8l0HL69M7h-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
with their corresponding PHYs.

Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 245 +++++++++++++++++++++++++++
 1 file changed, 245 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index a78daa827fcd..4af9a439d68f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -6839,6 +6839,27 @@ mdss1_mdp: display-controller@22001000 {
 				interrupt-parent = <&mdss1>;
 				interrupts = <0>;
 
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu1_intf0_out: endpoint {
+							remote-endpoint = <&mdss1_dp0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dpu1_intf4_out: endpoint {
+							remote-endpoint = <&mdss1_dp1_in>;
+						};
+					};
+				};
+
 				mdss1_mdp_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
@@ -6863,6 +6884,228 @@ opp-650000000 {
 					};
 				};
 			};
+
+			mdss1_dp0_phy: phy@220c2a00 {
+				compatible = "qcom,sa8775p-edp-phy";
+
+				reg = <0x0 0x220c2a00 0x0 0x200>,
+				      <0x0 0x220c2200 0x0 0xd0>,
+				      <0x0 0x220c2600 0x0 0xd0>,
+				      <0x0 0x220c2000 0x0 0x1c8>;
+
+				clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>;
+				clock-names = "aux",
+					      "cfg_ahb";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss1_dp1_phy: phy@220c5a00 {
+				compatible = "qcom,sa8775p-edp-phy";
+
+				reg = <0x0 0x220c5a00 0x0 0x200>,
+				      <0x0 0x220c5200 0x0 0xd0>,
+				      <0x0 0x220c5600 0x0 0xd0>,
+				      <0x0 0x220c5000 0x0 0x1c8>;
+
+				clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>;
+				clock-names = "aux",
+					      "cfg_ahb";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss1_dp0: displayport-controller@22154000 {
+				compatible = "qcom,sa8775p-dp";
+
+				reg = <0x0 0x22154000 0x0 0x104>,
+				      <0x0 0x22154200 0x0 0x0c0>,
+				      <0x0 0x22155000 0x0 0x770>,
+				      <0x0 0x22156000 0x0 0x09c>,
+				      <0x0 0x22157000 0x0 0x09c>,
+				      <0x0 0x22158000 0x0 0x09c>,
+				      <0x0 0x22159000 0x0 0x09c>,
+				      <0x0 0x2215a000 0x0 0x23c>,
+				      <0x0 0x2215b000 0x0 0x23c>;
+
+				interrupt-parent = <&mdss1>;
+				interrupts = <12>;
+
+				clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel",
+					      "stream_2_pixel",
+					      "stream_3_pixel";
+				assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dp0_phy 0>,
+							 <&mdss1_dp0_phy 1>,
+							 <&mdss1_dp0_phy 1>,
+							 <&mdss1_dp0_phy 1>,
+							 <&mdss1_dp0_phy 1>;
+				phys = <&mdss1_dp0_phy>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&mdss1_dp_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
+
+				#sound-dai-cells = <0>;
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
+						mdss1_dp0_in: endpoint {
+							remote-endpoint = <&dpu1_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss1_dp0_out: endpoint { };
+					};
+				};
+
+				mdss1_dp_opp_table: opp-table {
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
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss1_dp1: displayport-controller@2215c000 {
+				compatible = "qcom,sa8775p-dp";
+
+				reg = <0x0 0x2215c000 0x0 0x104>,
+				      <0x0 0x2215c200 0x0 0x0c0>,
+				      <0x0 0x2215d000 0x0 0x770>,
+				      <0x0 0x2215e000 0x0 0x09c>,
+				      <0x0 0x2215f000 0x0 0x09c>,
+				      <0x0 0x22160000 0x0 0x09c>,
+				      <0x0 0x22161000 0x0 0x09c>,
+				      <0x0 0x22162000 0x0 0x23c>,
+				      <0x0 0x22163000 0x0 0x23c>;
+
+				interrupt-parent = <&mdss1>;
+				interrupts = <13>;
+
+				clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
+				assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dp1_phy 0>,
+							 <&mdss1_dp1_phy 1>,
+							 <&mdss1_dp1_phy 1>;
+				phys = <&mdss1_dp1_phy>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&mdss1_dp1_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
+
+				#sound-dai-cells = <0>;
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
+						mdss1_dp1_in: endpoint {
+							remote-endpoint = <&dpu1_intf4_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss1_dp1_out: endpoint { };
+					};
+				};
+
+				mdss1_dp1_opp_table: opp-table {
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
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
 		};
 
 		dispcc1: clock-controller@22100000 {
@@ -6872,6 +7115,8 @@ dispcc1: clock-controller@22100000 {
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>,
+				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
+				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
 				 <0>, <0>, <0>, <0>,
 				 <0>, <0>, <0>, <0>;
 			power-domains = <&rpmhpd SA8775P_MMCX>;
-- 
2.34.1

