Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FC237A883
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 16:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAC66EA4B;
	Tue, 11 May 2021 14:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48BF6EA47
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 14:07:19 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id x20so28841910lfu.6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 07:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bsEuHIj5J/YsrtSmMPaSSA1qFF7kAMjtGcz6topiIWk=;
 b=XfM4qTuAvmaPAPtn1mkjXQWAz50VRpEowkzluicvMf3VdvEZCL2VuaFNjAJJfx3E1L
 +Z9OjbbLoBYd+4kzNZPg7z9vg1/nRd8x3Qxciw8ykOV6l5qzi6k9lMtwbMeWIUgylkJ7
 zuiZF2jK4S+jrxytvN948hr+Cm9/hmLTXgxOoQeUBCl/+3wwOzk/2PY3CBh/z7swog2+
 oYDgW/G5DC+osGiGMhtgdNuqFlMvQ65HoaEvo2zfU59TBMXWgTTfKFOORU3pPO4+6izQ
 xoOFanOZF5O8ED4kggFrIa2u2risshWzOARfNfnSoUgRzWC5PwYQCwgCnlQ8t5kMkSMJ
 L3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bsEuHIj5J/YsrtSmMPaSSA1qFF7kAMjtGcz6topiIWk=;
 b=W3bZc+thxBePf/zpCRjOXO7tuuHfooV468s9IIRJL/781bk3KkiESDJ582oNYA77/x
 XXs5e8D+z4XiAE9vK8TXjWyZsSorWxfFCr2crMNRl5cOkfiU/ERLR8Nb/kwqD1zvBAsP
 gX7azUxfBmzwEBV1oHcfMxd7uBqyEk+nJOU3iL1ZSceZCh9Pj9Y+077FWbWkHkHOrqXz
 bBLFl2CKjXU2NCcQh3+E2aDUswsLn8k8AtjCyYIUgpG9SwXcmv9ELZgihRqr6SxGSjMw
 4sxNLrtinNA6mdjqs0XRR+nVca8ZQFkJnE+U78jhJbCIrKo5Ih+u6/uTU0tC2YZEE+BL
 kG4A==
X-Gm-Message-State: AOAM533zPjiekZSEAcnnGDm+tYP6eUW/4BBGGLOi/rIf8WODwgs3sHAf
 m+ZgrZO+/ider2x2IPWNinuPyg==
X-Google-Smtp-Source: ABdhPJxE7wx6Cb40zb9zx17/no5n5j+RqVc02Zl8Wm542tX2+LSnc4PjpDWRSlhNvLdJFaiwU6jnhQ==
X-Received: by 2002:a19:f617:: with SMTP id x23mr20181777lfe.97.1620742037892; 
 Tue, 11 May 2021 07:07:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w23sm3731989ljw.59.2021.05.11.07.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 07:07:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 2/2] drm/msm/dp: rewrite dss_module_power to use bulk clock
 functions
Date: Tue, 11 May 2021 17:07:13 +0300
Message-Id: <20210511140713.627291-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511140713.627291-1-dmitry.baryshkov@linaro.org>
References: <20210511140713.627291-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to simplify DP code, drop hand-coded loops over clock arrays,
replacing them with clk_bulk_* functions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile         |   1 -
 drivers/gpu/drm/msm/dp/dp_clk_util.c | 120 ---------------------------
 drivers/gpu/drm/msm/dp/dp_clk_util.h |  38 ---------
 drivers/gpu/drm/msm/dp/dp_ctrl.c     |  19 ++---
 drivers/gpu/drm/msm/dp/dp_parser.c   |  21 ++++-
 drivers/gpu/drm/msm/dp/dp_parser.h   |  17 +++-
 drivers/gpu/drm/msm/dp/dp_power.c    |  81 +++++++++---------
 7 files changed, 83 insertions(+), 214 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_clk_util.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_clk_util.h

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 6621b75e3c7b..0c1a559dd2fc 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -103,7 +103,6 @@ msm-$(CONFIG_DRM_MSM_GPU_STATE)	+= adreno/a6xx_gpu_state.o
 
 msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_catalog.o \
-	dp/dp_clk_util.o \
 	dp/dp_ctrl.o \
 	dp/dp_display.o \
 	dp/dp_drm.o \
diff --git a/drivers/gpu/drm/msm/dp/dp_clk_util.c b/drivers/gpu/drm/msm/dp/dp_clk_util.c
deleted file mode 100644
index 44a4fc59ff31..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_clk_util.c
+++ /dev/null
@@ -1,120 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2012-2015, 2017-2018, The Linux Foundation.
- * All rights reserved.
- */
-
-#include <linux/clk.h>
-#include <linux/clk/clk-conf.h>
-#include <linux/err.h>
-#include <linux/delay.h>
-#include <linux/of.h>
-
-#include <drm/drm_print.h>
-
-#include "dp_clk_util.h"
-
-void msm_dss_put_clk(struct dss_clk *clk_arry, int num_clk)
-{
-	int i;
-
-	for (i = num_clk - 1; i >= 0; i--) {
-		if (clk_arry[i].clk)
-			clk_put(clk_arry[i].clk);
-		clk_arry[i].clk = NULL;
-	}
-}
-
-int msm_dss_get_clk(struct device *dev, struct dss_clk *clk_arry, int num_clk)
-{
-	int i, rc = 0;
-
-	for (i = 0; i < num_clk; i++) {
-		clk_arry[i].clk = clk_get(dev, clk_arry[i].clk_name);
-		rc = PTR_ERR_OR_ZERO(clk_arry[i].clk);
-		if (rc) {
-			DEV_ERR("%pS->%s: '%s' get failed. rc=%d\n",
-				__builtin_return_address(0), __func__,
-				clk_arry[i].clk_name, rc);
-			goto error;
-		}
-	}
-
-	return rc;
-
-error:
-	for (i--; i >= 0; i--) {
-		if (clk_arry[i].clk)
-			clk_put(clk_arry[i].clk);
-		clk_arry[i].clk = NULL;
-	}
-
-	return rc;
-}
-
-int msm_dss_clk_set_rate(struct dss_clk *clk_arry, int num_clk)
-{
-	int i, rc = 0;
-
-	for (i = 0; i < num_clk; i++) {
-		if (clk_arry[i].clk) {
-			if (clk_arry[i].type != DSS_CLK_AHB) {
-				DEV_DBG("%pS->%s: '%s' rate %ld\n",
-					__builtin_return_address(0), __func__,
-					clk_arry[i].clk_name,
-					clk_arry[i].rate);
-				rc = clk_set_rate(clk_arry[i].clk,
-					clk_arry[i].rate);
-				if (rc) {
-					DEV_ERR("%pS->%s: %s failed. rc=%d\n",
-						__builtin_return_address(0),
-						__func__,
-						clk_arry[i].clk_name, rc);
-					break;
-				}
-			}
-		} else {
-			DEV_ERR("%pS->%s: '%s' is not available\n",
-				__builtin_return_address(0), __func__,
-				clk_arry[i].clk_name);
-			rc = -EPERM;
-			break;
-		}
-	}
-
-	return rc;
-}
-
-int msm_dss_enable_clk(struct dss_clk *clk_arry, int num_clk, int enable)
-{
-	int i, rc = 0;
-
-	if (enable) {
-		for (i = 0; i < num_clk; i++) {
-			DEV_DBG("%pS->%s: enable '%s'\n",
-				__builtin_return_address(0), __func__,
-				clk_arry[i].clk_name);
-			rc = clk_prepare_enable(clk_arry[i].clk);
-			if (rc)
-				DEV_ERR("%pS->%s: %s en fail. rc=%d\n",
-					__builtin_return_address(0),
-					__func__,
-					clk_arry[i].clk_name, rc);
-
-			if (rc && i) {
-				msm_dss_enable_clk(&clk_arry[i - 1],
-					i - 1, false);
-				break;
-			}
-		}
-	} else {
-		for (i = num_clk - 1; i >= 0; i--) {
-			DEV_DBG("%pS->%s: disable '%s'\n",
-				__builtin_return_address(0), __func__,
-				clk_arry[i].clk_name);
-
-			clk_disable_unprepare(clk_arry[i].clk);
-		}
-	}
-
-	return rc;
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_clk_util.h b/drivers/gpu/drm/msm/dp/dp_clk_util.h
deleted file mode 100644
index 6288a2833a58..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_clk_util.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (c) 2012, 2017-2018, The Linux Foundation. All rights reserved.
- */
-
-#ifndef __DPU_IO_UTIL_H__
-#define __DPU_IO_UTIL_H__
-
-#include <linux/platform_device.h>
-#include <linux/types.h>
-
-#define DEV_DBG(fmt, args...)   pr_debug(fmt, ##args)
-#define DEV_INFO(fmt, args...)  pr_info(fmt, ##args)
-#define DEV_WARN(fmt, args...)  pr_warn(fmt, ##args)
-#define DEV_ERR(fmt, args...)   pr_err(fmt, ##args)
-
-enum dss_clk_type {
-	DSS_CLK_AHB, /* no set rate. rate controlled through rpm */
-	DSS_CLK_PCLK,
-};
-
-struct dss_clk {
-	struct clk *clk; /* clk handle */
-	char clk_name[32];
-	enum dss_clk_type type;
-	unsigned long rate;
-	unsigned long max_rate;
-};
-
-struct dss_module_power {
-	unsigned int num_clk;
-	struct dss_clk *clk_config;
-};
-
-int msm_dss_get_clk(struct device *dev, struct dss_clk *clk_arry, int num_clk);
-void msm_dss_put_clk(struct dss_clk *clk_arry, int num_clk);
-int msm_dss_clk_set_rate(struct dss_clk *clk_arry, int num_clk);
-int msm_dss_enable_clk(struct dss_clk *clk_arry, int num_clk, int enable);
-#endif /* __DPU_IO_UTIL_H__ */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 1390f3547fde..e34c7842c0a0 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1305,20 +1305,19 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
 static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
 			enum dp_pm_type module, char *name, unsigned long rate)
 {
+	u32 i;
 	u32 num = ctrl->parser->mp[module].num_clk;
-	struct dss_clk *cfg = ctrl->parser->mp[module].clk_config;
-
-	while (num && strcmp(cfg->clk_name, name)) {
-		num--;
-		cfg++;
-	}
 
 	DRM_DEBUG_DP("setting rate=%lu on clk=%s\n", rate, name);
 
-	if (num)
-		cfg->rate = rate;
-	else
-		DRM_ERROR("%s clock doesn't exit to set rate %lu\n",
+	for (i = 0; i < num; i++) {
+		if (!strcmp(ctrl->parser->mp[module].clocks[i].id, name)) {
+			ctrl->parser->mp[module].clk_config[i].rate = rate;
+			return;
+		}
+	}
+
+	DRM_ERROR("%s clock doesn't exit to set rate %lu\n",
 				name, rate);
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 0519dd3ac3c3..0979bdf6a859 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -145,6 +145,11 @@ static int dp_parser_init_clk_data(struct dp_parser *parser)
 	}
 
 	core_power->num_clk = core_clk_count;
+	core_power->clocks = devm_kcalloc(dev,
+			core_power->num_clk, sizeof(struct clk_bulk_data),
+			GFP_KERNEL);
+	if (!core_power->clocks)
+		return -ENOMEM;
 	core_power->clk_config = devm_kzalloc(dev,
 			sizeof(struct dss_clk) * core_power->num_clk,
 			GFP_KERNEL);
@@ -158,6 +163,11 @@ static int dp_parser_init_clk_data(struct dp_parser *parser)
 	}
 
 	ctrl_power->num_clk = ctrl_clk_count;
+	ctrl_power->clocks = devm_kcalloc(dev,
+			ctrl_power->num_clk, sizeof(struct clk_bulk_data),
+			GFP_KERNEL);
+	if (!ctrl_power->clocks)
+		return -ENOMEM;
 	ctrl_power->clk_config = devm_kzalloc(dev,
 			sizeof(struct dss_clk) * ctrl_power->num_clk,
 			GFP_KERNEL);
@@ -173,6 +183,11 @@ static int dp_parser_init_clk_data(struct dp_parser *parser)
 	}
 
 	stream_power->num_clk = stream_clk_count;
+	stream_power->clocks = devm_kcalloc(dev,
+			stream_power->num_clk, sizeof(struct clk_bulk_data),
+			GFP_KERNEL);
+	if (!stream_power->clocks)
+		return -ENOMEM;
 	stream_power->clk_config = devm_kzalloc(dev,
 			sizeof(struct dss_clk) * stream_power->num_clk,
 			GFP_KERNEL);
@@ -219,21 +234,21 @@ static int dp_parser_clock(struct dp_parser *parser)
 				core_clk_index < core_clk_count) {
 			struct dss_clk *clk =
 				&core_power->clk_config[core_clk_index];
-			strlcpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
+			core_power->clocks[i].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
 			clk->type = DSS_CLK_AHB;
 			core_clk_index++;
 		} else if (dp_parser_check_prefix("stream", clk_name) &&
 				stream_clk_index < stream_clk_count) {
 			struct dss_clk *clk =
 				&stream_power->clk_config[stream_clk_index];
-			strlcpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
+			stream_power->clocks[i].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
 			clk->type = DSS_CLK_PCLK;
 			stream_clk_index++;
 		} else if (dp_parser_check_prefix("ctrl", clk_name) &&
 			   ctrl_clk_index < ctrl_clk_count) {
 			struct dss_clk *clk =
 				&ctrl_power->clk_config[ctrl_clk_index];
-			strlcpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
+			ctrl_power->clocks[i].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
 			ctrl_clk_index++;
 			if (dp_parser_check_prefix("ctrl_link", clk_name) ||
 			    dp_parser_check_prefix("stream_pixel", clk_name))
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 935ba1d51eb6..6d960bfa9088 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -10,7 +10,6 @@
 #include <linux/phy/phy.h>
 #include <linux/phy/phy-dp.h>
 
-#include "dp_clk_util.h"
 #include "msm_drv.h"
 
 #define DP_LABEL "MDSS DP DISPLAY"
@@ -99,6 +98,22 @@ struct dp_regulator_cfg {
 	struct dp_reg_entry regs[DP_DEV_REGULATOR_MAX];
 };
 
+enum dss_clk_type {
+	DSS_CLK_AHB, /* no set rate. rate controlled through rpm */
+	DSS_CLK_PCLK,
+};
+
+struct dss_clk {
+	enum dss_clk_type type;
+	unsigned long rate;
+};
+
+struct dss_module_power {
+	unsigned int num_clk;
+	struct clk_bulk_data *clocks;
+	struct dss_clk *clk_config;
+};
+
 /**
  * struct dp_parser - DP parser's data exposed to clients
  *
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index 3961ba4efc3c..b63da7a17821 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -105,72 +105,69 @@ static int dp_power_clk_init(struct dp_power_private *power)
 	ctrl = &power->parser->mp[DP_CTRL_PM];
 	stream = &power->parser->mp[DP_STREAM_PM];
 
-	rc = msm_dss_get_clk(dev, core->clk_config, core->num_clk);
+	rc = devm_clk_bulk_get(dev, core->num_clk, core->clocks);
 	if (rc) {
 		DRM_ERROR("failed to get %s clk. err=%d\n",
 			dp_parser_pm_name(DP_CORE_PM), rc);
 		return rc;
 	}
 
-	rc = msm_dss_get_clk(dev, ctrl->clk_config, ctrl->num_clk);
+	rc = devm_clk_bulk_get(dev, ctrl->num_clk, ctrl->clocks);
 	if (rc) {
 		DRM_ERROR("failed to get %s clk. err=%d\n",
 			dp_parser_pm_name(DP_CTRL_PM), rc);
-		msm_dss_put_clk(core->clk_config, core->num_clk);
 		return -ENODEV;
 	}
 
-	rc = msm_dss_get_clk(dev, stream->clk_config, stream->num_clk);
+	rc = devm_clk_bulk_get(dev, stream->num_clk, stream->clocks);
 	if (rc) {
 		DRM_ERROR("failed to get %s clk. err=%d\n",
 			dp_parser_pm_name(DP_CTRL_PM), rc);
-		msm_dss_put_clk(core->clk_config, core->num_clk);
 		return -ENODEV;
 	}
 
 	return 0;
 }
 
-static int dp_power_clk_deinit(struct dp_power_private *power)
+static int dp_power_clk_set_link_rate(struct dp_power_private *power,
+			struct dss_clk *clk_arry, int num_clk, int enable)
 {
-	struct dss_module_power *core, *ctrl, *stream;
-
-	core = &power->parser->mp[DP_CORE_PM];
-	ctrl = &power->parser->mp[DP_CTRL_PM];
-	stream = &power->parser->mp[DP_STREAM_PM];
+	u32 rate;
+	int i, rc = 0;
 
-	if (!core || !ctrl || !stream) {
-		DRM_ERROR("invalid power_data\n");
-		return -EINVAL;
+	for (i = 0; i < num_clk; i++) {
+		if (clk_arry[i].type == DSS_CLK_PCLK) {
+			if (enable)
+				rate = clk_arry[i].rate;
+			else
+				rate = 0;
+
+			rc = dev_pm_opp_set_rate(power->dev, rate);
+			if (rc)
+				break;
+		}
 	}
-
-	msm_dss_put_clk(ctrl->clk_config, ctrl->num_clk);
-	msm_dss_put_clk(core->clk_config, core->num_clk);
-	msm_dss_put_clk(stream->clk_config, stream->num_clk);
-	return 0;
+	return rc;
 }
 
-static int dp_power_clk_set_link_rate(struct dp_power_private *power,
-			struct dss_clk *clk_arry, int num_clk, int enable)
+static int dp_clk_set_rate(struct dss_module_power *mp)
 {
-	u32 rate;
 	int i, rc = 0;
+	struct dss_clk *clk_arry = mp->clk_config;
 
-	for (i = 0; i < num_clk; i++) {
-		if (clk_arry[i].clk) {
-			if (clk_arry[i].type == DSS_CLK_PCLK) {
-				if (enable)
-					rate = clk_arry[i].rate;
-				else
-					rate = 0;
-
-				rc = dev_pm_opp_set_rate(power->dev, rate);
-				if (rc)
-					break;
+	for (i = 0; i < mp->num_clk; i++) {
+		if (clk_arry[i].type != DSS_CLK_AHB) {
+			rc = clk_set_rate(mp->clocks[i].clk, mp->clk_config[i].rate);
+			if (rc) {
+				DRM_ERROR("%pS->%s: %s failed. rc=%d\n",
+						__builtin_return_address(0),
+						__func__,
+						mp->clocks[i].id, rc);
+				break;
 			}
-
 		}
 	}
+
 	return rc;
 }
 
@@ -189,7 +186,7 @@ static int dp_power_clk_set_rate(struct dp_power_private *power,
 	} else {
 
 		if (enable) {
-			rc = msm_dss_clk_set_rate(mp->clk_config, mp->num_clk);
+			rc = dp_clk_set_rate(mp);
 			if (rc) {
 				DRM_ERROR("failed to set clks rate\n");
 				return rc;
@@ -197,10 +194,14 @@ static int dp_power_clk_set_rate(struct dp_power_private *power,
 		}
 	}
 
-	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, enable);
-	if (rc) {
-		DRM_ERROR("failed to %d clks, err: %d\n", enable, rc);
-		return rc;
+	if (enable) {
+		rc = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
+		if (rc) {
+			DRM_ERROR("failed to enable clks, err: %d\n", rc);
+			return rc;
+		}
+	} else {
+		clk_bulk_disable_unprepare(mp->num_clk, mp->clocks);
 	}
 
 	return 0;
@@ -333,9 +334,7 @@ void dp_power_client_deinit(struct dp_power *dp_power)
 
 	power = container_of(dp_power, struct dp_power_private, dp_power);
 
-	dp_power_clk_deinit(power);
 	pm_runtime_disable(&power->pdev->dev);
-
 }
 
 int dp_power_init(struct dp_power *dp_power, bool flip)
-- 
2.30.2

