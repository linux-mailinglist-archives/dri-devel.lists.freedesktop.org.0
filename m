Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9944716EAA2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 16:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DD06EB31;
	Tue, 25 Feb 2020 15:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CB76EB31;
 Tue, 25 Feb 2020 15:59:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C6FA6B143;
 Tue, 25 Feb 2020 15:59:04 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, emil.velikov@collabora.com,
 alexander.deucher@amd.com, sam@ravnborg.org
Subject: [PATCH 2/3] drm: Move non-kms driver state into struct
 drm_legacy_state
Date: Tue, 25 Feb 2020 16:59:01 +0100
Message-Id: <20200225155902.9751-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200225155902.9751-1-tzimmermann@suse.de>
References: <20200225155902.9751-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All non-kms driver fields are now located in struct drm_legacy_state. A
driver-wide instance is available via struct drm_driver.legacy. The call
sites test if the driver is marked with DRIVER_LEGACY before accessing
the fields.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_bufs.c          | 10 +++++-----
 drivers/gpu/drm/drm_context.c       |  9 +++++----
 drivers/gpu/drm/drm_drv.c           |  8 ++++----
 drivers/gpu/drm/drm_file.c          |  4 ++--
 drivers/gpu/drm/drm_legacy_misc.c   |  6 +++---
 drivers/gpu/drm/drm_lock.c          |  7 ++++---
 drivers/gpu/drm/drm_pci.c           |  8 +++++---
 drivers/gpu/drm/drm_vblank.c        | 11 ++++++-----
 drivers/gpu/drm/i810/i810_drv.c     |  8 ++++----
 drivers/gpu/drm/mga/mga_drv.c       | 14 +++++++-------
 drivers/gpu/drm/r128/r128_drv.c     | 14 +++++++-------
 drivers/gpu/drm/savage/savage_drv.c | 10 +++++-----
 drivers/gpu/drm/sis/sis_drv.c       |  6 +++---
 drivers/gpu/drm/tdfx/tdfx_drv.c     |  2 +-
 drivers/gpu/drm/via/via_drv.c       | 14 +++++++-------
 include/drm/drm_drv.h               | 14 --------------
 include/drm/drm_legacy.h            | 11 +++++++++++
 17 files changed, 79 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index 19297e58b232..fbbd5f5820a4 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -812,7 +812,7 @@ int drm_legacy_addbufs_agp(struct drm_device *dev,
 		buf->pending = 0;
 		buf->file_priv = NULL;
 
-		buf->dev_priv_size = dev->driver->dev_priv_size;
+		buf->dev_priv_size = dev->driver->legacy->dev_priv_size;
 		buf->dev_private = kzalloc(buf->dev_priv_size, GFP_KERNEL);
 		if (!buf->dev_private) {
 			/* Set count correctly so we free the proper amount. */
@@ -1011,7 +1011,7 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
 			buf->pending = 0;
 			buf->file_priv = NULL;
 
-			buf->dev_priv_size = dev->driver->dev_priv_size;
+			buf->dev_priv_size = dev->driver->legacy->dev_priv_size;
 			buf->dev_private = kzalloc(buf->dev_priv_size,
 						GFP_KERNEL);
 			if (!buf->dev_private) {
@@ -1175,7 +1175,7 @@ static int drm_legacy_addbufs_sg(struct drm_device *dev,
 		buf->pending = 0;
 		buf->file_priv = NULL;
 
-		buf->dev_priv_size = dev->driver->dev_priv_size;
+		buf->dev_priv_size = dev->driver->legacy->dev_priv_size;
 		buf->dev_private = kzalloc(buf->dev_priv_size, GFP_KERNEL);
 		if (!buf->dev_private) {
 			/* Set count correctly so we free the proper amount. */
@@ -1581,8 +1581,8 @@ int drm_legacy_dma_ioctl(struct drm_device *dev, void *data,
 	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 		return -EOPNOTSUPP;
 
-	if (dev->driver->dma_ioctl)
-		return dev->driver->dma_ioctl(dev, data, file_priv);
+	if (dev->driver->legacy->dma_ioctl)
+		return dev->driver->legacy->dma_ioctl(dev, data, file_priv);
 	else
 		return -EINVAL;
 }
diff --git a/drivers/gpu/drm/drm_context.c b/drivers/gpu/drm/drm_context.c
index 1f802d8e5681..b433f755d7c2 100644
--- a/drivers/gpu/drm/drm_context.c
+++ b/drivers/gpu/drm/drm_context.c
@@ -145,8 +145,9 @@ void drm_legacy_ctxbitmap_flush(struct drm_device *dev, struct drm_file *file)
 	list_for_each_entry_safe(pos, tmp, &dev->ctxlist, head) {
 		if (pos->tag == file &&
 		    pos->handle != DRM_KERNEL_CONTEXT) {
-			if (dev->driver->context_dtor)
-				dev->driver->context_dtor(dev, pos->handle);
+			if (dev->driver->legacy->context_dtor)
+				dev->driver->legacy->context_dtor(dev,
+								  pos->handle);
 
 			drm_legacy_ctxbitmap_free(dev, pos->handle);
 			list_del(&pos->head);
@@ -500,8 +501,8 @@ int drm_legacy_rmctx(struct drm_device *dev, void *data,
 
 	DRM_DEBUG("%d\n", ctx->handle);
 	if (ctx->handle != DRM_KERNEL_CONTEXT) {
-		if (dev->driver->context_dtor)
-			dev->driver->context_dtor(dev, ctx->handle);
+		if (dev->driver->legacy->context_dtor)
+			dev->driver->legacy->context_dtor(dev, ctx->handle);
 		drm_legacy_ctxbitmap_free(dev, ctx->handle);
 	}
 
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 4ba0df097602..4875b76e7656 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -625,14 +625,14 @@ int drm_dev_init(struct drm_device *dev,
 	if (WARN_ON(!parent))
 		return -EINVAL;
 
-	if (drm_core_check_feature(dev, DRIVER_LEGACY) &&
-	    WARN_ON(!driver->legacy))
-		return -EINVAL;
-
 	kref_init(&dev->ref);
 	dev->dev = get_device(parent);
 	dev->driver = driver;
 
+	if (drm_core_check_feature(dev, DRIVER_LEGACY) &&
+	    WARN_ON(!driver->legacy))
+		return -EINVAL;
+
 	/* no per-device feature limits by default */
 	dev->driver_features = ~0u;
 
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index c4c704e01961..e9cb7cf2eb48 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -254,8 +254,8 @@ void drm_file_free(struct drm_file *file)
 		  atomic_read(&dev->open_count));
 
 	if (drm_core_check_feature(dev, DRIVER_LEGACY) &&
-	    dev->driver->preclose)
-		dev->driver->preclose(dev, file);
+	    dev->driver->legacy->preclose)
+		dev->driver->legacy->preclose(dev, file);
 
 	if (drm_core_check_feature(dev, DRIVER_LEGACY))
 		drm_legacy_lock_release(dev, file->filp);
diff --git a/drivers/gpu/drm/drm_legacy_misc.c b/drivers/gpu/drm/drm_legacy_misc.c
index 8f54e6a78b6f..07172d0a4f6f 100644
--- a/drivers/gpu/drm/drm_legacy_misc.c
+++ b/drivers/gpu/drm/drm_legacy_misc.c
@@ -60,9 +60,9 @@ int drm_legacy_setup(struct drm_device * dev)
 {
 	int ret;
 
-	if (dev->driver->firstopen &&
-	    drm_core_check_feature(dev, DRIVER_LEGACY)) {
-		ret = dev->driver->firstopen(dev);
+	if (drm_core_check_feature(dev, DRIVER_LEGACY) &&
+	    dev->driver->legacy->firstopen) {
+		ret = dev->driver->legacy->firstopen(dev);
 		if (ret != 0)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/drm_lock.c b/drivers/gpu/drm/drm_lock.c
index 2c79e8199e3c..f07bf74065ec 100644
--- a/drivers/gpu/drm/drm_lock.c
+++ b/drivers/gpu/drm/drm_lock.c
@@ -223,7 +223,7 @@ int drm_legacy_lock(struct drm_device *dev, void *data,
 		  ret ? "interrupted" : "has lock");
 	if (ret) return ret;
 
-	/* don't set the block all signals on the master process for now 
+	/* don't set the block all signals on the master process for now
 	 * really probably not the correct answer but lets us debug xkb
  	 * xserver for now */
 	if (!drm_is_current_master(file_priv)) {
@@ -231,9 +231,10 @@ int drm_legacy_lock(struct drm_device *dev, void *data,
 		dev->sigdata.lock = master->lock.hw_lock;
 	}
 
-	if (dev->driver->dma_quiescent && (lock->flags & _DRM_LOCK_QUIESCENT))
+	if (dev->driver->legacy->dma_quiescent &&
+	    (lock->flags & _DRM_LOCK_QUIESCENT))
 	{
-		if (dev->driver->dma_quiescent(dev)) {
+		if (dev->driver->legacy->dma_quiescent(dev)) {
 			DRM_DEBUG("%d waiting for DMA quiescent\n",
 				  lock->context);
 			return -EBUSY;
diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index c6bb98729a26..24ed0e92fd66 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -239,7 +239,8 @@ int drm_get_pci_dev(struct pci_dev *pdev, const struct pci_device_id *ent,
 	/* No locking needed since shadow-attach is single-threaded since it may
 	 * only be called from the per-driver module init hook. */
 	if (drm_core_check_feature(dev, DRIVER_LEGACY))
-		list_add_tail(&dev->legacy_dev_list, &driver->legacy_dev_list);
+		list_add_tail(&dev->legacy_dev_list,
+			      &driver->legacy->legacy_dev_list);
 
 	return 0;
 
@@ -275,7 +276,7 @@ int drm_legacy_pci_init(struct drm_driver *driver, struct pci_driver *pdriver)
 		return -EINVAL;
 
 	/* If not using KMS, fall back to stealth mode manual scanning. */
-	INIT_LIST_HEAD(&driver->legacy_dev_list);
+	INIT_LIST_HEAD(&driver->legacy->legacy_dev_list);
 	for (i = 0; pdriver->id_table[i].vendor != 0; i++) {
 		pid = &pdriver->id_table[i];
 
@@ -317,7 +318,8 @@ void drm_legacy_pci_exit(struct drm_driver *driver, struct pci_driver *pdriver)
 	if (!(driver->driver_features & DRIVER_LEGACY)) {
 		WARN_ON(1);
 	} else {
-		list_for_each_entry_safe(dev, tmp, &driver->legacy_dev_list,
+		list_for_each_entry_safe(dev, tmp,
+					 &driver->legacy->legacy_dev_list,
 					 legacy_dev_list) {
 			list_del(&dev->legacy_dev_list);
 			drm_put_dev(dev);
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 47fc4339ec7f..8655cf04712b 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -30,6 +30,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_legacy.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
@@ -144,8 +145,8 @@ static u32 __get_vblank_counter(struct drm_device *dev, unsigned int pipe)
 
 		if (crtc->funcs->get_vblank_counter)
 			return crtc->funcs->get_vblank_counter(crtc);
-	} else if (dev->driver->get_vblank_counter) {
-		return dev->driver->get_vblank_counter(dev, pipe);
+	} else if (dev->driver->legacy->get_vblank_counter) {
+		return dev->driver->legacy->get_vblank_counter(dev, pipe);
 	}
 
 	return drm_vblank_no_hw_counter(dev, pipe);
@@ -364,7 +365,7 @@ static void __disable_vblank(struct drm_device *dev, unsigned int pipe)
 		if (crtc->funcs->disable_vblank)
 			crtc->funcs->disable_vblank(crtc);
 	} else {
-		dev->driver->disable_vblank(dev, pipe);
+		dev->driver->legacy->disable_vblank(dev, pipe);
 	}
 }
 
@@ -1033,8 +1034,8 @@ static int __enable_vblank(struct drm_device *dev, unsigned int pipe)
 
 		if (crtc->funcs->enable_vblank)
 			return crtc->funcs->enable_vblank(crtc);
-	} else if (dev->driver->enable_vblank) {
-		return dev->driver->enable_vblank(dev, pipe);
+	} else if (dev->driver->legacy->enable_vblank) {
+		return dev->driver->legacy->enable_vblank(dev, pipe);
 	}
 
 	return -EINVAL;
diff --git a/drivers/gpu/drm/i810/i810_drv.c b/drivers/gpu/drm/i810/i810_drv.c
index 55f17f00bae9..dd036e3ceb3d 100644
--- a/drivers/gpu/drm/i810/i810_drv.c
+++ b/drivers/gpu/drm/i810/i810_drv.c
@@ -56,16 +56,16 @@ static const struct file_operations i810_driver_fops = {
 	.llseek = noop_llseek,
 };
 
-static struct drm_legacy_state = i810_legacy_state {
+static struct drm_legacy_state i810_legacy_state = {
+	.dev_priv_size = sizeof(drm_i810_buf_priv_t),
+	.preclose = i810_driver_preclose,
+	.dma_quiescent = i810_driver_dma_quiescent,
 };
 
 static struct drm_driver driver = {
 	.driver_features = DRIVER_USE_AGP | DRIVER_HAVE_DMA | DRIVER_LEGACY,
-	.dev_priv_size = sizeof(drm_i810_buf_priv_t),
 	.load = i810_driver_load,
 	.lastclose = i810_driver_lastclose,
-	.preclose = i810_driver_preclose,
-	.dma_quiescent = i810_driver_dma_quiescent,
 	.ioctls = i810_ioctls,
 	.fops = &i810_driver_fops,
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/mga/mga_drv.c b/drivers/gpu/drm/mga/mga_drv.c
index 4865982d949c..2454c57f9370 100644
--- a/drivers/gpu/drm/mga/mga_drv.c
+++ b/drivers/gpu/drm/mga/mga_drv.c
@@ -53,27 +53,27 @@ static const struct file_operations mga_driver_fops = {
 	.llseek = noop_llseek,
 };
 
-static struct drm_legacy_state = mga_legacy_state {
+static struct drm_legacy_state mga_legacy_state = {
+	.dev_priv_size = sizeof(drm_mga_buf_priv_t),
+	.dma_quiescent = mga_driver_dma_quiescent,
+	.get_vblank_counter = mga_get_vblank_counter,
+	.enable_vblank = mga_enable_vblank,
+	.disable_vblank = mga_disable_vblank,
+	.dma_ioctl = mga_dma_buffers,
 };
 
 static struct drm_driver driver = {
 	.driver_features =
 	    DRIVER_USE_AGP | DRIVER_PCI_DMA | DRIVER_LEGACY |
 	    DRIVER_HAVE_DMA | DRIVER_HAVE_IRQ,
-	.dev_priv_size = sizeof(drm_mga_buf_priv_t),
 	.load = mga_driver_load,
 	.unload = mga_driver_unload,
 	.lastclose = mga_driver_lastclose,
-	.dma_quiescent = mga_driver_dma_quiescent,
-	.get_vblank_counter = mga_get_vblank_counter,
-	.enable_vblank = mga_enable_vblank,
-	.disable_vblank = mga_disable_vblank,
 	.irq_preinstall = mga_driver_irq_preinstall,
 	.irq_postinstall = mga_driver_irq_postinstall,
 	.irq_uninstall = mga_driver_irq_uninstall,
 	.irq_handler = mga_driver_irq_handler,
 	.ioctls = mga_ioctls,
-	.dma_ioctl = mga_dma_buffers,
 	.fops = &mga_driver_fops,
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
diff --git a/drivers/gpu/drm/r128/r128_drv.c b/drivers/gpu/drm/r128/r128_drv.c
index ecece3a48d93..9cfd86117e80 100644
--- a/drivers/gpu/drm/r128/r128_drv.c
+++ b/drivers/gpu/drm/r128/r128_drv.c
@@ -57,26 +57,26 @@ static const struct file_operations r128_driver_fops = {
 	.llseek = noop_llseek,
 };
 
-static struct drm_legacy_state = r128_legacy_state {
+static struct drm_legacy_state r128_legacy_state = {
+	.dev_priv_size = sizeof(drm_r128_buf_priv_t),
+	.preclose = r128_driver_preclose,
+	.get_vblank_counter = r128_get_vblank_counter,
+	.enable_vblank = r128_enable_vblank,
+	.disable_vblank = r128_disable_vblank,
+	.dma_ioctl = r128_cce_buffers,
 };
 
 static struct drm_driver driver = {
 	.driver_features =
 	    DRIVER_USE_AGP | DRIVER_PCI_DMA | DRIVER_SG | DRIVER_LEGACY |
 	    DRIVER_HAVE_DMA | DRIVER_HAVE_IRQ,
-	.dev_priv_size = sizeof(drm_r128_buf_priv_t),
 	.load = r128_driver_load,
-	.preclose = r128_driver_preclose,
 	.lastclose = r128_driver_lastclose,
-	.get_vblank_counter = r128_get_vblank_counter,
-	.enable_vblank = r128_enable_vblank,
-	.disable_vblank = r128_disable_vblank,
 	.irq_preinstall = r128_driver_irq_preinstall,
 	.irq_postinstall = r128_driver_irq_postinstall,
 	.irq_uninstall = r128_driver_irq_uninstall,
 	.irq_handler = r128_driver_irq_handler,
 	.ioctls = r128_ioctls,
-	.dma_ioctl = r128_cce_buffers,
 	.fops = &r128_driver_fops,
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
diff --git a/drivers/gpu/drm/savage/savage_drv.c b/drivers/gpu/drm/savage/savage_drv.c
index c0a7146fbde1..2d2680b47eff 100644
--- a/drivers/gpu/drm/savage/savage_drv.c
+++ b/drivers/gpu/drm/savage/savage_drv.c
@@ -47,20 +47,20 @@ static const struct file_operations savage_driver_fops = {
 	.llseek = noop_llseek,
 };
 
-static struct drm_legacy_state = savage_legacy_state {
+static struct drm_legacy_state savage_legacy_state = {
+	.dev_priv_size = sizeof(drm_savage_buf_priv_t),
+	.firstopen = savage_driver_firstopen,
+	.preclose = savage_reclaim_buffers,
+	.dma_ioctl = savage_bci_buffers,
 };
 
 static struct drm_driver driver = {
 	.driver_features =
 	    DRIVER_USE_AGP | DRIVER_HAVE_DMA | DRIVER_PCI_DMA | DRIVER_LEGACY,
-	.dev_priv_size = sizeof(drm_savage_buf_priv_t),
 	.load = savage_driver_load,
-	.firstopen = savage_driver_firstopen,
-	.preclose = savage_reclaim_buffers,
 	.lastclose = savage_driver_lastclose,
 	.unload = savage_driver_unload,
 	.ioctls = savage_ioctls,
-	.dma_ioctl = savage_bci_buffers,
 	.fops = &savage_driver_fops,
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
diff --git a/drivers/gpu/drm/sis/sis_drv.c b/drivers/gpu/drm/sis/sis_drv.c
index 1c794a82c8e6..c465776e3180 100644
--- a/drivers/gpu/drm/sis/sis_drv.c
+++ b/drivers/gpu/drm/sis/sis_drv.c
@@ -99,7 +99,9 @@ static void sis_driver_postclose(struct drm_device *dev, struct drm_file *file)
 	kfree(file_priv);
 }
 
-static struct drm_legacy_state = sis_legacy_state {
+static struct drm_legacy_state sis_legacy_state = {
+	.preclose = sis_reclaim_buffers_locked,
+	.dma_quiescent = sis_idle,
 };
 
 static struct drm_driver driver = {
@@ -107,9 +109,7 @@ static struct drm_driver driver = {
 	.load = sis_driver_load,
 	.unload = sis_driver_unload,
 	.open = sis_driver_open,
-	.preclose = sis_reclaim_buffers_locked,
 	.postclose = sis_driver_postclose,
-	.dma_quiescent = sis_idle,
 	.lastclose = sis_lastclose,
 	.ioctls = sis_ioctls,
 	.fops = &sis_driver_fops,
diff --git a/drivers/gpu/drm/tdfx/tdfx_drv.c b/drivers/gpu/drm/tdfx/tdfx_drv.c
index 17aa93d82d6b..a8a6bce6afbe 100644
--- a/drivers/gpu/drm/tdfx/tdfx_drv.c
+++ b/drivers/gpu/drm/tdfx/tdfx_drv.c
@@ -56,7 +56,7 @@ static const struct file_operations tdfx_driver_fops = {
 	.llseek = noop_llseek,
 };
 
-static struct drm_legacy_state = tdfx_legacy_state {
+static struct drm_legacy_state tdfx_legacy_state = {
 };
 
 static struct drm_driver driver = {
diff --git a/drivers/gpu/drm/via/via_drv.c b/drivers/gpu/drm/via/via_drv.c
index 22113d93ecdd..62f026da5958 100644
--- a/drivers/gpu/drm/via/via_drv.c
+++ b/drivers/gpu/drm/via/via_drv.c
@@ -71,7 +71,13 @@ static const struct file_operations via_driver_fops = {
 	.llseek = noop_llseek,
 };
 
-static struct drm_legacy_state = via_legacy_state {
+static struct drm_legacy_state via_legacy_state = {
+	.preclose = via_reclaim_buffers_locked,
+	.context_dtor = via_final_context,
+	.get_vblank_counter = via_get_vblank_counter,
+	.enable_vblank = via_enable_vblank,
+	.disable_vblank = via_disable_vblank,
+	.dma_quiescent = via_driver_dma_quiescent,
 };
 
 static struct drm_driver driver = {
@@ -80,17 +86,11 @@ static struct drm_driver driver = {
 	.load = via_driver_load,
 	.unload = via_driver_unload,
 	.open = via_driver_open,
-	.preclose = via_reclaim_buffers_locked,
 	.postclose = via_driver_postclose,
-	.context_dtor = via_final_context,
-	.get_vblank_counter = via_get_vblank_counter,
-	.enable_vblank = via_enable_vblank,
-	.disable_vblank = via_disable_vblank,
 	.irq_preinstall = via_driver_irq_preinstall,
 	.irq_postinstall = via_driver_irq_postinstall,
 	.irq_uninstall = via_driver_irq_uninstall,
 	.irq_handler = via_driver_irq_handler,
-	.dma_quiescent = via_driver_dma_quiescent,
 	.lastclose = via_lastclose,
 	.ioctls = via_ioctls,
 	.fops = &via_driver_fops,
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 94078af0cc28..15dd9a179216 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -601,20 +601,6 @@ struct drm_driver {
 
 	/* Everything below here is for legacy driver, never use! */
 	struct drm_legacy_state *legacy;
-
-	/* private: */
-
-	/* List of devices hanging off this driver with stealth attach. */
-	struct list_head legacy_dev_list;
-	int (*firstopen) (struct drm_device *);
-	void (*preclose) (struct drm_device *, struct drm_file *file_priv);
-	int (*dma_ioctl) (struct drm_device *dev, void *data, struct drm_file *file_priv);
-	int (*dma_quiescent) (struct drm_device *);
-	int (*context_dtor) (struct drm_device *dev, int context);
-	u32 (*get_vblank_counter)(struct drm_device *dev, unsigned int pipe);
-	int (*enable_vblank)(struct drm_device *dev, unsigned int pipe);
-	void (*disable_vblank)(struct drm_device *dev, unsigned int pipe);
-	int dev_priv_size;
 };
 
 int drm_dev_init(struct drm_device *dev,
diff --git a/include/drm/drm_legacy.h b/include/drm/drm_legacy.h
index c98a29e1c2b3..7b5ee6a94a8c 100644
--- a/include/drm/drm_legacy.h
+++ b/include/drm/drm_legacy.h
@@ -53,6 +53,17 @@ struct pci_driver;
  * State for non-KMS drivers.
  */
 struct drm_legacy_state {
+	/* List of devices hanging off this driver with stealth attach. */
+	struct list_head legacy_dev_list;
+	int (*firstopen)(struct drm_device *dev);
+	void (*preclose)(struct drm_device *dev, struct drm_file *file_priv);
+	int (*dma_ioctl)(struct drm_device *dev, void *data, struct drm_file *file_priv);
+	int (*dma_quiescent)(struct drm_device *dev);
+	int (*context_dtor)(struct drm_device *dev, int context);
+	u32 (*get_vblank_counter)(struct drm_device *dev, unsigned int pipe);
+	int (*enable_vblank)(struct drm_device *dev, unsigned int pipe);
+	void (*disable_vblank)(struct drm_device *dev, unsigned int pipe);
+	int dev_priv_size;
 };
 
 /**
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
