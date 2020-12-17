Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3D42DD9AF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 21:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFE289933;
	Thu, 17 Dec 2020 20:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB10489933
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 20:10:56 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-C_6Q5mkdNAKdhZo--yF_yA-1; Thu, 17 Dec 2020 15:09:46 -0500
X-MC-Unique: C_6Q5mkdNAKdhZo--yF_yA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E829557203
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 20:09:45 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.32.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A97960BE5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 20:09:45 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: fix multihop when move doesn't work.
Date: Fri, 18 Dec 2020 06:09:43 +1000
Message-Id: <20201217200943.30511-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

As per the radeon/amdgpu fix don't use multihop is hw moves
aren't enabled.

Reported-by: Mike Galbraith <efault@gmx.de>
Tested-by: Mike Galbraith <efault@gmx.de>
Fixes: 0c8c0659d74 ("drm/nouveau/ttm: use multihop")
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 31 ++++++++++++++--------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 1386b0fc1640..c85b1af06b7b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -942,16 +942,6 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 	struct nouveau_drm_tile *new_tile = NULL;
 	int ret = 0;
 
-	if ((old_reg->mem_type == TTM_PL_SYSTEM &&
-	     new_reg->mem_type == TTM_PL_VRAM) ||
-	    (old_reg->mem_type == TTM_PL_VRAM &&
-	     new_reg->mem_type == TTM_PL_SYSTEM)) {
-		hop->fpfn = 0;
-		hop->lpfn = 0;
-		hop->mem_type = TTM_PL_TT;
-		hop->flags = 0;
-		return -EMULTIHOP;
-	}
 
 	if (new_reg->mem_type == TTM_PL_TT) {
 		ret = nouveau_ttm_tt_bind(bo->bdev, bo->ttm, new_reg);
@@ -995,14 +985,25 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 	/* Hardware assisted copy. */
 	if (drm->ttm.move) {
+		if ((old_reg->mem_type == TTM_PL_SYSTEM &&
+		     new_reg->mem_type == TTM_PL_VRAM) ||
+		    (old_reg->mem_type == TTM_PL_VRAM &&
+		     new_reg->mem_type == TTM_PL_SYSTEM)) {
+			hop->fpfn = 0;
+			hop->lpfn = 0;
+			hop->mem_type = TTM_PL_TT;
+			hop->flags = 0;
+			return -EMULTIHOP;
+		}
 		ret = nouveau_bo_move_m2mf(bo, evict, ctx,
 					   new_reg);
-		if (!ret)
-			goto out;
-	}
+	} else
+		ret = -ENODEV;
 
-	/* Fallback to software copy. */
-	ret = ttm_bo_move_memcpy(bo, ctx, new_reg);
+	if (ret) {
+		/* Fallback to software copy. */
+		ret = ttm_bo_move_memcpy(bo, ctx, new_reg);
+	}
 
 out:
 	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
