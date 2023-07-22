Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BF775DF65
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jul 2023 01:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4496310E1E6;
	Sat, 22 Jul 2023 23:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42A210E1A3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jul 2023 23:53:18 +0000 (UTC)
Received: from workpc.. (109-252-150-127.dynamic.spd-mgts.ru [109.252.150.127])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3B5C166070F6;
 Sun, 23 Jul 2023 00:53:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690069997;
 bh=MM5hOaImEnpU80xbO+7OJdi5fnMYE6YvufN14idB8CY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j3BkL+p2J7mqw8As7kDCmb/96PY0RI/o0QcTzXJdNTKwxDhHTxaSlEJl4hgTD9s6i
 MKCQhgVKe1+XdprvO6OlRy9mTEseeQzcF+TAZ+SE5xECBZk5AFHyMTn19w7txXNUOx
 IhDdoJchAokl5JbXPL9TCG/ZWF5U33klDL/PPoaX95FJnUXV3vrZL7/sZiTwi5cu7U
 q0LkXsI/rUbKMksQta/lf0Xhson9BfPrHQvzcmjryI53QELdGLu0bbyMG8Je/UgtJ6
 f68FGH7TbCMEaUgqh5IxkxMUTdS1k1QPdiBKe9KNa79fB2SlZ8eD50XBPLQu48RyfB
 Ek8PDT/E7MW3w==
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
Subject: [PATCH v14 10/12] drm/shmem-helper: Refactor locked/unlocked functions
Date: Sun, 23 Jul 2023 02:47:44 +0300
Message-ID: <20230722234746.205949-11-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230722234746.205949-1-dmitry.osipenko@collabora.com>
References: <20230722234746.205949-1-dmitry.osipenko@collabora.com>
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

Add locked/unlocked postfixes to drm-shmem function names to make clear
where reservation lock is taken and where not. Add more common helpers to
drm_gem_shmem_helper.h

Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c  | 172 +++++++++---------------
 drivers/gpu/drm/lima/lima_gem.c         |  10 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c |   2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c |  12 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c |   2 +-
 drivers/gpu/drm/v3d/v3d_bo.c            |  10 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c    |   4 +-
 drivers/gpu/drm/virtio/virtgpu_object.c |  16 +--
 include/drm/drm_gem_shmem_helper.h      | 133 +++++++++---------
 9 files changed, 166 insertions(+), 195 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 87cef8e91fad..3dd4da18eedf 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -41,12 +41,12 @@ MODULE_IMPORT_NS(DMA_BUF);
 static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
 	.free = drm_gem_shmem_object_free,
 	.print_info = drm_gem_shmem_object_print_info,
-	.pin = drm_gem_shmem_object_pin,
-	.unpin = drm_gem_shmem_object_unpin,
+	.pin = drm_gem_shmem_object_pin_unlocked,
+	.unpin = drm_gem_shmem_object_unpin_unlocked,
 	.get_sg_table = drm_gem_shmem_object_get_sg_table,
-	.vmap = drm_gem_shmem_object_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
-	.mmap = drm_gem_shmem_object_mmap,
+	.vmap = drm_gem_shmem_object_vmap_locked,
+	.vunmap = drm_gem_shmem_object_vunmap_locked,
+	.mmap = drm_gem_shmem_object_mmap_unlocked,
 	.vm_ops = &drm_gem_shmem_vm_ops,
 };
 
@@ -155,7 +155,7 @@ static bool drm_gem_shmem_is_evictable(struct drm_gem_shmem_object *shmem)
 }
 
 static void
-drm_gem_shmem_update_pages_state(struct drm_gem_shmem_object *shmem)
+drm_gem_shmem_update_pages_state_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	struct drm_gem_shmem *shmem_mm = obj->dev->shmem_mm;
@@ -193,7 +193,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 		drm_prime_gem_destroy(obj, shmem->sgt);
 	} else {
 		/* take out shmem GEM object from the memory shrinker */
-		drm_gem_shmem_madvise(shmem, -1);
+		drm_gem_shmem_madvise_locked(shmem, -1);
 
 		drm_WARN_ON(obj->dev, shmem->vmap_use_count);
 
@@ -204,7 +204,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 			kfree(shmem->sgt);
 		}
 		if (shmem->pages_use_count)
-			drm_gem_shmem_put_pages(shmem);
+			drm_gem_shmem_put_pages_locked(shmem);
 
 		drm_WARN_ON(obj->dev, shmem->pages_use_count);
 	}
@@ -267,7 +267,7 @@ static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 		return -ENOMEM;
 
 	if (shmem->pages_use_count++ > 0) {
-		err = drm_gem_shmem_swapin(shmem);
+		err = drm_gem_shmem_swapin_locked(shmem);
 		if (err)
 			goto err_zero_use;
 
@@ -278,7 +278,7 @@ static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 	if (err)
 		goto err_zero_use;
 
-	drm_gem_shmem_update_pages_state(shmem);
+	drm_gem_shmem_update_pages_state_locked(shmem);
 
 	return 0;
 
@@ -289,7 +289,7 @@ static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 }
 
 static void
-drm_gem_shmem_release_pages(struct drm_gem_shmem_object *shmem)
+drm_gem_shmem_release_pages_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
@@ -312,12 +312,12 @@ drm_gem_shmem_release_pages(struct drm_gem_shmem_object *shmem)
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
 
@@ -329,16 +329,19 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
 	if (--shmem->pages_use_count > 0)
 		return;
 
-	drm_gem_shmem_release_pages(shmem);
+	drm_gem_shmem_release_pages_locked(shmem);
 
-	drm_gem_shmem_update_pages_state(shmem);
+	drm_gem_shmem_update_pages_state_locked(shmem);
 }
-EXPORT_SYMBOL(drm_gem_shmem_put_pages);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
 
-static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
+int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
 {
+	struct drm_gem_object *obj = &shmem->base;
 	int ret;
 
+	drm_WARN_ON(obj->dev, obj->import_attach);
+
 	dma_resv_assert_held(shmem->base.resv);
 
 	ret = drm_gem_shmem_get_pages(shmem);
@@ -347,8 +350,9 @@ static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(drm_gem_shmem_pin_locked);
 
-static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
+void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
@@ -357,59 +361,14 @@ static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
 	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages_pin_count))
 		return;
 
-	drm_gem_shmem_put_pages(shmem);
+	drm_gem_shmem_put_pages_locked(shmem);
 
 	shmem->pages_pin_count--;
 }
-
-/**
- * drm_gem_shmem_pin - Pin backing pages for a shmem GEM object
- * @shmem: shmem GEM object
- *
- * This function makes sure the backing pages are pinned in memory while the
- * buffer is exported.
- *
- * Returns:
- * 0 on success or a negative error code on failure.
- */
-int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
-{
-	struct drm_gem_object *obj = &shmem->base;
-	int ret;
-
-	drm_WARN_ON(obj->dev, obj->import_attach);
-
-	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
-	if (ret)
-		return ret;
-	ret = drm_gem_shmem_pin_locked(shmem);
-	dma_resv_unlock(shmem->base.resv);
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_gem_shmem_pin);
-
-/**
- * drm_gem_shmem_unpin - Unpin backing pages for a shmem GEM object
- * @shmem: shmem GEM object
- *
- * This function removes the requirement that the backing pages are pinned in
- * memory.
- */
-void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
-{
-	struct drm_gem_object *obj = &shmem->base;
-
-	drm_WARN_ON(obj->dev, obj->import_attach);
-
-	dma_resv_lock(shmem->base.resv, NULL);
-	drm_gem_shmem_unpin_locked(shmem);
-	dma_resv_unlock(shmem->base.resv);
-}
-EXPORT_SYMBOL(drm_gem_shmem_unpin);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_unpin_locked);
 
 /*
- * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM object
+ * drm_gem_shmem_vmap_locked - Create a virtual mapping for a shmem GEM object
  * @shmem: shmem GEM object
  * @map: Returns the kernel virtual address of the SHMEM GEM object's backing
  *       store.
@@ -418,13 +377,13 @@ EXPORT_SYMBOL(drm_gem_shmem_unpin);
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
@@ -470,22 +429,22 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_gem_shmem_vmap);
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
 
@@ -506,7 +465,7 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
 
 	shmem->vaddr = NULL;
 }
-EXPORT_SYMBOL(drm_gem_shmem_vunmap);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_vunmap_locked);
 
 static int
 drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
@@ -534,7 +493,7 @@ drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
 /* Update madvise status, returns true if not purged, else
  * false or -errno.
  */
-int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
+int drm_gem_shmem_madvise_locked(struct drm_gem_shmem_object *shmem, int madv)
 {
 	drm_gem_shmem_resv_assert_held(shmem);
 
@@ -543,13 +502,13 @@ int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
 
 	madv = shmem->madv;
 
-	drm_gem_shmem_update_pages_state(shmem);
+	drm_gem_shmem_update_pages_state_locked(shmem);
 
 	return (madv >= 0);
 }
-EXPORT_SYMBOL(drm_gem_shmem_madvise);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_madvise_locked);
 
-static void drm_gem_shmem_unpin_pages(struct drm_gem_shmem_object *shmem)
+static void drm_gem_shmem_unpin_pages_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	struct drm_device *dev = obj->dev;
@@ -560,7 +519,7 @@ static void drm_gem_shmem_unpin_pages(struct drm_gem_shmem_object *shmem)
 		return;
 
 	dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
-	drm_gem_shmem_release_pages(shmem);
+	drm_gem_shmem_release_pages_locked(shmem);
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 
 	sg_free_table(shmem->sgt);
@@ -568,13 +527,13 @@ static void drm_gem_shmem_unpin_pages(struct drm_gem_shmem_object *shmem)
 	shmem->sgt = NULL;
 }
 
-void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
+void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
 	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_purgeable(shmem));
 
-	drm_gem_shmem_unpin_pages(shmem);
+	drm_gem_shmem_unpin_pages_locked(shmem);
 	drm_gem_free_mmap_offset(obj);
 
 	/* Our goal here is to return as much of the memory as
@@ -588,13 +547,13 @@ void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
 
 	shmem->madv = -1;
 	shmem->evicted = false;
-	drm_gem_shmem_update_pages_state(shmem);
+	drm_gem_shmem_update_pages_state_locked(shmem);
 }
-EXPORT_SYMBOL(drm_gem_shmem_purge);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_purge_locked);
 
 /**
- * drm_gem_shmem_swapin() - Moves shmem GEM back to memory and enables
- *                          hardware access to the memory.
+ * drm_gem_shmem_swapin_locked() - Moves shmem GEM back to memory and enables
+ *                                 hardware access to the memory.
  * @shmem: shmem GEM object
  *
  * This function moves shmem GEM back to memory if it was previously evicted
@@ -603,7 +562,7 @@ EXPORT_SYMBOL(drm_gem_shmem_purge);
  * Returns:
  * 0 on success or a negative error code on failure.
  */
-int drm_gem_shmem_swapin(struct drm_gem_shmem_object *shmem)
+int drm_gem_shmem_swapin_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	struct sg_table *sgt;
@@ -631,7 +590,7 @@ int drm_gem_shmem_swapin(struct drm_gem_shmem_object *shmem)
 		shmem->sgt = sgt;
 		shmem->evicted = false;
 
-		drm_gem_shmem_update_pages_state(shmem);
+		drm_gem_shmem_update_pages_state_locked(shmem);
 	}
 
 	if (!shmem->pages)
@@ -639,7 +598,7 @@ int drm_gem_shmem_swapin(struct drm_gem_shmem_object *shmem)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(drm_gem_shmem_swapin);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_swapin_locked);
 
 /**
  * drm_gem_shmem_dumb_create - Create a dumb shmem buffer object
@@ -702,7 +661,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	if (page_offset >= num_pages || (!shmem->pages && !shmem->evicted)) {
 		ret = VM_FAULT_SIGBUS;
 	} else {
-		err = drm_gem_shmem_swapin(shmem);
+		err = drm_gem_shmem_swapin_locked(shmem);
 		if (err) {
 			ret = VM_FAULT_OOM;
 			goto unlock;
@@ -736,7 +695,7 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 	if (!drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
 		shmem->pages_use_count++;
 
-	drm_gem_shmem_update_pages_state(shmem);
+	drm_gem_shmem_update_pages_state_locked(shmem);
 	dma_resv_unlock(shmem->base.resv);
 
 	drm_gem_vm_open(vma);
@@ -748,7 +707,7 @@ static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
 	dma_resv_lock(shmem->base.resv, NULL);
-	drm_gem_shmem_put_pages(shmem);
+	drm_gem_shmem_put_pages_locked(shmem);
 	dma_resv_unlock(shmem->base.resv);
 
 	drm_gem_vm_close(vma);
@@ -762,7 +721,7 @@ const struct vm_operations_struct drm_gem_shmem_vm_ops = {
 EXPORT_SYMBOL_GPL(drm_gem_shmem_vm_ops);
 
 /**
- * drm_gem_shmem_mmap - Memory-map a shmem GEM object
+ * drm_gem_shmem_mmap_unlocked - Memory-map a shmem GEM object
  * @shmem: shmem GEM object
  * @vma: VMA for the area to be mapped
  *
@@ -772,7 +731,8 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_vm_ops);
  * Returns:
  * 0 on success or a negative error code on failure.
  */
-int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma)
+int drm_gem_shmem_mmap_unlocked(struct drm_gem_shmem_object *shmem,
+				struct vm_area_struct *vma)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	int ret;
@@ -802,7 +762,7 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap_unlocked);
 
 /**
  * drm_gem_shmem_print_info() - Print &drm_gem_shmem_object info for debugfs
@@ -875,7 +835,7 @@ struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object
 
 	shmem->sgt = sgt;
 
-	drm_gem_shmem_update_pages_state(shmem);
+	drm_gem_shmem_update_pages_state_locked(shmem);
 
 	return sgt;
 
@@ -883,7 +843,7 @@ struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object
 	sg_free_table(sgt);
 	kfree(sgt);
 err_put_pages:
-	drm_gem_shmem_put_pages(shmem);
+	drm_gem_shmem_put_pages_locked(shmem);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_get_pages_sgt_locked);
@@ -974,21 +934,21 @@ drm_gem_shmem_shrinker_count_objects(struct shrinker *shrinker,
 	return count ?: SHRINK_EMPTY;
 }
 
-void drm_gem_shmem_evict(struct drm_gem_shmem_object *shmem)
+void drm_gem_shmem_evict_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
 	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_evictable(shmem));
 	drm_WARN_ON(obj->dev, shmem->evicted);
 
-	drm_gem_shmem_unpin_pages(shmem);
+	drm_gem_shmem_unpin_pages_locked(shmem);
 
 	shmem->evicted = true;
-	drm_gem_shmem_update_pages_state(shmem);
+	drm_gem_shmem_update_pages_state_locked(shmem);
 }
-EXPORT_SYMBOL_GPL(drm_gem_shmem_evict);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_evict_locked);
 
-static bool drm_gem_shmem_shrinker_evict(struct drm_gem_object *obj)
+static bool drm_gem_shmem_shrinker_evict_locked(struct drm_gem_object *obj)
 {
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 	int err;
@@ -1004,7 +964,7 @@ static bool drm_gem_shmem_shrinker_evict(struct drm_gem_object *obj)
 	return true;
 }
 
-static bool drm_gem_shmem_shrinker_purge(struct drm_gem_object *obj)
+static bool drm_gem_shmem_shrinker_purge_locked(struct drm_gem_object *obj)
 {
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 	int err;
@@ -1033,13 +993,13 @@ drm_gem_shmem_shrinker_scan_objects(struct shrinker *shrinker,
 	/* purge as many objects as we can */
 	freed += drm_gem_lru_scan(&shmem_shrinker->lru_evictable,
 				  nr_to_scan, &remaining,
-				  drm_gem_shmem_shrinker_purge);
+				  drm_gem_shmem_shrinker_purge_locked);
 
 	/* evict as many objects as we can */
 	if (freed < nr_to_scan)
 		freed += drm_gem_lru_scan(&shmem_shrinker->lru_evictable,
 					  nr_to_scan - freed, &remaining,
-					  drm_gem_shmem_shrinker_evict);
+					  drm_gem_shmem_shrinker_evict_locked);
 
 	return (freed > 0 && remaining > 0) ? freed : SHRINK_STOP;
 }
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 4f9736e5f929..492e5cf739bb 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -180,7 +180,7 @@ static int lima_gem_pin(struct drm_gem_object *obj)
 	if (bo->heap_size)
 		return -EINVAL;
 
-	return drm_gem_shmem_pin(&bo->base);
+	return drm_gem_shmem_object_pin_unlocked(obj);
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
+	return drm_gem_shmem_object_mmap_unlocked(obj, vma);
 }
 
 static const struct drm_gem_object_funcs lima_gem_funcs = {
@@ -209,10 +209,10 @@ static const struct drm_gem_object_funcs lima_gem_funcs = {
 	.close = lima_gem_object_close,
 	.print_info = drm_gem_shmem_object_print_info,
 	.pin = lima_gem_pin,
-	.unpin = drm_gem_shmem_object_unpin,
+	.unpin = drm_gem_shmem_object_unpin_unlocked,
 	.get_sg_table = drm_gem_shmem_object_get_sg_table,
 	.vmap = lima_gem_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
+	.vunmap = drm_gem_shmem_object_vunmap_locked,
 	.mmap = lima_gem_mmap,
 	.vm_ops = &drm_gem_shmem_vm_ops,
 };
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index d1b2bd6db443..74d802e5b1a6 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -437,7 +437,7 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 		}
 	}
 
-	args->retained = drm_gem_shmem_madvise(&bo->base, args->madv);
+	args->retained = drm_gem_shmem_madvise_locked(&bo->base, args->madv);
 
 out_unlock_mappings:
 	mutex_unlock(&bo->mappings.lock);
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 08d795c28b4e..6dcf8368d184 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -182,7 +182,7 @@ static int panfrost_gem_pin(struct drm_gem_object *obj)
 	if (bo->is_heap)
 		return -EINVAL;
 
-	return drm_gem_shmem_pin(&bo->base);
+	return drm_gem_shmem_object_pin_unlocked(obj);
 }
 
 static int panfrost_shmem_evict(struct drm_gem_object *obj)
@@ -197,7 +197,7 @@ static int panfrost_shmem_evict(struct drm_gem_object *obj)
 
 	panfrost_gem_teardown_mappings_locked(bo);
 
-	drm_gem_shmem_purge(&bo->base);
+	drm_gem_shmem_purge_locked(&bo->base);
 
 	mutex_unlock(&bo->mappings.lock);
 
@@ -210,11 +210,11 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
 	.close = panfrost_gem_close,
 	.print_info = drm_gem_shmem_object_print_info,
 	.pin = panfrost_gem_pin,
-	.unpin = drm_gem_shmem_object_unpin,
+	.unpin = drm_gem_shmem_object_unpin_unlocked,
 	.get_sg_table = drm_gem_shmem_object_get_sg_table,
-	.vmap = drm_gem_shmem_object_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
-	.mmap = drm_gem_shmem_object_mmap,
+	.vmap = drm_gem_shmem_object_vmap_locked,
+	.vunmap = drm_gem_shmem_object_vunmap_locked,
+	.mmap = drm_gem_shmem_object_mmap_unlocked,
 	.vm_ops = &drm_gem_shmem_vm_ops,
 	.evict = panfrost_shmem_evict,
 };
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index c0123d09f699..7771769f0ce0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -535,7 +535,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 err_map:
 	sg_free_table(sgt);
 err_pages:
-	drm_gem_shmem_put_pages(&bo->base);
+	drm_gem_shmem_put_pages_locked(&bo->base);
 err_unlock:
 	dma_resv_unlock(obj->resv);
 err_bo:
diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index 8b3229a37c6d..ad83a3043d02 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -53,12 +53,12 @@ void v3d_free_object(struct drm_gem_object *obj)
 static const struct drm_gem_object_funcs v3d_gem_funcs = {
 	.free = v3d_free_object,
 	.print_info = drm_gem_shmem_object_print_info,
-	.pin = drm_gem_shmem_object_pin,
-	.unpin = drm_gem_shmem_object_unpin,
+	.pin = drm_gem_shmem_object_pin_unlocked,
+	.unpin = drm_gem_shmem_object_unpin_unlocked,
 	.get_sg_table = drm_gem_shmem_object_get_sg_table,
-	.vmap = drm_gem_shmem_object_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
-	.mmap = drm_gem_shmem_object_mmap,
+	.vmap = drm_gem_shmem_object_vmap_locked,
+	.vunmap = drm_gem_shmem_object_vunmap_locked,
+	.mmap = drm_gem_shmem_object_mmap_unlocked,
 	.vm_ops = &drm_gem_shmem_vm_ops,
 };
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index b9ceb0602fd5..aea15548ba9e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -356,7 +356,7 @@ int virtio_gpu_gem_pin(struct virtio_gpu_object *bo)
 	int ret = 0;
 
 	if (virtio_gpu_is_shmem(bo))
-		ret = drm_gem_shmem_object_pin(&bo->base.base);
+		ret = drm_gem_shmem_object_pin_unlocked(&bo->base.base);
 
 	return ret;
 }
@@ -364,5 +364,5 @@ int virtio_gpu_gem_pin(struct virtio_gpu_object *bo)
 void virtio_gpu_gem_unpin(struct virtio_gpu_object *bo)
 {
 	if (virtio_gpu_is_shmem(bo))
-		drm_gem_shmem_object_unpin(&bo->base.base);
+		drm_gem_shmem_object_unpin_unlocked(&bo->base.base);
 }
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 70dcd19266dc..6cd64eac555f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -139,9 +139,9 @@ static int virtio_gpu_shmem_evict(struct drm_gem_object *obj)
 			return err;
 		}
 
-		drm_gem_shmem_purge(&bo->base);
+		drm_gem_shmem_purge_locked(&bo->base);
 	} else {
-		drm_gem_shmem_evict(&bo->base);
+		drm_gem_shmem_evict_locked(&bo->base);
 	}
 
 	return 0;
@@ -198,7 +198,7 @@ int virtio_gpu_reattach_shmem_object(struct virtio_gpu_object *bo)
 	unsigned int nents;
 	int err;
 
-	err = drm_gem_shmem_swapin(&bo->base);
+	err = drm_gem_shmem_swapin_locked(&bo->base);
 	if (err)
 		return err;
 
@@ -220,12 +220,12 @@ static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs = {
 	.close = virtio_gpu_gem_object_close,
 	.print_info = drm_gem_shmem_object_print_info,
 	.export = virtgpu_gem_prime_export,
-	.pin = drm_gem_shmem_object_pin,
-	.unpin = drm_gem_shmem_object_unpin,
+	.pin = drm_gem_shmem_object_pin_unlocked,
+	.unpin = drm_gem_shmem_object_unpin_unlocked,
 	.get_sg_table = drm_gem_shmem_object_get_sg_table,
-	.vmap = drm_gem_shmem_object_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
-	.mmap = drm_gem_shmem_object_mmap,
+	.vmap = drm_gem_shmem_object_vmap_locked,
+	.vunmap = drm_gem_shmem_object_vunmap_locked,
+	.mmap = drm_gem_shmem_object_mmap_unlocked,
 	.vm_ops = &drm_gem_shmem_vm_ops,
 	.evict = virtio_gpu_shmem_evict,
 };
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 55f5ff387bbc..73cfca5853fd 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -109,16 +109,17 @@ struct drm_gem_shmem_object {
 struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size);
 void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
 
-void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
-int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem);
-void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem);
-int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
-		       struct iosys_map *map);
-void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
-			  struct iosys_map *map);
-int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
-
-int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv);
+void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem);
+int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
+			      struct iosys_map *map);
+void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
+				 struct iosys_map *map);
+int drm_gem_shmem_mmap_unlocked(struct drm_gem_shmem_object *shmem,
+				struct vm_area_struct *vma);
+int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem);
+void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem);
+
+int drm_gem_shmem_madvise_locked(struct drm_gem_shmem_object *shmem, int madv);
 
 static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
 {
@@ -130,10 +131,10 @@ static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem
 		(shmem->sgt || shmem->evicted);
 }
 
-int drm_gem_shmem_swapin(struct drm_gem_shmem_object *shmem);
+int drm_gem_shmem_swapin_locked(struct drm_gem_shmem_object *shmem);
 
-void drm_gem_shmem_evict(struct drm_gem_shmem_object *shmem);
-void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);
+void drm_gem_shmem_evict_locked(struct drm_gem_shmem_object *shmem);
+void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem);
 
 struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem);
 struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem);
@@ -179,34 +180,6 @@ static inline void drm_gem_shmem_object_print_info(struct drm_printer *p, unsign
 	drm_gem_shmem_print_info(shmem, p, indent);
 }
 
-/**
- * drm_gem_shmem_object_pin - GEM object function for drm_gem_shmem_pin()
- * @obj: GEM object
- *
- * This function wraps drm_gem_shmem_pin(). Drivers that employ the shmem helpers should
- * use it as their &drm_gem_object_funcs.pin handler.
- */
-static inline int drm_gem_shmem_object_pin(struct drm_gem_object *obj)
-{
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-
-	return drm_gem_shmem_pin(shmem);
-}
-
-/**
- * drm_gem_shmem_object_unpin - GEM object function for drm_gem_shmem_unpin()
- * @obj: GEM object
- *
- * This function wraps drm_gem_shmem_unpin(). Drivers that employ the shmem helpers should
- * use it as their &drm_gem_object_funcs.unpin handler.
- */
-static inline void drm_gem_shmem_object_unpin(struct drm_gem_object *obj)
-{
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-
-	drm_gem_shmem_unpin(shmem);
-}
-
 /**
  * drm_gem_shmem_object_get_sg_table - GEM object function for drm_gem_shmem_get_sg_table()
  * @obj: GEM object
@@ -225,64 +198,102 @@ static inline struct sg_table *drm_gem_shmem_object_get_sg_table(struct drm_gem_
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
- * drm_gem_shmem_object_vunmap - GEM object function for drm_gem_shmem_vunmap()
+ * drm_gem_shmem_object_vunmap_locked - GEM object function for drm_gem_shmem_vunmap_locked()
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
- * drm_gem_shmem_object_mmap - GEM object function for drm_gem_shmem_mmap()
+ * drm_gem_shmem_object_mmap_unlocked - GEM object function for drm_gem_shmem_mmap_unlocked()
  * @obj: GEM object
  * @vma: VMA for the area to be mapped
  *
- * This function wraps drm_gem_shmem_mmap(). Drivers that employ the shmem helpers should
- * use it as their &drm_gem_object_funcs.mmap handler.
+ * This function wraps drm_gem_shmem_mmap_unlocked(). Drivers that employ the shmem
+ * helpers should use it as their &drm_gem_object_funcs.mmap handler.
  *
  * Returns:
  * 0 on success or a negative error code on failure.
  */
-static inline int drm_gem_shmem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+static inline int drm_gem_shmem_object_mmap_unlocked(struct drm_gem_object *obj,
+						     struct vm_area_struct *vma)
 {
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
-	return drm_gem_shmem_mmap(shmem, vma);
+	return drm_gem_shmem_mmap_unlocked(shmem, vma);
+}
+
+/**
+ * drm_gem_shmem_object_pin_unlocked - unlocked GEM object function for drm_gem_shmem_pin_locked()
+ * @obj: GEM object
+ *
+ * This function wraps drm_gem_shmem_pin_locked(). Drivers that employ the shmem
+ * helpers should use it as their &drm_gem_object_funcs.pin handler.
+ */
+static inline int drm_gem_shmem_object_pin_unlocked(struct drm_gem_object *obj)
+{
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+	int ret;
+
+	ret = dma_resv_lock_interruptible(obj->resv, NULL);
+	if (ret)
+		return ret;
+	ret = drm_gem_shmem_pin_locked(shmem);
+	dma_resv_unlock(obj->resv);
+
+	return ret;
+}
+
+/**
+ * drm_gem_shmem_object_unpin_unlocked - unlocked GEM object function for drm_gem_shmem_unpin_locked()
+ * @obj: GEM object
+ *
+ * This function wraps drm_gem_shmem_unpin_locked(). Drivers that employ the shmem
+ * helpers should use it as their &drm_gem_object_funcs.unpin handler.
+ */
+static inline void drm_gem_shmem_object_unpin_unlocked(struct drm_gem_object *obj)
+{
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+
+	dma_resv_lock(obj->resv, NULL);
+	drm_gem_shmem_unpin_locked(shmem);
+	dma_resv_unlock(obj->resv);
 }
 
 /**
- * drm_gem_shmem_object_madvise_unlocked - unlocked GEM object function for drm_gem_shmem_madvise()
+ * drm_gem_shmem_object_madvise_unlocked - unlocked GEM object function for drm_gem_shmem_madvise_locked()
  * @obj: GEM object
  * @madv: Madvise value
  *
- * This function wraps drm_gem_shmem_madvise(), providing unlocked variant.
+ * This function wraps drm_gem_shmem_madvise_locked(), providing unlocked variant.
  *
  * Returns:
  * 0 on success or a negative error code on failure.
@@ -295,7 +306,7 @@ static inline int drm_gem_shmem_object_madvise_unlocked(struct drm_gem_object *o
 	ret = dma_resv_lock_interruptible(obj->resv, NULL);
 	if (ret)
 		return ret;
-	ret = drm_gem_shmem_madvise(shmem, madv);
+	ret = drm_gem_shmem_madvise_locked(shmem, madv);
 	dma_resv_unlock(obj->resv);
 
 	return ret;
-- 
2.41.0

