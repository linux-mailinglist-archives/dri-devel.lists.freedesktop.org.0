Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA03F1D64B3
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 01:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFC76E28A;
	Sat, 16 May 2020 23:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD176E270
 for <dri-devel@lists.freedesktop.org>; Sat, 16 May 2020 21:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1589665880; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1QAI1+lygs7RukytrBDJiA7TI+zQ9n1V3xrM8AumWXA=;
 b=pW8KhGNg2rkDX1s29kn2kWNFzAz/EL5hkHf9wAq8EKRiTrtfWRgFlMRtqu2efZswBjpD2T
 ybuuGoyx2mVCBaE3Ja/nPkWhpavKAcyXRTMz5Zne49El86/ZpNtEA2iSEzw0IqZUMrnRnh
 79fDnXjNmE78d5GF0L7rj5KtG9BI/H4=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH 12/12] gpu/drm: Ingenic: Support multiple panels/bridges
Date: Sat, 16 May 2020 23:50:57 +0200
Message-Id: <20200516215057.392609-12-paul@crapouillou.net>
In-Reply-To: <20200516215057.392609-1-paul@crapouillou.net>
References: <20200516215057.392609-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 16 May 2020 23:30:51 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support multiple panels or bridges connected to the same DPI output of
the SoC. This setup can be found for instance on the GCW Zero, where the
same DPI output interfaces the internal 320x240 TFT panel, and the ITE
IT6610 HDMI chip.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 74 ++++++++++++++++-----------
 1 file changed, 43 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index ad1cec4f2a4d..091e3d3c9027 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -52,7 +52,6 @@ struct ingenic_drm {
 	struct drm_device drm;
 	struct drm_plane f0, f1, *ipu_plane;
 	struct drm_crtc crtc;
-	struct drm_encoder encoder;
 
 	struct device *dev;
 	struct regmap *map;
@@ -106,12 +105,6 @@ static inline struct ingenic_drm *drm_crtc_get_priv(struct drm_crtc *crtc)
 	return container_of(crtc, struct ingenic_drm, crtc);
 }
 
-static inline struct ingenic_drm *
-drm_encoder_get_priv(struct drm_encoder *encoder)
-{
-	return container_of(encoder, struct ingenic_drm, encoder);
-}
-
 static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 					   struct drm_crtc_state *state)
 {
@@ -456,7 +449,7 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 						struct drm_crtc_state *crtc_state,
 						struct drm_connector_state *conn_state)
 {
-	struct ingenic_drm *priv = drm_encoder_get_priv(encoder);
+	struct ingenic_drm *priv = drm_device_get_priv(encoder->dev);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct drm_connector *conn = conn_state->connector;
 	struct drm_display_info *info = &conn->display_info;
@@ -670,9 +663,11 @@ static int ingenic_drm_bind(struct device *dev)
 	struct clk *parent_clk;
 	struct drm_bridge *bridge;
 	struct drm_panel *panel;
+	struct drm_encoder *encoder;
 	struct drm_device *drm;
 	void __iomem *base;
 	long parent_rate;
+	unsigned int i, clone_mask = 0;
 	int ret, irq;
 
 	soc_info = of_device_get_match_data(dev);
@@ -744,17 +739,6 @@ static int ingenic_drm_bind(struct device *dev)
 		return PTR_ERR(priv->pix_clk);
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, &bridge);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get panel handle");
-		return ret;
-	}
-
-	if (panel)
-		bridge = devm_drm_panel_bridge_add_typed(dev, panel,
-							 DRM_MODE_CONNECTOR_DPI);
-
 	priv->dma_hwdesc[0] = dma_alloc_coherent(dev,
 						 sizeof(*priv->dma_hwdesc[0]),
 						 &priv->dma_hwdesc_phys[0],
@@ -821,22 +805,50 @@ static int ingenic_drm_bind(struct device *dev)
 		}
 	}
 
-	priv->encoder.possible_crtcs = 1;
+	for (i = 0; ; i++) {
+		ret = drm_of_find_panel_or_bridge(dev->of_node, 0, i,
+						  &panel, &bridge);
+		if (ret) {
+			if (ret == -ENODEV)
+				break; /* we're done */
+			if (ret != -EPROBE_DEFER)
+				dev_err(dev, "Failed to get bridge handle\n");
+			return ret;
+		}
 
-	drm_encoder_helper_add(&priv->encoder,
-			       &ingenic_drm_encoder_helper_funcs);
+		if (panel)
+			bridge = devm_drm_panel_bridge_add_typed(dev, panel,
+								 DRM_MODE_CONNECTOR_DPI);
 
-	ret = drm_simple_encoder_init(drm, &priv->encoder,
-				      DRM_MODE_ENCODER_DPI);
-	if (ret) {
-		dev_err(dev, "Failed to init encoder: %i", ret);
-		return ret;
+		encoder = devm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
+		if (!encoder)
+			return -ENOMEM;
+
+		encoder->possible_crtcs = 1;
+
+		drm_encoder_helper_add(encoder,
+				       &ingenic_drm_encoder_helper_funcs);
+
+		ret = drm_simple_encoder_init(drm, encoder,
+					      DRM_MODE_ENCODER_DPI);
+		if (ret) {
+			dev_err(dev, "Failed to init encoder: %d\n", ret);
+			return ret;
+		}
+
+		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
+		if (ret) {
+			dev_err(dev, "Unable to attach bridge");
+			return ret;
+		}
 	}
 
-	ret = drm_bridge_attach(&priv->encoder, bridge, NULL, 0);
-	if (ret) {
-		dev_err(dev, "Unable to attach bridge");
-		return ret;
+	drm_for_each_encoder(encoder, drm) {
+		clone_mask |= BIT(drm_encoder_index(encoder));
+	}
+
+	drm_for_each_encoder(encoder, drm) {
+		encoder->possible_clones = clone_mask;
 	}
 
 	ret = drm_irq_install(drm, irq);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
