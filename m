Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E809276834
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62C36EA70;
	Thu, 24 Sep 2020 05:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DAB6EA70
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:11 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-MoxWkvwXMPiKtb_TMqaGzA-1; Thu, 24 Sep 2020 01:19:05 -0400
X-MC-Unique: MoxWkvwXMPiKtb_TMqaGzA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EF951891E80;
 Thu, 24 Sep 2020 05:19:04 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9435C19652;
 Thu, 24 Sep 2020 05:19:03 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/45] drm/ttm: split out the move to system from move ttm code
Date: Thu, 24 Sep 2020 15:18:11 +1000
Message-Id: <20200924051845.397177-12-airlied@gmail.com>
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
 drivers/gpu/drm/ttm/ttm_bo_util.c | 39 ++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index aecdb2d92a54..0ad02e27865d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -73,27 +73,38 @@ int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
 	return 0;
 }
 
-int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
-		   struct ttm_operation_ctx *ctx,
-		    struct ttm_resource *new_mem)
+static int ttm_bo_move_old_to_system(struct ttm_buffer_object *bo,
+				     struct ttm_operation_ctx *ctx)
 {
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
+	if (old_mem->mem_type == TTM_PL_SYSTEM)
+		return 0;
 
-		ttm_bo_tt_unbind(bo);
-		ttm_bo_free_old_node(bo);
-		old_mem->mem_type = TTM_PL_SYSTEM;
+	ret = ttm_bo_wait_ctx(bo, ctx);
+	if (unlikely(ret != 0)) {
+		if (ret != -ERESTARTSYS)
+			pr_err("Failed to expire sync object before unbinding TTM\n");
+		return ret;
 	}
 
+	ttm_bo_tt_unbind(bo);
+	ttm_bo_free_old_node(bo);
+	old_mem->mem_type = TTM_PL_SYSTEM;
+	return 0;
+}
+
+int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
+		   struct ttm_operation_ctx *ctx,
+		    struct ttm_resource *new_mem)
+{
+	int ret;
+
+	ret = ttm_bo_move_old_to_system(bo, ctx);
+	if (ret)
+		return ret;
+
 	ret = ttm_bo_move_to_new_tt_mem(bo, ctx, new_mem);
 	if (ret)
 		return ret;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
