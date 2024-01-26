Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F331783E17A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 19:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625AF10FD5D;
	Fri, 26 Jan 2024 18:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFDE10FD3E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 18:27:31 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2cf4bc44ce1so8476471fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 10:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706293590; x=1706898390; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nJWE1GkcFImEj2DxRPKAZs3b3f9vVuqQlVDaF+/qbvU=;
 b=am7cGPmtr0DmDDiFBJEQrngZiQ7rmGjhzTIioi8PellZ6RMazN05zeBfjAv4RJR+PL
 OA+MFrv08iOceMg6Y964/gAgsbX2GST9v6tjfEtuDKFj9KPEV7vZ0g+ee8ZWCWMKsX+F
 poG4Q0rko+YsRvMI0i8LNwGUbCRTxkXAVE5LpRoA+DuJPzMimE/E7T66WBZM3zYRD2B3
 yALfWw5QgrFAnnPUNz5qmj9jUWyUms6O7w7Y+gUuzg+7deXb336nFfdR1M7Z8d7Dds5E
 tscDiuF5gaNtVGM808o4XE96jnpGUyZngscgoui8ALgkdDWbtLq7NvpK6VXGTBsLPUEO
 l7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706293590; x=1706898390;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nJWE1GkcFImEj2DxRPKAZs3b3f9vVuqQlVDaF+/qbvU=;
 b=MAu01m7o7Hrmk3puUYpUXE64k3r9yCkoKGuRi6NQkFU8r0U+cqD1V8p+4fo7/hBSFk
 ugPWnGJP4Fm9iRwsgWD+ESdWGFj3FS1+fLiZS7X2YUubQ/C2dn8qQn03iFt2GenVuYEY
 PdpqPW00tkIzZKv9s1XIhXP0rhoiiWFMzD9ZqP6ghBx3YMt/JJ34+vetOZQO2wjGS9Ri
 Ab+Qe4GfvF7XMxqhpru0O/dVN1Ug5JkfzhXYwKMmafpzrnsOScVfQ4cpoMKdWgDLNm9m
 Ye5ESbVSDtgR7dPQHV/1Z315WQDGnIeNkOTnl/lnGSCQF7gAiU063USt0brBLt+ycx8R
 UCJQ==
X-Gm-Message-State: AOJu0Ywevg6w20G4VqMpUESL2cTR1FsbMFepfNmb+570xVHJEd/09Kao
 HzhFugVQhO0a5TL3xtZXGGl1L6LLIMdWXZpQv75A9/K8tahTgxF8aYsm0AkqDs4=
X-Google-Smtp-Source: AGHT+IE9js+jiMl9HAgf7a0xx+UUFgdbeu4zM5rWNMS7Of/4SzAy/9qNO/AZQUuT8WwdjPrS8IBXlA==
X-Received: by 2002:a2e:9089:0:b0:2cf:2f60:cdcc with SMTP id
 l9-20020a2e9089000000b002cf2f60cdccmr142863ljg.72.1706293589966; 
 Fri, 26 Jan 2024 10:26:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 10:26:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 20:26:24 +0200
Subject: [PATCH RESEND v3 05/15] drm/msm/dp: fold dp_power into dp_ctrl module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-5-098d5f581dd3@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=20838;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dCw0JTAvwTm3wGka2zU3RC0fLmOOYChcuRvVrtRzN5I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBls/lQ2wCxhri7sBLBAZECfAx/xoe1o8fEwUu/y
 0d4jCO+ZSeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbP5UAAKCRCLPIo+Aiko
 1UNLB/94FMPePgcgET5nlim1nq83D0ue9CqAhhGO7Yv/8JGUysPSCCIo3YHodORuB6KHIUNvtP4
 Zso8+HBiSiMOID8zC2ip2TuIB+H2vSiEQfc2Z55Hj2aPS5vAxG1yLGrd+2Kmz2gnEj1esLjI2f0
 B2PZCnIdPL3YDlcP839yd9RDV3PdLUQZojNnjl+njtIgacKuMrOjxQkPqjFJZVUkeUf0dDmx/fX
 YHJskarTz5CuBMnSNn/HKtGgDH/KbHq9EOK/hbFuTuDaVmJZ47c81NjevtvLI0MiYRqqXIDaAYV
 CQdO0F5vX3dNN8EdAHdfllx4UhMwftpB48avWXu12arm1Oo+
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

The dp_power submodule is limited to handling the clocks only following
previous cleanups. Fold it into the dp_ctrl submodule, removing one
unnecessary level of indirection.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile        |   1 -
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 150 +++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   6 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  24 +----
 drivers/gpu/drm/msm/dp/dp_power.c   | 170 ------------------------------------
 drivers/gpu/drm/msm/dp/dp_power.h   |  74 ----------------
 6 files changed, 142 insertions(+), 283 deletions(-)

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
index 77a8d9366ed7..da29281c575b 100644
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
@@ -1338,6 +1341,83 @@ static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
 				name, rate);
 }
 
+int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
+		       enum dp_pm_type pm_type, bool enable)
+{
+	struct dp_ctrl_private *ctrl;
+	struct dss_module_power *mp;
+	int ret = 0;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	if (pm_type != DP_CORE_PM &&
+	    pm_type != DP_CTRL_PM &&
+	    pm_type != DP_STREAM_PM) {
+		DRM_ERROR("unsupported ctrl module: %s\n",
+			  dp_parser_pm_name(pm_type));
+		return -EINVAL;
+	}
+
+	if (enable) {
+		if (pm_type == DP_CORE_PM && ctrl->core_clks_on) {
+			drm_dbg_dp(ctrl->drm_dev,
+				   "core clks already enabled\n");
+			return 0;
+		}
+
+		if (pm_type == DP_CTRL_PM && ctrl->link_clks_on) {
+			drm_dbg_dp(ctrl->drm_dev,
+				   "links clks already enabled\n");
+			return 0;
+		}
+
+		if (pm_type == DP_STREAM_PM && ctrl->stream_clks_on) {
+			drm_dbg_dp(ctrl->drm_dev,
+				   "pixel clks already enabled\n");
+			return 0;
+		}
+
+		if ((pm_type == DP_CTRL_PM) && (!ctrl->core_clks_on)) {
+			drm_dbg_dp(ctrl->drm_dev,
+				   "Enable core clks before link clks\n");
+			mp = &ctrl->parser->mp[DP_CORE_PM];
+
+			ret = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
+			if (ret)
+				return ret;
+
+			ctrl->core_clks_on = true;
+		}
+	}
+
+	mp = &ctrl->parser->mp[pm_type];
+	if (enable) {
+		ret = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
+		if (ret)
+			return ret;
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
+		   enable ? "enable" : "disable",
+		   dp_parser_pm_name(pm_type));
+	drm_dbg_dp(ctrl->drm_dev,
+		   "stream_clks:%s link_clks:%s core_clks:%s\n",
+		   ctrl->stream_clks_on ? "on" : "off",
+		   ctrl->link_clks_on ? "on" : "off",
+		   ctrl->core_clks_on ? "on" : "off");
+
+	return 0;
+}
+
 static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
@@ -1354,7 +1434,7 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 	phy_power_on(phy);
 
 	dev_pm_opp_set_rate(ctrl->dev, ctrl->link->link_params.rate * 1000);
-	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);
+	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, true);
 	if (ret)
 		DRM_ERROR("Unable to start link clocks. ret=%d\n", ret);
 
@@ -1502,7 +1582,7 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	 * link maintenance.
 	 */
 	dev_pm_opp_set_rate(ctrl->dev, 0);
-	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
+	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
 	if (ret) {
 		DRM_ERROR("Failed to disable clocks. ret=%d\n", ret);
 		return ret;
@@ -1534,7 +1614,7 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	dp_catalog_ctrl_reset(ctrl->catalog);
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
-	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
+	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
 	if (ret) {
 		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
 	}
@@ -1656,7 +1736,7 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
 	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel", pixel_rate * 1000);
 
-	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
+	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, true);
 	if (ret) {
 		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
 		return ret;
@@ -1752,7 +1832,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 	rate = ctrl->panel->link_info.rate;
 	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 
-	dp_power_clk_enable(ctrl->power, DP_CORE_PM, true);
+	dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CORE_PM, true);
 
 	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
 		drm_dbg_dp(ctrl->drm_dev,
@@ -1885,7 +1965,11 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
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
@@ -1895,7 +1979,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 
 	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel", pixel_rate * 1000);
 
-	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
+	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, true);
 	if (ret) {
 		DRM_ERROR("Unable to start pixel clocks. ret=%d\n", ret);
 		goto end;
@@ -1951,8 +2035,8 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
-	if (dp_power_clk_status(ctrl->power, DP_STREAM_PM)) {
-		ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, false);
+	if (ctrl->stream_clks_on) {
+		ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_STREAM_PM, false);
 		if (ret) {
 			DRM_ERROR("Failed to disable pclk. ret=%d\n", ret);
 			return ret;
@@ -1960,7 +2044,7 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 	}
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
-	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
+	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
 	if (ret) {
 		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
 		return ret;
@@ -1990,7 +2074,7 @@ int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
-	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
+	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
 	if (ret) {
 		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
 	}
@@ -2024,12 +2108,12 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 
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
@@ -2086,9 +2170,38 @@ irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
 	return ret;
 }
 
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
@@ -2125,11 +2238,16 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
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
index b2c27d3532bf..85da5a7e5307 100644
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
@@ -39,4 +38,7 @@ void dp_ctrl_irq_phy_exit(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enable);
 void dp_ctrl_config_psr(struct dp_ctrl *dp_ctrl);
 
+int dp_ctrl_clk_enable(struct dp_ctrl *ctrl, enum dp_pm_type pm_type,
+		       bool enable);
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

