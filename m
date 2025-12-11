Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4146CB6825
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 17:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090B710E865;
	Thu, 11 Dec 2025 16:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GtozBaIP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0D110E854
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 16:40:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4B1564E41B7C;
 Thu, 11 Dec 2025 16:40:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1E8416072F;
 Thu, 11 Dec 2025 16:40:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E2FD6103C8E12; Thu, 11 Dec 2025 17:40:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765471224; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pGjKnoSqli+tJUneVj0LkznAqK/JYPAldT/bJKshrNM=;
 b=GtozBaIPZKnfx+NJHvmZjO29+/8tGSfRzRTVG1mA3ZgbaOZGLNUj4yunynqaaDJzOmGGv9
 /PWOcDnzdtCK5PdvhQwkWhW8OA+QZxp5mPsOPrLgaN3BrIiKKMptfam8+18pxNHP7taagl
 sqkFSPOxQ4y0eW6mY1GBUZwcVnyNv/wvNLt26+tOI3RMjSqV2WfmOBcQeMEoEnLI4blW6b
 9w37O8VkYoZSiAIzUlB9FZ2AGvXbXz+ce62REfGs3Ze6YC9wle6d6ZT3kvwBfw0K/0fUJR
 VHJIxTOIuFuQtyGLCh+mcxe9iU6d6B6P7c7Ez+jPVRxtUSQ3jzBXUTarIkBSFA==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Thu, 11 Dec 2025 17:38:59 +0100
Subject: [PATCH v2 15/20] drm/tilcdc: Remove the use of drm_device private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-feature_tilcdc-v2-15-f48bac3cd33e@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
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
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
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

The DRM core documentation recommends against using dev_private:
"Instead of using this pointer it is recommended that drivers use
embed the struct &drm_device in their larger per-device structure."

This patch refactors the tilcdc driver to follow this recommendation
by embedding struct drm_device within struct tilcdc_drm_private and
replacing all dev->dev_private accesses with the ddev_to_tilcdc_priv()
helper macro that uses container_of().

This change aligns the driver with modern DRM best practices.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c    | 28 ++++++++++++++--------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.c     | 11 +++++------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h     |  2 ++
 drivers/gpu/drm/tilcdc/tilcdc_encoder.c |  4 ++--
 drivers/gpu/drm/tilcdc/tilcdc_plane.c   |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_regs.h    |  8 ++++----
 6 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 5b8aba0765f9b..0bd99a2efeeb4 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -59,7 +59,7 @@ struct tilcdc_crtc {
 static void set_scanout(struct drm_crtc *crtc, struct drm_framebuffer *fb)
 {
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	struct drm_gem_dma_object *gem;
 	dma_addr_t start, end;
 	u64 dma_base_and_ceiling;
@@ -94,7 +94,7 @@ static void tilcdc_crtc_load_palette(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	int ret;
 
 	reinit_completion(&tilcdc_crtc->palette_loaded);
@@ -136,7 +136,7 @@ static void tilcdc_crtc_load_palette(struct drm_crtc *crtc)
 
 static void tilcdc_crtc_enable_irqs(struct drm_device *dev)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 
 	tilcdc_clear_irqstatus(dev, 0xffffffff);
 
@@ -153,7 +153,7 @@ static void tilcdc_crtc_enable_irqs(struct drm_device *dev)
 
 static void tilcdc_crtc_disable_irqs(struct drm_device *dev)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 
 	/* disable irqs that we might have enabled: */
 	if (priv->rev == 1) {
@@ -173,7 +173,7 @@ static void tilcdc_crtc_disable_irqs(struct drm_device *dev)
 static void reset(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 
 	if (priv->rev != 2)
 		return;
@@ -198,7 +198,7 @@ static unsigned int tilcdc_pclk_diff(unsigned long rate,
 static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	unsigned long clk_rate, real_pclk_rate, pclk_rate;
 	unsigned int clkdiv;
@@ -270,7 +270,7 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	uint32_t reg, hbp, hfp, hsw, vbp, vfp, vsw;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	struct drm_framebuffer *fb = crtc->primary->state->fb;
@@ -557,7 +557,7 @@ static void tilcdc_crtc_recover_work(struct work_struct *work)
 
 void tilcdc_crtc_destroy(struct drm_crtc *crtc)
 {
-	struct tilcdc_drm_private *priv = crtc->dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(crtc->dev);
 
 	tilcdc_crtc_shutdown(crtc);
 
@@ -647,7 +647,7 @@ static int tilcdc_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	unsigned long flags;
 
 	spin_lock_irqsave(&tilcdc_crtc->irq_lock, flags);
@@ -670,7 +670,7 @@ static void tilcdc_crtc_disable_vblank(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	unsigned long flags;
 
 	spin_lock_irqsave(&tilcdc_crtc->irq_lock, flags);
@@ -728,7 +728,7 @@ static enum drm_mode_status
 tilcdc_crtc_mode_valid(struct drm_crtc *crtc,
 		       const struct drm_display_mode *mode)
 {
-	struct tilcdc_drm_private *priv = crtc->dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(crtc->dev);
 	unsigned int bandwidth;
 	uint32_t hbp, hfp, hsw, vbp, vfp, vsw;
 
@@ -826,7 +826,7 @@ static const struct drm_crtc_helper_funcs tilcdc_crtc_helper_funcs = {
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 
 	drm_modeset_lock(&crtc->mutex, NULL);
@@ -850,7 +850,7 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	uint32_t stat, reg;
 
 	stat = tilcdc_read_irqstatus(dev);
@@ -958,7 +958,7 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
 
 int tilcdc_crtc_create(struct drm_device *dev)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	struct tilcdc_crtc *tilcdc_crtc;
 	struct drm_crtc *crtc;
 	int ret;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 2cbe390a1ee54..89afd32b52baf 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -79,7 +79,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 
 static void modeset_init(struct drm_device *dev)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
@@ -105,14 +105,14 @@ static int cpufreq_transition(struct notifier_block *nb,
 static irqreturn_t tilcdc_irq(int irq, void *arg)
 {
 	struct drm_device *dev = arg;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 
 	return tilcdc_crtc_irq(priv->crtc);
 }
 
 static int tilcdc_irq_install(struct drm_device *dev, unsigned int irq)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	int ret;
 
 	ret = request_irq(irq, tilcdc_irq, 0, dev->driver->name, dev);
@@ -126,7 +126,7 @@ static int tilcdc_irq_install(struct drm_device *dev, unsigned int irq)
 
 static void tilcdc_irq_uninstall(struct drm_device *dev)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 
 	if (!priv->irq_enabled)
 		return;
@@ -174,7 +174,7 @@ static int tilcdc_regs_show(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
 	struct drm_device *dev = node->minor->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	unsigned i;
 
 	pm_runtime_get_sync(dev->dev);
@@ -286,7 +286,6 @@ static int tilcdc_pdev_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 	ddev = &priv->ddev;
-	ddev->dev_private = priv;
 	ret = drmm_mode_config_init(ddev);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index e3d04a3eb25b4..c69e279a2539d 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -85,6 +85,8 @@ struct tilcdc_drm_private {
 
 #define DBG(fmt, ...) DRM_DEBUG(fmt"\n", ##__VA_ARGS__)
 
+#define ddev_to_tilcdc_priv(x) container_of(x, struct tilcdc_drm_private, ddev)
+
 int tilcdc_crtc_create(struct drm_device *dev);
 irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc);
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc);
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
index bca91226351dd..d01e7a31a286c 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
@@ -34,7 +34,7 @@ struct drm_connector *tilcdc_encoder_find_connector(struct drm_device *ddev,
 static
 int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 {
-	struct tilcdc_drm_private *priv = ddev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(ddev);
 	int ret;
 
 	priv->encoder->possible_crtcs = BIT(0);
@@ -53,7 +53,7 @@ int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 
 int tilcdc_encoder_create(struct drm_device *ddev)
 {
-	struct tilcdc_drm_private *priv = ddev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(ddev);
 	struct drm_bridge *bridge;
 	struct drm_panel *panel;
 	int ret;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
index aa72ca679598b..a77a5b22ebd96 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
@@ -101,7 +101,7 @@ static const struct drm_plane_helper_funcs plane_helper_funcs = {
 int tilcdc_plane_init(struct drm_device *dev,
 		      struct drm_plane *plane)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	int ret;
 
 	ret = drm_universal_plane_init(dev, plane, 1, &tilcdc_plane_funcs,
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_regs.h b/drivers/gpu/drm/tilcdc/tilcdc_regs.h
index f90e2dc3457cd..26ebaf1e0f70f 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_regs.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_regs.h
@@ -113,13 +113,13 @@
 
 static inline void tilcdc_write(struct drm_device *dev, u32 reg, u32 data)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	iowrite32(data, priv->mmio + reg);
 }
 
 static inline void tilcdc_write64(struct drm_device *dev, u32 reg, u64 data)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	volatile void __iomem *addr = priv->mmio + reg;
 
 #if defined(iowrite64) && !defined(iowrite64_is_nonatomic)
@@ -133,7 +133,7 @@ static inline void tilcdc_write64(struct drm_device *dev, u32 reg, u64 data)
 
 static inline u32 tilcdc_read(struct drm_device *dev, u32 reg)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	return ioread32(priv->mmio + reg);
 }
 
@@ -156,7 +156,7 @@ static inline void tilcdc_clear(struct drm_device *dev, u32 reg, u32 mask)
 /* the register to read/clear irqstatus differs between v1 and v2 of the IP */
 static inline u32 tilcdc_irqstatus_reg(struct drm_device *dev)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	return (priv->rev == 2) ? LCDC_MASKED_STAT_REG : LCDC_STAT_REG;
 }
 

-- 
2.43.0

