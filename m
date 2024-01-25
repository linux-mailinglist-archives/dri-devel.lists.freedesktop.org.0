Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D80F83CC98
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 20:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9494F10E8CD;
	Thu, 25 Jan 2024 19:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E971B10F318;
 Thu, 25 Jan 2024 19:39:04 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40PFL3tn003244; Thu, 25 Jan 2024 19:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=i36zlCKcPS4YqqH1PIIIrSIxfI2DYQlo1ATEecSA7g0=; b=Mr
 YmdUOkXgKWXGnElBwUUvlLM9AIACDU1GeJNeN3YTJZy+GYE75DCs6pEqiZeznKi6
 aDd/umP/+bpJWCxKYG0fla7FfnEr5xK6nphqPpXNWy+tJ2Se43y6tRCsVh5sI5GW
 GwIfFQLZgsEe22ly7hu0WOinzF6Ekv0+l6fVBzLGYRyEtebUhuUcLngBHSj7Zlx9
 LZ6TdY3QCoxyn5LiyO2+PmNj4+0HEhGe/lhDDLcwPP/i/RRGgycCHDyUkNODFE0S
 xALuW34WLbSoaB8ma3W6w89W5BjKPQoVnCWyGDNd+NcjdOnOcPqGYTNsIV+f3dzH
 5BNhimf267kKWSOkUyjA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vufk9aap4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jan 2024 19:39:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40PJd17o013802
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jan 2024 19:39:01 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 25 Jan 2024 11:39:00 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH 05/17] drm/msm/dp: add an API to indicate if sink supports VSC
 SDP
Date: Thu, 25 Jan 2024 11:38:14 -0800
Message-ID: <20240125193834.7065-6-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240125193834.7065-1-quic_parellan@quicinc.com>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: e7B4Frk_C95JMy78htMSqGMK2xPvKssZ
X-Proofpoint-ORIG-GUID: e7B4Frk_C95JMy78htMSqGMK2xPvKssZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_12,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250142
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
Cc: neil.armstrong@linaro.org, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, dmitry.baryshkov@linaro.org,
 Paloma Arellano <quic_parellan@quicinc.com>, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YUV420 format is supported only in the VSC SDP packet and not through
MSA. Hence add an API which indicates the sink support which can be used
by the rest of the DP programming.

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
 drivers/gpu/drm/msm/dp/dp_panel.c   | 35 +++++++++++++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
 3 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ddac55f45a722..f6b3b6ca242f8 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1617,7 +1617,8 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
 
 	dp_display->dp_mode.out_fmt_is_yuv_420 =
-		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode);
+		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
+		dp_panel_vsc_sdp_supported(dp_display->panel);
 
 	/* populate wide_bus_support to different layers */
 	dp_display->ctrl->wide_bus_en =
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 127f6af995cd1..af7820b6d35ec 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -17,6 +17,9 @@ struct dp_panel_private {
 	struct dp_link *link;
 	struct dp_catalog *catalog;
 	bool panel_on;
+	bool vsc_supported;
+	u8 major;
+	u8 minor;
 };
 
 static void dp_panel_read_psr_cap(struct dp_panel_private *panel)
@@ -43,9 +46,10 @@ static void dp_panel_read_psr_cap(struct dp_panel_private *panel)
 static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 {
 	int rc;
+	ssize_t rlen;
 	struct dp_panel_private *panel;
 	struct dp_link_info *link_info;
-	u8 *dpcd, major, minor;
+	u8 *dpcd, rx_feature;
 
 	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
 	dpcd = dp_panel->dpcd;
@@ -53,10 +57,19 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 	if (rc)
 		return rc;
 
+	rlen = drm_dp_dpcd_read(panel->aux, DP_DPRX_FEATURE_ENUMERATION_LIST, &rx_feature, 1);
+	if (rlen != 1) {
+		panel->vsc_supported = false;
+		pr_debug("failed to read DP_DPRX_FEATURE_ENUMERATION_LIST\n");
+	} else {
+		panel->vsc_supported = !!(rx_feature & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED);
+		pr_debug("vsc=%d\n", panel->vsc_supported);
+	}
+
 	link_info = &dp_panel->link_info;
 	link_info->revision = dpcd[DP_DPCD_REV];
-	major = (link_info->revision >> 4) & 0x0f;
-	minor = link_info->revision & 0x0f;
+	panel->major = (link_info->revision >> 4) & 0x0f;
+	panel->minor = link_info->revision & 0x0f;
 
 	link_info->rate = drm_dp_max_link_rate(dpcd);
 	link_info->num_lanes = drm_dp_max_lane_count(dpcd);
@@ -69,7 +82,7 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 	if (link_info->rate > dp_panel->max_dp_link_rate)
 		link_info->rate = dp_panel->max_dp_link_rate;
 
-	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
+	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", panel->major, panel->minor);
 	drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
 	drm_dbg_dp(panel->drm_dev, "lane_count=%d\n", link_info->num_lanes);
 
@@ -280,6 +293,20 @@ void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable)
 	dp_catalog_panel_tpg_enable(catalog, &panel->dp_panel.dp_mode.drm_mode);
 }
 
+bool dp_panel_vsc_sdp_supported(struct dp_panel *dp_panel)
+{
+	struct dp_panel_private *panel;
+
+	if (!dp_panel) {
+		pr_err("invalid input\n");
+		return false;
+	}
+
+	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+
+	return panel->major >= 1 && panel->minor >= 3 && panel->vsc_supported;
+}
+
 void dp_panel_dump_regs(struct dp_panel *dp_panel)
 {
 	struct dp_catalog *catalog;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 6ec68be9f2366..590eca5ce304b 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -66,6 +66,7 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
 		struct drm_connector *connector);
 void dp_panel_handle_sink_request(struct dp_panel *dp_panel);
 void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable);
+bool dp_panel_vsc_sdp_supported(struct dp_panel *dp_panel);
 
 /**
  * is_link_rate_valid() - validates the link rate
-- 
2.39.2

