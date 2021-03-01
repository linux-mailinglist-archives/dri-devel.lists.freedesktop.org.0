Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A4632952B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 00:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8455C6E8B6;
	Mon,  1 Mar 2021 23:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE726E8AF
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 23:26:21 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id m11so20735521lji.10
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 15:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bS67oRU0WyqZ020er+98vsHwnD9rIoIvv7XnZYkmexM=;
 b=zu3DZpSs6ubQH1XIiBsD9Fy6ZgCRCXMxQSV0xKY5wqqeiJrES3YvA2SkTxKf5ONsRi
 SRYLRA7cPhJ2K/vHWV9NOS/qud8TJfjMerfa/ro6oJ6uvLb4vhwqaSxI5TIzw09qihKt
 cslpy76rMA/5y4GRxt9D0xIhuy1Drik0/aYXEPykUeW7h6k46LXxMPMbhbQt3gLak7p0
 9gtw7Bp8mEtGBDwUaDGynvU7NhzfS1DqGdQEZvKptW9S3LZQuduj6FAWeMlTv3SZtGvw
 ShRx5N9+/7ulzUD6JKWflA4gKg6E5Gkqz+NUtyKtPDeDCgV48bpeE1O87/eSaqucZ1xF
 q77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bS67oRU0WyqZ020er+98vsHwnD9rIoIvv7XnZYkmexM=;
 b=i0QaVpaotYygW7WJpZrG32iwsWL6TkGSoDYoLFG4XGW+p2Pms+1+BkDwF7dn+Rfsso
 fO6LDaMOLPzJ2EAr12K5g7lFZrtkaFtGSTJcjNTtMggsv3VSXQ7yjMEdaj2EZSMVPD66
 8hEiRlfaM9o68YkH+F2s3hB7Js8BWl9hrPicFGy6KHq40JNzW1sujkKsL0j+Qi5Sij1C
 tWeys5UyBvYF2rkDz0MyzlX8eXanQIfLiB/NmO9rERpRr8YPjTUUDAqnMvtTuWZl7eeM
 LSDwADSE3b0UavhBhK6eJkULQCi1xwCfc+126Q31tx8xYtLZ+CZsOJbQgUE+n7CwKctd
 K7sg==
X-Gm-Message-State: AOAM530BjY7/PTIOzkNe5DxmXMBH3TYVCqlcBPYaC9SvrNQhLPiJQvqH
 cI1k+YmKZ/iS7YMscPCJcVhGnSc5phNlmQ==
X-Google-Smtp-Source: ABdhPJz0MJBG5biJ0vIVxODA0Q/wQfUHWRCwEJa37u53W0wYIOTw020hI3aQsMhdVbFSCt3xiiK1hg==
X-Received: by 2002:a2e:91c4:: with SMTP id u4mr6416235ljg.281.1614641180262; 
 Mon, 01 Mar 2021 15:26:20 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 15:26:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [RFC 16/24] drm/msi/dsi: inline
 msm_dsi_pll_helper_clk_prepare/unprepare
Date: Tue,  2 Mar 2021 02:24:59 +0300
Message-Id: <20210301232506.3057401-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
References: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
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
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

10nm and 7nm already do not use these helpers, as they handle setting
slave DSI clocks after enabling VCO. Modify the rest of PHY drivers to
remove unnecessary indirection and drop enable_seq/disable_seq PLL
callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   2 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  87 +++++++------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    |  88 ++++++++-----
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 120 ++++++++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         |  35 -----
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.h         |   2 -
 6 files changed, 170 insertions(+), 164 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 75fc24f9f013..0fff9e3afb53 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -35,8 +35,6 @@ struct msm_dsi_phy_ops {
 };
 
 struct msm_dsi_pll_ops {
-	int (*enable_seq)(struct msm_dsi_pll *pll);
-	void (*disable_seq)(struct msm_dsi_pll *pll);
 	void (*save_state)(struct msm_dsi_pll *pll);
 	int (*restore_state)(struct msm_dsi_pll *pll);
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 023727623847..23f198164c0e 100644
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
@@ -1158,8 +1171,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
-		.disable_seq = dsi_pll_14nm_disable_seq,
-		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -1185,8 +1196,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
-		.disable_seq = dsi_pll_14nm_disable_seq,
-		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index e77b21f0d3bf..5188ba21afa7 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -286,19 +286,7 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
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
@@ -373,21 +361,28 @@ static int _dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
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
@@ -397,6 +392,9 @@ static int dsi_pll_28nm_enable_seq_lp(struct msm_dsi_pll *pll)
 
 	DBG("id=%d", pll_28nm->id);
 
+	if (unlikely(pll->pll_on))
+		return 0;
+
 	pll_28nm_software_reset(pll_28nm);
 
 	/*
@@ -421,22 +419,54 @@ static int dsi_pll_28nm_enable_seq_lp(struct msm_dsi_pll *pll)
 
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
@@ -479,7 +509,7 @@ static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
 	return 0;
 }
 
-static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecell_data *provided_clocks)
+static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecell_data *provided_clocks, const struct clk_ops *vco_ops)
 {
 	char clk_name[32], parent1[32], parent2[32], vco_name[32];
 	struct clk_init_data vco_init = {
@@ -487,7 +517,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecel
 		.num_parents = 1,
 		.name = vco_name,
 		.flags = CLK_IGNORE_UNUSED,
-		.ops = &clk_ops_dsi_pll_28nm_vco,
+		.ops = vco_ops,
 	};
 	struct device *dev = &pll_28nm->pdev->dev;
 	struct clk_hw *hw;
@@ -579,7 +609,7 @@ static int dsi_pll_28nm_hpm_init(struct msm_dsi_phy *phy)
 
 	pll->cfg = phy->cfg;
 
-	ret = pll_28nm_register(pll_28nm, phy->provided_clocks);
+	ret = pll_28nm_register(pll_28nm, phy->provided_clocks, &clk_ops_dsi_pll_28nm_vco_hpm);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ret;
@@ -618,7 +648,7 @@ static int dsi_pll_28nm_lp_init(struct msm_dsi_phy *phy)
 
 	pll->cfg = phy->cfg;
 
-	ret = pll_28nm_register(pll_28nm, phy->provided_clocks);
+	ret = pll_28nm_register(pll_28nm, phy->provided_clocks, &clk_ops_dsi_pll_28nm_vco_lp);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ret;
@@ -792,8 +822,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
-		.disable_seq = dsi_pll_28nm_disable_seq,
-		.enable_seq = dsi_pll_28nm_enable_seq_hpm,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -819,8 +847,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
-		.disable_seq = dsi_pll_28nm_disable_seq,
-		.enable_seq = dsi_pll_28nm_enable_seq_hpm,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -846,8 +872,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
-		.disable_seq = dsi_pll_28nm_disable_seq,
-		.enable_seq = dsi_pll_28nm_enable_seq_lp,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 558d311b13a9..15b05ae554a0 100644
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
@@ -653,8 +667,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
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
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
