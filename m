Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CB4AD1D29
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D3A10E260;
	Mon,  9 Jun 2025 12:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dk5hz4V2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF2110E25B;
 Mon,  9 Jun 2025 12:23:12 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5598P02m003426;
 Mon, 9 Jun 2025 12:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 joYVYd272S/tW9QOPZEa4sZ0+tiqutqmNHk0wE/icFQ=; b=dk5hz4V2sHx1YSst
 nQ5ghstPxeizNDRnVnIH3CesEnlEeMW9JzUMtQcr+1EJuagYTMRj7vvfvtkFK0Mg
 il11SGYdAZjfGflHBN6fpCqSAD69+/pNzEmp3+MS0i24x0uqMVvSmSj9BBFm7EO0
 M36ATnE9r59YhG9JF4bjJ6Ao40BtRPk1M/Oi7QLfyddlb58viB8O8FV/kxLf/w9E
 e61Wso5phqisi/QDPmVkGiSabpThHXMZZ2vUZC0Az4jmD9pAcMLDXFu/8eiWn/xy
 S5qBXcCe8MUvebmfjrbvyPU2Z60+BR4FVx5miK7DWdz1SecjSVldcF39UyzcnC3G
 eXBlcg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y0q3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:23:06 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559CN5JG019500
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:23:05 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:23:01 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:23 +0800
Subject: [PATCH v2 04/38] drm/msm/dp: re-arrange dp_display_disable() into
 functional parts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-4-a54d8902a23d@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
In-Reply-To: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Yongxing Mou" <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471753; l=4641;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=b676NrVSTLe/0xU9hvmiOr00aB3AYIYJRYTAc3hYpUM=;
 b=/YC+TDlj8+mpWJ0bNoD5M+V6qiYsSg9HQrYGV3yY8QW37veYPlw4w+3qwthogAO+eKH5d6uu4
 BNhInbIaR03DJj3dew+/FrvCw9MW2KeWqgYUDLvBcosjBIGbjtrP/XA
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MiBTYWx0ZWRfX9O6rsdXyFYbX
 /eXjIN6TEX0LIDbHnqqji9MSp+nZNj6mb6i6Hq7fa6kVsfzLXmIAGqWOO4y+kbfggnej9tKDoth
 l6fwbwsFjzD9tT6Sy+FhrsafAr96kb8I3QABcg7btSZygEj1JW9NKC0j1NGfOZnpKTrO8Ndlb4T
 CJiIPdT8jOR27QCpnVhD+H0+Xv0al4q7BDsF8J1ttRniGSmRc2G2rrjlFJzcAPteShoTY0JQmdH
 cgUxzp0gGsk/pCI9RwTtImKkOjFZSNa7ttyKghiAFcG2W2g+6E76thuUFaULhb43I/h6VW66e+o
 921l6/YKj5QP8sWjsBVUNVAYItWNy3BGhwLDJHB/fsRw31MBfy3OcobpKPkXIS173OpI8+teHUu
 LiMYdoP9gj6O8yvZz7YGe5t3LmZ/6T34xsJUMX3YahoHlwavXY/ixOnON6B0+I6P180cj7Kq
X-Proofpoint-GUID: uJ6vjc7RF9sd0zKo6qEHkti_lgBmfGDJ
X-Proofpoint-ORIG-GUID: uJ6vjc7RF9sd0zKo6qEHkti_lgBmfGDJ
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6846d22a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=hClVRiXsoM2qTkbQJdEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=866 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090092
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

dp_display_disable() handles special case of when monitor is
disconnected from the dongle while the dongle stays connected
thereby needing a separate function dp_ctrl_off_link_stream()
for this. However with a slight rework this can still be handled
by keeping common paths same for regular and special case.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 29 +++++++++++++++--------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
 drivers/gpu/drm/msm/dp/dp_display.c | 16 +++++++---------
 3 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 1e13ca81b0155a37a4ed7a2e83c918293d703a37..1ce3cca121d0c56b493e282c76eb9202371564cf 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2081,30 +2081,31 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	return ret;
 }
 
-void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
-	struct phy *phy;
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
-	phy = ctrl->phy;
-
 	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
+}
 
-	/* set dongle to D3 (power off) mode */
-	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
+void msm_dp_ctrl_psm_config(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
 
-	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	if (ctrl->stream_clks_on) {
-		clk_disable_unprepare(ctrl->pixel_clk);
-		ctrl->stream_clks_on = false;
-	}
+	/* set dongle to D3 (power off) mode */
+	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
+}
 
-	dev_pm_opp_set_rate(ctrl->dev, 0);
-	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
+void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	struct phy *phy;
 
-	phy_power_off(phy);
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+	phy = ctrl->phy;
 
 	/* aux channel down, reinit phy */
 	phy_exit(phy);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 42745c912adbad7221c78f5cecefa730bfda1e75..edbe5766db74c4e4179141d895f9cb85e514f29b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -20,7 +20,6 @@ struct phy;
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
-void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
@@ -42,4 +41,8 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
 
+void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_psm_config(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
+
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5ac5dcf35b789f2bda052a2c17aae20aa48d8e18..a5ca498cb970d0c6a4095b0b7fc6269c2dc3ad31 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -925,17 +925,15 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	if (!msm_dp_display->power_on)
 		return 0;
 
+	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl);
+
+	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0) {
-		/*
-		 * irq_hpd with sink_count = 0
-		 * hdmi unplugged out of dongle
-		 */
-		msm_dp_ctrl_off_link_stream(dp->ctrl);
+		msm_dp_ctrl_psm_config(dp->ctrl);
+		msm_dp_ctrl_off(dp->ctrl);
+		/* re-init the PHY so that we can listen to Dongle disconnect */
+		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
-		/*
-		 * unplugged interrupt
-		 * dongle unplugged out of DUT
-		 */
 		msm_dp_ctrl_off(dp->ctrl);
 		msm_dp_display_host_phy_exit(dp);
 	}

-- 
2.34.1

