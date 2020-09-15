Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D5F269C03
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 04:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA7A6E833;
	Tue, 15 Sep 2020 02:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A136E833
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 02:42:02 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-wu0Q739bM0-7xtOuzsXEdQ-1; Mon, 14 Sep 2020 22:40:14 -0400
X-MC-Unique: wu0Q739bM0-7xtOuzsXEdQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 756B8425E2;
 Tue, 15 Sep 2020 02:40:13 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-25.bne.redhat.com
 [10.64.54.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E36C7512A;
 Tue, 15 Sep 2020 02:40:12 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] drm/ttm/tt: add wrappers to set tt state.
Date: Tue, 15 Sep 2020 12:40:01 +1000
Message-Id: <20200915024007.67163-2-airlied@gmail.com>
In-Reply-To: <20200915024007.67163-1-airlied@gmail.com>
References: <20200915024007.67163-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Reply-To: , PATCH@freedesktop.org, drm@freedesktop.org
Cc: christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This adds 2 getters and 4 setters, however unbound and populated
are currently the same thing, this will change, it also drops
a BUG_ON that seems not that useful.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 +--
 drivers/gpu/drm/nouveau/nouveau_bo.c       |  4 +--
 drivers/gpu/drm/radeon/radeon_mn.c         |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c        |  4 +--
 drivers/gpu/drm/ttm/ttm_bo_util.c          |  2 +-
 drivers/gpu/drm/ttm/ttm_page_alloc.c       |  6 ++--
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c   |  6 ++--
 drivers/gpu/drm/ttm/ttm_tt.c               | 20 ++++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c       |  4 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  2 +-
 include/drm/ttm/ttm_tt.h                   | 32 +++++++++++++++++++++-
 11 files changed, 57 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 6fc3af082f6f..568cb75900a3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1305,7 +1305,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_device *bdev,
 			return -ENOMEM;
 
 		ttm->page_flags |= TTM_PAGE_FLAG_SG;
-		ttm->state = tt_unbound;
+		ttm_tt_set_populated(ttm);
 		return 0;
 	}
 
@@ -1325,7 +1325,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_device *bdev,
 		drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
 						 gtt->ttm.dma_address,
 						 ttm->num_pages);
-		ttm->state = tt_unbound;
+		ttm_tt_set_populated(ttm);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 97e1908eada0..3ab9397fac40 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1282,14 +1282,14 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
 	struct device *dev;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
-	if (ttm->state != tt_unpopulated)
+	if (ttm_tt_is_populated(ttm))
 		return 0;
 
 	if (slave && ttm->sg) {
 		/* make userspace faulting work */
 		drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
 						 ttm_dma->dma_address, ttm->num_pages);
-		ttm->state = tt_unbound;
+		ttm_tt_set_populated(ttm);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/radeon/radeon_mn.c b/drivers/gpu/drm/radeon/radeon_mn.c
index f93829f08a4d..b6293fb91030 100644
--- a/drivers/gpu/drm/radeon/radeon_mn.c
+++ b/drivers/gpu/drm/radeon/radeon_mn.c
@@ -53,7 +53,7 @@ static bool radeon_mn_invalidate(struct mmu_interval_notifier *mn,
 	struct ttm_operation_ctx ctx = { false, false };
 	long r;
 
-	if (!bo->tbo.ttm || bo->tbo.ttm->state != tt_bound)
+	if (!bo->tbo.ttm || !ttm_tt_is_bound(bo->tbo.ttm))
 		return true;
 
 	if (!mmu_notifier_range_blockable(range))
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 602a591a53dc..7aa3d03ddeb9 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -615,14 +615,14 @@ static int radeon_ttm_tt_populate(struct ttm_bo_device *bdev,
 			return -ENOMEM;
 
 		ttm->page_flags |= TTM_PAGE_FLAG_SG;
-		ttm->state = tt_unbound;
+		ttm_tt_set_populated(ttm);
 		return 0;
 	}
 
 	if (slave && ttm->sg) {
 		drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
 						 gtt->ttm.dma_address, ttm->num_pages);
-		ttm->state = tt_unbound;
+		ttm_tt_set_populated(ttm);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 1b56432dfa43..44b47ccdeaf7 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -249,7 +249,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	 * Don't move nonexistent data. Clear destination instead.
 	 */
 	if (old_iomap == NULL &&
-	    (ttm == NULL || (ttm->state == tt_unpopulated &&
+	    (ttm == NULL || (!ttm_tt_is_populated(ttm) &&
 			     !(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)))) {
 		memset_io(new_iomap, 0, new_mem->num_pages*PAGE_SIZE);
 		goto out2;
diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm/ttm_page_alloc.c
index b40a4678c296..14660f723f71 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
@@ -1044,7 +1044,7 @@ ttm_pool_unpopulate_helper(struct ttm_tt *ttm, unsigned mem_count_update)
 put_pages:
 	ttm_put_pages(ttm->pages, ttm->num_pages, ttm->page_flags,
 		      ttm->caching_state);
-	ttm->state = tt_unpopulated;
+	ttm_tt_set_unpopulated(ttm);
 }
 
 int ttm_pool_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
@@ -1053,7 +1053,7 @@ int ttm_pool_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 	unsigned i;
 	int ret;
 
-	if (ttm->state != tt_unpopulated)
+	if (ttm_tt_is_populated(ttm))
 		return 0;
 
 	if (ttm_check_under_lowerlimit(mem_glob, ttm->num_pages, ctx))
@@ -1083,7 +1083,7 @@ int ttm_pool_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 		}
 	}
 
-	ttm->state = tt_unbound;
+	ttm_tt_set_populated(ttm);
 	return 0;
 }
 EXPORT_SYMBOL(ttm_pool_populate);
diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
index faefaaef7909..5e2df11685e7 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
@@ -894,7 +894,7 @@ int ttm_dma_populate(struct ttm_dma_tt *ttm_dma, struct device *dev,
 	unsigned i;
 	int ret;
 
-	if (ttm->state != tt_unpopulated)
+	if (ttm_tt_is_populated(ttm))
 		return 0;
 
 	if (ttm_check_under_lowerlimit(mem_glob, num_pages, ctx))
@@ -982,7 +982,7 @@ int ttm_dma_populate(struct ttm_dma_tt *ttm_dma, struct device *dev,
 		}
 	}
 
-	ttm->state = tt_unbound;
+	ttm_tt_set_populated(ttm);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ttm_dma_populate);
@@ -1076,7 +1076,7 @@ void ttm_dma_unpopulate(struct ttm_dma_tt *ttm_dma, struct device *dev)
 	/* shrink pool if necessary (only on !is_cached pools)*/
 	if (npages)
 		ttm_dma_page_pool_free(pool, npages, false);
-	ttm->state = tt_unpopulated;
+	ttm_tt_set_unpopulated(ttm);
 }
 EXPORT_SYMBOL_GPL(ttm_dma_unpopulate);
 
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 67aa7fe39432..ff3d953aa90e 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -156,7 +156,7 @@ static int ttm_tt_set_caching(struct ttm_tt *ttm,
 	if (ttm->caching_state == c_state)
 		return 0;
 
-	if (ttm->state == tt_unpopulated) {
+	if (!ttm_tt_is_populated(ttm)) {
 		/* Change caching but don't populate */
 		ttm->caching_state = c_state;
 		return 0;
@@ -214,8 +214,7 @@ void ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 
 	ttm_tt_unbind(bdev, ttm);
 
-	if (ttm->state == tt_unbound)
-		ttm_tt_unpopulate(bdev, ttm);
+	ttm_tt_unpopulate(bdev, ttm);
 
 	if (!(ttm->page_flags & TTM_PAGE_FLAG_PERSISTENT_SWAP) &&
 	    ttm->swap_storage)
@@ -232,7 +231,7 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
 	ttm->num_pages = bo->num_pages;
 	ttm->caching_state = tt_cached;
 	ttm->page_flags = page_flags;
-	ttm->state = tt_unpopulated;
+	ttm_tt_set_unpopulated(ttm);
 	ttm->swap_storage = NULL;
 	ttm->sg = bo->sg;
 }
@@ -309,9 +308,9 @@ EXPORT_SYMBOL(ttm_dma_tt_fini);
 
 void ttm_tt_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
-	if (ttm->state == tt_bound) {
+	if (ttm_tt_is_bound(ttm)) {
 		bdev->driver->ttm_tt_unbind(bdev, ttm);
-		ttm->state = tt_unbound;
+		ttm_tt_set_unbound(ttm);
 	}
 }
 
@@ -324,7 +323,7 @@ int ttm_tt_bind(struct ttm_bo_device *bdev,
 	if (!ttm)
 		return -EINVAL;
 
-	if (ttm->state == tt_bound)
+	if (ttm_tt_is_bound(ttm))
 		return 0;
 
 	ret = ttm_tt_populate(bdev, ttm, ctx);
@@ -335,7 +334,7 @@ int ttm_tt_bind(struct ttm_bo_device *bdev,
 	if (unlikely(ret != 0))
 		return ret;
 
-	ttm->state = tt_bound;
+	ttm_tt_set_bound(ttm);
 
 	return 0;
 }
@@ -393,7 +392,6 @@ int ttm_tt_swapout(struct ttm_bo_device *bdev,
 	int i;
 	int ret = -ENOMEM;
 
-	BUG_ON(ttm->state != tt_unbound && ttm->state != tt_unpopulated);
 	BUG_ON(ttm->caching_state != tt_cached);
 
 	if (!persistent_swap_storage) {
@@ -460,7 +458,7 @@ int ttm_tt_populate(struct ttm_bo_device *bdev,
 {
 	int ret;
 
-	if (ttm->state != tt_unpopulated)
+	if (ttm_tt_is_populated(ttm))
 		return 0;
 
 	if (bdev->driver->ttm_tt_populate)
@@ -489,7 +487,7 @@ static void ttm_tt_clear_mapping(struct ttm_tt *ttm)
 void ttm_tt_unpopulate(struct ttm_bo_device *bdev,
 		       struct ttm_tt *ttm)
 {
-	if (ttm->state == tt_unpopulated)
+	if (!ttm_tt_is_populated(ttm))
 		return;
 
 	ttm_tt_clear_mapping(ttm);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
index 0cd21590ded9..e8d66182cd7b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
@@ -464,13 +464,13 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
 	if (!(src->mem.placement & TTM_PL_FLAG_NO_EVICT))
 		dma_resv_assert_held(src->base.resv);
 
-	if (dst->ttm->state == tt_unpopulated) {
+	if (!ttm_tt_is_populated(dst->ttm)) {
 		ret = dst->bdev->driver->ttm_tt_populate(dst->bdev, dst->ttm, &ctx);
 		if (ret)
 			return ret;
 	}
 
-	if (src->ttm->state == tt_unpopulated) {
+	if (!ttm_tt_is_populated(src->ttm)) {
 		ret = src->bdev->driver->ttm_tt_populate(src->bdev, src->ttm, &ctx);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 03aa0fc5e753..3458c5c3531d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -644,7 +644,7 @@ static int vmw_ttm_populate(struct ttm_bo_device *bdev,
 	struct ttm_mem_global *glob = vmw_mem_glob(dev_priv);
 	int ret;
 
-	if (ttm->state != tt_unpopulated)
+	if (ttm_tt_is_populated(ttm))
 		return 0;
 
 	if (dev_priv->map_mode == vmw_dma_alloc_coherent) {
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 146544ba1c10..86ae759ff018 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -74,9 +74,39 @@ struct ttm_tt {
 		tt_bound,
 		tt_unbound,
 		tt_unpopulated,
-	} state;
+	} _state;
 };
 
+static inline bool ttm_tt_is_populated(struct ttm_tt *tt)
+{
+	return tt->_state != tt_unpopulated;
+}
+
+static inline bool ttm_tt_is_bound(struct ttm_tt *tt)
+{
+	return tt->_state == tt_bound;
+}
+
+static inline void ttm_tt_set_unpopulated(struct ttm_tt *tt)
+{
+	tt->_state = tt_unpopulated;
+}
+
+static inline void ttm_tt_set_populated(struct ttm_tt *tt)
+{
+	tt->_state = tt_unbound;
+}
+
+static inline void ttm_tt_set_unbound(struct ttm_tt *tt)
+{
+	tt->_state = tt_unbound;
+}
+
+static inline void ttm_tt_set_bound(struct ttm_tt *tt)
+{
+	tt->_state = tt_bound;
+}
+
 /**
  * struct ttm_dma_tt
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
