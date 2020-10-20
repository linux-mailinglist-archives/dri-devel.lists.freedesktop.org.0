Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B726F293295
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 03:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4D46EE5B;
	Tue, 20 Oct 2020 01:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F00E6EE53
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 01:03:33 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-dA3SQlmUM7u8Y6u7N6BEpg-1; Mon, 19 Oct 2020 21:03:29 -0400
X-MC-Unique: dA3SQlmUM7u8Y6u7N6BEpg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEAE01868417;
 Tue, 20 Oct 2020 01:03:28 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E767055784;
 Tue, 20 Oct 2020 01:03:27 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/ttm: remove move to new and inline into remainging
 place.
Date: Tue, 20 Oct 2020 11:03:17 +1000
Message-Id: <20201020010319.1692445-6-airlied@gmail.com>
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

This show the remaining bind callback, which my next series of
patches will aim to remove.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c      | 16 +++++++++-------
 drivers/gpu/drm/ttm/ttm_bo_util.c | 20 --------------------
 include/drm/ttm/ttm_bo_driver.h   |  4 ----
 3 files changed, 9 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 358d09ef852a..705ea3ef91f9 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -252,9 +252,15 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 		if (ret)
 			goto out_err;
 
-		ret = ttm_bo_move_to_new_tt_mem(bo, ctx, mem);
-		if (ret)
-			goto out_err;
+		if (mem->mem_type != TTM_PL_SYSTEM) {
+			ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
+			if (ret)
+				goto out_err;
+
+			ret = bdev->driver->ttm_tt_bind(bo->bdev, bo->ttm, mem);
+			if (ret)
+				goto out_err;
+		}
 	}
 
 	if (bdev->driver->move_notify)
@@ -1489,7 +1495,3 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
 	bo->ttm = NULL;
 }
 
-int ttm_bo_tt_bind(struct ttm_buffer_object *bo, struct ttm_resource *mem)
-{
-	return bo->bdev->driver->ttm_tt_bind(bo->bdev, bo->ttm, mem);
-}
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 21811bbda2e4..fae31f7f5c35 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -45,26 +45,6 @@ struct ttm_transfer_obj {
 	struct ttm_buffer_object *bo;
 };
 
-int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
-			      struct ttm_operation_ctx *ctx,
-			      struct ttm_resource *new_mem)
-{
-	int ret;
-
-	if (new_mem->mem_type == TTM_PL_SYSTEM)
-		return 0;
-
-	ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
-	if (unlikely(ret != 0))
-		return ret;
-
-	ret = ttm_bo_tt_bind(bo, new_mem);
-	if (unlikely(ret != 0))
-		return ret;
-
-	return 0;
-}
-
 int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
 		       struct ttm_resource *mem)
 {
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index fbbcf10670c1..0c4efc169f46 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -560,10 +560,6 @@ int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
 void ttm_mem_io_free(struct ttm_bo_device *bdev,
 		     struct ttm_resource *mem);
 
-int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
-			      struct ttm_operation_ctx *ctx,
-			      struct ttm_resource *new_mem);
-
 /**
  * ttm_bo_move_memcpy
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
