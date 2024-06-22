Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6210F913338
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 13:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E51710E20A;
	Sat, 22 Jun 2024 11:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="h+NIe9FB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D6A10E1AE
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 11:10:02 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45MB9Xup004926;
 Sat, 22 Jun 2024 06:09:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1719054573;
 bh=GEctsZEwlpy+/yLpHT9IsOxBMsbd+SrHYZnaQXFqqnY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=h+NIe9FBunufFYBtZY9WHmmHVgmbJIAixRb/Bb2FgPtcguvsxMHZ+Hl8D2u1PAJeK
 Oof2xjqLGZOQGlRBB9hgeIIxw6wip6QzkXioLhqzldPF75y1IwQbpvnHpX4YnB8oU5
 2FGV6s24pM40qcg+6gqvuju47feuR75z6dnyNNFc=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45MB9XHb003558
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 22 Jun 2024 06:09:33 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 22
 Jun 2024 06:09:33 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 22 Jun 2024 06:09:33 -0500
Received: from localhost (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45MB9WXm023101;
 Sat, 22 Jun 2024 06:09:33 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>
CC: DRI Development List <dri-devel@lists.freedesktop.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Dominik Haller <d.haller@phytec.de>, Sam
 Ravnborg <sam@ravnborg.org>, Thierry Reding <treding@nvidia.com>, Kieran
 Bingham <kieran.bingham+renesas@ideasonboard.com>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Praneeth Bajjuri
 <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, Devarsh Thakkar
 <devarsht@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra
 <j-luthra@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>
Subject: [PATCH v4 02/11] drm/bridge: cdns-dsi: Move to
 devm_drm_of_get_bridge()
Date: Sat, 22 Jun 2024 16:39:20 +0530
Message-ID: <20240622110929.3115714-3-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240622110929.3115714-1-a-bhatia1@ti.com>
References: <20240622110929.3115714-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Instead of manually finding the next bridge/panel, and maintaining the
panel-bridge (in-case the next entity is a panel), switch to using the
automatically managing devm_drm_of_get_bridge() API.

Drop the drm_panel support completely from the driver while at it.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
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

