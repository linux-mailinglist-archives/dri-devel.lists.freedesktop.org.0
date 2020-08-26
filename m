Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA59252519
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 03:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589B46E9D9;
	Wed, 26 Aug 2020 01:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686BD6E9D9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 01:44:51 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-ZOoHROUHMHmxiUcZjXzPsQ-1; Tue, 25 Aug 2020 21:44:46 -0400
X-MC-Unique: ZOoHROUHMHmxiUcZjXzPsQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 118D18030B1;
 Wed, 26 Aug 2020 01:44:45 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-53.bne.redhat.com
 [10.64.54.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 998A760C13;
 Wed, 26 Aug 2020 01:44:43 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/23] drm/ttm: add optional bind/unbind via driver.
Date: Wed, 26 Aug 2020 11:44:09 +1000
Message-Id: <20200826014428.828392-5-airlied@gmail.com>
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

I want to remove the backend funcs

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c    | 15 +++++++++++---
 include/drm/ttm/ttm_bo_driver.h | 36 +++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 50a899104022..73c97dcfa512 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -222,7 +222,10 @@ void ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 		fput(ttm->swap_storage);
 
 	ttm->swap_storage = NULL;
-	ttm->func->destroy(bdev, ttm);
+	if (bdev->driver->ttm_tt_destroy)
+		bdev->driver->ttm_tt_destroy(bdev, ttm);
+	else
+		ttm->func->destroy(bdev, ttm);
 }
 
 static void ttm_tt_init_fields(struct ttm_tt *ttm,
@@ -310,7 +313,10 @@ EXPORT_SYMBOL(ttm_dma_tt_fini);
 void ttm_tt_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
 	if (ttm->state == tt_bound) {
-		ttm->func->unbind(bdev, ttm);
+		if (bdev->driver->ttm_tt_unbind)
+			bdev->driver->ttm_tt_unbind(bdev, ttm);
+		else
+			ttm->func->unbind(bdev, ttm);
 		ttm->state = tt_unbound;
 	}
 }
@@ -331,7 +337,10 @@ int ttm_tt_bind(struct ttm_bo_device *bdev,
 	if (ret)
 		return ret;
 
-	ret = ttm->func->bind(bdev, ttm, bo_mem);
+	if (bdev->driver->ttm_tt_bind)
+		ret = bdev->driver->ttm_tt_bind(bdev, ttm, bo_mem);
+	else
+		ret = ttm->func->bind(bdev, ttm, bo_mem);
 	if (unlikely(ret != 0))
 		return ret;
 
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index ebba282667ba..32c0651cc0fd 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -90,6 +90,42 @@ struct ttm_bo_driver {
 	 */
 	void (*ttm_tt_unpopulate)(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
 
+	/**
+	 * ttm_tt_bind
+	 *
+	 * @bdev: Pointer to a ttm device
+	 * @ttm: Pointer to a struct ttm_tt.
+	 * @bo_mem: Pointer to a struct ttm_resource describing the
+	 * memory type and location for binding.
+	 *
+	 * Bind the backend pages into the aperture in the location
+	 * indicated by @bo_mem. This function should be able to handle
+	 * differences between aperture and system page sizes.
+	 */
+	int (*ttm_tt_bind)(struct ttm_bo_device *bdev, struct ttm_tt *ttm, struct ttm_resource *bo_mem);
+
+	/**
+	 * ttm_tt_unbind
+	 *
+	 * @bdev: Pointer to a ttm device
+	 * @ttm: Pointer to a struct ttm_tt.
+	 *
+	 * Unbind previously bound backend pages. This function should be
+	 * able to handle differences between aperture and system page sizes.
+	 */
+	void (*ttm_tt_unbind)(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
+
+	/**
+	 * ttm_tt_destroy
+	 *
+	 * @bdev: Pointer to a ttm device
+	 * @ttm: Pointer to a struct ttm_tt.
+	 *
+	 * Destroy the backend. This will be call back from ttm_tt_destroy so
+	 * don't call ttm_tt_destroy from the callback or infinite loop.
+	 */
+	void (*ttm_tt_destroy)(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
+
 	/**
 	 * struct ttm_bo_driver member eviction_valuable
 	 *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
