Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E695F6798BA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 13:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12A710E67D;
	Tue, 24 Jan 2023 12:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA25610E0D3;
 Tue, 24 Jan 2023 12:57:33 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r2so13775873wrv.7;
 Tue, 24 Jan 2023 04:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TVDJtHutJohVVXtNErZs89BB+/NcSvfLY8ZAPoeG/oo=;
 b=NoAN6e4I0uHlhmx92x0u0Lny78oLj640AL10I6dRA6hAcRw6nJ3+IW/NXVkZ1pUgnW
 BGm2z/R6kCWzZhjo+XK1D7UlSyFQC4NsDubWCW3Van4RnrZtjfiRXzJ410KsLJgXsINs
 PHhxjzcArmNZ/LVjnDx8NhiBMP59yOi15GwHo6Q4fPB58JhJTbNhZGZoSdu2njHdJgD6
 8Gh4pQLdAAPeRMfh/FmB8xUt2c9nPhgG4Wr67kAXN03fiSpCuxYzh9IHLD9w5GOIzmTH
 mOytSGOnvZctEeHJOwDkFv/2g00gX9TnsyOxKTFHaACLOWwyTGjY/5XmYHjVk+mIWcwO
 qOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TVDJtHutJohVVXtNErZs89BB+/NcSvfLY8ZAPoeG/oo=;
 b=vzaUoczW5JAyYzo5cyuLXjCemHEg1/6MARuZuQInP/reiL0Z6s1KmKDMA2nuGyUZJu
 4bPXS9nmdjRWgbBCl4Tuk/PSvYaHz+AwoO+ghCnIG8iPmI9LeBz+3VnMWaL05Zi8T1RQ
 CFu09UsC1ZojH4IX7ZTaU7hRdAw7w3v2SCk8VxnSpbFUfYBbm+eijVcOlF6dljAtnVUB
 dcGGogIR6/L9wNcAVKWq1GOHZh6T0WCK4qxisK8cItHwiTSRASsdad/7umHMOWZRB4ZB
 YGVnyZlrJP+J/QN7j0kD5bZQb72ZjyPtvkolq2qw5Zo7oHQUd6VRr5b4wyn7Cv7kcwzK
 +Xqg==
X-Gm-Message-State: AFqh2kr4pjb8dFuJkIutUuHvKn/CV0ONSwsd0lAIsZGP2K3jhC6Y+eRi
 Hg2SWrVQgTyEmAklDBt24XCWgpn5KTg=
X-Google-Smtp-Source: AMrXdXvhPISpDlrtQBs+cdtGAETqcoKcOIp0bp22qkL8eRfM4PNZu3YeypejCYPXXL3uVmPi54KcYA==
X-Received: by 2002:adf:b60f:0:b0:2bd:f71a:5b32 with SMTP id
 f15-20020adfb60f000000b002bdf71a5b32mr24511927wre.58.1674565052183; 
 Tue, 24 Jan 2023 04:57:32 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a056000111200b002366dd0e030sm1820927wrw.68.2023.01.24.04.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 04:57:31 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/5] drm/ttm: replace busy placement with flags v2
Date: Tue, 24 Jan 2023 13:57:26 +0100
Message-Id: <20230124125726.13323-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124125726.13323-1-christian.koenig@amd.com>
References: <20230124125726.13323-1-christian.koenig@amd.com>
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

Instead of a list of separate busy placement add flags which indicate
that a placement should only be used when there is room or if we need to
evict.

v2: add missing TTM_PL_FLAG_IDLE for i915

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  11 +-
 drivers/gpu/drm/drm_gem_vram_helper.c      |   2 -
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  37 +++----
 drivers/gpu/drm/nouveau/nouveau_bo.c       |  59 ++++------
 drivers/gpu/drm/nouveau/nouveau_bo.h       |   1 -
 drivers/gpu/drm/qxl/qxl_object.c           |   2 -
 drivers/gpu/drm/qxl/qxl_ttm.c              |   2 -
 drivers/gpu/drm/radeon/radeon_object.c     |   2 -
 drivers/gpu/drm/radeon/radeon_ttm.c        |   8 +-
 drivers/gpu/drm/radeon/radeon_uvd.c        |   1 -
 drivers/gpu/drm/ttm/ttm_bo.c               |  21 ++--
 drivers/gpu/drm/ttm/ttm_resource.c         |  73 +++----------
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         |   2 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 121 ++++++++++-----------
 include/drm/ttm/ttm_placement.h            |  10 +-
 include/drm/ttm/ttm_resource.h             |   8 +-
 17 files changed, 135 insertions(+), 231 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 25a68d8888e0..9c594607109c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -201,9 +201,6 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 
 	placement->num_placement = c;
 	placement->placement = places;
-
-	placement->num_busy_placement = c;
-	placement->busy_placement = places;
 }
 
 /**
@@ -1369,8 +1366,7 @@ vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
 					AMDGPU_GEM_DOMAIN_GTT);
 
 	/* Avoid costly evictions; only set GTT as a busy placement */
-	abo->placement.num_busy_placement = 1;
-	abo->placement.busy_placement = &abo->placements[1];
+	abo->placements[0].flags |= TTM_PL_FLAG_IDLE;
 
 	r = ttm_bo_validate(bo, &abo->placement, &ctx);
 	if (unlikely(r == -EBUSY || r == -ERESTARTSYS))
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 2cd081cbf706..e7d6b7d1d393 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -104,23 +104,19 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
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
 
 	abo = ttm_to_amdgpu_bo(bo);
 	if (abo->flags & AMDGPU_GEM_CREATE_DISCARDABLE) {
 		placement->num_placement = 0;
-		placement->num_busy_placement = 0;
 		return;
 	}
 
@@ -129,13 +125,13 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 	case AMDGPU_PL_GWS:
 	case AMDGPU_PL_OA:
 		placement->num_placement = 0;
-		placement->num_busy_placement = 0;
 		return;
 
 	case TTM_PL_VRAM:
 		if (!adev->mman.buffer_funcs_enabled) {
 			/* Move to system memory */
 			amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_CPU);
+
 		} else if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
 			   !(abo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) &&
 			   amdgpu_bo_in_cpu_visible_vram(abo)) {
@@ -150,8 +146,7 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 							AMDGPU_GEM_DOMAIN_CPU);
 			abo->placements[0].fpfn = adev->gmc.visible_vram_size >> PAGE_SHIFT;
 			abo->placements[0].lpfn = 0;
-			abo->placement.busy_placement = &abo->placements[1];
-			abo->placement.num_busy_placement = 1;
+			abo->placements[0].flags |= TTM_PL_FLAG_IDLE;
 		} else {
 			/* Move to GTT memory */
 			amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_GTT |
@@ -930,8 +925,6 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
 	/* allocate GART space */
 	placement.num_placement = 1;
 	placement.placement = &placements;
-	placement.num_busy_placement = 1;
-	placement.busy_placement = &placements;
 	placements.fpfn = 0;
 	placements.lpfn = adev->gmc.gart_size >> PAGE_SHIFT;
 	placements.mem_type = TTM_PL_TT;
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index d40b3edb52d0..f46792b757f9 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -147,7 +147,6 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
 		invariant_flags = TTM_PL_FLAG_TOPDOWN;
 
 	gbo->placement.placement = gbo->placements;
-	gbo->placement.busy_placement = gbo->placements;
 
 	if (pl_flag & DRM_GEM_VRAM_PL_FLAG_VRAM) {
 		gbo->placements[c].mem_type = TTM_PL_VRAM;
@@ -160,7 +159,6 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
 	}
 
 	gbo->placement.num_placement = c;
-	gbo->placement.num_busy_placement = c;
 
 	for (i = 0; i < c; ++i) {
 		gbo->placements[i].fpfn = 0;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 7420276827a5..7e5adc209c19 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -65,8 +65,6 @@ static const struct ttm_place sys_placement_flags = {
 static struct ttm_placement i915_sys_placement = {
 	.num_placement = 1,
 	.placement = &sys_placement_flags,
-	.num_busy_placement = 1,
-	.busy_placement = &sys_placement_flags,
 };
 
 /**
@@ -157,32 +155,28 @@ i915_ttm_place_from_region(const struct intel_memory_region *mr,
 
 static void
 i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
-			    struct ttm_place *requested,
-			    struct ttm_place *busy,
+			    struct ttm_place *places,
 			    struct ttm_placement *placement)
 {
 	unsigned int num_allowed = obj->mm.n_placements;
 	unsigned int flags = obj->flags;
 	unsigned int i;
 
-	placement->num_placement = 1;
+	places[0].flags |= TTM_PL_FLAG_IDLE;
 	i915_ttm_place_from_region(num_allowed ? obj->mm.placements[0] :
-				   obj->mm.region, requested, obj->bo_offset,
+				   obj->mm.region, &places[0], obj->bo_offset,
 				   obj->base.size, flags);
 
 	/* Cache this on object? */
-	placement->num_busy_placement = num_allowed;
-	for (i = 0; i < placement->num_busy_placement; ++i)
-		i915_ttm_place_from_region(obj->mm.placements[i], busy + i,
-					   obj->bo_offset, obj->base.size, flags);
-
-	if (num_allowed == 0) {
-		*busy = *requested;
-		placement->num_busy_placement = 1;
+	for (i = 0; i < num_allowed; ++i) {
+		i915_ttm_place_from_region(obj->mm.placements[i],
+					   &places[i + 1], obj->bo_offset,
+					   obj->base.size, flags);
+		places[i + 1].flags |= TTM_PL_FLAG_BUSY;
 	}
 
-	placement->placement = requested;
-	placement->busy_placement = busy;
+	placement->num_placement = num_allowed + 1;
+	placement->placement = places;
 }
 
 static int i915_ttm_tt_shmem_populate(struct ttm_device *bdev,
@@ -783,7 +777,8 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
 	int ret;
 
 	/* First try only the requested placement. No eviction. */
-	real_num_busy = fetch_and_zero(&placement->num_busy_placement);
+	real_num_busy = placement->num_placement;
+	placement->num_placement = 1;
 	ret = ttm_bo_validate(bo, placement, &ctx);
 	if (ret) {
 		ret = i915_ttm_err_to_gem(ret);
@@ -799,7 +794,7 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
 		 * If the initial attempt fails, allow all accepted placements,
 		 * evicting if necessary.
 		 */
-		placement->num_busy_placement = real_num_busy;
+		placement->num_placement = real_num_busy;
 		ret = ttm_bo_validate(bo, placement, &ctx);
 		if (ret)
 			return i915_ttm_err_to_gem(ret);
@@ -833,7 +828,7 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
 
 static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
 {
-	struct ttm_place requested, busy[I915_TTM_MAX_PLACEMENTS];
+	struct ttm_place places[I915_TTM_MAX_PLACEMENTS + 1];
 	struct ttm_placement placement;
 
 	/* restricted by sg_alloc_table */
@@ -843,7 +838,7 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
 	GEM_BUG_ON(obj->mm.n_placements > I915_TTM_MAX_PLACEMENTS);
 
 	/* Move to the requested placement. */
-	i915_ttm_placement_from_obj(obj, &requested, busy, &placement);
+	i915_ttm_placement_from_obj(obj, places, &placement);
 
 	return __i915_ttm_get_pages(obj, &placement);
 }
@@ -873,9 +868,7 @@ static int __i915_ttm_migrate(struct drm_i915_gem_object *obj,
 	i915_ttm_place_from_region(mr, &requested, obj->bo_offset,
 				   obj->base.size, flags);
 	placement.num_placement = 1;
-	placement.num_busy_placement = 1;
 	placement.placement = &requested;
-	placement.busy_placement = &requested;
 
 	ret = __i915_ttm_get_pages(obj, &placement);
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index c2ec91cc845d..0ab24ca5f419 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -347,27 +347,6 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, int align,
 	return 0;
 }
 
-static void
-set_placement_list(struct ttm_place *pl, unsigned *n, uint32_t domain)
-{
-	*n = 0;
-
-	if (domain & NOUVEAU_GEM_DOMAIN_VRAM) {
-		pl[*n].mem_type = TTM_PL_VRAM;
-		pl[*n].flags = 0;
-		(*n)++;
-	}
-	if (domain & NOUVEAU_GEM_DOMAIN_GART) {
-		pl[*n].mem_type = TTM_PL_TT;
-		pl[*n].flags = 0;
-		(*n)++;
-	}
-	if (domain & NOUVEAU_GEM_DOMAIN_CPU) {
-		pl[*n].mem_type = TTM_PL_SYSTEM;
-		pl[(*n)++].flags = 0;
-	}
-}
-
 static void
 set_placement_range(struct nouveau_bo *nvbo, uint32_t domain)
 {
@@ -395,10 +374,6 @@ set_placement_range(struct nouveau_bo *nvbo, uint32_t domain)
 			nvbo->placements[i].fpfn = fpfn;
 			nvbo->placements[i].lpfn = lpfn;
 		}
-		for (i = 0; i < nvbo->placement.num_busy_placement; ++i) {
-			nvbo->busy_placements[i].fpfn = fpfn;
-			nvbo->busy_placements[i].lpfn = lpfn;
-		}
 	}
 }
 
@@ -406,15 +381,32 @@ void
 nouveau_bo_placement_set(struct nouveau_bo *nvbo, uint32_t domain,
 			 uint32_t busy)
 {
-	struct ttm_placement *pl = &nvbo->placement;
+	struct ttm_place *pl = nvbo->placements;
+	unsigned *n = &nvbo->placement.num_placement;
 
-	pl->placement = nvbo->placements;
-	set_placement_list(nvbo->placements, &pl->num_placement, domain);
+	domain |= busy;
 
-	pl->busy_placement = nvbo->busy_placements;
-	set_placement_list(nvbo->busy_placements, &pl->num_busy_placement,
-			   domain | busy);
+	*n = 0;
+	if (domain & NOUVEAU_GEM_DOMAIN_VRAM) {
+		pl[*n].mem_type = TTM_PL_VRAM;
+		pl[*n].flags = busy & NOUVEAU_GEM_DOMAIN_VRAM ?
+			TTM_PL_FLAG_BUSY : 0;
+		(*n)++;
+	}
+	if (domain & NOUVEAU_GEM_DOMAIN_GART) {
+		pl[*n].mem_type = TTM_PL_TT;
+		pl[*n].flags = busy & NOUVEAU_GEM_DOMAIN_GART ?
+			TTM_PL_FLAG_BUSY : 0;
+		(*n)++;
+	}
+	if (domain & NOUVEAU_GEM_DOMAIN_CPU) {
+		pl[*n].mem_type = TTM_PL_SYSTEM;
+		pl[*n].flags = busy & NOUVEAU_GEM_DOMAIN_CPU ?
+			TTM_PL_FLAG_BUSY : 0;
+		(*n)++;
+	}
 
+	nvbo->placement.placement = nvbo->placements;
 	set_placement_range(nvbo, domain);
 }
 
@@ -1249,11 +1241,6 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
 			nvbo->placements[i].lpfn = mappable;
 		}
 
-		for (i = 0; i < nvbo->placement.num_busy_placement; ++i) {
-			nvbo->busy_placements[i].fpfn = 0;
-			nvbo->busy_placements[i].lpfn = mappable;
-		}
-
 		nouveau_bo_placement_set(nvbo, NOUVEAU_GEM_DOMAIN_VRAM, 0);
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index 774dd93ca76b..4031b5a223a1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -15,7 +15,6 @@ struct nouveau_bo {
 	struct ttm_placement placement;
 	u32 valid_domains;
 	struct ttm_place placements[3];
-	struct ttm_place busy_placements[3];
 	bool force_coherent;
 	struct ttm_bo_kmap_obj kmap;
 	struct list_head head;
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 06a58dad5f5c..1e46b0a6e478 100644
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
index a92a5b0d4c25..5fc3c338ba9e 100644
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
index 10c0fbd9d2b4..a955f8a2f7fe 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -78,7 +78,6 @@ void radeon_ttm_placement_from_domain(struct radeon_bo *rbo, u32 domain)
 	u32 c = 0, i;
 
 	rbo->placement.placement = rbo->placements;
-	rbo->placement.busy_placement = rbo->placements;
 	if (domain & RADEON_GEM_DOMAIN_VRAM) {
 		/* Try placing BOs which don't need CPU access outside of the
 		 * CPU accessible part of VRAM
@@ -114,7 +113,6 @@ void radeon_ttm_placement_from_domain(struct radeon_bo *rbo, u32 domain)
 	}
 
 	rbo->placement.num_placement = c;
-	rbo->placement.num_busy_placement = c;
 
 	for (i = 0; i < c; ++i) {
 		if ((rbo->flags & RADEON_GEM_CPU_ACCESS) &&
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 67075c85f847..efcff11b035e 100644
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
@@ -115,15 +113,11 @@ static void radeon_evict_flags(struct ttm_buffer_object *bo,
 			 */
 			radeon_ttm_placement_from_domain(rbo, RADEON_GEM_DOMAIN_VRAM |
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
+					rbo->placements[0].flags |= TTM_PL_FLAG_IDLE;
 				}
 			}
 		} else
diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
index a2cda184b2b2..058a1c8451b2 100644
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
index 33471e363ff4..5c1568528b15 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -405,8 +405,8 @@ static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
 	struct ttm_resource *hop_mem;
 	int ret;
 
-	hop_placement.num_placement = hop_placement.num_busy_placement = 1;
-	hop_placement.placement = hop_placement.busy_placement = hop;
+	hop_placement.num_placement = 1;
+	hop_placement.placement = hop;
 
 	/* find space in the bounce domain */
 	ret = ttm_bo_mem_space(bo, &hop_placement, &hop_mem, ctx);
@@ -435,10 +435,9 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 	dma_resv_assert_held(bo->base.resv);
 
 	placement.num_placement = 0;
-	placement.num_busy_placement = 0;
 	bdev->funcs->evict_flags(bo, &placement);
 
-	if (!placement.num_placement && !placement.num_busy_placement) {
+	if (!placement.num_placement) {
 		ret = ttm_bo_wait_ctx(bo, ctx);
 		if (ret)
 			return ret;
@@ -778,6 +777,9 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 		const struct ttm_place *place = &placement->placement[i];
 		struct ttm_resource_manager *man;
 
+		if (place->flags & TTM_PL_FLAG_BUSY)
+			continue;
+
 		man = ttm_manager_type(bdev, place->mem_type);
 		if (!man || !ttm_resource_manager_used(man))
 			continue;
@@ -800,10 +802,13 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 		return 0;
 	}
 
-	for (i = 0; i < placement->num_busy_placement; ++i) {
-		const struct ttm_place *place = &placement->busy_placement[i];
+	for (i = 0; i < placement->num_placement; ++i) {
+		const struct ttm_place *place = &placement->placement[i];
 		struct ttm_resource_manager *man;
 
+		if (place->flags & TTM_PL_FLAG_IDLE)
+			continue;
+
 		man = ttm_manager_type(bdev, place->mem_type);
 		if (!man || !ttm_resource_manager_used(man))
 			continue;
@@ -891,11 +896,11 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 	/*
 	 * Remove the backing store if no placement is given.
 	 */
-	if (!placement->num_placement && !placement->num_busy_placement)
+	if (!placement->num_placement)
 		return ttm_bo_pipeline_gutting(bo);
 
 	/* Check whether we need to move buffer. */
-	if (bo->resource && ttm_resource_compat(bo->resource, placement))
+	if (bo->resource && ttm_resource_compatible(bo->resource, placement))
 		return 0;
 
 	/* Moving of pinned BOs is forbidden */
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 7333f7a87a2f..f8db437318aa 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -285,37 +285,15 @@ bool ttm_resource_intersects(struct ttm_device *bdev,
 }
 
 /**
- * ttm_resource_compatible - test for compatibility
+ * ttm_resource_compatible - check if resource is compatible with placement
  *
- * @bdev: TTM device structure
- * @res: The resource to test
- * @place: The placement to test
- * @size: How many bytes the new allocation needs.
- *
- * Test if @res compatible with @place and @size.
+ * @res: the resource to check
+ * @placement: the placement to check against
  *
- * Returns true if the res placement compatible with @place and @size.
+ * Returns true if the placement is compatible.
  */
-bool ttm_resource_compatible(struct ttm_device *bdev,
-			     struct ttm_resource *res,
-			     const struct ttm_place *place,
-			     size_t size)
-{
-	struct ttm_resource_manager *man;
-
-	if (!res || !place)
-		return false;
-
-	man = ttm_manager_type(bdev, res->mem_type);
-	if (!man->func->compatible)
-		return true;
-
-	return man->func->compatible(man, res, place, size);
-}
-
-static bool ttm_resource_places_compat(struct ttm_resource *res,
-				       const struct ttm_place *places,
-				       unsigned num_placement)
+bool ttm_resource_compatible(struct ttm_resource *res,
+			     struct ttm_placement *placement)
 {
 	struct ttm_buffer_object *bo = res->bo;
 	struct ttm_device *bdev = bo->bdev;
@@ -324,44 +302,25 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
 	if (res->placement & TTM_PL_FLAG_TEMPORARY)
 		return false;
 
-	for (i = 0; i < num_placement; i++) {
-		const struct ttm_place *heap = &places[i];
+	for (i = 0; i < placement->num_placement; i++) {
+		const struct ttm_place *place = &placement->placement[i];
+		struct ttm_resource_manager *man;
 
-		if (!ttm_resource_compatible(bdev, res, heap, bo->base.size))
+		if (res->mem_type != place->mem_type)
+			continue;
+
+		man = ttm_manager_type(bdev, res->mem_type);
+		if (man->func->compatible &&
+		    !man->func->compatible(man, res, place, bo->base.size))
 			continue;
 
-		if ((res->mem_type == heap->mem_type) &&
-		    (!(heap->flags & TTM_PL_FLAG_CONTIGUOUS) ||
+		if ((!(place->flags & TTM_PL_FLAG_CONTIGUOUS) ||
 		     (res->placement & TTM_PL_FLAG_CONTIGUOUS)))
 			return true;
 	}
 	return false;
 }
 
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
-
 void ttm_resource_set_bo(struct ttm_resource *res,
 			 struct ttm_buffer_object *bo)
 {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 9bf1f9d2f9b6..45a2d72d20d4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -186,8 +186,6 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
 	place.lpfn = PFN_UP(bo->resource->size);
 	placement.num_placement = 1;
 	placement.placement = &place;
-	placement.num_busy_placement = 1;
-	placement.busy_placement = &place;
 
 	vmw_execbuf_release_pinned_bo(dev_priv);
 	ret = ttm_bo_reserve(bo, interruptible, false, NULL);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 856a352a72a6..02cd2e153c62 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -35,32 +35,9 @@ static const struct ttm_place vram_placement_flags = {
 	.flags = 0
 };
 
-static const struct ttm_place sys_placement_flags = {
-	.fpfn = 0,
-	.lpfn = 0,
-	.mem_type = TTM_PL_SYSTEM,
-	.flags = 0
-};
-
-static const struct ttm_place gmr_placement_flags = {
-	.fpfn = 0,
-	.lpfn = 0,
-	.mem_type = VMW_PL_GMR,
-	.flags = 0
-};
-
-static const struct ttm_place mob_placement_flags = {
-	.fpfn = 0,
-	.lpfn = 0,
-	.mem_type = VMW_PL_MOB,
-	.flags = 0
-};
-
 struct ttm_placement vmw_vram_placement = {
 	.num_placement = 1,
 	.placement = &vram_placement_flags,
-	.num_busy_placement = 1,
-	.busy_placement = &vram_placement_flags
 };
 
 static const struct ttm_place vram_gmr_placement_flags[] = {
@@ -68,7 +45,7 @@ static const struct ttm_place vram_gmr_placement_flags[] = {
 		.fpfn = 0,
 		.lpfn = 0,
 		.mem_type = TTM_PL_VRAM,
-		.flags = 0
+		.flags = TTM_PL_FLAG_IDLE
 	}, {
 		.fpfn = 0,
 		.lpfn = 0,
@@ -77,62 +54,56 @@ static const struct ttm_place vram_gmr_placement_flags[] = {
 	}
 };
 
-static const struct ttm_place gmr_vram_placement_flags[] = {
+struct ttm_placement vmw_vram_gmr_placement = {
+	.num_placement = 2,
+	.placement = vram_gmr_placement_flags,
+};
+
+static const struct ttm_place vram_sys_placement_flags[] = {
 	{
 		.fpfn = 0,
 		.lpfn = 0,
-		.mem_type = VMW_PL_GMR,
-		.flags = 0
+		.mem_type = TTM_PL_VRAM,
+		.flags = TTM_PL_FLAG_IDLE
 	}, {
 		.fpfn = 0,
 		.lpfn = 0,
-		.mem_type = TTM_PL_VRAM,
-		.flags = 0
+		.mem_type = TTM_PL_SYSTEM,
+		.flags = TTM_PL_FLAG_BUSY
 	}
 };
 
-static const struct ttm_place vmw_sys_placement_flags = {
-	.fpfn = 0,
-	.lpfn = 0,
-	.mem_type = VMW_PL_SYSTEM,
-	.flags = 0
-};
-
-struct ttm_placement vmw_vram_gmr_placement = {
+struct ttm_placement vmw_vram_sys_placement = {
 	.num_placement = 2,
-	.placement = vram_gmr_placement_flags,
-	.num_busy_placement = 1,
-	.busy_placement = &gmr_placement_flags
+	.placement = vram_sys_placement_flags,
 };
 
-struct ttm_placement vmw_vram_sys_placement = {
-	.num_placement = 1,
-	.placement = &vram_placement_flags,
-	.num_busy_placement = 1,
-	.busy_placement = &sys_placement_flags
+static const struct ttm_place sys_placement_flags = {
+	.fpfn = 0,
+	.lpfn = 0,
+	.mem_type = TTM_PL_SYSTEM,
+	.flags = 0
 };
 
 struct ttm_placement vmw_sys_placement = {
 	.num_placement = 1,
 	.placement = &sys_placement_flags,
-	.num_busy_placement = 1,
-	.busy_placement = &sys_placement_flags
+};
+
+static const struct ttm_place vmw_sys_placement_flags = {
+	.fpfn = 0,
+	.lpfn = 0,
+	.mem_type = VMW_PL_SYSTEM,
+	.flags = 0
 };
 
 struct ttm_placement vmw_pt_sys_placement = {
 	.num_placement = 1,
 	.placement = &vmw_sys_placement_flags,
-	.num_busy_placement = 1,
-	.busy_placement = &vmw_sys_placement_flags
 };
 
-static const struct ttm_place nonfixed_placement_flags[] = {
+static const struct ttm_place gmr_vram_placement_flags[] = {
 	{
-		.fpfn = 0,
-		.lpfn = 0,
-		.mem_type = TTM_PL_SYSTEM,
-		.flags = 0
-	}, {
 		.fpfn = 0,
 		.lpfn = 0,
 		.mem_type = VMW_PL_GMR,
@@ -140,30 +111,50 @@ static const struct ttm_place nonfixed_placement_flags[] = {
 	}, {
 		.fpfn = 0,
 		.lpfn = 0,
-		.mem_type = VMW_PL_MOB,
-		.flags = 0
+		.mem_type = TTM_PL_VRAM,
+		.flags = TTM_PL_FLAG_BUSY
 	}
 };
 
 struct ttm_placement vmw_srf_placement = {
-	.num_placement = 1,
-	.num_busy_placement = 2,
-	.placement = &gmr_placement_flags,
-	.busy_placement = gmr_vram_placement_flags
+	.num_placement = 2,
+	.placement = gmr_vram_placement_flags
+};
+
+static const struct ttm_place mob_placement_flags = {
+	.fpfn = 0,
+	.lpfn = 0,
+	.mem_type = VMW_PL_MOB,
+	.flags = 0
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
 
 const size_t vmw_tt_size = sizeof(struct vmw_ttm_tt);
diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
index 8074d0f6cae5..c70e489e1f1e 100644
--- a/include/drm/ttm/ttm_placement.h
+++ b/include/drm/ttm/ttm_placement.h
@@ -64,6 +64,12 @@
 /* For multihop handling */
 #define TTM_PL_FLAG_TEMPORARY   (1 << 2)
 
+/* Placement is never used during eviction */
+#define TTM_PL_FLAG_IDLE	(1 << 3)
+
+/* Placement is only used during eviction */
+#define TTM_PL_FLAG_BUSY	(1 << 4)
+
 /**
  * struct ttm_place
  *
@@ -86,16 +92,12 @@ struct ttm_place {
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
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 78a226eba953..1afa13f0c22b 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -365,12 +365,8 @@ bool ttm_resource_intersects(struct ttm_device *bdev,
 			     struct ttm_resource *res,
 			     const struct ttm_place *place,
 			     size_t size);
-bool ttm_resource_compatible(struct ttm_device *bdev,
-			     struct ttm_resource *res,
-			     const struct ttm_place *place,
-			     size_t size);
-bool ttm_resource_compat(struct ttm_resource *res,
-			 struct ttm_placement *placement);
+bool ttm_resource_compatible(struct ttm_resource *res,
+			     struct ttm_placement *placement);
 void ttm_resource_set_bo(struct ttm_resource *res,
 			 struct ttm_buffer_object *bo);
 
-- 
2.34.1

