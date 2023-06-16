Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C85733736
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 19:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A383E10E107;
	Fri, 16 Jun 2023 17:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B474A10E107
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 17:12:55 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7C95C6606F61;
 Fri, 16 Jun 2023 18:12:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686935572;
 bh=KT3G6zPrQptCQJefKC8dmp1qK7KRYaMwDWOe0IWXv1A=;
 h=From:To:Cc:Subject:Date:From;
 b=EADfb0fImi6Sv4DAIltygoPNmBIkzo3YwCdaUw2Xclpe2C44Ehi3MVPF+EE17NqNa
 791N9BGX8NP9TQXetWD+zW43nHDywObg9pIPTiiZ1d2esleMdW3jJ8+a6e6hHP8Iwv
 N1bwX7ZHD9yuATltreRHVOMVzOOzjCH9/q8j6olhzllgt3g/8wzEp58dGl+Xtz9+Wm
 VWaYa+DouK42V5iIgd5mY+Kc9Y7Ee49E5bxIKTDG1+BlirYLvODD9NjEhQvsd42OHg
 2pxa+SNr7kH/9JaFgI31IEo4p4T0T2tMnTto35/2S/moYp8tfqnlc7ZQ/yABsPdSdL
 z7Mf2YmiTL/eg==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5] drm/sched: Make sure we wait for all dependencies in
 kill_jobs_cb()
Date: Fri, 16 Jun 2023 19:12:48 +0200
Message-Id: <20230616171248.3228113-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Luben Tuikov <luben.tuikov@amd.com>, Sarah Walker <sarah.walker@imgtec.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Donald Robson <donald.robson@imgtec.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_sched_entity_kill_jobs_cb() logic is omitting the last fence popped
from the dependency array that was waited upon before
drm_sched_entity_kill() was called (drm_sched_entity::dependency field),
so we're basically waiting for all dependencies except one.

In theory, this wait shouldn't be needed because resources should have
their users registered to the dma_resv object, thus guaranteeing that
future jobs wanting to access these resources wait on all the previous
users (depending on the access type, of course). But we want to keep
these explicit waits in the kill entity path just in case.

Let's make sure we keep all dependencies in the array in
drm_sched_job_dependency(), so we can iterate over the array and wait
in drm_sched_entity_kill_jobs_cb().

We make sure we wait on drm_sched_fence::finished if we were
originally asked to wait on drm_sched_fence::scheduled. In that case,
we assume the intent was to delegate the wait to the firmware/GPU or
rely on the pipelining done at the entity/scheduler level, but when
killing jobs, we really want to wait for completion not just scheduling.

v5:
- Flag deps on which we should only wait for the scheduled event
  at insertion time.

v4:
- Fix commit message
- Fix a use-after-free bug

v3:
- Always wait for drm_sched_fence::finished fences in
  drm_sched_entity_kill_jobs_cb() when we see a sched_fence

v2:
- Don't evict deps in drm_sched_job_dependency()

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Suggested-by: "Christian König" <christian.koenig@amd.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Sarah Walker <sarah.walker@imgtec.com>
Cc: Donald Robson <donald.robson@imgtec.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
---
Hello Christian,

It turns out the approach you suggested just moves the complexity to
the insertion path, and it actually makes the 'should we replace or
drop fence' test a bit more tedious. We might end up with less
duplicates if some drivers start mixing scheduled/finished fences, but
I doubt this will be the case in practice, and I'm not sure it's worth
the extra complexity.

Let me know what you think.

Regards,

Boris
---
 drivers/gpu/drm/scheduler/sched_entity.c | 29 ++++++++++++--
 drivers/gpu/drm/scheduler/sched_main.c   | 50 +++++++++++++++++++++++-
 include/drm/gpu_scheduler.h              |  7 ++++
 3 files changed, 80 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 68e807ae136a..ffdee2544f42 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -176,13 +176,14 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 {
 	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
 						 finish_cb);
+	unsigned long index;
 	int r;
 
 	dma_fence_put(f);
 
 	/* Wait for all dependencies to avoid data corruptions */
-	while (!xa_empty(&job->dependencies)) {
-		f = xa_erase(&job->dependencies, job->last_dependency++);
+	xa_for_each(&job->dependencies, index, f) {
+		xa_erase(&job->dependencies, index);
 		r = dma_fence_add_callback(f, &job->finish_cb,
 					   drm_sched_entity_kill_jobs_cb);
 		if (!r)
@@ -415,8 +416,28 @@ static struct dma_fence *
 drm_sched_job_dependency(struct drm_sched_job *job,
 			 struct drm_sched_entity *entity)
 {
-	if (!xa_empty(&job->dependencies))
-		return xa_erase(&job->dependencies, job->last_dependency++);
+	struct dma_fence *f;
+
+	/* We keep the fence around, so we can iterate over all dependencies
+	 * in drm_sched_entity_kill_jobs_cb() to ensure all deps are signaled
+	 * before killing the job.
+	 */
+	f = xa_load(&job->dependencies, job->last_dependency);
+	if (f) {
+		/* If the entry is flagged as 'wait-for-scheduled', we are
+		 * dealing with a drm_sched_fence and we want to wait for
+		 * the scheduled event only.
+		 */
+		if (xa_get_mark(&job->dependencies, job->last_dependency,
+				DRM_SCHED_DEP_WAIT_FOR_SCHEDULED)) {
+			struct drm_sched_fence *s_fence = to_drm_sched_fence(f);
+
+			f = &s_fence->scheduled;
+		}
+
+		job->last_dependency++;
+		return dma_fence_get(f);
+	}
 
 	if (job->sched->ops->prepare_job)
 		return job->sched->ops->prepare_job(job, entity);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 394010a60821..8ac207cbd713 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -691,6 +691,8 @@ EXPORT_SYMBOL(drm_sched_job_arm);
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence)
 {
+	bool fence_wait_for_scheduled = false;
+	struct drm_sched_fence *s_fence;
 	struct dma_fence *entry;
 	unsigned long index;
 	u32 id = 0;
@@ -699,20 +701,64 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
 	if (!fence)
 		return 0;
 
+	s_fence = to_drm_sched_fence(fence);
+	if (s_fence && fence == &s_fence->scheduled) {
+		/* Make sure the finished fence hasn't been destroyed. */
+		fence = dma_fence_get_rcu(&s_fence->finished);
+		if (WARN_ON(!fence))
+			return -EINVAL;
+
+		/* Release the scheduled fence ref, now that we have a
+		 * ref on the finished fence.
+		 */
+		dma_fence_put(&s_fence->scheduled);
+
+		/* Waiting for scheduled event only. */
+		fence_wait_for_scheduled = true;
+	}
+
 	/* Deduplicate if we already depend on a fence from the same context.
 	 * This lets the size of the array of deps scale with the number of
 	 * engines involved, rather than the number of BOs.
 	 */
 	xa_for_each(&job->dependencies, index, entry) {
+		bool entry_wait_for_scheduled, fence_is_later;
+
 		if (entry->context != fence->context)
 			continue;
 
-		if (dma_fence_is_later(fence, entry)) {
+		entry_wait_for_scheduled = xa_get_mark(&job->dependencies,
+						       index,
+						       DRM_SCHED_DEP_WAIT_FOR_SCHEDULED);
+		fence_is_later = dma_fence_is_later(fence, entry);
+
+		/*
+		 * We can replace entry by fence when:
+		 * - fence is after entry and both are waiting on scheduled
+		 * - fence is after entry and both are waiting on finished
+		 * - fence is after entry, entry is waiting on scheduled and fence on finished
+		 *
+		 * We can keep entry and drop fence when:
+		 * - fence is before entry and both are waiting on scheduled
+		 * - fence is before entry and both are waiting on finished
+		 * - fence is before entry, fence is waiting on scheduled and entry on finished
+		 *
+		 * In all other situations, we can't guarantee the order and have to duplicate.
+		 */
+		if (fence_is_later && entry_wait_for_scheduled >= fence_wait_for_scheduled) {
 			dma_fence_put(entry);
 			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
-		} else {
+			if (fence_wait_for_scheduled) {
+				xa_set_mark(&job->dependencies, index,
+					    DRM_SCHED_DEP_WAIT_FOR_SCHEDULED);
+			}
+		} else if (!fence_is_later &&
+			   entry_wait_for_scheduled <= fence_wait_for_scheduled) {
 			dma_fence_put(fence);
+		} else {
+			continue;
 		}
+
 		return 0;
 	}
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index e95b4837e5a3..fbdb01242997 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -262,6 +262,13 @@ struct drm_sched_rq {
 	struct rb_root_cached		rb_tree_root;
 };
 
+/*
+ * Used to flag dependency entries that are backed by drm_sched_fence object
+ * and on which we should only wait for the scheduled events.
+ * For internal use only.
+ */
+#define DRM_SCHED_DEP_WAIT_FOR_SCHEDULED	XA_MARK_1
+
 /**
  * struct drm_sched_fence - fences corresponding to the scheduling of a job.
  */
-- 
2.40.1

