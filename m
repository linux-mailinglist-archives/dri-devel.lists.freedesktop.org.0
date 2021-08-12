Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB5D3E9B88
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 02:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEC66E207;
	Thu, 12 Aug 2021 00:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF66A6E203;
 Thu, 12 Aug 2021 00:14:54 +0000 (UTC)
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 11 Aug 2021 17:08:50 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 11 Aug 2021 17:08:48 -0700
X-QCInternal: smtphost
Received: from sbillaka-linux.qualcomm.com ([10.204.66.13])
 by ironmsg01-blr.qualcomm.com with ESMTP; 12 Aug 2021 05:38:24 +0530
Received: by sbillaka-linux.qualcomm.com (Postfix, from userid 2305739)
 id 6A98E220EC; Thu, 12 Aug 2021 05:38:23 +0530 (IST)
From: Sankeerth Billakanti <sbillaka@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Sankeerth Billakanti <sbillaka@codeaurora.org>, robdclark@gmail.com,
 seanpaul@chromium.org, swboyd@chromium.org, kalyan_t@codeaurora.org,
 abhinavk@codeaurora.org, dianders@chromium.org, khsieh@codeaurora.org,
 mkrishn@codeaurora.org
Subject: [PATCH v1 1/2] drm/msm/dp: Add support for SC7280 eDP
Date: Thu, 12 Aug 2021 05:38:01 +0530
Message-Id: <1628726882-27841-2-git-send-email-sbillaka@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org>
References: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org>
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

The eDP controller on SC7280 is similar to the eDP/DP controllers
supported by the current driver implementation.

SC7280 supports one EDP and one DP controller which can operate
concurrently.

The following are some required changes for the sc7280 sink:
1. Additional gpio configuration for backlight and pwm via pmic.
2. ASSR support programming on the sink.
3. SSC support programming on the sink.

Signed-off-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c               | 19 +++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.c            | 32 ++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_parser.c             | 31 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_parser.h             |  5 ++++
 5 files changed, 87 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b131fd37..1096c44 100644
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
index d2569da..06d5a2d 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1244,7 +1244,9 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 		struct dp_cr_status *cr, int *training_step)
 {
 	int ret = 0;
+	u8 *dpcd = ctrl->panel->dpcd;
 	u8 encoding = DP_SET_ANSI_8B10B;
+	u8 ssc = 0, assr = 0;
 	struct dp_link_info link_info = {0};
 
 	dp_ctrl_config_ctrl(ctrl);
@@ -1254,9 +1256,21 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
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
 	ret = dp_ctrl_link_train_1(ctrl, cr, training_step);
 	if (ret) {
 		DRM_ERROR("link training #1 failed. ret=%d\n", ret);
@@ -1328,9 +1342,11 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 	struct dp_io *dp_io = &ctrl->parser->io;
 	struct phy *phy = dp_io->phy;
 	struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
+	u8 *dpcd = ctrl->panel->dpcd;
 
 	opts_dp->lanes = ctrl->link->link_params.num_lanes;
 	opts_dp->link_rate = ctrl->link->link_params.rate / 100;
+	opts_dp->ssc = dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5;
 	dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
 					ctrl->link->link_params.rate * 1000);
 
@@ -1760,6 +1776,9 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 	ctrl->link->link_params.num_lanes = ctrl->panel->link_info.num_lanes;
 	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 
+	if (ctrl->dp_ctrl.pixel_rate == 0)
+		return -EINVAL;
+
 	DRM_DEBUG_DP("rate=%d, num_lanes=%d, pixel_rate=%d\n",
 		ctrl->link->link_params.rate,
 		ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ee5bf64..a772290 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -117,8 +117,36 @@ struct dp_display_private {
 	struct dp_audio *audio;
 };
 
+struct msm_dp_config {
+	phys_addr_t io_start[3];
+	size_t num_dp;
+};
+
+static const struct msm_dp_config sc7180_dp_cfg = {
+	.io_start = { 0x0ae90000 },
+	.num_dp = 1,
+};
+
+static const struct msm_dp_config sc8180x_dp_cfg = {
+	.io_start = { 0xae90000, 0xae98000, 0 },
+	.num_dp = 3,
+};
+
+static const struct msm_dp_config sc8180x_edp_cfg = {
+	.io_start = { 0, 0, 0xae9a000 },
+	.num_dp = 3,
+};
+
+static const struct msm_dp_config sc7280_edp_cfg = {
+	.io_start = { 0xaea0000, 0 },
+	.num_dp = 2,
+};
+
 static const struct of_device_id dp_dt_match[] = {
-	{.compatible = "qcom,sc7180-dp"},
+	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
+	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
+	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_edp_cfg },
+	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_edp_cfg },
 	{}
 };
 
@@ -1408,7 +1436,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 
 	dp_hpd_event_setup(dp);
 
-	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
+	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1);
 }
 
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 0519dd3..c05fc0a 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -248,6 +248,33 @@ static int dp_parser_clock(struct dp_parser *parser)
 	return 0;
 }
 
+static int dp_parser_gpio(struct dp_parser *parser)
+{
+	struct device *dev = &parser->pdev->dev;
+	int ret;
+
+	parser->panel_bklt_gpio = devm_gpiod_get(dev, "panel-bklt",
+			GPIOD_OUT_HIGH);
+	if (IS_ERR(parser->panel_bklt_gpio)) {
+		ret = PTR_ERR(parser->panel_bklt_gpio);
+		parser->panel_bklt_gpio = NULL;
+		DRM_ERROR("%s: cannot get panel-bklt gpio, %d\n", __func__, ret);
+		goto fail;
+	}
+
+	parser->panel_pwm_gpio = devm_gpiod_get(dev, "panel-pwm", GPIOD_OUT_HIGH);
+	if (IS_ERR(parser->panel_pwm_gpio)) {
+		ret = PTR_ERR(parser->panel_pwm_gpio);
+		parser->panel_pwm_gpio = NULL;
+		DRM_ERROR("%s: cannot get panel-pwm gpio, %d\n", __func__, ret);
+		goto fail;
+	}
+
+	DRM_INFO("gpio on");
+fail:
+	return 0;
+}
+
 static int dp_parser_parse(struct dp_parser *parser)
 {
 	int rc = 0;
@@ -269,6 +296,10 @@ static int dp_parser_parse(struct dp_parser *parser)
 	if (rc)
 		return rc;
 
+	rc = dp_parser_gpio(parser);
+	if (rc)
+		return rc;
+
 	/* Map the corresponding regulator information according to
 	 * version. Currently, since we only have one supported platform,
 	 * mapping the regulator directly.
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 34b4962..7e94bbf 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -9,6 +9,7 @@
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
 #include <linux/phy/phy-dp.h>
+#include <linux/gpio/consumer.h>
 
 #include "dpu_io_util.h"
 #include "msm_drv.h"
@@ -112,6 +113,10 @@ struct dp_parser {
 	struct platform_device *pdev;
 	struct dss_module_power mp[DP_MAX_PM];
 	struct dp_pinctrl pinctrl;
+
+	struct gpio_desc *panel_bklt_gpio;
+	struct gpio_desc *panel_pwm_gpio;
+
 	struct dp_io io;
 	struct dp_display_data disp_data;
 	const struct dp_regulator_cfg *regulator_cfg;
-- 
The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

