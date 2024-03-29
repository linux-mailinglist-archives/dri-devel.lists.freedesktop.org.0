Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F6F891F15
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 15:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE52E11276D;
	Fri, 29 Mar 2024 14:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/zKPjeX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E62C10E38D;
 Fri, 29 Mar 2024 14:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711724260; x=1743260260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=52MSBTWaKXV98IjrcmQcMBTAyX4CmXnDVl4Cu1w3y4s=;
 b=L/zKPjeXiHJkmR7waFxrJGGakUALR0/vUAcdOIj0oA1jwDxtBYxFB9bD
 TjJVo6mN52Ld8NDy1wm+tdbcaHhfhGgVD+3rEuCOYZiR5CpSfFfXU2aq9
 wPe2XuikRdVt8H7BH9jRKfM5GYi1R6H2+9GeYUxBxoDy0oeI+Yf59jbnK
 OYwbpMRUeiMxDqeLGE5fAV4wbyxACVFriLFhoyQo3azPWt+wRnRYqm2fo
 0AMF3hylXBjMKP4sern7DHNSAw+q1bEUAHqf3xCmapAY4V1cyAjJWsEyj
 q3e56Wc16m3Z6Ema/lUsqLTHMUWC+W4JqisgSvyZc+4Ud0K5VOuJZzOL+ w==;
X-CSE-ConnectionGUID: 8xJIObYMSWui3U36P5zC+g==
X-CSE-MsgGUID: mzWwEpCoQWGBEE02lBQPaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="7023675"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="7023675"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 07:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="47962418"
Received: from satiarax-mobl1.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.13])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 07:57:27 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] drm/ttm, drm/amdgpu,
 drm/xe: Consider hitch moves within bulk sublist moves
Date: Fri, 29 Mar 2024 15:57:02 +0100
Message-ID: <20240329145707.3087-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329145707.3087-1-thomas.hellstrom@linux.intel.com>
References: <20240329145707.3087-1-thomas.hellstrom@linux.intel.com>
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
v4:
- Remove some leftover code causing build problems

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |  4 ++
 drivers/gpu/drm/ttm/ttm_resource.c     | 90 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm.c             |  4 ++
 include/drm/ttm/ttm_device.h           |  2 +
 include/drm/ttm/ttm_resource.h         | 55 ++++++++++------
 5 files changed, 134 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 4299ce386322..18bf174c8d47 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2368,6 +2368,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (r)
 		return r;
 
+	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
+
 	vm->is_compute_context = false;
 
 	vm->use_cpu_for_update = !!(adev->vm_manager.vm_update_mode &
@@ -2431,6 +2433,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 error_free_delayed:
 	dma_fence_put(vm->last_tlb_flush);
 	dma_fence_put(vm->last_unlocked);
+	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm->lru_bulk_move);
 	amdgpu_vm_fini_entities(vm);
 
 	return r;
@@ -2587,6 +2590,7 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 		}
 	}
 
+	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm->lru_bulk_move);
 }
 
 /**
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index ccc31ad85e3b..89f19fb6e2b3 100644
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
@@ -418,6 +481,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
 	man->bdev = bdev;
 	man->size = size;
 	man->usage = 0;
+	man->mem_type = TTM_NUM_MEM_TYPES;
 
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
 		INIT_LIST_HEAD(&man->lru[i]);
@@ -514,6 +578,27 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
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
@@ -533,6 +618,7 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 		lru = &cursor->hitch;
 		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
 			if (ttm_lru_item_is_res(lru)) {
+				ttm_resource_cursor_check_bulk(cursor, lru);
 				list_move(&cursor->hitch.link, &lru->link);
 				return ttm_lru_item_to_res(lru);
 			}
@@ -542,9 +628,10 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 			break;
 
 		list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
+		ttm_resource_cursor_clear_bulk(cursor);
 	} while (true);
 
-	list_del_init(&cursor->hitch.link);
+	ttm_resource_cursor_fini_locked(cursor);
 
 	return NULL;
 }
@@ -569,6 +656,7 @@ ttm_resource_manager_first(struct ttm_resource_manager *man,
 	cursor->priority = 0;
 	cursor->man = man;
 	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
+	INIT_LIST_HEAD(&cursor->bulk_link);
 	list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
 
 	return ttm_resource_manager_next(cursor);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8b32aa5003df..542e57e1ad07 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1361,6 +1361,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
 
+	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
+
 	INIT_LIST_HEAD(&vm->preempt.exec_queues);
 	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
 
@@ -1478,6 +1480,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	mutex_destroy(&vm->snap_mutex);
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
+	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
 	kfree(vm);
 	if (!(flags & XE_VM_FLAG_MIGRATION))
 		xe_device_mem_access_put(xe);
@@ -1617,6 +1620,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 		XE_WARN_ON(vm->pt_root[id]);
 
 	trace_xe_vm_free(vm);
+	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
 	kfree(vm);
 }
 
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index c22f30535c84..8816d5ba8cb3 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -285,6 +285,8 @@ static inline void ttm_set_driver_manager(struct ttm_device *bdev, int type,
 {
 	BUILD_BUG_ON(__builtin_constant_p(type) && type >= TTM_NUM_MEM_TYPES);
 	bdev->man_drv[type] = manager;
+	if (manager)
+		manager->mem_type = type;
 }
 
 int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index dfc01258c981..6b7bf4c18997 100644
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
@@ -303,8 +287,9 @@ struct ttm_lru_bulk_move_pos {
 
 /**
  * struct ttm_lru_bulk_move
- *
  * @pos: first/last lru entry for resources in the each domain/priority
+ * @cursor_list: The list of cursors currently traversing any of
+ * the sublists of @pos. Protected by the ttm device's lru_lock.
  *
  * Container for the current bulk move state. Should be used with
  * ttm_lru_bulk_move_init() and ttm_bo_set_bulk_move().
@@ -314,8 +299,36 @@ struct ttm_lru_bulk_move_pos {
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
@@ -404,6 +417,8 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
 
 void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
 void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk);
+void ttm_lru_bulk_move_fini(struct ttm_device *bdev,
+			    struct ttm_lru_bulk_move *bulk);
 
 void ttm_resource_add_bulk_move(struct ttm_resource *res,
 				struct ttm_buffer_object *bo);
-- 
2.44.0

