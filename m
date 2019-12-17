Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F134B123A18
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 23:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059556E176;
	Tue, 17 Dec 2019 22:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264366E176
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 22:34:38 +0000 (UTC)
Received: from ip5f5a5f74.dynamic.kabel-deutschland.de ([95.90.95.116]
 helo=phil.sntech)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1ihLQE-0001Km-8k; Tue, 17 Dec 2019 23:34:30 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: a.hajda@samsung.com
Subject: [PATCH] drm/bridge/synopsys: dsi: use mipi_dsi_device to find panel
 or bridge
Date: Tue, 17 Dec 2019 23:34:21 +0100
Message-Id: <20191217223421.20106-1-heiko@sntech.de>
X-Mailer: git-send-email 2.24.0
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
Cc: narmstrong@baylibre.com,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>, philippe.cornu@st.com,
 dri-devel@lists.freedesktop.org, yannick.fertre@st.com, maxime@cerno.tech,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Right now the dsi driver uses drm_of_find_panel_or_bridge() to find a
connected panel or bridge. But this requires an of-graph connection
between the dsi-host and dsi-device, where normal bindings for regular
panels just expect the dsi device to be a subnode of the actual dsi host
not requiring port connections.

drm_of_find_panel_or_bridge used to find the actual device-node of the
dsi device, but as this happens in the dsi_host_attach callback we already
have the dsi-device and its device-node available already, so can just
call the relevant panel+bridge functions ourself, making it work as well
in setups without port-connections.

Tested on a Rockchip px30 single-dsi with panels form Leadtek and Xinpeng
as well on Gru-Scarlet (rk3399) with dual-dsi (and therefore ports)
connected to the Innotek display variant.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 981d532cdd59..4b4961e7c680 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -26,6 +26,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -310,16 +311,16 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
 
-	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0,
-					  &panel, &bridge);
-	if (ret)
-		return ret;
-
-	if (panel) {
+	panel = of_drm_find_panel(device->dev.of_node);
+	if (!IS_ERR(panel)) {
 		bridge = drm_panel_bridge_add_typed(panel,
 						    DRM_MODE_CONNECTOR_DSI);
 		if (IS_ERR(bridge))
 			return PTR_ERR(bridge);
+	} else {
+		bridge = of_drm_find_bridge(device->dev.of_node);
+		if (!bridge)
+			return -EPROBE_DEFER;
 	}
 
 	dsi->panel_bridge = bridge;
@@ -340,6 +341,7 @@ static int dw_mipi_dsi_host_detach(struct mipi_dsi_host *host,
 {
 	struct dw_mipi_dsi *dsi = host_to_dsi(host);
 	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
+	struct drm_bridge *bridge;
 	int ret;
 
 	if (pdata->host_ops && pdata->host_ops->detach) {
@@ -348,7 +350,8 @@ static int dw_mipi_dsi_host_detach(struct mipi_dsi_host *host,
 			return ret;
 	}
 
-	drm_of_panel_bridge_remove(host->dev->of_node, 1, 0);
+	bridge = of_drm_find_bridge(device->dev.of_node);
+	drm_panel_bridge_remove(bridge);
 
 	drm_bridge_remove(&dsi->bridge);
 
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
