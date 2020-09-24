Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDA1276845
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210B46EA82;
	Thu, 24 Sep 2020 05:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F8F6EA7A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:32 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-96L8SEiVPm6Fa8zge-aQnQ-1; Thu, 24 Sep 2020 01:19:27 -0400
X-MC-Unique: 96L8SEiVPm6Fa8zge-aQnQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A2271891E80;
 Thu, 24 Sep 2020 05:19:26 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FCA519D7C;
 Thu, 24 Sep 2020 05:19:25 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 27/45] drm/radeon/ttm: cleanup move exit paths
Date: Thu, 24 Sep 2020 15:18:27 +1000
Message-Id: <20200924051845.397177-28-airlied@gmail.com>
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
 drivers/gpu/drm/radeon/radeon_ttm.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 496e7b1e14ad..490c7355c9cc 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -342,15 +342,12 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 		return -EINVAL;
 
 	rdev = radeon_get_rdev(bo->bdev);
-	if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
-		ttm_bo_move_null(bo, new_mem);
-		return 0;
-	}
+	if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL)
+		goto out_assign;
+
 	if (old_mem->mem_type == TTM_PL_SYSTEM &&
-	    new_mem->mem_type == TTM_PL_TT) {
-		ttm_bo_move_null(bo, new_mem);
-		return 0;
-	}
+	    new_mem->mem_type == TTM_PL_TT)
+		goto out_assign;
 
 	if (old_mem->mem_type == TTM_PL_TT &&
 	    new_mem->mem_type == TTM_PL_SYSTEM) {
@@ -360,8 +357,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 		r = ttm_tt_set_placement_caching(bo->ttm, new_mem->placement);
 		if (r)
 			return r;
-		ttm_bo_assign_mem(bo, new_mem);
-		return 0;
+		goto out_assign;
 	}
 
 	if (!rdev->ring[radeon_copy_ring_index(rdev)].ready ||
@@ -394,6 +390,9 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	/* update statistics */
 	atomic64_add((u64)bo->num_pages << PAGE_SHIFT, &rdev->num_bytes_moved);
 	return 0;
+out_assign:
+	ttm_bo_assign_mem(bo, new_mem);
+	return 0;
 }
 
 static int radeon_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_resource *mem)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
