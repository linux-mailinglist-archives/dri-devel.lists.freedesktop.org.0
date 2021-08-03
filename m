Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7E93DE958
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 11:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8FC6E4EA;
	Tue,  3 Aug 2021 09:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3A66E509;
 Tue,  3 Aug 2021 09:07:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AC665200A8;
 Tue,  3 Aug 2021 09:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627981629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KkHL2CZ3W1c8VXaH2AGjl4WNZ/pJK1qpK2qVN7PE6mw=;
 b=Ut7OQJM/V3w0uXcIOlLjEwDYYDM+zxxnl+Nxpy3A7w6BIMRXtZyxU71dJJ8jZ/TYmlCE42
 clTz25XXmKvzQprYPZw/uQw2F/ZJN9OfDKn4VlQCqpVoxWJ59F23npDdi7Zg/wll5ILh4R
 m+1EsVHluiNAAaF5JnucyqevKZeLzUY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627981629;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KkHL2CZ3W1c8VXaH2AGjl4WNZ/pJK1qpK2qVN7PE6mw=;
 b=plINC8wTepHhzPMjJvIWk9iFGtZUs7aK8kynwsY5/p0i1JDogkA2y8gT2ZZ4Kn/1nLicCg
 F3VB3B4SGJAJr4Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E5EF113CCA;
 Tue,  3 Aug 2021 09:07:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0L3lNjwHCWFVJQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Aug 2021 09:07:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 sam@ravnborg.org, bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 anitha.chrisanthus@intel.com, robdclark@gmail.com, edmund.j.dea@intel.com,
 sean@poorly.run, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jyri.sarha@iki.fi, tomba@kernel.org,
 Dan.Sneddon@microchip.com, tomi.valkeinen@ideasonboard.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
Date: Tue,  3 Aug 2021 11:06:53 +0200
Message-Id: <20210803090704.32152-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210803090704.32152-1-tzimmermann@suse.de>
References: <20210803090704.32152-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
don't benefit from using it. DRM IRQ callbacks are now being called
directly or inlined.

v2:
	* use managed release via devm_request_irq() (Sam)
	* drop extra test for irq != IRQ_NOTCONNECTED (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: Dan Sneddon <Dan.Sneddon@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 80 ++++++++++++--------
 1 file changed, 47 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index f09b6dd8754c..1656d27b78b6 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -22,7 +22,6 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -557,6 +556,51 @@ static irqreturn_t atmel_hlcdc_dc_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static void atmel_hlcdc_dc_irq_postinstall(struct drm_device *dev)
+{
+	struct atmel_hlcdc_dc *dc = dev->dev_private;
+	unsigned int cfg = 0;
+	int i;
+
+	/* Enable interrupts on activated layers */
+	for (i = 0; i < ATMEL_HLCDC_MAX_LAYERS; i++) {
+		if (dc->layers[i])
+			cfg |= ATMEL_HLCDC_LAYER_STATUS(i);
+	}
+
+	regmap_write(dc->hlcdc->regmap, ATMEL_HLCDC_IER, cfg);
+}
+
+static void atmel_hlcdc_dc_irq_disable(struct drm_device *dev)
+{
+	struct atmel_hlcdc_dc *dc = dev->dev_private;
+	unsigned int isr;
+
+	regmap_write(dc->hlcdc->regmap, ATMEL_HLCDC_IDR, 0xffffffff);
+	regmap_read(dc->hlcdc->regmap, ATMEL_HLCDC_ISR, &isr);
+}
+
+static int atmel_hlcdc_dc_irq_install(struct drm_device *dev, unsigned int irq)
+{
+	int ret;
+
+	atmel_hlcdc_dc_irq_disable(dev);
+
+	ret = devm_request_irq(dev->dev, irq, atmel_hlcdc_dc_irq_handler, 0,
+			       dev->driver->name, dev);
+	if (ret)
+		return ret;
+
+	atmel_hlcdc_dc_irq_postinstall(dev);
+
+	return 0;
+}
+
+static void atmel_hlcdc_dc_irq_uninstall(struct drm_device *dev)
+{
+	atmel_hlcdc_dc_irq_disable(dev);
+}
+
 static const struct drm_mode_config_funcs mode_config_funcs = {
 	.fb_create = drm_gem_fb_create,
 	.atomic_check = drm_atomic_helper_check,
@@ -647,7 +691,7 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
 	drm_mode_config_reset(dev);
 
 	pm_runtime_get_sync(dev->dev);
-	ret = drm_irq_install(dev, dc->hlcdc->irq);
+	ret = atmel_hlcdc_dc_irq_install(dev, dc->hlcdc->irq);
 	pm_runtime_put_sync(dev->dev);
 	if (ret < 0) {
 		dev_err(dev->dev, "failed to install IRQ handler\n");
@@ -676,7 +720,7 @@ static void atmel_hlcdc_dc_unload(struct drm_device *dev)
 	drm_mode_config_cleanup(dev);
 
 	pm_runtime_get_sync(dev->dev);
-	drm_irq_uninstall(dev);
+	atmel_hlcdc_dc_irq_uninstall(dev);
 	pm_runtime_put_sync(dev->dev);
 
 	dev->dev_private = NULL;
@@ -685,40 +729,10 @@ static void atmel_hlcdc_dc_unload(struct drm_device *dev)
 	clk_disable_unprepare(dc->hlcdc->periph_clk);
 }
 
-static int atmel_hlcdc_dc_irq_postinstall(struct drm_device *dev)
-{
-	struct atmel_hlcdc_dc *dc = dev->dev_private;
-	unsigned int cfg = 0;
-	int i;
-
-	/* Enable interrupts on activated layers */
-	for (i = 0; i < ATMEL_HLCDC_MAX_LAYERS; i++) {
-		if (dc->layers[i])
-			cfg |= ATMEL_HLCDC_LAYER_STATUS(i);
-	}
-
-	regmap_write(dc->hlcdc->regmap, ATMEL_HLCDC_IER, cfg);
-
-	return 0;
-}
-
-static void atmel_hlcdc_dc_irq_uninstall(struct drm_device *dev)
-{
-	struct atmel_hlcdc_dc *dc = dev->dev_private;
-	unsigned int isr;
-
-	regmap_write(dc->hlcdc->regmap, ATMEL_HLCDC_IDR, 0xffffffff);
-	regmap_read(dc->hlcdc->regmap, ATMEL_HLCDC_ISR, &isr);
-}
-
 DEFINE_DRM_GEM_CMA_FOPS(fops);
 
 static const struct drm_driver atmel_hlcdc_dc_driver = {
 	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
-	.irq_handler = atmel_hlcdc_dc_irq_handler,
-	.irq_preinstall = atmel_hlcdc_dc_irq_uninstall,
-	.irq_postinstall = atmel_hlcdc_dc_irq_postinstall,
-	.irq_uninstall = atmel_hlcdc_dc_irq_uninstall,
 	DRM_GEM_CMA_DRIVER_OPS,
 	.fops = &fops,
 	.name = "atmel-hlcdc",
-- 
2.32.0

