Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C2DDjeec2lqxgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:13:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC78B783D8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F0C10EB49;
	Fri, 23 Jan 2026 16:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="azRDowmC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1564610EB45
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 16:13:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 016571A2A5D;
 Fri, 23 Jan 2026 16:13:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C87706070A;
 Fri, 23 Jan 2026 16:13:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 21AB0119A87A9; Fri, 23 Jan 2026 17:13:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769184815; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=uk9c0AHNLUSQV7sMdQMvJLvTXEwq4+ucsFMx/IHfFwY=;
 b=azRDowmCFKD8RhBp2f6HKX27bKUEqC6XnhNj/O2RLEtIiuVhcgEluAYO0k0D/8sxVlt1ds
 TNxdb4zE9dwCBTlh0xz6NM3p/05DxEJo6byMIE+f0MLfDvZZmHbt4JDLQU94WktO83ZcBs
 7DtIOh0imAW4qSxoDI5VN/lBAaR7gzdtuKlAwLI15Mz9vC0ZLxtsiPRbIR5joWaHYhc1nQ
 BsXdQFS+sZ1H/youj8vy6j87xYKbd8VTWwOGFpG+LrFiK+dFggVmI2wYB59tyqsoIcLmpY
 w9J4nVr9OnRmwyL5nZeidsmhZVRN27A3U6RO7N+rCpneUtyfeowdWz72+24fbw==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 23 Jan 2026 17:12:36 +0100
Subject: [PATCH v5 18/25] drm/tilcdc: Convert to DRM managed resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-feature_tilcdc-v5-18-5a44d2aa3f6f@bootlin.com>
References: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
In-Reply-To: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
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
X-Mailer: b4 0.15-dev-47773
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:brgl@bgdev.pl,m:tony@atomide.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:msp@baylibre.com,m:praneeth@ti.com,m:luca.ceresoli@bootlin.com,m:louis.chauvet@bootlin.com,m:thomas.petazzoni@bootlin.com,m:miguel.gazquez@bootlin.com,m:herve.codina@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-omap@vger.kernel.org,m:kory.maincent@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[iki.fi,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,armlinux.org.uk,bgdev.pl,atomide.com,intel.com,linaro.org,kwiboo.se];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.984];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,ti.com:url]
X-Rspamd-Queue-Id: DC78B783D8
X-Rspamd-Action: no action

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

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Change in v5:
- Move drmm_add_action_or_reset() up to avoid missing cleanup in case
  of dmam_alloc_coherent() returning an error.

Change in v4:
- New patch.
- Move on to DRM managed resources to fix null pointer dereference koops
  in case drm_of_find_panel_or_bridge() return EPROBE_DEFER.
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c    | 55 +++++++++++++++++----------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.c     |  5 +--
 drivers/gpu/drm/tilcdc/tilcdc_drv.h     | 13 ++++++--
 drivers/gpu/drm/tilcdc/tilcdc_encoder.c | 38 ++++++++---------------
 drivers/gpu/drm/tilcdc/tilcdc_plane.c   | 27 +++++++---------
 5 files changed, 64 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 0bd99a2efeeb4..2916de3dce91e 100644
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
@@ -960,12 +959,31 @@ int tilcdc_crtc_create(struct drm_device *dev)
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
+	priv->crtc = &tilcdc_crtc->base;
+	ret = drmm_add_action_or_reset(dev, tilcdc_crtc_destroy, priv);
+	if (ret)
+		return ret;
 
 	init_completion(&tilcdc_crtc->palette_loaded);
 	tilcdc_crtc->palette_base = dmam_alloc_coherent(dev->dev,
@@ -978,10 +996,6 @@ int tilcdc_crtc_create(struct drm_device *dev)
 
 	crtc = &tilcdc_crtc->base;
 
-	ret = tilcdc_plane_init(dev, &tilcdc_crtc->primary);
-	if (ret < 0)
-		goto fail;
-
 	mutex_init(&tilcdc_crtc->enable_lock);
 
 	init_waitqueue_head(&tilcdc_crtc->frame_done_wq);
@@ -989,20 +1003,7 @@ int tilcdc_crtc_create(struct drm_device *dev)
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
 
-	priv->crtc = crtc;
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

