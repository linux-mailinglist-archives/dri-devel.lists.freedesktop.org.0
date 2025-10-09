Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBF4BC79EF
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 09:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4799B10E186;
	Thu,  9 Oct 2025 07:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="kWDJGmCw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A9710E921;
 Thu,  9 Oct 2025 07:11:55 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996Eome012092;
 Thu, 9 Oct 2025 07:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:date:from:in-reply-to:message-id:references:subject:to; s=
 qcppdkim1; bh=nqA/o5ITpPtoHZAvc1TC02Ibw3AoKrSwSAKzzjGqdXM=; b=kW
 DJGmCwwcglfwVDOjk8fzod499LJATV8LVekbGNz/oRCXBda0MEy1iVS3AdaJGQeW
 xGICFEd9lYyv48r+nEze2d6D9aE9jeeJj9DAeOoo5oVu6uv6Fl+BwRJ32irpQTy9
 Tk22i4h2SZIMvbREc4IBRueMB7IzImcK1WngKvJnRGOZQblzfy/2av9XZ4Ebl2o3
 vE26h47E3/kPk0fveEuvm7jAm72/mt5onw8YKyeIgImInZ5RTlIaFIk8MmDkUAE8
 JKxwKndgLDZYM1JLIHrbKJ5SsI26wHx5L6DdRzUakDONUGx03DYuvq3y/rhf2avc
 YL6yI5Y3hTUHmI/BNzKw==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv9a9tw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 07:11:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5997BiZ9002192; 
 Thu, 9 Oct 2025 07:11:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 49jvnmbgyc-1;
 Thu, 09 Oct 2025 07:11:44 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5997BgO5002131;
 Thu, 9 Oct 2025 07:11:44 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-riteshk-hyd.qualcomm.com
 [10.147.241.247])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 5997Bh2k002172;
 Thu, 09 Oct 2025 07:11:44 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2314801)
 id AA4DD5015BE; Thu,  9 Oct 2025 12:41:41 +0530 (+0530)
From: Ritesh Kumar <quic_riteshk@quicinc.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org, cros-qcom-dts-watchers@chromium.org
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 quic_vproddut@quicinc.com
Subject: [PATCH 5/5] arm64: dts: qcom: Add edp reference clock for edp phy
Date: Thu,  9 Oct 2025 12:41:27 +0530
Message-Id: <20251009071127.26026-6-quic_riteshk@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251009071127.26026-1-quic_riteshk@quicinc.com>
References: <20251009071127.26026-1-quic_riteshk@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMiBTYWx0ZWRfX2AeiEuk8zb0y
 ofIyIgblYiHDJYbZ3y6RS55mfiJ+5AI1Y2rFsyNRffLB/BrmjNfaiA7wEu/vQnCQILijfD6FKQj
 p2Ss4qkJez3oiapOp80hR6AFpT/qaQ61hnpDVaWGHpMh9NOE8jxaj0fLNpAtvnfMK4xCzPNvRuy
 ZOcr5P21TWwaNV7DHhUT8e7TF/nY5n91mlQdAccoSOe2c92bQYQbUUs/6TkwK0ydbOsLxrlJMD0
 gyFzPkeOegjFHCrKKN0ci1yBdJaJwwT3DR+YUP0fLvrpVh/viYEajys59t2wVxbGp43R3spDufo
 mJUiBtoWv+XEsi3EKfK3wm10d94G23C4FTzjdXe3mflZn293t2YVJv3oozvH43AFjcDqjq/DMml
 Q6xXesXlBUZGBz65WGo+CT09QLux5g==
X-Proofpoint-GUID: zB3fMP2A1YCTuCIF36DHEDBl07BgSVtI
X-Proofpoint-ORIG-GUID: zB3fMP2A1YCTuCIF36DHEDBl07BgSVtI
X-Authority-Analysis: v=2.4 cv=JPk2csKb c=1 sm=1 tr=0 ts=68e76034 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=52SUE-4n2jAl4pzU1y8A:9
 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080122
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

Define edp reference clock as fixed clock and add it for
edp phy on sc8180x and sc8280xp chipsets.

Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi  | 11 ++++++--
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 36 +++++++++++++++++---------
 2 files changed, 33 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 85c2afcb417d..392cc9eede48 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -27,6 +27,12 @@
 	#size-cells = <2>;
 
 	clocks {
+		edp_ref_clk: edp-ref-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+		};
+
 		xo_board_clk: xo-board {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -3492,8 +3498,9 @@
 			      <0 0x0aec2000 0 0x19c>;
 
 			clocks = <&dispcc DISP_CC_MDSS_EDP_AUX_CLK>,
-				 <&dispcc DISP_CC_MDSS_AHB_CLK>;
-			clock-names = "aux", "cfg_ahb";
+				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&edp_ref_clk>;
+			clock-names = "aux", "cfg_ahb", "edp_ref";
 
 			power-domains = <&rpmhpd SC8180X_MX>;
 
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 279e5e6beae2..d0a976aea46d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -29,6 +29,12 @@
 	#size-cells = <2>;
 
 	clocks {
+		edp_ref_clk: edp-ref-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+		};
+
 		xo_board_clk: xo-board-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -3792,8 +3798,9 @@
 			      <0 0x08909000 0 0x1c8>;
 
 			clocks = <&dispcc1 DISP_CC_MDSS_DPTX0_AUX_CLK>,
-				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>;
-			clock-names = "aux", "cfg_ahb";
+				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
+				 <&edp_ref_clk>;
+			clock-names = "aux", "cfg_ahb", "edp_ref";
 			power-domains = <&rpmhpd SC8280XP_MX>;
 
 			#clock-cells = <1>;
@@ -3810,8 +3817,9 @@
 			      <0 0x0890c000 0 0x1c8>;
 
 			clocks = <&dispcc1 DISP_CC_MDSS_DPTX1_AUX_CLK>,
-				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>;
-			clock-names = "aux", "cfg_ahb";
+				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
+				 <&edp_ref_clk>;
+			clock-names = "aux", "cfg_ahb", "edp_ref";
 			power-domains = <&rpmhpd SC8280XP_MX>;
 
 			#clock-cells = <1>;
@@ -5022,8 +5030,9 @@
 			      <0 0x0aec2000 0 0x1c8>;
 
 			clocks = <&dispcc0 DISP_CC_MDSS_DPTX2_AUX_CLK>,
-				 <&dispcc0 DISP_CC_MDSS_AHB_CLK>;
-			clock-names = "aux", "cfg_ahb";
+				 <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
+				 <&edp_ref_clk>;
+			clock-names = "aux", "cfg_ahb", "edp_ref";
 			power-domains = <&rpmhpd SC8280XP_MX>;
 
 			#clock-cells = <1>;
@@ -5040,8 +5049,9 @@
 			      <0 0x0aec5000 0 0x1c8>;
 
 			clocks = <&dispcc0 DISP_CC_MDSS_DPTX3_AUX_CLK>,
-				 <&dispcc0 DISP_CC_MDSS_AHB_CLK>;
-			clock-names = "aux", "cfg_ahb";
+				 <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
+				 <&edp_ref_clk>;
+			clock-names = "aux", "cfg_ahb", "edp_ref";
 			power-domains = <&rpmhpd SC8280XP_MX>;
 
 			#clock-cells = <1>;
@@ -6368,8 +6378,9 @@
 			      <0 0x220c2000 0 0x1c8>;
 
 			clocks = <&dispcc1 DISP_CC_MDSS_DPTX2_AUX_CLK>,
-				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>;
-			clock-names = "aux", "cfg_ahb";
+				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
+				 <&edp_ref_clk>;
+			clock-names = "aux", "cfg_ahb", "edp_ref";
 			power-domains = <&rpmhpd SC8280XP_MX>;
 
 			#clock-cells = <1>;
@@ -6386,8 +6397,9 @@
 			      <0 0x220c5000 0 0x1c8>;
 
 			clocks = <&dispcc1 DISP_CC_MDSS_DPTX3_AUX_CLK>,
-				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>;
-			clock-names = "aux", "cfg_ahb";
+				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
+				 <&edp_ref_clk>;
+			clock-names = "aux", "cfg_ahb", "edp_ref";
 			power-domains = <&rpmhpd SC8280XP_MX>;
 
 			#clock-cells = <1>;
-- 
2.17.1

