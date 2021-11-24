Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9612845BE69
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 13:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F176E48C;
	Wed, 24 Nov 2021 12:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375486E48C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 12:44:39 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id b12so3999824wrh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 04:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=o3yok5khnrLODuPFCmHrRpQ8Qqe8gOMXAwbrsZvvgos=;
 b=T3JEfg6UyuLk35NkWo7Wz0QaZS0EoTVXIRGUaZwGaro1FQvSA7Fh4uyZyuqy/6TfEn
 TqdAT2FKBPrxv/HbGhUE39Nx0Rxpyp+06MlLS7cl/PsjIdzP/3s1Vye3R5dcXCVyTJeI
 SrNAvHIOq3Yb0LFdMKsGviCQKsxNSRZ3C+pJnlsmJD0uVYfN3zJZposJGnye/e7aMMNs
 CK7Wdp2/DIP4g/5xsB1RN6tb7ARiJ1M6tzxV4AzxlUa7Az+MGOntffyqnv5H970Os+hl
 lod/3jvV691a4aVRfv1OuaSJo6qC+dDoBwWdZiA07EfU2p/+ZE32GXiLz6UgH2T3TjKW
 Etag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o3yok5khnrLODuPFCmHrRpQ8Qqe8gOMXAwbrsZvvgos=;
 b=YuDsf+duHHu+Cu/Pk5yuv/mD00+PDFYILCO2nPS7ncvU1UGQGTZTXziYhHaummIRUQ
 czWm3LhtyV4rHFguJfgt3COsCmoAiBxl6WdoP+ySSQQxi5KJ4gl7JBDcxjYob73SQnOO
 zXZUMzGkJmKZc07jQ+9hX7pFfVWlLuNktz6femgj9rxfLL42II9rYLn18oBEYtAFYdGd
 oNl30GjxyJjV3v+OgHy6/exZ29p6djlKG9eyNWTqt/QcftAnYEU4XxVCpdaTKgdwcbfo
 2cMAkCpZcMtqA2b2kJjKKKBlBjOveSndHQ2esvuUzhTZ9/RKi+CDauX/H4GdhjMKT9MT
 oP9A==
X-Gm-Message-State: AOAM533i/2Uf2Ah11BrDDOK/oa9cV6zGPYZMbFgXOJb/f9TnMNksmY3P
 wk5io+Fd579HArTdX8Pvegc=
X-Google-Smtp-Source: ABdhPJyqmrg5cEde3KqADFLT4mKNs0L2oC0NeESj08YIOrfIB7r7YaNoNiWcJ5x/0NfJ34Jx8kmzfg==
X-Received: by 2002:adf:d20e:: with SMTP id j14mr18530771wrh.220.1637757877588; 
 Wed, 24 Nov 2021 04:44:37 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id 38sm15583145wrc.1.2021.11.24.04.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 04:44:37 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, thomas.hellstrom@linux.intel.com, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 05/12] drm/ttm: move the LRU into resource handling v2
Date: Wed, 24 Nov 2021 13:44:23 +0100
Message-Id: <20211124124430.20859-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124124430.20859-1-christian.koenig@amd.com>
References: <20211124124430.20859-1-christian.koenig@amd.com>
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

This way we finally fix the problem that new resource are
not immediately evict-able after allocation.

That has caused numerous problems including OOM on GDS handling
and not being able to use TTM as general resource manager.

v2: stop assuming in ttm_resource_fini that res->bo is still valid.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c            | 115 ++--------------------
 drivers/gpu/drm/ttm/ttm_bo_util.c       |   1 -
 drivers/gpu/drm/ttm/ttm_device.c        |  64 ++++++-------
 drivers/gpu/drm/ttm/ttm_resource.c      | 122 +++++++++++++++++++++++-
 include/drm/ttm/ttm_bo_api.h            |  16 ----
 include/drm/ttm/ttm_bo_driver.h         |  29 +-----
 include/drm/ttm/ttm_resource.h          |  35 +++++++
 9 files changed, 201 insertions(+), 191 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 6e631254dc7f..d172ccb440e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -683,12 +683,12 @@ void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
 
 	if (vm->bulk_moveable) {
 		spin_lock(&adev->mman.bdev.lru_lock);
-		ttm_bo_bulk_move_lru_tail(&vm->lru_bulk_move);
+		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
 		spin_unlock(&adev->mman.bdev.lru_lock);
 		return;
 	}
 
-	memset(&vm->lru_bulk_move, 0, sizeof(vm->lru_bulk_move));
+	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
 
 	spin_lock(&adev->mman.bdev.lru_lock);
 	list_for_each_entry(bo_base, &vm->idle, vm_status) {
@@ -698,11 +698,9 @@ void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
 		if (!bo->parent)
 			continue;
 
-		ttm_bo_move_to_lru_tail(&bo->tbo, bo->tbo.resource,
-					&vm->lru_bulk_move);
+		ttm_bo_move_to_lru_tail(&bo->tbo, &vm->lru_bulk_move);
 		if (shadow)
 			ttm_bo_move_to_lru_tail(&shadow->tbo,
-						shadow->tbo.resource,
 						&vm->lru_bulk_move);
 	}
 	spin_unlock(&adev->mman.bdev.lru_lock);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 74a1ffd0d7dd..5abe22aecc54 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -794,7 +794,7 @@ static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 			bo->priority = I915_TTM_PRIO_NO_PAGES;
 	}
 
-	ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
+	ttm_bo_move_to_lru_tail(bo, NULL);
 	spin_unlock(&bo->bdev->lru_lock);
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 5db5c9ba166c..5bf5a9442856 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -69,108 +69,16 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
 	}
 }
 
-static inline void ttm_bo_move_to_pinned(struct ttm_buffer_object *bo)
-{
-	struct ttm_device *bdev = bo->bdev;
-
-	list_move_tail(&bo->lru, &bdev->pinned);
-
-	if (bdev->funcs->del_from_lru_notify)
-		bdev->funcs->del_from_lru_notify(bo);
-}
-
-static inline void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
-{
-	struct ttm_device *bdev = bo->bdev;
-
-	list_del_init(&bo->lru);
-
-	if (bdev->funcs->del_from_lru_notify)
-		bdev->funcs->del_from_lru_notify(bo);
-}
-
-static void ttm_bo_bulk_move_set_pos(struct ttm_lru_bulk_move_pos *pos,
-				     struct ttm_buffer_object *bo)
-{
-	if (!pos->first)
-		pos->first = bo;
-	pos->last = bo;
-}
-
 void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
-			     struct ttm_resource *mem,
 			     struct ttm_lru_bulk_move *bulk)
 {
-	struct ttm_device *bdev = bo->bdev;
-	struct ttm_resource_manager *man;
-
-	if (!bo->deleted)
-		dma_resv_assert_held(bo->base.resv);
-
-	if (bo->pin_count) {
-		ttm_bo_move_to_pinned(bo);
-		return;
-	}
-
-	if (!mem)
-		return;
-
-	man = ttm_manager_type(bdev, mem->mem_type);
-	list_move_tail(&bo->lru, &man->lru[bo->priority]);
-
-	if (bdev->funcs->del_from_lru_notify)
-		bdev->funcs->del_from_lru_notify(bo);
-
-	if (bulk && !bo->pin_count) {
-		switch (bo->resource->mem_type) {
-		case TTM_PL_TT:
-			ttm_bo_bulk_move_set_pos(&bulk->tt[bo->priority], bo);
-			break;
+	dma_resv_assert_held(bo->base.resv);
 
-		case TTM_PL_VRAM:
-			ttm_bo_bulk_move_set_pos(&bulk->vram[bo->priority], bo);
-			break;
-		}
-	}
+	if (bo->resource)
+		ttm_resource_move_to_lru_tail(bo->resource, bulk);
 }
 EXPORT_SYMBOL(ttm_bo_move_to_lru_tail);
 
-void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk)
-{
-	unsigned i;
-
-	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
-		struct ttm_lru_bulk_move_pos *pos = &bulk->tt[i];
-		struct ttm_resource_manager *man;
-
-		if (!pos->first)
-			continue;
-
-		dma_resv_assert_held(pos->first->base.resv);
-		dma_resv_assert_held(pos->last->base.resv);
-
-		man = ttm_manager_type(pos->first->bdev, TTM_PL_TT);
-		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
-				    &pos->last->lru);
-	}
-
-	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
-		struct ttm_lru_bulk_move_pos *pos = &bulk->vram[i];
-		struct ttm_resource_manager *man;
-
-		if (!pos->first)
-			continue;
-
-		dma_resv_assert_held(pos->first->base.resv);
-		dma_resv_assert_held(pos->last->base.resv);
-
-		man = ttm_manager_type(pos->first->bdev, TTM_PL_VRAM);
-		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
-				    &pos->last->lru);
-	}
-}
-EXPORT_SYMBOL(ttm_bo_bulk_move_lru_tail);
-
 static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 				  struct ttm_resource *mem, bool evict,
 				  struct ttm_operation_ctx *ctx,
@@ -345,7 +253,6 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 		return ret;
 	}
 
-	ttm_bo_move_to_pinned(bo);
 	list_del_init(&bo->ddestroy);
 	spin_unlock(&bo->bdev->lru_lock);
 	ttm_bo_cleanup_memtype_use(bo);
@@ -447,7 +354,7 @@ static void ttm_bo_release(struct kref *kref)
 		 */
 		if (bo->pin_count) {
 			bo->pin_count = 0;
-			ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
+			ttm_resource_move_to_lru_tail(bo->resource, NULL);
 		}
 
 		kref_init(&bo->kref);
@@ -460,7 +367,6 @@ static void ttm_bo_release(struct kref *kref)
 	}
 
 	spin_lock(&bo->bdev->lru_lock);
-	ttm_bo_del_from_lru(bo);
 	list_del(&bo->ddestroy);
 	spin_unlock(&bo->bdev->lru_lock);
 
@@ -674,15 +580,17 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 			struct ww_acquire_ctx *ticket)
 {
 	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
+	struct ttm_resource *res;
 	bool locked = false;
 	unsigned i;
 	int ret;
 
 	spin_lock(&bdev->lru_lock);
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
-		list_for_each_entry(bo, &man->lru[i], lru) {
+		list_for_each_entry(res, &man->lru[i], lru) {
 			bool busy;
 
+			bo = res->bo;
 			if (!ttm_bo_evict_swapout_allowable(bo, ctx, place,
 							    &locked, &busy)) {
 				if (busy && !busy_bo && ticket !=
@@ -700,7 +608,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 		}
 
 		/* If the inner loop terminated early, we have our candidate */
-		if (&bo->lru != &man->lru[i])
+		if (&res->lru != &man->lru[i])
 			break;
 
 		bo = NULL;
@@ -872,9 +780,6 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 	}
 
 error:
-	if (bo->resource->mem_type == TTM_PL_SYSTEM && !bo->pin_count)
-		ttm_bo_move_to_lru_tail_unlocked(bo);
-
 	return ret;
 }
 EXPORT_SYMBOL(ttm_bo_mem_space);
@@ -968,7 +873,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
 	bo->destroy = destroy ? destroy : ttm_bo_default_destroy;
 
 	kref_init(&bo->kref);
-	INIT_LIST_HEAD(&bo->lru);
 	INIT_LIST_HEAD(&bo->ddestroy);
 	bo->bdev = bdev;
 	bo->type = type;
@@ -1017,8 +921,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
 		return ret;
 	}
 
-	ttm_bo_move_to_lru_tail_unlocked(bo);
-
 	return ret;
 }
 EXPORT_SYMBOL(ttm_bo_init_reserved);
@@ -1120,7 +1022,6 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 		return ret == -EBUSY ? -ENOSPC : ret;
 	}
 
-	ttm_bo_move_to_pinned(bo);
 	/* TODO: Cleanup the locking */
 	spin_unlock(&bo->bdev->lru_lock);
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index a2e3a9626198..6c3d052f96ae 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -228,7 +228,6 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 
 	atomic_inc(&ttm_glob.bo_count);
 	INIT_LIST_HEAD(&fbo->base.ddestroy);
-	INIT_LIST_HEAD(&fbo->base.lru);
 	drm_vma_node_reset(&fbo->base.base.vma_node);
 
 	kref_init(&fbo->base.kref);
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index be24bb6cefd0..ba35887147ba 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -144,6 +144,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 {
 	struct ttm_resource_manager *man;
 	struct ttm_buffer_object *bo;
+	struct ttm_resource *res;
 	unsigned i, j;
 	int ret;
 
@@ -154,8 +155,11 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 			continue;
 
 		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
-			list_for_each_entry(bo, &man->lru[j], lru) {
-				uint32_t num_pages = PFN_UP(bo->base.size);
+			list_for_each_entry(res, &man->lru[j], lru) {
+				uint32_t num_pages;
+
+				bo = res->bo;
+				num_pages = PFN_UP(bo->base.size);
 
 				ret = ttm_bo_swapout(bo, ctx, gfp_flags);
 				/* ttm_bo_swapout has dropped the lru_lock */
@@ -259,49 +263,45 @@ void ttm_device_fini(struct ttm_device *bdev)
 }
 EXPORT_SYMBOL(ttm_device_fini);
 
-void ttm_device_clear_dma_mappings(struct ttm_device *bdev)
+static void ttm_device_clear_lru_dma_mappings(struct ttm_device *bdev,
+					      struct list_head *list)
 {
-	struct ttm_resource_manager *man;
-	struct ttm_buffer_object *bo;
-	unsigned int i, j;
+	struct ttm_resource *res;
 
 	spin_lock(&bdev->lru_lock);
-	while (!list_empty(&bdev->pinned)) {
-		bo = list_first_entry(&bdev->pinned, struct ttm_buffer_object, lru);
+	while ((res = list_first_entry_or_null(list, typeof(*res), lru))) {
+		struct ttm_buffer_object *bo = res->bo;
+
 		/* Take ref against racing releases once lru_lock is unlocked */
-		if (ttm_bo_get_unless_zero(bo)) {
-			list_del_init(&bo->lru);
-			spin_unlock(&bdev->lru_lock);
+		if (!ttm_bo_get_unless_zero(bo))
+			continue;
 
-			if (bo->ttm)
-				ttm_tt_unpopulate(bo->bdev, bo->ttm);
+		list_del_init(&res->lru);
+		spin_unlock(&bdev->lru_lock);
 
-			ttm_bo_put(bo);
-			spin_lock(&bdev->lru_lock);
-		}
+		if (bo->ttm)
+			ttm_tt_unpopulate(bo->bdev, bo->ttm);
+
+		ttm_bo_put(bo);
+		spin_lock(&bdev->lru_lock);
 	}
+	spin_unlock(&bdev->lru_lock);
+}
+
+void ttm_device_clear_dma_mappings(struct ttm_device *bdev)
+{
+	struct ttm_resource_manager *man;
+	unsigned int i, j;
+
+	ttm_device_clear_lru_dma_mappings(bdev, &bdev->pinned);
 
 	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
 		man = ttm_manager_type(bdev, i);
 		if (!man || !man->use_tt)
 			continue;
 
-		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
-			while (!list_empty(&man->lru[j])) {
-				bo = list_first_entry(&man->lru[j], struct ttm_buffer_object, lru);
-				if (ttm_bo_get_unless_zero(bo)) {
-					list_del_init(&bo->lru);
-					spin_unlock(&bdev->lru_lock);
-
-					if (bo->ttm)
-						ttm_tt_unpopulate(bo->bdev, bo->ttm);
-
-					ttm_bo_put(bo);
-					spin_lock(&bdev->lru_lock);
-				}
-			}
-		}
+		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j)
+			ttm_device_clear_lru_dma_mappings(bdev, &man->lru[j]);
 	}
-	spin_unlock(&bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_device_clear_dma_mappings);
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index b8362492980d..450e665c357b 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -29,6 +29,106 @@
 #include <drm/ttm/ttm_resource.h>
 #include <drm/ttm/ttm_bo_driver.h>
 
+/**
+ * ttm_lru_bulk_move_init - initialize a bulk move structure
+ * @bulk: the structure to init
+ *
+ * For now just memset the structure to zero.
+ */
+void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk)
+{
+	memset(bulk, 0, sizeof(*bulk));
+}
+EXPORT_SYMBOL(ttm_lru_bulk_move_init);
+
+/**
+ * ttm_lru_bulk_move_tail
+ *
+ * @bulk: bulk move structure
+ *
+ * Bulk move BOs to the LRU tail, only valid to use when driver makes sure that
+ * resource order never changes. Should be called with ttm_device::lru_lock held.
+ */
+void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
+{
+	unsigned i;
+
+	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
+		struct ttm_lru_bulk_move_pos *pos = &bulk->tt[i];
+		struct ttm_resource_manager *man;
+
+		if (!pos->first)
+			continue;
+
+		dma_resv_assert_held(pos->first->bo->base.resv);
+		dma_resv_assert_held(pos->last->bo->base.resv);
+
+		man = ttm_manager_type(pos->first->bo->bdev, TTM_PL_TT);
+		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
+				    &pos->last->lru);
+	}
+
+	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
+		struct ttm_lru_bulk_move_pos *pos = &bulk->vram[i];
+		struct ttm_resource_manager *man;
+
+		if (!pos->first)
+			continue;
+
+		dma_resv_assert_held(pos->first->bo->base.resv);
+		dma_resv_assert_held(pos->last->bo->base.resv);
+
+		man = ttm_manager_type(pos->first->bo->bdev, TTM_PL_VRAM);
+		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
+				    &pos->last->lru);
+	}
+}
+EXPORT_SYMBOL(ttm_lru_bulk_move_tail);
+
+/* Record a resource position in a bulk move structure */
+static void ttm_lru_bulk_move_set_pos(struct ttm_lru_bulk_move_pos *pos,
+				      struct ttm_resource *res)
+{
+	if (!pos->first)
+		pos->first = res;
+	pos->last = res;
+}
+
+/* Move a resource to the LRU tail and track the bulk position */
+void ttm_resource_move_to_lru_tail(struct ttm_resource *res,
+				   struct ttm_lru_bulk_move *bulk)
+{
+	struct ttm_buffer_object *bo = res->bo;
+	struct ttm_device *bdev = bo->bdev;
+	struct ttm_resource_manager *man;
+
+	if (bo->pin_count) {
+		list_move_tail(&res->lru, &bdev->pinned);
+		if (bdev->funcs->del_from_lru_notify)
+			bdev->funcs->del_from_lru_notify(res->bo);
+		return;
+	}
+
+	man = ttm_manager_type(bdev, res->mem_type);
+	list_move_tail(&res->lru, &man->lru[bo->priority]);
+
+	if (bdev->funcs->del_from_lru_notify)
+		bdev->funcs->del_from_lru_notify(bo);
+
+	if (!bulk)
+		return;
+
+	switch (res->mem_type) {
+	case TTM_PL_TT:
+		ttm_lru_bulk_move_set_pos(&bulk->tt[bo->priority], res);
+		break;
+
+	case TTM_PL_VRAM:
+		ttm_lru_bulk_move_set_pos(&bulk->vram[bo->priority], res);
+		break;
+	}
+}
+
 void ttm_resource_init(struct ttm_buffer_object *bo,
                        const struct ttm_place *place,
                        struct ttm_resource *res)
@@ -44,16 +144,36 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 	res->bus.is_iomem = false;
 	res->bus.caching = ttm_cached;
 	res->bo = bo;
+	INIT_LIST_HEAD(&res->lru);
 
 	man = ttm_manager_type(bo->bdev, place->mem_type);
 	atomic64_add(bo->base.size, &man->usage);
+
+	spin_lock(&bo->bdev->lru_lock);
+	ttm_resource_move_to_lru_tail(res, NULL);
+	spin_unlock(&bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_resource_init);
 
+/**
+ * ttm_resource_fini
+ *
+ * @res: the resource to clean up
+ *
+ * Make sure the resource is removed from the LRU before destruction.
+ */
 void ttm_resource_fini(struct ttm_resource_manager *man,
 		       struct ttm_resource *res)
 {
-	atomic64_sub(res->bo->base.size, &man->usage);
+	struct ttm_device *bdev = man->bdev;
+
+	spin_lock(&bdev->lru_lock);
+	list_del_init(&res->lru);
+	if (res->bo && bdev->funcs->del_from_lru_notify)
+		bdev->funcs->del_from_lru_notify(res->bo);
+	spin_unlock(&bdev->lru_lock);
+
+	atomic64_sub(res->num_pages << PAGE_SHIFT, &man->usage);
 }
 EXPORT_SYMBOL(ttm_resource_fini);
 
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 9798eb097c13..d239b97e8f71 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -56,8 +56,6 @@ struct ttm_placement;
 
 struct ttm_place;
 
-struct ttm_lru_bulk_move;
-
 /**
  * enum ttm_bo_type
  *
@@ -95,7 +93,6 @@ struct ttm_tt;
  * @ttm: TTM structure holding system pages.
  * @evicted: Whether the object was evicted without user-space knowing.
  * @deleted: True if the object is only a zombie and already deleted.
- * @lru: List head for the lru list.
  * @ddestroy: List head for the delayed destroy list.
  * @swap: List head for swap LRU list.
  * @offset: The current GPU offset, which can have different meanings
@@ -143,7 +140,6 @@ struct ttm_buffer_object {
 	 * Members protected by the bdev::lru_lock.
 	 */
 
-	struct list_head lru;
 	struct list_head ddestroy;
 
 	/**
@@ -294,7 +290,6 @@ void ttm_bo_put(struct ttm_buffer_object *bo);
  * ttm_bo_move_to_lru_tail
  *
  * @bo: The buffer object.
- * @mem: Resource object.
  * @bulk: optional bulk move structure to remember BO positions
  *
  * Move this BO to the tail of all lru lists used to lookup and reserve an
@@ -302,19 +297,8 @@ void ttm_bo_put(struct ttm_buffer_object *bo);
  * held, and is used to make a BO less likely to be considered for eviction.
  */
 void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
-			     struct ttm_resource *mem,
 			     struct ttm_lru_bulk_move *bulk);
 
-/**
- * ttm_bo_bulk_move_lru_tail
- *
- * @bulk: bulk move structure
- *
- * Bulk move BOs to the LRU tail, only valid to use when driver makes sure that
- * BO order never changes. Should be called with ttm_global::lru_lock held.
- */
-void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk);
-
 /**
  * ttm_bo_lock_delayed_workqueue
  *
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 5f087575194b..6c7352e13708 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -45,33 +45,6 @@
 #include "ttm_tt.h"
 #include "ttm_pool.h"
 
-/**
- * struct ttm_lru_bulk_move_pos
- *
- * @first: first BO in the bulk move range
- * @last: last BO in the bulk move range
- *
- * Positions for a lru bulk move.
- */
-struct ttm_lru_bulk_move_pos {
-	struct ttm_buffer_object *first;
-	struct ttm_buffer_object *last;
-};
-
-/**
- * struct ttm_lru_bulk_move
- *
- * @tt: first/last lru entry for BOs in the TT domain
- * @vram: first/last lru entry for BOs in the VRAM domain
- * @swap: first/last lru entry for BOs on the swap list
- *
- * Helper structure for bulk moves on the LRU list.
- */
-struct ttm_lru_bulk_move {
-	struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
-	struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
-};
-
 /*
  * ttm_bo.c
  */
@@ -182,7 +155,7 @@ static inline void
 ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_object *bo)
 {
 	spin_lock(&bo->bdev->lru_lock);
-	ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
+	ttm_bo_move_to_lru_tail(bo, NULL);
 	spin_unlock(&bo->bdev->lru_lock);
 }
 
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 3d391279b33f..a54d52517a30 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -26,10 +26,12 @@
 #define _TTM_RESOURCE_H_
 
 #include <linux/types.h>
+#include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/atomic.h>
 #include <linux/dma-buf-map.h>
 #include <linux/dma-fence.h>
+
 #include <drm/drm_print.h>
 #include <drm/ttm/ttm_caching.h>
 #include <drm/ttm/ttm_kmap_iter.h>
@@ -178,6 +180,33 @@ struct ttm_resource {
 	uint32_t placement;
 	struct ttm_bus_placement bus;
 	struct ttm_buffer_object *bo;
+	struct list_head lru;
+};
+
+/**
+ * struct ttm_lru_bulk_move_pos
+ *
+ * @first: first res in the bulk move range
+ * @last: last res in the bulk move range
+ *
+ * Positions for a lru bulk move.
+ */
+struct ttm_lru_bulk_move_pos {
+	struct ttm_resource *first;
+	struct ttm_resource *last;
+};
+
+/**
+ * struct ttm_lru_bulk_move
+ *
+ * @tt: first/last lru entry for resources in the TT domain
+ * @vram: first/last lru entry for resources in the VRAM domain
+ *
+ * Helper structure for bulk moves on the LRU list.
+ */
+struct ttm_lru_bulk_move {
+	struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
+	struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
 };
 
 /**
@@ -279,6 +308,12 @@ ttm_resource_manager_usage(struct ttm_resource_manager *man)
 	return atomic64_read(&man->usage);
 }
 
+void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
+void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk);
+
+void ttm_resource_move_to_lru_tail(struct ttm_resource *res,
+				   struct ttm_lru_bulk_move *bulk);
+
 void ttm_resource_init(struct ttm_buffer_object *bo,
                        const struct ttm_place *place,
                        struct ttm_resource *res);
-- 
2.25.1

