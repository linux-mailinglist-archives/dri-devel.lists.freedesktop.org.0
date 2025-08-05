Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06C7B1B25B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 12:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295D910E63C;
	Tue,  5 Aug 2025 10:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ub4RNWpM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95B010E63C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 10:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754391494; x=1785927494;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LsstS12qwuNbRPypXl7/pCr1CD29AYX3YGKnOtBB/tc=;
 b=Ub4RNWpMMvjSOOnRBkruOoJyuxUJ9Jp59U2EMEKt0L08DTJ5vkJZIixG
 7Ddo7Q9VeFTpyqqQF9Ir9CbSlIgyHbxk5F62U48T6+YfAMVTUeHYxfhfH
 YRFIXIY4CpCpEht7/maG5m+fNVvTvujKRTN7FdxkSuQq4bZ/Kere+yI98
 namQlPvyhvY043E0Wn6+3o0wbptLBnmL4KkeZjtF1i/4jUWlTMym66G85
 6GWtsEN6ebN1uv458jWdGtvEL9fQQYlTIT9eG+QKwyDhv4v52bM0EVHuP
 z5t7sdGwIQ7bPEFAVYfk6vSjLmeUehsEG7uBm4l/hbGpswP8w1C+M2Uis A==;
X-CSE-ConnectionGUID: F6tq4KAJRaCMSVKkko1D0A==
X-CSE-MsgGUID: qnVLUVslR063BoAH9S6Wxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="60321021"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="60321021"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 03:58:13 -0700
X-CSE-ConnectionGUID: qE3EXGKwR32WYUZypuksaA==
X-CSE-MsgGUID: BgzNqP2cSTe43tHbTPbSdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="195426466"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.245.254])
 ([10.245.245.254])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 03:58:11 -0700
Message-ID: <4a45548a-ad37-4778-b6de-1cda7ce258dc@linux.intel.com>
Date: Tue, 5 Aug 2025 12:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/ttm/memcg/lru: enable memcg tracking for ttm and amdgpu
 driver (complete series v2)
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>
Cc: Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>
References: <20250714052243.1149732-1-airlied@gmail.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20250714052243.1149732-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hey,

Den 2025-07-14 kl. 07:18, skrev Dave Airlie:
> Hi all,
> 
> This is a repost with some fixes and cleanups.
> 
> Differences since last posting:
> 1. Added patch 18: add a module option to allow pooled pages to not be stored in the lru per-memcg
>    (Requested by Christian Konig)
> 2. Converged the naming and stats between vmstat and memcg (Suggested by Shakeel Butt)
> 3. Cleaned up the charge/uncharge code and some other bits.
> 
> Dave.
> 
> Original cover letter:
> tl;dr: start using list_lru/numa/memcg in GPU driver core and amdgpu driver for now.
> 
> This is a complete series of patches, some of which have been sent before and reviewed,
> but I want to get the complete picture for others, and try to figure out how best to land this.
> 
> There are 3 pieces to this:
> 01->02: add support for global gpu stat counters (previously posted, patch 2 is newer)
> 03->07: port ttm pools to list_lru for numa awareness
> 08->14: add memcg stats + gpu apis, then port ttm pools to memcg aware list_lru and shrinker
> 15->17: enable amdgpu to use new functionality.
> 
> The biggest difference in the memcg code from previously is I discovered what
> obj cgroups were designed for and I'm reusing the page/objcg intergration that 
> already exists, to avoid reinventing that wheel right now.
> 
> There are some igt-gpu-tools tests I've written at:
> https://gitlab.freedesktop.org/airlied/igt-gpu-tools/-/tree/amdgpu-cgroups?ref_type=heads
> 
> One problem is there are a lot of delayed action, that probably means the testing
> needs a bit more robustness, but the tests validate all the basic paths.
> 
> Regards,
> Dave.
> 
Patch below to enable on xe as well, I ran into some issues though when testing.
After shutting down gdm3/sddm, I ran into a null dereference in mem_cgroup_uncharge_gpu_page()
from ttm_pool_free_page(), presumably because of the objects that were created without a
cgroup set. I tried to fix it in mem_cgroup_uncharge_gpu_page() by conditionally calling
refill_stock(), but that ran into an underflow instead.

Anyway, patch for xe below:
----->8-----------
drm/xe: Enable memcg accounting for TT/system

Create a flag to enable memcg accounting for XE as well.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 867087c2d1534..fd93374967c9e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -54,6 +54,7 @@ static const struct ttm_place sys_placement_flags = {
 	.flags = 0,
 };
 
+/* TTM_PL_FLAG_MEMCG is not set, those placements are used for eviction */
 static struct ttm_placement sys_placement = {
 	.num_placement = 1,
 	.placement = &sys_placement_flags,
@@ -188,6 +189,7 @@ static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
 
 		bo->placements[*c] = (struct ttm_place) {
 			.mem_type = XE_PL_TT,
+			.flags = TTM_PL_FLAG_MEMCG,
 		};
 		*c += 1;
 	}
@@ -1696,6 +1698,8 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 
 static void xe_gem_object_free(struct drm_gem_object *obj)
 {
+	struct xe_bo *bo = gem_to_xe_bo(obj);
+
 	/* Our BO reference counting scheme works as follows:
 	 *
 	 * The gem object kref is typically used throughout the driver,
@@ -1709,8 +1713,9 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
 	 * driver ttm callbacks is allowed to use the ttm_buffer_object
 	 * refcount directly if needed.
 	 */
-	__xe_bo_vunmap(gem_to_xe_bo(obj));
-	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
+	__xe_bo_vunmap(bo);
+	obj_cgroup_put(bo->ttm.objcg);
+	ttm_bo_put(&bo->ttm);
 }
 
 static void xe_gem_object_close(struct drm_gem_object *obj,
@@ -1951,6 +1956,9 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	placement = (type == ttm_bo_type_sg ||
 		     bo->flags & XE_BO_FLAG_DEFER_BACKING) ? &sys_placement :
 		&bo->placement;
+
+	if (bo->flags & XE_BO_FLAG_ACCOUNTED)
+		bo->ttm.objcg = get_obj_cgroup_from_current();
 	err = ttm_bo_init_reserved(&xe->ttm, &bo->ttm, type,
 				   placement, alignment,
 				   &ctx, NULL, resv, xe_ttm_bo_destroy);
@@ -2726,7 +2734,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, args->size & ~PAGE_MASK))
 		return -EINVAL;
 
-	bo_flags = 0;
+	bo_flags = XE_BO_FLAG_ACCOUNTED;
 	if (args->flags & DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING)
 		bo_flags |= XE_BO_FLAG_DEFER_BACKING;
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6134d82e80554..e44fc58d9a00f 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -48,6 +48,7 @@
 #define XE_BO_FLAG_GGTT2		BIT(22)
 #define XE_BO_FLAG_GGTT3		BIT(23)
 #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
+#define XE_BO_FLAG_ACCOUNTED		BIT(25)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 540f044bf4255..4db3227d65c04 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1266,7 +1266,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT |
 		   XE_BO_FLAG_GGTT_INVALIDATE;
 	if (vm && vm->xef) /* userspace */
-		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
+		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE |
+			    XE_BO_FLAG_ACCOUNTED;
 
 	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, bo_size,
 				       ttm_bo_type_kernel,
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 5729e7d3e3356..569035630ffdf 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -885,7 +885,7 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
 
 	bo = xe_bo_create_pin_map(stream->oa->xe, stream->gt->tile, NULL,
 				  size, ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT);
+				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT | XE_BO_FLAG_ACCOUNTED);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 330cc0f54a3f4..efcd54ab75e92 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -120,7 +120,8 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 		   XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
 		   XE_BO_FLAG_NO_RESV_EVICT | XE_BO_FLAG_PAGETABLE;
 	if (vm->xef) /* userspace */
-		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
+		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE |
+			    XE_BO_FLAG_ACCOUNTED;
 
 	pt->level = level;
 	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 10c8a1bcb86e8..fdf845bb717e0 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -700,6 +700,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 	bo = xe_bo_create_locked(vr->xe, NULL, NULL, end - start,
 				 ttm_bo_type_device,
 				 (IS_DGFX(xe) ? XE_BO_FLAG_VRAM(vr) : XE_BO_FLAG_SYSTEM) |
+				 XE_BO_FLAG_ACCOUNTED |
 				 XE_BO_FLAG_CPU_ADDR_MIRROR);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);

