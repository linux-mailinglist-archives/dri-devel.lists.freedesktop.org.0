Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 470767DB010
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 00:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494E410E1D3;
	Sun, 29 Oct 2023 23:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC8D10E1CE
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 23:02:33 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1EBAA6607355;
 Sun, 29 Oct 2023 23:02:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698620552;
 bh=xX+LegATs/dUSVY0ygA2/7wdnKYA+7pFnIoOs65gAY0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W2DbvloITO8VX3OBzPtOElGsVJlsgjiyRGZf3FXpM0wHXuGj3sJ8TUrYipMJF0MLT
 7IKtKqhMwLFfyagIxXMuFqm0ErlIh1Z5RTdSAwHkQPiECzt/u6LCcd0Y2A8TkKD6RM
 uuMtCGqAAb3Z0EqoQk6hUuYK6QFO7BEUqAnoNlUkFphdFyX7s0fKAOgMfyofxqKNnq
 tQRsIT8O4Z2wCxgWqolFbeDnWKgvpUQ7ZA+lUKRfSnAhzu1ruzNQSVw+AQ4uZsdU+Q
 CsCbKXEZbV0KAXA0vpL7QIr1L5bDUVMLAPYkZu+ol6HgG40wPqu9FjGLJfJ4Gm2imn
 6lX8WJej/8uSw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH v18 04/26] drm/shmem-helper: Refactor locked/unlocked functions
Date: Mon, 30 Oct 2023 02:01:43 +0300
Message-ID: <20231029230205.93277-5-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add locked and remove unlocked postfixes from drm-shmem function names,
making names consistent with the drm/gem core code.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c        | 64 +++++++++----------
 drivers/gpu/drm/lima/lima_gem.c               |  8 +--
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c       |  6 +-
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |  2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |  2 +-
 drivers/gpu/drm/v3d/v3d_bo.c                  |  4 +-
 drivers/gpu/drm/virtio/virtgpu_object.c       |  4 +-
 include/drm/drm_gem_shmem_helper.h            | 36 +++++------
 9 files changed, 64 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 0d61f2b3e213..154585ddae08 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -43,8 +43,8 @@ static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
 	.pin = drm_gem_shmem_object_pin,
 	.unpin = drm_gem_shmem_object_unpin,
 	.get_sg_table = drm_gem_shmem_object_get_sg_table,
-	.vmap = drm_gem_shmem_object_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
+	.vmap = drm_gem_shmem_object_vmap_locked,
+	.vunmap = drm_gem_shmem_object_vunmap_locked,
 	.mmap = drm_gem_shmem_object_mmap,
 	.vm_ops = &drm_gem_shmem_vm_ops,
 };
@@ -153,7 +153,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 			kfree(shmem->sgt);
 		}
 		if (shmem->pages)
-			drm_gem_shmem_put_pages(shmem);
+			drm_gem_shmem_put_pages_locked(shmem);
 
 		drm_WARN_ON(obj->dev, shmem->pages_use_count);
 
@@ -165,7 +165,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
 
-static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
+static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	struct page **pages;
@@ -199,12 +199,12 @@ static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 }
 
 /*
- * drm_gem_shmem_put_pages - Decrease use count on the backing pages for a shmem GEM object
+ * drm_gem_shmem_put_pages_locked - Decrease use count on the backing pages for a shmem GEM object
  * @shmem: shmem GEM object
  *
  * This function decreases the use count and puts the backing pages when use drops to zero.
  */
-void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
+void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
@@ -226,7 +226,7 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
 			  shmem->pages_mark_accessed_on_put);
 	shmem->pages = NULL;
 }
-EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
 
 static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
 {
@@ -234,7 +234,7 @@ static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
 
 	dma_resv_assert_held(shmem->base.resv);
 
-	ret = drm_gem_shmem_get_pages(shmem);
+	ret = drm_gem_shmem_get_pages_locked(shmem);
 
 	return ret;
 }
@@ -243,7 +243,7 @@ static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
 {
 	dma_resv_assert_held(shmem->base.resv);
 
-	drm_gem_shmem_put_pages(shmem);
+	drm_gem_shmem_put_pages_locked(shmem);
 }
 
 /**
@@ -293,7 +293,7 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 EXPORT_SYMBOL_GPL(drm_gem_shmem_unpin);
 
 /*
- * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM object
+ * drm_gem_shmem_vmap_locked - Create a virtual mapping for a shmem GEM object
  * @shmem: shmem GEM object
  * @map: Returns the kernel virtual address of the SHMEM GEM object's backing
  *       store.
@@ -302,13 +302,13 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_unpin);
  * exists for the buffer backing the shmem GEM object. It hides the differences
  * between dma-buf imported and natively allocated objects.
  *
- * Acquired mappings should be cleaned up by calling drm_gem_shmem_vunmap().
+ * Acquired mappings should be cleaned up by calling drm_gem_shmem_vunmap_locked().
  *
  * Returns:
  * 0 on success or a negative error code on failure.
  */
-int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
-		       struct iosys_map *map)
+int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
+			      struct iosys_map *map)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	int ret = 0;
@@ -331,7 +331,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 			return 0;
 		}
 
-		ret = drm_gem_shmem_get_pages(shmem);
+		ret = drm_gem_shmem_get_pages_locked(shmem);
 		if (ret)
 			goto err_zero_use;
 
@@ -354,28 +354,28 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 
 err_put_pages:
 	if (!obj->import_attach)
-		drm_gem_shmem_put_pages(shmem);
+		drm_gem_shmem_put_pages_locked(shmem);
 err_zero_use:
 	shmem->vmap_use_count = 0;
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(drm_gem_shmem_vmap);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_vmap_locked);
 
 /*
- * drm_gem_shmem_vunmap - Unmap a virtual mapping for a shmem GEM object
+ * drm_gem_shmem_vunmap_locked - Unmap a virtual mapping for a shmem GEM object
  * @shmem: shmem GEM object
  * @map: Kernel virtual address where the SHMEM GEM object was mapped
  *
  * This function cleans up a kernel virtual address mapping acquired by
- * drm_gem_shmem_vmap(). The mapping is only removed when the use count drops to
- * zero.
+ * drm_gem_shmem_vmap_locked(). The mapping is only removed when the use count
+ * drops to zero.
  *
  * This function hides the differences between dma-buf imported and natively
  * allocated objects.
  */
-void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
-			  struct iosys_map *map)
+void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
+				 struct iosys_map *map)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
@@ -391,12 +391,12 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
 			return;
 
 		vunmap(shmem->vaddr);
-		drm_gem_shmem_put_pages(shmem);
+		drm_gem_shmem_put_pages_locked(shmem);
 	}
 
 	shmem->vaddr = NULL;
 }
-EXPORT_SYMBOL_GPL(drm_gem_shmem_vunmap);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_vunmap_locked);
 
 static int
 drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
@@ -424,7 +424,7 @@ drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
 /* Update madvise status, returns true if not purged, else
  * false or -errno.
  */
-int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
+int drm_gem_shmem_madvise_locked(struct drm_gem_shmem_object *shmem, int madv)
 {
 	dma_resv_assert_held(shmem->base.resv);
 
@@ -435,9 +435,9 @@ int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
 
 	return (madv >= 0);
 }
-EXPORT_SYMBOL_GPL(drm_gem_shmem_madvise);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_madvise_locked);
 
-void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
+void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	struct drm_device *dev = obj->dev;
@@ -451,7 +451,7 @@ void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
 	kfree(shmem->sgt);
 	shmem->sgt = NULL;
 
-	drm_gem_shmem_put_pages(shmem);
+	drm_gem_shmem_put_pages_locked(shmem);
 
 	shmem->madv = -1;
 
@@ -467,7 +467,7 @@ void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
 
 	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping, 0, (loff_t)-1);
 }
-EXPORT_SYMBOL_GPL(drm_gem_shmem_purge);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_purge_locked);
 
 /**
  * drm_gem_shmem_dumb_create - Create a dumb shmem buffer object
@@ -564,7 +564,7 @@ static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
 	dma_resv_lock(shmem->base.resv, NULL);
-	drm_gem_shmem_put_pages(shmem);
+	drm_gem_shmem_put_pages_locked(shmem);
 	dma_resv_unlock(shmem->base.resv);
 
 	drm_gem_vm_close(vma);
@@ -611,7 +611,7 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 	}
 
 	dma_resv_lock(shmem->base.resv, NULL);
-	ret = drm_gem_shmem_get_pages(shmem);
+	ret = drm_gem_shmem_get_pages_locked(shmem);
 	dma_resv_unlock(shmem->base.resv);
 
 	if (ret)
@@ -679,7 +679,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
-	ret = drm_gem_shmem_get_pages(shmem);
+	ret = drm_gem_shmem_get_pages_locked(shmem);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -701,7 +701,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 	sg_free_table(sgt);
 	kfree(sgt);
 err_put_pages:
-	drm_gem_shmem_put_pages(shmem);
+	drm_gem_shmem_put_pages_locked(shmem);
 	return ERR_PTR(ret);
 }
 
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 4f9736e5f929..62d4a409faa8 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -180,7 +180,7 @@ static int lima_gem_pin(struct drm_gem_object *obj)
 	if (bo->heap_size)
 		return -EINVAL;
 
-	return drm_gem_shmem_pin(&bo->base);
+	return drm_gem_shmem_object_pin(obj);
 }
 
 static int lima_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
@@ -190,7 +190,7 @@ static int lima_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 	if (bo->heap_size)
 		return -EINVAL;
 
-	return drm_gem_shmem_vmap(&bo->base, map);
+	return drm_gem_shmem_object_vmap_locked(obj, map);
 }
 
 static int lima_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
@@ -200,7 +200,7 @@ static int lima_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 	if (bo->heap_size)
 		return -EINVAL;
 
-	return drm_gem_shmem_mmap(&bo->base, vma);
+	return drm_gem_shmem_object_mmap(obj, vma);
 }
 
 static const struct drm_gem_object_funcs lima_gem_funcs = {
@@ -212,7 +212,7 @@ static const struct drm_gem_object_funcs lima_gem_funcs = {
 	.unpin = drm_gem_shmem_object_unpin,
 	.get_sg_table = drm_gem_shmem_object_get_sg_table,
 	.vmap = lima_gem_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
+	.vunmap = drm_gem_shmem_object_vunmap_locked,
 	.mmap = lima_gem_mmap,
 	.vm_ops = &drm_gem_shmem_vm_ops,
 };
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index b834777b409b..7f2aba96d5b9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -438,7 +438,7 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 		}
 	}
 
-	args->retained = drm_gem_shmem_madvise(&bo->base, args->madv);
+	args->retained = drm_gem_shmem_madvise_locked(&bo->base, args->madv);
 
 	if (args->retained) {
 		if (args->madv == PANFROST_MADV_DONTNEED)
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 0cf64456e29a..6b77d8cebcb2 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -192,7 +192,7 @@ static int panfrost_gem_pin(struct drm_gem_object *obj)
 	if (bo->is_heap)
 		return -EINVAL;
 
-	return drm_gem_shmem_pin(&bo->base);
+	return drm_gem_shmem_object_pin(obj);
 }
 
 static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj)
@@ -231,8 +231,8 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
 	.pin = panfrost_gem_pin,
 	.unpin = drm_gem_shmem_object_unpin,
 	.get_sg_table = drm_gem_shmem_object_get_sg_table,
-	.vmap = drm_gem_shmem_object_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
+	.vmap = drm_gem_shmem_object_vmap_locked,
+	.vunmap = drm_gem_shmem_object_vunmap_locked,
 	.mmap = drm_gem_shmem_object_mmap,
 	.status = panfrost_gem_status,
 	.rss = panfrost_gem_rss,
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
index 6a71a2555f85..72193bd734e1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
@@ -52,7 +52,7 @@ static bool panfrost_gem_purge(struct drm_gem_object *obj)
 		goto unlock_mappings;
 
 	panfrost_gem_teardown_mappings_locked(bo);
-	drm_gem_shmem_purge(&bo->base);
+	drm_gem_shmem_purge_locked(&bo->base);
 	ret = true;
 
 	dma_resv_unlock(shmem->base.resv);
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 846dd697c410..9fd4a89c52dd 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -536,7 +536,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 err_map:
 	sg_free_table(sgt);
 err_pages:
-	drm_gem_shmem_put_pages(&bo->base);
+	drm_gem_shmem_put_pages_locked(&bo->base);
 err_unlock:
 	dma_resv_unlock(obj->resv);
 err_bo:
diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index 8b3229a37c6d..42cd874f6810 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -56,8 +56,8 @@ static const struct drm_gem_object_funcs v3d_gem_funcs = {
 	.pin = drm_gem_shmem_object_pin,
 	.unpin = drm_gem_shmem_object_unpin,
 	.get_sg_table = drm_gem_shmem_object_get_sg_table,
-	.vmap = drm_gem_shmem_object_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
+	.vmap = drm_gem_shmem_object_vmap_locked,
+	.vunmap = drm_gem_shmem_object_vunmap_locked,
 	.mmap = drm_gem_shmem_object_mmap,
 	.vm_ops = &drm_gem_shmem_vm_ops,
 };
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index c7e74cf13022..ee5d2a70656b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -106,8 +106,8 @@ static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs = {
 	.pin = drm_gem_shmem_object_pin,
 	.unpin = drm_gem_shmem_object_unpin,
 	.get_sg_table = drm_gem_shmem_object_get_sg_table,
-	.vmap = drm_gem_shmem_object_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
+	.vmap = drm_gem_shmem_object_vmap_locked,
+	.vunmap = drm_gem_shmem_object_vunmap_locked,
 	.mmap = drm_gem_shmem_object_mmap,
 	.vm_ops = &drm_gem_shmem_vm_ops,
 };
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index bf0c31aa8fbe..6ee4a4046980 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -99,16 +99,16 @@ struct drm_gem_shmem_object {
 struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size);
 void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
 
-void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
+void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem);
-int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
-		       struct iosys_map *map);
-void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
-			  struct iosys_map *map);
+int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
+			      struct iosys_map *map);
+void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
+				 struct iosys_map *map);
 int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
 
-int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv);
+int drm_gem_shmem_madvise_locked(struct drm_gem_shmem_object *shmem, int madv);
 
 static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
 {
@@ -117,7 +117,7 @@ static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem
 		!shmem->base.dma_buf && !shmem->base.import_attach;
 }
 
-void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);
+void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem);
 
 struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem);
 struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem);
@@ -208,22 +208,22 @@ static inline struct sg_table *drm_gem_shmem_object_get_sg_table(struct drm_gem_
 }
 
 /*
- * drm_gem_shmem_object_vmap - GEM object function for drm_gem_shmem_vmap()
+ * drm_gem_shmem_object_vmap_locked - GEM object function for drm_gem_shmem_vmap_locked()
  * @obj: GEM object
  * @map: Returns the kernel virtual address of the SHMEM GEM object's backing store.
  *
- * This function wraps drm_gem_shmem_vmap(). Drivers that employ the shmem helpers should
- * use it as their &drm_gem_object_funcs.vmap handler.
+ * This function wraps drm_gem_shmem_vmap_locked(). Drivers that employ the shmem
+ * helpers should use it as their &drm_gem_object_funcs.vmap handler.
  *
  * Returns:
  * 0 on success or a negative error code on failure.
  */
-static inline int drm_gem_shmem_object_vmap(struct drm_gem_object *obj,
-					    struct iosys_map *map)
+static inline int drm_gem_shmem_object_vmap_locked(struct drm_gem_object *obj,
+						   struct iosys_map *map)
 {
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
-	return drm_gem_shmem_vmap(shmem, map);
+	return drm_gem_shmem_vmap_locked(shmem, map);
 }
 
 /*
@@ -231,15 +231,15 @@ static inline int drm_gem_shmem_object_vmap(struct drm_gem_object *obj,
  * @obj: GEM object
  * @map: Kernel virtual address where the SHMEM GEM object was mapped
  *
- * This function wraps drm_gem_shmem_vunmap(). Drivers that employ the shmem helpers should
- * use it as their &drm_gem_object_funcs.vunmap handler.
+ * This function wraps drm_gem_shmem_vunmap_locked(). Drivers that employ the shmem
+ * helpers should use it as their &drm_gem_object_funcs.vunmap handler.
  */
-static inline void drm_gem_shmem_object_vunmap(struct drm_gem_object *obj,
-					       struct iosys_map *map)
+static inline void drm_gem_shmem_object_vunmap_locked(struct drm_gem_object *obj,
+						      struct iosys_map *map)
 {
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
-	drm_gem_shmem_vunmap(shmem, map);
+	drm_gem_shmem_vunmap_locked(shmem, map);
 }
 
 /**
-- 
2.41.0

