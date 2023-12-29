Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B543882025C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 23:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1A610E2D6;
	Fri, 29 Dec 2023 22:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B7610E2EA
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 22:56:58 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50e18689828so7772359e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 14:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703890617; x=1704495417; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nSJ0SxYOt9g1m9yKHF5zQlt7eQUvgfRmYzW75nlidsE=;
 b=QIJzwuyu+Zh43i2MuOXGxZsTIAo/tFz+DiwTgqTTYqYhItxQ6wg3oSnFH5jdEWiCAi
 O6M2AXrcI/FvV5f0o5GO24qnmrxpiGNkvaJjL1B2/XPsHO618ZBXcl2Mc/Yxm/l7Y+/1
 z09UG7xFozrtkwOJnFcG+vjL84tO2sHWcaDVgeU9/cfuXaoEZ1Q/MBDXCoH/5vnJQwEY
 sUZWZlWL3r0i4LwcTGKMMWzMELqu77vfmDJ67VDiSyBtsSyObnFL9xd2Bq4BL+aYcsxU
 P2edEoYdexmuBhgvgrO/XdChMJhDCzw/l71/FpWYUbjDr56TNA+haUw7/cifAjwuVZ3I
 Bmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703890617; x=1704495417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nSJ0SxYOt9g1m9yKHF5zQlt7eQUvgfRmYzW75nlidsE=;
 b=lmHsZ8ZxMyWImoh/01KlJrrOOCm5KjDgV0OppgLHmTWZF3hjMPX5lZJeN3D+wOlLb3
 kS1FTYqz5m+IVqVCxdBW16cBChe5SdxJl9XcLkgC8cucvePz6IU/7uflJq8YUmOp1bie
 XytSl6deGXOcFB0Mx83XfvisD/JOU4hbwinfb4gqRfkcMJUpMeay97P13xyKGLh3enrI
 jtYtteKDfuxNhlddFgIVn1xup6Hi+YtlXUhi3GqNBaNbhE6AUVnwu8CgfGbiGDU+dHIb
 nDmm0doMeZpGKNiEwDfaCZQFU3/OvfMX5Hn86qv23QpxSYSevsazoyDFyUCJXqd3EOND
 tjQA==
X-Gm-Message-State: AOJu0YwvdIBiyHdjTFz9uoDZvRavgAnPwBrWdA+vwI39ZInzIIWm7nth
 o0xBqKbdYJZlGNKkrU9vkLBZ/tm8knI9oQ==
X-Google-Smtp-Source: AGHT+IE947l8S6g/8BS84A4Hu9Bg4/tRjZhRNSoT5KpL6/K9H8QMsE83Gnr4QUKM1AaL5tl5UN+z5w==
X-Received: by 2002:a05:6512:3b83:b0:50e:7bf5:5424 with SMTP id
 g3-20020a0565123b8300b0050e7bf55424mr3490490lfv.47.1703890616225; 
 Fri, 29 Dec 2023 14:56:56 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j26-20020ac2455a000000b0050e7f5794cbsm1326952lfm.309.2023.12.29.14.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 14:56:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH 06/14] drm/msm/dp: simplify stream clocks handling
Date: Sat, 30 Dec 2023 00:56:42 +0200
Message-Id: <20231229225650.912751-7-dmitry.baryshkov@linaro.org>
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

There is only a single DP_STREAM_PM clock, stream_pixel. Instead of
using a separate dss_module_power instance for this single clock, handle
this clock directly. This allows us to drop several wrapping functions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c   | 91 +++++++++++++-----------------
 drivers/gpu/drm/msm/dp/dp_parser.c | 41 +++-----------
 drivers/gpu/drm/msm/dp/dp_parser.h |  2 -
 3 files changed, 47 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 3e0cd279c36b..088bd35695f6 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -79,6 +79,8 @@ struct dp_ctrl_private {
 	struct dp_parser *parser;
 	struct dp_catalog *catalog;
 
+	struct clk *pixel_clk;
+
 	struct completion idle_comp;
 	struct completion psr_op_comp;
 	struct completion video_comp;
@@ -1320,27 +1322,6 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
 	return ret;
 }
 
-static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
-			enum dp_pm_type module, char *name, unsigned long rate)
-{
-	u32 num = ctrl->parser->mp[module].num_clk;
-	struct clk_bulk_data *cfg = ctrl->parser->mp[module].clocks;
-
-	while (num && strcmp(cfg->id, name)) {
-		num--;
-		cfg++;
-	}
-
-	drm_dbg_dp(ctrl->drm_dev, "setting rate=%lu on clk=%s\n",
-						rate, name);
-
-	if (num)
-		clk_set_rate(cfg->clk, rate);
-	else
-		DRM_ERROR("%s clock doesn't exit to set rate %lu\n",
-				name, rate);
-}
-
 static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
@@ -1657,14 +1638,23 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
 	}
 
 	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
-	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel", pixel_rate * 1000);
-
-	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, true);
+	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
 	if (ret) {
-		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
+		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
 		return ret;
 	}
 
+	if (ctrl->stream_clks_on) {
+		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
+	} else {
+		ret = clk_prepare_enable(ctrl->pixel_clk);
+		if (ret) {
+			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
+			return ret;
+		}
+		ctrl->stream_clks_on = true;
+	}
+
 	dp_ctrl_send_phy_test_pattern(ctrl);
 
 	return 0;
@@ -1900,14 +1890,23 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 		}
 	}
 
-	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel", pixel_rate * 1000);
-
-	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, true);
+	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
 	if (ret) {
-		DRM_ERROR("Unable to start pixel clocks. ret=%d\n", ret);
+		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
 		goto end;
 	}
 
+	if (ctrl->stream_clks_on) {
+		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
+	} else {
+		ret = clk_prepare_enable(ctrl->pixel_clk);
+		if (ret) {
+			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
+			goto end;
+		}
+		ctrl->stream_clks_on = true;
+	}
+
 	if (force_link_train || !dp_ctrl_channel_eq_ok(ctrl))
 		dp_ctrl_link_retrain(ctrl);
 
@@ -1959,11 +1958,8 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
 	if (ctrl->stream_clks_on) {
-		ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, false);
-		if (ret) {
-			DRM_ERROR("Failed to disable pclk. ret=%d\n", ret);
-			return ret;
-		}
+		clk_disable_unprepare(ctrl->pixel_clk);
+		ctrl->stream_clks_on = false;
 	}
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
@@ -2031,9 +2027,10 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 
 	dp_catalog_ctrl_reset(ctrl->catalog);
 
-	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, false);
-	if (ret)
-		DRM_ERROR("Failed to disable pixel clocks. ret=%d\n", ret);
+	if (ctrl->stream_clks_on) {
+		clk_disable_unprepare(ctrl->pixel_clk);
+		ctrl->stream_clks_on = false;
+	}
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
@@ -2102,8 +2099,7 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 
-	if (pm_type != DP_CORE_PM && pm_type != DP_CTRL_PM &&
-			pm_type != DP_STREAM_PM) {
+	if (pm_type != DP_CORE_PM && pm_type != DP_CTRL_PM) {
 		DRM_ERROR("unsupported ctrl module: %s\n",
 				dp_parser_pm_name(pm_type));
 		return -EINVAL;
@@ -2122,12 +2118,6 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 			return 0;
 		}
 
-		if (pm_type == DP_STREAM_PM && ctrl->stream_clks_on) {
-			drm_dbg_dp(ctrl->drm_dev,
-					"pixel clks already enabled\n");
-			return 0;
-		}
-
 		if ((pm_type == DP_CTRL_PM) && (!ctrl->core_clks_on)) {
 			drm_dbg_dp(ctrl->drm_dev,
 					"Enable core clks before link clks\n");
@@ -2152,8 +2142,6 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 
 	if (pm_type == DP_CORE_PM)
 		ctrl->core_clks_on = enable;
-	else if (pm_type == DP_STREAM_PM)
-		ctrl->stream_clks_on = enable;
 	else
 		ctrl->link_clks_on = enable;
 
@@ -2173,7 +2161,7 @@ static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl_private;
 	int rc = 0;
-	struct dss_module_power *core, *ctrl, *stream;
+	struct dss_module_power *core, *ctrl;
 	struct device *dev;
 
 	ctrl_private = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
@@ -2181,7 +2169,6 @@ static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
 
 	core = &ctrl_private->parser->mp[DP_CORE_PM];
 	ctrl = &ctrl_private->parser->mp[DP_CTRL_PM];
-	stream = &ctrl_private->parser->mp[DP_STREAM_PM];
 
 	rc = devm_clk_bulk_get(dev, core->num_clk, core->clocks);
 	if (rc)
@@ -2191,9 +2178,9 @@ static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
 	if (rc)
 		return -ENODEV;
 
-	rc = devm_clk_bulk_get(dev, stream->num_clk, stream->clocks);
-	if (rc)
-		return -ENODEV;
+	ctrl_private->pixel_clk = devm_clk_get(dev, "stream_pixel");
+	if (IS_ERR(ctrl_private->pixel_clk))
+		return PTR_ERR(ctrl_private->pixel_clk);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 2d9d126c119b..fe2b75f7555a 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -150,12 +150,11 @@ static inline bool dp_parser_check_prefix(const char *clk_prefix,
 static int dp_parser_init_clk_data(struct dp_parser *parser)
 {
 	int num_clk, i, rc;
-	int core_clk_count = 0, ctrl_clk_count = 0, stream_clk_count = 0;
+	int core_clk_count = 0, ctrl_clk_count = 0;
 	const char *clk_name;
 	struct device *dev = &parser->pdev->dev;
 	struct dss_module_power *core_power = &parser->mp[DP_CORE_PM];
 	struct dss_module_power *ctrl_power = &parser->mp[DP_CTRL_PM];
-	struct dss_module_power *stream_power = &parser->mp[DP_STREAM_PM];
 
 	num_clk = of_property_count_strings(dev->of_node, "clock-names");
 	if (num_clk <= 0) {
@@ -174,9 +173,6 @@ static int dp_parser_init_clk_data(struct dp_parser *parser)
 
 		if (dp_parser_check_prefix("ctrl", clk_name))
 			ctrl_clk_count++;
-
-		if (dp_parser_check_prefix("stream", clk_name))
-			stream_clk_count++;
 	}
 
 	/* Initialize the CORE power module */
@@ -207,47 +203,30 @@ static int dp_parser_init_clk_data(struct dp_parser *parser)
 		return -ENOMEM;
 	}
 
-	/* Initialize the STREAM power module */
-	if (stream_clk_count == 0) {
-		DRM_ERROR("no stream (pixel) clocks are defined\n");
-		return -EINVAL;
-	}
-
-	stream_power->num_clk = stream_clk_count;
-	stream_power->clocks = devm_kcalloc(dev,
-			stream_power->num_clk, sizeof(struct clk_bulk_data),
-			GFP_KERNEL);
-	if (!stream_power->clocks) {
-		stream_power->num_clk = 0;
-		return -ENOMEM;
-	}
-
-	return 0;
+	return num_clk;
 }
 
 static int dp_parser_clock(struct dp_parser *parser)
 {
 	int rc = 0, i = 0;
 	int num_clk = 0;
-	int core_clk_index = 0, ctrl_clk_index = 0, stream_clk_index = 0;
-	int core_clk_count = 0, ctrl_clk_count = 0, stream_clk_count = 0;
+	int core_clk_index = 0, ctrl_clk_index = 0;
+	int core_clk_count = 0, ctrl_clk_count = 0;
 	const char *clk_name;
 	struct device *dev = &parser->pdev->dev;
 	struct dss_module_power *core_power = &parser->mp[DP_CORE_PM];
 	struct dss_module_power *ctrl_power = &parser->mp[DP_CTRL_PM];
-	struct dss_module_power *stream_power = &parser->mp[DP_STREAM_PM];
 
 	rc =  dp_parser_init_clk_data(parser);
-	if (rc) {
+	if (rc < 0) {
 		DRM_ERROR("failed to initialize power data %d\n", rc);
-		return -EINVAL;
+		return rc;
 	}
 
+	num_clk = rc;
+
 	core_clk_count = core_power->num_clk;
 	ctrl_clk_count = ctrl_power->num_clk;
-	stream_clk_count = stream_power->num_clk;
-
-	num_clk = core_clk_count + ctrl_clk_count + stream_clk_count;
 
 	for (i = 0; i < num_clk; i++) {
 		rc = of_property_read_string_index(dev->of_node, "clock-names",
@@ -260,10 +239,6 @@ static int dp_parser_clock(struct dp_parser *parser)
 				core_clk_index < core_clk_count) {
 			core_power->clocks[core_clk_index].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
 			core_clk_index++;
-		} else if (dp_parser_check_prefix("stream", clk_name) &&
-				stream_clk_index < stream_clk_count) {
-			stream_power->clocks[stream_clk_index].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
-			stream_clk_index++;
 		} else if (dp_parser_check_prefix("ctrl", clk_name) &&
 			   ctrl_clk_index < ctrl_clk_count) {
 			ctrl_power->clocks[ctrl_clk_index].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 4ccc432b4142..c6fe26602e07 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -19,7 +19,6 @@
 enum dp_pm_type {
 	DP_CORE_PM,
 	DP_CTRL_PM,
-	DP_STREAM_PM,
 	DP_MAX_PM
 };
 
@@ -40,7 +39,6 @@ static inline const char *dp_parser_pm_name(enum dp_pm_type module)
 	switch (module) {
 	case DP_CORE_PM:	return "DP_CORE_PM";
 	case DP_CTRL_PM:	return "DP_CTRL_PM";
-	case DP_STREAM_PM:	return "DP_STREAM_PM";
 	default:		return "???";
 	}
 }
-- 
2.39.2

