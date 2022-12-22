Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B185654866
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDF710E5A6;
	Thu, 22 Dec 2022 22:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9801710E599;
 Thu, 22 Dec 2022 22:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671748119; x=1703284119;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=QgHMSl/OsurdkSkdAX2z/Dl+kEqlgsPvrt0O+LquwPg=;
 b=eHml3r40EEa7HHRJUueZQn0W9WZRWY1rpETTX7bWmDL1fzf0ff1JoZ6T
 haNqs5DTfnSl33biwngkbcIZhtOMLrX11vxPOYrSmnoBE/ZGRK1+tn2MQ
 4DjZUykDfZxVyQIT6nUYkwlEN2r58sf99waMcmZwreoqCceUercsNjPqw
 TkEB15KOBlsdKgh8JXSqgddf4fwnSVEKeqx/Wiiimd/ZvXZDIrq4RUYZO
 EEfl/wkJzNcZvBIQZPgLLcrm/sAGjGPI/b9Yke7mp93kd+H9gDK04c5ss
 Mf4zCZT3pxhlyxEXJAsHGkEf3sGv8lA/NX1Ckpg4zXEocF9PTbfcYvioM Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="406472847"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="406472847"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="645412304"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="645412304"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 02/20] drm/amd: Convert amdgpu to use suballocation helper.
Date: Thu, 22 Dec 2022 14:21:09 -0800
Message-Id: <20221222222127.34560-3-matthew.brost@intel.com>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Now that we have a generic suballocation helper, Use it in amdgpu.
The debug output is slightly different and suballocation may be
slightly more cpu-hungry.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/Kconfig                    |   1 +
 drivers/gpu/drm/amd/amdgpu/Kconfig         |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c     |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c     | 320 ++-------------------
 7 files changed, 43 insertions(+), 336 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index ad231a68c2a5..de45c3c059f0 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -78,6 +78,7 @@ config DRM_KUNIT_TEST
 	select DRM_DISPLAY_HELPER
 	select DRM_LIB_RANDOM
 	select DRM_KMS_HELPER
+	select DRM_SUBALLOC_HELPER
 	select DRM_BUDDY
 	select DRM_EXPORT_FOR_TESTS if m
 	select DRM_KUNIT_TEST_HELPERS
diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 5fcd510f1abb..eef179b81d0f 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -16,6 +16,7 @@ config DRM_AMDGPU
 	select BACKLIGHT_CLASS_DEVICE
 	select INTERVAL_TREE
 	select DRM_BUDDY
+	select DRM_SUBALLOC_HELPER
 	# amdgpu depends on ACPI_VIDEO when ACPI is enabled, for select to work
 	# ACPI_VIDEO's dependencies must also be selected.
 	select INPUT if ACPI
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 2644cd991210..009903e21d83 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -422,29 +422,11 @@ struct amdgpu_clock {
  * alignment).
  */
 
-#define AMDGPU_SA_NUM_FENCE_LISTS	32
-
 struct amdgpu_sa_manager {
-	wait_queue_head_t	wq;
-	struct amdgpu_bo	*bo;
-	struct list_head	*hole;
-	struct list_head	flist[AMDGPU_SA_NUM_FENCE_LISTS];
-	struct list_head	olist;
-	unsigned		size;
-	uint64_t		gpu_addr;
-	void			*cpu_ptr;
-	uint32_t		domain;
-	uint32_t		align;
-};
-
-/* sub-allocation buffer */
-struct amdgpu_sa_bo {
-	struct list_head		olist;
-	struct list_head		flist;
-	struct amdgpu_sa_manager	*manager;
-	unsigned			soffset;
-	unsigned			eoffset;
-	struct dma_fence	        *fence;
+	struct drm_suballoc_manager	base;
+	struct amdgpu_bo		*bo;
+	uint64_t			gpu_addr;
+	void				*cpu_ptr;
 };
 
 int amdgpu_fence_slab_init(void);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
index bcccc348dbe2..5621b63c7f42 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
@@ -69,7 +69,7 @@ int amdgpu_ib_get(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 
 	if (size) {
 		r = amdgpu_sa_bo_new(&adev->ib_pools[pool_type],
-				      &ib->sa_bo, size, 256);
+				      &ib->sa_bo, size);
 		if (r) {
 			dev_err(adev->dev, "failed to get a new IB (%d)\n", r);
 			return r;
@@ -309,8 +309,7 @@ int amdgpu_ib_pool_init(struct amdgpu_device *adev)
 
 	for (i = 0; i < AMDGPU_IB_POOL_MAX; i++) {
 		r = amdgpu_sa_bo_manager_init(adev, &adev->ib_pools[i],
-					      AMDGPU_IB_POOL_SIZE,
-					      AMDGPU_GPU_PAGE_SIZE,
+					      AMDGPU_IB_POOL_SIZE, 256,
 					      AMDGPU_GEM_DOMAIN_GTT);
 		if (r)
 			goto error;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 93207badf83f..568baf15d5b1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -336,15 +336,22 @@ uint32_t amdgpu_bo_get_preferred_domain(struct amdgpu_device *adev,
 /*
  * sub allocation
  */
+static inline struct amdgpu_sa_manager *
+to_amdgpu_sa_manager(struct drm_suballoc_manager *manager)
+{
+	return container_of(manager, struct amdgpu_sa_manager, base);
+}
 
-static inline uint64_t amdgpu_sa_bo_gpu_addr(struct amdgpu_sa_bo *sa_bo)
+static inline uint64_t amdgpu_sa_bo_gpu_addr(struct drm_suballoc *sa_bo)
 {
-	return sa_bo->manager->gpu_addr + sa_bo->soffset;
+	return to_amdgpu_sa_manager(sa_bo->manager)->gpu_addr +
+		drm_suballoc_soffset(sa_bo);
 }
 
-static inline void * amdgpu_sa_bo_cpu_addr(struct amdgpu_sa_bo *sa_bo)
+static inline void * amdgpu_sa_bo_cpu_addr(struct drm_suballoc *sa_bo)
 {
-	return sa_bo->manager->cpu_ptr + sa_bo->soffset;
+	return to_amdgpu_sa_manager(sa_bo->manager)->cpu_ptr +
+		drm_suballoc_soffset(sa_bo);
 }
 
 int amdgpu_sa_bo_manager_init(struct amdgpu_device *adev,
@@ -355,11 +362,11 @@ void amdgpu_sa_bo_manager_fini(struct amdgpu_device *adev,
 int amdgpu_sa_bo_manager_start(struct amdgpu_device *adev,
 				      struct amdgpu_sa_manager *sa_manager);
 int amdgpu_sa_bo_new(struct amdgpu_sa_manager *sa_manager,
-		     struct amdgpu_sa_bo **sa_bo,
-		     unsigned size, unsigned align);
+		     struct drm_suballoc **sa_bo,
+		     unsigned size);
 void amdgpu_sa_bo_free(struct amdgpu_device *adev,
-			      struct amdgpu_sa_bo **sa_bo,
-			      struct dma_fence *fence);
+		       struct drm_suballoc **sa_bo,
+		       struct dma_fence *fence);
 #if defined(CONFIG_DEBUG_FS)
 void amdgpu_sa_bo_dump_debug_info(struct amdgpu_sa_manager *sa_manager,
 					 struct seq_file *m);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index f752c7ae7f60..6dd2a3b7e434 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -27,6 +27,7 @@
 #include <drm/amdgpu_drm.h>
 #include <drm/gpu_scheduler.h>
 #include <drm/drm_print.h>
+#include <drm/drm_suballoc.h>
 
 struct amdgpu_device;
 struct amdgpu_ring;
@@ -92,7 +93,7 @@ enum amdgpu_ib_pool_type {
 };
 
 struct amdgpu_ib {
-	struct amdgpu_sa_bo		*sa_bo;
+	struct drm_suballoc		*sa_bo;
 	uint32_t			length_dw;
 	uint64_t			gpu_addr;
 	uint32_t			*ptr;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c
index 524d10b21041..e7b3539e0294 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c
@@ -44,327 +44,61 @@
 
 #include "amdgpu.h"
 
-static void amdgpu_sa_bo_remove_locked(struct amdgpu_sa_bo *sa_bo);
-static void amdgpu_sa_bo_try_free(struct amdgpu_sa_manager *sa_manager);
-
 int amdgpu_sa_bo_manager_init(struct amdgpu_device *adev,
 			      struct amdgpu_sa_manager *sa_manager,
-			      unsigned size, u32 align, u32 domain)
+			      unsigned size, u32 suballoc_align, u32 domain)
 {
-	int i, r;
-
-	init_waitqueue_head(&sa_manager->wq);
-	sa_manager->bo = NULL;
-	sa_manager->size = size;
-	sa_manager->domain = domain;
-	sa_manager->align = align;
-	sa_manager->hole = &sa_manager->olist;
-	INIT_LIST_HEAD(&sa_manager->olist);
-	for (i = 0; i < AMDGPU_SA_NUM_FENCE_LISTS; ++i)
-		INIT_LIST_HEAD(&sa_manager->flist[i]);
+	int r;
 
-	r = amdgpu_bo_create_kernel(adev, size, align, domain, &sa_manager->bo,
+	r = amdgpu_bo_create_kernel(adev, size, AMDGPU_GPU_PAGE_SIZE, domain, &sa_manager->bo,
 				&sa_manager->gpu_addr, &sa_manager->cpu_ptr);
 	if (r) {
 		dev_err(adev->dev, "(%d) failed to allocate bo for manager\n", r);
 		return r;
 	}
 
-	memset(sa_manager->cpu_ptr, 0, sa_manager->size);
+	memset(sa_manager->cpu_ptr, 0, size);
+	drm_suballoc_manager_init(&sa_manager->base, size, suballoc_align);
 	return r;
 }
 
 void amdgpu_sa_bo_manager_fini(struct amdgpu_device *adev,
 			       struct amdgpu_sa_manager *sa_manager)
 {
-	struct amdgpu_sa_bo *sa_bo, *tmp;
-
 	if (sa_manager->bo == NULL) {
 		dev_err(adev->dev, "no bo for sa manager\n");
 		return;
 	}
 
-	if (!list_empty(&sa_manager->olist)) {
-		sa_manager->hole = &sa_manager->olist,
-		amdgpu_sa_bo_try_free(sa_manager);
-		if (!list_empty(&sa_manager->olist)) {
-			dev_err(adev->dev, "sa_manager is not empty, clearing anyway\n");
-		}
-	}
-	list_for_each_entry_safe(sa_bo, tmp, &sa_manager->olist, olist) {
-		amdgpu_sa_bo_remove_locked(sa_bo);
-	}
+	drm_suballoc_manager_fini(&sa_manager->base);
 
 	amdgpu_bo_free_kernel(&sa_manager->bo, &sa_manager->gpu_addr, &sa_manager->cpu_ptr);
-	sa_manager->size = 0;
 }
 
-static void amdgpu_sa_bo_remove_locked(struct amdgpu_sa_bo *sa_bo)
-{
-	struct amdgpu_sa_manager *sa_manager = sa_bo->manager;
-	if (sa_manager->hole == &sa_bo->olist) {
-		sa_manager->hole = sa_bo->olist.prev;
-	}
-	list_del_init(&sa_bo->olist);
-	list_del_init(&sa_bo->flist);
-	dma_fence_put(sa_bo->fence);
-	kfree(sa_bo);
-}
-
-static void amdgpu_sa_bo_try_free(struct amdgpu_sa_manager *sa_manager)
+int amdgpu_sa_bo_new(struct amdgpu_sa_manager *sa_manager,
+		     struct drm_suballoc **sa_bo,
+		     unsigned size)
 {
-	struct amdgpu_sa_bo *sa_bo, *tmp;
+	struct drm_suballoc *sa = drm_suballoc_new(&sa_manager->base, size, GFP_KERNEL, true);
 
-	if (sa_manager->hole->next == &sa_manager->olist)
-		return;
+	if (IS_ERR(sa)) {
+		*sa_bo = NULL;
 
-	sa_bo = list_entry(sa_manager->hole->next, struct amdgpu_sa_bo, olist);
-	list_for_each_entry_safe_from(sa_bo, tmp, &sa_manager->olist, olist) {
-		if (sa_bo->fence == NULL ||
-		    !dma_fence_is_signaled(sa_bo->fence)) {
-			return;
-		}
-		amdgpu_sa_bo_remove_locked(sa_bo);
+		return PTR_ERR(sa);
 	}
-}
 
-static inline unsigned amdgpu_sa_bo_hole_soffset(struct amdgpu_sa_manager *sa_manager)
-{
-	struct list_head *hole = sa_manager->hole;
-
-	if (hole != &sa_manager->olist) {
-		return list_entry(hole, struct amdgpu_sa_bo, olist)->eoffset;
-	}
+	*sa_bo = sa;
 	return 0;
 }
 
-static inline unsigned amdgpu_sa_bo_hole_eoffset(struct amdgpu_sa_manager *sa_manager)
-{
-	struct list_head *hole = sa_manager->hole;
-
-	if (hole->next != &sa_manager->olist) {
-		return list_entry(hole->next, struct amdgpu_sa_bo, olist)->soffset;
-	}
-	return sa_manager->size;
-}
-
-static bool amdgpu_sa_bo_try_alloc(struct amdgpu_sa_manager *sa_manager,
-				   struct amdgpu_sa_bo *sa_bo,
-				   unsigned size, unsigned align)
-{
-	unsigned soffset, eoffset, wasted;
-
-	soffset = amdgpu_sa_bo_hole_soffset(sa_manager);
-	eoffset = amdgpu_sa_bo_hole_eoffset(sa_manager);
-	wasted = (align - (soffset % align)) % align;
-
-	if ((eoffset - soffset) >= (size + wasted)) {
-		soffset += wasted;
-
-		sa_bo->manager = sa_manager;
-		sa_bo->soffset = soffset;
-		sa_bo->eoffset = soffset + size;
-		list_add(&sa_bo->olist, sa_manager->hole);
-		INIT_LIST_HEAD(&sa_bo->flist);
-		sa_manager->hole = &sa_bo->olist;
-		return true;
-	}
-	return false;
-}
-
-/**
- * amdgpu_sa_event - Check if we can stop waiting
- *
- * @sa_manager: pointer to the sa_manager
- * @size: number of bytes we want to allocate
- * @align: alignment we need to match
- *
- * Check if either there is a fence we can wait for or
- * enough free memory to satisfy the allocation directly
- */
-static bool amdgpu_sa_event(struct amdgpu_sa_manager *sa_manager,
-			    unsigned size, unsigned align)
-{
-	unsigned soffset, eoffset, wasted;
-	int i;
-
-	for (i = 0; i < AMDGPU_SA_NUM_FENCE_LISTS; ++i)
-		if (!list_empty(&sa_manager->flist[i]))
-			return true;
-
-	soffset = amdgpu_sa_bo_hole_soffset(sa_manager);
-	eoffset = amdgpu_sa_bo_hole_eoffset(sa_manager);
-	wasted = (align - (soffset % align)) % align;
-
-	if ((eoffset - soffset) >= (size + wasted)) {
-		return true;
-	}
-
-	return false;
-}
-
-static bool amdgpu_sa_bo_next_hole(struct amdgpu_sa_manager *sa_manager,
-				   struct dma_fence **fences,
-				   unsigned *tries)
-{
-	struct amdgpu_sa_bo *best_bo = NULL;
-	unsigned i, soffset, best, tmp;
-
-	/* if hole points to the end of the buffer */
-	if (sa_manager->hole->next == &sa_manager->olist) {
-		/* try again with its beginning */
-		sa_manager->hole = &sa_manager->olist;
-		return true;
-	}
-
-	soffset = amdgpu_sa_bo_hole_soffset(sa_manager);
-	/* to handle wrap around we add sa_manager->size */
-	best = sa_manager->size * 2;
-	/* go over all fence list and try to find the closest sa_bo
-	 * of the current last
-	 */
-	for (i = 0; i < AMDGPU_SA_NUM_FENCE_LISTS; ++i) {
-		struct amdgpu_sa_bo *sa_bo;
-
-		fences[i] = NULL;
-
-		if (list_empty(&sa_manager->flist[i]))
-			continue;
-
-		sa_bo = list_first_entry(&sa_manager->flist[i],
-					 struct amdgpu_sa_bo, flist);
-
-		if (!dma_fence_is_signaled(sa_bo->fence)) {
-			fences[i] = sa_bo->fence;
-			continue;
-		}
-
-		/* limit the number of tries each ring gets */
-		if (tries[i] > 2) {
-			continue;
-		}
-
-		tmp = sa_bo->soffset;
-		if (tmp < soffset) {
-			/* wrap around, pretend it's after */
-			tmp += sa_manager->size;
-		}
-		tmp -= soffset;
-		if (tmp < best) {
-			/* this sa bo is the closest one */
-			best = tmp;
-			best_bo = sa_bo;
-		}
-	}
-
-	if (best_bo) {
-		uint32_t idx = best_bo->fence->context;
-
-		idx %= AMDGPU_SA_NUM_FENCE_LISTS;
-		++tries[idx];
-		sa_manager->hole = best_bo->olist.prev;
-
-		/* we knew that this one is signaled,
-		   so it's save to remote it */
-		amdgpu_sa_bo_remove_locked(best_bo);
-		return true;
-	}
-	return false;
-}
-
-int amdgpu_sa_bo_new(struct amdgpu_sa_manager *sa_manager,
-		     struct amdgpu_sa_bo **sa_bo,
-		     unsigned size, unsigned align)
-{
-	struct dma_fence *fences[AMDGPU_SA_NUM_FENCE_LISTS];
-	unsigned tries[AMDGPU_SA_NUM_FENCE_LISTS];
-	unsigned count;
-	int i, r;
-	signed long t;
-
-	if (WARN_ON_ONCE(align > sa_manager->align))
-		return -EINVAL;
-
-	if (WARN_ON_ONCE(size > sa_manager->size))
-		return -EINVAL;
-
-	*sa_bo = kmalloc(sizeof(struct amdgpu_sa_bo), GFP_KERNEL);
-	if (!(*sa_bo))
-		return -ENOMEM;
-	(*sa_bo)->manager = sa_manager;
-	(*sa_bo)->fence = NULL;
-	INIT_LIST_HEAD(&(*sa_bo)->olist);
-	INIT_LIST_HEAD(&(*sa_bo)->flist);
-
-	spin_lock(&sa_manager->wq.lock);
-	do {
-		for (i = 0; i < AMDGPU_SA_NUM_FENCE_LISTS; ++i)
-			tries[i] = 0;
-
-		do {
-			amdgpu_sa_bo_try_free(sa_manager);
-
-			if (amdgpu_sa_bo_try_alloc(sa_manager, *sa_bo,
-						   size, align)) {
-				spin_unlock(&sa_manager->wq.lock);
-				return 0;
-			}
-
-			/* see if we can skip over some allocations */
-		} while (amdgpu_sa_bo_next_hole(sa_manager, fences, tries));
-
-		for (i = 0, count = 0; i < AMDGPU_SA_NUM_FENCE_LISTS; ++i)
-			if (fences[i])
-				fences[count++] = dma_fence_get(fences[i]);
-
-		if (count) {
-			spin_unlock(&sa_manager->wq.lock);
-			t = dma_fence_wait_any_timeout(fences, count, false,
-						       MAX_SCHEDULE_TIMEOUT,
-						       NULL);
-			for (i = 0; i < count; ++i)
-				dma_fence_put(fences[i]);
-
-			r = (t > 0) ? 0 : t;
-			spin_lock(&sa_manager->wq.lock);
-		} else {
-			/* if we have nothing to wait for block */
-			r = wait_event_interruptible_locked(
-				sa_manager->wq,
-				amdgpu_sa_event(sa_manager, size, align)
-			);
-		}
-
-	} while (!r);
-
-	spin_unlock(&sa_manager->wq.lock);
-	kfree(*sa_bo);
-	*sa_bo = NULL;
-	return r;
-}
-
-void amdgpu_sa_bo_free(struct amdgpu_device *adev, struct amdgpu_sa_bo **sa_bo,
+void amdgpu_sa_bo_free(struct amdgpu_device *adev, struct drm_suballoc **sa_bo,
 		       struct dma_fence *fence)
 {
-	struct amdgpu_sa_manager *sa_manager;
-
 	if (sa_bo == NULL || *sa_bo == NULL) {
 		return;
 	}
 
-	sa_manager = (*sa_bo)->manager;
-	spin_lock(&sa_manager->wq.lock);
-	if (fence && !dma_fence_is_signaled(fence)) {
-		uint32_t idx;
-
-		(*sa_bo)->fence = dma_fence_get(fence);
-		idx = fence->context % AMDGPU_SA_NUM_FENCE_LISTS;
-		list_add_tail(&(*sa_bo)->flist, &sa_manager->flist[idx]);
-	} else {
-		amdgpu_sa_bo_remove_locked(*sa_bo);
-	}
-	wake_up_all_locked(&sa_manager->wq);
-	spin_unlock(&sa_manager->wq.lock);
+	drm_suballoc_free(*sa_bo, fence);
 	*sa_bo = NULL;
 }
 
@@ -373,26 +107,8 @@ void amdgpu_sa_bo_free(struct amdgpu_device *adev, struct amdgpu_sa_bo **sa_bo,
 void amdgpu_sa_bo_dump_debug_info(struct amdgpu_sa_manager *sa_manager,
 				  struct seq_file *m)
 {
-	struct amdgpu_sa_bo *i;
-
-	spin_lock(&sa_manager->wq.lock);
-	list_for_each_entry(i, &sa_manager->olist, olist) {
-		uint64_t soffset = i->soffset + sa_manager->gpu_addr;
-		uint64_t eoffset = i->eoffset + sa_manager->gpu_addr;
-		if (&i->olist == sa_manager->hole) {
-			seq_printf(m, ">");
-		} else {
-			seq_printf(m, " ");
-		}
-		seq_printf(m, "[0x%010llx 0x%010llx] size %8lld",
-			   soffset, eoffset, eoffset - soffset);
+	struct drm_printer p = drm_seq_file_printer(m);
 
-		if (i->fence)
-			seq_printf(m, " protected by 0x%016llx on context %llu",
-				   i->fence->seqno, i->fence->context);
-
-		seq_printf(m, "\n");
-	}
-	spin_unlock(&sa_manager->wq.lock);
+	drm_suballoc_dump_debug_info(&sa_manager->base, &p, sa_manager->gpu_addr);
 }
 #endif
-- 
2.37.3

