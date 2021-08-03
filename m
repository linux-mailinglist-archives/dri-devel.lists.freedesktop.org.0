Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 100DD3DE957
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 11:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF6C6E532;
	Tue,  3 Aug 2021 09:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C916E4EA;
 Tue,  3 Aug 2021 09:07:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6E2C3220C0;
 Tue,  3 Aug 2021 09:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627981630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RbBfL4mCTjt0RtM9rcPnqtOKzHPQr0ry5imZlRlAO48=;
 b=iLT0EnjsoOgObNEGi9o1Ul1DLdgQgBqiDCEw6SeP56ZmLFWyGCUnFA2CaQkUFlR7tyDWds
 AQiikSD9oQ2yEtIJX9RNLxIRt4/iAgPvnMWyIYBuNm4gEhty7Nq+C0gGP56uzj4RiO7Et+
 8U3BcJxxnvSorj8UUs4+HkmgYS3aXRU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627981630;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RbBfL4mCTjt0RtM9rcPnqtOKzHPQr0ry5imZlRlAO48=;
 b=QDh7QO0n2wbaXL7ah3ZrrlK9q56NXase9Vd6yEdTn0evBmPODPx55k2EqE6xmMG0Lhe2y4
 zCgIZiy3DEMjOpCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A239213CC4;
 Tue,  3 Aug 2021 09:07:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EMN5Jj0HCWFVJQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Aug 2021 09:07:09 +0000
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
Subject: [PATCH v2 04/14] drm/fsl-dcu: Convert to Linux IRQ interfaces
Date: Tue,  3 Aug 2021 11:06:54 +0200
Message-Id: <20210803090704.32152-5-tzimmermann@suse.de>
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 78 +++++++++++++----------
 1 file changed, 46 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index 7528e8a2d359..660fe573db96 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -23,7 +23,6 @@
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
@@ -51,7 +50,7 @@ static const struct regmap_config fsl_dcu_regmap_config = {
 	.volatile_reg = fsl_dcu_drm_is_volatile_reg,
 };
 
-static void fsl_dcu_irq_uninstall(struct drm_device *dev)
+static void fsl_dcu_irq_reset(struct drm_device *dev)
 {
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
 
@@ -59,6 +58,45 @@ static void fsl_dcu_irq_uninstall(struct drm_device *dev)
 	regmap_write(fsl_dev->regmap, DCU_INT_MASK, ~0);
 }
 
+static irqreturn_t fsl_dcu_drm_irq(int irq, void *arg)
+{
+	struct drm_device *dev = arg;
+	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
+	unsigned int int_status;
+	int ret;
+
+	ret = regmap_read(fsl_dev->regmap, DCU_INT_STATUS, &int_status);
+	if (ret) {
+		dev_err(dev->dev, "read DCU_INT_STATUS failed\n");
+		return IRQ_NONE;
+	}
+
+	if (int_status & DCU_INT_STATUS_VBLANK)
+		drm_handle_vblank(dev, 0);
+
+	regmap_write(fsl_dev->regmap, DCU_INT_STATUS, int_status);
+
+	return IRQ_HANDLED;
+}
+
+static int fsl_dcu_irq_install(struct drm_device *dev, unsigned int irq)
+{
+	if (irq == IRQ_NOTCONNECTED)
+		return -ENOTCONN;
+
+	fsl_dcu_irq_reset(dev);
+
+	return request_irq(irq, fsl_dcu_drm_irq, 0, dev->driver->name, dev);
+}
+
+static void fsl_dcu_irq_uninstall(struct drm_device *dev)
+{
+	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
+
+	fsl_dcu_irq_reset(dev);
+	free_irq(fsl_dev->irq, dev);
+}
+
 static int fsl_dcu_load(struct drm_device *dev, unsigned long flags)
 {
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
@@ -73,13 +111,13 @@ static int fsl_dcu_load(struct drm_device *dev, unsigned long flags)
 	ret = drm_vblank_init(dev, dev->mode_config.num_crtc);
 	if (ret < 0) {
 		dev_err(dev->dev, "failed to initialize vblank\n");
-		goto done;
+		goto done_vblank;
 	}
 
-	ret = drm_irq_install(dev, fsl_dev->irq);
+	ret = fsl_dcu_irq_install(dev, fsl_dev->irq);
 	if (ret < 0) {
 		dev_err(dev->dev, "failed to install IRQ handler\n");
-		goto done;
+		goto done_irq;
 	}
 
 	if (legacyfb_depth != 16 && legacyfb_depth != 24 &&
@@ -90,11 +128,11 @@ static int fsl_dcu_load(struct drm_device *dev, unsigned long flags)
 	}
 
 	return 0;
-done:
+done_irq:
 	drm_kms_helper_poll_fini(dev);
 
 	drm_mode_config_cleanup(dev);
-	drm_irq_uninstall(dev);
+done_vblank:
 	dev->dev_private = NULL;
 
 	return ret;
@@ -106,41 +144,17 @@ static void fsl_dcu_unload(struct drm_device *dev)
 	drm_kms_helper_poll_fini(dev);
 
 	drm_mode_config_cleanup(dev);
-	drm_irq_uninstall(dev);
+	fsl_dcu_irq_uninstall(dev);
 
 	dev->dev_private = NULL;
 }
 
-static irqreturn_t fsl_dcu_drm_irq(int irq, void *arg)
-{
-	struct drm_device *dev = arg;
-	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
-	unsigned int int_status;
-	int ret;
-
-	ret = regmap_read(fsl_dev->regmap, DCU_INT_STATUS, &int_status);
-	if (ret) {
-		dev_err(dev->dev, "read DCU_INT_STATUS failed\n");
-		return IRQ_NONE;
-	}
-
-	if (int_status & DCU_INT_STATUS_VBLANK)
-		drm_handle_vblank(dev, 0);
-
-	regmap_write(fsl_dev->regmap, DCU_INT_STATUS, int_status);
-
-	return IRQ_HANDLED;
-}
-
 DEFINE_DRM_GEM_CMA_FOPS(fsl_dcu_drm_fops);
 
 static const struct drm_driver fsl_dcu_drm_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.load			= fsl_dcu_load,
 	.unload			= fsl_dcu_unload,
-	.irq_handler		= fsl_dcu_drm_irq,
-	.irq_preinstall		= fsl_dcu_irq_uninstall,
-	.irq_uninstall		= fsl_dcu_irq_uninstall,
 	DRM_GEM_CMA_DRIVER_OPS,
 	.fops			= &fsl_dcu_drm_fops,
 	.name			= "fsl-dcu-drm",
-- 
2.32.0

