Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B932302BE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 08:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCDB6E186;
	Tue, 28 Jul 2020 06:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03686E183
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 06:24:12 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-kX5UMqbIOHWCMZSiCT5zEA-1; Tue, 28 Jul 2020 02:24:06 -0400
X-MC-Unique: kX5UMqbIOHWCMZSiCT5zEA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05C408017FB;
 Tue, 28 Jul 2020 06:24:05 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.32.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A0B05DA33;
 Tue, 28 Jul 2020 06:24:03 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm/nouveau: consolidate slowpath reserve
Date: Tue, 28 Jul 2020 16:24:02 +1000
Message-Id: <20200728062402.21942-1-airlied@gmail.com>
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

The WARN_ON in the non-underscore path is off questionable value
(can we drop it from the non-slowpath?). At least for nouveau
where it's just looked up the gem object we know the ttm object
has a reference always so we can skip the check.

It's probably nouveau could use execbut utils here at some point
but for now align the code between them to always call the __
versions, and remove the non underscored version.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c  |  6 ++---
 drivers/gpu/drm/ttm/ttm_execbuf_util.c | 10 +--------
 include/drm/ttm/ttm_bo_driver.h        | 31 +++++++++++---------------
 3 files changed, 17 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 81f111ad3f4f..d2d535d2ece1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -422,15 +422,15 @@ validate_init(struct nouveau_channel *chan, struct drm_file *file_priv,
 			break;
 		}
 
-		ret = ttm_bo_reserve(&nvbo->bo, true, false, &op->ticket);
+		ret = __ttm_bo_reserve(&nvbo->bo, true, false, &op->ticket);
 		if (ret) {
 			list_splice_tail_init(&vram_list, &op->list);
 			list_splice_tail_init(&gart_list, &op->list);
 			list_splice_tail_init(&both_list, &op->list);
 			validate_fini_no_ticket(op, chan, NULL, NULL);
 			if (unlikely(ret == -EDEADLK)) {
-				ret = ttm_bo_reserve_slowpath(&nvbo->bo, true,
-							      &op->ticket);
+				ret = __ttm_bo_reserve_slowpath(&nvbo->bo, true,
+								&op->ticket);
 				if (!ret)
 					res_bo = nvbo;
 			}
diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
index 1797f04c0534..a24f13bc90fb 100644
--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
@@ -119,13 +119,7 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
 		ttm_eu_backoff_reservation_reverse(list, entry);
 
 		if (ret == -EDEADLK) {
-			if (intr) {
-				ret = dma_resv_lock_slow_interruptible(bo->base.resv,
-										 ticket);
-			} else {
-				dma_resv_lock_slow(bo->base.resv, ticket);
-				ret = 0;
-			}
+			ret = __ttm_bo_reserve_slowpath(bo, intr, ticket);
 		}
 
 		if (!ret && entry->num_shared)
@@ -133,8 +127,6 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
 								entry->num_shared);
 
 		if (unlikely(ret != 0)) {
-			if (ret == -EINTR)
-				ret = -ERESTARTSYS;
 			if (ticket) {
 				ww_acquire_done(ticket);
 				ww_acquire_fini(ticket);
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 5a37f1cc057e..563b970949a1 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -695,7 +695,7 @@ static inline int ttm_bo_reserve(struct ttm_buffer_object *bo,
 }
 
 /**
- * ttm_bo_reserve_slowpath:
+ * __ttm_bo_reserve_slowpath:
  * @bo: A pointer to a struct ttm_buffer_object.
  * @interruptible: Sleep interruptible if waiting.
  * @sequence: Set (@bo)->sequence to this value after lock
@@ -704,24 +704,19 @@ static inline int ttm_bo_reserve(struct ttm_buffer_object *bo,
  * from all our other reservations. Because there are no other reservations
  * held by us, this function cannot deadlock any more.
  */
-static inline int ttm_bo_reserve_slowpath(struct ttm_buffer_object *bo,
-					  bool interruptible,
-					  struct ww_acquire_ctx *ticket)
+static inline int __ttm_bo_reserve_slowpath(struct ttm_buffer_object *bo,
+					    bool interruptible,
+					    struct ww_acquire_ctx *ticket)
 {
-	int ret = 0;
-
-	WARN_ON(!kref_read(&bo->kref));
-
-	if (interruptible)
-		ret = dma_resv_lock_slow_interruptible(bo->base.resv,
-								 ticket);
-	else
-		dma_resv_lock_slow(bo->base.resv, ticket);
-
-	if (ret == -EINTR)
-		ret = -ERESTARTSYS;
-
-	return ret;
+	if (interruptible) {
+		int ret = dma_resv_lock_slow_interruptible(bo->base.resv,
+							   ticket);
+		if (ret == -EINTR)
+			ret = -ERESTARTSYS;
+		return ret;
+	}
+	dma_resv_lock_slow(bo->base.resv, ticket);
+	return 0;
 }
 
 /**
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
