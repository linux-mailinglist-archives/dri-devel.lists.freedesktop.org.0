Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DA2A1CE0E
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 20:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47A910E468;
	Sun, 26 Jan 2025 19:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="aqn3p0QY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com
 [91.218.175.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67EBC10E468
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 19:17:00 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1737919015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AN7JB7Cg+gBv3L+erE+eeh7+gQ4NZV9djINY+4ELNbw=;
 b=aqn3p0QY8UcfiS81Z3oiMl+1wPN20yxKKSGVR/7YOwTdQQ22bn2YNPsU87iy5XXwbqVy6K
 paHosxao+gBw05Y/WvxlznoTKz6va0f2HYW+dAd73KfMiQw8/8fDz7EphbEYfT6XLuKYEH
 1RqnngNd1YhCxSIVhGVuRSOlkYEGsfI=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v8 06/13] drm/bridge: cdns-dsi: Move to
 devm_drm_of_get_bridge()
Date: Mon, 27 Jan 2025 00:45:44 +0530
Message-Id: <20250126191551.741957-7-aradhya.bhatia@linux.dev>
In-Reply-To: <20250126191551.741957-1-aradhya.bhatia@linux.dev>
References: <20250126191551.741957-1-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

From: Aradhya Bhatia <a-bhatia1@ti.com>

Instead of manually finding the next bridge/panel, and maintaining the
panel-bridge (in-case the next entity is a panel), switch to using the
automatically managing devm_drm_of_get_bridge() API.

Drop the drm_panel support completely from the driver while at it.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 28 ++-----------------
 .../gpu/drm/bridge/cadence/cdns-dsi-core.h    |  2 --
 2 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 6a77ca36cb9d..c2512342139c 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -941,8 +941,6 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
 	struct cdns_dsi_output *output = &dsi->output;
 	struct cdns_dsi_input *input = &dsi->input;
 	struct drm_bridge *bridge;
-	struct drm_panel *panel;
-	struct device_node *np;
 	int ret;
 
 	/*
@@ -960,26 +958,10 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
 	/*
 	 * The host <-> device link might be described using an OF-graph
 	 * representation, in this case we extract the device of_node from
-	 * this representation, otherwise we use dsidev->dev.of_node which
-	 * should have been filled by the core.
+	 * this representation.
 	 */
-	np = of_graph_get_remote_node(dsi->base.dev->of_node, DSI_OUTPUT_PORT,
-				      dev->channel);
-	if (!np)
-		np = of_node_get(dev->dev.of_node);
-
-	panel = of_drm_find_panel(np);
-	if (!IS_ERR(panel)) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_DSI);
-	} else {
-		bridge = of_drm_find_bridge(np);
-		if (!bridge)
-			bridge = ERR_PTR(-EINVAL);
-	}
-
-	of_node_put(np);
-
+	bridge = devm_drm_of_get_bridge(dsi->base.dev, dsi->base.dev->of_node,
+					DSI_OUTPUT_PORT, dev->channel);
 	if (IS_ERR(bridge)) {
 		ret = PTR_ERR(bridge);
 		dev_err(host->dev, "failed to add DSI device %s (err = %d)",
@@ -989,7 +971,6 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
 
 	output->dev = dev;
 	output->bridge = bridge;
-	output->panel = panel;
 
 	/*
 	 * The DSI output has been properly configured, we can now safely
@@ -1005,12 +986,9 @@ static int cdns_dsi_detach(struct mipi_dsi_host *host,
 			   struct mipi_dsi_device *dev)
 {
 	struct cdns_dsi *dsi = to_cdns_dsi(host);
-	struct cdns_dsi_output *output = &dsi->output;
 	struct cdns_dsi_input *input = &dsi->input;
 
 	drm_bridge_remove(&input->bridge);
-	if (output->panel)
-		drm_panel_bridge_remove(output->bridge);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
index ca7ea2da635c..5db5dbbbcaad 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
@@ -10,7 +10,6 @@
 
 #include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
-#include <drm/drm_panel.h>
 
 #include <linux/bits.h>
 #include <linux/completion.h>
@@ -21,7 +20,6 @@ struct reset_control;
 
 struct cdns_dsi_output {
 	struct mipi_dsi_device *dev;
-	struct drm_panel *panel;
 	struct drm_bridge *bridge;
 	union phy_configure_opts phy_opts;
 };
-- 
2.34.1

