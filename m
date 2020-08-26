Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E66252525
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 03:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAF56E9DA;
	Wed, 26 Aug 2020 01:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51046E9E6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 01:45:29 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-xGXAIr_9O6i_7w7CWQcOqQ-1; Tue, 25 Aug 2020 21:45:26 -0400
X-MC-Unique: xGXAIr_9O6i_7w7CWQcOqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2AC6189E602;
 Wed, 26 Aug 2020 01:45:25 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-53.bne.redhat.com
 [10.64.54.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 576346198B;
 Wed, 26 Aug 2020 01:45:24 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 20/23] drm/ttm: add populated accessors
Date: Wed, 26 Aug 2020 11:44:25 +1000
Message-Id: <20200826014428.828392-21-airlied@gmail.com>
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

next step move populated into upper page flag bits

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_bo.c       |  4 ++--
 drivers/gpu/drm/radeon/radeon_ttm.c        |  4 ++--
 drivers/gpu/drm/ttm/ttm_bo_util.c          |  2 +-
 drivers/gpu/drm/ttm/ttm_page_alloc.c       |  6 +++---
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c   |  6 +++---
 drivers/gpu/drm/ttm/ttm_tt.c               | 10 +++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c       |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  2 +-
 include/drm/ttm/ttm_tt.h                   | 12 +++++++++++-
 10 files changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index e8a56e64bc38..9eb243ff2ba6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1307,7 +1307,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_device *bdev,
 			return -ENOMEM;
 
 		ttm->page_flags |= TTM_PAGE_FLAG_SG;
-		ttm->populated = true;
+		ttm_tt_set_populated(ttm, true);
 		return 0;
 	}
 
@@ -1327,7 +1327,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_device *bdev,
 		drm_prime_sg_to_page_addr_arrays(gtt->ttm.sg, ttm->pages,
 						 gtt->ttm.dma_address,
 						 ttm->num_pages);
-		ttm->populated = true;
+		ttm_tt_set_populated(ttm, true);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index f6b6ef7a8868..644f15412dce 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1269,14 +1269,14 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
 	struct device *dev;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
-	if (ttm->populated)
+	if (ttm_tt_is_populated(ttm))
 		return 0;
 
 	if (slave && ttm_dma->sg) {
 		/* make userspace faulting work */
 		drm_prime_sg_to_page_addr_arrays(ttm_dma->sg, ttm->pages,
 						 ttm_dma->dma_address, ttm->num_pages);
-		ttm->populated = true;
+		ttm_tt_set_populated(ttm, true);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 6f64f949c202..c9f7fc112a84 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -621,14 +621,14 @@ static int radeon_ttm_tt_populate(struct ttm_bo_device *bdev,
 			return -ENOMEM;
 
 		ttm->page_flags |= TTM_PAGE_FLAG_SG;
-		ttm->populated = true;
+		ttm_tt_set_populated(ttm, true);
 		return 0;
 	}
 
 	if (slave && gtt->ttm.sg) {
 		drm_prime_sg_to_page_addr_arrays(gtt->ttm.sg, ttm->pages,
 						 gtt->ttm.dma_address, ttm->num_pages);
-		ttm->populated = true;
+		ttm_tt_set_populated(ttm, true);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index c6262fda1fb8..33146953141a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -257,7 +257,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	 * Don't move nonexistent data. Clear destination instead.
 	 */
 	if (old_iomap == NULL &&
-	    (ttm == NULL || (!ttm->populated &&
+	    (ttm == NULL || (!ttm_tt_is_populated(ttm) &&
 			     !(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)))) {
 		memset_io(new_iomap, 0, new_mem->num_pages*PAGE_SIZE);
 		goto out2;
diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm/ttm_page_alloc.c
index 2d30a2deadb5..028ba94d7824 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
@@ -1044,7 +1044,7 @@ ttm_pool_unpopulate_helper(struct ttm_tt *ttm, unsigned mem_count_update)
 put_pages:
 	ttm_put_pages(ttm->pages, ttm->num_pages, ttm->page_flags,
 		      ttm->caching_state);
-	ttm->populated = false;
+	ttm_tt_set_populated(ttm, false);
 }
 
 int ttm_pool_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
@@ -1053,7 +1053,7 @@ int ttm_pool_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 	unsigned i;
 	int ret;
 
-	if (ttm->populated)
+	if (ttm_tt_is_populated(ttm))
 		return 0;
 
 	if (ttm_check_under_lowerlimit(mem_glob, ttm->num_pages, ctx))
@@ -1083,7 +1083,7 @@ int ttm_pool_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 		}
 	}
 
-	ttm->populated = true;
+	ttm_tt_set_populated(ttm, true);
 	return 0;
 }
 EXPORT_SYMBOL(ttm_pool_populate);
diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
index 9a3b7145d9cb..e8191d3afce2 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
@@ -894,7 +894,7 @@ int ttm_dma_populate(struct ttm_dma_tt *ttm_dma, struct device *dev,
 	unsigned i;
 	int ret;
 
-	if (ttm->populated)
+	if (ttm_tt_is_populated(ttm))
 		return 0;
 
 	if (ttm_check_under_lowerlimit(mem_glob, num_pages, ctx))
@@ -982,7 +982,7 @@ int ttm_dma_populate(struct ttm_dma_tt *ttm_dma, struct device *dev,
 		}
 	}
 
-	ttm->populated = true;
+	ttm_tt_set_populated(ttm, true);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ttm_dma_populate);
@@ -1076,7 +1076,7 @@ void ttm_dma_unpopulate(struct ttm_dma_tt *ttm_dma, struct device *dev)
 	/* shrink pool if necessary (only on !is_cached pools)*/
 	if (npages)
 		ttm_dma_page_pool_free(pool, npages, false);
-	ttm->populated = false;
+	ttm_tt_set_populated(ttm, false);
 }
 EXPORT_SYMBOL_GPL(ttm_dma_unpopulate);
 
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 288fd952bdbe..17a1e3490650 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -156,7 +156,7 @@ static int ttm_tt_set_caching(struct ttm_tt *ttm,
 	if (ttm->caching_state == c_state)
 		return 0;
 
-	if (!ttm->populated) {
+	if (!ttm_tt_is_populated(ttm)) {
 		/* Change caching but don't populate */
 		ttm->caching_state = c_state;
 		return 0;
@@ -225,7 +225,7 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
 	ttm->caching_state = tt_cached;
 	ttm->page_flags = page_flags;
 	ttm->swap_storage = NULL;
-	ttm->populated = false;
+	ttm_tt_set_populated(ttm, false);
 }
 
 int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
@@ -312,7 +312,7 @@ int ttm_tt_bind(struct ttm_bo_device *bdev,
 	if (!ttm)
 		return -EINVAL;
 
-	if (WARN_ON(!ttm->populated))
+	if (WARN_ON(!ttm_tt_is_populated(ttm)))
 		return -EINVAL;
 
 	return bdev->driver->ttm_tt_bind(bdev, ttm, bo_mem);
@@ -437,7 +437,7 @@ int ttm_tt_populate(struct ttm_bo_device *bdev,
 {
 	int ret;
 
-	if (ttm->populated)
+	if (ttm_tt_is_populated(ttm))
 		return 0;
 
 	if (bdev->driver->ttm_tt_populate)
@@ -467,7 +467,7 @@ static void ttm_tt_clear_mapping(struct ttm_tt *ttm)
 void ttm_tt_unpopulate(struct ttm_bo_device *bdev,
 		       struct ttm_tt *ttm)
 {
-	if (!ttm->populated)
+	if (!ttm_tt_is_populated(ttm))
 		return;
 
 	ttm_tt_clear_mapping(ttm);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
index 77205f92bc9b..62ec1a7f4102 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
@@ -464,13 +464,13 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
 	if (!(src->mem.placement & TTM_PL_FLAG_NO_EVICT))
 		dma_resv_assert_held(src->base.resv);
 
-	if (dst->ttm->populated == false) {
+	if (ttm_tt_is_populated(dst->ttm) == false) {
 		ret = dst->bdev->driver->ttm_tt_populate(dst->bdev, dst->ttm, &ctx);
 		if (ret)
 			return ret;
 	}
 
-	if (src->ttm->populated == false) {
+	if (ttm_tt_is_populated(src->ttm) == false) {
 		ret = src->bdev->driver->ttm_tt_populate(src->bdev, src->ttm, &ctx);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 1925c41d2bda..461c5945740d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -623,7 +623,7 @@ static int vmw_ttm_populate(struct ttm_bo_device *bdev,
 	struct ttm_mem_global *glob = vmw_mem_glob(dev_priv);
 	int ret;
 
-	if (ttm->populated)
+	if (ttm_tt_is_populated(ttm))
 		return 0;
 
 	if (dev_priv->map_mode == vmw_dma_alloc_coherent) {
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 4b35d0e4b9c5..2aa4cd7d6451 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -69,9 +69,19 @@ struct ttm_tt {
 	unsigned long num_pages;
 	struct file *swap_storage;
 	enum ttm_caching_state caching_state;
-	bool populated;
+	bool _populated;
 };
 
+static inline bool ttm_tt_is_populated(struct ttm_tt *tt)
+{
+	return tt->_populated;
+}
+
+static inline void ttm_tt_set_populated(struct ttm_tt *tt, bool flag)
+{
+	tt->_populated = flag;
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
