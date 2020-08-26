Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D480252526
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 03:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4E26E9E9;
	Wed, 26 Aug 2020 01:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C136E9E9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 01:45:32 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-RwYYmb6pPXa_I5epcKqJdg-1; Tue, 25 Aug 2020 21:45:25 -0400
X-MC-Unique: RwYYmb6pPXa_I5epcKqJdg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB4DC8030B3;
 Wed, 26 Aug 2020 01:45:23 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-53.bne.redhat.com
 [10.64.54.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8102360C13;
 Wed, 26 Aug 2020 01:45:22 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 19/23] drm/ttm: split bind and populate out.
Date: Wed, 26 Aug 2020 11:44:24 +1000
Message-Id: <20200826014428.828392-20-airlied@gmail.com>
In-Reply-To: <20200826014428.828392-1-airlied@gmail.com>
References: <20200826014428.828392-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0.001
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

Make populating the backing store an explicit separate step

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  7 ++++++-
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  6 +++++-
 drivers/gpu/drm/radeon/radeon_ttm.c     |  7 ++++++-
 drivers/gpu/drm/ttm/ttm_bo.c            |  5 ++++-
 drivers/gpu/drm/ttm/ttm_bo_util.c       |  6 +++++-
 drivers/gpu/drm/ttm/ttm_tt.c            | 16 +++++-----------
 include/drm/ttm/ttm_tt.h                |  3 +--
 7 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 116407c77f02..e8a56e64bc38 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -546,8 +546,13 @@ static int amdgpu_move_vram_ram(struct ttm_buffer_object *bo, bool evict,
 		goto out_cleanup;
 	}
 
+	r = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
+	if (unlikely(r)) {
+		goto out_cleanup;
+	}
+
 	/* Bind the memory to the GTT space */
-	r = ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem, ctx);
+	r = ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem);
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 9ac4b37aed87..f6b6ef7a8868 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -876,7 +876,11 @@ nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict, bool intr,
 	if (ret)
 		return ret;
 
-	ret = ttm_tt_bind(bo->bdev, bo->ttm, &tmp_reg, &ctx);
+	ret = ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
+	if (ret)
+		goto out;
+
+	ret = ttm_tt_bind(bo->bdev, bo->ttm, &tmp_reg);
 	if (ret)
 		goto out;
 	bo->ttm_bound = true;
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 71c2a78911cd..6f64f949c202 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -235,7 +235,12 @@ static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
 		goto out_cleanup;
 	}
 
-	r = ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem, &ctx);
+	r = ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
+	if (unlikely(r)) {
+		goto out_cleanup;
+	}
+
+	r = ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem);
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index bf27d185c23f..bf5f31d9996a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -282,8 +282,11 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 			goto out_err;
 
 		if (mem->mem_type != TTM_PL_SYSTEM) {
+			ret = ttm_tt_populate(bdev, bo->ttm, ctx);
+			if (ret)
+				goto out_err;
 			if (bo->ttm_bound == false) {
-				ret = ttm_tt_bind(bdev, bo->ttm, mem, ctx);
+				ret = ttm_tt_bind(bdev, bo->ttm, mem);
 				if (ret)
 					goto out_err;
 				bo->ttm_bound = true;
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 8b50b250da0c..c6262fda1fb8 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -80,7 +80,11 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 		return ret;
 
 	if (new_mem->mem_type != TTM_PL_SYSTEM) {
-		ret = ttm_tt_bind(bo->bdev, ttm, new_mem, ctx);
+		ret = ttm_tt_populate(bo->bdev, ttm, ctx);
+		if (unlikely(ret != 0))
+			return ret;
+
+		ret = ttm_tt_bind(bo->bdev, ttm, new_mem);
 		if (unlikely(ret != 0))
 			return ret;
 		bo->ttm_bound = true;
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 8d4f946cd9e0..288fd952bdbe 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -307,22 +307,15 @@ void ttm_tt_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 }
 
 int ttm_tt_bind(struct ttm_bo_device *bdev,
-		struct ttm_tt *ttm, struct ttm_resource *bo_mem,
-		struct ttm_operation_ctx *ctx)
+		struct ttm_tt *ttm, struct ttm_resource *bo_mem)
 {
-	int ret = 0;
-
 	if (!ttm)
 		return -EINVAL;
 
-	ret = ttm_tt_populate(bdev, ttm, ctx);
-	if (ret)
-		return ret;
+	if (WARN_ON(!ttm->populated))
+		return -EINVAL;
 
-	ret = bdev->driver->ttm_tt_bind(bdev, ttm, bo_mem);
-	if (unlikely(ret != 0))
-		return ret;
-	return 0;
+	return bdev->driver->ttm_tt_bind(bdev, ttm, bo_mem);
 }
 EXPORT_SYMBOL(ttm_tt_bind);
 
@@ -455,6 +448,7 @@ int ttm_tt_populate(struct ttm_bo_device *bdev,
 		ttm_tt_add_mapping(bdev, ttm);
 	return ret;
 }
+EXPORT_SYMBOL(ttm_tt_populate);
 
 static void ttm_tt_clear_mapping(struct ttm_tt *ttm)
 {
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 5d10abb1419b..4b35d0e4b9c5 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -139,8 +139,7 @@ void ttm_dma_tt_fini(struct ttm_dma_tt *ttm_dma);
  * Bind the pages of @ttm to an aperture location identified by @bo_mem
  */
 int ttm_tt_bind(struct ttm_bo_device *bdev,
-		struct ttm_tt *ttm, struct ttm_resource *bo_mem,
-		struct ttm_operation_ctx *ctx);
+		struct ttm_tt *ttm, struct ttm_resource *bo_mem);
 
 /**
  * ttm_ttm_destroy:
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
