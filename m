Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D84F98114F0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 15:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D9910E78B;
	Wed, 13 Dec 2023 14:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C03910E2D1;
 Wed, 13 Dec 2023 14:42:27 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a1da1017a09so844278066b.3; 
 Wed, 13 Dec 2023 06:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702478545; x=1703083345; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=b/OodWqz0MzCWgYTDYBtdypc+VVwJysTRkc1IG5bTTQ=;
 b=jAGtPvuFB0nNyAEBLDdoF/ZFgDIXdhKy1XaKIzX+eqom0P1ea348fHWj4wk9nrhZRh
 6yxDcR0DnjW2z2yMJmmJLTdVsFFrOUiUqwjSW+lovHP3WgQ+b7T07x6O7g8U/fybZICd
 miYlkQGVEgX+c+yL5lIwGiPy2Vq1uGKYj16BC+Z8BcmN8M+GnjTks3o8MQfZVWyQaEDa
 Yk6tcMGwdmDtEqUWr5A985HVrz9GJPnTc5riSIHiyhmsURbEtTqd/qG0JU5d/tcicSjt
 uIPQufTosNF3L+xQsH3CB7zBGzxshJ0MTqu80GIFhU2u/2LAPANBz6/wWXWhrV3h3BTI
 P8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702478545; x=1703083345;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b/OodWqz0MzCWgYTDYBtdypc+VVwJysTRkc1IG5bTTQ=;
 b=MAtgQo6m1LSkzES3zmfkIuG4t28qTF20BDGQcBttiyEnnTeKmTlcyidXzUR4FB2fZ8
 vzg+Eo0KzHOqtTD++w/XyZTZJVycGpv0UTVp2AEZEkkVWnEDr0ywo2lOdT6q9uYmfT8a
 W9zRREoTBWBkyV76yaywzVc8RRVLqg59ZcoxrmlRCIXmCxR8lOUhf/rZxDRCqrxdvHFE
 8Qzmfp5rbC28bVAGGrsAQK4flDVW2ir0AeF65E+wXsUBwYAEKcEjIUW2zf/stUiCnE4g
 y0l8bMvEZ8NEPGdY7gHouFjmQRLC0TIYvEz9/ndEQfdtGnk51viaWWJTSXEyjzb4QgFj
 0alg==
X-Gm-Message-State: AOJu0Yw6TZKrif2i6ASxpaVe3aErI0sofTOrYItDzHyyKZ8Rja2suZnG
 gW+1XDNawsCiHoqW/NMlIn91hQPuRBs=
X-Google-Smtp-Source: AGHT+IFgm30ITAjcwulOkKWsagIYtIxqi+Tmi7h2pSfhg5ODqezZYYnD+WPSEk7c9Sqpw7lJFbgSnQ==
X-Received: by 2002:a17:906:d8b7:b0:a18:e2b8:ff1b with SMTP id
 qc23-20020a170906d8b700b00a18e2b8ff1bmr4209173ejb.1.1702478545501; 
 Wed, 13 Dec 2023 06:42:25 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15c5:a700:2883:dd2d:c4a4:5a04])
 by smtp.gmail.com with ESMTPSA id
 rm6-20020a1709076b0600b00a1f6f120b33sm7402525ejc.110.2023.12.13.06.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 06:42:25 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/ttm: improve idle/busy handling
Date: Wed, 13 Dec 2023 15:42:21 +0100
Message-Id: <20231213144222.1871-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231213144222.1871-1-christian.koenig@amd.com>
References: <20231213144222.1871-1-christian.koenig@amd.com>
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

Previously we would never try to move a BO into the preferred placements when
it ever landed in a busy placement since those were considered compatible.

Rework the whole handling and finally unify the idle and busy handling.
ttm_bo_validate() is now responsible to try idle placement first and then use
the busy placement if that didn't worked.

Drawback is that we now always try the idle placement first for each
validation which might cause some additional CPU overhead on overcommit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c               | 131 ++++++++-------------
 drivers/gpu/drm/ttm/ttm_resource.c         |  14 ++-
 include/drm/ttm/ttm_bo.h                   |   3 +-
 include/drm/ttm/ttm_resource.h             |   3 +-
 6 files changed, 64 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index aa0dd6dad068..f110dfdc4feb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -404,7 +404,7 @@ int amdgpu_bo_create_kernel_at(struct amdgpu_device *adev,
 		(*bo_ptr)->placements[i].lpfn = (offset + size) >> PAGE_SHIFT;
 	}
 	r = ttm_bo_mem_space(&(*bo_ptr)->tbo, &(*bo_ptr)->placement,
-			     &(*bo_ptr)->tbo.resource, &ctx);
+			     &(*bo_ptr)->tbo.resource, &ctx, false);
 	if (r)
 		goto error;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 9a6a00b1af40..00da9a81cf6c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -967,7 +967,7 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
 	placements.mem_type = TTM_PL_TT;
 	placements.flags = bo->resource->placement;
 
-	r = ttm_bo_mem_space(bo, &placement, &tmp, &ctx);
+	r = ttm_bo_mem_space(bo, &placement, &tmp, &ctx, true);
 	if (unlikely(r))
 		return r;
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index aa12bd5cfd17..17bfc252f76d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -414,7 +414,7 @@ static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
 	hop_placement.placement = hop;
 
 	/* find space in the bounce domain */
-	ret = ttm_bo_mem_space(bo, &hop_placement, &hop_mem, ctx);
+	ret = ttm_bo_mem_space(bo, &hop_placement, &hop_mem, ctx, true);
 	if (ret)
 		return ret;
 	/* move to the bounce domain */
@@ -454,7 +454,7 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 		return ttm_bo_pipeline_gutting(bo);
 	}
 
-	ret = ttm_bo_mem_space(bo, &placement, &evict_mem, ctx);
+	ret = ttm_bo_mem_space(bo, &placement, &evict_mem, ctx, true);
 	if (ret) {
 		if (ret != -ERESTARTSYS) {
 			pr_err("Failed to find memory space for buffer 0x%p eviction\n",
@@ -724,37 +724,6 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 	return ret;
 }
 
-/*
- * Repeatedly evict memory from the LRU for @mem_type until we create enough
- * space, or we've evicted everything and there isn't enough space.
- */
-static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
-				  const struct ttm_place *place,
-				  struct ttm_resource **mem,
-				  struct ttm_operation_ctx *ctx)
-{
-	struct ttm_device *bdev = bo->bdev;
-	struct ttm_resource_manager *man;
-	struct ww_acquire_ctx *ticket;
-	int ret;
-
-	man = ttm_manager_type(bdev, place->mem_type);
-	ticket = dma_resv_locking_ctx(bo->base.resv);
-	do {
-		ret = ttm_resource_alloc(bo, place, mem);
-		if (likely(!ret))
-			break;
-		if (unlikely(ret != -ENOSPC))
-			return ret;
-		ret = ttm_mem_evict_first(bdev, man, place, ctx,
-					  ticket);
-		if (unlikely(ret != 0))
-			return ret;
-	} while (1);
-
-	return ttm_bo_add_move_fence(bo, man, *mem, ctx->no_wait_gpu);
-}
-
 /**
  * ttm_bo_mem_space
  *
@@ -763,6 +732,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
  * @placement: Proposed new placement for the buffer object.
  * @mem: A struct ttm_resource.
  * @ctx: if and how to sleep, lock buffers and alloc memory
+ * @force_space: If we should evict buffers to force space
  *
  * Allocate memory space for the buffer object pointed to by @bo, using
  * the placement flags in @placement, potentially evicting other idle buffer objects.
@@ -776,12 +746,14 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
 int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 			struct ttm_placement *placement,
 			struct ttm_resource **mem,
-			struct ttm_operation_ctx *ctx)
+			struct ttm_operation_ctx *ctx,
+			bool force_space)
 {
 	struct ttm_device *bdev = bo->bdev;
-	bool type_found = false;
+	struct ww_acquire_ctx *ticket;
 	int i, ret;
 
+	ticket = dma_resv_locking_ctx(bo->base.resv);
 	ret = dma_resv_reserve_fences(bo->base.resv, 1);
 	if (unlikely(ret))
 		return ret;
@@ -790,19 +762,30 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 		const struct ttm_place *place = &placement->placement[i];
 		struct ttm_resource_manager *man;
 
-		if (place->flags & TTM_PL_FLAG_BUSY)
-			continue;
-
 		man = ttm_manager_type(bdev, place->mem_type);
 		if (!man || !ttm_resource_manager_used(man))
 			continue;
 
-		type_found = true;
-		ret = ttm_resource_alloc(bo, place, mem);
-		if (ret == -ENOSPC)
+		if (place->flags & (force_space ? TTM_PL_FLAG_IDLE :
+				    TTM_PL_FLAG_BUSY))
+			continue;
+
+		do {
+			ret = ttm_resource_alloc(bo, place, mem);
+			if (unlikely(ret != -ENOSPC))
+				return ret;
+			if (likely(!ret) || !force_space)
+				break;
+
+			ret = ttm_mem_evict_first(bdev, man, place, ctx,
+						  ticket);
+			if (unlikely(ret == -EBUSY))
+				break;
+			if (unlikely(ret))
+				return ret;
+		} while (1);
+		if (ret)
 			continue;
-		if (unlikely(ret))
-			goto error;
 
 		ret = ttm_bo_add_move_fence(bo, man, *mem, ctx->no_wait_gpu);
 		if (unlikely(ret)) {
@@ -810,45 +793,19 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 			if (ret == -EBUSY)
 				continue;
 
-			goto error;
+			return ret;
 		}
 		return 0;
 	}
 
-	for (i = 0; i < placement->num_placement; ++i) {
-		const struct ttm_place *place = &placement->placement[i];
-		struct ttm_resource_manager *man;
-
-		if (place->flags & TTM_PL_FLAG_IDLE)
-			continue;
-
-		man = ttm_manager_type(bdev, place->mem_type);
-		if (!man || !ttm_resource_manager_used(man))
-			continue;
-
-		type_found = true;
-		ret = ttm_bo_mem_force_space(bo, place, mem, ctx);
-		if (likely(!ret))
-			return 0;
-
-		if (ret && ret != -EBUSY)
-			goto error;
-	}
-
-	ret = -ENOSPC;
-	if (!type_found) {
-		pr_err(TTM_PFX "No compatible memory type found\n");
-		ret = -EINVAL;
-	}
-
-error:
-	return ret;
+	return -ENOSPC;
 }
 EXPORT_SYMBOL(ttm_bo_mem_space);
 
 static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
 			      struct ttm_placement *placement,
-			      struct ttm_operation_ctx *ctx)
+			      struct ttm_operation_ctx *ctx,
+			      bool force_space)
 {
 	struct ttm_resource *mem;
 	struct ttm_place hop;
@@ -865,7 +822,7 @@ static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
 	 * stop and the driver will be called to make
 	 * the second hop.
 	 */
-	ret = ttm_bo_mem_space(bo, placement, &mem, ctx);
+	ret = ttm_bo_mem_space(bo, placement, &mem, ctx, force_space);
 	if (ret)
 		return ret;
 bounce:
@@ -902,6 +859,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 		    struct ttm_placement *placement,
 		    struct ttm_operation_ctx *ctx)
 {
+	bool force_space;
 	int ret;
 
 	dma_resv_assert_held(bo->base.resv);
@@ -912,20 +870,27 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 	if (!placement->num_placement)
 		return ttm_bo_pipeline_gutting(bo);
 
-	/* Check whether we need to move buffer. */
-	if (bo->resource && ttm_resource_compatible(bo->resource, placement))
-		return 0;
+	force_space = false;
+	do {
+		/* Check whether we need to move buffer. */
+		if (bo->resource &&
+		    ttm_resource_compatible(bo->resource, placement,
+					    force_space))
+			return 0;
+
+		/* Moving of pinned BOs is forbidden */
+		if (bo->pin_count)
+			return -EINVAL;
 
-	/* Moving of pinned BOs is forbidden */
-	if (bo->pin_count)
-		return -EINVAL;
+		ret = ttm_bo_move_buffer(bo, placement, ctx, force_space);
+		if (ret && ret != -ENOSPC)
+			return ret;
 
-	ret = ttm_bo_move_buffer(bo, placement, ctx);
+		force_space = !force_space;
+	} while (force_space);
 	/* For backward compatibility with userspace */
 	if (ret == -ENOSPC)
 		return -ENOMEM;
-	if (ret)
-		return ret;
 
 	/*
 	 * We might need to add a TTM.
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 3cf1db122980..e49e359c7a43 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -296,7 +296,8 @@ bool ttm_resource_intersects(struct ttm_device *bdev,
  * Returns true if the placement is compatible.
  */
 bool ttm_resource_compatible(struct ttm_resource *res,
-			     struct ttm_placement *placement)
+			     struct ttm_placement *placement,
+			     bool busy)
 {
 	struct ttm_buffer_object *bo = res->bo;
 	struct ttm_device *bdev = bo->bdev;
@@ -312,14 +313,19 @@ bool ttm_resource_compatible(struct ttm_resource *res,
 		if (res->mem_type != place->mem_type)
 			continue;
 
+		if (place->flags & (busy ? TTM_PL_FLAG_IDLE : TTM_PL_FLAG_BUSY))
+			continue;
+
+		if (place->flags & TTM_PL_FLAG_CONTIGUOUS &&
+		     !(res->placement & TTM_PL_FLAG_CONTIGUOUS))
+			continue;
+
 		man = ttm_manager_type(bdev, res->mem_type);
 		if (man->func->compatible &&
 		    !man->func->compatible(man, res, place, bo->base.size))
 			continue;
 
-		if ((!(place->flags & TTM_PL_FLAG_CONTIGUOUS) ||
-		     (res->placement & TTM_PL_FLAG_CONTIGUOUS)))
-			return true;
+		return true;
 	}
 	return false;
 }
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 0223a41a64b2..64d738f152d1 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -397,7 +397,8 @@ vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
 int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 		     struct ttm_placement *placement,
 		     struct ttm_resource **mem,
-		     struct ttm_operation_ctx *ctx);
+		     struct ttm_operation_ctx *ctx,
+		     bool force_space);
 
 void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo);
 /*
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 1afa13f0c22b..514858c49848 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -366,7 +366,8 @@ bool ttm_resource_intersects(struct ttm_device *bdev,
 			     const struct ttm_place *place,
 			     size_t size);
 bool ttm_resource_compatible(struct ttm_resource *res,
-			     struct ttm_placement *placement);
+			     struct ttm_placement *placement,
+			     bool busy);
 void ttm_resource_set_bo(struct ttm_resource *res,
 			 struct ttm_buffer_object *bo);
 
-- 
2.34.1

