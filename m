Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47821A5EF96
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 10:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F0410E815;
	Thu, 13 Mar 2025 09:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IqL+fq/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A6810E815
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 09:31:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4CFAEA46589;
 Thu, 13 Mar 2025 09:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29AFC4CEDD;
 Thu, 13 Mar 2025 09:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741858291;
 bh=KzcPX5aFNSENYiyWmPKs6DdjY4qW1KEAD7qnBC2uPzg=;
 h=From:To:Cc:Subject:Date:From;
 b=IqL+fq/lOrx2GHPF3cFWiCwW0BxjGBHhRxjOQEHiHu73ZP48yxhPCxjHHdh0PoP6x
 kr7ADyX6Y4W/HsGnkc3W7hGfpOnZRweWssxmz0lc8tyQxViUuDhJUI8RCTJfggB4UL
 P+ECpPldPKWfOu0spwDRcTItmhoIklnzF0PHI0h6Oq0r4T9t1bB0o2oUJ1yI8LSTtH
 iZHWosaDHK7pHwzv98PrfK9rd36rbGKXOaIzZ36esvqoM2F/8GraBnHmk+udn81uUl
 PRHPUwFGMLhjKeOwjE1Yt/FsijXBxmjqzpEbXN1wZXl7p5fGjDPwtVdCtviH1d3BUd
 kw4H40PmR8iRw==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/sched: Clarify docu concerning drm_sched_job_arm()
Date: Thu, 13 Mar 2025 10:30:54 +0100
Message-ID: <20250313093053.65001-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The documentation for drm_sched_job_arm() and especially
drm_sched_job_cleanup() does not make it very clear why
drm_sched_job_arm() is a point of no return, which it indeed is.

Make the nature of drm_sched_job_arm() in the docu as clear as possible.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 4d4219fbe49d..829579c41c6b 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -828,11 +828,15 @@ EXPORT_SYMBOL(drm_sched_job_init);
  *
  * This arms a scheduler job for execution. Specifically it initializes the
  * &drm_sched_job.s_fence of @job, so that it can be attached to struct dma_resv
- * or other places that need to track the completion of this job.
+ * or other places that need to track the completion of this job. It also
+ * initializes sequence numbers, which are fundamental for fence ordering.
  *
  * Refer to drm_sched_entity_push_job() documentation for locking
  * considerations.
  *
+ * Once this function was called, you *must* submit @job with
+ * drm_sched_entity_push_job().
+ *
  * This can only be called if drm_sched_job_init() succeeded.
  */
 void drm_sched_job_arm(struct drm_sched_job *job)
@@ -1017,9 +1021,12 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
  * Drivers should call this from their error unwind code if @job is aborted
  * before drm_sched_job_arm() is called.
  *
- * After that point of no return @job is committed to be executed by the
- * scheduler, and this function should be called from the
- * &drm_sched_backend_ops.free_job callback.
+ * drm_sched_job_arm() is a point of no return since it initializes the fences
+ * and their sequence number etc. Once that function has been called, you *must*
+ * submit it with drm_sched_entity_push_job() and cannot simply abort it by
+ * calling drm_sched_job_cleanup().
+ *
+ * This function should be called in the &drm_sched_backend_ops.free_job callback.
  */
 void drm_sched_job_cleanup(struct drm_sched_job *job)
 {
@@ -1027,10 +1034,15 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
 	unsigned long index;
 
 	if (kref_read(&job->s_fence->finished.refcount)) {
-		/* drm_sched_job_arm() has been called */
+		/* The job has been processed by the scheduler, i.e.,
+		 * drm_sched_job_arm() and drm_sched_entity_push_job() have
+		 * been called.
+		 */
 		dma_fence_put(&job->s_fence->finished);
 	} else {
-		/* aborted job before committing to run it */
+		/* The job was aborted before it has been committed to be run;
+		 * notably, drm_sched_job_arm() has not been called.
+		 */
 		drm_sched_fence_free(job->s_fence);
 	}
 
-- 
2.48.1

