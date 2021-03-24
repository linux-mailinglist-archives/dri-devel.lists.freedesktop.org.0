Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6492E347C35
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71246ECA8;
	Wed, 24 Mar 2021 15:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060DB6ECA6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:19:46 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id b4so8597447lfi.6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l3MWO0BD1Z0aMlUAjIGFvrvtw8qtZfe0+ZohERMoQm8=;
 b=HjnW7PbpZcp1BtXkXSp1nt1TjmvZ3F4Yv2xlbVmU1BNQllij4BAMb8rq0v0JHPySUM
 B3XyRHOYXXt+IOiBIH1XoB/qdDoIZNq3A993J5arKHdrLU2UMUnyTtE3ozD4bn0NtRvy
 v05OPA3fT6dfKbDM5tjGMOv+ISKgFFZZ+7mvJsvPGeHZ4UXenw4O4Psm2OKpiJFlZ3Fo
 Xa1DdKugRu0kHyJ/SdjgaSHHBtG4QPvcFnb2dqYvebPtBC7MQdtb7pCupY5AovrVfzjV
 EgeGeB2FeTcaLyyFl8NNJVDt25KMG5cmmvY/U0fJEV2u3EXBDZ8s7GDA4reFxMEZke3i
 g3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l3MWO0BD1Z0aMlUAjIGFvrvtw8qtZfe0+ZohERMoQm8=;
 b=H5zLFOS1SMUUsvEFFVBrvAW5/OU5SuUAOADt1zREC9+1B7Ff1PImGCibjah7XtYNYi
 V0ACwwvhfKVVbqKOJpG6m67a/RxnmASqha2M1A0/6GHtk3Qt5+R8JgWbKFQQUskOQCIG
 Rv1PGgX5xCYYv2Wnw1XzdXIUDrGCw9dHGiZPMy0VTDuIIu6Ndi2Pde5zehl/ItKVfKwD
 Qqq76b8Qa8pnmRN9WBcADlIG+DNw69WdHne2UtrKLr7Gw8ctoetkkjwkxbp3BdlHjd0R
 54MReFqPdFdxlh3SBfBD5od3+Yi7+4zgHWMFv4H6jHj6/D/B2IBYT8CJKqBhyBIjci/+
 e9xQ==
X-Gm-Message-State: AOAM532Amn+SXGWAWC0oA3IdnLW4WTSIEAIYMCxmzRB2nIN1JRfZJ4uT
 b9M2/hlj9tUhzhQYrrrw52DQ6Q==
X-Google-Smtp-Source: ABdhPJzFj38GDJEjlZeRwmOjAbpJVPetpwyQBcWxYZYM3B+BasED1zsivdniTatAyAj4FHp2rK07Cg==
X-Received: by 2002:a05:6512:c1a:: with SMTP id
 z26mr2108841lfu.360.1616599183540; 
 Wed, 24 Mar 2021 08:19:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:19:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 28/28] drm/msm/dsi: stop passing src_pll_id to the
 phy_enable call
Date: Wed, 24 Mar 2021 18:18:46 +0300
Message-Id: <20210324151846.2774204-29-dmitry.baryshkov@linaro.org>
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

Phy driver already knows the source PLL id basing on the set usecase and
the current PLL id. Stop passing it to the phy_enable call. As a
reminder, dsi manager will always use DSI 0 as a clock master in a slave
mode, so PLL 0 is always a clocksource for DSI 0 and it is always a
clocksource for DSI 1 too unless DSI 1 is used in the standalone mode.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h                   |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c           | 11 +++++------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           |  4 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      |  4 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      |  4 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      |  4 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       |  2 +-
 10 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 5c32ee2b3605..c422c8690ab3 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -160,7 +160,7 @@ struct msm_dsi_phy_clk_request {
 
 void msm_dsi_phy_driver_register(void);
 void msm_dsi_phy_driver_unregister(void);
-int msm_dsi_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
+int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 			struct msm_dsi_phy_clk_request *clk_req);
 void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
 void msm_dsi_phy_get_shared_timings(struct msm_dsi_phy *phy,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 2976b09a881d..20bcb6afb52e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -109,7 +109,7 @@ static int dsi_mgr_setup_components(int id)
 	return ret;
 }
 
-static int enable_phy(struct msm_dsi *msm_dsi, int src_pll_id,
+static int enable_phy(struct msm_dsi *msm_dsi,
 		      struct msm_dsi_phy_shared_timings *shared_timings)
 {
 	struct msm_dsi_phy_clk_request clk_req;
@@ -118,7 +118,7 @@ static int enable_phy(struct msm_dsi *msm_dsi, int src_pll_id,
 
 	msm_dsi_host_get_phy_clk_req(msm_dsi->host, &clk_req, is_dual_dsi);
 
-	ret = msm_dsi_phy_enable(msm_dsi->phy, src_pll_id, &clk_req);
+	ret = msm_dsi_phy_enable(msm_dsi->phy, &clk_req);
 	msm_dsi_phy_get_shared_timings(msm_dsi->phy, shared_timings);
 
 	return ret;
@@ -131,7 +131,6 @@ dsi_mgr_phy_enable(int id,
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct msm_dsi *mdsi = dsi_mgr_get_dsi(DSI_CLOCK_MASTER);
 	struct msm_dsi *sdsi = dsi_mgr_get_dsi(DSI_CLOCK_SLAVE);
-	int src_pll_id = IS_DUAL_DSI() ? DSI_CLOCK_MASTER : id;
 	int ret;
 
 	/* In case of dual DSI, some registers in PHY1 have been programmed
@@ -144,11 +143,11 @@ dsi_mgr_phy_enable(int id,
 			msm_dsi_host_reset_phy(mdsi->host);
 			msm_dsi_host_reset_phy(sdsi->host);
 
-			ret = enable_phy(mdsi, src_pll_id,
+			ret = enable_phy(mdsi,
 					 &shared_timings[DSI_CLOCK_MASTER]);
 			if (ret)
 				return ret;
-			ret = enable_phy(sdsi, src_pll_id,
+			ret = enable_phy(sdsi,
 					 &shared_timings[DSI_CLOCK_SLAVE]);
 			if (ret) {
 				msm_dsi_phy_disable(mdsi->phy);
@@ -157,7 +156,7 @@ dsi_mgr_phy_enable(int id,
 		}
 	} else {
 		msm_dsi_host_reset_phy(msm_dsi->host);
-		ret = enable_phy(msm_dsi, src_pll_id, &shared_timings[id]);
+		ret = enable_phy(msm_dsi, &shared_timings[id]);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 8f7726bb598c..851842a26872 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -753,7 +753,7 @@ void __exit msm_dsi_phy_driver_unregister(void)
 	platform_driver_unregister(&dsi_phy_platform_driver);
 }
 
-int msm_dsi_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
+int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 			struct msm_dsi_phy_clk_request *clk_req)
 {
 	struct device *dev = &phy->pdev->dev;
@@ -776,7 +776,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 		goto reg_en_fail;
 	}
 
-	ret = phy->cfg->ops.enable(phy, src_pll_id, clk_req);
+	ret = phy->cfg->ops.enable(phy, clk_req);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "%s: phy enable failed, %d\n", __func__, ret);
 		goto phy_en_fail;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 3b207cf9f6b4..74fffcae0f10 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -19,7 +19,7 @@
 
 struct msm_dsi_phy_ops {
 	int (*pll_init)(struct msm_dsi_phy *phy);
-	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
+	int (*enable)(struct msm_dsi_phy *phy,
 			struct msm_dsi_phy_clk_request *clk_req);
 	void (*disable)(struct msm_dsi_phy *phy);
 	void (*save_state)(struct msm_dsi_phy *phy);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 04535ccd11ef..bea68154ef87 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -786,7 +786,7 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
 	}
 }
 
-static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
+static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy,
 			       struct msm_dsi_phy_clk_request *clk_req)
 {
 	int ret;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 7a87bed71e36..c9afa6c461ee 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -938,7 +938,7 @@ static void dsi_14nm_dphy_set_timing(struct msm_dsi_phy *phy,
 		      DSI_14nm_PHY_LN_TIMING_CTRL_11_TRIG3_CMD(0xa0));
 }
 
-static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
+static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy,
 			       struct msm_dsi_phy_clk_request *clk_req)
 {
 	struct msm_dsi_dphy_timing *timing = &phy->timing;
@@ -996,7 +996,7 @@ static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	dsi_phy_write(base + REG_DSI_14nm_PHY_CMN_CTRL_1, 0x00);
 
 	glbl_test_ctrl = dsi_phy_read(base + REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL);
-	if (phy->id == DSI_1 && src_pll_id == DSI_0)
+	if (phy->usecase == MSM_DSI_PHY_SLAVE)
 		glbl_test_ctrl |= DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL;
 	else
 		glbl_test_ctrl &= ~DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
index f5b88c85a8fc..e96d789aea18 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
@@ -63,7 +63,7 @@ static void dsi_20nm_phy_regulator_ctrl(struct msm_dsi_phy *phy, bool enable)
 	dsi_phy_write(base + REG_DSI_20nm_PHY_REGULATOR_CTRL_0, 0x03);
 }
 
-static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
+static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy,
 				struct msm_dsi_phy_clk_request *clk_req)
 {
 	struct msm_dsi_dphy_timing *timing = &phy->timing;
@@ -85,7 +85,7 @@ static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	dsi_phy_write(base + REG_DSI_20nm_PHY_STRENGTH_0, 0xff);
 
 	val = dsi_phy_read(base + REG_DSI_20nm_PHY_GLBL_TEST_CTRL);
-	if (src_pll_id == DSI_1)
+	if (phy->id == DSI_1 && phy->usecase == MSM_DSI_PHY_STANDALONE)
 		val |= DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
 	else
 		val &= ~DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 4aa100bb1659..137e7fdfe2ef 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -698,7 +698,7 @@ static void dsi_28nm_phy_regulator_ctrl(struct msm_dsi_phy *phy, bool enable)
 		dsi_28nm_phy_regulator_enable_dcdc(phy);
 }
 
-static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
+static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
 				struct msm_dsi_phy_clk_request *clk_req)
 {
 	struct msm_dsi_dphy_timing *timing = &phy->timing;
@@ -745,7 +745,7 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	dsi_phy_write(base + REG_DSI_28nm_PHY_CTRL_0, 0x5f);
 
 	val = dsi_phy_read(base + REG_DSI_28nm_PHY_GLBL_TEST_CTRL);
-	if (phy->id == DSI_1 && src_pll_id == DSI_0)
+	if (phy->usecase == MSM_DSI_PHY_SLAVE)
 		val &= ~DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
 	else
 		val |= DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index d2bfe43c9ef1..104446450f7c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -585,7 +585,7 @@ static void dsi_28nm_phy_lane_config(struct msm_dsi_phy *phy)
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LNCK_TEST_STR1, 0x88);
 }
 
-static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
+static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
 				struct msm_dsi_phy_clk_request *clk_req)
 {
 	struct msm_dsi_dphy_timing *timing = &phy->timing;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 619998506b78..badc76a8d425 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -799,7 +799,7 @@ static void dsi_phy_hw_v4_0_lane_settings(struct msm_dsi_phy *phy)
 	}
 }
 
-static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
+static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 			      struct msm_dsi_phy_clk_request *clk_req)
 {
 	int ret;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
