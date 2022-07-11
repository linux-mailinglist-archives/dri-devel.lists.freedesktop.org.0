Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA745674EE
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 19:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411E5926C5;
	Tue,  5 Jul 2022 17:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBE3926AD;
 Tue,  5 Jul 2022 17:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657040478; x=1688576478;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=TdFj1sY11wCtRCrQj+U5WqDgdqegKwcBN7eTJ/P7Q4s=;
 b=G3/HUc8/v2ZpdD/trlzcUMkoeqCv2oPGmBhs6b9TMTKAsPdVNmc0L4Qw
 Cs1Tlp40wDmRN5aa0TqK1j4kyQZygPL9cZ/yjJV+0XRQ7RbwXZJ7bBh9T
 sWaRHYJDupVza+3qA5Fe+5SyhuW5Xl2xjUhNY6XrC8pUlRl7ydYzT/mhq 0=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 05 Jul 2022 10:01:17 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 Jul 2022 10:01:15 -0700
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg01-blr.qualcomm.com with ESMTP; 05 Jul 2022 22:31:00 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 008563CBE; Tue,  5 Jul 2022 22:30:58 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v4 3/7] drm/msm/dp: Add basic PSR support for eDP
Date: Tue,  5 Jul 2022 22:30:41 +0530
Message-Id: <1657040445-13067-4-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1657040445-13067-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1657040445-13067-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com, quic_khsieh@quicinc.com,
 dianders@chromium.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for basic panel self refresh (PSR) feature for eDP.
Add a new interface to set PSR state in the sink from DPU.
Program the eDP controller to issue PSR enter and exit SDP to
the sink.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c |  81 ++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |   4 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  76 ++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   3 +
 drivers/gpu/drm/msm/dp/dp_display.c |  31 +++---
 drivers/gpu/drm/msm/dp/dp_display.h |   2 +
 drivers/gpu/drm/msm/dp/dp_drm.c     | 186 ++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_drm.h     |   9 +-
 drivers/gpu/drm/msm/dp/dp_link.c    |  36 +++++++
 drivers/gpu/drm/msm/dp/dp_panel.c   |  22 +++++
 drivers/gpu/drm/msm/dp/dp_panel.h   |   6 ++
 drivers/gpu/drm/msm/dp/dp_reg.h     |  27 ++++++
 12 files changed, 458 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 7257515..b9021ed 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -47,6 +47,14 @@
 #define DP_INTERRUPT_STATUS2_MASK \
 	(DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_MASK_SHIFT)
 
+#define DP_INTERRUPT_STATUS4 \
+	(PSR_UPDATE_INT | PSR_CAPTURE_INT | PSR_EXIT_INT | \
+	PSR_UPDATE_ERROR_INT | PSR_WAKE_ERROR_INT)
+
+#define DP_INTERRUPT_MASK4 \
+	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
+	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
+
 struct dp_catalog_private {
 	struct device *dev;
 	struct drm_device *drm_dev;
@@ -359,6 +367,24 @@ void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog)
 			ln_mapping);
 }
 
+void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog,
+						bool enable)
+{
+	u32 val;
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	val = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+	val &= ~DP_MAINLINK_CTRL_ENABLE;
+
+	if (enable)
+		val |= DP_MAINLINK_CTRL_ENABLE;
+	else
+		val &= ~DP_MAINLINK_CTRL_ENABLE;
+
+	dp_write_link(catalog, REG_DP_MAINLINK_CTRL, val);
+}
+
 void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog,
 						bool enable)
 {
@@ -610,6 +636,47 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
 	dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
 }
 
+static void dp_catalog_enable_sdp(struct dp_catalog_private *catalog)
+{
+	/* trigger sdp */
+	dp_write_link(catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
+	dp_write_link(catalog, MMSS_DP_SDP_CFG3, !UPDATE_SDP);
+}
+
+void dp_catalog_ctrl_config_psr(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+	u32 config;
+
+	/* enable PSR1 function */
+	config = dp_read_link(catalog, REG_PSR_CONFIG);
+	config |= PSR1_SUPPORTED;
+	dp_write_link(catalog, REG_PSR_CONFIG, config);
+
+	dp_write_ahb(catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
+	dp_catalog_enable_sdp(catalog);
+}
+
+void dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool enter)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+			struct dp_catalog_private, dp_catalog);
+	u32 cmd;
+
+	cmd = dp_read_link(catalog, REG_PSR_CMD);
+
+	cmd &= ~(PSR_ENTER | PSR_EXIT);
+
+	if (enter)
+		cmd |= PSR_ENTER;
+	else
+		cmd |= PSR_EXIT;
+
+	dp_catalog_enable_sdp(catalog);
+	dp_write_link(catalog, REG_PSR_CMD, cmd);
+}
+
 u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
@@ -645,6 +712,20 @@ u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog)
 	return isr & (mask | ~DP_DP_HPD_INT_MASK);
 }
 
+int dp_catalog_ctrl_read_psr_interrupt_status(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+	u32 intr, intr_ack;
+
+	intr = dp_read_ahb(catalog, REG_DP_INTR_STATUS4);
+	intr_ack = (intr & DP_INTERRUPT_STATUS4)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	dp_write_ahb(catalog, REG_DP_INTR_STATUS4, intr_ack);
+
+	return intr;
+}
+
 int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 1f717f4..6454845 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -93,6 +93,7 @@ void dp_catalog_ctrl_state_ctrl(struct dp_catalog *dp_catalog, u32 state);
 void dp_catalog_ctrl_config_ctrl(struct dp_catalog *dp_catalog, u32 config);
 void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
+void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
 void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
 				u32 stream_rate_khz, bool fixed_nvid);
@@ -104,12 +105,15 @@ void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
 			u32 intr_mask, bool en);
 void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog);
+void dp_catalog_ctrl_config_psr(struct dp_catalog *dp_catalog);
+void dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool enter);
 u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog);
 u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog);
 int dp_catalog_ctrl_update_vx_px(struct dp_catalog *dp_catalog, u8 v_level,
 				u8 p_level);
 int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog);
+int dp_catalog_ctrl_read_psr_interrupt_status(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_update_transfer_unit(struct dp_catalog *dp_catalog,
 				u32 dp_tu, u32 valid_boundary,
 				u32 valid_boundary2);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index d21971b..485e8f5 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -22,6 +22,7 @@
 
 #define DP_KHZ_TO_HZ 1000
 #define IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES	(30 * HZ / 1000) /* 30 ms */
+#define PSR_OPERATION_COMPLETION_TIMEOUT_JIFFIES       (300 * HZ / 1000) /* 300 ms */
 #define WAIT_FOR_VIDEO_READY_TIMEOUT_JIFFIES (HZ / 2)
 
 #define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
@@ -80,6 +81,7 @@ struct dp_ctrl_private {
 	struct dp_catalog *catalog;
 
 	struct completion idle_comp;
+	struct completion psr_op_comp;
 	struct completion video_comp;
 };
 
@@ -153,6 +155,9 @@ static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
 	config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
 	config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
 
+	if (ctrl->panel->psr_cap.version)
+		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
+
 	dp_catalog_ctrl_config_ctrl(ctrl->catalog, config);
 }
 
@@ -1382,11 +1387,64 @@ static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
 	return ret;
 }
 
-void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
+void dp_ctrl_config_psr(struct dp_ctrl *dp_ctrl)
 {
-	struct dp_ctrl_private *ctrl;
+	u8 cfg;
+	struct dp_ctrl_private *ctrl = container_of(dp_ctrl,
+			struct dp_ctrl_private, dp_ctrl);
 
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	if (!ctrl->panel->psr_cap.version)
+		return;
+
+	dp_catalog_ctrl_config_psr(ctrl->catalog);
+
+	cfg = DP_PSR_ENABLE;
+	drm_dp_dpcd_write(ctrl->aux, DP_PSR_EN_CFG, &cfg, 1);
+}
+
+void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enter)
+{
+	struct dp_ctrl_private *ctrl = container_of(dp_ctrl,
+			struct dp_ctrl_private, dp_ctrl);
+
+	if (!ctrl->panel->psr_cap.version)
+		return;
+
+	/*
+	 * When entering PSR,
+	 * 1. Send PSR enter SDP and wait for the PSR_UPDATE_INT
+	 * 2. Turn off video
+	 * 3. Disable the mainlink
+	 *
+	 * When exiting PSR,
+	 * 1. Enable the mainlink
+	 * 2. Send the PSR exit SDP
+	 */
+	if (enter) {
+		reinit_completion(&ctrl->psr_op_comp);
+		dp_catalog_ctrl_set_psr(ctrl->catalog, true);
+
+		if (!wait_for_completion_timeout(&ctrl->psr_op_comp,
+			PSR_OPERATION_COMPLETION_TIMEOUT_JIFFIES)) {
+			DRM_ERROR("PSR_ENTRY timedout\n");
+			dp_catalog_ctrl_set_psr(ctrl->catalog, false);
+			return;
+		}
+
+		dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+
+		dp_catalog_ctrl_psr_mainlink_enable(ctrl->catalog, false);
+	} else {
+		dp_catalog_ctrl_psr_mainlink_enable(ctrl->catalog, true);
+
+		dp_catalog_ctrl_set_psr(ctrl->catalog, false);
+	}
+}
+
+void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
+{
+	struct dp_ctrl_private *ctrl = container_of(dp_ctrl,
+			struct dp_ctrl_private, dp_ctrl);
 
 	dp_catalog_ctrl_reset(ctrl->catalog);
 
@@ -1997,6 +2055,17 @@ void dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 
+	if (ctrl->panel->psr_cap.version) {
+		isr = dp_catalog_ctrl_read_psr_interrupt_status(ctrl->catalog);
+
+		if (isr == PSR_UPDATE_INT)
+			drm_dbg_dp(ctrl->drm_dev, "PSR frame update done\n");
+		else if (isr == PSR_EXIT_INT)
+			drm_dbg_dp(ctrl->drm_dev, "PSR exit done\n");
+
+		complete(&ctrl->psr_op_comp);
+	}
+
 	isr = dp_catalog_ctrl_get_interrupt(ctrl->catalog);
 
 	if (isr & DP_CTRL_INTR_READY_FOR_VIDEO) {
@@ -2043,6 +2112,7 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 		dev_err(dev, "failed to add DP OPP table\n");
 
 	init_completion(&ctrl->idle_comp);
+	init_completion(&ctrl->psr_op_comp);
 	init_completion(&ctrl->video_comp);
 
 	/* in parameters */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 0745fde..be074ae 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -38,4 +38,7 @@ void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_irq_phy_exit(struct dp_ctrl *dp_ctrl);
 
+void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enable);
+void dp_ctrl_config_psr(struct dp_ctrl *dp_ctrl);
+
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bce7793..2b3ec6b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -388,6 +388,8 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 
 	edid = dp->panel->edid;
 
+	dp->dp_display.psr_supported = !!dp->panel->psr_cap.version;
+
 	dp->audio_supported = drm_detect_monitor_audio(edid);
 	dp_panel_handle_sink_request(dp->panel);
 
@@ -895,6 +897,10 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
 
 	/* signal the connect event late to synchronize video and display */
 	dp_display_handle_plugged_change(dp_display, true);
+
+	if (dp_display->psr_supported)
+		dp_ctrl_config_psr(dp->ctrl);
+
 	return 0;
 }
 
@@ -980,14 +986,6 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	/*
-	 * The eDP controller currently does not have a reliable way of
-	 * enabling panel power to read sink capabilities. So, we rely
-	 * on the panel driver to populate only supported modes for now.
-	 */
-	if (dp->is_edp)
-		return MODE_OK;
-
 	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
 		return MODE_BAD;
 
@@ -1094,6 +1092,14 @@ static void dp_display_config_hpd(struct dp_display_private *dp)
 	enable_irq(dp->irq);
 }
 
+void dp_display_set_psr(struct msm_dp *dp_display, bool enter)
+{
+	struct dp_display_private *dp;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+	dp_ctrl_set_psr(dp->ctrl, enter);
+}
+
 static int hpd_event_thread(void *data)
 {
 	struct dp_display_private *dp_priv;
@@ -1652,7 +1658,8 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void dp_bridge_enable(struct drm_bridge *drm_bridge)
+void dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
+			     struct drm_bridge_state *old_bridge_state)
 {
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->dp_display;
@@ -1716,7 +1723,8 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
 	mutex_unlock(&dp_display->event_mutex);
 }
 
-void dp_bridge_disable(struct drm_bridge *drm_bridge)
+void dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+			      struct drm_bridge_state *old_bridge_state)
 {
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->dp_display;
@@ -1727,7 +1735,8 @@ void dp_bridge_disable(struct drm_bridge *drm_bridge)
 	dp_ctrl_push_idle(dp_display->ctrl);
 }
 
-void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
+void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+				   struct drm_bridge_state *old_bridge_state)
 {
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 4f9fe4d..1feaada 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -29,6 +29,7 @@ struct msm_dp {
 
 	u32 max_dp_lanes;
 	struct dp_audio *dp_audio;
+	bool psr_supported;
 };
 
 int dp_display_set_plugged_cb(struct msm_dp *dp_display,
@@ -39,5 +40,6 @@ bool dp_display_check_video_test(struct msm_dp *dp_display);
 int dp_display_get_test_bpp(struct msm_dp *dp_display);
 void dp_display_signal_audio_start(struct msm_dp *dp_display);
 void dp_display_signal_audio_complete(struct msm_dp *dp_display);
+void dp_display_set_psr(struct msm_dp *dp, bool enter);
 
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 62d58b9..b9cf6c27 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -60,14 +60,184 @@ static int dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *
 	return rc;
 }
 
+static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
+				   struct drm_bridge_state *bridge_state,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state)
+{
+	struct msm_dp *dp;
+
+	dp = to_dp_bridge(drm_bridge)->dp_display;
+	if (WARN_ON(!conn_state))
+		return -ENODEV;
+
+	if (dp->psr_supported)
+		conn_state->self_refresh_aware = true;
+
+	if (!conn_state->crtc || !crtc_state)
+		return 0;
+
+	if (crtc_state->self_refresh_active && !dp->psr_supported)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
+				     struct drm_bridge_state *old_bridge_state)
+{
+	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *old_crtc_state;
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->dp_display;
+
+	/*
+	 * Check the old state of the crtc to determine if the panel
+	 * was put into psr state previously by the edp_bridge_atomic_disable.
+	 * If the panel is in psr, just exit psr state and skip the full
+	 * bridge enable sequence.
+	 */
+	crtc = drm_atomic_get_new_crtc_for_encoder(atomic_state, dp->encoder);
+	if (!crtc)
+		return;
+
+	old_crtc_state = drm_atomic_get_old_crtc_state(atomic_state, crtc);
+
+	if (old_crtc_state && old_crtc_state->self_refresh_active) {
+		dp_display_set_psr(dp, false);
+		return;
+	}
+
+	dp_bridge_atomic_enable(drm_bridge, old_bridge_state);
+}
+
+static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+				      struct drm_bridge_state *old_bridge_state)
+{
+	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *new_crtc_state = NULL, *old_crtc_state = NULL;
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->dp_display;
+
+	crtc = drm_atomic_get_old_crtc_for_encoder(atomic_state, dp->encoder);
+	if (!crtc)
+		goto out;
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(atomic_state, crtc);
+	if (!new_crtc_state)
+		goto out;
+
+	old_crtc_state = drm_atomic_get_old_crtc_state(atomic_state, crtc);
+	if (!old_crtc_state)
+		goto out;
+
+	/*
+	 * Set self refresh mode if current crtc state is active.
+	 *
+	 * If old crtc state is active, then this is a display disable
+	 * call while the sink is in psr state. So, exit psr here.
+	 * The eDP controller will be disabled in the
+	 * edp_bridge_atomic_post_disable function.
+	 *
+	 * We observed sink is stuck in self refresh if psr exit is skipped
+	 * when display disable occurs while the sink is in psr state.
+	 */
+	if (new_crtc_state->self_refresh_active) {
+		dp_display_set_psr(dp, true);
+		return;
+	} else if (old_crtc_state->self_refresh_active) {
+		dp_display_set_psr(dp, false);
+		return;
+	}
+
+out:
+	dp_bridge_atomic_disable(drm_bridge, old_bridge_state);
+}
+
+static void edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+				struct drm_bridge_state *old_bridge_state)
+{
+	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *new_crtc_state = NULL;
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->dp_display;
+
+	crtc = drm_atomic_get_old_crtc_for_encoder(atomic_state, dp->encoder);
+	if (!crtc)
+		return;
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(atomic_state, crtc);
+	if (!new_crtc_state)
+		return;
+
+	/*
+	 * Self refresh mode is already set in edp_bridge_atomic_disable.
+	 */
+	if (new_crtc_state->self_refresh_active)
+		return;
+
+	dp_bridge_atomic_post_disable(drm_bridge, old_bridge_state);
+}
+
+/**
+ * edp_bridge_mode_valid - callback to determine if specified mode is valid
+ * @bridge: Pointer to drm bridge structure
+ * @info: display info
+ * @mode: Pointer to drm mode structure
+ * Returns: Validity status for specified mode
+ */
+static enum drm_mode_status edp_bridge_mode_valid(struct drm_bridge *bridge,
+					  const struct drm_display_info *info,
+					  const struct drm_display_mode *mode)
+{
+	struct msm_dp *dp;
+	int mode_pclk_khz = mode->clock;
+
+	dp = to_dp_bridge(bridge)->dp_display;
+
+	if (!dp || !mode_pclk_khz || !dp->connector) {
+		DRM_ERROR("invalid params\n");
+		return -EINVAL;
+	}
+
+	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
+		return MODE_CLOCK_HIGH;
+
+	/*
+	 * The eDP controller currently does not have a reliable way of
+	 * enabling panel power to read sink capabilities. So, we rely
+	 * on the panel driver to populate only supported modes for now.
+	 */
+	return MODE_OK;
+}
+
+static const struct drm_bridge_funcs edp_bridge_ops = {
+	.atomic_enable          = edp_bridge_atomic_enable,
+	.atomic_disable         = edp_bridge_atomic_disable,
+	.atomic_post_disable    = edp_bridge_atomic_post_disable,
+	.mode_set               = dp_bridge_mode_set,
+	.mode_valid             = edp_bridge_mode_valid,
+	.atomic_reset           = drm_atomic_helper_bridge_reset,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
+	.atomic_check           = edp_bridge_atomic_check,
+};
+
 static const struct drm_bridge_funcs dp_bridge_ops = {
-	.enable       = dp_bridge_enable,
-	.disable      = dp_bridge_disable,
-	.post_disable = dp_bridge_post_disable,
-	.mode_set     = dp_bridge_mode_set,
-	.mode_valid   = dp_bridge_mode_valid,
-	.get_modes    = dp_bridge_get_modes,
-	.detect       = dp_bridge_detect,
+	.atomic_enable          = dp_bridge_atomic_enable,
+	.atomic_disable         = dp_bridge_atomic_disable,
+	.atomic_post_disable    = dp_bridge_atomic_post_disable,
+	.mode_set               = dp_bridge_mode_set,
+	.mode_valid             = dp_bridge_mode_valid,
+	.get_modes              = dp_bridge_get_modes,
+	.detect                 = dp_bridge_detect,
+	.atomic_reset           = drm_atomic_helper_bridge_reset,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
+	.atomic_check           = edp_bridge_atomic_check,
 };
 
 struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
@@ -84,7 +254,7 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
 	dp_bridge->dp_display = dp_display;
 
 	bridge = &dp_bridge->bridge;
-	bridge->funcs = &dp_bridge_ops;
+	bridge->funcs = dp_display->is_edp ? &edp_bridge_ops : &dp_bridge_ops;
 	bridge->type = dp_display->connector_type;
 
 	/*
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index f4b1ed1..6b8ef29 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -23,9 +23,12 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display);
 struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder);
 
-void dp_bridge_enable(struct drm_bridge *drm_bridge);
-void dp_bridge_disable(struct drm_bridge *drm_bridge);
-void dp_bridge_post_disable(struct drm_bridge *drm_bridge);
+void dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
+			     struct drm_bridge_state *old_bridge_state);
+void dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+			      struct drm_bridge_state *old_bridge_state);
+void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+				   struct drm_bridge_state *old_bridge_state);
 enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
 					  const struct drm_display_info *info,
 					  const struct drm_display_mode *mode);
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 36f0af0..84af70a 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -934,6 +934,38 @@ static int dp_link_process_phy_test_pattern_request(
 	return 0;
 }
 
+static bool dp_link_read_psr_error_status(struct dp_link_private *link)
+{
+	u8 status;
+
+	drm_dp_dpcd_read(link->aux, DP_PSR_ERROR_STATUS, &status, 1);
+
+	if (status & DP_PSR_LINK_CRC_ERROR)
+		DRM_ERROR("PSR LINK CRC ERROR\n");
+	else if (status & DP_PSR_RFB_STORAGE_ERROR)
+		DRM_ERROR("PSR RFB STORAGE ERROR\n");
+	else if (status & DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR)
+		DRM_ERROR("PSR VSC SDP UNCORRECTABLE ERROR\n");
+	else
+		return false;
+
+	return true;
+}
+
+static bool dp_link_psr_capability_changed(struct dp_link_private *link)
+{
+	u8 status;
+
+	drm_dp_dpcd_read(link->aux, DP_PSR_ESI, &status, 1);
+
+	if (status & DP_PSR_CAPS_CHANGE) {
+		drm_dbg_dp(link->drm_dev, "PSR Capability Change\n");
+		return true;
+	}
+
+	return false;
+}
+
 static u8 get_link_status(const u8 link_status[DP_LINK_STATUS_SIZE], int r)
 {
 	return link_status[r - DP_LANE0_1_STATUS];
@@ -1053,6 +1085,10 @@ int dp_link_process_request(struct dp_link *dp_link)
 		dp_link->sink_request |= DP_TEST_LINK_TRAINING;
 	} else if (!dp_link_process_phy_test_pattern_request(link)) {
 		dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
+	} else if (dp_link_read_psr_error_status(link)) {
+		DRM_ERROR("PSR IRQ_HPD received\n");
+	} else if (dp_link_psr_capability_changed(link)) {
+		drm_dbg_dp(link->drm_dev, "PSR Capabiity changed");
 	} else {
 		ret = dp_link_process_link_status_update(link);
 		if (!ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 5149ceb..8bf8ab4 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -20,6 +20,27 @@ struct dp_panel_private {
 	bool aux_cfg_update_done;
 };
 
+static void dp_panel_read_psr_cap(struct dp_panel_private *panel)
+{
+	ssize_t rlen;
+	struct dp_panel *dp_panel;
+
+	dp_panel = &panel->dp_panel;
+
+	/* edp sink */
+	if (dp_panel->dpcd[DP_EDP_CONFIGURATION_CAP]) {
+		rlen = drm_dp_dpcd_read(panel->aux, DP_PSR_SUPPORT,
+				&dp_panel->psr_cap, sizeof(dp_panel->psr_cap));
+		if (rlen == sizeof(dp_panel->psr_cap)) {
+			drm_dbg_dp(panel->drm_dev,
+				"psr version: 0x%x, psr_cap: 0x%x\n",
+				dp_panel->psr_cap.version,
+				dp_panel->psr_cap.capabilities);
+		} else
+			DRM_ERROR("failed to read psr info, rlen=%zd\n", rlen);
+	}
+}
+
 static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 {
 	int rc = 0;
@@ -106,6 +127,7 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 		}
 	}
 
+	dp_panel_read_psr_cap(panel);
 end:
 	return rc;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index d861197a..2d0826a 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -34,6 +34,11 @@ struct dp_panel_in {
 	struct dp_catalog *catalog;
 };
 
+struct dp_panel_psr {
+	u8 version;
+	u8 capabilities;
+};
+
 struct dp_panel {
 	/* dpcd raw data */
 	u8 dpcd[DP_RECEIVER_CAP_SIZE + 1];
@@ -46,6 +51,7 @@ struct dp_panel {
 	struct edid *edid;
 	struct drm_connector *connector;
 	struct dp_display_mode dp_mode;
+	struct dp_panel_psr psr_cap;
 	bool video_test;
 
 	u32 vic;
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 2686028..ea85a69 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -22,6 +22,20 @@
 #define REG_DP_INTR_STATUS2			(0x00000024)
 #define REG_DP_INTR_STATUS3			(0x00000028)
 
+#define REG_DP_INTR_STATUS4			(0x0000002C)
+#define PSR_UPDATE_INT				(0x00000001)
+#define PSR_CAPTURE_INT				(0x00000004)
+#define PSR_EXIT_INT				(0x00000010)
+#define PSR_UPDATE_ERROR_INT			(0x00000040)
+#define PSR_WAKE_ERROR_INT			(0x00000100)
+
+#define REG_DP_INTR_MASK4			(0x00000030)
+#define PSR_UPDATE_MASK				(0x00000001)
+#define PSR_CAPTURE_MASK			(0x00000002)
+#define PSR_EXIT_MASK				(0x00000004)
+#define PSR_UPDATE_ERROR_MASK			(0x00000008)
+#define PSR_WAKE_ERROR_MASK			(0x00000010)
+
 #define REG_DP_DP_HPD_CTRL			(0x00000000)
 #define DP_DP_HPD_CTRL_HPD_EN			(0x00000001)
 
@@ -164,6 +178,16 @@
 #define MMSS_DP_AUDIO_TIMING_RBR_48		(0x00000094)
 #define MMSS_DP_AUDIO_TIMING_HBR_48		(0x00000098)
 
+#define REG_PSR_CONFIG				(0x00000100)
+#define DISABLE_PSR				(0x00000000)
+#define PSR1_SUPPORTED				(0x00000001)
+#define PSR2_WITHOUT_FRAMESYNC			(0x00000002)
+#define PSR2_WITH_FRAMESYNC			(0x00000003)
+
+#define REG_PSR_CMD				(0x00000110)
+#define PSR_ENTER				(0x00000001)
+#define PSR_EXIT				(0x00000002)
+
 #define MMSS_DP_PSR_CRC_RG			(0x00000154)
 #define MMSS_DP_PSR_CRC_B			(0x00000158)
 
@@ -184,6 +208,9 @@
 #define MMSS_DP_AUDIO_STREAM_0			(0x00000240)
 #define MMSS_DP_AUDIO_STREAM_1			(0x00000244)
 
+#define MMSS_DP_SDP_CFG3			(0x0000024c)
+#define UPDATE_SDP				(0x00000001)
+
 #define MMSS_DP_EXTENSION_0			(0x00000250)
 #define MMSS_DP_EXTENSION_1			(0x00000254)
 #define MMSS_DP_EXTENSION_2			(0x00000258)
-- 
2.7.4

