Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2202505E89
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 21:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8685D10E170;
	Mon, 18 Apr 2022 19:29:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F014310E170
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 19:29:52 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 741962872CB;
 Mon, 18 Apr 2022 20:29:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1650310190; bh=f+jIjeDOGlOlHKF34wefpPR8EV9tbjibhPaLeL4+IhM=;
 h=From:To:Cc:Subject:Date:From;
 b=F0DBZeuNv81Fe5o8cwi6RcVJ2fjutj8VxBsu+L82CZGE53XikWDmCNwAzfobctaJE
 sTjwNS6TnmqJg4E5lrbAsRy/7rhFFkGFGIsOOklY32qZyjQnhpynhVPJ4jCdpEn2OT
 /us2Ltsu99We4v5gtmSo4LNod3hoPP6Jm7IMzU7SQfKDVICzt4fNzKH77JrwVwM+Og
 Ew+Shcu0g2A/pVrSj2Sk8nt9M/4pGLZRbomLvAdwDJJGJ1CzxZYVQTRg0QwDAgasrE
 EXVvXD8Vph2hZtLQoAs7pIbb+FNTAs1hYE82eEZFd5AjATlHxtG3m/nYW0qf9ezB5Y
 wqoihBjf1p5Yg==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: Fix gem refcounting and memory evictions
Date: Mon, 18 Apr 2022 15:29:48 -0400
Message-Id: <20220418192948.910141-1-zack@kde.org>
X-Mailer: git-send-email 2.32.0
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

The initial GEM port broke refcounting on shareable (prime) surfaces and
memory evictions. The prime surfaces broke because the parent surfaces
weren't increasing the ref count on GEM surfaces, which meant that
the memory backing textures could have been deleted while the texture
was still accessible. The evictions broke due to a typo, the code was
supposed to exit if the passed buffers were not vmw_buffer_object
not if they were. They're tied because the evictions depend on having
memory to actually evict.

This fixes crashes with XA state tracker which is used for xrender
acceleration on xf86-video-vmware and apps/tests which use a lot of
memory (a good test being the piglit's streaming-texture-leak)

Signed-off-by: Zack Rusin <zackr@vmware.com>
Fixes: 8afa13a0583f ("drm/vmwgfx: Implement DRIVER_GEM")
Cc: <stable@vger.kernel.org> # v5.17+
Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      | 38 +++++++++++--------------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |  8 ++----
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |  7 ++++-
 3 files changed, 25 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 31aecc46624b..32326168b258 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -46,6 +46,21 @@ vmw_buffer_object(struct ttm_buffer_object *bo)
 	return container_of(bo, struct vmw_buffer_object, base);
 }
 
+/**
+ * bo_is_vmw - check if the buffer object is a &vmw_buffer_object
+ * @bo: ttm buffer object to be checked
+ *
+ * Uses destroy function associated with the object to determine if this is
+ * a &vmw_buffer_object.
+ *
+ * Returns:
+ * true if the object is of &vmw_buffer_object type, false if not.
+ */
+static bool bo_is_vmw(struct ttm_buffer_object *bo)
+{
+	return bo->destroy == &vmw_bo_bo_free ||
+	       bo->destroy == &vmw_gem_destroy;
+}
 
 /**
  * vmw_bo_pin_in_placement - Validate a buffer to placement.
@@ -798,7 +813,7 @@ int vmw_dumb_create(struct drm_file *file_priv,
 void vmw_bo_swap_notify(struct ttm_buffer_object *bo)
 {
 	/* Is @bo embedded in a struct vmw_buffer_object? */
-	if (vmw_bo_is_vmw_bo(bo))
+	if (!bo_is_vmw(bo))
 		return;
 
 	/* Kill any cached kernel maps before swapout */
@@ -822,7 +837,7 @@ void vmw_bo_move_notify(struct ttm_buffer_object *bo,
 	struct vmw_buffer_object *vbo;
 
 	/* Make sure @bo is embedded in a struct vmw_buffer_object? */
-	if (vmw_bo_is_vmw_bo(bo))
+	if (!bo_is_vmw(bo))
 		return;
 
 	vbo = container_of(bo, struct vmw_buffer_object, base);
@@ -843,22 +858,3 @@ void vmw_bo_move_notify(struct ttm_buffer_object *bo,
 	if (mem->mem_type != VMW_PL_MOB && bo->resource->mem_type == VMW_PL_MOB)
 		vmw_resource_unbind_list(vbo);
 }
-
-/**
- * vmw_bo_is_vmw_bo - check if the buffer object is a &vmw_buffer_object
- * @bo: buffer object to be checked
- *
- * Uses destroy function associated with the object to determine if this is
- * a &vmw_buffer_object.
- *
- * Returns:
- * true if the object is of &vmw_buffer_object type, false if not.
- */
-bool vmw_bo_is_vmw_bo(struct ttm_buffer_object *bo)
-{
-	if (bo->destroy == &vmw_bo_bo_free ||
-	    bo->destroy == &vmw_gem_destroy)
-		return true;
-
-	return false;
-}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 72a17618ba0a..0c12faa4e533 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1018,13 +1018,10 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 		goto out_no_fman;
 	}
 
-	drm_vma_offset_manager_init(&dev_priv->vma_manager,
-				    DRM_FILE_PAGE_OFFSET_START,
-				    DRM_FILE_PAGE_OFFSET_SIZE);
 	ret = ttm_device_init(&dev_priv->bdev, &vmw_bo_driver,
 			      dev_priv->drm.dev,
 			      dev_priv->drm.anon_inode->i_mapping,
-			      &dev_priv->vma_manager,
+			      dev_priv->drm.vma_offset_manager,
 			      dev_priv->map_mode == vmw_dma_alloc_coherent,
 			      false);
 	if (unlikely(ret != 0)) {
@@ -1195,7 +1192,6 @@ static void vmw_driver_unload(struct drm_device *dev)
 	vmw_devcaps_destroy(dev_priv);
 	vmw_vram_manager_fini(dev_priv);
 	ttm_device_fini(&dev_priv->bdev);
-	drm_vma_offset_manager_destroy(&dev_priv->vma_manager);
 	vmw_release_device_late(dev_priv);
 	vmw_fence_manager_takedown(dev_priv->fman);
 	if (dev_priv->capabilities & SVGA_CAP_IRQMASK)
@@ -1419,7 +1415,7 @@ vmw_get_unmapped_area(struct file *file, unsigned long uaddr,
 	struct vmw_private *dev_priv = vmw_priv(file_priv->minor->dev);
 
 	return drm_get_unmapped_area(file, uaddr, len, pgoff, flags,
-				     &dev_priv->vma_manager);
+				     dev_priv->drm.vma_offset_manager);
 }
 
 static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 00e8e27e4884..ace7ca150b03 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -683,6 +683,9 @@ static void vmw_user_surface_base_release(struct ttm_base_object **p_base)
 	    container_of(base, struct vmw_user_surface, prime.base);
 	struct vmw_resource *res = &user_srf->srf.res;
 
+	if (base->shareable && res && res->backup)
+		drm_gem_object_put(&res->backup->base.base);
+
 	*p_base = NULL;
 	vmw_resource_unreference(&res);
 }
@@ -857,6 +860,7 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 			goto out_unlock;
 		}
 		vmw_bo_reference(res->backup);
+		drm_gem_object_get(&res->backup->base.base);
 	}
 
 	tmp = vmw_resource_reference(&srf->res);
@@ -1513,7 +1517,6 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
 							&res->backup);
 		if (ret == 0)
 			vmw_bo_reference(res->backup);
-
 	}
 
 	if (unlikely(ret != 0)) {
@@ -1561,6 +1564,8 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
 			drm_vma_node_offset_addr(&res->backup->base.base.vma_node);
 		rep->buffer_size = res->backup->base.base.size;
 		rep->buffer_handle = backup_handle;
+		if (user_srf->prime.base.shareable)
+			drm_gem_object_get(&res->backup->base.base);
 	} else {
 		rep->buffer_map_handle = 0;
 		rep->buffer_size = 0;
-- 
2.32.0

