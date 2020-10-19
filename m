Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 133F7293130
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 00:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891D86EB53;
	Mon, 19 Oct 2020 22:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4206EB4E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 22:23:11 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-iQVYTnEdMNioFucYlLlgxQ-1; Mon, 19 Oct 2020 18:23:05 -0400
X-MC-Unique: iQVYTnEdMNioFucYlLlgxQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF34A8030B2;
 Mon, 19 Oct 2020 22:23:04 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 060651002391;
 Mon, 19 Oct 2020 22:23:03 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/ttm: drop bo->num_pages.
Date: Tue, 20 Oct 2020 08:22:55 +1000
Message-Id: <20201019222257.1684769-4-airlied@gmail.com>
In-Reply-To: <20201019222257.1684769-1-airlied@gmail.com>
References: <20201019222257.1684769-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This is stored in the mem field, everywhere that a new mem is
created, the bo->mem is either copied or this field is copied
explicitly.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 6 +++---
 drivers/gpu/drm/drm_gem_vram_helper.c         | 2 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c       | 4 ++--
 drivers/gpu/drm/qxl/qxl_object.c              | 2 +-
 drivers/gpu/drm/qxl/qxl_object.h              | 2 +-
 drivers/gpu/drm/radeon/radeon_cs.c            | 2 +-
 drivers/gpu/drm/radeon/radeon_object.c        | 6 +++---
 drivers/gpu/drm/radeon/radeon_object.h        | 4 ++--
 drivers/gpu/drm/radeon/radeon_prime.c         | 4 ++--
 drivers/gpu/drm/radeon/radeon_trace.h         | 2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c           | 2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  | 7 +++----
 drivers/gpu/drm/ttm/ttm_bo_util.c             | 4 ++--
 drivers/gpu/drm/ttm/ttm_bo_vm.c               | 6 +++---
 drivers/gpu/drm/ttm/ttm_tt.c                  | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c          | 4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            | 6 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c       | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c       | 4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 5 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c    | 8 ++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c        | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          | 4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       | 6 +++---
 include/drm/ttm/ttm_bo_api.h                  | 1 -
 32 files changed, 56 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 5b465ab774d1..ca52c0ac051e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -55,7 +55,7 @@ void *amdgpu_gem_prime_vmap(struct drm_gem_object *obj)
 	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
 	int ret;
 
-	ret = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.num_pages,
+	ret = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.mem.num_pages,
 			  &bo->dma_buf_vmap);
 	if (ret)
 		return ERR_PTR(ret);
@@ -305,7 +305,7 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma_buf_attachment *attach,
 	case TTM_PL_TT:
 		sgt = drm_prime_pages_to_sg(obj->dev,
 					    bo->tbo.ttm->pages,
-					    bo->tbo.num_pages);
+					    bo->tbo.mem.num_pages);
 		if (IS_ERR(sgt))
 			return sgt;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 3c5ad69eff19..3ab10e40a026 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -124,7 +124,7 @@ uint64_t amdgpu_gmc_agp_addr(struct ttm_buffer_object *bo)
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	struct ttm_dma_tt *ttm;
 
-	if (bo->num_pages != 1 || bo->ttm->caching == ttm_cached)
+	if (bo->mem.num_pages != 1 || bo->ttm->caching == ttm_cached)
 		return AMDGPU_BO_INVALID_OFFSET;
 
 	ttm = container_of(bo->ttm, struct ttm_dma_tt, ttm);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 1aa516429c80..08dbc92cdb64 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -786,7 +786,7 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
 	if (r < 0)
 		return r;
 
-	r = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.num_pages, &bo->kmap);
+	r = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.mem.num_pages, &bo->kmap);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 132e5f955180..edf2f5b55e9f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -175,12 +175,12 @@ static inline void amdgpu_bo_unreserve(struct amdgpu_bo *bo)
 
 static inline unsigned long amdgpu_bo_size(struct amdgpu_bo *bo)
 {
-	return bo->tbo.num_pages << PAGE_SHIFT;
+	return bo->tbo.mem.num_pages << PAGE_SHIFT;
 }
 
 static inline unsigned amdgpu_bo_ngpu_pages(struct amdgpu_bo *bo)
 {
-	return (bo->tbo.num_pages << PAGE_SHIFT) / AMDGPU_GPU_PAGE_SIZE;
+	return (bo->tbo.mem.num_pages << PAGE_SHIFT) / AMDGPU_GPU_PAGE_SIZE;
 }
 
 static inline unsigned amdgpu_bo_gpu_page_alignment(struct amdgpu_bo *bo)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index 63e734a125fb..ed9d65c5ab5c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -127,7 +127,7 @@ TRACE_EVENT(amdgpu_bo_create,
 
 	    TP_fast_assign(
 			   __entry->bo = bo;
-			   __entry->pages = bo->tbo.num_pages;
+			   __entry->pages = bo->tbo.mem.num_pages;
 			   __entry->type = bo->tbo.mem.mem_type;
 			   __entry->prefer = bo->preferred_domains;
 			   __entry->allow = bo->allowed_domains;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 00bec9924b5b..91b20aa2294d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -735,7 +735,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	/* update statistics */
-	atomic64_add((u64)bo->num_pages << PAGE_SHIFT, &adev->num_bytes_moved);
+	atomic64_add((u64)bo->mem.num_pages << PAGE_SHIFT, &adev->num_bytes_moved);
 	return 0;
 }
 
@@ -2241,7 +2241,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 			return r;
 	}
 
-	num_pages = bo->tbo.num_pages;
+	num_pages = bo->tbo.mem.num_pages;
 	mm_node = bo->tbo.mem.mm_node;
 	num_loops = 0;
 	while (num_pages) {
@@ -2271,7 +2271,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 		}
 	}
 
-	num_pages = bo->tbo.num_pages;
+	num_pages = bo->tbo.mem.num_pages;
 	mm_node = bo->tbo.mem.mm_node;
 
 	while (num_pages) {
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 7aeb5daf2805..e99782bc13f1 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -391,7 +391,7 @@ static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
 	if (kmap->virtual || !map)
 		goto out;
 
-	ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, kmap);
+	ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.mem.num_pages, kmap);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index a8264aebf3d4..91b1e32faf64 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -30,7 +30,7 @@
 struct sg_table *nouveau_gem_prime_get_sg_table(struct drm_gem_object *obj)
 {
 	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
-	int npages = nvbo->bo.num_pages;
+	int npages = nvbo->bo.mem.num_pages;
 
 	return drm_prime_pages_to_sg(obj->dev, nvbo->bo.ttm->pages, npages);
 }
@@ -40,7 +40,7 @@ void *nouveau_gem_prime_vmap(struct drm_gem_object *obj)
 	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
 	int ret;
 
-	ret = ttm_bo_kmap(&nvbo->bo, 0, nvbo->bo.num_pages,
+	ret = ttm_bo_kmap(&nvbo->bo, 0, nvbo->bo.mem.num_pages,
 			  &nvbo->dma_buf_vmap);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 547d46c14d56..ed0256d85eff 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -163,7 +163,7 @@ int qxl_bo_kmap(struct qxl_bo *bo, void **ptr)
 		bo->map_count++;
 		return 0;
 	}
-	r = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.num_pages, &bo->kmap);
+	r = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.mem.num_pages, &bo->kmap);
 	if (r)
 		return r;
 	bo->kptr = ttm_kmap_obj_virtual(&bo->kmap, &is_iomem);
diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_object.h
index 09a5c818324d..b18e70a7af2f 100644
--- a/drivers/gpu/drm/qxl/qxl_object.h
+++ b/drivers/gpu/drm/qxl/qxl_object.h
@@ -50,7 +50,7 @@ static inline void qxl_bo_unreserve(struct qxl_bo *bo)
 
 static inline unsigned long qxl_bo_size(struct qxl_bo *bo)
 {
-	return bo->tbo.num_pages << PAGE_SHIFT;
+	return bo->tbo.mem.num_pages << PAGE_SHIFT;
 }
 
 static inline u64 qxl_bo_mmap_offset(struct qxl_bo *bo)
diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index 21ce2f9502c0..33c5e384c6ec 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -401,7 +401,7 @@ static int cmp_size_smaller_first(void *priv, struct list_head *a,
 	struct radeon_bo_list *lb = list_entry(b, struct radeon_bo_list, tv.head);
 
 	/* Sort A before B if A is smaller. */
-	return (int)la->robj->tbo.num_pages - (int)lb->robj->tbo.num_pages;
+	return (int)la->robj->tbo.mem.num_pages - (int)lb->robj->tbo.mem.num_pages;
 }
 
 /**
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index ab81e35cb060..40c96eff2fce 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -54,7 +54,7 @@ static void radeon_update_memory_usage(struct radeon_bo *bo,
 				       unsigned mem_type, int sign)
 {
 	struct radeon_device *rdev = bo->rdev;
-	u64 size = (u64)bo->tbo.num_pages << PAGE_SHIFT;
+	u64 size = (u64)bo->tbo.mem.num_pages << PAGE_SHIFT;
 
 	switch (mem_type) {
 	case TTM_PL_TT:
@@ -256,7 +256,7 @@ int radeon_bo_kmap(struct radeon_bo *bo, void **ptr)
 		}
 		return 0;
 	}
-	r = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.num_pages, &bo->kmap);
+	r = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.mem.num_pages, &bo->kmap);
 	if (r) {
 		return r;
 	}
@@ -610,7 +610,7 @@ int radeon_bo_get_surface_reg(struct radeon_bo *bo)
 out:
 	radeon_set_surface_reg(rdev, i, bo->tiling_flags, bo->pitch,
 			       bo->tbo.mem.start << PAGE_SHIFT,
-			       bo->tbo.num_pages << PAGE_SHIFT);
+			       bo->tbo.mem.num_pages << PAGE_SHIFT);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
index d606e9a935e3..322c5fa91385 100644
--- a/drivers/gpu/drm/radeon/radeon_object.h
+++ b/drivers/gpu/drm/radeon/radeon_object.h
@@ -109,12 +109,12 @@ static inline u64 radeon_bo_gpu_offset(struct radeon_bo *bo)
 
 static inline unsigned long radeon_bo_size(struct radeon_bo *bo)
 {
-	return bo->tbo.num_pages << PAGE_SHIFT;
+	return bo->tbo.mem.num_pages << PAGE_SHIFT;
 }
 
 static inline unsigned radeon_bo_ngpu_pages(struct radeon_bo *bo)
 {
-	return (bo->tbo.num_pages << PAGE_SHIFT) / RADEON_GPU_PAGE_SIZE;
+	return (bo->tbo.mem.num_pages << PAGE_SHIFT) / RADEON_GPU_PAGE_SIZE;
 }
 
 static inline unsigned radeon_bo_gpu_page_alignment(struct radeon_bo *bo)
diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/radeon/radeon_prime.c
index b9de0e51c0be..88ac7b3afd70 100644
--- a/drivers/gpu/drm/radeon/radeon_prime.c
+++ b/drivers/gpu/drm/radeon/radeon_prime.c
@@ -34,7 +34,7 @@
 struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object *obj)
 {
 	struct radeon_bo *bo = gem_to_radeon_bo(obj);
-	int npages = bo->tbo.num_pages;
+	int npages = bo->tbo.mem.num_pages;
 
 	return drm_prime_pages_to_sg(obj->dev, bo->tbo.ttm->pages, npages);
 }
@@ -44,7 +44,7 @@ void *radeon_gem_prime_vmap(struct drm_gem_object *obj)
 	struct radeon_bo *bo = gem_to_radeon_bo(obj);
 	int ret;
 
-	ret = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.num_pages,
+	ret = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.mem.num_pages,
 			  &bo->dma_buf_vmap);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/radeon/radeon_trace.h b/drivers/gpu/drm/radeon/radeon_trace.h
index c93f3ab3c4e3..1729cb9a95c5 100644
--- a/drivers/gpu/drm/radeon/radeon_trace.h
+++ b/drivers/gpu/drm/radeon/radeon_trace.h
@@ -22,7 +22,7 @@ TRACE_EVENT(radeon_bo_create,
 
 	    TP_fast_assign(
 			   __entry->bo = bo;
-			   __entry->pages = bo->tbo.num_pages;
+			   __entry->pages = bo->tbo.mem.num_pages;
 			   ),
 	    TP_printk("bo=%p, pages=%u", __entry->bo, __entry->pages)
 );
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 426643120e3a..ec713f0e55e5 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -357,7 +357,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	/* update statistics */
-	atomic64_add((u64)bo->num_pages << PAGE_SHIFT, &rdev->num_bytes_moved);
+	atomic64_add((u64)bo->mem.num_pages << PAGE_SHIFT, &rdev->num_bytes_moved);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 3101650c01b4..82000675413f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -271,7 +271,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 		goto out_err;
 	}
 
-	ctx->bytes_moved += bo->num_pages << PAGE_SHIFT;
+	ctx->bytes_moved += bo->mem.num_pages << PAGE_SHIFT;
 	return 0;
 
 out_err:
@@ -955,7 +955,7 @@ static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
 
 	dma_resv_assert_held(bo->base.resv);
 
-	mem.num_pages = bo->num_pages;
+	mem.num_pages = bo->mem.num_pages;
 	mem.size = mem.num_pages << PAGE_SHIFT;
 	mem.page_alignment = bo->mem.page_alignment;
 	mem.bus.offset = 0;
@@ -1102,10 +1102,9 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
 	INIT_LIST_HEAD(&bo->swap);
 	bo->bdev = bdev;
 	bo->type = type;
-	bo->num_pages = num_pages;
 	bo->mem.size = num_pages << PAGE_SHIFT;
 	bo->mem.mem_type = TTM_PL_SYSTEM;
-	bo->mem.num_pages = bo->num_pages;
+	bo->mem.num_pages = num_pages;
 	bo->mem.mm_node = NULL;
 	bo->mem.page_alignment = page_alignment;
 	bo->mem.bus.offset = 0;
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index b31be57884ba..e4bd381a8962 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -485,9 +485,9 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo,
 
 	map->virtual = NULL;
 	map->bo = bo;
-	if (num_pages > bo->num_pages)
+	if (num_pages > bo->mem.num_pages)
 		return -EINVAL;
-	if (start_page > bo->num_pages)
+	if (start_page > bo->mem.num_pages)
 		return -EINVAL;
 
 	ret = ttm_mem_io_reserve(bo->bdev, &bo->mem);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index eeaca5d1efe3..65ecfc8127d4 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -199,7 +199,7 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault *vmf,
 
 	/* Fault should not cross bo boundary. */
 	page_offset &= ~(fault_page_size - 1);
-	if (page_offset + fault_page_size > bo->num_pages)
+	if (page_offset + fault_page_size > bo->mem.num_pages)
 		goto out_fallback;
 
 	if (bo->mem.bus.is_iomem)
@@ -307,7 +307,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 	page_last = vma_pages(vma) + vma->vm_pgoff -
 		drm_vma_node_start(&bo->base.vma_node);
 
-	if (unlikely(page_offset >= bo->num_pages))
+	if (unlikely(page_offset >= bo->mem.num_pages))
 		return VM_FAULT_SIGBUS;
 
 	prot = ttm_io_prot(bo, &bo->mem, prot);
@@ -471,7 +471,7 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 		 << PAGE_SHIFT);
 	int ret;
 
-	if (len < 1 || (offset + len) >> PAGE_SHIFT > bo->num_pages)
+	if (len < 1 || (offset + len) >> PAGE_SHIFT > bo->mem.num_pages)
 		return -EIO;
 
 	ret = ttm_bo_reserve(bo, true, false, NULL);
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 3e5dd6271d4c..ca869412565a 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -135,7 +135,7 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
 			       uint32_t page_flags,
 			       enum ttm_caching caching)
 {
-	ttm->num_pages = bo->num_pages;
+	ttm->num_pages = bo->mem.num_pages;
 	ttm->caching = ttm_cached;
 	ttm->page_flags = page_flags;
 	ttm_tt_set_unpopulated(ttm);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
index f21881e087db..9f2779ddcf08 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
@@ -482,8 +482,8 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
 	d.src_addr = NULL;
 	d.dst_pages = dst->ttm->pages;
 	d.src_pages = src->ttm->pages;
-	d.dst_num_pages = dst->num_pages;
-	d.src_num_pages = src->num_pages;
+	d.dst_num_pages = dst->mem.num_pages;
+	d.src_num_pages = src->mem.num_pages;
 	d.dst_prot = ttm_io_prot(dst, &dst->mem, PAGE_KERNEL);
 	d.src_prot = ttm_io_prot(src, &src->mem, PAGE_KERNEL);
 	d.diff = diff;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 263d76ae43f0..63dbc44eebe0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -223,7 +223,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
 	uint32_t new_flags;
 
 	place = vmw_vram_placement.placement[0];
-	place.lpfn = bo->num_pages;
+	place.lpfn = bo->mem.num_pages;
 	placement.num_placement = 1;
 	placement.placement = &place;
 	placement.num_busy_placement = 1;
@@ -244,7 +244,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
 	 * that situation.
 	 */
 	if (bo->mem.mem_type == TTM_PL_VRAM &&
-	    bo->mem.start < bo->num_pages &&
+	    bo->mem.start < bo->mem.num_pages &&
 	    bo->mem.start > 0 &&
 	    buf->base.pin_count == 0) {
 		ctx.interruptible = false;
@@ -391,7 +391,7 @@ void *vmw_bo_map_and_cache(struct vmw_buffer_object *vbo)
 	if (virtual)
 		return virtual;
 
-	ret = ttm_bo_kmap(bo, 0, bo->num_pages, &vbo->map);
+	ret = ttm_bo_kmap(bo, 0, bo->mem.num_pages, &vbo->map);
 	if (ret)
 		DRM_ERROR("Buffer object map failed: %d.\n", ret);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
index 984d8884357d..a077e420d2ff 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
@@ -430,7 +430,7 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
 	 * Do a page by page copy of COTables. This eliminates slow vmap()s.
 	 * This should really be a TTM utility.
 	 */
-	for (i = 0; i < old_bo->num_pages; ++i) {
+	for (i = 0; i < old_bo->mem.num_pages; ++i) {
 		bool dummy;
 
 		ret = ttm_bo_kmap(old_bo, i, 1, &old_map);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index e67e2e8f6e6f..a3b0ae428199 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1042,7 +1042,7 @@ static int vmw_query_bo_switch_prepare(struct vmw_private *dev_priv,
 
 	if (unlikely(new_query_bo != sw_context->cur_query_bo)) {
 
-		if (unlikely(new_query_bo->base.num_pages > 4)) {
+		if (unlikely(new_query_bo->base.mem.num_pages > 4)) {
 			VMW_DEBUG_USER("Query buffer too large.\n");
 			return -EINVAL;
 		}
@@ -1541,7 +1541,7 @@ static int vmw_cmd_dma(struct vmw_private *dev_priv,
 		return ret;
 
 	/* Make sure DMA doesn't cross BO boundaries. */
-	bo_size = vmw_bo->base.num_pages * PAGE_SIZE;
+	bo_size = vmw_bo->base.mem.num_pages * PAGE_SIZE;
 	if (unlikely(cmd->body.guest.ptr.offset > bo_size)) {
 		VMW_DEBUG_USER("Invalid DMA offset.\n");
 		return -EINVAL;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index 9e8a3e337b96..8e3a75532169 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -65,20 +65,19 @@ static int vmw_gmrid_man_get_node(struct ttm_resource_manager *man,
 	spin_lock(&gman->lock);
 
 	if (gman->max_gmr_pages > 0) {
-		gman->used_gmr_pages += bo->num_pages;
+		gman->used_gmr_pages += bo->mem.num_pages;
 		if (unlikely(gman->used_gmr_pages > gman->max_gmr_pages))
 			goto nospace;
 	}
 
 	mem->mm_node = gman;
 	mem->start = id;
-	mem->num_pages = bo->num_pages;
 
 	spin_unlock(&gman->lock);
 	return 0;
 
 nospace:
-	gman->used_gmr_pages -= bo->num_pages;
+	gman->used_gmr_pages -= bo->mem.num_pages;
 	spin_unlock(&gman->lock);
 	ida_free(&gman->gmr_ida, id);
 	return -ENOSPC;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 312ed0881a99..667e4739a1bc 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1218,7 +1218,7 @@ static int vmw_kms_new_framebuffer_bo(struct vmw_private *dev_priv,
 	int ret;
 
 	requested_size = mode_cmd->height * mode_cmd->pitches[0];
-	if (unlikely(requested_size > bo->base.num_pages * PAGE_SIZE)) {
+	if (unlikely(requested_size > bo->base.mem.num_pages * PAGE_SIZE)) {
 		DRM_ERROR("Screen buffer object size is too small "
 			  "for requested mode.\n");
 		return -EINVAL;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
index 0b76b3d17d4c..0a900afc66ff 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
@@ -232,7 +232,7 @@ void vmw_bo_dirty_unmap(struct vmw_buffer_object *vbo,
 int vmw_bo_dirty_add(struct vmw_buffer_object *vbo)
 {
 	struct vmw_bo_dirty *dirty = vbo->dirty;
-	pgoff_t num_pages = vbo->base.num_pages;
+	pgoff_t num_pages = vbo->base.mem.num_pages;
 	size_t size, acc_size;
 	int ret;
 	static struct ttm_operation_ctx ctx = {
@@ -413,7 +413,7 @@ vm_fault_t vmw_bo_vm_mkwrite(struct vm_fault *vmf)
 		return ret;
 
 	page_offset = vmf->pgoff - drm_vma_node_start(&bo->base.vma_node);
-	if (unlikely(page_offset >= bo->num_pages)) {
+	if (unlikely(page_offset >= bo->mem.num_pages)) {
 		ret = VM_FAULT_SIGBUS;
 		goto out_unlock;
 	}
@@ -456,7 +456,7 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
 
 		page_offset = vmf->pgoff -
 			drm_vma_node_start(&bo->base.vma_node);
-		if (page_offset >= bo->num_pages ||
+		if (page_offset >= bo->mem.num_pages ||
 		    vmw_resources_clean(vbo, page_offset,
 					page_offset + PAGE_SIZE,
 					&allowed_prefault)) {
@@ -531,7 +531,7 @@ vm_fault_t vmw_bo_vm_huge_fault(struct vm_fault *vmf,
 
 		page_offset = vmf->pgoff -
 			drm_vma_node_start(&bo->base.vma_node);
-		if (page_offset >= bo->num_pages ||
+		if (page_offset >= bo->mem.num_pages ||
 		    vmw_resources_clean(vbo, page_offset,
 					page_offset + PAGE_SIZE,
 					&allowed_prefault)) {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 00b535831a7a..3422fbe27764 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -360,7 +360,7 @@ static int vmw_resource_buf_alloc(struct vmw_resource *res,
 	int ret;
 
 	if (likely(res->backup)) {
-		BUG_ON(res->backup->base.num_pages * PAGE_SIZE < size);
+		BUG_ON(res->backup->base.mem.num_pages * PAGE_SIZE < size);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
index f328aa5839a2..60d98b41f223 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
@@ -856,7 +856,7 @@ static int vmw_shader_define(struct drm_device *dev, struct drm_file *file_priv,
 			return ret;
 		}
 
-		if ((u64)buffer->base.num_pages * PAGE_SIZE <
+		if ((u64)buffer->base.mem.num_pages * PAGE_SIZE <
 		    (u64)size + (u64)offset) {
 			VMW_DEBUG_USER("Illegal buffer- or shader size.\n");
 			ret = -EINVAL;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 5b04ec047ef3..d7ff3dde0368 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -512,7 +512,7 @@ static void vmw_stdu_bo_fifo_commit(struct vmw_kms_dirty *dirty)
 	cmd->body.host.mipmap = 0;
 	cmd->body.transfer = ddirty->transfer;
 	suffix->suffixSize = sizeof(*suffix);
-	suffix->maximumOffset = ddirty->buf->base.num_pages * PAGE_SIZE;
+	suffix->maximumOffset = ddirty->buf->base.mem.num_pages * PAGE_SIZE;
 
 	if (ddirty->transfer == SVGA3D_WRITE_HOST_VRAM) {
 		blit_size += sizeof(struct vmw_stdu_update);
@@ -1238,7 +1238,7 @@ static uint32_t vmw_stdu_bo_populate_update(struct vmw_du_update_plane  *update,
 	vfbbo = container_of(update->vfb, typeof(*vfbbo), base);
 
 	suffix->suffixSize = sizeof(*suffix);
-	suffix->maximumOffset = vfbbo->buffer->base.num_pages * PAGE_SIZE;
+	suffix->maximumOffset = vfbbo->buffer->base.mem.num_pages * PAGE_SIZE;
 
 	vmw_stdu_populate_update(&suffix[1], stdu->base.unit, bb->x1, bb->x2,
 				 bb->y1, bb->y2);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 3914bfee0533..0c4a3129c9f9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -1550,7 +1550,7 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
 					 &res->backup,
 					 &user_srf->backup_base);
 		if (ret == 0) {
-			if (res->backup->base.num_pages * PAGE_SIZE <
+			if (res->backup->base.mem.num_pages * PAGE_SIZE <
 			    res->backup_size) {
 				VMW_DEBUG_USER("Surface backup buffer too small.\n");
 				vmw_bo_unreference(&res->backup);
@@ -1614,7 +1614,7 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
 	if (res->backup) {
 		rep->buffer_map_handle =
 			drm_vma_node_offset_addr(&res->backup->base.base.vma_node);
-		rep->buffer_size = res->backup->base.num_pages * PAGE_SIZE;
+		rep->buffer_size = res->backup->base.mem.num_pages * PAGE_SIZE;
 		rep->buffer_handle = backup_handle;
 	} else {
 		rep->buffer_map_handle = 0;
@@ -1692,7 +1692,7 @@ vmw_gb_surface_reference_internal(struct drm_device *dev,
 	rep->crep.buffer_handle = backup_handle;
 	rep->crep.buffer_map_handle =
 		drm_vma_node_offset_addr(&srf->res.backup->base.base.vma_node);
-	rep->crep.buffer_size = srf->res.backup->base.num_pages * PAGE_SIZE;
+	rep->crep.buffer_size = srf->res.backup->base.mem.num_pages * PAGE_SIZE;
 
 	rep->creq.version = drm_vmw_gb_surface_v1;
 	rep->creq.svga3d_flags_upper_32_bits =
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 37102e45e496..12d98c80b334 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -123,7 +123,6 @@ struct ttm_buffer_object {
 	struct ttm_bo_device *bdev;
 	enum ttm_bo_type type;
 	void (*destroy) (struct ttm_buffer_object *);
-	unsigned long num_pages;
 	size_t acc_size;
 
 	/**
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
