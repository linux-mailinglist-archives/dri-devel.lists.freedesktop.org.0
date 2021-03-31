Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6AE34FE75
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 12:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383156EA5F;
	Wed, 31 Mar 2021 10:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A086EA53
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 10:57:45 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id v15so28509121lfq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 03:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S8rpSS2be5lN0Izvm9kgNORL2zodlH4XKm6J+SVNAvg=;
 b=Zd0ptWmWGA46hZ2wZ37WJYdSOBR3Zi/tCW4LRx3/jjf+S6zaU457SQVkmb4qyUDQ1w
 vaxqTfNrMqd6fAhMae178KJsC/rRieUrCktUGLWWX8NjUkW7f1214cFGlGY45yWZGLBm
 3QPdpkfsdxrGnfuTEyXw4riynaF9pl4W21Px00wLznkqdak1jUBAmNzlxYiymfxA89LI
 81DVTvBgWeOWdHs8PKXZurZz/TTCSm9L4SK4VsbvS3QOluoFrhEq2qKe80r+BE+sgpqt
 BR76RuKBihvcYt6aGRRfYZy/rSbky+C4mjvoaPhs4RVOpQei9/Ns3tvhQze0NukUdSpg
 EJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S8rpSS2be5lN0Izvm9kgNORL2zodlH4XKm6J+SVNAvg=;
 b=IkNhYKqwQOYyfSV+Bza8jwMjaG2HAGHXJxX9UvLik0b73BZ4HIJjcANcWy2KZ+1hTz
 GA6pVVXabr7t7S3GI0ZsiGV2Jo6I4McTvSkE2y4FAPDL4HPEatwAuuVonBsaGKhJxzr6
 fZPX2/tniUVZKDnuIRo5fP/lgfXYLi7CUhklvTiCp668D892K2OftBm+TcYIq+QEBYds
 cSWibefmPsJJh2m9qhbXUIr9/5nWmNrBH+Dlx1qUOOu31biwBq+6mR+9kWQD7s7vDLBT
 R/BgNF5/afaqG5DpYxEwLn7fFEV0QbHreZZ4j8N66Dc4JWZ7fjdLZU7deJH3WFN3TRqC
 dNoA==
X-Gm-Message-State: AOAM531XBvcf4UdZk9FqaRHEnvNDYQDowxaiesWlvy92YG7e9SnKrvEH
 jED8r3gnf+v8kGOnRLC/Hb0q1A==
X-Google-Smtp-Source: ABdhPJyRLPB6HwX5KgX/kxNfe0Eg70wS0mZc9mDqRXe6+2vEfJzJwxcnytRMESWKff/7GNkoNW3fCw==
X-Received: by 2002:a19:4cc1:: with SMTP id z184mr1796690lfa.599.1617188264391; 
 Wed, 31 Mar 2021 03:57:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 03:57:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v4 08/24] drm/msm/dsi: move min/max PLL rate to phy config
Date: Wed, 31 Mar 2021 13:57:19 +0300
Message-Id: <20210331105735.3690009-9-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |  3 +++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      |  6 ++++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      |  6 ++++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      |  8 ++++++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  4 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 12 ++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c           |  8 ++++----
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.h           |  3 ---
 8 files changed, 27 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 39abb86446f9..000e4207dabc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -38,6 +38,9 @@ struct msm_dsi_phy_cfg {
 	struct msm_dsi_phy_ops ops;
 	const struct msm_dsi_pll_ops pll_ops;
 
+	unsigned long	min_pll_rate;
+	unsigned long	max_pll_rate;
+
 	/*
 	 * Each cell {phy_id, pll_id} of the truth table indicates
 	 * if the source PLL selection bit should be set for each PHY.
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index dc8ccc994759..5f9d0cfc4e03 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -864,8 +864,6 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 	spin_lock_init(&pll_10nm->postdiv_lock);
 
 	pll = &pll_10nm->base;
-	pll->min_rate = 1000000000UL;
-	pll->max_rate = 3500000000UL;
 	pll->cfg = phy->cfg;
 
 	pll_10nm->vco_delay = 1;
@@ -1113,6 +1111,8 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 		.restore_state = dsi_pll_10nm_restore_state,
 		.set_usecase = dsi_pll_10nm_set_usecase,
 	},
+	.min_pll_rate = 1000000000UL,
+	.max_pll_rate = 3500000000UL,
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
 };
@@ -1138,6 +1138,8 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 		.restore_state = dsi_pll_10nm_restore_state,
 		.set_usecase = dsi_pll_10nm_set_usecase,
 	},
+	.min_pll_rate = 1000000000UL,
+	.max_pll_rate = 3500000000UL,
 	.io_start = { 0xc994400, 0xc996400 },
 	.num_dsi_phy = 2,
 	.quirks = DSI_PHY_10NM_QUIRK_OLD_TIMINGS,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index d78f846cf8e4..8e4528301e5d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1078,8 +1078,6 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy *phy)
 	spin_lock_init(&pll_14nm->postdiv_lock);
 
 	pll = &pll_14nm->base;
-	pll->min_rate = VCO_MIN_RATE;
-	pll->max_rate = VCO_MAX_RATE;
 	pll->cfg = phy->cfg;
 
 	pll_14nm->vco_delay = 1;
@@ -1237,6 +1235,8 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 		.disable_seq = dsi_pll_14nm_disable_seq,
 		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
 	.io_start = { 0x994400, 0x996400 },
 	.num_dsi_phy = 2,
 };
@@ -1264,6 +1264,8 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 		.disable_seq = dsi_pll_14nm_disable_seq,
 		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
 	.io_start = { 0xc994400, 0xc996000 },
 	.num_dsi_phy = 2,
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index bb33261d606d..d267b25e5da0 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -625,8 +625,6 @@ static int dsi_pll_28nm_init(struct msm_dsi_phy *phy)
 	}
 
 	pll = &pll_28nm->base;
-	pll->min_rate = VCO_MIN_RATE;
-	pll->max_rate = VCO_MAX_RATE;
 	if (phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
 		pll_28nm->vco_delay = 1000;
 	else
@@ -811,6 +809,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 		.disable_seq = dsi_pll_28nm_disable_seq,
 		.enable_seq = dsi_pll_28nm_enable_seq_hpm,
 	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
 	.io_start = { 0xfd922b00, 0xfd923100 },
 	.num_dsi_phy = 2,
 };
@@ -837,6 +837,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 		.disable_seq = dsi_pll_28nm_disable_seq,
 		.enable_seq = dsi_pll_28nm_enable_seq_hpm,
 	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
 	.io_start = { 0x1a94400, 0x1a96400 },
 	.num_dsi_phy = 2,
 };
@@ -863,6 +865,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 		.disable_seq = dsi_pll_28nm_disable_seq,
 		.enable_seq = dsi_pll_28nm_enable_seq_lp,
 	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
 	.io_start = { 0x1a98500 },
 	.num_dsi_phy = 1,
 	.quirks = DSI_PHY_28NM_QUIRK_PHY_LP,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 79b0842a8dc4..31e7910c6050 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -508,8 +508,6 @@ static int dsi_pll_28nm_8960_init(struct msm_dsi_phy *phy)
 	}
 
 	pll = &pll_28nm->base;
-	pll->min_rate = VCO_MIN_RATE;
-	pll->max_rate = VCO_MAX_RATE;
 
 	pll->cfg = phy->cfg;
 
@@ -711,6 +709,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
 		.disable_seq = dsi_pll_28nm_disable_seq,
 		.enable_seq = dsi_pll_28nm_enable_seq,
 	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
 	.io_start = { 0x4700300, 0x5800300 },
 	.num_dsi_phy = 2,
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 44ae495e8fca..4831d6769da7 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -889,14 +889,6 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	spin_lock_init(&pll_7nm->postdiv_lock);
 
 	pll = &pll_7nm->base;
-	pll->min_rate = 1000000000UL;
-	pll->max_rate = 3500000000UL;
-	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
-		pll->min_rate = 600000000UL;
-		pll->max_rate = (unsigned long)5000000000ULL;
-		/* workaround for max rate overflowing on 32-bit builds: */
-		pll->max_rate = max(pll->max_rate, 0xffffffffUL);
-	}
 	pll->cfg = phy->cfg;
 
 	pll_7nm->vco_delay = 1;
@@ -1152,6 +1144,8 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		.restore_state = dsi_pll_7nm_restore_state,
 		.set_usecase = dsi_pll_7nm_set_usecase,
 	},
+	.min_pll_rate = 600000000UL,
+	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : ULONG_MAX,
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
 	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
@@ -1178,6 +1172,8 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 		.restore_state = dsi_pll_7nm_restore_state,
 		.set_usecase = dsi_pll_7nm_set_usecase,
 	},
+	.min_pll_rate = 1000000000UL,
+	.max_pll_rate = 3500000000UL,
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
index c7ff0eba0e8b..e607adffe001 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
@@ -14,10 +14,10 @@ long msm_dsi_pll_helper_clk_round_rate(struct clk_hw *hw,
 {
 	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
 
-	if      (rate < pll->min_rate)
-		return  pll->min_rate;
-	else if (rate > pll->max_rate)
-		return  pll->max_rate;
+	if      (rate < pll->cfg->min_pll_rate)
+		return  pll->cfg->min_pll_rate;
+	else if (rate > pll->cfg->max_pll_rate)
+		return  pll->cfg->max_pll_rate;
 	else
 		return rate;
 }
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
index 4fa73fbcba52..8306911f8318 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
@@ -18,9 +18,6 @@ struct msm_dsi_pll {
 	bool		pll_on;
 	bool		state_saved;
 
-	unsigned long	min_rate;
-	unsigned long	max_rate;
-
 	const struct msm_dsi_phy_cfg *cfg;
 };
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
