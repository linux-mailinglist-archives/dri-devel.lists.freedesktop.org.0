Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF0572A1C0
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 20:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFF910E6D3;
	Fri,  9 Jun 2023 18:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1722A10E6D3
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 18:00:04 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B7ED26606F38;
 Fri,  9 Jun 2023 19:00:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686333601;
 bh=j/ht987nCaTtXWmc1b9SmK5KiBdMh4oTyMUfGJG5sTM=;
 h=From:To:Cc:Subject:Date:From;
 b=T2gBpiv7+fgGw8br99NnAMAvxLgdz20bi93VFWEz9YkYZ7kt+v7JGaTX+LUmbxHoV
 xgha+YBr9/ZD8MqGeJBc6xVxaqBugWXKdIoBwMhiP4inc/EJTe5LrMg8JSJh1btHdv
 jl47bGQRtiCvNLDDJQIj14lfiOL7ShRtuQiE+mRXekvMbRSDA17rOkFWlhfjLpvJYN
 LHJoJrgko1FgHNYJkqLosm//MNYto6yI+hbH2DdLE7a7YLu3k/yDlFbvnh9mAyR0gL
 0HCuAYniSIwK1KERkRMc5lD2Oi5X3PmsiSVw3zbleQu3WRS1v2YV6yJQ9jwJ/XdT1H
 0yrcxzv7PqiIA==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/sched: Make sure we wait for all dependencies in
 kill_jobs_cb()
Date: Fri,  9 Jun 2023 19:59:57 +0200
Message-Id: <20230609175957.1369395-1-boris.brezillon@collabora.com>
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
 drivers/gpu/drm/scheduler/sched_entity.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 68e807ae136a..e1b437e66f3c 100644
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
@@ -415,8 +416,17 @@ static struct dma_fence *
 drm_sched_job_dependency(struct drm_sched_job *job,
 			 struct drm_sched_entity *entity)
 {
-	if (!xa_empty(&job->dependencies))
-		return xa_erase(&job->dependencies, job->last_dependency++);
+	struct dma_fence *f;
+
+	/* We keep the fence around, so we can iterate over all dependencies
+	 * in drm_sched_entity_kill_jobs_cb() to make all deps are signaled
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

