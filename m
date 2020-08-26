Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B42252522
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 03:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F646E9E4;
	Wed, 26 Aug 2020 01:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799A06E9E4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 01:45:24 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-vZr9oH4WM_yDr5GG1dzjfQ-1; Tue, 25 Aug 2020 21:45:17 -0400
X-MC-Unique: vZr9oH4WM_yDr5GG1dzjfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C3428030B5;
 Wed, 26 Aug 2020 01:45:16 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-53.bne.redhat.com
 [10.64.54.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D4B160C13;
 Wed, 26 Aug 2020 01:45:12 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 15/23] drm/ttm: drop the tt backend function paths.
Date: Wed, 26 Aug 2020 11:44:20 +1000
Message-Id: <20200826014428.828392-16-airlied@gmail.com>
In-Reply-To: <20200826014428.828392-1-airlied@gmail.com>
References: <20200826014428.828392-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0.001
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
Cc: kraxel@redhat.com, sroland@vmware.com, bskeggs@redhat.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

These are now driver side.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 15 +++-----------
 include/drm/ttm/ttm_tt.h     | 39 ------------------------------------
 2 files changed, 3 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 73c97dcfa512..67aa7fe39432 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -222,10 +222,7 @@ void ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 		fput(ttm->swap_storage);
 
 	ttm->swap_storage = NULL;
-	if (bdev->driver->ttm_tt_destroy)
-		bdev->driver->ttm_tt_destroy(bdev, ttm);
-	else
-		ttm->func->destroy(bdev, ttm);
+	bdev->driver->ttm_tt_destroy(bdev, ttm);
 }
 
 static void ttm_tt_init_fields(struct ttm_tt *ttm,
@@ -313,10 +310,7 @@ EXPORT_SYMBOL(ttm_dma_tt_fini);
 void ttm_tt_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
 	if (ttm->state == tt_bound) {
-		if (bdev->driver->ttm_tt_unbind)
-			bdev->driver->ttm_tt_unbind(bdev, ttm);
-		else
-			ttm->func->unbind(bdev, ttm);
+		bdev->driver->ttm_tt_unbind(bdev, ttm);
 		ttm->state = tt_unbound;
 	}
 }
@@ -337,10 +331,7 @@ int ttm_tt_bind(struct ttm_bo_device *bdev,
 	if (ret)
 		return ret;
 
-	if (bdev->driver->ttm_tt_bind)
-		ret = bdev->driver->ttm_tt_bind(bdev, ttm, bo_mem);
-	else
-		ret = ttm->func->bind(bdev, ttm, bo_mem);
+	ret = bdev->driver->ttm_tt_bind(bdev, ttm, bo_mem);
 	if (unlikely(ret != 0))
 		return ret;
 
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index bdc8aadf3246..146544ba1c10 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -48,47 +48,9 @@ enum ttm_caching_state {
 	tt_cached
 };
 
-struct ttm_backend_func {
-	/**
-	 * struct ttm_backend_func member bind
-	 *
-	 * @ttm: Pointer to a struct ttm_tt.
-	 * @bo_mem: Pointer to a struct ttm_resource describing the
-	 * memory type and location for binding.
-	 *
-	 * Bind the backend pages into the aperture in the location
-	 * indicated by @bo_mem. This function should be able to handle
-	 * differences between aperture and system page sizes.
-	 */
-	int (*bind) (struct ttm_bo_device *bdev, struct ttm_tt *ttm, struct ttm_resource *bo_mem);
-
-	/**
-	 * struct ttm_backend_func member unbind
-	 *
-	 * @ttm: Pointer to a struct ttm_tt.
-	 *
-	 * Unbind previously bound backend pages. This function should be
-	 * able to handle differences between aperture and system page sizes.
-	 */
-	void (*unbind) (struct ttm_bo_device *bdev, struct ttm_tt *ttm);
-
-	/**
-	 * struct ttm_backend_func member destroy
-	 *
-	 * @ttm: Pointer to a struct ttm_tt.
-	 *
-	 * Destroy the backend. This will be call back from ttm_tt_destroy so
-	 * don't call ttm_tt_destroy from the callback or infinite loop.
-	 */
-	void (*destroy) (struct ttm_bo_device *bdev, struct ttm_tt *ttm);
-};
-
 /**
  * struct ttm_tt
  *
- * @func: Pointer to a struct ttm_backend_func that describes
- * the backend methods.
- * pointer.
  * @pages: Array of pages backing the data.
  * @num_pages: Number of pages in the page array.
  * @bdev: Pointer to the current struct ttm_bo_device.
@@ -102,7 +64,6 @@ struct ttm_backend_func {
  * memory.
  */
 struct ttm_tt {
-	struct ttm_backend_func *func;
 	struct page **pages;
 	uint32_t page_flags;
 	unsigned long num_pages;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
