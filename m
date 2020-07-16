Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAEC2235B7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEFC6ED12;
	Fri, 17 Jul 2020 07:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216A76EC8A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 16:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1594917543; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GLdAJNpGrdgYr/WirpwlhwSscGa7bWQ5qp+qvL9aTlc=;
 b=mfai/SvtpYjIA17oaxXo9FFIYYU1WJSVD4drZZ4Y5f3Lt3mVXC0z6Z89COcLK1qemjnN9V
 5damvo/HILvl3pOFEaSft5JnU94UpMbjnCBeZDQQaGH4e2QkyqCH3vo8iGjCWoVAH3tTo5
 2KEuradBmYwLdFINBaSaZQpRMaOXqrw=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 11/12] drm/ingenic: Support multiple panels/bridges
Date: Thu, 16 Jul 2020 18:38:45 +0200
Message-Id: <20200716163846.174790-11-paul@crapouillou.net>
In-Reply-To: <20200716163846.174790-1-paul@crapouillou.net>
References: <20200716163846.174790-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Jul 2020 07:22:00 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 od@zcrc.me, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support multiple panels or bridges connected to the same DPI output of
the SoC. This setup can be found for instance on the GCW Zero, where the
same DPI output interfaces the internal 320x240 TFT panel, and the ITE
IT6610 HDMI chip.

v2: No change

v3: Allow > 80-char lines where it makes sense

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 71 +++++++++++++----------
 1 file changed, 40 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 296d21d203b8..443c5a30396d 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -57,7 +57,6 @@ struct ingenic_drm {
 	 */
 	struct drm_plane f0, f1, *ipu_plane;
 	struct drm_crtc crtc;
-	struct drm_encoder encoder;
 
 	struct device *dev;
 	struct regmap *map;
@@ -112,12 +111,6 @@ static inline struct ingenic_drm *drm_crtc_get_priv(struct drm_crtc *crtc)
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
@@ -468,7 +461,7 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 						struct drm_crtc_state *crtc_state,
 						struct drm_connector_state *conn_state)
 {
-	struct ingenic_drm *priv = drm_encoder_get_priv(encoder);
+	struct ingenic_drm *priv = drm_device_get_priv(encoder->dev);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct drm_connector *conn = conn_state->connector;
 	struct drm_display_info *info = &conn->display_info;
@@ -688,9 +681,11 @@ static int ingenic_drm_bind(struct device *dev)
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
@@ -752,17 +747,6 @@ static int ingenic_drm_bind(struct device *dev)
 		return PTR_ERR(priv->pix_clk);
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, &bridge);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get panel handle\n");
-		return ret;
-	}
-
-	if (panel)
-		bridge = devm_drm_panel_bridge_add_typed(dev, panel,
-							 DRM_MODE_CONNECTOR_DPI);
-
 	priv->dma_hwdesc_f1 = dmam_alloc_coherent(dev, sizeof(*priv->dma_hwdesc_f1),
 						  &priv->dma_hwdesc_phys_f1,
 						  GFP_KERNEL);
@@ -844,22 +828,47 @@ static int ingenic_drm_bind(struct device *dev)
 		}
 	}
 
-	priv->encoder.possible_crtcs = 1;
+	for (i = 0; ; i++) {
+		ret = drm_of_find_panel_or_bridge(dev->of_node, 0, i, &panel, &bridge);
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
-		dev_err(dev, "Failed to init encoder: %i\n", ret);
-		return ret;
+		encoder = devm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
+		if (!encoder)
+			return -ENOMEM;
+
+		encoder->possible_crtcs = 1;
+
+		drm_encoder_helper_add(encoder, &ingenic_drm_encoder_helper_funcs);
+
+		ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_DPI);
+		if (ret) {
+			dev_err(dev, "Failed to init encoder: %d\n", ret);
+			return ret;
+		}
+
+		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
+		if (ret) {
+			dev_err(dev, "Unable to attach bridge\n");
+			return ret;
+		}
 	}
 
-	ret = drm_bridge_attach(&priv->encoder, bridge, NULL, 0);
-	if (ret) {
-		dev_err(dev, "Unable to attach bridge\n");
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
