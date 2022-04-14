Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0B9501D0A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 23:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E017410E047;
	Thu, 14 Apr 2022 21:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8F710E047;
 Thu, 14 Apr 2022 21:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649970234; x=1681506234;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=DOVj14wIPmghHmdwcXtsqpmn1bFSllglRoHEVNyMhK8=;
 b=nlkzXG2BFxB8/kRSYLIWZ5PBCt3z1p4n1w7ubWDS37/CsXBpGOXq4lXC
 ZbS6O1ZHhe6nB0BMOQ5Ud531UgeHu3Ff1W7m6LBCjnJY3xf8BXU+hDgCb
 pV/8QV9x5kFEblaXXA8AGJVHvJqNtA/cYh37AYyiYvEn+uzOYWVkzQQAc 0=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Apr 2022 14:03:53 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 14:03:52 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Apr 2022 14:03:52 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Apr 2022 14:03:51 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH] drm/msm/dp: tear down main link at unplug handle immediately
Date: Thu, 14 Apr 2022 14:03:43 -0700
Message-ID: <1649970223-9522-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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

Two stages are required to setup up main link to be ready to transmit
video stream.
Stage 1: dp_hpd_plug_handle() perform link training to set up main link
stage 2: user space framework (msm_dp_display_enable()) to enable pixel
clock and transfer main link to video ready state.

At current implementation, when dongle unplugged dp_hdp_unplug_handle()
has to wait until stage 2 completed before it can send link down uevent
to user space framework to disable pixel clock followed by tearing down
main link.  This introduce unnecessary latency if dongle unplugged happen
after stage 1 and before stage 2. It also has possibility leave main link
stay at ready state after dongle unplugged if framework does not response
to link down uevent notification. This will prevent next dongle plug in
from working. This scenario could possibly happen when dongle unplug while
system in the middle of suspending.

This patch allow unplug handle to tear down main link and notify
framework link down immediately if dongle unplugged happen after
stage 1 and before stage 2. With this approach, dp driver is much
more resilient to any different scenarios. Also redundant both
dp_connect_pending_timeout() and dp_disconnect_pending_timeout()
are removed to reduce logic complexity.

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  29 +++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 101 +++++++++++-------------------------
 3 files changed, 59 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 1a13e50..c2d060d 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1891,6 +1891,35 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 	return ret;
 }
 
+int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
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
+
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
 int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
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
index 01453db..f5bd8f5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -57,14 +57,11 @@ enum {
 	EV_IRQ_HPD_INT,
 	EV_HPD_UNPLUG_INT,
 	EV_USER_NOTIFICATION,
-	EV_CONNECT_PENDING_TIMEOUT,
-	EV_DISCONNECT_PENDING_TIMEOUT,
 };
 
 #define EVENT_TIMEOUT	(HZ/10)	/* 100ms */
 #define DP_EVENT_Q_MAX	8
 
-#define DP_TIMEOUT_5_SECOND	(5000/EVENT_TIMEOUT)
 #define DP_TIMEOUT_NONE		0
 
 #define WAIT_FOR_RESUME_TIMEOUT_JIFFIES (HZ / 2)
@@ -430,6 +427,11 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
 
 static int dp_display_usbpd_disconnect_cb(struct device *dev)
 {
+	return 0;
+}
+
+static int dp_display_notify_disconnect(struct device *dev)
+{
 	struct dp_display_private *dp = dev_get_dp_display_private(dev);
 
 	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
@@ -512,7 +514,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 {
 	struct dp_usbpd *hpd = dp->usbpd;
 	u32 state;
-	u32 tout = DP_TIMEOUT_5_SECOND;
 	int ret;
 
 	if (!hpd)
@@ -539,14 +540,11 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	dp->hpd_state = ST_CONNECT_PENDING;
-
 	ret = dp_display_usbpd_configure_cb(&dp->pdev->dev);
 	if (ret) {	/* link train failed */
 		dp->hpd_state = ST_DISCONNECTED;
 	} else {
-		/* start sentinel checking in case of missing uevent */
-		dp_add_event(dp, EV_CONNECT_PENDING_TIMEOUT, 0, tout);
+		dp->hpd_state = ST_CONNECT_PENDING;
 	}
 
 	/* enable HDP irq_hpd/replug interrupt */
@@ -562,21 +560,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 static int dp_display_enable(struct dp_display_private *dp, u32 data);
 static int dp_display_disable(struct dp_display_private *dp, u32 data);
 
-static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
-{
-	u32 state;
-
-	mutex_lock(&dp->event_mutex);
-
-	state = dp->hpd_state;
-	if (state == ST_CONNECT_PENDING)
-		dp->hpd_state = ST_CONNECTED;
-
-	mutex_unlock(&dp->event_mutex);
-
-	return 0;
-}
-
 static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
 		bool plugged)
 {
@@ -615,24 +598,21 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 		if (dp->link->sink_count == 0) {
 			dp_display_host_phy_exit(dp);
 		}
+		dp_display_notify_disconnect(&dp->pdev->dev);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
-	}
-
-	if (state == ST_DISCONNECT_PENDING) {
+	} else if (state == ST_DISCONNECT_PENDING) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
-	}
-
-	if (state == ST_CONNECT_PENDING) {
-		/* wait until CONNECTED */
-		dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 1); /* delay = 1 */
+	} else if (state == ST_CONNECT_PENDING) {
+		dp_ctrl_off_link(dp->ctrl);
+		dp_display_host_phy_exit(dp);
+		dp->hpd_state = ST_DISCONNECTED;
+		dp_display_notify_disconnect(&dp->pdev->dev);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
 
-	dp->hpd_state = ST_DISCONNECT_PENDING;
-
 	/* disable HPD plug interrupts */
 	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
 
@@ -640,10 +620,13 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	 * We don't need separate work for disconnect as
 	 * connect/attention interrupts are disabled
 	 */
-	dp_display_usbpd_disconnect_cb(&dp->pdev->dev);
+	dp_display_notify_disconnect(&dp->pdev->dev);
 
-	/* start sentinel checking in case of missing uevent */
-	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
+	if (state == ST_DISPLAY_OFF) {
+		dp->hpd_state = ST_DISCONNECTED;
+	} else {
+		dp->hpd_state = ST_DISCONNECT_PENDING;
+	}
 
 	DRM_DEBUG_DP("hpd_state=%d\n", state);
 	/* signal the disconnect event early to ensure proper teardown */
@@ -657,21 +640,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	return 0;
 }
 
-static int dp_disconnect_pending_timeout(struct dp_display_private *dp, u32 data)
-{
-	u32 state;
-
-	mutex_lock(&dp->event_mutex);
-
-	state =  dp->hpd_state;
-	if (state == ST_DISCONNECT_PENDING)
-		dp->hpd_state = ST_DISCONNECTED;
-
-	mutex_unlock(&dp->event_mutex);
-
-	return 0;
-}
-
 static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 {
 	u32 state;
@@ -685,13 +653,6 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	if (state == ST_CONNECT_PENDING) {
-		/* wait until ST_CONNECTED */
-		dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
-
 	if (state == ST_CONNECT_PENDING || state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_CONNECTED */
 		dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
@@ -1116,14 +1077,6 @@ static int hpd_event_thread(void *data)
 			dp_display_send_hpd_notification(dp_priv,
 						todo->data);
 			break;
-		case EV_CONNECT_PENDING_TIMEOUT:
-			dp_connect_pending_timeout(dp_priv,
-						todo->data);
-			break;
-		case EV_DISCONNECT_PENDING_TIMEOUT:
-			dp_disconnect_pending_timeout(dp_priv,
-						todo->data);
-			break;
 		default:
 			break;
 		}
@@ -1160,8 +1113,6 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
 			dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
 
 		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-			/* stop sentinel connect pending checking */
-			dp_del_event(dp, EV_CONNECT_PENDING_TIMEOUT);
 			dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
 		}
 
@@ -1529,8 +1480,11 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	mutex_lock(&dp_display->event_mutex);
 
-	/* stop sentinel checking */
-	dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
+	state = dp_display->hpd_state;
+	if (state != ST_DISPLAY_OFF && state != ST_CONNECT_PENDING) {
+		mutex_unlock(&dp_display->event_mutex);
+		return rc;
+	}
 
 	rc = dp_display_set_mode(dp, &dp_display->dp_mode);
 	if (rc) {
@@ -1593,8 +1547,11 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	mutex_lock(&dp_display->event_mutex);
 
-	/* stop sentinel checking */
-	dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
+	state = dp_display->hpd_state;
+	if (state != ST_DISCONNECT_PENDING && state != ST_CONNECTED) {
+		mutex_unlock(&dp_display->event_mutex);
+		return rc;
+	}
 
 	dp_display_disable(dp_display, 0);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

