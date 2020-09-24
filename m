Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4C327682D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D616EA71;
	Thu, 24 Sep 2020 05:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459286EA70
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:18:56 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-XbZD-ldDNF2leZo4wxdsjg-1; Thu, 24 Sep 2020 01:18:53 -0400
X-MC-Unique: XbZD-ldDNF2leZo4wxdsjg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B5988027E2;
 Thu, 24 Sep 2020 05:18:52 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06E5D26357;
 Thu, 24 Sep 2020 05:18:50 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/45] drm/ttm: handle the SYSTEM->TT path in same place as
 others.
Date: Thu, 24 Sep 2020 15:18:02 +1000
Message-Id: <20200924051845.397177-3-airlied@gmail.com>
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

This just consolidates the code making the flow easier to understand
and also helps when moving move to the driver side.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index c342bfc2b4c1..6d1520255fc1 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -265,20 +265,18 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 			if (ret)
 				goto out_err;
 		}
-
-		if (bo->mem.mem_type == TTM_PL_SYSTEM) {
-			if (bdev->driver->move_notify)
-				bdev->driver->move_notify(bo, evict, mem);
-			bo->mem = *mem;
-			goto moved;
-		}
 	}
 
 	if (bdev->driver->move_notify)
 		bdev->driver->move_notify(bo, evict, mem);
 
-	if (old_man->use_tt && new_man->use_tt)
-		ret = ttm_bo_move_ttm(bo, ctx, mem);
+	if (old_man->use_tt && new_man->use_tt) {
+		if (bo->mem.mem_type == TTM_PL_SYSTEM) {
+			ttm_bo_assign_mem(bo, mem);
+			ret = 0;
+		} else
+			ret = ttm_bo_move_ttm(bo, ctx, mem);
+	}
 	else if (bdev->driver->move)
 		ret = bdev->driver->move(bo, evict, ctx, mem);
 	else
@@ -294,7 +292,6 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 		goto out_err;
 	}
 
-moved:
 	ctx->bytes_moved += bo->num_pages << PAGE_SHIFT;
 	return 0;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
