Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBE536BC94
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 02:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17686E8A9;
	Tue, 27 Apr 2021 00:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2016E8AA
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 00:18:34 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id 124so9947939lff.5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 17:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ajAD9eEucAq/1mj2QhjuXHx0IT7uBG4GS9vHJTuXZCg=;
 b=veIkUjYbGsXFLfQzNqOMf3rMngJ8Yy5CmQ7h+rGuCVoJip6z3Y0JgAwqUiRgZ74X5m
 zaio9b21O+I5ccOeoJ/qWXjybtpCu5n7mJSpt51gi/QTsYG10UdjLhepB+eGE8TrDwHX
 COPXpCX6UDDXQVsjKRJwF84qDdkoOxyAhvp0Iuc3fwyGMwCrGITFoSOvG9y9DMPu4x8I
 5FAcl4aWJkaGn/0ICC/p9am2jvZvttzC3rnSfoi6RWzOu4jaEadNmxMg44ftAGUubBeP
 g4AWcVBjVCk+FPW5J1JOfQdvMJvw7bfT9Xz2HvpfBgA0O+epOXTfsNxc7RfrMqhYze0R
 kElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ajAD9eEucAq/1mj2QhjuXHx0IT7uBG4GS9vHJTuXZCg=;
 b=YQbH14bgUZ7DscBohHbqpbi18nSFgXJwp/67eM1SMUg5fUg/7KMvRtEghUTWNAOHNy
 U4WmHns1bXzbPICAicSjYUauCo6Nlj/kTgQ+uYwaGUm3tKy1QbRm1Jdw0Zi2EaKejkCc
 UyszEVNMgDCdhODsazytCB5WTOnooQV2aewa3wmOvET/pDUzLlrf7mKt4NcRmOP1Z4q+
 EDeuBM6+TqINGF23ROSk4NWl5naLPEyR8eE6IYxazJDxEcZ1toR1Dh4NEXQnxRDN6Ia6
 qTA/IwFcXTgkIq6hvvKUB/DxtA4/FkiZqMxW850r9DMK4Z8YIAmVyZ9c0RkaUhdBdDLw
 vRvQ==
X-Gm-Message-State: AOAM5306J6BlZUtyydvR7noFKxU49Q2ZIux4iq8kj19Q8xk9D/FPK8Xj
 Np6HBqCFjTSjN1RdIYa69bTQDw==
X-Google-Smtp-Source: ABdhPJxZV0HGGPlqyi2YhEmskeLzfc5Ve8nNJAaPSP428Hqsh3aWBxgo51O1WYAMd71EXKvYduvvkw==
X-Received: by 2002:ac2:58c6:: with SMTP id u6mr14274684lfo.419.1619482713215; 
 Mon, 26 Apr 2021 17:18:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d15sm1555100lfn.7.2021.04.26.17.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 17:18:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 4/4] drm/msm/dsi: add DSI PHY registers to snapshot data
Date: Tue, 27 Apr 2021 03:18:28 +0300
Message-Id: <20210427001828.2375555-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DSI PHY registers to the msm state snapshots to be able to check
their contents.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         |  1 +
 drivers/gpu/drm/msm/dsi/dsi.h         |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 31 +++++++++++++++++++++++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h |  4 ++++
 4 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 322d2e535df0..75afc12a7b25 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -269,5 +269,6 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi)
 {
 	msm_dsi_host_snapshot(disp_state, msm_dsi->host);
+	msm_dsi_phy_snapshot(disp_state, msm_dsi->phy);
 }
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index b5679cf89413..cea73f9c4be9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -176,6 +176,7 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
 	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
 void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
 int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
+void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct msm_dsi_phy *phy);
 
 #endif /* __DSI_CONNECTOR_H__ */
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index f0a2ddf96a4b..bf7a4c20c13c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -658,14 +658,14 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	phy->regulator_ldo_mode = of_property_read_bool(dev->of_node,
 				"qcom,dsi-phy-regulator-ldo-mode");
 
-	phy->base = msm_ioremap(pdev, "dsi_phy", "DSI_PHY");
+	phy->base = msm_ioremap_size(pdev, "dsi_phy", "DSI_PHY", &phy->base_size);
 	if (IS_ERR(phy->base)) {
 		DRM_DEV_ERROR(dev, "%s: failed to map phy base\n", __func__);
 		ret = -ENOMEM;
 		goto fail;
 	}
 
-	phy->pll_base = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
+	phy->pll_base = msm_ioremap_size(pdev, "dsi_pll", "DSI_PLL", &phy->pll_size);
 	if (IS_ERR(phy->pll_base)) {
 		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map pll base\n", __func__);
 		ret = -ENOMEM;
@@ -673,7 +673,7 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	}
 
 	if (phy->cfg->has_phy_lane) {
-		phy->lane_base = msm_ioremap(pdev, "dsi_phy_lane", "DSI_PHY_LANE");
+		phy->lane_base = msm_ioremap_size(pdev, "dsi_phy_lane", "DSI_PHY_LANE", &phy->lane_size);
 		if (IS_ERR(phy->lane_base)) {
 			DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy lane base\n", __func__);
 			ret = -ENOMEM;
@@ -682,7 +682,7 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	}
 
 	if (phy->cfg->has_phy_regulator) {
-		phy->reg_base = msm_ioremap(pdev, "dsi_phy_regulator", "DSI_PHY_REG");
+		phy->reg_base = msm_ioremap_size(pdev, "dsi_phy_regulator", "DSI_PHY_REG", &phy->reg_size);
 		if (IS_ERR(phy->reg_base)) {
 			DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy regulator base\n", __func__);
 			ret = -ENOMEM;
@@ -868,3 +868,26 @@ int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy)
 
 	return 0;
 }
+
+void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct msm_dsi_phy *phy)
+{
+	msm_disp_snapshot_add_block(disp_state,
+			phy->base_size, phy->base,
+			"dsi%d_phy", phy->id);
+
+	/* Do not try accessing PLL registers if it is switched off */
+	if (phy->pll_on)
+		msm_disp_snapshot_add_block(disp_state,
+			phy->pll_size, phy->pll_base,
+			"dsi%d_pll", phy->id);
+
+	if (phy->lane_base)
+		msm_disp_snapshot_add_block(disp_state,
+			phy->lane_size, phy->lane_base,
+			"dsi%d_lane", phy->id);
+
+	if (phy->reg_base)
+		msm_disp_snapshot_add_block(disp_state,
+			phy->reg_size, phy->reg_base,
+			"dsi%d_reg", phy->id);
+}
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 94a77ac364d3..5b0feef87127 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -85,6 +85,10 @@ struct msm_dsi_phy {
 	void __iomem *pll_base;
 	void __iomem *reg_base;
 	void __iomem *lane_base;
+	phys_addr_t base_size;
+	phys_addr_t pll_size;
+	phys_addr_t reg_size;
+	phys_addr_t lane_size;
 	int id;
 
 	struct clk *ahb_clk;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
