Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D02D64C0504
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 00:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659A210E808;
	Tue, 22 Feb 2022 23:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854EF10E522;
 Tue, 22 Feb 2022 23:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645570832; x=1677106832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=PGiL2Gyy1knW6lUvH1jvd0AdwLaIuRzuKkwDUVDJLOg=;
 b=O0dwXcMQxNB64Sl50u8BW8+xsXSrAnufcdObVbKMe8DTPGZ29P69RYth
 EtfA2vh6YuX4cNzHOe+nvaCk9eGD/Mx2nuJ8v2rNIZQFOdJFVpj2lCLuY
 rVlXH9kL2iC+EEoqPM7ntxFNL2+EIB8UY3RRNL80K+DtNE0TAeJvqBW0O U=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Feb 2022 15:00:32 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 15:00:32 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 22 Feb 2022 15:00:31 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 22 Feb 2022 15:00:31 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
 <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
Subject: [PATCH v9 4/4] drm/msm/dp: enable widebus feature for display port
Date: Tue, 22 Feb 2022 15:00:16 -0800
Message-ID: <1645570816-21150-5-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645570816-21150-1-git-send-email-quic_khsieh@quicinc.com>
References: <1645570816-21150-1-git-send-email-quic_khsieh@quicinc.com>
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
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Widebus feature will transmit two pixel data per pixel clock to interface.
This feature now is required to be enabled to easy migrant to higher
resolution applications in future. However since some legacy chipsets
does not support this feature, this feature is enabled base on chip's
hardware revision.

changes in v2:
-- remove compression related code from timing
-- remove op_info from  struct msm_drm_private
-- remove unnecessary wide_bus_en variables
-- pass wide_bus_en into timing configuration by struct msm_dp

Changes in v3:
-- split patch into 3 patches
-- enable widebus feature base on chip hardware revision

Changes in v5:
-- DP_INTF_CONFIG_DATABUS_WIDEN

Changes in v6:
-- static inline bool msm_dp_wide_bus_enable() in msm_drv.h

Changes in v7:
-- add Tested-by

Changes in v9:
-- add wide_bus_en boolean to msm_dp_desc
-- set wide_bus_en to true for both eDP and DP at sc7280_dp_cfg

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reported-by: kernel test robot <lkp@intel.com>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 +++-
 drivers/gpu/drm/msm/dp/dp_catalog.c         | 34 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_catalog.h         |  3 ++-
 drivers/gpu/drm/msm/dp/dp_ctrl.c            | 13 +++++++----
 drivers/gpu/drm/msm/dp/dp_ctrl.h            |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c         | 20 +++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_display.h         |  2 ++
 drivers/gpu/drm/msm/dp/dp_panel.c           |  4 ++--
 drivers/gpu/drm/msm/dp/dp_panel.h           |  2 +-
 drivers/gpu/drm/msm/msm_drv.h               |  6 +++++
 10 files changed, 76 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2b2dbb7..1e96cede 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2138,8 +2138,10 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 		timer_setup(&dpu_enc->vsync_event_timer,
 				dpu_encoder_vsync_event_handler,
 				0);
-	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
+	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS) {
 		dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
+		dpu_enc->wide_bus_en = msm_dp_wide_bus_enable(dpu_enc->dp);
+	}
 
 	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
 			dpu_encoder_off_work);
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 6ae9b29..524eccc 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -24,6 +24,8 @@
 #define DP_INTERRUPT_STATUS_ACK_SHIFT	1
 #define DP_INTERRUPT_STATUS_MASK_SHIFT	2
 
+#define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
+
 #define DP_INTERRUPT_STATUS1 \
 	(DP_INTR_AUX_I2C_DONE| \
 	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
@@ -483,6 +485,22 @@ int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog,
 }
 
 /**
+ * dp_catalog_hw_revision() - retrieve DP hw revision
+ *
+ * @dp_catalog: DP catalog structure
+ *
+ * Return: DP controller hw revision
+ *
+ */
+u32 dp_catalog_hw_revision(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	return dp_read_ahb(catalog, REG_DP_HW_VERSION);
+}
+
+/**
  * dp_catalog_ctrl_reset() - reset DP controller
  *
  * @dp_catalog: DP catalog structure
@@ -739,10 +757,11 @@ u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog)
 }
 
 /* panel related catalog functions */
-int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
+int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog, bool wide_bus_en)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
+	u32 reg;
 
 	dp_write_link(catalog, REG_DP_TOTAL_HOR_VER,
 				dp_catalog->total);
@@ -751,7 +770,18 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
 	dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY,
 				dp_catalog->width_blanking);
 	dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, dp_catalog->dp_active);
-	dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, 0);
+
+	reg = dp_read_p0(catalog, MMSS_DP_INTF_CONFIG);
+
+	if (wide_bus_en)
+		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
+	else
+		reg &= ~DP_INTF_CONFIG_DATABUS_WIDEN;
+
+
+	DRM_DEBUG_DP("wide_bus_en=%d reg=%x\n", wide_bus_en, reg);
+
+	dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, reg);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 6965afa..2ba1ea4 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -95,6 +95,7 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
 void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
 				u32 stream_rate_khz, bool fixed_nvid);
 int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog, u32 pattern);
+u32 dp_catalog_hw_revision(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
 bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
@@ -115,7 +116,7 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
 u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog);
 
 /* DP Panel APIs */
-int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog);
+int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog, bool wide_bus_en);
 void dp_catalog_dump_regs(struct dp_catalog *dp_catalog);
 void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
 				struct drm_display_mode *drm_mode);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c724cb0..b07574c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -154,7 +154,7 @@ static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
 	dp_catalog_ctrl_config_ctrl(ctrl->catalog, config);
 }
 
-static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
+static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl, bool wide_bus_en)
 {
 	u32 cc, tb;
 
@@ -167,7 +167,7 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
 		ctrl->panel->dp_mode.bpp);
 	cc = dp_link_get_colorimetry_config(ctrl->link);
 	dp_catalog_ctrl_config_misc(ctrl->catalog, cc, tb);
-	dp_panel_timing_cfg(ctrl->panel);
+	dp_panel_timing_cfg(ctrl->panel, wide_bus_en);
 }
 
 /*
@@ -1799,6 +1799,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 	int ret = 0;
 	bool mainlink_ready = false;
 	struct dp_ctrl_private *ctrl;
+	u32 pixel_rate_orig;
 
 	if (!dp_ctrl)
 		return -EINVAL;
@@ -1807,6 +1808,10 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 
 	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 
+	pixel_rate_orig = ctrl->dp_ctrl.pixel_rate;
+	if (dp_ctrl->wide_bus_en)
+		ctrl->dp_ctrl.pixel_rate >>= 1;
+
 	DRM_DEBUG_DP("rate=%d, num_lanes=%d, pixel_rate=%d\n",
 		ctrl->link->link_params.rate,
 		ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
@@ -1842,11 +1847,11 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 	 */
 	reinit_completion(&ctrl->video_comp);
 
-	dp_ctrl_configure_source_params(ctrl);
+	dp_ctrl_configure_source_params(ctrl, dp_ctrl->wide_bus_en);
 
 	dp_catalog_ctrl_config_msa(ctrl->catalog,
 		ctrl->link->link_params.rate,
-		ctrl->dp_ctrl.pixel_rate, dp_ctrl_use_fixed_nvid(ctrl));
+		pixel_rate_orig, dp_ctrl_use_fixed_nvid(ctrl));
 
 	dp_ctrl_setup_tr_unit(ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 2363a2d..a0a5fbb 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -17,6 +17,7 @@ struct dp_ctrl {
 	bool orientation;
 	atomic_t aborted;
 	u32 pixel_rate;
+	bool wide_bus_en;
 };
 
 int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7cc4d21..85068e6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -115,12 +115,15 @@ struct dp_display_private {
 	struct dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
 
+	bool wide_bus_en;
+
 	struct dp_audio *audio;
 };
 
 struct msm_dp_desc {
 	phys_addr_t io_start;
 	unsigned int connector_type;
+	bool wide_bus_en;
 };
 
 struct msm_dp_config {
@@ -137,8 +140,8 @@ static const struct msm_dp_config sc7180_dp_cfg = {
 
 static const struct msm_dp_config sc7280_dp_cfg = {
 	.descs = (const struct msm_dp_desc[]) {
-		[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
-		[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP },
+		[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
+		[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
 	},
 	.num_descs = 2,
 };
@@ -848,6 +851,8 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
+	dp->ctrl->wide_bus_en = dp->wide_bus_en;
+
 	rc = dp_ctrl_on_stream(dp->ctrl);
 	if (!rc)
 		dp_display->power_on = true;
@@ -972,6 +977,7 @@ int dp_display_get_modes(struct msm_dp *dp,
 		dp->connector, dp_mode);
 	if (dp_mode->drm_mode.clock)
 		dp->max_pclk_khz = dp_mode->drm_mode.clock;
+
 	return ret;
 }
 
@@ -1251,6 +1257,7 @@ static int dp_display_probe(struct platform_device *pdev)
 	dp->pdev = pdev;
 	dp->name = "drm_dp";
 	dp->dp_display.connector_type = desc->connector_type;
+	dp->wide_bus_en = desc->wide_bus_en;
 
 	rc = dp_init_sub_modules(dp);
 	if (rc) {
@@ -1437,6 +1444,15 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
 }
 
+bool msm_dp_wide_bus_enable(struct msm_dp *dp_display)
+{
+	struct dp_display_private *dp;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	return dp->wide_bus_en;
+}
+
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 {
 	struct dp_display_private *dp;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index e3adcd5..b718cc9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -24,6 +24,8 @@ struct msm_dp {
 
 	hdmi_codec_plugged_cb plugged_cb;
 
+	bool wide_bus_en;
+
 	u32 max_pclk_khz;
 
 	u32 max_dp_lanes;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 71db10c..71deb1e 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -353,7 +353,7 @@ void dp_panel_dump_regs(struct dp_panel *dp_panel)
 	dp_catalog_dump_regs(catalog);
 }
 
-int dp_panel_timing_cfg(struct dp_panel *dp_panel)
+int dp_panel_timing_cfg(struct dp_panel *dp_panel, bool wide_bus_en)
 {
 	u32 data, total_ver, total_hor;
 	struct dp_catalog *catalog;
@@ -404,7 +404,7 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
 
 	catalog->dp_active = data;
 
-	dp_catalog_panel_timing_cfg(catalog);
+	dp_catalog_panel_timing_cfg(catalog, wide_bus_en);
 	panel->panel_on = true;
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 9023e5b..5ec341a 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -57,7 +57,7 @@ struct dp_panel {
 
 int dp_panel_init_panel_info(struct dp_panel *dp_panel);
 int dp_panel_deinit(struct dp_panel *dp_panel);
-int dp_panel_timing_cfg(struct dp_panel *dp_panel);
+int dp_panel_timing_cfg(struct dp_panel *dp_panel, bool wide_bus_en);
 void dp_panel_dump_regs(struct dp_panel *dp_panel);
 int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 		struct drm_connector *connector);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index d7574e6..4f9c24e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -399,6 +399,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display);
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
 
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
+bool msm_dp_wide_bus_enable(struct msm_dp *dp_display);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -449,6 +450,11 @@ static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
 {
 }
 
+static inline bool msm_dp_wide_bus_enable(struct msm_dp *dp_display)
+{
+	return false;
+}
+
 #endif
 
 void __init msm_mdp_register(void);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

