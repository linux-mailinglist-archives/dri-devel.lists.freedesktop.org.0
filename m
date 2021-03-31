Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9AB34FEAB
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 12:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114B46EA69;
	Wed, 31 Mar 2021 10:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099456EA5D
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 10:57:53 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id f16so23346397ljm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 03:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hznsgYDHAusvWizyBrE12tdQt6ZNG9CS7BUT3Tle0z4=;
 b=AEZ3sRqOspektPKkP7ZWmuQNuLieI5sc4Ebd68YLCYyTKY8fhYpKyylcAkHU7SXdKU
 8cdisc7NZgLX7E9mQd3QfYSrxt+mimB8LIK61SVfN+Vb1a/J186QA8NFopW0jL8ICa7o
 ScxaOjCxgMShtZ6oxzdg4rM1gimlB0ji+elcTjII4XRKCqLdNzpDdZU3pwtTg41zDlb0
 uYCl4TEZh1OWyvi9tkUssqohEzgcnaKE4EDKeEeKQG2NytIDnRL/zj+UEE8lH0Z5wHES
 ePW3vAY8eLOTOeZ22W4sbl8sFQyfialHyeiwmhaMPQUoC+I4k8bnQVIhOezw0l9ieezc
 8RAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hznsgYDHAusvWizyBrE12tdQt6ZNG9CS7BUT3Tle0z4=;
 b=RVQBfSDZvZwv54hx/QgDtBDk/BbUaC9AwKjP25NyXPOxLXhQexvZkpyZkn4/5aSbhy
 SBr/h7UDkc7cFldkaVYWiKZm63Xrq+vSLjbUC/APrc56e+fQm5+87k3V6Z98X1tZVC0g
 l51K00PvtHF6mYBFZ2Jxbj0VDSSypZNvSgznsODZCGtX2UPwwytQWMxkX+YXwwv1ggLo
 mfgYvmD9f6Oq87eLhylTiWZ9QN60Exj9VpqrmDN2YBJQEgXP6Qon/WFU3JucUA11HLyB
 0DE/eGpyS6pmn3khJ9o0WAS3Bm/VMB+lnTiq45emqLAEpEEYn/q0xFL4tVZdPr62y05H
 HsnA==
X-Gm-Message-State: AOAM530+iAiRJUpioWVj4ix+0lAG5AWuAWdu9uovK72pGmekXx7ioiu1
 h4hnjEKPUI9IX6lXfBKlRoVu8Q==
X-Google-Smtp-Source: ABdhPJyswHvqLXCa0S1bId7oRFB9p8hjhqbBpN+FbteJJbaqXjPRcQ0rTeJ+g+Mn3Yiv/eBjdrbcOA==
X-Received: by 2002:a05:651c:1022:: with SMTP id
 w2mr1606855ljm.455.1617188271286; 
 Wed, 31 Mar 2021 03:57:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 03:57:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v4 16/24] drm/msi/dsi: inline
 msm_dsi_pll_helper_clk_prepare/unprepare
Date: Wed, 31 Mar 2021 13:57:27 +0300
Message-Id: <20210331105735.3690009-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

10nm and 7nm already do not use these helpers, as they handle setting
slave DSI clocks after enabling VCO. Modify the rest of PHY drivers to
remove unnecessary indirection and drop enable_seq/disable_seq PLL
callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   2 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  87 +++++++------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    |  86 ++++++++-----
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 120 ++++++++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         |  35 -----
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.h         |   2 -
 6 files changed, 171 insertions(+), 161 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 8133732e0c7f..b477d21804c8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -32,8 +32,6 @@ struct msm_dsi_phy_ops {
 };
 
 struct msm_dsi_pll_ops {
-	int (*enable_seq)(struct msm_dsi_pll *pll);
-	void (*disable_seq)(struct msm_dsi_pll *pll);
 	void (*save_state)(struct msm_dsi_pll *pll);
 	int (*restore_state)(struct msm_dsi_pll *pll);
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 434d02ffa7fe..91c5bb2fd169 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -652,12 +652,58 @@ static unsigned long dsi_pll_14nm_vco_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)vco_rate;
 }
 
+static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
+{
+	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
+	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
+	void __iomem *base = pll_14nm->mmio;
+	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
+	bool locked;
+
+	DBG("");
+
+	if (unlikely(pll->pll_on))
+		return 0;
+
+	pll_write(base + REG_DSI_14nm_PHY_PLL_VREF_CFG1, 0x10);
+	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 1);
+
+	locked = pll_14nm_poll_for_ready(pll_14nm, POLL_MAX_READS,
+					 POLL_TIMEOUT_US);
+
+	if (unlikely(!locked)) {
+		DRM_DEV_ERROR(&pll_14nm->pdev->dev, "DSI PLL lock failed\n");
+		return -EINVAL;
+	}
+
+	DBG("DSI PLL lock success");
+	pll->pll_on = true;
+
+	return 0;
+}
+
+static void dsi_pll_14nm_vco_unprepare(struct clk_hw *hw)
+{
+	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
+	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
+	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
+
+	DBG("");
+
+	if (unlikely(!pll->pll_on))
+		return;
+
+	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 0);
+
+	pll->pll_on = false;
+}
+
 static const struct clk_ops clk_ops_dsi_pll_14nm_vco = {
 	.round_rate = msm_dsi_pll_helper_clk_round_rate,
 	.set_rate = dsi_pll_14nm_vco_set_rate,
 	.recalc_rate = dsi_pll_14nm_vco_recalc_rate,
-	.prepare = msm_dsi_pll_helper_clk_prepare,
-	.unprepare = msm_dsi_pll_helper_clk_unprepare,
+	.prepare = dsi_pll_14nm_vco_prepare,
+	.unprepare = dsi_pll_14nm_vco_unprepare,
 };
 
 /*
@@ -749,39 +795,6 @@ static const struct clk_ops clk_ops_dsi_pll_14nm_postdiv = {
  * PLL Callbacks
  */
 
-static int dsi_pll_14nm_enable_seq(struct msm_dsi_pll *pll)
-{
-	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
-	void __iomem *base = pll_14nm->mmio;
-	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
-	bool locked;
-
-	DBG("");
-
-	pll_write(base + REG_DSI_14nm_PHY_PLL_VREF_CFG1, 0x10);
-	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 1);
-
-	locked = pll_14nm_poll_for_ready(pll_14nm, POLL_MAX_READS,
-					 POLL_TIMEOUT_US);
-
-	if (unlikely(!locked))
-		DRM_DEV_ERROR(&pll_14nm->pdev->dev, "DSI PLL lock failed\n");
-	else
-		DBG("DSI PLL lock success");
-
-	return locked ? 0 : -EINVAL;
-}
-
-static void dsi_pll_14nm_disable_seq(struct msm_dsi_pll *pll)
-{
-	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
-	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
-
-	DBG("");
-
-	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 0);
-}
-
 static void dsi_pll_14nm_save_state(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
@@ -1157,8 +1170,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
-		.disable_seq = dsi_pll_14nm_disable_seq,
-		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -1183,8 +1194,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
-		.disable_seq = dsi_pll_14nm_disable_seq,
-		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index ed369eb18e9d..20b31398b540 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -289,19 +289,7 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
 	return vco_rate;
 }
 
-static const struct clk_ops clk_ops_dsi_pll_28nm_vco = {
-	.round_rate = msm_dsi_pll_helper_clk_round_rate,
-	.set_rate = dsi_pll_28nm_clk_set_rate,
-	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
-	.prepare = msm_dsi_pll_helper_clk_prepare,
-	.unprepare = msm_dsi_pll_helper_clk_unprepare,
-	.is_enabled = dsi_pll_28nm_clk_is_enabled,
-};
-
-/*
- * PLL Callbacks
- */
-static int _dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
+static int _dsi_pll_28nm_vco_prepare_hpm(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
 	struct device *dev = &pll_28nm->pdev->dev;
@@ -376,21 +364,28 @@ static int _dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
 	return locked ? 0 : -EINVAL;
 }
 
-static int dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
+static int dsi_pll_28nm_vco_prepare_hpm(struct clk_hw *hw)
 {
+	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
 	int i, ret;
 
+	if (unlikely(pll->pll_on))
+		return 0;
+
 	for (i = 0; i < 3; i++) {
-		ret = _dsi_pll_28nm_enable_seq_hpm(pll);
-		if (!ret)
+		ret = _dsi_pll_28nm_vco_prepare_hpm(pll);
+		if (!ret) {
+			pll->pll_on = true;
 			return 0;
+		}
 	}
 
 	return ret;
 }
 
-static int dsi_pll_28nm_enable_seq_lp(struct msm_dsi_pll *pll)
+static int dsi_pll_28nm_vco_prepare_lp(struct clk_hw *hw)
 {
+	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
 	struct device *dev = &pll_28nm->pdev->dev;
 	void __iomem *base = pll_28nm->mmio;
@@ -400,6 +395,9 @@ static int dsi_pll_28nm_enable_seq_lp(struct msm_dsi_pll *pll)
 
 	DBG("id=%d", pll_28nm->id);
 
+	if (unlikely(pll->pll_on))
+		return 0;
+
 	pll_28nm_software_reset(pll_28nm);
 
 	/*
@@ -424,22 +422,54 @@ static int dsi_pll_28nm_enable_seq_lp(struct msm_dsi_pll *pll)
 
 	locked = pll_28nm_poll_for_ready(pll_28nm, max_reads, timeout_us);
 
-	if (unlikely(!locked))
+	if (unlikely(!locked)) {
 		DRM_DEV_ERROR(dev, "DSI PLL lock failed\n");
-	else
-		DBG("DSI PLL lock success");
+		return -EINVAL;
+	}
 
-	return locked ? 0 : -EINVAL;
+	DBG("DSI PLL lock success");
+	pll->pll_on = true;
+
+	return 0;
 }
 
-static void dsi_pll_28nm_disable_seq(struct msm_dsi_pll *pll)
+static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
 {
+	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
 
 	DBG("id=%d", pll_28nm->id);
+
+	if (unlikely(!pll->pll_on))
+		return;
+
 	pll_write(pll_28nm->mmio + REG_DSI_28nm_PHY_PLL_GLB_CFG, 0x00);
+
+	pll->pll_on = false;
 }
 
+static const struct clk_ops clk_ops_dsi_pll_28nm_vco_hpm = {
+	.round_rate = msm_dsi_pll_helper_clk_round_rate,
+	.set_rate = dsi_pll_28nm_clk_set_rate,
+	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
+	.prepare = dsi_pll_28nm_vco_prepare_hpm,
+	.unprepare = dsi_pll_28nm_vco_unprepare,
+	.is_enabled = dsi_pll_28nm_clk_is_enabled,
+};
+
+static const struct clk_ops clk_ops_dsi_pll_28nm_vco_lp = {
+	.round_rate = msm_dsi_pll_helper_clk_round_rate,
+	.set_rate = dsi_pll_28nm_clk_set_rate,
+	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
+	.prepare = dsi_pll_28nm_vco_prepare_lp,
+	.unprepare = dsi_pll_28nm_vco_unprepare,
+	.is_enabled = dsi_pll_28nm_clk_is_enabled,
+};
+
+/*
+ * PLL Callbacks
+ */
+
 static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
@@ -490,7 +520,6 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 		.num_parents = 1,
 		.name = vco_name,
 		.flags = CLK_IGNORE_UNUSED,
-		.ops = &clk_ops_dsi_pll_28nm_vco,
 	};
 	struct device *dev = &pll_28nm->pdev->dev;
 	struct clk_hw *hw;
@@ -498,6 +527,11 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 
 	DBG("%d", pll_28nm->id);
 
+	if (pll_28nm->base.cfg->type == MSM_DSI_PHY_28NM_LP)
+		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_lp;
+	else
+		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_hpm;
+
 	snprintf(vco_name, 32, "dsi%dvco_clk", pll_28nm->id);
 	pll_28nm->base.clk_hw.init = &vco_init;
 	ret = devm_clk_hw_register(dev, &pll_28nm->base.clk_hw);
@@ -753,8 +787,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
-		.disable_seq = dsi_pll_28nm_disable_seq,
-		.enable_seq = dsi_pll_28nm_enable_seq_hpm,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -779,8 +811,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
-		.disable_seq = dsi_pll_28nm_disable_seq,
-		.enable_seq = dsi_pll_28nm_enable_seq_hpm,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -805,8 +835,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
-		.disable_seq = dsi_pll_28nm_disable_seq,
-		.enable_seq = dsi_pll_28nm_enable_seq_lp,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 45b2bf482392..952444e3e8f0 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -178,12 +178,76 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
 	return vco_rate;
 }
 
+static int dsi_pll_28nm_vco_prepare(struct clk_hw *hw)
+{
+	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
+	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
+	struct device *dev = &pll_28nm->pdev->dev;
+	void __iomem *base = pll_28nm->mmio;
+	bool locked;
+	unsigned int bit_div, byte_div;
+	int max_reads = 1000, timeout_us = 100;
+	u32 val;
+
+	DBG("id=%d", pll_28nm->id);
+
+	if (unlikely(pll->pll_on))
+		return 0;
+
+	/*
+	 * before enabling the PLL, configure the bit clock divider since we
+	 * don't expose it as a clock to the outside world
+	 * 1: read back the byte clock divider that should already be set
+	 * 2: divide by 8 to get bit clock divider
+	 * 3: write it to POSTDIV1
+	 */
+	val = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9);
+	byte_div = val + 1;
+	bit_div = byte_div / 8;
+
+	val = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
+	val &= ~0xf;
+	val |= (bit_div - 1);
+	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8, val);
+
+	/* enable the PLL */
+	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_0,
+			DSI_28nm_8960_PHY_PLL_CTRL_0_ENABLE);
+
+	locked = pll_28nm_poll_for_ready(pll_28nm, max_reads, timeout_us);
+
+	if (unlikely(!locked)) {
+		DRM_DEV_ERROR(dev, "DSI PLL lock failed\n");
+		return -EINVAL;
+	}
+
+	DBG("DSI PLL lock success");
+	pll->pll_on = true;
+
+	return 0;
+}
+
+static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
+{
+	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
+	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
+
+	DBG("id=%d", pll_28nm->id);
+
+	if (unlikely(!pll->pll_on))
+		return;
+
+	pll_write(pll_28nm->mmio + REG_DSI_28nm_8960_PHY_PLL_CTRL_0, 0x00);
+
+	pll->pll_on = false;
+}
+
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco = {
 	.round_rate = msm_dsi_pll_helper_clk_round_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
-	.prepare = msm_dsi_pll_helper_clk_prepare,
-	.unprepare = msm_dsi_pll_helper_clk_unprepare,
+	.prepare = dsi_pll_28nm_vco_prepare,
+	.unprepare = dsi_pll_28nm_vco_unprepare,
 	.is_enabled = dsi_pll_28nm_clk_is_enabled,
 };
 
@@ -270,56 +334,6 @@ static const struct clk_ops clk_bytediv_ops = {
 /*
  * PLL Callbacks
  */
-static int dsi_pll_28nm_enable_seq(struct msm_dsi_pll *pll)
-{
-	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
-	struct device *dev = &pll_28nm->pdev->dev;
-	void __iomem *base = pll_28nm->mmio;
-	bool locked;
-	unsigned int bit_div, byte_div;
-	int max_reads = 1000, timeout_us = 100;
-	u32 val;
-
-	DBG("id=%d", pll_28nm->id);
-
-	/*
-	 * before enabling the PLL, configure the bit clock divider since we
-	 * don't expose it as a clock to the outside world
-	 * 1: read back the byte clock divider that should already be set
-	 * 2: divide by 8 to get bit clock divider
-	 * 3: write it to POSTDIV1
-	 */
-	val = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9);
-	byte_div = val + 1;
-	bit_div = byte_div / 8;
-
-	val = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
-	val &= ~0xf;
-	val |= (bit_div - 1);
-	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8, val);
-
-	/* enable the PLL */
-	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_0,
-			DSI_28nm_8960_PHY_PLL_CTRL_0_ENABLE);
-
-	locked = pll_28nm_poll_for_ready(pll_28nm, max_reads, timeout_us);
-
-	if (unlikely(!locked))
-		DRM_DEV_ERROR(dev, "DSI PLL lock failed\n");
-	else
-		DBG("DSI PLL lock success");
-
-	return locked ? 0 : -EINVAL;
-}
-
-static void dsi_pll_28nm_disable_seq(struct msm_dsi_pll *pll)
-{
-	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
-
-	DBG("id=%d", pll_28nm->id);
-	pll_write(pll_28nm->mmio + REG_DSI_28nm_8960_PHY_PLL_CTRL_0, 0x00);
-}
-
 static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
@@ -652,8 +666,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
-		.disable_seq = dsi_pll_28nm_disable_seq,
-		.enable_seq = dsi_pll_28nm_enable_seq,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
index 652c2d6bfeec..cae668b669a4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
@@ -21,38 +21,3 @@ long msm_dsi_pll_helper_clk_round_rate(struct clk_hw *hw,
 	else
 		return rate;
 }
-
-int msm_dsi_pll_helper_clk_prepare(struct clk_hw *hw)
-{
-	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
-	int ret = 0;
-
-	/*
-	 * Certain PLLs do not allow VCO rate update when it is on.
-	 * Keep track of their status to turn on/off after set rate success.
-	 */
-	if (unlikely(pll->pll_on))
-		return 0;
-
-	ret = pll->cfg->pll_ops.enable_seq(pll);
-	if (ret) {
-		DRM_ERROR("DSI PLL failed to lock\n");
-		return ret;
-	}
-
-	pll->pll_on = true;
-
-	return 0;
-}
-
-void msm_dsi_pll_helper_clk_unprepare(struct clk_hw *hw)
-{
-	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
-
-	if (unlikely(!pll->pll_on))
-		return;
-
-	pll->cfg->pll_ops.disable_seq(pll);
-
-	pll->pll_on = false;
-}
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
index eca13cf67c21..da83e4c11f4f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
@@ -39,8 +39,6 @@ static inline void pll_write_ndelay(void __iomem *reg, u32 data, u32 delay_ns)
 /* clock callbacks */
 long msm_dsi_pll_helper_clk_round_rate(struct clk_hw *hw,
 		unsigned long rate, unsigned long *parent_rate);
-int msm_dsi_pll_helper_clk_prepare(struct clk_hw *hw);
-void msm_dsi_pll_helper_clk_unprepare(struct clk_hw *hw);
 
 #endif /* __DSI_PLL_H__ */
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
