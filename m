Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A76D33A5D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 18:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E598610E8FB;
	Fri, 16 Jan 2026 17:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="cj3IfjAl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73E310E8FB
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 17:03:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A689E1A28E3;
 Fri, 16 Jan 2026 17:03:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7A516606F9;
 Fri, 16 Jan 2026 17:03:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3E5FD10B68CAD; Fri, 16 Jan 2026 18:03:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768583016; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=UsfMF7nWVORJpCYgLZ9qvG2Tz11uw0ogNeHiEinjUHc=;
 b=cj3IfjAlnkN2bqGGHSuFUddscSsRiAycpagoAF4vuN6VmmU277wb7cUHYJ/p9P6seLzsiB
 tWGddOM+XsHS6cBUanQqEtpvhKcwwWq7q0l6U1yLuwS4P5aVbF3a4C4VVB10bTfcK77Uju
 LxsKDlu2AkIRnGlT0ONcYVwMOQ3cs+2ZWfBbAPHURZZAxJf7M5w/ltf+ynUH1Q7YYqbHrd
 JLqK3VSPaY3HWNhNpqW8L5I2cVo7CaNi/NkJaXGatNW/DoC9KnOnslraMwJ+1pkeC02Ayi
 xpTBSzT6hH7IxSQlPDYzR6juQ4jkBCsYXkxcsOnlNl8/z0edS7dE863riOVbCA==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 16 Jan 2026 18:02:18 +0100
Subject: [PATCH v4 18/25] drm/tilcdc: Convert to DRM managed resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-feature_tilcdc-v4-18-2c1c22143087@bootlin.com>
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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

Convert the tilcdc driver to use DRM managed resources (drmm_* APIs)
to eliminate resource lifetime issues, particularly in probe deferral
scenarios.

This conversion addresses potential use-after-free bugs by ensuring
proper cleanup ordering through the DRM managed resource framework.
The changes include:
- Replace drm_crtc_init_with_planes() with drmm_crtc_alloc_with_planes()
- Replace drm_universal_plane_init() with drmm_universal_plane_alloc()
- Replace drm_simple_encoder_init() with drmm_simple_encoder_alloc()
- Remove manual cleanup in tilcdc_crtc_destroy() and error paths
- Remove drm_encoder_cleanup() from encoder error handling paths
- Use drmm_add_action_or_reset() for remaining cleanup operations

This approach is recommended by the DRM subsystem for improved resource
lifetime management and is particularly important for drivers that may
experience probe deferral.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Change in v4:
- Newt patch.
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c    | 54 +++++++++++++++++----------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.c     |  5 +--
 drivers/gpu/drm/tilcdc/tilcdc_drv.h     | 13 ++++++--
 drivers/gpu/drm/tilcdc/tilcdc_encoder.c | 38 ++++++++---------------
 drivers/gpu/drm/tilcdc/tilcdc_plane.c   | 27 ++++++++---------
 5 files changed, 64 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 0bd99a2efeeb4..1025643915052 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -16,6 +16,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
@@ -30,7 +31,7 @@
 struct tilcdc_crtc {
 	struct drm_crtc base;
 
-	struct drm_plane primary;
+	struct tilcdc_plane *primary;
 	struct drm_pending_vblank_event *event;
 	struct mutex enable_lock;
 	bool enabled;
@@ -555,16 +556,15 @@ static void tilcdc_crtc_recover_work(struct work_struct *work)
 	drm_modeset_unlock(&crtc->mutex);
 }
 
-void tilcdc_crtc_destroy(struct drm_crtc *crtc)
+static void tilcdc_crtc_destroy(struct drm_device *dev, void *data)
 {
-	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(crtc->dev);
+	struct tilcdc_drm_private *priv = (struct tilcdc_drm_private *)data;
 
-	tilcdc_crtc_shutdown(crtc);
+	tilcdc_crtc_shutdown(priv->crtc);
 
 	flush_workqueue(priv->wq);
 
-	of_node_put(crtc->port);
-	drm_crtc_cleanup(crtc);
+	of_node_put(priv->crtc->port);
 }
 
 int tilcdc_crtc_update_fb(struct drm_crtc *crtc,
@@ -714,7 +714,6 @@ static void tilcdc_crtc_reset(struct drm_crtc *crtc)
 }
 
 static const struct drm_crtc_funcs tilcdc_crtc_funcs = {
-	.destroy        = tilcdc_crtc_destroy,
 	.set_config     = drm_atomic_helper_set_config,
 	.page_flip      = drm_atomic_helper_page_flip,
 	.reset		= tilcdc_crtc_reset,
@@ -960,12 +959,27 @@ int tilcdc_crtc_create(struct drm_device *dev)
 {
 	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	struct tilcdc_crtc *tilcdc_crtc;
+	struct tilcdc_plane *primary;
 	struct drm_crtc *crtc;
 	int ret;
 
-	tilcdc_crtc = devm_kzalloc(dev->dev, sizeof(*tilcdc_crtc), GFP_KERNEL);
-	if (!tilcdc_crtc)
-		return -ENOMEM;
+	primary = tilcdc_plane_init(dev);
+	if (IS_ERR(primary)) {
+		dev_err(dev->dev, "Failed to initialize plane: %pe\n", primary);
+		return PTR_ERR(primary);
+	}
+
+	tilcdc_crtc = drmm_crtc_alloc_with_planes(dev, struct tilcdc_crtc, base,
+						  &primary->base,
+						  NULL,
+						  &tilcdc_crtc_funcs,
+						  "tilcdc crtc");
+	if (IS_ERR(tilcdc_crtc)) {
+		dev_err(dev->dev, "Failed to init CRTC: %pe\n", tilcdc_crtc);
+		return PTR_ERR(tilcdc_crtc);
+	}
+
+	tilcdc_crtc->primary = primary;
 
 	init_completion(&tilcdc_crtc->palette_loaded);
 	tilcdc_crtc->palette_base = dmam_alloc_coherent(dev->dev,
@@ -978,10 +992,6 @@ int tilcdc_crtc_create(struct drm_device *dev)
 
 	crtc = &tilcdc_crtc->base;
 
-	ret = tilcdc_plane_init(dev, &tilcdc_crtc->primary);
-	if (ret < 0)
-		goto fail;
-
 	mutex_init(&tilcdc_crtc->enable_lock);
 
 	init_waitqueue_head(&tilcdc_crtc->frame_done_wq);
@@ -989,20 +999,12 @@ int tilcdc_crtc_create(struct drm_device *dev)
 	spin_lock_init(&tilcdc_crtc->irq_lock);
 	INIT_WORK(&tilcdc_crtc->recover_work, tilcdc_crtc_recover_work);
 
-	ret = drm_crtc_init_with_planes(dev, crtc,
-					&tilcdc_crtc->primary,
-					NULL,
-					&tilcdc_crtc_funcs,
-					"tilcdc crtc");
-	if (ret < 0)
-		goto fail;
-
 	drm_crtc_helper_add(crtc, &tilcdc_crtc_helper_funcs);
 
+	ret = drmm_add_action_or_reset(dev, tilcdc_crtc_destroy, priv);
+	if (ret)
+		return ret;
+
 	priv->crtc = crtc;
 	return 0;
-
-fail:
-	tilcdc_crtc_destroy(crtc);
-	return ret;
 }
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 1a238a22309f4..3b11d296a7e91 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -392,7 +392,7 @@ static int tilcdc_pdev_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(dev, "failed to register cpufreq notifier\n");
 		priv->freq_transition.notifier_call = NULL;
-		goto destroy_crtc;
+		goto disable_pm;
 	}
 #endif
 
@@ -442,9 +442,7 @@ static int tilcdc_pdev_probe(struct platform_device *pdev)
 #ifdef CONFIG_CPU_FREQ
 	cpufreq_unregister_notifier(&priv->freq_transition,
 				    CPUFREQ_TRANSITION_NOTIFIER);
-destroy_crtc:
 #endif
-	tilcdc_crtc_destroy(priv->crtc);
 disable_pm:
 	pm_runtime_disable(dev);
 	clk_put(priv->clk);
@@ -466,7 +464,6 @@ static void tilcdc_pdev_remove(struct platform_device *pdev)
 	cpufreq_unregister_notifier(&priv->freq_transition,
 				    CPUFREQ_TRANSITION_NOTIFIER);
 #endif
-	tilcdc_crtc_destroy(priv->crtc);
 	pm_runtime_disable(&pdev->dev);
 	clk_put(priv->clk);
 	destroy_workqueue(priv->wq);
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index c69e279a2539d..17d152f9f0b69 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -77,7 +77,7 @@ struct tilcdc_drm_private {
 
 	struct drm_crtc *crtc;
 
-	struct drm_encoder *encoder;
+	struct tilcdc_encoder *encoder;
 	struct drm_connector *connector;
 
 	bool irq_enabled;
@@ -91,11 +91,18 @@ int tilcdc_crtc_create(struct drm_device *dev);
 irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc);
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc);
 void tilcdc_crtc_shutdown(struct drm_crtc *crtc);
-void tilcdc_crtc_destroy(struct drm_crtc *crtc);
 int tilcdc_crtc_update_fb(struct drm_crtc *crtc,
 		struct drm_framebuffer *fb,
 		struct drm_pending_vblank_event *event);
 
-int tilcdc_plane_init(struct drm_device *dev, struct drm_plane *plane);
+struct tilcdc_plane {
+	struct drm_plane base;
+};
+
+struct tilcdc_encoder {
+	struct drm_encoder base;
+};
+
+struct tilcdc_plane *tilcdc_plane_init(struct drm_device *dev);
 
 #endif /* __TILCDC_DRV_H__ */
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
index d42be3e16c536..1ee5761757a8c 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
@@ -37,13 +37,13 @@ int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(ddev);
 	int ret;
 
-	priv->encoder->possible_crtcs = BIT(0);
+	priv->encoder->base.possible_crtcs = BIT(0);
 
-	ret = drm_bridge_attach(priv->encoder, bridge, NULL, 0);
+	ret = drm_bridge_attach(&priv->encoder->base, bridge, NULL, 0);
 	if (ret)
 		return ret;
 
-	priv->connector = tilcdc_encoder_find_connector(ddev, priv->encoder);
+	priv->connector = tilcdc_encoder_find_connector(ddev, &priv->encoder->base);
 	if (!priv->connector)
 		return -ENODEV;
 
@@ -53,6 +53,7 @@ int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 int tilcdc_encoder_create(struct drm_device *ddev)
 {
 	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(ddev);
+	struct tilcdc_encoder *encoder;
 	struct drm_bridge *bridge;
 	struct drm_panel *panel;
 	int ret;
@@ -64,33 +65,20 @@ int tilcdc_encoder_create(struct drm_device *ddev)
 	else if (ret)
 		return ret;
 
-	priv->encoder = devm_kzalloc(ddev->dev, sizeof(*priv->encoder), GFP_KERNEL);
-	if (!priv->encoder)
-		return -ENOMEM;
-
-	ret = drm_simple_encoder_init(ddev, priv->encoder,
-				      DRM_MODE_ENCODER_NONE);
-	if (ret) {
-		dev_err(ddev->dev, "drm_encoder_init() failed %d\n", ret);
-		return ret;
+	encoder = drmm_simple_encoder_alloc(ddev, struct tilcdc_encoder,
+					    base, DRM_MODE_ENCODER_NONE);
+	if (IS_ERR(encoder)) {
+		dev_err(ddev->dev, "drm_encoder_init() failed %pe\n", encoder);
+		return PTR_ERR(encoder);
 	}
+	priv->encoder = encoder;
 
 	if (panel) {
 		bridge = devm_drm_panel_bridge_add_typed(ddev->dev, panel,
 							 DRM_MODE_CONNECTOR_DPI);
-		if (IS_ERR(bridge)) {
-			ret = PTR_ERR(bridge);
-			goto err_encoder_cleanup;
-		}
+		if (IS_ERR(bridge))
+			return PTR_ERR(bridge);
 	}
 
-	ret = tilcdc_attach_bridge(ddev, bridge);
-	if (ret)
-		goto err_encoder_cleanup;
-
-	return 0;
-
-err_encoder_cleanup:
-	drm_encoder_cleanup(priv->encoder);
-	return ret;
+	return tilcdc_attach_bridge(ddev, bridge);
 }
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
index a77a5b22ebd96..d98a1ae0e31f8 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
@@ -14,7 +14,6 @@
 static const struct drm_plane_funcs tilcdc_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
-	.destroy	= drm_plane_cleanup,
 	.reset		= drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
@@ -98,22 +97,20 @@ static const struct drm_plane_helper_funcs plane_helper_funcs = {
 	.atomic_update = tilcdc_plane_atomic_update,
 };
 
-int tilcdc_plane_init(struct drm_device *dev,
-		      struct drm_plane *plane)
+struct tilcdc_plane *tilcdc_plane_init(struct drm_device *dev)
 {
 	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
-	int ret;
-
-	ret = drm_universal_plane_init(dev, plane, 1, &tilcdc_plane_funcs,
-				       priv->pixelformats,
-				       priv->num_pixelformats,
-				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
-	if (ret) {
-		dev_err(dev->dev, "Failed to initialize plane: %d\n", ret);
-		return ret;
-	}
+	struct tilcdc_plane *plane;
 
-	drm_plane_helper_add(plane, &plane_helper_funcs);
+	plane = drmm_universal_plane_alloc(dev, struct tilcdc_plane, base,
+					   1, &tilcdc_plane_funcs,
+					   priv->pixelformats,
+					   priv->num_pixelformats,
+					   NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (IS_ERR(plane))
+		return plane;
 
-	return 0;
+	drm_plane_helper_add(&plane->base, &plane_helper_funcs);
+
+	return plane;
 }

-- 
2.43.0

