Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5295276833
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BF16EA76;
	Thu, 24 Sep 2020 05:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5BD89D73
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:11 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-0R-05VKKOmyrhe-JrP3d7A-1; Thu, 24 Sep 2020 01:19:04 -0400
X-MC-Unique: 0R-05VKKOmyrhe-JrP3d7A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B19E85EE95;
 Thu, 24 Sep 2020 05:19:03 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41F8F19D7C;
 Thu, 24 Sep 2020 05:19:02 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/45] drm/ttm: refactor out common code to setup a new tt
 backed resource
Date: Thu, 24 Sep 2020 15:18:10 +1000
Message-Id: <20200924051845.397177-11-airlied@gmail.com>
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

This factors out the code to set the new caching and for non-system
tt populate and bind things.

The same code was used twice in the move paths.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c      | 12 +---------
 drivers/gpu/drm/ttm/ttm_bo_util.c | 40 +++++++++++++++++++------------
 include/drm/ttm/ttm_bo_driver.h   |  3 +++
 3 files changed, 29 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 6a7f4c028801..c8dffc8b40fc 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -252,19 +252,9 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 		if (ret)
 			goto out_err;
 
-		ret = ttm_tt_set_placement_caching(bo->ttm, mem->placement);
+		ret = ttm_bo_move_to_new_tt_mem(bo, ctx, mem);
 		if (ret)
 			goto out_err;
-
-		if (mem->mem_type != TTM_PL_SYSTEM) {
-			ret = ttm_tt_populate(bdev, bo->ttm, ctx);
-			if (ret)
-				goto out_err;
-
-			ret = ttm_bo_tt_bind(bo, mem);
-			if (ret)
-				goto out_err;
-		}
 	}
 
 	if (bdev->driver->move_notify)
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index bdee4df1f3f2..aecdb2d92a54 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -50,11 +50,33 @@ void ttm_bo_free_old_node(struct ttm_buffer_object *bo)
 	ttm_resource_free(bo, &bo->mem);
 }
 
+int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
+			      struct ttm_operation_ctx *ctx,
+			      struct ttm_resource *new_mem)
+{
+	struct ttm_tt *ttm = bo->ttm;
+	int ret;
+
+	ret = ttm_tt_set_placement_caching(ttm, new_mem->placement);
+	if (unlikely(ret != 0))
+		return ret;
+
+	if (new_mem->mem_type != TTM_PL_SYSTEM) {
+		ret = ttm_tt_populate(bo->bdev, ttm, ctx);
+		if (unlikely(ret != 0))
+			return ret;
+
+		ret = ttm_bo_tt_bind(bo, new_mem);
+		if (unlikely(ret != 0))
+			return ret;
+	}
+	return 0;
+}
+
 int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 		   struct ttm_operation_ctx *ctx,
 		    struct ttm_resource *new_mem)
 {
-	struct ttm_tt *ttm = bo->ttm;
 	struct ttm_resource *old_mem = &bo->mem;
 	int ret;
 
@@ -72,21 +94,9 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 		old_mem->mem_type = TTM_PL_SYSTEM;
 	}
 
-	ret = ttm_tt_set_placement_caching(ttm, new_mem->placement);
-	if (unlikely(ret != 0))
+	ret = ttm_bo_move_to_new_tt_mem(bo, ctx, new_mem);
+	if (ret)
 		return ret;
-
-	if (new_mem->mem_type != TTM_PL_SYSTEM) {
-
-		ret = ttm_tt_populate(bo->bdev, ttm, ctx);
-		if (unlikely(ret != 0))
-			return ret;
-
-		ret = ttm_bo_tt_bind(bo, new_mem);
-		if (unlikely(ret != 0))
-			return ret;
-	}
-
 	ttm_bo_assign_mem(bo, new_mem);
 	return 0;
 }
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 864afa8f6f18..20e6839e9b73 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -605,6 +605,9 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 		    struct ttm_operation_ctx *ctx,
 		    struct ttm_resource *new_mem);
 
+int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
+			      struct ttm_operation_ctx *ctx,
+			      struct ttm_resource *new_mem);
 /**
  * ttm_bo_move_memcpy
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
