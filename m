Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OwqG22hrmkLHAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 11:31:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C052371C4
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 11:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D2310E4CD;
	Mon,  9 Mar 2026 10:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HSpkFaqS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F6010E4CD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 10:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1773052263;
 bh=sjuCzgwoscMNTs1SC48pcKGTS8isMiaZ+SPtTKYXi+0=;
 h=From:To:Cc:Subject:Date:From;
 b=HSpkFaqSdNMulsrT/cqW/lZTZChOxS1wjfT+iEmfDUrgtkt/Xsn9hcxNAL9pbDOYg
 Z8bQFAXEID7PngmxHz6cr+IwnlCFYS/867ELZHTFiS8SvODOf3OcQ/Y36jC4ilFDhe
 cTwo+GziCKeg6TREVel4+IWVsGa1z/Aj6BA2VceYQux7bXlTLnaTfChvGUqTDefMB0
 jddsQGCnua26+u5t4m1rBaVsvkcibOS573IeCrdewk+ytAG40K4gGTdw1MvFcbRlWP
 sjr2003z/BpzMttrwsDn/bcMjtQoaVrhzosOH0hVItahDz4b1axvD4AWjBj1lQBMPJ
 l8QBtP64XGDRQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4D66B17E0E91;
 Mon,  9 Mar 2026 11:31:03 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/panthor: Fix the "done_fence is initialized" detection
 logic
Date: Mon,  9 Mar 2026 11:30:53 +0100
Message-ID: <20260309103053.211415-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.53.0
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
X-Rspamd-Queue-Id: 75C052371C4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:kernel@collabora.com,m:nicolas.frattaroli@collabora.com,m:tvrtko.ursulin@igalia.com,m:phasta@kernel.org,m:christian.koenig@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.977];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,arm.com:email,collabora.com:dkim,collabora.com:email,collabora.com:mid,igalia.com:email]
X-Rspamd-Action: no action

After commit 541c8f2468b9 ("dma-buf: detach fence ops on signal v3"),
dma_fence::ops == NULL can't be used to check if the fence is initialized
or not. We could turn this into an "is_signaled() || ops == NULL" test,
but that's fragile, since it's still subject to dma_fence internal
changes. So let's have the "is_initialized" state encoded directly in
the pointer through the lowest bit which is guaranteed to be unused
because of the dma_fence alignment constraint.

Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Christian König <christian.koenig@amd.com>
Reported-by: Steven Price <steven.price@arm.com>
Reported-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 69 ++++++++++++++++++-------
 1 file changed, 50 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index bd703a2904a1..31589add86f5 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -835,8 +835,15 @@ struct panthor_job {
 	 */
 	struct list_head node;
 
-	/** @done_fence: Fence signaled when the job is finished or cancelled. */
-	struct dma_fence *done_fence;
+	/**
+	 * @done_fence: Fence signaled when the job is finished or cancelled.
+	 *
+	 * This is a uintptr_t because we use the lower bit to encode whether
+	 * the fence has been initialized or not, and we don't want code to dereference
+	 * this field directly (job_done_fence()/job_done_fence_initialized() should be used
+	 * instead).
+	 */
+	uintptr_t done_fence;
 
 	/** @profiling: Job profiling information. */
 	struct {
@@ -1518,6 +1525,18 @@ cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
 		 info);
 }
 
+#define DONE_FENCE_INITIALIZED BIT(0)
+
+static struct dma_fence *job_done_fence(struct panthor_job *job)
+{
+	return (void *)(job->done_fence & ~(uintptr_t)DONE_FENCE_INITIALIZED);
+}
+
+static bool job_done_fence_initialized(struct panthor_job *job)
+{
+	return job->done_fence & DONE_FENCE_INITIALIZED;
+}
+
 static void
 cs_slot_process_fault_event_locked(struct panthor_device *ptdev,
 				   u32 csg_id, u32 cs_id)
@@ -1549,7 +1568,7 @@ cs_slot_process_fault_event_locked(struct panthor_device *ptdev,
 			if (cs_extract < job->ringbuf.start)
 				break;
 
-			dma_fence_set_error(job->done_fence, -EINVAL);
+			dma_fence_set_error(job_done_fence(job), -EINVAL);
 		}
 		spin_unlock(&queue->fence_ctx.lock);
 	}
@@ -2182,9 +2201,11 @@ group_term_post_processing(struct panthor_group *group)
 
 		spin_lock(&queue->fence_ctx.lock);
 		list_for_each_entry_safe(job, tmp, &queue->fence_ctx.in_flight_jobs, node) {
+			struct dma_fence *done_fence = job_done_fence(job);
+
 			list_move_tail(&job->node, &faulty_jobs);
-			dma_fence_set_error(job->done_fence, err);
-			dma_fence_signal_locked(job->done_fence);
+			dma_fence_set_error(done_fence, err);
+			dma_fence_signal_locked(done_fence);
 		}
 		spin_unlock(&queue->fence_ctx.lock);
 
@@ -2734,7 +2755,7 @@ static void queue_start(struct panthor_queue *queue)
 
 	/* Re-assign the parent fences. */
 	list_for_each_entry(job, &queue->scheduler.pending_list, base.list)
-		job->base.s_fence->parent = dma_fence_get(job->done_fence);
+		job->base.s_fence->parent = dma_fence_get(job_done_fence(job));
 
 	enable_delayed_work(&queue->timeout.work);
 	drm_sched_start(&queue->scheduler, 0);
@@ -3047,6 +3068,8 @@ static bool queue_check_job_completion(struct panthor_queue *queue)
 	cookie = dma_fence_begin_signalling();
 	spin_lock(&queue->fence_ctx.lock);
 	list_for_each_entry_safe(job, job_tmp, &queue->fence_ctx.in_flight_jobs, node) {
+		struct dma_fence *done_fence = job_done_fence(job);
+
 		if (!syncobj) {
 			struct panthor_group *group = job->group;
 
@@ -3054,11 +3077,11 @@ static bool queue_check_job_completion(struct panthor_queue *queue)
 				  (job->queue_idx * sizeof(*syncobj));
 		}
 
-		if (syncobj->seqno < job->done_fence->seqno)
+		if (syncobj->seqno < done_fence->seqno)
 			break;
 
 		list_move_tail(&job->node, &done_jobs);
-		dma_fence_signal_locked(job->done_fence);
+		dma_fence_signal_locked(done_fence);
 	}
 
 	if (list_empty(&queue->fence_ctx.in_flight_jobs)) {
@@ -3309,8 +3332,10 @@ queue_run_job(struct drm_sched_job *sched_job)
 	 * drm_sched_job::s_fence::finished fence.
 	 */
 	if (!job->call_info.size) {
-		job->done_fence = dma_fence_get(queue->fence_ctx.last_fence);
-		return dma_fence_get(job->done_fence);
+		done_fence = dma_fence_get(queue->fence_ctx.last_fence);
+
+		job->done_fence = (uintptr_t)done_fence | DONE_FENCE_INITIALIZED;
+		return dma_fence_get(done_fence);
 	}
 
 	ret = panthor_device_resume_and_get(ptdev);
@@ -3323,11 +3348,13 @@ queue_run_job(struct drm_sched_job *sched_job)
 		goto out_unlock;
 	}
 
-	dma_fence_init(job->done_fence,
+	done_fence = job_done_fence(job);
+	dma_fence_init(done_fence,
 		       &panthor_queue_fence_ops,
 		       &queue->fence_ctx.lock,
 		       queue->fence_ctx.id,
 		       atomic64_inc_return(&queue->fence_ctx.seqno));
+	job->done_fence |= DONE_FENCE_INITIALIZED;
 
 	job->profiling.slot = queue->profiling.seqno++;
 	if (queue->profiling.seqno == queue->profiling.slot_count)
@@ -3381,9 +3408,9 @@ queue_run_job(struct drm_sched_job *sched_job)
 
 	/* Update the last fence. */
 	dma_fence_put(queue->fence_ctx.last_fence);
-	queue->fence_ctx.last_fence = dma_fence_get(job->done_fence);
+	queue->fence_ctx.last_fence = dma_fence_get(done_fence);
 
-	done_fence = dma_fence_get(job->done_fence);
+	done_fence = dma_fence_get(done_fence);
 
 out_unlock:
 	mutex_unlock(&sched->lock);
@@ -3403,7 +3430,7 @@ queue_timedout_job(struct drm_sched_job *sched_job)
 	struct panthor_queue *queue = group->queues[job->queue_idx];
 
 	drm_warn(&ptdev->base, "job timeout: pid=%d, comm=%s, seqno=%llu\n",
-		 group->task_info.pid, group->task_info.comm, job->done_fence->seqno);
+		 group->task_info.pid, group->task_info.comm, job_done_fence(job)->seqno);
 
 	drm_WARN_ON(&ptdev->base, atomic_read(&sched->reset.in_progress));
 
@@ -3915,10 +3942,10 @@ static void job_release(struct kref *ref)
 	if (job->base.s_fence)
 		drm_sched_job_cleanup(&job->base);
 
-	if (job->done_fence && job->done_fence->ops)
-		dma_fence_put(job->done_fence);
+	if (job_done_fence_initialized(job))
+		dma_fence_put(job_done_fence(job));
 	else
-		dma_fence_free(job->done_fence);
+		dma_fence_free(job_done_fence(job));
 
 	group_put(job->group);
 
@@ -4011,11 +4038,15 @@ panthor_job_create(struct panthor_file *pfile,
 	 * the previously submitted job.
 	 */
 	if (job->call_info.size) {
-		job->done_fence = kzalloc_obj(*job->done_fence);
-		if (!job->done_fence) {
+		struct dma_fence *done_fence;
+
+		done_fence = kzalloc_obj(*done_fence);
+		if (!done_fence) {
 			ret = -ENOMEM;
 			goto err_put_job;
 		}
+
+		job->done_fence = (uintptr_t)done_fence;
 	}
 
 	job->profiling.mask = pfile->ptdev->profile_mask;
-- 
2.53.0

