Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA742922D6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 09:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAA56E8E3;
	Mon, 19 Oct 2020 07:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5D46E8E2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 07:13:26 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-bn00AxmPN02WW7N3bfdpHQ-1; Mon, 19 Oct 2020 03:13:22 -0400
X-MC-Unique: bn00AxmPN02WW7N3bfdpHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D14064140;
 Mon, 19 Oct 2020 07:13:21 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 169FA1A837;
 Mon, 19 Oct 2020 07:13:19 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/ttm: split out the move to system from move ttm code
Date: Mon, 19 Oct 2020 17:13:11 +1000
Message-Id: <20201019071314.1671485-3-airlied@gmail.com>
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

Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 38 ++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index a36c615bdf24..29726652fef7 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -65,6 +65,28 @@ int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
 	return 0;
 }
 
+static int ttm_bo_move_old_to_system(struct ttm_buffer_object *bo,
+				     struct ttm_operation_ctx *ctx)
+{
+	struct ttm_resource *old_mem = &bo->mem;
+	int ret;
+
+	if (old_mem->mem_type == TTM_PL_SYSTEM)
+		return 0;
+
+	ret = ttm_bo_wait_ctx(bo, ctx);
+	if (unlikely(ret != 0)) {
+		if (ret != -ERESTARTSYS)
+			pr_err("Failed to expire sync object before unbinding TTM\n");
+		return ret;
+	}
+
+	ttm_bo_tt_unbind(bo);
+	ttm_resource_free(bo, &bo->mem);
+	old_mem->mem_type = TTM_PL_SYSTEM;
+	return 0;
+}
+
 int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 		   struct ttm_operation_ctx *ctx,
 		    struct ttm_resource *new_mem)
@@ -72,19 +94,9 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 	struct ttm_resource *old_mem = &bo->mem;
 	int ret;
 
-	if (old_mem->mem_type != TTM_PL_SYSTEM) {
-		ret = ttm_bo_wait_ctx(bo, ctx);
-
-		if (unlikely(ret != 0)) {
-			if (ret != -ERESTARTSYS)
-				pr_err("Failed to expire sync object before unbinding TTM\n");
-			return ret;
-		}
-
-		ttm_bo_tt_unbind(bo);
-		ttm_resource_free(bo, &bo->mem);
-		old_mem->mem_type = TTM_PL_SYSTEM;
-	}
+	ret = ttm_bo_move_old_to_system(bo, ctx);
+	if (unlikely(ret != 0))
+		return ret;
 
 	ret = ttm_bo_move_to_new_tt_mem(bo, ctx, new_mem);
 	if (unlikely(ret != 0))
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
