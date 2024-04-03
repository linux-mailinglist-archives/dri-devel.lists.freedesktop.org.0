Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BC08979D7
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 22:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92003112ED1;
	Wed,  3 Apr 2024 20:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ABR1HsN0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D84112ED4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 20:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=frj56HtQ/vQf7dL+mPaKUJuoxAGwwsK/P4JTgceVunw=; b=ABR1HsN0lleuDwhneNPrnW4285
 8k9OUaLyeUVJK1gDadoHMR2KVKa6wXvSxMMaKGnd5S9TnCrtEt8tGklFByskPwgR2NQ4Uz3YzaCyo
 QlBFLWL7Bf0rKIksOuJBYdLYYtfowsUBaFcoy3Pk4IB/fwTciIRghyxxmITUhQOI9aFM4WX4UkpKC
 Qwnbs7PiwDbIMV0Gg5u688vJmrJjEDZzGGWGTm7mycZjl1nFpQB9UTbLfljnYrp82jz/ETmrfuJQn
 gNF7vrqi5eNhM7yDyzQnu9Y5A/LYfl7AoVI6G+8xFR0P07Z27TC+bbtrJYfvGmacNf5M6oi8CWNLr
 f2RWa4tw==;
Received: from [177.34.169.255] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rs7LB-00124v-Eb; Wed, 03 Apr 2024 22:36:14 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Chema Casanova <jmcasanova@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 5/5] drm/v3d: Fix race-condition between sysfs/fdinfo and
 interrupt handler
Date: Wed,  3 Apr 2024 17:24:54 -0300
Message-ID: <20240403203517.731876-6-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403203517.731876-1-mcanal@igalia.com>
References: <20240403203517.731876-1-mcanal@igalia.com>
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

In V3D, the conclusion of a job is indicated by a IRQ. When a job
finishes, then we update the local and the global GPU stats of that
queue. But, while the GPU stats are being updated, a user might be
reading the stats from sysfs or fdinfo.

For example, on `gpu_stats_show()`, we could think about a scenario where
`v3d->queue[queue].start_ns != 0`, then an interruption happens, we update
the value of `v3d->queue[queue].start_ns` to 0, we come back to `gpu_stats_show()`
to calculate `active_runtime` and now, `active_runtime = timestamp`.

In this simple example, the user would see a spike in the queue usage,
that didn't matches reality.

In order to address this issue properly, use rw-locks to protect read
and write sections of the code.

Fixes: 09a93cc4f7d1 ("drm/v3d: Implement show_fdinfo() callback for GPU usage stats")
Reported-by: Tvrtko Ursulin <tursulin@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c   | 16 ++++++++++++----
 drivers/gpu/drm/v3d/v3d_drv.h   |  7 +++++++
 drivers/gpu/drm/v3d/v3d_gem.c   |  7 +++++--
 drivers/gpu/drm/v3d/v3d_sched.c |  9 +++++++++
 drivers/gpu/drm/v3d/v3d_sysfs.c | 16 ++++++++--------
 5 files changed, 41 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index cbb62be18aa5..60437718786c 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -119,7 +119,9 @@ v3d_open(struct drm_device *dev, struct drm_file *file)
 		drm_sched_entity_init(&v3d_priv->sched_entity[i],
 				      DRM_SCHED_PRIORITY_NORMAL, &sched,
 				      1, NULL);
+
 		memset(&v3d_priv->stats[i], 0, sizeof(v3d_priv->stats[i]));
+		rwlock_init(&v3d_priv->stats[i].rw_lock);
 	}

 	v3d_perfmon_open_file(v3d_priv);
@@ -149,20 +151,26 @@ static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)

 	for (queue = 0; queue < V3D_MAX_QUEUES; queue++) {
 		struct v3d_stats *stats = &file_priv->stats[queue];
+		u64 active_time, jobs_sent;
+		unsigned long flags;
+
+		read_lock_irqsave(&stats->rw_lock, flags);
+		active_time = stats->start_ns ? stats->enabled_ns + timestamp - stats->start_ns
+					      : stats->enabled_ns;
+		jobs_sent = stats->jobs_sent;
+		read_unlock_irqrestore(&stats->rw_lock, flags);

 		/* Note that, in case of a GPU reset, the time spent during an
 		 * attempt of executing the job is not computed in the runtime.
 		 */
 		drm_printf(p, "drm-engine-%s: \t%llu ns\n",
-			   v3d_queue_to_string(queue),
-			   stats->start_ns ? stats->enabled_ns + timestamp - stats->start_ns
-					   : stats->enabled_ns);
+			   v3d_queue_to_string(queue), active_time);

 		/* Note that we only count jobs that completed. Therefore, jobs
 		 * that were resubmitted due to a GPU reset are not computed.
 		 */
 		drm_printf(p, "v3d-jobs-%s: \t%llu jobs\n",
-			   v3d_queue_to_string(queue), stats->jobs_sent);
+			   v3d_queue_to_string(queue), jobs_sent);
 	}
 }

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 0117593976ed..8fde2623f763 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -40,6 +40,13 @@ struct v3d_stats {
 	u64 start_ns;
 	u64 enabled_ns;
 	u64 jobs_sent;
+
+	/*
+	 * This lock is used to protect the access to the GPU stats variables.
+	 * It must be used as, while we are reading the stats, IRQs can happen
+	 * and the stats would be updated.
+	 */
+	rwlock_t rw_lock;
 };

 struct v3d_queue_state {
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index d14589d3ae6c..439088724a51 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -247,8 +247,11 @@ v3d_gem_init(struct drm_device *dev)
 	int ret, i;

 	for (i = 0; i < V3D_MAX_QUEUES; i++) {
-		v3d->queue[i].fence_context = dma_fence_context_alloc(1);
-		memset(&v3d->queue[i].stats, 0, sizeof(v3d->queue[i].stats));
+		struct v3d_queue_state *queue = &v3d->queue[i];
+
+		queue->fence_context = dma_fence_context_alloc(1);
+		memset(&queue->stats, 0, sizeof(queue->stats));
+		rwlock_init(&queue->stats.rw_lock);
 	}

 	spin_lock_init(&v3d->mm_lock);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 754107b80f67..640de6768b15 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -113,19 +113,28 @@ v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
 	struct v3d_stats *global_stats = &v3d->queue[queue].stats;
 	struct v3d_stats *local_stats = &file->stats[queue];
 	u64 now = local_clock();
+	unsigned long flags;

+	write_lock_irqsave(&local_stats->rw_lock, flags);
 	local_stats->start_ns = now;
+	write_unlock_irqrestore(&local_stats->rw_lock, flags);
+
+	write_lock_irqsave(&global_stats->rw_lock, flags);
 	global_stats->start_ns = now;
+	write_unlock_irqrestore(&global_stats->rw_lock, flags);
 }

 static void
 v3d_stats_update(struct v3d_stats *stats)
 {
 	u64 now = local_clock();
+	unsigned long flags;

+	write_lock_irqsave(&stats->rw_lock, flags);
 	stats->enabled_ns += now - stats->start_ns;
 	stats->jobs_sent++;
 	stats->start_ns = 0;
+	write_unlock_irqrestore(&stats->rw_lock, flags);
 }

 void
diff --git a/drivers/gpu/drm/v3d/v3d_sysfs.c b/drivers/gpu/drm/v3d/v3d_sysfs.c
index 1eb5f3de6937..0f739a034cee 100644
--- a/drivers/gpu/drm/v3d/v3d_sysfs.c
+++ b/drivers/gpu/drm/v3d/v3d_sysfs.c
@@ -15,18 +15,20 @@ gpu_stats_show(struct device *dev, struct device_attribute *attr, char *buf)
 	struct v3d_dev *v3d = to_v3d_dev(drm);
 	enum v3d_queue queue;
 	u64 timestamp = local_clock();
-	u64 active_runtime;
 	ssize_t len = 0;
+	unsigned long flags;

 	len += sysfs_emit(buf, "queue\ttimestamp\tjobs\truntime\n");

 	for (queue = 0; queue < V3D_MAX_QUEUES; queue++) {
 		struct v3d_stats *stats = &v3d->queue[queue].stats;
+		u64 active_runtime, jobs_sent;

-		if (stats->start_ns)
-			active_runtime = timestamp - stats->start_ns;
-		else
-			active_runtime = 0;
+		read_lock_irqsave(&stats->rw_lock, flags);
+		active_runtime = stats->start_ns ? stats->enabled_ns + timestamp - stats->start_ns
+						 : stats->enabled_ns;
+		jobs_sent = stats->jobs_sent;
+		read_unlock_irqrestore(&stats->rw_lock, flags);

 		/* Each line will display the queue name, timestamp, the number
 		 * of jobs sent to that queue and the runtime, as can be seem here:
@@ -40,9 +42,7 @@ gpu_stats_show(struct device *dev, struct device_attribute *attr, char *buf)
 		 */
 		len += sysfs_emit_at(buf, len, "%s\t%llu\t%llu\t%llu\n",
 				     v3d_queue_to_string(queue),
-				     timestamp,
-				     stats->jobs_sent,
-				     stats->enabled_ns + active_runtime);
+				     timestamp, jobs_sent, active_runtime);
 	}

 	return len;
--
2.44.0

