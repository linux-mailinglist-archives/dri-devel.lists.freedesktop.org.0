Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A814A9E4E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 18:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F88110EF22;
	Fri,  4 Feb 2022 17:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315A710EF0B;
 Fri,  4 Feb 2022 17:48:15 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 1/3] drm: Extract amdgpu_sa.c as a generic suballocation
 helper
Date: Fri,  4 Feb 2022 18:48:07 +0100
Message-Id: <20220204174809.3366967-2-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204174809.3366967-1-maarten.lankhorst@linux.intel.com>
References: <20220204174809.3366967-1-maarten.lankhorst@linux.intel.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Suballocating a buffer object is something that is not driver
generic, and is useful for other drivers as well.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/Makefile       |   4 +-
 drivers/gpu/drm/drm_suballoc.c | 424 +++++++++++++++++++++++++++++++++
 include/drm/drm_suballoc.h     |  78 ++++++
 3 files changed, 505 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_suballoc.c
 create mode 100644 include/drm/drm_suballoc.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 8675c2af7ae1..b848bcf8790c 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -57,7 +57,9 @@ drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o \
 		drm_scdc_helper.o drm_gem_atomic_helper.o \
 		drm_gem_framebuffer_helper.o \
 		drm_atomic_state_helper.o drm_damage_helper.o \
-		drm_format_helper.o drm_self_refresh_helper.o drm_rect.o
+		drm_format_helper.o drm_self_refresh_helper.o drm_rect.o \
+		drm_suballoc.o
+
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
 
diff --git a/drivers/gpu/drm/drm_suballoc.c b/drivers/gpu/drm/drm_suballoc.c
new file mode 100644
index 000000000000..e0bb35367b71
--- /dev/null
+++ b/drivers/gpu/drm/drm_suballoc.c
@@ -0,0 +1,424 @@
+/*
+ * Copyright 2011 Red Hat Inc.
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ *
+ */
+/*
+ * Authors:
+ *    Jerome Glisse <glisse@freedesktop.org>
+ */
+/* Algorithm:
+ *
+ * We store the last allocated bo in "hole", we always try to allocate
+ * after the last allocated bo. Principle is that in a linear GPU ring
+ * progression was is after last is the oldest bo we allocated and thus
+ * the first one that should no longer be in use by the GPU.
+ *
+ * If it's not the case we skip over the bo after last to the closest
+ * done bo if such one exist. If none exist and we are not asked to
+ * block we report failure to allocate.
+ *
+ * If we are asked to block we wait on all the oldest fence of all
+ * rings. We just wait for any of those fence to complete.
+ */
+
+#include <drm/drm_suballoc.h>
+#include <drm/drm_print.h>
+#include <linux/slab.h>
+#include <linux/sched.h>
+#include <linux/wait.h>
+#include <linux/dma-fence.h>
+
+static void drm_suballoc_remove_locked(struct drm_suballoc *sa);
+static void drm_suballoc_try_free(struct drm_suballoc_manager *sa_manager);
+
+/**
+ * drm_suballoc_manager_init - Initialise the drm_suballoc_manager
+ *
+ * @sa_manager: pointer to the sa_manager
+ * @size: number of bytes we want to suballocate
+ * @align: alignment for each suballocated chunk
+ *
+ * Prepares the suballocation manager for suballocations.
+ */
+void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
+			       u32 size, u32 align)
+{
+	u32 i;
+
+	if (!align)
+		align = 1;
+
+	/* alignment must be a power of 2 */
+	BUG_ON(align & (align - 1));
+
+	init_waitqueue_head(&sa_manager->wq);
+	sa_manager->size = size;
+	sa_manager->align = align;
+	sa_manager->hole = &sa_manager->olist;
+	INIT_LIST_HEAD(&sa_manager->olist);
+	for (i = 0; i < DRM_SUBALLOC_MAX_QUEUES; ++i)
+		INIT_LIST_HEAD(&sa_manager->flist[i]);
+}
+EXPORT_SYMBOL(drm_suballoc_manager_init);
+
+/**
+ * drm_suballoc_manager_fini - Destroy the drm_suballoc_manager
+ *
+ * @sa_manager: pointer to the sa_manager
+ *
+ * Cleans up the suballocation manager after use. All fences added
+ * with drm_suballoc_free() must be signaled, or we cannot clean up
+ * the entire manager.
+ */
+void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager)
+{
+	struct drm_suballoc *sa, *tmp;
+
+	if (!sa_manager->size)
+		return;
+
+	if (!list_empty(&sa_manager->olist)) {
+		sa_manager->hole = &sa_manager->olist,
+		drm_suballoc_try_free(sa_manager);
+		if (!list_empty(&sa_manager->olist))
+			DRM_ERROR("sa_manager is not empty, clearing anyway\n");
+	}
+	list_for_each_entry_safe(sa, tmp, &sa_manager->olist, olist) {
+		drm_suballoc_remove_locked(sa);
+	}
+
+	sa_manager->size = 0;
+}
+EXPORT_SYMBOL(drm_suballoc_manager_fini);
+
+static void drm_suballoc_remove_locked(struct drm_suballoc *sa)
+{
+	struct drm_suballoc_manager *sa_manager = sa->manager;
+	if (sa_manager->hole == &sa->olist) {
+		sa_manager->hole = sa->olist.prev;
+	}
+	list_del_init(&sa->olist);
+	list_del_init(&sa->flist);
+	dma_fence_put(sa->fence);
+	kfree(sa);
+}
+
+static void drm_suballoc_try_free(struct drm_suballoc_manager *sa_manager)
+{
+	struct drm_suballoc *sa, *tmp;
+
+	if (sa_manager->hole->next == &sa_manager->olist)
+		return;
+
+	sa = list_entry(sa_manager->hole->next, struct drm_suballoc, olist);
+	list_for_each_entry_safe_from(sa, tmp, &sa_manager->olist, olist) {
+		if (sa->fence == NULL ||
+		    !dma_fence_is_signaled(sa->fence)) {
+			return;
+		}
+		drm_suballoc_remove_locked(sa);
+	}
+}
+
+static inline unsigned drm_suballoc_hole_soffset(struct drm_suballoc_manager *sa_manager)
+{
+	struct list_head *hole = sa_manager->hole;
+
+	if (hole != &sa_manager->olist) {
+		return list_entry(hole, struct drm_suballoc, olist)->eoffset;
+	}
+	return 0;
+}
+
+static inline unsigned drm_suballoc_hole_eoffset(struct drm_suballoc_manager *sa_manager)
+{
+	struct list_head *hole = sa_manager->hole;
+
+	if (hole->next != &sa_manager->olist) {
+		return list_entry(hole->next, struct drm_suballoc, olist)->soffset;
+	}
+	return sa_manager->size;
+}
+
+static bool drm_suballoc_try_alloc(struct drm_suballoc_manager *sa_manager,
+				   struct drm_suballoc *sa,
+				   unsigned size)
+{
+	unsigned soffset, eoffset;
+
+	soffset = drm_suballoc_hole_soffset(sa_manager);
+	eoffset = drm_suballoc_hole_eoffset(sa_manager);
+
+	if ((eoffset - soffset) >= size) {
+		sa->manager = sa_manager;
+		sa->soffset = soffset;
+		sa->eoffset = soffset + size;
+		list_add(&sa->olist, sa_manager->hole);
+		INIT_LIST_HEAD(&sa->flist);
+		sa_manager->hole = &sa->olist;
+		return true;
+	}
+	return false;
+}
+
+/**
+ * drm_suballoc_event - Check if we can stop waiting
+ *
+ * @sa_manager: pointer to the sa_manager
+ * @size: number of bytes we want to allocate
+ * @align: alignment we need to match
+ *
+ * Check if either there is a fence we can wait for or
+ * enough free memory to satisfy the allocation directly
+ */
+static bool drm_suballoc_event(struct drm_suballoc_manager *sa_manager,
+			       u32 size)
+{
+	unsigned soffset, eoffset, i;
+
+	for (i = 0; i < DRM_SUBALLOC_MAX_QUEUES; ++i)
+		if (!list_empty(&sa_manager->flist[i]))
+			return true;
+
+	soffset = drm_suballoc_hole_soffset(sa_manager);
+	eoffset = drm_suballoc_hole_eoffset(sa_manager);
+
+	if ((eoffset - soffset) >= size) {
+		return true;
+	}
+
+	return false;
+}
+
+static bool drm_suballoc_next_hole(struct drm_suballoc_manager *sa_manager,
+				   struct dma_fence **fences,
+				   unsigned *tries)
+{
+	struct drm_suballoc *best_bo = NULL;
+	unsigned i, best_idx, soffset, best, tmp;
+
+	/* if hole points to the end of the buffer */
+	if (sa_manager->hole->next == &sa_manager->olist) {
+		/* try again with its beginning */
+		sa_manager->hole = &sa_manager->olist;
+		return true;
+	}
+
+	soffset = drm_suballoc_hole_soffset(sa_manager);
+	/* to handle wrap around we add sa_manager->size */
+	best = sa_manager->size * 2;
+	/* go over all fence list and try to find the closest sa
+	 * of the current last
+	 */
+	for (i = 0; i < DRM_SUBALLOC_MAX_QUEUES; ++i) {
+		struct drm_suballoc *sa;
+
+		fences[i] = NULL;
+
+		if (list_empty(&sa_manager->flist[i]))
+			continue;
+
+		sa = list_first_entry(&sa_manager->flist[i],
+					 struct drm_suballoc, flist);
+
+		if (!dma_fence_is_signaled(sa->fence)) {
+			fences[i] = sa->fence;
+			continue;
+		}
+
+		/* limit the number of tries each freelist gets */
+		if (tries[i] > 2) {
+			continue;
+		}
+
+		tmp = sa->soffset;
+		if (tmp < soffset) {
+			/* wrap around, pretend it's after */
+			tmp += sa_manager->size;
+		}
+		tmp -= soffset;
+		if (tmp < best) {
+			/* this sa bo is the closest one */
+			best = tmp;
+			best_idx = i;
+			best_bo = sa;
+		}
+	}
+
+	if (best_bo) {
+		++tries[best_idx];
+		sa_manager->hole = best_bo->olist.prev;
+
+		/* we knew that this one is signaled,
+		   so it's save to remote it */
+		drm_suballoc_remove_locked(best_bo);
+		return true;
+	}
+	return false;
+}
+
+/**
+ * drm_suballoc_new - Make a suballocation.
+ *
+ * @sa_manager: pointer to the sa_manager
+ * @size: number of bytes we want to suballocate.
+ *
+ * Try to make a suballocation of size @size, which will be rounded
+ * up to the alignment specified in specified in drm_suballoc_manager_init().
+ *
+ * Returns a new suballocated bo, or an ERR_PTR.
+ */
+struct drm_suballoc *
+drm_suballoc_new(struct drm_suballoc_manager *sa_manager, u32 size)
+{
+	struct dma_fence *fences[DRM_SUBALLOC_MAX_QUEUES];
+	unsigned tries[DRM_SUBALLOC_MAX_QUEUES];
+	unsigned count;
+	int i, r;
+	struct drm_suballoc *sa;
+
+	size = ALIGN(size, sa_manager->align);
+	if (WARN_ON_ONCE(size > sa_manager->size))
+		return ERR_PTR(-EINVAL);
+
+	sa = kmalloc(sizeof(struct drm_suballoc), GFP_KERNEL);
+	if (!sa)
+		return ERR_PTR(-ENOMEM);
+	sa->manager = sa_manager;
+	sa->fence = NULL;
+	INIT_LIST_HEAD(&sa->olist);
+	INIT_LIST_HEAD(&sa->flist);
+
+	spin_lock(&sa_manager->wq.lock);
+	do {
+		for (i = 0; i < DRM_SUBALLOC_MAX_QUEUES; ++i)
+			tries[i] = 0;
+
+		do {
+			drm_suballoc_try_free(sa_manager);
+
+			if (drm_suballoc_try_alloc(sa_manager, sa,
+						   size)) {
+				spin_unlock(&sa_manager->wq.lock);
+				return sa;
+			}
+
+			/* see if we can skip over some allocations */
+		} while (drm_suballoc_next_hole(sa_manager, fences, tries));
+
+		for (i = 0, count = 0; i < DRM_SUBALLOC_MAX_QUEUES; ++i)
+			if (fences[i])
+				fences[count++] = dma_fence_get(fences[i]);
+
+		if (count) {
+			long t;
+
+			spin_unlock(&sa_manager->wq.lock);
+			t = dma_fence_wait_any_timeout(fences, count, true,
+						       MAX_SCHEDULE_TIMEOUT,
+						       NULL);
+			for (i = 0; i < count; ++i)
+				dma_fence_put(fences[i]);
+
+			r = (t > 0) ? 0 : t;
+			spin_lock(&sa_manager->wq.lock);
+		} else {
+			/* if we have nothing to wait for block */
+			r = wait_event_interruptible_locked(
+				sa_manager->wq,
+				drm_suballoc_event(sa_manager, size)
+			);
+		}
+
+	} while (!r);
+
+	spin_unlock(&sa_manager->wq.lock);
+	kfree(sa);
+	return ERR_PTR(r);
+}
+EXPORT_SYMBOL(drm_suballoc_new);
+
+/**
+ * drm_suballoc_free - Free a suballocation
+ *
+ * @suballoc: pointer to the suballocation
+ * @fence: fence that signals when suballocation is idle
+ * @queue: the index to which queue the suballocation will be placed on the free list.
+ *
+ * Free the suballocation. The suballocation can be re-used after @fence signals.
+ * @queue is used to allow waiting on multiple fence contexts in parallel in
+ * drm_suballoc_new().
+ */
+void drm_suballoc_free(struct drm_suballoc *suballoc,
+		       struct dma_fence *fence,
+		       u32 queue)
+{
+	struct drm_suballoc_manager *sa_manager;
+
+	if (!suballoc)
+		return;
+
+	sa_manager = suballoc->manager;
+	BUG_ON(queue >= DRM_SUBALLOC_MAX_QUEUES);
+
+	spin_lock(&sa_manager->wq.lock);
+	if (fence && !dma_fence_is_signaled(fence)) {
+		suballoc->fence = dma_fence_get(fence);
+		list_add_tail(&suballoc->flist, &sa_manager->flist[queue]);
+	} else {
+		drm_suballoc_remove_locked(suballoc);
+	}
+	wake_up_all_locked(&sa_manager->wq);
+	spin_unlock(&sa_manager->wq.lock);
+}
+EXPORT_SYMBOL(drm_suballoc_free);
+
+#ifdef CONFIG_DEBUG_FS
+void drm_suballoc_dump_debug_info(struct drm_suballoc_manager *sa_manager,
+				  struct seq_file *m, u64 suballoc_base)
+{
+	struct drm_suballoc *i;
+
+	spin_lock(&sa_manager->wq.lock);
+	list_for_each_entry(i, &sa_manager->olist, olist) {
+		uint64_t soffset = i->soffset;
+		uint64_t eoffset = i->eoffset;
+		if (&i->olist == sa_manager->hole) {
+			seq_printf(m, ">");
+		} else {
+			seq_printf(m, " ");
+		}
+		seq_printf(m, "[0x%010llx 0x%010llx] size %8lld",
+			   suballoc_base + soffset, suballoc_base + eoffset, eoffset - soffset);
+
+		if (i->fence)
+			seq_printf(m, " protected by 0x%016llx on context %llu",
+				   i->fence->seqno, i->fence->context);
+
+		seq_printf(m, "\n");
+	}
+	spin_unlock(&sa_manager->wq.lock);
+}
+EXPORT_SYMBOL(drm_suballoc_dump_debug_info);
+#endif
diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
new file mode 100644
index 000000000000..846c4a792fac
--- /dev/null
+++ b/include/drm/drm_suballoc.h
@@ -0,0 +1,78 @@
+/*
+ * SPDX-License-Identifier: MIT
+ *
+ * Copyright © 2022 Intel Corporation
+ */
+#ifndef _DRM_SUBALLOC_H_
+#define _DRM_SUBALLOC_H_
+
+#include <linux/types.h>
+#include <linux/list.h>
+#include <linux/wait.h>
+
+struct dma_fence;
+struct seq_file;
+
+/* sub-allocation manager, it has to be protected by another lock.
+ * By conception this is an helper for other part of the driver
+ * like the indirect buffer or semaphore, which both have their
+ * locking.
+ *
+ * Principe is simple, we keep a list of sub allocation in offset
+ * order (first entry has offset == 0, last entry has the highest
+ * offset).
+ *
+ * When allocating new object we first check if there is room at
+ * the end total_size - (last_object_offset + last_object_size) >=
+ * alloc_size. If so we allocate new object there.
+ *
+ * When there is not enough room at the end, we start waiting for
+ * each sub object until we reach object_offset+object_size >=
+ * alloc_size, this object then become the sub object we return.
+ *
+ * Alignment can't be bigger than page size.
+ *
+ * Hole are not considered for allocation to keep things simple.
+ * Assumption is that there won't be hole (all object on same
+ * alignment).
+ *
+ * The actual buffer object handling depends on the driver,
+ * and is not part of the helper implementation.
+ */
+#define DRM_SUBALLOC_MAX_QUEUES 32
+
+struct drm_suballoc_manager {
+	wait_queue_head_t wq;
+	struct list_head *hole, olist, flist[DRM_SUBALLOC_MAX_QUEUES];
+	u32 size, align;
+};
+
+/* sub-allocation buffer */
+struct drm_suballoc {
+	struct list_head olist, flist;
+	struct drm_suballoc_manager *manager;
+	u32 soffset, eoffset;
+	struct dma_fence *fence;
+};
+
+void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
+			       u32 size, u32 align);
+void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager);
+struct drm_suballoc *drm_suballoc_new(struct drm_suballoc_manager *sa_manager,
+				      u32 size);
+void drm_suballoc_free(struct drm_suballoc *sa_bo,
+		       struct dma_fence *fence,
+		       u32 queue);
+
+#ifdef CONFIG_DEBUG_FS
+void drm_suballoc_dump_debug_info(struct drm_suballoc_manager *sa_manager,
+				  struct seq_file *m, u64 suballoc_base);
+#else
+static inline void
+drm_suballoc_dump_debug_info(struct drm_suballoc_manager *sa_manager,
+			     struct seq_file *m, u64 suballoc_base)
+{ }
+
+#endif
+
+#endif /* _DRM_SUBALLOC_H_ */
-- 
2.34.1

