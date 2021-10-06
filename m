Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBCF42483B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 22:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BF56EE7B;
	Wed,  6 Oct 2021 20:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482A06EE77
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 20:48:33 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id r19so14617349lfe.10
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 13:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=omBxJqx/FyuXHNB3iSfAI33Nu5vXJyXne6zSU6njhHw=;
 b=kMXzRWnKXIXhCAcuRaafEUEmwhOd6NWc2nEUh4LClHTs3R5bCtkIYFIrS9/Raog3Ku
 D9NVdxNw0AhF7oynGKTQtWVEkdlzqV4QVksSstJ7iiiXsM1irYJUsF4WQmFQMcUOkvcZ
 4W4rzmCo2Z7QfJwiCOliCag0FYJ2x6Q9lLE2Khlexe0X5VsDoP1uaIMhMD+zlz6shRjs
 qqAskVVYkxk9n2HLXFN+odr0++5h6qMv5XJbr+200nIyXOA6Q2Q96ND3AVjU7nPpOYYX
 7q9tnCZr6z7eugPd1jwCd+Da5GcGR3etXmaPv5WLAwd2rbOMi8BF+3oMoUyyrx3QckY0
 fCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=omBxJqx/FyuXHNB3iSfAI33Nu5vXJyXne6zSU6njhHw=;
 b=wdHYxC+tLnZWEek8Rqkt4U/9LOZptIxzusITKFxH/jEcSxIn0IJNklbPJ9nrwX7tZT
 FaT2vKjLCqIEj7c6NP5/QySxuYGXsjhlLya0yyH4YINKFcAba+tYpu+QlFfSBh07UOAd
 dxadQyXEGDCH0i/lWM6yb6/Cc0pK6O7A40pRhrpFSDTIEUZbkv1NwUfkeQ+uW2wZsOj3
 X6K4TDACE4AFVZveXz7YkuFlDdlRiy7cDias2t11SL/c0UqoxvryHTnpWeJnClV/DXFq
 LzmQYTcm3iUUKyorhtGxxcguXzgtmKjDXDoxU1Sb1opRFE6DdL+ZK0eheviDU0hPaUl/
 MsVA==
X-Gm-Message-State: AOAM531aJu8IvCVX83iSI2MfQOz9+WxlIEy5N6PkhAnfaBmWhwzfOr+Q
 +kvGpFFTXOgLXnsv7eq2K/3/9w==
X-Google-Smtp-Source: ABdhPJwzRAoSXLNBfgkpGRLNZ/6a2V7s0SldbWKOa+R9EMgjB1wOVpraMIWLbcsaUID8xKyMa2a4Ew==
X-Received: by 2002:a05:6512:1291:: with SMTP id
 u17mr238075lfs.226.1633553310810; 
 Wed, 06 Oct 2021 13:48:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id y19sm2378787ljc.116.2021.10.06.13.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:48:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/dsi: stop setting clock parents manually
Date: Wed,  6 Oct 2021 23:48:28 +0300
Message-Id: <20211006204828.1218225-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006204828.1218225-1-dmitry.baryshkov@linaro.org>
References: <20211006204828.1218225-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no reason to set clock parents manually, use device tree to
assign DSI/display clock parents to DSI PHY clocks. Dropping this manual
setup allows us to drop repeating code and to move registration of hw
clock providers to generic place.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  2 -
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 53 ---------------------------
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 11 +-----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 11 ------
 4 files changed, 2 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 7dfb6d198ca9..c03a8d09c764 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -173,8 +173,6 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 			     enum msm_dsi_phy_usecase uc);
-int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
-	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
 void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
 int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
 void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct msm_dsi_phy *phy);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 1ffcd0577e99..9600b4fa27eb 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2232,59 +2232,6 @@ void msm_dsi_host_set_phy_mode(struct mipi_dsi_host *host,
 	msm_host->cphy_mode = src_phy->cphy_mode;
 }
 
-int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
-	struct msm_dsi_phy *src_phy)
-{
-	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
-	struct clk *byte_clk_provider, *pixel_clk_provider;
-	int ret;
-
-	msm_host->cphy_mode = src_phy->cphy_mode;
-
-	ret = msm_dsi_phy_get_clk_provider(src_phy,
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
index 49a0a0841487..9342a822ad20 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -78,10 +78,7 @@ static int dsi_mgr_setup_components(int id)
 
 		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
 		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
-		ret = msm_dsi_host_set_src_pll(msm_dsi->host, msm_dsi->phy);
-	} else if (!other_dsi) {
-		ret = 0;
-	} else {
+	} else if (other_dsi) {
 		struct msm_dsi *master_link_dsi = IS_MASTER_DSI_LINK(id) ?
 							msm_dsi : other_dsi;
 		struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
@@ -107,13 +104,9 @@ static int dsi_mgr_setup_components(int id)
 					MSM_DSI_PHY_SLAVE);
 		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
 		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
-		ret = msm_dsi_host_set_src_pll(msm_dsi->host, clk_master_dsi->phy);
-		if (ret)
-			return ret;
-		ret = msm_dsi_host_set_src_pll(other_dsi->host, clk_master_dsi->phy);
 	}
 
-	return ret;
+	return 0;
 }
 
 static int enable_phy(struct msm_dsi *msm_dsi,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 8c65ef6968ca..8ec331e751a2 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -890,17 +890,6 @@ bool msm_dsi_phy_set_continuous_clock(struct msm_dsi_phy *phy, bool enable)
 	return phy->cfg->ops.set_continuous_clock(phy, enable);
 }
 
-int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
-	struct clk **byte_clk_provider, struct clk **pixel_clk_provider)
-{
-	if (byte_clk_provider)
-		*byte_clk_provider = phy->provided_clocks->hws[DSI_BYTE_PLL_CLK]->clk;
-	if (pixel_clk_provider)
-		*pixel_clk_provider = phy->provided_clocks->hws[DSI_PIXEL_PLL_CLK]->clk;
-
-	return 0;
-}
-
 void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
 {
 	if (phy->cfg->ops.save_pll_state) {
-- 
2.33.0

