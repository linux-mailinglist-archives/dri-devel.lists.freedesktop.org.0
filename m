Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 058967A299A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 23:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85E110E695;
	Fri, 15 Sep 2023 21:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4049B10E68E;
 Fri, 15 Sep 2023 21:38:46 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38FLGTaQ022634; Fri, 15 Sep 2023 21:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=2q90YbGPf5GvAK62w7P9bKBIxlv1KgvQBPg6bC7IIE4=;
 b=UOpoFOX97rulqpZv7a+h4fS5+xCRpLZLvM7ZU2LLR8N5YUPU+eOAHa5rFeknDin4zQ9c
 h1pVoPz4fh60qgUE5erNiN6SXrkf8+q2XzNfgdQcvYAEu6R5CPjxAuYOJvnZlxemr4Ko
 iANBu6Dp9EHZapWQHdWfkvCvirK4zJy2yeMyU9rAJ+zbQskpwWlH8vVg1/HGBgLDRCyd
 PRFGlyTO1hNdqu/LOURlX03oV38bekX2xORGNsxbUIp+7PRuLkER2aTTrNt1Z5UaG65D
 /R8U7UpHQiKDNXWqzUWM/m0FbYejPHx4UjWCCYw4QXz0Qrgk9B/SFUbHn3lMamYAdR2L aA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g8426x1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 21:38:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38FLceGt023959
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 21:38:40 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 15 Sep 2023 14:38:39 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v3 2/7] drm/msm/dp: replace is_connected with link_ready
Date: Fri, 15 Sep 2023 14:38:16 -0700
Message-ID: <1694813901-26952-3-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Em68GQpN9oikjX8E9TlhtD-Wub17sbZi
X-Proofpoint-ORIG-GUID: Em68GQpN9oikjX8E9TlhtD-Wub17sbZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_18,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=882
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150194
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The is_connected flag is set to true after DP mainlink successfully
finish link training. Replace the is_connected flag with link_ready
flag to avoid confusing.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 19 +++++++++----------
 drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     | 14 +++++++-------
 3 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c217430..18d16c7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -367,12 +367,11 @@ static void dp_display_send_hpd_event(struct msm_dp *dp_display)
 	drm_helper_hpd_irq_event(connector->dev);
 }
 
-
 static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 					    bool hpd)
 {
-	if ((hpd && dp->dp_display.is_connected) ||
-			(!hpd && !dp->dp_display.is_connected)) {
+	if ((hpd && dp->dp_display.link_ready) ||
+			(!hpd && !dp->dp_display.link_ready)) {
 		drm_dbg_dp(dp->drm_dev, "HPD already %s\n",
 				(hpd ? "on" : "off"));
 		return 0;
@@ -382,7 +381,7 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 	if (!hpd)
 		dp->panel->video_test = false;
 
-	dp->dp_display.is_connected = hpd;
+	dp->dp_display.link_ready = hpd;
 
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->dp_display.connector_type, hpd);
@@ -922,7 +921,7 @@ int dp_display_set_plugged_cb(struct msm_dp *dp_display,
 
 	dp_display->plugged_cb = fn;
 	dp_display->codec_dev = codec_dev;
-	plugged = dp_display->is_connected;
+	plugged = dp_display->link_ready;
 	dp_display_handle_plugged_change(dp_display, plugged);
 
 	return 0;
@@ -1352,16 +1351,16 @@ static int dp_pm_resume(struct device *dev)
 	 * also only signal audio when disconnected
 	 */
 	if (dp->link->sink_count) {
-		dp->dp_display.is_connected = true;
+		dp->dp_display.link_ready = true;
 	} else {
-		dp->dp_display.is_connected = false;
+		dp->dp_display.link_ready = false;
 		dp_display_handle_plugged_change(dp_display, false);
 	}
 
 	drm_dbg_dp(dp->drm_dev,
 		"After, type=%d sink=%d conn=%d core_init=%d phy_init=%d power=%d\n",
 		dp->dp_display.connector_type, dp->link->sink_count,
-		dp->dp_display.is_connected, dp->core_initialized,
+		dp->dp_display.link_ready, dp->core_initialized,
 		dp->phy_initialized, dp_display->power_on);
 
 	mutex_unlock(&dp->event_mutex);
@@ -1754,8 +1753,8 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		return;
 	}
 
-	if (!dp_display->is_connected && status == connector_status_connected)
+	if (!dp_display->link_ready && status == connector_status_connected)
 		dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
-	else if (dp_display->is_connected && status == connector_status_disconnected)
+	else if (dp_display->link_ready && status == connector_status_disconnected)
 		dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index b3c08de..d65693e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -16,7 +16,7 @@ struct msm_dp {
 	struct drm_bridge *bridge;
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
-	bool is_connected;
+	bool link_ready;
 	bool audio_enabled;
 	bool power_on;
 	unsigned int connector_type;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 785d766..ee945ca 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -24,10 +24,10 @@ static enum drm_connector_status dp_bridge_detect(struct drm_bridge *bridge)
 
 	dp = to_dp_bridge(bridge)->dp_display;
 
-	drm_dbg_dp(dp->drm_dev, "is_connected = %s\n",
-		(dp->is_connected) ? "true" : "false");
+	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
+		(dp->link_ready) ? "true" : "false");
 
-	return (dp->is_connected) ? connector_status_connected :
+	return (dp->link_ready) ? connector_status_connected :
 					connector_status_disconnected;
 }
 
@@ -40,8 +40,8 @@ static int dp_bridge_atomic_check(struct drm_bridge *bridge,
 
 	dp = to_dp_bridge(bridge)->dp_display;
 
-	drm_dbg_dp(dp->drm_dev, "is_connected = %s\n",
-		(dp->is_connected) ? "true" : "false");
+	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
+		(dp->link_ready) ? "true" : "false");
 
 	/*
 	 * There is no protection in the DRM framework to check if the display
@@ -55,7 +55,7 @@ static int dp_bridge_atomic_check(struct drm_bridge *bridge,
 	 * After that this piece of code can be removed.
 	 */
 	if (bridge->ops & DRM_BRIDGE_OP_HPD)
-		return (dp->is_connected) ? 0 : -ENOTCONN;
+		return (dp->link_ready) ? 0 : -ENOTCONN;
 
 	return 0;
 }
@@ -78,7 +78,7 @@ static int dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *
 	dp = to_dp_bridge(bridge)->dp_display;
 
 	/* pluggable case assumes EDID is read when HPD */
-	if (dp->is_connected) {
+	if (dp->link_ready) {
 		rc = dp_display_get_modes(dp);
 		if (rc <= 0) {
 			DRM_ERROR("failed to get DP sink modes, rc=%d\n", rc);
-- 
2.7.4

