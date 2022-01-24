Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA491497F65
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 13:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF20510EACE;
	Mon, 24 Jan 2022 12:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4291D10EAC6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 12:25:27 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v13so13239113wrv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 04:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ndW8uUyRFxJfWAN2bXLKUPMH6H/SKnJ2BF2hNlVGvs8=;
 b=BImV+18SDZ7ZfX/p76hSLb/0K9tx+a1gexske4/0Oiy8BsSHCZy1bJZUqAcDpizv4H
 5WHRLjQunCya547zQAQqoNBE+WR0bjVcKmtQS6vCMQKVhx5YuTIL65zVmdyaUgYUs31D
 JQY8AsHDas1OE6ccxUP+CTyADhKgYQPmOMOEkwwd3fSMhlLGd9IpzY/5raMDxAyxBkKl
 hoG6Yyx8pXJNfJjlpTm8nZUf+KS1FyP9E/8An7dVRG6OlZP8pXpZ5JkbGDd75SMAn6Db
 ZScG7NJ6J5m/heoLRb7jbsokSUFXYNI9rGw/w8FtUIjPnK/sH2Wfe4J8P8xin8jfRqmN
 EkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ndW8uUyRFxJfWAN2bXLKUPMH6H/SKnJ2BF2hNlVGvs8=;
 b=GbkXmoC24mxjmKRaPukpl9+oFmS4SS/Cl4GOqxZGCG36fUHbrv3eA53PR2GyCN01JG
 FYxT7oywEcUriyRf/7p8pPAu9IHm4vAzlNjnT+RnvV3/nsl2BJoBLGGmgTwDuKnrKTfq
 wy+MIciTux3sYNpsQYAde2i2htOsjU9V+UNn0xHMeMAeRqAz6iykAa1SdBGkvVqOSOhs
 q12D/59ocqiIsmNSpovBKPx1SX/WHY3mTvODBF5HNW8oUhN8akdea3fqqUcnwVskN1aL
 i0KVl2AkFQnHH3Cx31sPBsikGGLuyr09SkbAWuYuE1MNXWkaAnfS2NG+/P+w4zj87AZv
 N5Sg==
X-Gm-Message-State: AOAM531ifzerWLjuLLv+2e26WxF+sToeWwxb+8EgtcLLs1GdusZOSB77
 tDK6faBVZPilpibvsNNbEyU=
X-Google-Smtp-Source: ABdhPJz8RIjZF00UI7t9LYoY6LoHuCpmHvRmHcUaNhepChUToVoqIaG4H7/gMFz1kpc0GnNex4+7aw==
X-Received: by 2002:a05:6000:18a2:: with SMTP id
 b2mr4768576wri.282.1643027125763; 
 Mon, 24 Jan 2022 04:25:25 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id 1sm12830516wmo.37.2022.01.24.04.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 04:25:25 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ray.huang@amd.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, bas@basnieuwenhuizen.nl
Subject: [PATCH 12/12] drm/ttm: rework bulk move handling
Date: Mon, 24 Jan 2022 13:25:14 +0100
Message-Id: <20220124122514.1832-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124122514.1832-1-christian.koenig@amd.com>
References: <20220124122514.1832-1-christian.koenig@amd.com>
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

Instead of providing the bulk move structure for each LRU update set
this as property of the BO. This should avoid costly bulk move rebuilds
with some games under RADV.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 72 +++-----------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  3 -
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c |  2 +-
 drivers/gpu/drm/ttm/ttm_bo.c            | 42 ++++++++++--
 drivers/gpu/drm/ttm/ttm_resource.c      | 87 ++++++++++++++++++-------
 include/drm/ttm/ttm_bo_api.h            | 18 ++---
 include/drm/ttm/ttm_bo_driver.h         |  2 +-
 include/drm/ttm/ttm_device.h            |  9 ---
 include/drm/ttm/ttm_resource.h          |  7 +-
 10 files changed, 124 insertions(+), 119 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index f6b3695979a6..7424a4a8d35c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1497,7 +1497,6 @@ static struct ttm_device_funcs amdgpu_bo_driver = {
 	.io_mem_reserve = &amdgpu_ttm_io_mem_reserve,
 	.io_mem_pfn = amdgpu_ttm_io_mem_pfn,
 	.access_memory = &amdgpu_ttm_access_memory,
-	.del_from_lru_notify = &amdgpu_vm_del_from_lru_notify
 };
 
 /*
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index cdb489cdf27b..35ed849cfe25 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -375,7 +375,7 @@ static void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
 	if (bo->tbo.base.resv != vm->root.bo->tbo.base.resv)
 		return;
 
-	vm->bulk_moveable = false;
+	ttm_bo_set_bulk_move(&bo->tbo, &vm->lru_bulk_move);
 	if (bo->tbo.type == ttm_bo_type_kernel && bo->parent)
 		amdgpu_vm_bo_relocated(base);
 	else
@@ -637,36 +637,6 @@ void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
 	list_add(&entry->tv.head, validated);
 }
 
-/**
- * amdgpu_vm_del_from_lru_notify - update bulk_moveable flag
- *
- * @bo: BO which was removed from the LRU
- *
- * Make sure the bulk_moveable flag is updated when a BO is removed from the
- * LRU.
- */
-void amdgpu_vm_del_from_lru_notify(struct ttm_buffer_object *bo)
-{
-	struct amdgpu_bo *abo;
-	struct amdgpu_vm_bo_base *bo_base;
-
-	if (!amdgpu_bo_is_amdgpu_bo(bo))
-		return;
-
-	if (bo->pin_count)
-		return;
-
-	abo = ttm_to_amdgpu_bo(bo);
-	if (!abo->parent)
-		return;
-	for (bo_base = abo->vm_bo; bo_base; bo_base = bo_base->next) {
-		struct amdgpu_vm *vm = bo_base->vm;
-
-		if (abo->tbo.base.resv == vm->root.bo->tbo.base.resv)
-			vm->bulk_moveable = false;
-	}
-
-}
 /**
  * amdgpu_vm_move_to_lru_tail - move all BOs to the end of LRU
  *
@@ -679,33 +649,9 @@ void amdgpu_vm_del_from_lru_notify(struct ttm_buffer_object *bo)
 void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
 				struct amdgpu_vm *vm)
 {
-	struct amdgpu_vm_bo_base *bo_base;
-
-	if (vm->bulk_moveable) {
-		spin_lock(&adev->mman.bdev.lru_lock);
-		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
-		spin_unlock(&adev->mman.bdev.lru_lock);
-		return;
-	}
-
-	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
-
 	spin_lock(&adev->mman.bdev.lru_lock);
-	list_for_each_entry(bo_base, &vm->idle, vm_status) {
-		struct amdgpu_bo *bo = bo_base->bo;
-		struct amdgpu_bo *shadow = amdgpu_bo_shadowed(bo);
-
-		if (!bo->parent)
-			continue;
-
-		ttm_bo_move_to_lru_tail(&bo->tbo, &vm->lru_bulk_move);
-		if (shadow)
-			ttm_bo_move_to_lru_tail(&shadow->tbo,
-						&vm->lru_bulk_move);
-	}
+	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
 	spin_unlock(&adev->mman.bdev.lru_lock);
-
-	vm->bulk_moveable = true;
 }
 
 /**
@@ -728,8 +674,6 @@ int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	struct amdgpu_vm_bo_base *bo_base, *tmp;
 	int r;
 
-	vm->bulk_moveable &= list_empty(&vm->evicted);
-
 	list_for_each_entry_safe(bo_base, tmp, &vm->evicted, vm_status) {
 		struct amdgpu_bo *bo = bo_base->bo;
 		struct amdgpu_bo *shadow = amdgpu_bo_shadowed(bo);
@@ -1047,10 +991,16 @@ static void amdgpu_vm_free_table(struct amdgpu_vm_bo_base *entry)
 
 	if (!entry->bo)
 		return;
+
 	shadow = amdgpu_bo_shadowed(entry->bo);
+	if (shadow) {
+		ttm_bo_set_bulk_move(&shadow->tbo, NULL);
+		amdgpu_bo_unref(&shadow);
+	}
+
+	ttm_bo_set_bulk_move(&entry->bo->tbo, NULL);
 	entry->bo->vm_bo = NULL;
 	list_del(&entry->vm_status);
-	amdgpu_bo_unref(&shadow);
 	amdgpu_bo_unref(&entry->bo);
 }
 
@@ -1070,8 +1020,6 @@ static void amdgpu_vm_free_pts(struct amdgpu_device *adev,
 	struct amdgpu_vm_pt_cursor cursor;
 	struct amdgpu_vm_bo_base *entry;
 
-	vm->bulk_moveable = false;
-
 	for_each_amdgpu_vm_pt_dfs_safe(adev, vm, start, cursor, entry)
 		amdgpu_vm_free_table(entry);
 
@@ -2651,7 +2599,7 @@ void amdgpu_vm_bo_rmv(struct amdgpu_device *adev,
 
 	if (bo) {
 		if (bo->tbo.base.resv == vm->root.bo->tbo.base.resv)
-			vm->bulk_moveable = false;
+			ttm_bo_set_bulk_move(&bo->tbo, NULL);
 
 		for (base = &bo_va->base.bo->vm_bo; *base;
 		     base = &(*base)->next) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 85fcfb8c5efd..4d236682a118 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -317,8 +317,6 @@ struct amdgpu_vm {
 
 	/* Store positions of group of BOs */
 	struct ttm_lru_bulk_move lru_bulk_move;
-	/* mark whether can do the bulk move */
-	bool			bulk_moveable;
 	/* Flag to indicate if VM is used for compute */
 	bool			is_compute_context;
 };
@@ -454,7 +452,6 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
 
 void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
 				struct amdgpu_vm *vm);
-void amdgpu_vm_del_from_lru_notify(struct ttm_buffer_object *bo);
 void amdgpu_vm_get_memory(struct amdgpu_vm *vm, uint64_t *vram_mem,
 				uint64_t *gtt_mem, uint64_t *cpu_mem);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index cdf1ff87c88d..abd1bde7a2b8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -835,7 +835,7 @@ void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 			bo->priority = I915_TTM_PRIO_NO_PAGES;
 	}
 
-	ttm_bo_move_to_lru_tail(bo, NULL);
+	ttm_bo_move_to_lru_tail(bo);
 	spin_unlock(&bo->bdev->lru_lock);
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 599be3dda8a9..7d1133bef33e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -69,16 +69,48 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
 	}
 }
 
-void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
-			     struct ttm_lru_bulk_move *bulk)
+/**
+ * ttm_bo_move_to_lru_tail
+ *
+ * @bo: The buffer object.
+ *
+ * Move this BO to the tail of all lru lists used to lookup and reserve an
+ * object. This function must be called with struct ttm_global::lru_lock
+ * held, and is used to make a BO less likely to be considered for eviction.
+ */
+void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo)
 {
 	dma_resv_assert_held(bo->base.resv);
 
 	if (bo->resource)
-		ttm_resource_move_to_lru_tail(bo->resource, bulk);
+		ttm_resource_move_to_lru_tail(bo->resource);
 }
 EXPORT_SYMBOL(ttm_bo_move_to_lru_tail);
 
+/**
+ * ttm_bo_set_bulk_move - update BOs bulk move object
+ *
+ * @bo: The buffer object.
+ *
+ * Update the BOs bulk move object, making sure that resources are added/removed
+ * as well.
+ */
+void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo,
+			  struct ttm_lru_bulk_move *bulk)
+{
+	if (bo->bulk_move == bulk)
+		return;
+
+	spin_lock(&bo->bdev->lru_lock);
+	if (bo->bulk_move && bo->resource)
+		ttm_lru_bulk_move_rmv(bo->bulk_move, bo->resource);
+	bo->bulk_move = bulk;
+	if (bo->bulk_move && bo->resource)
+		ttm_lru_bulk_move_add(bo->bulk_move, bo->resource);
+	spin_unlock(&bo->bdev->lru_lock);
+}
+EXPORT_SYMBOL(ttm_bo_set_bulk_move);
+
 static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 				  struct ttm_resource *mem, bool evict,
 				  struct ttm_operation_ctx *ctx,
@@ -316,6 +348,7 @@ static void ttm_bo_release(struct kref *kref)
 	int ret;
 
 	WARN_ON_ONCE(bo->pin_count);
+	WARN_ON_ONCE(bo->bulk_move);
 
 	if (!bo->deleted) {
 		ret = ttm_bo_individualize_resv(bo);
@@ -352,7 +385,7 @@ static void ttm_bo_release(struct kref *kref)
 		 */
 		if (bo->pin_count) {
 			bo->pin_count = 0;
-			ttm_resource_move_to_lru_tail(bo->resource, NULL);
+			ttm_resource_move_to_lru_tail(bo->resource);
 		}
 
 		kref_init(&bo->kref);
@@ -874,6 +907,7 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
 	bo->moving = NULL;
 	bo->pin_count = 0;
 	bo->sg = sg;
+	bo->bulk_move = NULL;
 	if (resv) {
 		bo->base.resv = resv;
 		dma_resv_assert_held(bo->base.resv);
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 2ea8fb83377e..b1068053434c 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -72,40 +72,75 @@ void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
 }
 EXPORT_SYMBOL(ttm_lru_bulk_move_tail);
 
-/* Record a resource position in a bulk move structure */
-static void ttm_lru_bulk_move_set_pos(struct ttm_lru_bulk_move_pos *pos,
-				      struct ttm_resource *res)
+/* Return the bulk move pos object for this resource */
+static struct ttm_lru_bulk_move_pos *
+ttm_lru_bulk_move_pos(struct ttm_lru_bulk_move *bulk, struct ttm_resource *res)
 {
-	if (!pos->first)
+	return &bulk->pos[res->mem_type][res->bo->priority];
+}
+
+/* Move the resource to the tail of the bulk move range */
+static void ttm_lru_bulk_move_pos_tail(struct ttm_lru_bulk_move_pos *pos,
+				       struct ttm_resource *res)
+{
+	if (pos->last != res) {
+		list_move(&res->lru, &pos->last->lru);
+		pos->last = res;
+	}
+}
+
+/* Add the resource to a bulk_move cursor */
+void ttm_lru_bulk_move_add(struct ttm_lru_bulk_move *bulk,
+			   struct ttm_resource *res)
+{
+	struct ttm_lru_bulk_move_pos *pos = ttm_lru_bulk_move_pos(bulk, res);
+
+	if (!pos->first) {
 		pos->first = res;
-	pos->last = res;
+		pos->last = res;
+	} else {
+		ttm_lru_bulk_move_pos_tail(pos, res);
+	}
+}
+
+/* Remove the resource from a bulk_move range */
+void ttm_lru_bulk_move_rmv(struct ttm_lru_bulk_move *bulk,
+			   struct ttm_resource *res)
+{
+	struct ttm_lru_bulk_move_pos *pos = ttm_lru_bulk_move_pos(bulk, res);
+
+	if (unlikely(pos->first == res && pos->last == res)) {
+		pos->first = NULL;
+		pos->last = NULL;
+	} else if (pos->first == res) {
+		pos->first = list_next_entry(res, lru);
+	} else if (pos->last == res) {
+		pos->last = list_prev_entry(res, lru);
+	} else {
+		list_move(&res->lru, &pos->last->lru);
+	}
 }
 
-/* Move a resource to the LRU tail and track the bulk position */
-void ttm_resource_move_to_lru_tail(struct ttm_resource *res,
-				   struct ttm_lru_bulk_move *bulk)
+/* Move a resource to the LRU or bulk tail */
+void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
 {
 	struct ttm_buffer_object *bo = res->bo;
 	struct ttm_device *bdev = bo->bdev;
-	struct ttm_resource_manager *man;
 
 	if (bo->pin_count) {
 		list_move_tail(&res->lru, &bdev->pinned);
-		if (bdev->funcs->del_from_lru_notify)
-			bdev->funcs->del_from_lru_notify(res->bo);
-		return;
-	}
 
-	man = ttm_manager_type(bdev, res->mem_type);
-	list_move_tail(&res->lru, &man->lru[bo->priority]);
+	} else	if (bo->bulk_move) {
+		struct ttm_lru_bulk_move_pos *pos =
+			ttm_lru_bulk_move_pos(bo->bulk_move, res);
 
-	if (bdev->funcs->del_from_lru_notify)
-		bdev->funcs->del_from_lru_notify(bo);
-
-	if (!bulk)
-		return;
+		ttm_lru_bulk_move_pos_tail(pos, res);
+	} else {
+		struct ttm_resource_manager *man;
 
-	ttm_lru_bulk_move_set_pos(&bulk->pos[res->mem_type][bo->priority], res);
+		man = ttm_manager_type(bdev, res->mem_type);
+		list_move_tail(&res->lru, &man->lru[bo->priority]);
+	}
 }
 
 void ttm_resource_init(struct ttm_buffer_object *bo,
@@ -129,7 +164,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 	atomic64_add(bo->base.size, &man->usage);
 
 	spin_lock(&bo->bdev->lru_lock);
-	ttm_resource_move_to_lru_tail(res, NULL);
+	ttm_resource_move_to_lru_tail(res);
 	spin_unlock(&bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_resource_init);
@@ -148,8 +183,6 @@ void ttm_resource_fini(struct ttm_resource_manager *man,
 
 	spin_lock(&bdev->lru_lock);
 	list_del_init(&res->lru);
-	if (res->bo && bdev->funcs->del_from_lru_notify)
-		bdev->funcs->del_from_lru_notify(res->bo);
 	spin_unlock(&bdev->lru_lock);
 
 	atomic64_sub(res->num_pages << PAGE_SHIFT, &man->usage);
@@ -173,6 +206,12 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
 	if (!*res)
 		return;
 
+	if (bo->bulk_move) {
+		spin_lock(&bo->bdev->lru_lock);
+		ttm_lru_bulk_move_rmv(bo->bulk_move, *res);
+		spin_unlock(&bo->bdev->lru_lock);
+	}
+
 	man = ttm_manager_type(bo->bdev, (*res)->mem_type);
 	man->func->free(man, *res);
 	*res = NULL;
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 3da77fc54552..b40c28e884a2 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -135,6 +135,7 @@ struct ttm_buffer_object {
 	struct ttm_resource *resource;
 	struct ttm_tt *ttm;
 	bool deleted;
+	struct ttm_lru_bulk_move *bulk_move;
 
 	/**
 	 * Members protected by the bdev::lru_lock.
@@ -287,18 +288,11 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
  */
 void ttm_bo_put(struct ttm_buffer_object *bo);
 
-/**
- * ttm_bo_move_to_lru_tail
- *
- * @bo: The buffer object.
- * @bulk: optional bulk move structure to remember BO positions
- *
- * Move this BO to the tail of all lru lists used to lookup and reserve an
- * object. This function must be called with struct ttm_global::lru_lock
- * held, and is used to make a BO less likely to be considered for eviction.
- */
-void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
-			     struct ttm_lru_bulk_move *bulk);
+void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo);
+
+
+void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo,
+			  struct ttm_lru_bulk_move *bulk);
 
 /**
  * ttm_bo_lock_delayed_workqueue
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 6c7352e13708..059a595e14e5 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -155,7 +155,7 @@ static inline void
 ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_object *bo)
 {
 	spin_lock(&bo->bdev->lru_lock);
-	ttm_bo_move_to_lru_tail(bo, NULL);
+	ttm_bo_move_to_lru_tail(bo);
 	spin_unlock(&bo->bdev->lru_lock);
 }
 
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 425150f35fbe..95b3c04b1ab9 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -198,15 +198,6 @@ struct ttm_device_funcs {
 	int (*access_memory)(struct ttm_buffer_object *bo, unsigned long offset,
 			     void *buf, int len, int write);
 
-	/**
-	 * struct ttm_bo_driver member del_from_lru_notify
-	 *
-	 * @bo: the buffer object deleted from lru
-	 *
-	 * notify driver that a BO was deleted from LRU.
-	 */
-	void (*del_from_lru_notify)(struct ttm_buffer_object *bo);
-
 	/**
 	 * Notify the driver that we're about to release a BO
 	 *
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 1556d1f62251..d938ee78f536 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -320,10 +320,13 @@ ttm_resource_manager_usage(struct ttm_resource_manager *man)
 }
 
 void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
+void ttm_lru_bulk_move_add(struct ttm_lru_bulk_move *bulk,
+			   struct ttm_resource *res);
+void ttm_lru_bulk_move_rmv(struct ttm_lru_bulk_move *bulk,
+			   struct ttm_resource *res);
 void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk);
 
-void ttm_resource_move_to_lru_tail(struct ttm_resource *res,
-				   struct ttm_lru_bulk_move *bulk);
+void ttm_resource_move_to_lru_tail(struct ttm_resource *res);
 
 void ttm_resource_init(struct ttm_buffer_object *bo,
                        const struct ttm_place *place,
-- 
2.25.1

