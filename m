Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FEB2C0504
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A8F89216;
	Mon, 23 Nov 2020 11:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F13889AAD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:56:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DA179AC91;
 Mon, 23 Nov 2020 11:56:51 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, eric@anholt.net
Subject: [PATCH 1/2] drm/cma-helper: Remove prime infix from GEM object
 functions
Date: Mon, 23 Nov 2020 12:56:45 +0100
Message-Id: <20201123115646.11004-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123115646.11004-1-tzimmermann@suse.de>
References: <20201123115646.11004-1-tzimmermann@suse.de>
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

These functions are not directly related to PRIME interfaces any
longer, but are now GEM object functions. Rename them accordingly
and fix the docs.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 20 ++++++++++----------
 drivers/gpu/drm/vc4/vc4_bo.c         |  4 ++--
 include/drm/drm_gem_cma_helper.h     |  4 ++--
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 4d5c1d86b022..6a4ef335ebc9 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -36,8 +36,8 @@
 static const struct drm_gem_object_funcs drm_gem_cma_default_funcs = {
 	.free = drm_gem_cma_free_object,
 	.print_info = drm_gem_cma_print_info,
-	.get_sg_table = drm_gem_cma_prime_get_sg_table,
-	.vmap = drm_gem_cma_prime_vmap,
+	.get_sg_table = drm_gem_cma_get_sg_table,
+	.vmap = drm_gem_cma_vmap,
 	.vm_ops = &drm_gem_cma_vm_ops,
 };
 
@@ -424,18 +424,18 @@ void drm_gem_cma_print_info(struct drm_printer *p, unsigned int indent,
 EXPORT_SYMBOL(drm_gem_cma_print_info);
 
 /**
- * drm_gem_cma_prime_get_sg_table - provide a scatter/gather table of pinned
+ * drm_gem_cma_get_sg_table - provide a scatter/gather table of pinned
  *     pages for a CMA GEM object
  * @obj: GEM object
  *
- * This function exports a scatter/gather table suitable for PRIME usage by
+ * This function exports a scatter/gather table by
  * calling the standard DMA mapping API. Drivers using the CMA helpers should
  * set this as their &drm_gem_object_funcs.get_sg_table callback.
  *
  * Returns:
  * A pointer to the scatter/gather table of pinned pages or NULL on failure.
  */
-struct sg_table *drm_gem_cma_prime_get_sg_table(struct drm_gem_object *obj)
+struct sg_table *drm_gem_cma_get_sg_table(struct drm_gem_object *obj)
 {
 	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
 	struct sg_table *sgt;
@@ -456,7 +456,7 @@ struct sg_table *drm_gem_cma_prime_get_sg_table(struct drm_gem_object *obj)
 	kfree(sgt);
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_GPL(drm_gem_cma_prime_get_sg_table);
+EXPORT_SYMBOL_GPL(drm_gem_cma_get_sg_table);
 
 /**
  * drm_gem_cma_prime_import_sg_table - produce a CMA GEM object from another
@@ -528,13 +528,13 @@ int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
 EXPORT_SYMBOL_GPL(drm_gem_cma_prime_mmap);
 
 /**
- * drm_gem_cma_prime_vmap - map a CMA GEM object into the kernel's virtual
+ * drm_gem_cma_vmap - map a CMA GEM object into the kernel's virtual
  *     address space
  * @obj: GEM object
  * @map: Returns the kernel virtual address of the CMA GEM object's backing
  *       store.
  *
- * This function maps a buffer exported via DRM PRIME into the kernel's
+ * This function maps a buffer into the kernel's
  * virtual address space. Since the CMA buffers are already mapped into the
  * kernel virtual address space this simply returns the cached virtual
  * address. Drivers using the CMA helpers should set this as their DRM
@@ -543,7 +543,7 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_prime_mmap);
  * Returns:
  * 0 on success, or a negative error code otherwise.
  */
-int drm_gem_cma_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+int drm_gem_cma_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
 	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
 
@@ -551,7 +551,7 @@ int drm_gem_cma_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(drm_gem_cma_prime_vmap);
+EXPORT_SYMBOL_GPL(drm_gem_cma_vmap);
 
 /**
  * drm_gem_cma_prime_import_sg_table_vmap - PRIME import another driver's
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 469d1b4f2643..813e6cb3f9af 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -385,7 +385,7 @@ static const struct vm_operations_struct vc4_vm_ops = {
 static const struct drm_gem_object_funcs vc4_gem_object_funcs = {
 	.free = vc4_free_object,
 	.export = vc4_prime_export,
-	.get_sg_table = drm_gem_cma_prime_get_sg_table,
+	.get_sg_table = drm_gem_cma_get_sg_table,
 	.vmap = vc4_prime_vmap,
 	.vm_ops = &vc4_vm_ops,
 };
@@ -794,7 +794,7 @@ int vc4_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 		return -EINVAL;
 	}
 
-	return drm_gem_cma_prime_vmap(obj, map);
+	return drm_gem_cma_vmap(obj, map);
 }
 
 struct drm_gem_object *
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index 5605c1b8f779..4680275ab339 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -96,14 +96,14 @@ unsigned long drm_gem_cma_get_unmapped_area(struct file *filp,
 void drm_gem_cma_print_info(struct drm_printer *p, unsigned int indent,
 			    const struct drm_gem_object *obj);
 
-struct sg_table *drm_gem_cma_prime_get_sg_table(struct drm_gem_object *obj);
+struct sg_table *drm_gem_cma_get_sg_table(struct drm_gem_object *obj);
 struct drm_gem_object *
 drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
 				  struct dma_buf_attachment *attach,
 				  struct sg_table *sgt);
 int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
 			   struct vm_area_struct *vma);
-int drm_gem_cma_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+int drm_gem_cma_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 
 /**
  * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE - CMA GEM driver operations
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
