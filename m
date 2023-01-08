Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BA26619AE
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 22:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C44E10E241;
	Sun,  8 Jan 2023 21:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1118110E241
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 21:05:58 +0000 (UTC)
Received: from workpc.. (109-252-117-89.nat.spd-mgts.ru [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A57966602CE8;
 Sun,  8 Jan 2023 21:05:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673211956;
 bh=7CIYKvJiA7jp/S3WS4uZXYMthK4fNaD853WLSHQNBsg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WydxIH0EDVScqUbwBFVLzN7K6uI0hVVBnjOXap5EpzvHIpHP7rZ8nxnd3ULDqUR0x
 OINHy1gDfxA81bBesDrONXY69kEaplsTObTMTq4ewOoG2FVdls8JbQGCA+u9YvBQHY
 AUPOgsKv3viBBCEw0XdQ76ILxH9tTJoc73U84kcwoe+I68DD4IX2lqWQNwe/tM6s44
 AmJwkthVktNAlzGi7sv+IVELJSRR79B1vwvEiC5RtD8DjdcDUcTS1PGTbb2EW0WKVN
 jmv3LmRosdpMuELUrA52XW6An9wYW5RFg/hNIJOZSlARb+flHy/icGCNbOH81JOS0N
 /d8PC/+/JN+mA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
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
Subject: [PATCH v10 08/11] drm/shmem-helper: Add memory shrinker
Date: Mon,  9 Jan 2023 00:04:42 +0300
Message-Id: <20230108210445.3948344-9-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
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

Introduce common drm-shmem shrinker for DRM drivers.

To start using drm-shmem shrinker drivers should do the following:

1. Implement evict() callback of GEM object where driver should check
   whether object is purgeable or evictable using drm-shmem helpers and
   perform the shrinking action

2. Initialize drm-shmem internals using drmm_gem_shmem_init(drm_device),
   which will register drm-shmem shrinker

3. Implement madvise IOCTL that will use drm_gem_shmem_madvise()

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c        | 460 ++++++++++++++++--
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |   9 +-
 include/drm/drm_device.h                      |  10 +-
 include/drm/drm_gem_shmem_helper.h            |  61 ++-
 4 files changed, 490 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index a1f2f2158c50..3ab5ec325ddb 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -20,6 +20,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_print.h>
 
@@ -128,6 +129,57 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
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
+	dma_resv_assert_held(shmem->base.resv);
+
+	return (shmem->madv >= 0) && shmem->base.funcs->evict &&
+		shmem->pages_use_count && !shmem->pages_pin_count &&
+		!shmem->base.dma_buf && !shmem->base.import_attach &&
+		shmem->sgt && !shmem->evicted;
+}
+
+static void
+drm_gem_shmem_update_pages_state(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	struct drm_gem_shmem *shmem_mm = obj->dev->shmem_mm;
+	struct drm_gem_shmem_shrinker *gem_shrinker = &shmem_mm->shrinker;
+
+	drm_gem_shmem_resv_assert_held(shmem);
+
+	if (!gem_shrinker || obj->import_attach)
+		return;
+
+	if (shmem->madv < 0)
+		drm_gem_lru_remove(&shmem->base);
+	else if (drm_gem_shmem_is_evictable(shmem) || drm_gem_shmem_is_purgeable(shmem))
+		drm_gem_lru_move_tail(&gem_shrinker->lru_evictable, &shmem->base);
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
@@ -142,7 +194,8 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 	if (obj->import_attach) {
 		drm_prime_gem_destroy(obj, shmem->sgt);
 	} else {
-		dma_resv_lock(shmem->base.resv, NULL);
+		/* take out shmem GEM object from the memory shrinker */
+		drm_gem_shmem_madvise(shmem, -1);
 
 		drm_WARN_ON(obj->dev, shmem->vmap_use_count);
 
@@ -152,12 +205,10 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 			sg_free_table(shmem->sgt);
 			kfree(shmem->sgt);
 		}
-		if (shmem->pages)
+		if (shmem->pages_use_count)
 			drm_gem_shmem_put_pages(shmem);
 
 		drm_WARN_ON(obj->dev, shmem->pages_use_count);
-
-		dma_resv_unlock(shmem->base.resv);
 	}
 
 	drm_gem_object_release(obj);
@@ -165,19 +216,31 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
 
-static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
+static int
+drm_gem_shmem_acquire_pages(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	struct page **pages;
 
-	if (shmem->pages_use_count++ > 0)
+	dma_resv_assert_held(shmem->base.resv);
+
+	if (shmem->madv < 0) {
+		drm_WARN_ON(obj->dev, shmem->pages);
+		return -ENOMEM;
+	}
+
+	if (shmem->pages) {
+		drm_WARN_ON(obj->dev, !shmem->evicted);
 		return 0;
+	}
+
+	if (drm_WARN_ON(obj->dev, !shmem->pages_use_count))
+		return -EINVAL;
 
 	pages = drm_gem_get_pages(obj);
 	if (IS_ERR(pages)) {
 		drm_dbg_kms(obj->dev, "Failed to get pages (%ld)\n",
 			    PTR_ERR(pages));
-		shmem->pages_use_count = 0;
 		return PTR_ERR(pages);
 	}
 
@@ -196,6 +259,58 @@ static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 	return 0;
 }
 
+static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
+{
+	int err;
+
+	dma_resv_assert_held(shmem->base.resv);
+
+	if (shmem->madv < 0)
+		return -ENOMEM;
+
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
+		drm_WARN_ON(obj->dev, !shmem->evicted && shmem->madv >= 0);
+		return;
+	}
+
+#ifdef CONFIG_X86
+	if (shmem->map_wc)
+		set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
+#endif
+
+	drm_gem_put_pages(obj, shmem->pages,
+			  shmem->pages_mark_dirty_on_put,
+			  shmem->pages_mark_accessed_on_put);
+	shmem->pages = NULL;
+}
+
 /*
  * drm_gem_shmem_put_pages - Decrease use count on the backing pages for a shmem GEM object
  * @shmem: shmem GEM object
@@ -206,7 +321,7 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	dma_resv_assert_held(shmem->base.resv);
+	drm_gem_shmem_resv_assert_held(shmem);
 
 	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
 		return;
@@ -214,15 +329,9 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
 	if (--shmem->pages_use_count > 0)
 		return;
 
-#ifdef CONFIG_X86
-	if (shmem->map_wc)
-		set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
-#endif
+	drm_gem_shmem_release_pages(shmem);
 
-	drm_gem_put_pages(obj, shmem->pages,
-			  shmem->pages_mark_dirty_on_put,
-			  shmem->pages_mark_accessed_on_put);
-	shmem->pages = NULL;
+	drm_gem_shmem_update_pages_state(shmem);
 }
 EXPORT_SYMBOL(drm_gem_shmem_put_pages);
 
@@ -239,12 +348,17 @@ EXPORT_SYMBOL(drm_gem_shmem_put_pages);
 int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
+	int ret;
 
 	dma_resv_assert_held(shmem->base.resv);
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
-	return drm_gem_shmem_get_pages(shmem);
+	ret = drm_gem_shmem_get_pages(shmem);
+	if (!ret)
+		shmem->pages_pin_count++;
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_shmem_pin);
 
@@ -263,7 +377,12 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
+	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages_pin_count))
+		return;
+
 	drm_gem_shmem_put_pages(shmem);
+
+	shmem->pages_pin_count--;
 }
 EXPORT_SYMBOL(drm_gem_shmem_unpin);
 
@@ -306,7 +425,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 			return 0;
 		}
 
-		ret = drm_gem_shmem_get_pages(shmem);
+		ret = drm_gem_shmem_pin(shmem);
 		if (ret)
 			goto err_zero_use;
 
@@ -329,7 +448,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 
 err_put_pages:
 	if (!obj->import_attach)
-		drm_gem_shmem_put_pages(shmem);
+		drm_gem_shmem_unpin(shmem);
 err_zero_use:
 	shmem->vmap_use_count = 0;
 
@@ -366,7 +485,7 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
 			return;
 
 		vunmap(shmem->vaddr);
-		drm_gem_shmem_put_pages(shmem);
+		drm_gem_shmem_unpin(shmem);
 	}
 
 	shmem->vaddr = NULL;
@@ -403,48 +522,84 @@ drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
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
 
-	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_purgeable(shmem));
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
@@ -495,22 +650,33 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	vm_fault_t ret;
 	struct page *page;
 	pgoff_t page_offset;
+	bool pages_unpinned;
+	int err;
 
 	/* We don't use vmf->pgoff since that has the fake offset */
 	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
 
 	dma_resv_lock(shmem->base.resv, NULL);
 
-	if (page_offset >= num_pages ||
-	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
-	    shmem->madv < 0) {
+	/* Sanity-check that we have the pages pointer when it should present */
+	pages_unpinned = (shmem->evicted || shmem->madv < 0 || !shmem->pages_use_count);
+	drm_WARN_ON_ONCE(obj->dev, !shmem->pages ^ pages_unpinned);
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
@@ -533,6 +699,7 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 	if (!drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
 		shmem->pages_use_count++;
 
+	drm_gem_shmem_update_pages_state(shmem);
 	dma_resv_unlock(shmem->base.resv);
 
 	drm_gem_vm_open(vma);
@@ -615,7 +782,9 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 		drm_printf_indent(p, indent, "vmap_use_count=%u\n",
 				  shmem->vmap_use_count);
 
+	drm_printf_indent(p, indent, "evicted=%d\n", shmem->evicted);
 	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
+	drm_printf_indent(p, indent, "madv=%d\n", shmem->madv);
 }
 EXPORT_SYMBOL(drm_gem_shmem_print_info);
 
@@ -688,6 +857,8 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
 
 	shmem->sgt = sgt;
 
+	drm_gem_shmem_update_pages_state(shmem);
+
 	dma_resv_unlock(shmem->base.resv);
 
 	return sgt;
@@ -738,6 +909,209 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
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
+void drm_gem_shmem_evict(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+
+	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_evictable(shmem));
+	drm_WARN_ON(obj->dev, shmem->evicted);
+
+	drm_gem_shmem_unpin_pages(shmem);
+
+	shmem->evicted = true;
+	drm_gem_shmem_update_pages_state(shmem);
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_evict);
+
+void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+
+	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_purgeable(shmem));
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
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_purge);
+
+static bool drm_gem_is_busy(struct drm_gem_object *obj)
+{
+	return !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ);
+}
+
+static bool drm_gem_shmem_shrinker_evict(struct drm_gem_object *obj)
+{
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+
+	if (!drm_gem_shmem_is_evictable(shmem) ||
+	    get_nr_swap_pages() < obj->size >> PAGE_SHIFT ||
+	    drm_gem_is_busy(obj))
+		return false;
+
+	return drm_gem_object_evict(obj);
+}
+
+static bool drm_gem_shmem_shrinker_purge(struct drm_gem_object *obj)
+{
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+
+	if (!drm_gem_shmem_is_purgeable(shmem) ||
+	    drm_gem_is_busy(obj))
+		return false;
+
+	return drm_gem_object_evict(obj);
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
+static int drm_gem_shmem_shrinker_init(struct drm_gem_shmem *shmem_mm,
+				       const char *shrinker_name)
+{
+	struct drm_gem_shmem_shrinker *gem_shrinker = &shmem_mm->shrinker;
+	int err;
+
+	gem_shrinker->base.count_objects = drm_gem_shmem_shrinker_count_objects;
+	gem_shrinker->base.scan_objects = drm_gem_shmem_shrinker_scan_objects;
+	gem_shrinker->base.seeks = DEFAULT_SEEKS;
+
+	mutex_init(&gem_shrinker->lock);
+	drm_gem_lru_init(&gem_shrinker->lru_evictable, &gem_shrinker->lock);
+	drm_gem_lru_init(&gem_shrinker->lru_evicted, &gem_shrinker->lock);
+	drm_gem_lru_init(&gem_shrinker->lru_pinned, &gem_shrinker->lock);
+
+	err = register_shrinker(&gem_shrinker->base, shrinker_name);
+	if (err) {
+		mutex_destroy(&gem_shrinker->lock);
+		return err;
+	}
+
+	return 0;
+}
+
+static void drm_gem_shmem_shrinker_release(struct drm_device *dev,
+					   struct drm_gem_shmem *shmem_mm)
+{
+	struct drm_gem_shmem_shrinker *gem_shrinker = &shmem_mm->shrinker;
+
+	unregister_shrinker(&gem_shrinker->base);
+	drm_WARN_ON(dev, !list_empty(&gem_shrinker->lru_evictable.list));
+	drm_WARN_ON(dev, !list_empty(&gem_shrinker->lru_evicted.list));
+	drm_WARN_ON(dev, !list_empty(&gem_shrinker->lru_pinned.list));
+	mutex_destroy(&gem_shrinker->lock);
+}
+
+static int drm_gem_shmem_init(struct drm_device *dev)
+{
+	int err;
+
+	if (WARN_ON(dev->shmem_mm))
+		return -EBUSY;
+
+	dev->shmem_mm = kzalloc(sizeof(*dev->shmem_mm), GFP_KERNEL);
+	if (!dev->shmem_mm)
+		return -ENOMEM;
+
+	err = drm_gem_shmem_shrinker_init(dev->shmem_mm, dev->unique);
+	if (err)
+		goto free_gem_shmem;
+
+	return 0;
+
+free_gem_shmem:
+	kfree(dev->shmem_mm);
+	dev->shmem_mm = NULL;
+
+	return err;
+}
+
+static void drm_gem_shmem_release(struct drm_device *dev, void *ptr)
+{
+	struct drm_gem_shmem *shmem_mm = dev->shmem_mm;
+
+	drm_gem_shmem_shrinker_release(dev, shmem_mm);
+	dev->shmem_mm = NULL;
+	kfree(shmem_mm);
+}
+
+/**
+ * drmm_gem_shmem_init() - Initialize drm-shmem internals
+ * @dev: DRM device
+ *
+ * Cleanup is automatically managed as part of DRM device releasing.
+ * Calling this function multiple times will result in a error.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drmm_gem_shmem_init(struct drm_device *dev)
+{
+	int err;
+
+	err = drm_gem_shmem_init(dev);
+	if (err)
+		return err;
+
+	err = drmm_add_action_or_reset(dev, drm_gem_shmem_release, NULL);
+	if (err)
+		return err;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drmm_gem_shmem_init);
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
index a68c6a312b46..8acd455fc156 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -16,6 +16,7 @@ struct drm_vblank_crtc;
 struct drm_vma_offset_manager;
 struct drm_vram_mm;
 struct drm_fb_helper;
+struct drm_gem_shmem_shrinker;
 
 struct inode;
 
@@ -277,8 +278,13 @@ struct drm_device {
 	/** @vma_offset_manager: GEM information */
 	struct drm_vma_offset_manager *vma_offset_manager;
 
-	/** @vram_mm: VRAM MM memory manager */
-	struct drm_vram_mm *vram_mm;
+	union {
+		/** @vram_mm: VRAM MM memory manager */
+		struct drm_vram_mm *vram_mm;
+
+		/** @shmem_mm: SHMEM GEM memory manager */
+		struct drm_gem_shmem *shmem_mm;
+	};
 
 	/**
 	 * @switch_power_state:
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 20ddcd799df9..c264caf6c83b 100644
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
 
@@ -91,6 +102,12 @@ struct drm_gem_shmem_object {
 	 * @map_wc: map object write-combined (instead of using shmem defaults).
 	 */
 	bool map_wc : 1;
+
+	/**
+	 * @evicted: True if shmem pages are evicted by the memory shrinker.
+	 * Used internally by memory shrinker.
+	 */
+	bool evicted : 1;
 };
 
 #define to_drm_gem_shmem_obj(obj) \
@@ -112,11 +129,17 @@ int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv);
 
 static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
 {
-	return (shmem->madv > 0) &&
-		!shmem->vmap_use_count && shmem->sgt &&
-		!shmem->base.dma_buf && !shmem->base.import_attach;
+	dma_resv_assert_held(shmem->base.resv);
+
+	return (shmem->madv > 0) && shmem->base.funcs->evict &&
+		shmem->pages_use_count && !shmem->pages_pin_count &&
+		!shmem->base.dma_buf && !shmem->base.import_attach &&
+		(shmem->sgt || shmem->evicted);
 }
 
+int drm_gem_shmem_swap_in(struct drm_gem_shmem_object *shmem);
+
+void drm_gem_shmem_evict(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);
 
 struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem);
@@ -260,6 +283,36 @@ static inline int drm_gem_shmem_object_mmap(struct drm_gem_object *obj, struct v
 	return drm_gem_shmem_mmap(shmem, vma);
 }
 
+/**
+ * struct drm_gem_shmem_shrinker - Memory shrinker of GEM shmem memory manager
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
+};
+
+/**
+ * struct drm_gem_shmem - GEM shmem memory manager
+ */
+struct drm_gem_shmem {
+	/** @shrinker: GEM shmem shrinker */
+	struct drm_gem_shmem_shrinker shrinker;
+};
+
+int drmm_gem_shmem_init(struct drm_device *dev);
+
 /*
  * Driver ops
  */
-- 
2.38.1

