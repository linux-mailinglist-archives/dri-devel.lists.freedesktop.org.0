Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5664E276844
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953806EA87;
	Thu, 24 Sep 2020 05:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CEA6EA77
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:17 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-bu9y_zjSOAGdX-pikoxdxQ-1; Thu, 24 Sep 2020 01:19:10 -0400
X-MC-Unique: bu9y_zjSOAGdX-pikoxdxQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1BEE802B68;
 Thu, 24 Sep 2020 05:19:09 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8F4919D7C;
 Thu, 24 Sep 2020 05:19:08 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 15/45] drm/ttm: push copy unbind into drivers.
Date: Thu, 24 Sep 2020 15:18:15 +1000
Message-Id: <20200924051845.397177-16-airlied@gmail.com>
In-Reply-To: <20200924051845.397177-1-airlied@gmail.com>
References: <20200924051845.397177-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
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
Cc: christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This uninlines ttm_bo_move_old_to_system into 3 places

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 7 ++++++-
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 7 +++++--
 drivers/gpu/drm/radeon/radeon_ttm.c     | 7 ++++++-
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index e20ce380f627..d165edacc347 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -66,6 +66,8 @@
 static int amdgpu_ttm_backend_bind(struct ttm_bo_device *bdev,
 				   struct ttm_tt *ttm,
 				   struct ttm_resource *bo_mem);
+static void amdgpu_ttm_backend_unbind(struct ttm_bo_device *bdev,
+				      struct ttm_tt *ttm);
 
 static int amdgpu_ttm_init_on_chip(struct amdgpu_device *adev,
 				    unsigned int type,
@@ -568,10 +570,13 @@ static int amdgpu_move_vram_ram(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	/* move BO (in tmp_mem) to new_mem */
-	r = ttm_bo_move_old_to_system(bo, ctx);
+	r = ttm_bo_wait_ctx(bo, ctx);
 	if (unlikely(r))
 		goto out_cleanup;
 
+	amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
+	ttm_resource_free(bo, &bo->mem);
+
 	r = ttm_tt_set_placement_caching(bo->ttm, new_mem->placement);
 	if (unlikely(r))
 		goto out_cleanup;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index a95d208c76a1..1e6c2561d692 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -46,7 +46,7 @@
 
 static int nouveau_ttm_tt_bind(struct ttm_bo_device *bdev, struct ttm_tt *ttm,
 			       struct ttm_resource *reg);
-
+static void nouveau_ttm_tt_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
 /*
  * NV10-NV40 tiling helpers
  */
@@ -915,10 +915,13 @@ nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict,
 	if (ret)
 		goto out;
 
-	ret = ttm_bo_move_old_to_system(bo, ctx);
+	ret = ttm_bo_wait_ctx(bo, ctx);
 	if (ret)
 		goto out;
 
+	nouveau_ttm_tt_unbind(bo->bdev, bo->ttm);
+	ttm_resource_free(bo, &bo->mem);
+
 	ret = ttm_tt_set_placement_caching(bo->ttm, new_reg->placement);
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 89455f2d3bb6..10d25d3b83f2 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -59,6 +59,8 @@ static void radeon_ttm_debugfs_fini(struct radeon_device *rdev);
 static int radeon_ttm_tt_bind(struct ttm_bo_device *bdev,
 			      struct ttm_tt *ttm,
 			      struct ttm_resource *bo_mem);
+static void radeon_ttm_tt_unbind(struct ttm_bo_device *bdev,
+				 struct ttm_tt *ttm);
 
 struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev)
 {
@@ -249,10 +251,13 @@ static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
-	r = ttm_bo_move_old_to_system(bo, ctx);
+	r = ttm_bo_wait_ctx(bo, ctx);
 	if (unlikely(r))
 		goto out_cleanup;
 
+	radeon_ttm_tt_unbind(bo->bdev, bo->ttm);
+	ttm_resource_free(bo, &bo->mem);
+
 	r = ttm_tt_set_placement_caching(bo->ttm, new_mem->placement);
 	if (unlikely(r))
 		goto out_cleanup;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
