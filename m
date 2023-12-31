Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE4D820945
	for <lists+dri-devel@lfdr.de>; Sun, 31 Dec 2023 01:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960AE10E0D2;
	Sun, 31 Dec 2023 00:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18E410E07B
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Dec 2023 00:44:02 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50e67e37661so8238345e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Dec 2023 16:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703983441; x=1704588241; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=becAfxylwmZejS0VIfTonRkPwt9DcFnsVmjDJA3q3c4=;
 b=uFVcz47dEYfA0IaZk9bWOuuz6uSMaeqQOn2rKLmqzt9G+SxfY/02TYoi4T8EY8gKTK
 aqG5XM3UPJHLLwa69vd//dnMuxg8jiUQTXX9qmLJpbtFaOZHifNEaYi6j46/Qc4q84uF
 RUg/2Ou8FjXS4M0iKR9geQXMPtEfaPcxLjF6bK3v+KFmXSs0zPrx0irF2agMLrylLGGr
 fft6eaZk576Ke7339rv5FuQ44r7IMa4og7+QAYahe8s+6BJT4O8z5wbZLiRapPKHioY+
 Ypa9c+V35ZUleJP6+4i1JXLtCNDNuE76UGbJyJXmrM0/br2q8MrlHuWf6NnFDeKENhrI
 kUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703983441; x=1704588241;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=becAfxylwmZejS0VIfTonRkPwt9DcFnsVmjDJA3q3c4=;
 b=SnHrdZTClsnYdYg+Q7a19ZoIu9B+84nIayKUKDhZuN+qfVnkyXohLzwdt5aXwYVPCV
 6YzRwGvLR7jiQrYCdawZJ+lI6QNpfdznlThSqBWxzDVCZuOQMHIlFJ7S1PMmTaFKmwy4
 u+LxCyvMLB4oWbL+WMaXZ+zSrIORQfeG6nSxV949dKDrZqKBOBdfTArXZo8uWyV/r5ip
 Oj0pZaVlbo+WPvj2BeKYqpR0Uf6jq+ufNEL5Jqdp9POWotv1g3Z3Kr1m8PsaeIR0RxiT
 Bshzk9KERFPmtsyuqt+CU3QrUrra/ZpERWRwRRbf+I5iFgY3un6NjPbDXJxqXz+2WNYw
 4XQg==
X-Gm-Message-State: AOJu0YyYPe6g8wYnfZA7zyIo37rRwVyJ4WKQHgp8fwNLPYQAWramzC3o
 VGWAmLcV1686rw0u4boINSKzT6cV2wpquQ==
X-Google-Smtp-Source: AGHT+IHuW3QgLgCJA7oefEzIW2fqq27QZ/rINRI3UmdwnBZIHNbNfBENJfiPSH5rpips+d4C8s+tXg==
X-Received: by 2002:a05:6512:401d:b0:50e:7d27:f930 with SMTP id
 br29-20020a056512401d00b0050e7d27f930mr5333958lfb.29.1703983441106; 
 Sat, 30 Dec 2023 16:44:01 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05651203ed00b0050e84be8127sm1295995lfq.101.2023.12.30.16.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 16:44:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Dec 2023 02:43:53 +0200
Subject: [PATCH v2 06/15] drm/msm/dp: simplify stream clocks handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231231-dp-power-parser-cleanup-v2-6-fc3e902a6f5b@linaro.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=10486;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hNPMvZ0gaSY5MPKRR/EBckDQolNgLCvX0skn+OxZNXs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlkLlKyJwE9kbx2m5jIaXScnlda8Tcu+A1MexiL
 sMPKNRNOvaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZC5SgAKCRCLPIo+Aiko
 1aQUB/9HlGuZ1ew9NkmC1q95mi79bxIbjS4y5ZAsgaZru0Aeqh0KAE+7JTC/6a/cBDm2V/mAzLG
 gdi0Jgl7xJgmFfkGeSaAD7mV/ddkgAcNSAFypdowj0SmbiC+P673Ulc/RKY5aaSzQiAKNj55cK4
 OprL4YaH/HnkeaUu2uJLJZKRsVAnZ6qSFBQ41l9qmkgUv9UCvHtwz/NeoGzGB2EhI588V0K/nGQ
 kAu38pgK1wh6MMQCKTjVxKV+EnFBIseQgfzpJ2pu2oi6AVK0pJZ6xqy80l91PXo8gp6ZU6VsOAE
 W6DAWZFKgbEvMas757mewE7pu9NvcXirCoJR8tMRFYX9V0IH
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is only a single DP_STREAM_PM clock, stream_pixel. Instead of
using a separate dss_module_power instance for this single clock, handle
this clock directly. This allows us to drop several wrapping functions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c   | 91 ++++++++++++++++----------------------
 drivers/gpu/drm/msm/dp/dp_parser.c | 41 ++++-------------
 drivers/gpu/drm/msm/dp/dp_parser.h |  2 -
 3 files changed, 47 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index da29281c575b..56a424a82a1b 100644
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
 int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 		       enum dp_pm_type pm_type, bool enable)
 {
@@ -1351,8 +1332,7 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 
 	if (pm_type != DP_CORE_PM &&
-	    pm_type != DP_CTRL_PM &&
-	    pm_type != DP_STREAM_PM) {
+	    pm_type != DP_CTRL_PM) {
 		DRM_ERROR("unsupported ctrl module: %s\n",
 			  dp_parser_pm_name(pm_type));
 		return -EINVAL;
@@ -1371,12 +1351,6 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 			return 0;
 		}
 
-		if (pm_type == DP_STREAM_PM && ctrl->stream_clks_on) {
-			drm_dbg_dp(ctrl->drm_dev,
-				   "pixel clks already enabled\n");
-			return 0;
-		}
-
 		if ((pm_type == DP_CTRL_PM) && (!ctrl->core_clks_on)) {
 			drm_dbg_dp(ctrl->drm_dev,
 				   "Enable core clks before link clks\n");
@@ -1401,8 +1375,6 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 
 	if (pm_type == DP_CORE_PM)
 		ctrl->core_clks_on = enable;
-	else if (pm_type == DP_STREAM_PM)
-		ctrl->stream_clks_on = enable;
 	else
 		ctrl->link_clks_on = enable;
 
@@ -1734,14 +1706,23 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
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
@@ -1977,14 +1958,23 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
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
 
@@ -2036,11 +2026,8 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
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
@@ -2108,9 +2095,10 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 
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
@@ -2174,7 +2162,7 @@ static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl_private;
 	int rc = 0;
-	struct dss_module_power *core, *ctrl, *stream;
+	struct dss_module_power *core, *ctrl;
 	struct device *dev;
 
 	ctrl_private = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
@@ -2182,7 +2170,6 @@ static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
 
 	core = &ctrl_private->parser->mp[DP_CORE_PM];
 	ctrl = &ctrl_private->parser->mp[DP_CTRL_PM];
-	stream = &ctrl_private->parser->mp[DP_STREAM_PM];
 
 	rc = devm_clk_bulk_get(dev, core->num_clk, core->clocks);
 	if (rc)
@@ -2192,9 +2179,9 @@ static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
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

