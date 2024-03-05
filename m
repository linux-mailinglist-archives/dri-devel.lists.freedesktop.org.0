Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92605872389
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 17:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D824112BC6;
	Tue,  5 Mar 2024 16:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWs+DoV/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D51112BBD;
 Tue,  5 Mar 2024 16:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709654566; x=1741190566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oLfC8WEFjjGyk/QSbFo79QU5+HcOKcdVPpcHsSiay1U=;
 b=NWs+DoV/RrZIXoG40nocgGB8go1IZmeq5xAR1vHYc6d14yGNVrknZpDF
 7QpglT6cl4PKopldmPhYyKHO6rDXq2yYR0qD9nm4P3/JEwdWTyU9RkCG/
 QvlnPV9YnFGbHAXH3v1W2lmBLN7k/HjHFSTGAv1tR1g0O9k8OHmX4zBix
 cp7w3cnotuGlClRSCtJKmyIUbtA5q1kpk1xLjrSSKz8hGd6aKNb9LXUf0
 18rrN+UIOEGvtC7s6ggxHtkPa/TLARcu6Wf7TJyK3yJbEPZBIMWeWGpY7
 cG8fIsgtC11Vb9SKauxkT7o8HAHSLaVBjOastPoYGZsO5xV0oiyPLtIli w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4140915"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4140915"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 08:02:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="14001572"
Received: from haslam-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.144])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 08:02:28 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/4] drm/ttm, drm/amdgpu,
 drm/xe: Consider hitch moves within bulk sublist moves
Date: Tue,  5 Mar 2024 17:02:01 +0100
Message-ID: <20240305160202.3555-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240305160202.3555-1-thomas.hellstrom@linux.intel.com>
References: <20240305160202.3555-1-thomas.hellstrom@linux.intel.com>
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

v2:
- Completely rework the functionality
v3:
- Avoid a NULL pointer dereference assigning manager->mem_type

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |  4 ++
 drivers/gpu/drm/ttm/ttm_resource.c     | 90 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm.c             |  4 ++
 include/drm/ttm/ttm_device.h           |  5 ++
 include/drm/ttm/ttm_resource.h         | 55 ++++++++++------
 5 files changed, 137 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index ed4a8c5d26d7..7c2ee5d12bc1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2264,6 +2264,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (r)
 		return r;
 
+	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
+
 	vm->pte_support_ats = false;
 	vm->is_compute_context = false;
 
@@ -2324,6 +2326,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 error_free_delayed:
 	dma_fence_put(vm->last_tlb_flush);
 	dma_fence_put(vm->last_unlocked);
+	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm->lru_bulk_move);
 	amdgpu_vm_fini_entities(vm);
 
 	return r;
@@ -2497,6 +2500,7 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 		}
 	}
 
+	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm->lru_bulk_move);
 }
 
 /**
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 971014fca10a..0acd4bf764b2 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -32,6 +32,49 @@
 
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
+	pos = &bulk->pos[cursor->man->mem_type][cursor->priority];
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
@@ -44,6 +87,7 @@ void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor)
 {
 	lockdep_assert_held(&cursor->man->bdev->lru_lock);
 	list_del_init(&cursor->hitch.link);
+	ttm_resource_cursor_clear_bulk(cursor);
 }
 
 /**
@@ -72,9 +116,27 @@ void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
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
@@ -87,6 +149,7 @@ void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
 {
 	unsigned i, j;
 
+	ttm_bulk_move_adjust_cursors(bulk);
 	for (i = 0; i < TTM_NUM_MEM_TYPES; ++i) {
 		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
 			struct ttm_lru_bulk_move_pos *pos = &bulk->pos[i][j];
@@ -417,6 +480,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
 	man->bdev = bdev;
 	man->size = size;
 	man->usage = 0;
+	man->mem_type = TTM_NUM_MEM_TYPES;
 
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
 		INIT_LIST_HEAD(&man->lru[i]);
@@ -513,6 +577,27 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
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
+		if (bulk)
+			list_move_tail(&cursor->bulk_link, &bulk->cursor_list);
+		else
+			list_del_init(&cursor->bulk_link);
+		cursor->bulk = bulk;
+	}
+}
+
 /**
  * ttm_resource_manager_next() - Continue iterating over the resource manager
  * resources
@@ -532,6 +617,7 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 		lru = &cursor->hitch;
 		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
 			if (ttm_lru_item_is_res(lru)) {
+				ttm_resource_cursor_check_bulk(cursor, lru);
 				list_move(&cursor->hitch.link, &lru->link);
 				return ttm_lru_item_to_res(lru);
 			}
@@ -541,9 +627,10 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 			break;
 
 		list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
+		ttm_resource_cursor_clear_bulk(cursor);
 	} while (true);
 
-	list_del_init(&cursor->hitch.link);
+	ttm_resource_cursor_fini_locked(cursor);
 
 	return NULL;
 }
@@ -568,6 +655,7 @@ ttm_resource_manager_first(struct ttm_resource_manager *man,
 	cursor->priority = 0;
 	cursor->man = man;
 	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
+	INIT_LIST_HEAD(&cursor->bulk_link);
 	list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
 
 	return ttm_resource_manager_next(cursor);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 643b3701a738..9fe638f41515 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1315,6 +1315,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
 
+	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
+
 	INIT_LIST_HEAD(&vm->preempt.exec_queues);
 	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
 
@@ -1433,6 +1435,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	mutex_destroy(&vm->snap_mutex);
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
+	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
 	kfree(vm);
 	if (!(flags & XE_VM_FLAG_MIGRATION))
 		xe_device_mem_access_put(xe);
@@ -1573,6 +1576,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 
 	trace_xe_vm_free(vm);
 	dma_fence_put(vm->rebind_fence);
+	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
 	kfree(vm);
 }
 
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index c22f30535c84..07722656ffad 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -283,8 +283,13 @@ ttm_manager_type(struct ttm_device *bdev, int mem_type)
 static inline void ttm_set_driver_manager(struct ttm_device *bdev, int type,
 					  struct ttm_resource_manager *manager)
 {
+	struct ttm_resource_manager *old;
+
 	BUILD_BUG_ON(__builtin_constant_p(type) && type >= TTM_NUM_MEM_TYPES);
+	old = bdev->man_drv[type];
 	bdev->man_drv[type] = manager;
+	if (manager)
+		manager->mem_type = type;
 }
 
 int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index b9043c183205..9084f91a5802 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -211,6 +211,9 @@ struct ttm_resource_manager {
 	 * bdev->lru_lock.
 	 */
 	uint64_t usage;
+
+	/** @mem_type: The memory type used for this manager. */
+	unsigned int mem_type;
 };
 
 /**
@@ -269,25 +272,6 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
 	return container_of(item, struct ttm_resource, lru);
 }
 
-/**
- * struct ttm_resource_cursor
- * @man: The resource manager currently being iterated over
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
@@ -303,16 +287,45 @@ struct ttm_lru_bulk_move_pos {
 
 /**
  * struct ttm_lru_bulk_move
- *
  * @pos: first/last lru entry for resources in the each domain/priority
+ * @cursor_list: The list of cursors currently traversing any of
+ * the sublists of @pos. Protected by the ttm device's lru_lock.
  *
  * Container for the current bulk move state. Should be used with
  * ttm_lru_bulk_move_init() and ttm_bo_set_bulk_move().
  */
 struct ttm_lru_bulk_move {
 	struct ttm_lru_bulk_move_pos pos[TTM_NUM_MEM_TYPES][TTM_MAX_BO_PRIORITY];
+	struct list_head cursor_list;
+};
+
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
+ * @priority: the current priority
+ *
+ * Cursor to iterate over the resources in a manager.
+ */
+struct ttm_resource_cursor {
+	struct ttm_resource_manager *man;
+	struct ttm_lru_item hitch;
+	struct list_head bulk_link;
+	struct ttm_lru_bulk_move *bulk;
+	unsigned int priority;
 };
 
+void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
+
+void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
+
 /**
  * struct ttm_kmap_iter_iomap - Specialization for a struct io_mapping +
  * struct sg_table backed struct ttm_resource.
@@ -401,6 +414,8 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
 
 void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
 void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk);
+void ttm_lru_bulk_move_fini(struct ttm_device *bdev,
+			    struct ttm_lru_bulk_move *bulk);
 
 void ttm_resource_add_bulk_move(struct ttm_resource *res,
 				struct ttm_buffer_object *bo);
-- 
2.44.0

