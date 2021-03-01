Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEAA329514
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 00:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3915E6E0BA;
	Mon,  1 Mar 2021 23:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9179689F27
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 23:26:14 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id p21so28270199lfu.11
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 15:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I6ch+s4kHlt6Z+1DgFu/5kW++qE+DBAx2Ejto5oMUGc=;
 b=Hh29rtUkPKQ0SNwMAt7k3R4zdqM0+TW2pECypqSe3I8dAskrHudxtUId1YRUtY4hzv
 fbe5aNPNr1cma8t2L4I9VHxjGFRvMDZF16dKukAoCjNXRDuL7Nvm4orhV21S4MK/MxRF
 LTOOe280HwbCjsdhAAbCTyyhdTh5N3MPIsxs07kHqlPETAb+qkmu6DYAR3osaqxgQUyA
 Yvt3J6B+bDv3bOV6saQAnUMrXtotTpGq868kz1DNIES0KtsJ4V2B+D2QDELiy3KxSNnB
 Oq/nhpcfY8z48SOIGkGBJZ2+g/0g6YAMDwAJRwvt99oRM2vEdevElhKa6VR3I6mrq/aa
 TOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I6ch+s4kHlt6Z+1DgFu/5kW++qE+DBAx2Ejto5oMUGc=;
 b=QDXZW5Vbv7Mqor8S1KBkLr66ftXVVYHbutgR+lkHiOohhzrRthM6swt+f+DcoDChBB
 gShgFiOSEYDPKCXuaqW3RQ9efR7AWtJ39r65y05wdJR5WjD+XdHFQJAl61WVBlWwQsO0
 tvZnLFpWSPGje0XpGMMgDkoTGMksWVZ0OaGzBt2k51rZeg/3Bed7Tpyll8l3kNg2fbyi
 5EAFwFUAM1CH+tjNmvXNZ1z/j52J7rKkmJ6RBAYZdatbXou0nfFP7pamWJ3jNMYC56YF
 OqFyR9H77fcmw9bBHqu3nPo5DfWPeAzN3pYe29/Io/Y3CN1xrPUPRrGCgpUp2iNm8Lz/
 31mQ==
X-Gm-Message-State: AOAM5329pa72855UOa4Y997H0WyIVRIxQX6M2UnWiNOnfsDkOhsgv7JG
 Iuv4dUIGtoeK7hBXZiGRiIZ4WQ==
X-Google-Smtp-Source: ABdhPJz93if7XFAt2U9ADLXA8EFPq/SqiPpwEBBEAjIQuaEBjWNTXio96HsV8sL8WKCvhrENtraI5A==
X-Received: by 2002:a05:6512:22ce:: with SMTP id
 g14mr10830114lfu.101.1614641173000; 
 Mon, 01 Mar 2021 15:26:13 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 15:26:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [RFC 06/24] drm/msm/dsi: stop setting clock parents manually
Date: Tue,  2 Mar 2021 02:24:49 +0300
Message-Id: <20210301232506.3057401-7-dmitry.baryshkov@linaro.org>
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
index a130330b97b6..da59f8bc8d2c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -108,19 +108,12 @@ struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi);
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
@@ -155,8 +148,6 @@ unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
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
index b8dd8072d24c..ea1bd375b9ff 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -27,9 +27,6 @@ struct msm_dsi_phy_ops {
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
index 339f7a56e555..fee080677c36 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -618,23 +618,6 @@ static int dsi_pll_10nm_set_usecase(struct msm_dsi_pll *pll,
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
@@ -1118,7 +1101,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 		.pll_init = dsi_pll_10nm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_10nm_get_provider,
 		.destroy = dsi_pll_10nm_destroy,
 		.save_state = dsi_pll_10nm_save_state,
 		.restore_state = dsi_pll_10nm_restore_state,
@@ -1145,7 +1127,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 		.pll_init = dsi_pll_10nm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_10nm_get_provider,
 		.destroy = dsi_pll_10nm_destroy,
 		.save_state = dsi_pll_10nm_save_state,
 		.restore_state = dsi_pll_10nm_restore_state,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index a141c37d86ab..f43099ffa827 100644
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
@@ -1243,7 +1228,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 		.pll_init = dsi_pll_14nm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_14nm_get_provider,
 		.destroy = dsi_pll_14nm_destroy,
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
@@ -1272,7 +1256,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 		.pll_init = dsi_pll_14nm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_14nm_get_provider,
 		.destroy = dsi_pll_14nm_destroy,
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 4ddb68f5a82a..353b91de7106 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -492,21 +492,6 @@ static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
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
@@ -838,7 +823,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 		.pll_init = dsi_pll_28nm_hpm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_28nm_get_provider,
 		.destroy = dsi_pll_28nm_destroy,
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
@@ -867,7 +851,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 		.pll_init = dsi_pll_28nm_hpm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_28nm_get_provider,
 		.destroy = dsi_pll_28nm_destroy,
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
@@ -896,7 +879,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 		.pll_init = dsi_pll_28nm_lp_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_28nm_get_provider,
 		.destroy = dsi_pll_28nm_destroy,
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index bd2582575a07..8af50c7ad2f9 100644
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
@@ -703,7 +688,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
 		.pll_init = dsi_pll_28nm_8960_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_28nm_get_provider,
 		.destroy = dsi_pll_28nm_destroy,
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index d34ddf50c5ff..542526949347 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -643,23 +643,6 @@ static int dsi_pll_7nm_set_usecase(struct msm_dsi_pll *pll,
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
@@ -1151,7 +1134,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		.pll_init = dsi_pll_7nm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_7nm_get_provider,
 		.destroy = dsi_pll_7nm_destroy,
 		.save_state = dsi_pll_7nm_save_state,
 		.restore_state = dsi_pll_7nm_restore_state,
@@ -1178,7 +1160,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
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
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
