Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 608BC1D919C
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 10:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4484189F24;
	Tue, 19 May 2020 08:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE30389F24
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 08:04:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0D198AD73;
 Tue, 19 May 2020 08:04:30 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sean@poorly.run, kraxel@redhat.com,
 emil.l.velikov@gmail.com, sam@ravnborg.org
Subject: [PATCH v2 2/2] drm/udl: Use GEM vmap/mmap function from SHMEM helpers
Date: Tue, 19 May 2020 10:04:23 +0200
Message-Id: <20200519080423.21695-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519080423.21695-1-tzimmermann@suse.de>
References: <20200519080423.21695-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The udl driver contains an implementation of GEM vmap and mmap
operations that is identical to the common SHMEM helper; except
that udl's code uses cached pages by default.

Convert udl to regular SHMEM helper functions. There's no reason
to have udl behave differently from all other SHMEM drivers. The
udl driver uses the SHMEM helper to enable caching.

v2:
	* implement .gem_create_object with SHMEM helper

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/Makefile  |   2 +-
 drivers/gpu/drm/udl/udl_drv.c |   4 +-
 drivers/gpu/drm/udl/udl_drv.h |   3 -
 drivers/gpu/drm/udl/udl_gem.c | 106 ----------------------------------
 4 files changed, 3 insertions(+), 112 deletions(-)
 delete mode 100644 drivers/gpu/drm/udl/udl_gem.c

diff --git a/drivers/gpu/drm/udl/Makefile b/drivers/gpu/drm/udl/Makefile
index b50179bb4de06..24d61f61d7db2 100644
--- a/drivers/gpu/drm/udl/Makefile
+++ b/drivers/gpu/drm/udl/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-udl-y := udl_drv.o udl_modeset.o udl_connector.o udl_main.o udl_transfer.o udl_gem.o
+udl-y := udl_drv.o udl_modeset.o udl_connector.o udl_main.o udl_transfer.o
 
 obj-$(CONFIG_DRM_UDL) := udl.o
diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index d1aa50fd6d65a..96d4317a2c1bd 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -37,8 +37,8 @@ DEFINE_DRM_GEM_FOPS(udl_driver_fops);
 static struct drm_driver driver = {
 	.driver_features = DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
 
-	/* gem hooks */
-	.gem_create_object = udl_driver_gem_create_object,
+	/* GEM hooks */
+	.gem_create_object = drm_gem_shmem_create_object_cached,
 
 	.fops = &udl_driver_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index 2642f94a63fc8..b1461f30780bc 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -81,9 +81,6 @@ int udl_render_hline(struct drm_device *dev, int log_bpp, struct urb **urb_ptr,
 		     const char *front, char **urb_buf_ptr,
 		     u32 byte_offset, u32 device_byte_offset, u32 byte_width);
 
-struct drm_gem_object *udl_driver_gem_create_object(struct drm_device *dev,
-						    size_t size);
-
 int udl_drop_usb(struct drm_device *dev);
 
 #define CMD_WRITE_RAW8   "\xAF\x60" /**< 8 bit raw write command. */
diff --git a/drivers/gpu/drm/udl/udl_gem.c b/drivers/gpu/drm/udl/udl_gem.c
deleted file mode 100644
index b6e26f98aa0af..0000000000000
--- a/drivers/gpu/drm/udl/udl_gem.c
+++ /dev/null
@@ -1,106 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2012 Red Hat
- */
-
-#include <linux/dma-buf.h>
-#include <linux/vmalloc.h>
-
-#include <drm/drm_drv.h>
-#include <drm/drm_gem_shmem_helper.h>
-#include <drm/drm_mode.h>
-#include <drm/drm_prime.h>
-
-#include "udl_drv.h"
-
-/*
- * GEM object funcs
- */
-
-static int udl_gem_object_mmap(struct drm_gem_object *obj,
-			       struct vm_area_struct *vma)
-{
-	int ret;
-
-	ret = drm_gem_shmem_mmap(obj, vma);
-	if (ret)
-		return ret;
-
-	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
-	if (obj->import_attach)
-		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
-
-	return 0;
-}
-
-static void *udl_gem_object_vmap(struct drm_gem_object *obj)
-{
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-	int ret;
-
-	ret = mutex_lock_interruptible(&shmem->vmap_lock);
-	if (ret)
-		return ERR_PTR(ret);
-
-	if (shmem->vmap_use_count++ > 0)
-		goto out;
-
-	ret = drm_gem_shmem_get_pages(shmem);
-	if (ret)
-		goto err_zero_use;
-
-	if (obj->import_attach)
-		shmem->vaddr = dma_buf_vmap(obj->import_attach->dmabuf);
-	else
-		shmem->vaddr = vmap(shmem->pages, obj->size >> PAGE_SHIFT,
-				    VM_MAP, PAGE_KERNEL);
-
-	if (!shmem->vaddr) {
-		DRM_DEBUG_KMS("Failed to vmap pages\n");
-		ret = -ENOMEM;
-		goto err_put_pages;
-	}
-
-out:
-	mutex_unlock(&shmem->vmap_lock);
-	return shmem->vaddr;
-
-err_put_pages:
-	drm_gem_shmem_put_pages(shmem);
-err_zero_use:
-	shmem->vmap_use_count = 0;
-	mutex_unlock(&shmem->vmap_lock);
-	return ERR_PTR(ret);
-}
-
-static const struct drm_gem_object_funcs udl_gem_object_funcs = {
-	.free = drm_gem_shmem_free_object,
-	.print_info = drm_gem_shmem_print_info,
-	.pin = drm_gem_shmem_pin,
-	.unpin = drm_gem_shmem_unpin,
-	.get_sg_table = drm_gem_shmem_get_sg_table,
-	.vmap = udl_gem_object_vmap,
-	.vunmap = drm_gem_shmem_vunmap,
-	.mmap = udl_gem_object_mmap,
-};
-
-/*
- * Helpers for struct drm_driver
- */
-
-struct drm_gem_object *udl_driver_gem_create_object(struct drm_device *dev,
-						    size_t size)
-{
-	struct drm_gem_shmem_object *shmem;
-	struct drm_gem_object *obj;
-
-	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
-	if (!shmem)
-		return NULL;
-
-	obj = &shmem->base;
-	obj->funcs = &udl_gem_object_funcs;
-
-	return obj;
-}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
