Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC8527685A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518496EAA1;
	Thu, 24 Sep 2020 05:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E6C6EA89
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:45 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-Xy5NDAzIPEKFq3EdyPuWXg-1; Thu, 24 Sep 2020 01:19:41 -0400
X-MC-Unique: Xy5NDAzIPEKFq3EdyPuWXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 902AA1091066;
 Thu, 24 Sep 2020 05:19:40 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96A6219D7C;
 Thu, 24 Sep 2020 05:19:39 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 36/45] drm/ttm: drop move_notify callback.
Date: Thu, 24 Sep 2020 15:18:36 +1000
Message-Id: <20200924051845.397177-37-airlied@gmail.com>
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

This isn't used anymore.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c    |  2 --
 include/drm/ttm/ttm_bo_driver.h | 11 -----------
 2 files changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index ba69c682e53b..eb76002aa53d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -284,8 +284,6 @@ static void ttm_bo_cleanup_memtype_use(struct ttm_buffer_object *bo)
 {
 	if (bo->bdev->driver->invalidate_notify)
 		bo->bdev->driver->invalidate_notify(bo);
-	else if (bo->bdev->driver->move_notify)
-		bo->bdev->driver->move_notify(bo, false, NULL);
 
 	ttm_bo_tt_destroy(bo);
 	ttm_resource_free(bo, &bo->mem);
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index da4afe669664..4a63fec24e90 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -155,17 +155,6 @@ struct ttm_bo_driver {
 	int (*verify_access)(struct ttm_buffer_object *bo,
 			     struct file *filp);
 
-	/**
-	 * Hook to notify driver about a driver move so it
-	 * can do tiling things and book-keeping.
-	 *
-	 * @evict: whether this move is evicting the buffer from the graphics
-	 * address space
-	 */
-	void (*move_notify)(struct ttm_buffer_object *bo,
-			    bool evict,
-			    struct ttm_resource *new_mem);
-
 	/**
 	 * Hook to notify driver about a bo being torn down.
 	 * can be used for invalidation instead of move_notify.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
