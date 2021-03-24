Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A779347C0E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6436EC89;
	Wed, 24 Mar 2021 15:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014B16EC81
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:19:23 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id a1so30714648ljp.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kW0sFoH+M/ls8iL96z0kdhIhD4PBh75ctweoW1FfopY=;
 b=Ed+XD/CGKCuGkTtIIWnFaPGB1Ul1O2zXrOQhC4AiIq1L6JTulfbvY1POoz/CuT+gRW
 YsZYwXOgsKFTms78S1doiiONGUJH4MxbtUdInWeEaYg9l0jwS7xzuyOuaxGoucfM5ABg
 imWLzb2b4nWfQXOgAfY/1+WIs7bUTKLT+6s+Wza0gm1JaVBN5pF3PQJKHm5LZmReH1ZX
 OTqB8+daJ/hzrDgIzuj5iUKqywzp8TzYgr/UylE1hF+Rx6RhiFjNa7f9d00RCniICqxB
 wJhd7mJeHKmAxqaOI5cGr+r6FpgxaGQCb9loPZzEnJnYC/xrxHcECU8pA4ksop6Xmbrz
 nuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kW0sFoH+M/ls8iL96z0kdhIhD4PBh75ctweoW1FfopY=;
 b=dUhlh05rYeNWIxrORN3Q/PtQ3wN5AfG42csYLm9uy/qLvn8ORw4baHoewjNRhUmYHT
 RDUBPvqdYwqa1nHAqI/NhhdKC+fBlILC8BmSydGIM0r/FeEI2gcjdZMJ5iISMwbwFYK1
 KL5HKnHs/RV8FG0kASCC3d6Qov7M76IsRy6pEJE/iW3qRWFAHMCV6U39JwjO9cDSDtZ+
 6HIJuDoUF/cERMgE95nF/5kzw43IfP8mx9DbM8DMIoQlltcxGh3MIZlEocj72jNAaoYr
 zjIR05O8qxMGieI4ln92666e6bbjf7l4y98x97OqJfDcxRaHLWB1pYhvAlIx8p84WIag
 xiRw==
X-Gm-Message-State: AOAM533c/9c7g++Y10N52GnVQiqCHzYvwAAvgnnYCsJX8I/lLTCRrWO7
 lqmF5M7Y7tTg/DlycZJamLCMGA==
X-Google-Smtp-Source: ABdhPJwuwRqqm2g/+MyWcqn/ZvsWe/C+Q1XV8Noqa1FaD+yNcc+XcKuBtT9Qd4rrX3KPJH+bRRH41Q==
X-Received: by 2002:a2e:b613:: with SMTP id r19mr2415155ljn.300.1616599162318; 
 Wed, 24 Mar 2021 08:19:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:19:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 11/28] drm/msm/dsi: stop setting clock parents manually
Date: Wed, 24 Mar 2021 18:18:29 +0300
Message-Id: <20210324151846.2774204-12-dmitry.baryshkov@linaro.org>
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

There is no reason to set clock parents manually, use device tree to
assign DSI/display clock parents to DSI PHY clocks. Dropping this manual
setup allows us to drop repeating code and to move registration of hw
clock providers to generic place.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h                 |  9 ----
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 51 -------------------
 drivers/gpu/drm/msm/dsi/dsi_manager.c         | 12 -----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  3 --
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 19 -------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 17 -------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 18 -------
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 16 ------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 19 -------
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         | 11 ----
 10 files changed, 175 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index b310cf344ed4..3614af64ff52 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -96,19 +96,12 @@ struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi);
 struct msm_dsi_pll;
 #ifdef CONFIG_DRM_MSM_DSI_PLL
 void msm_dsi_pll_destroy(struct msm_dsi_pll *pll);
-int msm_dsi_pll_get_clk_provider(struct msm_dsi_pll *pll,
-	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
 void msm_dsi_pll_save_state(struct msm_dsi_pll *pll);
 int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll);
 #else
 static inline void msm_dsi_pll_destroy(struct msm_dsi_pll *pll)
 {
 }
-static inline int msm_dsi_pll_get_clk_provider(struct msm_dsi_pll *pll,
-	struct clk **byte_clk_provider, struct clk **pixel_clk_provider)
-{
-	return -ENODEV;
-}
 static inline void msm_dsi_pll_save_state(struct msm_dsi_pll *pll)
 {
 }
@@ -143,8 +136,6 @@ unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
 struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host);
 int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer);
 void msm_dsi_host_unregister(struct mipi_dsi_host *host);
-int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
-			struct msm_dsi_pll *src_pll);
 void msm_dsi_host_reset_phy(struct mipi_dsi_host *host);
 void msm_dsi_host_get_phy_clk_req(struct mipi_dsi_host *host,
 	struct msm_dsi_phy_clk_request *clk_req,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index ab281cba0f08..bf3468ccc965 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2225,57 +2225,6 @@ void msm_dsi_host_cmd_xfer_commit(struct mipi_dsi_host *host, u32 dma_base,
 	wmb();
 }
 
-int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
-	struct msm_dsi_pll *src_pll)
-{
-	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
-	struct clk *byte_clk_provider, *pixel_clk_provider;
-	int ret;
-
-	ret = msm_dsi_pll_get_clk_provider(src_pll,
-				&byte_clk_provider, &pixel_clk_provider);
-	if (ret) {
-		pr_info("%s: can't get provider from pll, don't set parent\n",
-			__func__);
-		return 0;
-	}
-
-	ret = clk_set_parent(msm_host->byte_clk_src, byte_clk_provider);
-	if (ret) {
-		pr_err("%s: can't set parent to byte_clk_src. ret=%d\n",
-			__func__, ret);
-		goto exit;
-	}
-
-	ret = clk_set_parent(msm_host->pixel_clk_src, pixel_clk_provider);
-	if (ret) {
-		pr_err("%s: can't set parent to pixel_clk_src. ret=%d\n",
-			__func__, ret);
-		goto exit;
-	}
-
-	if (msm_host->dsi_clk_src) {
-		ret = clk_set_parent(msm_host->dsi_clk_src, pixel_clk_provider);
-		if (ret) {
-			pr_err("%s: can't set parent to dsi_clk_src. ret=%d\n",
-				__func__, ret);
-			goto exit;
-		}
-	}
-
-	if (msm_host->esc_clk_src) {
-		ret = clk_set_parent(msm_host->esc_clk_src, byte_clk_provider);
-		if (ret) {
-			pr_err("%s: can't set parent to esc_clk_src. ret=%d\n",
-				__func__, ret);
-			goto exit;
-		}
-	}
-
-exit:
-	return ret;
-}
-
 void msm_dsi_host_reset_phy(struct mipi_dsi_host *host)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 1d28dfba2c9b..6b65d86d116a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -70,7 +70,6 @@ static int dsi_mgr_setup_components(int id)
 	struct msm_dsi *other_dsi = dsi_mgr_get_other_dsi(id);
 	struct msm_dsi *clk_master_dsi = dsi_mgr_get_dsi(DSI_CLOCK_MASTER);
 	struct msm_dsi *clk_slave_dsi = dsi_mgr_get_dsi(DSI_CLOCK_SLAVE);
-	struct msm_dsi_pll *src_pll;
 	int ret;
 
 	if (!IS_DUAL_DSI()) {
@@ -79,10 +78,6 @@ static int dsi_mgr_setup_components(int id)
 			return ret;
 
 		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
-		src_pll = msm_dsi_phy_get_pll(msm_dsi->phy);
-		if (IS_ERR(src_pll))
-			return PTR_ERR(src_pll);
-		ret = msm_dsi_host_set_src_pll(msm_dsi->host, src_pll);
 	} else if (!other_dsi) {
 		ret = 0;
 	} else {
@@ -109,13 +104,6 @@ static int dsi_mgr_setup_components(int id)
 					MSM_DSI_PHY_MASTER);
 		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
 					MSM_DSI_PHY_SLAVE);
-		src_pll = msm_dsi_phy_get_pll(clk_master_dsi->phy);
-		if (IS_ERR(src_pll))
-			return PTR_ERR(src_pll);
-		ret = msm_dsi_host_set_src_pll(msm_dsi->host, src_pll);
-		if (ret)
-			return ret;
-		ret = msm_dsi_host_set_src_pll(other_dsi->host, src_pll);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index f737bef74b91..3e3ed884c3dc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -23,9 +23,6 @@ struct msm_dsi_phy_ops {
 struct msm_dsi_pll_ops {
 	int (*enable_seq)(struct msm_dsi_pll *pll);
 	void (*disable_seq)(struct msm_dsi_pll *pll);
-	int (*get_provider)(struct msm_dsi_pll *pll,
-			struct clk **byte_clk_provider,
-			struct clk **pixel_clk_provider);
 	void (*destroy)(struct msm_dsi_pll *pll);
 	void (*save_state)(struct msm_dsi_pll *pll);
 	int (*restore_state)(struct msm_dsi_pll *pll);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 7a98e420414f..319d7b26c784 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -621,23 +621,6 @@ static int dsi_pll_10nm_set_usecase(struct msm_dsi_pll *pll,
 	return 0;
 }
 
-static int dsi_pll_10nm_get_provider(struct msm_dsi_pll *pll,
-				     struct clk **byte_clk_provider,
-				     struct clk **pixel_clk_provider)
-{
-	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
-	struct clk_hw_onecell_data *hw_data = pll_10nm->hw_data;
-
-	DBG("DSI PLL%d", pll_10nm->id);
-
-	if (byte_clk_provider)
-		*byte_clk_provider = hw_data->hws[DSI_BYTE_PLL_CLK]->clk;
-	if (pixel_clk_provider)
-		*pixel_clk_provider = hw_data->hws[DSI_PIXEL_PLL_CLK]->clk;
-
-	return 0;
-}
-
 static void dsi_pll_10nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
@@ -1105,7 +1088,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 		.pll_init = dsi_pll_10nm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_10nm_get_provider,
 		.destroy = dsi_pll_10nm_destroy,
 		.save_state = dsi_pll_10nm_save_state,
 		.restore_state = dsi_pll_10nm_restore_state,
@@ -1131,7 +1113,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 		.pll_init = dsi_pll_10nm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_10nm_get_provider,
 		.destroy = dsi_pll_10nm_destroy,
 		.save_state = dsi_pll_10nm_save_state,
 		.restore_state = dsi_pll_10nm_restore_state,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index bab86fa6dc4b..6f3021f66ecc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -880,21 +880,6 @@ static int dsi_pll_14nm_set_usecase(struct msm_dsi_pll *pll,
 	return 0;
 }
 
-static int dsi_pll_14nm_get_provider(struct msm_dsi_pll *pll,
-				     struct clk **byte_clk_provider,
-				     struct clk **pixel_clk_provider)
-{
-	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
-	struct clk_hw_onecell_data *hw_data = pll_14nm->hw_data;
-
-	if (byte_clk_provider)
-		*byte_clk_provider = hw_data->hws[DSI_BYTE_PLL_CLK]->clk;
-	if (pixel_clk_provider)
-		*pixel_clk_provider = hw_data->hws[DSI_PIXEL_PLL_CLK]->clk;
-
-	return 0;
-}
-
 static void dsi_pll_14nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
@@ -1227,7 +1212,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 		.pll_init = dsi_pll_14nm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_14nm_get_provider,
 		.destroy = dsi_pll_14nm_destroy,
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
@@ -1255,7 +1239,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 		.pll_init = dsi_pll_14nm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_14nm_get_provider,
 		.destroy = dsi_pll_14nm_destroy,
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index d267b25e5da0..83c73230266d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -495,21 +495,6 @@ static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
 	return 0;
 }
 
-static int dsi_pll_28nm_get_provider(struct msm_dsi_pll *pll,
-				struct clk **byte_clk_provider,
-				struct clk **pixel_clk_provider)
-{
-	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
-
-	if (byte_clk_provider)
-		*byte_clk_provider = pll_28nm->provided_clks[DSI_BYTE_PLL_CLK];
-	if (pixel_clk_provider)
-		*pixel_clk_provider =
-				pll_28nm->provided_clks[DSI_PIXEL_PLL_CLK];
-
-	return 0;
-}
-
 static void dsi_pll_28nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
@@ -802,7 +787,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 		.pll_init = dsi_pll_28nm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_28nm_get_provider,
 		.destroy = dsi_pll_28nm_destroy,
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
@@ -830,7 +814,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 		.pll_init = dsi_pll_28nm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_28nm_get_provider,
 		.destroy = dsi_pll_28nm_destroy,
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
@@ -858,7 +841,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 		.pll_init = dsi_pll_28nm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_28nm_get_provider,
 		.destroy = dsi_pll_28nm_destroy,
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 31e7910c6050..0e26780e3eb4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -377,21 +377,6 @@ static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
 	return 0;
 }
 
-static int dsi_pll_28nm_get_provider(struct msm_dsi_pll *pll,
-				struct clk **byte_clk_provider,
-				struct clk **pixel_clk_provider)
-{
-	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
-
-	if (byte_clk_provider)
-		*byte_clk_provider = pll_28nm->provided_clks[DSI_BYTE_PLL_CLK];
-	if (pixel_clk_provider)
-		*pixel_clk_provider =
-				pll_28nm->provided_clks[DSI_PIXEL_PLL_CLK];
-
-	return 0;
-}
-
 static void dsi_pll_28nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
@@ -702,7 +687,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
 		.pll_init = dsi_pll_28nm_8960_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_28nm_get_provider,
 		.destroy = dsi_pll_28nm_destroy,
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 5acdfe1f63be..7618f40ad45d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -646,23 +646,6 @@ static int dsi_pll_7nm_set_usecase(struct msm_dsi_pll *pll,
 	return 0;
 }
 
-static int dsi_pll_7nm_get_provider(struct msm_dsi_pll *pll,
-				     struct clk **byte_clk_provider,
-				     struct clk **pixel_clk_provider)
-{
-	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
-	struct clk_hw_onecell_data *hw_data = pll_7nm->hw_data;
-
-	DBG("DSI PLL%d", pll_7nm->id);
-
-	if (byte_clk_provider)
-		*byte_clk_provider = hw_data->hws[DSI_BYTE_PLL_CLK]->clk;
-	if (pixel_clk_provider)
-		*pixel_clk_provider = hw_data->hws[DSI_PIXEL_PLL_CLK]->clk;
-
-	return 0;
-}
-
 static void dsi_pll_7nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
@@ -1138,7 +1121,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		.pll_init = dsi_pll_7nm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_7nm_get_provider,
 		.destroy = dsi_pll_7nm_destroy,
 		.save_state = dsi_pll_7nm_save_state,
 		.restore_state = dsi_pll_7nm_restore_state,
@@ -1165,7 +1147,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 		.pll_init = dsi_pll_7nm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_7nm_get_provider,
 		.destroy = dsi_pll_7nm_destroy,
 		.save_state = dsi_pll_7nm_save_state,
 		.restore_state = dsi_pll_7nm_restore_state,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
index 98ee4560581a..5768e8d225fc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
@@ -74,17 +74,6 @@ void msm_dsi_pll_helper_unregister_clks(struct platform_device *pdev,
 /*
  * DSI PLL API
  */
-int msm_dsi_pll_get_clk_provider(struct msm_dsi_pll *pll,
-	struct clk **byte_clk_provider, struct clk **pixel_clk_provider)
-{
-	if (pll->cfg->pll_ops.get_provider)
-		return pll->cfg->pll_ops.get_provider(pll,
-					byte_clk_provider,
-					pixel_clk_provider);
-
-	return -EINVAL;
-}
-
 void msm_dsi_pll_destroy(struct msm_dsi_pll *pll)
 {
 	if (pll->cfg->pll_ops.destroy)
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
