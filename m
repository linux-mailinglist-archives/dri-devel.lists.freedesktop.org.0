Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD6B638753
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 11:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCA510E610;
	Fri, 25 Nov 2022 10:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8EE710E607;
 Fri, 25 Nov 2022 10:21:42 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so3055733wmi.3; 
 Fri, 25 Nov 2022 02:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fIM1ll25GubEqhBH5bZZxcPqlVg9s6cvqfKXlkBrrPY=;
 b=qfayAvZ9W57gec8azJ14/0eQN0OTgL1CiUUfl4vLA9lE9b5f3GzriSiWkBRPdwkTr8
 apXcb5tDNEGlvRffxwNcUjU0deIFb1cfFne3FlE8uk2b+6pN2irY18VA+S+/grJ5BLe4
 f+Pj6InHXaFMSSrrrMuMZhaZCll2/5GkGyw4e6RumYnsdl8liG4CQWqKGJv8B3dkWWLj
 oajbsy/lDU6m+kULJCPqJwFHntsxmDWCMQ/OCRjsQ7NIxC8wnD8APYpcegQ8vWO7LZv3
 PE7/yQEyhnQ8oZ0NiI+RaundOfjmEjCiucvYSiR8NMlYaVi5pQFF5KBKKC2IsCQXzxGR
 PnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fIM1ll25GubEqhBH5bZZxcPqlVg9s6cvqfKXlkBrrPY=;
 b=JrFmKhM06v/bZuD0IRvXzdPJs4FmlllE54m5CzXMHMk4N9U+J8ncSMz40laArNhcZW
 xwsdDmGFMn674QZ+qpSnc8nyo1rOoA4P2ecGVEPV7GsNOPohuzsMfNelETY8MCzrVvNw
 qpgPPUGQsrSsPGHjELz9WLt3SrEAuVQba6h7SNbvim6rmJoukut2lGm2sy2l/II8bbc+
 AJJjfe7c3NiCOUg/gPrdFaxBSD6p06JE7YsRdOY+rYkUV5ne8U7A2dClTLwY0bOQ3qt0
 +4FMcviSmb7uDEK39BHHftraIFKTe77MSSQ1TvhXCOfLmE92yQH5gqDJCh9IxfBjrohN
 o1Ig==
X-Gm-Message-State: ANoB5pmqNrcoWkiIAn/KKB7DOxPpDvePVfO4/zSjYkb9ub529B+AXdpk
 eyw+A50ehcAE8jnxb2Ooun7+H8aROgw=
X-Google-Smtp-Source: AA0mqf6M7G9W4/uGaBih2Kuee+PbdRxx2mRR7SDUx/Tt/ZxcVGWcGBWCvpDAxpYPTTLe4ZKUf4daMg==
X-Received: by 2002:a05:600c:26c4:b0:3cf:7004:7b7 with SMTP id
 4-20020a05600c26c400b003cf700407b7mr16365701wmv.156.1669371701147; 
 Fri, 25 Nov 2022 02:21:41 -0800 (PST)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a056000038200b00241cfe6e286sm3351193wrf.98.2022.11.25.02.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 02:21:40 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/9] drm/ttm: use per BO cleanup workers
Date: Fri, 25 Nov 2022 11:21:31 +0100
Message-Id: <20221125102137.1801-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125102137.1801-1-christian.koenig@amd.com>
References: <20221125102137.1801-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of a single worker going over the list of delete BOs in regular
intervals use a per BO worker which blocks for the resv object and
locking of the BO.

This not only simplifies the handling massively, but also results in
much better response time when cleaning up buffers.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
 drivers/gpu/drm/i915/i915_gem.c            |   2 +-
 drivers/gpu/drm/i915/intel_region_ttm.c    |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c               | 112 ++++++++-------------
 drivers/gpu/drm/ttm/ttm_bo_util.c          |   1 -
 drivers/gpu/drm/ttm/ttm_device.c           |  24 ++---
 include/drm/ttm/ttm_bo_api.h               |  18 +---
 include/drm/ttm/ttm_device.h               |   7 +-
 8 files changed, 57 insertions(+), 111 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2b1db37e25c1..74ccbd566777 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3984,7 +3984,7 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 	amdgpu_fence_driver_hw_fini(adev);
 
 	if (adev->mman.initialized)
-		flush_delayed_work(&adev->mman.bdev.wq);
+		drain_workqueue(adev->mman.bdev.wq);
 
 	if (adev->pm_sysfs_en)
 		amdgpu_pm_sysfs_fini(adev);
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 8468ca9885fd..c38306f156d6 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1099,7 +1099,7 @@ void i915_gem_drain_freed_objects(struct drm_i915_private *i915)
 {
 	while (atomic_read(&i915->mm.free_count)) {
 		flush_work(&i915->mm.free_work);
-		flush_delayed_work(&i915->bdev.wq);
+		drain_workqueue(i915->bdev.wq);
 		rcu_barrier();
 	}
 }
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index cf89d0c2a2d9..657bbc16a48a 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -132,7 +132,7 @@ int intel_region_ttm_fini(struct intel_memory_region *mem)
 			break;
 
 		msleep(20);
-		flush_delayed_work(&mem->i915->bdev.wq);
+		drain_workqueue(mem->i915->bdev.wq);
 	}
 
 	/* If we leaked objects, Don't free the region causing use after free */
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index b77262a623e0..4749b65bedc4 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -280,14 +280,13 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 		ret = 0;
 	}
 
-	if (ret || unlikely(list_empty(&bo->ddestroy))) {
+	if (ret) {
 		if (unlock_resv)
 			dma_resv_unlock(bo->base.resv);
 		spin_unlock(&bo->bdev->lru_lock);
 		return ret;
 	}
 
-	list_del_init(&bo->ddestroy);
 	spin_unlock(&bo->bdev->lru_lock);
 	ttm_bo_cleanup_memtype_use(bo);
 
@@ -300,47 +299,21 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 }
 
 /*
- * Traverse the delayed list, and call ttm_bo_cleanup_refs on all
- * encountered buffers.
+ * Block for the dma_resv object to become idle, lock the buffer and clean up
+ * the resource and tt object.
  */
-bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all)
+static void ttm_bo_delayed_delete(struct work_struct *work)
 {
-	struct list_head removed;
-	bool empty;
-
-	INIT_LIST_HEAD(&removed);
-
-	spin_lock(&bdev->lru_lock);
-	while (!list_empty(&bdev->ddestroy)) {
-		struct ttm_buffer_object *bo;
-
-		bo = list_first_entry(&bdev->ddestroy, struct ttm_buffer_object,
-				      ddestroy);
-		list_move_tail(&bo->ddestroy, &removed);
-		if (!ttm_bo_get_unless_zero(bo))
-			continue;
-
-		if (remove_all || bo->base.resv != &bo->base._resv) {
-			spin_unlock(&bdev->lru_lock);
-			dma_resv_lock(bo->base.resv, NULL);
-
-			spin_lock(&bdev->lru_lock);
-			ttm_bo_cleanup_refs(bo, false, !remove_all, true);
-
-		} else if (dma_resv_trylock(bo->base.resv)) {
-			ttm_bo_cleanup_refs(bo, false, !remove_all, true);
-		} else {
-			spin_unlock(&bdev->lru_lock);
-		}
+	struct ttm_buffer_object *bo;
 
-		ttm_bo_put(bo);
-		spin_lock(&bdev->lru_lock);
-	}
-	list_splice_tail(&removed, &bdev->ddestroy);
-	empty = list_empty(&bdev->ddestroy);
-	spin_unlock(&bdev->lru_lock);
+	bo = container_of(work, typeof(*bo), delayed_delete);
 
-	return empty;
+	dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP, false,
+			      MAX_SCHEDULE_TIMEOUT);
+	dma_resv_lock(bo->base.resv, NULL);
+	ttm_bo_cleanup_memtype_use(bo);
+	dma_resv_unlock(bo->base.resv);
+	ttm_bo_put(bo);
 }
 
 static void ttm_bo_release(struct kref *kref)
@@ -369,44 +342,40 @@ static void ttm_bo_release(struct kref *kref)
 
 		drm_vma_offset_remove(bdev->vma_manager, &bo->base.vma_node);
 		ttm_mem_io_free(bdev, bo->resource);
-	}
-
-	if (!dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP) ||
-	    !dma_resv_trylock(bo->base.resv)) {
-		/* The BO is not idle, resurrect it for delayed destroy */
-		ttm_bo_flush_all_fences(bo);
-		bo->deleted = true;
 
-		spin_lock(&bo->bdev->lru_lock);
+		if (!dma_resv_test_signaled(bo->base.resv,
+					    DMA_RESV_USAGE_BOOKKEEP) ||
+		    !dma_resv_trylock(bo->base.resv)) {
+			/* The BO is not idle, resurrect it for delayed destroy */
+			ttm_bo_flush_all_fences(bo);
+			bo->deleted = true;
 
-		/*
-		 * Make pinned bos immediately available to
-		 * shrinkers, now that they are queued for
-		 * destruction.
-		 *
-		 * FIXME: QXL is triggering this. Can be removed when the
-		 * driver is fixed.
-		 */
-		if (bo->pin_count) {
-			bo->pin_count = 0;
-			ttm_resource_move_to_lru_tail(bo->resource);
-		}
+			spin_lock(&bo->bdev->lru_lock);
 
-		kref_init(&bo->kref);
-		list_add_tail(&bo->ddestroy, &bdev->ddestroy);
-		spin_unlock(&bo->bdev->lru_lock);
+			/*
+			 * Make pinned bos immediately available to
+			 * shrinkers, now that they are queued for
+			 * destruction.
+			 *
+			 * FIXME: QXL is triggering this. Can be removed when the
+			 * driver is fixed.
+			 */
+			if (bo->pin_count) {
+				bo->pin_count = 0;
+				ttm_resource_move_to_lru_tail(bo->resource);
+			}
 
-		schedule_delayed_work(&bdev->wq,
-				      ((HZ / 100) < 1) ? 1 : HZ / 100);
-		return;
-	}
+			kref_init(&bo->kref);
+			spin_unlock(&bo->bdev->lru_lock);
 
-	spin_lock(&bo->bdev->lru_lock);
-	list_del(&bo->ddestroy);
-	spin_unlock(&bo->bdev->lru_lock);
+			INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete);
+			queue_work(bdev->wq, &bo->delayed_delete);
+			return;
+		}
 
-	ttm_bo_cleanup_memtype_use(bo);
-	dma_resv_unlock(bo->base.resv);
+		ttm_bo_cleanup_memtype_use(bo);
+		dma_resv_unlock(bo->base.resv);
+	}
 
 	atomic_dec(&ttm_glob.bo_count);
 	bo->destroy(bo);
@@ -946,7 +915,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 	int ret;
 
 	kref_init(&bo->kref);
-	INIT_LIST_HEAD(&bo->ddestroy);
 	bo->bdev = bdev;
 	bo->type = type;
 	bo->page_alignment = alignment;
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index ba3aa0a0fc43..ae4b7922ee1a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -230,7 +230,6 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	 */
 
 	atomic_inc(&ttm_glob.bo_count);
-	INIT_LIST_HEAD(&fbo->base.ddestroy);
 	drm_vma_node_reset(&fbo->base.base.vma_node);
 
 	kref_init(&fbo->base.kref);
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index e7147e304637..e9bedca4dfdc 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -175,16 +175,6 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 }
 EXPORT_SYMBOL(ttm_device_swapout);
 
-static void ttm_device_delayed_workqueue(struct work_struct *work)
-{
-	struct ttm_device *bdev =
-		container_of(work, struct ttm_device, wq.work);
-
-	if (!ttm_bo_delayed_delete(bdev, false))
-		schedule_delayed_work(&bdev->wq,
-				      ((HZ / 100) < 1) ? 1 : HZ / 100);
-}
-
 /**
  * ttm_device_init
  *
@@ -215,15 +205,19 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
 	if (ret)
 		return ret;
 
+	bdev->wq = alloc_workqueue("ttm", WQ_MEM_RECLAIM | WQ_HIGHPRI, 16);
+	if (!bdev->wq) {
+		ttm_global_release();
+		return -ENOMEM;
+	}
+
 	bdev->funcs = funcs;
 
 	ttm_sys_man_init(bdev);
 	ttm_pool_init(&bdev->pool, dev, use_dma_alloc, use_dma32);
 
 	bdev->vma_manager = vma_manager;
-	INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
 	spin_lock_init(&bdev->lru_lock);
-	INIT_LIST_HEAD(&bdev->ddestroy);
 	INIT_LIST_HEAD(&bdev->pinned);
 	bdev->dev_mapping = mapping;
 	mutex_lock(&ttm_global_mutex);
@@ -247,10 +241,8 @@ void ttm_device_fini(struct ttm_device *bdev)
 	list_del(&bdev->device_list);
 	mutex_unlock(&ttm_global_mutex);
 
-	cancel_delayed_work_sync(&bdev->wq);
-
-	if (ttm_bo_delayed_delete(bdev, true))
-		pr_debug("Delayed destroy list was clean\n");
+	drain_workqueue(bdev->wq);
+	destroy_workqueue(bdev->wq);
 
 	spin_lock(&bdev->lru_lock);
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 7758347c461c..69e62bbb01e3 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -92,7 +92,6 @@ struct ttm_tt;
  * @ttm: TTM structure holding system pages.
  * @evicted: Whether the object was evicted without user-space knowing.
  * @deleted: True if the object is only a zombie and already deleted.
- * @ddestroy: List head for the delayed destroy list.
  * @swap: List head for swap LRU list.
  * @offset: The current GPU offset, which can have different meanings
  * depending on the memory type. For SYSTEM type memory, it should be 0.
@@ -135,19 +134,14 @@ struct ttm_buffer_object {
 	struct ttm_tt *ttm;
 	bool deleted;
 	struct ttm_lru_bulk_move *bulk_move;
+	unsigned priority;
+	unsigned pin_count;
 
 	/**
-	 * Members protected by the bdev::lru_lock.
-	 */
-
-	struct list_head ddestroy;
-
-	/**
-	 * Members protected by a bo reservation.
+	 * @delayed_delete: Work item used when we can't delete the BO
+	 * immediately
 	 */
-
-	unsigned priority;
-	unsigned pin_count;
+	struct work_struct delayed_delete;
 
 	/**
 	 * Special members that are protected by the reserve lock
@@ -448,8 +442,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
 
 int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 		     void *buf, int len, int write);
-bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
-
 vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
 
 #endif
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 95b3c04b1ab9..4f3e81eac6f3 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -251,11 +251,6 @@ struct ttm_device {
 	 */
 	spinlock_t lru_lock;
 
-	/**
-	 * @ddestroy: Destroyed but not yet cleaned up buffer objects.
-	 */
-	struct list_head ddestroy;
-
 	/**
 	 * @pinned: Buffer objects which are pinned and so not on any LRU list.
 	 */
@@ -270,7 +265,7 @@ struct ttm_device {
 	/**
 	 * @wq: Work queue structure for the delayed delete workqueue.
 	 */
-	struct delayed_work wq;
+	struct workqueue_struct *wq;
 };
 
 int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags);
-- 
2.34.1

