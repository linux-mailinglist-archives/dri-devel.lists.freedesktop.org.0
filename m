Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB80A276849
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128066EA93;
	Thu, 24 Sep 2020 05:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D266EA89
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:49 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-6KpwY0kCOMSO5R21vs7yVA-1; Thu, 24 Sep 2020 01:19:44 -0400
X-MC-Unique: 6KpwY0kCOMSO5R21vs7yVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 404221091066;
 Thu, 24 Sep 2020 05:19:43 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44DE119D7C;
 Thu, 24 Sep 2020 05:19:42 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 38/45] drm/nouveau/ttm: use helper to allocate tt temp
Date: Thu, 24 Sep 2020 15:18:38 +1000
Message-Id: <20200924051845.397177-39-airlied@gmail.com>
In-Reply-To: <20200924051845.397177-1-airlied@gmail.com>
References: <20200924051845.397177-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 30 +++-------------------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index a032fdacf5f8..93f24b828ede 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -884,28 +884,16 @@ nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict,
 		      struct ttm_operation_ctx *ctx,
 		      struct ttm_resource *new_reg)
 {
-	struct ttm_place placement_memtype = {
-		.fpfn = 0,
-		.lpfn = 0,
-		.mem_type = TTM_PL_TT,
-		.flags = TTM_PL_MASK_CACHING
-	};
-	struct ttm_placement placement;
 	struct ttm_resource tmp_reg;
 	int ret;
 
-	placement.num_placement = placement.num_busy_placement = 1;
-	placement.placement = placement.busy_placement = &placement_memtype;
-
-	tmp_reg = *new_reg;
-	tmp_reg.mm_node = NULL;
-	ret = ttm_bo_mem_space(bo, &placement, &tmp_reg, ctx);
+	ret = ttm_bo_create_tt_tmp(bo, ctx, new_reg, &tmp_reg);
 	if (ret)
 		return ret;
 
 	ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
 	if (ret)
-		goto out;
+		return ret;
 
 	ret = nouveau_ttm_tt_bind(bo->bdev, bo->ttm, &tmp_reg);
 	if (ret)
@@ -936,22 +924,10 @@ nouveau_bo_move_flips(struct ttm_buffer_object *bo, bool evict,
 		      struct ttm_operation_ctx *ctx,
 		      struct ttm_resource *new_reg)
 {
-	struct ttm_place placement_memtype = {
-		.fpfn = 0,
-		.lpfn = 0,
-		.mem_type = TTM_PL_TT,
-		.flags = TTM_PL_MASK_CACHING
-	};
-	struct ttm_placement placement;
 	struct ttm_resource tmp_reg;
 	int ret;
 
-	placement.num_placement = placement.num_busy_placement = 1;
-	placement.placement = placement.busy_placement = &placement_memtype;
-
-	tmp_reg = *new_reg;
-	tmp_reg.mm_node = NULL;
-	ret = ttm_bo_mem_space(bo, &placement, &tmp_reg, ctx);
+	ret = ttm_bo_create_tt_tmp(bo, ctx, new_reg, &tmp_reg);
 	if (ret)
 		return ret;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
