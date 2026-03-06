Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJjrM/G6qmmiVwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:30:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4923D21FAF2
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE6910ECF5;
	Fri,  6 Mar 2026 11:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Gr0BNvL6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B234210ECF5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 11:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=viGISnbWbyFrS4ifb0+pyqlN1qjqmNQGuJPA7PCXups=; b=Gr0BNvL6/oosA40d5QGOjAwEeu
 R9+6R3Rc/UyY7d9QoOy/ciF6ur3AsEcXSBsuxj32JVDYVFS9jzP7tqyIYtvVT1dleuvIsrrUujPZm
 KysrfF3Dy6YjxY+vfJkXaquJ12CiAh3dOqJDxbQz4waYXEPBIM90YynffmQfEDK/rQHl4xlhUF5Bz
 6K0CGHg6mWqrl5D6j5dExAdX0ksrl6GmbHCGlOUZTlB6XpB7wY3Rz6ctF0yFMA6kP/GVOuUSjqTl8
 kI9J/EhDKPAVHMmslVV2CSM0Lq0WjUkdmh52rl5nkvbvJeHS6SqZqzu1WmC8MX2kmQ03ZFMg8QCpr
 hTRCj+uw==;
Received: from [189.7.87.203] (helo=[192.168.0.16])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vyTOL-00A0JZ-79; Fri, 06 Mar 2026 12:30:49 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 06 Mar 2026 08:30:35 -0300
Subject: [PATCH v3 3/6] drm/v3d: Refcount v3d_stats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-v3d-reset-locking-improv-v3-3-49864fe00692@igalia.com>
References: <20260306-v3d-reset-locking-improv-v3-0-49864fe00692@igalia.com>
In-Reply-To: <20260306-v3d-reset-locking-improv-v3-0-49864fe00692@igalia.com>
To: Melissa Wen <mwen@igalia.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Iago Toral Quiroga <itoral@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10188; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=r52aWWpniBEvsAx+0zz2RA7uSH4lTBi+Rcxes09OQrg=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBpqrre8qb8GzbPZKcxdsGCJZB5suwDDXkj+ZzCL
 TAZHe1rkGyJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaaq63gAKCRA/8w6Kdoj6
 qqpDCADXldBuR9M0cm0tbN2K6OXSNsUm0IOZP/2m/AbBeFNniMhoCbKDugx1O0dvmBQX6BmLVoD
 0bP3g+OTW49xUDCyPuQv7Qyec8bhBzudCJ6IqE/O5OHH7g0hA/buC6xvkqubCAXNoZTNy01V4Nn
 x6oo9kB2BwOj0g9UAE52TKFmrGvJdFpFlW0zAopQ+A/4ri2cDndnu+D7Rzya9ps+Dgdr4pVcnoH
 3PtSDnnsl24chYjGgyGgZBPw+a1TMlZbW4tdpb2mfUulmQJEh2v58rfA8FiQIKccZY3uEJehP40
 iplkYePjBcCRNvldFoO7Ttce3cVphUl7zhrHCP+jR+tr9pPf
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
X-Rspamd-Queue-Id: 4923D21FAF2
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
	NEURAL_HAM(-0.00)[-0.960];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,base.base:url]
X-Rspamd-Action: no action

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Convert `v3d_stats` from embedded structs to heap-allocated, refcounted
objects. This decouples the stats lifetime from the containing
structures (this is, `v3d_queue_state` and `v3d_file_priv`), allowing
jobs to safely hold their own references to stats objects even after the
file descriptor is closed.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Co-developed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c   | 19 ++++++++++++++-----
 drivers/gpu/drm/v3d/v3d_drv.h   | 19 +++++++++++++++++--
 drivers/gpu/drm/v3d/v3d_gem.c   | 42 ++++++++++++++++++++++++++---------------
 drivers/gpu/drm/v3d/v3d_sched.c | 29 ++++++++++++++++++++++++----
 drivers/gpu/drm/v3d/v3d_sysfs.c |  2 +-
 5 files changed, 84 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 6086c04629adbe8611b1f7297879feacec454b43..0f5e29f57fa59bfa2890de51b9ca78cda33d1edc 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -140,15 +140,18 @@ v3d_open(struct drm_device *dev, struct drm_file *file)
 	v3d_priv->v3d = v3d;
 
 	for (i = 0; i < V3D_MAX_QUEUES; i++) {
+		v3d_priv->stats[i] = v3d_stats_alloc();
+		if (!v3d_priv->stats[i]) {
+			ret = -ENOMEM;
+			goto err_stats;
+		}
+
 		sched = &v3d->queue[i].sched;
 		ret = drm_sched_entity_init(&v3d_priv->sched_entity[i],
 					    DRM_SCHED_PRIORITY_NORMAL, &sched,
 					    1, NULL);
 		if (ret)
 			goto err_sched;
-
-		memset(&v3d_priv->stats[i], 0, sizeof(v3d_priv->stats[i]));
-		seqcount_init(&v3d_priv->stats[i].lock);
 	}
 
 	v3d_perfmon_open_file(v3d_priv);
@@ -157,8 +160,12 @@ v3d_open(struct drm_device *dev, struct drm_file *file)
 	return 0;
 
 err_sched:
-	for (i--; i >= 0; i--)
+	v3d_stats_put(v3d_priv->stats[i]);
+err_stats:
+	for (i--; i >= 0; i--) {
 		drm_sched_entity_destroy(&v3d_priv->sched_entity[i]);
+		v3d_stats_put(v3d_priv->stats[i]);
+	}
 	kfree(v3d_priv);
 	return ret;
 }
@@ -182,6 +189,8 @@ v3d_postclose(struct drm_device *dev, struct drm_file *file)
 			job->file_priv = NULL;
 			spin_unlock_irqrestore(&queue->queue_lock, irqflags);
 		}
+
+		v3d_stats_put(v3d_priv->stats[q]);
 	}
 
 	v3d_perfmon_close_file(v3d_priv);
@@ -209,7 +218,7 @@ static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	enum v3d_queue queue;
 
 	for (queue = 0; queue < V3D_MAX_QUEUES; queue++) {
-		struct v3d_stats *stats = &file_priv->stats[queue];
+		struct v3d_stats *stats = file_priv->stats[queue];
 		u64 active_runtime, jobs_completed;
 
 		v3d_get_stats(stats, timestamp, &active_runtime, &jobs_completed);
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 2e5520015e08c47fef4bfbf185eda15027992032..03fa2d174b1ca8b5a98a72c4addaa1f977d11174 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -38,6 +38,8 @@ static inline char *v3d_queue_to_string(enum v3d_queue queue)
 }
 
 struct v3d_stats {
+	struct kref refcount;
+
 	u64 start_ns;
 	u64 enabled_ns;
 	u64 jobs_completed;
@@ -62,7 +64,7 @@ struct v3d_queue_state {
 	u64 emit_seqno;
 
 	/* Stores the GPU stats for this queue in the global context. */
-	struct v3d_stats stats;
+	struct v3d_stats *stats;
 
 	/* Currently active job for this queue */
 	struct v3d_job *active_job;
@@ -230,7 +232,7 @@ struct v3d_file_priv {
 	struct drm_sched_entity sched_entity[V3D_MAX_QUEUES];
 
 	/* Stores the GPU stats for a specific queue for this fd. */
-	struct v3d_stats stats[V3D_MAX_QUEUES];
+	struct v3d_stats *stats[V3D_MAX_QUEUES];
 
 	/* Per-fd reset counter, must be incremented when a job submitted
 	 * by this fd causes a GPU reset. It must be protected by
@@ -603,10 +605,23 @@ void v3d_timestamp_query_info_free(struct v3d_timestamp_query_info *query_info,
 				   unsigned int count);
 void v3d_performance_query_info_free(struct v3d_performance_query_info *query_info,
 				     unsigned int count);
+struct v3d_stats *v3d_stats_alloc(void);
+void v3d_stats_release(struct kref *refcount);
 void v3d_job_update_stats(struct v3d_job *job, enum v3d_queue q);
 int v3d_sched_init(struct v3d_dev *v3d);
 void v3d_sched_fini(struct v3d_dev *v3d);
 
+static inline struct v3d_stats *v3d_stats_get(struct v3d_stats *stats)
+{
+	kref_get(&stats->refcount);
+	return stats;
+}
+
+static inline void v3d_stats_put(struct v3d_stats *stats)
+{
+	kref_put(&stats->refcount, v3d_stats_release);
+}
+
 /* v3d_perfmon.c */
 void v3d_perfmon_init(struct v3d_dev *v3d);
 void v3d_perfmon_get(struct v3d_perfmon *perfmon);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 57965c0d6f6efea0019fb0b1a47addf2f586d138..859e63dd7e9738e3a3702edfb857ec3e844b052b 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -287,9 +287,13 @@ v3d_gem_init(struct drm_device *dev)
 	for (i = 0; i < V3D_MAX_QUEUES; i++) {
 		struct v3d_queue_state *queue = &v3d->queue[i];
 
+		queue->stats = v3d_stats_alloc();
+		if (!queue->stats) {
+			ret = -ENOMEM;
+			goto err_stats;
+		}
+
 		queue->fence_context = dma_fence_context_alloc(1);
-		memset(&queue->stats, 0, sizeof(queue->stats));
-		seqcount_init(&queue->stats.lock);
 
 		spin_lock_init(&queue->queue_lock);
 		spin_lock_init(&queue->fence_lock);
@@ -298,16 +302,16 @@ v3d_gem_init(struct drm_device *dev)
 	spin_lock_init(&v3d->mm_lock);
 	ret = drmm_mutex_init(dev, &v3d->bo_lock);
 	if (ret)
-		return ret;
+		goto err_stats;
 	ret = drmm_mutex_init(dev, &v3d->reset_lock);
 	if (ret)
-		return ret;
+		goto err_stats;
 	ret = drmm_mutex_init(dev, &v3d->sched_lock);
 	if (ret)
-		return ret;
+		goto err_stats;
 	ret = drmm_mutex_init(dev, &v3d->cache_clean_lock);
 	if (ret)
-		return ret;
+		goto err_stats;
 
 	/* Note: We don't allocate address 0.  Various bits of HW
 	 * treat 0 as special, such as the occlusion query counters
@@ -319,10 +323,10 @@ v3d_gem_init(struct drm_device *dev)
 			       &v3d->pt_paddr,
 			       GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
 	if (!v3d->pt) {
-		drm_mm_takedown(&v3d->mm);
 		dev_err(v3d->drm.dev,
 			"Failed to allocate page tables. Please ensure you have DMA enabled.\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_dma_alloc;
 	}
 
 	v3d_init_hw_state(v3d);
@@ -331,14 +335,20 @@ v3d_gem_init(struct drm_device *dev)
 	v3d_huge_mnt_init(v3d);
 
 	ret = v3d_sched_init(v3d);
-	if (ret) {
-		drm_mm_takedown(&v3d->mm);
-		dma_free_coherent(v3d->drm.dev, pt_size, (void *)v3d->pt,
-				  v3d->pt_paddr);
-		return ret;
-	}
+	if (ret)
+		goto err_sched;
 
 	return 0;
+
+err_sched:
+	dma_free_coherent(v3d->drm.dev, pt_size, (void *)v3d->pt, v3d->pt_paddr);
+err_dma_alloc:
+	drm_mm_takedown(&v3d->mm);
+err_stats:
+	for (i--; i >= 0; i--)
+		v3d_stats_put(v3d->queue[i].stats);
+
+	return ret;
 }
 
 void
@@ -352,8 +362,10 @@ v3d_gem_destroy(struct drm_device *dev)
 	/* Waiting for jobs to finish would need to be done before
 	 * unregistering V3D.
 	 */
-	for (q = 0; q < V3D_MAX_QUEUES; q++)
+	for (q = 0; q < V3D_MAX_QUEUES; q++) {
 		WARN_ON(v3d->queue[q].active_job);
+		v3d_stats_put(v3d->queue[q].stats);
+	}
 
 	drm_mm_takedown(&v3d->mm);
 
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 18265721c1d32158fa6f7e68fa3e70a77d265b9d..787f21337b2a03a923342fe4f5f927e9214082c4 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -66,6 +66,27 @@ to_cpu_job(struct drm_sched_job *sched_job)
 	return container_of(sched_job, struct v3d_cpu_job, base.base);
 }
 
+void v3d_stats_release(struct kref *refcount)
+{
+	struct v3d_stats *stats = container_of(refcount, typeof(*stats), refcount);
+
+	kfree(stats);
+}
+
+struct v3d_stats *v3d_stats_alloc(void)
+{
+	struct v3d_stats *stats;
+
+	stats = kzalloc_obj(*stats);
+	if (!stats)
+		return NULL;
+
+	kref_init(&stats->refcount);
+	seqcount_init(&stats->lock);
+
+	return stats;
+}
+
 static void
 v3d_sched_job_free(struct drm_sched_job *sched_job)
 {
@@ -141,8 +162,8 @@ v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
 {
 	struct v3d_dev *v3d = job->v3d;
 	struct v3d_file_priv *file = job->file_priv;
-	struct v3d_stats *global_stats = &v3d->queue[queue].stats;
-	struct v3d_stats *local_stats = &file->stats[queue];
+	struct v3d_stats *global_stats = v3d->queue[queue].stats;
+	struct v3d_stats *local_stats = file->stats[queue];
 	u64 now = local_clock();
 
 	preempt_disable();
@@ -173,7 +194,7 @@ v3d_job_update_stats(struct v3d_job *job, enum v3d_queue q)
 {
 	struct v3d_dev *v3d = job->v3d;
 	struct v3d_queue_state *queue = &v3d->queue[q];
-	struct v3d_stats *global_stats = &queue->stats;
+	struct v3d_stats *global_stats = queue->stats;
 	u64 now = local_clock();
 
 	preempt_disable();
@@ -181,7 +202,7 @@ v3d_job_update_stats(struct v3d_job *job, enum v3d_queue q)
 	/* Don't update the local stats if the file context has already closed */
 	spin_lock(&queue->queue_lock);
 	if (job->file_priv)
-		v3d_stats_update(&job->file_priv->stats[q], now);
+		v3d_stats_update(job->file_priv->stats[q], now);
 	spin_unlock(&queue->queue_lock);
 
 	v3d_stats_update(global_stats, now);
diff --git a/drivers/gpu/drm/v3d/v3d_sysfs.c b/drivers/gpu/drm/v3d/v3d_sysfs.c
index d610e355964ffaf45f7d44e5c667369cedc205dc..b45a9b3db42d698856873145e4948aad27eeb28c 100644
--- a/drivers/gpu/drm/v3d/v3d_sysfs.c
+++ b/drivers/gpu/drm/v3d/v3d_sysfs.c
@@ -20,7 +20,7 @@ gpu_stats_show(struct device *dev, struct device_attribute *attr, char *buf)
 	len += sysfs_emit(buf, "queue\ttimestamp\tjobs\truntime\n");
 
 	for (queue = 0; queue < V3D_MAX_QUEUES; queue++) {
-		struct v3d_stats *stats = &v3d->queue[queue].stats;
+		struct v3d_stats *stats = v3d->queue[queue].stats;
 		u64 active_runtime, jobs_completed;
 
 		v3d_get_stats(stats, timestamp, &active_runtime, &jobs_completed);

-- 
2.53.0

