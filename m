Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D191B9089C5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 12:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B55910ECE5;
	Fri, 14 Jun 2024 10:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YeDrmhJa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE8E10ECE8;
 Fri, 14 Jun 2024 10:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718360770; x=1749896770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=un6fzKq6W5HjSRwThrQckn/ItplX1kztR2l4x4DfZ94=;
 b=YeDrmhJaw5Cwmr+ptbxaa9JfLJr4a6rk1ebPT+dDpZIP0OOsZnWTNXYW
 w5pEd5p3lwy48iMDO6CXD6K+PBVLAUpUdXLvXzTcB90JYxd3rtvY6iund
 lZ7ufp03fGnhLF8sC3p7wmI/jXNNfyzWOWaLIT2c+eyM35sFs6gJJuIQu
 xvhlI92cwgx673sHdDFoqNqb9s89RDX+WSTLsEamWG1rxdG4c9PSVv0+y
 /FlWtRyU2Z7KNkr2vCNPlTVGwPZ0DWpbklbnwWJAeA7HxKe6HXRzDubZ2
 SgoevVZ930trZmJa9V7fN9FmdtYNiNHmwIySMZMyZl+WhJ4MAzdyHRQVD g==;
X-CSE-ConnectionGUID: vgQR948NQe2q/AePTIvULQ==
X-CSE-MsgGUID: qMkUsbJdSx6I72miPb/GCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26659462"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="26659462"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 03:26:10 -0700
X-CSE-ConnectionGUID: 4702sZPcQBiMbkvHX0pF0A==
X-CSE-MsgGUID: C6g22uKWSxuKAeYIMsq7eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="45415522"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.153])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 03:26:08 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 04/12] drm/ttm, drm/amdgpu,
 drm/xe: Consider hitch moves within bulk sublist moves
Date: Fri, 14 Jun 2024 12:25:40 +0200
Message-ID: <20240614102548.4364-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240614102548.4364-1-thomas.hellstrom@linux.intel.com>
References: <20240614102548.4364-1-thomas.hellstrom@linux.intel.com>
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

To address the problem with hitches moving when bulk move
sublists are lru-bumped, register the list cursors with the
ttm_lru_bulk_move structure when traversing its list, and
when lru-bumping the list, move the cursor hitch to the tail.
This also means it's mandatory for drivers to call
ttm_lru_bulk_move_init() and ttm_lru_bulk_move_fini() when
initializing and finalizing the bulk move structure, so add
those calls to the amdgpu- and xe driver.

Compared to v1 this is slightly more code but less fragile
and hopefully easier to understand.

Changes in previous series:
- Completely rework the functionality
- Avoid a NULL pointer dereference assigning manager->mem_type
- Remove some leftover code causing build problems
v2:
- For hitch bulk tail moves, store the mem_type in the cursor
  instead of with the manager.
v3:
- Remove leftover mem_type member from change in v2.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |  4 ++
 drivers/gpu/drm/ttm/ttm_resource.c     | 89 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.c             |  4 ++
 include/drm/ttm/ttm_resource.h         | 56 ++++++++++------
 4 files changed, 132 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 3abfa66d72a2..97743993d711 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2420,6 +2420,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (r)
 		return r;
 
+	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
+
 	vm->is_compute_context = false;
 
 	vm->use_cpu_for_update = !!(adev->vm_manager.vm_update_mode &
@@ -2484,6 +2486,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 error_free_delayed:
 	dma_fence_put(vm->last_tlb_flush);
 	dma_fence_put(vm->last_unlocked);
+	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm->lru_bulk_move);
 	amdgpu_vm_fini_entities(vm);
 
 	return r;
@@ -2640,6 +2643,7 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 		}
 	}
 
+	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm->lru_bulk_move);
 }
 
 /**
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 9c8b6499edfb..a03090683e79 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -33,6 +33,49 @@
 
 #include <drm/drm_util.h>
 
+/* Detach the cursor from the bulk move list*/
+static void
+ttm_resource_cursor_clear_bulk(struct ttm_resource_cursor *cursor)
+{
+	cursor->bulk = NULL;
+	list_del_init(&cursor->bulk_link);
+}
+
+/* Move the cursor to the end of the bulk move list it's in */
+static void ttm_resource_cursor_move_bulk_tail(struct ttm_lru_bulk_move *bulk,
+					       struct ttm_resource_cursor *cursor)
+{
+	struct ttm_lru_bulk_move_pos *pos;
+
+	if (WARN_ON_ONCE(bulk != cursor->bulk)) {
+		list_del_init(&cursor->bulk_link);
+		return;
+	}
+
+	pos = &bulk->pos[cursor->mem_type][cursor->priority];
+	if (pos)
+		list_move(&cursor->hitch.link, &pos->last->lru.link);
+	ttm_resource_cursor_clear_bulk(cursor);
+}
+
+/* Move all cursors attached to a bulk move to its end */
+static void ttm_bulk_move_adjust_cursors(struct ttm_lru_bulk_move *bulk)
+{
+	struct ttm_resource_cursor *cursor, *next;
+
+	list_for_each_entry_safe(cursor, next, &bulk->cursor_list, bulk_link)
+		ttm_resource_cursor_move_bulk_tail(bulk, cursor);
+}
+
+/* Remove a cursor from an empty bulk move list */
+static void ttm_bulk_move_drop_cursors(struct ttm_lru_bulk_move *bulk)
+{
+	struct ttm_resource_cursor *cursor, *next;
+
+	list_for_each_entry_safe(cursor, next, &bulk->cursor_list, bulk_link)
+		ttm_resource_cursor_clear_bulk(cursor);
+}
+
 /**
  * ttm_resource_cursor_fini_locked() - Finalize the LRU list cursor usage
  * @cursor: The struct ttm_resource_cursor to finalize.
@@ -45,6 +88,7 @@ void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor)
 {
 	lockdep_assert_held(&cursor->man->bdev->lru_lock);
 	list_del_init(&cursor->hitch.link);
+	ttm_resource_cursor_clear_bulk(cursor);
 }
 
 /**
@@ -73,9 +117,27 @@ void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
 void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk)
 {
 	memset(bulk, 0, sizeof(*bulk));
+	INIT_LIST_HEAD(&bulk->cursor_list);
 }
 EXPORT_SYMBOL(ttm_lru_bulk_move_init);
 
+/**
+ * ttm_lru_bulk_move_fini - finalize a bulk move structure
+ * @bdev: The struct ttm_device
+ * @bulk: the structure to finalize
+ *
+ * Sanity checks that bulk moves don't have any
+ * resources left and hence no cursors attached.
+ */
+void ttm_lru_bulk_move_fini(struct ttm_device *bdev,
+			    struct ttm_lru_bulk_move *bulk)
+{
+	spin_lock(&bdev->lru_lock);
+	ttm_bulk_move_drop_cursors(bulk);
+	spin_unlock(&bdev->lru_lock);
+}
+EXPORT_SYMBOL(ttm_lru_bulk_move_fini);
+
 /**
  * ttm_lru_bulk_move_tail - bulk move range of resources to the LRU tail.
  *
@@ -88,6 +150,7 @@ void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
 {
 	unsigned i, j;
 
+	ttm_bulk_move_adjust_cursors(bulk);
 	for (i = 0; i < TTM_NUM_MEM_TYPES; ++i) {
 		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
 			struct ttm_lru_bulk_move_pos *pos = &bulk->pos[i][j];
@@ -515,6 +578,29 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 }
 EXPORT_SYMBOL(ttm_resource_manager_debug);
 
+static void
+ttm_resource_cursor_check_bulk(struct ttm_resource_cursor *cursor,
+			       struct ttm_lru_item *next_lru)
+{
+	struct ttm_resource *next = ttm_lru_item_to_res(next_lru);
+	struct ttm_lru_bulk_move *bulk = NULL;
+	struct ttm_buffer_object *bo = next->bo;
+
+	lockdep_assert_held(&cursor->man->bdev->lru_lock);
+	if (bo && bo->resource == next)
+		bulk = bo->bulk_move;
+
+	if (cursor->bulk != bulk) {
+		if (bulk) {
+			list_move_tail(&cursor->bulk_link, &bulk->cursor_list);
+			cursor->mem_type = next->mem_type;
+		} else {
+			list_del_init(&cursor->bulk_link);
+		}
+		cursor->bulk = bulk;
+	}
+}
+
 /**
  * ttm_resource_manager_first() - Start iterating over the resources
  * of a resource manager
@@ -535,6 +621,7 @@ ttm_resource_manager_first(struct ttm_resource_manager *man,
 	cursor->priority = 0;
 	cursor->man = man;
 	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
+	INIT_LIST_HEAD(&cursor->bulk_link);
 	list_add(&cursor->hitch.link, &man->lru[cursor->priority]);
 
 	return ttm_resource_manager_next(cursor);
@@ -559,6 +646,7 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 		lru = &cursor->hitch;
 		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
 			if (ttm_lru_item_is_res(lru)) {
+				ttm_resource_cursor_check_bulk(cursor, lru);
 				list_move(&cursor->hitch.link, &lru->link);
 				return ttm_lru_item_to_res(lru);
 			}
@@ -568,6 +656,7 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 			break;
 
 		list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
+		ttm_resource_cursor_clear_bulk(cursor);
 	}
 
 	ttm_resource_cursor_fini_locked(cursor);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ffda487653d8..483a88837aed 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1339,6 +1339,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
 
+	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
+
 	INIT_LIST_HEAD(&vm->preempt.exec_queues);
 	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
 
@@ -1462,6 +1464,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	mutex_destroy(&vm->snap_mutex);
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
+	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
 	kfree(vm);
 	if (flags & XE_VM_FLAG_LR_MODE)
 		xe_pm_runtime_put(xe);
@@ -1605,6 +1608,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 		XE_WARN_ON(vm->pt_root[id]);
 
 	trace_xe_vm_free(vm);
+	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
 	kfree(vm);
 }
 
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 8fac781f641e..571abb4861a6 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -269,26 +269,6 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
 	return container_of(item, struct ttm_resource, lru);
 }
 
-/**
- * struct ttm_resource_cursor
- *
- * @man: The resource manager currently being iterated over.
- * @hitch: A hitch list node inserted before the next resource
- * to iterate over.
- * @priority: the current priority
- *
- * Cursor to iterate over the resources in a manager.
- */
-struct ttm_resource_cursor {
-	struct ttm_resource_manager *man;
-	struct ttm_lru_item hitch;
-	unsigned int priority;
-};
-
-void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
-
-void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
-
 /**
  * struct ttm_lru_bulk_move_pos
  *
@@ -304,8 +284,9 @@ struct ttm_lru_bulk_move_pos {
 
 /**
  * struct ttm_lru_bulk_move
- *
  * @pos: first/last lru entry for resources in the each domain/priority
+ * @cursor_list: The list of cursors currently traversing any of
+ * the sublists of @pos. Protected by the ttm device's lru_lock.
  *
  * Container for the current bulk move state. Should be used with
  * ttm_lru_bulk_move_init() and ttm_bo_set_bulk_move().
@@ -315,8 +296,39 @@ struct ttm_lru_bulk_move_pos {
  */
 struct ttm_lru_bulk_move {
 	struct ttm_lru_bulk_move_pos pos[TTM_NUM_MEM_TYPES][TTM_MAX_BO_PRIORITY];
+	struct list_head cursor_list;
 };
 
+/**
+ * struct ttm_resource_cursor
+ * @man: The resource manager currently being iterated over
+ * @hitch: A hitch list node inserted before the next resource
+ * to iterate over.
+ * @bulk_link: A list link for the list of cursors traversing the
+ * bulk sublist of @bulk. Protected by the ttm device's lru_lock.
+ * @bulk: Pointer to struct ttm_lru_bulk_move whose subrange @hitch is
+ * inserted to. NULL if none. Never dereference this pointer since
+ * the struct ttm_lru_bulk_move object pointed to might have been
+ * freed. The pointer is only for comparison.
+ * @mem_type: The memory type of the LRU list being traversed.
+ * This field is valid iff @bulk != NULL.
+ * @priority: the current priority
+ *
+ * Cursor to iterate over the resources in a manager.
+ */
+struct ttm_resource_cursor {
+	struct ttm_resource_manager *man;
+	struct ttm_lru_item hitch;
+	struct list_head bulk_link;
+	struct ttm_lru_bulk_move *bulk;
+	unsigned int mem_type;
+	unsigned int priority;
+};
+
+void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
+
+void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
+
 /**
  * struct ttm_kmap_iter_iomap - Specialization for a struct io_mapping +
  * struct sg_table backed struct ttm_resource.
@@ -405,6 +417,8 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
 
 void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
 void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk);
+void ttm_lru_bulk_move_fini(struct ttm_device *bdev,
+			    struct ttm_lru_bulk_move *bulk);
 
 void ttm_resource_add_bulk_move(struct ttm_resource *res,
 				struct ttm_buffer_object *bo);
-- 
2.44.0

