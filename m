Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF21A9A930
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 11:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255FB10E7BB;
	Thu, 24 Apr 2025 09:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DN2jpb84";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E27710E7BB;
 Thu, 24 Apr 2025 09:56:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8426468455;
 Thu, 24 Apr 2025 09:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064FEC4CEE3;
 Thu, 24 Apr 2025 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745488582;
 bh=uDucjiIXIOMk0SOi1/h4I9CU9DMx2BoeK9EwYcIl2RM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DN2jpb848NX1mc1DlP4cENi4/aCFYjMEzfMDn1yADdNEPdNZzIl0ydEC44VOiWyt3
 UprMnYdrorHMepPujLGTXPkhYBIebs8nqrZ1hQ5rzd1H2iFQyFn3+57vVCYScj3tDF
 FsgpPKWd449+d4YAmDZOZNkJ//6C+OtXZL/ILWxk6DbSh4BBywxLWD6NyehM+Ou6X7
 f9R0/bfaY/DRvdVsIJX1NSl3q4XscsN1OCsVew8bTL3Q51+wxDOzPaUCM6jM26bxCT
 5Aa35NnVmwb1tXE4Di/viPPHiPIOAbRxDjJFV5YCNySdhrJvMJtcm33VqB4sB1IVZB
 0l6N+Dgf5LDCA==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] drm/sched: Port unit tests to new cleanup design
Date: Thu, 24 Apr 2025 11:55:36 +0200
Message-ID: <20250424095535.26119-8-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250424095535.26119-2-phasta@kernel.org>
References: <20250424095535.26119-2-phasta@kernel.org>
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

The unit tests so far took care manually of avoiding memory leaks that
might have occurred when calling drm_sched_fini().

The scheduler now takes care by itself of avoiding memory leaks if the
driver provides the callback drm_sched_backend_ops.kill_fence_context().

Implement that callback for the unit tests. Remove the manual cleanup
code.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 .../gpu/drm/scheduler/tests/mock_scheduler.c  | 34 ++++++++++++-------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index f999c8859cf7..a72d26ca8262 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -228,10 +228,30 @@ static void mock_sched_free_job(struct drm_sched_job *sched_job)
 	/* Mock job itself is freed by the kunit framework. */
 }
 
+static void mock_sched_fence_context_kill(struct drm_gpu_scheduler *gpu_sched)
+{
+	struct drm_mock_scheduler *sched = drm_sched_to_mock_sched(gpu_sched);
+	struct drm_mock_sched_job *job;
+	unsigned long flags;
+
+	spin_lock_irqsave(&sched->lock, flags);
+	list_for_each_entry(job, &sched->job_list, link) {
+		spin_lock(&job->lock);
+		if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
+			dma_fence_set_error(&job->hw_fence, -ECANCELED);
+			dma_fence_signal_locked(&job->hw_fence);
+		}
+		complete(&job->done);
+		spin_unlock(&job->lock);
+	}
+	spin_unlock_irqrestore(&sched->lock, flags);
+}
+
 static const struct drm_sched_backend_ops drm_mock_scheduler_ops = {
 	.run_job = mock_sched_run_job,
 	.timedout_job = mock_sched_timedout_job,
-	.free_job = mock_sched_free_job
+	.free_job = mock_sched_free_job,
+	.kill_fence_context = mock_sched_fence_context_kill,
 };
 
 /**
@@ -300,18 +320,6 @@ void drm_mock_sched_fini(struct drm_mock_scheduler *sched)
 		drm_mock_sched_job_complete(job);
 	spin_unlock_irqrestore(&sched->lock, flags);
 
-	/*
-	 * Free completed jobs and jobs not yet processed by the DRM scheduler
-	 * free worker.
-	 */
-	spin_lock_irqsave(&sched->lock, flags);
-	list_for_each_entry_safe(job, next, &sched->done_list, link)
-		list_move_tail(&job->link, &list);
-	spin_unlock_irqrestore(&sched->lock, flags);
-
-	list_for_each_entry_safe(job, next, &list, link)
-		mock_sched_free_job(&job->base);
-
 	drm_sched_fini(&sched->base);
 }
 
-- 
2.48.1

