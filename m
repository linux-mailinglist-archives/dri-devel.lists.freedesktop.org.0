Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A605356A5
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 01:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA1F10FCF8;
	Thu, 26 May 2022 23:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0A010F5F3;
 Thu, 26 May 2022 23:55:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 2BFD21F459F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653609304;
 bh=Fl9KmvGY8TmlbvY665rfeUfUuzBKIpn1Lyj/AK/rFBU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l7jFr9d3ZAz8pBAN068yg7n1vm6vMYK5oXSPnSEoGS1y++IXajSY21o61ibOqccgT
 2DJpiq/Yxizc3o+QtOhUIkFcnt+2gzVo8zcNtzqxhjGgHwKKVElWwZD3wZGFiQ/Fb+
 yDPoc1PS6Q+CF5EFq4Q9vxBQfPa9zD3QiQjNwB1BRRvieBvlZyFApgGOgaWLu1gktG
 i2U0CdybclAc51DN7INhHegH3AWbgBeo8C4qskZHvbJsFtPh4OSwFXaqw4w5bEmIs8
 rWa9vn2M1/S0Vg4DfkVUaEaW+xvUMcEDlKKlFNzuRZyoEt6iBYXj6x2fRP5tEiSNwa
 wX77K5w3Kf9UA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Qiang Yu <yuq825@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH v6 16/22] drm/shmem-helper: Use reservation lock
Date: Fri, 27 May 2022 02:50:34 +0300
Message-Id: <20220526235040.678984-17-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace drm_gem_shmem locks with GEM reservation lock to make drm-shmem
locks consistent with the new locking convention of dma-bufs which tells
that dma-buf importers are responsible for holding reservation lock for
all operations performed over dma-bufs. This prepares drm-shmem code for
addition of the generic shmem shrinker framework.

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c        | 181 +++++++-----------
 drivers/gpu/drm/lima/lima_gem.c               |   8 +-
 drivers/gpu/drm/lima/lima_sched.c             |   4 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |   7 +-
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |   6 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |  19 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |   6 +-
 include/drm/drm_gem_shmem_helper.h            |  14 +-
 8 files changed, 97 insertions(+), 148 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index fd2647690bf7..555fe212bd98 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -86,8 +86,6 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
 	if (ret)
 		goto err_release;
 
-	mutex_init(&shmem->pages_lock);
-	mutex_init(&shmem->vmap_lock);
 	INIT_LIST_HEAD(&shmem->madv_list);
 
 	if (!private) {
@@ -139,11 +137,13 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	WARN_ON(shmem->vmap_use_count);
-
 	if (obj->import_attach) {
 		drm_prime_gem_destroy(obj, shmem->sgt);
 	} else {
+		dma_resv_lock(shmem->base.resv, NULL);
+
+		WARN_ON(shmem->vmap_use_count);
+
 		if (shmem->sgt) {
 			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
 					  DMA_BIDIRECTIONAL, 0);
@@ -152,18 +152,18 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 		}
 		if (shmem->pages)
 			drm_gem_shmem_put_pages(shmem);
-	}
 
-	WARN_ON(shmem->pages_use_count);
+		WARN_ON(shmem->pages_use_count);
+
+		dma_resv_unlock(shmem->base.resv);
+	}
 
 	drm_gem_object_release(obj);
-	mutex_destroy(&shmem->pages_lock);
-	mutex_destroy(&shmem->vmap_lock);
 	kfree(shmem);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
 
-static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
+static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	struct page **pages;
@@ -194,35 +194,17 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
 }
 
 /*
- * drm_gem_shmem_get_pages - Allocate backing pages for a shmem GEM object
+ * drm_gem_shmem_put_pages - Decrease use count on the backing pages for a shmem GEM object
  * @shmem: shmem GEM object
  *
- * This function makes sure that backing pages exists for the shmem GEM object
- * and increases the use count.
- *
- * Returns:
- * 0 on success or a negative error code on failure.
+ * This function decreases the use count and puts the backing pages when use drops to zero.
  */
-int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
-{
-	int ret;
-
-	WARN_ON(shmem->base.import_attach);
-
-	ret = mutex_lock_interruptible(&shmem->pages_lock);
-	if (ret)
-		return ret;
-	ret = drm_gem_shmem_get_pages_locked(shmem);
-	mutex_unlock(&shmem->pages_lock);
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_gem_shmem_get_pages);
-
-static void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
+void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
+	dma_resv_assert_held(shmem->base.resv);
+
 	if (WARN_ON_ONCE(!shmem->pages_use_count))
 		return;
 
@@ -239,19 +221,6 @@ static void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
 			  shmem->pages_mark_accessed_on_put);
 	shmem->pages = NULL;
 }
-
-/*
- * drm_gem_shmem_put_pages - Decrease use count on the backing pages for a shmem GEM object
- * @shmem: shmem GEM object
- *
- * This function decreases the use count and puts the backing pages when use drops to zero.
- */
-void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
-{
-	mutex_lock(&shmem->pages_lock);
-	drm_gem_shmem_put_pages_locked(shmem);
-	mutex_unlock(&shmem->pages_lock);
-}
 EXPORT_SYMBOL(drm_gem_shmem_put_pages);
 
 /**
@@ -266,6 +235,8 @@ EXPORT_SYMBOL(drm_gem_shmem_put_pages);
  */
 int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
 {
+	dma_resv_assert_held(shmem->base.resv);
+
 	WARN_ON(shmem->base.import_attach);
 
 	return drm_gem_shmem_get_pages(shmem);
@@ -281,14 +252,31 @@ EXPORT_SYMBOL(drm_gem_shmem_pin);
  */
 void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 {
+	dma_resv_assert_held(shmem->base.resv);
+
 	WARN_ON(shmem->base.import_attach);
 
 	drm_gem_shmem_put_pages(shmem);
 }
 EXPORT_SYMBOL(drm_gem_shmem_unpin);
 
-static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
-				     struct iosys_map *map)
+/*
+ * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM object
+ * @shmem: shmem GEM object
+ * @map: Returns the kernel virtual address of the SHMEM GEM object's backing
+ *       store.
+ *
+ * This function makes sure that a contiguous kernel virtual address mapping
+ * exists for the buffer backing the shmem GEM object. It hides the differences
+ * between dma-buf imported and natively allocated objects.
+ *
+ * Acquired mappings should be cleaned up by calling drm_gem_shmem_vunmap().
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
+		       struct iosys_map *map)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	int ret = 0;
@@ -304,6 +292,8 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 	} else {
 		pgprot_t prot = PAGE_KERNEL;
 
+		dma_resv_assert_held(shmem->base.resv);
+
 		if (shmem->vmap_use_count++ > 0) {
 			iosys_map_set_vaddr(map, shmem->vaddr);
 			return 0;
@@ -338,45 +328,30 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 
 	return ret;
 }
+EXPORT_SYMBOL(drm_gem_shmem_vmap);
 
 /*
- * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM object
+ * drm_gem_shmem_vunmap - Unmap a virtual mapping for a shmem GEM object
  * @shmem: shmem GEM object
- * @map: Returns the kernel virtual address of the SHMEM GEM object's backing
- *       store.
- *
- * This function makes sure that a contiguous kernel virtual address mapping
- * exists for the buffer backing the shmem GEM object. It hides the differences
- * between dma-buf imported and natively allocated objects.
+ * @map: Kernel virtual address where the SHMEM GEM object was mapped
  *
- * Acquired mappings should be cleaned up by calling drm_gem_shmem_vunmap().
+ * This function cleans up a kernel virtual address mapping acquired by
+ * drm_gem_shmem_vmap(). The mapping is only removed when the use count drops to
+ * zero.
  *
- * Returns:
- * 0 on success or a negative error code on failure.
+ * This function hides the differences between dma-buf imported and natively
+ * allocated objects.
  */
-int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
-		       struct iosys_map *map)
-{
-	int ret;
-
-	ret = mutex_lock_interruptible(&shmem->vmap_lock);
-	if (ret)
-		return ret;
-	ret = drm_gem_shmem_vmap_locked(shmem, map);
-	mutex_unlock(&shmem->vmap_lock);
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_gem_shmem_vmap);
-
-static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
-					struct iosys_map *map)
+void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
+			  struct iosys_map *map)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
 	if (obj->import_attach) {
 		dma_buf_vunmap(obj->import_attach->dmabuf, map);
 	} else {
+		dma_resv_assert_held(shmem->base.resv);
+
 		if (WARN_ON_ONCE(!shmem->vmap_use_count))
 			return;
 
@@ -389,26 +364,6 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 
 	shmem->vaddr = NULL;
 }
-
-/*
- * drm_gem_shmem_vunmap - Unmap a virtual mapping for a shmem GEM object
- * @shmem: shmem GEM object
- * @map: Kernel virtual address where the SHMEM GEM object was mapped
- *
- * This function cleans up a kernel virtual address mapping acquired by
- * drm_gem_shmem_vmap(). The mapping is only removed when the use count drops to
- * zero.
- *
- * This function hides the differences between dma-buf imported and natively
- * allocated objects.
- */
-void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
-			  struct iosys_map *map)
-{
-	mutex_lock(&shmem->vmap_lock);
-	drm_gem_shmem_vunmap_locked(shmem, map);
-	mutex_unlock(&shmem->vmap_lock);
-}
 EXPORT_SYMBOL(drm_gem_shmem_vunmap);
 
 static struct drm_gem_shmem_object *
@@ -441,24 +396,24 @@ drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
  */
 int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
 {
-	mutex_lock(&shmem->pages_lock);
+	dma_resv_assert_held(shmem->base.resv);
 
 	if (shmem->madv >= 0)
 		shmem->madv = madv;
 
 	madv = shmem->madv;
 
-	mutex_unlock(&shmem->pages_lock);
-
 	return (madv >= 0);
 }
 EXPORT_SYMBOL(drm_gem_shmem_madvise);
 
-void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
+void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	struct drm_device *dev = obj->dev;
 
+	dma_resv_assert_held(shmem->base.resv);
+
 	WARN_ON(!drm_gem_shmem_is_purgeable(shmem));
 
 	dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
@@ -466,7 +421,7 @@ void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
 	kfree(shmem->sgt);
 	shmem->sgt = NULL;
 
-	drm_gem_shmem_put_pages_locked(shmem);
+	drm_gem_shmem_put_pages(shmem);
 
 	shmem->madv = -1;
 
@@ -482,17 +437,6 @@ void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
 
 	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping, 0, (loff_t)-1);
 }
-EXPORT_SYMBOL(drm_gem_shmem_purge_locked);
-
-bool drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
-{
-	if (!mutex_trylock(&shmem->pages_lock))
-		return false;
-	drm_gem_shmem_purge_locked(shmem);
-	mutex_unlock(&shmem->pages_lock);
-
-	return true;
-}
 EXPORT_SYMBOL(drm_gem_shmem_purge);
 
 /**
@@ -548,7 +492,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	/* We don't use vmf->pgoff since that has the fake offset */
 	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
 
-	mutex_lock(&shmem->pages_lock);
+	dma_resv_lock(shmem->base.resv, NULL);
 
 	if (page_offset >= num_pages ||
 	    WARN_ON_ONCE(!shmem->pages) ||
@@ -560,7 +504,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
 	}
 
-	mutex_unlock(&shmem->pages_lock);
+	dma_resv_unlock(shmem->base.resv);
 
 	return ret;
 }
@@ -573,8 +517,10 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 
 	WARN_ON(shmem->base.import_attach);
 
+	dma_resv_lock(shmem->base.resv, NULL);
 	ret = drm_gem_shmem_get_pages(shmem);
 	WARN_ON_ONCE(ret != 0);
+	dma_resv_unlock(shmem->base.resv);
 
 	drm_gem_vm_open(vma);
 }
@@ -584,7 +530,10 @@ static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
 	struct drm_gem_object *obj = vma->vm_private_data;
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
+	dma_resv_lock(shmem->base.resv, NULL);
 	drm_gem_shmem_put_pages(shmem);
+	dma_resv_unlock(shmem->base.resv);
+
 	drm_gem_vm_close(vma);
 }
 
@@ -700,9 +649,11 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
 
 	WARN_ON(obj->import_attach);
 
+	dma_resv_lock(shmem->base.resv, NULL);
+
 	ret = drm_gem_shmem_get_pages(shmem);
 	if (ret)
-		return ERR_PTR(ret);
+		goto err_unlock;
 
 	sgt = drm_gem_shmem_get_sg_table(shmem);
 	if (IS_ERR(sgt)) {
@@ -716,6 +667,8 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
 
 	shmem->sgt = sgt;
 
+	dma_resv_unlock(shmem->base.resv);
+
 	return sgt;
 
 err_free_sgt:
@@ -723,6 +676,8 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
 	kfree(sgt);
 err_put_pages:
 	drm_gem_shmem_put_pages(shmem);
+err_unlock:
+	dma_resv_unlock(shmem->base.resv);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_get_pages_sgt);
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 0f1ca0b0db49..5008f0c2428f 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -34,7 +34,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 
 	new_size = min(new_size, bo->base.base.size);
 
-	mutex_lock(&bo->base.pages_lock);
+	dma_resv_lock(bo->base.base.resv, NULL);
 
 	if (bo->base.pages) {
 		pages = bo->base.pages;
@@ -42,7 +42,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 		pages = kvmalloc_array(bo->base.base.size >> PAGE_SHIFT,
 				       sizeof(*pages), GFP_KERNEL | __GFP_ZERO);
 		if (!pages) {
-			mutex_unlock(&bo->base.pages_lock);
+			dma_resv_unlock(bo->base.base.resv);
 			return -ENOMEM;
 		}
 
@@ -56,13 +56,13 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 		struct page *page = shmem_read_mapping_page(mapping, i);
 
 		if (IS_ERR(page)) {
-			mutex_unlock(&bo->base.pages_lock);
+			dma_resv_unlock(bo->base.base.resv);
 			return PTR_ERR(page);
 		}
 		pages[i] = page;
 	}
 
-	mutex_unlock(&bo->base.pages_lock);
+	dma_resv_unlock(bo->base.base.resv);
 
 	ret = sg_alloc_table_from_pages(&sgt, pages, i, 0,
 					new_size, GFP_KERNEL);
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index e82931712d8a..ff003403fbbc 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -371,7 +371,7 @@ static void lima_sched_build_error_task_list(struct lima_sched_task *task)
 		} else {
 			buffer_chunk->size = lima_bo_size(bo);
 
-			ret = drm_gem_shmem_vmap(&bo->base, &map);
+			ret = drm_gem_vmap_unlocked(&bo->base.base, &map);
 			if (ret) {
 				kvfree(et);
 				goto out;
@@ -379,7 +379,7 @@ static void lima_sched_build_error_task_list(struct lima_sched_task *task)
 
 			memcpy(buffer_chunk + 1, map.vaddr, buffer_chunk->size);
 
-			drm_gem_shmem_vunmap(&bo->base, &map);
+			drm_gem_vunmap_unlocked(&bo->base.base, &map);
 		}
 
 		buffer_chunk = (void *)(buffer_chunk + 1) + buffer_chunk->size;
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index b1e6d238674f..859e240161d1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -405,6 +405,10 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 
 	bo = to_panfrost_bo(gem_obj);
 
+	ret = dma_resv_lock_interruptible(bo->base.base.resv, NULL);
+	if (ret)
+		goto out_put_object;
+
 	mutex_lock(&pfdev->shrinker_lock);
 	mutex_lock(&bo->mappings.lock);
 	if (args->madv == PANFROST_MADV_DONTNEED) {
@@ -442,7 +446,8 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 out_unlock_mappings:
 	mutex_unlock(&bo->mappings.lock);
 	mutex_unlock(&pfdev->shrinker_lock);
-
+	dma_resv_unlock(bo->base.base.resv);
+out_put_object:
 	drm_gem_object_put(gem_obj);
 	return ret;
 }
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
index 77e7cb6d1ae3..a4bedfeb2ec4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
@@ -48,14 +48,14 @@ static bool panfrost_gem_purge(struct drm_gem_object *obj)
 	if (!mutex_trylock(&bo->mappings.lock))
 		return false;
 
-	if (!mutex_trylock(&shmem->pages_lock))
+	if (!dma_resv_trylock(shmem->base.resv))
 		goto unlock_mappings;
 
 	panfrost_gem_teardown_mappings_locked(bo);
-	drm_gem_shmem_purge_locked(&bo->base);
+	drm_gem_shmem_purge(&bo->base);
 	ret = true;
 
-	mutex_unlock(&shmem->pages_lock);
+	dma_resv_unlock(shmem->base.resv);
 
 unlock_mappings:
 	mutex_unlock(&bo->mappings.lock);
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index b285a8001b1d..e164017e84cd 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -424,6 +424,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	struct panfrost_gem_mapping *bomapping;
 	struct panfrost_gem_object *bo;
 	struct address_space *mapping;
+	struct drm_gem_object *obj;
 	pgoff_t page_offset;
 	struct sg_table *sgt;
 	struct page **pages;
@@ -446,15 +447,16 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	page_offset = addr >> PAGE_SHIFT;
 	page_offset -= bomapping->mmnode.start;
 
-	mutex_lock(&bo->base.pages_lock);
+	obj = &bo->base.base;
+
+	dma_resv_lock(obj->resv, NULL);
 
 	if (!bo->base.pages) {
 		bo->sgts = kvmalloc_array(bo->base.base.size / SZ_2M,
 				     sizeof(struct sg_table), GFP_KERNEL | __GFP_ZERO);
 		if (!bo->sgts) {
-			mutex_unlock(&bo->base.pages_lock);
 			ret = -ENOMEM;
-			goto err_bo;
+			goto err_unlock;
 		}
 
 		pages = kvmalloc_array(bo->base.base.size >> PAGE_SHIFT,
@@ -462,9 +464,8 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		if (!pages) {
 			kvfree(bo->sgts);
 			bo->sgts = NULL;
-			mutex_unlock(&bo->base.pages_lock);
 			ret = -ENOMEM;
-			goto err_bo;
+			goto err_unlock;
 		}
 		bo->base.pages = pages;
 		bo->base.pages_use_count = 1;
@@ -472,7 +473,6 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		pages = bo->base.pages;
 		if (pages[page_offset]) {
 			/* Pages are already mapped, bail out. */
-			mutex_unlock(&bo->base.pages_lock);
 			goto out;
 		}
 	}
@@ -483,14 +483,11 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	for (i = page_offset; i < page_offset + NUM_FAULT_PAGES; i++) {
 		pages[i] = shmem_read_mapping_page(mapping, i);
 		if (IS_ERR(pages[i])) {
-			mutex_unlock(&bo->base.pages_lock);
 			ret = PTR_ERR(pages[i]);
 			goto err_pages;
 		}
 	}
 
-	mutex_unlock(&bo->base.pages_lock);
-
 	sgt = &bo->sgts[page_offset / (SZ_2M / PAGE_SIZE)];
 	ret = sg_alloc_table_from_pages(sgt, pages + page_offset,
 					NUM_FAULT_PAGES, 0, SZ_2M, GFP_KERNEL);
@@ -509,6 +506,8 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	dev_dbg(pfdev->dev, "mapped page fault @ AS%d %llx", as, addr);
 
 out:
+	dma_resv_unlock(obj->resv);
+
 	panfrost_gem_mapping_put(bomapping);
 
 	return 0;
@@ -517,6 +516,8 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	sg_free_table(sgt);
 err_pages:
 	drm_gem_shmem_put_pages(&bo->base);
+err_unlock:
+	dma_resv_unlock(obj->resv);
 err_bo:
 	panfrost_gem_mapping_put(bomapping);
 	return ret;
diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index bc0df93f7f21..ba9b6e2b2636 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -106,7 +106,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 		goto err_close_bo;
 	}
 
-	ret = drm_gem_shmem_vmap(bo, &map);
+	ret = drm_gem_vmap_unlocked(&bo->base, &map);
 	if (ret)
 		goto err_put_mapping;
 	perfcnt->buf = map.vaddr;
@@ -165,7 +165,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 	return 0;
 
 err_vunmap:
-	drm_gem_shmem_vunmap(bo, &map);
+	drm_gem_vunmap_unlocked(&bo->base, &map);
 err_put_mapping:
 	panfrost_gem_mapping_put(perfcnt->mapping);
 err_close_bo:
@@ -195,7 +195,7 @@ static int panfrost_perfcnt_disable_locked(struct panfrost_device *pfdev,
 		  GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_OFF));
 
 	perfcnt->user = NULL;
-	drm_gem_shmem_vunmap(&perfcnt->mapping->obj->base, &map);
+	drm_gem_vunmap_unlocked(&perfcnt->mapping->obj->base.base, &map);
 	perfcnt->buf = NULL;
 	panfrost_gem_close(&perfcnt->mapping->obj->base.base, file_priv);
 	panfrost_mmu_as_put(pfdev, perfcnt->mapping->mmu);
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index d0a57853c188..9a8983ee8abe 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -26,11 +26,6 @@ struct drm_gem_shmem_object {
 	 */
 	struct drm_gem_object base;
 
-	/**
-	 * @pages_lock: Protects the page table and use count
-	 */
-	struct mutex pages_lock;
-
 	/**
 	 * @pages: Page table
 	 */
@@ -79,11 +74,6 @@ struct drm_gem_shmem_object {
 	 */
 	struct sg_table *sgt;
 
-	/**
-	 * @vmap_lock: Protects the vmap address and use count
-	 */
-	struct mutex vmap_lock;
-
 	/**
 	 * @vaddr: Kernel virtual address of the backing memory
 	 */
@@ -109,7 +99,6 @@ struct drm_gem_shmem_object {
 struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size);
 void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
 
-int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem);
@@ -128,8 +117,7 @@ static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem
 		!shmem->base.dma_buf && !shmem->base.import_attach;
 }
 
-void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem);
-bool drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);
+void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);
 
 struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem);
 struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem);
-- 
2.35.3

