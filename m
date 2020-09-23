Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF6D274F65
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 05:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113D06E41D;
	Wed, 23 Sep 2020 03:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBFD6E416
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 03:05:22 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-PB78js86M5a1MafeSA_BcA-1; Tue, 22 Sep 2020 23:05:17 -0400
X-MC-Unique: PB78js86M5a1MafeSA_BcA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 492D2420EB;
 Wed, 23 Sep 2020 03:05:16 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F4D45D9CC;
 Wed, 23 Sep 2020 03:05:15 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/10] drm/ttm: reverse move calling pattern.
Date: Wed, 23 Sep 2020 13:04:54 +1000
Message-Id: <20200923030454.362731-11-airlied@gmail.com>
In-Reply-To: <20200923030454.362731-1-airlied@gmail.com>
References: <20200923030454.362731-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Call the driver move function if it exists, otherwise use the
fallback ttm/memcpy paths.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 993a87443c37..3d9c62cdf38d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -229,6 +229,23 @@ void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk)
 }
 EXPORT_SYMBOL(ttm_bo_bulk_move_lru_tail);
 
+static int ttm_bo_move_fallback(struct ttm_buffer_object *bo,
+				struct ttm_operation_ctx *ctx,
+				struct ttm_resource *mem)
+{
+	struct ttm_resource_manager *old_man = ttm_manager_type(bo->bdev, bo->mem.mem_type);
+	struct ttm_resource_manager *new_man = ttm_manager_type(bo->bdev, mem->mem_type);
+
+	if (old_man->use_tt && new_man->use_tt) {
+		if (bo->mem.mem_type == TTM_PL_SYSTEM) {
+			ttm_bo_assign_mem(bo, mem);
+			return 0;
+		} else
+			return ttm_bo_move_ttm(bo, ctx, mem);
+	} else
+		return ttm_bo_move_memcpy(bo, ctx, mem);
+}
+
 static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 				  struct ttm_resource *mem, bool evict,
 				  struct ttm_operation_ctx *ctx)
@@ -270,17 +287,10 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 	if (bdev->driver->move_notify)
 		bdev->driver->move_notify(bo, evict, mem);
 
-	if (old_man->use_tt && new_man->use_tt) {
-		if (bo->mem.mem_type == TTM_PL_SYSTEM) {
-			ttm_bo_assign_mem(bo, mem);
-			ret = 0;
-		} else
-			ret = ttm_bo_move_ttm(bo, ctx, mem);
-	}
-	else if (bdev->driver->move)
+	if (bdev->driver->move)
 		ret = bdev->driver->move(bo, evict, ctx, mem);
 	else
-		ret = ttm_bo_move_memcpy(bo, ctx, mem);
+		ret = ttm_bo_move_fallback(bo, ctx, mem);
 
 	if (ret) {
 		if (bdev->driver->move_notify) {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
