Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7B8D0196B
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 09:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F05510E23B;
	Thu,  8 Jan 2026 08:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fyT3UKpK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA6610E6A6
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 08:32:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CC50A60007;
 Thu,  8 Jan 2026 08:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8DDC16AAE;
 Thu,  8 Jan 2026 08:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767861170;
 bh=A9w0BCdpbzO3cEAawaW5oG0xj1MDnVrwPeqSo2zfeBc=;
 h=From:To:Cc:Subject:Date:From;
 b=fyT3UKpKLreox1cC29WGoTYSVcT2OXnPWiXm4VgI4Q7Uj2y3SH9BCbZED1BsSA3C8
 k+FLER4I5ZMvteq/qH6bMuRhHJQ2tSMBwdQI96KeuLUkappdbNzafVQ4cMNIe9+R9W
 j4LuIbB99+ZHxUv+ZECfYKsedvqDEhN9FSaRJEfwyM7oUZ/2RsfbsTYMoIlJ51A0uI
 beIR/ap/+cJZvEcrwJSfURJYjGLrSNwicgjAjSbUPAjzeo0KIA4+yBy9dg8gZRUmPY
 eWo7hHS79P9ZA5cqVHtCLpp+IwsYPSh1Nk5gVINraFTun1u26s1deXP1EE4/zGW8f9
 obktCBUjCUKoQ==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sched: Remove racy hack from drm_sched_fini()
Date: Thu,  8 Jan 2026 09:30:20 +0100
Message-ID: <20260108083019.63532-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
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

drm_sched_fini() contained a hack to work around a race in amdgpu.
According to AMD, the hack should not be necessary anymore. In case
there should have been undetected users,

commit 975ca62a014c ("drm/sched: Add warning for removing hack in drm_sched_fini()")

had added a warning one release cycle ago.

Thus, it can be derived that the hack can be savely removed by now.

Remove the hack.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
As hinted at in the commit, I want to cozyly queue this one up for the
next merge window, since we're printing that warning since last merge
window already.

If someone has concerns I'm also happy to delay this patch for a few
more releases.
---
 drivers/gpu/drm/scheduler/sched_main.c | 38 +-------------------------
 1 file changed, 1 insertion(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 1d4f1b822e7b..381c1694a12e 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1416,48 +1416,12 @@ static void drm_sched_cancel_remaining_jobs(struct drm_gpu_scheduler *sched)
  */
 void drm_sched_fini(struct drm_gpu_scheduler *sched)
 {
-	struct drm_sched_entity *s_entity;
 	int i;
 
 	drm_sched_wqueue_stop(sched);
 
-	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
-		struct drm_sched_rq *rq = sched->sched_rq[i];
-
-		spin_lock(&rq->lock);
-		list_for_each_entry(s_entity, &rq->entities, list) {
-			/*
-			 * Prevents reinsertion and marks job_queue as idle,
-			 * it will be removed from the rq in drm_sched_entity_fini()
-			 * eventually
-			 *
-			 * FIXME:
-			 * This lacks the proper spin_lock(&s_entity->lock) and
-			 * is, therefore, a race condition. Most notably, it
-			 * can race with drm_sched_entity_push_job(). The lock
-			 * cannot be taken here, however, because this would
-			 * lead to lock inversion -> deadlock.
-			 *
-			 * The best solution probably is to enforce the life
-			 * time rule of all entities having to be torn down
-			 * before their scheduler. Then, however, locking could
-			 * be dropped alltogether from this function.
-			 *
-			 * For now, this remains a potential race in all
-			 * drivers that keep entities alive for longer than
-			 * the scheduler.
-			 *
-			 * The READ_ONCE() is there to make the lockless read
-			 * (warning about the lockless write below) slightly
-			 * less broken...
-			 */
-			if (!READ_ONCE(s_entity->stopped))
-				dev_warn(sched->dev, "Tearing down scheduler with active entities!\n");
-			s_entity->stopped = true;
-		}
-		spin_unlock(&rq->lock);
+	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++)
 		kfree(sched->sched_rq[i]);
-	}
 
 	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
 	wake_up_all(&sched->job_scheduled);
-- 
2.49.0

