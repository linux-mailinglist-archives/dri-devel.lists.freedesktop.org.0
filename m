Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B4B463BB3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 17:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7330C6E52A;
	Tue, 30 Nov 2021 16:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310D76E52A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 16:25:23 +0000 (UTC)
Received: from Monstersaurus.local
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8715E1447;
 Tue, 30 Nov 2021 17:25:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1638289521;
 bh=tPTO6x4/UmqDVDNMFfhIt7vn9FEScoUNFaizGSmWb3Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Erinv4cC7+StbzjmVPXo/DMz5PnMqVrzoPrrufyUAUIgrzoA8++rt0IjABmnDrfLy
 cExEBcOZaZQS19qta0Ul92ePEbrOa/e8qn5v9/j78LyP1oYCYD+2TkasI5YX+RC1Rx
 Sdwc+lMb95uI47b+CeEQWt5HJ3EgyrSTQFc1spE0=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm: rcar-du: mipi-dsi: Use devm_drm_of_get_bridge
 helper
Date: Tue, 30 Nov 2021 16:25:13 +0000
Message-Id: <20211130162513.2898302-3-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211130162513.2898302-1-kieran.bingham+renesas@ideasonboard.com>
References: <20211130162513.2898302-1-kieran.bingham+renesas@ideasonboard.com>
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of open coding the calls for
  drm_of_find_panel_or_bridge()
  devm_drm_panel_bridge_add()

use the devm_drm_of_get_bridge() helper directly.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
v2:
 - New patch

 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 0a9f197ef62c..1dfe20d3d0f2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -637,7 +637,7 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 					struct mipi_dsi_device *device)
 {
 	struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
-	struct drm_panel *panel;
+	struct device *dev = dsi->dev;
 	int ret;
 
 	if (device->lanes > dsi->num_data_lanes)
@@ -646,20 +646,9 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->lanes = device->lanes;
 	dsi->format = device->format;
 
-	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &panel,
-					  &dsi->next_bridge);
-	if (ret) {
-		dev_err_probe(dsi->dev, ret, "could not find next bridge\n");
-		return ret;
-	}
-
-	if (!dsi->next_bridge) {
-		dsi->next_bridge = devm_drm_panel_bridge_add(dsi->dev, panel);
-		if (IS_ERR(dsi->next_bridge)) {
-			dev_err(dsi->dev, "failed to create panel bridge\n");
-			return PTR_ERR(dsi->next_bridge);
-		}
-	}
+	dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(dsi->next_bridge))
+		return PTR_ERR(dsi->next_bridge);
 
 	/* Initialize the DRM bridge. */
 	dsi->bridge.funcs = &rcar_mipi_dsi_bridge_ops;
-- 
2.30.2

