Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eN1vDchclGm3DAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 13:19:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF0A14BDEE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 13:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F64710E4CC;
	Tue, 17 Feb 2026 12:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CKsdVZuw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7A810E4C4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 12:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=agmSoC4iaeBJCZjyK7CsIlnFB6op2EjWdGhJPCdCdW0=; b=CKsdVZuwU1GK61ib1VlKFk/Qhd
 kZTYM+BsPsdNvVUAwyIpEChsQ7EEZ1bE/m3wUpxRRxIyfAz7rWsgnV2ewCtFQL/LVjser2EMHquR4
 KXUOFAeEB+3QheO/q9EncgQosgr6bejuuixECHZF1/un58SGKR9hJ26dPBFpa4wH7xxKPNMIalerj
 uTYgk6dPYsEqahZXZb8xUhPv+eHiMfNDzbWwPLRTJ9GahElPHV97lg9fnO2xDp+juFFutOzf4QKA0
 H/AbesLVIqyYRDzK1TO8R1LfgOJup1KynvhryXJRou973np9r159ux+OBSsPkndD1/mUAXb4oF58+
 O+Ek57Ig==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vsK2n-001eTt-H0; Tue, 17 Feb 2026 13:19:09 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 17 Feb 2026 09:18:52 -0300
Subject: [PATCH 4/6] drm/v3d: Hold v3d_stats references in each job
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260217-v3d-reset-locking-improv-v1-4-0db848016869@igalia.com>
References: <20260217-v3d-reset-locking-improv-v1-0-0db848016869@igalia.com>
In-Reply-To: <20260217-v3d-reset-locking-improv-v1-0-0db848016869@igalia.com>
To: Melissa Wen <mwen@igalia.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7456; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=VNA3O1GPntfHEleGnD83mRQspt7bVgSsisKRH7qUO4M=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBplFy0MZVE/D4FC17TMbH75ZQ35eTCTgHVuyJhh
 ChqRifaWBeJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaZRctAAKCRA/8w6Kdoj6
 qgCAB/9sGRSqswLE6vOvvcyxtzqDC4HzOv7GztM0Ng5EjAT+gFSvLploFhqJIn9qU1dmqau9/Kf
 wbk9+054nvtgKga4NfHeGCtVDcbaYiR40SiX7RVsNTONfBpClmAbQc6udNoMHX9vgZXwQDMhfHD
 jQHzLZMWX0WKvW047Xag0uSyzOqizijxW1poBRE/6le44StTWURuLvpmhYdY7WUZU6Q+3X660iT
 Mh+/RExpTj03ruLPJW93f9BPKnI2CFI9GHKRXftn7wpi9mMfgrR37vhT3OQoQzLKsZ/YKBpezZy
 0/88spDGErO+QcFXeFeQQK3Gb+z64FZT22lBV7PNIHxX+xae
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:tvrtko.ursulin@igalia.com,m:mripard@kernel.org,m:kernel-dev@igalia.com,m:mcanal@igalia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: DAF0A14BDEE
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
index 46b776fa883729cec67959efa100347da4cfed86..4adbf5175eb005b37d1feac1514150630ce6aab2 100644
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
index 794c3571662de7eb566bf4c0561571d7618dd234..aa6a39c7f2e96698065841d8ed31c3dc9400680c 100644
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
2.52.0

