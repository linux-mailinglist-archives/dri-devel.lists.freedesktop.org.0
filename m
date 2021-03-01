Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA41329511
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 00:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D198289F45;
	Mon,  1 Mar 2021 23:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB9B89E2B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 23:26:13 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id n16so11385526lfb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 15:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C+sanPRPi7tt5+QypqmhTGyDeBzZEvXRBpIp6Pvj4IM=;
 b=GvuFp8Q+uX7/NijjSlzfPfnuueaWv+zhUWCa49ZhJHSTWxxzk6ZU6CwA0TZiDbCV0s
 6TslXHlpB9vHs0onPxRd0xqpEX7AfkE3pI4dg5bslDNtBkkzRxU59v0cmWw0s/5aQezh
 HTY8WAzXXMQyuq338cp8B8UVmbil2M40mK1xqjxk2C96mE2b0rbWnWnwmmvryAQCaGn8
 UaQneJXQZoqo7lQYBx1oIGKW3RJM5+oTcGSGBNkhNJqBrDav2DtLNqRrH2hvOUGdshDy
 H3g261v4a7UxHPNaN+Mne6Qxk43YEdR3hkQeUMmqJAaa9WBCTwHL9TC9KPtGPqSn2B/9
 NJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C+sanPRPi7tt5+QypqmhTGyDeBzZEvXRBpIp6Pvj4IM=;
 b=YnR2oB3YcW/JFRniWSYLsJee21/C/YQAx7JGYZmYG/O3Gecp8St88dwLjsRfNJCWbE
 1lzytsIr4uHBc8o5k/T+cHLt6JoXL44MmbrpOXoq8Sen6NTVTlzGM1Bqp8eI245apwi+
 pzs4QDa5+UCHGueFFE3pE8G8NHTi02pMvrRXBa7JUiAL32BV4+0eIREs7S56H3tNsDA2
 kTK4mLL7QDC6G64Pf6yVtsFsgYbkVFqrihBwX6RweZFWbcbyj7KVZxRbr+3ofwy3uVb8
 8PekNp9/NAQ258R2jiUmyg8rhm2EH8oAMMjF1XLf2qxdvl7tvcsTWTZgBVM8PUir92c7
 1y+Q==
X-Gm-Message-State: AOAM530GmXdoB5YLUrSCAoEtS9EnuusF3UNcUxggoOi+bLw7VmV8lDp+
 9fXioQSGfYjARtUrkKlRtyISKg==
X-Google-Smtp-Source: ABdhPJwQicno6Ukl61EMPuPs8PcRXUYJBelIS7JR0n2c2/ByrrbPVNDW2Z+QQP2k3/gleaB/xQIzaQ==
X-Received: by 2002:a19:2258:: with SMTP id i85mr11054483lfi.516.1614641171491; 
 Mon, 01 Mar 2021 15:26:11 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 15:26:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [RFC 04/24] drm/msm/dsi: move min/max PLL rate to phy config
Date: Tue,  2 Mar 2021 02:24:47 +0300
Message-Id: <20210301232506.3057401-5-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |  3 +++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      |  6 ++++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      |  6 ++++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 10 ++++++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  4 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 12 ++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c           |  8 ++++----
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.h           |  3 ---
 8 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 45ab2f23ac5b..ce2969c63927 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -43,6 +43,9 @@ struct msm_dsi_phy_cfg {
 	struct msm_dsi_phy_ops ops;
 	const struct msm_dsi_pll_ops pll_ops;
 
+	unsigned long	min_pll_rate;
+	unsigned long	max_pll_rate;
+
 	/*
 	 * Each cell {phy_id, pll_id} of the truth table indicates
 	 * if the source PLL selection bit should be set for each PHY.
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 49eb1440a269..799d7f44cf6d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -861,8 +861,6 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 	spin_lock_init(&pll_10nm->postdiv_lock);
 
 	pll = &pll_10nm->base;
-	pll->min_rate = 1000000000UL;
-	pll->max_rate = 3500000000UL;
 	pll->cfg = phy->cfg;
 
 	pll_10nm->vco_delay = 1;
@@ -1126,6 +1124,8 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 		.restore_state = dsi_pll_10nm_restore_state,
 		.set_usecase = dsi_pll_10nm_set_usecase,
 	},
+	.min_pll_rate = 1000000000UL,
+	.max_pll_rate = 3500000000UL,
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
 };
@@ -1152,6 +1152,8 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 		.restore_state = dsi_pll_10nm_restore_state,
 		.set_usecase = dsi_pll_10nm_set_usecase,
 	},
+	.min_pll_rate = 1000000000UL,
+	.max_pll_rate = 3500000000UL,
 	.io_start = { 0xc994400, 0xc996400 },
 	.num_dsi_phy = 2,
 	.quirks = V3_0_0_10NM_OLD_TIMINGS_QUIRK,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 82e5d225d83e..cd66b01ad17d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1078,8 +1078,6 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy *phy)
 	spin_lock_init(&pll_14nm->postdiv_lock);
 
 	pll = &pll_14nm->base;
-	pll->min_rate = VCO_MIN_RATE;
-	pll->max_rate = VCO_MAX_RATE;
 	pll->cfg = phy->cfg;
 
 	pll_14nm->vco_delay = 1;
@@ -1253,6 +1251,8 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 		.disable_seq = dsi_pll_14nm_disable_seq,
 		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
 	.io_start = { 0x994400, 0x996400 },
 	.num_dsi_phy = 2,
 };
@@ -1281,6 +1281,8 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 		.disable_seq = dsi_pll_14nm_disable_seq,
 		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
 	.io_start = { 0xc994400, 0xc996000 },
 	.num_dsi_phy = 2,
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 7330672d95c0..4ddb68f5a82a 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -622,8 +622,6 @@ static int dsi_pll_28nm_hpm_init(struct msm_dsi_phy *phy)
 	}
 
 	pll = &pll_28nm->base;
-	pll->min_rate = VCO_MIN_RATE;
-	pll->max_rate = VCO_MAX_RATE;
 	pll_28nm->vco_delay = 1;
 
 	pll->cfg = phy->cfg;
@@ -664,8 +662,6 @@ static int dsi_pll_28nm_lp_init(struct msm_dsi_phy *phy)
 	}
 
 	pll = &pll_28nm->base;
-	pll->min_rate = VCO_MIN_RATE;
-	pll->max_rate = VCO_MAX_RATE;
 	pll_28nm->vco_delay = 1000;
 
 	pll->cfg = phy->cfg;
@@ -849,6 +845,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 		.disable_seq = dsi_pll_28nm_disable_seq,
 		.enable_seq = dsi_pll_28nm_enable_seq_hpm,
 	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
 	.io_start = { 0xfd922b00, 0xfd923100 },
 	.num_dsi_phy = 2,
 };
@@ -876,6 +874,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 		.disable_seq = dsi_pll_28nm_disable_seq,
 		.enable_seq = dsi_pll_28nm_enable_seq_hpm,
 	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
 	.io_start = { 0x1a94400, 0x1a96400 },
 	.num_dsi_phy = 2,
 };
@@ -903,6 +903,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 		.disable_seq = dsi_pll_28nm_disable_seq,
 		.enable_seq = dsi_pll_28nm_enable_seq_lp,
 	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
 	.io_start = { 0x1a98500 },
 	.num_dsi_phy = 1,
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index d6f8b1ee868b..bd2582575a07 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -508,8 +508,6 @@ static int dsi_pll_28nm_8960_init(struct msm_dsi_phy *phy)
 	}
 
 	pll = &pll_28nm->base;
-	pll->min_rate = VCO_MIN_RATE;
-	pll->max_rate = VCO_MAX_RATE;
 
 	pll->cfg = phy->cfg;
 
@@ -712,6 +710,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
 		.disable_seq = dsi_pll_28nm_disable_seq,
 		.enable_seq = dsi_pll_28nm_enable_seq,
 	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
 	.io_start = { 0x4700300, 0x5800300 },
 	.num_dsi_phy = 2,
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index e12f2f7a54ea..5e53682c4275 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -886,14 +886,6 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	spin_lock_init(&pll_7nm->postdiv_lock);
 
 	pll = &pll_7nm->base;
-	pll->min_rate = 1000000000UL;
-	pll->max_rate = 3500000000UL;
-	if (phy->cfg->type == MSM_DSI_PHY_7NM_V4_1) {
-		pll->min_rate = 600000000UL;
-		pll->max_rate = (unsigned long)5000000000ULL;
-		/* workaround for max rate overflowing on 32-bit builds: */
-		pll->max_rate = max(pll->max_rate, 0xffffffffUL);
-	}
 	pll->cfg = phy->cfg;
 
 	pll_7nm->vco_delay = 1;
@@ -1165,6 +1157,8 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		.restore_state = dsi_pll_7nm_restore_state,
 		.set_usecase = dsi_pll_7nm_set_usecase,
 	},
+	.min_pll_rate = 1000000000UL,
+	.max_pll_rate = 3500000000UL,
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
 };
@@ -1191,6 +1185,8 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 		.restore_state = dsi_pll_7nm_restore_state,
 		.set_usecase = dsi_pll_7nm_set_usecase,
 	},
+	.min_pll_rate = 600000000UL,
+	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : ULONG_MAX,
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
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
