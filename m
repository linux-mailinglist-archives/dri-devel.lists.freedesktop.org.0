Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A551D269C12
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 04:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AFF6E834;
	Tue, 15 Sep 2020 02:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62916E834
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 02:47:02 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-5oinMrsANWSHu84y1J7xbQ-1; Mon, 14 Sep 2020 22:40:19 -0400
X-MC-Unique: 5oinMrsANWSHu84y1J7xbQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFB3C800688;
 Tue, 15 Sep 2020 02:40:18 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-25.bne.redhat.com
 [10.64.54.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA8627512A;
 Tue, 15 Sep 2020 02:40:17 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/ttm: move ttm binding/unbinding out of ttm_tt paths.
Date: Tue, 15 Sep 2020 12:40:05 +1000
Message-Id: <20200915024007.67163-6-airlied@gmail.com>
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

Move these up to the bo level, moving ttm_tt to just being
backing store. Next step is to move the bound flag out.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  2 +-
 drivers/gpu/drm/radeon/radeon_mn.c      |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c     |  2 +-
 drivers/gpu/drm/ttm/ttm_bo.c            |  2 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c       | 33 +++++++++++++++++++++--
 drivers/gpu/drm/ttm/ttm_tt.c            | 31 ----------------------
 include/drm/ttm/ttm_bo_driver.h         | 28 ++++++++++++++++++++
 include/drm/ttm/ttm_tt.h                | 35 -------------------------
 9 files changed, 64 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index dc73cce515b2..76a796eab901 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -554,7 +554,7 @@ static int amdgpu_move_vram_ram(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	/* Bind the memory to the GTT space */
-	r = ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem);
+	r = ttm_bo_tt_bind(bo, &tmp_mem);
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 3a1032d01808..ec995215de97 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -908,7 +908,7 @@ nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict, bool intr,
 	if (ret)
 		goto out;
 
-	ret = ttm_tt_bind(bo->bdev, bo->ttm, &tmp_reg);
+	ret = ttm_bo_tt_bind(bo, &tmp_reg);
 	if (ret)
 		goto out;
 
diff --git a/drivers/gpu/drm/radeon/radeon_mn.c b/drivers/gpu/drm/radeon/radeon_mn.c
index b6293fb91030..eb46d2220236 100644
--- a/drivers/gpu/drm/radeon/radeon_mn.c
+++ b/drivers/gpu/drm/radeon/radeon_mn.c
@@ -53,7 +53,7 @@ static bool radeon_mn_invalidate(struct mmu_interval_notifier *mn,
 	struct ttm_operation_ctx ctx = { false, false };
 	long r;
 
-	if (!bo->tbo.ttm || !ttm_tt_is_bound(bo->tbo.ttm))
+	if (!bo->tbo.ttm || !ttm_bo_tt_is_bound(&bo->tbo))
 		return true;
 
 	if (!mmu_notifier_range_blockable(range))
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 2bc6991fb7e9..228175790457 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -242,7 +242,7 @@ static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
 		goto out_cleanup;
 	}
 
-	r = ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem);
+	r = ttm_bo_tt_bind(bo, &tmp_mem);
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 32eaf809b7c9..abc88f713fc6 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -264,7 +264,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 			if (ret)
 				goto out_err;
 
-			ret = ttm_tt_bind(bdev, bo->ttm, mem);
+			ret = ttm_bo_tt_bind(bo, mem);
 			if (ret)
 				goto out_err;
 		}
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 2354046bda9a..4c5c9a333c74 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -67,7 +67,7 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 			return ret;
 		}
 
-		ttm_tt_unbind(bo->bdev, ttm);
+		ttm_bo_tt_unbind(bo);
 		ttm_bo_free_old_node(bo);
 		old_mem->mem_type = TTM_PL_SYSTEM;
 	}
@@ -82,7 +82,7 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 		if (unlikely(ret != 0))
 			return ret;
 
-		ret = ttm_tt_bind(bo->bdev, ttm, new_mem);
+		ret = ttm_bo_tt_bind(bo, new_mem);
 		if (unlikely(ret != 0))
 			return ret;
 	}
@@ -706,6 +706,35 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
 {
 	if (bo->ttm == NULL)
 		return;
+
+	ttm_bo_tt_unbind(bo);
 	ttm_tt_destroy(bo->bdev, bo->ttm);
 	bo->ttm = NULL;
 }
+
+int ttm_bo_tt_bind(struct ttm_buffer_object *bo, struct ttm_resource *mem)
+{
+	int ret;
+
+	if (!bo->ttm)
+		return -EINVAL;
+
+	if (ttm_bo_tt_is_bound(bo))
+		return 0;
+
+	ret = bo->bdev->driver->ttm_tt_bind(bo->bdev, bo->ttm, mem);
+	if (unlikely(ret != 0))
+		return ret;
+
+	ttm_bo_tt_set_bound(bo);
+	return 0;
+}
+EXPORT_SYMBOL(ttm_bo_tt_bind);
+
+void ttm_bo_tt_unbind(struct ttm_buffer_object *bo)
+{
+	if (ttm_bo_tt_is_bound(bo)) {
+		bo->bdev->driver->ttm_tt_unbind(bo->bdev, bo->ttm);
+		ttm_bo_tt_set_unbound(bo);
+	}
+}
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 93d65e5e4205..a4f0296effac 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -209,8 +209,6 @@ EXPORT_SYMBOL(ttm_tt_set_placement_caching);
 
 void ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
-	ttm_tt_unbind(bdev, ttm);
-
 	ttm_tt_unpopulate(bdev, ttm);
 
 	if (!(ttm->page_flags & TTM_PAGE_FLAG_PERSISTENT_SWAP) &&
@@ -303,35 +301,6 @@ void ttm_dma_tt_fini(struct ttm_dma_tt *ttm_dma)
 }
 EXPORT_SYMBOL(ttm_dma_tt_fini);
 
-void ttm_tt_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
-{
-	if (ttm_tt_is_bound(ttm)) {
-		bdev->driver->ttm_tt_unbind(bdev, ttm);
-		ttm_tt_set_unbound(ttm);
-	}
-}
-
-int ttm_tt_bind(struct ttm_bo_device *bdev,
-		struct ttm_tt *ttm, struct ttm_resource *bo_mem)
-{
-	int ret = 0;
-
-	if (!ttm)
-		return -EINVAL;
-
-	if (ttm_tt_is_bound(ttm))
-		return 0;
-
-	ret = bdev->driver->ttm_tt_bind(bdev, ttm, bo_mem);
-	if (unlikely(ret != 0))
-		return ret;
-
-	ttm_tt_set_bound(ttm);
-
-	return 0;
-}
-EXPORT_SYMBOL(ttm_tt_bind);
-
 int ttm_tt_swapin(struct ttm_tt *ttm)
 {
 	struct address_space *swap_space;
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index c2e93f04d0ad..0112619f6172 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -684,6 +684,34 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo);
  */
 pgprot_t ttm_io_prot(uint32_t caching_flags, pgprot_t tmp);
 
+/**
+ * ttm_bo_tt_bind
+ *
+ * Bind the object tt to a memory resource.
+ */
+int ttm_bo_tt_bind(struct ttm_buffer_object *bo, struct ttm_resource *mem);
+
+/**
+ * ttm_bo_tt_bind
+ *
+ * Unbind the object tt from a memory resource.
+ */
+void ttm_bo_tt_unbind(struct ttm_buffer_object *bo);
+
+static inline bool ttm_bo_tt_is_bound(struct ttm_buffer_object *bo)
+{
+	return bo->ttm->_state == tt_bound;
+}
+
+static inline void ttm_bo_tt_set_unbound(struct ttm_buffer_object *bo)
+{
+	bo->ttm->_state = tt_unbound;
+}
+
+static inline void ttm_bo_tt_set_bound(struct ttm_buffer_object *bo)
+{
+	bo->ttm->_state = tt_bound;
+}
 /**
  * ttm_bo_tt_destroy.
  */
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 8f57d86ee67b..1ac56730d952 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -82,11 +82,6 @@ static inline bool ttm_tt_is_populated(struct ttm_tt *tt)
 	return tt->_state != tt_unpopulated;
 }
 
-static inline bool ttm_tt_is_bound(struct ttm_tt *tt)
-{
-	return tt->_state == tt_bound;
-}
-
 static inline void ttm_tt_set_unpopulated(struct ttm_tt *tt)
 {
 	tt->_state = tt_unpopulated;
@@ -97,16 +92,6 @@ static inline void ttm_tt_set_populated(struct ttm_tt *tt)
 	tt->_state = tt_unbound;
 }
 
-static inline void ttm_tt_set_unbound(struct ttm_tt *tt)
-{
-	tt->_state = tt_unbound;
-}
-
-static inline void ttm_tt_set_bound(struct ttm_tt *tt)
-{
-	tt->_state = tt_bound;
-}
-
 /**
  * struct ttm_dma_tt
  *
@@ -164,17 +149,6 @@ int ttm_sg_tt_init(struct ttm_dma_tt *ttm_dma, struct ttm_buffer_object *bo,
 void ttm_tt_fini(struct ttm_tt *ttm);
 void ttm_dma_tt_fini(struct ttm_dma_tt *ttm_dma);
 
-/**
- * ttm_ttm_bind:
- *
- * @ttm: The struct ttm_tt containing backing pages.
- * @bo_mem: The struct ttm_resource identifying the binding location.
- *
- * Bind the pages of @ttm to an aperture location identified by @bo_mem
- */
-int ttm_tt_bind(struct ttm_bo_device *bdev,
-		struct ttm_tt *ttm, struct ttm_resource *bo_mem);
-
 /**
  * ttm_ttm_destroy:
  *
@@ -184,15 +158,6 @@ int ttm_tt_bind(struct ttm_bo_device *bdev,
  */
 void ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
 
-/**
- * ttm_ttm_unbind:
- *
- * @ttm: The struct ttm_tt.
- *
- * Unbind a struct ttm_tt.
- */
-void ttm_tt_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
-
 /**
  * ttm_tt_swapin:
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
