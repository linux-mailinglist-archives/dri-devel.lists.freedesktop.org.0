Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51413BAD51
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 16:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA0589BAB;
	Sun,  4 Jul 2021 14:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8181989BAB
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 14:03:23 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id w15so15344858pgk.13
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 07:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Z0/vjCqF693Bx9z202XXmy8AdxNcGN9GiK+na2KyxM=;
 b=nwsr4bkyjL2hJYXRSn2eLVyPffnb44rQCZTovXnNcLeP26GGT7dqeEdyQB/eTmshf4
 8qgYgrskb3tFXr9sw3yEqQJiv/kKD2s2O2UDG6MpopQeRk8ea6G4OQTd7VT2uYnVpUyN
 wezeOgUsRpDNmO4axh23POdzQwEgLZ0HvSSME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Z0/vjCqF693Bx9z202XXmy8AdxNcGN9GiK+na2KyxM=;
 b=R/E6etx8KnB1BplViBcJcgMnl2ihPLKnjtREsqXKh2dOvx31o0BCHTORaq+DJNoBOG
 S/u1eu7cUQv/Q0O5yK845MwKheJCLpDsXvzfShLsXXWaIgmOhlNPGdbmtnS19AAnJy/+
 hQgGXQnDAUP6ngXJQSN3pMO43izVeEjEmRVWEguc0o777fBjLdddWMep1HL03/I6puOi
 bTi/pbkonL45iXwv2ZeHBQ2iP38L7v4I3SHUiCGsCW6ZWG+cDSlGa/7V+iSqFM5bJJMH
 XF1Ap7NJw3Qp5YLwLb3bZgfZetp1jFk0daiPwVvO14cXmudA8vogLIfzLIiXeNQINCxw
 pASw==
X-Gm-Message-State: AOAM531evqi31kAUsYoGdg7YpWod50Ed7tCYgPIo7LeKYtzO6v5oVl32
 bcDM7PGyIuZMXEceswf4RVRwQQ==
X-Google-Smtp-Source: ABdhPJzSgK3KCZeOuvnRKbiyAMKw5W/TWJQaIieY9vxdOakRdngKabRlxvfRpV/h2pwhkAgxGf1FHQ==
X-Received: by 2002:a05:6a00:1c45:b029:31c:5106:e354 with SMTP id
 s5-20020a056a001c45b029031c5106e354mr4080591pfw.15.1625407403123; 
 Sun, 04 Jul 2021 07:03:23 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
 by smtp.gmail.com with ESMTPSA id t14sm11719253pgm.9.2021.07.04.07.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 07:03:22 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Heiko Stubner <heiko@sntech.de>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonathan Liu <net147@gmail.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Subject: [PATCH] drm/bridge: dw-mipi-dsi: Find the possible DSI devices
Date: Sun,  4 Jul 2021 19:33:09 +0530
Message-Id: <20210704140309.268469-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Finding panel_or_bridge might vary based on associated
DSI devices like DSI panel, bridge, and I2C based DSI
bridge.

1. DSI panels and bridges will invoke the host attach
   from probe in order to find the panel_or_bridge.

   chipone_probe()
       dw_mipi_dsi_host_attach().start
	   dw_mipi_dsi_panel_or_bridge()
		...found the panel_or_bridge...

   ltdc_encoder_init().start
       dw_mipi_dsi_bridge_attach().start
		   dw_mipi_dsi_host_attach().start
		       chipone_attach(). start

	               chipone_attach(). done
		   dw_mipi_dsi_host_attach().done
       dw_mipi_dsi_bridge_attach(). done
   ltdc_encoder_init().done

2. I2C based DSI bridge will invoke the drm_bridge_attach
   from bridge attach in order to find the panel_or_bridge.

   ltdc_encoder_init().start
       dw_mipi_dsi_bridge_attach().start
	   dw_mipi_dsi_panel_or_bridge()
		...found the panel_or_bridge...
		   dw_mipi_dsi_host_attach().start
		       sn65dsi83_attach(). start

	               sn65dsi83_attach(). done
		   dw_mipi_dsi_host_attach().done
       dw_mipi_dsi_bridge_attach(). done
   ltdc_encoder_init().done

So, invoke the panel_or_bridge from host attach and
bridge attach in order to find all possible DSI devices.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 58 ++++++++++++++-----
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 6b268f9445b3..45f4515dda00 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -246,6 +246,7 @@ struct dw_mipi_dsi {
 
 	struct clk *pclk;
 
+	bool device_found;
 	unsigned int lane_mbps; /* per lane */
 	u32 channel;
 	u32 lanes;
@@ -309,13 +310,37 @@ static inline u32 dsi_read(struct dw_mipi_dsi *dsi, u32 reg)
 	return readl(dsi->base + reg);
 }
 
+static int dw_mipi_dsi_panel_or_bridge(struct dw_mipi_dsi *dsi,
+				       struct device_node *node)
+{
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
+	int ret;
+
+	ret = drm_of_find_panel_or_bridge(node, 1, 0, &panel, &bridge);
+	if (ret)
+		return ret;
+
+	if (panel) {
+		bridge = drm_panel_bridge_add_typed(panel,
+						    DRM_MODE_CONNECTOR_DSI);
+		if (IS_ERR(bridge))
+			return PTR_ERR(bridge);
+	}
+
+	dsi->panel_bridge = bridge;
+
+	if (!dsi->panel_bridge)
+		return -EPROBE_DEFER;
+
+	return 0;
+}
+
 static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 				   struct mipi_dsi_device *device)
 {
 	struct dw_mipi_dsi *dsi = host_to_dsi(host);
 	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
-	struct drm_bridge *bridge;
-	struct drm_panel *panel;
 	int ret;
 
 	if (device->lanes > dsi->plat_data->max_data_lanes) {
@@ -329,22 +354,14 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
 
-	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0,
-					  &panel, &bridge);
-	if (ret)
-		return ret;
+	if (!dsi->device_found) {
+		ret = dw_mipi_dsi_panel_or_bridge(dsi, host->dev->of_node);
+		if (ret)
+			return ret;
 
-	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_DSI);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
+		dsi->device_found = true;
 	}
 
-	dsi->panel_bridge = bridge;
-
-	drm_bridge_add(&dsi->bridge);
-
 	if (pdata->host_ops && pdata->host_ops->attach) {
 		ret = pdata->host_ops->attach(pdata->priv_data, device);
 		if (ret < 0)
@@ -999,6 +1016,16 @@ static int dw_mipi_dsi_bridge_attach(struct drm_bridge *bridge,
 	/* Set the encoder type as caller does not know it */
 	bridge->encoder->encoder_type = DRM_MODE_ENCODER_DSI;
 
+	if (!dsi->device_found) {
+		int ret;
+
+		ret = dw_mipi_dsi_panel_or_bridge(dsi, dsi->dev->of_node);
+		if (ret)
+			return ret;
+
+		dsi->device_found = true;
+	}
+
 	/* Attach the panel-bridge to the dsi bridge */
 	return drm_bridge_attach(bridge->encoder, dsi->panel_bridge, bridge,
 				 flags);
@@ -1181,6 +1208,7 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 #ifdef CONFIG_OF
 	dsi->bridge.of_node = pdev->dev.of_node;
 #endif
+	drm_bridge_add(&dsi->bridge);
 
 	return dsi;
 }
-- 
2.25.1

