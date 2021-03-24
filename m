Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2059A347C20
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABB26EC9A;
	Wed, 24 Mar 2021 15:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F02C6EC88
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:19:27 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id o126so23038907lfa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r+pZ6+V4PRaBdy5TK9d1InLteDXNH323N1ivMmzXSQo=;
 b=CMkUwp8/LG7XLXvFV5WrrtGK9vwOn5H7o1Dp8QY/61GA/H2c8oxXlH0V/kzNS5auvu
 FKzpK0FUQkX5xA9/JJ+paaxEK8QBpYtxENSsohSfu/xuXWbzhYXozEdY4eKhSK+kYz4p
 K+iQQAY0Df8fVxoRZW06OiDsjnPhn/gcG8FR6gW3F3ioHCO2NfD6I+s7tJ9lIX7UDiSm
 4nJmTMpMblReJJQkAte7pQqIq7J6WRp18kBu/CP0aOaGG28tjlmkC5+0skjBtT5vI5YX
 Nc3qOmq0esswoPo+VGvG8arNHpifjx3IwhTLXVSKC0TnH7Kob76WZwjnT9Qz9hfLrYb+
 7e4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r+pZ6+V4PRaBdy5TK9d1InLteDXNH323N1ivMmzXSQo=;
 b=Ou9FYzS72ePeYabTb19ay21rAzEyPbsmbX8hFFg+isTkCg4wHFmiPjXNy8BUmTsxa1
 RMP8MCgQsaE5IVrdtTSzW/jAOhj3XWIP8mxZyytEdCyoXFssKS5EJQbWVo2HCnMe51yf
 dgi1sDR7XHyByCIL8I+rt8MX6kK2QCj/5H3GQIFvIj/Isjgw5ZfaRAaK6/lEmKy3I4E+
 GfOf4LZ4k/CDPaBWz2MjxjKBUlUSOUFskdM/sQkvwG1Osvcuc7Twj/y+iQ6iaE6JlPCK
 y967wyNJnw89KzRLOhPkXLDwqHFhZUQLY+sH+3vIi1l6B9JMT65Mi0p6cGQEdUwwjWaX
 TFMQ==
X-Gm-Message-State: AOAM533gDIjj9g1Axv7cUmEnpXM98Z7DpTuLyJdAkyacSsuiRWYxLIK4
 mycPQR/nelG7tTHoqWqmINgO0g==
X-Google-Smtp-Source: ABdhPJwS4wPdjiGUXbz5cKtswPfUanZdiSfXmmrBltUdP1Ts22AoeB5ft5Zeo67LwCzCsqB664GJmw==
X-Received: by 2002:ac2:5e36:: with SMTP id o22mr2370414lfg.525.1616599165725; 
 Wed, 24 Mar 2021 08:19:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:19:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 14/28] drm/msm/dsi: push provided clocks handling into a
 generic code
Date: Wed, 24 Mar 2021 18:18:32 +0300
Message-Id: <20210324151846.2774204-15-dmitry.baryshkov@linaro.org>
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

All MSM DSI PHYs provide two clocks: byte and pixel ones.
Register/unregister provided clocks from the generic place, removing
boilerplate code from all MSM DSI PHY drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 23 ++++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  6 +++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 36 ++-------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 36 ++-------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 45 ++++---------------
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 41 ++++-------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 36 ++-------------
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         |  5 +--
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.h         |  3 +-
 9 files changed, 59 insertions(+), 172 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 5f153b683521..b01ba76adb9f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2015, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
 #include "dsi_phy.h"
@@ -652,6 +653,14 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	if (!match)
 		return -ENODEV;
 
+	phy->provided_clocks = devm_kzalloc(dev,
+			struct_size(phy->provided_clocks, hws, NUM_PROVIDED_CLKS),
+			GFP_KERNEL);
+	if (!phy->provided_clocks)
+		return -ENOMEM;
+
+	phy->provided_clocks->num = NUM_PROVIDED_CLKS;
+
 	phy->cfg = match->data;
 	phy->pdev = pdev;
 
@@ -719,6 +728,13 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+				     phy->provided_clocks);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
+		goto fail;
+	}
+
 	dsi_phy_disable_resource(phy);
 
 	platform_set_drvdata(pdev, phy);
@@ -726,6 +742,12 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	return 0;
 
 fail:
+	if (phy->pll) {
+		of_clk_del_provider(dev->of_node);
+		msm_dsi_pll_destroy(phy->pll);
+		phy->pll = NULL;
+	}
+
 	return ret;
 }
 
@@ -734,6 +756,7 @@ static int dsi_phy_driver_remove(struct platform_device *pdev)
 	struct msm_dsi_phy *phy = platform_get_drvdata(pdev);
 
 	if (phy && phy->pll) {
+		of_clk_del_provider(pdev->dev.of_node);
 		msm_dsi_pll_destroy(phy->pll);
 		phy->pll = NULL;
 	}
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 3e3ed884c3dc..c3099629fa3b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -84,6 +84,10 @@ struct msm_dsi_dphy_timing {
 	u8 hs_halfbyte_en_ckln;
 };
 
+#define DSI_BYTE_PLL_CLK		0
+#define DSI_PIXEL_PLL_CLK		1
+#define NUM_PROVIDED_CLKS		2
+
 struct msm_dsi_phy {
 	struct platform_device *pdev;
 	void __iomem *base;
@@ -101,6 +105,8 @@ struct msm_dsi_phy {
 	bool regulator_ldo_mode;
 
 	struct msm_dsi_pll *pll;
+
+	struct clk_hw_onecell_data *provided_clocks;
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 319d7b26c784..8666da1c29e5 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -36,10 +36,6 @@
  *                                                  dsi0_pll_post_out_div_clk
  */
 
-#define DSI_BYTE_PLL_CLK		0
-#define DSI_PIXEL_PLL_CLK		1
-#define NUM_PROVIDED_CLKS		2
-
 #define VCO_REF_CLK_RATE		19200000
 
 struct dsi_pll_regs {
@@ -116,9 +112,6 @@ struct dsi_pll_10nm {
 	struct clk_hw *pclk_mux_hw;
 	struct clk_hw *out_dsiclk_hw;
 
-	/* clock-provider: */
-	struct clk_hw_onecell_data *hw_data;
-
 	struct pll_10nm_cached_state cached_state;
 
 	enum msm_dsi_phy_usecase uc;
@@ -624,10 +617,8 @@ static int dsi_pll_10nm_set_usecase(struct msm_dsi_pll *pll,
 static void dsi_pll_10nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
-	struct device *dev = &pll_10nm->pdev->dev;
 
 	DBG("DSI PLL%d", pll_10nm->id);
-	of_clk_del_provider(dev->of_node);
 
 	clk_hw_unregister_divider(pll_10nm->out_dsiclk_hw);
 	clk_hw_unregister_mux(pll_10nm->pclk_mux_hw);
@@ -645,7 +636,7 @@ static void dsi_pll_10nm_destroy(struct msm_dsi_pll *pll)
  * state to follow the master PLL's divider/mux state. Therefore, we don't
  * require special clock ops that also configure the slave PLL registers
  */
-static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
+static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **provided_clocks)
 {
 	char clk_name[32], parent[32], vco_name[32];
 	char parent2[32], parent3[32], parent4[32];
@@ -657,18 +648,11 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
 		.ops = &clk_ops_dsi_pll_10nm_vco,
 	};
 	struct device *dev = &pll_10nm->pdev->dev;
-	struct clk_hw_onecell_data *hw_data;
 	struct clk_hw *hw;
 	int ret;
 
 	DBG("DSI%d", pll_10nm->id);
 
-	hw_data = devm_kzalloc(dev, sizeof(*hw_data) +
-			       NUM_PROVIDED_CLKS * sizeof(struct clk_hw *),
-			       GFP_KERNEL);
-	if (!hw_data)
-		return -ENOMEM;
-
 	snprintf(vco_name, 32, "dsi%dvco_clk", pll_10nm->id);
 	pll_10nm->base.clk_hw.init = &vco_init;
 
@@ -720,7 +704,7 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
 	}
 
 	pll_10nm->byte_clk_hw = hw;
-	hw_data->hws[DSI_BYTE_PLL_CLK] = hw;
+	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
 
 	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_10nm->id);
 	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->id);
@@ -780,22 +764,10 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
 	}
 
 	pll_10nm->out_dsiclk_hw = hw;
-	hw_data->hws[DSI_PIXEL_PLL_CLK] = hw;
-
-	hw_data->num = NUM_PROVIDED_CLKS;
-	pll_10nm->hw_data = hw_data;
-
-	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
-				     pll_10nm->hw_data);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
-		goto err_dsiclk_hw;
-	}
+	provided_clocks[DSI_PIXEL_PLL_CLK] = hw;
 
 	return 0;
 
-err_dsiclk_hw:
-	clk_hw_unregister_divider(pll_10nm->out_dsiclk_hw);
 err_pclk_mux_hw:
 	clk_hw_unregister_mux(pll_10nm->pclk_mux_hw);
 err_post_out_div_clk_hw:
@@ -851,7 +823,7 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 
 	pll_10nm->vco_delay = 1;
 
-	ret = pll_10nm_register(pll_10nm);
+	ret = pll_10nm_register(pll_10nm, phy->provided_clocks->hws);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 6f3021f66ecc..07ecdf34f614 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -34,15 +34,10 @@
 #define POLL_MAX_READS			15
 #define POLL_TIMEOUT_US			1000
 
-#define NUM_PROVIDED_CLKS		2
-
 #define VCO_REF_CLK_RATE		19200000
 #define VCO_MIN_RATE			1300000000UL
 #define VCO_MAX_RATE			2600000000UL
 
-#define DSI_BYTE_PLL_CLK		0
-#define DSI_PIXEL_PLL_CLK		1
-
 #define DSI_PLL_DEFAULT_VCO_POSTDIV	1
 
 struct dsi_pll_input {
@@ -142,9 +137,6 @@ struct dsi_pll_14nm {
 	struct clk_hw *hws[NUM_DSI_CLOCKS_MAX];
 	u32 num_hws;
 
-	/* clock-provider: */
-	struct clk_hw_onecell_data *hw_data;
-
 	struct pll_14nm_cached_state cached_state;
 
 	enum msm_dsi_phy_usecase uc;
@@ -883,11 +875,8 @@ static int dsi_pll_14nm_set_usecase(struct msm_dsi_pll *pll,
 static void dsi_pll_14nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
-	struct platform_device *pdev = pll_14nm->pdev;
 	int num_hws = pll_14nm->num_hws;
 
-	of_clk_del_provider(pdev->dev.of_node);
-
 	while (num_hws--)
 		clk_hw_unregister(pll_14nm->hws[num_hws]);
 }
@@ -928,7 +917,7 @@ static struct clk_hw *pll_14nm_postdiv_register(struct dsi_pll_14nm *pll_14nm,
 	return &pll_postdiv->hw;
 }
 
-static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm)
+static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **provided_clocks)
 {
 	char clk_name[32], parent[32], vco_name[32];
 	struct clk_init_data vco_init = {
@@ -940,19 +929,12 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm)
 	};
 	struct device *dev = &pll_14nm->pdev->dev;
 	struct clk_hw **hws = pll_14nm->hws;
-	struct clk_hw_onecell_data *hw_data;
 	struct clk_hw *hw;
 	int num = 0;
 	int ret;
 
 	DBG("DSI%d", pll_14nm->id);
 
-	hw_data = devm_kzalloc(dev, sizeof(*hw_data) +
-			       NUM_PROVIDED_CLKS * sizeof(struct clk_hw *),
-			       GFP_KERNEL);
-	if (!hw_data)
-		return -ENOMEM;
-
 	snprintf(vco_name, 32, "dsi%dvco_clk", pll_14nm->id);
 	pll_14nm->base.clk_hw.init = &vco_init;
 
@@ -983,7 +965,7 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm)
 		return PTR_ERR(hw);
 
 	hws[num++] = hw;
-	hw_data->hws[DSI_BYTE_PLL_CLK] = hw;
+	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
 
 	snprintf(clk_name, 32, "dsi%dn1_postdivby2_clk", pll_14nm->id);
 	snprintf(parent, 32, "dsi%dn1_postdiv_clk", pll_14nm->id);
@@ -1010,20 +992,10 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm)
 		return PTR_ERR(hw);
 
 	hws[num++] = hw;
-	hw_data->hws[DSI_PIXEL_PLL_CLK]	= hw;
+	provided_clocks[DSI_PIXEL_PLL_CLK]	= hw;
 
 	pll_14nm->num_hws = num;
 
-	hw_data->num = NUM_PROVIDED_CLKS;
-	pll_14nm->hw_data = hw_data;
-
-	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
-				     pll_14nm->hw_data);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
-		return ret;
-	}
-
 	return 0;
 }
 
@@ -1067,7 +1039,7 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy *phy)
 
 	pll_14nm->vco_delay = 1;
 
-	ret = pll_14nm_register(pll_14nm);
+	ret = pll_14nm_register(pll_14nm, phy->provided_clocks->hws);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 83c73230266d..3446be318648 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -31,15 +31,10 @@
 #define POLL_MAX_READS			10
 #define POLL_TIMEOUT_US		50
 
-#define NUM_PROVIDED_CLKS		2
-
 #define VCO_REF_CLK_RATE		19200000
 #define VCO_MIN_RATE			350000000
 #define VCO_MAX_RATE			750000000
 
-#define DSI_BYTE_PLL_CLK		0
-#define DSI_PIXEL_PLL_CLK		1
-
 /* v2.0.0 28nm LP implementation */
 #define DSI_PHY_28NM_QUIRK_PHY_LP	BIT(0)
 
@@ -83,10 +78,6 @@ struct dsi_pll_28nm {
 	struct clk *clks[NUM_DSI_CLOCKS_MAX];
 	u32 num_clks;
 
-	/* clock-provider: */
-	struct clk *provided_clks[NUM_PROVIDED_CLKS];
-	struct clk_onecell_data clk_data;
-
 	struct pll_28nm_cached_state cached_state;
 };
 
@@ -498,20 +489,13 @@ static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
 static void dsi_pll_28nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
-	int i;
 
-	msm_dsi_pll_helper_unregister_clks(pll_28nm->pdev,
-					pll_28nm->clks, pll_28nm->num_clks);
-
-	for (i = 0; i < NUM_PROVIDED_CLKS; i++)
-		pll_28nm->provided_clks[i] = NULL;
+	msm_dsi_pll_helper_unregister_clks(pll_28nm->clks, pll_28nm->num_clks);
 
 	pll_28nm->num_clks = 0;
-	pll_28nm->clk_data.clks = NULL;
-	pll_28nm->clk_data.clk_num = 0;
 }
 
-static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
+static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **provided_clocks)
 {
 	char clk_name[32], parent1[32], parent2[32], vco_name[32];
 	struct clk_init_data vco_init = {
@@ -523,9 +507,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
 	};
 	struct device *dev = &pll_28nm->pdev->dev;
 	struct clk **clks = pll_28nm->clks;
-	struct clk **provided_clks = pll_28nm->provided_clks;
 	int num = 0;
-	int ret;
 
 	DBG("%d", pll_28nm->id);
 
@@ -549,11 +531,11 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
 
 	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->id);
 	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->id);
-	clks[num++] = provided_clks[DSI_PIXEL_PLL_CLK] =
-			clk_register_divider(dev, clk_name,
+	clks[num++] = clk_register_divider(dev, clk_name,
 				parent1, 0, pll_28nm->mmio +
 				REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG,
 				0, 8, 0, NULL);
+	provided_clocks[DSI_PIXEL_PLL_CLK] = __clk_get_hw(clks[num - 1]);
 
 	snprintf(clk_name, 32, "dsi%dbyte_mux", pll_28nm->id);
 	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->id);
@@ -566,22 +548,12 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
 
 	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->id);
 	snprintf(parent1, 32, "dsi%dbyte_mux", pll_28nm->id);
-	clks[num++] = provided_clks[DSI_BYTE_PLL_CLK] =
-			clk_register_fixed_factor(dev, clk_name,
+	clks[num++] = clk_register_fixed_factor(dev, clk_name,
 				parent1, CLK_SET_RATE_PARENT, 1, 4);
+	provided_clocks[DSI_BYTE_PLL_CLK] = __clk_get_hw(clks[num - 1]);
 
 	pll_28nm->num_clks = num;
 
-	pll_28nm->clk_data.clk_num = NUM_PROVIDED_CLKS;
-	pll_28nm->clk_data.clks = provided_clks;
-
-	ret = of_clk_add_provider(dev->of_node,
-			of_clk_src_onecell_get, &pll_28nm->clk_data);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
-		return ret;
-	}
-
 	return 0;
 }
 
@@ -610,14 +582,13 @@ static int dsi_pll_28nm_init(struct msm_dsi_phy *phy)
 	}
 
 	pll = &pll_28nm->base;
+	pll->cfg = phy->cfg;
 	if (phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
 		pll_28nm->vco_delay = 1000;
 	else
 		pll_28nm->vco_delay = 1;
 
-	pll->cfg = phy->cfg;
-
-	ret = pll_28nm_register(pll_28nm);
+	ret = pll_28nm_register(pll_28nm, phy->provided_clocks->hws);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 0e26780e3eb4..c4b433790cfb 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -39,15 +39,10 @@
 #define POLL_MAX_READS		8000
 #define POLL_TIMEOUT_US		1
 
-#define NUM_PROVIDED_CLKS	2
-
 #define VCO_REF_CLK_RATE	27000000
 #define VCO_MIN_RATE		600000000
 #define VCO_MAX_RATE		1200000000
 
-#define DSI_BYTE_PLL_CLK	0
-#define DSI_PIXEL_PLL_CLK	1
-
 #define VCO_PREF_DIV_RATIO	27
 
 struct pll_28nm_cached_state {
@@ -76,10 +71,6 @@ struct dsi_pll_28nm {
 	struct clk *clks[NUM_DSI_CLOCKS_MAX];
 	u32 num_clks;
 
-	/* clock-provider: */
-	struct clk *provided_clks[NUM_PROVIDED_CLKS];
-	struct clk_onecell_data clk_data;
-
 	struct pll_28nm_cached_state cached_state;
 };
 
@@ -381,11 +372,10 @@ static void dsi_pll_28nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
 
-	msm_dsi_pll_helper_unregister_clks(pll_28nm->pdev,
-					pll_28nm->clks, pll_28nm->num_clks);
+	msm_dsi_pll_helper_unregister_clks(pll_28nm->clks, pll_28nm->num_clks);
 }
 
-static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
+static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **provided_clocks)
 {
 	char *clk_name, *parent_name, *vco_name;
 	struct clk_init_data vco_init = {
@@ -396,10 +386,9 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
 	};
 	struct device *dev = &pll_28nm->pdev->dev;
 	struct clk **clks = pll_28nm->clks;
-	struct clk **provided_clks = pll_28nm->provided_clks;
 	struct clk_bytediv *bytediv;
 	struct clk_init_data bytediv_init = { };
-	int ret, num = 0;
+	int num = 0;
 
 	DBG("%d", pll_28nm->id);
 
@@ -411,10 +400,6 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
 	if (!vco_name)
 		return -ENOMEM;
 
-	parent_name = devm_kzalloc(dev, 32, GFP_KERNEL);
-	if (!parent_name)
-		return -ENOMEM;
-
 	clk_name = devm_kzalloc(dev, 32, GFP_KERNEL);
 	if (!clk_name)
 		return -ENOMEM;
@@ -442,29 +427,19 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
 	bytediv_init.num_parents = 1;
 
 	/* DIV2 */
-	clks[num++] = provided_clks[DSI_BYTE_PLL_CLK] =
-			clk_register(dev, &bytediv->hw);
+	clks[num++] = clk_register(dev, &bytediv->hw);
+	provided_clocks[DSI_BYTE_PLL_CLK] = __clk_get_hw(clks[num - 1]);
 
 	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->id);
 	/* DIV3 */
-	clks[num++] = provided_clks[DSI_PIXEL_PLL_CLK] =
-			clk_register_divider(dev, clk_name,
+	clks[num++] = clk_register_divider(dev, clk_name,
 				parent_name, 0, pll_28nm->mmio +
 				REG_DSI_28nm_8960_PHY_PLL_CTRL_10,
 				0, 8, 0, NULL);
+	provided_clocks[DSI_PIXEL_PLL_CLK] = __clk_get_hw(clks[num - 1]);
 
 	pll_28nm->num_clks = num;
 
-	pll_28nm->clk_data.clk_num = NUM_PROVIDED_CLKS;
-	pll_28nm->clk_data.clks = provided_clks;
-
-	ret = of_clk_add_provider(dev->of_node,
-			of_clk_src_onecell_get, &pll_28nm->clk_data);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
-		return ret;
-	}
-
 	return 0;
 }
 
@@ -496,7 +471,7 @@ static int dsi_pll_28nm_8960_init(struct msm_dsi_phy *phy)
 
 	pll->cfg = phy->cfg;
 
-	ret = pll_28nm_register(pll_28nm);
+	ret = pll_28nm_register(pll_28nm, phy->provided_clocks->hws);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 7618f40ad45d..0b601afa9e49 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -36,10 +36,6 @@
  *                                                  dsi0_pll_post_out_div_clk
  */
 
-#define DSI_BYTE_PLL_CLK		0
-#define DSI_PIXEL_PLL_CLK		1
-#define NUM_PROVIDED_CLKS		2
-
 #define VCO_REF_CLK_RATE		19200000
 
 struct dsi_pll_regs {
@@ -116,9 +112,6 @@ struct dsi_pll_7nm {
 	struct clk_hw *pclk_mux_hw;
 	struct clk_hw *out_dsiclk_hw;
 
-	/* clock-provider: */
-	struct clk_hw_onecell_data *hw_data;
-
 	struct pll_7nm_cached_state cached_state;
 
 	enum msm_dsi_phy_usecase uc;
@@ -649,10 +642,8 @@ static int dsi_pll_7nm_set_usecase(struct msm_dsi_pll *pll,
 static void dsi_pll_7nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
-	struct device *dev = &pll_7nm->pdev->dev;
 
 	DBG("DSI PLL%d", pll_7nm->id);
-	of_clk_del_provider(dev->of_node);
 
 	clk_hw_unregister_divider(pll_7nm->out_dsiclk_hw);
 	clk_hw_unregister_mux(pll_7nm->pclk_mux_hw);
@@ -670,7 +661,7 @@ static void dsi_pll_7nm_destroy(struct msm_dsi_pll *pll)
  * state to follow the master PLL's divider/mux state. Therefore, we don't
  * require special clock ops that also configure the slave PLL registers
  */
-static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm)
+static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provided_clocks)
 {
 	char clk_name[32], parent[32], vco_name[32];
 	char parent2[32], parent3[32], parent4[32];
@@ -682,18 +673,11 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm)
 		.ops = &clk_ops_dsi_pll_7nm_vco,
 	};
 	struct device *dev = &pll_7nm->pdev->dev;
-	struct clk_hw_onecell_data *hw_data;
 	struct clk_hw *hw;
 	int ret;
 
 	DBG("DSI%d", pll_7nm->id);
 
-	hw_data = devm_kzalloc(dev, sizeof(*hw_data) +
-			       NUM_PROVIDED_CLKS * sizeof(struct clk_hw *),
-			       GFP_KERNEL);
-	if (!hw_data)
-		return -ENOMEM;
-
 	snprintf(vco_name, 32, "dsi%dvco_clk", pll_7nm->id);
 	pll_7nm->base.clk_hw.init = &vco_init;
 
@@ -745,7 +729,7 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm)
 	}
 
 	pll_7nm->byte_clk_hw = hw;
-	hw_data->hws[DSI_BYTE_PLL_CLK] = hw;
+	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
 
 	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->id);
 	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->id);
@@ -805,22 +789,10 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm)
 	}
 
 	pll_7nm->out_dsiclk_hw = hw;
-	hw_data->hws[DSI_PIXEL_PLL_CLK] = hw;
-
-	hw_data->num = NUM_PROVIDED_CLKS;
-	pll_7nm->hw_data = hw_data;
-
-	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
-				     pll_7nm->hw_data);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
-		goto err_dsiclk_hw;
-	}
+	provided_clocks[DSI_PIXEL_PLL_CLK] = hw;
 
 	return 0;
 
-err_dsiclk_hw:
-	clk_hw_unregister_divider(pll_7nm->out_dsiclk_hw);
 err_pclk_mux_hw:
 	clk_hw_unregister_mux(pll_7nm->pclk_mux_hw);
 err_post_out_div_clk_hw:
@@ -876,7 +848,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 
 	pll_7nm->vco_delay = 1;
 
-	ret = pll_7nm_register(pll_7nm);
+	ret = pll_7nm_register(pll_7nm, phy->provided_clocks->hws);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
index 5768e8d225fc..914e95435dcb 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
@@ -57,11 +57,8 @@ void msm_dsi_pll_helper_clk_unprepare(struct clk_hw *hw)
 	pll->pll_on = false;
 }
 
-void msm_dsi_pll_helper_unregister_clks(struct platform_device *pdev,
-					struct clk **clks, u32 num_clks)
+void msm_dsi_pll_helper_unregister_clks(struct clk **clks, u32 num_clks)
 {
-	of_clk_del_provider(pdev->dev.of_node);
-
 	if (!num_clks || !clks)
 		return;
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
index 8306911f8318..d819a886beb8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
@@ -55,8 +55,7 @@ long msm_dsi_pll_helper_clk_round_rate(struct clk_hw *hw,
 int msm_dsi_pll_helper_clk_prepare(struct clk_hw *hw);
 void msm_dsi_pll_helper_clk_unprepare(struct clk_hw *hw);
 /* misc */
-void msm_dsi_pll_helper_unregister_clks(struct platform_device *pdev,
-					struct clk **clks, u32 num_clks);
+void msm_dsi_pll_helper_unregister_clks(struct clk **clks, u32 num_clks);
 
 #endif /* __DSI_PLL_H__ */
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
