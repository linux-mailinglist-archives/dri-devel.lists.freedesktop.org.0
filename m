Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B326530D5FA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 10:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566986EA2A;
	Wed,  3 Feb 2021 09:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B026EA2A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 09:13:29 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id l18so4183903pji.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 01:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=blstrkczrF0azHzWZ1ftNKo3a6psEv5FLcX/MloVE5M=;
 b=FWgUNKiSG8o4zE4RPWoN096MvbZyytIRr+Lf8sbZx1J4Ug1Lw1FkSdrBIE231ibPvv
 jMyPlnLTQ3ipp/RGecO9HgJGl17pGmFR8wMEI0MDIM57K0aofUe3ceMGGmDgJtAh5BM0
 jO2ZZfbYxz0avCxBx7IgDDEAcmvGLceyzWG20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=blstrkczrF0azHzWZ1ftNKo3a6psEv5FLcX/MloVE5M=;
 b=sg47dglsY1XvmQfipApGJYrty1Y4939MZHa/h2sT52PD3jR2GIUq8vIbjE+Xpor0eD
 PQ3OcgN4O4wlkBCer5bmZrP5wtS4oEuLHVtb6CrEkTBSDZaJy2MwnthHytYpjwYRBZcg
 I8Y3QfyxCAalQ0DGcNQte5EZV6or6REr3kwIgvJb5QaaeOD0z8XcEgELqsC8w6TFaPFR
 kjD8RkFBlfxPHjyk958Og3xa975bUtJ8eUZf4SBD2b6Fzf/985W9i/LNswTb/XLWcpvg
 Ggr61ALkIuZKjI+DZQJFze3dy/uPZ+IS92yPWMNpWub18wMyKvf7lmLY+FtFKRf9IT62
 gGwA==
X-Gm-Message-State: AOAM531uxeCexBcr9zgt/4g6HBfzPIM0ta9GZWXl95mrZW6B3eIrocFV
 wCC4EMBUuxHbBa3yL5xUhvX/6w==
X-Google-Smtp-Source: ABdhPJz1mOojiY2wys2t36rkXJ+/Ao36pKJC/pVwWEiOARQIUS/P4A/yXaNJ2k07D6X99kzvQ4ju/w==
X-Received: by 2002:a17:90a:6589:: with SMTP id
 k9mr2260723pjj.100.1612343608990; 
 Wed, 03 Feb 2021 01:13:28 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([45.249.78.214])
 by smtp.gmail.com with ESMTPSA id l3sm1794520pgn.8.2021.02.03.01.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 01:13:27 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>, Heiko Stubner <heiko@sntech.de>,
 Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>
Subject: [PATCH] drm/bridge: dw-mipi-dsi: Move drm_bridge_add into probe
Date: Wed,  3 Feb 2021 14:43:06 +0530
Message-Id: <20210203091306.140518-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Usual I2C configured DSI bridge drivers have drm_bridge_add
in probe and mipi_dsi_attach in bridge attach functions.

With, this approach the drm pipeline is unable to find the
dsi bridge in stm drm drivers since the dw-mipi-dsi bridge is
adding drm bridge during bridge attach operations instead of
the probe.

This specific issue may not encounter for rockchip drm dsi
drivers, since rockchip drm uses component binding operations,
unlike stm drm drivers.

So, possible solutions are
1. Move drm_bridge_add into the dw-mipi-dsi probe.
2. Add mipi_dsi_attach in the bridge drivers probe.
3. Add component binding operations for stm drm drivers.

Option 1 is a relatively possible solution as most of the
mainline drm dsi with bridge drivers have a similar approach
to their dsi host vs bridge registration.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 35 +++++++++----------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 6b268f9445b3..8a535041f071 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -314,8 +314,6 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 {
 	struct dw_mipi_dsi *dsi = host_to_dsi(host);
 	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
-	struct drm_bridge *bridge;
-	struct drm_panel *panel;
 	int ret;
 
 	if (device->lanes > dsi->plat_data->max_data_lanes) {
@@ -329,22 +327,6 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
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
-
-	dsi->panel_bridge = bridge;
-
-	drm_bridge_add(&dsi->bridge);
-
 	if (pdata->host_ops && pdata->host_ops->attach) {
 		ret = pdata->host_ops->attach(pdata->priv_data, device);
 		if (ret < 0)
@@ -1105,6 +1087,8 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	struct reset_control *apb_rst;
 	struct dw_mipi_dsi *dsi;
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
 	int ret;
 
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
@@ -1167,6 +1151,20 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 	dw_mipi_dsi_debugfs_init(dsi);
 	pm_runtime_enable(dev);
 
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0,
+					  &panel, &bridge);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (panel) {
+		bridge = drm_panel_bridge_add_typed(panel,
+						    DRM_MODE_CONNECTOR_DSI);
+		if (IS_ERR(bridge))
+			return ERR_PTR(-ENODEV);
+	}
+
+	dsi->panel_bridge = bridge;
+
 	dsi->dsi_host.ops = &dw_mipi_dsi_host_ops;
 	dsi->dsi_host.dev = dev;
 	ret = mipi_dsi_host_register(&dsi->dsi_host);
@@ -1181,6 +1179,7 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 #ifdef CONFIG_OF
 	dsi->bridge.of_node = pdev->dev.of_node;
 #endif
+	drm_bridge_add(&dsi->bridge);
 
 	return dsi;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
