Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C468C9A50A1
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 22:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246BD10E3B5;
	Sat, 19 Oct 2024 20:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="CNNIG9WM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com
 [95.215.58.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A28710E3B5
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 20:00:03 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1729367676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=srm7vZAfQxc9DzsrRdMZbEh+9p4DiAfMJQfxRMCZquY=;
 b=CNNIG9WMEgeWsroGQhJXARxwcXsUQpGfCp8y3xouoc2rPmMFGyDeCKvHt9jOh89RFFP8Jx
 FgpbeQOrTuMwckVGEq2YC5JjX7cqfRXi+M3H1jfbfIP6vFPoBQERUJLL7IS31g+mq3FxNm
 nwrm/5FyYqCM1l3+7y0D2p1ls/acHFg=
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
Cc: Dominik Haller <d.haller@phytec.de>, Sam Ravnborg <sam@ravnborg.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v5 02/13] drm/bridge: cdns-dsi: Move to
 devm_drm_of_get_bridge()
Date: Sun, 20 Oct 2024 01:24:00 +0530
Message-Id: <20241019195411.266860-3-aradhya.bhatia@linux.dev>
In-Reply-To: <20241019195411.266860-1-aradhya.bhatia@linux.dev>
References: <20241019195411.266860-1-aradhya.bhatia@linux.dev>
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
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 28 ++-----------------
 .../gpu/drm/bridge/cadence/cdns-dsi-core.h    |  2 --
 2 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index b016f2ba06bb..5159c3f0853e 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -920,8 +920,6 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
 	struct cdns_dsi_output *output = &dsi->output;
 	struct cdns_dsi_input *input = &dsi->input;
 	struct drm_bridge *bridge;
-	struct drm_panel *panel;
-	struct device_node *np;
 	int ret;
 
 	/*
@@ -939,26 +937,10 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
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
@@ -968,7 +950,6 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
 
 	output->dev = dev;
 	output->bridge = bridge;
-	output->panel = panel;
 
 	/*
 	 * The DSI output has been properly configured, we can now safely
@@ -984,12 +965,9 @@ static int cdns_dsi_detach(struct mipi_dsi_host *host,
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

