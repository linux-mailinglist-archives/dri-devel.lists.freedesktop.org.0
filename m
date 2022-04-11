Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6084FC72F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 00:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B970D10E389;
	Mon, 11 Apr 2022 22:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E41510E366
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 22:00:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 876151F438CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649714433;
 bh=/K/9dcREecPMUsw0K2kYNPeisYWPe0Wev+n2P9euta4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y1tj5hcs+44imub0sB1JHFFB8ZzXYa0dsxBnyoJJuAIOoS5jjBX3JanF4UbWfKSNw
 iAs14HpGl9/rd9BXFUJuDpyYAIlHa/j0bg1m5woVDddBziiT80GB9W5fO5ZxXjymq6
 s46qucF8ZrFGINjQEEmSLIDxuCVPJ+Nzc9RLQsKurV7phbQp3jA94ru0WgB8n4c/K5
 4Kai5C0qrMshzdxsx3T6WQKhjSIGUN/naKikUriSAb7YRC2C4WsGskLQum2yhMNS2F
 lp9Wi2JYbgQtjhbYtdZTkcuLaUlhLV9lWyz5pgRKo9zmQxWD+1TUjQXXxYQGgs/j/h
 bQmF+rbcvHCwA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH v3 10/15] drm/shmem-helper: Take reservation lock instead of
 drm_gem_shmem locks
Date: Tue, 12 Apr 2022 00:59:32 +0300
Message-Id: <20220411215937.281655-11-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411215937.281655-1-dmitry.osipenko@collabora.com>
References: <20220411215937.281655-1-dmitry.osipenko@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace drm_gem_shmem locks with the reservation lock to make GEM
lockings more consistent.

Previously drm_gem_shmem_vmap() and drm_gem_shmem_get_pages() were
protected by separate locks, now it's the same lock, but it doesn't
make any difference for the current GEM SHMEM users. Only Panfrost
and Lima drivers use vmap() and they do it in the slow code paths,
hence there was no practical justification for the usage of separate
lock in the vmap().

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c  | 38 ++++++++++++-------------
 drivers/gpu/drm/lima/lima_gem.c         |  8 +++---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 15 ++++++----
 include/drm/drm_gem_shmem_helper.h      | 10 -------
 4 files changed, 31 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 30ee46348a99..3ecef571eff3 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -86,8 +86,6 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
 	if (ret)
 		goto err_release;
 
-	mutex_init(&shmem->pages_lock);
-	mutex_init(&shmem->vmap_lock);
 	INIT_LIST_HEAD(&shmem->madv_list);
 
 	if (!private) {
@@ -157,8 +155,6 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 	WARN_ON(shmem->pages_use_count);
 
 	drm_gem_object_release(obj);
-	mutex_destroy(&shmem->pages_lock);
-	mutex_destroy(&shmem->vmap_lock);
 	kfree(shmem);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
@@ -209,11 +205,11 @@ int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 
 	WARN_ON(shmem->base.import_attach);
 
-	ret = mutex_lock_interruptible(&shmem->pages_lock);
+	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
 	if (ret)
 		return ret;
 	ret = drm_gem_shmem_get_pages_locked(shmem);
-	mutex_unlock(&shmem->pages_lock);
+	dma_resv_unlock(shmem->base.resv);
 
 	return ret;
 }
@@ -248,9 +244,9 @@ static void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
  */
 void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
 {
-	mutex_lock(&shmem->pages_lock);
+	dma_resv_lock(shmem->base.resv, NULL);
 	drm_gem_shmem_put_pages_locked(shmem);
-	mutex_unlock(&shmem->pages_lock);
+	dma_resv_unlock(shmem->base.resv);
 }
 EXPORT_SYMBOL(drm_gem_shmem_put_pages);
 
@@ -310,7 +306,7 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 	} else {
 		pgprot_t prot = PAGE_KERNEL;
 
-		ret = drm_gem_shmem_get_pages(shmem);
+		ret = drm_gem_shmem_get_pages_locked(shmem);
 		if (ret)
 			goto err_zero_use;
 
@@ -360,11 +356,11 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 {
 	int ret;
 
-	ret = mutex_lock_interruptible(&shmem->vmap_lock);
+	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
 	if (ret)
 		return ret;
 	ret = drm_gem_shmem_vmap_locked(shmem, map);
-	mutex_unlock(&shmem->vmap_lock);
+	dma_resv_unlock(shmem->base.resv);
 
 	return ret;
 }
@@ -385,7 +381,7 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 		dma_buf_vunmap(obj->import_attach->dmabuf, map);
 	} else {
 		vunmap(shmem->vaddr);
-		drm_gem_shmem_put_pages(shmem);
+		drm_gem_shmem_put_pages_locked(shmem);
 	}
 
 	shmem->vaddr = NULL;
@@ -406,9 +402,11 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
 			  struct iosys_map *map)
 {
-	mutex_lock(&shmem->vmap_lock);
+	dma_resv_lock(shmem->base.resv, NULL);
 	drm_gem_shmem_vunmap_locked(shmem, map);
-	mutex_unlock(&shmem->vmap_lock);
+	dma_resv_unlock(shmem->base.resv);
+
+	drm_gem_shmem_update_purgeable_status(shmem);
 }
 EXPORT_SYMBOL(drm_gem_shmem_vunmap);
 
@@ -442,14 +440,14 @@ drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
  */
 int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
 {
-	mutex_lock(&shmem->pages_lock);
+	dma_resv_lock(shmem->base.resv, NULL);
 
 	if (shmem->madv >= 0)
 		shmem->madv = madv;
 
 	madv = shmem->madv;
 
-	mutex_unlock(&shmem->pages_lock);
+	dma_resv_unlock(shmem->base.resv);
 
 	return (madv >= 0);
 }
@@ -487,10 +485,10 @@ EXPORT_SYMBOL(drm_gem_shmem_purge_locked);
 
 bool drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
 {
-	if (!mutex_trylock(&shmem->pages_lock))
+	if (!dma_resv_trylock(shmem->base.resv))
 		return false;
 	drm_gem_shmem_purge_locked(shmem);
-	mutex_unlock(&shmem->pages_lock);
+	dma_resv_unlock(shmem->base.resv);
 
 	return true;
 }
@@ -549,7 +547,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	/* We don't use vmf->pgoff since that has the fake offset */
 	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
 
-	mutex_lock(&shmem->pages_lock);
+	dma_resv_lock(shmem->base.resv, NULL);
 
 	if (page_offset >= num_pages ||
 	    WARN_ON_ONCE(!shmem->pages) ||
@@ -561,7 +559,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
 	}
 
-	mutex_unlock(&shmem->pages_lock);
+	dma_resv_unlock(shmem->base.resv);
 
 	return ret;
 }
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
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index d3f82b26a631..404b8f67e2df 100644
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
@@ -446,13 +447,15 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
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
+			dma_resv_unlock(obj->resv);
 			ret = -ENOMEM;
 			goto err_bo;
 		}
@@ -462,7 +465,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		if (!pages) {
 			kvfree(bo->sgts);
 			bo->sgts = NULL;
-			mutex_unlock(&bo->base.pages_lock);
+			dma_resv_unlock(obj->resv);
 			ret = -ENOMEM;
 			goto err_bo;
 		}
@@ -472,7 +475,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		pages = bo->base.pages;
 		if (pages[page_offset]) {
 			/* Pages are already mapped, bail out. */
-			mutex_unlock(&bo->base.pages_lock);
+			dma_resv_unlock(obj->resv);
 			goto out;
 		}
 	}
@@ -483,13 +486,13 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	for (i = page_offset; i < page_offset + NUM_FAULT_PAGES; i++) {
 		pages[i] = shmem_read_mapping_page(mapping, i);
 		if (IS_ERR(pages[i])) {
-			mutex_unlock(&bo->base.pages_lock);
+			dma_resv_unlock(obj->resv);
 			ret = PTR_ERR(pages[i]);
 			goto err_pages;
 		}
 	}
 
-	mutex_unlock(&bo->base.pages_lock);
+	dma_resv_unlock(obj->resv);
 
 	sgt = &bo->sgts[page_offset / (SZ_2M / PAGE_SIZE)];
 	ret = sg_alloc_table_from_pages(sgt, pages + page_offset,
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index d0a57853c188..70889533962a 100644
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
-- 
2.35.1

