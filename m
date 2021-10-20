Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D5B435BA9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DAB6EB88;
	Thu, 21 Oct 2021 07:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16696E981;
 Wed, 20 Oct 2021 12:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1634732444; x=1666268444;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=mPYUkCvt2p+JqUAo9qn/Q/LdoOvvMo/AGrQdCGVwOP4=;
 b=WPtOG8kwG5MyPkOQtcr4A0aJNR2DdseFSb5NAJhwqG9bERZBprSQuvkL
 Z9edlp+7r7+X2+kfX7mAHDcZ3wbIKHWT1sso4rLa/BflBMAY5xDFRYY1N
 Bfrw432fWN5VPY8pqixweytM8nN3KJXxfxhn9pyc4KtuVkis+SLFPvn7Y Q=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 20 Oct 2021 05:14:41 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 20 Oct 2021 05:14:39 -0700
X-QCInternal: smtphost
Received: from sbillaka-linux.qualcomm.com ([10.204.66.13])
 by ironmsg01-blr.qualcomm.com with ESMTP; 20 Oct 2021 17:44:26 +0530
Received: by sbillaka-linux.qualcomm.com (Postfix, from userid 2305739)
 id 9562620E28; Wed, 20 Oct 2021 17:44:25 +0530 (IST)
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Sankeerth Billakanti <sbillaka@codeaurora.org>, robdclark@gmail.com,
 seanpaul@chromium.org, swboyd@chromium.org, kalyan_t@codeaurora.org,
 abhinavk@codeaurora.org, dianders@chromium.org, khsieh@codeaurora.org,
 mkrishn@codeaurora.org, Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH v2 1/2] drm/msm/dp: Add support for SC7280 eDP
Date: Wed, 20 Oct 2021 17:44:10 +0530
Message-Id: <1634732051-31282-2-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634732051-31282-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1634732051-31282-1-git-send-email-quic_sbillaka@quicinc.com>
X-Mailman-Approved-At: Thu, 21 Oct 2021 07:25:31 +0000
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

From: Sankeerth Billakanti <sbillaka@codeaurora.org>

The eDP controller on SC7280 is similar to the eDP/DP controllers
supported by the current driver implementation.

SC7280 supports one EDP and one DP controller which can operate
concurrently.

The following are some required changes to support eDP on sc7280:
1. SC7280 eDP support in the dp_display driver.
2. ASSR support programming for the sink device.
3. SSC support programming for the sink device.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c               | 20 ++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_display.c            | 10 +++++++++-
 3 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ce6f32a..516cc19 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -856,9 +856,9 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 };
 
 static const struct dpu_intf_cfg sc7280_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
+	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
 	INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_EDP, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
+	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
 };
 
 /*************************************************************
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 62e75dc..9fea49c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -119,7 +119,7 @@ void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl)
 static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
 {
 	u32 config = 0, tbd;
-	u8 *dpcd = ctrl->panel->dpcd;
+	const u8 *dpcd = ctrl->panel->dpcd;
 
 	/* Default-> LSCLK DIV: 1/4 LCLK  */
 	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
@@ -1228,7 +1228,9 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 			int *training_step)
 {
 	int ret = 0;
+	const u8 *dpcd = ctrl->panel->dpcd;
 	u8 encoding = DP_SET_ANSI_8B10B;
+	u8 ssc, assr;
 	struct dp_link_info link_info = {0};
 
 	dp_ctrl_config_ctrl(ctrl);
@@ -1238,9 +1240,21 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 	link_info.capabilities = DP_LINK_CAP_ENHANCED_FRAMING;
 
 	dp_aux_link_configure(ctrl->aux, &link_info);
+
+	if (dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5) {
+		ssc = DP_SPREAD_AMP_0_5;
+		drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, &ssc, 1);
+	}
+
 	drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
 				&encoding, 1);
 
+	if (dpcd[DP_EDP_CONFIGURATION_CAP] & DP_ALTERNATE_SCRAMBLER_RESET_CAP) {
+		assr = DP_ALTERNATE_SCRAMBLER_RESET_ENABLE;
+		drm_dp_dpcd_write(ctrl->aux, DP_EDP_CONFIGURATION_SET,
+				&assr, 1);
+	}
+
 	ret = dp_ctrl_link_train_1(ctrl, training_step);
 	if (ret) {
 		DRM_ERROR("link training #1 failed. ret=%d\n", ret);
@@ -1312,9 +1326,11 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 	struct dp_io *dp_io = &ctrl->parser->io;
 	struct phy *phy = dp_io->phy;
 	struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
+	const u8 *dpcd = ctrl->panel->dpcd;
 
 	opts_dp->lanes = ctrl->link->link_params.num_lanes;
 	opts_dp->link_rate = ctrl->link->link_params.rate / 100;
+	opts_dp->ssc = dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5;
 	dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
 					ctrl->link->link_params.rate * 1000);
 
@@ -1406,7 +1422,7 @@ void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
 
 static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
 {
-	u8 *dpcd = ctrl->panel->dpcd;
+	const u8 *dpcd = ctrl->panel->dpcd;
 
 	/*
 	 * For better interop experience, used a fixed NVID=0x8000
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c867745..c16311b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -144,8 +144,16 @@ static const struct msm_dp_config sc8180x_dp_cfg = {
 	.num_descs = 3,
 };
 
+static const struct msm_dp_config sc7280_dp_cfg = {
+	.descs = (struct msm_dp_desc[]) {
+		{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP },
+	},
+	.num_descs = 1,
+};
+
 static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
+	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
 	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
 	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_cfg },
 	{}
@@ -1440,7 +1448,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 
 	dp_hpd_event_setup(dp);
 
-	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
+	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1);
 }
 
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
-- 
The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

