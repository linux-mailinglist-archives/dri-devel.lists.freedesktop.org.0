Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09135274F5F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 05:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47536E413;
	Wed, 23 Sep 2020 03:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A916E413
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 03:05:12 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-mG17yX-BNtCH_HmbEEFR3g-1; Tue, 22 Sep 2020 23:05:05 -0400
X-MC-Unique: mG17yX-BNtCH_HmbEEFR3g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1A7410082E8;
 Wed, 23 Sep 2020 03:05:04 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61EB95D9CC;
 Wed, 23 Sep 2020 03:05:01 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/10] drm/radeon: cleanup ttm operation ctx usage.
Date: Wed, 23 Sep 2020 13:04:47 +1000
Message-Id: <20200923030454.362731-4-airlied@gmail.com>
In-Reply-To: <20200923030454.362731-1-airlied@gmail.com>
References: <20200923030454.362731-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Just pass it around move, and remove unused pieces

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 34 +++++++++++++----------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 085f58e833d8..9ff8c81d7784 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -151,7 +151,7 @@ static int radeon_verify_access(struct ttm_buffer_object *bo, struct file *filp)
 }
 
 static int radeon_move_blit(struct ttm_buffer_object *bo,
-			bool evict, bool no_wait_gpu,
+			bool evict,
 			struct ttm_resource *new_mem,
 			struct ttm_resource *old_mem)
 {
@@ -206,11 +206,10 @@ static int radeon_move_blit(struct ttm_buffer_object *bo,
 }
 
 static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
-				bool evict, bool interruptible,
-				bool no_wait_gpu,
+				bool evict,
+				struct ttm_operation_ctx *ctx,
 				struct ttm_resource *new_mem)
 {
-	struct ttm_operation_ctx ctx = { interruptible, no_wait_gpu };
 	struct ttm_resource *old_mem = &bo->mem;
 	struct ttm_resource tmp_mem;
 	struct ttm_place placements;
@@ -227,7 +226,7 @@ static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
 	placements.lpfn = 0;
 	placements.mem_type = TTM_PL_TT;
 	placements.flags = TTM_PL_MASK_CACHING;
-	r = ttm_bo_mem_space(bo, &placement, &tmp_mem, &ctx);
+	r = ttm_bo_mem_space(bo, &placement, &tmp_mem, ctx);
 	if (unlikely(r)) {
 		return r;
 	}
@@ -237,7 +236,7 @@ static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
 		goto out_cleanup;
 	}
 
-	r = ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
+	r = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
@@ -246,22 +245,21 @@ static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
-	r = radeon_move_blit(bo, true, no_wait_gpu, &tmp_mem, old_mem);
+	r = radeon_move_blit(bo, true, &tmp_mem, old_mem);
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
-	r = ttm_bo_move_ttm(bo, &ctx, new_mem);
+	r = ttm_bo_move_ttm(bo, ctx, new_mem);
 out_cleanup:
 	ttm_resource_free(bo, &tmp_mem);
 	return r;
 }
 
 static int radeon_move_ram_vram(struct ttm_buffer_object *bo,
-				bool evict, bool interruptible,
-				bool no_wait_gpu,
+				bool evict,
+				struct ttm_operation_ctx *ctx,
 				struct ttm_resource *new_mem)
 {
-	struct ttm_operation_ctx ctx = { interruptible, no_wait_gpu };
 	struct ttm_resource *old_mem = &bo->mem;
 	struct ttm_resource tmp_mem;
 	struct ttm_placement placement;
@@ -278,15 +276,15 @@ static int radeon_move_ram_vram(struct ttm_buffer_object *bo,
 	placements.lpfn = 0;
 	placements.mem_type = TTM_PL_TT;
 	placements.flags = TTM_PL_MASK_CACHING;
-	r = ttm_bo_mem_space(bo, &placement, &tmp_mem, &ctx);
+	r = ttm_bo_mem_space(bo, &placement, &tmp_mem, ctx);
 	if (unlikely(r)) {
 		return r;
 	}
-	r = ttm_bo_move_ttm(bo, &ctx, &tmp_mem);
+	r = ttm_bo_move_ttm(bo, ctx, &tmp_mem);
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
-	r = radeon_move_blit(bo, true, no_wait_gpu, new_mem, old_mem);
+	r = radeon_move_blit(bo, true, new_mem, old_mem);
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
@@ -334,14 +332,12 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 	if (old_mem->mem_type == TTM_PL_VRAM &&
 	    new_mem->mem_type == TTM_PL_SYSTEM) {
-		r = radeon_move_vram_ram(bo, evict, ctx->interruptible,
-					ctx->no_wait_gpu, new_mem);
+		r = radeon_move_vram_ram(bo, evict, ctx, new_mem);
 	} else if (old_mem->mem_type == TTM_PL_SYSTEM &&
 		   new_mem->mem_type == TTM_PL_VRAM) {
-		r = radeon_move_ram_vram(bo, evict, ctx->interruptible,
-					    ctx->no_wait_gpu, new_mem);
+		r = radeon_move_ram_vram(bo, evict, ctx, new_mem);
 	} else {
-		r = radeon_move_blit(bo, evict, ctx->no_wait_gpu,
+		r = radeon_move_blit(bo, evict,
 				     new_mem, old_mem);
 	}
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
