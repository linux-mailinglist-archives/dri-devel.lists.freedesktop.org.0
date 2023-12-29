Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D430820266
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 23:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0305910E2FE;
	Fri, 29 Dec 2023 22:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A6410E2EA
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 22:56:59 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50e7b273352so4165679e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 14:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703890617; x=1704495417; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vg8yJRW4p2x0lwIZbztyFSj/Gr+GANMZijc9xIjNZSM=;
 b=C+WoPDoXnJBEYO10PSqCD7f00qmTZ85n/GsWIPtB1w5xkKKZRhh3z4cpvRxyBVdV17
 C3agly5KVEC33Qj+/JuoU/lHejlwo6pNH3Hzmm8GHTBwPv9/ErB68hAZTAcvDe2lxCUC
 NTa9C7GHe+4hEMXcNgMtBXbv7TE4ZRX6pXFuz9cR+hCdqSq47+lrSzGmv5gRkGF7lveu
 Te0lyzVEWV1eeG3uAwmfIWD6mhSlbJgTBRkTpSXsVbbryjUI5mNZEPCGqkyR5JjVGzJE
 TYCLoriw8/3JXH2qab6TOCJeW6EYI2dxfxE0cvNzraW4h7+0f9QRmbr+gA7abW7yd9pI
 EVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703890617; x=1704495417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vg8yJRW4p2x0lwIZbztyFSj/Gr+GANMZijc9xIjNZSM=;
 b=HDac0Ru+PkmTQiX+/a5HB2TcoOprACiSAjbckssm5EMaUt+EAzCpXmunji/kHRetJA
 wQyYLWgWZOv89gCYRuqyoPs3di1Y5Zq4IpYCebWqt8guuEvugYLnEWxJquaYLbrgGwom
 eZowzY6A9dCYf3sljsshQLa7MKeYTDr1NO1y2FEERlG/eXj3MOEZE1/o97hWBw1tbITr
 dMYhWkKJ8ZKgEhLyviIvZFFY7cwbHqzu+bAwePuXtb4YtSDE7I4hi1+u8a39Dw2LIh5B
 eYqG2cD6dz3/Anq43QmzzBQtBoqNh/bmzYzoOZY02k+iq64w04DHa2oBdtqkluhzT6v3
 D9lg==
X-Gm-Message-State: AOJu0YxFqr1WBZAL3Pr9FV8U8Y+ALDgYLKd0uGFUba7sLc+qod24tyIN
 k76yMgYASOWuwarSDO5eqlGwbMd3fStszw==
X-Google-Smtp-Source: AGHT+IE2+chXc8Xc2K7q3QDqlEC3TxrQNe4abfwdDHsAa8dcvEQPT7I//JGkIdrmvCLe4AVuh9FNig==
X-Received: by 2002:a19:ac06:0:b0:50e:4acb:3d0d with SMTP id
 g6-20020a19ac06000000b0050e4acb3d0dmr4349535lfc.47.1703890617710; 
 Fri, 29 Dec 2023 14:56:57 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j26-20020ac2455a000000b0050e7f5794cbsm1326952lfm.309.2023.12.29.14.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 14:56:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH 08/14] drm/msm/dp: move phy_configure_opts to dp_ctrl
Date: Sat, 30 Dec 2023 00:56:44 +0200
Message-Id: <20231229225650.912751-9-dmitry.baryshkov@linaro.org>
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

There is little point in sharing phy configuration structure between
several modules. Move it to dp_ctrl, which becomes the only submodule
re-configuring the PHY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 19 -------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  2 --
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 41 +++++++++++++++++++----------
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
index 9b59a29547c0..3bb8bd83fff4 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -87,6 +87,8 @@ struct dp_ctrl_private {
 	struct dss_module_power mp[DP_MAX_PM];
 	struct clk *pixel_clk;
 
+	union phy_configure_opts phy_opts;
+
 	struct completion idle_comp;
 	struct completion psr_op_comp;
 	struct completion video_comp;
@@ -1026,6 +1028,21 @@ static int dp_ctrl_wait4video_ready(struct dp_ctrl_private *ctrl)
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
@@ -1038,7 +1055,7 @@ static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
 	drm_dbg_dp(ctrl->drm_dev,
 		"voltage level: %d emphasis level: %d\n",
 			voltage_swing_level, pre_emphasis_level);
-	ret = dp_catalog_ctrl_update_vx_px(ctrl->catalog,
+	ret = dp_ctrl_set_vx_px(ctrl,
 		voltage_swing_level, pre_emphasis_level);
 
 	if (ret)
@@ -1340,16 +1357,14 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
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
@@ -1488,13 +1503,11 @@ static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
 static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
-	struct dp_io *dp_io = &ctrl->parser->io;
-	struct phy *phy = dp_io->phy;
-	struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
+	struct phy *phy = ctrl->parser->io.phy;
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
-	opts_dp->lanes = ctrl->link->link_params.num_lanes;
-	phy_configure(phy, &dp_io->phy_opts);
+	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
+	phy_configure(phy, &ctrl->phy_opts);
 	/*
 	 * Disable and re-enable the mainlink clock since the
 	 * link clock might have been adjusted as part of the
@@ -1580,7 +1593,7 @@ static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
 
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

