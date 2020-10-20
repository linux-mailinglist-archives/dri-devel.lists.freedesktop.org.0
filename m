Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DB6293290
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 03:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B08F6EE52;
	Tue, 20 Oct 2020 01:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DFE6EE52
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 01:03:28 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-Rhbv2KhINMeEfd67DF-QJQ-1; Mon, 19 Oct 2020 21:03:25 -0400
X-MC-Unique: Rhbv2KhINMeEfd67DF-QJQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3681810066FB;
 Tue, 20 Oct 2020 01:03:24 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FC9455775;
 Tue, 20 Oct 2020 01:03:23 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] drm/ttm: move some move binds into the drivers
Date: Tue, 20 Oct 2020 11:03:13 +1000
Message-Id: <20201020010319.1692445-2-airlied@gmail.com>
In-Reply-To: <20201020010319.1692445-1-airlied@gmail.com>
References: <20201020010319.1692445-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This just gives the driver control over some of the bind paths.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  7 ++++++-
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 10 +++++++---
 drivers/gpu/drm/radeon/radeon_ttm.c     | 11 ++++++++---
 drivers/gpu/drm/ttm/ttm_bo_util.c       |  1 -
 4 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 91b20aa2294d..4af4891264e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -605,10 +605,15 @@ static int amdgpu_move_ram_vram(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	/* move/bind old memory to GTT space */
-	r = ttm_bo_move_to_new_tt_mem(bo, ctx, &tmp_mem);
+	r = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
+	if (unlikely(r))
+		return r;
+
+	r = amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, &tmp_mem);
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
+
 	ttm_bo_assign_mem(bo, &tmp_mem);
 	/* copy to VRAM */
 	r = amdgpu_move_blit(bo, evict, new_mem, old_mem);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index fec7a901865e..7e604340b780 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -931,9 +931,13 @@ nouveau_bo_move_flips(struct ttm_buffer_object *bo, bool evict,
 	if (ret)
 		return ret;
 
-	ret = ttm_bo_move_to_new_tt_mem(bo, ctx, &tmp_reg);
-	if (ret)
-		goto out;
+	ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
+	if (unlikely(ret != 0))
+		return ret;
+
+	ret = nouveau_ttm_tt_bind(bo->bdev, bo->ttm, &tmp_reg);
+	if (unlikely(ret != 0))
+		return ret;
 
 	ttm_bo_assign_mem(bo, &tmp_reg);
 	ret = nouveau_bo_move_m2mf(bo, true, ctx, new_reg);
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index ec713f0e55e5..24ef25665249 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -279,10 +279,15 @@ static int radeon_move_ram_vram(struct ttm_buffer_object *bo,
 	if (unlikely(r)) {
 		return r;
 	}
-	r = ttm_bo_move_to_new_tt_mem(bo, ctx, &tmp_mem);
-	if (unlikely(r)) {
+
+	r = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
+	if (unlikely(r))
 		goto out_cleanup;
-	}
+
+	r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem);
+	if (unlikely(r))
+		goto out_cleanup;
+
 	ttm_bo_assign_mem(bo, &tmp_mem);
 	r = radeon_move_blit(bo, true, new_mem, old_mem);
 	if (unlikely(r)) {
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index e4bd381a8962..c8ca6694cc1c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -64,7 +64,6 @@ int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
 
 	return 0;
 }
-EXPORT_SYMBOL(ttm_bo_move_to_new_tt_mem);
 
 int ttm_bo_move_to_system(struct ttm_buffer_object *bo,
 			  struct ttm_operation_ctx *ctx)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
