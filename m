Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE443AB8DEC
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 19:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A54B10E931;
	Thu, 15 May 2025 17:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC1C10E931
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 17:37:06 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <m.felsch@pengutronix.de>)
 id 1uFcVk-0008Ry-Ls; Thu, 15 May 2025 19:36:48 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 alexander.stein@ew.tq-group.com
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/bridge: fsl-ldb: simplify device_node error
 handling
Date: Thu, 15 May 2025 19:36:43 +0200
Message-Id: <20250515173643.2140748-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250515173643.2140748-1-m.felsch@pengutronix.de>
References: <20250515173643.2140748-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Make use of __free(device_node) to simplify the of_node_put() error
handling paths. No functional changes.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Changelog:
v2:
 - drop __free() from panel_node

 drivers/gpu/drm/bridge/fsl-ldb.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 6916cdb15372..f80c68617ce5 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -293,7 +293,8 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *panel_node;
-	struct device_node *remote1, *remote2;
+	struct device_node *remote1 __free(device_node) = NULL;
+	struct device_node *remote2 __free(device_node) = NULL;
 	struct drm_panel *panel;
 	struct fsl_ldb *fsl_ldb;
 	int dual_link;
@@ -325,21 +326,16 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
 	fsl_ldb->ch0_enabled = (remote1 != NULL);
 	fsl_ldb->ch1_enabled = (remote2 != NULL);
-	panel_node = of_node_get(remote1 ? remote1 : remote2);
-	of_node_put(remote1);
-	of_node_put(remote2);
+	panel_node = remote1 ? remote1 : remote2;
 
-	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
-		of_node_put(panel_node);
+	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
 		return dev_err_probe(dev, -ENXIO, "No panel node found");
-	}
 
 	dev_dbg(dev, "Using %s\n",
 		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
 		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
 
 	panel = of_drm_find_panel(panel_node);
-	of_node_put(panel_node);
 	if (IS_ERR(panel))
 		return dev_err_probe(dev, PTR_ERR(panel), "drm panel not found\n");
 
@@ -349,14 +345,12 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 				     "drm panel-bridge add failed\n");
 
 	if (fsl_ldb_is_dual(fsl_ldb)) {
-		struct device_node *port1, *port2;
+		struct device_node *port1 __free(device_node) =
+			of_graph_get_port_by_id(dev->of_node, 1);
+		struct device_node *port2 __free(device_node) =
+			of_graph_get_port_by_id(dev->of_node, 2);
 
-		port1 = of_graph_get_port_by_id(dev->of_node, 1);
-		port2 = of_graph_get_port_by_id(dev->of_node, 2);
 		dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
-		of_node_put(port1);
-		of_node_put(port2);
-
 		if (dual_link < 0)
 			return dev_err_probe(dev, dual_link,
 					     "Error getting dual link configuration\n");
-- 
2.39.5

