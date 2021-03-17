Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EBF33F36B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 15:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7F06E808;
	Wed, 17 Mar 2021 14:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CFD6E7F5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 14:41:04 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id 184so3458738ljf.9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 07:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ISGEhZuLbLQY8UAM/Rab/o4eDKv8PVCCKbP7LOJlN5o=;
 b=WHMVlR7WPhoo/4r0OHfwTZltqlgvy/8NKgDY1yW3mZQv3TC7Rrol07MxOPLXQw8+FH
 4p8eD1RS/vB4TUtcqFSKk0Tsa1WccObgl63qVPkinXvOH+cDc7sofAcZTsTgcfUTcq4y
 O2S6R9CWgGlne0mzRhWpRyDxQrb3+hnwiokQAnJdtu9b2dtSjcfZ0qSzeNExExLKpohD
 Hwa23tq//0veb62nmUVJ7fHdw9rsmI/Xlri7Dz8uzMZEW8rse0zlRchiHpNFvToN8Gj6
 khzmYrFzHwHTBSGl7U94Y2Ah5HecelyZAGSPihMr1ZL3Xwt0YYC6AEJc9ieMnbw/jj4r
 +pGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ISGEhZuLbLQY8UAM/Rab/o4eDKv8PVCCKbP7LOJlN5o=;
 b=QeVztJsftArZmbnm/7l2UGgwXQB02rFgvZRMx8P2rItP/kZgNxim2o86cFX/Sdklj7
 eyNm68bsLK/7lJn3BObYdH+6FIqKssglvxaB3rM2veyiiqI7sXsAWBtw8UcqBu9HMJ9x
 DdZtRxsV3Uy26ybjWD2AVIRNmW4/MAGbgPFhMkhyW3/PHeKYjM3fPq4Vjb4eMGKYwrQy
 sPdxRjYpCPxsTS2ttvZOlHwydxfBXWQP1pz/8GdzT3v3zN9kGaWyL0KPz4eJaRUsTI4A
 KXAOKBoGGBButSzgxMuwRvN7RV+lM0y7VPDQW6OAawfD35sRAd1rbAE58CPB1TG9ty80
 UhnQ==
X-Gm-Message-State: AOAM531G82g8WQGNPEUGeAFTRH+slQdY2KVqPxJ2MbzouigLixF36piK
 gGlnJ7ny0St4/o/Gl4fGAON0qQ==
X-Google-Smtp-Source: ABdhPJzqs0EBono6BVMsH1vVf9rGtDi+iWxoPRS21qLyrsnaDBNYKpZpMYp/OV/s8yWLaoeXGNvkXg==
X-Received: by 2002:a2e:800b:: with SMTP id j11mr2728105ljg.94.1615992062483; 
 Wed, 17 Mar 2021 07:41:02 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 07:41:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v1 21/26] drm/msm/dsi: move ioremaps to dsi_phy_driver_probe
Date: Wed, 17 Mar 2021 17:40:34 +0300
Message-Id: <20210317144039.556409-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
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

All PHY drivers would map dsi_pll area. Some PHY drivers would also
map dsi_phy area again (a leftover from old PHY/PLL separation). Move
all ioremaps to the common dsi_phy driver code and drop individual
ioremapped areas from PHY drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  7 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 75 +++++++-----------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 49 ++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 40 +++-------
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 27 +++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 79 ++++++++-----------
 7 files changed, 108 insertions(+), 170 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 2ef9abaf052d..5b1cba4ba672 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -682,6 +682,13 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
+	phy->pll_base = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
+	if (IS_ERR(phy->pll_base)) {
+		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map pll base\n", __func__);
+		ret = -ENOMEM;
+		goto fail;
+	}
+
 	if (phy->cfg->has_phy_lane) {
 		phy->lane_base = msm_ioremap(pdev, "dsi_phy_lane", "DSI_PHY_LANE");
 		if (IS_ERR(phy->lane_base)) {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 43c4b43cb41f..0aa2729ed4b5 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -92,6 +92,7 @@ struct msm_dsi_dphy_timing {
 struct msm_dsi_phy {
 	struct platform_device *pdev;
 	void __iomem *base;
+	void __iomem *pll_base;
 	void __iomem *reg_base;
 	void __iomem *lane_base;
 	int id;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 6eb18a159bf5..d2f483d6d343 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -88,9 +88,6 @@ struct dsi_pll_10nm {
 
 	struct msm_dsi_phy *phy;
 
-	void __iomem *phy_cmn_mmio;
-	void __iomem *mmio;
-
 	u64 vco_ref_clk_rate;
 	u64 vco_current_rate;
 
@@ -225,7 +222,7 @@ static void dsi_pll_calc_ssc(struct dsi_pll_10nm *pll)
 
 static void dsi_pll_ssc_commit(struct dsi_pll_10nm *pll)
 {
-	void __iomem *base = pll->mmio;
+	void __iomem *base = pll->phy->pll_base;
 	struct dsi_pll_regs *regs = &pll->reg_setup;
 
 	if (pll->pll_configuration.enable_ssc) {
@@ -250,7 +247,7 @@ static void dsi_pll_ssc_commit(struct dsi_pll_10nm *pll)
 
 static void dsi_pll_config_hzindep_reg(struct dsi_pll_10nm *pll)
 {
-	void __iomem *base = pll->mmio;
+	void __iomem *base = pll->phy->pll_base;
 
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_ONE, 0x80);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_TWO, 0x03);
@@ -276,7 +273,7 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_10nm *pll)
 
 static void dsi_pll_commit(struct dsi_pll_10nm *pll)
 {
-	void __iomem *base = pll->mmio;
+	void __iomem *base = pll->phy->pll_base;
 	struct dsi_pll_regs *reg = &pll->reg_setup;
 
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CORE_INPUT_OVERRIDE, 0x12);
@@ -333,7 +330,7 @@ static int dsi_pll_10nm_lock_status(struct dsi_pll_10nm *pll)
 	u32 const delay_us = 100;
 	u32 const timeout_us = 5000;
 
-	rc = readl_poll_timeout_atomic(pll->mmio +
+	rc = readl_poll_timeout_atomic(pll->phy->pll_base +
 				       REG_DSI_10nm_PHY_PLL_COMMON_STATUS_ONE,
 				       status,
 				       ((status & BIT(0)) > 0),
@@ -348,21 +345,21 @@ static int dsi_pll_10nm_lock_status(struct dsi_pll_10nm *pll)
 
 static void dsi_pll_disable_pll_bias(struct dsi_pll_10nm *pll)
 {
-	u32 data = dsi_phy_read(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CTRL_0);
+	u32 data = dsi_phy_read(pll->phy->base + REG_DSI_10nm_PHY_CMN_CTRL_0);
 
-	dsi_phy_write(pll->mmio + REG_DSI_10nm_PHY_PLL_SYSTEM_MUXES, 0);
-	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CTRL_0,
+	dsi_phy_write(pll->phy->pll_base + REG_DSI_10nm_PHY_PLL_SYSTEM_MUXES, 0);
+	dsi_phy_write(pll->phy->base + REG_DSI_10nm_PHY_CMN_CTRL_0,
 		  data & ~BIT(5));
 	ndelay(250);
 }
 
 static void dsi_pll_enable_pll_bias(struct dsi_pll_10nm *pll)
 {
-	u32 data = dsi_phy_read(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CTRL_0);
+	u32 data = dsi_phy_read(pll->phy->base + REG_DSI_10nm_PHY_CMN_CTRL_0);
 
-	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CTRL_0,
+	dsi_phy_write(pll->phy->base + REG_DSI_10nm_PHY_CMN_CTRL_0,
 		  data | BIT(5));
-	dsi_phy_write(pll->mmio + REG_DSI_10nm_PHY_PLL_SYSTEM_MUXES, 0xc0);
+	dsi_phy_write(pll->phy->pll_base + REG_DSI_10nm_PHY_PLL_SYSTEM_MUXES, 0xc0);
 	ndelay(250);
 }
 
@@ -370,8 +367,8 @@ static void dsi_pll_disable_global_clk(struct dsi_pll_10nm *pll)
 {
 	u32 data;
 
-	data = dsi_phy_read(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
-	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CLK_CFG1,
+	data = dsi_phy_read(pll->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
+	dsi_phy_write(pll->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG1,
 		  data & ~BIT(5));
 }
 
@@ -379,8 +376,8 @@ static void dsi_pll_enable_global_clk(struct dsi_pll_10nm *pll)
 {
 	u32 data;
 
-	data = dsi_phy_read(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
-	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CLK_CFG1,
+	data = dsi_phy_read(pll->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
+	dsi_phy_write(pll->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG1,
 		  data | BIT(5));
 }
 
@@ -401,7 +398,7 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
 	}
 
 	/* Start PLL */
-	dsi_phy_write(pll_10nm->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_PLL_CNTRL,
+	dsi_phy_write(pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_PLL_CNTRL,
 		  0x01);
 
 	/*
@@ -423,10 +420,10 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
 	if (pll_10nm->slave)
 		dsi_pll_enable_global_clk(pll_10nm->slave);
 
-	dsi_phy_write(pll_10nm->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_RBUF_CTRL,
+	dsi_phy_write(pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_RBUF_CTRL,
 		  0x01);
 	if (pll_10nm->slave)
-		dsi_phy_write(pll_10nm->slave->phy_cmn_mmio +
+		dsi_phy_write(pll_10nm->slave->phy->base +
 			  REG_DSI_10nm_PHY_CMN_RBUF_CTRL, 0x01);
 
 error:
@@ -435,7 +432,7 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
 
 static void dsi_pll_disable_sub(struct dsi_pll_10nm *pll)
 {
-	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_RBUF_CTRL, 0);
+	dsi_phy_write(pll->phy->base + REG_DSI_10nm_PHY_CMN_RBUF_CTRL, 0);
 	dsi_pll_disable_pll_bias(pll);
 }
 
@@ -449,7 +446,7 @@ static void dsi_pll_10nm_vco_unprepare(struct clk_hw *hw)
 	 * powering down the PLL
 	 */
 	dsi_pll_disable_global_clk(pll_10nm);
-	dsi_phy_write(pll_10nm->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_PLL_CNTRL, 0);
+	dsi_phy_write(pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_PLL_CNTRL, 0);
 	dsi_pll_disable_sub(pll_10nm);
 	if (pll_10nm->slave) {
 		dsi_pll_disable_global_clk(pll_10nm->slave);
@@ -465,7 +462,7 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
 {
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
 	struct dsi_pll_config *config = &pll_10nm->pll_configuration;
-	void __iomem *base = pll_10nm->mmio;
+	void __iomem *base = pll_10nm->phy->pll_base;
 	u64 ref_clk = pll_10nm->vco_ref_clk_rate;
 	u64 vco_rate = 0x0;
 	u64 multiplier;
@@ -528,10 +525,10 @@ static void dsi_10nm_save_state(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->vco_hw);
 	struct pll_10nm_cached_state *cached = &pll_10nm->cached_state;
-	void __iomem *phy_base = pll_10nm->phy_cmn_mmio;
+	void __iomem *phy_base = pll_10nm->phy->base;
 	u32 cmn_clk_cfg0, cmn_clk_cfg1;
 
-	cached->pll_out_div = dsi_phy_read(pll_10nm->mmio +
+	cached->pll_out_div = dsi_phy_read(pll_10nm->phy->pll_base +
 				       REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE);
 	cached->pll_out_div &= 0x3;
 
@@ -551,14 +548,14 @@ static int dsi_10nm_restore_state(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->vco_hw);
 	struct pll_10nm_cached_state *cached = &pll_10nm->cached_state;
-	void __iomem *phy_base = pll_10nm->phy_cmn_mmio;
+	void __iomem *phy_base = pll_10nm->phy->base;
 	u32 val;
 	int ret;
 
-	val = dsi_phy_read(pll_10nm->mmio + REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE);
+	val = dsi_phy_read(pll_10nm->phy->pll_base + REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE);
 	val &= ~0x3;
 	val |= cached->pll_out_div;
-	dsi_phy_write(pll_10nm->mmio + REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE, val);
+	dsi_phy_write(pll_10nm->phy->pll_base + REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE, val);
 
 	dsi_phy_write(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG0,
 		  cached->bit_clk_div | (cached->pix_clk_div << 4));
@@ -583,7 +580,7 @@ static int dsi_10nm_restore_state(struct msm_dsi_phy *phy)
 static int dsi_10nm_set_usecase(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->vco_hw);
-	void __iomem *base = pll_10nm->phy_cmn_mmio;
+	void __iomem *base = phy->base;
 	u32 data = 0x0;	/* internal PLL */
 
 	DBG("DSI PLL%d", pll_10nm->id);
@@ -642,7 +639,7 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw_onecel
 
 	hw = devm_clk_hw_register_divider(dev, clk_name,
 				     parent, CLK_SET_RATE_PARENT,
-				     pll_10nm->mmio +
+				     pll_10nm->phy->pll_base +
 				     REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE,
 				     0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
 	if (IS_ERR(hw)) {
@@ -656,7 +653,7 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw_onecel
 	/* BIT CLK: DIV_CTRL_3_0 */
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
 				     CLK_SET_RATE_PARENT,
-				     pll_10nm->phy_cmn_mmio +
+				     pll_10nm->phy->base +
 				     REG_DSI_10nm_PHY_CMN_CLK_CFG0,
 				     0, 4, CLK_DIVIDER_ONE_BASED,
 				     &pll_10nm->postdiv_lock);
@@ -707,7 +704,7 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw_onecel
 	hw = devm_clk_hw_register_mux(dev, clk_name,
 				 ((const char *[]){
 				 parent, parent2, parent3, parent4
-				 }), 4, 0, pll_10nm->phy_cmn_mmio +
+				 }), 4, 0, pll_10nm->phy->base +
 				 REG_DSI_10nm_PHY_CMN_CLK_CFG1,
 				 0, 2, 0, NULL);
 	if (IS_ERR(hw)) {
@@ -720,7 +717,7 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw_onecel
 
 	/* PIX CLK DIV : DIV_CTRL_7_4*/
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
-				     0, pll_10nm->phy_cmn_mmio +
+				     0, pll_10nm->phy->base +
 					REG_DSI_10nm_PHY_CMN_CLK_CFG0,
 				     4, 4, CLK_DIVIDER_ONE_BASED,
 				     &pll_10nm->postdiv_lock);
@@ -755,18 +752,6 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 	pll_10nm->id = id;
 	pll_10nm_list[id] = pll_10nm;
 
-	pll_10nm->phy_cmn_mmio = msm_ioremap(pdev, "dsi_phy", "DSI_PHY");
-	if (IS_ERR_OR_NULL(pll_10nm->phy_cmn_mmio)) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to map CMN PHY base\n");
-		return -ENOMEM;
-	}
-
-	pll_10nm->mmio = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
-	if (IS_ERR_OR_NULL(pll_10nm->mmio)) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to map PLL base\n");
-		return -ENOMEM;
-	}
-
 	spin_lock_init(&pll_10nm->postdiv_lock);
 
 	pll_10nm->phy = phy;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 96f8317154a7..30475687e445 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -118,9 +118,6 @@ struct dsi_pll_14nm {
 	int id;
 	struct platform_device *pdev;
 
-	void __iomem *phy_cmn_mmio;
-	void __iomem *mmio;
-
 	struct msm_dsi_phy *phy;
 
 	struct dsi_pll_input in;
@@ -167,7 +164,7 @@ static bool pll_14nm_poll_for_ready(struct dsi_pll_14nm *pll_14nm,
 				    u32 nb_tries, u32 timeout_us)
 {
 	bool pll_locked = false;
-	void __iomem *base = pll_14nm->mmio;
+	void __iomem *base = pll_14nm->phy->pll_base;
 	u32 tries, val;
 
 	tries = nb_tries;
@@ -380,7 +377,7 @@ static void pll_14nm_calc_vco_count(struct dsi_pll_14nm *pll)
 
 static void pll_db_commit_ssc(struct dsi_pll_14nm *pll)
 {
-	void __iomem *base = pll->mmio;
+	void __iomem *base = pll->phy->pll_base;
 	struct dsi_pll_input *pin = &pll->in;
 	struct dsi_pll_output *pout = &pll->out;
 	u8 data;
@@ -418,7 +415,7 @@ static void pll_db_commit_common(struct dsi_pll_14nm *pll,
 				 struct dsi_pll_input *pin,
 				 struct dsi_pll_output *pout)
 {
-	void __iomem *base = pll->mmio;
+	void __iomem *base = pll->phy->pll_base;
 	u8 data;
 
 	/* confgiure the non frequency dependent pll registers */
@@ -478,7 +475,7 @@ static void pll_db_commit_common(struct dsi_pll_14nm *pll,
 
 static void pll_14nm_software_reset(struct dsi_pll_14nm *pll_14nm)
 {
-	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
+	void __iomem *cmn_base = pll_14nm->phy->base;
 
 	/* de assert pll start and apply pll sw reset */
 
@@ -497,8 +494,8 @@ static void pll_db_commit_14nm(struct dsi_pll_14nm *pll,
 			       struct dsi_pll_input *pin,
 			       struct dsi_pll_output *pout)
 {
-	void __iomem *base = pll->mmio;
-	void __iomem *cmn_base = pll->phy_cmn_mmio;
+	void __iomem *base = pll->phy->pll_base;
+	void __iomem *cmn_base = pll->phy->base;
 	u8 data;
 
 	DBG("DSI%d PLL", pll->id);
@@ -614,7 +611,7 @@ static unsigned long dsi_pll_14nm_vco_recalc_rate(struct clk_hw *hw,
 						  unsigned long parent_rate)
 {
 	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(hw);
-	void __iomem *base = pll_14nm->mmio;
+	void __iomem *base = pll_14nm->phy->pll_base;
 	u64 vco_rate, multiplier = BIT(20);
 	u32 div_frac_start;
 	u32 dec_start;
@@ -653,8 +650,8 @@ static unsigned long dsi_pll_14nm_vco_recalc_rate(struct clk_hw *hw,
 static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
 {
 	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(hw);
-	void __iomem *base = pll_14nm->mmio;
-	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
+	void __iomem *base = pll_14nm->phy->pll_base;
+	void __iomem *cmn_base = pll_14nm->phy->base;
 	bool locked;
 
 	DBG("");
@@ -682,7 +679,7 @@ static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
 static void dsi_pll_14nm_vco_unprepare(struct clk_hw *hw)
 {
 	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(hw);
-	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
+	void __iomem *cmn_base = pll_14nm->phy->base;
 
 	DBG("");
 
@@ -724,7 +721,7 @@ static unsigned long dsi_pll_14nm_postdiv_recalc_rate(struct clk_hw *hw,
 {
 	struct dsi_pll_14nm_postdiv *postdiv = to_pll_14nm_postdiv(hw);
 	struct dsi_pll_14nm *pll_14nm = postdiv->pll;
-	void __iomem *base = pll_14nm->phy_cmn_mmio;
+	void __iomem *base = pll_14nm->phy->base;
 	u8 shift = postdiv->shift;
 	u8 width = postdiv->width;
 	u32 val;
@@ -757,7 +754,7 @@ static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct dsi_pll_14nm_postdiv *postdiv = to_pll_14nm_postdiv(hw);
 	struct dsi_pll_14nm *pll_14nm = postdiv->pll;
-	void __iomem *base = pll_14nm->phy_cmn_mmio;
+	void __iomem *base = pll_14nm->phy->base;
 	spinlock_t *lock = &pll_14nm->postdiv_lock;
 	u8 shift = postdiv->shift;
 	u8 width = postdiv->width;
@@ -784,7 +781,7 @@ static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 	 */
 	if (pll_14nm->phy->usecase == MSM_DSI_PHY_MASTER) {
 		struct dsi_pll_14nm *pll_14nm_slave = pll_14nm->slave;
-		void __iomem *slave_base = pll_14nm_slave->phy_cmn_mmio;
+		void __iomem *slave_base = pll_14nm_slave->phy->base;
 
 		dsi_phy_write(slave_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0, val);
 	}
@@ -808,7 +805,7 @@ static void dsi_14nm_save_state(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->vco_hw);
 	struct pll_14nm_cached_state *cached_state = &pll_14nm->cached_state;
-	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
+	void __iomem *cmn_base = pll_14nm->phy->base;
 	u32 data;
 
 	data = dsi_phy_read(cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0);
@@ -826,7 +823,7 @@ static int dsi_14nm_restore_state(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->vco_hw);
 	struct pll_14nm_cached_state *cached_state = &pll_14nm->cached_state;
-	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
+	void __iomem *cmn_base = pll_14nm->phy->base;
 	u32 data;
 	int ret;
 
@@ -848,7 +845,7 @@ static int dsi_14nm_restore_state(struct msm_dsi_phy *phy)
 	/* also restore post-dividers for slave DSI PLL */
 	if (phy->usecase == MSM_DSI_PHY_MASTER) {
 		struct dsi_pll_14nm *pll_14nm_slave = pll_14nm->slave;
-		void __iomem *slave_base = pll_14nm_slave->phy_cmn_mmio;
+		void __iomem *slave_base = pll_14nm_slave->phy->base;
 
 		dsi_phy_write(slave_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0, data);
 	}
@@ -859,7 +856,7 @@ static int dsi_14nm_restore_state(struct msm_dsi_phy *phy)
 static int dsi_14nm_set_usecase(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->vco_hw);
-	void __iomem *base = pll_14nm->mmio;
+	void __iomem *base = phy->pll_base;
 	u32 clkbuflr_en, bandgap = 0;
 
 	switch (phy->usecase) {
@@ -1011,18 +1008,6 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy *phy)
 	pll_14nm->id = id;
 	pll_14nm_list[id] = pll_14nm;
 
-	pll_14nm->phy_cmn_mmio = msm_ioremap(pdev, "dsi_phy", "DSI_PHY");
-	if (IS_ERR_OR_NULL(pll_14nm->phy_cmn_mmio)) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to map CMN PHY base\n");
-		return -ENOMEM;
-	}
-
-	pll_14nm->mmio = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
-	if (IS_ERR_OR_NULL(pll_14nm->mmio)) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to map PLL base\n");
-		return -ENOMEM;
-	}
-
 	spin_lock_init(&pll_14nm->postdiv_lock);
 
 	pll_14nm->phy = phy;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index cfc76796717b..901286ff3a83 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -69,8 +69,6 @@ struct dsi_pll_28nm {
 
 	struct msm_dsi_phy *phy;
 
-	void __iomem *mmio;
-
 	struct pll_28nm_cached_state cached_state;
 };
 
@@ -83,7 +81,7 @@ static bool pll_28nm_poll_for_ready(struct dsi_pll_28nm *pll_28nm,
 	u32 val;
 
 	while (nb_tries--) {
-		val = dsi_phy_read(pll_28nm->mmio + REG_DSI_28nm_PHY_PLL_STATUS);
+		val = dsi_phy_read(pll_28nm->phy->pll_base + REG_DSI_28nm_PHY_PLL_STATUS);
 		pll_locked = !!(val & DSI_28nm_PHY_PLL_STATUS_PLL_RDY);
 
 		if (pll_locked)
@@ -98,7 +96,7 @@ static bool pll_28nm_poll_for_ready(struct dsi_pll_28nm *pll_28nm,
 
 static void pll_28nm_software_reset(struct dsi_pll_28nm *pll_28nm)
 {
-	void __iomem *base = pll_28nm->mmio;
+	void __iomem *base = pll_28nm->phy->pll_base;
 
 	/*
 	 * Add HW recommended delays after toggling the software
@@ -117,7 +115,7 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
 	struct device *dev = &pll_28nm->pdev->dev;
-	void __iomem *base = pll_28nm->mmio;
+	void __iomem *base = pll_28nm->phy->pll_base;
 	unsigned long div_fbx1000, gen_vco_clk;
 	u32 refclk_cfg, frac_n_mode, frac_n_value;
 	u32 sdm_cfg0, sdm_cfg1, sdm_cfg2, sdm_cfg3;
@@ -241,7 +239,7 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
 		unsigned long parent_rate)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
-	void __iomem *base = pll_28nm->mmio;
+	void __iomem *base = pll_28nm->phy->pll_base;
 	u32 sdm0, doubler, sdm_byp_div;
 	u32 sdm_dc_off, sdm_freq_seed, sdm2, sdm3;
 	u32 ref_clk = VCO_REF_CLK_RATE;
@@ -288,7 +286,7 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
 static int _dsi_pll_28nm_vco_prepare_hpm(struct dsi_pll_28nm *pll_28nm)
 {
 	struct device *dev = &pll_28nm->pdev->dev;
-	void __iomem *base = pll_28nm->mmio;
+	void __iomem *base = pll_28nm->phy->pll_base;
 	u32 max_reads = 5, timeout_us = 100;
 	bool locked;
 	u32 val;
@@ -382,7 +380,7 @@ static int dsi_pll_28nm_vco_prepare_lp(struct clk_hw *hw)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
 	struct device *dev = &pll_28nm->pdev->dev;
-	void __iomem *base = pll_28nm->mmio;
+	void __iomem *base = pll_28nm->phy->pll_base;
 	bool locked;
 	u32 max_reads = 10, timeout_us = 50;
 	u32 val;
@@ -436,7 +434,7 @@ static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
 	if (unlikely(!pll_28nm->phy->pll_on))
 		return;
 
-	dsi_phy_write(pll_28nm->mmio + REG_DSI_28nm_PHY_PLL_GLB_CFG, 0x00);
+	dsi_phy_write(pll_28nm->phy->pll_base + REG_DSI_28nm_PHY_PLL_GLB_CFG, 0x00);
 
 	pll_28nm->phy->pll_on = false;
 }
@@ -480,7 +478,7 @@ static void dsi_28nm_save_state(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->vco_hw);
 	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
-	void __iomem *base = pll_28nm->mmio;
+	void __iomem *base = pll_28nm->phy->pll_base;
 
 	cached_state->postdiv3 =
 			dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG);
@@ -497,7 +495,7 @@ static int dsi_28nm_restore_state(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->vco_hw);
 	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
-	void __iomem *base = pll_28nm->mmio;
+	void __iomem *base = pll_28nm->phy->pll_base;
 	int ret;
 
 	ret = dsi_pll_28nm_clk_set_rate(phy->vco_hw,
@@ -544,7 +542,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecel
 	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->id);
 	hw = devm_clk_hw_register_divider(dev, clk_name,
 			parent1, CLK_SET_RATE_PARENT,
-			pll_28nm->mmio +
+			pll_28nm->phy->pll_base +
 			REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG,
 			0, 4, 0, NULL);
 	if (IS_ERR(hw))
@@ -561,7 +559,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecel
 	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->id);
 	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->id);
 	hw = devm_clk_hw_register_divider(dev, clk_name,
-				parent1, 0, pll_28nm->mmio +
+				parent1, 0, pll_28nm->phy->pll_base +
 				REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG,
 				0, 8, 0, NULL);
 	if (IS_ERR(hw))
@@ -574,7 +572,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecel
 	hw = devm_clk_hw_register_mux(dev, clk_name,
 			((const char *[]){
 				parent1, parent2
-			}), 2, CLK_SET_RATE_PARENT, pll_28nm->mmio +
+			}), 2, CLK_SET_RATE_PARENT, pll_28nm->phy->pll_base +
 			REG_DSI_28nm_PHY_PLL_VREG_CFG, 1, 1, 0, NULL);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
@@ -606,13 +604,6 @@ static int dsi_pll_28nm_hpm_init(struct msm_dsi_phy *phy)
 
 	pll_28nm->pdev = pdev;
 	pll_28nm->id = id;
-
-	pll_28nm->mmio = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
-	if (IS_ERR_OR_NULL(pll_28nm->mmio)) {
-		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map pll base\n", __func__);
-		return -ENOMEM;
-	}
-
 	pll_28nm->phy = phy;
 
 	ret = pll_28nm_register(pll_28nm, phy->provided_clocks, &clk_ops_dsi_pll_28nm_vco_hpm);
@@ -642,13 +633,6 @@ static int dsi_pll_28nm_lp_init(struct msm_dsi_phy *phy)
 
 	pll_28nm->pdev = pdev;
 	pll_28nm->id = id;
-
-	pll_28nm->mmio = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
-	if (IS_ERR_OR_NULL(pll_28nm->mmio)) {
-		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map pll base\n", __func__);
-		return -ENOMEM;
-	}
-
 	pll_28nm->phy = phy;
 
 	ret = pll_28nm_register(pll_28nm, phy->provided_clocks, &clk_ops_dsi_pll_28nm_vco_lp);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index b2e47a60d944..8576b900b016 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -64,8 +64,6 @@ struct dsi_pll_28nm {
 
 	struct msm_dsi_phy *phy;
 
-	void __iomem *mmio;
-
 	struct pll_28nm_cached_state cached_state;
 };
 
@@ -78,7 +76,7 @@ static bool pll_28nm_poll_for_ready(struct dsi_pll_28nm *pll_28nm,
 	u32 val;
 
 	while (nb_tries--) {
-		val = dsi_phy_read(pll_28nm->mmio + REG_DSI_28nm_8960_PHY_PLL_RDY);
+		val = dsi_phy_read(pll_28nm->phy->pll_base + REG_DSI_28nm_8960_PHY_PLL_RDY);
 		pll_locked = !!(val & DSI_28nm_8960_PHY_PLL_RDY_PLL_RDY);
 
 		if (pll_locked)
@@ -98,7 +96,7 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 				     unsigned long parent_rate)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
-	void __iomem *base = pll_28nm->mmio;
+	void __iomem *base = pll_28nm->phy->pll_base;
 	u32 val, temp, fb_divider;
 
 	DBG("rate=%lu, parent's=%lu", rate, parent_rate);
@@ -147,7 +145,7 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
 						  unsigned long parent_rate)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
-	void __iomem *base = pll_28nm->mmio;
+	void __iomem *base = pll_28nm->phy->pll_base;
 	unsigned long vco_rate;
 	u32 status, fb_divider, temp, ref_divider;
 
@@ -181,7 +179,7 @@ static int dsi_pll_28nm_vco_prepare(struct clk_hw *hw)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
 	struct device *dev = &pll_28nm->pdev->dev;
-	void __iomem *base = pll_28nm->mmio;
+	void __iomem *base = pll_28nm->phy->pll_base;
 	bool locked;
 	unsigned int bit_div, byte_div;
 	int max_reads = 1000, timeout_us = 100;
@@ -234,7 +232,7 @@ static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
 	if (unlikely(!pll_28nm->phy->pll_on))
 		return;
 
-	dsi_phy_write(pll_28nm->mmio + REG_DSI_28nm_8960_PHY_PLL_CTRL_0, 0x00);
+	dsi_phy_write(pll_28nm->phy->pll_base + REG_DSI_28nm_8960_PHY_PLL_CTRL_0, 0x00);
 
 	pll_28nm->phy->pll_on = false;
 }
@@ -348,7 +346,7 @@ static void dsi_28nm_save_state(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->vco_hw);
 	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
-	void __iomem *base = pll_28nm->mmio;
+	void __iomem *base = pll_28nm->phy->pll_base;
 
 	cached_state->postdiv3 =
 			dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_10);
@@ -364,7 +362,7 @@ static int dsi_28nm_restore_state(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->vco_hw);
 	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
-	void __iomem *base = pll_28nm->mmio;
+	void __iomem *base = pll_28nm->phy->pll_base;
 	int ret;
 
 	ret = dsi_pll_28nm_clk_set_rate(phy->vco_hw,
@@ -425,7 +423,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecel
 
 	/* prepare and register bytediv */
 	bytediv->hw.init = &bytediv_init;
-	bytediv->reg = pll_28nm->mmio + REG_DSI_28nm_8960_PHY_PLL_CTRL_9;
+	bytediv->reg = pll_28nm->phy->pll_base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9;
 
 	snprintf(parent_name, 32, "dsi%dvco_clk", pll_28nm->id);
 	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->id);
@@ -445,7 +443,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecel
 	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->id);
 	/* DIV3 */
 	hw = devm_clk_hw_register_divider(dev, clk_name,
-				parent_name, 0, pll_28nm->mmio +
+				parent_name, 0, pll_28nm->phy->pll_base +
 				REG_DSI_28nm_8960_PHY_PLL_CTRL_10,
 				0, 8, 0, NULL);
 	if (IS_ERR(hw))
@@ -471,13 +469,6 @@ static int dsi_pll_28nm_8960_init(struct msm_dsi_phy *phy)
 
 	pll_28nm->pdev = pdev;
 	pll_28nm->id = id + 1;
-
-	pll_28nm->mmio = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
-	if (IS_ERR_OR_NULL(pll_28nm->mmio)) {
-		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map pll base\n", __func__);
-		return -ENOMEM;
-	}
-
 	pll_28nm->phy = phy;
 
 	ret = pll_28nm_register(pll_28nm, phy->provided_clocks);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 2357a019cdd9..ae5edaf4df77 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -88,9 +88,6 @@ struct dsi_pll_7nm {
 
 	struct msm_dsi_phy *phy;
 
-	void __iomem *phy_cmn_mmio;
-	void __iomem *mmio;
-
 	u64 vco_ref_clk_rate;
 	u64 vco_current_rate;
 
@@ -228,7 +225,7 @@ static void dsi_pll_calc_ssc(struct dsi_pll_7nm *pll)
 
 static void dsi_pll_ssc_commit(struct dsi_pll_7nm *pll)
 {
-	void __iomem *base = pll->mmio;
+	void __iomem *base = pll->phy->pll_base;
 	struct dsi_pll_regs *regs = &pll->reg_setup;
 
 	if (pll->pll_configuration.enable_ssc) {
@@ -253,7 +250,7 @@ static void dsi_pll_ssc_commit(struct dsi_pll_7nm *pll)
 
 static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 {
-	void __iomem *base = pll->mmio;
+	void __iomem *base = pll->phy->pll_base;
 	u8 analog_controls_five_1 = 0x01, vco_config_1 = 0x00;
 
 	if (pll->phy->cfg->type == MSM_DSI_PHY_7NM_V4_1) {
@@ -295,13 +292,13 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 	if (pll->phy->cfg->type == MSM_DSI_PHY_7NM_V4_1) {
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
 		if (pll->slave)
-			dsi_phy_write(pll->slave->mmio + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
+			dsi_phy_write(pll->slave->phy->pll_base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
 	}
 }
 
 static void dsi_pll_commit(struct dsi_pll_7nm *pll)
 {
-	void __iomem *base = pll->mmio;
+	void __iomem *base = pll->phy->pll_base;
 	struct dsi_pll_regs *reg = &pll->reg_setup;
 
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CORE_INPUT_OVERRIDE, 0x12);
@@ -351,7 +348,7 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
 	u32 const delay_us = 100;
 	u32 const timeout_us = 5000;
 
-	rc = readl_poll_timeout_atomic(pll->mmio +
+	rc = readl_poll_timeout_atomic(pll->phy->pll_base +
 				       REG_DSI_7nm_PHY_PLL_COMMON_STATUS_ONE,
 				       status,
 				       ((status & BIT(0)) > 0),
@@ -366,19 +363,19 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
 
 static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
 {
-	u32 data = dsi_phy_read(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	u32 data = dsi_phy_read(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
-	dsi_phy_write(pll->mmio + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES, 0);
-	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_0, data & ~BIT(5));
+	dsi_phy_write(pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES, 0);
+	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0, data & ~BIT(5));
 	ndelay(250);
 }
 
 static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
 {
-	u32 data = dsi_phy_read(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	u32 data = dsi_phy_read(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
-	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_0, data | BIT(5));
-	dsi_phy_write(pll->mmio + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES, 0xc0);
+	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0, data | BIT(5));
+	dsi_phy_write(pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES, 0xc0);
 	ndelay(250);
 }
 
@@ -386,18 +383,18 @@ static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
 {
 	u32 data;
 
-	data = dsi_phy_read(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CLK_CFG1, data & ~BIT(5));
+	data = dsi_phy_read(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, data & ~BIT(5));
 }
 
 static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
 {
 	u32 data;
 
-	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_3, 0x04);
+	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3, 0x04);
 
-	data = dsi_phy_read(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CLK_CFG1,
+	data = dsi_phy_read(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1,
 		  data | BIT(5) | BIT(4));
 }
 
@@ -408,9 +405,9 @@ static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
 	 * coming out of a CX or analog rail power collapse while
 	 * ensuring that the pads maintain LP00 or LP11 state
 	 */
-	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4, BIT(0));
+	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4, BIT(0));
 	wmb(); /* Ensure that the reset is deasserted */
-	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4, 0x0);
+	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4, 0x0);
 	wmb(); /* Ensure that the reset is deasserted */
 }
 
@@ -424,7 +421,7 @@ static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
 		dsi_pll_enable_pll_bias(pll_7nm->slave);
 
 	/* Start PLL */
-	dsi_phy_write(pll_7nm->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_PLL_CNTRL, 0x01);
+	dsi_phy_write(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_PLL_CNTRL, 0x01);
 
 	/*
 	 * ensure all PLL configurations are written prior to checking
@@ -460,7 +457,7 @@ static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
 
 static void dsi_pll_disable_sub(struct dsi_pll_7nm *pll)
 {
-	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_RBUF_CTRL, 0);
+	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_RBUF_CTRL, 0);
 	dsi_pll_disable_pll_bias(pll);
 }
 
@@ -474,7 +471,7 @@ static void dsi_pll_7nm_vco_unprepare(struct clk_hw *hw)
 	 * powering down the PLL
 	 */
 	dsi_pll_disable_global_clk(pll_7nm);
-	dsi_phy_write(pll_7nm->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_PLL_CNTRL, 0);
+	dsi_phy_write(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_PLL_CNTRL, 0);
 	dsi_pll_disable_sub(pll_7nm);
 	if (pll_7nm->slave) {
 		dsi_pll_disable_global_clk(pll_7nm->slave);
@@ -489,7 +486,7 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 						  unsigned long parent_rate)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
-	void __iomem *base = pll_7nm->mmio;
+	void __iomem *base = pll_7nm->phy->pll_base;
 	u64 ref_clk = pll_7nm->vco_ref_clk_rate;
 	u64 vco_rate = 0x0;
 	u64 multiplier;
@@ -553,10 +550,10 @@ static void dsi_7nm_save_state(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
 	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
-	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
+	void __iomem *phy_base = pll_7nm->phy->base;
 	u32 cmn_clk_cfg0, cmn_clk_cfg1;
 
-	cached->pll_out_div = dsi_phy_read(pll_7nm->mmio +
+	cached->pll_out_div = dsi_phy_read(pll_7nm->phy->pll_base +
 				       REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 	cached->pll_out_div &= 0x3;
 
@@ -576,14 +573,14 @@ static int dsi_7nm_restore_state(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
 	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
-	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
+	void __iomem *phy_base = pll_7nm->phy->base;
 	u32 val;
 	int ret;
 
-	val = dsi_phy_read(pll_7nm->mmio + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
+	val = dsi_phy_read(pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 	val &= ~0x3;
 	val |= cached->pll_out_div;
-	dsi_phy_write(pll_7nm->mmio + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE, val);
+	dsi_phy_write(pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE, val);
 
 	dsi_phy_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0,
 		  cached->bit_clk_div | (cached->pix_clk_div << 4));
@@ -608,7 +605,7 @@ static int dsi_7nm_restore_state(struct msm_dsi_phy *phy)
 static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
-	void __iomem *base = pll_7nm->phy_cmn_mmio;
+	void __iomem *base = phy->base;
 	u32 data = 0x0;	/* internal PLL */
 
 	DBG("DSI PLL%d", pll_7nm->id);
@@ -667,7 +664,7 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw_onecell_d
 
 	hw = devm_clk_hw_register_divider(dev, clk_name,
 				     parent, CLK_SET_RATE_PARENT,
-				     pll_7nm->mmio +
+				     pll_7nm->phy->pll_base +
 				     REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE,
 				     0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
 	if (IS_ERR(hw)) {
@@ -681,7 +678,7 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw_onecell_d
 	/* BIT CLK: DIV_CTRL_3_0 */
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
 				     CLK_SET_RATE_PARENT,
-				     pll_7nm->phy_cmn_mmio +
+				     pll_7nm->phy->base +
 				     REG_DSI_7nm_PHY_CMN_CLK_CFG0,
 				     0, 4, CLK_DIVIDER_ONE_BASED,
 				     &pll_7nm->postdiv_lock);
@@ -732,7 +729,7 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw_onecell_d
 	hw = devm_clk_hw_register_mux(dev, clk_name,
 				 ((const char *[]){
 				 parent, parent2, parent3, parent4
-				 }), 4, 0, pll_7nm->phy_cmn_mmio +
+				 }), 4, 0, pll_7nm->phy->base +
 				 REG_DSI_7nm_PHY_CMN_CLK_CFG1,
 				 0, 2, 0, NULL);
 	if (IS_ERR(hw)) {
@@ -745,7 +742,7 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw_onecell_d
 
 	/* PIX CLK DIV : DIV_CTRL_7_4*/
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
-				     0, pll_7nm->phy_cmn_mmio +
+				     0, pll_7nm->phy->base +
 					REG_DSI_7nm_PHY_CMN_CLK_CFG0,
 				     4, 4, CLK_DIVIDER_ONE_BASED,
 				     &pll_7nm->postdiv_lock);
@@ -780,18 +777,6 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	pll_7nm->id = id;
 	pll_7nm_list[id] = pll_7nm;
 
-	pll_7nm->phy_cmn_mmio = msm_ioremap(pdev, "dsi_phy", "DSI_PHY");
-	if (IS_ERR_OR_NULL(pll_7nm->phy_cmn_mmio)) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to map CMN PHY base\n");
-		return -ENOMEM;
-	}
-
-	pll_7nm->mmio = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
-	if (IS_ERR_OR_NULL(pll_7nm->mmio)) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to map PLL base\n");
-		return -ENOMEM;
-	}
-
 	spin_lock_init(&pll_7nm->postdiv_lock);
 
 	pll_7nm->phy = phy;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
