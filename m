Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF6D8B9EED
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 18:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728DC11243A;
	Thu,  2 May 2024 16:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="oBlu+UtP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F96410EB8F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 16:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714668795;
 bh=S315KVUqsMjvIzWkE64+quQeu3MayjzAFCdZQhXDFd8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oBlu+UtP6jtPdm6Ht6FtrQBf7Zzmx/fBY4EDgQgfYZnqzELtnWYPHhRRi/lwqPXpd
 HHes82alVVz5pHz3rMzL5Z+QByl+ACdzU2anfON1Fbws8EL1zgJQCdnYFB5gTEKLwH
 o7lQOsPFwdv0WR3VD0vGvBqmdmESkiTg2QKHAVaHnjIDECYfrHWz4tDW2n38ln7Haw
 7oeLMHcmYUqpXsdc4OtUyJo4M27PD1V9C4eo+ClxMRQotb4FGbEq6Um+9hcOHM5XJ1
 uDhxQDzBzF/McAcB03rd2onD7Qmtd/EXwh59F4QPP+3X2CEGLtg+s5PTYJIKCALNK3
 SjYXGik3TxOaA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id AD5FB3782121;
 Thu,  2 May 2024 16:53:14 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Antonino Maniscalco <antonino.maniscalco@collabora.com>,
 kernel@collabora.com
Subject: [PATCH v4 1/5] drm/panthor: Fix tiler OOM handling to allow
 incremental rendering
Date: Thu,  2 May 2024 18:51:54 +0200
Message-ID: <20240502165158.1458959-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240502165158.1458959-1-boris.brezillon@collabora.com>
References: <20240502165158.1458959-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Antonino Maniscalco <antonino.maniscalco@collabora.com>

If the kernel couldn't allocate memory because we reached the maximum
number of chunks but no render passes are in flight
(panthor_heap_grow() returning -ENOMEM), we should defer the OOM
handling to the FW by returning a NULL chunk. The FW will then call
the tiler OOM exception handler, which is supposed to implement
incremental rendering (execute an intermediate fragment job to flush
the pending primitives, release the tiler memory that was used to
store those primitives, and start over from where it stopped).

Instead of checking for both ENOMEM and EBUSY, make panthor_heap_grow()
return ENOMEM no matter the reason of this allocation failure, the FW
doesn't care anyway.

v3:
- Add R-bs

v2:
- Make panthor_heap_grow() return -ENOMEM for all kind of allocation
  failures
- Document the panthor_heap_grow() semantics

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Signed-off-by: Antonino Maniscalco <antonino.maniscalco@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_heap.c  | 12 ++++++++----
 drivers/gpu/drm/panthor/panthor_sched.c |  7 ++++++-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index 143fa35f2e74..c3c0ba744937 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -410,6 +410,13 @@ int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
  * @renderpasses_in_flight: Number of render passes currently in-flight.
  * @pending_frag_count: Number of fragment jobs waiting for execution/completion.
  * @new_chunk_gpu_va: Pointer used to return the chunk VA.
+ *
+ * Return:
+ * - 0 if a new heap was allocated
+ * - -ENOMEM if the tiler context reached the maximum number of chunks
+ *   or if too many render passes are in-flight
+ *   or if the allocation failed
+ * - -EINVAL if any of the arguments passed to panthor_heap_grow() is invalid
  */
 int panthor_heap_grow(struct panthor_heap_pool *pool,
 		      u64 heap_gpu_va,
@@ -439,10 +446,7 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
 	 * handler provided by the userspace driver, if any).
 	 */
 	if (renderpasses_in_flight > heap->target_in_flight ||
-	    (pending_frag_count > 0 && heap->chunk_count >= heap->max_chunks)) {
-		ret = -EBUSY;
-		goto out_unlock;
-	} else if (heap->chunk_count >= heap->max_chunks) {
+	    heap->chunk_count >= heap->max_chunks) {
 		ret = -ENOMEM;
 		goto out_unlock;
 	}
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 7f16a4a14e9a..c126251c5ba7 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1385,7 +1385,12 @@ static int group_process_tiler_oom(struct panthor_group *group, u32 cs_id)
 					pending_frag_count, &new_chunk_va);
 	}
 
-	if (ret && ret != -EBUSY) {
+	/* If the heap context doesn't have memory for us, we want to let the
+	 * FW try to reclaim memory by waiting for fragment jobs to land or by
+	 * executing the tiler OOM exception handler, which is supposed to
+	 * implement incremental rendering.
+	 */
+	if (ret && ret != -ENOMEM) {
 		drm_warn(&ptdev->base, "Failed to extend the tiler heap\n");
 		group->fatal_queues |= BIT(cs_id);
 		sched_queue_delayed_work(sched, tick, 0);
-- 
2.44.0

