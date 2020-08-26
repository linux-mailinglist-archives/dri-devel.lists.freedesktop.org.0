Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35B6252518
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 03:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C926E9D7;
	Wed, 26 Aug 2020 01:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739436E9D7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 01:44:47 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18--cax5baBMVqCUanUODIOtw-1; Tue, 25 Aug 2020 21:44:44 -0400
X-MC-Unique: -cax5baBMVqCUanUODIOtw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AA06107464A;
 Wed, 26 Aug 2020 01:44:43 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-53.bne.redhat.com
 [10.64.54.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F5FE60C13;
 Wed, 26 Aug 2020 01:44:41 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/23] drm/ttm: remove bdev from ttm_tt
Date: Wed, 26 Aug 2020 11:44:08 +1000
Message-Id: <20200826014428.828392-4-airlied@gmail.com>
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

I want to split this structure up and use it differently,
step one remove bdev pointer from it and pass it explicitly.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 40 +++++++++++--------
 drivers/gpu/drm/drm_gem_vram_helper.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c       | 16 ++++----
 drivers/gpu/drm/nouveau/nouveau_sgdma.c    |  8 ++--
 drivers/gpu/drm/qxl/qxl_ttm.c              |  9 +++--
 drivers/gpu/drm/radeon/radeon_ttm.c        | 40 ++++++++++---------
 drivers/gpu/drm/ttm/ttm_agp_backend.c      | 17 +++++---
 drivers/gpu/drm/ttm/ttm_bo.c               |  8 ++--
 drivers/gpu/drm/ttm/ttm_bo_util.c          | 14 +++----
 drivers/gpu/drm/ttm/ttm_bo_vm.c            |  2 +-
 drivers/gpu/drm/ttm/ttm_tt.c               | 45 ++++++++++++----------
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c       |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 16 +++++---
 include/drm/ttm/ttm_bo_driver.h            |  7 ++--
 include/drm/ttm/ttm_tt.h                   | 25 ++++++------
 15 files changed, 139 insertions(+), 114 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 00b2c0359735..9592505563bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -547,7 +547,7 @@ static int amdgpu_move_vram_ram(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	/* Bind the memory to the GTT space */
-	r = ttm_tt_bind(bo->ttm, &tmp_mem, ctx);
+	r = ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem, ctx);
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
@@ -973,9 +973,10 @@ void amdgpu_ttm_tt_set_user_pages(struct ttm_tt *ttm, struct page **pages)
  *
  * Called by amdgpu_ttm_backend_bind()
  **/
-static int amdgpu_ttm_tt_pin_userptr(struct ttm_tt *ttm)
+static int amdgpu_ttm_tt_pin_userptr(struct ttm_bo_device *bdev,
+				     struct ttm_tt *ttm)
 {
-	struct amdgpu_device *adev = amdgpu_ttm_adev(ttm->bdev);
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 	int r;
 
@@ -1009,9 +1010,10 @@ static int amdgpu_ttm_tt_pin_userptr(struct ttm_tt *ttm)
 /**
  * amdgpu_ttm_tt_unpin_userptr - Unpin and unmap userptr pages
  */
-static void amdgpu_ttm_tt_unpin_userptr(struct ttm_tt *ttm)
+static void amdgpu_ttm_tt_unpin_userptr(struct ttm_bo_device *bdev,
+					struct ttm_tt *ttm)
 {
-	struct amdgpu_device *adev = amdgpu_ttm_adev(ttm->bdev);
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 
 	int write = !(gtt->userflags & AMDGPU_GEM_USERPTR_READONLY);
@@ -1092,16 +1094,17 @@ static int amdgpu_ttm_gart_bind(struct amdgpu_device *adev,
  * Called by ttm_tt_bind() on behalf of ttm_bo_handle_move_mem().
  * This handles binding GTT memory to the device address space.
  */
-static int amdgpu_ttm_backend_bind(struct ttm_tt *ttm,
+static int amdgpu_ttm_backend_bind(struct ttm_bo_device *bdev,
+				   struct ttm_tt *ttm,
 				   struct ttm_resource *bo_mem)
 {
-	struct amdgpu_device *adev = amdgpu_ttm_adev(ttm->bdev);
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
 	struct amdgpu_ttm_tt *gtt = (void*)ttm;
 	uint64_t flags;
 	int r = 0;
 
 	if (gtt->userptr) {
-		r = amdgpu_ttm_tt_pin_userptr(ttm);
+		r = amdgpu_ttm_tt_pin_userptr(bdev, ttm);
 		if (r) {
 			DRM_ERROR("failed to pin userptr\n");
 			return r;
@@ -1219,15 +1222,16 @@ int amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo)
  * Called by ttm_tt_unbind() on behalf of ttm_bo_move_ttm() and
  * ttm_tt_destroy().
  */
-static void amdgpu_ttm_backend_unbind(struct ttm_tt *ttm)
+static void amdgpu_ttm_backend_unbind(struct ttm_bo_device *bdev,
+				      struct ttm_tt *ttm)
 {
-	struct amdgpu_device *adev = amdgpu_ttm_adev(ttm->bdev);
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 	int r;
 
 	/* if the pages have userptr pinning then clear that first */
 	if (gtt->userptr)
-		amdgpu_ttm_tt_unpin_userptr(ttm);
+		amdgpu_ttm_tt_unpin_userptr(bdev, ttm);
 
 	if (gtt->offset == AMDGPU_BO_INVALID_OFFSET)
 		return;
@@ -1239,7 +1243,8 @@ static void amdgpu_ttm_backend_unbind(struct ttm_tt *ttm)
 			  gtt->ttm.ttm.num_pages, gtt->offset);
 }
 
-static void amdgpu_ttm_backend_destroy(struct ttm_tt *ttm)
+static void amdgpu_ttm_backend_destroy(struct ttm_bo_device *bdev,
+				       struct ttm_tt *ttm)
 {
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 
@@ -1289,10 +1294,11 @@ static struct ttm_tt *amdgpu_ttm_tt_create(struct ttm_buffer_object *bo,
  * Map the pages of a ttm_tt object to an address space visible
  * to the underlying device.
  */
-static int amdgpu_ttm_tt_populate(struct ttm_tt *ttm,
-			struct ttm_operation_ctx *ctx)
+static int amdgpu_ttm_tt_populate(struct ttm_bo_device *bdev,
+				  struct ttm_tt *ttm,
+				  struct ttm_operation_ctx *ctx)
 {
-	struct amdgpu_device *adev = amdgpu_ttm_adev(ttm->bdev);
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 
 	/* user pages are bound by amdgpu_ttm_tt_pin_userptr() */
@@ -1343,7 +1349,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_tt *ttm,
  * Unmaps pages of a ttm_tt object from the device address space and
  * unpopulates the page array backing it.
  */
-static void amdgpu_ttm_tt_unpopulate(struct ttm_tt *ttm)
+static void amdgpu_ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 	struct amdgpu_device *adev;
@@ -1367,7 +1373,7 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_tt *ttm)
 	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
 		return;
 
-	adev = amdgpu_ttm_adev(ttm->bdev);
+	adev = amdgpu_ttm_adev(bdev);
 
 #ifdef CONFIG_SWIOTLB
 	if (adev->need_swiotlb && swiotlb_nr_tbl()) {
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 545a877406f4..788557bc5c01 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -967,7 +967,7 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs = {
  * TTM TT
  */
 
-static void backend_func_destroy(struct ttm_tt *tt)
+static void backend_func_destroy(struct ttm_bo_device *bdev, struct ttm_tt *tt)
 {
 	ttm_tt_fini(tt);
 	kfree(tt);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 90bd66ff8dc7..9e6425a0cb3f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -848,7 +848,7 @@ nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict, bool intr,
 	if (ret)
 		return ret;
 
-	ret = ttm_tt_bind(bo->ttm, &tmp_reg, &ctx);
+	ret = ttm_tt_bind(bo->bdev, bo->ttm, &tmp_reg, &ctx);
 	if (ret)
 		goto out;
 
@@ -1228,7 +1228,8 @@ nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
 }
 
 static int
-nouveau_ttm_tt_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
+nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
+			struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 {
 	struct ttm_dma_tt *ttm_dma = (void *)ttm;
 	struct nouveau_drm *drm;
@@ -1246,12 +1247,12 @@ nouveau_ttm_tt_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 		return 0;
 	}
 
-	drm = nouveau_bdev(ttm->bdev);
+	drm = nouveau_bdev(bdev);
 	dev = drm->dev->dev;
 
 #if IS_ENABLED(CONFIG_AGP)
 	if (drm->agp.bridge) {
-		return ttm_agp_tt_populate(ttm, ctx);
+		return ttm_agp_tt_populate(bdev, ttm, ctx);
 	}
 #endif
 
@@ -1264,7 +1265,8 @@ nouveau_ttm_tt_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 }
 
 static void
-nouveau_ttm_tt_unpopulate(struct ttm_tt *ttm)
+nouveau_ttm_tt_unpopulate(struct ttm_bo_device *bdev,
+			  struct ttm_tt *ttm)
 {
 	struct ttm_dma_tt *ttm_dma = (void *)ttm;
 	struct nouveau_drm *drm;
@@ -1274,12 +1276,12 @@ nouveau_ttm_tt_unpopulate(struct ttm_tt *ttm)
 	if (slave)
 		return;
 
-	drm = nouveau_bdev(ttm->bdev);
+	drm = nouveau_bdev(bdev);
 	dev = drm->dev->dev;
 
 #if IS_ENABLED(CONFIG_AGP)
 	if (drm->agp.bridge) {
-		ttm_agp_tt_unpopulate(ttm);
+		ttm_agp_tt_unpopulate(bdev, ttm);
 		return;
 	}
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
index eef75c53a197..6000c650b105 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
@@ -15,7 +15,7 @@ struct nouveau_sgdma_be {
 };
 
 static void
-nouveau_sgdma_destroy(struct ttm_tt *ttm)
+nouveau_sgdma_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
 	struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
 
@@ -26,7 +26,7 @@ nouveau_sgdma_destroy(struct ttm_tt *ttm)
 }
 
 static int
-nv04_sgdma_bind(struct ttm_tt *ttm, struct ttm_resource *reg)
+nv04_sgdma_bind(struct ttm_bo_device *bdev, struct ttm_tt *ttm, struct ttm_resource *reg)
 {
 	struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
 	struct nouveau_mem *mem = nouveau_mem(reg);
@@ -47,7 +47,7 @@ nv04_sgdma_bind(struct ttm_tt *ttm, struct ttm_resource *reg)
 }
 
 static void
-nv04_sgdma_unbind(struct ttm_tt *ttm)
+nv04_sgdma_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
 	struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
 	nouveau_mem_fini(nvbe->mem);
@@ -60,7 +60,7 @@ static struct ttm_backend_func nv04_sgdma_backend = {
 };
 
 static int
-nv50_sgdma_bind(struct ttm_tt *ttm, struct ttm_resource *reg)
+nv50_sgdma_bind(struct ttm_bo_device *bdev, struct ttm_tt *ttm, struct ttm_resource *reg)
 {
 	struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
 	struct nouveau_mem *mem = nouveau_mem(reg);
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index d0889df989e6..c3530c6e46bd 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -104,7 +104,8 @@ struct qxl_ttm_tt {
 	u64				offset;
 };
 
-static int qxl_ttm_backend_bind(struct ttm_tt *ttm,
+static int qxl_ttm_backend_bind(struct ttm_bo_device *bdev,
+				struct ttm_tt *ttm,
 				struct ttm_resource *bo_mem)
 {
 	struct qxl_ttm_tt *gtt = (void *)ttm;
@@ -118,12 +119,14 @@ static int qxl_ttm_backend_bind(struct ttm_tt *ttm,
 	return -1;
 }
 
-static void qxl_ttm_backend_unbind(struct ttm_tt *ttm)
+static void qxl_ttm_backend_unbind(struct ttm_bo_device *bdev,
+				   struct ttm_tt *ttm)
 {
 	/* Not implemented */
 }
 
-static void qxl_ttm_backend_destroy(struct ttm_tt *ttm)
+static void qxl_ttm_backend_destroy(struct ttm_bo_device *bdev,
+				    struct ttm_tt *ttm)
 {
 	struct qxl_ttm_tt *gtt = (void *)ttm;
 
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 0923a8601112..1d3e8bb69f8e 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -234,7 +234,7 @@ static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
 		goto out_cleanup;
 	}
 
-	r = ttm_tt_bind(bo->ttm, &tmp_mem, &ctx);
+	r = ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem, &ctx);
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
@@ -420,9 +420,9 @@ struct radeon_ttm_tt {
 };
 
 /* prepare the sg table with the user pages */
-static int radeon_ttm_tt_pin_userptr(struct ttm_tt *ttm)
+static int radeon_ttm_tt_pin_userptr(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
-	struct radeon_device *rdev = radeon_get_rdev(ttm->bdev);
+	struct radeon_device *rdev = radeon_get_rdev(bdev);
 	struct radeon_ttm_tt *gtt = (void *)ttm;
 	unsigned pinned = 0;
 	int r;
@@ -481,9 +481,9 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_tt *ttm)
 	return r;
 }
 
-static void radeon_ttm_tt_unpin_userptr(struct ttm_tt *ttm)
+static void radeon_ttm_tt_unpin_userptr(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
-	struct radeon_device *rdev = radeon_get_rdev(ttm->bdev);
+	struct radeon_device *rdev = radeon_get_rdev(bdev);
 	struct radeon_ttm_tt *gtt = (void *)ttm;
 	struct sg_page_iter sg_iter;
 
@@ -510,17 +510,18 @@ static void radeon_ttm_tt_unpin_userptr(struct ttm_tt *ttm)
 	sg_free_table(ttm->sg);
 }
 
-static int radeon_ttm_backend_bind(struct ttm_tt *ttm,
+static int radeon_ttm_backend_bind(struct ttm_bo_device *bdev,
+				   struct ttm_tt *ttm,
 				   struct ttm_resource *bo_mem)
 {
 	struct radeon_ttm_tt *gtt = (void*)ttm;
-	struct radeon_device *rdev = radeon_get_rdev(ttm->bdev);
+	struct radeon_device *rdev = radeon_get_rdev(bdev);
 	uint32_t flags = RADEON_GART_PAGE_VALID | RADEON_GART_PAGE_READ |
 		RADEON_GART_PAGE_WRITE;
 	int r;
 
 	if (gtt->userptr) {
-		radeon_ttm_tt_pin_userptr(ttm);
+		radeon_ttm_tt_pin_userptr(bdev, ttm);
 		flags &= ~RADEON_GART_PAGE_WRITE;
 	}
 
@@ -541,18 +542,18 @@ static int radeon_ttm_backend_bind(struct ttm_tt *ttm,
 	return 0;
 }
 
-static void radeon_ttm_backend_unbind(struct ttm_tt *ttm)
+static void radeon_ttm_backend_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
 	struct radeon_ttm_tt *gtt = (void *)ttm;
-	struct radeon_device *rdev = radeon_get_rdev(ttm->bdev);
+	struct radeon_device *rdev = radeon_get_rdev(bdev);
 
 	radeon_gart_unbind(rdev, gtt->offset, ttm->num_pages);
 
 	if (gtt->userptr)
-		radeon_ttm_tt_unpin_userptr(ttm);
+		radeon_ttm_tt_unpin_userptr(bdev, ttm);
 }
 
-static void radeon_ttm_backend_destroy(struct ttm_tt *ttm)
+static void radeon_ttm_backend_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
 	struct radeon_ttm_tt *gtt = (void *)ttm;
 
@@ -599,8 +600,9 @@ static struct radeon_ttm_tt *radeon_ttm_tt_to_gtt(struct ttm_tt *ttm)
 	return (struct radeon_ttm_tt *)ttm;
 }
 
-static int radeon_ttm_tt_populate(struct ttm_tt *ttm,
-			struct ttm_operation_ctx *ctx)
+static int radeon_ttm_tt_populate(struct ttm_bo_device *bdev,
+				  struct ttm_tt *ttm,
+				  struct ttm_operation_ctx *ctx)
 {
 	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(ttm);
 	struct radeon_device *rdev;
@@ -623,10 +625,10 @@ static int radeon_ttm_tt_populate(struct ttm_tt *ttm,
 		return 0;
 	}
 
-	rdev = radeon_get_rdev(ttm->bdev);
+	rdev = radeon_get_rdev(bdev);
 #if IS_ENABLED(CONFIG_AGP)
 	if (rdev->flags & RADEON_IS_AGP) {
-		return ttm_agp_tt_populate(ttm, ctx);
+		return ttm_agp_tt_populate(bdev, ttm, ctx);
 	}
 #endif
 
@@ -639,7 +641,7 @@ static int radeon_ttm_tt_populate(struct ttm_tt *ttm,
 	return ttm_populate_and_map_pages(rdev->dev, &gtt->ttm, ctx);
 }
 
-static void radeon_ttm_tt_unpopulate(struct ttm_tt *ttm)
+static void radeon_ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
 	struct radeon_device *rdev;
 	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(ttm);
@@ -654,10 +656,10 @@ static void radeon_ttm_tt_unpopulate(struct ttm_tt *ttm)
 	if (slave)
 		return;
 
-	rdev = radeon_get_rdev(ttm->bdev);
+	rdev = radeon_get_rdev(bdev);
 #if IS_ENABLED(CONFIG_AGP)
 	if (rdev->flags & RADEON_IS_AGP) {
-		ttm_agp_tt_unpopulate(ttm);
+		ttm_agp_tt_unpopulate(bdev, ttm);
 		return;
 	}
 #endif
diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/ttm/ttm_agp_backend.c
index 09fe80e215c5..934a69491547 100644
--- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
+++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
@@ -48,7 +48,8 @@ struct ttm_agp_backend {
 	struct agp_bridge_data *bridge;
 };
 
-static int ttm_agp_bind(struct ttm_tt *ttm, struct ttm_resource *bo_mem)
+static int ttm_agp_bind(struct ttm_bo_device *bdev,
+			struct ttm_tt *ttm, struct ttm_resource *bo_mem)
 {
 	struct ttm_agp_backend *agp_be = container_of(ttm, struct ttm_agp_backend, ttm);
 	struct page *dummy_read_page = ttm_bo_glob.dummy_read_page;
@@ -82,7 +83,8 @@ static int ttm_agp_bind(struct ttm_tt *ttm, struct ttm_resource *bo_mem)
 	return ret;
 }
 
-static void ttm_agp_unbind(struct ttm_tt *ttm)
+static void ttm_agp_unbind(struct ttm_bo_device *bdev,
+			   struct ttm_tt *ttm)
 {
 	struct ttm_agp_backend *agp_be = container_of(ttm, struct ttm_agp_backend, ttm);
 
@@ -96,12 +98,13 @@ static void ttm_agp_unbind(struct ttm_tt *ttm)
 	}
 }
 
-static void ttm_agp_destroy(struct ttm_tt *ttm)
+static void ttm_agp_destroy(struct ttm_bo_device *bdev,
+			    struct ttm_tt *ttm)
 {
 	struct ttm_agp_backend *agp_be = container_of(ttm, struct ttm_agp_backend, ttm);
 
 	if (agp_be->mem)
-		ttm_agp_unbind(ttm);
+		ttm_agp_unbind(bdev, ttm);
 	ttm_tt_fini(ttm);
 	kfree(agp_be);
 }
@@ -135,7 +138,8 @@ struct ttm_tt *ttm_agp_tt_create(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_agp_tt_create);
 
-int ttm_agp_tt_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
+int ttm_agp_tt_populate(struct ttm_bo_device *bdev,
+			struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 {
 	if (ttm->state != tt_unpopulated)
 		return 0;
@@ -144,7 +148,8 @@ int ttm_agp_tt_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 }
 EXPORT_SYMBOL(ttm_agp_tt_populate);
 
-void ttm_agp_tt_unpopulate(struct ttm_tt *ttm)
+void ttm_agp_tt_unpopulate(struct ttm_bo_device *bdev,
+			   struct ttm_tt *ttm)
 {
 	ttm_pool_unpopulate(ttm);
 }
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 8257421fc9a0..fa9012c8d11a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -282,7 +282,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 			goto out_err;
 
 		if (mem->mem_type != TTM_PL_SYSTEM) {
-			ret = ttm_tt_bind(bo->ttm, mem, ctx);
+			ret = ttm_tt_bind(bdev, bo->ttm, mem, ctx);
 			if (ret)
 				goto out_err;
 		}
@@ -324,7 +324,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 out_err:
 	new_man = ttm_manager_type(bdev, bo->mem.mem_type);
 	if (!new_man->use_tt) {
-		ttm_tt_destroy(bo->ttm);
+		ttm_tt_destroy(bdev, bo->ttm);
 		bo->ttm = NULL;
 	}
 
@@ -344,7 +344,7 @@ static void ttm_bo_cleanup_memtype_use(struct ttm_buffer_object *bo)
 	if (bo->bdev->driver->move_notify)
 		bo->bdev->driver->move_notify(bo, false, NULL);
 
-	ttm_tt_destroy(bo->ttm);
+	ttm_tt_destroy(bo->bdev, bo->ttm);
 	bo->ttm = NULL;
 	ttm_resource_free(bo, &bo->mem);
 }
@@ -1653,7 +1653,7 @@ int ttm_bo_swapout(struct ttm_bo_global *glob, struct ttm_operation_ctx *ctx)
 	if (bo->bdev->driver->swap_notify)
 		bo->bdev->driver->swap_notify(bo);
 
-	ret = ttm_tt_swapout(bo->ttm, bo->persistent_swap_storage);
+	ret = ttm_tt_swapout(bo->bdev, bo->ttm, bo->persistent_swap_storage);
 out:
 
 	/**
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 72a353d5c3a7..3b17fe3cb57a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -67,7 +67,7 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 			return ret;
 		}
 
-		ttm_tt_unbind(ttm);
+		ttm_tt_unbind(bo->bdev, ttm);
 		ttm_bo_free_old_node(bo);
 		ttm_flag_masked(&old_mem->placement, TTM_PL_FLAG_SYSTEM,
 				TTM_PL_MASK_MEM);
@@ -79,7 +79,7 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 		return ret;
 
 	if (new_mem->mem_type != TTM_PL_SYSTEM) {
-		ret = ttm_tt_bind(ttm, new_mem, ctx);
+		ret = ttm_tt_bind(bo->bdev, ttm, new_mem, ctx);
 		if (unlikely(ret != 0))
 			return ret;
 	}
@@ -261,7 +261,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	 * TTM might be null for moves within the same region.
 	 */
 	if (ttm) {
-		ret = ttm_tt_populate(ttm, ctx);
+		ret = ttm_tt_populate(bdev, ttm, ctx);
 		if (ret)
 			goto out1;
 	}
@@ -300,7 +300,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	new_mem->mm_node = NULL;
 
 	if (!man->use_tt) {
-		ttm_tt_destroy(ttm);
+		ttm_tt_destroy(bdev, ttm);
 		bo->ttm = NULL;
 	}
 
@@ -451,7 +451,7 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
 
 	BUG_ON(!ttm);
 
-	ret = ttm_tt_populate(ttm, &ctx);
+	ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
 	if (ret)
 		return ret;
 
@@ -547,7 +547,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 			return ret;
 
 		if (!man->use_tt) {
-			ttm_tt_destroy(bo->ttm);
+			ttm_tt_destroy(bdev, bo->ttm);
 			bo->ttm = NULL;
 		}
 		ttm_bo_free_old_node(bo);
@@ -670,7 +670,7 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
 			return ret;
 
 		if (!to->use_tt) {
-			ttm_tt_destroy(bo->ttm);
+			ttm_tt_destroy(bdev, bo->ttm);
 			bo->ttm = NULL;
 		}
 		ttm_bo_free_old_node(bo);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index d3dc0682425c..bb96f819f607 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -341,7 +341,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 		};
 
 		ttm = bo->ttm;
-		if (ttm_tt_populate(bo->ttm, &ctx))
+		if (ttm_tt_populate(bdev, bo->ttm, &ctx))
 			return VM_FAULT_OOM;
 	} else {
 		/* Iomem should not be marked encrypted */
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 1ccf1ef050d6..50a899104022 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -207,29 +207,28 @@ int ttm_tt_set_placement_caching(struct ttm_tt *ttm, uint32_t placement)
 }
 EXPORT_SYMBOL(ttm_tt_set_placement_caching);
 
-void ttm_tt_destroy(struct ttm_tt *ttm)
+void ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
 	if (ttm == NULL)
 		return;
 
-	ttm_tt_unbind(ttm);
+	ttm_tt_unbind(bdev, ttm);
 
 	if (ttm->state == tt_unbound)
-		ttm_tt_unpopulate(ttm);
+		ttm_tt_unpopulate(bdev, ttm);
 
 	if (!(ttm->page_flags & TTM_PAGE_FLAG_PERSISTENT_SWAP) &&
 	    ttm->swap_storage)
 		fput(ttm->swap_storage);
 
 	ttm->swap_storage = NULL;
-	ttm->func->destroy(ttm);
+	ttm->func->destroy(bdev, ttm);
 }
 
 static void ttm_tt_init_fields(struct ttm_tt *ttm,
 			       struct ttm_buffer_object *bo,
 			       uint32_t page_flags)
 {
-	ttm->bdev = bo->bdev;
 	ttm->num_pages = bo->num_pages;
 	ttm->caching_state = tt_cached;
 	ttm->page_flags = page_flags;
@@ -308,15 +307,16 @@ void ttm_dma_tt_fini(struct ttm_dma_tt *ttm_dma)
 }
 EXPORT_SYMBOL(ttm_dma_tt_fini);
 
-void ttm_tt_unbind(struct ttm_tt *ttm)
+void ttm_tt_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
 	if (ttm->state == tt_bound) {
-		ttm->func->unbind(ttm);
+		ttm->func->unbind(bdev, ttm);
 		ttm->state = tt_unbound;
 	}
 }
 
-int ttm_tt_bind(struct ttm_tt *ttm, struct ttm_resource *bo_mem,
+int ttm_tt_bind(struct ttm_bo_device *bdev,
+		struct ttm_tt *ttm, struct ttm_resource *bo_mem,
 		struct ttm_operation_ctx *ctx)
 {
 	int ret = 0;
@@ -327,11 +327,11 @@ int ttm_tt_bind(struct ttm_tt *ttm, struct ttm_resource *bo_mem,
 	if (ttm->state == tt_bound)
 		return 0;
 
-	ret = ttm_tt_populate(ttm, ctx);
+	ret = ttm_tt_populate(bdev, ttm, ctx);
 	if (ret)
 		return ret;
 
-	ret = ttm->func->bind(ttm, bo_mem);
+	ret = ttm->func->bind(bdev, ttm, bo_mem);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -383,7 +383,8 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
 	return ret;
 }
 
-int ttm_tt_swapout(struct ttm_tt *ttm, struct file *persistent_swap_storage)
+int ttm_tt_swapout(struct ttm_bo_device *bdev,
+		   struct ttm_tt *ttm, struct file *persistent_swap_storage)
 {
 	struct address_space *swap_space;
 	struct file *swap_storage;
@@ -429,7 +430,7 @@ int ttm_tt_swapout(struct ttm_tt *ttm, struct file *persistent_swap_storage)
 		put_page(to_page);
 	}
 
-	ttm_tt_unpopulate(ttm);
+	ttm_tt_unpopulate(bdev, ttm);
 	ttm->swap_storage = swap_storage;
 	ttm->page_flags |= TTM_PAGE_FLAG_SWAPPED;
 	if (persistent_swap_storage)
@@ -443,7 +444,7 @@ int ttm_tt_swapout(struct ttm_tt *ttm, struct file *persistent_swap_storage)
 	return ret;
 }
 
-static void ttm_tt_add_mapping(struct ttm_tt *ttm)
+static void ttm_tt_add_mapping(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
 	pgoff_t i;
 
@@ -451,22 +452,23 @@ static void ttm_tt_add_mapping(struct ttm_tt *ttm)
 		return;
 
 	for (i = 0; i < ttm->num_pages; ++i)
-		ttm->pages[i]->mapping = ttm->bdev->dev_mapping;
+		ttm->pages[i]->mapping = bdev->dev_mapping;
 }
 
-int ttm_tt_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
+int ttm_tt_populate(struct ttm_bo_device *bdev,
+		    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 {
 	int ret;
 
 	if (ttm->state != tt_unpopulated)
 		return 0;
 
-	if (ttm->bdev->driver->ttm_tt_populate)
-		ret = ttm->bdev->driver->ttm_tt_populate(ttm, ctx);
+	if (bdev->driver->ttm_tt_populate)
+		ret = bdev->driver->ttm_tt_populate(bdev, ttm, ctx);
 	else
 		ret = ttm_pool_populate(ttm, ctx);
 	if (!ret)
-		ttm_tt_add_mapping(ttm);
+		ttm_tt_add_mapping(bdev, ttm);
 	return ret;
 }
 
@@ -484,14 +486,15 @@ static void ttm_tt_clear_mapping(struct ttm_tt *ttm)
 	}
 }
 
-void ttm_tt_unpopulate(struct ttm_tt *ttm)
+void ttm_tt_unpopulate(struct ttm_bo_device *bdev,
+		       struct ttm_tt *ttm)
 {
 	if (ttm->state == tt_unpopulated)
 		return;
 
 	ttm_tt_clear_mapping(ttm);
-	if (ttm->bdev->driver->ttm_tt_unpopulate)
-		ttm->bdev->driver->ttm_tt_unpopulate(ttm);
+	if (bdev->driver->ttm_tt_unpopulate)
+		bdev->driver->ttm_tt_unpopulate(bdev, ttm);
 	else
 		ttm_pool_unpopulate(ttm);
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
index 1629427d5734..0cd21590ded9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
@@ -465,13 +465,13 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
 		dma_resv_assert_held(src->base.resv);
 
 	if (dst->ttm->state == tt_unpopulated) {
-		ret = dst->ttm->bdev->driver->ttm_tt_populate(dst->ttm, &ctx);
+		ret = dst->bdev->driver->ttm_tt_populate(dst->bdev, dst->ttm, &ctx);
 		if (ret)
 			return ret;
 	}
 
 	if (src->ttm->state == tt_unpopulated) {
-		ret = src->ttm->bdev->driver->ttm_tt_populate(src->ttm, &ctx);
+		ret = src->bdev->driver->ttm_tt_populate(src->bdev, src->ttm, &ctx);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index c7f10b2c93d2..a76a7f542dd8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -539,7 +539,8 @@ const struct vmw_sg_table *vmw_bo_sg_table(struct ttm_buffer_object *bo)
 }
 
 
-static int vmw_ttm_bind(struct ttm_tt *ttm, struct ttm_resource *bo_mem)
+static int vmw_ttm_bind(struct ttm_bo_device *bdev,
+			struct ttm_tt *ttm, struct ttm_resource *bo_mem)
 {
 	struct vmw_ttm_tt *vmw_be =
 		container_of(ttm, struct vmw_ttm_tt, dma_ttm.ttm);
@@ -573,7 +574,8 @@ static int vmw_ttm_bind(struct ttm_tt *ttm, struct ttm_resource *bo_mem)
 	return 0;
 }
 
-static void vmw_ttm_unbind(struct ttm_tt *ttm)
+static void vmw_ttm_unbind(struct ttm_bo_device *bdev,
+			   struct ttm_tt *ttm)
 {
 	struct vmw_ttm_tt *vmw_be =
 		container_of(ttm, struct vmw_ttm_tt, dma_ttm.ttm);
@@ -594,7 +596,7 @@ static void vmw_ttm_unbind(struct ttm_tt *ttm)
 }
 
 
-static void vmw_ttm_destroy(struct ttm_tt *ttm)
+static void vmw_ttm_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
 	struct vmw_ttm_tt *vmw_be =
 		container_of(ttm, struct vmw_ttm_tt, dma_ttm.ttm);
@@ -612,7 +614,8 @@ static void vmw_ttm_destroy(struct ttm_tt *ttm)
 }
 
 
-static int vmw_ttm_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
+static int vmw_ttm_populate(struct ttm_bo_device *bdev,
+			    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 {
 	struct vmw_ttm_tt *vmw_tt =
 		container_of(ttm, struct vmw_ttm_tt, dma_ttm.ttm);
@@ -640,7 +643,8 @@ static int vmw_ttm_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 	return ret;
 }
 
-static void vmw_ttm_unpopulate(struct ttm_tt *ttm)
+static void vmw_ttm_unpopulate(struct ttm_bo_device *bdev,
+			       struct ttm_tt *ttm)
 {
 	struct vmw_ttm_tt *vmw_tt = container_of(ttm, struct vmw_ttm_tt,
 						 dma_ttm.ttm);
@@ -796,7 +800,7 @@ int vmw_bo_create_and_populate(struct vmw_private *dev_priv,
 
 	ret = ttm_bo_reserve(bo, false, true, NULL);
 	BUG_ON(ret != 0);
-	ret = vmw_ttm_populate(bo->ttm, &ctx);
+	ret = vmw_ttm_populate(bo->bdev, bo->ttm, &ctx);
 	if (likely(ret == 0)) {
 		struct vmw_ttm_tt *vmw_tt =
 			container_of(bo->ttm, struct vmw_ttm_tt, dma_ttm.ttm);
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index af1f39b77144..ebba282667ba 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -77,8 +77,9 @@ struct ttm_bo_driver {
 	 * Returns:
 	 * -ENOMEM: Out of memory.
 	 */
-	int (*ttm_tt_populate)(struct ttm_tt *ttm,
-			struct ttm_operation_ctx *ctx);
+	int (*ttm_tt_populate)(struct ttm_bo_device *bdev,
+			       struct ttm_tt *ttm,
+			       struct ttm_operation_ctx *ctx);
 
 	/**
 	 * ttm_tt_unpopulate
@@ -87,7 +88,7 @@ struct ttm_bo_driver {
 	 *
 	 * Free all backing page
 	 */
-	void (*ttm_tt_unpopulate)(struct ttm_tt *ttm);
+	void (*ttm_tt_unpopulate)(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
 
 	/**
 	 * struct ttm_bo_driver member eviction_valuable
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 241cc40839ed..6bda88f8da46 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -60,7 +60,7 @@ struct ttm_backend_func {
 	 * indicated by @bo_mem. This function should be able to handle
 	 * differences between aperture and system page sizes.
 	 */
-	int (*bind) (struct ttm_tt *ttm, struct ttm_resource *bo_mem);
+	int (*bind) (struct ttm_bo_device *bdev, struct ttm_tt *ttm, struct ttm_resource *bo_mem);
 
 	/**
 	 * struct ttm_backend_func member unbind
@@ -70,7 +70,7 @@ struct ttm_backend_func {
 	 * Unbind previously bound backend pages. This function should be
 	 * able to handle differences between aperture and system page sizes.
 	 */
-	void (*unbind) (struct ttm_tt *ttm);
+	void (*unbind) (struct ttm_bo_device *bdev, struct ttm_tt *ttm);
 
 	/**
 	 * struct ttm_backend_func member destroy
@@ -80,13 +80,12 @@ struct ttm_backend_func {
 	 * Destroy the backend. This will be call back from ttm_tt_destroy so
 	 * don't call ttm_tt_destroy from the callback or infinite loop.
 	 */
-	void (*destroy) (struct ttm_tt *ttm);
+	void (*destroy) (struct ttm_bo_device *bdev, struct ttm_tt *ttm);
 };
 
 /**
  * struct ttm_tt
  *
- * @bdev: Pointer to a struct ttm_bo_device.
  * @func: Pointer to a struct ttm_backend_func that describes
  * the backend methods.
  * pointer.
@@ -103,7 +102,6 @@ struct ttm_backend_func {
  * memory.
  */
 struct ttm_tt {
-	struct ttm_bo_device *bdev;
 	struct ttm_backend_func *func;
 	struct page **pages;
 	uint32_t page_flags;
@@ -183,7 +181,8 @@ void ttm_dma_tt_fini(struct ttm_dma_tt *ttm_dma);
  *
  * Bind the pages of @ttm to an aperture location identified by @bo_mem
  */
-int ttm_tt_bind(struct ttm_tt *ttm, struct ttm_resource *bo_mem,
+int ttm_tt_bind(struct ttm_bo_device *bdev,
+		struct ttm_tt *ttm, struct ttm_resource *bo_mem,
 		struct ttm_operation_ctx *ctx);
 
 /**
@@ -193,7 +192,7 @@ int ttm_tt_bind(struct ttm_tt *ttm, struct ttm_resource *bo_mem,
  *
  * Unbind, unpopulate and destroy common struct ttm_tt.
  */
-void ttm_tt_destroy(struct ttm_tt *ttm);
+void ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
 
 /**
  * ttm_ttm_unbind:
@@ -202,7 +201,7 @@ void ttm_tt_destroy(struct ttm_tt *ttm);
  *
  * Unbind a struct ttm_tt.
  */
-void ttm_tt_unbind(struct ttm_tt *ttm);
+void ttm_tt_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
 
 /**
  * ttm_tt_swapin:
@@ -227,7 +226,7 @@ int ttm_tt_swapin(struct ttm_tt *ttm);
  * and cache flushes and potential page splitting / combining.
  */
 int ttm_tt_set_placement_caching(struct ttm_tt *ttm, uint32_t placement);
-int ttm_tt_swapout(struct ttm_tt *ttm, struct file *persistent_swap_storage);
+int ttm_tt_swapout(struct ttm_bo_device *bdev, struct ttm_tt *ttm, struct file *persistent_swap_storage);
 
 /**
  * ttm_tt_populate - allocate pages for a ttm
@@ -236,7 +235,7 @@ int ttm_tt_swapout(struct ttm_tt *ttm, struct file *persistent_swap_storage);
  *
  * Calls the driver method to allocate pages for a ttm
  */
-int ttm_tt_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx);
+int ttm_tt_populate(struct ttm_bo_device *bdev, struct ttm_tt *ttm, struct ttm_operation_ctx *ctx);
 
 /**
  * ttm_tt_unpopulate - free pages from a ttm
@@ -245,7 +244,7 @@ int ttm_tt_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx);
  *
  * Calls the driver method to free all pages from a ttm
  */
-void ttm_tt_unpopulate(struct ttm_tt *ttm);
+void ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
 
 #if IS_ENABLED(CONFIG_AGP)
 #include <linux/agp_backend.h>
@@ -265,8 +264,8 @@ void ttm_tt_unpopulate(struct ttm_tt *ttm);
 struct ttm_tt *ttm_agp_tt_create(struct ttm_buffer_object *bo,
 				 struct agp_bridge_data *bridge,
 				 uint32_t page_flags);
-int ttm_agp_tt_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx);
-void ttm_agp_tt_unpopulate(struct ttm_tt *ttm);
+int ttm_agp_tt_populate(struct ttm_bo_device *bdev, struct ttm_tt *ttm, struct ttm_operation_ctx *ctx);
+void ttm_agp_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
 #endif
 
 #endif
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
