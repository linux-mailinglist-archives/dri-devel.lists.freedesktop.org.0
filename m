Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A14FD2922D8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 09:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3226E8E6;
	Mon, 19 Oct 2020 07:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC9E6E8E3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 07:13:26 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-0QZABGv1OJaakGbc8E1tQg-1; Mon, 19 Oct 2020 03:13:20 -0400
X-MC-Unique: 0QZABGv1OJaakGbc8E1tQg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2F5F8030B2;
 Mon, 19 Oct 2020 07:13:19 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE8B51A837;
 Mon, 19 Oct 2020 07:13:18 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/ttm: refactor out common code to setup a new tt
 backed resource
Date: Mon, 19 Oct 2020 17:13:10 +1000
Message-Id: <20201019071314.1671485-2-airlied@gmail.com>
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

This factors out the code to setup non-system tt.

The same code was used twice in the move paths.

Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c      | 12 +++--------
 drivers/gpu/drm/ttm/ttm_bo_util.c | 34 +++++++++++++++++++++----------
 include/drm/ttm/ttm_bo_driver.h   |  4 ++++
 3 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index b97ed6ca8765..cbc74a320db2 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -252,15 +252,9 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 		if (ret)
 			goto out_err;
 
-		if (mem->mem_type != TTM_PL_SYSTEM) {
-			ret = ttm_tt_populate(bdev, bo->ttm, ctx);
-			if (ret)
-				goto out_err;
-
-			ret = ttm_bo_tt_bind(bo, mem);
-			if (ret)
-				goto out_err;
-		}
+		ret = ttm_bo_move_to_new_tt_mem(bo, ctx, mem);
+		if (ret)
+			goto out_err;
 	}
 
 	if (bdev->driver->move_notify)
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index ed1114235b66..a36c615bdf24 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -45,11 +45,30 @@ struct ttm_transfer_obj {
 	struct ttm_buffer_object *bo;
 };
 
+int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
+			      struct ttm_operation_ctx *ctx,
+			      struct ttm_resource *new_mem)
+{
+	int ret;
+
+	if (new_mem->mem_type == TTM_PL_SYSTEM)
+		return 0;
+
+	ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
+	if (unlikely(ret != 0))
+		return ret;
+
+	ret = ttm_bo_tt_bind(bo, new_mem);
+	if (unlikely(ret != 0))
+		return ret;
+
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
 
@@ -67,16 +86,9 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 		old_mem->mem_type = TTM_PL_SYSTEM;
 	}
 
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
+	ret = ttm_bo_move_to_new_tt_mem(bo, ctx, new_mem);
+	if (unlikely(ret != 0))
+		return ret;
 
 	ttm_bo_assign_mem(bo, new_mem);
 	return 0;
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 3dbc11eb6787..1f4d2b1febd0 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -593,6 +593,10 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 		    struct ttm_operation_ctx *ctx,
 		    struct ttm_resource *new_mem);
 
+int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
+			      struct ttm_operation_ctx *ctx,
+			      struct ttm_resource *new_mem);
+
 /**
  * ttm_bo_move_memcpy
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
