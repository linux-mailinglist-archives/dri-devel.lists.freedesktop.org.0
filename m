Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7D8276836
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FB46EA78;
	Thu, 24 Sep 2020 05:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86DA6EA80
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:20 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-Fi8ior4oNpqm4Gev5KdNbQ-1; Thu, 24 Sep 2020 01:19:17 -0400
X-MC-Unique: Fi8ior4oNpqm4Gev5KdNbQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB9AB1091066;
 Thu, 24 Sep 2020 05:19:16 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F128919930;
 Thu, 24 Sep 2020 05:19:15 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 20/45] drm/vmwgfx/ttm: handle move notify inside move.
Date: Thu, 24 Sep 2020 15:18:20 +1000
Message-Id: <20200924051845.397177-21-airlied@gmail.com>
In-Reply-To: <20200924051845.397177-1-airlied@gmail.com>
References: <20200924051845.397177-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
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

This means move notify isn't used for the cleanup path, since
mem would be NULL, so the callback can be removed

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 6e36fc932aeb..d3262e07e76d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -704,11 +704,8 @@ static int vmw_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_resourc
  * (currently only resources).
  */
 static void vmw_move_notify(struct ttm_buffer_object *bo,
-			    bool evict,
 			    struct ttm_resource *mem)
 {
-	if (!mem)
-		return;
 	vmw_bo_move_notify(bo, mem);
 	vmw_query_move_notify(bo, mem);
 }
@@ -732,15 +729,21 @@ static int vmw_move(struct ttm_buffer_object *bo,
 {
 	struct ttm_resource_manager *old_man = ttm_manager_type(bo->bdev, bo->mem.mem_type);
 	struct ttm_resource_manager *new_man = ttm_manager_type(bo->bdev, new_mem->mem_type);
+	int ret;
 
+	vmw_move_notify(bo, new_mem);
 	if (old_man->use_tt && new_man->use_tt) {
 		if (bo->mem.mem_type == TTM_PL_SYSTEM) {
 			ttm_bo_assign_mem(bo, new_mem);
 			return 0;
 		}
-		return ttm_bo_move_ttm(bo, ctx, new_mem);
+		ret = ttm_bo_move_ttm(bo, ctx, new_mem);
 	} else
-		return ttm_bo_move_memcpy(bo, ctx, new_mem);
+		ret = ttm_bo_move_memcpy(bo, ctx, new_mem);
+
+	if (ret)
+		vmw_move_notify(bo, &bo->mem);
+	return ret;
 }
 
 struct ttm_bo_driver vmw_bo_driver = {
@@ -754,7 +757,6 @@ struct ttm_bo_driver vmw_bo_driver = {
 	.evict_flags = vmw_evict_flags,
 	.move = vmw_move,
 	.verify_access = vmw_verify_access,
-	.move_notify = vmw_move_notify,
 	.swap_notify = vmw_swap_notify,
 	.io_mem_reserve = &vmw_ttm_io_mem_reserve,
 };
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
