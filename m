Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C953FC5D8
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 13:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA688825E;
	Tue, 31 Aug 2021 11:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6FD89A88
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 11:21:23 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id e26so5523905wmk.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 04:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oYPf296A3Y7Hvm/DHgjWvSu1IZZMLQXi7ACNzY2U4vk=;
 b=CnKUVWRa2kSEYmc3oZ4zA1ir4GbEVgLFZ6+Gwk1Ch7WR6JiRYdSsu++KT2T1Sb+yBV
 SFMJx3ofGU8T8oPdZXvEd54Bz/SFw6HhKkpCtx3cZtxsGGmd/MZOspKzKY9mifWpxbm7
 lOluD0ORB1lzxnv7qrfe1lSjb73a5F0trQ1CVB2GlJHuNpZ4B2i/gta6gsJGcMytD9KU
 A46TGiwL86O/THsVh8kkT9viv7GKS3c319dg1qFRsYklbVjOxVYTce8KKRk/+YzgIgr9
 sJh4In/whE19JVuszcceafL2kVi21mxfGtXOyhYbu89xBmZaMj7JeOLaYfYdNeseyRdv
 kKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oYPf296A3Y7Hvm/DHgjWvSu1IZZMLQXi7ACNzY2U4vk=;
 b=axAzgKbYXxAKgq2kQske5R4R8b2OCnz2jnE7XJQAVHbWkrS3yt1hHMkzNYOuzjl27l
 utaZSUrBPul7DnVGtN/VKMNSGhz2j93OBve6LTyDIXu1nnP781ia6mhGnwl2oe3QNEYl
 3Y2wxZ55Ey9SgGTs7CyaCHcP6yTr2gU4DkwvJ0LbQRlHX1VFHuX3LhSOX7aKeoS+g/Gs
 fbjO0hWfSvaS3XagrqXtkx74RchOkcpN2oSLi5+QjFvT1faxIeH+6JEAfcaGO1PfJSZi
 X+IQU0scTDNVRbwD6YpHNgknOfk+gz06tfHKJHpRiKJegKF02H1VCTKzIG/8UXKngsfG
 f3kg==
X-Gm-Message-State: AOAM530D8GtI/m4XjRMuPDDgsctOmIvIWpsaMEkEAoscKEHfhZDmqlCA
 GP98lDUU5l+xT/gA6g/Qeck3p6fMymF0Kqf2
X-Google-Smtp-Source: ABdhPJyrkfVb6mKOGAM4DR2QXQ15Uv6N2x3diY0IMDSTsXoU2frg3aSiX2+xmVk+lWYhhMIO/pHkVg==
X-Received: by 2002:a05:600c:21cd:: with SMTP id
 x13mr3600094wmj.20.1630408882152; 
 Tue, 31 Aug 2021 04:21:22 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 g5sm18054957wrq.80.2021.08.31.04.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 04:21:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 ray.huang@amd.com
Subject: [PATCH 5/5] drm/ttm: remove busy placement handling
Date: Tue, 31 Aug 2021 13:21:10 +0200
Message-Id: <20210831112110.113196-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831112110.113196-1-christian.koenig@amd.com>
References: <20210831112110.113196-1-christian.koenig@amd.com>
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

Drivers can now use the flags for this.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  7 --
 drivers/gpu/drm/drm_gem_vram_helper.c      |  2 -
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  4 --
 drivers/gpu/drm/nouveau/nouveau_bo.c       |  2 -
 drivers/gpu/drm/qxl/qxl_object.c           |  2 -
 drivers/gpu/drm/qxl/qxl_ttm.c              |  2 -
 drivers/gpu/drm/radeon/radeon_object.c     |  3 -
 drivers/gpu/drm/radeon/radeon_ttm.c        | 11 +--
 drivers/gpu/drm/radeon/radeon_uvd.c        |  1 -
 drivers/gpu/drm/ttm/ttm_bo.c               | 13 ++--
 drivers/gpu/drm/ttm/ttm_resource.c         | 41 ++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         |  2 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 78 +++++++++++++---------
 include/drm/ttm/ttm_placement.h            |  4 --
 15 files changed, 66 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 327b8af6cc1a..225c48e2aaf7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -200,9 +200,6 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 
 	placement->num_placement = c;
 	placement->placement = places;
-
-	placement->num_busy_placement = c;
-	placement->busy_placement = places;
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 27f0acb7b3da..808ad7880017 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -98,16 +98,13 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 	/* Don't handle scatter gather BOs */
 	if (bo->type == ttm_bo_type_sg) {
 		placement->num_placement = 0;
-		placement->num_busy_placement = 0;
 		return;
 	}
 
 	/* Object isn't an AMDGPU object so ignore */
 	if (!amdgpu_bo_is_amdgpu_bo(bo)) {
 		placement->placement = &placements;
-		placement->busy_placement = &placements;
 		placement->num_placement = 1;
-		placement->num_busy_placement = 1;
 		return;
 	}
 
@@ -122,7 +119,6 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 			dma_fence_enable_sw_signaling(fence);
 
 		placement->num_placement = 0;
-		placement->num_busy_placement = 0;
 		rcu_read_unlock();
 		return;
 	}
@@ -132,7 +128,6 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 	case AMDGPU_PL_GWS:
 	case AMDGPU_PL_OA:
 		placement->num_placement = 0;
-		placement->num_busy_placement = 0;
 		return;
 
 	case TTM_PL_VRAM:
@@ -972,8 +967,6 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
 	/* allocate GART space */
 	placement.num_placement = 1;
 	placement.placement = &placements;
-	placement.num_busy_placement = 1;
-	placement.busy_placement = &placements;
 	placements.fpfn = 0;
 	placements.lpfn = adev->gmc.gart_size >> PAGE_SHIFT;
 	placements.mem_type = TTM_PL_TT;
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index bfa386b98134..e1de06f48fd2 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -145,7 +145,6 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
 		invariant_flags = TTM_PL_FLAG_TOPDOWN;
 
 	gbo->placement.placement = gbo->placements;
-	gbo->placement.busy_placement = gbo->placements;
 
 	if (pl_flag & DRM_GEM_VRAM_PL_FLAG_VRAM) {
 		gbo->placements[c].mem_type = TTM_PL_VRAM;
@@ -158,7 +157,6 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
 	}
 
 	gbo->placement.num_placement = c;
-	gbo->placement.num_busy_placement = c;
 
 	for (i = 0; i < c; ++i) {
 		gbo->placements[i].fpfn = 0;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index e646aac9d7a4..3d99a86260e9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -59,15 +59,11 @@ static const struct ttm_place lmem0_sys_placement_flags[] = {
 static struct ttm_placement i915_lmem0_placement = {
 	.num_placement = 1,
 	.placement = &lmem0_sys_placement_flags[0],
-	.num_busy_placement = 1,
-	.busy_placement = &lmem0_sys_placement_flags[0],
 };
 
 static struct ttm_placement i915_sys_placement = {
 	.num_placement = 1,
 	.placement = &lmem0_sys_placement_flags[1],
-	.num_busy_placement = 1,
-	.busy_placement = &lmem0_sys_placement_flags[1],
 };
 
 static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index d46e87f1c9c3..f8732d03573d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -355,7 +355,6 @@ nouveau_bo_placement_set(struct nouveau_bo *nvbo, uint32_t domain,
 	unsigned i, fpfn, lpfn;
 
 	nvbo->placement.placement = pl;
-	nvbo->placement.busy_placement = pl;
 	busy &= ~domain;
 	domain |= busy;
 
@@ -378,7 +377,6 @@ nouveau_bo_placement_set(struct nouveau_bo *nvbo, uint32_t domain,
 			TTM_PL_FLAG_BUSY : 0;
 		(*n)++;
 	}
-	nvbo->placement.num_busy_placement = *n;
 
 	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_CELSIUS &&
 	    nvbo->mode && (domain & NOUVEAU_GEM_DOMAIN_VRAM) &&
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index fbb36e3e8564..577ad225e681 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -66,7 +66,6 @@ void qxl_ttm_placement_from_domain(struct qxl_bo *qbo, u32 domain)
 		pflag |= TTM_PL_FLAG_TOPDOWN;
 
 	qbo->placement.placement = qbo->placements;
-	qbo->placement.busy_placement = qbo->placements;
 	if (domain == QXL_GEM_DOMAIN_VRAM) {
 		qbo->placements[c].mem_type = TTM_PL_VRAM;
 		qbo->placements[c++].flags = pflag;
@@ -86,7 +85,6 @@ void qxl_ttm_placement_from_domain(struct qxl_bo *qbo, u32 domain)
 		qbo->placements[c++].flags = 0;
 	}
 	qbo->placement.num_placement = c;
-	qbo->placement.num_busy_placement = c;
 	for (i = 0; i < c; ++i) {
 		qbo->placements[i].fpfn = 0;
 		qbo->placements[i].lpfn = 0;
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index b2e33d5ba5d0..a622c66d070c 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -60,9 +60,7 @@ static void qxl_evict_flags(struct ttm_buffer_object *bo,
 
 	if (!qxl_ttm_bo_is_qxl_bo(bo)) {
 		placement->placement = &placements;
-		placement->busy_placement = &placements;
 		placement->num_placement = 1;
-		placement->num_busy_placement = 1;
 		return;
 	}
 	qbo = to_qxl_bo(bo);
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 56ede9d63b12..fba3f3ad86dd 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -99,7 +99,6 @@ void radeon_ttm_placement_from_domain(struct radeon_bo *rbo, u32 domain)
 	u32 c = 0, i;
 
 	rbo->placement.placement = rbo->placements;
-	rbo->placement.busy_placement = rbo->placements;
 	if (domain & RADEON_GEM_DOMAIN_VRAM) {
 		/* Try placing BOs which don't need CPU access outside of the
 		 * CPU accessible part of VRAM
@@ -135,8 +134,6 @@ void radeon_ttm_placement_from_domain(struct radeon_bo *rbo, u32 domain)
 	}
 
 	rbo->placement.num_placement = c;
-	rbo->placement.num_busy_placement = c;
-
 	for (i = 0; i < c; ++i) {
 		if ((rbo->flags & RADEON_GEM_CPU_ACCESS) &&
 		    (rbo->placements[i].mem_type == TTM_PL_VRAM) &&
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 7793249bc549..564afbe3da58 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -93,9 +93,7 @@ static void radeon_evict_flags(struct ttm_buffer_object *bo,
 
 	if (!radeon_ttm_bo_is_radeon_bo(bo)) {
 		placement->placement = &placements;
-		placement->busy_placement = &placements;
 		placement->num_placement = 1;
-		placement->num_busy_placement = 1;
 		return;
 	}
 	rbo = container_of(bo, struct radeon_bo, tbo);
@@ -113,17 +111,14 @@ static void radeon_evict_flags(struct ttm_buffer_object *bo,
 			 * BO will be evicted to GTT rather than causing other
 			 * BOs to be evicted from VRAM
 			 */
-			radeon_ttm_placement_from_domain(rbo, RADEON_GEM_DOMAIN_VRAM |
+			radeon_ttm_placement_from_domain(rbo,
+							 RADEON_GEM_DOMAIN_VRAM |
 							 RADEON_GEM_DOMAIN_GTT);
-			rbo->placement.num_busy_placement = 0;
 			for (i = 0; i < rbo->placement.num_placement; i++) {
 				if (rbo->placements[i].mem_type == TTM_PL_VRAM) {
 					if (rbo->placements[i].fpfn < fpfn)
 						rbo->placements[i].fpfn = fpfn;
-				} else {
-					rbo->placement.busy_placement =
-						&rbo->placements[i];
-					rbo->placement.num_busy_placement = 1;
+					rbo->placements[i].flags |= TTM_PL_FLAG_IDLE;
 				}
 			}
 		} else
diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
index 2ea86919d953..86fee8bfc3e4 100644
--- a/drivers/gpu/drm/radeon/radeon_uvd.c
+++ b/drivers/gpu/drm/radeon/radeon_uvd.c
@@ -324,7 +324,6 @@ void radeon_uvd_force_into_uvd_segment(struct radeon_bo *rbo,
 	rbo->placements[1].fpfn += (256 * 1024 * 1024) >> PAGE_SHIFT;
 	rbo->placements[1].lpfn += (256 * 1024 * 1024) >> PAGE_SHIFT;
 	rbo->placement.num_placement++;
-	rbo->placement.num_busy_placement++;
 }
 
 void radeon_uvd_free_handles(struct radeon_device *rdev, struct drm_file *filp)
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index c7034040c67f..612a35993c3b 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -507,8 +507,8 @@ static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
 	struct ttm_resource *hop_mem;
 	int ret;
 
-	hop_placement.num_placement = hop_placement.num_busy_placement = 1;
-	hop_placement.placement = hop_placement.busy_placement = hop;
+	hop_placement.num_placement = 1;
+	hop_placement.placement = hop;
 
 	/* find space in the bounce domain */
 	ret = ttm_bo_mem_space(bo, &hop_placement, &hop_mem, ctx);
@@ -537,10 +537,9 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 	dma_resv_assert_held(bo->base.resv);
 
 	placement.num_placement = 0;
-	placement.num_busy_placement = 0;
 	bdev->funcs->evict_flags(bo, &placement);
 
-	if (!placement.num_placement && !placement.num_busy_placement) {
+	if (!placement.num_placement) {
 		ret = ttm_bo_wait(bo, true, false);
 		if (ret)
 			return ret;
@@ -859,8 +858,8 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 		return 0;
 	}
 
-	for (i = 0; i < placement->num_busy_placement; ++i) {
-		const struct ttm_place *place = &placement->busy_placement[i];
+	for (i = 0; i < placement->num_placement; ++i) {
+		const struct ttm_place *place = &placement->placement[i];
 		struct ttm_resource_manager *man;
 
 		if (place->flags & TTM_PL_FLAG_IDLE)
@@ -941,7 +940,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 	/*
 	 * Remove the backing store if no placement is given.
 	 */
-	if (!placement->num_placement && !placement->num_busy_placement)
+	if (!placement->num_placement)
 		return ttm_bo_pipeline_gutting(bo);
 
 	/*
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 035d71332d18..925f02104292 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -67,17 +67,24 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
 }
 EXPORT_SYMBOL(ttm_resource_free);
 
-static bool ttm_resource_places_compat(struct ttm_resource *res,
-				       const struct ttm_place *places,
-				       unsigned num_placement)
+/**
+ * ttm_resource_compat - check if resource is compatible with placement
+ *
+ * @res: the resource to check
+ * @placement: the placement to check against
+ *
+ * Returns true if the placement is compatible.
+ */
+bool ttm_resource_compat(struct ttm_resource *res,
+			 struct ttm_placement *placement)
 {
 	unsigned i;
 
 	if (res->placement & TTM_PL_FLAG_TEMPORARY)
 		return false;
 
-	for (i = 0; i < num_placement; i++) {
-		const struct ttm_place *heap = &places[i];
+	for (i = 0; i < placement->num_placement; i++) {
+		const struct ttm_place *heap = &placement->placement[i];
 
 		if (res->start < heap->fpfn || (heap->lpfn &&
 		    (res->start + res->num_pages) > heap->lpfn))
@@ -90,30 +97,6 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
 	}
 	return false;
 }
-
-/**
- * ttm_resource_compat - check if resource is compatible with placement
- *
- * @res: the resource to check
- * @placement: the placement to check against
- *
- * Returns true if the placement is compatible.
- */
-bool ttm_resource_compat(struct ttm_resource *res,
-			 struct ttm_placement *placement)
-{
-	if (ttm_resource_places_compat(res, placement->placement,
-				       placement->num_placement))
-		return true;
-
-	if ((placement->busy_placement != placement->placement ||
-	     placement->num_busy_placement > placement->num_placement) &&
-	    ttm_resource_places_compat(res, placement->busy_placement,
-				       placement->num_busy_placement))
-		return true;
-
-	return false;
-}
 EXPORT_SYMBOL(ttm_resource_compat);
 
 /**
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index fd007f1c1776..9774e708ef63 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -211,8 +211,6 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
 	place.lpfn = bo->resource->num_pages;
 	placement.num_placement = 1;
 	placement.placement = &place;
-	placement.num_busy_placement = 1;
-	placement.busy_placement = &place;
 
 	vmw_execbuf_release_pinned_bo(dev_priv);
 	ret = ttm_bo_reserve(bo, interruptible, false, NULL);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index f35bdc1cb197..50659aae2857 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -60,8 +60,6 @@ static const struct ttm_place mob_placement_flags = {
 struct ttm_placement vmw_vram_placement = {
 	.num_placement = 1,
 	.placement = &vram_placement_flags,
-	.num_busy_placement = 1,
-	.busy_placement = &vram_placement_flags
 };
 
 static const struct ttm_place vram_gmr_placement_flags[] = {
@@ -88,29 +86,37 @@ static const struct ttm_place gmr_vram_placement_flags[] = {
 		.fpfn = 0,
 		.lpfn = 0,
 		.mem_type = TTM_PL_VRAM,
-		.flags = 0
+		.flags = TTM_PL_FLAG_IDLE
 	}
 };
 
 struct ttm_placement vmw_vram_gmr_placement = {
 	.num_placement = 2,
 	.placement = vram_gmr_placement_flags,
-	.num_busy_placement = 1,
-	.busy_placement = &gmr_placement_flags
+};
+
+static const struct ttm_place vram_sys_placement_flags[] = {
+	{
+		.fpfn = 0,
+		.lpfn = 0,
+		.mem_type = TTM_PL_VRAM,
+		.flags = TTM_PL_FLAG_IDLE
+	}, {
+		.fpfn = 0,
+		.lpfn = 0,
+		.mem_type = TTM_PL_SYSTEM,
+		.flags = TTM_PL_FLAG_BUSY
+	}
 };
 
 struct ttm_placement vmw_vram_sys_placement = {
 	.num_placement = 1,
 	.placement = &vram_placement_flags,
-	.num_busy_placement = 1,
-	.busy_placement = &sys_placement_flags
 };
 
 struct ttm_placement vmw_sys_placement = {
 	.num_placement = 1,
 	.placement = &sys_placement_flags,
-	.num_busy_placement = 1,
-	.busy_placement = &sys_placement_flags
 };
 
 static const struct ttm_place evictable_placement_flags[] = {
@@ -118,7 +124,7 @@ static const struct ttm_place evictable_placement_flags[] = {
 		.fpfn = 0,
 		.lpfn = 0,
 		.mem_type = TTM_PL_SYSTEM,
-		.flags = 0
+		.flags = TTM_PL_FLAG_BUSY
 	}, {
 		.fpfn = 0,
 		.lpfn = 0,
@@ -137,13 +143,13 @@ static const struct ttm_place evictable_placement_flags[] = {
 	}
 };
 
-static const struct ttm_place nonfixed_placement_flags[] = {
+struct ttm_placement vmw_evictable_placement = {
+	.num_placement = 4,
+	.placement = evictable_placement_flags,
+};
+
+static const struct ttm_place srf_placement_flags[] = {
 	{
-		.fpfn = 0,
-		.lpfn = 0,
-		.mem_type = TTM_PL_SYSTEM,
-		.flags = 0
-	}, {
 		.fpfn = 0,
 		.lpfn = 0,
 		.mem_type = VMW_PL_GMR,
@@ -151,37 +157,43 @@ static const struct ttm_place nonfixed_placement_flags[] = {
 	}, {
 		.fpfn = 0,
 		.lpfn = 0,
-		.mem_type = VMW_PL_MOB,
-		.flags = 0
+		.mem_type = TTM_PL_VRAM,
+		.flags = TTM_PL_FLAG_BUSY
 	}
 };
 
-struct ttm_placement vmw_evictable_placement = {
-	.num_placement = 4,
-	.placement = evictable_placement_flags,
-	.num_busy_placement = 1,
-	.busy_placement = &sys_placement_flags
-};
-
 struct ttm_placement vmw_srf_placement = {
-	.num_placement = 1,
-	.num_busy_placement = 2,
-	.placement = &gmr_placement_flags,
-	.busy_placement = gmr_vram_placement_flags
+	.num_placement = 2,
+	.placement = srf_placement_flags,
 };
 
 struct ttm_placement vmw_mob_placement = {
 	.num_placement = 1,
-	.num_busy_placement = 1,
 	.placement = &mob_placement_flags,
-	.busy_placement = &mob_placement_flags
+};
+
+static const struct ttm_place nonfixed_placement_flags[] = {
+	{
+		.fpfn = 0,
+		.lpfn = 0,
+		.mem_type = TTM_PL_SYSTEM,
+		.flags = 0
+	}, {
+		.fpfn = 0,
+		.lpfn = 0,
+		.mem_type = VMW_PL_GMR,
+		.flags = TTM_PL_FLAG_IDLE
+	}, {
+		.fpfn = 0,
+		.lpfn = 0,
+		.mem_type = VMW_PL_MOB,
+		.flags = TTM_PL_FLAG_IDLE
+	}
 };
 
 struct ttm_placement vmw_nonfixed_placement = {
 	.num_placement = 3,
 	.placement = nonfixed_placement_flags,
-	.num_busy_placement = 1,
-	.busy_placement = &sys_placement_flags
 };
 
 struct vmw_ttm_tt {
diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
index 63f7217354c0..b5b49ff03415 100644
--- a/include/drm/ttm/ttm_placement.h
+++ b/include/drm/ttm/ttm_placement.h
@@ -80,16 +80,12 @@ struct ttm_place {
  *
  * @num_placement:	number of preferred placements
  * @placement:		preferred placements
- * @num_busy_placement:	number of preferred placements when need to evict buffer
- * @busy_placement:	preferred placements when need to evict buffer
  *
  * Structure indicating the placement you request for an object.
  */
 struct ttm_placement {
 	unsigned		num_placement;
 	const struct ttm_place	*placement;
-	unsigned		num_busy_placement;
-	const struct ttm_place	*busy_placement;
 };
 
 #endif
-- 
2.25.1

