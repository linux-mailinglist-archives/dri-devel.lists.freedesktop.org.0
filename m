Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A46A33D7D92
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 20:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DAB6EC36;
	Tue, 27 Jul 2021 18:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252876E9ED;
 Tue, 27 Jul 2021 18:27:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 90E981FF2D;
 Tue, 27 Jul 2021 18:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627410444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//hAtPteXjHDXk24mTB68/emfGqD4SYAPfXwEPWli/U=;
 b=WfxvtJdJAddxHyITkJU+ZkpL8nfmmbKExP7Shl5i99B4KmHhQEI4F0aaf5ZE7GKgdNDBvf
 +Z/PJ18A0Yq/eveG5DwMVtP+2KjNHudROVtHcAVQFs23pNkewK/i5Z2dzaIJIly+9sqCsT
 vrnUxakd3VFI0qdAV3j2/baVRNPxwxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627410444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//hAtPteXjHDXk24mTB68/emfGqD4SYAPfXwEPWli/U=;
 b=0BccTDQB+JBBuUdS/8QPYbA8xlmUB8efaDx7w6QuZnV9dEPx1/G2f4dGwGXGWaR/5mzXmd
 UOopOF9qcx1lflAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0EFC913B86;
 Tue, 27 Jul 2021 18:27:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SCa8AgxQAGGwGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Jul 2021 18:27:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 sam@ravnborg.org, bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 anitha.chrisanthus@intel.com, robdclark@gmail.com, edmund.j.dea@intel.com,
 sean@poorly.run, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jyri.sarha@iki.fi, tomba@kernel.org
Subject: [PATCH 02/14] drm/arm/hdlcd: Convert to Linux IRQ interfaces
Date: Tue, 27 Jul 2021 20:27:09 +0200
Message-Id: <20210727182721.17981-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727182721.17981-1-tzimmermann@suse.de>
References: <20210727182721.17981-1-tzimmermann@suse.de>
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
don't benefit from using it.

DRM IRQ callbacks are now being called directly or inlined.

Calls to platform_get_irq() can fail with a negative errno code.
Abort initialization in this case. The DRM IRQ midlayer does not
handle this case correctly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 174 ++++++++++++++++++--------------
 drivers/gpu/drm/arm/hdlcd_drv.h |   1 +
 2 files changed, 97 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 81ae92390736..b9998fe3982f 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -29,7 +29,6 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
@@ -38,6 +37,94 @@
 #include "hdlcd_drv.h"
 #include "hdlcd_regs.h"
 
+static irqreturn_t hdlcd_irq(int irq, void *arg)
+{
+	struct drm_device *drm = arg;
+	struct hdlcd_drm_private *hdlcd = drm->dev_private;
+	unsigned long irq_status;
+
+	irq_status = hdlcd_read(hdlcd, HDLCD_REG_INT_STATUS);
+
+#ifdef CONFIG_DEBUG_FS
+	if (irq_status & HDLCD_INTERRUPT_UNDERRUN)
+		atomic_inc(&hdlcd->buffer_underrun_count);
+
+	if (irq_status & HDLCD_INTERRUPT_DMA_END)
+		atomic_inc(&hdlcd->dma_end_count);
+
+	if (irq_status & HDLCD_INTERRUPT_BUS_ERROR)
+		atomic_inc(&hdlcd->bus_error_count);
+
+	if (irq_status & HDLCD_INTERRUPT_VSYNC)
+		atomic_inc(&hdlcd->vsync_count);
+
+#endif
+	if (irq_status & HDLCD_INTERRUPT_VSYNC)
+		drm_crtc_handle_vblank(&hdlcd->crtc);
+
+	/* acknowledge interrupt(s) */
+	hdlcd_write(hdlcd, HDLCD_REG_INT_CLEAR, irq_status);
+
+	return IRQ_HANDLED;
+}
+
+static void hdlcd_irq_preinstall(struct drm_device *drm)
+{
+	struct hdlcd_drm_private *hdlcd = drm->dev_private;
+	/* Ensure interrupts are disabled */
+	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, 0);
+	hdlcd_write(hdlcd, HDLCD_REG_INT_CLEAR, ~0);
+}
+
+static void hdlcd_irq_postinstall(struct drm_device *drm)
+{
+#ifdef CONFIG_DEBUG_FS
+	struct hdlcd_drm_private *hdlcd = drm->dev_private;
+	unsigned long irq_mask = hdlcd_read(hdlcd, HDLCD_REG_INT_MASK);
+
+	/* enable debug interrupts */
+	irq_mask |= HDLCD_DEBUG_INT_MASK;
+
+	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, irq_mask);
+#endif
+}
+
+static int hdlcd_irq_install(struct drm_device *dev, int irq)
+{
+	int ret;
+
+	if (irq == IRQ_NOTCONNECTED)
+		return -ENOTCONN;
+
+	hdlcd_irq_preinstall(dev);
+
+	ret = request_irq(irq, hdlcd_irq, 0, dev->driver->name, dev);
+	if (ret)
+		return ret;
+
+	hdlcd_irq_postinstall(dev);
+
+	return 0;
+}
+
+static void hdlcd_irq_uninstall(struct drm_device *drm)
+{
+	struct hdlcd_drm_private *hdlcd = drm->dev_private;
+	/* disable all the interrupts that we might have enabled */
+	unsigned long irq_mask = hdlcd_read(hdlcd, HDLCD_REG_INT_MASK);
+
+#ifdef CONFIG_DEBUG_FS
+	/* disable debug interrupts */
+	irq_mask &= ~HDLCD_DEBUG_INT_MASK;
+#endif
+
+	/* disable vsync interrupts */
+	irq_mask &= ~HDLCD_INTERRUPT_VSYNC;
+	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, irq_mask);
+
+	free_irq(hdlcd->irq, drm);
+}
+
 static int hdlcd_load(struct drm_device *drm, unsigned long flags)
 {
 	struct hdlcd_drm_private *hdlcd = drm->dev_private;
@@ -90,7 +177,12 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
 		goto setup_fail;
 	}
 
-	ret = drm_irq_install(drm, platform_get_irq(pdev, 0));
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		goto irq_fail;
+	hdlcd->irq = ret;
+
+	ret = hdlcd_irq_install(drm, hdlcd->irq);
 	if (ret < 0) {
 		DRM_ERROR("failed to install IRQ handler\n");
 		goto irq_fail;
@@ -122,76 +214,6 @@ static void hdlcd_setup_mode_config(struct drm_device *drm)
 	drm->mode_config.funcs = &hdlcd_mode_config_funcs;
 }
 
-static irqreturn_t hdlcd_irq(int irq, void *arg)
-{
-	struct drm_device *drm = arg;
-	struct hdlcd_drm_private *hdlcd = drm->dev_private;
-	unsigned long irq_status;
-
-	irq_status = hdlcd_read(hdlcd, HDLCD_REG_INT_STATUS);
-
-#ifdef CONFIG_DEBUG_FS
-	if (irq_status & HDLCD_INTERRUPT_UNDERRUN)
-		atomic_inc(&hdlcd->buffer_underrun_count);
-
-	if (irq_status & HDLCD_INTERRUPT_DMA_END)
-		atomic_inc(&hdlcd->dma_end_count);
-
-	if (irq_status & HDLCD_INTERRUPT_BUS_ERROR)
-		atomic_inc(&hdlcd->bus_error_count);
-
-	if (irq_status & HDLCD_INTERRUPT_VSYNC)
-		atomic_inc(&hdlcd->vsync_count);
-
-#endif
-	if (irq_status & HDLCD_INTERRUPT_VSYNC)
-		drm_crtc_handle_vblank(&hdlcd->crtc);
-
-	/* acknowledge interrupt(s) */
-	hdlcd_write(hdlcd, HDLCD_REG_INT_CLEAR, irq_status);
-
-	return IRQ_HANDLED;
-}
-
-static void hdlcd_irq_preinstall(struct drm_device *drm)
-{
-	struct hdlcd_drm_private *hdlcd = drm->dev_private;
-	/* Ensure interrupts are disabled */
-	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, 0);
-	hdlcd_write(hdlcd, HDLCD_REG_INT_CLEAR, ~0);
-}
-
-static int hdlcd_irq_postinstall(struct drm_device *drm)
-{
-#ifdef CONFIG_DEBUG_FS
-	struct hdlcd_drm_private *hdlcd = drm->dev_private;
-	unsigned long irq_mask = hdlcd_read(hdlcd, HDLCD_REG_INT_MASK);
-
-	/* enable debug interrupts */
-	irq_mask |= HDLCD_DEBUG_INT_MASK;
-
-	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, irq_mask);
-#endif
-	return 0;
-}
-
-static void hdlcd_irq_uninstall(struct drm_device *drm)
-{
-	struct hdlcd_drm_private *hdlcd = drm->dev_private;
-	/* disable all the interrupts that we might have enabled */
-	unsigned long irq_mask = hdlcd_read(hdlcd, HDLCD_REG_INT_MASK);
-
-#ifdef CONFIG_DEBUG_FS
-	/* disable debug interrupts */
-	irq_mask &= ~HDLCD_DEBUG_INT_MASK;
-#endif
-
-	/* disable vsync interrupts */
-	irq_mask &= ~HDLCD_INTERRUPT_VSYNC;
-
-	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, irq_mask);
-}
-
 #ifdef CONFIG_DEBUG_FS
 static int hdlcd_show_underrun_count(struct seq_file *m, void *arg)
 {
@@ -236,10 +258,6 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
 
 static const struct drm_driver hdlcd_driver = {
 	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
-	.irq_handler = hdlcd_irq,
-	.irq_preinstall = hdlcd_irq_preinstall,
-	.irq_postinstall = hdlcd_irq_postinstall,
-	.irq_uninstall = hdlcd_irq_uninstall,
 	DRM_GEM_CMA_DRIVER_OPS,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init = hdlcd_debugfs_init,
@@ -316,7 +334,7 @@ static int hdlcd_drm_bind(struct device *dev)
 err_unload:
 	of_node_put(hdlcd->crtc.port);
 	hdlcd->crtc.port = NULL;
-	drm_irq_uninstall(drm);
+	hdlcd_irq_uninstall(drm);
 	of_reserved_mem_device_release(drm->dev);
 err_free:
 	drm_mode_config_cleanup(drm);
@@ -338,7 +356,7 @@ static void hdlcd_drm_unbind(struct device *dev)
 	hdlcd->crtc.port = NULL;
 	pm_runtime_get_sync(dev);
 	drm_atomic_helper_shutdown(drm);
-	drm_irq_uninstall(drm);
+	hdlcd_irq_uninstall(drm);
 	pm_runtime_put(dev);
 	if (pm_runtime_enabled(dev))
 		pm_runtime_disable(dev);
diff --git a/drivers/gpu/drm/arm/hdlcd_drv.h b/drivers/gpu/drm/arm/hdlcd_drv.h
index fd438d177b64..909c39c28487 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.h
+++ b/drivers/gpu/drm/arm/hdlcd_drv.h
@@ -11,6 +11,7 @@ struct hdlcd_drm_private {
 	struct clk			*clk;
 	struct drm_crtc			crtc;
 	struct drm_plane		*plane;
+	unsigned int			irq;
 #ifdef CONFIG_DEBUG_FS
 	atomic_t buffer_underrun_count;
 	atomic_t bus_error_count;
-- 
2.32.0

