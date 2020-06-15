Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 401F71FA9A7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 09:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD486E81F;
	Tue, 16 Jun 2020 07:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7436E506
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 20:31:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 1E10F2A2CFF
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org,
	Collabora Kernel ML <kernel@collabora.com>
Subject: [RESEND PATCH v4 6/7] drm/mediatek: mtk_dsi: Use the drm_panel_bridge
 API
Date: Mon, 15 Jun 2020 22:31:07 +0200
Message-Id: <20200615203108.786083-7-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615203108.786083-1-enric.balletbo@collabora.com>
References: <20200615203108.786083-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 16 Jun 2020 07:09:12 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, drinkcat@chromium.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, laurent.pinchart@ideasonboard.com,
 hsinyi@chromium.org, matthias.bgg@gmail.com, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the manual panel handling code by a drm_panel_bridge. This
simplifies the driver and allows all components in the display pipeline
to be treated as bridges, paving the way to generic connector handling.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---

Changes in v4: None
Changes in v3:
- Use next_bridge field to store the panel bridge. (Laurent Pinchart)
- Add the bridge.type field. (Laurent Pinchart)
- This patch requires https://lkml.org/lkml/2020/4/16/2080 to work
  properly.

Changes in v2:
- Do not set connector_type for panel here. (Sam Ravnborg)

 drivers/gpu/drm/mediatek/mtk_dsi.c | 173 +++--------------------------
 1 file changed, 14 insertions(+), 159 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index e02d16a086ac0..4f3bd095c1eee 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -182,8 +182,6 @@ struct mtk_dsi {
 	struct mipi_dsi_host host;
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
-	struct drm_connector conn;
-	struct drm_panel *panel;
 	struct drm_bridge *next_bridge;
 	struct phy *phy;
 
@@ -212,11 +210,6 @@ static inline struct mtk_dsi *bridge_to_dsi(struct drm_bridge *b)
 	return container_of(b, struct mtk_dsi, bridge);
 }
 
-static inline struct mtk_dsi *connector_to_dsi(struct drm_connector *c)
-{
-	return container_of(c, struct mtk_dsi, conn);
-}
-
 static inline struct mtk_dsi *host_to_dsi(struct mipi_dsi_host *h)
 {
 	return container_of(h, struct mtk_dsi, host);
@@ -682,16 +675,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_lane0_ulp_mode_leave(dsi);
 	mtk_dsi_clk_hs_mode(dsi, 0);
 
-	if (dsi->panel) {
-		if (drm_panel_prepare(dsi->panel)) {
-			DRM_ERROR("failed to prepare the panel\n");
-			goto err_disable_digital_clk;
-		}
-	}
-
 	return 0;
-err_disable_digital_clk:
-	clk_disable_unprepare(dsi->digital_clk);
 err_disable_engine_clk:
 	clk_disable_unprepare(dsi->engine_clk);
 err_phy_power_off:
@@ -718,15 +702,7 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 	 */
 	mtk_dsi_stop(dsi);
 
-	if (!mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500)) {
-		if (dsi->panel) {
-			if (drm_panel_unprepare(dsi->panel)) {
-				DRM_ERROR("failed to unprepare the panel\n");
-				return;
-			}
-		}
-	}
-
+	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
 	mtk_dsi_reset_engine(dsi);
 	mtk_dsi_lane0_ulp_mode_enter(dsi);
 	mtk_dsi_clk_ulp_mode_enter(dsi);
@@ -757,19 +733,7 @@ static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
 
 	mtk_dsi_start(dsi);
 
-	if (dsi->panel) {
-		if (drm_panel_enable(dsi->panel)) {
-			DRM_ERROR("failed to enable the panel\n");
-			goto err_dsi_power_off;
-		}
-	}
-
 	dsi->enabled = true;
-
-	return;
-err_dsi_power_off:
-	mtk_dsi_stop(dsi);
-	mtk_dsi_poweroff(dsi);
 }
 
 static void mtk_output_dsi_disable(struct mtk_dsi *dsi)
@@ -777,34 +741,19 @@ static void mtk_output_dsi_disable(struct mtk_dsi *dsi)
 	if (!dsi->enabled)
 		return;
 
-	if (dsi->panel) {
-		if (drm_panel_disable(dsi->panel)) {
-			DRM_ERROR("failed to disable the panel\n");
-			return;
-		}
-	}
-
 	mtk_dsi_poweroff(dsi);
 
 	dsi->enabled = false;
 }
 
-static int mtk_dsi_create_conn_enc(struct drm_device *drm, struct mtk_dsi *dsi);
-static void mtk_dsi_destroy_conn_enc(struct mtk_dsi *dsi);
-
 static int mtk_dsi_bridge_attach(struct drm_bridge *bridge,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
 
-	return mtk_dsi_create_conn_enc(bridge->dev, dsi);
-}
-
-static void mtk_dsi_bridge_detach(struct drm_bridge *bridge)
-{
-	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
-
-	mtk_dsi_destroy_conn_enc(dsi);
+	/* Attach the panel or bridge to the dsi bridge */
+	return drm_bridge_attach(bridge->encoder, dsi->next_bridge,
+				 &dsi->bridge, flags);
 }
 
 static void mtk_dsi_bridge_mode_set(struct drm_bridge *bridge,
@@ -830,101 +779,13 @@ static void mtk_dsi_bridge_enable(struct drm_bridge *bridge)
 	mtk_output_dsi_enable(dsi);
 }
 
-static int mtk_dsi_connector_get_modes(struct drm_connector *connector)
-{
-	struct mtk_dsi *dsi = connector_to_dsi(connector);
-
-	return drm_panel_get_modes(dsi->panel, connector);
-}
-
 static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
 	.attach = mtk_dsi_bridge_attach,
-	.detach = mtk_dsi_bridge_detach,
 	.disable = mtk_dsi_bridge_disable,
 	.enable = mtk_dsi_bridge_enable,
 	.mode_set = mtk_dsi_bridge_mode_set,
 };
 
-static const struct drm_connector_funcs mtk_dsi_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static const struct drm_connector_helper_funcs
-	mtk_dsi_connector_helper_funcs = {
-	.get_modes = mtk_dsi_connector_get_modes,
-};
-
-static int mtk_dsi_create_connector(struct drm_device *drm, struct mtk_dsi *dsi)
-{
-	int ret;
-
-	ret = drm_connector_init(drm, &dsi->conn, &mtk_dsi_connector_funcs,
-				 DRM_MODE_CONNECTOR_DSI);
-	if (ret) {
-		DRM_ERROR("Failed to connector init to drm\n");
-		return ret;
-	}
-
-	drm_connector_helper_add(&dsi->conn, &mtk_dsi_connector_helper_funcs);
-
-	dsi->conn.dpms = DRM_MODE_DPMS_OFF;
-	drm_connector_attach_encoder(&dsi->conn, &dsi->encoder);
-
-	if (dsi->panel) {
-		ret = drm_panel_attach(dsi->panel, &dsi->conn);
-		if (ret) {
-			DRM_ERROR("Failed to attach panel to drm\n");
-			goto err_connector_cleanup;
-		}
-	}
-
-	return 0;
-
-err_connector_cleanup:
-	drm_connector_cleanup(&dsi->conn);
-	return ret;
-}
-
-static int mtk_dsi_create_conn_enc(struct drm_device *drm, struct mtk_dsi *dsi)
-{
-	int ret;
-
-	/* If there's a next bridge, attach to it and let it create the connector */
-	if (dsi->next_bridge) {
-		ret = drm_bridge_attach(&dsi->encoder, dsi->next_bridge, NULL,
-					0);
-		if (ret) {
-			DRM_ERROR("Failed to attach bridge to drm\n");
-			goto err_encoder_cleanup;
-		}
-	} else {
-		/* Otherwise create our own connector and attach to a panel */
-		ret = mtk_dsi_create_connector(drm, dsi);
-		if (ret)
-			goto err_encoder_cleanup;
-	}
-
-	return 0;
-
-err_encoder_cleanup:
-	drm_encoder_cleanup(&dsi->encoder);
-	return ret;
-}
-
-static void mtk_dsi_destroy_conn_enc(struct mtk_dsi *dsi)
-{
-	drm_encoder_cleanup(&dsi->encoder);
-	/* Skip connector cleanup if creation was delegated to the bridge */
-	if (dsi->conn.dev)
-		drm_connector_cleanup(&dsi->conn);
-	if (dsi->panel)
-		drm_panel_detach(dsi->panel);
-}
-
 static void mtk_dsi_ddp_start(struct mtk_ddp_comp *comp)
 {
 	struct mtk_dsi *dsi = container_of(comp, struct mtk_dsi, ddp_comp);
@@ -953,20 +814,6 @@ static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
 
-	if (dsi->conn.dev)
-		drm_helper_hpd_irq_event(dsi->conn.dev);
-
-	return 0;
-}
-
-static int mtk_dsi_host_detach(struct mipi_dsi_host *host,
-			       struct mipi_dsi_device *device)
-{
-	struct mtk_dsi *dsi = host_to_dsi(host);
-
-	if (dsi->conn.dev)
-		drm_helper_hpd_irq_event(dsi->conn.dev);
-
 	return 0;
 }
 
@@ -1110,7 +957,6 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 
 static const struct mipi_dsi_host_ops mtk_dsi_ops = {
 	.attach = mtk_dsi_host_attach,
-	.detach = mtk_dsi_host_detach,
 	.transfer = mtk_dsi_host_transfer,
 };
 
@@ -1185,6 +1031,7 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 {
 	struct mtk_dsi *dsi;
 	struct device *dev = &pdev->dev;
+	struct drm_panel *panel;
 	struct resource *regs;
 	int irq_num;
 	int comp_id;
@@ -1203,10 +1050,18 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	}
 
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
-					  &dsi->panel, &dsi->next_bridge);
+					  &panel, &dsi->next_bridge);
 	if (ret)
 		goto err_unregister_host;
 
+	if (panel) {
+		dsi->next_bridge = devm_drm_panel_bridge_add(dev, panel);
+		if (IS_ERR(dsi->next_bridge)) {
+			ret = PTR_ERR(dsi->next_bridge);
+			goto err_unregister_host;
+		}
+	}
+
 	dsi->driver_data = of_device_get_match_data(dev);
 
 	dsi->engine_clk = devm_clk_get(dev, "engine");
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
