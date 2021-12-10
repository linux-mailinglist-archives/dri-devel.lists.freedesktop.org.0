Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6304707AB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 18:49:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5F910E3F5;
	Fri, 10 Dec 2021 17:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D8C10E3D0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 17:49:14 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so9975459pja.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 09:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/0452zXAT4kPvtxYy8MYfb9PCgWUx3+xujH6gdkFnig=;
 b=lQzcmxEq/HQ+S6b0KkSdFJ9mFLNudD+Lw09n8NPh5KuOALmyKaaDwst+J6rBW3Ob+o
 4iawSteHVcyLRt3MUiYGnkHqYqrdWEH3dGPKAGXcOpapXSaR5Ylu/S1oRszRsTfmpK+8
 Iuky+UN1egWphvCTZGxo2y1vD5z/YmVHHliNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/0452zXAT4kPvtxYy8MYfb9PCgWUx3+xujH6gdkFnig=;
 b=zgKshRtLMW/afY+0lgR4mTsL3zFe+uosiLBXcNXyTu16FWNh0DLbelb9kueGiBAvuO
 VVe2FNcFaRgwBelcjhUrnCwFDYNjofvA+CkPXsVk8S6ExcRmovmHMhHgNBRmsVX+g+RV
 odyMKJXE63+lGAfiU2NcMpg6JJDOiDIimIezWvJAQr8r9CLDa67WWBucTKvr6TEDimw+
 U/d1eAYWupE/JQnsJV9KuFvL1K4Lvhhhd0nTpUQw1h50v6gB4PZTzSbtXhzqnnezqez+
 vDQc0R3VAsxaTL2BcpaEjex0DkbFPxLeiZmB/nEkrPcGYhl3pQbOcLClBA9bU7fnmPCu
 0/QQ==
X-Gm-Message-State: AOAM533LzXEgp5DK5qijDZt31EYZkvbBLcdgu2GNw/bEoi8tT5awJPYl
 r2xJkSE0DL3RZsuAlX7lHzhAiw==
X-Google-Smtp-Source: ABdhPJx5VzkKqdDSyH3h2IKMXg/aRZ083K6gnAxnl5L1tUTC7fksmMdwpGDqSg6jMS7SCmh6QdepWA==
X-Received: by 2002:a17:90a:c506:: with SMTP id
 k6mr25968773pjt.74.1639158554132; 
 Fri, 10 Dec 2021 09:49:14 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:28d6:2bae:633e:b110])
 by smtp.gmail.com with ESMTPSA id w1sm4039644pfg.11.2021.12.10.09.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 09:49:13 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: [PATCH 3/3] drm: bridge: Switch to devm_drm_of_get_bridge
Date: Fri, 10 Dec 2021 23:18:19 +0530
Message-Id: <20211210174819.2250178-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210174819.2250178-1-jagan@amarulasolutions.com>
References: <20211210174819.2250178-1-jagan@amarulasolutions.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_drm_of_get_bridge is capable of looking up the downstream
bridge and panel and trying to add a panel bridge if the panel
is found.

Replace explicit finding calls with devm_drm_of_get_bridge.

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Note: for mcde_dsi child lookups has dependecy with
https://patchwork.kernel.org/project/dri-devel/cover/20211207054747.461029-1-jagan@amarulasolutions.com/

 drivers/gpu/drm/bridge/analogix/anx7625.c     | 13 +------
 drivers/gpu/drm/bridge/chipone-icn6211.c      |  7 +---
 drivers/gpu/drm/bridge/nwl-dsi.c              | 18 ++-------
 drivers/gpu/drm/bridge/nxp-ptn3460.c          |  7 +---
 drivers/gpu/drm/bridge/parade-ps8622.c        |  7 +---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 15 ++-----
 drivers/gpu/drm/mcde/mcde_dsi.c               | 39 +++----------------
 drivers/gpu/drm/mediatek/mtk_dsi.c            | 14 ++-----
 8 files changed, 18 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 001fb39d9919..065cc3b041dd 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1333,8 +1333,6 @@ static int anx7625_parse_dt(struct device *dev,
 			    struct anx7625_platform_data *pdata)
 {
 	struct device_node *np = dev->of_node, *ep0;
-	struct drm_panel *panel;
-	int ret;
 	int bus_type, mipi_lanes;
 
 	anx7625_get_swing_setting(dev, pdata);
@@ -1371,16 +1369,7 @@ static int anx7625_parse_dt(struct device *dev,
 	if (of_property_read_bool(np, "analogix,audio-enable"))
 		pdata->audio_en = 1;
 
-	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
-	if (ret < 0) {
-		if (ret == -ENODEV)
-			return 0;
-		return ret;
-	}
-	if (!panel)
-		return -ENODEV;
-
-	pdata->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	pdata->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
 	if (IS_ERR(pdata->panel_bridge))
 		return PTR_ERR(pdata->panel_bridge);
 	DRM_DEV_DEBUG_DRIVER(dev, "get panel node.\n");
diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index a6151db95586..23c34039ac48 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -178,7 +178,6 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
 static int chipone_parse_dt(struct chipone *icn)
 {
 	struct device *dev = icn->dev;
-	struct drm_panel *panel;
 	int ret;
 
 	icn->vdd1 = devm_regulator_get_optional(dev, "vdd1");
@@ -214,11 +213,7 @@ static int chipone_parse_dt(struct chipone *icn)
 		return PTR_ERR(icn->enable_gpio);
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
-	if (ret)
-		return ret;
-
-	icn->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	icn->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
 	if (IS_ERR(icn->panel_bridge))
 		return PTR_ERR(icn->panel_bridge);
 
diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 6becdcdc99fe..f6859dfa6d36 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -910,22 +910,10 @@ static int nwl_dsi_bridge_attach(struct drm_bridge *bridge,
 {
 	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
 	struct drm_bridge *panel_bridge;
-	struct drm_panel *panel;
-	int ret;
-
-	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &panel,
-					  &panel_bridge);
-	if (ret)
-		return ret;
-
-	if (panel) {
-		panel_bridge = drm_panel_bridge_add(panel);
-		if (IS_ERR(panel_bridge))
-			return PTR_ERR(panel_bridge);
-	}
 
-	if (!panel_bridge)
-		return -EPROBE_DEFER;
+	panel_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 1, 0);
+	if (IS_ERR(panel_bridge))
+		return PTR_ERR(panel_bridge);
 
 	return drm_bridge_attach(bridge->encoder, panel_bridge, bridge, flags);
 }
diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index e941c1132598..1ab91f4e057b 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -263,7 +263,6 @@ static int ptn3460_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct ptn3460_bridge *ptn_bridge;
 	struct drm_bridge *panel_bridge;
-	struct drm_panel *panel;
 	int ret;
 
 	ptn_bridge = devm_kzalloc(dev, sizeof(*ptn_bridge), GFP_KERNEL);
@@ -271,11 +270,7 @@ static int ptn3460_probe(struct i2c_client *client,
 		return -ENOMEM;
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, NULL);
-	if (ret)
-		return ret;
-
-	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
 	if (IS_ERR(panel_bridge))
 		return PTR_ERR(panel_bridge);
 
diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index 614b19f0f1b7..37b308850b4e 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -452,18 +452,13 @@ static int ps8622_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct ps8622_bridge *ps8622;
 	struct drm_bridge *panel_bridge;
-	struct drm_panel *panel;
 	int ret;
 
 	ps8622 = devm_kzalloc(dev, sizeof(*ps8622), GFP_KERNEL);
 	if (!ps8622)
 		return -ENOMEM;
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, NULL);
-	if (ret)
-		return ret;
-
-	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
 	if (IS_ERR(panel_bridge))
 		return PTR_ERR(panel_bridge);
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 7900da1d4325..eafd1e5e6852 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -315,7 +315,6 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	struct dw_mipi_dsi *dsi = host_to_dsi(host);
 	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
 	struct drm_bridge *bridge;
-	struct drm_panel *panel;
 	int ret;
 
 	if (device->lanes > dsi->plat_data->max_data_lanes) {
@@ -329,17 +328,9 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
 
-	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0,
-					  &panel, &bridge);
-	if (ret)
-		return ret;
-
-	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_DSI);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
-	}
+	bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 1, 0);
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
 
 	dsi->panel_bridge = bridge;
 
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 5651734ce977..9371349b8b25 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1073,9 +1073,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct mcde *mcde = to_mcde(drm);
 	struct mcde_dsi *d = dev_get_drvdata(dev);
-	struct device_node *child;
-	struct drm_panel *panel = NULL;
-	struct drm_bridge *bridge = NULL;
+	struct drm_bridge *bridge;
 
 	if (!of_get_available_child_count(dev->of_node)) {
 		dev_info(dev, "unused DSI interface\n");
@@ -1100,37 +1098,10 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 		return PTR_ERR(d->lp_clk);
 	}
 
-	/* Look for a panel as a child to this node */
-	for_each_available_child_of_node(dev->of_node, child) {
-		panel = of_drm_find_panel(child);
-		if (IS_ERR(panel)) {
-			dev_err(dev, "failed to find panel try bridge (%ld)\n",
-				PTR_ERR(panel));
-			panel = NULL;
-
-			bridge = of_drm_find_bridge(child);
-			if (!bridge) {
-				dev_err(dev, "failed to find bridge\n");
-				return -EINVAL;
-			}
-		}
-	}
-	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_DSI);
-		if (IS_ERR(bridge)) {
-			dev_err(dev, "error adding panel bridge\n");
-			return PTR_ERR(bridge);
-		}
-		dev_info(dev, "connected to panel\n");
-		d->panel = panel;
-	} else if (bridge) {
-		/* TODO: AV8100 HDMI encoder goes here for example */
-		dev_info(dev, "connected to non-panel bridge (unsupported)\n");
-		return -ENODEV;
-	} else {
-		dev_err(dev, "no panel or bridge\n");
-		return -ENODEV;
+	bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	if (IS_ERR(bridge)) {
+		dev_err(dev, "error to get bridge\n");
+		return PTR_ERR(bridge);
 	}
 
 	d->bridge_out = bridge;
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5d90d2eb0019..a1b3e1f4b497 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1004,7 +1004,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 {
 	struct mtk_dsi *dsi;
 	struct device *dev = &pdev->dev;
-	struct drm_panel *panel;
 	struct resource *regs;
 	int irq_num;
 	int ret;
@@ -1021,17 +1020,10 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
-					  &panel, &dsi->next_bridge);
-	if (ret)
+	dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	if (IS_ERR(dsi->next_bridge)) {
+		ret = PTR_ERR(dsi->next_bridge);
 		goto err_unregister_host;
-
-	if (panel) {
-		dsi->next_bridge = devm_drm_panel_bridge_add(dev, panel);
-		if (IS_ERR(dsi->next_bridge)) {
-			ret = PTR_ERR(dsi->next_bridge);
-			goto err_unregister_host;
-		}
 	}
 
 	dsi->driver_data = of_device_get_match_data(dev);
-- 
2.25.1

