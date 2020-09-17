Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D703C26D2B6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 06:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738716E0B7;
	Thu, 17 Sep 2020 04:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B80C6E0AF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 04:37:05 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-rWmeZ-lWMgWFTd9DNgLE9A-1; Thu, 17 Sep 2020 00:30:53 -0400
X-MC-Unique: rWmeZ-lWMgWFTd9DNgLE9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D7D357050;
 Thu, 17 Sep 2020 04:30:52 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-25.bne.redhat.com
 [10.64.54.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43AAF19D61;
 Thu, 17 Sep 2020 04:30:51 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] drm/ttm: make common function for wait/free node path.
Date: Thu, 17 Sep 2020 14:30:40 +1000
Message-Id: <20200917043040.146575-8-airlied@gmail.com>
In-Reply-To: <20200917043040.146575-1-airlied@gmail.com>
References: <20200917043040.146575-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0.001
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

The pipeline and accel cleansups has similiar paths here.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 38 ++++++++++++++++---------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 3c16e303d2e2..502d334786d2 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -526,6 +526,20 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map)
 }
 EXPORT_SYMBOL(ttm_bo_kunmap);
 
+static int ttm_bo_wait_free_node(struct ttm_buffer_object *bo,
+				 bool dst_use_tt)
+{
+	int ret;
+	ret = ttm_bo_wait(bo, false, false);
+	if (ret)
+		return ret;
+
+	if (!dst_use_tt)
+		ttm_bo_tt_destroy(bo);
+	ttm_bo_free_old_node(bo);
+	return 0;
+}
+
 static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
 				struct dma_fence *fence,
 				bool dst_use_tt)
@@ -577,19 +591,12 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 	int ret;
 
 	dma_resv_add_excl_fence(bo->base.resv, fence);
-	if (evict) {
-		ret = ttm_bo_wait(bo, false, false);
-		if (ret)
-			return ret;
-
-		if (!man->use_tt)
-			ttm_bo_tt_destroy(bo);
-		ttm_bo_free_old_node(bo);
-	} else {
+	if (evict)
+		ret = ttm_bo_wait_free_node(bo, man->use_tt);
+	else
 		ret = ttm_bo_move_to_ghost(bo, fence, man->use_tt);
-		if (ret)
-			return ret;
-	}
+	if (ret)
+		return ret;
 
 	ttm_bo_assign_mem(bo, new_mem);
 
@@ -639,14 +646,9 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
 		 *
 		 * Should never happen in pratice.
 		 */
-
-		ret = ttm_bo_wait(bo, false, false);
+		ret = ttm_bo_wait_free_node(bo, to->use_tt);
 		if (ret)
 			return ret;
-
-		if (!to->use_tt)
-			ttm_bo_tt_destroy(bo);
-		ttm_bo_free_old_node(bo);
 	}
 
 	ttm_bo_assign_mem(bo, new_mem);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
