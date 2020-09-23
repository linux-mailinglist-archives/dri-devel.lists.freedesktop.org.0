Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED3C274F5D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 05:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227CC6E40C;
	Wed, 23 Sep 2020 03:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348806E40D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 03:05:10 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-tMkKJ7StN12ip-gMylWebg-1; Tue, 22 Sep 2020 23:05:07 -0400
X-MC-Unique: tMkKJ7StN12ip-gMylWebg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41AC185C706;
 Wed, 23 Sep 2020 03:05:06 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47B2E5D9CC;
 Wed, 23 Sep 2020 03:05:05 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/10] drm/nouveau/ttm: plumb ctx through move functions.
Date: Wed, 23 Sep 2020 13:04:48 +1000
Message-Id: <20200923030454.362731-5-airlied@gmail.com>
In-Reply-To: <20200923030454.362731-1-airlied@gmail.com>
References: <20200923030454.362731-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

This just uses the ctx instead of passing bools and recreating it.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 48 +++++++++++++---------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index bcae4514952f..8a90b07f17a4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -772,8 +772,9 @@ nouveau_bo_move_prep(struct nouveau_drm *drm, struct ttm_buffer_object *bo,
 }
 
 static int
-nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
-		     bool no_wait_gpu, struct ttm_resource *new_reg)
+nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
+		     struct ttm_operation_ctx *ctx,
+		     struct ttm_resource *new_reg)
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct nouveau_channel *chan = drm->ttm.chan;
@@ -792,7 +793,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
 	}
 
 	mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
-	ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, intr);
+	ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, ctx->interruptible);
 	if (ret == 0) {
 		ret = drm->ttm.move(chan, bo, &bo->mem, new_reg);
 		if (ret == 0) {
@@ -879,10 +880,10 @@ nouveau_bo_move_init(struct nouveau_drm *drm)
 }
 
 static int
-nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict, bool intr,
-		      bool no_wait_gpu, struct ttm_resource *new_reg)
+nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict,
+		      struct ttm_operation_ctx *ctx,
+		      struct ttm_resource *new_reg)
 {
-	struct ttm_operation_ctx ctx = { intr, no_wait_gpu };
 	struct ttm_place placement_memtype = {
 		.fpfn = 0,
 		.lpfn = 0,
@@ -898,11 +899,11 @@ nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict, bool intr,
 
 	tmp_reg = *new_reg;
 	tmp_reg.mm_node = NULL;
-	ret = ttm_bo_mem_space(bo, &placement, &tmp_reg, &ctx);
+	ret = ttm_bo_mem_space(bo, &placement, &tmp_reg, ctx);
 	if (ret)
 		return ret;
 
-	ret = ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
+	ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
 	if (ret)
 		goto out;
 
@@ -910,21 +911,21 @@ nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict, bool intr,
 	if (ret)
 		goto out;
 
-	ret = nouveau_bo_move_m2mf(bo, true, intr, no_wait_gpu, &tmp_reg);
+	ret = nouveau_bo_move_m2mf(bo, true, ctx, &tmp_reg);
 	if (ret)
 		goto out;
 
-	ret = ttm_bo_move_ttm(bo, &ctx, new_reg);
+	ret = ttm_bo_move_ttm(bo, ctx, new_reg);
 out:
 	ttm_resource_free(bo, &tmp_reg);
 	return ret;
 }
 
 static int
-nouveau_bo_move_flips(struct ttm_buffer_object *bo, bool evict, bool intr,
-		      bool no_wait_gpu, struct ttm_resource *new_reg)
+nouveau_bo_move_flips(struct ttm_buffer_object *bo, bool evict,
+		      struct ttm_operation_ctx *ctx,
+		      struct ttm_resource *new_reg)
 {
-	struct ttm_operation_ctx ctx = { intr, no_wait_gpu };
 	struct ttm_place placement_memtype = {
 		.fpfn = 0,
 		.lpfn = 0,
@@ -940,15 +941,15 @@ nouveau_bo_move_flips(struct ttm_buffer_object *bo, bool evict, bool intr,
 
 	tmp_reg = *new_reg;
 	tmp_reg.mm_node = NULL;
-	ret = ttm_bo_mem_space(bo, &placement, &tmp_reg, &ctx);
+	ret = ttm_bo_mem_space(bo, &placement, &tmp_reg, ctx);
 	if (ret)
 		return ret;
 
-	ret = ttm_bo_move_ttm(bo, &ctx, &tmp_reg);
+	ret = ttm_bo_move_ttm(bo, ctx, &tmp_reg);
 	if (ret)
 		goto out;
 
-	ret = nouveau_bo_move_m2mf(bo, true, intr, no_wait_gpu, new_reg);
+	ret = nouveau_bo_move_m2mf(bo, true, ctx, new_reg);
 	if (ret)
 		goto out;
 
@@ -1059,17 +1060,14 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 	/* Hardware assisted copy. */
 	if (drm->ttm.move) {
 		if (new_reg->mem_type == TTM_PL_SYSTEM)
-			ret = nouveau_bo_move_flipd(bo, evict,
-						    ctx->interruptible,
-						    ctx->no_wait_gpu, new_reg);
+			ret = nouveau_bo_move_flipd(bo, evict, ctx,
+						    new_reg);
 		else if (old_reg->mem_type == TTM_PL_SYSTEM)
-			ret = nouveau_bo_move_flips(bo, evict,
-						    ctx->interruptible,
-						    ctx->no_wait_gpu, new_reg);
+			ret = nouveau_bo_move_flips(bo, evict, ctx,
+						    new_reg);
 		else
-			ret = nouveau_bo_move_m2mf(bo, evict,
-						   ctx->interruptible,
-						   ctx->no_wait_gpu, new_reg);
+			ret = nouveau_bo_move_m2mf(bo, evict, ctx,
+						   new_reg);
 		if (!ret)
 			goto out;
 	}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
