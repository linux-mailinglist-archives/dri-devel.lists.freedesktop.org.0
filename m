Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 888656A191F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 10:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FAF10E7C4;
	Fri, 24 Feb 2023 09:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABD210E7C4;
 Fri, 24 Feb 2023 09:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677232358; x=1708768358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=URU63DDasHf0t/PKY2y8blCdIsylkVZDXsFFXviShro=;
 b=PRptzURfYdDcom7+ewk8uGIMgE6Dt1oKorRDob7ccP1SIDD20ip3NEhk
 LKWG+YHmK9Ta8pHmyFiZKQeQHKVAqgtn0cH4LMV4qloYMrmCZhABet8W5
 IwRyCcbasiK55s2xyl8dFHAJFv70QMNUhyudY+qxGl78EVpzy43MvabZ7
 YBOflN3qoPGuaQMd6hz6MW2YfRvT3Th78dXE40ZZsgRMLMf1ZQHGcAy4t
 2XInU19ItG6P397paNaVJvnPts3joFX2Q3t6XZKGAMdv1K21Vw+Uocb+S
 7CYEIfo9LWrLJU28wk0QWx3mlhIB7ZP4SLZnXoaYvgkeWhPN81/BF4SgC g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="331174062"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; d="scan'208";a="331174062"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 01:52:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="741612982"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; d="scan'208";a="741612982"
Received: from auliel-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.64])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 01:52:35 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/3] drm/radeon: Use the drm suballocation manager
 implementation.
Date: Fri, 24 Feb 2023 10:51:52 +0100
Message-Id: <20230224095152.30134-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230224095152.30134-1-thomas.hellstrom@linux.intel.com>
References: <20230224095152.30134-1-thomas.hellstrom@linux.intel.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@redhat.com>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Use the generic suballocation helper for radeon.

v3:
- Select the suballoc helper in Kconfig (Thomas).

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/Kconfig            |   1 +
 drivers/gpu/drm/radeon/radeon.h           |  55 +---
 drivers/gpu/drm/radeon/radeon_ib.c        |  12 +-
 drivers/gpu/drm/radeon/radeon_object.h    |  25 +-
 drivers/gpu/drm/radeon/radeon_sa.c        | 316 ++--------------------
 drivers/gpu/drm/radeon/radeon_semaphore.c |   4 +-
 6 files changed, 57 insertions(+), 356 deletions(-)

diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kconfig
index 62a596d3a891..e19d77d58810 100644
--- a/drivers/gpu/drm/radeon/Kconfig
+++ b/drivers/gpu/drm/radeon/Kconfig
@@ -8,6 +8,7 @@ config DRM_RADEON
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
         select DRM_KMS_HELPER
+	select DRM_SUBALLOC_HELPER
         select DRM_TTM
 	select DRM_TTM_HELPER
 	select SND_HDA_COMPONENT if SND_HDA_CORE
diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 57e20780a458..d19a4b1c1a8f 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -79,6 +79,7 @@
 
 #include <drm/drm_gem.h>
 #include <drm/drm_audio_component.h>
+#include <drm/drm_suballoc.h>
 
 #include "radeon_family.h"
 #include "radeon_mode.h"
@@ -511,52 +512,12 @@ struct radeon_bo {
 };
 #define gem_to_radeon_bo(gobj) container_of((gobj), struct radeon_bo, tbo.base)
 
-/* sub-allocation manager, it has to be protected by another lock.
- * By conception this is an helper for other part of the driver
- * like the indirect buffer or semaphore, which both have their
- * locking.
- *
- * Principe is simple, we keep a list of sub allocation in offset
- * order (first entry has offset == 0, last entry has the highest
- * offset).
- *
- * When allocating new object we first check if there is room at
- * the end total_size - (last_object_offset + last_object_size) >=
- * alloc_size. If so we allocate new object there.
- *
- * When there is not enough room at the end, we start waiting for
- * each sub object until we reach object_offset+object_size >=
- * alloc_size, this object then become the sub object we return.
- *
- * Alignment can't be bigger than page size.
- *
- * Hole are not considered for allocation to keep things simple.
- * Assumption is that there won't be hole (all object on same
- * alignment).
- */
 struct radeon_sa_manager {
-	wait_queue_head_t	wq;
-	struct radeon_bo	*bo;
-	struct list_head	*hole;
-	struct list_head	flist[RADEON_NUM_RINGS];
-	struct list_head	olist;
-	unsigned		size;
-	uint64_t		gpu_addr;
-	void			*cpu_ptr;
-	uint32_t		domain;
-	uint32_t		align;
-};
-
-struct radeon_sa_bo;
-
-/* sub-allocation buffer */
-struct radeon_sa_bo {
-	struct list_head		olist;
-	struct list_head		flist;
-	struct radeon_sa_manager	*manager;
-	unsigned			soffset;
-	unsigned			eoffset;
-	struct radeon_fence		*fence;
+	struct drm_suballoc_manager	base;
+	struct radeon_bo		*bo;
+	uint64_t			gpu_addr;
+	void				*cpu_ptr;
+	u32 domain;
 };
 
 /*
@@ -587,7 +548,7 @@ int radeon_mode_dumb_mmap(struct drm_file *filp,
  * Semaphores.
  */
 struct radeon_semaphore {
-	struct radeon_sa_bo	*sa_bo;
+	struct drm_suballoc	*sa_bo;
 	signed			waiters;
 	uint64_t		gpu_addr;
 };
@@ -816,7 +777,7 @@ void radeon_irq_kms_disable_hpd(struct radeon_device *rdev, unsigned hpd_mask);
  */
 
 struct radeon_ib {
-	struct radeon_sa_bo		*sa_bo;
+	struct drm_suballoc		*sa_bo;
 	uint32_t			length_dw;
 	uint64_t			gpu_addr;
 	uint32_t			*ptr;
diff --git a/drivers/gpu/drm/radeon/radeon_ib.c b/drivers/gpu/drm/radeon/radeon_ib.c
index 62b116727b4f..6a45a72488f9 100644
--- a/drivers/gpu/drm/radeon/radeon_ib.c
+++ b/drivers/gpu/drm/radeon/radeon_ib.c
@@ -61,7 +61,7 @@ int radeon_ib_get(struct radeon_device *rdev, int ring,
 {
 	int r;
 
-	r = radeon_sa_bo_new(rdev, &rdev->ring_tmp_bo, &ib->sa_bo, size, 256);
+	r = radeon_sa_bo_new(&rdev->ring_tmp_bo, &ib->sa_bo, size, 256);
 	if (r) {
 		dev_err(rdev->dev, "failed to get a new IB (%d)\n", r);
 		return r;
@@ -77,7 +77,7 @@ int radeon_ib_get(struct radeon_device *rdev, int ring,
 		/* ib pool is bound at RADEON_VA_IB_OFFSET in virtual address
 		 * space and soffset is the offset inside the pool bo
 		 */
-		ib->gpu_addr = ib->sa_bo->soffset + RADEON_VA_IB_OFFSET;
+		ib->gpu_addr = drm_suballoc_soffset(ib->sa_bo) + RADEON_VA_IB_OFFSET;
 	} else {
 		ib->gpu_addr = radeon_sa_bo_gpu_addr(ib->sa_bo);
 	}
@@ -97,7 +97,7 @@ int radeon_ib_get(struct radeon_device *rdev, int ring,
 void radeon_ib_free(struct radeon_device *rdev, struct radeon_ib *ib)
 {
 	radeon_sync_free(rdev, &ib->sync, ib->fence);
-	radeon_sa_bo_free(rdev, &ib->sa_bo, ib->fence);
+	radeon_sa_bo_free(&ib->sa_bo, ib->fence);
 	radeon_fence_unref(&ib->fence);
 }
 
@@ -201,8 +201,7 @@ int radeon_ib_pool_init(struct radeon_device *rdev)
 
 	if (rdev->family >= CHIP_BONAIRE) {
 		r = radeon_sa_bo_manager_init(rdev, &rdev->ring_tmp_bo,
-					      RADEON_IB_POOL_SIZE*64*1024,
-					      RADEON_GPU_PAGE_SIZE,
+					      RADEON_IB_POOL_SIZE*64*1024, 256,
 					      RADEON_GEM_DOMAIN_GTT,
 					      RADEON_GEM_GTT_WC);
 	} else {
@@ -210,8 +209,7 @@ int radeon_ib_pool_init(struct radeon_device *rdev)
 		 * to the command stream checking
 		 */
 		r = radeon_sa_bo_manager_init(rdev, &rdev->ring_tmp_bo,
-					      RADEON_IB_POOL_SIZE*64*1024,
-					      RADEON_GPU_PAGE_SIZE,
+					      RADEON_IB_POOL_SIZE*64*1024, 256,
 					      RADEON_GEM_DOMAIN_GTT, 0);
 	}
 	if (r) {
diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
index 0a6ef49e990a..39cc87a59a9a 100644
--- a/drivers/gpu/drm/radeon/radeon_object.h
+++ b/drivers/gpu/drm/radeon/radeon_object.h
@@ -169,15 +169,22 @@ extern void radeon_bo_fence(struct radeon_bo *bo, struct radeon_fence *fence,
 /*
  * sub allocation
  */
+static inline struct radeon_sa_manager *
+to_radeon_sa_manager(struct drm_suballoc_manager *manager)
+{
+	return container_of(manager, struct radeon_sa_manager, base);
+}
 
-static inline uint64_t radeon_sa_bo_gpu_addr(struct radeon_sa_bo *sa_bo)
+static inline uint64_t radeon_sa_bo_gpu_addr(struct drm_suballoc *sa_bo)
 {
-	return sa_bo->manager->gpu_addr + sa_bo->soffset;
+	return to_radeon_sa_manager(sa_bo->manager)->gpu_addr +
+		drm_suballoc_soffset(sa_bo);
 }
 
-static inline void * radeon_sa_bo_cpu_addr(struct radeon_sa_bo *sa_bo)
+static inline void *radeon_sa_bo_cpu_addr(struct drm_suballoc *sa_bo)
 {
-	return sa_bo->manager->cpu_ptr + sa_bo->soffset;
+	return to_radeon_sa_manager(sa_bo->manager)->cpu_ptr +
+		drm_suballoc_soffset(sa_bo);
 }
 
 extern int radeon_sa_bo_manager_init(struct radeon_device *rdev,
@@ -190,12 +197,10 @@ extern int radeon_sa_bo_manager_start(struct radeon_device *rdev,
 				      struct radeon_sa_manager *sa_manager);
 extern int radeon_sa_bo_manager_suspend(struct radeon_device *rdev,
 					struct radeon_sa_manager *sa_manager);
-extern int radeon_sa_bo_new(struct radeon_device *rdev,
-			    struct radeon_sa_manager *sa_manager,
-			    struct radeon_sa_bo **sa_bo,
-			    unsigned size, unsigned align);
-extern void radeon_sa_bo_free(struct radeon_device *rdev,
-			      struct radeon_sa_bo **sa_bo,
+extern int radeon_sa_bo_new(struct radeon_sa_manager *sa_manager,
+			    struct drm_suballoc **sa_bo,
+			    unsigned int size, unsigned int align);
+extern void radeon_sa_bo_free(struct drm_suballoc **sa_bo,
 			      struct radeon_fence *fence);
 #if defined(CONFIG_DEBUG_FS)
 extern void radeon_sa_bo_dump_debug_info(struct radeon_sa_manager *sa_manager,
diff --git a/drivers/gpu/drm/radeon/radeon_sa.c b/drivers/gpu/drm/radeon/radeon_sa.c
index 0981948bd9ed..c87a57c9c592 100644
--- a/drivers/gpu/drm/radeon/radeon_sa.c
+++ b/drivers/gpu/drm/radeon/radeon_sa.c
@@ -44,53 +44,32 @@
 
 #include "radeon.h"
 
-static void radeon_sa_bo_remove_locked(struct radeon_sa_bo *sa_bo);
-static void radeon_sa_bo_try_free(struct radeon_sa_manager *sa_manager);
-
 int radeon_sa_bo_manager_init(struct radeon_device *rdev,
 			      struct radeon_sa_manager *sa_manager,
-			      unsigned size, u32 align, u32 domain, u32 flags)
+			      unsigned int size, u32 sa_align, u32 domain,
+			      u32 flags)
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
-	for (i = 0; i < RADEON_NUM_RINGS; ++i) {
-		INIT_LIST_HEAD(&sa_manager->flist[i]);
-	}
+	int r;
 
-	r = radeon_bo_create(rdev, size, align, true,
+	r = radeon_bo_create(rdev, size, RADEON_GPU_PAGE_SIZE, true,
 			     domain, flags, NULL, NULL, &sa_manager->bo);
 	if (r) {
 		dev_err(rdev->dev, "(%d) failed to allocate bo for manager\n", r);
 		return r;
 	}
 
+	sa_manager->domain = domain;
+
+	drm_suballoc_manager_init(&sa_manager->base, size, sa_align);
+
 	return r;
 }
 
 void radeon_sa_bo_manager_fini(struct radeon_device *rdev,
 			       struct radeon_sa_manager *sa_manager)
 {
-	struct radeon_sa_bo *sa_bo, *tmp;
-
-	if (!list_empty(&sa_manager->olist)) {
-		sa_manager->hole = &sa_manager->olist,
-		radeon_sa_bo_try_free(sa_manager);
-		if (!list_empty(&sa_manager->olist)) {
-			dev_err(rdev->dev, "sa_manager is not empty, clearing anyway\n");
-		}
-	}
-	list_for_each_entry_safe(sa_bo, tmp, &sa_manager->olist, olist) {
-		radeon_sa_bo_remove_locked(sa_bo);
-	}
+	drm_suballoc_manager_fini(&sa_manager->base);
 	radeon_bo_unref(&sa_manager->bo);
-	sa_manager->size = 0;
 }
 
 int radeon_sa_bo_manager_start(struct radeon_device *rdev,
@@ -139,260 +118,34 @@ int radeon_sa_bo_manager_suspend(struct radeon_device *rdev,
 	return r;
 }
 
-static void radeon_sa_bo_remove_locked(struct radeon_sa_bo *sa_bo)
+int radeon_sa_bo_new(struct radeon_sa_manager *sa_manager,
+		     struct drm_suballoc **sa_bo,
+		     unsigned int size, unsigned int align)
 {
-	struct radeon_sa_manager *sa_manager = sa_bo->manager;
-	if (sa_manager->hole == &sa_bo->olist) {
-		sa_manager->hole = sa_bo->olist.prev;
-	}
-	list_del_init(&sa_bo->olist);
-	list_del_init(&sa_bo->flist);
-	radeon_fence_unref(&sa_bo->fence);
-	kfree(sa_bo);
-}
-
-static void radeon_sa_bo_try_free(struct radeon_sa_manager *sa_manager)
-{
-	struct radeon_sa_bo *sa_bo, *tmp;
-
-	if (sa_manager->hole->next == &sa_manager->olist)
-		return;
+	struct drm_suballoc *sa = drm_suballoc_new(&sa_manager->base, size,
+						   GFP_KERNEL, true, align);
 
-	sa_bo = list_entry(sa_manager->hole->next, struct radeon_sa_bo, olist);
-	list_for_each_entry_safe_from(sa_bo, tmp, &sa_manager->olist, olist) {
-		if (sa_bo->fence == NULL || !radeon_fence_signaled(sa_bo->fence)) {
-			return;
-		}
-		radeon_sa_bo_remove_locked(sa_bo);
+	if (IS_ERR(sa)) {
+		*sa_bo = NULL;
+		return PTR_ERR(sa);
 	}
-}
 
-static inline unsigned radeon_sa_bo_hole_soffset(struct radeon_sa_manager *sa_manager)
-{
-	struct list_head *hole = sa_manager->hole;
-
-	if (hole != &sa_manager->olist) {
-		return list_entry(hole, struct radeon_sa_bo, olist)->eoffset;
-	}
+	*sa_bo = sa;
 	return 0;
 }
 
-static inline unsigned radeon_sa_bo_hole_eoffset(struct radeon_sa_manager *sa_manager)
-{
-	struct list_head *hole = sa_manager->hole;
-
-	if (hole->next != &sa_manager->olist) {
-		return list_entry(hole->next, struct radeon_sa_bo, olist)->soffset;
-	}
-	return sa_manager->size;
-}
-
-static bool radeon_sa_bo_try_alloc(struct radeon_sa_manager *sa_manager,
-				   struct radeon_sa_bo *sa_bo,
-				   unsigned size, unsigned align)
-{
-	unsigned soffset, eoffset, wasted;
-
-	soffset = radeon_sa_bo_hole_soffset(sa_manager);
-	eoffset = radeon_sa_bo_hole_eoffset(sa_manager);
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
- * radeon_sa_event - Check if we can stop waiting
- *
- * @sa_manager: pointer to the sa_manager
- * @size: number of bytes we want to allocate
- * @align: alignment we need to match
- *
- * Check if either there is a fence we can wait for or
- * enough free memory to satisfy the allocation directly
- */
-static bool radeon_sa_event(struct radeon_sa_manager *sa_manager,
-			    unsigned size, unsigned align)
-{
-	unsigned soffset, eoffset, wasted;
-	int i;
-
-	for (i = 0; i < RADEON_NUM_RINGS; ++i) {
-		if (!list_empty(&sa_manager->flist[i])) {
-			return true;
-		}
-	}
-
-	soffset = radeon_sa_bo_hole_soffset(sa_manager);
-	eoffset = radeon_sa_bo_hole_eoffset(sa_manager);
-	wasted = (align - (soffset % align)) % align;
-
-	if ((eoffset - soffset) >= (size + wasted)) {
-		return true;
-	}
-
-	return false;
-}
-
-static bool radeon_sa_bo_next_hole(struct radeon_sa_manager *sa_manager,
-				   struct radeon_fence **fences,
-				   unsigned *tries)
-{
-	struct radeon_sa_bo *best_bo = NULL;
-	unsigned i, soffset, best, tmp;
-
-	/* if hole points to the end of the buffer */
-	if (sa_manager->hole->next == &sa_manager->olist) {
-		/* try again with its beginning */
-		sa_manager->hole = &sa_manager->olist;
-		return true;
-	}
-
-	soffset = radeon_sa_bo_hole_soffset(sa_manager);
-	/* to handle wrap around we add sa_manager->size */
-	best = sa_manager->size * 2;
-	/* go over all fence list and try to find the closest sa_bo
-	 * of the current last
-	 */
-	for (i = 0; i < RADEON_NUM_RINGS; ++i) {
-		struct radeon_sa_bo *sa_bo;
-
-		fences[i] = NULL;
-
-		if (list_empty(&sa_manager->flist[i])) {
-			continue;
-		}
-
-		sa_bo = list_first_entry(&sa_manager->flist[i],
-					 struct radeon_sa_bo, flist);
-
-		if (!radeon_fence_signaled(sa_bo->fence)) {
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
-		++tries[best_bo->fence->ring];
-		sa_manager->hole = best_bo->olist.prev;
-
-		/* we knew that this one is signaled,
-		   so it's save to remote it */
-		radeon_sa_bo_remove_locked(best_bo);
-		return true;
-	}
-	return false;
-}
-
-int radeon_sa_bo_new(struct radeon_device *rdev,
-		     struct radeon_sa_manager *sa_manager,
-		     struct radeon_sa_bo **sa_bo,
-		     unsigned size, unsigned align)
-{
-	struct radeon_fence *fences[RADEON_NUM_RINGS];
-	unsigned tries[RADEON_NUM_RINGS];
-	int i, r;
-
-	BUG_ON(align > sa_manager->align);
-	BUG_ON(size > sa_manager->size);
-
-	*sa_bo = kmalloc(sizeof(struct radeon_sa_bo), GFP_KERNEL);
-	if ((*sa_bo) == NULL) {
-		return -ENOMEM;
-	}
-	(*sa_bo)->manager = sa_manager;
-	(*sa_bo)->fence = NULL;
-	INIT_LIST_HEAD(&(*sa_bo)->olist);
-	INIT_LIST_HEAD(&(*sa_bo)->flist);
-
-	spin_lock(&sa_manager->wq.lock);
-	do {
-		for (i = 0; i < RADEON_NUM_RINGS; ++i)
-			tries[i] = 0;
-
-		do {
-			radeon_sa_bo_try_free(sa_manager);
-
-			if (radeon_sa_bo_try_alloc(sa_manager, *sa_bo,
-						   size, align)) {
-				spin_unlock(&sa_manager->wq.lock);
-				return 0;
-			}
-
-			/* see if we can skip over some allocations */
-		} while (radeon_sa_bo_next_hole(sa_manager, fences, tries));
-
-		for (i = 0; i < RADEON_NUM_RINGS; ++i)
-			radeon_fence_ref(fences[i]);
-
-		spin_unlock(&sa_manager->wq.lock);
-		r = radeon_fence_wait_any(rdev, fences, false);
-		for (i = 0; i < RADEON_NUM_RINGS; ++i)
-			radeon_fence_unref(&fences[i]);
-		spin_lock(&sa_manager->wq.lock);
-		/* if we have nothing to wait for block */
-		if (r == -ENOENT) {
-			r = wait_event_interruptible_locked(
-				sa_manager->wq, 
-				radeon_sa_event(sa_manager, size, align)
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
-void radeon_sa_bo_free(struct radeon_device *rdev, struct radeon_sa_bo **sa_bo,
+void radeon_sa_bo_free(struct drm_suballoc **sa_bo,
 		       struct radeon_fence *fence)
 {
-	struct radeon_sa_manager *sa_manager;
-
 	if (sa_bo == NULL || *sa_bo == NULL) {
 		return;
 	}
 
-	sa_manager = (*sa_bo)->manager;
-	spin_lock(&sa_manager->wq.lock);
-	if (fence && !radeon_fence_signaled(fence)) {
-		(*sa_bo)->fence = radeon_fence_ref(fence);
-		list_add_tail(&(*sa_bo)->flist,
-			      &sa_manager->flist[fence->ring]);
-	} else {
-		radeon_sa_bo_remove_locked(*sa_bo);
-	}
-	wake_up_all_locked(&sa_manager->wq);
-	spin_unlock(&sa_manager->wq.lock);
+	if (fence)
+		drm_suballoc_free(*sa_bo, &fence->base);
+	else
+		drm_suballoc_free(*sa_bo, NULL);
+
 	*sa_bo = NULL;
 }
 
@@ -400,25 +153,8 @@ void radeon_sa_bo_free(struct radeon_device *rdev, struct radeon_sa_bo **sa_bo,
 void radeon_sa_bo_dump_debug_info(struct radeon_sa_manager *sa_manager,
 				  struct seq_file *m)
 {
-	struct radeon_sa_bo *i;
+	struct drm_printer p = drm_seq_file_printer(m);
 
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
-		if (i->fence) {
-			seq_printf(m, " protected by 0x%016llx on ring %d",
-				   i->fence->seq, i->fence->ring);
-		}
-		seq_printf(m, "\n");
-	}
-	spin_unlock(&sa_manager->wq.lock);
+	drm_suballoc_dump_debug_info(&sa_manager->base, &p, sa_manager->gpu_addr);
 }
 #endif
diff --git a/drivers/gpu/drm/radeon/radeon_semaphore.c b/drivers/gpu/drm/radeon/radeon_semaphore.c
index 221e59476f64..1f0a9a4ff5ae 100644
--- a/drivers/gpu/drm/radeon/radeon_semaphore.c
+++ b/drivers/gpu/drm/radeon/radeon_semaphore.c
@@ -40,7 +40,7 @@ int radeon_semaphore_create(struct radeon_device *rdev,
 	if (*semaphore == NULL) {
 		return -ENOMEM;
 	}
-	r = radeon_sa_bo_new(rdev, &rdev->ring_tmp_bo,
+	r = radeon_sa_bo_new(&rdev->ring_tmp_bo,
 			     &(*semaphore)->sa_bo, 8, 8);
 	if (r) {
 		kfree(*semaphore);
@@ -100,7 +100,7 @@ void radeon_semaphore_free(struct radeon_device *rdev,
 		dev_err(rdev->dev, "semaphore %p has more waiters than signalers,"
 			" hardware lockup imminent!\n", *semaphore);
 	}
-	radeon_sa_bo_free(rdev, &(*semaphore)->sa_bo, fence);
+	radeon_sa_bo_free(&(*semaphore)->sa_bo, fence);
 	kfree(*semaphore);
 	*semaphore = NULL;
 }
-- 
2.34.1

