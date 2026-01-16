Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C4BD33A60
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 18:03:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7952410E8FC;
	Fri, 16 Jan 2026 17:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="MQwV9ESN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DEB10E8FC
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 17:03:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 37DDA1A28E5;
 Fri, 16 Jan 2026 17:03:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0C19E606F9;
 Fri, 16 Jan 2026 17:03:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3EB0910B68CC3; Fri, 16 Jan 2026 18:03:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768583019; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=yS/E3Vxq9Ch2ygDJd/F6G9YaZQkxjj7FRbrcPbKVBrg=;
 b=MQwV9ESNvM7MG/7/US9BlcnfavT9FU8HI9aTu0G1DyniNILdT+FKHLVSRe/3QJAh8LIX/l
 mu6TcvORJ9Y9/ML4/fBr/Fs+Pbh/y+SYzLzhY9/cizm9EawYIvd5JF2TuvuP5eLiVslge9
 rDRLxCWmADCrLZE7XVljfKw7DsNPbwI8Oa8/NJHkPExNGFzzEsfkYQUsHZi8+JQ9fngJC4
 OSSNUSHmsTq8/ZTOMk11mf9sthy90DE2y9kOHz0PsP9zSjv5x113ojrzashhNQaA6CD8m/
 +I/EjG/D5ohf24dy0uswc38BzRoHDlTPB0k4pcVZuXWixftcznsG892PpWatWw==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 16 Jan 2026 18:02:19 +0100
Subject: [PATCH v4 19/25] drm/tilcdc: Convert to drm_device-based logging
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-feature_tilcdc-v4-19-2c1c22143087@bootlin.com>
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

Replace dev_* logging calls with their DRM equivalents.
This aligns with the DRM subsystem's logging infrastructure and provides
better integration with DRM debugging mechanisms. The drm_* helpers
automatically include device information and integrate with DRM's
debug category filtering.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Change in v4:
- New patch.
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c    | 26 +++++++++++++-------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.c     | 16 ++++++++--------
 drivers/gpu/drm/tilcdc/tilcdc_encoder.c |  4 ++--
 drivers/gpu/drm/tilcdc/tilcdc_plane.c   |  8 ++++----
 4 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 1025643915052..9d54a9dd72aec 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -125,7 +125,7 @@ static void tilcdc_crtc_load_palette(struct drm_crtc *crtc)
 	ret = wait_for_completion_timeout(&tilcdc_crtc->palette_loaded,
 					  msecs_to_jiffies(50));
 	if (ret == 0)
-		dev_err(dev->dev, "%s: Palette loading timeout", __func__);
+		drm_err(dev, "%s: Palette loading timeout", __func__);
 
 	/* Disable LCDC DMA and DMA Palette Loaded Interrupt. */
 	tilcdc_clear(dev, LCDC_RASTER_CTRL_REG, LCDC_RASTER_ENABLE);
@@ -223,7 +223,7 @@ static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
 		 */
 		if (!clk_rate) {
 			/* Nothing more we can do. Just bail out. */
-			dev_err(dev->dev,
+			drm_err(dev,
 				"failed to set the pixel clock - unable to read current lcdc clock rate\n");
 			return;
 		}
@@ -240,7 +240,7 @@ static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
 		real_pclk_rate = clk_rate / clkdiv;
 
 		if (tilcdc_pclk_diff(pclk_rate, real_pclk_rate) > 5) {
-			dev_warn(dev->dev,
+			drm_warn(dev,
 				 "effective pixel clock rate (%luHz) differs from the requested rate (%luHz)\n",
 				 real_pclk_rate, pclk_rate);
 		}
@@ -369,7 +369,7 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 			reg |= LCDC_V2_TFT_24BPP_MODE;
 			break;
 		default:
-			dev_err(dev->dev, "invalid pixel format\n");
+			drm_err(dev, "invalid pixel format\n");
 			return;
 		}
 	}
@@ -482,7 +482,7 @@ static void tilcdc_crtc_off(struct drm_crtc *crtc, bool shutdown)
 				 tilcdc_crtc->frame_done,
 				 msecs_to_jiffies(500));
 	if (ret == 0)
-		dev_err(dev->dev, "%s: timeout waiting for framedone\n",
+		drm_err(dev, "%s: timeout waiting for framedone\n",
 			__func__);
 
 	drm_crtc_vblank_off(crtc);
@@ -543,7 +543,7 @@ static void tilcdc_crtc_recover_work(struct work_struct *work)
 		container_of(work, struct tilcdc_crtc, recover_work);
 	struct drm_crtc *crtc = &tilcdc_crtc->base;
 
-	dev_info(crtc->dev->dev, "%s: Reset CRTC", __func__);
+	drm_info(crtc->dev, "%s: Reset CRTC", __func__);
 
 	drm_modeset_lock(&crtc->mutex, NULL);
 
@@ -575,7 +575,7 @@ int tilcdc_crtc_update_fb(struct drm_crtc *crtc,
 	struct drm_device *dev = crtc->dev;
 
 	if (tilcdc_crtc->event) {
-		dev_err(dev->dev, "already pending page flip!\n");
+		drm_err(dev, "already pending page flip!\n");
 		return -EBUSY;
 	}
 
@@ -707,7 +707,7 @@ static void tilcdc_crtc_reset(struct drm_crtc *crtc)
 					 tilcdc_crtc->frame_done,
 					 msecs_to_jiffies(500));
 		if (ret == 0)
-			dev_err(dev->dev, "%s: timeout waiting for framedone\n",
+			drm_err(dev, "%s: timeout waiting for framedone\n",
 				__func__);
 	}
 	pm_runtime_put_sync(dev->dev);
@@ -895,7 +895,7 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
 	}
 
 	if (stat & LCDC_FIFO_UNDERFLOW)
-		dev_err_ratelimited(dev->dev, "%s(0x%08x): FIFO underflow",
+		drm_err_ratelimited(dev, "%s(0x%08x): FIFO underflow",
 				    __func__, stat);
 
 	if (stat & LCDC_PL_LOAD_DONE) {
@@ -909,7 +909,7 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
 	}
 
 	if (stat & LCDC_SYNC_LOST) {
-		dev_err_ratelimited(dev->dev, "%s(0x%08x): Sync lost",
+		drm_err_ratelimited(dev, "%s(0x%08x): Sync lost",
 				    __func__, stat);
 		tilcdc_crtc->frame_intact = false;
 		if (priv->rev == 1) {
@@ -923,7 +923,7 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
 		} else {
 			if (tilcdc_crtc->sync_lost_count++ >
 			    SYNC_LOST_COUNT_LIMIT) {
-				dev_err(dev->dev,
+				drm_err(dev,
 					"%s(0x%08x): Sync lost flood detected, recovering",
 					__func__, stat);
 				queue_work(system_wq,
@@ -965,7 +965,7 @@ int tilcdc_crtc_create(struct drm_device *dev)
 
 	primary = tilcdc_plane_init(dev);
 	if (IS_ERR(primary)) {
-		dev_err(dev->dev, "Failed to initialize plane: %pe\n", primary);
+		drm_err(dev, "Failed to initialize plane: %pe\n", primary);
 		return PTR_ERR(primary);
 	}
 
@@ -975,7 +975,7 @@ int tilcdc_crtc_create(struct drm_device *dev)
 						  &tilcdc_crtc_funcs,
 						  "tilcdc crtc");
 	if (IS_ERR(tilcdc_crtc)) {
-		dev_err(dev->dev, "Failed to init CRTC: %pe\n", tilcdc_crtc);
+		drm_err(dev, "Failed to init CRTC: %pe\n", tilcdc_crtc);
 		return PTR_ERR(tilcdc_crtc);
 	}
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 3b11d296a7e91..c877b2be9c2ec 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -288,14 +288,14 @@ static int tilcdc_pdev_probe(struct platform_device *pdev)
 
 	priv->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->mmio)) {
-		dev_err(dev, "failed to request / ioremap\n");
+		drm_err(ddev, "failed to request / ioremap\n");
 		ret = PTR_ERR(priv->mmio);
 		goto free_wq;
 	}
 
 	priv->clk = clk_get(dev, "fck");
 	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "failed to get functional clock\n");
+		drm_err(ddev, "failed to get functional clock\n");
 		ret = -ENODEV;
 		goto free_wq;
 	}
@@ -313,7 +313,7 @@ static int tilcdc_pdev_probe(struct platform_device *pdev)
 		priv->rev = 2;
 		break;
 	default:
-		dev_warn(dev, "Unknown PID Reg value 0x%08x, "
+		drm_warn(ddev, "Unknown PID Reg value 0x%08x, "
 			"defaulting to LCD revision 1\n",
 			tilcdc_read(ddev, LCDC_PID_REG));
 		priv->rev = 1;
@@ -380,7 +380,7 @@ static int tilcdc_pdev_probe(struct platform_device *pdev)
 
 	ret = tilcdc_crtc_create(ddev);
 	if (ret < 0) {
-		dev_err(dev, "failed to create crtc\n");
+		drm_err(ddev, "failed to create crtc\n");
 		goto disable_pm;
 	}
 	modeset_init(ddev);
@@ -390,7 +390,7 @@ static int tilcdc_pdev_probe(struct platform_device *pdev)
 	ret = cpufreq_register_notifier(&priv->freq_transition,
 			CPUFREQ_TRANSITION_NOTIFIER);
 	if (ret) {
-		dev_err(dev, "failed to register cpufreq notifier\n");
+		drm_err(ddev, "failed to register cpufreq notifier\n");
 		priv->freq_transition.notifier_call = NULL;
 		goto disable_pm;
 	}
@@ -401,14 +401,14 @@ static int tilcdc_pdev_probe(struct platform_device *pdev)
 		goto unregister_cpufreq_notif;
 
 	if (!priv->connector) {
-		dev_err(dev, "no encoders/connectors found\n");
+		drm_err(ddev, "no encoders/connectors found\n");
 		ret = -EPROBE_DEFER;
 		goto unregister_cpufreq_notif;
 	}
 
 	ret = drm_vblank_init(ddev, 1);
 	if (ret < 0) {
-		dev_err(dev, "failed to initialize vblank\n");
+		drm_err(ddev, "failed to initialize vblank\n");
 		goto unregister_cpufreq_notif;
 	}
 
@@ -419,7 +419,7 @@ static int tilcdc_pdev_probe(struct platform_device *pdev)
 
 	ret = tilcdc_irq_install(ddev, priv->irq);
 	if (ret < 0) {
-		dev_err(dev, "failed to install IRQ handler\n");
+		drm_err(ddev, "failed to install IRQ handler\n");
 		goto unregister_cpufreq_notif;
 	}
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
index 1ee5761757a8c..a34a10337f6a8 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
@@ -25,7 +25,7 @@ struct drm_connector *tilcdc_encoder_find_connector(struct drm_device *ddev,
 			return connector;
 	}
 
-	dev_err(ddev->dev, "No connector found for %s encoder (id %d)\n",
+	drm_err(ddev, "No connector found for %s encoder (id %d)\n",
 		encoder->name, encoder->base.id);
 
 	return NULL;
@@ -68,7 +68,7 @@ int tilcdc_encoder_create(struct drm_device *ddev)
 	encoder = drmm_simple_encoder_alloc(ddev, struct tilcdc_encoder,
 					    base, DRM_MODE_ENCODER_NONE);
 	if (IS_ERR(encoder)) {
-		dev_err(ddev->dev, "drm_encoder_init() failed %pe\n", encoder);
+		drm_err(ddev, "drm_encoder_init() failed %pe\n", encoder);
 		return PTR_ERR(encoder);
 	}
 	priv->encoder = encoder;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
index d98a1ae0e31f8..a9982a9956903 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
@@ -36,7 +36,7 @@ static int tilcdc_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	if (new_state->crtc_x || new_state->crtc_y) {
-		dev_err(plane->dev->dev, "%s: crtc position must be zero.",
+		drm_err(plane->dev, "%s: crtc position must be zero.",
 			__func__);
 		return -EINVAL;
 	}
@@ -48,7 +48,7 @@ static int tilcdc_plane_atomic_check(struct drm_plane *plane,
 
 	if (crtc_state->mode.hdisplay != new_state->crtc_w ||
 	    crtc_state->mode.vdisplay != new_state->crtc_h) {
-		dev_err(plane->dev->dev,
+		drm_err(plane->dev,
 			"%s: Size must match mode (%dx%d == %dx%d)", __func__,
 			crtc_state->mode.hdisplay, crtc_state->mode.vdisplay,
 			new_state->crtc_w, new_state->crtc_h);
@@ -58,13 +58,13 @@ static int tilcdc_plane_atomic_check(struct drm_plane *plane,
 	pitch = crtc_state->mode.hdisplay *
 		new_state->fb->format->cpp[0];
 	if (new_state->fb->pitches[0] != pitch) {
-		dev_err(plane->dev->dev,
+		drm_err(plane->dev,
 			"Invalid pitch: fb and crtc widths must be the same");
 		return -EINVAL;
 	}
 
 	if (old_state->fb && new_state->fb->format != old_state->fb->format) {
-		dev_dbg(plane->dev->dev,
+		drm_dbg(plane->dev,
 			"%s(): pixel format change requires mode_change\n",
 			__func__);
 		crtc_state->mode_changed = true;

-- 
2.43.0

