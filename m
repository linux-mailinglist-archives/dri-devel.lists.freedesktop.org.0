Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D254A347C24
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096606EC9B;
	Wed, 24 Mar 2021 15:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DB86EC87
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:19:35 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id b83so32538717lfd.11
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TnOxSzkdxiuIpKQMEb6cCKF5K0F2bZFPRE7TYCJUc74=;
 b=EJ8OEbNmWq3MGjyS1aJnimXvYmKNWg26ETAnMe21aJ3SIGzN4+ovH2E6xN9fpUXvfa
 US32uD+IJn/Run2U9s1wW2r4AR7geT20ujhrUNFF0dll6e0dEotSOIS9tNJAfw3MPYyR
 3bOW2CEoXctsK1xsPF7UrTqwfSQgpa6IEwsyHZmbtwANIUIzzhAzdT4tsSfaAYK5io3h
 ujOwtsU91Ty2R+4HaHR9TBlvndNzytafHlYn9t9GXVVYL6qR6a9s+MokdudJPyYHd3gp
 uRxdQe3JYDJKou6H90ojFmil6x27H5sMEBYvnVB1os9ZA2Gw14glowEwbgiZvzyTZ2o7
 ec7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TnOxSzkdxiuIpKQMEb6cCKF5K0F2bZFPRE7TYCJUc74=;
 b=Wd6CoRybLcYOomTtZm81vlRAvgs+v8EufdwsKTBS7OAMtzpRpue/cjIsH01f7N1y5U
 HJc2qiE9koR6GSduX8mR1Ac5Ap6uyBAkackTpkE85PRGDIcghVjeQwtNzR/ktmmyh8BW
 uyRjwugcZpGtHVAIoVDsULVWILJtbl4GLsRq2QyaNF5vm5nRLvJWFnqaS3HaCJk2O3Co
 iO3XE+5NiCpsbg7lUiB9KGZKSIKGGO0SPq4pwp9Zx1pp6BqJfva8ir4wkmTwZ0GxFTMT
 i0rjsOqZuny94Wm0LVDsF+r311HBpgUa6otnicYkP26kvHVpJ6wYqwgJBoztw7IFCtLy
 mGfw==
X-Gm-Message-State: AOAM530ibFjFgKfRaXkzzZhi6d7N/LTa24/u+E0OZ5bXNsFjO+ergCV4
 2UgjyBu2wo2jBnNb6k7xWy+HAw==
X-Google-Smtp-Source: ABdhPJxA+tVPtOVn6IsUdwmeFYROLp6y971S5h9wyx1OIokXx/+C5CQ7AmxSt31+ykv3kKKolTcFkg==
X-Received: by 2002:a05:6512:ac9:: with SMTP id
 n9mr2267502lfu.186.1616599174291; 
 Wed, 24 Mar 2021 08:19:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:19:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 21/28] drm/msm/dsi: make save_state/restore_state callbacks
 accept msm_dsi_phy
Date: Wed, 24 Mar 2021 18:18:39 +0300
Message-Id: <20210324151846.2774204-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make save_state/restore callbacks accept struct msm_dsi_phy rather than
struct msm_dsi_pll. This moves them to struct msm_dsi_phy_ops, allowing
us to drop struct msm_dsi_pll_ops.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 12 +++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         | 11 +++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 22 ++++++-------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 24 ++++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 32 ++++++++-----------
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 18 +++++------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 22 ++++++-------
 7 files changed, 59 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 7d23371a83f6..1a49cb2d1184 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -847,9 +847,9 @@ void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 
 void msm_dsi_phy_save_state(struct msm_dsi_phy *phy)
 {
-	if (phy->cfg->pll_ops.save_state) {
-		phy->cfg->pll_ops.save_state(phy->pll);
-		phy->pll->state_saved = true;
+	if (phy->cfg->ops.save_state) {
+		phy->cfg->ops.save_state(phy);
+		phy->state_saved = true;
 	}
 }
 
@@ -857,12 +857,12 @@ int msm_dsi_phy_restore_state(struct msm_dsi_phy *phy)
 {
 	int ret;
 
-	if (phy->cfg->pll_ops.restore_state && phy->pll->state_saved) {
-		ret = phy->cfg->pll_ops.restore_state(phy->pll);
+	if (phy->cfg->ops.restore_state && phy->state_saved) {
+		ret = phy->cfg->ops.restore_state(phy);
 		if (ret)
 			return ret;
 
-		phy->pll->state_saved = false;
+		phy->state_saved = false;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index b477d21804c8..fa09f4c2c071 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -17,7 +17,6 @@
 struct msm_dsi_pll {
 	struct clk_hw	clk_hw;
 	bool		pll_on;
-	bool		state_saved;
 
 	const struct msm_dsi_phy_cfg *cfg;
 };
@@ -29,17 +28,13 @@ struct msm_dsi_phy_ops {
 	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
 			struct msm_dsi_phy_clk_request *clk_req);
 	void (*disable)(struct msm_dsi_phy *phy);
-};
-
-struct msm_dsi_pll_ops {
-	void (*save_state)(struct msm_dsi_pll *pll);
-	int (*restore_state)(struct msm_dsi_pll *pll);
+	void (*save_state)(struct msm_dsi_phy *phy);
+	int (*restore_state)(struct msm_dsi_phy *phy);
 };
 
 struct msm_dsi_phy_cfg {
 	struct dsi_reg_config reg_cfg;
 	struct msm_dsi_phy_ops ops;
-	const struct msm_dsi_pll_ops pll_ops;
 
 	unsigned long	min_pll_rate;
 	unsigned long	max_pll_rate;
@@ -115,6 +110,8 @@ struct msm_dsi_phy {
 	struct msm_dsi_pll *pll;
 
 	struct clk_hw_onecell_data *provided_clocks;
+
+	bool state_saved;
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index bfb96d87d1d7..25fd4d860c4d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -518,9 +518,9 @@ static const struct clk_ops clk_ops_dsi_pll_10nm_vco = {
  * PLL Callbacks
  */
 
-static void dsi_pll_10nm_save_state(struct msm_dsi_pll *pll)
+static void dsi_10nm_save_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
+	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->pll);
 	struct pll_10nm_cached_state *cached = &pll_10nm->cached_state;
 	void __iomem *phy_base = pll_10nm->phy_cmn_mmio;
 	u32 cmn_clk_cfg0, cmn_clk_cfg1;
@@ -541,9 +541,9 @@ static void dsi_pll_10nm_save_state(struct msm_dsi_pll *pll)
 	    cached->pix_clk_div, cached->pll_mux);
 }
 
-static int dsi_pll_10nm_restore_state(struct msm_dsi_pll *pll)
+static int dsi_10nm_restore_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
+	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->pll);
 	struct pll_10nm_cached_state *cached = &pll_10nm->cached_state;
 	void __iomem *phy_base = pll_10nm->phy_cmn_mmio;
 	u32 val;
@@ -562,7 +562,7 @@ static int dsi_pll_10nm_restore_state(struct msm_dsi_pll *pll)
 	val |= cached->pll_mux;
 	pll_write(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1, val);
 
-	ret = dsi_pll_10nm_vco_set_rate(&pll->clk_hw, pll_10nm->vco_current_rate, pll_10nm->vco_ref_clk_rate);
+	ret = dsi_pll_10nm_vco_set_rate(&phy->pll->clk_hw, pll_10nm->vco_current_rate, pll_10nm->vco_ref_clk_rate);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_10nm->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
@@ -1005,10 +1005,8 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 		.enable = dsi_10nm_phy_enable,
 		.disable = dsi_10nm_phy_disable,
 		.pll_init = dsi_pll_10nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_10nm_save_state,
-		.restore_state = dsi_pll_10nm_restore_state,
+		.save_state = dsi_10nm_save_state,
+		.restore_state = dsi_10nm_restore_state,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
@@ -1029,10 +1027,8 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 		.enable = dsi_10nm_phy_enable,
 		.disable = dsi_10nm_phy_disable,
 		.pll_init = dsi_pll_10nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_10nm_save_state,
-		.restore_state = dsi_pll_10nm_restore_state,
+		.save_state = dsi_10nm_save_state,
+		.restore_state = dsi_10nm_restore_state,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 91c5bb2fd169..c7c462bfe96d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -795,9 +795,9 @@ static const struct clk_ops clk_ops_dsi_pll_14nm_postdiv = {
  * PLL Callbacks
  */
 
-static void dsi_pll_14nm_save_state(struct msm_dsi_pll *pll)
+static void dsi_14nm_save_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
+	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->pll);
 	struct pll_14nm_cached_state *cached_state = &pll_14nm->cached_state;
 	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
 	u32 data;
@@ -810,18 +810,18 @@ static void dsi_pll_14nm_save_state(struct msm_dsi_pll *pll)
 	DBG("DSI%d PLL save state %x %x", pll_14nm->id,
 	    cached_state->n1postdiv, cached_state->n2postdiv);
 
-	cached_state->vco_rate = clk_hw_get_rate(&pll->clk_hw);
+	cached_state->vco_rate = clk_hw_get_rate(&phy->pll->clk_hw);
 }
 
-static int dsi_pll_14nm_restore_state(struct msm_dsi_pll *pll)
+static int dsi_14nm_restore_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
+	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->pll);
 	struct pll_14nm_cached_state *cached_state = &pll_14nm->cached_state;
 	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
 	u32 data;
 	int ret;
 
-	ret = dsi_pll_14nm_vco_set_rate(&pll->clk_hw,
+	ret = dsi_pll_14nm_vco_set_rate(&phy->pll->clk_hw,
 					cached_state->vco_rate, 0);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_14nm->pdev->dev,
@@ -1166,10 +1166,8 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 		.enable = dsi_14nm_phy_enable,
 		.disable = dsi_14nm_phy_disable,
 		.pll_init = dsi_pll_14nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_14nm_save_state,
-		.restore_state = dsi_pll_14nm_restore_state,
+		.save_state = dsi_14nm_save_state,
+		.restore_state = dsi_14nm_restore_state,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -1190,10 +1188,8 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 		.enable = dsi_14nm_phy_enable,
 		.disable = dsi_14nm_phy_disable,
 		.pll_init = dsi_pll_14nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_14nm_save_state,
-		.restore_state = dsi_pll_14nm_restore_state,
+		.save_state = dsi_14nm_save_state,
+		.restore_state = dsi_14nm_restore_state,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 53e225934f9e..8f10dbb0c136 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -470,9 +470,9 @@ static const struct clk_ops clk_ops_dsi_pll_28nm_vco_lp = {
  * PLL Callbacks
  */
 
-static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
+static void dsi_28nm_save_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
+	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
 	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
 	void __iomem *base = pll_28nm->mmio;
 
@@ -481,20 +481,20 @@ static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
 	cached_state->postdiv1 =
 			pll_read(base + REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG);
 	cached_state->byte_mux = pll_read(base + REG_DSI_28nm_PHY_PLL_VREG_CFG);
-	if (dsi_pll_28nm_clk_is_enabled(&pll->clk_hw))
-		cached_state->vco_rate = clk_hw_get_rate(&pll->clk_hw);
+	if (dsi_pll_28nm_clk_is_enabled(&phy->pll->clk_hw))
+		cached_state->vco_rate = clk_hw_get_rate(&phy->pll->clk_hw);
 	else
 		cached_state->vco_rate = 0;
 }
 
-static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
+static int dsi_28nm_restore_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
+	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
 	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
 	void __iomem *base = pll_28nm->mmio;
 	int ret;
 
-	ret = dsi_pll_28nm_clk_set_rate(&pll->clk_hw,
+	ret = dsi_pll_28nm_clk_set_rate(&phy->pll->clk_hw,
 					cached_state->vco_rate, 0);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_28nm->pdev->dev,
@@ -783,10 +783,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.pll_init = dsi_pll_28nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_28nm_save_state,
-		.restore_state = dsi_pll_28nm_restore_state,
+		.save_state = dsi_28nm_save_state,
+		.restore_state = dsi_28nm_restore_state,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -807,10 +805,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.pll_init = dsi_pll_28nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_28nm_save_state,
-		.restore_state = dsi_pll_28nm_restore_state,
+		.save_state = dsi_28nm_save_state,
+		.restore_state = dsi_28nm_restore_state,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -831,10 +827,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.pll_init = dsi_pll_28nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_28nm_save_state,
-		.restore_state = dsi_pll_28nm_restore_state,
+		.save_state = dsi_28nm_save_state,
+		.restore_state = dsi_28nm_restore_state,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 952444e3e8f0..c71c5f07666d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -334,9 +334,9 @@ static const struct clk_ops clk_bytediv_ops = {
 /*
  * PLL Callbacks
  */
-static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
+static void dsi_28nm_save_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
+	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
 	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
 	void __iomem *base = pll_28nm->mmio;
 
@@ -347,17 +347,17 @@ static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
 	cached_state->postdiv1 =
 			pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
 
-	cached_state->vco_rate = clk_hw_get_rate(&pll->clk_hw);
+	cached_state->vco_rate = clk_hw_get_rate(&phy->pll->clk_hw);
 }
 
-static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
+static int dsi_28nm_restore_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
+	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
 	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
 	void __iomem *base = pll_28nm->mmio;
 	int ret;
 
-	ret = dsi_pll_28nm_clk_set_rate(&pll->clk_hw,
+	ret = dsi_pll_28nm_clk_set_rate(&phy->pll->clk_hw,
 					cached_state->vco_rate, 0);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_28nm->pdev->dev,
@@ -662,10 +662,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.pll_init = dsi_pll_28nm_8960_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_28nm_save_state,
-		.restore_state = dsi_pll_28nm_restore_state,
+		.save_state = dsi_28nm_save_state,
+		.restore_state = dsi_28nm_restore_state,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index f760904efac9..015e099d7b7f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -543,9 +543,9 @@ static const struct clk_ops clk_ops_dsi_pll_7nm_vco = {
  * PLL Callbacks
  */
 
-static void dsi_pll_7nm_save_state(struct msm_dsi_pll *pll)
+static void dsi_7nm_save_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
+	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->pll);
 	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
 	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
 	u32 cmn_clk_cfg0, cmn_clk_cfg1;
@@ -566,9 +566,9 @@ static void dsi_pll_7nm_save_state(struct msm_dsi_pll *pll)
 	    cached->pix_clk_div, cached->pll_mux);
 }
 
-static int dsi_pll_7nm_restore_state(struct msm_dsi_pll *pll)
+static int dsi_7nm_restore_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
+	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->pll);
 	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
 	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
 	u32 val;
@@ -587,7 +587,7 @@ static int dsi_pll_7nm_restore_state(struct msm_dsi_pll *pll)
 	val |= cached->pll_mux;
 	pll_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, val);
 
-	ret = dsi_pll_7nm_vco_set_rate(&pll->clk_hw, pll_7nm->vco_current_rate, pll_7nm->vco_ref_clk_rate);
+	ret = dsi_pll_7nm_vco_set_rate(&phy->pll->clk_hw, pll_7nm->vco_current_rate, pll_7nm->vco_ref_clk_rate);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_7nm->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
@@ -1038,10 +1038,8 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		.enable = dsi_7nm_phy_enable,
 		.disable = dsi_7nm_phy_disable,
 		.pll_init = dsi_pll_7nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_7nm_save_state,
-		.restore_state = dsi_pll_7nm_restore_state,
+		.save_state = dsi_7nm_save_state,
+		.restore_state = dsi_7nm_restore_state,
 	},
 	.min_pll_rate = 600000000UL,
 	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : ULONG_MAX,
@@ -1063,10 +1061,8 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 		.enable = dsi_7nm_phy_enable,
 		.disable = dsi_7nm_phy_disable,
 		.pll_init = dsi_pll_7nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_7nm_save_state,
-		.restore_state = dsi_pll_7nm_restore_state,
+		.save_state = dsi_7nm_save_state,
+		.restore_state = dsi_7nm_restore_state,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
