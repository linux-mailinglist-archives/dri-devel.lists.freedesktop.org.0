Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D97523006B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 06:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926EF6E153;
	Tue, 28 Jul 2020 04:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC936E153
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 04:00:13 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-ixKWW75gO7CDhu01iWa6tA-1; Tue, 28 Jul 2020 00:00:09 -0400
X-MC-Unique: ixKWW75gO7CDhu01iWa6tA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3ABA8106B24A;
 Tue, 28 Jul 2020 04:00:08 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.32.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 855CD69330;
 Tue, 28 Jul 2020 04:00:05 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: make ttm_tt unbind function return void.
Date: Tue, 28 Jul 2020 14:00:03 +1000
Message-Id: <20200728040003.20398-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: sroland@vmware.com, linux-graphics-maintainer@vmware.com,
 christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

The return value just led to BUG_ON, I think if a driver wants
to BUG_ON here it can do it itself. (don't BUG_ON).

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 5 ++---
 drivers/gpu/drm/nouveau/nouveau_sgdma.c    | 3 +--
 drivers/gpu/drm/qxl/qxl_ttm.c              | 3 +--
 drivers/gpu/drm/radeon/radeon_ttm.c        | 4 +---
 drivers/gpu/drm/ttm/ttm_agp_backend.c      | 9 +++++----
 drivers/gpu/drm/ttm/ttm_tt.c               | 5 +----
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 4 +---
 include/drm/ttm/ttm_tt.h                   | 2 +-
 8 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index fcff5671f6f8..e11c5d69843d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1292,7 +1292,7 @@ int amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo)
  * Called by ttm_tt_unbind() on behalf of ttm_bo_move_ttm() and
  * ttm_tt_destroy().
  */
-static int amdgpu_ttm_backend_unbind(struct ttm_tt *ttm)
+static void amdgpu_ttm_backend_unbind(struct ttm_tt *ttm)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(ttm->bdev);
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
@@ -1303,14 +1303,13 @@ static int amdgpu_ttm_backend_unbind(struct ttm_tt *ttm)
 		amdgpu_ttm_tt_unpin_userptr(ttm);
 
 	if (gtt->offset == AMDGPU_BO_INVALID_OFFSET)
-		return 0;
+		return;
 
 	/* unbind shouldn't be done for GDS/GWS/OA in ttm_bo_clean_mm */
 	r = amdgpu_gart_unbind(adev, gtt->offset, ttm->num_pages);
 	if (r)
 		DRM_ERROR("failed to unbind %lu pages at 0x%08llX\n",
 			  gtt->ttm.ttm.num_pages, gtt->offset);
-	return r;
 }
 
 static void amdgpu_ttm_backend_destroy(struct ttm_tt *ttm)
diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
index feaac908efed..20b6d0b3de5c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
@@ -46,12 +46,11 @@ nv04_sgdma_bind(struct ttm_tt *ttm, struct ttm_mem_reg *reg)
 	return 0;
 }
 
-static int
+static void
 nv04_sgdma_unbind(struct ttm_tt *ttm)
 {
 	struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
 	nouveau_mem_fini(nvbe->mem);
-	return 0;
 }
 
 static struct ttm_backend_func nv04_sgdma_backend = {
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 1d8e07b8b19e..bf9dc451583a 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -149,10 +149,9 @@ static int qxl_ttm_backend_bind(struct ttm_tt *ttm,
 	return -1;
 }
 
-static int qxl_ttm_backend_unbind(struct ttm_tt *ttm)
+static void qxl_ttm_backend_unbind(struct ttm_tt *ttm)
 {
 	/* Not implemented */
-	return -1;
 }
 
 static void qxl_ttm_backend_destroy(struct ttm_tt *ttm)
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 54af06df865b..004344dce140 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -591,7 +591,7 @@ static int radeon_ttm_backend_bind(struct ttm_tt *ttm,
 	return 0;
 }
 
-static int radeon_ttm_backend_unbind(struct ttm_tt *ttm)
+static void radeon_ttm_backend_unbind(struct ttm_tt *ttm)
 {
 	struct radeon_ttm_tt *gtt = (void *)ttm;
 
@@ -599,8 +599,6 @@ static int radeon_ttm_backend_unbind(struct ttm_tt *ttm)
 
 	if (gtt->userptr)
 		radeon_ttm_tt_unpin_userptr(ttm);
-
-	return 0;
 }
 
 static void radeon_ttm_backend_destroy(struct ttm_tt *ttm)
diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/ttm/ttm_agp_backend.c
index 6050dc846894..38f1351140e2 100644
--- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
+++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
@@ -82,17 +82,18 @@ static int ttm_agp_bind(struct ttm_tt *ttm, struct ttm_mem_reg *bo_mem)
 	return ret;
 }
 
-static int ttm_agp_unbind(struct ttm_tt *ttm)
+static void ttm_agp_unbind(struct ttm_tt *ttm)
 {
 	struct ttm_agp_backend *agp_be = container_of(ttm, struct ttm_agp_backend, ttm);
 
 	if (agp_be->mem) {
-		if (agp_be->mem->is_bound)
-			return agp_unbind_memory(agp_be->mem);
+		if (agp_be->mem->is_bound) {
+			agp_unbind_memory(agp_be->mem);
+			return;
+		}
 		agp_free_memory(agp_be->mem);
 		agp_be->mem = NULL;
 	}
-	return 0;
 }
 
 static void ttm_agp_destroy(struct ttm_tt *ttm)
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index e25d4097aa16..bab67873cfd4 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -313,11 +313,8 @@ EXPORT_SYMBOL(ttm_dma_tt_fini);
 
 void ttm_tt_unbind(struct ttm_tt *ttm)
 {
-	int ret;
-
 	if (ttm->state == tt_bound) {
-		ret = ttm->func->unbind(ttm);
-		BUG_ON(ret);
+		ttm->func->unbind(ttm);
 		ttm->state = tt_unbound;
 	}
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 0f0f9600ea46..8da32f4e766f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -573,7 +573,7 @@ static int vmw_ttm_bind(struct ttm_tt *ttm, struct ttm_mem_reg *bo_mem)
 	return 0;
 }
 
-static int vmw_ttm_unbind(struct ttm_tt *ttm)
+static void vmw_ttm_unbind(struct ttm_tt *ttm)
 {
 	struct vmw_ttm_tt *vmw_be =
 		container_of(ttm, struct vmw_ttm_tt, dma_ttm.ttm);
@@ -591,8 +591,6 @@ static int vmw_ttm_unbind(struct ttm_tt *ttm)
 
 	if (vmw_be->dev_priv->map_mode == vmw_dma_map_bind)
 		vmw_ttm_unmap_dma(vmw_be);
-
-	return 0;
 }
 
 
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index c0e928abf592..5e2393fe42c6 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -70,7 +70,7 @@ struct ttm_backend_func {
 	 * Unbind previously bound backend pages. This function should be
 	 * able to handle differences between aperture and system page sizes.
 	 */
-	int (*unbind) (struct ttm_tt *ttm);
+	void (*unbind) (struct ttm_tt *ttm);
 
 	/**
 	 * struct ttm_backend_func member destroy
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
