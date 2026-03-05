Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAQjIRkRqmmBKgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 00:26:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3424321940F
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 00:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C44210EC8E;
	Thu,  5 Mar 2026 23:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ldtQVZTC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B2B10EC8E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 23:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+oUS4451NVE3BWL5kWqsK3PhF8Hj9DhwqJmn4fuJZe8=; b=ldtQVZTC6lODlHVsGB2HkvhB0B
 Av78DyWaWUTvrWaOD7GKHhORWijLcQxj7ToSm60RxviWqkdLXJmFxh1PeB8lbMuQGp26Boi7WAkyy
 57hU1FoCIsnMTbv0ELHm1KjSMKN9iEI0kptCjRfFDP1KXFVwfZec3XvejY+ilogAaNVxG/VxbJ8Av
 zFjLjeLBJ+tUE+6mRetSWMn1CfvJ44PG6sycuwBqoi6hztb2SKgpTCNdR2S+pF7trMhI7mj1BtDrI
 AgUnQdeY9U1eJtSYaoaRqY1IbLhM8hEFLLgE/gabKunsk5Bt3kxE5XQaJUH1QeJur3smGj7F8xE3K
 isFqc1nA==;
Received: from [189.7.87.203] (helo=[10.0.0.1])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vyI53-009Zzo-IU; Fri, 06 Mar 2026 00:26:09 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 05 Mar 2026 20:25:53 -0300
Subject: [PATCH v2 4/6] drm/v3d: Hold v3d_stats references in each job
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-v3d-reset-locking-improv-v2-4-fd53c91f7726@igalia.com>
References: <20260305-v3d-reset-locking-improv-v2-0-fd53c91f7726@igalia.com>
In-Reply-To: <20260305-v3d-reset-locking-improv-v2-0-fd53c91f7726@igalia.com>
To: Melissa Wen <mwen@igalia.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Iago Toral Quiroga <itoral@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7509; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=IsFJKwzudZLSad8LbUrhh9BIuR+k61w/CpKD0759A3M=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBpqhEDIC5gspkDOLvq7Q/baPezcr/9Fy7eatC0b
 BGrx0anT6mJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaaoRAwAKCRA/8w6Kdoj6
 qkmhCACClwwO5uaJq2SIZ59ktPZ5vuxIyTOYhXbja6aW2iIvJKc6MlgbnbxVuSKWg0ZoarA6idI
 4bVAdxGv4FHeQ4jt3ZxSqJRICYvLfqTbrQRC89y5KOgjTo8qsL1i2GrtJnoo7k1J+d4g8C8BWxR
 F8nCWbtFNq8Q6viT19r7Ondkhir8GKIFoU9BlIwCttQ5SkR+ce6iVC5wwrwo2Fg5QdQFIGrYLvZ
 ZwI9YTlEC3M6f709JoywWFZ6stYpYxn6Lg/gLI3hIBXlH4IOZqnIGnvk2R87FxZXGThbn8M00Tv
 tRpN5gFnpRBcpSl64sBSXRXyf/jvNXhPgQ/4qEgGP2pXxuyF
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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
X-Rspamd-Queue-Id: 3424321940F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:tvrtko.ursulin@igalia.com,m:mripard@kernel.org,m:kernel-dev@igalia.com,m:mcanal@igalia.com,m:itoral@igalia.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.968];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email]
X-Rspamd-Action: no action

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Have each job hold its own references to the per-fd and global stats
objects. This eliminates the need for `queue_lock` protection in the
stats update path, since the job's stats pointers are guaranteed to
remain valid for the job's entire lifetime regardless of file descriptor
closure.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Co-developed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h    |  6 ++++-
 drivers/gpu/drm/v3d/v3d_irq.c    |  2 +-
 drivers/gpu/drm/v3d/v3d_sched.c  | 57 ++++++++++++++++------------------------
 drivers/gpu/drm/v3d/v3d_submit.c |  6 +++++
 4 files changed, 34 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 03fa2d174b1ca8b5a98a72c4addaa1f977d11174..72c3f40715dae6e86e0c8356cb997cdf1cf03fae 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -326,6 +326,10 @@ struct v3d_job {
 	 */
 	struct v3d_file_priv *file_priv;
 
+	/* Pointers to this job's per-fd and global queue stats. */
+	struct v3d_stats *client_stats;
+	struct v3d_stats *global_stats;
+
 	/* Callback for the freeing of the job on refcount going to 0. */
 	void (*free)(struct kref *ref);
 };
@@ -607,7 +611,7 @@ void v3d_performance_query_info_free(struct v3d_performance_query_info *query_in
 				     unsigned int count);
 struct v3d_stats *v3d_stats_alloc(void);
 void v3d_stats_release(struct kref *refcount);
-void v3d_job_update_stats(struct v3d_job *job, enum v3d_queue q);
+void v3d_job_update_stats(struct v3d_job *job);
 int v3d_sched_init(struct v3d_dev *v3d);
 void v3d_sched_fini(struct v3d_dev *v3d);
 
diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index 1249f6e64b979fe29cf2b9bfc43b39aa755f71ce..c28e74ab5442857031b48bcbd4e43eb48c1e0f07 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -92,7 +92,7 @@ v3d_irq_signal_fence(struct v3d_dev *v3d, enum v3d_queue q,
 	struct v3d_queue_state *queue = &v3d->queue[q];
 	struct v3d_fence *fence = to_v3d_fence(queue->active_job->irq_fence);
 
-	v3d_job_update_stats(queue->active_job, q);
+	v3d_job_update_stats(queue->active_job);
 	trace_irq(&v3d->drm, fence->seqno);
 
 	queue->active_job = NULL;
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 787f21337b2a03a923342fe4f5f927e9214082c4..5c387a152e33f5ccbca6a9af97675f050a2a701f 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -158,24 +158,21 @@ v3d_switch_perfmon(struct v3d_dev *v3d, struct v3d_job *job)
 }
 
 static void
-v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
+v3d_stats_start(struct v3d_stats *stats, u64 now)
+{
+	raw_write_seqcount_begin(&stats->lock);
+	stats->start_ns = now;
+	raw_write_seqcount_end(&stats->lock);
+}
+
+static void
+v3d_job_start_stats(struct v3d_job *job)
 {
-	struct v3d_dev *v3d = job->v3d;
-	struct v3d_file_priv *file = job->file_priv;
-	struct v3d_stats *global_stats = v3d->queue[queue].stats;
-	struct v3d_stats *local_stats = file->stats[queue];
 	u64 now = local_clock();
 
 	preempt_disable();
-
-	raw_write_seqcount_begin(&local_stats->lock);
-	local_stats->start_ns = now;
-	raw_write_seqcount_end(&local_stats->lock);
-
-	raw_write_seqcount_begin(&global_stats->lock);
-	global_stats->start_ns = now;
-	raw_write_seqcount_end(&global_stats->lock);
-
+	v3d_stats_start(job->client_stats, now);
+	v3d_stats_start(job->global_stats, now);
 	preempt_enable();
 }
 
@@ -190,23 +187,13 @@ v3d_stats_update(struct v3d_stats *stats, u64 now)
 }
 
 void
-v3d_job_update_stats(struct v3d_job *job, enum v3d_queue q)
+v3d_job_update_stats(struct v3d_job *job)
 {
-	struct v3d_dev *v3d = job->v3d;
-	struct v3d_queue_state *queue = &v3d->queue[q];
-	struct v3d_stats *global_stats = queue->stats;
 	u64 now = local_clock();
 
 	preempt_disable();
-
-	/* Don't update the local stats if the file context has already closed */
-	spin_lock(&queue->queue_lock);
-	if (job->file_priv)
-		v3d_stats_update(job->file_priv->stats[q], now);
-	spin_unlock(&queue->queue_lock);
-
-	v3d_stats_update(global_stats, now);
-
+	v3d_stats_update(job->client_stats, now);
+	v3d_stats_update(job->global_stats, now);
 	preempt_enable();
 }
 
@@ -250,7 +237,7 @@ static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
 	trace_v3d_submit_cl(dev, false, to_v3d_fence(fence)->seqno,
 			    job->start, job->end);
 
-	v3d_job_start_stats(&job->base, V3D_BIN);
+	v3d_job_start_stats(&job->base);
 	v3d_switch_perfmon(v3d, &job->base);
 
 	/* Set the current and end address of the control list.
@@ -304,7 +291,7 @@ static struct dma_fence *v3d_render_job_run(struct drm_sched_job *sched_job)
 	trace_v3d_submit_cl(dev, true, to_v3d_fence(fence)->seqno,
 			    job->start, job->end);
 
-	v3d_job_start_stats(&job->base, V3D_RENDER);
+	v3d_job_start_stats(&job->base);
 	v3d_switch_perfmon(v3d, &job->base);
 
 	/* XXX: Set the QCFG */
@@ -343,7 +330,7 @@ v3d_tfu_job_run(struct drm_sched_job *sched_job)
 
 	trace_v3d_submit_tfu(dev, to_v3d_fence(fence)->seqno);
 
-	v3d_job_start_stats(&job->base, V3D_TFU);
+	v3d_job_start_stats(&job->base);
 
 	V3D_WRITE(V3D_TFU_IIA(v3d->ver), job->args.iia);
 	V3D_WRITE(V3D_TFU_IIS(v3d->ver), job->args.iis);
@@ -393,7 +380,7 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
 
 	trace_v3d_submit_csd(dev, to_v3d_fence(fence)->seqno);
 
-	v3d_job_start_stats(&job->base, V3D_CSD);
+	v3d_job_start_stats(&job->base);
 	v3d_switch_perfmon(v3d, &job->base);
 
 	csd_cfg0_reg = V3D_CSD_QUEUED_CFG0(v3d->ver);
@@ -681,13 +668,13 @@ v3d_cpu_job_run(struct drm_sched_job *sched_job)
 		return NULL;
 	}
 
-	v3d_job_start_stats(&job->base, V3D_CPU);
+	v3d_job_start_stats(&job->base);
 	trace_v3d_cpu_job_begin(&v3d->drm, job->job_type);
 
 	cpu_job_function[job->job_type](job);
 
 	trace_v3d_cpu_job_end(&v3d->drm, job->job_type);
-	v3d_job_update_stats(&job->base, V3D_CPU);
+	v3d_job_update_stats(&job->base);
 
 	/* Synchronous operation, so no fence to wait on. */
 	return NULL;
@@ -699,11 +686,11 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched_job)
 	struct v3d_job *job = to_v3d_job(sched_job);
 	struct v3d_dev *v3d = job->v3d;
 
-	v3d_job_start_stats(job, V3D_CACHE_CLEAN);
+	v3d_job_start_stats(job);
 
 	v3d_clean_caches(v3d);
 
-	v3d_job_update_stats(job, V3D_CACHE_CLEAN);
+	v3d_job_update_stats(job);
 
 	/* Synchronous operation, so no fence to wait on. */
 	return NULL;
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 18f2bf1fe89face6ede3de465c80b63a6635511e..8f061b6a05c6aa76ea5513407ebf3c0ce80b8256 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -103,6 +103,9 @@ v3d_job_free(struct kref *ref)
 	if (job->perfmon)
 		v3d_perfmon_put(job->perfmon);
 
+	v3d_stats_put(job->client_stats);
+	v3d_stats_put(job->global_stats);
+
 	kfree(job);
 }
 
@@ -203,6 +206,9 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 
 	kref_init(&job->refcount);
 
+	job->client_stats = v3d_stats_get(v3d_priv->stats[queue]);
+	job->global_stats = v3d_stats_get(v3d->queue[queue].stats);
+
 	return 0;
 
 fail_deps:

-- 
2.53.0

