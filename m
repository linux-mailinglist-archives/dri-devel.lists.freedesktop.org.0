Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0738026D29E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 06:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060C289B03;
	Thu, 17 Sep 2020 04:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032EE89113
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 04:30:51 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-8BNpxm2iPTOefHWJ0g0iiQ-1; Thu, 17 Sep 2020 00:30:46 -0400
X-MC-Unique: 8BNpxm2iPTOefHWJ0g0iiQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48BFA1007472;
 Thu, 17 Sep 2020 04:30:45 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-25.bne.redhat.com
 [10.64.54.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5270E19D61;
 Thu, 17 Sep 2020 04:30:44 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] drm/ttm: protect against reentrant bind in the drivers
Date: Thu, 17 Sep 2020 14:30:34 +1000
Message-Id: <20200917043040.146575-2-airlied@gmail.com>
In-Reply-To: <20200917043040.146575-1-airlied@gmail.com>
References: <20200917043040.146575-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This moves the generic tracking into the drivers and protects
against reentrancy in the drivers. It fixes up radeon and agp
to be able to query the bound status as that is required.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 12 +++++++++
 drivers/gpu/drm/nouveau/nouveau_bo.c       |  5 +++-
 drivers/gpu/drm/nouveau/nouveau_sgdma.c    |  8 +++++-
 drivers/gpu/drm/radeon/radeon.h            |  1 +
 drivers/gpu/drm/radeon/radeon_mn.c         |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c        | 31 ++++++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_agp_backend.c      | 14 ++++++++++
 drivers/gpu/drm/ttm/ttm_bo.c               | 20 ++------------
 drivers/gpu/drm/ttm/ttm_bo_util.c          |  5 ----
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 22 ++++++++++++---
 include/drm/ttm/ttm_bo_api.h               |  1 -
 include/drm/ttm/ttm_bo_driver.h            | 14 ----------
 include/drm/ttm/ttm_tt.h                   |  1 +
 13 files changed, 91 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index e86f8f6371c4..2851cf30091a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -813,6 +813,7 @@ struct amdgpu_ttm_tt {
 	uint64_t		userptr;
 	struct task_struct	*usertask;
 	uint32_t		userflags;
+	bool			bound;
 #if IS_ENABLED(CONFIG_DRM_AMDGPU_USERPTR)
 	struct hmm_range	*range;
 #endif
@@ -1110,6 +1111,12 @@ static int amdgpu_ttm_backend_bind(struct ttm_bo_device *bdev,
 	uint64_t flags;
 	int r = 0;
 
+	if (!bo_mem)
+		return -EINVAL;
+
+	if (gtt->bound)
+		return 0;
+
 	if (gtt->userptr) {
 		r = amdgpu_ttm_tt_pin_userptr(bdev, ttm);
 		if (r) {
@@ -1143,6 +1150,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_bo_device *bdev,
 	if (r)
 		DRM_ERROR("failed to bind %lu pages at 0x%08llX\n",
 			  ttm->num_pages, gtt->offset);
+	gtt->bound = true;
 	return r;
 }
 
@@ -1236,6 +1244,9 @@ static void amdgpu_ttm_backend_unbind(struct ttm_bo_device *bdev,
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 	int r;
 
+	if (!gtt->bound)
+		return;
+
 	/* if the pages have userptr pinning then clear that first */
 	if (gtt->userptr)
 		amdgpu_ttm_tt_unpin_userptr(bdev, ttm);
@@ -1248,6 +1259,7 @@ static void amdgpu_ttm_backend_unbind(struct ttm_bo_device *bdev,
 	if (r)
 		DRM_ERROR("failed to unbind %lu pages at 0x%08llX\n",
 			  gtt->ttm.ttm.num_pages, gtt->offset);
+	gtt->bound = false;
 }
 
 static void amdgpu_ttm_backend_destroy(struct ttm_bo_device *bdev,
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index aea201d9c513..616d8844ba97 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -718,7 +718,10 @@ nouveau_ttm_tt_bind(struct ttm_bo_device *bdev, struct ttm_tt *ttm,
 {
 #if IS_ENABLED(CONFIG_AGP)
 	struct nouveau_drm *drm = nouveau_bdev(bdev);
-
+#endif
+	if (!reg)
+		return -EINVAL;
+#if IS_ENABLED(CONFIG_AGP)
 	if (drm->agp.bridge)
 		return ttm_agp_bind(ttm, reg);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
index 05e542254e1f..21fb92770ea2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
@@ -33,6 +33,9 @@ nouveau_sgdma_bind(struct ttm_bo_device *bdev, struct ttm_tt *ttm, struct ttm_re
 	struct nouveau_mem *mem = nouveau_mem(reg);
 	int ret;
 
+	if (nvbe->mem)
+		return 0;
+
 	ret = nouveau_mem_host(reg, &nvbe->ttm);
 	if (ret)
 		return ret;
@@ -53,7 +56,10 @@ void
 nouveau_sgdma_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
 	struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
-	nouveau_mem_fini(nvbe->mem);
+	if (nvbe->mem) {
+		nouveau_mem_fini(nvbe->mem);
+		nvbe->mem = NULL;
+	}
 }
 
 struct ttm_tt *
diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index df6f0b49836b..a6d8de01194a 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -2820,6 +2820,7 @@ extern int radeon_ttm_tt_set_userptr(struct radeon_device *rdev,
 				     uint32_t flags);
 extern bool radeon_ttm_tt_has_userptr(struct radeon_device *rdev, struct ttm_tt *ttm);
 extern bool radeon_ttm_tt_is_readonly(struct radeon_device *rdev, struct ttm_tt *ttm);
+bool radeon_ttm_tt_is_bound(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
 extern void radeon_vram_location(struct radeon_device *rdev, struct radeon_mc *mc, u64 base);
 extern void radeon_gtt_location(struct radeon_device *rdev, struct radeon_mc *mc);
 extern int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon);
diff --git a/drivers/gpu/drm/radeon/radeon_mn.c b/drivers/gpu/drm/radeon/radeon_mn.c
index eb46d2220236..97b9b6dd6dd3 100644
--- a/drivers/gpu/drm/radeon/radeon_mn.c
+++ b/drivers/gpu/drm/radeon/radeon_mn.c
@@ -53,7 +53,7 @@ static bool radeon_mn_invalidate(struct mmu_interval_notifier *mn,
 	struct ttm_operation_ctx ctx = { false, false };
 	long r;
 
-	if (!bo->tbo.ttm || !ttm_bo_tt_is_bound(&bo->tbo))
+	if (!bo->tbo.ttm || !radeon_ttm_tt_is_bound(bo->tbo.bdev, bo->tbo.ttm))
 		return true;
 
 	if (!mmu_notifier_range_blockable(range))
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index c6c1008fefd2..fc8bbca28b34 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -420,6 +420,7 @@ struct radeon_ttm_tt {
 	uint64_t			userptr;
 	struct mm_struct		*usermm;
 	uint32_t			userflags;
+	bool bound;
 };
 
 /* prepare the sg table with the user pages */
@@ -513,6 +514,13 @@ static void radeon_ttm_tt_unpin_userptr(struct ttm_bo_device *bdev, struct ttm_t
 	sg_free_table(ttm->sg);
 }
 
+static bool radeon_ttm_backend_is_bound(struct ttm_tt *ttm)
+{
+	struct radeon_ttm_tt *gtt = (void*)ttm;
+
+	return (gtt->bound);
+}
+
 static int radeon_ttm_backend_bind(struct ttm_bo_device *bdev,
 				   struct ttm_tt *ttm,
 				   struct ttm_resource *bo_mem)
@@ -523,6 +531,9 @@ static int radeon_ttm_backend_bind(struct ttm_bo_device *bdev,
 		RADEON_GART_PAGE_WRITE;
 	int r;
 
+	if (gtt->bound)
+		return 0;
+
 	if (gtt->userptr) {
 		radeon_ttm_tt_pin_userptr(bdev, ttm);
 		flags &= ~RADEON_GART_PAGE_WRITE;
@@ -542,6 +553,7 @@ static int radeon_ttm_backend_bind(struct ttm_bo_device *bdev,
 			  ttm->num_pages, (unsigned)gtt->offset);
 		return r;
 	}
+	gtt->bound = true;
 	return 0;
 }
 
@@ -550,10 +562,14 @@ static void radeon_ttm_backend_unbind(struct ttm_bo_device *bdev, struct ttm_tt
 	struct radeon_ttm_tt *gtt = (void *)ttm;
 	struct radeon_device *rdev = radeon_get_rdev(bdev);
 
+	if (!gtt->bound)
+		return;
+
 	radeon_gart_unbind(rdev, gtt->offset, ttm->num_pages);
 
 	if (gtt->userptr)
 		radeon_ttm_tt_unpin_userptr(bdev, ttm);
+	gtt->bound = false;
 }
 
 static void radeon_ttm_backend_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
@@ -689,12 +705,27 @@ int radeon_ttm_tt_set_userptr(struct radeon_device *rdev,
 	return 0;
 }
 
+bool radeon_ttm_tt_is_bound(struct ttm_bo_device *bdev,
+			    struct ttm_tt *ttm)
+{
+#if IS_ENABLED(CONFIG_AGP)
+	struct radeon_device *rdev = radeon_get_rdev(bdev);
+	if (rdev->flags & RADEON_IS_AGP)
+		return ttm_agp_is_bound(ttm);
+#endif
+	return radeon_ttm_backend_is_bound(ttm);
+}
+
 static int radeon_ttm_tt_bind(struct ttm_bo_device *bdev,
 			      struct ttm_tt *ttm,
 			      struct ttm_resource *bo_mem)
 {
+#if IS_ENABLED(CONFIG_AGP)
 	struct radeon_device *rdev = radeon_get_rdev(bdev);
+#endif
 
+	if (!bo_mem)
+		return -EINVAL;
 #if IS_ENABLED(CONFIG_AGP)
 	if (rdev->flags & RADEON_IS_AGP)
 		return ttm_agp_bind(ttm, bo_mem);
diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/ttm/ttm_agp_backend.c
index 7b36fdaab766..a98fd795b752 100644
--- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
+++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
@@ -57,6 +57,9 @@ int ttm_agp_bind(struct ttm_tt *ttm, struct ttm_resource *bo_mem)
 	int ret, cached = (bo_mem->placement & TTM_PL_FLAG_CACHED);
 	unsigned i;
 
+	if (agp_be->mem)
+		return 0;
+
 	mem = agp_allocate_memory(agp_be->bridge, ttm->num_pages, AGP_USER_MEMORY);
 	if (unlikely(mem == NULL))
 		return -ENOMEM;
@@ -98,6 +101,17 @@ void ttm_agp_unbind(struct ttm_tt *ttm)
 }
 EXPORT_SYMBOL(ttm_agp_unbind);
 
+bool ttm_agp_is_bound(struct ttm_tt *ttm)
+{
+	struct ttm_agp_backend *agp_be = container_of(ttm, struct ttm_agp_backend, ttm);
+
+	if (!ttm)
+		return false;
+
+	return (agp_be->mem != NULL);
+}
+EXPORT_SYMBOL(ttm_agp_is_bound);
+
 void ttm_agp_destroy(struct ttm_tt *ttm)
 {
 	struct ttm_agp_backend *agp_be = container_of(ttm, struct ttm_agp_backend, ttm);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 17010e7d0ea9..649a7d0a0766 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1627,27 +1627,11 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
 
 int ttm_bo_tt_bind(struct ttm_buffer_object *bo, struct ttm_resource *mem)
 {
-	int ret;
-
-	if (!bo->ttm)
-		return -EINVAL;
-
-	if (ttm_bo_tt_is_bound(bo))
-		return 0;
-
-	ret = bo->bdev->driver->ttm_tt_bind(bo->bdev, bo->ttm, mem);
-	if (unlikely(ret != 0))
-		return ret;
-
-	ttm_bo_tt_set_bound(bo);
-	return 0;
+	return bo->bdev->driver->ttm_tt_bind(bo->bdev, bo->ttm, mem);
 }
 EXPORT_SYMBOL(ttm_bo_tt_bind);
 
 void ttm_bo_tt_unbind(struct ttm_buffer_object *bo)
 {
-	if (ttm_bo_tt_is_bound(bo)) {
-		bo->bdev->driver->ttm_tt_unbind(bo->bdev, bo->ttm);
-		ttm_bo_tt_set_unbound(bo);
-	}
+	bo->bdev->driver->ttm_tt_unbind(bo->bdev, bo->ttm);
 }
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 980368049d68..919489f6a5a3 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -574,10 +574,8 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 
 		if (man->use_tt) {
 			ghost_obj->ttm = NULL;
-			ttm_bo_tt_set_unbound(ghost_obj);
 		} else {
 			bo->ttm = NULL;
-			ttm_bo_tt_set_unbound(bo);
 		}
 
 		dma_resv_unlock(&ghost_obj->base._resv);
@@ -633,10 +631,8 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
 
 		if (to->use_tt) {
 			ghost_obj->ttm = NULL;
-			ttm_bo_tt_set_unbound(ghost_obj);
 		} else {
 			bo->ttm = NULL;
-			ttm_bo_tt_set_unbound(bo);
 		}
 
 		dma_resv_unlock(&ghost_obj->base._resv);
@@ -701,7 +697,6 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	memset(&bo->mem, 0, sizeof(bo->mem));
 	bo->mem.mem_type = TTM_PL_SYSTEM;
 	bo->ttm = NULL;
-	ttm_bo_tt_set_unbound(bo);
 
 	dma_resv_unlock(&ghost->base._resv);
 	ttm_bo_put(ghost);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 3458c5c3531d..01146b27c9a1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -267,6 +267,7 @@ struct vmw_ttm_tt {
 	struct vmw_sg_table vsgt;
 	uint64_t sg_alloc_size;
 	bool mapped;
+	bool bound;
 };
 
 const size_t vmw_tt_size = sizeof(struct vmw_ttm_tt);
@@ -565,7 +566,13 @@ static int vmw_ttm_bind(struct ttm_bo_device *bdev,
 {
 	struct vmw_ttm_tt *vmw_be =
 		container_of(ttm, struct vmw_ttm_tt, dma_ttm.ttm);
-	int ret;
+	int ret = 0;
+
+	if (!bo_mem)
+		return -EINVAL;
+
+	if (vmw_be->bound)
+		return 0;
 
 	ret = vmw_ttm_map_dma(vmw_be);
 	if (unlikely(ret != 0))
@@ -576,8 +583,9 @@ static int vmw_ttm_bind(struct ttm_bo_device *bdev,
 
 	switch (bo_mem->mem_type) {
 	case VMW_PL_GMR:
-		return vmw_gmr_bind(vmw_be->dev_priv, &vmw_be->vsgt,
+		ret = vmw_gmr_bind(vmw_be->dev_priv, &vmw_be->vsgt,
 				    ttm->num_pages, vmw_be->gmr_id);
+		break;
 	case VMW_PL_MOB:
 		if (unlikely(vmw_be->mob == NULL)) {
 			vmw_be->mob =
@@ -586,13 +594,15 @@ static int vmw_ttm_bind(struct ttm_bo_device *bdev,
 				return -ENOMEM;
 		}
 
-		return vmw_mob_bind(vmw_be->dev_priv, vmw_be->mob,
+		ret = vmw_mob_bind(vmw_be->dev_priv, vmw_be->mob,
 				    &vmw_be->vsgt, ttm->num_pages,
 				    vmw_be->gmr_id);
+		break;
 	default:
 		BUG();
 	}
-	return 0;
+	vmw_be->bound = true;
+	return ret;
 }
 
 static void vmw_ttm_unbind(struct ttm_bo_device *bdev,
@@ -601,6 +611,9 @@ static void vmw_ttm_unbind(struct ttm_bo_device *bdev,
 	struct vmw_ttm_tt *vmw_be =
 		container_of(ttm, struct vmw_ttm_tt, dma_ttm.ttm);
 
+	if (!vmw_be->bound)
+		return;
+
 	switch (vmw_be->mem_type) {
 	case VMW_PL_GMR:
 		vmw_gmr_unbind(vmw_be->dev_priv, vmw_be->gmr_id);
@@ -614,6 +627,7 @@ static void vmw_ttm_unbind(struct ttm_bo_device *bdev,
 
 	if (vmw_be->dev_priv->map_mode == vmw_dma_map_bind)
 		vmw_ttm_unmap_dma(vmw_be);
+	vmw_be->bound = false;
 }
 
 
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 1d20a7f15a7a..36ff64e2736c 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -141,7 +141,6 @@ struct ttm_buffer_object {
 	struct ttm_resource mem;
 	struct file *persistent_swap_storage;
 	struct ttm_tt *ttm;
-	bool ttm_bound;
 	bool evicted;
 	bool deleted;
 
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index e66672f703a3..7846dfa507f7 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -698,20 +698,6 @@ int ttm_bo_tt_bind(struct ttm_buffer_object *bo, struct ttm_resource *mem);
  */
 void ttm_bo_tt_unbind(struct ttm_buffer_object *bo);
 
-static inline bool ttm_bo_tt_is_bound(struct ttm_buffer_object *bo)
-{
-	return bo->ttm_bound;
-}
-
-static inline void ttm_bo_tt_set_unbound(struct ttm_buffer_object *bo)
-{
-	bo->ttm_bound = false;
-}
-
-static inline void ttm_bo_tt_set_bound(struct ttm_buffer_object *bo)
-{
-	bo->ttm_bound = true;
-}
 /**
  * ttm_bo_tt_destroy.
  */
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index c777b72063db..4e906e32d08c 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -219,6 +219,7 @@ struct ttm_tt *ttm_agp_tt_create(struct ttm_buffer_object *bo,
 int ttm_agp_bind(struct ttm_tt *ttm, struct ttm_resource *bo_mem);
 void ttm_agp_unbind(struct ttm_tt *ttm);
 void ttm_agp_destroy(struct ttm_tt *ttm);
+bool ttm_agp_is_bound(struct ttm_tt *ttm);
 #endif
 
 #endif
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
