Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A952993565
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 19:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C229910E3EB;
	Mon,  7 Oct 2024 17:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JqNqja/y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B5910E3EB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 17:51:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 406BDA41DC7;
 Mon,  7 Oct 2024 17:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D93C4CEC6;
 Mon,  7 Oct 2024 17:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1728323490;
 bh=eTvi1i916eu5nJb7D9IIzLqRBSZm5ee1HTa/7claqgs=;
 h=Subject:To:Cc:From:Date:From;
 b=JqNqja/ybUNZ+IIvvmRiAATzCgoPMfTMxgymol2cQoYt2IGEZmK70gp4+CrV5wA18
 BIEoH5ZlMtVjyGFHROxVFVzgoH7vHNN73rxEBXgdDwHa5htB0EJgtqrpch+F/oiu66
 U2O684Y6WU6k8zUYGkLiWKsZvzVWLO7lSZXfYr/M=
Subject: Patch "drm/sched: Always wake up correct scheduler in
 drm_sched_entity_push_job" has been added to the 6.10-stable tree
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 ltuikov89@gmail.com, matthew.brost@intel.com, pstanner@redhat.com,
 tvrtko.ursulin@igalia.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 07 Oct 2024 19:50:52 +0200
Message-ID: <2024100752-shaking-sycamore-3cc4@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    drm/sched: Always wake up correct scheduler in drm_sched_entity_push_job

to the 6.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-sched-always-wake-up-correct-scheduler-in-drm_sched_entity_push_job.patch
and it can be found in the queue-6.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From cbc8764e29c2318229261a679b2aafd0f9072885 Mon Sep 17 00:00:00 2001
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date: Tue, 24 Sep 2024 11:19:08 +0100
Subject: drm/sched: Always wake up correct scheduler in drm_sched_entity_push_job
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

commit cbc8764e29c2318229261a679b2aafd0f9072885 upstream.

Since drm_sched_entity_modify_sched() can modify the entities run queue,
lets make sure to only dereference the pointer once so both adding and
waking up are guaranteed to be consistent.

Alternative of moving the spin_unlock to after the wake up would for now
be more problematic since the same lock is taken inside
drm_sched_rq_update_fifo().

v2:
 * Improve commit message. (Philipp)
 * Cache the scheduler pointer directly. (Christian)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: b37aced31eb0 ("drm/scheduler: implement a function to modify sched list")
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Philipp Stanner <pstanner@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.7+
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240924101914.2713-3-tursulin@igalia.com
Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -599,6 +599,9 @@ void drm_sched_entity_push_job(struct dr
 
 	/* first job wakes up scheduler */
 	if (first) {
+		struct drm_gpu_scheduler *sched;
+		struct drm_sched_rq *rq;
+
 		/* Add the entity to the run queue */
 		spin_lock(&entity->rq_lock);
 		if (entity->stopped) {
@@ -608,13 +611,16 @@ void drm_sched_entity_push_job(struct dr
 			return;
 		}
 
-		drm_sched_rq_add_entity(entity->rq, entity);
+		rq = entity->rq;
+		sched = rq->sched;
+
+		drm_sched_rq_add_entity(rq, entity);
 		spin_unlock(&entity->rq_lock);
 
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 			drm_sched_rq_update_fifo(entity, submit_ts);
 
-		drm_sched_wakeup(entity->rq->sched);
+		drm_sched_wakeup(sched);
 	}
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);


Patches currently in stable-queue which might be from tvrtko.ursulin@igalia.com are

queue-6.10/drm-sched-always-increment-correct-scheduler-score.patch
queue-6.10/drm-v3d-prevent-out-of-bounds-access-in-performance-query-extensions.patch
queue-6.10/drm-sched-always-wake-up-correct-scheduler-in-drm_sched_entity_push_job.patch
queue-6.10/drm-sched-add-locking-to-drm_sched_entity_modify_sched.patch
