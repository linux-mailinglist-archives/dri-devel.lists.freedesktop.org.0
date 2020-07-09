Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C3521B0A8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0AE6EB91;
	Fri, 10 Jul 2020 07:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CB36EA36
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 10:55:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id A03852A6391
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org,
	Collabora Kernel ML <kernel@collabora.com>
Subject: [PATCH v2 2/2] drm/mediatek: mtk_dpi: Convert to bridge driver
Date: Thu,  9 Jul 2020 12:55:01 +0200
Message-Id: <20200709105501.1465636-3-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200709105501.1465636-1-enric.balletbo@collabora.com>
References: <20200709105501.1465636-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
 narmstrong@baylibre.com, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 boris.brezillon@collabora.com, linux-mediatek@lists.infradead.org,
 laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, matthias.bgg@gmail.com,
 sam@ravnborg.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert mtk_dpi to a bridge driver with built-in encoder support for
compatibility with existing component drivers.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---

Changes in v2:
- Maintain error message when attach to bridge fails. (Boris)

 drivers/gpu/drm/mediatek/mtk_dpi.c | 71 ++++++++++++++++++------------
 1 file changed, 42 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index f7372dbdac0e..589ef33a1780 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -64,6 +64,7 @@ enum mtk_dpi_out_color_format {
 struct mtk_dpi {
 	struct mtk_ddp_comp ddp_comp;
 	struct drm_encoder encoder;
+	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
 	void __iomem *regs;
 	struct device *dev;
@@ -83,9 +84,9 @@ struct mtk_dpi {
 	int refcount;
 };
 
-static inline struct mtk_dpi *mtk_dpi_from_encoder(struct drm_encoder *e)
+static inline struct mtk_dpi *bridge_to_dpi(struct drm_bridge *b)
 {
-	return container_of(e, struct mtk_dpi, encoder);
+	return container_of(b, struct mtk_dpi, bridge);
 }
 
 enum mtk_dpi_polarity {
@@ -521,50 +522,53 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	return 0;
 }
 
-static bool mtk_dpi_encoder_mode_fixup(struct drm_encoder *encoder,
-				       const struct drm_display_mode *mode,
-				       struct drm_display_mode *adjusted_mode)
+static void mtk_dpi_encoder_destroy(struct drm_encoder *encoder)
 {
-	return true;
+	drm_encoder_cleanup(encoder);
 }
 
-static void mtk_dpi_encoder_mode_set(struct drm_encoder *encoder,
-				     struct drm_display_mode *mode,
-				     struct drm_display_mode *adjusted_mode)
+static const struct drm_encoder_funcs mtk_dpi_encoder_funcs = {
+	.destroy = mtk_dpi_encoder_destroy,
+};
+
+static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
 {
-	struct mtk_dpi *dpi = mtk_dpi_from_encoder(encoder);
+	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
+
+	return drm_bridge_attach(bridge->encoder, dpi->next_bridge,
+				 &dpi->bridge, flags);
+}
+
+static void mtk_dpi_bridge_mode_set(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode)
+{
+	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
 
 	drm_mode_copy(&dpi->mode, adjusted_mode);
 }
 
-static void mtk_dpi_encoder_disable(struct drm_encoder *encoder)
+static void mtk_dpi_bridge_disable(struct drm_bridge *bridge)
 {
-	struct mtk_dpi *dpi = mtk_dpi_from_encoder(encoder);
+	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
 
 	mtk_dpi_power_off(dpi);
 }
 
-static void mtk_dpi_encoder_enable(struct drm_encoder *encoder)
+static void mtk_dpi_bridge_enable(struct drm_bridge *bridge)
 {
-	struct mtk_dpi *dpi = mtk_dpi_from_encoder(encoder);
+	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
 
 	mtk_dpi_power_on(dpi);
 	mtk_dpi_set_display_mode(dpi, &dpi->mode);
 }
 
-static int mtk_dpi_atomic_check(struct drm_encoder *encoder,
-				struct drm_crtc_state *crtc_state,
-				struct drm_connector_state *conn_state)
-{
-	return 0;
-}
-
-static const struct drm_encoder_helper_funcs mtk_dpi_encoder_helper_funcs = {
-	.mode_fixup = mtk_dpi_encoder_mode_fixup,
-	.mode_set = mtk_dpi_encoder_mode_set,
-	.disable = mtk_dpi_encoder_disable,
-	.enable = mtk_dpi_encoder_enable,
-	.atomic_check = mtk_dpi_atomic_check,
+static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
+	.attach = mtk_dpi_bridge_attach,
+	.mode_set = mtk_dpi_bridge_mode_set,
+	.disable = mtk_dpi_bridge_disable,
+	.enable = mtk_dpi_bridge_enable,
 };
 
 static void mtk_dpi_start(struct mtk_ddp_comp *comp)
@@ -605,12 +609,11 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 		dev_err(dev, "Failed to initialize decoder: %d\n", ret);
 		goto err_unregister;
 	}
-	drm_encoder_helper_add(&dpi->encoder, &mtk_dpi_encoder_helper_funcs);
 
 	/* Currently DPI0 is fixed to be driven by OVL1 */
 	dpi->encoder.possible_crtcs = BIT(1);
 
-	ret = drm_bridge_attach(&dpi->encoder, dpi->next_bridge, NULL, 0);
+	ret = drm_bridge_attach(&dpi->encoder, &dpi->bridge, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Failed to attach bridge: %d\n", ret);
 		goto err_cleanup;
@@ -791,8 +794,15 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dpi);
 
+	dpi->bridge.funcs = &mtk_dpi_bridge_funcs;
+	dpi->bridge.of_node = dev->of_node;
+	dpi->bridge.type = DRM_MODE_CONNECTOR_DPI;
+
+	drm_bridge_add(&dpi->bridge);
+
 	ret = component_add(dev, &mtk_dpi_component_ops);
 	if (ret) {
+		drm_bridge_remove(&dpi->bridge);
 		dev_err(dev, "Failed to add component: %d\n", ret);
 		return ret;
 	}
@@ -802,7 +812,10 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 
 static int mtk_dpi_remove(struct platform_device *pdev)
 {
+	struct mtk_dpi *dpi = platform_get_drvdata(pdev);
+
 	component_del(&pdev->dev, &mtk_dpi_component_ops);
+	drm_bridge_remove(&dpi->bridge);
 
 	return 0;
 }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
