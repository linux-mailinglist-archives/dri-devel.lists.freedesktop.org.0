Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0970D34FE89
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 12:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B086EA4A;
	Wed, 31 Mar 2021 10:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406876EA5E
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 10:58:00 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id u20so23257819lja.13
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 03:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ysyGNjWWGGx/mljgzg8Apzrjf4kKXL1whQ1CzN5AamM=;
 b=S1CDdaEWcYwedC895fKaUg7S6tMJKxamEB8CH+f7DDiaMNFdSPq118LL8TsBs7UA/S
 Z7mVu/aDDKiIJkVAfeoesP55jdZPC93bYDGWGw59HereIB/wG0nj9ZwyCApvfiNzcEDK
 9FoEBJGramlAlIvrRhOkhp/BS4Fg9zu64CxpwLUXdG/l8b2JJp4XAAgWqOX7otLd0gjF
 Eymnrl/ECZT6jyCCRX1g/1D/RVKOu9a5SJPQtakAuu1D9XXOO62it+YaGSt5EdtKhp54
 lIwgpo2xvIfQb0GfSuwGewaC0aYXpAGi0/6LoCmjN3dpdPWXSMyjLVcE5Wb6ULrXPXhB
 Mohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ysyGNjWWGGx/mljgzg8Apzrjf4kKXL1whQ1CzN5AamM=;
 b=T9yrO98rWnTvw+3uF63UQKcTTS82B5sVr4/QZ/6nIozyNBL0t02C140KXQs678puG9
 sbRmYcW+a4eGSmh8u66X1/CGkUqzC7XeSG+xd8c0r72SIGRevytw052cBCe04e7Kpbux
 Wh6bgWZzFDOp93J9JTM7m4foAIfJ8zwiiINNYwSzSKuFzR9v36U73BvvVDH7W3ZWBYyZ
 Cr7r1xDMmsxuHLDSLQIfRDfzNnXuCSJpbqpeVgf3UbMAk8Q7nAnWnquz5UeUDNETWWxF
 kt4l0dw7dp75m5KZTN9PmDMQDH8NA0xMNFoPyWK/Pv6fe2EMyiyvW3ClZJGhhKakd55q
 dEGQ==
X-Gm-Message-State: AOAM531pq1u3rGDjQp0YHp0zLObUas6oRekRlJR1MUG5WnITu56aw5+/
 W4NC/tt6nC1AU2SGs6Hg2q7O9Q==
X-Google-Smtp-Source: ABdhPJwqMPP0Cb7pT4pzD6RjhNbMIwsr0Xal1yccSQwjthArxuidf0IxduKeDAH2rull+aa6BHfqBg==
X-Received: by 2002:a2e:3608:: with SMTP id d8mr1724229lja.21.1617188278568;
 Wed, 31 Mar 2021 03:57:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 03:57:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v4 23/24] drm/msm/dsi: inline msm_dsi_phy_set_src_pll
Date: Wed, 31 Mar 2021 13:57:34 +0300
Message-Id: <20210331105735.3690009-24-dmitry.baryshkov@linaro.org>
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

The src_truthtable config is not used for some of phys, which use other
means of configuring the master/slave usecases. Inline this function
with the goal of removing src_pll_id argument in the next commit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
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
index 344887025720..93e81bb78d26 100644
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
index 7748f8b5ea53..00ef01baaebd 100644
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
index 655996cf8688..64b8b0efc1a4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -921,7 +921,6 @@ static void dsi_10nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
-	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
@@ -943,7 +942,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
-	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 090d3e7a2212..9a2937589435 100644
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
index e09fa80c413e..61f2f7f672ca 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -704,6 +704,7 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	struct msm_dsi_dphy_timing *timing = &phy->timing;
 	int i;
 	void __iomem *base = phy->base;
+	u32 val;
 
 	DBG("");
 
@@ -743,9 +744,12 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 
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
@@ -763,7 +767,6 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
-	.src_pll_truthtable = { {true, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 1,
@@ -785,7 +788,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
-	.src_pll_truthtable = { {true, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 1,
@@ -807,7 +809,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
-	.src_pll_truthtable = { {true, true}, {true, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 1,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 08bd93b719e0..83e275ed7476 100644
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
index b079ecc63212..dc28dd37c7f9 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -957,7 +957,6 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
-	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
@@ -980,7 +979,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
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
