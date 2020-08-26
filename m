Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F63F25252B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 03:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307456E9EA;
	Wed, 26 Aug 2020 01:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CE56E9EA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 01:46:29 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-1LBJmiJfPLyWRzldNWJr6A-1; Tue, 25 Aug 2020 21:45:21 -0400
X-MC-Unique: 1LBJmiJfPLyWRzldNWJr6A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B2BE189E602;
 Wed, 26 Aug 2020 01:45:20 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-53.bne.redhat.com
 [10.64.54.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D369E60C13;
 Wed, 26 Aug 2020 01:45:18 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 17/23] drm/ttm: split populated/bound state flags.
Date: Wed, 26 Aug 2020 11:44:22 +1000
Message-Id: <20200826014428.828392-18-airlied@gmail.com>
In-Reply-To: <20200826014428.828392-1-airlied@gmail.com>
References: <20200826014428.828392-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0.0
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
Cc: kraxel@redhat.com, sroland@vmware.com, bskeggs@redhat.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Get bound out is the next step.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_bo.c       |  4 ++--
 drivers/gpu/drm/radeon/radeon_mn.c         |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c        |  4 ++--
 drivers/gpu/drm/ttm/ttm_bo_util.c          |  2 +-
 drivers/gpu/drm/ttm/ttm_page_alloc.c       |  6 +++---
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c   |  6 +++---
 drivers/gpu/drm/ttm/ttm_tt.c               | 19 +++++++++----------
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c       |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  2 +-
 include/drm/ttm/ttm_tt.h                   | 10 ++++------
 11 files changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index adac24625191..c1c3691c3b9f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1301,7 +1301,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_device *bdev,
 			return -ENOMEM;
 
 		ttm->page_flags |= TTM_PAGE_FLAG_SG;
-		ttm->state = tt_unbound;
+		ttm->populated = true;
 		return 0;
 	}
 
@@ -1321,7 +1321,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_device *bdev,
 		drm_prime_sg_to_page_addr_arrays(gtt->ttm.sg, ttm->pages,
 						 gtt->ttm.dma_address,
 						 ttm->num_pages);
-		ttm->state = tt_unbound;
+		ttm->populated = true;
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 478e498da965..e9de922ae921 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1264,14 +1264,14 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
 	struct device *dev;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
-	if (ttm->state != tt_unpopulated)
+	if (ttm->populated)
 		return 0;
 
 	if (slave && ttm_dma->sg) {
 		/* make userspace faulting work */
 		drm_prime_sg_to_page_addr_arrays(ttm_dma->sg, ttm->pages,
 						 ttm_dma->dma_address, ttm->num_pages);
-		ttm->state = tt_unbound;
+		ttm->populated = true;
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/radeon/radeon_mn.c b/drivers/gpu/drm/radeon/radeon_mn.c
index f93829f08a4d..5f57df7e6f08 100644
--- a/drivers/gpu/drm/radeon/radeon_mn.c
+++ b/drivers/gpu/drm/radeon/radeon_mn.c
@@ -53,7 +53,7 @@ static bool radeon_mn_invalidate(struct mmu_interval_notifier *mn,
 	struct ttm_operation_ctx ctx = { false, false };
 	long r;
 
-	if (!bo->tbo.ttm || bo->tbo.ttm->state != tt_bound)
+	if (!bo->tbo.ttm || bo->tbo.ttm->bound == false)
 		return true;
 
 	if (!mmu_notifier_range_blockable(range))
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index f5cbe5d13d33..f9e4e64a6d64 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -615,14 +615,14 @@ static int radeon_ttm_tt_populate(struct ttm_bo_device *bdev,
 			return -ENOMEM;
 
 		ttm->page_flags |= TTM_PAGE_FLAG_SG;
-		ttm->state = tt_unbound;
+		ttm->populated = true;
 		return 0;
 	}
 
 	if (slave && gtt->ttm.sg) {
 		drm_prime_sg_to_page_addr_arrays(gtt->ttm.sg, ttm->pages,
 						 gtt->ttm.dma_address, ttm->num_pages);
-		ttm->state = tt_unbound;
+		ttm->populated = true;
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 3b17fe3cb57a..d5d841270e38 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -251,7 +251,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	 * Don't move nonexistent data. Clear destination instead.
 	 */
 	if (old_iomap == NULL &&
-	    (ttm == NULL || (ttm->state == tt_unpopulated &&
+	    (ttm == NULL || (!ttm->populated &&
 			     !(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)))) {
 		memset_io(new_iomap, 0, new_mem->num_pages*PAGE_SIZE);
 		goto out2;
diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm/ttm_page_alloc.c
index b40a4678c296..2d30a2deadb5 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
@@ -1044,7 +1044,7 @@ ttm_pool_unpopulate_helper(struct ttm_tt *ttm, unsigned mem_count_update)
 put_pages:
 	ttm_put_pages(ttm->pages, ttm->num_pages, ttm->page_flags,
 		      ttm->caching_state);
-	ttm->state = tt_unpopulated;
+	ttm->populated = false;
 }
 
 int ttm_pool_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
@@ -1053,7 +1053,7 @@ int ttm_pool_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 	unsigned i;
 	int ret;
 
-	if (ttm->state != tt_unpopulated)
+	if (ttm->populated)
 		return 0;
 
 	if (ttm_check_under_lowerlimit(mem_glob, ttm->num_pages, ctx))
@@ -1083,7 +1083,7 @@ int ttm_pool_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 		}
 	}
 
-	ttm->state = tt_unbound;
+	ttm->populated = true;
 	return 0;
 }
 EXPORT_SYMBOL(ttm_pool_populate);
diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
index faefaaef7909..9a3b7145d9cb 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
@@ -894,7 +894,7 @@ int ttm_dma_populate(struct ttm_dma_tt *ttm_dma, struct device *dev,
 	unsigned i;
 	int ret;
 
-	if (ttm->state != tt_unpopulated)
+	if (ttm->populated)
 		return 0;
 
 	if (ttm_check_under_lowerlimit(mem_glob, num_pages, ctx))
@@ -982,7 +982,7 @@ int ttm_dma_populate(struct ttm_dma_tt *ttm_dma, struct device *dev,
 		}
 	}
 
-	ttm->state = tt_unbound;
+	ttm->populated = true;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ttm_dma_populate);
@@ -1076,7 +1076,7 @@ void ttm_dma_unpopulate(struct ttm_dma_tt *ttm_dma, struct device *dev)
 	/* shrink pool if necessary (only on !is_cached pools)*/
 	if (npages)
 		ttm_dma_page_pool_free(pool, npages, false);
-	ttm->state = tt_unpopulated;
+	ttm->populated = false;
 }
 EXPORT_SYMBOL_GPL(ttm_dma_unpopulate);
 
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 1b9960085d11..ee6fda175da6 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -156,7 +156,7 @@ static int ttm_tt_set_caching(struct ttm_tt *ttm,
 	if (ttm->caching_state == c_state)
 		return 0;
 
-	if (ttm->state == tt_unpopulated) {
+	if (!ttm->populated) {
 		/* Change caching but don't populate */
 		ttm->caching_state = c_state;
 		return 0;
@@ -214,7 +214,7 @@ void ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 
 	ttm_tt_unbind(bdev, ttm);
 
-	if (ttm->state == tt_unbound)
+	if (ttm->populated)
 		ttm_tt_unpopulate(bdev, ttm);
 
 	if (!(ttm->page_flags & TTM_PAGE_FLAG_PERSISTENT_SWAP) &&
@@ -232,8 +232,8 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
 	ttm->num_pages = bo->num_pages;
 	ttm->caching_state = tt_cached;
 	ttm->page_flags = page_flags;
-	ttm->state = tt_unpopulated;
 	ttm->swap_storage = NULL;
+	ttm->populated = false;
 }
 
 int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
@@ -311,9 +311,9 @@ EXPORT_SYMBOL(ttm_dma_tt_fini);
 
 void ttm_tt_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
-	if (ttm->state == tt_bound) {
+	if (ttm->bound) {
 		bdev->driver->ttm_tt_unbind(bdev, ttm);
-		ttm->state = tt_unbound;
+		ttm->bound = false;
 	}
 }
 
@@ -326,7 +326,7 @@ int ttm_tt_bind(struct ttm_bo_device *bdev,
 	if (!ttm)
 		return -EINVAL;
 
-	if (ttm->state == tt_bound)
+	if (ttm->bound)
 		return 0;
 
 	ret = ttm_tt_populate(bdev, ttm, ctx);
@@ -337,7 +337,7 @@ int ttm_tt_bind(struct ttm_bo_device *bdev,
 	if (unlikely(ret != 0))
 		return ret;
 
-	ttm->state = tt_bound;
+	ttm->bound = true;
 
 	return 0;
 }
@@ -395,7 +395,6 @@ int ttm_tt_swapout(struct ttm_bo_device *bdev,
 	int i;
 	int ret = -ENOMEM;
 
-	BUG_ON(ttm->state != tt_unbound && ttm->state != tt_unpopulated);
 	BUG_ON(ttm->caching_state != tt_cached);
 
 	if (!persistent_swap_storage) {
@@ -462,7 +461,7 @@ int ttm_tt_populate(struct ttm_bo_device *bdev,
 {
 	int ret;
 
-	if (ttm->state != tt_unpopulated)
+	if (ttm->populated)
 		return 0;
 
 	if (bdev->driver->ttm_tt_populate)
@@ -491,7 +490,7 @@ static void ttm_tt_clear_mapping(struct ttm_tt *ttm)
 void ttm_tt_unpopulate(struct ttm_bo_device *bdev,
 		       struct ttm_tt *ttm)
 {
-	if (ttm->state == tt_unpopulated)
+	if (!ttm->populated)
 		return;
 
 	ttm_tt_clear_mapping(ttm);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
index 0cd21590ded9..77205f92bc9b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
@@ -464,13 +464,13 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
 	if (!(src->mem.placement & TTM_PL_FLAG_NO_EVICT))
 		dma_resv_assert_held(src->base.resv);
 
-	if (dst->ttm->state == tt_unpopulated) {
+	if (dst->ttm->populated == false) {
 		ret = dst->bdev->driver->ttm_tt_populate(dst->bdev, dst->ttm, &ctx);
 		if (ret)
 			return ret;
 	}
 
-	if (src->ttm->state == tt_unpopulated) {
+	if (src->ttm->populated == false) {
 		ret = src->bdev->driver->ttm_tt_populate(src->bdev, src->ttm, &ctx);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 6757be98be14..1925c41d2bda 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -623,7 +623,7 @@ static int vmw_ttm_populate(struct ttm_bo_device *bdev,
 	struct ttm_mem_global *glob = vmw_mem_glob(dev_priv);
 	int ret;
 
-	if (ttm->state != tt_unpopulated)
+	if (ttm->populated)
 		return 0;
 
 	if (dev_priv->map_mode == vmw_dma_alloc_coherent) {
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 534d0ef24072..c6e88f01062e 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -57,7 +57,8 @@ enum ttm_caching_state {
  * @be: Pointer to the ttm backend.
  * @swap_storage: Pointer to shmem struct file for swap storage.
  * @caching_state: The current caching state of the pages.
- * @state: The current binding state of the pages.
+ * @populated: if the backing store is populated
+ * @bound: if this object has been bound to a global table.
  *
  * This is a structure holding the pages, caching- and aperture binding
  * status for a buffer object that isn't backed by fixed (VRAM / AGP)
@@ -69,11 +70,8 @@ struct ttm_tt {
 	unsigned long num_pages;
 	struct file *swap_storage;
 	enum ttm_caching_state caching_state;
-	enum {
-		tt_bound,
-		tt_unbound,
-		tt_unpopulated,
-	} state;
+	bool populated;
+	bool bound;
 };
 
 /**
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
