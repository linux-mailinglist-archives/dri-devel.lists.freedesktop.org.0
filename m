Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DBB276857
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E4F6EAA0;
	Thu, 24 Sep 2020 05:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7A86EA89
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:57 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-OKLnLqH0OD2C51fQhLLwCA-1; Thu, 24 Sep 2020 01:19:53 -0400
X-MC-Unique: OKLnLqH0OD2C51fQhLLwCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 967661DE19;
 Thu, 24 Sep 2020 05:19:52 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D4B819D7C;
 Thu, 24 Sep 2020 05:19:51 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 45/45] drm/ttm: add a new helper for a cleaning up after a ram
 move
Date: Thu, 24 Sep 2020 15:18:45 +1000
Message-Id: <20200924051845.397177-46-airlied@gmail.com>
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

This is a pretty common pattern in the drivers.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 13 ++-----------
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 14 +++-----------
 drivers/gpu/drm/radeon/radeon_ttm.c     | 13 ++-----------
 drivers/gpu/drm/ttm/ttm_bo.c            | 15 +++++++++++++++
 include/drm/ttm/ttm_bo_driver.h         |  3 +++
 5 files changed, 25 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index efb74ddc1877..72a1c06ef15c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -552,12 +552,8 @@ static int amdgpu_move_vram_ram(struct ttm_buffer_object *bo, bool evict,
 		goto out_cleanup;
 
 	amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
-	ttm_resource_free(bo, &bo->mem);
 
-	r = ttm_tt_set_placement_caching(bo->ttm, new_mem->placement);
-	if (unlikely(r))
-		goto out_cleanup;
-	ttm_bo_assign_mem(bo, new_mem);
+	r = ttm_bo_cleanup_ram_move(bo, new_mem);
 out_cleanup:
 	ttm_resource_free(bo, &tmp_mem);
 	return r;
@@ -674,13 +670,8 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 		if (r)
 			return r;
 		amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
-		ttm_resource_free(bo, &bo->mem);
 
-		r = ttm_tt_set_placement_caching(bo->ttm, new_mem->placement);
-		if (r)
-			return r;
-		ttm_bo_assign_mem(bo, new_mem);
-		return 0;
+		return ttm_bo_cleanup_ram_move(bo, new_mem);
 	}
 
 	if (old_mem->mem_type == AMDGPU_PL_GDS ||
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 08beb92b0571..9b5acb7dae50 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -904,12 +904,8 @@ nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict,
 		goto out;
 
 	nouveau_ttm_tt_unbind(bo->bdev, bo->ttm);
-	ttm_resource_free(bo, &bo->mem);
 
-	ret = ttm_tt_set_placement_caching(bo->ttm, new_reg->placement);
-	if (ret)
-		goto out;
-	ttm_bo_assign_mem(bo, new_reg);
+	ret = ttm_bo_cleanup_ram_move(bo, new_reg);
 out:
 	ttm_resource_free(bo, &tmp_reg);
 	return ret;
@@ -1072,13 +1068,9 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 	if (old_reg->mem_type == TTM_PL_TT &&
 	    new_reg->mem_type == TTM_PL_SYSTEM) {
 		nouveau_ttm_tt_unbind(bo->bdev, bo->ttm);
-		ttm_resource_free(bo, &bo->mem);
 
-		ret = ttm_tt_set_placement_caching(bo->ttm, new_reg->placement);
-		if (ret)
-			goto out;
-		ttm_bo_assign_mem(bo, new_reg);
-		return 0;
+		ret = ttm_bo_cleanup_ram_move(bo, new_reg);
+		goto out;
 	}
 
 	/* Hardware assisted copy. */
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 6698e288cfbc..83ca0a519752 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -234,13 +234,8 @@ static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
 		goto out_cleanup;
 
 	radeon_ttm_tt_unbind(bo->bdev, bo->ttm);
-	ttm_resource_free(bo, &bo->mem);
-
-	r = ttm_tt_set_placement_caching(bo->ttm, new_mem->placement);
-	if (unlikely(r))
-		goto out_cleanup;
-	ttm_bo_assign_mem(bo, new_mem);
 
+	r = ttm_bo_cleanup_ram_move(bo, new_mem);
 out_cleanup:
 	ttm_resource_free(bo, &tmp_mem);
 	return r;
@@ -314,12 +309,8 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	if (old_mem->mem_type == TTM_PL_TT &&
 	    new_mem->mem_type == TTM_PL_SYSTEM) {
 		radeon_ttm_tt_unbind(bo->bdev, bo->ttm);
-		ttm_resource_free(bo, &bo->mem);
 
-		r = ttm_tt_set_placement_caching(bo->ttm, new_mem->placement);
-		if (r)
-			return r;
-		goto out_assign;
+		return ttm_bo_cleanup_ram_move(bo, new_mem);
 	}
 
 	if (!rdev->ring[radeon_copy_ring_index(rdev)].ready ||
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 7ea7ed85e289..a3955fde448b 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1573,3 +1573,18 @@ int ttm_bo_create_tt_tmp(struct ttm_buffer_object *bo,
 	return 0;
 }
 EXPORT_SYMBOL(ttm_bo_create_tt_tmp);
+
+int ttm_bo_cleanup_ram_move(struct ttm_buffer_object *bo,
+			    struct ttm_resource *new_mem)
+{
+	int ret;
+
+	ttm_resource_free(bo, &bo->mem);
+
+	ret = ttm_tt_set_placement_caching(bo->ttm, new_mem->placement);
+	if (ret)
+		return ret;
+	ttm_bo_assign_mem(bo, new_mem);
+	return 0;
+}
+EXPORT_SYMBOL(ttm_bo_cleanup_ram_move);
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index a7507dfaa89d..a89149b440b0 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -563,6 +563,9 @@ int ttm_bo_create_tt_tmp(struct ttm_buffer_object *bo,
 			 struct ttm_operation_ctx *ctx,
 			 struct ttm_resource *new_mem,
 			 struct ttm_resource *new_temp);
+
+int ttm_bo_cleanup_ram_move(struct ttm_buffer_object *bo,
+			    struct ttm_resource *new_mem);
 /**
  * ttm_bo_move_memcpy
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
