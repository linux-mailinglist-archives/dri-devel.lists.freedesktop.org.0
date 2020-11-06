Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E1F2A96D0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 14:16:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E196E03C;
	Fri,  6 Nov 2020 13:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A396E03C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 13:16:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4D920AB8F;
 Fri,  6 Nov 2020 13:16:35 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, eric@anholt.net
Subject: [PATCH] drm/cma-helper: Make default object functions the default
Date: Fri,  6 Nov 2020 14:16:32 +0100
Message-Id: <20201106131632.6796-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.0
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

As GEM object functions are now mandatory, DRM drivers based on CMA
helpers either set them in their implementation of gem_create_object,
or use the default via drm_gem_cma_create_object_default_funcs().

Simplify this by setting the default CMA object functions for all
objects that don't have any functions of their own. Follows the pattern
of similar code in SHMEM and VRAM helpers. The function
drm_gem_cma_create_object_default_funcs() is redundant and therefore
being removed.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 47 +++++++---------------------
 drivers/gpu/drm/pl111/pl111_drv.c    |  1 -
 include/drm/drm_gem_cma_helper.h     |  5 ---
 3 files changed, 12 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 2165633c9b9e..c3b31b3369c3 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -33,6 +33,14 @@
  * display drivers that are unable to map scattered buffers via an IOMMU.
  */
 
+static const struct drm_gem_object_funcs drm_gem_cma_default_funcs = {
+	.free = drm_gem_cma_free_object,
+	.print_info = drm_gem_cma_print_info,
+	.get_sg_table = drm_gem_cma_prime_get_sg_table,
+	.vmap = drm_gem_cma_prime_vmap,
+	.vm_ops = &drm_gem_cma_vm_ops,
+};
+
 /**
  * __drm_gem_cma_create - Create a GEM CMA object without allocating memory
  * @drm: DRM device
@@ -58,6 +66,10 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size)
 		gem_obj = kzalloc(sizeof(*cma_obj), GFP_KERNEL);
 	if (!gem_obj)
 		return ERR_PTR(-ENOMEM);
+
+	if (!gem_obj->funcs)
+		gem_obj->funcs = &drm_gem_cma_default_funcs;
+
 	cma_obj = container_of(gem_obj, struct drm_gem_cma_object, base);
 
 	ret = drm_gem_object_init(drm, gem_obj, size);
@@ -554,41 +566,6 @@ void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
 }
 EXPORT_SYMBOL_GPL(drm_gem_cma_prime_vunmap);
 
-static const struct drm_gem_object_funcs drm_gem_cma_default_funcs = {
-	.free = drm_gem_cma_free_object,
-	.print_info = drm_gem_cma_print_info,
-	.get_sg_table = drm_gem_cma_prime_get_sg_table,
-	.vmap = drm_gem_cma_prime_vmap,
-	.vm_ops = &drm_gem_cma_vm_ops,
-};
-
-/**
- * drm_gem_cma_create_object_default_funcs - Create a CMA GEM object with a
- *                                           default function table
- * @dev: DRM device
- * @size: Size of the object to allocate
- *
- * This sets the GEM object functions to the default CMA helper functions.
- * This function can be used as the &drm_driver.gem_create_object callback.
- *
- * Returns:
- * A pointer to a allocated GEM object or an error pointer on failure.
- */
-struct drm_gem_object *
-drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_t size)
-{
-	struct drm_gem_cma_object *cma_obj;
-
-	cma_obj = kzalloc(sizeof(*cma_obj), GFP_KERNEL);
-	if (!cma_obj)
-		return NULL;
-
-	cma_obj->base.funcs = &drm_gem_cma_default_funcs;
-
-	return &cma_obj->base;
-}
-EXPORT_SYMBOL(drm_gem_cma_create_object_default_funcs);
-
 /**
  * drm_gem_cma_prime_import_sg_table_vmap - PRIME import another driver's
  *	scatter/gather table and get the virtual address of the buffer
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index ecef8a2383d2..fcb5caea7b47 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -224,7 +224,6 @@ static struct drm_driver pl111_drm_driver = {
 	.major = 1,
 	.minor = 0,
 	.patchlevel = 0,
-	.gem_create_object = drm_gem_cma_create_object_default_funcs,
 	.dumb_create = drm_gem_cma_dumb_create,
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index 2bfa2502607a..60aba1e734c0 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -106,9 +106,6 @@ int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
 void *drm_gem_cma_prime_vmap(struct drm_gem_object *obj);
 void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
 
-struct drm_gem_object *
-drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_t size);
-
 /**
  * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE - CMA GEM driver operations
  * @dumb_create_func: callback function for .dumb_create
@@ -123,7 +120,6 @@ drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_t size);
  * DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE() instead.
  */
 #define DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(dumb_create_func) \
-	.gem_create_object	= drm_gem_cma_create_object_default_funcs, \
 	.dumb_create		= (dumb_create_func), \
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
@@ -162,7 +158,6 @@ drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_t size);
  * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE() instead.
  */
 #define DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(dumb_create_func) \
-	.gem_create_object	= drm_gem_cma_create_object_default_funcs, \
 	.dumb_create		= dumb_create_func, \
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
-- 
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
