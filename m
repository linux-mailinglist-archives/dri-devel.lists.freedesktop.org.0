Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EE169AB54
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 13:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4AD10EFA8;
	Fri, 17 Feb 2023 12:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E3C10EF97;
 Fri, 17 Feb 2023 12:22:30 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id cz7so171828edb.12;
 Fri, 17 Feb 2023 04:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=09XFQqjoZ/tRNPw0JyNYEAV5qGxEWMzMNsp85snhmRI=;
 b=Hzyx06cxLKuP2J+ADXwGq+G7vP+0N77m7mwZca+Iy0nZC6qSFpRMMTpnBbyBxk05GV
 6vsxTcdql2ROoVBzYtAFWCGYIpKR2ZVehOuieNamOvVRPP3f+OUDSgX218jfdR/3MMZL
 OL9koJx6gwp+CJ4VQOnOaIF2pPVwxQTKLsXQ6vbTSkJezq2IC9YATodiZnORckXsqt3J
 FI0Y5IZud1NRC4RSBOghFsdyaWDFFD7QlA4Mbr0bVLtyZoq/eoCfaW65t4AlCJtKVMfW
 Yoia6c2NCQTULNyNRMkbzIQ4C2BcvV5b0sjAdI7Jurnnx1sjxZ+Wrl4/F7PobbLrdEhl
 j7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=09XFQqjoZ/tRNPw0JyNYEAV5qGxEWMzMNsp85snhmRI=;
 b=buuomGCO3/BNUUj+IMdge2NH8SSIx60bwG/PG10/OdfdzDlFG94i8C4t5Ngs8Np+Aq
 aewO/5DFBHEhUVmLPX4EyoHBZbv6U+/BO0wj3zdlNGTe5xg4/RZ7thzyah4WnUKcQJVz
 HaVdsyXTcNU2/sWEatydX0iD1uQr8qHeauwYmS4Bc/VFH9LXwz5/NI7GPV2bF0tcMm+J
 Rrw4NeY/evWKEZdM7rD5JRFNhnyec7UwAqyHnYtAiNpcdXPe5ragrZsOv1CIUQKpUkhP
 KE9T7SAeEcV/4YB9Lh1Q3Oo/luPDgTBqwZYi0WlUWqg3do5g/rza5YAhgKU9gld2kBf9
 2opg==
X-Gm-Message-State: AO0yUKW4gJY9q/5sVixFo1Of3wuWkqeNYBSkFwk+V+PxvQyFoiFUiWk4
 dL8lb/vGizXw3uY9Qh/1WOlLLaP6yKg=
X-Google-Smtp-Source: AK7set/K7RyjrPEXfcJtzzZ9nO1QonbnJCM7v/QiDNQgpOIeP2n7tgBJJVs8UDMLBycSlcEi5A2QSg==
X-Received: by 2002:a50:ec90:0:b0:4ac:bab1:feee with SMTP id
 e16-20020a50ec90000000b004acbab1feeemr1039842edr.24.1676636549137; 
 Fri, 17 Feb 2023 04:22:29 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a50c38a000000b004ad75c5c0fdsm1373472edf.18.2023.02.17.04.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 04:22:28 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] drm/ttm: Change the meaning of resource->start from pfn
 to bytes v2
Date: Fri, 17 Feb 2023 13:22:21 +0100
Message-Id: <20230217122224.29243-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230217122224.29243-1-christian.koenig@amd.com>
References: <20230217122224.29243-1-christian.koenig@amd.com>
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

From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>

Change resource->start from pfn to bytes to allow allocating objects
smaller than a page and adjust all DRM drivers still using this.

v2 (chk): inline drm_gem_vram_pg_offset(), move amdgpu cursor changes to
          separate patch, make resource->start 64bit on all platforms,
          fix missing removals of PAGE_SHIFT.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c   |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c      |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c |  7 +++----
 drivers/gpu/drm/drm_gem_vram_helper.c        | 18 +++++++-----------
 drivers/gpu/drm/nouveau/nouveau_bo.c         | 13 ++++++-------
 drivers/gpu/drm/nouveau/nouveau_bo0039.c     |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_mem.c        | 10 +++++-----
 drivers/gpu/drm/nouveau/nouveau_ttm.c        |  2 +-
 drivers/gpu/drm/nouveau/nv17_fence.c         |  2 +-
 drivers/gpu/drm/nouveau/nv50_fence.c         |  2 +-
 drivers/gpu/drm/qxl/qxl_drv.h                |  2 +-
 drivers/gpu/drm/qxl/qxl_object.c             |  2 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                |  5 ++---
 drivers/gpu/drm/radeon/radeon_object.c       |  6 +++---
 drivers/gpu/drm/radeon/radeon_object.h       |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c          | 13 ++++++-------
 drivers/gpu/drm/radeon/radeon_vm.c           |  2 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c      |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c           |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c          |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c      |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c   |  3 +--
 include/drm/ttm/ttm_resource.h               |  2 +-
 24 files changed, 53 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index d66b5fcbadf2..a48ed9027fee 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -142,7 +142,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 		if (unlikely(r))
 			goto err_free;
 
-		node->base.start = node->mm_nodes[0].start >> PAGE_SHIFT;
+		node->base.start = node->mm_nodes[0].start;
 	} else {
 		node->mm_nodes[0].start = 0;
 		node->mm_nodes[0].size = node->base.size;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 283e8fe608ce..05fc6bda5f58 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1490,8 +1490,8 @@ u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo)
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	uint64_t offset;
 
-	offset = (bo->tbo.resource->start << PAGE_SHIFT) +
-		 amdgpu_ttm_domain_start(adev, bo->tbo.resource->mem_type);
+	offset = amdgpu_ttm_domain_start(adev, bo->tbo.resource->mem_type);
+	offset += bo->tbo.resource->start;
 
 	return amdgpu_gmc_sign_extend(offset);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 77c2da886f5b..9009b5477faa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -569,7 +569,7 @@ static int amdgpu_ttm_io_mem_reserve(struct ttm_device *bdev,
 	case AMDGPU_PL_PREEMPT:
 		break;
 	case TTM_PL_VRAM:
-		mem->bus.offset = mem->start << PAGE_SHIFT;
+		mem->bus.offset = mem->start;
 		/* check if it's visible */
 		if ((mem->bus.offset + bus_size) > adev->gmc.visible_vram_size)
 			return -EINVAL;
@@ -926,7 +926,7 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
 
 	addr = amdgpu_gmc_agp_addr(bo);
 	if (addr != AMDGPU_BO_INVALID_OFFSET) {
-		bo->resource->start = addr >> PAGE_SHIFT;
+		bo->resource->start = addr;
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 9fa1d814508a..5e1e24d3b88e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -527,14 +527,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 
 	vres->base.start = 0;
 	list_for_each_entry(block, &vres->blocks, link) {
-		unsigned long start;
+		uint64_t start;
 
 		start = amdgpu_vram_mgr_block_start(block) +
 			amdgpu_vram_mgr_block_size(block);
-		start >>= PAGE_SHIFT;
 
-		if (start > PFN_UP(vres->base.size))
-			start -= PFN_UP(vres->base.size);
+		if (start > vres->base.size)
+			start -= vres->base.size;
 		else
 			start = 0;
 		vres->base.start = max(vres->base.start, start);
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index f70d11e1cd47..c69f2f6bd5c4 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -249,16 +249,6 @@ void drm_gem_vram_put(struct drm_gem_vram_object *gbo)
 }
 EXPORT_SYMBOL(drm_gem_vram_put);
 
-static u64 drm_gem_vram_pg_offset(struct drm_gem_vram_object *gbo)
-{
-	/* Keep TTM behavior for now, remove when drivers are audited */
-	if (WARN_ON_ONCE(!gbo->bo.resource ||
-			 gbo->bo.resource->mem_type == TTM_PL_SYSTEM))
-		return 0;
-
-	return gbo->bo.resource->start;
-}
-
 /**
  * drm_gem_vram_offset() - \
 	Returns a GEM VRAM object's offset in video memory
@@ -275,7 +265,13 @@ s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo)
 {
 	if (WARN_ON_ONCE(!gbo->bo.pin_count))
 		return (s64)-ENODEV;
-	return drm_gem_vram_pg_offset(gbo) << PAGE_SHIFT;
+
+	/* Keep TTM behavior for now, remove when drivers are audited */
+	if (WARN_ON_ONCE(!gbo->bo.resource ||
+			 gbo->bo.resource->mem_type == TTM_PL_SYSTEM))
+		return 0;
+
+	return gbo->bo.resource->start;
 }
 EXPORT_SYMBOL(drm_gem_vram_offset);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index c2ec91cc845d..89fada6c2e11 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -946,7 +946,7 @@ static void nouveau_bo_move_ntfy(struct ttm_buffer_object *bo,
 	}
 
 	if (new_reg)
-		nvbo->offset = (new_reg->start << PAGE_SHIFT);
+		nvbo->offset = new_reg->start;
 
 }
 
@@ -957,7 +957,7 @@ nouveau_bo_vm_bind(struct ttm_buffer_object *bo, struct ttm_resource *new_reg,
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct drm_device *dev = drm->dev;
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
-	u64 offset = new_reg->start << PAGE_SHIFT;
+	u64 offset = new_reg->start;
 
 	*new_tile = NULL;
 	if (new_reg->mem_type != TTM_PL_VRAM)
@@ -1118,8 +1118,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *reg)
 	case TTM_PL_TT:
 #if IS_ENABLED(CONFIG_AGP)
 		if (drm->agp.bridge) {
-			reg->bus.offset = (reg->start << PAGE_SHIFT) +
-				drm->agp.base;
+			reg->bus.offset = reg->start + drm->agp.base;
 			reg->bus.is_iomem = !drm->agp.cma;
 			reg->bus.caching = ttm_write_combined;
 		}
@@ -1132,7 +1131,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *reg)
 		}
 		fallthrough;	/* tiled memory */
 	case TTM_PL_VRAM:
-		reg->bus.offset = (reg->start << PAGE_SHIFT) +
+		reg->bus.offset = reg->start +
 			device->func->resource_addr(device, 1);
 		reg->bus.is_iomem = true;
 
@@ -1222,7 +1221,7 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
 	struct nvkm_device *device = nvxx_device(&drm->client.device);
-	u32 mappable = device->func->resource_size(device, 1) >> PAGE_SHIFT;
+	u32 mappable = device->func->resource_size(device, 1);
 	int i, ret;
 
 	/* as long as the bo isn't in vram, and isn't tiled, we've got
@@ -1241,7 +1240,7 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
 	} else {
 		/* make sure bo is in mappable vram */
 		if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA ||
-		    bo->resource->start + PFN_UP(bo->resource->size) < mappable)
+		    bo->resource->start + bo->resource->size < mappable)
 			return 0;
 
 		for (i = 0; i < nvbo->placement.num_placement; ++i) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo0039.c b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
index e2ce44adaa5c..41197312f82f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo0039.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
@@ -49,9 +49,9 @@ nv04_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 {
 	struct nvif_push *push = chan->chan.push;
 	u32 src_ctxdma = nouveau_bo_mem_ctxdma(bo, chan, old_reg);
-	u32 src_offset = old_reg->start << PAGE_SHIFT;
+	u32 src_offset = old_reg->start;
 	u32 dst_ctxdma = nouveau_bo_mem_ctxdma(bo, chan, new_reg);
-	u32 dst_offset = new_reg->start << PAGE_SHIFT;
+	u32 dst_offset = new_reg->start;
 	u32 page_count = PFN_UP(new_reg->size);
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 25f31d5169e5..d31cc3b069d8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -158,7 +158,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
 	}
 	mutex_unlock(&drm->master.lock);
 
-	reg->start = mem->mem.addr >> PAGE_SHIFT;
+	reg->start = mem->mem.addr;
 	return ret;
 }
 
@@ -197,8 +197,8 @@ nouveau_mem_intersects(struct ttm_resource *res,
 	u32 num_pages = PFN_UP(size);
 
 	/* Don't evict BOs outside of the requested placement range */
-	if (place->fpfn >= (res->start + num_pages) ||
-	    (place->lpfn && place->lpfn <= res->start))
+	if (place->fpfn >= ((res->start >> PAGE_SHIFT) + num_pages) ||
+	    (place->lpfn && place->lpfn <= (res->start >> PAGE_SHIFT)))
 		return false;
 
 	return true;
@@ -211,8 +211,8 @@ nouveau_mem_compatible(struct ttm_resource *res,
 {
 	u32 num_pages = PFN_UP(size);
 
-	if (res->start < place->fpfn ||
-	    (place->lpfn && (res->start + num_pages) > place->lpfn))
+	if ((res->start >> PAGE_SHIFT) < place->fpfn ||
+	    (place->lpfn && ((res->start >> PAGE_SHIFT) + num_pages) > place->lpfn))
 		return false;
 
 	return true;
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 1469a88910e4..2127b98e033a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -145,7 +145,7 @@ nv04_gart_manager_new(struct ttm_resource_manager *man,
 		return ret;
 	}
 
-	(*res)->start = mem->vma[0].addr >> PAGE_SHIFT;
+	(*res)->start = mem->vma[0].addr;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nv17_fence.c b/drivers/gpu/drm/nouveau/nv17_fence.c
index 07c2e0878c24..b6567e5f769c 100644
--- a/drivers/gpu/drm/nouveau/nv17_fence.c
+++ b/drivers/gpu/drm/nouveau/nv17_fence.c
@@ -79,7 +79,7 @@ nv17_fence_context_new(struct nouveau_channel *chan)
 	struct nv10_fence_priv *priv = chan->drm->fence;
 	struct ttm_resource *reg = priv->bo->bo.resource;
 	struct nv10_fence_chan *fctx;
-	u32 start = reg->start * PAGE_SIZE;
+	u32 start = reg->start;
 	u32 limit = start + priv->bo->bo.base.size - 1;
 	int ret = 0;
 
diff --git a/drivers/gpu/drm/nouveau/nv50_fence.c b/drivers/gpu/drm/nouveau/nv50_fence.c
index ea1e1f480bfe..c3f1df834bb9 100644
--- a/drivers/gpu/drm/nouveau/nv50_fence.c
+++ b/drivers/gpu/drm/nouveau/nv50_fence.c
@@ -38,7 +38,7 @@ nv50_fence_context_new(struct nouveau_channel *chan)
 	struct nv10_fence_priv *priv = chan->drm->fence;
 	struct nv10_fence_chan *fctx;
 	struct ttm_resource *reg = priv->bo->bo.resource;
-	u32 start = reg->start * PAGE_SIZE;
+	u32 start = reg->start;
 	u32 limit = start + priv->bo->bo.base.size - 1;
 	int ret;
 
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index ea993d7162e8..994996e6a623 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -289,7 +289,7 @@ qxl_bo_physical_address(struct qxl_device *qdev, struct qxl_bo *bo,
 
        /* TODO - need to hold one of the locks to read bo->tbo.resource->start */
 
-	return slot->high_bits | ((bo->tbo.resource->start << PAGE_SHIFT) + offset);
+	return slot->high_bits | (bo->tbo.resource->start + offset);
 }
 
 /* qxl_display.c */
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 06a58dad5f5c..657b9995f4f6 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -220,7 +220,7 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev,
 	else
 		goto fallback;
 
-	offset = bo->tbo.resource->start << PAGE_SHIFT;
+	offset = bo->tbo.resource->start;
 	return io_mapping_map_atomic_wc(map, offset + page_offset);
 fallback:
 	if (bo->kptr) {
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index a92a5b0d4c25..31f96c7d89b4 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -81,13 +81,12 @@ int qxl_ttm_io_mem_reserve(struct ttm_device *bdev,
 		return 0;
 	case TTM_PL_VRAM:
 		mem->bus.is_iomem = true;
-		mem->bus.offset = (mem->start << PAGE_SHIFT) + qdev->vram_base;
+		mem->bus.offset = mem->start + qdev->vram_base;
 		mem->bus.caching = ttm_write_combined;
 		break;
 	case TTM_PL_PRIV:
 		mem->bus.is_iomem = true;
-		mem->bus.offset = (mem->start << PAGE_SHIFT) +
-			qdev->surfaceram_base;
+		mem->bus.offset = mem->start + qdev->surfaceram_base;
 		mem->bus.caching = ttm_write_combined;
 		break;
 	default:
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 10c0fbd9d2b4..83d50c72aeeb 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -588,7 +588,7 @@ int radeon_bo_get_surface_reg(struct radeon_bo *bo)
 
 out:
 	radeon_set_surface_reg(rdev, i, bo->tiling_flags, bo->pitch,
-			       bo->tbo.resource->start << PAGE_SHIFT,
+			       bo->tbo.resource->start,
 			       bo->tbo.base.size);
 	return 0;
 }
@@ -738,7 +738,7 @@ vm_fault_t radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
 		return 0;
 
 	size = bo->resource->size;
-	offset = bo->resource->start << PAGE_SHIFT;
+	offset = bo->resource->start;
 	if ((offset + size) <= rdev->mc.visible_vram_size)
 		return 0;
 
@@ -760,7 +760,7 @@ vm_fault_t radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
 		radeon_ttm_placement_from_domain(rbo, RADEON_GEM_DOMAIN_GTT);
 		r = ttm_bo_validate(bo, &rbo->placement, &ctx);
 	} else if (likely(!r)) {
-		offset = bo->resource->start << PAGE_SHIFT;
+		offset = bo->resource->start;
 		/* this should never happen */
 		if ((offset + size) > rdev->mc.visible_vram_size)
 			return VM_FAULT_SIGBUS;
diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
index 0a6ef49e990a..6e0002e08c57 100644
--- a/drivers/gpu/drm/radeon/radeon_object.h
+++ b/drivers/gpu/drm/radeon/radeon_object.h
@@ -104,7 +104,7 @@ static inline u64 radeon_bo_gpu_offset(struct radeon_bo *bo)
 		break;
 	}
 
-	return (bo->tbo.resource->start << PAGE_SHIFT) + start;
+	return bo->tbo.resource->start + start;
 }
 
 static inline unsigned long radeon_bo_size(struct radeon_bo *bo)
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 78dd6a87fb65..aa8785b6b1e8 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -104,7 +104,7 @@ static void radeon_evict_flags(struct ttm_buffer_object *bo,
 		if (rbo->rdev->ring[radeon_copy_ring_index(rbo->rdev)].ready == false)
 			radeon_ttm_placement_from_domain(rbo, RADEON_GEM_DOMAIN_CPU);
 		else if (rbo->rdev->mc.visible_vram_size < rbo->rdev->mc.real_vram_size &&
-			 bo->resource->start < (rbo->rdev->mc.visible_vram_size >> PAGE_SHIFT)) {
+			 bo->resource->start < rbo->rdev->mc.visible_vram_size) {
 			unsigned fpfn = rbo->rdev->mc.visible_vram_size >> PAGE_SHIFT;
 			int i;
 
@@ -149,8 +149,8 @@ static int radeon_move_blit(struct ttm_buffer_object *bo,
 
 	rdev = radeon_get_rdev(bo->bdev);
 	ridx = radeon_copy_ring_index(rdev);
-	old_start = (u64)old_mem->start << PAGE_SHIFT;
-	new_start = (u64)new_mem->start << PAGE_SHIFT;
+	old_start = (u64)old_mem->start;
+	new_start = (u64)new_mem->start;
 
 	switch (old_mem->mem_type) {
 	case TTM_PL_VRAM:
@@ -274,15 +274,14 @@ static int radeon_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resourc
 #if IS_ENABLED(CONFIG_AGP)
 		if (rdev->flags & RADEON_IS_AGP) {
 			/* RADEON_IS_AGP is set only if AGP is active */
-			mem->bus.offset = (mem->start << PAGE_SHIFT) +
-				rdev->mc.agp_base;
+			mem->bus.offset = mem->start + rdev->mc.agp_base;
 			mem->bus.is_iomem = !rdev->agp->cant_use_aperture;
 			mem->bus.caching = ttm_write_combined;
 		}
 #endif
 		break;
 	case TTM_PL_VRAM:
-		mem->bus.offset = mem->start << PAGE_SHIFT;
+		mem->bus.offset = mem->start;
 		/* check if it's visible */
 		if ((mem->bus.offset + bus_size) > rdev->mc.visible_vram_size)
 			return -EINVAL;
@@ -443,7 +442,7 @@ static int radeon_ttm_backend_bind(struct ttm_device *bdev,
 		flags &= ~RADEON_GART_PAGE_WRITE;
 	}
 
-	gtt->offset = (unsigned long)(bo_mem->start << PAGE_SHIFT);
+	gtt->offset = (unsigned long)bo_mem->start;
 	if (!ttm->num_pages) {
 		WARN(1, "nothing to bind %u pages for mreg %p back %p!\n",
 		     ttm->num_pages, bo_mem, ttm);
diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
index 987cabbf1318..27ba2f6c4ac5 100644
--- a/drivers/gpu/drm/radeon/radeon_vm.c
+++ b/drivers/gpu/drm/radeon/radeon_vm.c
@@ -945,7 +945,7 @@ int radeon_vm_bo_update(struct radeon_device *rdev,
 		bo_va->flags &= ~RADEON_VM_PAGE_WRITEABLE;
 
 	if (mem) {
-		addr = (u64)mem->start << PAGE_SHIFT;
+		addr = (u64)mem->start;
 		if (mem->mem_type != TTM_PL_SYSTEM)
 			bo_va->flags |= RADEON_VM_PAGE_VALID;
 
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index b8cb72432a2a..c3cd7c6dd816 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -95,7 +95,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 		return ret;
 	}
 
-	node->base.start = node->mm_nodes[0].start >> PAGE_SHIFT;
+	node->base.start = node->mm_nodes[0].start;
 	*res = &node->base;
 	return 0;
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 82094c137855..811e1fb22840 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -188,7 +188,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
 	 * that situation.
 	 */
 	if (bo->resource->mem_type == TTM_PL_VRAM &&
-	    bo->resource->start < PFN_UP(bo->resource->size) &&
+	    bo->resource->start < bo->resource->size &&
 	    bo->resource->start > 0 &&
 	    buf->tbo.pin_count == 0) {
 		ctx.interruptible = false;
@@ -258,7 +258,7 @@ void vmw_bo_get_guest_ptr(const struct ttm_buffer_object *bo,
 {
 	if (bo->resource->mem_type == TTM_PL_VRAM) {
 		ptr->gmrId = SVGA_GMR_FRAMEBUFFER;
-		ptr->offset = bo->resource->start << PAGE_SHIFT;
+		ptr->offset = bo->resource->start;
 	} else {
 		ptr->gmrId = bo->resource->start;
 		ptr->offset = 0;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
index 195ff8792e5a..38b08a47199b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
@@ -584,7 +584,7 @@ static int vmw_cmd_emit_dummy_legacy_query(struct vmw_private *dev_priv,
 
 	if (bo->resource->mem_type == TTM_PL_VRAM) {
 		cmd->body.guestResult.gmrId = SVGA_GMR_FRAMEBUFFER;
-		cmd->body.guestResult.offset = bo->resource->start << PAGE_SHIFT;
+		cmd->body.guestResult.offset = bo->resource->start;
 	} else {
 		cmd->body.guestResult.gmrId = bo->resource->start;
 		cmd->body.guestResult.offset = 0;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 6b9aa2b4ef54..190ba76a6a97 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -3764,7 +3764,7 @@ static void vmw_apply_relocations(struct vmw_sw_context *sw_context)
 		bo = &reloc->vbo->tbo;
 		switch (bo->resource->mem_type) {
 		case TTM_PL_VRAM:
-			reloc->location->offset += bo->resource->start << PAGE_SHIFT;
+			reloc->location->offset += bo->resource->start;
 			reloc->location->gmrId = SVGA_GMR_FRAMEBUFFER;
 			break;
 		case VMW_PL_GMR:
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index af8562c95cc3..9476b527b3fd 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -462,8 +462,7 @@ static int vmw_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *
 	case VMW_PL_MOB:
 		return 0;
 	case TTM_PL_VRAM:
-		mem->bus.offset = (mem->start << PAGE_SHIFT) +
-			dev_priv->vram_start;
+		mem->bus.offset = mem->start + dev_priv->vram_start;
 		mem->bus.is_iomem = true;
 		mem->bus.caching = ttm_cached;
 		break;
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 78a226eba953..cf6cd4425354 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -207,7 +207,7 @@ struct ttm_bus_placement {
  * buffer object.
  */
 struct ttm_resource {
-	unsigned long start;
+	uint64_t start;
 	size_t size;
 	uint32_t mem_type;
 	uint32_t placement;
-- 
2.34.1

