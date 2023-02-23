Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C496A06D2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 11:58:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AFA10E4BE;
	Thu, 23 Feb 2023 10:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11E310EB04;
 Thu, 23 Feb 2023 10:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677149912; x=1708685912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hA0WPOrcI0iMRcxc4P+CCc9jAOJUSBd8NHfTvA9mQV8=;
 b=NTBnmiIL3sXZd+7wdJfvZfvAFGF8k73BlCalAPdihgwdEY5nKt+X/m8t
 3LFTK7iYNKNoxbnv+1Z2kr19piByO4+WMS1BWim1/FiVyB5MPNmOC1OMi
 ZFuJ/MdQ6G8HoC9xQILPbSKWktkwdxpG3ueI3uoUGu1sP8zXQSnEipM3u
 FiPJ5ZNnFIWXqhcndlv2A98Tp21UMBLlM9bdj/y4kQdLlaQXTImtFrOgE
 Vhe6kapxTpNfqiwq4InHU5xVo3N6xkhR1XtMw9nh+ejdpTjGlmAEnPQUo
 yyw5T8jn8Bw55mm5aLEvLKdPg4H3RPn+XcJnhxgB7an1LHALUcfltSscg w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="395665822"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="395665822"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 02:58:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="741225494"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="741225494"
Received: from skallurr-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.84])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 02:58:29 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/suballoc: Extract amdgpu_sa.c as generic
 suballocation helper
Date: Thu, 23 Feb 2023 11:57:43 +0100
Message-Id: <20230223105747.4719-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230223105747.4719-1-thomas.hellstrom@linux.intel.com>
References: <20230223105747.4719-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>, Dave Airlie <airlied@redhat.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Suballocating a buffer object is something that is not driver-specific
and useful for many drivers.

Use a slightly modified version of amdgpu_sa.c

v2:
- Style cleanups. (Thomas)
- Added / Modified documentation (Thomas)
- Use u64 for the sizes and offset. The code dates back to 2012 and
  using unsigned int will probably soon come back to bite us.
  We can consider size_t as well for better 32-bit efficiency. (Thomas)
- Add and document gfp, intr and align arguments to drm_suballoc_new()
  (Thomas)
- Use drm_printer for debug output (Thomas)

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/Kconfig        |   4 +
 drivers/gpu/drm/Makefile       |   3 +
 drivers/gpu/drm/drm_suballoc.c | 457 +++++++++++++++++++++++++++++++++
 include/drm/drm_suballoc.h     | 106 ++++++++
 4 files changed, 570 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_suballoc.c
 create mode 100644 include/drm/drm_suballoc.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index dc0f94f02a82..8fbe57407c60 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -232,6 +232,10 @@ config DRM_GEM_SHMEM_HELPER
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
index ab4460fcd63f..1e04d135e866 100644
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
index 000000000000..057cd19c44ba
--- /dev/null
+++ b/drivers/gpu/drm/drm_suballoc.c
@@ -0,0 +1,457 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright 2011 Red Hat Inc.
+ * Copyright 2023 Intel Corporation.
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
+	unsigned int i;
+
+	if (!align)
+		align = 1;
+
+	/* alignment must be a power of 2 */
+	if (WARN_ON_ONCE(align & (align - 1)))
+		align = roundup_pow_of_two(align);
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
+ * drm_suballoc_manager_fini() - Destroy the drm_suballoc_manager
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
+		sa_manager->hole = &sa_manager->olist;
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
+
+	if (sa_manager->hole == &sa->olist)
+		sa_manager->hole = sa->olist.prev;
+
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
+		if (!sa->fence || !dma_fence_is_signaled(sa->fence))
+			return;
+
+		drm_suballoc_remove_locked(sa);
+	}
+}
+
+static u64 drm_suballoc_hole_soffset(struct drm_suballoc_manager *sa_manager)
+{
+	struct list_head *hole = sa_manager->hole;
+
+	if (hole != &sa_manager->olist)
+		return list_entry(hole, struct drm_suballoc, olist)->eoffset;
+
+	return 0;
+}
+
+static u64 drm_suballoc_hole_eoffset(struct drm_suballoc_manager *sa_manager)
+{
+	struct list_head *hole = sa_manager->hole;
+
+	if (hole->next != &sa_manager->olist)
+		return list_entry(hole->next, struct drm_suballoc, olist)->soffset;
+	return sa_manager->size;
+}
+
+static bool drm_suballoc_try_alloc(struct drm_suballoc_manager *sa_manager,
+				   struct drm_suballoc *sa,
+				   u64 size, u64 align)
+{
+	u64 soffset, eoffset, wasted;
+
+	soffset = drm_suballoc_hole_soffset(sa_manager);
+	eoffset = drm_suballoc_hole_eoffset(sa_manager);
+	wasted = (align - (soffset % align)) % align;
+
+	if ((eoffset - soffset) >= (size + wasted)) {
+		soffset += wasted;
+
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
+static bool __drm_suballoc_event(struct drm_suballoc_manager *sa_manager,
+				 u64 size, u64 align)
+{
+	u64 soffset, eoffset, wasted;
+	unsigned int i;
+
+	for (i = 0; i < DRM_SUBALLOC_MAX_QUEUES; ++i)
+		if (!list_empty(&sa_manager->flist[i]))
+			return true;
+
+	soffset = drm_suballoc_hole_soffset(sa_manager);
+	eoffset = drm_suballoc_hole_eoffset(sa_manager);
+	wasted = (align - (soffset % align)) % align;
+
+	return ((eoffset - soffset) >= (size + wasted));
+}
+
+/**
+ * drm_suballoc_event() - Check if we can stop waiting
+ * @sa_manager: pointer to the sa_manager
+ * @size: number of bytes we want to allocate
+ * @align: alignment we need to match
+ *
+ * Return: true if either there is a fence we can wait for or
+ * enough free memory to satisfy the allocation directly.
+ * false otherwise.
+ */
+static bool drm_suballoc_event(struct drm_suballoc_manager *sa_manager,
+			       u64 size, u64 align)
+{
+	bool ret;
+
+	spin_lock(&sa_manager->wq.lock);
+	ret = __drm_suballoc_event(sa_manager, size, align);
+	spin_unlock(&sa_manager->wq.lock);
+	return ret;
+}
+
+static bool drm_suballoc_next_hole(struct drm_suballoc_manager *sa_manager,
+				   struct dma_fence **fences,
+				   unsigned int *tries)
+{
+	struct drm_suballoc *best_bo = NULL;
+	unsigned int i, best_idx;
+	u64 soffset, best, tmp;
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
+				      struct drm_suballoc, flist);
+
+		if (!dma_fence_is_signaled(sa->fence)) {
+			fences[i] = sa->fence;
+			continue;
+		}
+
+		/* limit the number of tries each freelist gets */
+		if (tries[i] > 2)
+			continue;
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
+		/*
+		 * We know that this one is signaled,
+		 * so it's safe to remove it.
+		 */
+		drm_suballoc_remove_locked(best_bo);
+		return true;
+	}
+	return false;
+}
+
+/**
+ * drm_suballoc_new() - Make a suballocation.
+ * @sa_manager: pointer to the sa_manager
+ * @size: number of bytes we want to suballocate.
+ * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
+ *       the argument is provided for suballocations from reclaim context or
+ *       where the caller wants to avoid pipelining rather than wait for
+ *       reclaim.
+ * @intr: Whether to perform waits interruptible. This should typically
+ *        always be true, unless the caller needs to propagate a
+ *        non-interruptible context from above layers.
+ * @align: Alignment. Must not exceed the default manager alignment.
+ *         If @align is zero, then the manager alignment is used.
+ *
+ * Try to make a suballocation of size @size, which will be rounded
+ * up to the alignment specified in specified in drm_suballoc_manager_init().
+ *
+ * Return: a new suballocated bo, or an ERR_PTR.
+ */
+struct drm_suballoc *
+drm_suballoc_new(struct drm_suballoc_manager *sa_manager, u64 size,
+		 gfp_t gfp, bool intr, u64 align)
+{
+	struct dma_fence *fences[DRM_SUBALLOC_MAX_QUEUES];
+	unsigned int tries[DRM_SUBALLOC_MAX_QUEUES];
+	unsigned int count;
+	int i, r;
+	struct drm_suballoc *sa;
+
+	if (WARN_ON_ONCE(align > sa_manager->align))
+		return ERR_PTR(-EINVAL);
+	if (WARN_ON_ONCE(size > sa_manager->size || !size))
+		return ERR_PTR(-EINVAL);
+
+	if (!align)
+		align = sa_manager->align;
+
+	sa = kmalloc(sizeof(*sa), gfp);
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
+						   size, align)) {
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
+			t = dma_fence_wait_any_timeout(fences, count, intr,
+						       MAX_SCHEDULE_TIMEOUT,
+						       NULL);
+			for (i = 0; i < count; ++i)
+				dma_fence_put(fences[i]);
+
+			r = (t > 0) ? 0 : t;
+			spin_lock(&sa_manager->wq.lock);
+		} else if (intr) {
+			/* if we have nothing to wait for block */
+			r = wait_event_interruptible_locked
+				(sa_manager->wq,
+				 __drm_suballoc_event(sa_manager, size, align));
+		} else {
+			spin_unlock(&sa_manager->wq.lock);
+			wait_event(sa_manager->wq,
+				   drm_suballoc_event(sa_manager, size, align));
+			r = 0;
+			spin_lock(&sa_manager->wq.lock);
+		}
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
+ * @suballoc: pointer to the suballocation
+ * @fence: fence that signals when suballocation is idle
+ *
+ * Free the suballocation. The suballocation can be re-used after @fence signals.
+ */
+void drm_suballoc_free(struct drm_suballoc *suballoc,
+		       struct dma_fence *fence)
+{
+	struct drm_suballoc_manager *sa_manager;
+
+	if (!suballoc)
+		return;
+
+	sa_manager = suballoc->manager;
+
+	spin_lock(&sa_manager->wq.lock);
+	if (fence && !dma_fence_is_signaled(fence)) {
+		u64 idx;
+
+		suballoc->fence = dma_fence_get(fence);
+		idx = fence->context % DRM_SUBALLOC_MAX_QUEUES;
+		list_add_tail(&suballoc->flist, &sa_manager->flist[idx]);
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
+				  struct drm_printer *p, u64 suballoc_base)
+{
+	struct drm_suballoc *i;
+
+	spin_lock(&sa_manager->wq.lock);
+	list_for_each_entry(i, &sa_manager->olist, olist) {
+		u64 soffset = i->soffset;
+		u64 eoffset = i->eoffset;
+
+		if (&i->olist == sa_manager->hole)
+			drm_puts(p, ">");
+		else
+			drm_puts(p, " ");
+
+		drm_printf(p, "[0x%010llx 0x%010llx] size %8lld",
+			   suballoc_base + soffset, suballoc_base + eoffset,
+			   eoffset - soffset);
+
+		if (i->fence)
+			drm_printf(p, " protected by 0x%016llx on context %llu",
+				   i->fence->seqno, i->fence->context);
+
+		drm_puts(p, "\n");
+	}
+	spin_unlock(&sa_manager->wq.lock);
+}
+EXPORT_SYMBOL(drm_suballoc_dump_debug_info);
+#endif
+MODULE_AUTHOR("Multiple");
+MODULE_DESCRIPTION("Range suballocator helper");
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
new file mode 100644
index 000000000000..a737f996e5ff
--- /dev/null
+++ b/include/drm/drm_suballoc.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright 2011 Red Hat Inc.
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
+#define DRM_SUBALLOC_MAX_QUEUES 32
+/**
+ * struct drm_suballoc_manager - fenced range allocations
+ * @wq: Wait queue for sleeping allocations on contention.
+ * @hole: Pointer to first hole node.
+ * @olist: List of allocated ranges.
+ * @flist: Array[fence context hash] of queues of fenced allocated ranges.
+ * @size: Size of the managed range.
+ * @align: Default alignment for the managed range.
+ */
+struct drm_suballoc_manager {
+	wait_queue_head_t wq;
+	struct list_head *hole;
+	struct list_head olist;
+	struct list_head flist[DRM_SUBALLOC_MAX_QUEUES];
+	u64 size;
+	u64 align;
+};
+
+/**
+ * struct drm_suballoc - Sub-allocated range
+ * @olist: List link for list of allocated ranges.
+ * @flist: List linkk for the manager fenced allocated ranges queues.
+ * @manager: The drm_suballoc_manager.
+ * @soffset: Start offset.
+ * @eoffset: End offset + 1 so that @eoffset - @soffset = size.
+ * @dma_fence: The fence protecting the allocation.
+ */
+struct drm_suballoc {
+	struct list_head olist;
+	struct list_head flist;
+	struct drm_suballoc_manager *manager;
+	u64 soffset;
+	u64 eoffset;
+	struct dma_fence *fence;
+};
+
+void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
+			       u64 size, u64 align);
+
+void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager);
+
+struct drm_suballoc *
+drm_suballoc_new(struct drm_suballoc_manager *sa_manager, u64 size, gfp_t gfp,
+		 bool intr, u64 align);
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
+	return sa->soffset;
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
+	return sa->eoffset;
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
+	return sa->eoffset - sa->soffset;
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
2.34.1

