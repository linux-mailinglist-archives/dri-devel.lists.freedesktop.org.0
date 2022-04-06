Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593264F6CAC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 23:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F6110E0FD;
	Wed,  6 Apr 2022 21:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F13010E0FC;
 Wed,  6 Apr 2022 21:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649280503; x=1680816503;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Rd50QDi3gDFXqhwUtUsxEiyWvUNJVdfNBSRh1Ewhqpk=;
 b=sGMvD5VnyxJ5wt3RuJdF10DdLqW/GGLNnOGHU7jR824B4phnjtRXg5o6
 n7tXxyGVJCmCVLl6TVkzjBfaMiNKp05+XqCrhNivvneQaaztmG5st1DIw
 FnxxeOeV7oLCfm5G6ZFG19YtguXbeoPSV9qZBzSRXi7hMGkdUMtbwWIzJ w=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 06 Apr 2022 14:28:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 14:28:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 6 Apr 2022 14:28:22 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 6 Apr 2022 14:28:21 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v2] drm/msm/dp: enhance both connect and disconnect
 pending_timeout handle
Date: Wed, 6 Apr 2022 14:28:13 -0700
Message-ID: <1649280493-4393-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dp_hpd_plug_handle() is responsible for setting up main link and send
uevent to notify user space framework to start video stream. Similarly,
dp_hdp_unplug_handle is responsible to send uevent to notify user space
framework to stop video stream and then tear down main link.
However there are rare cases, such as in the middle of system suspending,
that uevent could not be delivered to user space framework. Therefore
some kind of recover mechanism armed by timer need to be in place in the
case of user space framework does not respond to uevent.

This patch have both dp_conenct_pending_timeout and
dp_disconnect_pending_timeout are used to stop video stream and tear down
main link and eventually restore DP driver state to known default
DISCONNECTED state in the case of timer fired due to framework does not
respond to uevent so that DP driver can recover itself gracefully at next
dongle unplug followed by plugin event.

Changes in v2:
-- replace dp_display_usbpd_disconnect_cb with dp_display_notify_disconnect

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 36 ++++++++++++++++++++-----
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 54 ++++++++++++++++++++++++++++---------
 3 files changed, 72 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index dcd0126..48990fb 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1910,15 +1910,12 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 	return ret;
 }
 
-int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
+int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
 	struct dp_io *dp_io;
 	struct phy *phy;
-	int ret = 0;
-
-	if (!dp_ctrl)
-		return -EINVAL;
+	int ret;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 	dp_io = &ctrl->parser->io;
@@ -1926,7 +1923,34 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
-	dp_catalog_ctrl_reset(ctrl->catalog);
+	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
+	if (ret) {
+		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
+	}
+
+	DRM_DEBUG_DP("Before, phy=%p init_count=%d power_on=%d\n",
+		phy, phy->init_count, phy->power_count);
+
+	phy_power_off(phy);
+
+	DRM_DEBUG_DP("After, phy=%p init_count=%d power_on=%d\n",
+		phy, phy->init_count, phy->power_count);
+
+	return ret;
+}
+
+int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
+{
+	struct dp_ctrl_private *ctrl;
+	struct dp_io *dp_io;
+	struct phy *phy;
+	int ret;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	dp_io = &ctrl->parser->io;
+	phy = dp_io->phy;
+
+	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
 	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, false);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 2433edb..ffafe17 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -22,6 +22,7 @@ struct dp_ctrl {
 int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
+int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 178b774..a6200a5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -451,11 +451,14 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
 
 static int dp_display_usbpd_disconnect_cb(struct device *dev)
 {
+	return 0;
+}
+
+static void dp_display_notify_disconnect(struct device *dev)
+{
 	struct dp_display_private *dp = dev_get_dp_display_private(dev);
 
 	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
-
-	return 0;
 }
 
 static void dp_display_handle_video_request(struct dp_display_private *dp)
@@ -593,10 +596,16 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
 
 	mutex_lock(&dp->event_mutex);
 
+	/*
+	 * main link had been setup but video is not ready yet
+	 * only tear down main link
+	 */
 	state = dp->hpd_state;
 	if (state == ST_CONNECT_PENDING) {
-		dp->hpd_state = ST_CONNECTED;
 		DRM_DEBUG_DP("type=%d\n", dp->dp_display.connector_type);
+		dp_ctrl_off_link(dp->ctrl);
+		dp_display_host_phy_exit(dp);
+		dp->hpd_state = ST_DISCONNECTED;
 	}
 
 	mutex_unlock(&dp->event_mutex);
@@ -645,6 +654,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 		if (dp->link->sink_count == 0) {
 			dp_display_host_phy_exit(dp);
 		}
+		dp_display_notify_disconnect(&dp->pdev->dev);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -661,19 +671,22 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	dp->hpd_state = ST_DISCONNECT_PENDING;
-
 	/* disable HPD plug interrupts */
 	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
 
 	/*
 	 * We don't need separate work for disconnect as
 	 * connect/attention interrupts are disabled
-	 */
-	dp_display_usbpd_disconnect_cb(&dp->pdev->dev);
+	*/
+	dp_display_notify_disconnect(&dp->pdev->dev);
 
-	/* start sentinel checking in case of missing uevent */
-	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
+	if (state == ST_DISPLAY_OFF) {
+		dp->hpd_state = ST_DISCONNECTED;
+	} else {
+		/* start sentinel checking in case of missing uevent */
+		dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
+		dp->hpd_state = ST_DISCONNECT_PENDING;
+	}
 
 	/* signal the disconnect event early to ensure proper teardown */
 	dp_display_handle_plugged_change(&dp->dp_display, false);
@@ -695,10 +708,16 @@ static int dp_disconnect_pending_timeout(struct dp_display_private *dp, u32 data
 
 	mutex_lock(&dp->event_mutex);
 
+	/*
+	 * main link had been set up and video is ready
+	 * tear down main link, video stream and phy
+	 */
 	state =  dp->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
-		dp->hpd_state = ST_DISCONNECTED;
 		DRM_DEBUG_DP("type=%d\n", dp->dp_display.connector_type);
+		dp_ctrl_off(dp->ctrl);
+		dp_display_host_phy_exit(dp);
+		dp->hpd_state = ST_DISCONNECTED;
 	}
 
 	mutex_unlock(&dp->event_mutex);
@@ -1571,6 +1590,12 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	mutex_lock(&dp_display->event_mutex);
 
+	state = dp_display->hpd_state;
+	if (state == ST_DISCONNECTED) {
+		mutex_unlock(&dp_display->event_mutex);
+		return rc;
+	}
+
 	/* stop sentinel checking */
 	dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
 
@@ -1588,8 +1613,6 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 		return rc;
 	}
 
-	state =  dp_display->hpd_state;
-
 	if (state == ST_DISPLAY_OFF)
 		dp_display_host_phy_init(dp_display);
 
@@ -1638,13 +1661,18 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 	/* stop sentinel checking */
 	dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
 
+	state = dp_display->hpd_state;
+	if (state == ST_DISCONNECTED || state == ST_DISPLAY_OFF) {
+		mutex_unlock(&dp_display->event_mutex);
+		return rc;
+	}
+
 	dp_display_disable(dp_display, 0);
 
 	rc = dp_display_unprepare(dp);
 	if (rc)
 		DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
 
-	state =  dp_display->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
 		/* completed disconnection */
 		dp_display->hpd_state = ST_DISCONNECTED;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

