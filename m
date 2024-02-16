Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C64E48589AE
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 00:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FA910ED1B;
	Fri, 16 Feb 2024 23:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="QD5UQ9zW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F99B10ED05;
 Fri, 16 Feb 2024 23:02:57 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41GMMhup032286; Fri, 16 Feb 2024 23:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=4BFFUBZGopBNzcE4ZWsRtJ2oTqM/5eyCkEbrMdFD8G4=; b=QD
 5UQ9zWbD/AF2G5Ls/Af+rKxBZ6g5MhNXOpdHMfmIXxVJ2Q51K0FGHBvLjV07k4QX
 cuT39CJFpP1Xl9OsRBwlOSv+TstyvPDp7gM5jv16u83sisFRbD4hkUdGJ8EOwoDh
 gAyUkSnZ5Bc+GfeQjWjy6YfSn8F34fwPf/OSr9+iblIhBSoK5F9Ar2VXRgcVsKQ7
 Cfu4HEr/ccN+RQ6QabdKX8nqRjzjHc5c4jZtJkqTle2LVmexWRrjup16P1DM8iiD
 gIQhgvTQoytKAeXd8ygLxSjWiy5/ViNwuyk7/iB+Sd9dkqBEbfnBxuYUdlZGra0w
 vAvbqV+GSjArKjL9frsw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9fkfcrs8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Feb 2024 23:02:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41GN2rx7003876
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Feb 2024 23:02:53 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 16 Feb 2024 15:02:53 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v4 11/19] drm/msm/dp: change clock related programming for
 YUV420 over DP
Date: Fri, 16 Feb 2024 15:01:59 -0800
Message-ID: <20240216230228.26713-12-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216230228.26713-1-quic_parellan@quicinc.com>
References: <20240216230228.26713-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: cittC24zITJSV9OqU_D4jIDsCojiLdKi
X-Proofpoint-GUID: cittC24zITJSV9OqU_D4jIDsCojiLdKi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_22,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160182
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

Change all relevant DP controller related programming for YUV420 cases.
Namely, change the pixel clock math to consider YUV420 and modify the
MVID programming to consider YUV420.

Changes in v2:
	- Move configuration control programming to a different commit
	- Slight code simplification
	- Add VSC SDP check when doing mode_pclk_khz division in
	  dp_bridge_mode_valid

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 5 ++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h | 2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 9 ++++++---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
 4 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 5142aeb705a44..5d84c089e520a 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -442,7 +442,7 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog,
 
 void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
 					u32 rate, u32 stream_rate_khz,
-					bool fixed_nvid)
+					bool fixed_nvid, bool is_ycbcr_420)
 {
 	u32 pixel_m, pixel_n;
 	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
@@ -485,6 +485,9 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
 		nvid = temp;
 	}
 
+	if (is_ycbcr_420)
+		mvid /= 2;
+
 	if (link_rate_hbr2 == rate)
 		nvid *= 2;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 38786e855b51a..6cb5e2a243de2 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -96,7 +96,7 @@ void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
 void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
-				u32 stream_rate_khz, bool fixed_nvid);
+				u32 stream_rate_khz, bool fixed_nvid, bool is_ycbcr_420);
 int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog, u32 pattern);
 u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 6692d81adb195..bffb7bac2c2c8 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -955,7 +955,7 @@ static void dp_ctrl_calc_tu_parameters(struct dp_ctrl_private *ctrl,
 	in.hporch = drm_mode->htotal - drm_mode->hdisplay;
 	in.nlanes = ctrl->link->link_params.num_lanes;
 	in.bpp = ctrl->panel->dp_mode.bpp;
-	in.pixel_enc = 444;
+	in.pixel_enc = ctrl->panel->dp_mode.out_fmt_is_yuv_420 ? 420 : 444;
 	in.dsc_en = 0;
 	in.async_en = 0;
 	in.fec_en = 0;
@@ -1761,6 +1761,8 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 		ctrl->link->link_params.rate = rate;
 		ctrl->link->link_params.num_lanes =
 			ctrl->panel->link_info.num_lanes;
+		if (ctrl->panel->dp_mode.out_fmt_is_yuv_420)
+			pixel_rate >>= 1;
 	}
 
 	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
@@ -1876,7 +1878,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 
 	pixel_rate = pixel_rate_orig = ctrl->panel->dp_mode.drm_mode.clock;
 
-	if (dp_ctrl->wide_bus_en)
+	if (dp_ctrl->wide_bus_en || ctrl->panel->dp_mode.out_fmt_is_yuv_420)
 		pixel_rate >>= 1;
 
 	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
@@ -1915,7 +1917,8 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 
 	dp_catalog_ctrl_config_msa(ctrl->catalog,
 		ctrl->link->link_params.rate,
-		pixel_rate_orig, dp_ctrl_use_fixed_nvid(ctrl));
+		pixel_rate_orig, dp_ctrl_use_fixed_nvid(ctrl),
+		ctrl->panel->dp_mode.out_fmt_is_yuv_420);
 
 	dp_ctrl_setup_tr_unit(ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4b1b79b74bc72..3b7c3a7fd4993 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -934,6 +934,10 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 	link_info = &dp_display->panel->link_info;
 
+	if (drm_mode_is_420_only(&dp->connector->display_info, mode) &&
+	    dp_display->panel->vsc_sdp_supported)
+		mode_pclk_khz /= 2;
+
 	mode_bpp = dp->connector->display_info.bpc * num_components;
 	if (!mode_bpp)
 		mode_bpp = default_bpp;
-- 
2.39.2

