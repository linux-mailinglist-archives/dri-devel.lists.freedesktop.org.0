Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA773DE976
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 11:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42EA6E83F;
	Tue,  3 Aug 2021 09:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3ECE6E826;
 Tue,  3 Aug 2021 09:07:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4B42D220CE;
 Tue,  3 Aug 2021 09:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627981638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M70ybIL4oCFvQet3byWP0PwROzfybAx6FSGp2onwFB4=;
 b=ytl6aHBagHGlHrbtUXFJrerghhym+HX8KZ4B99RupbIKW3EWKITh9Z156M5L6TlmzeGVkL
 K/uxtB6UNiXurDLsevLWiqKV4sRQjkRXs9xVC0uRuTUDxTw2Y8ChRzGNTE9RZJRpKxtZ8O
 7awdAI9QKo+UWrpXc1Caj3db7eaE+mY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627981638;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M70ybIL4oCFvQet3byWP0PwROzfybAx6FSGp2onwFB4=;
 b=pl/BloMaZpn/AwDXyVajHTVvKz+eIvwUedSzk191X0Osp5UiaNJOA56lOmOZl5eoye7T5r
 G32Dd7vb68jjyWDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D5FD13CC4;
 Tue,  3 Aug 2021 09:07:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YLNqHUUHCWFVJQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Aug 2021 09:07:17 +0000
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
Subject: [PATCH v2 14/14] drm: IRQ midlayer is now legacy
Date: Tue,  3 Aug 2021 11:07:04 +0200
Message-Id: <20210803090704.32152-15-tzimmermann@suse.de>
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

Hide the DRM midlayer behind CONFIG_DRM_LEGACY, make functions use
the prefix drm_legacy_, and move declarations to drm_legacy.h.
In struct drm_device, move the fields irq and irq_enabled behind
CONFIG_DRM_LEGACY.

All callers have been updated.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_irq.c         | 63 ++++---------------------------
 drivers/gpu/drm/drm_legacy_misc.c |  3 +-
 drivers/gpu/drm/drm_vblank.c      |  8 ++--
 drivers/gpu/drm/i810/i810_dma.c   |  3 +-
 drivers/gpu/drm/mga/mga_dma.c     |  2 +-
 drivers/gpu/drm/mga/mga_drv.h     |  1 -
 drivers/gpu/drm/r128/r128_cce.c   |  3 +-
 drivers/gpu/drm/via/via_mm.c      |  3 +-
 include/drm/drm_device.h          | 18 ++-------
 include/drm/drm_drv.h             | 44 ++-------------------
 include/drm/drm_irq.h             | 31 ---------------
 include/drm/drm_legacy.h          |  3 ++
 12 files changed, 27 insertions(+), 155 deletions(-)
 delete mode 100644 include/drm/drm_irq.h

diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
index dc6e38fa8a48..13e1d5c4ec82 100644
--- a/drivers/gpu/drm/drm_irq.c
+++ b/drivers/gpu/drm/drm_irq.c
@@ -60,46 +60,14 @@
 #include <drm/drm.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_irq.h>
+#include <drm/drm_legacy.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "drm_internal.h"
 
-/**
- * DOC: irq helpers
- *
- * The DRM core provides very simple support helpers to enable IRQ handling on a
- * device through the drm_irq_install() and drm_irq_uninstall() functions. This
- * only supports devices with a single interrupt on the main device stored in
- * &drm_device.dev and set as the device paramter in drm_dev_alloc().
- *
- * These IRQ helpers are strictly optional. Since these helpers don't automatically
- * clean up the requested interrupt like e.g. devm_request_irq() they're not really
- * recommended.
- */
-
-/**
- * drm_irq_install - install IRQ handler
- * @dev: DRM device
- * @irq: IRQ number to install the handler for
- *
- * Initializes the IRQ related data. Installs the handler, calling the driver
- * &drm_driver.irq_preinstall and &drm_driver.irq_postinstall functions before
- * and after the installation.
- *
- * This is the simplified helper interface provided for drivers with no special
- * needs.
- *
- * @irq must match the interrupt number that would be passed to request_irq(),
- * if called directly instead of using this helper function.
- *
- * &drm_driver.irq_handler is called to handle the registered interrupt.
- *
- * Returns:
- * Zero on success or a negative error code on failure.
- */
-int drm_irq_install(struct drm_device *dev, int irq)
+#if IS_ENABLED(CONFIG_DRM_LEGACY)
+static int drm_legacy_irq_install(struct drm_device *dev, int irq)
 {
 	int ret;
 	unsigned long sh_flags = 0;
@@ -144,24 +112,8 @@ int drm_irq_install(struct drm_device *dev, int irq)
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_irq_install);
 
-/**
- * drm_irq_uninstall - uninstall the IRQ handler
- * @dev: DRM device
- *
- * Calls the driver's &drm_driver.irq_uninstall function and unregisters the IRQ
- * handler.  This should only be called by drivers which used drm_irq_install()
- * to set up their interrupt handler.
- *
- * Note that for kernel modesetting drivers it is a bug if this function fails.
- * The sanity checks are only to catch buggy user modesetting drivers which call
- * the same function through an ioctl.
- *
- * Returns:
- * Zero on success or a negative error code on failure.
- */
-int drm_irq_uninstall(struct drm_device *dev)
+int drm_legacy_irq_uninstall(struct drm_device *dev)
 {
 	unsigned long irqflags;
 	bool irq_enabled;
@@ -207,9 +159,8 @@ int drm_irq_uninstall(struct drm_device *dev)
 
 	return 0;
 }
-EXPORT_SYMBOL(drm_irq_uninstall);
+EXPORT_SYMBOL(drm_legacy_irq_uninstall);
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
 int drm_legacy_irq_control(struct drm_device *dev, void *data,
 			   struct drm_file *file_priv)
 {
@@ -238,13 +189,13 @@ int drm_legacy_irq_control(struct drm_device *dev, void *data,
 		    ctl->irq != irq)
 			return -EINVAL;
 		mutex_lock(&dev->struct_mutex);
-		ret = drm_irq_install(dev, irq);
+		ret = drm_legacy_irq_install(dev, irq);
 		mutex_unlock(&dev->struct_mutex);
 
 		return ret;
 	case DRM_UNINST_HANDLER:
 		mutex_lock(&dev->struct_mutex);
-		ret = drm_irq_uninstall(dev);
+		ret = drm_legacy_irq_uninstall(dev);
 		mutex_unlock(&dev->struct_mutex);
 
 		return ret;
diff --git a/drivers/gpu/drm/drm_legacy_misc.c b/drivers/gpu/drm/drm_legacy_misc.c
index 83db43b7a25e..d4c5434062d7 100644
--- a/drivers/gpu/drm/drm_legacy_misc.c
+++ b/drivers/gpu/drm/drm_legacy_misc.c
@@ -35,7 +35,6 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_print.h>
 
 #include "drm_internal.h"
@@ -78,7 +77,7 @@ int drm_legacy_setup(struct drm_device * dev)
 void drm_legacy_dev_reinit(struct drm_device *dev)
 {
 	if (dev->irq_enabled)
-		drm_irq_uninstall(dev);
+		drm_legacy_irq_uninstall(dev);
 
 	mutex_lock(&dev->struct_mutex);
 
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index bba6781cc48f..3e260f3e2863 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1739,10 +1739,10 @@ static void drm_wait_vblank_reply(struct drm_device *dev, unsigned int pipe,
 
 static bool drm_wait_vblank_supported(struct drm_device *dev)
 {
-	if  (IS_ENABLED(CONFIG_DRM_LEGACY)) {
-		if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
-			return dev->irq_enabled;
-	}
+#if IS_ENABLED(CONFIG_DRM_LEGACY)
+	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
+		return dev->irq_enabled;
+#endif
 	return drm_dev_has_vblank(dev);
 }
 
diff --git a/drivers/gpu/drm/i810/i810_dma.c b/drivers/gpu/drm/i810/i810_dma.c
index d78c82af367c..9fb4dd63342f 100644
--- a/drivers/gpu/drm/i810/i810_dma.c
+++ b/drivers/gpu/drm/i810/i810_dma.c
@@ -38,7 +38,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_print.h>
 #include <drm/i810_drm.h>
 
@@ -209,7 +208,7 @@ static int i810_dma_cleanup(struct drm_device *dev)
 	 * is freed, it's too late.
 	 */
 	if (drm_core_check_feature(dev, DRIVER_HAVE_IRQ) && dev->irq_enabled)
-		drm_irq_uninstall(dev);
+		drm_legacy_irq_uninstall(dev);
 
 	if (dev->dev_private) {
 		int i;
diff --git a/drivers/gpu/drm/mga/mga_dma.c b/drivers/gpu/drm/mga/mga_dma.c
index 403efc1f1a7c..331c2f0da57a 100644
--- a/drivers/gpu/drm/mga/mga_dma.c
+++ b/drivers/gpu/drm/mga/mga_dma.c
@@ -949,7 +949,7 @@ static int mga_do_cleanup_dma(struct drm_device *dev, int full_cleanup)
 	 * is freed, it's too late.
 	 */
 	if (dev->irq_enabled)
-		drm_irq_uninstall(dev);
+		drm_legacy_irq_uninstall(dev);
 
 	if (dev->dev_private) {
 		drm_mga_private_t *dev_priv = dev->dev_private;
diff --git a/drivers/gpu/drm/mga/mga_drv.h b/drivers/gpu/drm/mga/mga_drv.h
index 84395d81ab9b..f61401c70b90 100644
--- a/drivers/gpu/drm/mga/mga_drv.h
+++ b/drivers/gpu/drm/mga/mga_drv.h
@@ -38,7 +38,6 @@
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_legacy.h>
 #include <drm/drm_print.h>
 #include <drm/drm_sarea.h>
diff --git a/drivers/gpu/drm/r128/r128_cce.c b/drivers/gpu/drm/r128/r128_cce.c
index 2a2933c16308..c04d84a69dd2 100644
--- a/drivers/gpu/drm/r128/r128_cce.c
+++ b/drivers/gpu/drm/r128/r128_cce.c
@@ -39,7 +39,6 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_legacy.h>
 #include <drm/drm_print.h>
 #include <drm/r128_drm.h>
@@ -603,7 +602,7 @@ int r128_do_cleanup_cce(struct drm_device *dev)
 	 * is freed, it's too late.
 	 */
 	if (dev->irq_enabled)
-		drm_irq_uninstall(dev);
+		drm_legacy_irq_uninstall(dev);
 
 	if (dev->dev_private) {
 		drm_r128_private_t *dev_priv = dev->dev_private;
diff --git a/drivers/gpu/drm/via/via_mm.c b/drivers/gpu/drm/via/via_mm.c
index dae1bacd86c1..c9afa1a51f23 100644
--- a/drivers/gpu/drm/via/via_mm.c
+++ b/drivers/gpu/drm/via/via_mm.c
@@ -29,7 +29,6 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
-#include <drm/drm_irq.h>
 #include <drm/via_drm.h>
 
 #include "via_drv.h"
@@ -86,7 +85,7 @@ int via_final_context(struct drm_device *dev, int context)
 	/* Last context, perform cleanup */
 	if (list_is_singular(&dev->ctxlist)) {
 		DRM_DEBUG("Last Context\n");
-		drm_irq_uninstall(dev);
+		drm_legacy_irq_uninstall(dev);
 		via_cleanup_futex(dev_priv);
 		via_do_cleanup_map(dev);
 	}
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index f588f967bb14..604b1d1b2d72 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -191,20 +191,6 @@ struct drm_device {
 	 */
 	struct list_head clientlist;
 
-	/**
-	 * @irq_enabled:
-	 *
-	 * Indicates that interrupt handling is enabled, specifically vblank
-	 * handling. Drivers which don't use drm_irq_install() need to set this
-	 * to true manually.
-	 */
-	bool irq_enabled;
-
-	/**
-	 * @irq: Used by the drm_irq_install() and drm_irq_unistall() helpers.
-	 */
-	int irq;
-
 	/**
 	 * @vblank_disable_immediate:
 	 *
@@ -372,6 +358,10 @@ struct drm_device {
 
 	/* Scatter gather memory */
 	struct drm_sg_mem *sg;
+
+	/* IRQs */
+	bool irq_enabled;
+	int irq;
 #endif
 };
 
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index b439ae1921b8..0cd95953cdf5 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -137,10 +137,6 @@ enum drm_driver_feature {
 	 * @DRIVER_HAVE_IRQ:
 	 *
 	 * Legacy irq support. Only for legacy drivers. Do not use.
-	 *
-	 * New drivers can either use the drm_irq_install() and
-	 * drm_irq_uninstall() helper functions, or roll their own irq support
-	 * code by calling request_irq() directly.
 	 */
 	DRIVER_HAVE_IRQ			= BIT(30),
 	/**
@@ -271,42 +267,6 @@ struct drm_driver {
 	 */
 	void (*release) (struct drm_device *);
 
-	/**
-	 * @irq_handler:
-	 *
-	 * Interrupt handler called when using drm_irq_install(). Not used by
-	 * drivers which implement their own interrupt handling.
-	 */
-	irqreturn_t(*irq_handler) (int irq, void *arg);
-
-	/**
-	 * @irq_preinstall:
-	 *
-	 * Optional callback used by drm_irq_install() which is called before
-	 * the interrupt handler is registered. This should be used to clear out
-	 * any pending interrupts (from e.g. firmware based drives) and reset
-	 * the interrupt handling registers.
-	 */
-	void (*irq_preinstall) (struct drm_device *dev);
-
-	/**
-	 * @irq_postinstall:
-	 *
-	 * Optional callback used by drm_irq_install() which is called after
-	 * the interrupt handler is registered. This should be used to enable
-	 * interrupt generation in the hardware.
-	 */
-	int (*irq_postinstall) (struct drm_device *dev);
-
-	/**
-	 * @irq_uninstall:
-	 *
-	 * Optional callback used by drm_irq_uninstall() which is called before
-	 * the interrupt handler is unregistered. This should be used to disable
-	 * interrupt generation in the hardware.
-	 */
-	void (*irq_uninstall) (struct drm_device *dev);
-
 	/**
 	 * @master_set:
 	 *
@@ -504,6 +464,10 @@ struct drm_driver {
 	int (*dma_ioctl) (struct drm_device *dev, void *data, struct drm_file *file_priv);
 	int (*dma_quiescent) (struct drm_device *);
 	int (*context_dtor) (struct drm_device *dev, int context);
+	irqreturn_t (*irq_handler)(int irq, void *arg);
+	void (*irq_preinstall)(struct drm_device *dev);
+	int (*irq_postinstall)(struct drm_device *dev);
+	void (*irq_uninstall)(struct drm_device *dev);
 	u32 (*get_vblank_counter)(struct drm_device *dev, unsigned int pipe);
 	int (*enable_vblank)(struct drm_device *dev, unsigned int pipe);
 	void (*disable_vblank)(struct drm_device *dev, unsigned int pipe);
diff --git a/include/drm/drm_irq.h b/include/drm/drm_irq.h
deleted file mode 100644
index 53634b988f57..000000000000
--- a/include/drm/drm_irq.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/*
- * Copyright 2016 Intel Corp.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#ifndef _DRM_IRQ_H_
-#define _DRM_IRQ_H_
-
-struct drm_device;
-
-int drm_irq_install(struct drm_device *dev, int irq);
-int drm_irq_uninstall(struct drm_device *dev);
-#endif
diff --git a/include/drm/drm_legacy.h b/include/drm/drm_legacy.h
index b17e79e12bc2..58dc8d8cc907 100644
--- a/include/drm/drm_legacy.h
+++ b/include/drm/drm_legacy.h
@@ -192,6 +192,9 @@ do {										\
 void drm_legacy_idlelock_take(struct drm_lock_data *lock);
 void drm_legacy_idlelock_release(struct drm_lock_data *lock);
 
+/* drm_irq.c */
+int drm_legacy_irq_uninstall(struct drm_device *dev);
+
 /* drm_pci.c */
 
 #ifdef CONFIG_PCI
-- 
2.32.0

