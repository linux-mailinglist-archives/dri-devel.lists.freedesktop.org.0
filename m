Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CEA61DFAE
	for <lists+dri-devel@lfdr.de>; Sun,  6 Nov 2022 00:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB4210E188;
	Sat,  5 Nov 2022 23:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E5110E184
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Nov 2022 23:29:11 +0000 (UTC)
Received: from dimapc.. (109-252-117-140.nat.spd-mgts.ru [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 43C6A660296D;
 Sat,  5 Nov 2022 23:29:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667690950;
 bh=+5luY7AFLXPE+oEFyStkQbFGF0NtUHM4C6ZE+JJ9kh4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RlM5s7sgmz4BMt8nLTaALoMab/z01Cp6G6DdpFl/V6/JhSvY7RRlds+nVagBnU4aI
 JfIZpDiDKMKavBIrYazDGMsuyIJcAwWb5ayPu2Fj9AfRdqwbuHXoTPptHplHNggrUb
 /0ffw8b/ADq/mFIFOJkng152oDcpA4rdlfhm846/Bu4vNelPTplECqfLEYtiUkP3Tk
 glU2sUkUysPq4v894Sa4Q/LoHmTwAQrUm2Wkv31prEiOOchU+W+NRUWASuV6hL73tP
 8m3YZ0QeyepUJmHwHSLMZQl2BOOWm6oOS7y2r9Lrv2uAK9lKIK5BVnBnvtukuatdrK
 +hk1zSgZYkdbg==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v8 4/7] drm/shmem-helper: Add memory shrinker
Date: Sun,  6 Nov 2022 02:27:16 +0300
Message-Id: <20221105232719.302619-5-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221105232719.302619-1-dmitry.osipenko@collabora.com>
References: <20221105232719.302619-1-dmitry.osipenko@collabora.com>
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
Cc: Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce common drm-shmem shrinker for DRM drivers.

To start using drm-shmem shrinker drivers should do the following:

1. Implement evict() callback of shmem object where driver should check
   whether object is purgeable or evictable and perform shrinking action
2. Register shrinker using drm_gem_shmem_shrinker_register(drm_device)
3. Use drm_gem_shmem_set_purgeable(shmem) and alike API functions to
   activate shrinking of shmem GEMs

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c        | 493 ++++++++++++++++--
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |   9 +-
 include/drm/drm_device.h                      |   4 +
 include/drm/drm_gem_shmem_helper.h            |  87 +++-
 4 files changed, 539 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index d6e62f228989..b09d620d14fd 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -126,6 +126,54 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
 
+static void drm_gem_shmem_resv_assert_held(struct drm_gem_shmem_object *shmem)
+{
+	/*
+	 * Destroying the object is a special case.. drm_gem_shmem_free()
+	 * calls many things that WARN_ON if the obj lock is not held.  But
+	 * acquiring the obj lock in drm_gem_shmem_free() can cause a locking
+	 * order inversion between reservation_ww_class_mutex and fs_reclaim.
+	 *
+	 * This deadlock is not actually possible, because no one should
+	 * be already holding the lock when msm_gem_free_object() is called.
+	 * Unfortunately lockdep is not aware of this detail.  So when the
+	 * refcount drops to zero, we pretend it is already locked.
+	 */
+	if (kref_read(&shmem->base.refcount))
+		dma_resv_assert_held(shmem->base.resv);
+}
+
+static bool drm_gem_shmem_is_evictable(struct drm_gem_shmem_object *shmem)
+{
+	return (shmem->madv >= 0) && shmem->evict &&
+		shmem->eviction_enabled && shmem->pages_use_count &&
+		!shmem->pages_pin_count && !shmem->base.dma_buf &&
+		!shmem->base.import_attach && shmem->sgt && !shmem->evicted;
+}
+
+static void
+drm_gem_shmem_update_pages_state(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	struct drm_gem_shmem_shrinker *gem_shrinker = obj->dev->shmem_shrinker;
+
+	drm_gem_shmem_resv_assert_held(shmem);
+
+	if (!gem_shrinker || obj->import_attach)
+		return;
+
+	if (drm_gem_shmem_is_evictable(shmem) || drm_gem_shmem_is_purgeable(shmem))
+		drm_gem_lru_move_tail(&gem_shrinker->lru_evictable, &shmem->base);
+	else if (shmem->madv < 0)
+		drm_gem_lru_remove(&shmem->base);
+	else if (shmem->evicted)
+		drm_gem_lru_move_tail(&gem_shrinker->lru_evicted, &shmem->base);
+	else if (!shmem->pages)
+		drm_gem_lru_remove(&shmem->base);
+	else
+		drm_gem_lru_move_tail(&gem_shrinker->lru_pinned, &shmem->base);
+}
+
 /**
  * drm_gem_shmem_free - Free resources associated with a shmem GEM object
  * @shmem: shmem GEM object to free
@@ -140,7 +188,8 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 	if (obj->import_attach) {
 		drm_prime_gem_destroy(obj, shmem->sgt);
 	} else {
-		dma_resv_lock(shmem->base.resv, NULL);
+		/* take out shmem GEM object from the memory shrinker */
+		drm_gem_shmem_madvise(shmem, -1);
 
 		WARN_ON(shmem->vmap_use_count);
 
@@ -150,12 +199,10 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 			sg_free_table(shmem->sgt);
 			kfree(shmem->sgt);
 		}
-		if (shmem->pages)
+		if (shmem->pages_use_count)
 			drm_gem_shmem_put_pages(shmem);
 
 		WARN_ON(shmem->pages_use_count);
-
-		dma_resv_unlock(shmem->base.resv);
 	}
 
 	drm_gem_object_release(obj);
@@ -163,18 +210,86 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
 
-static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
+/**
+ * drm_gem_shmem_set_evictable() - Make GEM evictable by memory shrinker
+ * @shmem: shmem GEM object
+ *
+ * Tell memory shrinker that this GEM can be evicted. Initially eviction is
+ * disabled for all GEMs. If GEM was purged, then -ENOMEM is returned.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_shmem_set_evictable(struct drm_gem_shmem_object *shmem)
+{
+	dma_resv_lock(shmem->base.resv, NULL);
+
+	if (shmem->madv < 0) {
+		dma_resv_unlock(shmem->base.resv);
+		return -ENOMEM;
+	}
+
+	shmem->eviction_enabled = true;
+
+	dma_resv_unlock(shmem->base.resv);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_set_evictable);
+
+/**
+ * drm_gem_shmem_set_purgeable() - Make GEM purgeable by memory shrinker
+ * @shmem: shmem GEM object
+ *
+ * Tell memory shrinker that this GEM can be purged. Initially purging is
+ * disabled for all GEMs. If GEM was purged, then -ENOMEM is returned.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_shmem_set_purgeable(struct drm_gem_shmem_object *shmem)
+{
+	dma_resv_lock(shmem->base.resv, NULL);
+
+	if (shmem->madv < 0) {
+		dma_resv_unlock(shmem->base.resv);
+		return -ENOMEM;
+	}
+
+	shmem->purge_enabled = true;
+
+	drm_gem_shmem_update_pages_state(shmem);
+
+	dma_resv_unlock(shmem->base.resv);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_set_purgeable);
+
+static int
+drm_gem_shmem_acquire_pages(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	struct page **pages;
 
-	if (shmem->pages_use_count++ > 0)
+	dma_resv_assert_held(shmem->base.resv);
+
+	if (shmem->madv < 0) {
+		WARN_ON(shmem->pages);
+		return -ENOMEM;
+	}
+
+	if (shmem->pages) {
+		WARN_ON(!shmem->evicted);
 		return 0;
+	}
+
+	if (WARN_ON(!shmem->pages_use_count))
+		return -EINVAL;
 
 	pages = drm_gem_get_pages(obj);
 	if (IS_ERR(pages)) {
 		DRM_DEBUG_KMS("Failed to get pages (%ld)\n", PTR_ERR(pages));
-		shmem->pages_use_count = 0;
 		return PTR_ERR(pages);
 	}
 
@@ -193,23 +308,46 @@ static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 	return 0;
 }
 
-/*
- * drm_gem_shmem_put_pages - Decrease use count on the backing pages for a shmem GEM object
- * @shmem: shmem GEM object
- *
- * This function decreases the use count and puts the backing pages when use drops to zero.
- */
-void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
+static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 {
-	struct drm_gem_object *obj = &shmem->base;
+	int err;
 
 	dma_resv_assert_held(shmem->base.resv);
 
-	if (WARN_ON_ONCE(!shmem->pages_use_count))
-		return;
+	if (shmem->madv < 0)
+		return -ENOMEM;
 
-	if (--shmem->pages_use_count > 0)
+	if (shmem->pages_use_count++ > 0) {
+		err = drm_gem_shmem_swap_in(shmem);
+		if (err)
+			goto err_zero_use;
+
+		return 0;
+	}
+
+	err = drm_gem_shmem_acquire_pages(shmem);
+	if (err)
+		goto err_zero_use;
+
+	drm_gem_shmem_update_pages_state(shmem);
+
+	return 0;
+
+err_zero_use:
+	shmem->pages_use_count = 0;
+
+	return err;
+}
+
+static void
+drm_gem_shmem_release_pages(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+
+	if (!shmem->pages) {
+		WARN_ON(!shmem->evicted && shmem->madv >= 0);
 		return;
+	}
 
 #ifdef CONFIG_X86
 	if (shmem->map_wc)
@@ -221,6 +359,27 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
 			  shmem->pages_mark_accessed_on_put);
 	shmem->pages = NULL;
 }
+
+/*
+ * drm_gem_shmem_put_pages - Decrease use count on the backing pages for a shmem GEM object
+ * @shmem: shmem GEM object
+ *
+ * This function decreases the use count and puts the backing pages when use drops to zero.
+ */
+void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
+{
+	drm_gem_shmem_resv_assert_held(shmem);
+
+	if (WARN_ON_ONCE(!shmem->pages_use_count))
+		return;
+
+	if (--shmem->pages_use_count > 0)
+		return;
+
+	drm_gem_shmem_release_pages(shmem);
+
+	drm_gem_shmem_update_pages_state(shmem);
+}
 EXPORT_SYMBOL(drm_gem_shmem_put_pages);
 
 /**
@@ -235,11 +394,17 @@ EXPORT_SYMBOL(drm_gem_shmem_put_pages);
  */
 int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
 {
+	int ret;
+
 	dma_resv_assert_held(shmem->base.resv);
 
 	WARN_ON(shmem->base.import_attach);
 
-	return drm_gem_shmem_get_pages(shmem);
+	ret = drm_gem_shmem_get_pages(shmem);
+	if (!ret)
+		shmem->pages_pin_count++;
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_shmem_pin);
 
@@ -257,6 +422,8 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 	WARN_ON(shmem->base.import_attach);
 
 	drm_gem_shmem_put_pages(shmem);
+
+	shmem->pages_pin_count--;
 }
 EXPORT_SYMBOL(drm_gem_shmem_unpin);
 
@@ -299,7 +466,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 			return 0;
 		}
 
-		ret = drm_gem_shmem_get_pages(shmem);
+		ret = drm_gem_shmem_pin(shmem);
 		if (ret)
 			goto err_zero_use;
 
@@ -322,7 +489,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 
 err_put_pages:
 	if (!obj->import_attach)
-		drm_gem_shmem_put_pages(shmem);
+		drm_gem_shmem_unpin(shmem);
 err_zero_use:
 	shmem->vmap_use_count = 0;
 
@@ -359,7 +526,7 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
 			return;
 
 		vunmap(shmem->vaddr);
-		drm_gem_shmem_put_pages(shmem);
+		drm_gem_shmem_unpin(shmem);
 	}
 
 	shmem->vaddr = NULL;
@@ -396,48 +563,84 @@ drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
  */
 int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
 {
-	dma_resv_assert_held(shmem->base.resv);
+	drm_gem_shmem_resv_assert_held(shmem);
 
 	if (shmem->madv >= 0)
 		shmem->madv = madv;
 
 	madv = shmem->madv;
 
+	drm_gem_shmem_update_pages_state(shmem);
+
 	return (madv >= 0);
 }
 EXPORT_SYMBOL(drm_gem_shmem_madvise);
 
-void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
+/**
+ * drm_gem_shmem_swap_in() - Moves shmem GEM back to memory and enables
+ *                           hardware access to the memory.
+ * @shmem: shmem GEM object
+ *
+ * This function moves shmem GEM back to memory if it was previously evicted
+ * by the memory shrinker. The GEM is ready to use on success.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_shmem_swap_in(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
-	struct drm_device *dev = obj->dev;
+	struct sg_table *sgt;
+	int err;
 
 	dma_resv_assert_held(shmem->base.resv);
 
-	WARN_ON(!drm_gem_shmem_is_purgeable(shmem));
+	if (shmem->evicted) {
+		err = drm_gem_shmem_acquire_pages(shmem);
+		if (err)
+			return err;
+
+		sgt = drm_gem_shmem_get_sg_table(shmem);
+		if (IS_ERR(sgt))
+			return PTR_ERR(sgt);
+
+		err = dma_map_sgtable(obj->dev->dev, sgt,
+				      DMA_BIDIRECTIONAL, 0);
+		if (err) {
+			sg_free_table(sgt);
+			kfree(sgt);
+			return err;
+		}
 
-	dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
-	sg_free_table(shmem->sgt);
-	kfree(shmem->sgt);
-	shmem->sgt = NULL;
+		shmem->sgt = sgt;
+		shmem->evicted = false;
 
-	drm_gem_shmem_put_pages(shmem);
+		drm_gem_shmem_update_pages_state(shmem);
+	}
 
-	shmem->madv = -1;
+	if (!shmem->pages)
+		return -ENOMEM;
 
-	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
-	drm_gem_free_mmap_offset(obj);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_swap_in);
 
-	/* Our goal here is to return as much of the memory as
-	 * is possible back to the system as we are called from OOM.
-	 * To do this we must instruct the shmfs to drop all of its
-	 * backing pages, *now*.
-	 */
-	shmem_truncate_range(file_inode(obj->filp), 0, (loff_t)-1);
+static void drm_gem_shmem_unpin_pages(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	struct drm_device *dev = obj->dev;
 
-	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping, 0, (loff_t)-1);
+	if (shmem->evicted)
+		return;
+
+	dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
+	drm_gem_shmem_release_pages(shmem);
+	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
+
+	sg_free_table(shmem->sgt);
+	kfree(shmem->sgt);
+	shmem->sgt = NULL;
 }
-EXPORT_SYMBOL(drm_gem_shmem_purge);
 
 /**
  * drm_gem_shmem_dumb_create - Create a dumb shmem buffer object
@@ -488,22 +691,33 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	vm_fault_t ret;
 	struct page *page;
 	pgoff_t page_offset;
+	bool pages_unpinned;
+	int err;
 
 	/* We don't use vmf->pgoff since that has the fake offset */
 	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
 
 	dma_resv_lock(shmem->base.resv, NULL);
 
-	if (page_offset >= num_pages ||
-	    WARN_ON_ONCE(!shmem->pages) ||
-	    shmem->madv < 0) {
+	/* Sanity-check that we have the pages pointer when it should present */
+	pages_unpinned = (shmem->evicted || shmem->madv < 0 || !shmem->pages_use_count);
+	WARN_ON_ONCE(!shmem->pages ^ pages_unpinned);
+
+	if (page_offset >= num_pages || (!shmem->pages && !shmem->evicted)) {
 		ret = VM_FAULT_SIGBUS;
 	} else {
+		err = drm_gem_shmem_swap_in(shmem);
+		if (err) {
+			ret = VM_FAULT_OOM;
+			goto unlock;
+		}
+
 		page = shmem->pages[page_offset];
 
 		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
 	}
 
+unlock:
 	dma_resv_unlock(shmem->base.resv);
 
 	return ret;
@@ -513,13 +727,15 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 {
 	struct drm_gem_object *obj = vma->vm_private_data;
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-	int ret;
 
 	WARN_ON(shmem->base.import_attach);
 
 	dma_resv_lock(shmem->base.resv, NULL);
-	ret = drm_gem_shmem_get_pages(shmem);
-	WARN_ON_ONCE(ret != 0);
+
+	if (drm_gem_shmem_get_pages(shmem))
+		shmem->pages_use_count++;
+
+	drm_gem_shmem_update_pages_state(shmem);
 	dma_resv_unlock(shmem->base.resv);
 
 	drm_gem_vm_open(vma);
@@ -595,6 +811,8 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap);
 void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 			      struct drm_printer *p, unsigned int indent)
 {
+	drm_printf_indent(p, indent, "eviction_enabled=%d\n", shmem->eviction_enabled);
+	drm_printf_indent(p, indent, "purge_enabled=%d\n", shmem->purge_enabled);
 	drm_printf_indent(p, indent, "pages_use_count=%u\n", shmem->pages_use_count);
 
 	if (shmem->base.import_attach)
@@ -604,7 +822,9 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 		drm_printf_indent(p, indent, "vmap_use_count=%u\n",
 				  shmem->vmap_use_count);
 
+	drm_printf_indent(p, indent, "evicted=%d\n", shmem->evicted);
 	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
+	drm_printf_indent(p, indent, "madv=%d\n", shmem->madv);
 }
 EXPORT_SYMBOL(drm_gem_shmem_print_info);
 
@@ -677,6 +897,8 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
 
 	shmem->sgt = sgt;
 
+	drm_gem_shmem_update_pages_state(shmem);
+
 	dma_resv_unlock(shmem->base.resv);
 
 	return sgt;
@@ -727,6 +949,181 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
 
+static struct drm_gem_shmem_shrinker *
+to_drm_shrinker(struct shrinker *shrinker)
+{
+	return container_of(shrinker, struct drm_gem_shmem_shrinker, base);
+}
+
+static unsigned long
+drm_gem_shmem_shrinker_count_objects(struct shrinker *shrinker,
+				     struct shrink_control *sc)
+{
+	struct drm_gem_shmem_shrinker *gem_shrinker = to_drm_shrinker(shrinker);
+	unsigned long count = gem_shrinker->lru_evictable.count;
+
+	if (count >= SHRINK_EMPTY)
+		return SHRINK_EMPTY - 1;
+
+	return count ?: SHRINK_EMPTY;
+}
+
+int drm_gem_shmem_evict(struct drm_gem_shmem_object *shmem)
+{
+	WARN_ON(!drm_gem_shmem_is_evictable(shmem));
+	WARN_ON(shmem->evicted);
+
+	drm_gem_shmem_unpin_pages(shmem);
+
+	shmem->evicted = true;
+	drm_gem_shmem_update_pages_state(shmem);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_evict);
+
+int drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+
+	WARN_ON(!drm_gem_shmem_is_purgeable(shmem));
+
+	drm_gem_shmem_unpin_pages(shmem);
+	drm_gem_free_mmap_offset(obj);
+
+	/* Our goal here is to return as much of the memory as
+	 * is possible back to the system as we are called from OOM.
+	 * To do this we must instruct the shmfs to drop all of its
+	 * backing pages, *now*.
+	 */
+	shmem_truncate_range(file_inode(obj->filp), 0, (loff_t)-1);
+
+	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping, 0, (loff_t)-1);
+
+	shmem->madv = -1;
+	shmem->evicted = false;
+	drm_gem_shmem_update_pages_state(shmem);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_purge);
+
+static bool drm_gem_shmem_shrinker_evict(struct drm_gem_object *obj)
+{
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+	int err;
+
+	if (!drm_gem_shmem_is_evictable(shmem) ||
+	    get_nr_swap_pages() < obj->size >> PAGE_SHIFT)
+		return false;
+
+	err = shmem->evict(shmem);
+	if (err)
+		return false;
+
+	return true;
+}
+
+static bool drm_gem_shmem_shrinker_purge(struct drm_gem_object *obj)
+{
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+	int err;
+
+	if (!drm_gem_shmem_is_purgeable(shmem))
+		return false;
+
+	err = shmem->evict(shmem);
+	if (err)
+		return false;
+
+	return true;
+}
+
+static unsigned long
+drm_gem_shmem_shrinker_scan_objects(struct shrinker *shrinker,
+				    struct shrink_control *sc)
+{
+	struct drm_gem_shmem_shrinker *gem_shrinker = to_drm_shrinker(shrinker);
+	unsigned long nr_to_scan = sc->nr_to_scan;
+	unsigned long remaining = 0;
+	unsigned long freed = 0;
+
+	/* purge as many objects as we can */
+	freed += drm_gem_lru_scan(&gem_shrinker->lru_evictable,
+				  nr_to_scan, &remaining,
+				  drm_gem_shmem_shrinker_purge);
+
+	/* evict as many objects as we can */
+	if (freed < nr_to_scan)
+		freed += drm_gem_lru_scan(&gem_shrinker->lru_evictable,
+					  nr_to_scan - freed, &remaining,
+					  drm_gem_shmem_shrinker_evict);
+
+	return (freed > 0 && remaining > 0) ? freed : SHRINK_STOP;
+}
+
+/**
+ * drm_gem_shmem_shrinker_register() - Register shmem shrinker
+ * @dev: DRM device
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_shmem_shrinker_register(struct drm_device *dev, const char *name)
+{
+	struct drm_gem_shmem_shrinker *gem_shrinker;
+	int err;
+
+	if (WARN_ON(dev->shmem_shrinker))
+		return -EBUSY;
+
+	gem_shrinker = kzalloc(sizeof(*gem_shrinker), GFP_KERNEL);
+	if (!gem_shrinker)
+		return -ENOMEM;
+
+	gem_shrinker->base.count_objects = drm_gem_shmem_shrinker_count_objects;
+	gem_shrinker->base.scan_objects = drm_gem_shmem_shrinker_scan_objects;
+	gem_shrinker->base.seeks = DEFAULT_SEEKS;
+	gem_shrinker->dev = dev;
+
+	mutex_init(&gem_shrinker->lock);
+	drm_gem_lru_init(&gem_shrinker->lru_evictable, &gem_shrinker->lock);
+	drm_gem_lru_init(&gem_shrinker->lru_evicted, &gem_shrinker->lock);
+	drm_gem_lru_init(&gem_shrinker->lru_pinned, &gem_shrinker->lock);
+
+	dev->shmem_shrinker = gem_shrinker;
+
+	err = register_shrinker(&gem_shrinker->base, name);
+	if (err) {
+		dev->shmem_shrinker = NULL;
+		kfree(gem_shrinker);
+		return err;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_shrinker_register);
+
+/**
+ * drm_gem_shmem_shrinker_unregister() - Unregister shmem shrinker
+ * @dev: DRM device
+ */
+void drm_gem_shmem_shrinker_unregister(struct drm_device *dev)
+{
+	struct drm_gem_shmem_shrinker *gem_shrinker = dev->shmem_shrinker;
+
+	if (gem_shrinker) {
+		unregister_shrinker(&gem_shrinker->base);
+		WARN_ON(!list_empty(&gem_shrinker->lru_evictable.list));
+		WARN_ON(!list_empty(&gem_shrinker->lru_evicted.list));
+		WARN_ON(!list_empty(&gem_shrinker->lru_pinned.list));
+		mutex_destroy(&gem_shrinker->lock);
+		dev->shmem_shrinker = NULL;
+		kfree(gem_shrinker);
+	}
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_shrinker_unregister);
+
 MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
 MODULE_IMPORT_NS(DMA_BUF);
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
index 6a71a2555f85..865a989d67c8 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
@@ -15,6 +15,13 @@
 #include "panfrost_gem.h"
 #include "panfrost_mmu.h"
 
+static bool panfrost_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
+{
+	return (shmem->madv > 0) &&
+		!shmem->pages_pin_count && shmem->sgt &&
+		!shmem->base.dma_buf && !shmem->base.import_attach;
+}
+
 static unsigned long
 panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 {
@@ -27,7 +34,7 @@ panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc
 		return 0;
 
 	list_for_each_entry(shmem, &pfdev->shrinker_list, madv_list) {
-		if (drm_gem_shmem_is_purgeable(shmem))
+		if (panfrost_gem_shmem_is_purgeable(shmem))
 			count += shmem->base.size >> PAGE_SHIFT;
 	}
 
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 9923c7a6885e..929546cad894 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -16,6 +16,7 @@ struct drm_vblank_crtc;
 struct drm_vma_offset_manager;
 struct drm_vram_mm;
 struct drm_fb_helper;
+struct drm_gem_shmem_shrinker;
 
 struct inode;
 
@@ -277,6 +278,9 @@ struct drm_device {
 	/** @vram_mm: VRAM MM memory manager */
 	struct drm_vram_mm *vram_mm;
 
+	/** @shmem_shrinker: SHMEM GEM memory shrinker */
+	struct drm_gem_shmem_shrinker *shmem_shrinker;
+
 	/**
 	 * @switch_power_state:
 	 *
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 3b055d238584..c2ed7476684c 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -6,6 +6,7 @@
 #include <linux/fs.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
+#include <linux/shrinker.h>
 
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
@@ -15,6 +16,7 @@
 struct dma_buf_attachment;
 struct drm_mode_create_dumb;
 struct drm_printer;
+struct drm_device;
 struct sg_table;
 
 /**
@@ -39,12 +41,21 @@ struct drm_gem_shmem_object {
 	 */
 	unsigned int pages_use_count;
 
+	/**
+	 * @pages_pin_count:
+	 *
+	 * Reference count on the pinned pages table.
+	 * The pages allowed to be evicted by memory shrinker
+	 * only when the count is zero.
+	 */
+	unsigned int pages_pin_count;
+
 	/**
 	 * @madv: State for madvise
 	 *
 	 * 0 is active/inuse.
+	 * 1 is not-needed/can-be-purged
 	 * A negative value is the object is purged.
-	 * Positive values are driver specific and not used by the helpers.
 	 */
 	int madv;
 
@@ -91,6 +102,39 @@ struct drm_gem_shmem_object {
 	 * @map_wc: map object write-combined (instead of using shmem defaults).
 	 */
 	bool map_wc;
+
+	/**
+	 * @eviction_enabled:
+	 *
+	 * The shmem pages can be evicted only if @eviction_enabled is set to true.
+	 * Used internally by memory shrinker.
+	 */
+	bool eviction_enabled;
+
+	/**
+	 * @purge_enabled:
+	 *
+	 * The shmem pages can be purged only if @purge_enabled is set to true.
+	 * Used internally by memory shrinker.
+	 */
+	bool purge_enabled;
+
+	/**
+	 * @evicted: True if shmem pages are evicted by the memory shrinker.
+	 * Used internally by memory shrinker.
+	 */
+	bool evicted;
+
+	/**
+	 * @evict:
+	 *
+	 * Invoked by shmem shrinker before evicting shmem GEM from memory.
+	 * GEM's DMA reservation is kept locked by the shrinker. Drivers using
+	 * drm-shmem shrinker must implement this callback.
+	 *
+	 * Returns 0 on success, or -errno on error.
+	 */
+	int (*evict)(struct drm_gem_shmem_object *shmem);
 };
 
 #define to_drm_gem_shmem_obj(obj) \
@@ -110,14 +154,21 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 
 int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv);
 
+int drm_gem_shmem_set_purgeable(struct drm_gem_shmem_object *shmem);
+int drm_gem_shmem_set_evictable(struct drm_gem_shmem_object *shmem);
+
 static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
 {
-	return (shmem->madv > 0) &&
-		!shmem->vmap_use_count && shmem->sgt &&
-		!shmem->base.dma_buf && !shmem->base.import_attach;
+	return (shmem->madv > 0) && shmem->evict &&
+		shmem->purge_enabled && shmem->pages_use_count &&
+		!shmem->pages_pin_count && !shmem->base.dma_buf &&
+		!shmem->base.import_attach && (shmem->sgt || shmem->evicted);
 }
 
-void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);
+int drm_gem_shmem_swap_in(struct drm_gem_shmem_object *shmem);
+
+int drm_gem_shmem_evict(struct drm_gem_shmem_object *shmem);
+int drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);
 
 struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem);
 struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem);
@@ -260,6 +311,32 @@ static inline int drm_gem_shmem_object_mmap(struct drm_gem_object *obj, struct v
 	return drm_gem_shmem_mmap(shmem, vma);
 }
 
+/**
+ * struct drm_gem_shmem_shrinker - Generic memory shrinker for shmem GEMs
+ */
+struct drm_gem_shmem_shrinker {
+	/** @base: Shrinker for purging shmem GEM objects */
+	struct shrinker base;
+
+	/** @lock: Protects @lru_* */
+	struct mutex lock;
+
+	/** @lru_pinned: List of pinned shmem GEM objects */
+	struct drm_gem_lru lru_pinned;
+
+	/** @lru_evictable: List of shmem GEM objects to be evicted */
+	struct drm_gem_lru lru_evictable;
+
+	/** @lru_evicted: List of evicted shmem GEM objects */
+	struct drm_gem_lru lru_evicted;
+
+	/** @dev: DRM device that uses this shrinker */
+	struct drm_device *dev;
+};
+
+int drm_gem_shmem_shrinker_register(struct drm_device *dev, const char *name);
+void drm_gem_shmem_shrinker_unregister(struct drm_device *dev);
+
 /*
  * Driver ops
  */
-- 
2.37.3

