Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C46F2922DA
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 09:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B8D6E8EA;
	Mon, 19 Oct 2020 07:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60706E8E9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 07:13:31 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-kZiIvR2lN5K-IRCTFA2s2w-1; Mon, 19 Oct 2020 03:13:26 -0400
X-MC-Unique: kZiIvR2lN5K-IRCTFA2s2w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0087E18A8220;
 Mon, 19 Oct 2020 07:13:25 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C1B81992D;
 Mon, 19 Oct 2020 07:13:23 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/ttm: drop ttm_bo_move_ttm wrapper
Date: Mon, 19 Oct 2020 17:13:14 +1000
Message-Id: <20201019071314.1671485-6-airlied@gmail.com>
In-Reply-To: <20201019071314.1671485-1-airlied@gmail.com>
References: <20201019071314.1671485-1-airlied@gmail.com>
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
Cc: christian.koenig@amd.com, rscheidegger.oss@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

The apis to move old/new are in place everywhere so this is no
longer needed.
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 20 --------------------
 include/drm/ttm/ttm_bo_driver.h   | 22 ----------------------
 2 files changed, 42 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 1c1055a500cd..a3132e8a4102 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -89,26 +89,6 @@ int ttm_bo_move_old_to_system(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_move_old_to_system);
 
-int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
-		   struct ttm_operation_ctx *ctx,
-		    struct ttm_resource *new_mem)
-{
-	struct ttm_resource *old_mem = &bo->mem;
-	int ret;
-
-	ret = ttm_bo_move_old_to_system(bo, ctx);
-	if (unlikely(ret != 0))
-		return ret;
-
-	ret = ttm_bo_move_to_new_tt_mem(bo, ctx, new_mem);
-	if (unlikely(ret != 0))
-		return ret;
-
-	ttm_bo_assign_mem(bo, new_mem);
-	return 0;
-}
-EXPORT_SYMBOL(ttm_bo_move_ttm);
-
 int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
 		       struct ttm_resource *mem)
 {
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 4b341914858b..2fbd9adc1645 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -566,32 +566,10 @@ static inline void ttm_bo_unreserve(struct ttm_buffer_object *bo)
 /*
  * ttm_bo_util.c
  */
-
 int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
 		       struct ttm_resource *mem);
 void ttm_mem_io_free(struct ttm_bo_device *bdev,
 		     struct ttm_resource *mem);
-/**
- * ttm_bo_move_ttm
- *
- * @bo: A pointer to a struct ttm_buffer_object.
- * @interruptible: Sleep interruptible if waiting.
- * @no_wait_gpu: Return immediately if the GPU is busy.
- * @new_mem: struct ttm_resource indicating where to move.
- *
- * Optimized move function for a buffer object with both old and
- * new placement backed by a TTM. The function will, if successful,
- * free any old aperture space, and set (@new_mem)->mm_node to NULL,
- * and update the (@bo)->mem placement flags. If unsuccessful, the old
- * data remains untouched, and it's up to the caller to free the
- * memory space indicated by @new_mem.
- * Returns:
- * !0: Failure.
- */
-
-int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
-		    struct ttm_operation_ctx *ctx,
-		    struct ttm_resource *new_mem);
 
 int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
 			      struct ttm_operation_ctx *ctx,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
