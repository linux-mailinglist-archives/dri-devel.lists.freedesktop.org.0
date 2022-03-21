Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B65374E2775
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:26:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A72610E292;
	Mon, 21 Mar 2022 13:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9891F10E292
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 13:26:05 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r13so5643827wrr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 06:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dvQ4dBgr90ccxR8O7lm4tYNDOC3ZQu3OJTIex2Bj5Dg=;
 b=kSrr4V/UO8cs8jp0+ujtxckHJzs1SAazQCIh2SJKG/6PN3ODTB0iw0NGEbid8Yb2IO
 l731OTfvOMD+Mw2lRcd51ni5amWkcYz+EhVnTLocrL+/J4pvaTIIRoIlhnlHYnaYGe7x
 TuVLudNps+ptxbvBOKhpOea1aQ9V4jXzMW1y3M1CJqKuQrw2RLZgh8w9VHsMii1g7mHG
 3ZD/3vbsMvRXdyTpSLNXjxxLGGThESXfPqUWrXrakC5woPTD1wKm8SWKxjb88n70ZRtc
 MvaDQswrMQ7bnbwslX87KjqgIHD09G9Z/0w4YfJjyqpjk91Fpz1fUK2mCUZpz2jlKrfk
 vX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dvQ4dBgr90ccxR8O7lm4tYNDOC3ZQu3OJTIex2Bj5Dg=;
 b=q1mH9tZXKSbJ1DAo+R1KaAhOX9b+HfZ0wF1pLh2VV7OZgdy7L9CJPhqVOH4FlS5x/V
 KJxdkzF3k0aD/Q2SIGUep1BNXCgwFGxLgHGAUW2IqZmG4IezVMBkzhFfWd1rl8BvWEo4
 iWgtm4T0iLwrlyeziBcRzZscOhOYpsNWEurGnSLZsSOooQ1n2U3eyCizaVbc7LTpFUxT
 KNdTlL2q5os+89nlKxNrSoW3IJ/cfKNSw0ZgZCeECFDk1tCjI/8/RecIQ3bATLXHzKFh
 9llGHoqC/2eIxf3IKnHjAUP50mYIPDDMWGaE2bQyKrV47sgkYkHx9trlFWHTxGCzXm59
 nWRQ==
X-Gm-Message-State: AOAM531I5zE5A8IH5ZW7PF0XKzx101j/E7MNtjl4jR1Z1pkoj9DCQfJ9
 VaBijYAaQFcXoMAczvCcdAP8sNx647U=
X-Google-Smtp-Source: ABdhPJwBw8bnxQMmAQB27s86M+OO6MQ6qPKYYQSoZFrzRoM48swbboGJd1j27jRqwUPEpexHiHnW5g==
X-Received: by 2002:adf:fb90:0:b0:203:b456:c71e with SMTP id
 a16-20020adffb90000000b00203b456c71emr18400167wrr.244.1647869163828; 
 Mon, 21 Mar 2022 06:26:03 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm13714494wma.21.2022.03.21.06.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:26:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.william.auld@gmail.com, felix.kuehling@amd.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/ttm: move the LRU into resource handling v4
Date: Mon, 21 Mar 2022 14:25:56 +0100
Message-Id: <20220321132601.2161-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This way we finally fix the problem that new resource are
not immediately evict-able after allocation.

That has caused numerous problems including OOM on GDS handling
and not being able to use TTM as general resource manager.

v2: stop assuming in ttm_resource_fini that res->bo is still valid.
v3: cleanup kerneldoc, add more lockdep annotation
v4: consistently use res->num_pages

Signed-off-by: Christian König <christian.koenig@amd.com>
Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c            | 115 ++--------------------
 drivers/gpu/drm/ttm/ttm_bo_util.c       |   1 -
 drivers/gpu/drm/ttm/ttm_device.c        |  64 ++++++------
 drivers/gpu/drm/ttm/ttm_resource.c      | 124 ++++++++++++++++++++++--
 include/drm/ttm/ttm_bo_api.h            |  16 ---
 include/drm/ttm/ttm_bo_driver.h         |  29 +-----
 include/drm/ttm/ttm_resource.h          |  35 +++++++
 9 files changed, 198 insertions(+), 196 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index b37fc7d7d2c7..f2ce5a0defd9 100644
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
index de3fe79b665a..582e8dc9bc8c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -849,7 +849,7 @@ void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 			bo->priority = I915_TTM_PRIO_NO_PAGES;
 	}
 
-	ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
+	ttm_bo_move_to_lru_tail(bo, NULL);
 	spin_unlock(&bo->bdev->lru_lock);
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index db3dc7ef5382..cb0fa932d495 100644
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
@@ -344,7 +252,6 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 		return ret;
 	}
 
-	ttm_bo_move_to_pinned(bo);
 	list_del_init(&bo->ddestroy);
 	spin_unlock(&bo->bdev->lru_lock);
 	ttm_bo_cleanup_memtype_use(bo);
@@ -445,7 +352,7 @@ static void ttm_bo_release(struct kref *kref)
 		 */
 		if (bo->pin_count) {
 			bo->pin_count = 0;
-			ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
+			ttm_resource_move_to_lru_tail(bo->resource, NULL);
 		}
 
 		kref_init(&bo->kref);
@@ -458,7 +365,6 @@ static void ttm_bo_release(struct kref *kref)
 	}
 
 	spin_lock(&bo->bdev->lru_lock);
-	ttm_bo_del_from_lru(bo);
 	list_del(&bo->ddestroy);
 	spin_unlock(&bo->bdev->lru_lock);
 
@@ -673,15 +579,17 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
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
@@ -699,7 +607,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 		}
 
 		/* If the inner loop terminated early, we have our candidate */
-		if (&bo->lru != &man->lru[i])
+		if (&res->lru != &man->lru[i])
 			break;
 
 		bo = NULL;
@@ -875,9 +783,6 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 	}
 
 error:
-	if (bo->resource->mem_type == TTM_PL_SYSTEM && !bo->pin_count)
-		ttm_bo_move_to_lru_tail_unlocked(bo);
-
 	return ret;
 }
 EXPORT_SYMBOL(ttm_bo_mem_space);
@@ -971,7 +876,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
 	bo->destroy = destroy ? destroy : ttm_bo_default_destroy;
 
 	kref_init(&bo->kref);
-	INIT_LIST_HEAD(&bo->lru);
 	INIT_LIST_HEAD(&bo->ddestroy);
 	bo->bdev = bdev;
 	bo->type = type;
@@ -1021,8 +925,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
 		return ret;
 	}
 
-	ttm_bo_move_to_lru_tail_unlocked(bo);
-
 	return ret;
 }
 EXPORT_SYMBOL(ttm_bo_init_reserved);
@@ -1123,7 +1025,6 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 		return ret == -EBUSY ? -ENOSPC : ret;
 	}
 
-	ttm_bo_move_to_pinned(bo);
 	/* TODO: Cleanup the locking */
 	spin_unlock(&bo->bdev->lru_lock);
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 544a84fa6589..0163e92b57af 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -231,7 +231,6 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 
 	atomic_inc(&ttm_glob.bo_count);
 	INIT_LIST_HEAD(&fbo->base.ddestroy);
-	INIT_LIST_HEAD(&fbo->base.lru);
 	fbo->base.moving = NULL;
 	drm_vma_node_reset(&fbo->base.base.vma_node);
 
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
index cbd47a104962..8c253b6de6cc 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -29,6 +29,110 @@
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
+ * ttm_lru_bulk_move_tail - bulk move range of resources to the LRU tail.
+ *
+ * @bulk: bulk move structure
+ *
+ * Bulk move BOs to the LRU tail, only valid to use when driver makes sure that
+ * resource order never changes. Should be called with &ttm_device.lru_lock held.
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
+		lockdep_assert_held(&pos->first->bo->bdev->lru_lock);
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
+		lockdep_assert_held(&pos->first->bo->bdev->lru_lock);
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
+	lockdep_assert_held(&bo->bdev->lru_lock);
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
 /**
  * ttm_resource_init - resource object constructure
  * @bo: buffer object this resources is allocated for
@@ -52,10 +156,12 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 	res->bus.is_iomem = false;
 	res->bus.caching = ttm_cached;
 	res->bo = bo;
+	INIT_LIST_HEAD(&res->lru);
 
 	man = ttm_manager_type(bo->bdev, place->mem_type);
 	spin_lock(&bo->bdev->lru_lock);
-	man->usage += bo->base.size;
+	man->usage += res->num_pages << PAGE_SHIFT;
+	ttm_resource_move_to_lru_tail(res, NULL);
 	spin_unlock(&bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_resource_init);
@@ -66,15 +172,21 @@ EXPORT_SYMBOL(ttm_resource_init);
  * @res: the resource to clean up
  *
  * Should be used by resource manager backends to clean up the TTM resource
- * objects before freeing the underlying structure. Counterpart of
- * &ttm_resource_init
+ * objects before freeing the underlying structure. Makes sure the resource is
+ * removed from the LRU before destruction.
+ * Counterpart of &ttm_resource_init.
  */
 void ttm_resource_fini(struct ttm_resource_manager *man,
 		       struct ttm_resource *res)
 {
-	spin_lock(&man->bdev->lru_lock);
-	man->usage -= res->bo->base.size;
-	spin_unlock(&man->bdev->lru_lock);
+	struct ttm_device *bdev = man->bdev;
+
+	spin_lock(&bdev->lru_lock);
+	list_del_init(&res->lru);
+	if (res->bo && bdev->funcs->del_from_lru_notify)
+		bdev->funcs->del_from_lru_notify(res->bo);
+	man->usage -= res->num_pages << PAGE_SHIFT;
+	spin_unlock(&bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_resource_fini);
 
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index c17b2df9178b..3da77fc54552 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -55,8 +55,6 @@ struct ttm_placement;
 
 struct ttm_place;
 
-struct ttm_lru_bulk_move;
-
 /**
  * enum ttm_bo_type
  *
@@ -94,7 +92,6 @@ struct ttm_tt;
  * @ttm: TTM structure holding system pages.
  * @evicted: Whether the object was evicted without user-space knowing.
  * @deleted: True if the object is only a zombie and already deleted.
- * @lru: List head for the lru list.
  * @ddestroy: List head for the delayed destroy list.
  * @swap: List head for swap LRU list.
  * @moving: Fence set when BO is moving
@@ -143,7 +140,6 @@ struct ttm_buffer_object {
 	 * Members protected by the bdev::lru_lock.
 	 */
 
-	struct list_head lru;
 	struct list_head ddestroy;
 
 	/**
@@ -295,7 +291,6 @@ void ttm_bo_put(struct ttm_buffer_object *bo);
  * ttm_bo_move_to_lru_tail
  *
  * @bo: The buffer object.
- * @mem: Resource object.
  * @bulk: optional bulk move structure to remember BO positions
  *
  * Move this BO to the tail of all lru lists used to lookup and reserve an
@@ -303,19 +298,8 @@ void ttm_bo_put(struct ttm_buffer_object *bo);
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
index 323c14a30c6b..181e82e3d806 100644
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
@@ -179,6 +181,33 @@ struct ttm_resource {
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
@@ -267,6 +296,12 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
 	man->move = NULL;
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

