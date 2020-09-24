Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3227227684A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAA56EA8B;
	Thu, 24 Sep 2020 05:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E836EA8A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:45 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-17nQh1gOP5GQRetgXWiXQQ-1; Thu, 24 Sep 2020 01:19:40 -0400
X-MC-Unique: 17nQh1gOP5GQRetgXWiXQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E4961DE14;
 Thu, 24 Sep 2020 05:19:39 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4442D19D7C;
 Thu, 24 Sep 2020 05:19:38 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 35/45] drm/vram-helper: move to invalidate callback.
Date: Thu, 24 Sep 2020 15:18:35 +1000
Message-Id: <20200924051845.397177-36-airlied@gmail.com>
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
 drivers/gpu/drm/drm_gem_vram_helper.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 5d4182f5c22f..9d4100071e1d 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -433,7 +433,7 @@ static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
 	 * Permanently mapping and unmapping buffers adds overhead from
 	 * updating the page tables and creates debugging output. Therefore,
 	 * we delay the actual unmap operation until the BO gets evicted
-	 * from memory. See drm_gem_vram_bo_driver_move_notify().
+	 * from memory. See drm_gem_vram_bo_driver_invalidate_notify().
 	 */
 }
 
@@ -585,9 +585,7 @@ static void drm_gem_vram_bo_driver_evict_flags(struct drm_gem_vram_object *gbo,
 	*pl = gbo->placement;
 }
 
-static void drm_gem_vram_bo_driver_move_notify(struct drm_gem_vram_object *gbo,
-					       bool evict,
-					       struct ttm_resource *new_mem)
+static void drm_gem_vram_bo_driver_invalidate_notify(struct drm_gem_vram_object *gbo)
 {
 	struct ttm_bo_kmap_obj *kmap = &gbo->kmap;
 
@@ -605,7 +603,7 @@ static int drm_gem_vram_bo_driver_move(struct drm_gem_vram_object *gbo,
 				       struct ttm_operation_ctx *ctx,
 				       struct ttm_resource *new_mem)
 {
-	drm_gem_vram_bo_driver_move_notify(gbo, evict, new_mem);
+	drm_gem_vram_bo_driver_invalidate_notify(gbo);
 	return ttm_bo_move_memcpy(&gbo->bo, ctx, new_mem);
 }
 
@@ -956,9 +954,7 @@ static void bo_driver_evict_flags(struct ttm_buffer_object *bo,
 	drm_gem_vram_bo_driver_evict_flags(gbo, placement);
 }
 
-static void bo_driver_move_notify(struct ttm_buffer_object *bo,
-				  bool evict,
-				  struct ttm_resource *new_mem)
+static void bo_driver_invalidate_notify(struct ttm_buffer_object *bo)
 {
 	struct drm_gem_vram_object *gbo;
 
@@ -968,7 +964,7 @@ static void bo_driver_move_notify(struct ttm_buffer_object *bo,
 
 	gbo = drm_gem_vram_of_bo(bo);
 
-	drm_gem_vram_bo_driver_move_notify(gbo, evict, new_mem);
+	drm_gem_vram_bo_driver_invalidate_notify(gbo);
 }
 
 static int bo_driver_move(struct ttm_buffer_object *bo,
@@ -1008,7 +1004,7 @@ static struct ttm_bo_driver bo_driver = {
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = bo_driver_evict_flags,
 	.move = bo_driver_move,
-	.move_notify = bo_driver_move_notify,
+	.invalidate_notify = bo_driver_invalidate_notify,
 	.io_mem_reserve = bo_driver_io_mem_reserve,
 };
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
