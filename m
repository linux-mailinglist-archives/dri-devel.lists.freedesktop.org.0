Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF43727683E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63936EA7C;
	Thu, 24 Sep 2020 05:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5F66EA7A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:35 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-v2YfdwX5O9uYXf250IyTMQ-1; Thu, 24 Sep 2020 01:19:32 -0400
X-MC-Unique: v2YfdwX5O9uYXf250IyTMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39E831017DC3;
 Thu, 24 Sep 2020 05:19:31 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 109E119D7C;
 Thu, 24 Sep 2020 05:19:27 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 29/45] drm/ttm: don't expose move old to system helper to
 drivers.
Date: Thu, 24 Sep 2020 15:18:29 +1000
Message-Id: <20200924051845.397177-30-airlied@gmail.com>
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

This is just used internally by fallback paths.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 22 ----------------------
 include/drm/ttm/ttm_bo_driver.h   |  2 --
 2 files changed, 24 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 05768decb24c..e9a10f5280b6 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -66,28 +66,6 @@ int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_move_to_new_tt_mem);
 
-int ttm_bo_move_old_to_system(struct ttm_buffer_object *bo,
-			      struct ttm_operation_ctx *ctx)
-{
-	struct ttm_resource *old_mem = &bo->mem;
-	int ret;
-
-	if (old_mem->mem_type == TTM_PL_SYSTEM)
-		return 0;
-
-	ret = ttm_bo_wait_ctx(bo, ctx);
-	if (unlikely(ret != 0)) {
-		if (ret != -ERESTARTSYS)
-			pr_err("Failed to expire sync object before unbinding TTM\n");
-		return ret;
-	}
-
-	ttm_resource_free(bo, &bo->mem);
-	old_mem->mem_type = TTM_PL_SYSTEM;
-	return 0;
-}
-EXPORT_SYMBOL(ttm_bo_move_old_to_system);
-
 int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
 		       struct ttm_resource *mem)
 {
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index e400dbd2a143..cfb151dbb2d0 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -559,8 +559,6 @@ int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
 void ttm_mem_io_free(struct ttm_bo_device *bdev,
 		     struct ttm_resource *mem);
 
-int ttm_bo_move_old_to_system(struct ttm_buffer_object *bo,
-			      struct ttm_operation_ctx *ctx);
 int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
 			      struct ttm_operation_ctx *ctx,
 			      struct ttm_resource *new_mem);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
