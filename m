Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED7C33F35A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 15:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56E56E81E;
	Wed, 17 Mar 2021 14:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE5F6E7EF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 14:41:07 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id u20so3426940lja.13
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 07:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=leED0c6/QqZVvipJeEcp5/ipj8cvo5KvSpRWxNalI8k=;
 b=axo5z5rbRwLxdWNg015Ogp1UgigpaE/hm+V+BO4xneUdNs8nj/pCjSZGzK/akvBM1l
 KH13x2exVUOCe1uRnj5TnnKyuu+l+I6CDsiIKaNpC/9CoUjBWU8rNRBnd3POep2G6oBB
 uxrtRpeZMZWXDAe1aH2N+IqOzcGEGnqiOReeoZ6cnd/q5Zs8dYvWXPnU3De3Ba0K0orw
 QcRQwtba65J3el78FIu7dtb4TMRjo8bT+jR1igWRXZgcBvy/xUgTHeddSqK9L+zRNztQ
 L94PJb/1iURHz9dP+8x2IHSZ0LYTKzesCMal92WW7tSVA3A+X7j1KMygVAUw38HPbRZI
 9ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=leED0c6/QqZVvipJeEcp5/ipj8cvo5KvSpRWxNalI8k=;
 b=LNwRh07Mm8uBqPhuE4j1q6AW2lSQDD1I7REmJ8wV4WYJJDoHgznnNPkNNCsFzIxdwW
 gRv5GG5tp70VeX/c+ysUeECzCZ+vFvKJubq1cdGuXldKRGqS2pCRC6Udxe+iY+iQnLfz
 8f1HBGT3AjsmtjWvlg8UFeZERxt9Xt0dbvDz9IsV4H+9jBeM1bivPKZK8MJ3XUzxfU70
 zbmAIYBuVic+rN2a0aNi8o119iLk3oGWp1H61DuCoOGQ8JX7LDXp4u7B4b0GbO7AMNu3
 q97YMM31rxc8IM73Px9jWQOWhmhipd2+PYRg0gO8dhBAonlY7CUxYVHXxqCIzv1lULtm
 tafQ==
X-Gm-Message-State: AOAM532qWmficVCTy04+0O3+qtEMB20ZSAKxpQn3/w6jIhj8nnSIbFX0
 NkzEK4Q2U8WTjpDeYfzBDD1npw==
X-Google-Smtp-Source: ABdhPJyLDbs3xnc6s4NnWtaekVjFYRrM+FqAhyKDGpxlRYhyrQHLsPi2dQmH8XQeHG84Pfz+UUsgSA==
X-Received: by 2002:a2e:8e77:: with SMTP id t23mr2599243ljk.484.1615992066217; 
 Wed, 17 Mar 2021 07:41:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 07:41:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v1 25/26] drm/msm/dsi: inline msm_dsi_phy_set_src_pll
Date: Wed, 17 Mar 2021 17:40:38 +0300
Message-Id: <20210317144039.556409-26-dmitry.baryshkov@linaro.org>
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

The src_truthtable config is not used for some of phys, which use other
means of configuring the master/slave usecases. Inline this function
with the goal of removing src_pll_id argument in the next commit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           | 17 -----------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |  8 --------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      |  2 --
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 13 +++++++------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      | 11 +++++++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 13 +++++++------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  1 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       |  2 --
 8 files changed, 21 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 5b1cba4ba672..72c97c7173fe 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -461,23 +461,6 @@ int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
 	return 0;
 }
 
-void msm_dsi_phy_set_src_pll(struct msm_dsi_phy *phy, int pll_id, u32 reg,
-				u32 bit_mask)
-{
-	int phy_id = phy->id;
-	u32 val;
-
-	if ((phy_id >= DSI_MAX) || (pll_id >= DSI_MAX))
-		return;
-
-	val = dsi_phy_read(phy->base + reg);
-
-	if (phy->cfg->src_pll_truthtable[phy_id][pll_id])
-		dsi_phy_write(phy->base + reg, val | bit_mask);
-	else
-		dsi_phy_write(phy->base + reg, val & (~bit_mask));
-}
-
 static int dsi_phy_regulator_init(struct msm_dsi_phy *phy)
 {
 	struct regulator_bulk_data *s = phy->supplies;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 8e828c5ca8f4..3b207cf9f6b4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -33,12 +33,6 @@ struct msm_dsi_phy_cfg {
 	unsigned long	min_pll_rate;
 	unsigned long	max_pll_rate;
 
-	/*
-	 * Each cell {phy_id, pll_id} of the truth table indicates
-	 * if the source PLL selection bit should be set for each PHY.
-	 * Fill default H/W values in illegal cells, eg. cell {0, 1}.
-	 */
-	bool src_pll_truthtable[DSI_MAX][DSI_MAX];
 	const resource_size_t io_start[DSI_MAX];
 	const int num_dsi_phy;
 	const int quirks;
@@ -121,7 +115,5 @@ int msm_dsi_dphy_timing_calc_v3(struct msm_dsi_dphy_timing *timing,
 				struct msm_dsi_phy_clk_request *clk_req);
 int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
 				struct msm_dsi_phy_clk_request *clk_req);
-void msm_dsi_phy_set_src_pll(struct msm_dsi_phy *phy, int pll_id, u32 reg,
-				u32 bit_mask);
 
 #endif /* __DSI_PHY_H__ */
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index e7039486c3af..c6c41a811780 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -919,7 +919,6 @@ static void dsi_10nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
-	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
@@ -941,7 +940,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
-	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index fe7ec4cd6f92..b1f3b411e268 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -947,6 +947,7 @@ static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	int ret;
 	void __iomem *base = phy->base;
 	void __iomem *lane_base = phy->lane_base;
+	u32 glbl_test_ctrl;
 
 	if (msm_dsi_dphy_timing_calc_v2(timing, clk_req)) {
 		DRM_DEV_ERROR(&phy->pdev->dev,
@@ -994,10 +995,12 @@ static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	udelay(100);
 	dsi_phy_write(base + REG_DSI_14nm_PHY_CMN_CTRL_1, 0x00);
 
-	msm_dsi_phy_set_src_pll(phy, src_pll_id,
-				REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL,
-				DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL);
-
+	glbl_test_ctrl = dsi_phy_read(base + REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL);
+	if (phy->id == DSI_1 && src_pll_id == DSI_0)
+		glbl_test_ctrl |= DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL;
+	else
+		glbl_test_ctrl &= ~DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL;
+	dsi_phy_write(base + REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL, glbl_test_ctrl);
 	ret = dsi_14nm_set_usecase(phy);
 	if (ret) {
 		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
@@ -1021,7 +1024,6 @@ static void dsi_14nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
-	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
@@ -1043,7 +1045,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
-	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
index 5e73f811d645..f5b88c85a8fc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
@@ -70,6 +70,7 @@ static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	int i;
 	void __iomem *base = phy->base;
 	u32 cfg_4[4] = {0x20, 0x40, 0x20, 0x00};
+	u32 val;
 
 	DBG("");
 
@@ -83,9 +84,12 @@ static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 
 	dsi_phy_write(base + REG_DSI_20nm_PHY_STRENGTH_0, 0xff);
 
-	msm_dsi_phy_set_src_pll(phy, src_pll_id,
-				REG_DSI_20nm_PHY_GLBL_TEST_CTRL,
-				DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL);
+	val = dsi_phy_read(base + REG_DSI_20nm_PHY_GLBL_TEST_CTRL);
+	if (src_pll_id == DSI_1)
+		val |= DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
+	else
+		val &= ~DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
+	dsi_phy_write(base + REG_DSI_20nm_PHY_GLBL_TEST_CTRL, val);
 
 	for (i = 0; i < 4; i++) {
 		dsi_phy_write(base + REG_DSI_20nm_PHY_LN_CFG_3(i),
@@ -125,7 +129,6 @@ static void dsi_20nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs = {
-	.src_pll_truthtable = { {false, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 2,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index d859a39c69b2..14432323c28d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -727,6 +727,7 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	struct msm_dsi_dphy_timing *timing = &phy->timing;
 	int i;
 	void __iomem *base = phy->base;
+	u32 val;
 
 	DBG("");
 
@@ -766,9 +767,12 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 
 	dsi_phy_write(base + REG_DSI_28nm_PHY_CTRL_0, 0x5f);
 
-	msm_dsi_phy_set_src_pll(phy, src_pll_id,
-				REG_DSI_28nm_PHY_GLBL_TEST_CTRL,
-				DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL);
+	val = dsi_phy_read(base + REG_DSI_28nm_PHY_GLBL_TEST_CTRL);
+	if (phy->id == DSI_1 && src_pll_id == DSI_0)
+		val &= ~DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
+	else
+		val |= DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
+	dsi_phy_write(base + REG_DSI_28nm_PHY_GLBL_TEST_CTRL, val);
 
 	return 0;
 }
@@ -786,7 +790,6 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
-	.src_pll_truthtable = { {true, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 1,
@@ -808,7 +811,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
-	.src_pll_truthtable = { {true, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 1,
@@ -830,7 +832,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
-	.src_pll_truthtable = { {true, true}, {true, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 1,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 33aabddeeb1f..1e004c330599 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -642,7 +642,6 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
-	.src_pll_truthtable = { {true, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 1,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index ecd514ac5787..d26bf387c0fe 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -956,7 +956,6 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
-	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
@@ -979,7 +978,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
-	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
