Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9B791C1D1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 16:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA9C10E509;
	Fri, 28 Jun 2024 14:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WbvPFYZR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A978310E2FD
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 14:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1719586539;
 bh=DM/ExRsULnRBEi3akxLb4yY6w66qLJWjMpZ8YdfvSto=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WbvPFYZRJaK3M1ScecpKfiXTW6aD2D3Wz/EUPHJhEZcsPfro8tH8cJQXTLwIqPp4C
 qQ7xd5IvlzlQ2jnvwSOo4TIb9P/7JIZvb3td64CwMicvEqDnOADuy7f32YCWFpIFUz
 +o/+xMurr2g7uexHxGIHZ/wnXnKjLtSt6MOGPDQ1htzzhgTV6nSkiDWCh3/l8APv/l
 R3AAwvKrPYHemfLYPo61xnVkgvo7oA9SINxKDiVoK20piVJ7R0mpFI5sxSHgehbOXL
 cy/5tS5nlEuv3kqo6JN0CFP+lcPuHXjcGxUTKgsw64zKV9NCG5x8HoyhRBFnTSZ4uH
 rYIoVAHbJFPjg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0629F37821FF;
 Fri, 28 Jun 2024 14:55:38 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH 2/2] drm/panthor: Fix sync-only jobs
Date: Fri, 28 Jun 2024 16:55:36 +0200
Message-ID: <20240628145536.778349-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240628145536.778349-1-boris.brezillon@collabora.com>
References: <20240628145536.778349-1-boris.brezillon@collabora.com>
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

A sync-only job is meant to provide a synchronization point on a
queue, so we can't return a NULL fence there, we have to add a signal
operation to the command stream which executes after all other
previously submitted jobs are done.

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 41 ++++++++++++++++++++-----
 include/uapi/drm/panthor_drm.h          |  5 +++
 2 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 79ffcbc41d78..951ff7e63ea8 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -458,6 +458,16 @@ struct panthor_queue {
 		/** @seqno: Sequence number of the last initialized fence. */
 		atomic64_t seqno;
 
+		/**
+		 * @last_fence: Fence of the last submitted job.
+		 *
+		 * We return this fence when we get an empty command stream.
+		 * This way, we are guaranteed that all earlier jobs have completed
+		 * when drm_sched_job::s_fence::finished without having to feed
+		 * the CS ring buffer with a dummy job that only signals the fence.
+		 */
+		struct dma_fence *last_fence;
+
 		/**
 		 * @in_flight_jobs: List containing all in-flight jobs.
 		 *
@@ -829,6 +839,9 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
 	panthor_kernel_bo_destroy(queue->ringbuf);
 	panthor_kernel_bo_destroy(queue->iface.mem);
 
+	/* Release the last_fence we were holding, if any. */
+	dma_fence_put(queue->fence_ctx.last_fence);
+
 	kfree(queue);
 }
 
@@ -2865,11 +2878,14 @@ queue_run_job(struct drm_sched_job *sched_job)
 	static_assert(sizeof(call_instrs) % 64 == 0,
 		      "call_instrs is not aligned on a cacheline");
 
-	/* Stream size is zero, nothing to do => return a NULL fence and let
-	 * drm_sched signal the parent.
+	/* Stream size is zero, nothing to do except making sure all previously
+	 * submitted jobs are done before we signal the
+	 * drm_sched_job::s_fence::finished fence.
 	 */
-	if (!job->call_info.size)
-		return NULL;
+	if (!job->call_info.size) {
+		job->done_fence = dma_fence_get(queue->fence_ctx.last_fence);
+		return job->done_fence;
+	}
 
 	ret = pm_runtime_resume_and_get(ptdev->base.dev);
 	if (drm_WARN_ON(&ptdev->base, ret))
@@ -2928,6 +2944,10 @@ queue_run_job(struct drm_sched_job *sched_job)
 		}
 	}
 
+	/* Update the last fence. */
+	dma_fence_put(queue->fence_ctx.last_fence);
+	queue->fence_ctx.last_fence = dma_fence_get(job->done_fence);
+
 	done_fence = dma_fence_get(job->done_fence);
 
 out_unlock:
@@ -3378,10 +3398,15 @@ panthor_job_create(struct panthor_file *pfile,
 		goto err_put_job;
 	}
 
-	job->done_fence = kzalloc(sizeof(*job->done_fence), GFP_KERNEL);
-	if (!job->done_fence) {
-		ret = -ENOMEM;
-		goto err_put_job;
+	/* Empty command streams don't need a fence, they'll pick the one from
+	 * the previously submitted job.
+	 */
+	if (job->call_info.size) {
+		job->done_fence = kzalloc(sizeof(*job->done_fence), GFP_KERNEL);
+		if (!job->done_fence) {
+			ret = -ENOMEM;
+			goto err_put_job;
+		}
 	}
 
 	ret = drm_sched_job_init(&job->base,
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index aaed8e12ad0b..926b1deb1116 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -802,6 +802,9 @@ struct drm_panthor_queue_submit {
 	 * Must be 64-bit/8-byte aligned (the size of a CS instruction)
 	 *
 	 * Can be zero if stream_addr is zero too.
+	 *
+	 * When the stream size is zero, the queue submit serves as a
+	 * synchronization point.
 	 */
 	__u32 stream_size;
 
@@ -822,6 +825,8 @@ struct drm_panthor_queue_submit {
 	 * ensure the GPU doesn't get garbage when reading the indirect command
 	 * stream buffers. If you want the cache flush to happen
 	 * unconditionally, pass a zero here.
+	 *
+	 * Ignored when stream_size is zero.
 	 */
 	__u32 latest_flush;
 
-- 
2.45.0

