Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BDF72DDAA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 11:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F03E10E355;
	Tue, 13 Jun 2023 09:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBFE10E359
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 09:28:51 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0E89B6606F2B;
 Tue, 13 Jun 2023 10:28:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686648529;
 bh=Ga32TfiZL1XgODQyiRpZPSa0N7f6w1p/azE7h6mShCo=;
 h=From:To:Cc:Subject:Date:From;
 b=mGxYqk6JVJL03OG9vc0MJkV5uIxzojhblqzoWBM7qWCkboJD8XuU718uH8BGK0g8u
 BAe6Fu+bVqigxIDcUvHkD6kILLFW0pEjs3iGVfPEGrk8e0KWl72FLwZbddrUhzcvLk
 8yzZzLyrHh0gEvXaAtFTl9alVfXf4t6kZ1/bPIptJPiHfDVj0lY+w6c31EXVuA31Fr
 yhyv1K0CL21a5SMIEqFTWrmoT3mpDE7i78jjFH7N0g/yjbepzN55cLjYbXFhGVmaFJ
 6nnbYTT6IMX3ckjxlrFUilyOtsjQc71WFH/eSrq91QV7NcRjYR+PTyECXT5qI56AUh
 /5a9aeXMjicTg==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/sched: Make sure we wait for all dependencies in
 kill_jobs_cb()
Date: Tue, 13 Jun 2023 11:28:45 +0200
Message-Id: <20230613092845.2166940-1-boris.brezillon@collabora.com>
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

We also make sure we wait on drm_sched_fence::finished if we were asked
to wait on drm_sched_fence::scheduled, but the intent was probably to
delegate the wait to the GPU, but we want resources to be completely
idle when killing jobs.

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
 drivers/gpu/drm/scheduler/sched_entity.c | 28 ++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 68e807ae136a..bc1bc3d47f7f 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -176,13 +176,24 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
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
+		struct drm_sched_fence *s_fence = to_drm_sched_fence(f);
+
+		/* Make sure we wait for the finished fence here, so we can
+		 * guarantee that any job we depend on that is still accessing
+		 * resources is done before we signal this job finished fence
+		 * and unblock further accesses on those resources.
+		 */
+		if (s_fence && f == &s_fence->scheduled)
+			f = &s_fence->finished;
+
+		xa_erase(&job->dependencies, index);
 		r = dma_fence_add_callback(f, &job->finish_cb,
 					   drm_sched_entity_kill_jobs_cb);
 		if (!r)
@@ -415,8 +426,17 @@ static struct dma_fence *
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

