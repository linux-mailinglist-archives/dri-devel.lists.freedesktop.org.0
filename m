Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA6482025A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 23:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979AD10E2EC;
	Fri, 29 Dec 2023 22:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0328910E2E6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 22:56:57 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50e7e55c0f6so4076499e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 14:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703890615; x=1704495415; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r4X5hjYsd0eYL/pVGeUPV4SJocqGm0FXJENFddN38lE=;
 b=HjECuNFgsXHlHA+0eH8fNz/bsTscEWOm/Os3wMpxXhRM1w6A0Nzx8gsjN7vh8fi5xf
 Z1IXLVslBo0JWx4H8e0D1wOsa/ANNF5eAbK5Q5XZcLxhVQXrHrqIjrQE4Rd3dRoZNLW9
 U9oDrXA4+bEr05T9lF0/ee3kc3bisIHbX/jYkw1cORpD2PCs7AULCPqhCORuTWijCdrk
 wBoHLy8l32rj5O1q+C0EOKMnqkcT21UZ+HnSusxR1Whgx4rW+pJGBMZnTc8ZD206wJDy
 VaUDoLr2YChUaSvbPXODGqnjVPWV6ULsAejWP+GhqNdxtaON+3TmxRRWl37ynpmsexrC
 3PhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703890615; x=1704495415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r4X5hjYsd0eYL/pVGeUPV4SJocqGm0FXJENFddN38lE=;
 b=F/XwDJ5p4uF3/i1n17QWg5ecjHZKQ80O/saOtC75lFrlBpMlFzr6cPtXjWC+ngdPhc
 Hil4XP7Ax2g3sIhS/vKIpi880lE59gu5mKJAGI0HUiQNUkHXHk9WGU/D23ExzkEVkkGd
 cask+TSf5f7G3E0KwYB9ZVxyuHUPSMqLEhWXTmHRNjoa8oCBsx8y6HedorzWQnzApEmO
 QK6ht9YFD/pXQzovDrPm6gMwAncJ0XrXhbu0mRPexFRG/1+/JOKGc2fVHvgndUvBakJ2
 QKKO2VzfBV92bcvWR1L7tCcgMyTJw8GwPqQpWLVRvr/lrnUcrH6ZZJ79F86LgdoKVyLQ
 I99A==
X-Gm-Message-State: AOJu0YzIfUB2bRDS/CiuffhEcNOH5O/YRnb+J3PLtZV8ZZ8zx6UQL4D/
 878Hs5VAN//aYIqTOWARbk2xKzv44t2N/w==
X-Google-Smtp-Source: AGHT+IGrBmVs+IuJo+wc24ioUsjU7+zaHRfZA3BZ+wyx/H7Q1RtYTgzbmcVzTXBQwGXO5AC0rQcOfg==
X-Received: by 2002:ac2:5d6a:0:b0:50e:3ca2:eb55 with SMTP id
 h10-20020ac25d6a000000b0050e3ca2eb55mr1970661lft.97.1703890615257; 
 Fri, 29 Dec 2023 14:56:55 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j26-20020ac2455a000000b0050e7f5794cbsm1326952lfm.309.2023.12.29.14.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 14:56:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH 05/14] drm/msm/dp: fold dp_power into dp_ctrl module
Date: Sat, 30 Dec 2023 00:56:41 +0200
Message-Id: <20231229225650.912751-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dp_power submodule is limited to handling the clocks only following
previous cleanups. Fold it into the dp_ctrl submodule, removing one
unnecessary level of indirection.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile        |   1 -
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 151 +++++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  17 ++-
 drivers/gpu/drm/msm/dp/dp_display.c |  24 +---
 drivers/gpu/drm/msm/dp/dp_power.c   | 170 ----------------------------
 drivers/gpu/drm/msm/dp/dp_power.h   |  74 ------------
 6 files changed, 153 insertions(+), 284 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_power.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_power.h

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index b1173128b5b9..8dbdf3fba69e 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -128,7 +128,6 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_link.o \
 	dp/dp_panel.o \
 	dp/dp_parser.o \
-	dp/dp_power.o \
 	dp/dp_audio.o
 
 msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 77a8d9366ed7..3e0cd279c36b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -76,13 +76,16 @@ struct dp_ctrl_private {
 	struct drm_dp_aux *aux;
 	struct dp_panel *panel;
 	struct dp_link *link;
-	struct dp_power *power;
 	struct dp_parser *parser;
 	struct dp_catalog *catalog;
 
 	struct completion idle_comp;
 	struct completion psr_op_comp;
 	struct completion video_comp;
+
+	bool core_clks_on;
+	bool link_clks_on;
+	bool stream_clks_on;
 };
 
 static int dp_aux_link_configure(struct drm_dp_aux *aux,
@@ -1354,7 +1357,7 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 	phy_power_on(phy);
 
 	dev_pm_opp_set_rate(ctrl->dev, ctrl->link->link_params.rate * 1000);
-	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);
+	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, true);
 	if (ret)
 		DRM_ERROR("Unable to start link clocks. ret=%d\n", ret);
 
@@ -1502,7 +1505,7 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	 * link maintenance.
 	 */
 	dev_pm_opp_set_rate(ctrl->dev, 0);
-	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
+	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
 	if (ret) {
 		DRM_ERROR("Failed to disable clocks. ret=%d\n", ret);
 		return ret;
@@ -1534,7 +1537,7 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	dp_catalog_ctrl_reset(ctrl->catalog);
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
-	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
+	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
 	if (ret) {
 		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
 	}
@@ -1656,7 +1659,7 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
 	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel", pixel_rate * 1000);
 
-	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
+	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, true);
 	if (ret) {
 		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
 		return ret;
@@ -1752,7 +1755,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 	rate = ctrl->panel->link_info.rate;
 	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 
-	dp_power_clk_enable(ctrl->power, DP_CORE_PM, true);
+	dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CORE_PM, true);
 
 	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
 		drm_dbg_dp(ctrl->drm_dev,
@@ -1885,7 +1888,11 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 		ctrl->link->link_params.rate,
 		ctrl->link->link_params.num_lanes, pixel_rate);
 
-	if (!dp_power_clk_status(ctrl->power, DP_CTRL_PM)) { /* link clk is off */
+	drm_dbg_dp(ctrl->drm_dev,
+		"core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
+		ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
+
+	if (!ctrl->link_clks_on) { /* link clk is off */
 		ret = dp_ctrl_enable_mainlink_clocks(ctrl);
 		if (ret) {
 			DRM_ERROR("Failed to start link clocks. ret=%d\n", ret);
@@ -1895,7 +1902,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 
 	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel", pixel_rate * 1000);
 
-	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
+	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, true);
 	if (ret) {
 		DRM_ERROR("Unable to start pixel clocks. ret=%d\n", ret);
 		goto end;
@@ -1946,13 +1953,13 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 	dp_io = &ctrl->parser->io;
 	phy = dp_io->phy;
 
-	/* set dongle to D3 (power off) mode */
+	/* set dongle to D3 (ctrl off) mode */
 	dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
-	if (dp_power_clk_status(ctrl->power, DP_STREAM_PM)) {
-		ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, false);
+	if (ctrl->stream_clks_on) {
+		ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, false);
 		if (ret) {
 			DRM_ERROR("Failed to disable pclk. ret=%d\n", ret);
 			return ret;
@@ -1960,7 +1967,7 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 	}
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
-	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
+	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
 	if (ret) {
 		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
 		return ret;
@@ -1990,7 +1997,7 @@ int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
-	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
+	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
 	if (ret) {
 		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
 	}
@@ -2024,12 +2031,12 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 
 	dp_catalog_ctrl_reset(ctrl->catalog);
 
-	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, false);
+	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, false);
 	if (ret)
 		DRM_ERROR("Failed to disable pixel clocks. ret=%d\n", ret);
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
-	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
+	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
 	if (ret) {
 		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
 	}
@@ -2086,9 +2093,114 @@ irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
 	return ret;
 }
 
+int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
+		enum dp_pm_type pm_type, bool enable)
+{
+	int rc = 0;
+	struct dp_ctrl_private *ctrl;
+	struct dss_module_power *mp;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	if (pm_type != DP_CORE_PM && pm_type != DP_CTRL_PM &&
+			pm_type != DP_STREAM_PM) {
+		DRM_ERROR("unsupported ctrl module: %s\n",
+				dp_parser_pm_name(pm_type));
+		return -EINVAL;
+	}
+
+	if (enable) {
+		if (pm_type == DP_CORE_PM && ctrl->core_clks_on) {
+			drm_dbg_dp(ctrl->drm_dev,
+					"core clks already enabled\n");
+			return 0;
+		}
+
+		if (pm_type == DP_CTRL_PM && ctrl->link_clks_on) {
+			drm_dbg_dp(ctrl->drm_dev,
+					"links clks already enabled\n");
+			return 0;
+		}
+
+		if (pm_type == DP_STREAM_PM && ctrl->stream_clks_on) {
+			drm_dbg_dp(ctrl->drm_dev,
+					"pixel clks already enabled\n");
+			return 0;
+		}
+
+		if ((pm_type == DP_CTRL_PM) && (!ctrl->core_clks_on)) {
+			drm_dbg_dp(ctrl->drm_dev,
+					"Enable core clks before link clks\n");
+			mp = &ctrl->parser->mp[DP_CORE_PM];
+
+			rc = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
+			if (rc)
+				return rc;
+
+			ctrl->core_clks_on = true;
+		}
+	}
+
+	mp = &ctrl->parser->mp[pm_type];
+	if (enable) {
+		rc = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
+		if (rc)
+			return rc;
+	} else {
+		clk_bulk_disable_unprepare(mp->num_clk, mp->clocks);
+	}
+
+	if (pm_type == DP_CORE_PM)
+		ctrl->core_clks_on = enable;
+	else if (pm_type == DP_STREAM_PM)
+		ctrl->stream_clks_on = enable;
+	else
+		ctrl->link_clks_on = enable;
+
+	drm_dbg_dp(ctrl->drm_dev, "%s clocks for %s\n",
+			enable ? "enable" : "disable",
+			dp_parser_pm_name(pm_type));
+	drm_dbg_dp(ctrl->drm_dev,
+		"stream_clks:%s link_clks:%s core_clks:%s\n",
+		ctrl->stream_clks_on ? "on" : "off",
+		ctrl->link_clks_on ? "on" : "off",
+		ctrl->core_clks_on ? "on" : "off");
+
+	return 0;
+}
+
+static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
+{
+	struct dp_ctrl_private *ctrl_private;
+	int rc = 0;
+	struct dss_module_power *core, *ctrl, *stream;
+	struct device *dev;
+
+	ctrl_private = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	dev = ctrl_private->dev;
+
+	core = &ctrl_private->parser->mp[DP_CORE_PM];
+	ctrl = &ctrl_private->parser->mp[DP_CTRL_PM];
+	stream = &ctrl_private->parser->mp[DP_STREAM_PM];
+
+	rc = devm_clk_bulk_get(dev, core->num_clk, core->clocks);
+	if (rc)
+		return rc;
+
+	rc = devm_clk_bulk_get(dev, ctrl->num_clk, ctrl->clocks);
+	if (rc)
+		return -ENODEV;
+
+	rc = devm_clk_bulk_get(dev, stream->num_clk, stream->clocks);
+	if (rc)
+		return -ENODEV;
+
+	return 0;
+}
+
 struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_panel *panel,	struct drm_dp_aux *aux,
-			struct dp_power *power, struct dp_catalog *catalog,
+			struct dp_catalog *catalog,
 			struct dp_parser *parser)
 {
 	struct dp_ctrl_private *ctrl;
@@ -2125,11 +2237,16 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 	/* in parameters */
 	ctrl->parser   = parser;
 	ctrl->panel    = panel;
-	ctrl->power    = power;
 	ctrl->aux      = aux;
 	ctrl->link     = link;
 	ctrl->catalog  = catalog;
 	ctrl->dev      = dev;
 
+	ret = dp_ctrl_clk_init(&ctrl->dp_ctrl);
+	if (ret) {
+		dev_err(dev, "failed to init clocks\n");
+		return ERR_PTR(ret);
+	}
+
 	return &ctrl->dp_ctrl;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index b2c27d3532bf..36e7c52a730a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -10,7 +10,6 @@
 #include "dp_panel.h"
 #include "dp_link.h"
 #include "dp_parser.h"
-#include "dp_power.h"
 #include "dp_catalog.h"
 
 struct dp_ctrl {
@@ -28,7 +27,7 @@ irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl);
 struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_panel *panel,	struct drm_dp_aux *aux,
-			struct dp_power *power, struct dp_catalog *catalog,
+			struct dp_catalog *catalog,
 			struct dp_parser *parser);
 
 void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable);
@@ -39,4 +38,18 @@ void dp_ctrl_irq_phy_exit(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enable);
 void dp_ctrl_config_psr(struct dp_ctrl *dp_ctrl);
 
+/**
+ * dp_ctrl_clk_enable() - enable display controller clocks
+ *
+ * @ctrl: instance of ctrl module
+ * @pm_type: type of pm, core/ctrl/phy
+ * @enable: enables or disables
+ * return: pointer to allocated ctrl module data
+ *
+ * This API will call enable for DP clocks
+ */
+
+int dp_ctrl_clk_enable(struct dp_ctrl *ctrl, enum dp_pm_type pm_type,
+				bool enable);
+
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8cd18705740f..33e9d7deb3f8 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -15,13 +15,12 @@
 #include "msm_drv.h"
 #include "msm_kms.h"
 #include "dp_parser.h"
-#include "dp_power.h"
+#include "dp_ctrl.h"
 #include "dp_catalog.h"
 #include "dp_aux.h"
 #include "dp_reg.h"
 #include "dp_link.h"
 #include "dp_panel.h"
-#include "dp_ctrl.h"
 #include "dp_display.h"
 #include "dp_drm.h"
 #include "dp_audio.h"
@@ -89,7 +88,6 @@ struct dp_display_private {
 	struct dentry *root;
 
 	struct dp_parser  *parser;
-	struct dp_power   *power;
 	struct dp_catalog *catalog;
 	struct drm_dp_aux *aux;
 	struct dp_link    *link;
@@ -434,7 +432,7 @@ static void dp_display_host_init(struct dp_display_private *dp)
 		dp->dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
-	dp_power_clk_enable(dp->power, DP_CORE_PM, true);
+	dp_ctrl_clk_enable(dp->ctrl, DP_CORE_PM, true);
 	dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
 	dp_aux_init(dp->aux);
 	dp->core_initialized = true;
@@ -448,7 +446,7 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
 
 	dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
 	dp_aux_deinit(dp->aux);
-	dp_power_clk_enable(dp->power, DP_CORE_PM, false);
+	dp_ctrl_clk_enable(dp->ctrl, DP_CORE_PM, false);
 	dp->core_initialized = false;
 }
 
@@ -731,14 +729,6 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error;
 	}
 
-	dp->power = dp_power_get(dev, dp->parser);
-	if (IS_ERR(dp->power)) {
-		rc = PTR_ERR(dp->power);
-		DRM_ERROR("failed to initialize power, rc = %d\n", rc);
-		dp->power = NULL;
-		goto error;
-	}
-
 	dp->aux = dp_aux_get(dev, dp->catalog, dp->dp_display.is_edp);
 	if (IS_ERR(dp->aux)) {
 		rc = PTR_ERR(dp->aux);
@@ -768,7 +758,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 	}
 
 	dp->ctrl = dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
-			       dp->power, dp->catalog, dp->parser);
+			       dp->catalog, dp->parser);
 	if (IS_ERR(dp->ctrl)) {
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
@@ -1266,12 +1256,6 @@ static int dp_display_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	}
 
-	rc = dp_power_client_init(dp->power);
-	if (rc) {
-		DRM_ERROR("Power client create failed\n");
-		goto err;
-	}
-
 	/* setup event q */
 	mutex_init(&dp->event_mutex);
 	init_waitqueue_head(&dp->event_q);
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
deleted file mode 100644
index f49e3aede308..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ /dev/null
@@ -1,170 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
- */
-
-#define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
-
-#include <linux/clk.h>
-#include <linux/clk-provider.h>
-#include <linux/regulator/consumer.h>
-#include <linux/pm_opp.h>
-#include "dp_power.h"
-#include "msm_drv.h"
-
-struct dp_power_private {
-	struct dp_parser *parser;
-	struct device *dev;
-	struct drm_device *drm_dev;
-
-	struct dp_power dp_power;
-};
-
-static int dp_power_clk_init(struct dp_power_private *power)
-{
-	int rc = 0;
-	struct dss_module_power *core, *ctrl, *stream;
-	struct device *dev = power->dev;
-
-	core = &power->parser->mp[DP_CORE_PM];
-	ctrl = &power->parser->mp[DP_CTRL_PM];
-	stream = &power->parser->mp[DP_STREAM_PM];
-
-	rc = devm_clk_bulk_get(dev, core->num_clk, core->clocks);
-	if (rc)
-		return rc;
-
-	rc = devm_clk_bulk_get(dev, ctrl->num_clk, ctrl->clocks);
-	if (rc)
-		return -ENODEV;
-
-	rc = devm_clk_bulk_get(dev, stream->num_clk, stream->clocks);
-	if (rc)
-		return -ENODEV;
-
-	return 0;
-}
-
-int dp_power_clk_status(struct dp_power *dp_power, enum dp_pm_type pm_type)
-{
-	struct dp_power_private *power;
-
-	power = container_of(dp_power, struct dp_power_private, dp_power);
-
-	drm_dbg_dp(power->drm_dev,
-		"core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
-		dp_power->core_clks_on, dp_power->link_clks_on, dp_power->stream_clks_on);
-
-	if (pm_type == DP_CORE_PM)
-		return dp_power->core_clks_on;
-
-	if (pm_type == DP_CTRL_PM)
-		return dp_power->link_clks_on;
-
-	if (pm_type == DP_STREAM_PM)
-		return dp_power->stream_clks_on;
-
-	return 0;
-}
-
-int dp_power_clk_enable(struct dp_power *dp_power,
-		enum dp_pm_type pm_type, bool enable)
-{
-	int rc = 0;
-	struct dp_power_private *power;
-	struct dss_module_power *mp;
-
-	power = container_of(dp_power, struct dp_power_private, dp_power);
-
-	if (pm_type != DP_CORE_PM && pm_type != DP_CTRL_PM &&
-			pm_type != DP_STREAM_PM) {
-		DRM_ERROR("unsupported power module: %s\n",
-				dp_parser_pm_name(pm_type));
-		return -EINVAL;
-	}
-
-	if (enable) {
-		if (pm_type == DP_CORE_PM && dp_power->core_clks_on) {
-			drm_dbg_dp(power->drm_dev,
-					"core clks already enabled\n");
-			return 0;
-		}
-
-		if (pm_type == DP_CTRL_PM && dp_power->link_clks_on) {
-			drm_dbg_dp(power->drm_dev,
-					"links clks already enabled\n");
-			return 0;
-		}
-
-		if (pm_type == DP_STREAM_PM && dp_power->stream_clks_on) {
-			drm_dbg_dp(power->drm_dev,
-					"pixel clks already enabled\n");
-			return 0;
-		}
-
-		if ((pm_type == DP_CTRL_PM) && (!dp_power->core_clks_on)) {
-			drm_dbg_dp(power->drm_dev,
-					"Enable core clks before link clks\n");
-			mp = &power->parser->mp[DP_CORE_PM];
-
-			rc = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
-			if (rc)
-				return rc;
-
-			dp_power->core_clks_on = true;
-		}
-	}
-
-	mp = &power->parser->mp[pm_type];
-	if (enable) {
-		rc = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
-		if (rc)
-			return rc;
-	} else {
-		clk_bulk_disable_unprepare(mp->num_clk, mp->clocks);
-	}
-
-	if (pm_type == DP_CORE_PM)
-		dp_power->core_clks_on = enable;
-	else if (pm_type == DP_STREAM_PM)
-		dp_power->stream_clks_on = enable;
-	else
-		dp_power->link_clks_on = enable;
-
-	drm_dbg_dp(power->drm_dev, "%s clocks for %s\n",
-			enable ? "enable" : "disable",
-			dp_parser_pm_name(pm_type));
-	drm_dbg_dp(power->drm_dev,
-		"strem_clks:%s link_clks:%s core_clks:%s\n",
-		dp_power->stream_clks_on ? "on" : "off",
-		dp_power->link_clks_on ? "on" : "off",
-		dp_power->core_clks_on ? "on" : "off");
-
-	return 0;
-}
-
-int dp_power_client_init(struct dp_power *dp_power)
-{
-	struct dp_power_private *power;
-
-	power = container_of(dp_power, struct dp_power_private, dp_power);
-
-	return dp_power_clk_init(power);
-}
-
-struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser)
-{
-	struct dp_power_private *power;
-	struct dp_power *dp_power;
-
-	power = devm_kzalloc(dev, sizeof(*power), GFP_KERNEL);
-	if (!power)
-		return ERR_PTR(-ENOMEM);
-
-	power->parser = parser;
-	power->dev = dev;
-
-	dp_power = &power->dp_power;
-
-	return dp_power;
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
deleted file mode 100644
index eb836b5aa24a..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_power.h
+++ /dev/null
@@ -1,74 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DP_POWER_H_
-#define _DP_POWER_H_
-
-#include "dp_parser.h"
-
-/**
- * sruct dp_power - DisplayPort's power related data
- *
- * @init: initializes the regulators/core clocks/GPIOs/pinctrl
- * @deinit: turns off the regulators/core clocks/GPIOs/pinctrl
- * @clk_enable: enable/disable the DP clocks
- * @set_pixel_clk_parent: set the parent of DP pixel clock
- */
-struct dp_power {
-	bool core_clks_on;
-	bool link_clks_on;
-	bool stream_clks_on;
-};
-
-/**
- * dp_power_clk_status() - display controller clocks status
- *
- * @power: instance of power module
- * @pm_type: type of pm, core/ctrl/phy
- * return: status of power clocks
- *
- * This API return status of DP clocks
- */
-
-int dp_power_clk_status(struct dp_power *dp_power, enum dp_pm_type pm_type);
-
-/**
- * dp_power_clk_enable() - enable display controller clocks
- *
- * @power: instance of power module
- * @pm_type: type of pm, core/ctrl/phy
- * @enable: enables or disables
- * return: pointer to allocated power module data
- *
- * This API will call setrate and enable for DP clocks
- */
-
-int dp_power_clk_enable(struct dp_power *power, enum dp_pm_type pm_type,
-				bool enable);
-
-/**
- * dp_power_client_init() - initialize clock and regulator modules
- *
- * @power: instance of power module
- * return: 0 for success, error for failure.
- *
- * This API will configure the DisplayPort's clocks and regulator
- * modules.
- */
-int dp_power_client_init(struct dp_power *power);
-
-/**
- * dp_power_get() - configure and get the DisplayPort power module data
- *
- * @parser: instance of parser module
- * return: pointer to allocated power module data
- *
- * This API will configure the DisplayPort's power module and provides
- * methods to be called by the client to configure the power related
- * modules.
- */
-struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser);
-
-#endif /* _DP_POWER_H_ */
-- 
2.39.2

