Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA167DEBC3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 05:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C3210E7FB;
	Thu,  2 Nov 2023 04:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3D410E7FA;
 Thu,  2 Nov 2023 04:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698899071; x=1730435071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HgTUWuzDIh3D+iOw2MX6Zq7vQjeVu0sfP+jd16v7JBI=;
 b=BY7T0Ydxv2E4bVI7Kyn7mIwbP63gAXD5/WMAMyleciV42f5bje0M6iav
 cOuGqcNHL0SFQvlBoM32bGt688uZ2/EcarT8rSK5QJRVElwlpDgj7X/1p
 bYV0aQ5TeWuAO+Dy5cgiObRKhjnDKUlL6CgaSuVAAdcSgF6jWezatyrNf
 ooMWzR41NicthbEZG8XyR3yg27xa91dQ00A1TAG799xPPz3Wk/i+lyvxy
 MsXok1iAORNHu36f3bYmqf9jCbH6LnBC59rY06MOEB19uWwFKqjIEkM2c
 Pug8vhjCFJZSJOSWDluEGsAe8D6rpF4+R9vDuL8ef7tsUcJWaXYsRFrJw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452930908"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="452930908"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="884762619"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="884762619"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [RFC 03/11] drm: introduce drm evictable LRU
Date: Thu,  2 Nov 2023 00:32:58 -0400
Message-Id: <20231102043306.2931989-4-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20231102043306.2931989-1-oak.zeng@intel.com>
References: <20231102043306.2931989-1-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Thomas.Hellstrom@linux.intel.com, felix.kuehling@amd.com,
 brian.welty@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm LRU manager is introuced for resource eviction purpose. It maintains
a LRU list per resource type. It provides functions to add or remove
resource to or from the list. It also provides function to retrieve the
first entity on the LRU list.

drm LRU manager also provides functions for bulk moving resources
on the LRU lists.

drm LRU manager also does very basic memory accounting function, i.e.,
LRU manager keeps a size of this resource type and a usage member
for how much of resource has been added to this LRU manager's LRU
list. TTM resource manager memory accounting functoins such as
struct ttm_resource_manager::size and struct ttm_resource_manger::usage
are still kept. In the future, when SVM codes are in the picture,
those memory accounting functions need some rework to consider
the memory used by both TTM and SVM.

For one device, a global drm LRU manager per resource type should be
created/initialized at device initialization time. Drm LRU manager
instances are embedded in struct drm_device.

It is pretty much moving some of the ttm resource manager functions
to the drm layer. The reason of this code refactory is, we want to
create a single LRU list for memory allocated from BO(buffer object)
based driver and hmm/svm(shared virtual memory) based driver, thus BO
driver and svm driver can evict memory from each other.

Previously the LRU list in TTM resource manager (lru field in struct
ttm_reource_manager) is coupled with ttm_buffer_object concept, i.e.,
each ttm resource is backed by a ttm_buffer_object and the LRU list
is essentially a list of ttm_buffer_object. Due to this behavior, the
TTM resource manager can't be used by hmm/svm driver as we don't plan
to have the BO concept for the hmm/svm implemenation. So we decouple
the evictable LRU list from the BO concept in this series.

The design goal of drm lru manager is to make it as lean as possible.
So each lru entity only has a list node member used to link this entity
to the evictable LRU list, and the basic resource size/type/priority
of this entity. It doesn't have any driver specify information. A lru
entity also has a function pointer of evict function. This is used to
implement ttm or svm specific eviction function. A lru entity is supposed
to be embedded in a driver specific structure such as struct
ttm_resource, see the usage in the next patch of this series.

The ttm resource manager, and some of the ttm_bo functions such as
ttm_mem_evict_first will be rewriten using the new drm lru manager
library, see the next patch in this series.

The future hmm/svm implemenation will call lru manager function to add
hmm/svm allocations to the shared evictable lru list.

Lock design: previously ttm_resource LRU list is protected by a device
global ttm_device::lru_lock (bdev->lru_lock in codes). This lock also
protects ttm_buffer_object::pin_count, ttm_resource_manager::usage,
ttm_resource::bo, ttm_device::pinned list etc. With this refactory,
lru_lock is moved out of ttm_device and is added to struct drm_deive, so
it can be shared b/t ttm code and svm code.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/Makefile            |   1 +
 drivers/gpu/drm/drm_evictable_lru.c | 232 ++++++++++++++++++++++++++++
 include/drm/drm_device.h            |   7 +
 include/drm/drm_evictable_lru.h     | 188 ++++++++++++++++++++++
 4 files changed, 428 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_evictable_lru.c
 create mode 100644 include/drm/drm_evictable_lru.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 1ad88efb1752..13953b0d271b 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -46,6 +46,7 @@ drm-y := \
 	drm_vblank_work.o \
 	drm_vma_manager.o \
 	drm_gpuva_mgr.o \
+	drm_evictable_lru.o \
 	drm_writeback.o
 drm-$(CONFIG_DRM_LEGACY) += \
 	drm_agpsupport.o \
diff --git a/drivers/gpu/drm/drm_evictable_lru.c b/drivers/gpu/drm/drm_evictable_lru.c
new file mode 100644
index 000000000000..2ba9105cca03
--- /dev/null
+++ b/drivers/gpu/drm/drm_evictable_lru.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/lockdep.h>
+#include <linux/container_of.h>
+#include <drm/drm_evictable_lru.h>
+#include <drm/drm_device.h>
+
+static inline struct drm_lru_mgr *entity_to_mgr(struct drm_lru_entity *entity)
+{
+	struct drm_lru_mgr *mgr;
+
+	mgr = &entity->drm->lru_mgr[entity->mem_type];
+	BUG_ON(!mgr->used);
+
+	return mgr;
+}
+
+void drm_lru_entity_init(struct drm_lru_entity *entity, struct drm_device *drm,
+			uint32_t mem_type, uint64_t size, uint32_t priority)
+{
+	entity->drm = drm;
+	entity->mem_type = mem_type;
+	entity->size = size;
+	entity->priority = priority;
+	INIT_LIST_HEAD(&entity->lru);
+}
+
+/**
+ * drm_lru_mgr_init
+ *
+ * @mgr: drm lru manager to init
+ * @size: size of the resource managed by this manager
+ * @lock: pointer of the global lru_lock
+ *
+ * Initialize a drm lru manager
+ */
+void drm_lru_mgr_init(struct drm_lru_mgr *mgr, uint64_t size, spinlock_t *lock)
+{
+	unsigned j;
+
+	mgr->used = true;
+	mgr->size = size;
+	mgr->usage = 0;
+	mgr->lru_lock = lock;
+
+	for(j = 0; j < DRM_MAX_LRU_PRIORITY; j++)
+		INIT_LIST_HEAD(&mgr->lru[j]);
+}
+
+void drm_lru_bulk_move_init(struct drm_lru_bulk_move *bulk_move)
+{
+	memset(bulk_move, 0, sizeof(*bulk_move));
+}
+
+/**
+ * drm_lru_first
+ *
+ * @mgr: drm lru manager to iterate over
+ * @cursor: cursor of the current position
+ *
+ * Returns the first entity in drm lru manager
+ */
+struct drm_lru_entity *
+drm_lru_first(struct drm_lru_mgr *mgr, struct drm_lru_cursor *cursor)
+{
+	struct drm_lru_entity *entity;
+
+	lockdep_assert_held(mgr->lru_lock);
+
+	for(cursor->priority = 0; cursor->priority < DRM_MAX_LRU_PRIORITY; ++cursor->priority)
+		list_for_each_entry(entity, &mgr->lru[cursor->priority], lru)
+			return entity;
+
+	return NULL;
+}
+
+/**
+ * drm_lru_next
+ *
+ * @mgr: drm lru manager to iterate over
+ * @cursor: cursor of the current position
+ * @entity: the current lru entity pointer
+ *
+ * Returns the next entity from drm lru manager
+ */
+struct drm_lru_entity *
+drm_lru_next(struct drm_lru_mgr *mgr, struct drm_lru_cursor *cursor,
+		struct drm_lru_entity *entity)
+{
+	lockdep_assert_held(mgr->lru_lock);
+
+	list_for_each_entry_continue(entity, &mgr->lru[cursor->priority], lru)
+		return entity;
+
+	for(++cursor->priority; cursor->priority < DRM_MAX_LRU_PRIORITY; ++cursor->priority)
+		list_for_each_entry(entity, &mgr->lru[cursor->priority], lru)
+			return entity;
+
+	return NULL;
+}
+
+/**
+ * drm_lru_move_to_tail
+ *
+ * @entity: the lru entity to move to lru tail
+ *
+ * Move a lru entity to lru tail
+ */
+void drm_lru_move_to_tail(struct drm_lru_entity * entity)
+{
+	struct list_head *lru;
+	struct drm_lru_mgr *mgr;
+
+	mgr = entity_to_mgr(entity);
+	lockdep_assert_held(mgr->lru_lock);
+	lru = &mgr->lru[entity->priority];
+	list_move_tail(&entity->lru, lru);
+}
+
+/**
+ * drm_lru_bulk_move_range_tail
+ *
+ * @range: bulk move range
+ * @entity: lru_entity to move
+ *
+ * Move a lru_entity to the tail of a bulk move range
+ */
+void drm_lru_bulk_move_range_tail(struct drm_lru_bulk_move_range *range,
+									struct drm_lru_entity *entity)
+{
+	if (entity == range->last)
+		return;
+
+	if (entity == range->first)
+		range->first = container_of(entity->lru.next, struct drm_lru_entity, lru);
+
+	if (range->last)
+		list_move(&entity->lru, &range->last->lru);
+
+	range->last = entity;
+}
+EXPORT_SYMBOL(drm_lru_bulk_move_range_tail);
+
+/**
+ * drm_lru_bulk_move_tail - bulk move range of entities to the LRU tail.
+ *
+ * @bulk: bulk_move structure
+ *
+ * Bulk move entities to the LRU tail, only valid to use when driver makes sure that
+ * resource order never changes.
+ */
+void drm_lru_bulk_move_tail(struct drm_lru_bulk_move *bulk)
+{
+
+	unsigned i, j;
+
+	for (i = 0; i < DRM_NUM_MEM_TYPES; ++i) {
+		for (j = 0; j < DRM_MAX_LRU_PRIORITY; ++j) {
+			struct drm_lru_bulk_move_range *range = &bulk->range[i][j];
+			struct drm_lru_mgr *mgr;
+
+			if (!range->first)
+				continue;
+
+			mgr = entity_to_mgr(range->first);
+			lockdep_assert_held(mgr->lru_lock);
+			list_bulk_move_tail(&mgr->lru[range->first->priority], &range->first->lru,
+					&range->last->lru);
+		}
+	}
+}
+EXPORT_SYMBOL(drm_lru_bulk_move_tail);
+
+/**
+ * drm_lru_add_bulk_move
+ *
+ * @entity: the lru entity to add to the bulk move range
+ * @bulk_move: the bulk move ranges to add the entity
+ *
+ * Add a lru entity to the tail of a bulk move range
+ */
+void drm_lru_add_bulk_move(struct drm_lru_entity *entity,
+						struct drm_lru_bulk_move *bulk_move)
+{
+	struct drm_lru_bulk_move_range *range;
+
+	range = &bulk_move->range[entity->mem_type][entity->priority];
+
+	if (!range->first) {
+		range->first = entity;
+		range->last = entity;
+		return;
+	}
+
+	drm_lru_bulk_move_range_tail(range, entity);
+}
+
+EXPORT_SYMBOL(drm_lru_add_bulk_move);
+/**
+ * drm_lru_del_bulk_move
+ *
+ * @entity: the lru entity to move from the bulk move range
+ * @bulk_move: the bulk move ranges to move the entity out of
+ *
+ * Move a lru entity out of bulk move range. This doesn't
+ * delete entity from lru manager's lru list.
+ */
+void drm_lru_del_bulk_move(struct drm_lru_entity *entity,
+					struct drm_lru_bulk_move *bulk_move)
+{
+	struct drm_lru_bulk_move_range *range;
+
+	range = &bulk_move->range[entity->mem_type][entity->priority];
+
+	if (unlikely(WARN_ON(!range->first || !range->last) ||
+			(range->first == entity && range->last == entity))) {
+		range->first = NULL;
+		range->last = NULL;
+	} else if (range->first == entity) {
+		range->first = container_of(entity->lru.next,
+				struct drm_lru_entity, lru);
+	} else if (range->last == entity) {
+		range->last = container_of(entity->lru.prev,
+				struct drm_lru_entity, lru);
+	} else {
+		list_move(&entity->lru, &range->last->lru);
+	}
+}
+EXPORT_SYMBOL(drm_lru_del_bulk_move);
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index d0b5f42786be..1bdcd34d3f6b 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -8,6 +8,7 @@
 
 #include <drm/drm_legacy.h>
 #include <drm/drm_mode_config.h>
+#include <drm/drm_evictable_lru.h>
 
 struct drm_driver;
 struct drm_minor;
@@ -331,6 +332,12 @@ struct drm_device {
 	 */
 	spinlock_t lru_lock;
 
+	/**
+	 * @lru_mgr: Device global lru managers per memory type or memory
+	 * region. Each lru manager manages a lru list of this memory type.
+	 */
+	struct drm_lru_mgr lru_mgr[DRM_NUM_MEM_TYPES];
+
 	/* Everything below here is for legacy driver, never use! */
 	/* private: */
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
diff --git a/include/drm/drm_evictable_lru.h b/include/drm/drm_evictable_lru.h
new file mode 100644
index 000000000000..3fd6bd2475d9
--- /dev/null
+++ b/include/drm/drm_evictable_lru.h
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _DRM_EVICTABLE_LRU_H_
+#define _DRM_EVICTABLE_LRU_H_
+
+#include <linux/list.h>
+#include <linux/spinlock_types.h>
+#include <linux/spinlock.h>
+
+struct drm_device;
+
+#define DRM_MAX_LRU_PRIORITY 4
+#define DRM_NUM_MEM_TYPES 8
+
+/**
+ * struct drm_lru_entity
+ *
+ * @drm: drm device that this entity belongs to
+ * @mem_type: The memory type that this entity belongs to
+ * @size: resource size of this entity
+ * @priority: The priority of this entity
+ * @lru: least recent used list node, see &drm_lru_mgr.lru
+ *
+ * This structure represents an entity in drm_lru_mgr's
+ * list. This structure is supposed to be embedded in
+ * user's data structure.
+ */
+struct drm_lru_entity {
+	struct drm_device *drm;
+	uint32_t mem_type;
+	uint64_t size;
+	uint32_t priority;
+	struct list_head lru;
+};
+
+/**
+ * struct drm_lru_mgr
+ *
+ * @used: whether this lru manager is used or not
+ * @size: size of the resource
+ * @usage: how much resource has been used
+ * @lru_lock: a weak reference to the global lru_lock
+ * @lru: least recent used list, per priority
+ *
+ * This structure maintains all the buffer allocations
+ * in a least recent used list, so a victim for eviction
+ * can be easily found.
+ */
+struct drm_lru_mgr {
+	bool used;
+	uint64_t size;
+	uint64_t usage;
+	spinlock_t *lru_lock;
+	struct list_head lru[DRM_MAX_LRU_PRIORITY];
+};
+
+/**
+ * struct drm_lru_cursor
+ *
+ * @priority: the current priority
+ *
+ * Cursor to iterate over all entities in lru manager.
+ */
+struct drm_lru_cursor {
+	unsigned priority;
+};
+
+/**
+ * struct drm_lru_bulk_move_range
+ *
+ * @first: the first entity in the range
+ * @last: the last entity in the range
+ *
+ * Range of entities on a lru list.
+ */
+struct drm_lru_bulk_move_range
+{
+	struct drm_lru_entity *first;
+	struct drm_lru_entity *last;
+};
+
+/**
+ * struct drm_lru_bulk_move
+ *
+ * @range: An array of bulk move range, each corelates to the drm_lru_mgr's
+ * lru list of the same memory type and same priority.
+ *
+ * A collection of bulk_move range which can be used to move drm_lru_entity
+ * on the lru list in a bulk way. It should be initialized through
+ * drm_lru_bulk_move_init. Add/delete a drm_lru_entity to bulk move should call
+ * drm_lru_add_bulk_move/drm_lru_del_bulk_move.
+ */
+struct drm_lru_bulk_move {
+	struct drm_lru_bulk_move_range range[DRM_NUM_MEM_TYPES][DRM_MAX_LRU_PRIORITY];
+};
+
+
+
+/**
+ * drm_lru_add_entity
+ *
+ * @entity: the lru entity to add
+ * @mgr: the drm lru manager
+ * @priority: specify which priority list to add
+ *
+ * Add an entity to lru list
+ */
+static inline void drm_lru_add_entity(struct drm_lru_entity *entity,
+		struct drm_lru_mgr *mgr, unsigned priority)
+{
+	lockdep_assert_held(mgr->lru_lock);
+	list_add_tail(&entity->lru, &mgr->lru[priority]);
+	mgr->usage += entity->size;
+}
+
+/**
+ * drm_lru_remove_entity
+ *
+ * @entity: the lru entity to remove
+ * @mgr: the drm lru manager
+ *
+ * Remove an entity from lru list
+ */
+static inline void drm_lru_remove_entity(struct drm_lru_entity *entity,
+		struct drm_lru_mgr *mgr)
+{
+	lockdep_assert_held(mgr->lru_lock);
+	list_del_init(&entity->lru);
+	mgr->usage -= entity->size;
+}
+
+/**
+ * drm_lru_mgr_fini
+ *
+ * @mgr: the drm lru manager
+ *
+ * de-initialize a lru manager
+ */
+static inline void drm_lru_mgr_fini(struct drm_lru_mgr *mgr)
+{
+	mgr->used = false;
+}
+
+void drm_lru_entity_init(struct drm_lru_entity *entity, struct drm_device *drm,
+			uint32_t mem_type, uint64_t size, uint32_t priority);
+
+struct drm_lru_entity *
+drm_lru_first(struct drm_lru_mgr *mgr, struct drm_lru_cursor *cursor);
+
+struct drm_lru_entity *
+drm_lru_next(struct drm_lru_mgr *mgr, struct drm_lru_cursor *cursor,
+		struct drm_lru_entity *entity);
+
+void drm_lru_mgr_init(struct drm_lru_mgr *mgr, uint64_t size,
+		spinlock_t *lru_lock);
+
+void drm_lru_move_to_tail(struct drm_lru_entity * entity);
+
+void drm_lru_bulk_move_init(struct drm_lru_bulk_move *bulk_move);
+
+
+void drm_lru_bulk_move_tail(struct drm_lru_bulk_move *bulk);
+
+void drm_lru_bulk_move_range_tail(struct drm_lru_bulk_move_range *range,
+		struct drm_lru_entity *entity);
+
+void drm_lru_add_bulk_move(struct drm_lru_entity *entity,
+		struct drm_lru_bulk_move *bulk_move);
+
+void drm_lru_del_bulk_move(struct drm_lru_entity *entity,
+		struct drm_lru_bulk_move *bulk_move);
+/**
+ * drm_lru_for_each_entity
+ *
+ * @mgr: the drm lru manager
+ * @cursor: cursor for the current position
+ * @entity: the current drm_lru_entity
+ *
+ * Iterate over all entities in drm lru manager
+ */
+#define drm_lru_for_each_entity(mgr, cursor, entity)		\
+	for (entity = drm_lru_first(mgr, cursor); entity;	\
+	     entity = drm_lru_next(mgr, cursor, entity))
+
+#endif
-- 
2.26.3

