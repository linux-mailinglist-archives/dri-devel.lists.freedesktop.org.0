Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039F4276847
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677E36EA8F;
	Thu, 24 Sep 2020 05:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F466EA82
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:40 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-W_IJzn3NOpWA3owyPMUqpw-1; Thu, 24 Sep 2020 01:19:34 -0400
X-MC-Unique: W_IJzn3NOpWA3owyPMUqpw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E05CB1891E80;
 Thu, 24 Sep 2020 05:19:33 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5D8119D7C;
 Thu, 24 Sep 2020 05:19:32 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 31/45] drm/radeon: switch to invalidate notify callback
Date: Thu, 24 Sep 2020 15:18:31 +1000
Message-Id: <20200924051845.397177-32-airlied@gmail.com>
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
 drivers/gpu/drm/radeon/radeon_object.c | 7 +------
 drivers/gpu/drm/radeon/radeon_object.h | 4 +---
 drivers/gpu/drm/radeon/radeon_ttm.c    | 2 +-
 3 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 36a16d7a24b2..44e2e7475dfe 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -769,18 +769,13 @@ void radeon_bo_memory_usage(struct radeon_bo *rbo,
 	radeon_update_memory_usage(rbo, new_mem_type, 1);
 }
 
-void radeon_bo_move_notify(struct ttm_buffer_object *bo,
-			   bool evict,
-			   struct ttm_resource *new_mem)
+void radeon_bo_invalidate_notify(struct ttm_buffer_object *bo)
 {
 	struct radeon_bo *rbo;
 
 	if (!radeon_ttm_bo_is_radeon_bo(bo))
 		return;
 
-	/* the new_mem path is handled via the move callback now */
-	if (new_mem)
-		return;
 	rbo = container_of(bo, struct radeon_bo, tbo);
 	radeon_bo_invalidate(rbo);
 }
diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
index 6f886e2ffaf3..a4ecff031f8f 100644
--- a/drivers/gpu/drm/radeon/radeon_object.h
+++ b/drivers/gpu/drm/radeon/radeon_object.h
@@ -164,9 +164,7 @@ void radeon_bo_memory_usage(struct radeon_bo *rbo,
 			    uint32_t old_mem_type,
 			    uint32_t new_mem_type);
 void radeon_bo_invalidate(struct radeon_bo *rbo);
-extern void radeon_bo_move_notify(struct ttm_buffer_object *bo,
-				  bool evict,
-				  struct ttm_resource *new_mem);
+void radeon_bo_invalidate_notify(struct ttm_buffer_object *bo);
 extern int radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo);
 extern int radeon_bo_get_surface_reg(struct radeon_bo *bo);
 extern void radeon_bo_fence(struct radeon_bo *bo, struct radeon_fence *fence,
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 490c7355c9cc..b38bc688f665 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -839,7 +839,7 @@ static struct ttm_bo_driver radeon_bo_driver = {
 	.evict_flags = &radeon_evict_flags,
 	.move = &radeon_bo_move,
 	.verify_access = &radeon_verify_access,
-	.move_notify = &radeon_bo_move_notify,
+	.invalidate_notify = &radeon_bo_invalidate_notify,
 	.fault_reserve_notify = &radeon_bo_fault_reserve_notify,
 	.io_mem_reserve = &radeon_ttm_io_mem_reserve,
 };
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
