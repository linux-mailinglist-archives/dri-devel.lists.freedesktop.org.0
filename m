Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B41B883D054
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 00:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33DAC10EDE2;
	Thu, 25 Jan 2024 23:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3988E10EBBE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 23:03:47 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2cf108d8dbeso41738531fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 15:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706223765; x=1706828565; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=f23f6k2NURR3hjj9IxLe37rVyBQBMzjyoSIDJiZdG1c=;
 b=nK4iSlR8McG2R62026Yv4FtxZYzxLwlJhqxCsfEzT+ILvtIU1Dk6/pDTefBrPufUFg
 JDr3bUBNHZzlklvgAuSnRQ9nhkxwLA0d25wZzKept7P2/bFXqBvcpt3LBF/DZ5orIsVy
 zgVBy/1C4OEeqYHfz9E2RYK54HCZDb5T6sSv9CyMaNDPU9sLkfmPsSF6thcBVMu2o1QB
 ccwDhRPTNkSJaWlDb7MD0nhmvoRga2c2IJduIKd564tt4Fp6iwHV9ZFpVw/MaczsIzIj
 EplqGuInthQ9OczYXLCwHmN5DeXYt0RH6Gx8eGD9JSbO+aK7UBCrL4qHKvT1DzYjuhua
 7JTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706223765; x=1706828565;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f23f6k2NURR3hjj9IxLe37rVyBQBMzjyoSIDJiZdG1c=;
 b=GBuEgArRwqO1fi68yaZE33fALrWutQ69Xf+SKmRz/GnIHHIIQ27TZkiCDIoGQ45E2g
 C3DfsXoLD52kML0VOZmtcL/nfdMZZAk0LK77SMUM9+HPCNN+4AI6bJo/2tlopXtTakAL
 iw97g6odn+RgKZ2+z+jFq3MjtV3Zx5i7yW7fiUrxRk5v0/zKdwijKK6/qZ4Q6IAYDp5f
 bxv/Gz+xegZGYoX3hhmL922KujZJnqzOcS6jNNIVzM/gF0Y/VMrlsS4Kyi+ChH6ODL3J
 vohxqgmfWoO2kui39xs28/DZudZ93zFi3NoDvRijyN9EYJbLLhVX48/k9nYFFAdWA1XG
 o1Nw==
X-Gm-Message-State: AOJu0Yw/plvhUOdciWQSWBOpcjsVFpzyE4mXe0F5y3xJVlCNux2W1god
 +bcyK+c02w8GVjms0H+Xr4N5HlBRqzzKXzR/xxhuid0J8q0hC6E9WlqvzNw0lV0=
X-Google-Smtp-Source: AGHT+IHWL7lF9e3bxYIvviM0rpRY3/N/LEZxutH26qo4iWViNLetyA61IJqVdclQuX8iyb8qCwkkDA==
X-Received: by 2002:a2e:8856:0:b0:2cf:3037:2a35 with SMTP id
 z22-20020a2e8856000000b002cf30372a35mr193008ljj.48.1706223765497; 
 Thu, 25 Jan 2024 15:02:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 x19-20020a2e8813000000b002cdfc29b46dsm405872ljh.88.2024.01.25.15.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 15:02:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:02:38 +0200
Subject: [PATCH v3 09/15] drm/msm/dp: move phy_configure_opts to dp_ctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-9-e2e46f4d390c@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6449;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JHMCbSPE7gZXRzZ8Yh8uYk+Fdg3YzXkUqA/+AlXGaYM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsuiI+CRVzFO0JONwDtwe7JlErZ4iifllbSvuk
 Ar1cShrPe2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLoiAAKCRCLPIo+Aiko
 1d1FB/wOltnFkPJD4pVXXHYxjDRCSYycagYhyrH65rnoMYJ8MDlUdlDKE84poWo34C6Xc/STtQP
 XwVGU47raz6l9Ck6+kDgIo/dZqCf4KwZXXTJgpcU5RkCJ6PBqHyYFDHw0sEF+1X2SWdUdUBQSJd
 7g2+ImipGqZ8lEsr0ngQmSkR70oieMQN+3E7WWcHoxd7IzDauFnctCKqMpWFhOgi5vkaiu7skrg
 cgVzkV/kJKWRE7IA5QOH4oHZRQh3o38C9k6mWHWZ35FNPTmat+kfYa99ZxEVpfUqULKNW53RwIi
 omylb0fBjDt/ulYwdawTtynDyGTjyKMKxJd5ycXMHRxz8ZJj
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

There is little point in sharing phy configuration structure between
several modules. Move it to dp_ctrl, which becomes the only submodule
re-configuring the PHY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 19 -----------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  2 --
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 41 ++++++++++++++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_parser.h  |  3 ---
 4 files changed, 27 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 5142aeb705a4..e07651768805 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -765,25 +765,6 @@ void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog)
 	dp_write_ahb(catalog, REG_DP_PHY_CTRL, 0x0);
 }
 
-int dp_catalog_ctrl_update_vx_px(struct dp_catalog *dp_catalog,
-		u8 v_level, u8 p_level)
-{
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
-	struct dp_io *dp_io = catalog->io;
-	struct phy *phy = dp_io->phy;
-	struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
-
-	/* TODO: Update for all lanes instead of just first one */
-	opts_dp->voltage[0] = v_level;
-	opts_dp->pre[0] = p_level;
-	opts_dp->set_voltages = 1;
-	phy_configure(phy, &dp_io->phy_opts);
-	opts_dp->set_voltages = 0;
-
-	return 0;
-}
-
 void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
 			u32 pattern)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 38786e855b51..ba7c62ba7ca3 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -111,8 +111,6 @@ void dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool enter);
 u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog);
 u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog);
-int dp_catalog_ctrl_update_vx_px(struct dp_catalog *dp_catalog, u8 v_level,
-				u8 p_level);
 int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog);
 u32 dp_catalog_ctrl_read_psr_interrupt_status(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_update_transfer_unit(struct dp_catalog *dp_catalog,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index e367eb8e5bea..4aea72a2b8e8 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -87,6 +87,8 @@ struct dp_ctrl_private {
 
 	struct clk *pixel_clk;
 
+	union phy_configure_opts phy_opts;
+
 	struct completion idle_comp;
 	struct completion psr_op_comp;
 	struct completion video_comp;
@@ -1017,6 +1019,21 @@ static int dp_ctrl_wait4video_ready(struct dp_ctrl_private *ctrl)
 	return ret;
 }
 
+static int dp_ctrl_set_vx_px(struct dp_ctrl_private *ctrl,
+			     u8 v_level, u8 p_level)
+{
+	union phy_configure_opts *phy_opts = &ctrl->phy_opts;
+
+	/* TODO: Update for all lanes instead of just first one */
+	phy_opts->dp.voltage[0] = v_level;
+	phy_opts->dp.pre[0] = p_level;
+	phy_opts->dp.set_voltages = 1;
+	phy_configure(ctrl->parser->io.phy, phy_opts);
+	phy_opts->dp.set_voltages = 0;
+
+	return 0;
+}
+
 static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
 {
 	struct dp_link *link = ctrl->link;
@@ -1029,7 +1046,7 @@ static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
 	drm_dbg_dp(ctrl->drm_dev,
 		"voltage level: %d emphasis level: %d\n",
 			voltage_swing_level, pre_emphasis_level);
-	ret = dp_catalog_ctrl_update_vx_px(ctrl->catalog,
+	ret = dp_ctrl_set_vx_px(ctrl,
 		voltage_swing_level, pre_emphasis_level);
 
 	if (ret)
@@ -1425,16 +1442,14 @@ static void dp_ctrl_link_clk_disable(struct dp_ctrl *dp_ctrl)
 static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
-	struct dp_io *dp_io = &ctrl->parser->io;
-	struct phy *phy = dp_io->phy;
-	struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
+	struct phy *phy = ctrl->parser->io.phy;
 	const u8 *dpcd = ctrl->panel->dpcd;
 
-	opts_dp->lanes = ctrl->link->link_params.num_lanes;
-	opts_dp->link_rate = ctrl->link->link_params.rate / 100;
-	opts_dp->ssc = drm_dp_max_downspread(dpcd);
+	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
+	ctrl->phy_opts.dp.link_rate = ctrl->link->link_params.rate / 100;
+	ctrl->phy_opts.dp.ssc = drm_dp_max_downspread(dpcd);
 
-	phy_configure(phy, &dp_io->phy_opts);
+	phy_configure(phy, &ctrl->phy_opts);
 	phy_power_on(phy);
 
 	dev_pm_opp_set_rate(ctrl->dev, ctrl->link->link_params.rate * 1000);
@@ -1572,14 +1587,12 @@ static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
 
 static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 {
+	struct phy *phy = ctrl->parser->io.phy;
 	int ret = 0;
-	struct dp_io *dp_io = &ctrl->parser->io;
-	struct phy *phy = dp_io->phy;
-	struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
-	opts_dp->lanes = ctrl->link->link_params.num_lanes;
-	phy_configure(phy, &dp_io->phy_opts);
+	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
+	phy_configure(phy, &ctrl->phy_opts);
 	/*
 	 * Disable and re-enable the mainlink clock since the
 	 * link clock might have been adjusted as part of the
@@ -1659,7 +1672,7 @@ static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "request: 0x%x\n", pattern_requested);
 
-	if (dp_catalog_ctrl_update_vx_px(ctrl->catalog,
+	if (dp_ctrl_set_vx_px(ctrl,
 			ctrl->link->phy_params.v_level,
 			ctrl->link->phy_params.p_level)) {
 		DRM_ERROR("Failed to set v/p levels\n");
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index cad82c4d07da..b28052e87101 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -7,8 +7,6 @@
 #define _DP_PARSER_H_
 
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
-#include <linux/phy/phy-dp.h>
 
 #include "msm_drv.h"
 
@@ -37,7 +35,6 @@ struct dss_io_data {
 struct dp_io {
 	struct dss_io_data dp_controller;
 	struct phy *phy;
-	union phy_configure_opts phy_opts;
 };
 
 /**

-- 
2.39.2

