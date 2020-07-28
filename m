Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD38B231236
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B886E223;
	Tue, 28 Jul 2020 19:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7C51C6E223
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 19:11:43 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-Unsaxz2YNsWibC85Jw977A-1; Tue, 28 Jul 2020 15:11:37 -0400
X-MC-Unique: Unsaxz2YNsWibC85Jw977A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04053100CCC5;
 Tue, 28 Jul 2020 19:11:36 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.32.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06D1660BF4;
 Tue, 28 Jul 2020 19:11:34 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm/amdgpu: consolidate ttm reserve paths
Date: Wed, 29 Jul 2020 05:11:33 +1000
Message-Id: <20200728191133.28590-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Drop the WARN_ON and consolidate the two paths into one.

Use the consolidate slowpath in the execbuf utils code.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  2 +-
 drivers/gpu/drm/ttm/ttm_execbuf_util.c     | 12 +--
 include/drm/ttm/ttm_bo_driver.h            | 91 ++++------------------
 3 files changed, 20 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index afa5189dba7d..e01e8903741e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -160,7 +160,7 @@ static inline int amdgpu_bo_reserve(struct amdgpu_bo *bo, bool no_intr)
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	int r;
 
-	r = __ttm_bo_reserve(&bo->tbo, !no_intr, false, NULL);
+	r = ttm_bo_reserve(&bo->tbo, !no_intr, false, NULL);
 	if (unlikely(r != 0)) {
 		if (r != -ERESTARTSYS)
 			dev_err(adev->dev, "%p reserve failed\n", bo);
diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
index 1797f04c0534..8a8f1a6a83a6 100644
--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
@@ -93,7 +93,7 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
 	list_for_each_entry(entry, list, head) {
 		struct ttm_buffer_object *bo = entry->bo;
 
-		ret = __ttm_bo_reserve(bo, intr, (ticket == NULL), ticket);
+		ret = ttm_bo_reserve(bo, intr, (ticket == NULL), ticket);
 		if (ret == -EALREADY && dups) {
 			struct ttm_validate_buffer *safe = entry;
 			entry = list_prev_entry(entry, head);
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
+			ret = ttm_bo_reserve_slowpath(bo, intr, ticket);
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
index 5a37f1cc057e..bfa9d146d3d4 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -597,29 +597,30 @@ int ttm_mem_io_lock(struct ttm_mem_type_manager *man, bool interruptible);
 void ttm_mem_io_unlock(struct ttm_mem_type_manager *man);
 
 /**
- * __ttm_bo_reserve:
+ * ttm_bo_reserve:
  *
  * @bo: A pointer to a struct ttm_buffer_object.
  * @interruptible: Sleep interruptible if waiting.
  * @no_wait: Don't sleep while trying to reserve, rather return -EBUSY.
  * @ticket: ticket used to acquire the ww_mutex.
  *
- * Will not remove reserved buffers from the lru lists.
- * Otherwise identical to ttm_bo_reserve.
+ * Locks a buffer object for validation. (Or prevents other processes from
+ * locking it for validation), while taking a number of measures to prevent
+ * deadlocks.
  *
  * Returns:
  * -EDEADLK: The reservation may cause a deadlock.
  * Release all buffer reservations, wait for @bo to become unreserved and
- * try again. (only if use_sequence == 1).
+ * try again.
  * -ERESTARTSYS: A wait for the buffer to become unreserved was interrupted by
  * a signal. Release all buffer reservations and return to user-space.
  * -EBUSY: The function needed to sleep, but @no_wait was true
  * -EALREADY: Bo already reserved using @ticket. This error code will only
  * be returned if @use_ticket is set to true.
  */
-static inline int __ttm_bo_reserve(struct ttm_buffer_object *bo,
-				   bool interruptible, bool no_wait,
-				   struct ww_acquire_ctx *ticket)
+static inline int ttm_bo_reserve(struct ttm_buffer_object *bo,
+				 bool interruptible, bool no_wait,
+				 struct ww_acquire_ctx *ticket)
 {
 	int ret = 0;
 
@@ -641,59 +642,6 @@ static inline int __ttm_bo_reserve(struct ttm_buffer_object *bo,
 	return ret;
 }
 
-/**
- * ttm_bo_reserve:
- *
- * @bo: A pointer to a struct ttm_buffer_object.
- * @interruptible: Sleep interruptible if waiting.
- * @no_wait: Don't sleep while trying to reserve, rather return -EBUSY.
- * @ticket: ticket used to acquire the ww_mutex.
- *
- * Locks a buffer object for validation. (Or prevents other processes from
- * locking it for validation) and removes it from lru lists, while taking
- * a number of measures to prevent deadlocks.
- *
- * Deadlocks may occur when two processes try to reserve multiple buffers in
- * different order, either by will or as a result of a buffer being evicted
- * to make room for a buffer already reserved. (Buffers are reserved before
- * they are evicted). The following algorithm prevents such deadlocks from
- * occurring:
- * Processes attempting to reserve multiple buffers other than for eviction,
- * (typically execbuf), should first obtain a unique 32-bit
- * validation sequence number,
- * and call this function with @use_ticket == 1 and @ticket->stamp == the unique
- * sequence number. If upon call of this function, the buffer object is already
- * reserved, the validation sequence is checked against the validation
- * sequence of the process currently reserving the buffer,
- * and if the current validation sequence is greater than that of the process
- * holding the reservation, the function returns -EDEADLK. Otherwise it sleeps
- * waiting for the buffer to become unreserved, after which it retries
- * reserving.
- * The caller should, when receiving an -EDEADLK error
- * release all its buffer reservations, wait for @bo to become unreserved, and
- * then rerun the validation with the same validation sequence. This procedure
- * will always guarantee that the process with the lowest validation sequence
- * will eventually succeed, preventing both deadlocks and starvation.
- *
- * Returns:
- * -EDEADLK: The reservation may cause a deadlock.
- * Release all buffer reservations, wait for @bo to become unreserved and
- * try again. (only if use_sequence == 1).
- * -ERESTARTSYS: A wait for the buffer to become unreserved was interrupted by
- * a signal. Release all buffer reservations and return to user-space.
- * -EBUSY: The function needed to sleep, but @no_wait was true
- * -EALREADY: Bo already reserved using @ticket. This error code will only
- * be returned if @use_ticket is set to true.
- */
-static inline int ttm_bo_reserve(struct ttm_buffer_object *bo,
-				 bool interruptible, bool no_wait,
-				 struct ww_acquire_ctx *ticket)
-{
-	WARN_ON(!kref_read(&bo->kref));
-
-	return __ttm_bo_reserve(bo, interruptible, no_wait, ticket);
-}
-
 /**
  * ttm_bo_reserve_slowpath:
  * @bo: A pointer to a struct ttm_buffer_object.
@@ -708,20 +656,15 @@ static inline int ttm_bo_reserve_slowpath(struct ttm_buffer_object *bo,
 					  bool interruptible,
 					  struct ww_acquire_ctx *ticket)
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
