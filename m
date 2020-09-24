Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 745DC27684C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B08F6EA91;
	Thu, 24 Sep 2020 05:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0966F6EA8A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:42 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-XcnC-S_lOE6kq-E7mitFkA-1; Thu, 24 Sep 2020 01:19:37 -0400
X-MC-Unique: XcnC-S_lOE6kq-E7mitFkA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FFC71017DC1;
 Thu, 24 Sep 2020 05:19:36 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96E7E19D7C;
 Thu, 24 Sep 2020 05:19:35 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 33/45] drm/nouveau/ttm: switch to invalidate notify callback
Date: Thu, 24 Sep 2020 15:18:33 +1000
Message-Id: <20200924051845.397177-34-airlied@gmail.com>
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
 drivers/gpu/drm/nouveau/nouveau_bo.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 9e3fbe09a6d8..a032fdacf5f8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -992,8 +992,7 @@ nouveau_bo_vma_map_update(struct nouveau_bo *nvbo,
 }
 
 static void
-nouveau_bo_move_ntfy(struct ttm_buffer_object *bo, bool evict,
-		     struct ttm_resource *new_reg)
+nouveau_bo_invalidate_ntfy(struct ttm_buffer_object *bo)
 {
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
 
@@ -1001,10 +1000,6 @@ nouveau_bo_move_ntfy(struct ttm_buffer_object *bo, bool evict,
 	if (bo->destroy != nouveau_bo_del_ttm)
 		return;
 
-	/* handle new_reg path in move */
-	if (new_reg)
-		return;
-
 	nouveau_bo_del_io_reserve_lru(bo);
 
 	nouveau_bo_vma_map_update(nvbo, 0, NULL);
@@ -1439,7 +1434,7 @@ struct ttm_bo_driver nouveau_bo_driver = {
 	.ttm_tt_destroy = &nouveau_ttm_tt_destroy,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = nouveau_bo_evict_flags,
-	.move_notify = nouveau_bo_move_ntfy,
+	.invalidate_notify = nouveau_bo_invalidate_ntfy,
 	.move = nouveau_bo_move,
 	.verify_access = nouveau_bo_verify_access,
 	.fault_reserve_notify = &nouveau_ttm_fault_reserve_notify,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
