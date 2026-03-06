Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INMPIO26qmnLVwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:30:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD8021FAEA
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E59810ECF3;
	Fri,  6 Mar 2026 11:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rWVFyYvf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE31410ECF3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 11:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c92XECq5dI3Uofg5Rgt97hNyhgVIx1T6Kal62VX/9yI=; b=rWVFyYvfSYSZbw+leV4wVBEm4r
 zcuvTIyJh1Vfe27KXsTSpj364vtOfxTRniplC9KIE7SdgYLCmTHYPVlc9q0iZfW9VJ+LzlJffNY9g
 Si6YI6Lwd02WWDkJcmZszWz0odp1KlFysgDO8zDI1qetwv+uOZy3W/+yRmfKRyF3+buyYjrkJZy1s
 yOehEuHa//gzOopd9HSOhmF5YtSsfwiOA4bHDn11zPS9aEvEFMuTJOMZrVYLkDkzSt1BzWqrXw2Hy
 cFJCzTRUxmYplwKX/2QLDcDALankLYIxUi5/L1U/tDPwtAtHFixdFD03w1E0FZS8UspowFcCEgAra
 bSSuxSLA==;
Received: from [189.7.87.203] (helo=[192.168.0.16])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vyTOI-00A0JZ-BN; Fri, 06 Mar 2026 12:30:46 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 06 Mar 2026 08:30:34 -0300
Subject: [PATCH v3 2/6] drm/v3d: Use raw seqcount helpers instead of
 fighting with lockdep
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-v3d-reset-locking-improv-v3-2-49864fe00692@igalia.com>
References: <20260306-v3d-reset-locking-improv-v3-0-49864fe00692@igalia.com>
In-Reply-To: <20260306-v3d-reset-locking-improv-v3-0-49864fe00692@igalia.com>
To: Melissa Wen <mwen@igalia.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Iago Toral Quiroga <itoral@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5853; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=tRQ3bJPT2InDBLijRwuOh+F5EtOCHMYkeJJhrRGjkpA=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBpqrrd1F7uM/aeOsuRR4skXCAW6WjZNyalSdhDm
 g8GS+Bp0M+JATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaaq63QAKCRA/8w6Kdoj6
 qmuBB/9oaTVHYSPrIbzn1oi0GlicyOXLh7qHc/g+wKlH9LGodxpa9JIwz1r6vywl2wQJGA16y8m
 HgyajSu44r9y08IFFMoi0SVzl4x1+LITv1RNN1vlJG5q/s6PRIynBnA8vTRFOhI9C3dPMFrEPQe
 XUJIpJHQ4iJFS8qufKhecW2dmySdvq4zMzSxhX2pqdW0bp9tlvo6IHwHgJXWENE7Px8lFsm4gTg
 +rImw0mvHhu+wvRx0zTXoaa1+TWSBpbpQIRi2ebwMamsuyOuIYE8umQgutzB5B6YcdEN4MCKzu0
 xJEJFgFAsRYCbp+A4y1h2ewLC66SutmKl+p0uSVVTsULjZpG
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
X-Rspamd-Queue-Id: 2FD8021FAEA
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
	NEURAL_HAM(-0.00)[-0.965];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

The `v3d_stats` sequence counter uses regular seqcount helpers, which
carry lockdep annotations that expect a consistent IRQ context between
all writers. However, lockdep is unable to detect that v3d's readers
are never in IRQ or softirq context, and that for CPU job queues, even
the write side never is. This led to false positive that were previously
worked around by conditionally disabling local IRQs under
IS_ENABLED(CONFIG_LOCKDEP).

Switch to the raw seqcount helpers which skip lockdep tracking entirely.
This is safe because jobs are fully serialized per queue: the next job
can only be queued after the previous one has been signaled, so there is
no scope for the start and update paths to race on the same seqcount.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Co-developed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c   |  2 +-
 drivers/gpu/drm/v3d/v3d_drv.h   |  5 ++++
 drivers/gpu/drm/v3d/v3d_sched.c | 54 ++++++++---------------------------------
 3 files changed, 16 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 86e05fcf6cf65638c4bf97ab3511ccac40f21e2f..6086c04629adbe8611b1f7297879feacec454b43 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -194,7 +194,7 @@ void v3d_get_stats(const struct v3d_stats *stats, u64 timestamp,
 	unsigned int seq;
 
 	do {
-		seq = read_seqcount_begin(&stats->lock);
+		seq = raw_read_seqcount_begin(&stats->lock);
 		*active_runtime = stats->enabled_ns;
 		if (stats->start_ns)
 			*active_runtime += timestamp - stats->start_ns;
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 314213c2671003862c486a1a7237af5480afa9e4..2e5520015e08c47fef4bfbf185eda15027992032 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -46,6 +46,11 @@ struct v3d_stats {
 	 * This seqcount is used to protect the access to the GPU stats
 	 * variables. It must be used as, while we are reading the stats,
 	 * IRQs can happen and the stats can be updated.
+	 *
+	 * However, we use the raw seqcount helpers to interact with this lock
+	 * to avoid false positives from lockdep, which is unable to detect that
+	 * our readers are never from irq or softirq context, and that, for CPU
+	 * job queues, even the write side never is.
 	 */
 	seqcount_t lock;
 };
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 6dc871fc9a62303da4fbc62b612c3a797fe762de..18265721c1d32158fa6f7e68fa3e70a77d265b9d 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -144,54 +144,28 @@ v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
 	struct v3d_stats *global_stats = &v3d->queue[queue].stats;
 	struct v3d_stats *local_stats = &file->stats[queue];
 	u64 now = local_clock();
-	unsigned long flags;
 
-	/*
-	 * We only need to disable local interrupts to appease lockdep who
-	 * otherwise would think v3d_job_start_stats vs v3d_stats_update has an
-	 * unsafe in-irq vs no-irq-off usage problem. This is a false positive
-	 * because all the locks are per queue and stats type, and all jobs are
-	 * completely one at a time serialised. More specifically:
-	 *
-	 * 1. Locks for GPU queues are updated from interrupt handlers under a
-	 *    spin lock and started here with preemption disabled.
-	 *
-	 * 2. Locks for CPU queues are updated from the worker with preemption
-	 *    disabled and equally started here with preemption disabled.
-	 *
-	 * Therefore both are consistent.
-	 *
-	 * 3. Because next job can only be queued after the previous one has
-	 *    been signaled, and locks are per queue, there is also no scope for
-	 *    the start part to race with the update part.
-	 */
-	if (IS_ENABLED(CONFIG_LOCKDEP))
-		local_irq_save(flags);
-	else
-		preempt_disable();
+	preempt_disable();
 
-	write_seqcount_begin(&local_stats->lock);
+	raw_write_seqcount_begin(&local_stats->lock);
 	local_stats->start_ns = now;
-	write_seqcount_end(&local_stats->lock);
+	raw_write_seqcount_end(&local_stats->lock);
 
-	write_seqcount_begin(&global_stats->lock);
+	raw_write_seqcount_begin(&global_stats->lock);
 	global_stats->start_ns = now;
-	write_seqcount_end(&global_stats->lock);
+	raw_write_seqcount_end(&global_stats->lock);
 
-	if (IS_ENABLED(CONFIG_LOCKDEP))
-		local_irq_restore(flags);
-	else
-		preempt_enable();
+	preempt_enable();
 }
 
 static void
 v3d_stats_update(struct v3d_stats *stats, u64 now)
 {
-	write_seqcount_begin(&stats->lock);
+	raw_write_seqcount_begin(&stats->lock);
 	stats->enabled_ns += now - stats->start_ns;
 	stats->jobs_completed++;
 	stats->start_ns = 0;
-	write_seqcount_end(&stats->lock);
+	raw_write_seqcount_end(&stats->lock);
 }
 
 void
@@ -201,13 +175,8 @@ v3d_job_update_stats(struct v3d_job *job, enum v3d_queue q)
 	struct v3d_queue_state *queue = &v3d->queue[q];
 	struct v3d_stats *global_stats = &queue->stats;
 	u64 now = local_clock();
-	unsigned long flags;
 
-	/* See comment in v3d_job_start_stats() */
-	if (IS_ENABLED(CONFIG_LOCKDEP))
-		local_irq_save(flags);
-	else
-		preempt_disable();
+	preempt_disable();
 
 	/* Don't update the local stats if the file context has already closed */
 	spin_lock(&queue->queue_lock);
@@ -217,10 +186,7 @@ v3d_job_update_stats(struct v3d_job *job, enum v3d_queue q)
 
 	v3d_stats_update(global_stats, now);
 
-	if (IS_ENABLED(CONFIG_LOCKDEP))
-		local_irq_restore(flags);
-	else
-		preempt_enable();
+	preempt_enable();
 }
 
 static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)

-- 
2.53.0

