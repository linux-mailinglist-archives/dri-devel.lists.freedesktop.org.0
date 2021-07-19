Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7705B3CD428
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 13:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA036E0C4;
	Mon, 19 Jul 2021 11:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313036E0C4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 11:51:50 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 y21-20020a7bc1950000b02902161fccabf1so12662764wmi.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 04:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AS5rAEjq5B+Rm4fRfdAoMPCZ1MS/HAkZBOgqYQpFaNY=;
 b=s/Yrj8uY+/cX4GDdlkVarbk+x3ROz6m0AE3ZOhJeN8e1PshJGaNoox1El7BzV6CSgS
 Nv6NLJlWcYwr7/gbBB87yHJDsAR0J0ss3hOyIehO4ryPM9r+RvzHUz0tTMT2WM2bVZq9
 gJUNkg5vypvhK67aL80iD1Sl1WdPKrKTLlaXdOLCQhQp3+L+rnaO5bnFdCe1tFFUZOba
 1lFotv/ZCIbk1wBYnDi0URUhtcAAE/c7o28gJ+zLedRz+GBy3Pi56+ZafjjrdK98reV/
 sl5B1uZdvwdIXpOFI++fZnIcZkDY4sIcGTTn3kKD2+CMsypMGrGMI/ukaYSQHWH3zdyC
 kLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AS5rAEjq5B+Rm4fRfdAoMPCZ1MS/HAkZBOgqYQpFaNY=;
 b=WUpnPQtPs2jMkeKMEE994D2mXmQ/1yaLQ+8yZbt6wKgIyCP0Ym6uc8Vd7PLRuw8Kmh
 i2NAQ9jRJZebqwX3a92uPAYwRHKQzRLqapsjCPKlKpSPsjt7lKuujpLJJRiLaRtp/5Uv
 jYP1AsZHX36i3/9q+0CesEd6eggEqxvXI4eCA4l2/zSyKOrtIHajaz6q/rsXlX21mm1A
 bYPQj7RDye5Lk3kJapucjzHLJ67W4yxof/jhjO/UPbDnIp+FKRhBNokcb1uR6SKKsvoN
 qEbOrmGw9cycn0K/6jKJ2yD+MsU7ugyKoaxkVwhhOJhCj3OiRUmdGPUP9hfMzU7bFR36
 7ggw==
X-Gm-Message-State: AOAM532GxYS5rq/5alOrcsTe/hHxTKDUvT0/pLUl45V+U6h0NW17uBWW
 gHxufhmmCDvsleEqsF1ynCqPoL8xzPE=
X-Google-Smtp-Source: ABdhPJzORUgIPPdCYefjZuu2UhlIPdLDDGGU86+OmY+uYvcA89L1uRzOMf0boddGvaue3qaLxUo3NA==
X-Received: by 2002:a05:600c:4656:: with SMTP id
 n22mr20996536wmo.37.1626695508851; 
 Mon, 19 Jul 2021 04:51:48 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:bb37:8df9:3c3c:217f])
 by smtp.gmail.com with ESMTPSA id p5sm16034104wme.2.2021.07.19.04.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 04:51:48 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/ttm: move the LRU into resource handling
Date: Mon, 19 Jul 2021 13:51:44 +0200
Message-Id: <20210719115145.1260-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719115145.1260-1-christian.koenig@amd.com>
References: <20210719115145.1260-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c            | 101 ++-----------------
 drivers/gpu/drm/ttm/ttm_bo_util.c       |   1 -
 drivers/gpu/drm/ttm/ttm_device.c        |   4 +-
 drivers/gpu/drm/ttm/ttm_resource.c      | 127 ++++++++++++++++++++++++
 include/drm/ttm/ttm_bo_api.h            |  16 ---
 include/drm/ttm/ttm_bo_driver.h         |  29 +-----
 include/drm/ttm/ttm_resource.h          |  35 +++++++
 9 files changed, 177 insertions(+), 146 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 18246b5b6ee3..4b178a74b4e0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -643,12 +643,12 @@ void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
 
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
@@ -658,11 +658,9 @@ void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
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
index bf33724bed5c..b38eef37f1c8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -472,7 +472,7 @@ static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 			bo->priority = I915_TTM_PRIO_NO_PAGES;
 	}
 
-	ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
+	ttm_bo_move_to_lru_tail(bo, NULL);
 	spin_unlock(&bo->bdev->lru_lock);
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 5a2dc712c632..09a62ad06b9d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -69,95 +69,15 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
 	}
 }
 
-static void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
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
-		ttm_bo_del_from_lru(bo);
-		return;
-	}
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
+	ttm_resource_move_to_lru_tail(bo->resource, bulk);
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
@@ -339,7 +259,6 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 		return ret;
 	}
 
-	ttm_bo_del_from_lru(bo);
 	list_del_init(&bo->ddestroy);
 	spin_unlock(&bo->bdev->lru_lock);
 	ttm_bo_cleanup_memtype_use(bo);
@@ -440,7 +359,7 @@ static void ttm_bo_release(struct kref *kref)
 		 */
 		if (bo->pin_count) {
 			bo->pin_count = 0;
-			ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
+			ttm_resource_move_to_lru_tail(bo->resource, NULL);
 		}
 
 		kref_init(&bo->kref);
@@ -453,7 +372,6 @@ static void ttm_bo_release(struct kref *kref)
 	}
 
 	spin_lock(&bo->bdev->lru_lock);
-	ttm_bo_del_from_lru(bo);
 	list_del(&bo->ddestroy);
 	spin_unlock(&bo->bdev->lru_lock);
 
@@ -667,15 +585,17 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
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
@@ -693,7 +613,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 		}
 
 		/* If the inner loop terminated early, we have our candidate */
-		if (&bo->lru != &man->lru[i])
+		if (&res->lru != &man->lru[i])
 			break;
 
 		bo = NULL;
@@ -867,9 +787,6 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 	}
 
 error:
-	if (bo->resource->mem_type == TTM_PL_SYSTEM && !bo->pin_count)
-		ttm_bo_move_to_lru_tail_unlocked(bo);
-
 	return ret;
 }
 EXPORT_SYMBOL(ttm_bo_mem_space);
@@ -1009,7 +926,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
 	bo->destroy = destroy ? destroy : ttm_bo_default_destroy;
 
 	kref_init(&bo->kref);
-	INIT_LIST_HEAD(&bo->lru);
 	INIT_LIST_HEAD(&bo->ddestroy);
 	bo->bdev = bdev;
 	bo->type = type;
@@ -1059,8 +975,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
 		return ret;
 	}
 
-	ttm_bo_move_to_lru_tail_unlocked(bo);
-
 	return ret;
 }
 EXPORT_SYMBOL(ttm_bo_init_reserved);
@@ -1159,7 +1073,6 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 		return 0;
 	}
 
-	ttm_bo_del_from_lru(bo);
 	/* TODO: Cleanup the locking */
 	spin_unlock(&bo->bdev->lru_lock);
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index a1570aa8ff56..e57fc64ffce9 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -229,7 +229,6 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 
 	atomic_inc(&ttm_glob.bo_count);
 	INIT_LIST_HEAD(&fbo->base.ddestroy);
-	INIT_LIST_HEAD(&fbo->base.lru);
 	fbo->base.moving = NULL;
 	drm_vma_node_reset(&fbo->base.base.vma_node);
 
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 460953dcad11..a6e533c3ac56 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -132,6 +132,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 {
 	struct ttm_resource_manager *man;
 	struct ttm_buffer_object *bo;
+	struct ttm_resource *res;
 	unsigned i, j;
 	int ret;
 
@@ -142,9 +143,10 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 			continue;
 
 		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
-			list_for_each_entry(bo, &man->lru[j], lru) {
+			list_for_each_entry(res, &man->lru[j], lru) {
 				uint32_t num_pages;
 
+				bo = res->bo;
 				if (!bo->ttm ||
 				    bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
 				    bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 5f1ff1354fba..d4eac7c08e82 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -29,6 +29,115 @@
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
+/* Remove a resource from the LRU */
+static void ttm_resource_del_from_lru(struct ttm_resource *res)
+{
+	struct ttm_device *bdev = res->bo->bdev;
+
+	list_del_init(&res->lru);
+
+	if (bdev->funcs->del_from_lru_notify)
+		bdev->funcs->del_from_lru_notify(res->bo);
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
+		ttm_resource_del_from_lru(res);
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
@@ -44,15 +153,33 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
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
+	struct ttm_device *bdev = res->bo->bdev;
+
+	spin_lock(&bdev->lru_lock);
+	ttm_resource_del_from_lru(res);
+	spin_unlock(&bdev->lru_lock);
+
 	atomic64_sub(res->bo->base.size, &man->usage);
 }
 EXPORT_SYMBOL(ttm_resource_fini);
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index f681bbdbc698..0928d8cfb45a 100644
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
  * @moving: Fence set when BO is moving
@@ -144,7 +141,6 @@ struct ttm_buffer_object {
 	 * Members protected by the bdev::lru_lock.
 	 */
 
-	struct list_head lru;
 	struct list_head ddestroy;
 
 	/**
@@ -308,7 +304,6 @@ void ttm_bo_put(struct ttm_buffer_object *bo);
  * ttm_bo_move_to_lru_tail
  *
  * @bo: The buffer object.
- * @mem: Resource object.
  * @bulk: optional bulk move structure to remember BO positions
  *
  * Move this BO to the tail of all lru lists used to lookup and reserve an
@@ -316,19 +311,8 @@ void ttm_bo_put(struct ttm_buffer_object *bo);
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
index 68d6069572aa..fba2f7d3d34e 100644
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
index b133997f55ce..500711415ae9 100644
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

