Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA84C252524
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 03:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DE36E9E8;
	Wed, 26 Aug 2020 01:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696B06E9E6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 01:45:28 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-5t6VssAvOKuf5TiW6pYhXQ-1; Tue, 25 Aug 2020 21:45:23 -0400
X-MC-Unique: 5t6VssAvOKuf5TiW6pYhXQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22815801ADD;
 Wed, 26 Aug 2020 01:45:22 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-53.bne.redhat.com
 [10.64.54.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB6FF60C13;
 Wed, 26 Aug 2020 01:45:20 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 18/23] drm/ttm: move bound flag and use a utility wrapper
Date: Wed, 26 Aug 2020 11:44:23 +1000
Message-Id: <20200826014428.828392-19-airlied@gmail.com>
In-Reply-To: <20200826014428.828392-1-airlied@gmail.com>
References: <20200826014428.828392-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0.002
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

If we move the bound flag out then the tt destroy is much
cleaner in a bo level wrapper, the code is in a few places,
leave the ttm_tt_destroy just about destroying the backing store.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  1 +
 drivers/gpu/drm/radeon/radeon_mn.c      |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c     |  1 +
 drivers/gpu/drm/ttm/ttm_bo.c            | 15 +++++++-------
 drivers/gpu/drm/ttm/ttm_bo_util.c       | 27 ++++++++++++++++++-------
 drivers/gpu/drm/ttm/ttm_tt.c            | 19 +----------------
 include/drm/ttm/ttm_bo_api.h            |  1 +
 include/drm/ttm/ttm_bo_driver.h         |  1 +
 include/drm/ttm/ttm_tt.h                |  4 +---
 10 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index c1c3691c3b9f..116407c77f02 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -551,6 +551,7 @@ static int amdgpu_move_vram_ram(struct ttm_buffer_object *bo, bool evict,
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
+	bo->ttm_bound = true;
 
 	/* blit VRAM to GTT */
 	r = amdgpu_move_blit(bo, evict, &tmp_mem, old_mem);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index e9de922ae921..9ac4b37aed87 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -879,6 +879,7 @@ nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict, bool intr,
 	ret = ttm_tt_bind(bo->bdev, bo->ttm, &tmp_reg, &ctx);
 	if (ret)
 		goto out;
+	bo->ttm_bound = true;
 
 	ret = nouveau_bo_move_m2mf(bo, true, intr, no_wait_gpu, &tmp_reg);
 	if (ret)
diff --git a/drivers/gpu/drm/radeon/radeon_mn.c b/drivers/gpu/drm/radeon/radeon_mn.c
index 5f57df7e6f08..e1f0d6ab4c86 100644
--- a/drivers/gpu/drm/radeon/radeon_mn.c
+++ b/drivers/gpu/drm/radeon/radeon_mn.c
@@ -53,7 +53,7 @@ static bool radeon_mn_invalidate(struct mmu_interval_notifier *mn,
 	struct ttm_operation_ctx ctx = { false, false };
 	long r;
 
-	if (!bo->tbo.ttm || bo->tbo.ttm->bound == false)
+	if (!bo->tbo.ttm || bo->tbo.ttm_bound == false)
 		return true;
 
 	if (!mmu_notifier_range_blockable(range))
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index f9e4e64a6d64..71c2a78911cd 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -239,6 +239,7 @@ static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
+	bo->ttm_bound = true;
 	r = radeon_move_blit(bo, true, no_wait_gpu, &tmp_mem, old_mem);
 	if (unlikely(r)) {
 		goto out_cleanup;
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index fa9012c8d11a..bf27d185c23f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -282,9 +282,12 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 			goto out_err;
 
 		if (mem->mem_type != TTM_PL_SYSTEM) {
-			ret = ttm_tt_bind(bdev, bo->ttm, mem, ctx);
-			if (ret)
-				goto out_err;
+			if (bo->ttm_bound == false) {
+				ret = ttm_tt_bind(bdev, bo->ttm, mem, ctx);
+				if (ret)
+					goto out_err;
+				bo->ttm_bound = true;
+			}
 		}
 
 		if (bo->mem.mem_type == TTM_PL_SYSTEM) {
@@ -324,8 +327,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 out_err:
 	new_man = ttm_manager_type(bdev, bo->mem.mem_type);
 	if (!new_man->use_tt) {
-		ttm_tt_destroy(bdev, bo->ttm);
-		bo->ttm = NULL;
+		ttm_bo_tt_destroy(bo, bo->ttm);
 	}
 
 	return ret;
@@ -344,8 +346,7 @@ static void ttm_bo_cleanup_memtype_use(struct ttm_buffer_object *bo)
 	if (bo->bdev->driver->move_notify)
 		bo->bdev->driver->move_notify(bo, false, NULL);
 
-	ttm_tt_destroy(bo->bdev, bo->ttm);
-	bo->ttm = NULL;
+	ttm_bo_tt_destroy(bo, bo->ttm);
 	ttm_resource_free(bo, &bo->mem);
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index d5d841270e38..8b50b250da0c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -51,7 +51,7 @@ void ttm_bo_free_old_node(struct ttm_buffer_object *bo)
 }
 
 int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
-		   struct ttm_operation_ctx *ctx,
+		    struct ttm_operation_ctx *ctx,
 		    struct ttm_resource *new_mem)
 {
 	struct ttm_tt *ttm = bo->ttm;
@@ -68,6 +68,7 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 		}
 
 		ttm_tt_unbind(bo->bdev, ttm);
+		bo->ttm_bound = false;
 		ttm_bo_free_old_node(bo);
 		ttm_flag_masked(&old_mem->placement, TTM_PL_FLAG_SYSTEM,
 				TTM_PL_MASK_MEM);
@@ -82,6 +83,7 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 		ret = ttm_tt_bind(bo->bdev, ttm, new_mem, ctx);
 		if (unlikely(ret != 0))
 			return ret;
+		bo->ttm_bound = true;
 	}
 
 	*old_mem = *new_mem;
@@ -300,8 +302,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	new_mem->mm_node = NULL;
 
 	if (!man->use_tt) {
-		ttm_tt_destroy(bdev, ttm);
-		bo->ttm = NULL;
+		ttm_bo_tt_destroy(bo, ttm);
 	}
 
 out1:
@@ -547,8 +548,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 			return ret;
 
 		if (!man->use_tt) {
-			ttm_tt_destroy(bdev, bo->ttm);
-			bo->ttm = NULL;
+			ttm_bo_tt_destroy(bo, bo->ttm);
 		}
 		ttm_bo_free_old_node(bo);
 	} else {
@@ -670,8 +670,7 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
 			return ret;
 
 		if (!to->use_tt) {
-			ttm_tt_destroy(bdev, bo->ttm);
-			bo->ttm = NULL;
+			ttm_bo_tt_destroy(bo, bo->ttm);
 		}
 		ttm_bo_free_old_node(bo);
 	}
@@ -706,3 +705,17 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 
 	return 0;
 }
+
+void ttm_bo_tt_destroy(struct ttm_buffer_object *bo, struct ttm_tt *ttm)
+{
+	if (ttm == NULL)
+		return;
+
+	if (bo->ttm_bound)
+		ttm_tt_unbind(bo->bdev, ttm);
+
+	ttm_tt_unpopulate(bo->bdev, ttm);
+	ttm_tt_destroy(bo->bdev, ttm);
+	bo->ttm_bound = false;
+	bo->ttm = NULL;
+}
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index ee6fda175da6..8d4f946cd9e0 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -209,14 +209,6 @@ EXPORT_SYMBOL(ttm_tt_set_placement_caching);
 
 void ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
-	if (ttm == NULL)
-		return;
-
-	ttm_tt_unbind(bdev, ttm);
-
-	if (ttm->populated)
-		ttm_tt_unpopulate(bdev, ttm);
-
 	if (!(ttm->page_flags & TTM_PAGE_FLAG_PERSISTENT_SWAP) &&
 	    ttm->swap_storage)
 		fput(ttm->swap_storage);
@@ -311,10 +303,7 @@ EXPORT_SYMBOL(ttm_dma_tt_fini);
 
 void ttm_tt_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
-	if (ttm->bound) {
-		bdev->driver->ttm_tt_unbind(bdev, ttm);
-		ttm->bound = false;
-	}
+	bdev->driver->ttm_tt_unbind(bdev, ttm);
 }
 
 int ttm_tt_bind(struct ttm_bo_device *bdev,
@@ -326,9 +315,6 @@ int ttm_tt_bind(struct ttm_bo_device *bdev,
 	if (!ttm)
 		return -EINVAL;
 
-	if (ttm->bound)
-		return 0;
-
 	ret = ttm_tt_populate(bdev, ttm, ctx);
 	if (ret)
 		return ret;
@@ -336,9 +322,6 @@ int ttm_tt_bind(struct ttm_bo_device *bdev,
 	ret = bdev->driver->ttm_tt_bind(bdev, ttm, bo_mem);
 	if (unlikely(ret != 0))
 		return ret;
-
-	ttm->bound = true;
-
 	return 0;
 }
 EXPORT_SYMBOL(ttm_tt_bind);
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 36ff64e2736c..1d20a7f15a7a 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -141,6 +141,7 @@ struct ttm_buffer_object {
 	struct ttm_resource mem;
 	struct file *persistent_swap_storage;
 	struct ttm_tt *ttm;
+	bool ttm_bound;
 	bool evicted;
 	bool deleted;
 
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 32c0651cc0fd..a1a903771922 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -732,4 +732,5 @@ int ttm_range_man_init(struct ttm_bo_device *bdev,
 int ttm_range_man_fini(struct ttm_bo_device *bdev,
 		       unsigned type);
 
+void ttm_bo_tt_destroy(struct ttm_buffer_object *bo, struct ttm_tt *tt);
 #endif
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index c6e88f01062e..5d10abb1419b 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -58,7 +58,6 @@ enum ttm_caching_state {
  * @swap_storage: Pointer to shmem struct file for swap storage.
  * @caching_state: The current caching state of the pages.
  * @populated: if the backing store is populated
- * @bound: if this object has been bound to a global table.
  *
  * This is a structure holding the pages, caching- and aperture binding
  * status for a buffer object that isn't backed by fixed (VRAM / AGP)
@@ -71,7 +70,6 @@ struct ttm_tt {
 	struct file *swap_storage;
 	enum ttm_caching_state caching_state;
 	bool populated;
-	bool bound;
 };
 
 /**
@@ -149,7 +147,7 @@ int ttm_tt_bind(struct ttm_bo_device *bdev,
  *
  * @ttm: The struct ttm_tt.
  *
- * Unbind, unpopulate and destroy common struct ttm_tt.
+ * Destroy common struct ttm_tt.
  */
 void ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
