Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6257B654868
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A36D10E5A8;
	Thu, 22 Dec 2022 22:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9CE10E598;
 Thu, 22 Dec 2022 22:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671748119; x=1703284119;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2zQcwAJPqcholHx0Bd+7lHYzK8mIzw2yMGGIcUJlNJY=;
 b=ZTwekf5qmDMUJxKaDhbw8dXmxS0LzlK2mQ5HARZFEiUCG95LskN05Asu
 okzHWMia6SFH63JQM6n+Lu6IWv4LGqOlbdDabeOzTBVlTI/xWPMMs5aut
 2TQlbacZUtm4BF0DRcSPVj+1KR2PZ7/tAwsdxqnEy7bKN14JpokhStf6e
 khWTe/5hYFmmhWWYCtQKK7DmBmYEAxtuzBb6ByNQtHzvtTKtcy3zo32Eo
 +LCqC0Z4dkyWANvHrsFXlNtJAvhkItzpTqUQHxC2BmXIQ1RdBz0EYdyj9
 O0R6m3K+jJmJLXXQxgYffFdJ9+eYxUDJuhKsjCiJdHhUcqYOlFRBB9JXu A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="406472846"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="406472846"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="645412303"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="645412303"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 01/20] drm/suballoc: Introduce a generic suballocation
 manager
Date: Thu, 22 Dec 2022 14:21:08 -0800
Message-Id: <20221222222127.34560-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221222222127.34560-1-matthew.brost@intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
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

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Initially we tried to leverage the amdgpu suballocation manager.
It turnes out, however, that it tries extremely hard not to enable
signalling on the fences that hold the memory up for freeing, which makes
it hard to understand and to fix potential issues with it.

So in a simplification effort, introduce a drm suballocation manager as a
wrapper around an existing allocator (drm_mm) and to avoid using queues
for freeing, thus avoiding throttling on free which is an undesired
feature as typically the throttling needs to be done uninterruptible.

This variant is probably more cpu-hungry but can be improved at the cost
of additional complexity. Ideas for that are documented in the
drm_suballoc.c file.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Co-developed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/Kconfig        |   4 +
 drivers/gpu/drm/Makefile       |   3 +
 drivers/gpu/drm/drm_suballoc.c | 301 +++++++++++++++++++++++++++++++++
 include/drm/drm_suballoc.h     | 112 ++++++++++++
 4 files changed, 420 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_suballoc.c
 create mode 100644 include/drm/drm_suballoc.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 663ea8f9966d..ad231a68c2a5 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -233,6 +233,10 @@ config DRM_GEM_SHMEM_HELPER
 	help
 	  Choose this if you need the GEM shmem helper functions
 
+config DRM_SUBALLOC_HELPER
+	tristate
+	depends on DRM
+
 config DRM_SCHED
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 496fa5a6147a..23ad760884b2 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -88,6 +88,9 @@ obj-$(CONFIG_DRM_GEM_DMA_HELPER) += drm_dma_helper.o
 drm_shmem_helper-y := drm_gem_shmem_helper.o
 obj-$(CONFIG_DRM_GEM_SHMEM_HELPER) += drm_shmem_helper.o
 
+drm_suballoc_helper-y := drm_suballoc.o
+obj-$(CONFIG_DRM_SUBALLOC_HELPER) += drm_suballoc_helper.o
+
 drm_vram_helper-y := drm_gem_vram_helper.o
 obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
 
diff --git a/drivers/gpu/drm/drm_suballoc.c b/drivers/gpu/drm/drm_suballoc.c
new file mode 100644
index 000000000000..6e0292dea548
--- /dev/null
+++ b/drivers/gpu/drm/drm_suballoc.c
@@ -0,0 +1,301 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <drm/drm_suballoc.h>
+
+/**
+ * DOC:
+ * This suballocator intends to be a wrapper around a range allocator
+ * that is aware also of deferred range freeing with fences. Currently
+ * we hard-code the drm_mm as the range allocator.
+ * The approach, while rather simple, suffers from three performance
+ * issues that can all be fixed if needed at the tradeoff of more and / or
+ * more complex code:
+ *
+ * 1) It's cpu-hungry, the drm_mm allocator is overkill. Either code a
+ * much simpler range allocator, or let the caller decide by providing
+ * ops that wrap any range allocator. Also could avoid waking up unless
+ * there is a reasonable chance of enough space in the range manager.
+ *
+ * 2) We unnecessarily install the fence callbacks too early, forcing
+ * enable_signaling() too early causing extra driver effort. This is likely
+ * not an issue if used with the drm_scheduler since it calls
+ * enable_signaling() early anyway.
+ *
+ * 3) Long processing in irq (disabled) context. We've mostly worked around
+ * that already by using the idle_list. If that workaround is deemed to
+ * complex for little gain, we can remove it and use spin_lock_irq()
+ * throughout the manager. If we want to shorten processing in irq context
+ * even further, we can skip the spin_trylock in __drm_suballoc_free() and
+ * avoid freeing allocations from irq context altogeher. However drm_mm
+ * should be quite fast at freeing ranges.
+ *
+ * 4) Shrinker that starts processing the list items in 2) and 3) to play
+ * better with the system.
+ */
+
+static void drm_suballoc_process_idle(struct drm_suballoc_manager *sa_manager);
+
+/**
+ * drm_suballoc_manager_init() - Initialise the drm_suballoc_manager
+ * @sa_manager: pointer to the sa_manager
+ * @size: number of bytes we want to suballocate
+ * @align: alignment for each suballocated chunk
+ *
+ * Prepares the suballocation manager for suballocations.
+ */
+void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
+			       u64 size, u64 align)
+{
+	spin_lock_init(&sa_manager->lock);
+	spin_lock_init(&sa_manager->idle_list_lock);
+	mutex_init(&sa_manager->alloc_mutex);
+	drm_mm_init(&sa_manager->mm, 0, size);
+	init_waitqueue_head(&sa_manager->wq);
+	sa_manager->range_size = size;
+	sa_manager->alignment = align;
+	INIT_LIST_HEAD(&sa_manager->idle_list);
+}
+EXPORT_SYMBOL(drm_suballoc_manager_init);
+
+/**
+ * drm_suballoc_manager_fini() - Destroy the drm_suballoc_manager
+ * @sa_manager: pointer to the sa_manager
+ *
+ * Cleans up the suballocation manager after use. All fences added
+ * with drm_suballoc_free() must be signaled, or we cannot clean up
+ * the entire manager.
+ */
+void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager)
+{
+	drm_suballoc_process_idle(sa_manager);
+	drm_mm_takedown(&sa_manager->mm);
+	mutex_destroy(&sa_manager->alloc_mutex);
+}
+EXPORT_SYMBOL(drm_suballoc_manager_fini);
+
+static void __drm_suballoc_free(struct drm_suballoc *sa)
+{
+	struct drm_suballoc_manager *sa_manager = sa->manager;
+	struct dma_fence *fence;
+
+	/*
+	 * In order to avoid protecting the potentially lengthy drm_mm manager
+	 * *allocation* processing with an irq-disabling lock,
+	 * defer touching the drm_mm for freeing until we're in task context,
+	 * with no irqs disabled, or happen to succeed in taking the manager
+	 * lock.
+	 */
+	if (!in_task() || irqs_disabled()) {
+		unsigned long irqflags;
+
+		if (spin_trylock(&sa_manager->lock))
+			goto locked;
+
+		spin_lock_irqsave(&sa_manager->idle_list_lock, irqflags);
+		list_add_tail(&sa->idle_link, &sa_manager->idle_list);
+		spin_unlock_irqrestore(&sa_manager->idle_list_lock, irqflags);
+		wake_up(&sa_manager->wq);
+		return;
+	}
+
+	spin_lock(&sa_manager->lock);
+locked:
+	drm_mm_remove_node(&sa->node);
+
+	fence = sa->fence;
+	sa->fence = NULL;
+	spin_unlock(&sa_manager->lock);
+	/* Maybe only wake if first mm hole is sufficiently large? */
+	wake_up(&sa_manager->wq);
+	dma_fence_put(fence);
+	kfree(sa);
+}
+
+/* Free all deferred idle allocations */
+static void drm_suballoc_process_idle(struct drm_suballoc_manager *sa_manager)
+{
+	/*
+	 * prepare_to_wait() / wake_up() semantics ensure that any list
+	 * addition that was done before wake_up() is visible when
+	 * this code is called from the wait loop.
+	 */
+	if (!list_empty_careful(&sa_manager->idle_list)) {
+		struct drm_suballoc *sa, *next;
+		unsigned long irqflags;
+		LIST_HEAD(list);
+
+		spin_lock_irqsave(&sa_manager->idle_list_lock, irqflags);
+		list_splice_init(&sa_manager->idle_list, &list);
+		spin_unlock_irqrestore(&sa_manager->idle_list_lock, irqflags);
+
+		list_for_each_entry_safe(sa, next, &list, idle_link)
+			__drm_suballoc_free(sa);
+	}
+}
+
+static void
+drm_suballoc_fence_signaled(struct dma_fence *fence, struct dma_fence_cb *cb)
+{
+	struct drm_suballoc *sa = container_of(cb, typeof(*sa), cb);
+
+	__drm_suballoc_free(sa);
+}
+
+static int drm_suballoc_tryalloc(struct drm_suballoc *sa, u64 size)
+{
+	struct drm_suballoc_manager *sa_manager = sa->manager;
+	int err;
+
+	drm_suballoc_process_idle(sa_manager);
+	spin_lock(&sa_manager->lock);
+	err = drm_mm_insert_node_generic(&sa_manager->mm, &sa->node, size,
+					 sa_manager->alignment, 0,
+					 DRM_MM_INSERT_EVICT);
+	spin_unlock(&sa_manager->lock);
+	return err;
+}
+
+/**
+ * drm_suballoc_new() - Make a suballocation.
+ * @sa_manager: pointer to the sa_manager
+ * @size: number of bytes we want to suballocate.
+ * @gfp: Allocation context.
+ * @intr: Whether to sleep interruptibly if sleeping.
+ *
+ * Try to make a suballocation of size @size, which will be rounded
+ * up to the alignment specified in specified in drm_suballoc_manager_init().
+ *
+ * Returns a new suballocated bo, or an ERR_PTR.
+ */
+struct drm_suballoc*
+drm_suballoc_new(struct drm_suballoc_manager *sa_manager, u64 size,
+		 gfp_t gfp, bool intr)
+{
+	struct drm_suballoc *sa;
+	DEFINE_WAIT(wait);
+	int err = 0;
+
+	if (size > sa_manager->range_size)
+		return ERR_PTR(-ENOSPC);
+
+	sa = kzalloc(sizeof(*sa), gfp);
+	if (!sa)
+		return ERR_PTR(-ENOMEM);
+
+	/* Avoid starvation using the alloc_mutex */
+	if (intr)
+		err = mutex_lock_interruptible(&sa_manager->alloc_mutex);
+	else
+		mutex_lock(&sa_manager->alloc_mutex);
+	if (err) {
+		kfree(sa);
+		return ERR_PTR(err);
+	}
+
+	sa->manager = sa_manager;
+	err = drm_suballoc_tryalloc(sa, size);
+	if (err != -ENOSPC)
+		goto out;
+
+	for (;;) {
+		prepare_to_wait(&sa_manager->wq, &wait,
+				intr ? TASK_INTERRUPTIBLE :
+				TASK_UNINTERRUPTIBLE);
+
+		err = drm_suballoc_tryalloc(sa, size);
+		if (err != -ENOSPC)
+			break;
+
+		if (intr && signal_pending(current)) {
+			err = -ERESTARTSYS;
+			break;
+		}
+
+		io_schedule();
+	}
+	finish_wait(&sa_manager->wq, &wait);
+
+out:
+	mutex_unlock(&sa_manager->alloc_mutex);
+	if (!sa->node.size) {
+		kfree(sa);
+		WARN_ON(!err);
+		sa = ERR_PTR(err);
+	}
+
+	return sa;
+}
+EXPORT_SYMBOL(drm_suballoc_new);
+
+/**
+ * drm_suballoc_free() - Free a suballocation
+ * @suballoc: pointer to the suballocation
+ * @fence: fence that signals when suballocation is idle
+ * @queue: the index to which queue the suballocation will be placed on the free list.
+ *
+ * Free the suballocation. The suballocation can be re-used after @fence
+ * signals.
+ */
+void
+drm_suballoc_free(struct drm_suballoc *sa, struct dma_fence *fence)
+{
+	if (!sa)
+		return;
+
+	if (!fence || dma_fence_is_signaled(fence)) {
+		__drm_suballoc_free(sa);
+		return;
+	}
+
+	sa->fence = dma_fence_get(fence);
+	if (dma_fence_add_callback(fence, &sa->cb, drm_suballoc_fence_signaled))
+		__drm_suballoc_free(sa);
+}
+EXPORT_SYMBOL(drm_suballoc_free);
+
+#ifdef CONFIG_DEBUG_FS
+
+/**
+ * drm_suballoc_dump_debug_info() - Dump the suballocator state
+ * @sa_manager: The suballoc manager.
+ * @p: Pointer to a drm printer for output.
+ * @suballoc_base: Constant to add to the suballocated offsets on printout.
+ *
+ * This function dumps the suballocator state. Note that the caller has
+ * to explicitly order frees and calls to this function in order for the
+ * freed node to show up as protected by a fence.
+ */
+void drm_suballoc_dump_debug_info(struct drm_suballoc_manager *sa_manager,
+				  struct drm_printer *p, u64 suballoc_base)
+{
+	const struct drm_mm_node *entry;
+
+	spin_lock(&sa_manager->lock);
+	drm_mm_for_each_node(entry, &sa_manager->mm) {
+		struct drm_suballoc *sa =
+			container_of(entry, typeof(*sa), node);
+
+		drm_printf(p, " ");
+		drm_printf(p, "[0x%010llx 0x%010llx] size %8lld",
+			   (unsigned long long)suballoc_base + entry->start,
+			   (unsigned long long)suballoc_base + entry->start +
+			   entry->size, (unsigned long long)entry->size);
+
+		if (sa->fence)
+			drm_printf(p, " protected by 0x%016llx on context %llu",
+				   (unsigned long long)sa->fence->seqno,
+				   (unsigned long long)sa->fence->context);
+
+		drm_printf(p, "\n");
+	}
+	spin_unlock(&sa_manager->lock);
+}
+EXPORT_SYMBOL(drm_suballoc_dump_debug_info);
+#endif
+
+MODULE_AUTHOR("Intel Corporation");
+MODULE_DESCRIPTION("Simple range suballocator helper");
+MODULE_LICENSE("GPL and additional rights");
diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
new file mode 100644
index 000000000000..910952b3383b
--- /dev/null
+++ b/include/drm/drm_suballoc.h
@@ -0,0 +1,112 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+#ifndef _DRM_SUBALLOC_H_
+#define _DRM_SUBALLOC_H_
+
+#include <drm/drm_mm.h>
+
+#include <linux/dma-fence.h>
+#include <linux/types.h>
+
+/**
+ * struct drm_suballoc_manager - Wrapper for fenced range allocations
+ * @mm: The range manager. Protected by @lock.
+ * @range_size: The total size of the range.
+ * @alignment: Range alignment.
+ * @wq: Wait queue for sleeping allocations on contention.
+ * @idle_list: List of idle but not yet freed allocations. Protected by
+ * @idle_list_lock.
+ * @task: Task waiting for allocation. Protected by @lock.
+ */
+struct drm_suballoc_manager {
+	/** @lock: Manager lock. Protects @mm. */
+	spinlock_t lock;
+	/**
+	 * @idle_list_lock: Lock to protect the idle_list.
+	 * Disable irqs when locking.
+	 */
+	spinlock_t idle_list_lock;
+	/** @alloc_mutex: Mutex to protect against stavation. */
+	struct mutex alloc_mutex;
+	struct drm_mm mm;
+	u64 range_size;
+	u64 alignment;
+	wait_queue_head_t wq;
+	struct list_head idle_list;
+};
+
+/**
+ * struct drm_suballoc: Suballocated range.
+ * @node: The drm_mm representation of the range.
+ * @fence: dma-fence indicating whether allocation is active or idle.
+ * Assigned on call to free the allocation so doesn't need protection.
+ * @cb: dma-fence callback structure. Used for callbacks when the fence signals.
+ * @manager: The struct drm_suballoc_manager the range belongs to. Immutable.
+ * @idle_link: Link for the manager idle_list. Progected by the
+ * drm_suballoc_manager::idle_lock.
+ */
+struct drm_suballoc {
+	struct drm_mm_node node;
+	struct dma_fence *fence;
+	struct dma_fence_cb cb;
+	struct drm_suballoc_manager *manager;
+	struct list_head idle_link;
+};
+
+void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
+			       u64 size, u64 align);
+
+void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager);
+
+struct drm_suballoc *drm_suballoc_new(struct drm_suballoc_manager *sa_manager,
+				      u64 size, gfp_t gfp, bool intr);
+
+void drm_suballoc_free(struct drm_suballoc *sa, struct dma_fence *fence);
+
+/**
+ * drm_suballoc_soffset - Range start.
+ * @sa: The struct drm_suballoc.
+ *
+ * Return: The start of the allocated range.
+ */
+static inline u64 drm_suballoc_soffset(struct drm_suballoc *sa)
+{
+	return sa->node.start;
+}
+
+/**
+ * drm_suballoc_eoffset - Range end.
+ * @sa: The struct drm_suballoc.
+ *
+ * Return: The end of the allocated range + 1.
+ */
+static inline u64 drm_suballoc_eoffset(struct drm_suballoc *sa)
+{
+	return sa->node.start + sa->node.size;
+}
+
+/**
+ * drm_suballoc_size - Range size.
+ * @sa: The struct drm_suballoc.
+ *
+ * Return: The size of the allocated range.
+ */
+static inline u64 drm_suballoc_size(struct drm_suballoc *sa)
+{
+	return sa->node.size;
+}
+
+#ifdef CONFIG_DEBUG_FS
+void drm_suballoc_dump_debug_info(struct drm_suballoc_manager *sa_manager,
+				  struct drm_printer *p, u64 suballoc_base);
+#else
+static inline void
+drm_suballoc_dump_debug_info(struct drm_suballoc_manager *sa_manager,
+			     struct drm_printer *p, u64 suballoc_base)
+{ }
+
+#endif
+
+#endif /* _DRM_SUBALLOC_H_ */
-- 
2.37.3

