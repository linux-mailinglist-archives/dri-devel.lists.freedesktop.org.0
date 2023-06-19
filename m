Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FF3734C46
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 09:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3C110E0D2;
	Mon, 19 Jun 2023 07:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E9510E0D2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 07:19:28 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 20C016606EAC;
 Mon, 19 Jun 2023 08:19:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687159166;
 bh=PAe5fphUe0hRGKKXNJ8Wf3441gHNDTywgsJZ6WnNzjM=;
 h=From:To:Cc:Subject:Date:From;
 b=b+T1Orm7SaFv8vE43NUY8MDgzvFxXK5IoSHXvD9J0jp6LKlrnVWbHuBdZttMVcgEs
 luVgn3Q9i9HBd1c04vwPtaUVPcDHogcivMyKdds6oAL/ZXWExiQfxkINGeG0uTQqld
 r6rhSfJAuppL/BCpBbeqaI5OKFh7AMItEmcGTlYjTRpSpVHN9GGsA+7Jk2BpdvlSMe
 tZKpDeKCrZ+bFrVkClkCeJK24Zh4tnn8U4fdNSDqXYDC+AbHNLzFHiNRjKXvnDGg/Z
 hSZnyS7Mc+3iwD8QtlakbRFRwlBOYpUNZ8FfCV13DKPIvGM5uYFlIklJ77/UnSFZC9
 PbAfUq3QnRS8Q==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6] drm/sched: Make sure we wait for all dependencies in
 kill_jobs_cb()
Date: Mon, 19 Jun 2023 09:19:21 +0200
Message-Id: <20230619071921.3465992-1-boris.brezillon@collabora.com>
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

We also make sure we wait on drm_sched_fence::finished if we were
originally asked to wait on drm_sched_fence::scheduled. In that case,
we assume the intent was to delegate the wait to the firmware/GPU or
rely on the pipelining done at the entity/scheduler level, but when
killing jobs, we really want to wait for completion not just scheduling.

v6:
- Back to v4 implementation
- Add Christian's R-b

v5:
- Flag deps on which we should only wait for the scheduled event
  at insertion time

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
Reviewed-by: "Christian König" <christian.koenig@amd.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Sarah Walker <sarah.walker@imgtec.com>
Cc: Donald Robson <donald.robson@imgtec.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 41 +++++++++++++++++++-----
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 68e807ae136a..ec41d82d0141 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -176,16 +176,32 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 {
 	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
 						 finish_cb);
-	int r;
+	unsigned long index;
 
 	dma_fence_put(f);
 
 	/* Wait for all dependencies to avoid data corruptions */
-	while (!xa_empty(&job->dependencies)) {
-		f = xa_erase(&job->dependencies, job->last_dependency++);
-		r = dma_fence_add_callback(f, &job->finish_cb,
-					   drm_sched_entity_kill_jobs_cb);
-		if (!r)
+	xa_for_each(&job->dependencies, index, f) {
+		struct drm_sched_fence *s_fence = to_drm_sched_fence(f);
+
+		if (s_fence && f == &s_fence->scheduled) {
+			/* The dependencies array had a reference on the scheduled
+			 * fence, and the finished fence refcount might have
+			 * dropped to zero. Use dma_fence_get_rcu() so we get
+			 * a NULL fence in that case.
+			 */
+			f = dma_fence_get_rcu(&s_fence->finished);
+
+			/* Now that we have a reference on the finished fence,
+			 * we can release the reference the dependencies array
+			 * had on the scheduled fence.
+			 */
+			dma_fence_put(&s_fence->scheduled);
+		}
+
+		xa_erase(&job->dependencies, index);
+		if (f && !dma_fence_add_callback(f, &job->finish_cb,
+						 drm_sched_entity_kill_jobs_cb))
 			return;
 
 		dma_fence_put(f);
@@ -415,8 +431,17 @@ static struct dma_fence *
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
+		job->last_dependency++;
+		return dma_fence_get(f);
+	}
 
 	if (job->sched->ops->prepare_job)
 		return job->sched->ops->prepare_job(job, entity);
-- 
2.40.1

