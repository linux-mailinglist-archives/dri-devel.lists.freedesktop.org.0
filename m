Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B22129476E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 06:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFD56E874;
	Wed, 21 Oct 2020 04:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A42A6E873
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 04:40:43 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-s2PkPMKEPcWch8tKLrhr2A-1; Wed, 21 Oct 2020 00:40:38 -0400
X-MC-Unique: s2PkPMKEPcWch8tKLrhr2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 190EC803F4D;
 Wed, 21 Oct 2020 04:40:37 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CCC41A340;
 Wed, 21 Oct 2020 04:40:36 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/ttm: ttm_bo_mem_placement doesn't need ctx parameter.
Date: Wed, 21 Oct 2020 14:40:30 +1000
Message-Id: <20201021044031.1752624-3-airlied@gmail.com>
In-Reply-To: <20201021044031.1752624-1-airlied@gmail.com>
References: <20201021044031.1752624-1-airlied@gmail.com>
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Removed unused parameter.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e2afab3d97ee..5b411252a857 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -830,7 +830,6 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
  * @bo: BO to find memory for
  * @place: where to search
  * @mem: the memory object to fill in
- * @ctx: operation context
  *
  * Check if placement is compatible and fill in mem structure.
  * Returns -EBUSY if placement won't work or negative error code.
@@ -838,8 +837,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
  */
 static int ttm_bo_mem_placement(struct ttm_buffer_object *bo,
 				const struct ttm_place *place,
-				struct ttm_resource *mem,
-				struct ttm_operation_ctx *ctx)
+				struct ttm_resource *mem)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
 	struct ttm_resource_manager *man;
@@ -884,7 +882,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 		const struct ttm_place *place = &placement->placement[i];
 		struct ttm_resource_manager *man;
 
-		ret = ttm_bo_mem_placement(bo, place, mem, ctx);
+		ret = ttm_bo_mem_placement(bo, place, mem);
 		if (ret)
 			continue;
 
@@ -910,7 +908,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 	for (i = 0; i < placement->num_busy_placement; ++i) {
 		const struct ttm_place *place = &placement->busy_placement[i];
 
-		ret = ttm_bo_mem_placement(bo, place, mem, ctx);
+		ret = ttm_bo_mem_placement(bo, place, mem);
 		if (ret)
 			continue;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
