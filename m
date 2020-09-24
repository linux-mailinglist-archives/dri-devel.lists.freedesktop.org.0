Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 846FE276838
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791546EA77;
	Thu, 24 Sep 2020 05:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A826EA7B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:18 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-oP_-Qm2ZPpyxCO5ha4RXpQ-1; Thu, 24 Sep 2020 01:19:12 -0400
X-MC-Unique: oP_-Qm2ZPpyxCO5ha4RXpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D8CD1891E91;
 Thu, 24 Sep 2020 05:19:11 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 453BD19D7C;
 Thu, 24 Sep 2020 05:19:10 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 16/45] drm/radeon/ttm: do move notify actions inside move.
Date: Thu, 24 Sep 2020 15:18:16 +1000
Message-Id: <20200924051845.397177-17-airlied@gmail.com>
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

move notify can be gotten done inside moves instead of a separate
callback for radeon. move notify is now only called from one other
place where new_mem == NULL, so handle that properly.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/radeon/radeon_object.c | 28 +++++++++++++++++---------
 drivers/gpu/drm/radeon/radeon_object.h |  4 ++++
 drivers/gpu/drm/radeon/radeon_ttm.c    |  8 +++++++-
 3 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 689426dd8480..36a16d7a24b2 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -754,6 +754,21 @@ int radeon_bo_check_tiling(struct radeon_bo *bo, bool has_moved,
 	return radeon_bo_get_surface_reg(bo);
 }
 
+
+void radeon_bo_invalidate(struct radeon_bo *rbo)
+{
+	radeon_bo_check_tiling(rbo, 0, 1);
+	radeon_vm_bo_invalidate(rbo->rdev, rbo);
+}
+
+void radeon_bo_memory_usage(struct radeon_bo *rbo,
+			    uint32_t old_mem_type,
+			    uint32_t new_mem_type)
+{
+	radeon_update_memory_usage(rbo, old_mem_type, -1);
+	radeon_update_memory_usage(rbo, new_mem_type, 1);
+}
+
 void radeon_bo_move_notify(struct ttm_buffer_object *bo,
 			   bool evict,
 			   struct ttm_resource *new_mem)
@@ -763,16 +778,11 @@ void radeon_bo_move_notify(struct ttm_buffer_object *bo,
 	if (!radeon_ttm_bo_is_radeon_bo(bo))
 		return;
 
-	rbo = container_of(bo, struct radeon_bo, tbo);
-	radeon_bo_check_tiling(rbo, 0, 1);
-	radeon_vm_bo_invalidate(rbo->rdev, rbo);
-
-	/* update statistics */
-	if (!new_mem)
+	/* the new_mem path is handled via the move callback now */
+	if (new_mem)
 		return;
-
-	radeon_update_memory_usage(rbo, bo->mem.mem_type, -1);
-	radeon_update_memory_usage(rbo, new_mem->mem_type, 1);
+	rbo = container_of(bo, struct radeon_bo, tbo);
+	radeon_bo_invalidate(rbo);
 }
 
 int radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
index 27cfb64057fe..6f886e2ffaf3 100644
--- a/drivers/gpu/drm/radeon/radeon_object.h
+++ b/drivers/gpu/drm/radeon/radeon_object.h
@@ -160,6 +160,10 @@ extern void radeon_bo_get_tiling_flags(struct radeon_bo *bo,
 				u32 *tiling_flags, u32 *pitch);
 extern int radeon_bo_check_tiling(struct radeon_bo *bo, bool has_moved,
 				bool force_drop);
+void radeon_bo_memory_usage(struct radeon_bo *rbo,
+			    uint32_t old_mem_type,
+			    uint32_t new_mem_type);
+void radeon_bo_invalidate(struct radeon_bo *rbo);
 extern void radeon_bo_move_notify(struct ttm_buffer_object *bo,
 				  bool evict,
 				  struct ttm_resource *new_mem);
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 10d25d3b83f2..e814b11187b3 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -316,12 +316,16 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	struct ttm_resource *old_mem = &bo->mem;
 	int r;
 
+	rbo = container_of(bo, struct radeon_bo, tbo);
+
+	radeon_bo_invalidate(rbo);
+	radeon_bo_memory_usage(rbo, bo->mem.mem_type, new_mem->mem_type);
+
 	r = ttm_bo_wait_ctx(bo, ctx);
 	if (r)
 		return r;
 
 	/* Can't move a pinned BO */
-	rbo = container_of(bo, struct radeon_bo, tbo);
 	if (WARN_ON_ONCE(rbo->tbo.pin_count > 0))
 		return -EINVAL;
 
@@ -361,6 +365,8 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 memcpy:
 		r = ttm_bo_move_memcpy(bo, ctx, new_mem);
 		if (r) {
+			radeon_bo_invalidate(rbo);
+			radeon_bo_memory_usage(rbo, new_mem->mem_type, old_mem->mem_type);
 			return r;
 		}
 	}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
