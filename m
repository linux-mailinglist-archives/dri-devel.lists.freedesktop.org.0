Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CBD347BFD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BD96EC71;
	Wed, 24 Mar 2021 15:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB8F6EC6E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:19:17 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id v15so2359962lfq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+G6RajVDTexx6T3+eLMEAHUipQEnluOhy+kbnsltVko=;
 b=rG6mF1kw7DwvEo3ge82WEUpCo3/YQYrxkzIu/d/vWrD6/xqfc54tbh518JH7NukZH8
 KordxQoeI1MU7UPM/qhqc813hk0gO1GCCBmgHWUHjWT4SWuCZ88R7zWohro6K8QrCKwp
 PwSNy0LQtQ8G94ynwfXi5Xd0cyIDgfO1HlivQGLeqlgQSx358uLoILh0T5VRl+vKdDL6
 dEWAhSupdiHbgpmSEqsqSMRm38fKgkGqGB7H/RplOO49vvlRyivf6RWaRGm5dFqr+DUr
 qnZcNps7BEMkXhL5VgWc2NyoWPkX7FZG0mMQAFEXcDO4YMxGoUeWVhm0jg283zmp+h+J
 FaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+G6RajVDTexx6T3+eLMEAHUipQEnluOhy+kbnsltVko=;
 b=WaNo2ivr0LA4N8JHRL3bgFQGFw7lRMaxfdkjqZzTwwfX2CKA+vzCTDU1+hnmi161MX
 hY73y3WlhyccyTbI33lK9FCWHxWuiLfPJ/tU1TYJOfUQMxtq00DW2C8FPdKIMgpxgK44
 JPhY6rai9WF2EaWynqhsdIUExoPDJfEXvAor/+rt5LEHE/9EyKTVBlErg9YLFJfW9FWd
 sZ3Y+U6ROW0tHBOuYWL+ZTzprEbEJEelFd88f+dVsL7bE/4zaRj4DK5K3FVRioanDktl
 TvY1j7Ae151VukbV/ULwKTWWjzwOf/0X70e8S0GOsSxYq8Sq0XOtgHmtZPyqCX1qUOGV
 pw5w==
X-Gm-Message-State: AOAM5328oUivUK4YIlNZfaOwddUYf2Qc4i7IjvM4H24xNAS3PojL4Cw1
 ZlxDcJg3aMDqkeDmI3LR5MRN3g==
X-Google-Smtp-Source: ABdhPJzBoelMtrVQqw/rpTJkSNi4aQwxGhbxsuouDF2xrXjUisu8T3n1yy/C1moizfLPQMQ7ZgOcDA==
X-Received: by 2002:a05:6512:1108:: with SMTP id
 l8mr2343371lfg.592.1616599155725; 
 Wed, 24 Mar 2021 08:19:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:19:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 06/28] drm/msm/dsi: drop multiple pll enable_seq support
Date: Wed, 24 Mar 2021 18:18:24 +0300
Message-Id: <20210324151846.2774204-7-dmitry.baryshkov@linaro.org>
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

The only PLL using multiple enable sequences is the 28nm PLL, which just
does the single step in the loop. Push that support back into the PLL
code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  3 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 23 +++++--
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  3 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         | 65 +++++++------------
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.h         |  4 +-
 5 files changed, 42 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 6a63901da7a4..4386edfa91fe 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1087,8 +1087,7 @@ struct msm_dsi_pll *msm_dsi_pll_14nm_init(struct platform_device *pdev, int id)
 
 	pll_14nm->vco_delay = 1;
 
-	pll->en_seq_cnt = 1;
-	pll->enable_seqs[0] = dsi_pll_14nm_enable_seq;
+	pll->enable_seq = dsi_pll_14nm_enable_seq;
 
 	ret = pll_14nm_register(pll_14nm);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 2f502efa4dd5..760cf7956fa2 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -311,7 +311,7 @@ static const struct clk_ops clk_ops_dsi_pll_28nm_vco = {
 /*
  * PLL Callbacks
  */
-static int dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
+static int _dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
 	struct device *dev = &pll_28nm->pdev->dev;
@@ -386,6 +386,19 @@ static int dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
 	return locked ? 0 : -EINVAL;
 }
 
+static int dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
+{
+	int i, ret;
+
+	for (i = 0; i < 3; i++) {
+		ret = _dsi_pll_28nm_enable_seq_hpm(pll);
+		if (!ret)
+			return 0;
+	}
+
+	return ret;
+}
+
 static int dsi_pll_28nm_enable_seq_lp(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
@@ -619,15 +632,11 @@ struct msm_dsi_pll *msm_dsi_pll_28nm_init(struct platform_device *pdev,
 	if (type == MSM_DSI_PHY_28NM_HPM) {
 		pll_28nm->vco_delay = 1;
 
-		pll->en_seq_cnt = 3;
-		pll->enable_seqs[0] = dsi_pll_28nm_enable_seq_hpm;
-		pll->enable_seqs[1] = dsi_pll_28nm_enable_seq_hpm;
-		pll->enable_seqs[2] = dsi_pll_28nm_enable_seq_hpm;
+		pll->enable_seq = dsi_pll_28nm_enable_seq_hpm;
 	} else if (type == MSM_DSI_PHY_28NM_LP) {
 		pll_28nm->vco_delay = 1000;
 
-		pll->en_seq_cnt = 1;
-		pll->enable_seqs[0] = dsi_pll_28nm_enable_seq_lp;
+		pll->enable_seq = dsi_pll_28nm_enable_seq_lp;
 	} else {
 		DRM_DEV_ERROR(&pdev->dev, "phy type (%d) is not 28nm\n", type);
 		return ERR_PTR(-EINVAL);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 4a40513057e8..2cfb7edf91d8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -515,8 +515,7 @@ struct msm_dsi_pll *msm_dsi_pll_28nm_8960_init(struct platform_device *pdev,
 	pll->save_state = dsi_pll_28nm_save_state;
 	pll->restore_state = dsi_pll_28nm_restore_state;
 
-	pll->en_seq_cnt = 1;
-	pll->enable_seqs[0] = dsi_pll_28nm_enable_seq;
+	pll->enable_seq = dsi_pll_28nm_enable_seq;
 
 	ret = pll_28nm_register(pll_28nm);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
index 3dc65877fa10..9e9fa90bf504 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
@@ -5,46 +5,6 @@
 
 #include "dsi_pll.h"
 
-static int dsi_pll_enable(struct msm_dsi_pll *pll)
-{
-	int i, ret = 0;
-
-	/*
-	 * Certain PLLs do not allow VCO rate update when it is on.
-	 * Keep track of their status to turn on/off after set rate success.
-	 */
-	if (unlikely(pll->pll_on))
-		return 0;
-
-	/* Try all enable sequences until one succeeds */
-	for (i = 0; i < pll->en_seq_cnt; i++) {
-		ret = pll->enable_seqs[i](pll);
-		DBG("DSI PLL %s after sequence #%d",
-			ret ? "unlocked" : "locked", i + 1);
-		if (!ret)
-			break;
-	}
-
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
-static void dsi_pll_disable(struct msm_dsi_pll *pll)
-{
-	if (unlikely(!pll->pll_on))
-		return;
-
-	pll->disable_seq(pll);
-
-	pll->pll_on = false;
-}
-
 /*
  * DSI PLL Helper functions
  */
@@ -64,15 +24,36 @@ long msm_dsi_pll_helper_clk_round_rate(struct clk_hw *hw,
 int msm_dsi_pll_helper_clk_prepare(struct clk_hw *hw)
 {
 	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
+	int ret = 0;
 
-	return dsi_pll_enable(pll);
+	/*
+	 * Certain PLLs do not allow VCO rate update when it is on.
+	 * Keep track of their status to turn on/off after set rate success.
+	 */
+	if (unlikely(pll->pll_on))
+		return 0;
+
+	ret = pll->enable_seq(pll);
+	if (ret) {
+		DRM_ERROR("DSI PLL failed to lock\n");
+		return ret;
+	}
+
+	pll->pll_on = true;
+
+	return 0;
 }
 
 void msm_dsi_pll_helper_clk_unprepare(struct clk_hw *hw)
 {
 	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
 
-	dsi_pll_disable(pll);
+	if (unlikely(!pll->pll_on))
+		return;
+
+	pll->disable_seq(pll);
+
+	pll->pll_on = false;
 }
 
 void msm_dsi_pll_helper_unregister_clks(struct platform_device *pdev,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
index bbecb1de5678..eebf90671eec 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
@@ -12,7 +12,6 @@
 #include "dsi.h"
 
 #define NUM_DSI_CLOCKS_MAX	6
-#define MAX_DSI_PLL_EN_SEQS	10
 
 struct msm_dsi_pll {
 	enum msm_dsi_phy_type type;
@@ -23,9 +22,8 @@ struct msm_dsi_pll {
 
 	unsigned long	min_rate;
 	unsigned long	max_rate;
-	u32		en_seq_cnt;
 
-	int (*enable_seqs[MAX_DSI_PLL_EN_SEQS])(struct msm_dsi_pll *pll);
+	int (*enable_seq)(struct msm_dsi_pll *pll);
 	void (*disable_seq)(struct msm_dsi_pll *pll);
 	int (*get_provider)(struct msm_dsi_pll *pll,
 			struct clk **byte_clk_provider,
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
