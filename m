Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58199499D41
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 23:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2571F10E236;
	Mon, 24 Jan 2022 22:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95B710E236;
 Mon, 24 Jan 2022 22:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1643064304; x=1674600304;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=6FDMbkNmGDQKhNRRKaO6JLOLagoRuuR/+xN6iL73AhI=;
 b=oW2wYk7FP0nGaX+mUkrcymttl0EU7JbzlREWU1KpuZtFlBTrYlRtQ9AZ
 jBctfp/uNO8eLI9NJa335113wROaaU8+Z80uhPTgJGdF+SlrFzgaXZyj7
 z4z0ht06yh8gW8D96pCBIsYhZ8+VkIOGLX0xA8sD3f44aX9tq61/WYJLH Q=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Jan 2022 14:45:03 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 14:45:02 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 24 Jan 2022 14:45:01 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 24 Jan 2022 14:45:01 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH] drm/msm/dp: add connector type to enhance debug messages
Date: Mon, 24 Jan 2022 14:44:52 -0800
Message-ID: <1643064292-6965-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DP driver is a generic driver which supports both eDP and DP.
For debugging purpose it is required to have capabilities to
differentiate message are generated from eDP or DP. This patch
add connector type into debug messages for this purpose.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 20 +++++------
 drivers/gpu/drm/msm/dp/dp_display.c | 71 ++++++++++++++++++++++++++-----------
 2 files changed, 60 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 245e1b9..dcd0126 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1396,6 +1396,8 @@ void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
 
 	dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	phy_init(phy);
+	DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
+			phy, phy->init_count, phy->power_count);
 }
 
 void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
@@ -1410,6 +1412,8 @@ void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
 
 	dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	phy_exit(phy);
+	DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
+			phy, phy->init_count, phy->power_count);
 }
 
 static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
@@ -1484,6 +1488,8 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	phy_exit(phy);
 	phy_init(phy);
 
+	DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
+			phy, phy->init_count, phy->power_count);
 	return 0;
 }
 
@@ -1895,14 +1901,12 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 
 	phy_power_off(phy);
 
-	DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
-		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
-
 	/* aux channel down, reinit phy */
 	phy_exit(phy);
 	phy_init(phy);
 
-	DRM_DEBUG_DP("DP off link/stream done\n");
+	DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
+			phy, phy->init_count, phy->power_count);
 	return ret;
 }
 
@@ -1933,13 +1937,9 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
 	}
 
-	DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
-		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
-
 	phy_power_off(phy);
-
-	DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
-		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
+	DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
+			phy, phy->init_count, phy->power_count);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e89556ad..0476032 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -376,8 +376,9 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 
 static void dp_display_host_phy_init(struct dp_display_private *dp)
 {
-	DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
-			dp->core_initialized, dp->phy_initialized);
+	DRM_DEBUG_DP("type=%d core_init=%d phy_init=%d\n",
+		dp->dp_display.connector_type, dp->core_initialized,
+		dp->phy_initialized);
 
 	if (!dp->phy_initialized) {
 		dp_ctrl_phy_init(dp->ctrl);
@@ -387,8 +388,9 @@ static void dp_display_host_phy_init(struct dp_display_private *dp)
 
 static void dp_display_host_phy_exit(struct dp_display_private *dp)
 {
-	DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
-			dp->core_initialized, dp->phy_initialized);
+	DRM_DEBUG_DP("type=%d core_init=%d phy_init=%d\n",
+		dp->dp_display.connector_type, dp->core_initialized,
+		dp->phy_initialized);
 
 	if (dp->phy_initialized) {
 		dp_ctrl_phy_exit(dp->ctrl);
@@ -398,7 +400,9 @@ static void dp_display_host_phy_exit(struct dp_display_private *dp)
 
 static void dp_display_host_init(struct dp_display_private *dp)
 {
-	DRM_DEBUG_DP("core_initialized=%d\n", dp->core_initialized);
+	DRM_DEBUG_DP("type=%d core_init=%d phy_init=%d\n",
+		dp->dp_display.connector_type, dp->core_initialized,
+		dp->phy_initialized);
 
 	dp_power_init(dp->power, false);
 	dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
@@ -408,7 +412,9 @@ static void dp_display_host_init(struct dp_display_private *dp)
 
 static void dp_display_host_deinit(struct dp_display_private *dp)
 {
-	DRM_DEBUG_DP("core_initialized=%d\n", dp->core_initialized);
+	DRM_DEBUG_DP("type=%d core_init=%d phy_init=%d\n",
+		dp->dp_display.connector_type, dp->core_initialized,
+		dp->phy_initialized);
 
 	dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
 	dp_aux_deinit(dp->aux);
@@ -519,7 +525,9 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	mutex_lock(&dp->event_mutex);
 
 	state =  dp->hpd_state;
-	DRM_DEBUG_DP("hpd_state=%d\n", state);
+	DRM_DEBUG_DP("Before, type=%d hpd_state=%d\n",
+			dp->dp_display.connector_type, state);
+
 	if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -551,6 +559,8 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	dp_catalog_hpd_config_intr(dp->catalog,
 		DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, true);
 
+	DRM_DEBUG_DP("After, type=%d hpd_state=%d\n",
+			dp->dp_display.connector_type, state);
 	mutex_unlock(&dp->event_mutex);
 
 	/* uevent will complete connection part */
@@ -567,8 +577,10 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
 	mutex_lock(&dp->event_mutex);
 
 	state = dp->hpd_state;
-	if (state == ST_CONNECT_PENDING)
+	if (state == ST_CONNECT_PENDING) {
 		dp->hpd_state = ST_CONNECTED;
+		DRM_DEBUG_DP("type=%d\n", dp->dp_display.connector_type);
+	}
 
 	mutex_unlock(&dp->event_mutex);
 
@@ -601,6 +613,9 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 
 	state = dp->hpd_state;
 
+	DRM_DEBUG_DP("Before, type=%d hpd_state=%d\n",
+			dp->dp_display.connector_type, state);
+
 	/* disable irq_hpd/replug interrupts */
 	dp_catalog_hpd_config_intr(dp->catalog,
 		DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, false);
@@ -643,13 +658,15 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	/* start sentinel checking in case of missing uevent */
 	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
 
-	DRM_DEBUG_DP("hpd_state=%d\n", state);
 	/* signal the disconnect event early to ensure proper teardown */
 	dp_display_handle_plugged_change(&dp->dp_display, false);
 
 	/* enable HDP plug interrupt to prepare for next plugin */
 	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, true);
 
+	DRM_DEBUG_DP("After, type=%d hpd_state=%d\n",
+			dp->dp_display.connector_type, state);
+
 	/* uevent will complete disconnection part */
 	mutex_unlock(&dp->event_mutex);
 	return 0;
@@ -662,8 +679,10 @@ static int dp_disconnect_pending_timeout(struct dp_display_private *dp, u32 data
 	mutex_lock(&dp->event_mutex);
 
 	state =  dp->hpd_state;
-	if (state == ST_DISCONNECT_PENDING)
+	if (state == ST_DISCONNECT_PENDING) {
 		dp->hpd_state = ST_DISCONNECTED;
+		DRM_DEBUG_DP("type=%d\n", dp->dp_display.connector_type);
+	}
 
 	mutex_unlock(&dp->event_mutex);
 
@@ -678,6 +697,9 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 
 	/* irq_hpd can happen at either connected or disconnected state */
 	state =  dp->hpd_state;
+	DRM_DEBUG_DP("Before, type=%d hpd_state=%d\n",
+			dp->dp_display.connector_type, state);
+
 	if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -699,7 +721,8 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 
 	dp_display_usbpd_attention_cb(&dp->pdev->dev);
 
-	DRM_DEBUG_DP("hpd_state=%d\n", state);
+	DRM_DEBUG_DP("After, type=%d hpd_state=%d\n",
+			dp->dp_display.connector_type, state);
 
 	mutex_unlock(&dp->event_mutex);
 
@@ -1152,8 +1175,9 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
 
 	hpd_isr_status = dp_catalog_hpd_get_intr_status(dp->catalog);
 
-	DRM_DEBUG_DP("hpd isr status=%#x\n", hpd_isr_status);
 	if (hpd_isr_status & 0x0F) {
+		DRM_DEBUG_DP("type=%d isr=0x%x\n",
+			dp->dp_display.connector_type, hpd_isr_status);
 		/* hpd related interrupts */
 		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
 			dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
@@ -1306,8 +1330,9 @@ static int dp_pm_resume(struct device *dev)
 
 	mutex_lock(&dp->event_mutex);
 
-	DRM_DEBUG_DP("Before, core_inited=%d power_on=%d\n",
-			dp->core_initialized, dp_display->power_on);
+	DRM_DEBUG_DP("Before, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
+		dp->dp_display.connector_type, dp->core_initialized,
+		dp->phy_initialized, dp_display->power_on);
 
 	/* start from disconnected state */
 	dp->hpd_state = ST_DISCONNECTED;
@@ -1345,9 +1370,11 @@ static int dp_pm_resume(struct device *dev)
 		dp_display_handle_plugged_change(dp_display, false);
 	}
 
-	DRM_DEBUG_DP("After, sink_count=%d is_connected=%d core_inited=%d power_on=%d\n",
-			dp->link->sink_count, dp->dp_display.is_connected,
-			dp->core_initialized, dp_display->power_on);
+	DRM_DEBUG_DP("After, type=%d sink_count=%d is_connected=%d \
+			core_inited=%d phy_inited=%d power_on=%d\n",
+		dp->dp_display.connector_type, dp->link->sink_count,
+		dp->dp_display.is_connected, dp->core_initialized,
+		dp->phy_initialized, dp_display->power_on);
 
 	mutex_unlock(&dp->event_mutex);
 
@@ -1364,8 +1391,9 @@ static int dp_pm_suspend(struct device *dev)
 
 	mutex_lock(&dp->event_mutex);
 
-	DRM_DEBUG_DP("Before, core_inited=%d power_on=%d\n",
-			dp->core_initialized, dp_display->power_on);
+	DRM_DEBUG_DP("Before, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
+		dp->dp_display.connector_type, dp->core_initialized,
+		dp->phy_initialized, dp_display->power_on);
 
 	/* mainlink enabled */
 	if (dp_power_clk_status(dp->power, DP_CTRL_PM))
@@ -1378,8 +1406,9 @@ static int dp_pm_suspend(struct device *dev)
 
 	dp->hpd_state = ST_SUSPENDED;
 
-	DRM_DEBUG_DP("After, core_inited=%d power_on=%d\n",
-			dp->core_initialized, dp_display->power_on);
+	DRM_DEBUG_DP("After, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
+		dp->dp_display.connector_type, dp->core_initialized,
+		dp->phy_initialized, dp_display->power_on);
 
 	mutex_unlock(&dp->event_mutex);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

