Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1579E3D04B8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 00:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C3F6E364;
	Tue, 20 Jul 2021 22:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C816E364
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 22:39:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626820793; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=xcgwHh5tl/wnq223kHMKu8lruSxqe3r0xjF0PcaL1A8=;
 b=F6eJ7KgSujmH52tLBgrwkAo+WAs20+TvHxDok6H3xTLptu7N5+HOV8D0H/b88VwDXs24nsQn
 clENRaasD9Re/0gYEw0gHYqxTHuPjAazWJn8D8gWe0I1AQEnfYWvEKgiTjOZYjKMouYBlRN8
 XPpEQLS8BRyH8Uvb6dJp7rY5ZZ4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60f750ace31d882d18d2edc8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Jul 2021 22:39:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8F4C9C43143; Tue, 20 Jul 2021 22:39:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from nganji-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: maitreye)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 908FAC433F1;
 Tue, 20 Jul 2021 22:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 908FAC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=maitreye@codeaurora.org
From: maitreye <maitreye@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/msm/dp: add logs across DP driver for ease of debugging
Date: Tue, 20 Jul 2021 15:39:30 -0700
Message-Id: <1626820770-28158-1-git-send-email-maitreye@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
Cc: Maitreyee Rao <maitreye@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 abhinavk@codeaurora.org, swboyd@chromium.org, khsieh@codeaurora.org,
 seanpaul@chromium.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maitreyee Rao <maitreye@codeaurora.org>

Add trace points across the MSM DP driver to help debug
interop issues.

Changes in v3:
 - Got rid of redundant log messages.
 - Unstuck colon from printf specifier in various places.

Signed-off-by: Maitreyee Rao <maitreye@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c |  8 ++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  5 ++++-
 drivers/gpu/drm/msm/dp/dp_display.c | 14 ++++++++++++++
 drivers/gpu/drm/msm/dp/dp_link.c    | 17 ++++++++++-------
 drivers/gpu/drm/msm/dp/dp_power.c   |  3 +++
 5 files changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 32f3575..958d3fa3 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -372,6 +372,7 @@ void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog,
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
 
+	DRM_DEBUG_DP("enable=%d\n", enable);
 	if (enable) {
 		/*
 		 * To make sure link reg writes happens before other operation,
@@ -580,6 +581,7 @@ void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
 
 	config = (en ? config | intr_mask : config & ~intr_mask);
 
+	DRM_DEBUG_DP("intr_mask=%#x config=%#x\n", intr_mask, config);
 	dp_write_aux(catalog, REG_DP_DP_HPD_INT_MASK,
 				config & DP_DP_HPD_INT_MASK);
 }
@@ -610,6 +612,7 @@ u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog)
 	u32 status;
 
 	status = dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
+	DRM_DEBUG_DP("aux status: %#x\n", status);
 	status >>= DP_DP_HPD_STATE_STATUS_BITS_SHIFT;
 	status &= DP_DP_HPD_STATE_STATUS_BITS_MASK;
 
@@ -685,6 +688,7 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
 	/* Make sure to clear the current pattern before starting a new one */
 	dp_write_link(catalog, REG_DP_STATE_CTRL, 0x0);
 
+	DRM_DEBUG_DP("pattern: %#x\n", pattern);
 	switch (pattern) {
 	case DP_PHY_TEST_PATTERN_D10_2:
 		dp_write_link(catalog, REG_DP_STATE_CTRL,
@@ -745,7 +749,7 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
 				DP_STATE_CTRL_LINK_TRAINING_PATTERN4);
 		break;
 	default:
-		DRM_DEBUG_DP("No valid test pattern requested:0x%x\n", pattern);
+		DRM_DEBUG_DP("No valid test pattern requested: %#x\n", pattern);
 		break;
 	}
 }
@@ -928,7 +932,7 @@ void dp_catalog_audio_config_acr(struct dp_catalog *dp_catalog)
 	select = dp_catalog->audio_data;
 	acr_ctrl = select << 4 | BIT(31) | BIT(8) | BIT(14);
 
-	DRM_DEBUG_DP("select = 0x%x, acr_ctrl = 0x%x\n", select, acr_ctrl);
+	DRM_DEBUG_DP("select: %#x, acr_ctrl: %#x\n", select, acr_ctrl);
 
 	dp_write_link(catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 2a8955c..72de71a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -122,7 +122,7 @@ void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl)
 			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
 		pr_warn("PUSH_IDLE pattern timedout\n");
 
-	pr_debug("mainlink off done\n");
+	DRM_DEBUG_DP("mainlink off done\n");
 }
 
 static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
@@ -1013,6 +1013,8 @@ static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
 	u32 voltage_swing_level = link->phy_params.v_level;
 	u32 pre_emphasis_level = link->phy_params.p_level;
 
+	DRM_DEBUG_DP("voltage level: %d emphasis level: %d\n", voltage_swing_level,
+			pre_emphasis_level);
 	ret = dp_catalog_ctrl_update_vx_px(ctrl->catalog,
 		voltage_swing_level, pre_emphasis_level);
 
@@ -1384,6 +1386,7 @@ int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
 	if (reset)
 		dp_catalog_ctrl_reset(ctrl->catalog);
 
+	DRM_DEBUG_DP("flip=%d\n", flip);
 	dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	phy_init(phy);
 	dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cf9c645..97e21fa 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -275,6 +275,8 @@ static bool dp_display_is_ds_bridge(struct dp_panel *panel)
 
 static bool dp_display_is_sink_count_zero(struct dp_display_private *dp)
 {
+	DRM_DEBUG_DP("present=%#x sink_count=%d\n", dp->panel->dpcd[DP_DOWNSTREAMPORT_PRESENT],
+			dp->link->sink_count);
 	return dp_display_is_ds_bridge(dp->panel) &&
 		(dp->link->sink_count == 0);
 }
@@ -320,6 +322,7 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 
 	dp->dp_display.is_connected = hpd;
 
+	DRM_DEBUG_DP("hpd=%d\n", hpd);
 	dp_display_send_hpd_event(&dp->dp_display);
 
 	return 0;
@@ -369,6 +372,7 @@ static void dp_display_host_init(struct dp_display_private *dp, int reset)
 {
 	bool flip = false;
 
+	DRM_DEBUG_DP("core_initialized=%d\n", dp->core_initialized);
 	if (dp->core_initialized) {
 		DRM_DEBUG_DP("DP core already initialized\n");
 		return;
@@ -483,8 +487,10 @@ static int dp_display_handle_irq_hpd(struct dp_display_private *dp)
 {
 	u32 sink_request = dp->link->sink_request;
 
+	DRM_DEBUG_DP("%d\n", sink_request);
 	if (dp->hpd_state == ST_DISCONNECTED) {
 		if (sink_request & DP_LINK_STATUS_UPDATED) {
+			DRM_DEBUG_DP("Disconnected sink_count: %d\n", sink_request);
 			DRM_ERROR("Disconnected, no DP_LINK_STATUS_UPDATED\n");
 			return -EINVAL;
 		}
@@ -509,6 +515,7 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 		DRM_ERROR("invalid dev\n");
 		return -EINVAL;
 	}
+	DRM_DEBUG_DP("sink_request: %d\n", sink_request);
 
 	dp = container_of(g_dp_display,
 			struct dp_display_private, dp_display);
@@ -523,6 +530,7 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 	rc = dp_link_process_request(dp->link);
 	if (!rc) {
 		sink_request = dp->link->sink_request;
+		DRM_DEBUG_DP("hpd_state=%d sink_count=%d\n", dp->hpd_state, sink_request);
 		if (sink_request & DS_PORT_STATUS_CHANGED)
 			rc = dp_display_handle_port_ststus_changed(dp);
 		else
@@ -545,6 +553,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	mutex_lock(&dp->event_mutex);
 
 	state =  dp->hpd_state;
+	DRM_DEBUG_DP("hpd_state=%d\n", state);
 	if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -680,6 +689,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	/* start sentinel checking in case of missing uevent */
 	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
 
+	DRM_DEBUG_DP("hpd_state=%d\n", state);
 	/* signal the disconnect event early to ensure proper teardown */
 	dp_display_handle_plugged_change(g_dp_display, false);
 
@@ -738,6 +748,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 	if (ret == -ECONNRESET) { /* cable unplugged */
 		dp->core_initialized = false;
 	}
+	DRM_DEBUG_DP("hpd_state=%d\n", state);
 
 	mutex_unlock(&dp->event_mutex);
 
@@ -882,6 +893,7 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
 
 	dp_display = g_dp_display;
 
+	DRM_DEBUG_DP("sink_count=%d\n", dp->link->sink_count);
 	if (dp_display->power_on) {
 		DRM_DEBUG_DP("Link already setup, return\n");
 		return 0;
@@ -943,6 +955,7 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 
 	dp_display->power_on = false;
 
+	DRM_DEBUG_DP("sink count: %d\n", dp->link->sink_count);
 	return 0;
 }
 
@@ -1190,6 +1203,7 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
 
 	hpd_isr_status = dp_catalog_hpd_get_intr_status(dp->catalog);
 
+	DRM_DEBUG_DP("hpd isr status=%#x\n", hpd_isr_status);
 	if (hpd_isr_status & 0x0F) {
 		/* hpd related interrupts */
 		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK ||
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index be986da..316e8e6 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -1036,43 +1036,46 @@ int dp_link_process_request(struct dp_link *dp_link)
 
 	if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
 		dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
-		return ret;
+		goto out;
 	}
 
 	ret = dp_link_process_ds_port_status_change(link);
 	if (!ret) {
 		dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
-		return ret;
+		goto out;
 	}
 
 	ret = dp_link_process_link_training_request(link);
 	if (!ret) {
 		dp_link->sink_request |= DP_TEST_LINK_TRAINING;
-		return ret;
+		goto out;
 	}
 
 	ret = dp_link_process_phy_test_pattern_request(link);
 	if (!ret) {
 		dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
-		return ret;
+		goto out;
 	}
 
 	ret = dp_link_process_link_status_update(link);
 	if (!ret) {
 		dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
-		return ret;
+		goto out;
 	}
 
 	if (dp_link_is_video_pattern_requested(link)) {
-		ret = 0;
 		dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
+		goto out;
 	}
 
 	if (dp_link_is_audio_pattern_requested(link)) {
 		dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out;
 	}
 
+out:
+	DRM_DEBUG_DP("sink request=%#x", dp_link->sink_request);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index 3961ba4..37c214b 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -208,6 +208,9 @@ static int dp_power_clk_set_rate(struct dp_power_private *power,
 
 int dp_power_clk_status(struct dp_power *dp_power, enum dp_pm_type pm_type)
 {
+	DRM_DEBUG_DP("core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
+			dp_power->core_clks_on, dp_power->link_clks_on, dp_power->stream_clks_on);
+
 	if (pm_type == DP_CORE_PM)
 		return dp_power->core_clks_on;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

