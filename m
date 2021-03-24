Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9A1347C38
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779806EC90;
	Wed, 24 Mar 2021 15:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775596EC99
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:19:42 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id y1so30665285ljm.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mvDwRyrAFXk11XUKvFSTEAxX+9Fv+rhGPpGel9H7AWA=;
 b=la2rOPJ9FHarTKPRuM8VILRcvwMWKHKYvOvaYzAbKiz6d7VjaCiyBl8x7wOGywqFhZ
 kC3iuAriPZ4E9ljNsz0ixfjc0vOwgaJs20mPJ7z2gEMfEZjWQuVcX1j4cbcfDueI6NaX
 Xl4/ppI+4AL1wHxblTQ2aXGoS7UtpYHYJCXzZmXBunrLiThwD0QWS1CKtTU7eII0vpTo
 qqfkx/mz6NGNqrEX0bAJSLduv/8fa7/+MZCvsalHG3FdmG9dE6rXX+aW67FHYG5XQKiH
 8LtkPdG7R4Xit0QY+jsT3oN43qfFNlhBvFmsLZrJHtpBxMzBWH2DtiCg4KBwkLXSvxm3
 NUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mvDwRyrAFXk11XUKvFSTEAxX+9Fv+rhGPpGel9H7AWA=;
 b=oGLYGbEMFbQ1CGMoRuf9YhbFpnC78YC9wcupABftXRO17I6fqQeK3gMHg4Uri5od2w
 kyt49C2rhPdudJHesbvf1cBQe0jNiapxj06cpdsgoxCZElxUyik5NTEqSopPxtl8EV3J
 yPQeiMsn+WLuZw3MtJZ5CdKFOunc59Cz2r2W+0UMAS/dHRExBfke/ya2PxFGpOWWecO9
 WXU9dMBsxRS2ch4ynxwoKL2ngGJ36UtazPtqHnMQrCZLVlRxVmHoJyEIQsQhzbq0qmXx
 Dh4ySlVq3vHBLZCcMmXFL8/lGOO9zCR2Sjb420sL1JE03F/QXt2XEd0smZLgJgN675bE
 IqsA==
X-Gm-Message-State: AOAM5302/6F6UsKRgKWi+RBhkR4KsHUL19zUdwMFKeYDA2IaxS0WM/wr
 8BmsyueobBlp7SqAN+v65yr8mQ==
X-Google-Smtp-Source: ABdhPJzCrhl5fWbkGK+VflZIE5E0oQaTyWYS6UYOEmyR4dh9ut3QjEmBZSFmQDTfS5itRHNO0vijsw==
X-Received: by 2002:a2e:5159:: with SMTP id b25mr2490107lje.1.1616599180642;
 Wed, 24 Mar 2021 08:19:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:19:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 26/28] drm/msm/dsi: remove temp data from global pll
 structure
Date: Wed, 24 Mar 2021 18:18:44 +0300
Message-Id: <20210324151846.2774204-27-dmitry.baryshkov@linaro.org>
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

The 7nm, 10nm and 14nm drivers would store interim data used during
VCO/PLL rate setting in the global dsi_pll_Nnm structure. Move this data
structures to the onstack storage. While we are at it, drop
unused/static 'config' data, unused config fields, etc.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 167 ++++-------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 334 +++++++--------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 166 ++++------
 3 files changed, 220 insertions(+), 447 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index b937e77b3c37..1fbb54f4df98 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -36,43 +36,25 @@
  */
 
 #define VCO_REF_CLK_RATE		19200000
-
-struct dsi_pll_regs {
-	u32 pll_prop_gain_rate;
-	u32 pll_lockdet_rate;
-	u32 decimal_div_start;
-	u32 frac_div_start_low;
-	u32 frac_div_start_mid;
-	u32 frac_div_start_high;
-	u32 pll_clock_inverters;
-	u32 ssc_stepsize_low;
-	u32 ssc_stepsize_high;
-	u32 ssc_div_per_low;
-	u32 ssc_div_per_high;
-	u32 ssc_adjper_low;
-	u32 ssc_adjper_high;
-	u32 ssc_control;
-};
+#define FRAC_BITS 18
 
 /* v3.0.0 10nm implementation that requires the old timings settings */
 #define DSI_PHY_10NM_QUIRK_OLD_TIMINGS	BIT(0)
 
 struct dsi_pll_config {
-	u32 ref_freq;
-	bool div_override;
-	u32 output_div;
-	bool ignore_frac;
-	bool disable_prescaler;
 	bool enable_ssc;
 	bool ssc_center;
-	u32 dec_bits;
-	u32 frac_bits;
-	u32 lock_timer;
 	u32 ssc_freq;
 	u32 ssc_offset;
 	u32 ssc_adj_per;
-	u32 thresh_cycles;
-	u32 refclk_cycles;
+
+	/* out */
+	u32 pll_prop_gain_rate;
+	u32 decimal_div_start;
+	u32 frac_div_start;
+	u32 pll_clock_inverters;
+	u32 ssc_stepsize;
+	u32 ssc_div_per;
 };
 
 struct pll_10nm_cached_state {
@@ -88,15 +70,11 @@ struct dsi_pll_10nm {
 
 	struct msm_dsi_phy *phy;
 
-	u64 vco_ref_clk_rate;
 	u64 vco_current_rate;
 
 	/* protects REG_DSI_10nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
-	struct dsi_pll_config pll_configuration;
-	struct dsi_pll_regs reg_setup;
-
 	struct pll_10nm_cached_state cached_state;
 
 	struct dsi_pll_10nm *slave;
@@ -110,34 +88,19 @@ struct dsi_pll_10nm {
  */
 static struct dsi_pll_10nm *pll_10nm_list[DSI_MAX];
 
-static void dsi_pll_setup_config(struct dsi_pll_10nm *pll)
+static void dsi_pll_setup_config(struct dsi_pll_config *config)
 {
-	struct dsi_pll_config *config = &pll->pll_configuration;
-
-	config->ref_freq = pll->vco_ref_clk_rate;
-	config->output_div = 1;
-	config->dec_bits = 8;
-	config->frac_bits = 18;
-	config->lock_timer = 64;
 	config->ssc_freq = 31500;
 	config->ssc_offset = 5000;
 	config->ssc_adj_per = 2;
-	config->thresh_cycles = 32;
-	config->refclk_cycles = 256;
-
-	config->div_override = false;
-	config->ignore_frac = false;
-	config->disable_prescaler = false;
 
 	config->enable_ssc = false;
-	config->ssc_center = 0;
+	config->ssc_center = false;
 }
 
-static void dsi_pll_calc_dec_frac(struct dsi_pll_10nm *pll)
+static void dsi_pll_calc_dec_frac(struct dsi_pll_10nm *pll, struct dsi_pll_config *config)
 {
-	struct dsi_pll_config *config = &pll->pll_configuration;
-	struct dsi_pll_regs *regs = &pll->reg_setup;
-	u64 fref = pll->vco_ref_clk_rate;
+	u64 fref = VCO_REF_CLK_RATE;
 	u64 pll_freq;
 	u64 divider;
 	u64 dec, dec_multiple;
@@ -146,40 +109,32 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_10nm *pll)
 
 	pll_freq = pll->vco_current_rate;
 
-	if (config->disable_prescaler)
-		divider = fref;
-	else
-		divider = fref * 2;
+	divider = fref * 2;
 
-	multiplier = 1 << config->frac_bits;
+	multiplier = 1 << FRAC_BITS;
 	dec_multiple = div_u64(pll_freq * multiplier, divider);
 	dec = div_u64_rem(dec_multiple, multiplier, &frac);
 
 	if (pll_freq <= 1900000000UL)
-		regs->pll_prop_gain_rate = 8;
+		config->pll_prop_gain_rate = 8;
 	else if (pll_freq <= 3000000000UL)
-		regs->pll_prop_gain_rate = 10;
+		config->pll_prop_gain_rate = 10;
 	else
-		regs->pll_prop_gain_rate = 12;
+		config->pll_prop_gain_rate = 12;
 	if (pll_freq < 1100000000UL)
-		regs->pll_clock_inverters = 8;
+		config->pll_clock_inverters = 8;
 	else
-		regs->pll_clock_inverters = 0;
+		config->pll_clock_inverters = 0;
 
-	regs->pll_lockdet_rate = config->lock_timer;
-	regs->decimal_div_start = dec;
-	regs->frac_div_start_low = (frac & 0xff);
-	regs->frac_div_start_mid = (frac & 0xff00) >> 8;
-	regs->frac_div_start_high = (frac & 0x30000) >> 16;
+	config->decimal_div_start = dec;
+	config->frac_div_start = frac;
 }
 
 #define SSC_CENTER		BIT(0)
 #define SSC_EN			BIT(1)
 
-static void dsi_pll_calc_ssc(struct dsi_pll_10nm *pll)
+static void dsi_pll_calc_ssc(struct dsi_pll_10nm *pll, struct dsi_pll_config *config)
 {
-	struct dsi_pll_config *config = &pll->pll_configuration;
-	struct dsi_pll_regs *regs = &pll->reg_setup;
 	u32 ssc_per;
 	u32 ssc_mod;
 	u64 ssc_step_size;
@@ -190,58 +145,49 @@ static void dsi_pll_calc_ssc(struct dsi_pll_10nm *pll)
 		return;
 	}
 
-	ssc_per = DIV_ROUND_CLOSEST(config->ref_freq, config->ssc_freq) / 2 - 1;
+	ssc_per = DIV_ROUND_CLOSEST(VCO_REF_CLK_RATE, config->ssc_freq) / 2 - 1;
 	ssc_mod = (ssc_per + 1) % (config->ssc_adj_per + 1);
 	ssc_per -= ssc_mod;
 
-	frac = regs->frac_div_start_low |
-			(regs->frac_div_start_mid << 8) |
-			(regs->frac_div_start_high << 16);
-	ssc_step_size = regs->decimal_div_start;
-	ssc_step_size *= (1 << config->frac_bits);
+	frac = config->frac_div_start;
+	ssc_step_size = config->decimal_div_start;
+	ssc_step_size *= (1 << FRAC_BITS);
 	ssc_step_size += frac;
 	ssc_step_size *= config->ssc_offset;
 	ssc_step_size *= (config->ssc_adj_per + 1);
 	ssc_step_size = div_u64(ssc_step_size, (ssc_per + 1));
 	ssc_step_size = DIV_ROUND_CLOSEST_ULL(ssc_step_size, 1000000);
 
-	regs->ssc_div_per_low = ssc_per & 0xFF;
-	regs->ssc_div_per_high = (ssc_per & 0xFF00) >> 8;
-	regs->ssc_stepsize_low = (u32)(ssc_step_size & 0xFF);
-	regs->ssc_stepsize_high = (u32)((ssc_step_size & 0xFF00) >> 8);
-	regs->ssc_adjper_low = config->ssc_adj_per & 0xFF;
-	regs->ssc_adjper_high = (config->ssc_adj_per & 0xFF00) >> 8;
-
-	regs->ssc_control = config->ssc_center ? SSC_CENTER : 0;
+	config->ssc_div_per = ssc_per;
+	config->ssc_stepsize = ssc_step_size;
 
 	pr_debug("SCC: Dec:%d, frac:%llu, frac_bits:%d\n",
-		 regs->decimal_div_start, frac, config->frac_bits);
+		 config->decimal_div_start, frac, FRAC_BITS);
 	pr_debug("SSC: div_per:0x%X, stepsize:0x%X, adjper:0x%X\n",
 		 ssc_per, (u32)ssc_step_size, config->ssc_adj_per);
 }
 
-static void dsi_pll_ssc_commit(struct dsi_pll_10nm *pll)
+static void dsi_pll_ssc_commit(struct dsi_pll_10nm *pll, struct dsi_pll_config *config)
 {
 	void __iomem *base = pll->phy->pll_base;
-	struct dsi_pll_regs *regs = &pll->reg_setup;
 
-	if (pll->pll_configuration.enable_ssc) {
+	if (config->enable_ssc) {
 		pr_debug("SSC is enabled\n");
 
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_STEPSIZE_LOW_1,
-			  regs->ssc_stepsize_low);
+			  config->ssc_stepsize & 0xff);
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_STEPSIZE_HIGH_1,
-			  regs->ssc_stepsize_high);
+			  config->ssc_stepsize >> 8);
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_PER_LOW_1,
-			  regs->ssc_div_per_low);
+			  config->ssc_div_per & 0xff);
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_PER_HIGH_1,
-			  regs->ssc_div_per_high);
+			  config->ssc_div_per >> 8);
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_ADJPER_LOW_1,
-			  regs->ssc_adjper_low);
+			  config->ssc_adj_per & 0xff);
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_ADJPER_HIGH_1,
-			  regs->ssc_adjper_high);
+			  config->ssc_adj_per >> 8);
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_CONTROL,
-			  SSC_EN | regs->ssc_control);
+			  SSC_EN | (config->ssc_center ? SSC_CENTER : 0));
 	}
 }
 
@@ -271,50 +217,48 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_10nm *pll)
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_IFILT, 0x3f);
 }
 
-static void dsi_pll_commit(struct dsi_pll_10nm *pll)
+static void dsi_pll_commit(struct dsi_pll_10nm *pll, struct dsi_pll_config *config)
 {
 	void __iomem *base = pll->phy->pll_base;
-	struct dsi_pll_regs *reg = &pll->reg_setup;
 
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CORE_INPUT_OVERRIDE, 0x12);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_DECIMAL_DIV_START_1,
-		  reg->decimal_div_start);
+		  config->decimal_div_start);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_LOW_1,
-		  reg->frac_div_start_low);
+		  config->frac_div_start & 0xff);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_MID_1,
-		  reg->frac_div_start_mid);
+		  (config->frac_div_start & 0xff00) >> 8);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1,
-		  reg->frac_div_start_high);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCKDET_RATE_1,
-		  reg->pll_lockdet_rate);
+		  (config->frac_div_start & 0x30000) >> 16);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCKDET_RATE_1, 64);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CMODE, 0x10);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CLOCK_INVERTERS,
-		  reg->pll_clock_inverters);
+		  config->pll_clock_inverters);
 }
 
 static int dsi_pll_10nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 				     unsigned long parent_rate)
 {
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
+	struct dsi_pll_config config;
 
 	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_10nm->phy->id, rate,
 	    parent_rate);
 
 	pll_10nm->vco_current_rate = rate;
-	pll_10nm->vco_ref_clk_rate = VCO_REF_CLK_RATE;
 
-	dsi_pll_setup_config(pll_10nm);
+	dsi_pll_setup_config(&config);
 
-	dsi_pll_calc_dec_frac(pll_10nm);
+	dsi_pll_calc_dec_frac(pll_10nm, &config);
 
-	dsi_pll_calc_ssc(pll_10nm);
+	dsi_pll_calc_ssc(pll_10nm, &config);
 
-	dsi_pll_commit(pll_10nm);
+	dsi_pll_commit(pll_10nm, &config);
 
 	dsi_pll_config_hzindep_reg(pll_10nm);
 
-	dsi_pll_ssc_commit(pll_10nm);
+	dsi_pll_ssc_commit(pll_10nm, &config);
 
 	/* flush, ensure all register writes are done*/
 	wmb();
@@ -461,9 +405,8 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
 						  unsigned long parent_rate)
 {
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
-	struct dsi_pll_config *config = &pll_10nm->pll_configuration;
 	void __iomem *base = pll_10nm->phy->pll_base;
-	u64 ref_clk = pll_10nm->vco_ref_clk_rate;
+	u64 ref_clk = VCO_REF_CLK_RATE;
 	u64 vco_rate = 0x0;
 	u64 multiplier;
 	u32 frac;
@@ -483,7 +426,7 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
 	 * TODO:
 	 *	1. Assumes prescaler is disabled
 	 */
-	multiplier = 1 << config->frac_bits;
+	multiplier = 1 << FRAC_BITS;
 	pll_freq = dec * (ref_clk * 2);
 	tmp64 = (ref_clk * 2 * frac);
 	pll_freq += div_u64(tmp64, multiplier);
@@ -565,7 +508,7 @@ static int dsi_10nm_restore_state(struct msm_dsi_phy *phy)
 	val |= cached->pll_mux;
 	dsi_phy_write(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1, val);
 
-	ret = dsi_pll_10nm_vco_set_rate(phy->vco_hw, pll_10nm->vco_current_rate, pll_10nm->vco_ref_clk_rate);
+	ret = dsi_pll_10nm_vco_set_rate(phy->vco_hw, pll_10nm->vco_current_rate, VCO_REF_CLK_RATE);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_10nm->phy->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 8b4865c5796d..d08ad0c632b4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -37,51 +37,19 @@
 #define VCO_MIN_RATE			1300000000UL
 #define VCO_MAX_RATE			2600000000UL
 
-#define DSI_PLL_DEFAULT_VCO_POSTDIV	1
+struct dsi_pll_config {
+	u64 vco_current_rate;
 
-struct dsi_pll_input {
-	u32 fref;	/* reference clk */
-	u32 fdata;	/* bit clock rate */
-	u32 dsiclk_sel; /* Mux configuration (see diagram) */
 	u32 ssc_en;	/* SSC enable/disable */
-	u32 ldo_en;
 
 	/* fixed params */
-	u32 refclk_dbler_en;
-	u32 vco_measure_time;
-	u32 kvco_measure_time;
-	u32 bandgap_timer;
-	u32 pll_wakeup_timer;
 	u32 plllock_cnt;
-	u32 plllock_rng;
 	u32 ssc_center;
 	u32 ssc_adj_period;
 	u32 ssc_spread;
 	u32 ssc_freq;
-	u32 pll_ie_trim;
-	u32 pll_ip_trim;
-	u32 pll_iptat_trim;
-	u32 pll_cpcset_cur;
-	u32 pll_cpmset_cur;
-
-	u32 pll_icpmset;
-	u32 pll_icpcset;
-
-	u32 pll_icpmset_p;
-	u32 pll_icpmset_m;
-
-	u32 pll_icpcset_p;
-	u32 pll_icpcset_m;
-
-	u32 pll_lpf_res1;
-	u32 pll_lpf_cap1;
-	u32 pll_lpf_cap2;
-	u32 pll_c3ctrl;
-	u32 pll_r3ctrl;
-};
 
-struct dsi_pll_output {
-	u32 pll_txclk_en;
+	/* calculated */
 	u32 dec_start;
 	u32 div_frac_start;
 	u32 ssc_period;
@@ -91,19 +59,6 @@ struct dsi_pll_output {
 	u32 pll_vco_count;
 	u32 pll_kvco_div_ref;
 	u32 pll_kvco_count;
-	u32 pll_misc1;
-	u32 pll_lpf2_postdiv;
-	u32 pll_resetsm_cntrl;
-	u32 pll_resetsm_cntrl2;
-	u32 pll_resetsm_cntrl5;
-	u32 pll_kvco_code;
-
-	u32 cmn_clk_cfg0;
-	u32 cmn_clk_cfg1;
-	u32 cmn_ldo_cntrl;
-
-	u32 pll_postdiv;
-	u32 fcvo;
 };
 
 struct pll_14nm_cached_state {
@@ -117,15 +72,9 @@ struct dsi_pll_14nm {
 
 	struct msm_dsi_phy *phy;
 
-	struct dsi_pll_input in;
-	struct dsi_pll_output out;
-
 	/* protects REG_DSI_14nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
-	u64 vco_current_rate;
-	u64 vco_ref_clk_rate;
-
 	struct pll_14nm_cached_state cached_state;
 
 	struct dsi_pll_14nm *slave;
@@ -195,78 +144,50 @@ static bool pll_14nm_poll_for_ready(struct dsi_pll_14nm *pll_14nm,
 	return pll_locked;
 }
 
-static void dsi_pll_14nm_input_init(struct dsi_pll_14nm *pll)
+static void dsi_pll_14nm_config_init(struct dsi_pll_config *pconf)
 {
-	pll->in.fref = pll->vco_ref_clk_rate;
-	pll->in.fdata = 0;
-	pll->in.dsiclk_sel = 1;	/* Use the /2 path in Mux */
-	pll->in.ldo_en = 0;	/* disabled for now */
-
 	/* fixed input */
-	pll->in.refclk_dbler_en = 0;
-	pll->in.vco_measure_time = 5;
-	pll->in.kvco_measure_time = 5;
-	pll->in.bandgap_timer = 4;
-	pll->in.pll_wakeup_timer = 5;
-	pll->in.plllock_cnt = 1;
-	pll->in.plllock_rng = 0;
+	pconf->plllock_cnt = 1;
 
 	/*
 	 * SSC is enabled by default. We might need DT props for configuring
 	 * some SSC params like PPM and center/down spread etc.
 	 */
-	pll->in.ssc_en = 1;
-	pll->in.ssc_center = 0;		/* down spread by default */
-	pll->in.ssc_spread = 5;		/* PPM / 1000 */
-	pll->in.ssc_freq = 31500;	/* default recommended */
-	pll->in.ssc_adj_period = 37;
-
-	pll->in.pll_ie_trim = 4;
-	pll->in.pll_ip_trim = 4;
-	pll->in.pll_cpcset_cur = 1;
-	pll->in.pll_cpmset_cur = 1;
-	pll->in.pll_icpmset = 4;
-	pll->in.pll_icpcset = 4;
-	pll->in.pll_icpmset_p = 0;
-	pll->in.pll_icpmset_m = 0;
-	pll->in.pll_icpcset_p = 0;
-	pll->in.pll_icpcset_m = 0;
-	pll->in.pll_lpf_res1 = 3;
-	pll->in.pll_lpf_cap1 = 11;
-	pll->in.pll_lpf_cap2 = 1;
-	pll->in.pll_iptat_trim = 7;
-	pll->in.pll_c3ctrl = 2;
-	pll->in.pll_r3ctrl = 1;
+	pconf->ssc_en = 1;
+	pconf->ssc_center = 0;		/* down spread by default */
+	pconf->ssc_spread = 5;		/* PPM / 1000 */
+	pconf->ssc_freq = 31500;	/* default recommended */
+	pconf->ssc_adj_period = 37;
 }
 
 #define CEIL(x, y)		(((x) + ((y) - 1)) / (y))
 
-static void pll_14nm_ssc_calc(struct dsi_pll_14nm *pll)
+static void pll_14nm_ssc_calc(struct dsi_pll_14nm *pll, struct dsi_pll_config *pconf)
 {
 	u32 period, ssc_period;
 	u32 ref, rem;
 	u64 step_size;
 
-	DBG("vco=%lld ref=%lld", pll->vco_current_rate, pll->vco_ref_clk_rate);
+	DBG("vco=%lld ref=%d", pconf->vco_current_rate, VCO_REF_CLK_RATE);
 
-	ssc_period = pll->in.ssc_freq / 500;
-	period = (u32)pll->vco_ref_clk_rate / 1000;
+	ssc_period = pconf->ssc_freq / 500;
+	period = (u32)VCO_REF_CLK_RATE / 1000;
 	ssc_period  = CEIL(period, ssc_period);
 	ssc_period -= 1;
-	pll->out.ssc_period = ssc_period;
+	pconf->ssc_period = ssc_period;
 
-	DBG("ssc freq=%d spread=%d period=%d", pll->in.ssc_freq,
-	    pll->in.ssc_spread, pll->out.ssc_period);
+	DBG("ssc freq=%d spread=%d period=%d", pconf->ssc_freq,
+	    pconf->ssc_spread, pconf->ssc_period);
 
-	step_size = (u32)pll->vco_current_rate;
-	ref = pll->vco_ref_clk_rate;
+	step_size = (u32)pconf->vco_current_rate;
+	ref = VCO_REF_CLK_RATE;
 	ref /= 1000;
 	step_size = div_u64(step_size, ref);
 	step_size <<= 20;
 	step_size = div_u64(step_size, 1000);
-	step_size *= pll->in.ssc_spread;
+	step_size *= pconf->ssc_spread;
 	step_size = div_u64(step_size, 1000);
-	step_size *= (pll->in.ssc_adj_period + 1);
+	step_size *= (pconf->ssc_adj_period + 1);
 
 	rem = 0;
 	step_size = div_u64_rem(step_size, ssc_period + 1, &rem);
@@ -277,18 +198,16 @@ static void pll_14nm_ssc_calc(struct dsi_pll_14nm *pll)
 
 	step_size &= 0x0ffff;	/* take lower 16 bits */
 
-	pll->out.ssc_step_size = step_size;
+	pconf->ssc_step_size = step_size;
 }
 
-static void pll_14nm_dec_frac_calc(struct dsi_pll_14nm *pll)
+static void pll_14nm_dec_frac_calc(struct dsi_pll_14nm *pll, struct dsi_pll_config *pconf)
 {
-	struct dsi_pll_input *pin = &pll->in;
-	struct dsi_pll_output *pout = &pll->out;
 	u64 multiplier = BIT(20);
 	u64 dec_start_multiple, dec_start, pll_comp_val;
 	u32 duration, div_frac_start;
-	u64 vco_clk_rate = pll->vco_current_rate;
-	u64 fref = pll->vco_ref_clk_rate;
+	u64 vco_clk_rate = pconf->vco_current_rate;
+	u64 fref = VCO_REF_CLK_RATE;
 
 	DBG("vco_clk_rate=%lld ref_clk_rate=%lld", vco_clk_rate, fref);
 
@@ -297,14 +216,14 @@ static void pll_14nm_dec_frac_calc(struct dsi_pll_14nm *pll)
 
 	dec_start = div_u64(dec_start_multiple, multiplier);
 
-	pout->dec_start = (u32)dec_start;
-	pout->div_frac_start = div_frac_start;
+	pconf->dec_start = (u32)dec_start;
+	pconf->div_frac_start = div_frac_start;
 
-	if (pin->plllock_cnt == 0)
+	if (pconf->plllock_cnt == 0)
 		duration = 1024;
-	else if (pin->plllock_cnt == 1)
+	else if (pconf->plllock_cnt == 1)
 		duration = 256;
-	else if (pin->plllock_cnt == 2)
+	else if (pconf->plllock_cnt == 2)
 		duration = 128;
 	else
 		duration = 32;
@@ -313,10 +232,7 @@ static void pll_14nm_dec_frac_calc(struct dsi_pll_14nm *pll)
 	pll_comp_val = div_u64(pll_comp_val, multiplier);
 	do_div(pll_comp_val, 10);
 
-	pout->plllock_cmp = (u32)pll_comp_val;
-
-	pout->pll_txclk_en = 1;
-	pout->cmn_ldo_cntrl = 0x3c;
+	pconf->plllock_cmp = (u32)pll_comp_val;
 }
 
 static u32 pll_14nm_kvco_slop(u32 vrate)
@@ -333,74 +249,66 @@ static u32 pll_14nm_kvco_slop(u32 vrate)
 	return slop;
 }
 
-static void pll_14nm_calc_vco_count(struct dsi_pll_14nm *pll)
+static void pll_14nm_calc_vco_count(struct dsi_pll_14nm *pll, struct dsi_pll_config *pconf)
 {
-	struct dsi_pll_input *pin = &pll->in;
-	struct dsi_pll_output *pout = &pll->out;
-	u64 vco_clk_rate = pll->vco_current_rate;
-	u64 fref = pll->vco_ref_clk_rate;
+	u64 vco_clk_rate = pconf->vco_current_rate;
+	u64 fref = VCO_REF_CLK_RATE;
+	u32 vco_measure_time = 5;
+	u32 kvco_measure_time = 5;
 	u64 data;
 	u32 cnt;
 
-	data = fref * pin->vco_measure_time;
+	data = fref * vco_measure_time;
 	do_div(data, 1000000);
 	data &= 0x03ff;	/* 10 bits */
 	data -= 2;
-	pout->pll_vco_div_ref = data;
+	pconf->pll_vco_div_ref = data;
 
 	data = div_u64(vco_clk_rate, 1000000);	/* unit is Mhz */
-	data *= pin->vco_measure_time;
+	data *= vco_measure_time;
 	do_div(data, 10);
-	pout->pll_vco_count = data;
+	pconf->pll_vco_count = data;
 
-	data = fref * pin->kvco_measure_time;
+	data = fref * kvco_measure_time;
 	do_div(data, 1000000);
 	data &= 0x03ff;	/* 10 bits */
 	data -= 1;
-	pout->pll_kvco_div_ref = data;
+	pconf->pll_kvco_div_ref = data;
 
 	cnt = pll_14nm_kvco_slop(vco_clk_rate);
 	cnt *= 2;
 	cnt /= 100;
-	cnt *= pin->kvco_measure_time;
-	pout->pll_kvco_count = cnt;
-
-	pout->pll_misc1 = 16;
-	pout->pll_resetsm_cntrl = 48;
-	pout->pll_resetsm_cntrl2 = pin->bandgap_timer << 3;
-	pout->pll_resetsm_cntrl5 = pin->pll_wakeup_timer;
-	pout->pll_kvco_code = 0;
+	cnt *= kvco_measure_time;
+	pconf->pll_kvco_count = cnt;
 }
 
-static void pll_db_commit_ssc(struct dsi_pll_14nm *pll)
+static void pll_db_commit_ssc(struct dsi_pll_14nm *pll, struct dsi_pll_config *pconf)
 {
 	void __iomem *base = pll->phy->pll_base;
-	struct dsi_pll_input *pin = &pll->in;
-	struct dsi_pll_output *pout = &pll->out;
 	u8 data;
 
-	data = pin->ssc_adj_period;
+	data = pconf->ssc_adj_period;
 	data &= 0x0ff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_ADJ_PER1, data);
-	data = (pin->ssc_adj_period >> 8);
+	data = (pconf->ssc_adj_period >> 8);
 	data &= 0x03;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_ADJ_PER2, data);
 
-	data = pout->ssc_period;
+	data = pconf->ssc_period;
 	data &= 0x0ff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_PER1, data);
-	data = (pout->ssc_period >> 8);
+	data = (pconf->ssc_period >> 8);
 	data &= 0x0ff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_PER2, data);
 
-	data = pout->ssc_step_size;
+	data = pconf->ssc_step_size;
 	data &= 0x0ff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_STEP_SIZE1, data);
-	data = (pout->ssc_step_size >> 8);
+	data = (pconf->ssc_step_size >> 8);
 	data &= 0x0ff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_STEP_SIZE2, data);
 
-	data = (pin->ssc_center & 0x01);
+	data = (pconf->ssc_center & 0x01);
 	data <<= 1;
 	data |= 0x01; /* enable */
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_EN_CENTER, data);
@@ -409,8 +317,7 @@ static void pll_db_commit_ssc(struct dsi_pll_14nm *pll)
 }
 
 static void pll_db_commit_common(struct dsi_pll_14nm *pll,
-				 struct dsi_pll_input *pin,
-				 struct dsi_pll_output *pout)
+				 struct dsi_pll_config *pconf)
 {
 	void __iomem *base = pll->phy->pll_base;
 	u8 data;
@@ -419,55 +326,41 @@ static void pll_db_commit_common(struct dsi_pll_14nm *pll,
 	data = 0;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SYSCLK_EN_RESET, data);
 
-	data = pout->pll_txclk_en;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_TXCLK_EN, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_TXCLK_EN, 1);
 
-	data = pout->pll_resetsm_cntrl;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL, data);
-	data = pout->pll_resetsm_cntrl2;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL2, data);
-	data = pout->pll_resetsm_cntrl5;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL5, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL, 48);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL2, 4 << 3); /* bandgap_timer */
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL5, 5); /* pll_wakeup_timer */
 
-	data = pout->pll_vco_div_ref & 0xff;
+	data = pconf->pll_vco_div_ref & 0xff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VCO_DIV_REF1, data);
-	data = (pout->pll_vco_div_ref >> 8) & 0x3;
+	data = (pconf->pll_vco_div_ref >> 8) & 0x3;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VCO_DIV_REF2, data);
 
-	data = pout->pll_kvco_div_ref & 0xff;
+	data = pconf->pll_kvco_div_ref & 0xff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_KVCO_DIV_REF1, data);
-	data = (pout->pll_kvco_div_ref >> 8) & 0x3;
+	data = (pconf->pll_kvco_div_ref >> 8) & 0x3;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_KVCO_DIV_REF2, data);
 
-	data = pout->pll_misc1;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_MISC1, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_MISC1, 16);
 
-	data = pin->pll_ie_trim;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_IE_TRIM, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_IE_TRIM, 4);
 
-	data = pin->pll_ip_trim;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_IP_TRIM, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_IP_TRIM, 4);
 
-	data = pin->pll_cpmset_cur << 3 | pin->pll_cpcset_cur;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_CP_SET_CUR, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_CP_SET_CUR, 1 << 3 | 1);
 
-	data = pin->pll_icpcset_p << 3 | pin->pll_icpcset_m;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICPCSET, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICPCSET, 0 << 3 | 0);
 
-	data = pin->pll_icpmset_p << 3 | pin->pll_icpcset_m;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICPMSET, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICPMSET, 0 << 3 | 0);
 
-	data = pin->pll_icpmset << 3 | pin->pll_icpcset;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICP_SET, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICP_SET, 4 << 3 | 4);
 
-	data = pin->pll_lpf_cap2 << 4 | pin->pll_lpf_cap1;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_LPF1, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_LPF1, 1 << 4 | 11);
 
-	data = pin->pll_iptat_trim;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_IPTAT_TRIM, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_IPTAT_TRIM, 7);
 
-	data = pin->pll_c3ctrl | pin->pll_r3ctrl << 4;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_CRCTRL, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_CRCTRL, 1 << 4 | 2);
 }
 
 static void pll_14nm_software_reset(struct dsi_pll_14nm *pll_14nm)
@@ -488,8 +381,7 @@ static void pll_14nm_software_reset(struct dsi_pll_14nm *pll_14nm)
 }
 
 static void pll_db_commit_14nm(struct dsi_pll_14nm *pll,
-			       struct dsi_pll_input *pin,
-			       struct dsi_pll_output *pout)
+			       struct dsi_pll_config *pconf)
 {
 	void __iomem *base = pll->phy->pll_base;
 	void __iomem *cmn_base = pll->phy->base;
@@ -497,57 +389,64 @@ static void pll_db_commit_14nm(struct dsi_pll_14nm *pll,
 
 	DBG("DSI%d PLL", pll->phy->id);
 
-	data = pout->cmn_ldo_cntrl;
-	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_LDO_CNTRL, data);
+	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_LDO_CNTRL, 0x3c);
 
-	pll_db_commit_common(pll, pin, pout);
+	pll_db_commit_common(pll, pconf);
 
 	pll_14nm_software_reset(pll);
 
-	data = pin->dsiclk_sel; /* set dsiclk_sel = 1  */
-	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG1, data);
+	/* Use the /2 path in Mux */
+	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG1, 1);
 
 	data = 0xff; /* data, clk, pll normal operation */
 	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_CTRL_0, data);
 
 	/* configure the frequency dependent pll registers */
-	data = pout->dec_start;
+	data = pconf->dec_start;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_DEC_START, data);
 
-	data = pout->div_frac_start & 0xff;
+	data = pconf->div_frac_start & 0xff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START1, data);
-	data = (pout->div_frac_start >> 8) & 0xff;
+	data = (pconf->div_frac_start >> 8) & 0xff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START2, data);
-	data = (pout->div_frac_start >> 16) & 0xf;
+	data = (pconf->div_frac_start >> 16) & 0xf;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START3, data);
 
-	data = pout->plllock_cmp & 0xff;
+	data = pconf->plllock_cmp & 0xff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP1, data);
 
-	data = (pout->plllock_cmp >> 8) & 0xff;
+	data = (pconf->plllock_cmp >> 8) & 0xff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP2, data);
 
-	data = (pout->plllock_cmp >> 16) & 0x3;
+	data = (pconf->plllock_cmp >> 16) & 0x3;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP3, data);
 
-	data = pin->plllock_cnt << 1 | pin->plllock_rng << 3;
+	data = pconf->plllock_cnt << 1 | 0 << 3; /* plllock_rng */
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP_EN, data);
 
-	data = pout->pll_vco_count & 0xff;
+	data = pconf->pll_vco_count & 0xff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VCO_COUNT1, data);
-	data = (pout->pll_vco_count >> 8) & 0xff;
+	data = (pconf->pll_vco_count >> 8) & 0xff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VCO_COUNT2, data);
 
-	data = pout->pll_kvco_count & 0xff;
+	data = pconf->pll_kvco_count & 0xff;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_KVCO_COUNT1, data);
-	data = (pout->pll_kvco_count >> 8) & 0x3;
+	data = (pconf->pll_kvco_count >> 8) & 0x3;
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_KVCO_COUNT2, data);
 
-	data = (pout->pll_postdiv - 1) << 4 | pin->pll_lpf_res1;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_LPF2_POSTDIV, data);
+	/*
+	 * High nibble configures the post divider internal to the VCO. It's
+	 * fixed to divide by 1 for now.
+	 *
+	 * 0: divided by 1
+	 * 1: divided by 2
+	 * 2: divided by 4
+	 * 3: divided by 8
+	 */
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_LPF2_POSTDIV, 0 << 4 | 3);
 
-	if (pin->ssc_en)
-		pll_db_commit_ssc(pll);
+	if (pconf->ssc_en)
+		pll_db_commit_ssc(pll, pconf);
 
 	wmb();	/* make sure register committed */
 }
@@ -559,35 +458,20 @@ static int dsi_pll_14nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 				     unsigned long parent_rate)
 {
 	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(hw);
-	struct dsi_pll_input *pin = &pll_14nm->in;
-	struct dsi_pll_output *pout = &pll_14nm->out;
+	struct dsi_pll_config conf;
 
 	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_14nm->phy->id, rate,
 	    parent_rate);
 
-	pll_14nm->vco_current_rate = rate;
-	pll_14nm->vco_ref_clk_rate = VCO_REF_CLK_RATE;
-
-	dsi_pll_14nm_input_init(pll_14nm);
-
-	/*
-	 * This configures the post divider internal to the VCO. It's
-	 * fixed to divide by 1 for now.
-	 *
-	 * tx_band = pll_postdiv.
-	 * 0: divided by 1
-	 * 1: divided by 2
-	 * 2: divided by 4
-	 * 3: divided by 8
-	 */
-	pout->pll_postdiv = DSI_PLL_DEFAULT_VCO_POSTDIV;
+	dsi_pll_14nm_config_init(&conf);
+	conf.vco_current_rate = rate;
 
-	pll_14nm_dec_frac_calc(pll_14nm);
+	pll_14nm_dec_frac_calc(pll_14nm, &conf);
 
-	if (pin->ssc_en)
-		pll_14nm_ssc_calc(pll_14nm);
+	if (conf.ssc_en)
+		pll_14nm_ssc_calc(pll_14nm, &conf);
 
-	pll_14nm_calc_vco_count(pll_14nm);
+	pll_14nm_calc_vco_count(pll_14nm, &conf);
 
 	/* commit the slave DSI PLL registers if we're master. Note that we
 	 * don't lock the slave PLL. We just ensure that the PLL/PHY registers
@@ -596,10 +480,10 @@ static int dsi_pll_14nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (pll_14nm->phy->usecase == MSM_DSI_PHY_MASTER) {
 		struct dsi_pll_14nm *pll_14nm_slave = pll_14nm->slave;
 
-		pll_db_commit_14nm(pll_14nm_slave, pin, pout);
+		pll_db_commit_14nm(pll_14nm_slave, &conf);
 	}
 
-	pll_db_commit_14nm(pll_14nm, pin, pout);
+	pll_db_commit_14nm(pll_14nm, &conf);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 4df237ad0eaf..ce6ae2fba993 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -36,43 +36,24 @@
  */
 
 #define VCO_REF_CLK_RATE		19200000
-
-struct dsi_pll_regs {
-	u32 pll_prop_gain_rate;
-	u32 pll_lockdet_rate;
-	u32 decimal_div_start;
-	u32 frac_div_start_low;
-	u32 frac_div_start_mid;
-	u32 frac_div_start_high;
-	u32 pll_clock_inverters;
-	u32 ssc_stepsize_low;
-	u32 ssc_stepsize_high;
-	u32 ssc_div_per_low;
-	u32 ssc_div_per_high;
-	u32 ssc_adjper_low;
-	u32 ssc_adjper_high;
-	u32 ssc_control;
-};
+#define FRAC_BITS 18
 
 /* Hardware is V4.1 */
 #define DSI_PHY_7NM_QUIRK_V4_1		BIT(0)
 
 struct dsi_pll_config {
-	u32 ref_freq;
-	bool div_override;
-	u32 output_div;
-	bool ignore_frac;
-	bool disable_prescaler;
 	bool enable_ssc;
 	bool ssc_center;
-	u32 dec_bits;
-	u32 frac_bits;
-	u32 lock_timer;
 	u32 ssc_freq;
 	u32 ssc_offset;
 	u32 ssc_adj_per;
-	u32 thresh_cycles;
-	u32 refclk_cycles;
+
+	/* out */
+	u32 decimal_div_start;
+	u32 frac_div_start;
+	u32 pll_clock_inverters;
+	u32 ssc_stepsize;
+	u32 ssc_div_per;
 };
 
 struct pll_7nm_cached_state {
@@ -88,15 +69,11 @@ struct dsi_pll_7nm {
 
 	struct msm_dsi_phy *phy;
 
-	u64 vco_ref_clk_rate;
 	u64 vco_current_rate;
 
 	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
-	struct dsi_pll_config pll_configuration;
-	struct dsi_pll_regs reg_setup;
-
 	struct pll_7nm_cached_state cached_state;
 
 	struct dsi_pll_7nm *slave;
@@ -110,35 +87,20 @@ struct dsi_pll_7nm {
  */
 static struct dsi_pll_7nm *pll_7nm_list[DSI_MAX];
 
-static void dsi_pll_setup_config(struct dsi_pll_7nm *pll)
+static void dsi_pll_setup_config(struct dsi_pll_config *config)
 {
-	struct dsi_pll_config *config = &pll->pll_configuration;
-
-	config->ref_freq = pll->vco_ref_clk_rate;
-	config->output_div = 1;
-	config->dec_bits = 8;
-	config->frac_bits = 18;
-	config->lock_timer = 64;
 	config->ssc_freq = 31500;
 	config->ssc_offset = 4800;
 	config->ssc_adj_per = 2;
-	config->thresh_cycles = 32;
-	config->refclk_cycles = 256;
-
-	config->div_override = false;
-	config->ignore_frac = false;
-	config->disable_prescaler = false;
 
 	/* TODO: ssc enable */
 	config->enable_ssc = false;
 	config->ssc_center = 0;
 }
 
-static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll)
+static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config *config)
 {
-	struct dsi_pll_config *config = &pll->pll_configuration;
-	struct dsi_pll_regs *regs = &pll->reg_setup;
-	u64 fref = pll->vco_ref_clk_rate;
+	u64 fref = VCO_REF_CLK_RATE;
 	u64 pll_freq;
 	u64 divider;
 	u64 dec, dec_multiple;
@@ -147,42 +109,34 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll)
 
 	pll_freq = pll->vco_current_rate;
 
-	if (config->disable_prescaler)
-		divider = fref;
-	else
-		divider = fref * 2;
+	divider = fref * 2;
 
-	multiplier = 1 << config->frac_bits;
+	multiplier = 1 << FRAC_BITS;
 	dec_multiple = div_u64(pll_freq * multiplier, divider);
 	div_u64_rem(dec_multiple, multiplier, &frac);
 
 	dec = div_u64(dec_multiple, multiplier);
 
 	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1))
-		regs->pll_clock_inverters = 0x28;
+		config->pll_clock_inverters = 0x28;
 	else if (pll_freq <= 1000000000ULL)
-		regs->pll_clock_inverters = 0xa0;
+		config->pll_clock_inverters = 0xa0;
 	else if (pll_freq <= 2500000000ULL)
-		regs->pll_clock_inverters = 0x20;
+		config->pll_clock_inverters = 0x20;
 	else if (pll_freq <= 3020000000ULL)
-		regs->pll_clock_inverters = 0x00;
+		config->pll_clock_inverters = 0x00;
 	else
-		regs->pll_clock_inverters = 0x40;
+		config->pll_clock_inverters = 0x40;
 
-	regs->pll_lockdet_rate = config->lock_timer;
-	regs->decimal_div_start = dec;
-	regs->frac_div_start_low = (frac & 0xff);
-	regs->frac_div_start_mid = (frac & 0xff00) >> 8;
-	regs->frac_div_start_high = (frac & 0x30000) >> 16;
+	config->decimal_div_start = dec;
+	config->frac_div_start = frac;
 }
 
 #define SSC_CENTER		BIT(0)
 #define SSC_EN			BIT(1)
 
-static void dsi_pll_calc_ssc(struct dsi_pll_7nm *pll)
+static void dsi_pll_calc_ssc(struct dsi_pll_7nm *pll, struct dsi_pll_config *config)
 {
-	struct dsi_pll_config *config = &pll->pll_configuration;
-	struct dsi_pll_regs *regs = &pll->reg_setup;
 	u32 ssc_per;
 	u32 ssc_mod;
 	u64 ssc_step_size;
@@ -193,58 +147,49 @@ static void dsi_pll_calc_ssc(struct dsi_pll_7nm *pll)
 		return;
 	}
 
-	ssc_per = DIV_ROUND_CLOSEST(config->ref_freq, config->ssc_freq) / 2 - 1;
+	ssc_per = DIV_ROUND_CLOSEST(VCO_REF_CLK_RATE, config->ssc_freq) / 2 - 1;
 	ssc_mod = (ssc_per + 1) % (config->ssc_adj_per + 1);
 	ssc_per -= ssc_mod;
 
-	frac = regs->frac_div_start_low |
-			(regs->frac_div_start_mid << 8) |
-			(regs->frac_div_start_high << 16);
-	ssc_step_size = regs->decimal_div_start;
-	ssc_step_size *= (1 << config->frac_bits);
+	frac = config->frac_div_start;
+	ssc_step_size = config->decimal_div_start;
+	ssc_step_size *= (1 << FRAC_BITS);
 	ssc_step_size += frac;
 	ssc_step_size *= config->ssc_offset;
 	ssc_step_size *= (config->ssc_adj_per + 1);
 	ssc_step_size = div_u64(ssc_step_size, (ssc_per + 1));
 	ssc_step_size = DIV_ROUND_CLOSEST_ULL(ssc_step_size, 1000000);
 
-	regs->ssc_div_per_low = ssc_per & 0xFF;
-	regs->ssc_div_per_high = (ssc_per & 0xFF00) >> 8;
-	regs->ssc_stepsize_low = (u32)(ssc_step_size & 0xFF);
-	regs->ssc_stepsize_high = (u32)((ssc_step_size & 0xFF00) >> 8);
-	regs->ssc_adjper_low = config->ssc_adj_per & 0xFF;
-	regs->ssc_adjper_high = (config->ssc_adj_per & 0xFF00) >> 8;
-
-	regs->ssc_control = config->ssc_center ? SSC_CENTER : 0;
+	config->ssc_div_per = ssc_per;
+	config->ssc_stepsize = ssc_step_size;
 
 	pr_debug("SCC: Dec:%d, frac:%llu, frac_bits:%d\n",
-		 regs->decimal_div_start, frac, config->frac_bits);
+		 config->decimal_div_start, frac, FRAC_BITS);
 	pr_debug("SSC: div_per:0x%X, stepsize:0x%X, adjper:0x%X\n",
 		 ssc_per, (u32)ssc_step_size, config->ssc_adj_per);
 }
 
-static void dsi_pll_ssc_commit(struct dsi_pll_7nm *pll)
+static void dsi_pll_ssc_commit(struct dsi_pll_7nm *pll, struct dsi_pll_config *config)
 {
 	void __iomem *base = pll->phy->pll_base;
-	struct dsi_pll_regs *regs = &pll->reg_setup;
 
-	if (pll->pll_configuration.enable_ssc) {
+	if (config->enable_ssc) {
 		pr_debug("SSC is enabled\n");
 
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_LOW_1,
-			  regs->ssc_stepsize_low);
+			  config->ssc_stepsize & 0xff);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_HIGH_1,
-			  regs->ssc_stepsize_high);
+			  config->ssc_stepsize >> 8);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_LOW_1,
-			  regs->ssc_div_per_low);
+			  config->ssc_div_per & 0xff);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_HIGH_1,
-			  regs->ssc_div_per_high);
+			  config->ssc_div_per >> 8);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_ADJPER_LOW_1,
-			  regs->ssc_adjper_low);
+			  config->ssc_adj_per & 0xff);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_ADJPER_HIGH_1,
-			  regs->ssc_adjper_high);
+			  config->ssc_adj_per >> 8);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_CONTROL,
-			  SSC_EN | regs->ssc_control);
+			  SSC_EN | (config->ssc_center ? SSC_CENTER : 0));
 	}
 }
 
@@ -296,44 +241,46 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 	}
 }
 
-static void dsi_pll_commit(struct dsi_pll_7nm *pll)
+static void dsi_pll_commit(struct dsi_pll_7nm *pll, struct dsi_pll_config *config)
 {
 	void __iomem *base = pll->phy->pll_base;
-	struct dsi_pll_regs *reg = &pll->reg_setup;
 
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CORE_INPUT_OVERRIDE, 0x12);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1, reg->decimal_div_start);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1, reg->frac_div_start_low);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1, reg->frac_div_start_mid);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1, reg->frac_div_start_high);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1, reg->pll_lockdet_rate);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1, config->decimal_div_start);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1,
+		  config->frac_div_start & 0xff);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1,
+		  (config->frac_div_start & 0xff00) >> 8);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1,
+		  (config->frac_div_start & 0x30000) >> 16);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1, 0x40);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CMODE_1, 0x10); /* TODO: 0x00 for CPHY */
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS, reg->pll_clock_inverters);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS, config->pll_clock_inverters);
 }
 
 static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 				     unsigned long parent_rate)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
+	struct dsi_pll_config config;
 
 	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_7nm->phy->id, rate,
 	    parent_rate);
 
 	pll_7nm->vco_current_rate = rate;
-	pll_7nm->vco_ref_clk_rate = VCO_REF_CLK_RATE;
 
-	dsi_pll_setup_config(pll_7nm);
+	dsi_pll_setup_config(&config);
 
-	dsi_pll_calc_dec_frac(pll_7nm);
+	dsi_pll_calc_dec_frac(pll_7nm, &config);
 
-	dsi_pll_calc_ssc(pll_7nm);
+	dsi_pll_calc_ssc(pll_7nm, &config);
 
-	dsi_pll_commit(pll_7nm);
+	dsi_pll_commit(pll_7nm, &config);
 
 	dsi_pll_config_hzindep_reg(pll_7nm);
 
-	dsi_pll_ssc_commit(pll_7nm);
+	dsi_pll_ssc_commit(pll_7nm, &config);
 
 	/* flush, ensure all register writes are done*/
 	wmb();
@@ -486,9 +433,8 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 						  unsigned long parent_rate)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
-	struct dsi_pll_config *config = &pll_7nm->pll_configuration;
 	void __iomem *base = pll_7nm->phy->pll_base;
-	u64 ref_clk = pll_7nm->vco_ref_clk_rate;
+	u64 ref_clk = VCO_REF_CLK_RATE;
 	u64 vco_rate = 0x0;
 	u64 multiplier;
 	u32 frac;
@@ -508,7 +454,7 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	 * TODO:
 	 *	1. Assumes prescaler is disabled
 	 */
-	multiplier = 1 << config->frac_bits;
+	multiplier = 1 << FRAC_BITS;
 	pll_freq = dec * (ref_clk * 2);
 	tmp64 = (ref_clk * 2 * frac);
 	pll_freq += div_u64(tmp64, multiplier);
@@ -590,7 +536,7 @@ static int dsi_7nm_restore_state(struct msm_dsi_phy *phy)
 	val |= cached->pll_mux;
 	dsi_phy_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, val);
 
-	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw, pll_7nm->vco_current_rate, pll_7nm->vco_ref_clk_rate);
+	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw, pll_7nm->vco_current_rate, VCO_REF_CLK_RATE);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_7nm->phy->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
