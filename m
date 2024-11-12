Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7ED9C4F25
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 08:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AA910E072;
	Tue, 12 Nov 2024 07:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 410 seconds by postgrey-1.36 at gabe;
 Tue, 12 Nov 2024 07:08:37 UTC
Received: from mail-gw02.astralinux.ru (mail-gw02.astralinux.ru
 [195.16.41.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E3210E072
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 07:08:37 +0000 (UTC)
Received: from gca-msk-a-srv-ksmg02.astralinux.ru (localhost [127.0.0.1])
 by mail-gw02.astralinux.ru (Postfix) with ESMTP id 43C921F9CA;
 Tue, 12 Nov 2024 10:01:44 +0300 (MSK)
Received: from new-mail.astralinux.ru (gca-yc-ruca-srv-mail03.astralinux.ru
 [10.177.185.108])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
 Tue, 12 Nov 2024 10:01:38 +0300 (MSK)
Received: from rbta-msk-lt-106062.astralinux.ru (unknown [10.177.20.58])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4Xnclj5102z1h0WK;
 Tue, 12 Nov 2024 10:01:37 +0300 (MSK)
From: Anastasia Belova <abelova@astralinux.ru>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Anastasia Belova <abelova@astralinux.ru>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolas Belin <nbelin@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 stable@vger.kernel.org
Subject: [PATCH v4 resend] drm/meson: switch to a managed drm device
Date: Tue, 12 Nov 2024 10:00:51 +0300
Message-Id: <20241112070051.2795-1-abelova@astralinux.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: abelova@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41
 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_internal2},
 {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;
 new-mail.astralinux.ru:7.1.1; astralinux.ru:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 189101 [Nov 12 2024]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854,
 bases: 2024/11/12 05:52:00 #26846809
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
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

Switch to a managed drm device to cleanup some error handling
and make future work easier.

Fix dereference of NULL in meson_drv_bind_master by removing
drm_dev_put(drm) before meson_encoder_*_remove and
component_unbind_all where drm is dereferenced.

Co-developed by Linux Verification Center (linuxtesting.org).

Cc: stable@vger.kernel.org
Fixes: 6a044642988b ("drm/meson: fix unbind path if HDMI fails to bind")
Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
---
v2: fix commit message and add Cc: stable@vger.kernel.org
v3: cleanup error paths
v4: fix build errors
 drivers/gpu/drm/meson/meson_crtc.c         | 10 +--
 drivers/gpu/drm/meson/meson_drv.c          | 93 ++++++++++------------
 drivers/gpu/drm/meson/meson_drv.h          |  3 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c |  8 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c  |  2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c |  4 +-
 drivers/gpu/drm/meson/meson_overlay.c      |  8 +-
 drivers/gpu/drm/meson/meson_plane.c        | 10 +--
 8 files changed, 63 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
index d70616da8ce2..e1c0bf3baeea 100644
--- a/drivers/gpu/drm/meson/meson_crtc.c
+++ b/drivers/gpu/drm/meson/meson_crtc.c
@@ -662,13 +662,13 @@ void meson_crtc_irq(struct meson_drm *priv)
 
 	drm_crtc_handle_vblank(priv->crtc);
 
-	spin_lock_irqsave(&priv->drm->event_lock, flags);
+	spin_lock_irqsave(&priv->drm.event_lock, flags);
 	if (meson_crtc->event) {
 		drm_crtc_send_vblank_event(priv->crtc, meson_crtc->event);
 		drm_crtc_vblank_put(priv->crtc);
 		meson_crtc->event = NULL;
 	}
-	spin_unlock_irqrestore(&priv->drm->event_lock, flags);
+	spin_unlock_irqrestore(&priv->drm.event_lock, flags);
 }
 
 int meson_crtc_create(struct meson_drm *priv)
@@ -677,18 +677,18 @@ int meson_crtc_create(struct meson_drm *priv)
 	struct drm_crtc *crtc;
 	int ret;
 
-	meson_crtc = devm_kzalloc(priv->drm->dev, sizeof(*meson_crtc),
+	meson_crtc = devm_kzalloc(priv->drm.dev, sizeof(*meson_crtc),
 				  GFP_KERNEL);
 	if (!meson_crtc)
 		return -ENOMEM;
 
 	meson_crtc->priv = priv;
 	crtc = &meson_crtc->base;
-	ret = drm_crtc_init_with_planes(priv->drm, crtc,
+	ret = drm_crtc_init_with_planes(&priv->drm, crtc,
 					priv->primary_plane, NULL,
 					&meson_crtc_funcs, "meson_crtc");
 	if (ret) {
-		dev_err(priv->drm->dev, "Failed to init CRTC\n");
+		dev_err(priv->drm.dev, "Failed to init CRTC\n");
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 4bd0baa2a4f5..dd87c6b61e9e 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -182,7 +182,6 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	struct platform_device *pdev = to_platform_device(dev);
 	const struct meson_drm_match_data *match;
 	struct meson_drm *priv;
-	struct drm_device *drm;
 	struct resource *res;
 	void __iomem *regs;
 	int ret, i;
@@ -197,58 +196,49 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	if (!match)
 		return -ENODEV;
 
-	drm = drm_dev_alloc(&meson_driver, dev);
-	if (IS_ERR(drm))
-		return PTR_ERR(drm);
+	priv = devm_drm_dev_alloc(dev, &meson_driver,
+				 struct meson_drm, drm);
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		ret = -ENOMEM;
-		goto free_drm;
-	}
-	drm->dev_private = priv;
-	priv->drm = drm;
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	priv->drm.dev_private = priv;
 	priv->dev = dev;
 	priv->compat = match->compat;
 	priv->afbcd.ops = match->afbcd_ops;
 
 	regs = devm_platform_ioremap_resource_byname(pdev, "vpu");
 	if (IS_ERR(regs)) {
-		ret = PTR_ERR(regs);
-		goto free_drm;
+		return PTR_ERR(regs);
 	}
 
 	priv->io_base = regs;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hhi");
 	if (!res) {
-		ret = -EINVAL;
-		goto free_drm;
+		return -EINVAL;
 	}
 	/* Simply ioremap since it may be a shared register zone */
 	regs = devm_ioremap(dev, res->start, resource_size(res));
 	if (!regs) {
-		ret = -EADDRNOTAVAIL;
-		goto free_drm;
+		return -EADDRNOTAVAIL;
 	}
 
 	priv->hhi = devm_regmap_init_mmio(dev, regs,
 					  &meson_regmap_config);
 	if (IS_ERR(priv->hhi)) {
 		dev_err(&pdev->dev, "Couldn't create the HHI regmap\n");
-		ret = PTR_ERR(priv->hhi);
-		goto free_drm;
+		return PTR_ERR(priv->hhi);
 	}
 
 	priv->canvas = meson_canvas_get(dev);
 	if (IS_ERR(priv->canvas)) {
-		ret = PTR_ERR(priv->canvas);
-		goto free_drm;
+		return PTR_ERR(priv->canvas);
 	}
 
 	ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_osd1);
 	if (ret)
-		goto free_drm;
+		return ret;
 	ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_0);
 	if (ret)
 		goto free_canvas_osd1;
@@ -261,7 +251,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 	priv->vsync_irq = platform_get_irq(pdev, 0);
 
-	ret = drm_vblank_init(drm, 1);
+	ret = drm_vblank_init(&priv->drm, 1);
 	if (ret)
 		goto free_canvas_vd1_2;
 
@@ -281,13 +271,13 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	if (ret)
 		goto free_canvas_vd1_2;
 
-	ret = drmm_mode_config_init(drm);
+	ret = drmm_mode_config_init(&priv->drm);
 	if (ret)
 		goto free_canvas_vd1_2;
-	drm->mode_config.max_width = 3840;
-	drm->mode_config.max_height = 2160;
-	drm->mode_config.funcs = &meson_mode_config_funcs;
-	drm->mode_config.helper_private	= &meson_mode_config_helpers;
+	priv->drm.mode_config.max_width = 3840;
+	priv->drm.mode_config.max_height = 2160;
+	priv->drm.mode_config.funcs = &meson_mode_config_funcs;
+	priv->drm.mode_config.helper_private = &meson_mode_config_helpers;
 
 	/* Hardware Initialization */
 
@@ -308,9 +298,9 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 		goto exit_afbcd;
 
 	if (has_components) {
-		ret = component_bind_all(dev, drm);
+		ret = component_bind_all(dev, &priv->drm);
 		if (ret) {
-			dev_err(drm->dev, "Couldn't bind all components\n");
+			dev_err(priv->drm.dev, "Couldn't bind all components\n");
 			/* Do not try to unbind */
 			has_components = false;
 			goto exit_afbcd;
@@ -319,46 +309,49 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 	ret = meson_encoder_hdmi_probe(priv);
 	if (ret)
-		goto exit_afbcd;
+		goto unbind_components;
 
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
 		ret = meson_encoder_dsi_probe(priv);
 		if (ret)
-			goto exit_afbcd;
+			goto unbind_components;
 	}
 
 	ret = meson_plane_create(priv);
 	if (ret)
-		goto exit_afbcd;
+		goto unbind_components;
 
 	ret = meson_overlay_create(priv);
 	if (ret)
-		goto exit_afbcd;
+		goto unbind_components;
 
 	ret = meson_crtc_create(priv);
 	if (ret)
-		goto exit_afbcd;
+		goto unbind_components;
 
-	ret = request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->name, drm);
+	ret = request_irq(priv->vsync_irq, meson_irq, 0, priv->drm.driver->name, &priv->drm);
 	if (ret)
-		goto exit_afbcd;
+		goto unbind_components;
 
-	drm_mode_config_reset(drm);
+	drm_mode_config_reset(&priv->drm);
 
-	drm_kms_helper_poll_init(drm);
+	drm_kms_helper_poll_init(&priv->drm);
 
 	platform_set_drvdata(pdev, priv);
 
-	ret = drm_dev_register(drm, 0);
+	ret = drm_dev_register(&priv->drm, 0);
 	if (ret)
 		goto uninstall_irq;
 
-	drm_fbdev_dma_setup(drm, 32);
+	drm_fbdev_dma_setup(&priv->drm, 32);
 
 	return 0;
 
 uninstall_irq:
-	free_irq(priv->vsync_irq, drm);
+	free_irq(priv->vsync_irq, &priv->drm);
+unbind_components:
+	if (has_components)
+		component_unbind_all(dev, &priv->drm);
 exit_afbcd:
 	if (priv->afbcd.ops)
 		priv->afbcd.ops->exit(priv);
@@ -370,16 +363,11 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	meson_canvas_free(priv->canvas, priv->canvas_id_vd1_0);
 free_canvas_osd1:
 	meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
-free_drm:
-	drm_dev_put(drm);
 
 	meson_encoder_dsi_remove(priv);
 	meson_encoder_hdmi_remove(priv);
 	meson_encoder_cvbs_remove(priv);
 
-	if (has_components)
-		component_unbind_all(dev, drm);
-
 	return ret;
 }
 
@@ -391,7 +379,7 @@ static int meson_drv_bind(struct device *dev)
 static void meson_drv_unbind(struct device *dev)
 {
 	struct meson_drm *priv = dev_get_drvdata(dev);
-	struct drm_device *drm = priv->drm;
+	struct drm_device *drm = &priv->drm;
 
 	if (priv->canvas) {
 		meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
@@ -404,7 +392,6 @@ static void meson_drv_unbind(struct device *dev)
 	drm_kms_helper_poll_fini(drm);
 	drm_atomic_helper_shutdown(drm);
 	free_irq(priv->vsync_irq, drm);
-	drm_dev_put(drm);
 
 	meson_encoder_dsi_remove(priv);
 	meson_encoder_hdmi_remove(priv);
@@ -428,7 +415,7 @@ static int __maybe_unused meson_drv_pm_suspend(struct device *dev)
 	if (!priv)
 		return 0;
 
-	return drm_mode_config_helper_suspend(priv->drm);
+	return drm_mode_config_helper_suspend(&priv->drm);
 }
 
 static int __maybe_unused meson_drv_pm_resume(struct device *dev)
@@ -445,7 +432,7 @@ static int __maybe_unused meson_drv_pm_resume(struct device *dev)
 	if (priv->afbcd.ops)
 		priv->afbcd.ops->init(priv);
 
-	return drm_mode_config_helper_resume(priv->drm);
+	return drm_mode_config_helper_resume(&priv->drm);
 }
 
 static void meson_drv_shutdown(struct platform_device *pdev)
@@ -455,8 +442,8 @@ static void meson_drv_shutdown(struct platform_device *pdev)
 	if (!priv)
 		return;
 
-	drm_kms_helper_poll_fini(priv->drm);
-	drm_atomic_helper_shutdown(priv->drm);
+	drm_kms_helper_poll_fini(&priv->drm);
+	drm_atomic_helper_shutdown(&priv->drm);
 }
 
 /*
diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
index 3f9345c14f31..45554c701322 100644
--- a/drivers/gpu/drm/meson/meson_drv.h
+++ b/drivers/gpu/drm/meson/meson_drv.h
@@ -8,6 +8,7 @@
 #define __MESON_DRV_H
 
 #include <linux/device.h>
+#include <drm/drm_device.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
 
@@ -53,7 +54,7 @@ struct meson_drm {
 	u8 canvas_id_vd1_1;
 	u8 canvas_id_vd1_2;
 
-	struct drm_device *drm;
+	struct drm_device drm;
 	struct drm_crtc *crtc;
 	struct drm_plane *primary_plane;
 	struct drm_plane *overlay_plane;
diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index d1191de855d9..ddca22c8c1ff 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -104,7 +104,7 @@ static int meson_encoder_cvbs_get_modes(struct drm_bridge *bridge,
 	for (i = 0; i < MESON_CVBS_MODES_COUNT; ++i) {
 		struct meson_cvbs_mode *meson_mode = &meson_cvbs_modes[i];
 
-		mode = drm_mode_duplicate(priv->drm, &meson_mode->mode);
+		mode = drm_mode_duplicate(&priv->drm, &meson_mode->mode);
 		if (!mode) {
 			dev_err(priv->dev, "Failed to create a new display mode\n");
 			return 0;
@@ -221,7 +221,7 @@ static const struct drm_bridge_funcs meson_encoder_cvbs_bridge_funcs = {
 
 int meson_encoder_cvbs_probe(struct meson_drm *priv)
 {
-	struct drm_device *drm = priv->drm;
+	struct drm_device *drm = &priv->drm;
 	struct meson_encoder_cvbs *meson_encoder_cvbs;
 	struct drm_connector *connector;
 	struct device_node *remote;
@@ -256,7 +256,7 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
 	meson_encoder_cvbs->priv = priv;
 
 	/* Encoder */
-	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
+	ret = drm_simple_encoder_init(&priv->drm, &meson_encoder_cvbs->encoder,
 				      DRM_MODE_ENCODER_TVDAC);
 	if (ret)
 		return dev_err_probe(priv->dev, ret,
@@ -273,7 +273,7 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
 	}
 
 	/* Initialize & attach Bridge Connector */
-	connector = drm_bridge_connector_init(priv->drm, &meson_encoder_cvbs->encoder);
+	connector = drm_bridge_connector_init(&priv->drm, &meson_encoder_cvbs->encoder);
 	if (IS_ERR(connector))
 		return dev_err_probe(priv->dev, PTR_ERR(connector),
 				     "Unable to create CVBS bridge connector\n");
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 7816902f5907..03bb12c69863 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -132,7 +132,7 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
 	meson_encoder_dsi->priv = priv;
 
 	/* Encoder */
-	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_dsi->encoder,
+	ret = drm_simple_encoder_init(&priv->drm, &meson_encoder_dsi->encoder,
 				      DRM_MODE_ENCODER_DSI);
 	if (ret)
 		return dev_err_probe(priv->dev, ret,
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 0593a1cde906..4465d987f85b 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -402,7 +402,7 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 	meson_encoder_hdmi->priv = priv;
 
 	/* Encoder */
-	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
+	ret = drm_simple_encoder_init(&priv->drm, &meson_encoder_hdmi->encoder,
 				      DRM_MODE_ENCODER_TMDS);
 	if (ret) {
 		dev_err_probe(priv->dev, ret, "Failed to init HDMI encoder\n");
@@ -420,7 +420,7 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 	}
 
 	/* Initialize & attach Bridge Connector */
-	meson_encoder_hdmi->connector = drm_bridge_connector_init(priv->drm,
+	meson_encoder_hdmi->connector = drm_bridge_connector_init(&priv->drm,
 							&meson_encoder_hdmi->encoder);
 	if (IS_ERR(meson_encoder_hdmi->connector)) {
 		ret = dev_err_probe(priv->dev,
diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 7f98de38842b..60ee7f758723 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -484,7 +484,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 
 	interlace_mode = new_state->crtc->mode.flags & DRM_MODE_FLAG_INTERLACE;
 
-	spin_lock_irqsave(&priv->drm->event_lock, flags);
+	spin_lock_irqsave(&priv->drm.event_lock, flags);
 
 	if ((fb->modifier & DRM_FORMAT_MOD_AMLOGIC_FBC(0, 0)) ==
 			    DRM_FORMAT_MOD_AMLOGIC_FBC(0, 0)) {
@@ -717,7 +717,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 
 	priv->viu.vd1_enabled = true;
 
-	spin_unlock_irqrestore(&priv->drm->event_lock, flags);
+	spin_unlock_irqrestore(&priv->drm.event_lock, flags);
 
 	DRM_DEBUG_DRIVER("\n");
 }
@@ -838,7 +838,7 @@ int meson_overlay_create(struct meson_drm *priv)
 
 	DRM_DEBUG_DRIVER("\n");
 
-	meson_overlay = devm_kzalloc(priv->drm->dev, sizeof(*meson_overlay),
+	meson_overlay = devm_kzalloc(priv->drm.dev, sizeof(*meson_overlay),
 				   GFP_KERNEL);
 	if (!meson_overlay)
 		return -ENOMEM;
@@ -846,7 +846,7 @@ int meson_overlay_create(struct meson_drm *priv)
 	meson_overlay->priv = priv;
 	plane = &meson_overlay->base;
 
-	drm_universal_plane_init(priv->drm, plane, 0xFF,
+	drm_universal_plane_init(&priv->drm, plane, 0xFF,
 				 &meson_overlay_funcs,
 				 supported_drm_formats,
 				 ARRAY_SIZE(supported_drm_formats),
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index b43ac61201f3..13be94309bf4 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -157,7 +157,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	 * Update Buffer
 	 * Enable Plane
 	 */
-	spin_lock_irqsave(&priv->drm->event_lock, flags);
+	spin_lock_irqsave(&priv->drm.event_lock, flags);
 
 	/* Check if AFBC decoder is required for this buffer */
 	if ((meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
@@ -393,7 +393,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 
 	priv->viu.osd1_enabled = true;
 
-	spin_unlock_irqrestore(&priv->drm->event_lock, flags);
+	spin_unlock_irqrestore(&priv->drm.event_lock, flags);
 }
 
 static void meson_plane_atomic_disable(struct drm_plane *plane,
@@ -536,7 +536,7 @@ int meson_plane_create(struct meson_drm *priv)
 	const uint64_t *format_modifiers = format_modifiers_default;
 	int ret;
 
-	meson_plane = devm_kzalloc(priv->drm->dev, sizeof(*meson_plane),
+	meson_plane = devm_kzalloc(priv->drm.dev, sizeof(*meson_plane),
 				   GFP_KERNEL);
 	if (!meson_plane)
 		return -ENOMEM;
@@ -549,14 +549,14 @@ int meson_plane_create(struct meson_drm *priv)
 	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
 		format_modifiers = format_modifiers_afbc_g12a;
 
-	ret = drm_universal_plane_init(priv->drm, plane, 0xFF,
+	ret = drm_universal_plane_init(&priv->drm, plane, 0xFF,
 					&meson_plane_funcs,
 					supported_drm_formats,
 					ARRAY_SIZE(supported_drm_formats),
 					format_modifiers,
 					DRM_PLANE_TYPE_PRIMARY, "meson_primary_plane");
 	if (ret) {
-		devm_kfree(priv->drm->dev, meson_plane);
+		devm_kfree(priv->drm.dev, meson_plane);
 		return ret;
 	}
 
-- 
2.43.0
