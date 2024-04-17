Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0C38A7A13
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 03:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CFE11300F;
	Wed, 17 Apr 2024 01:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jJtK3VO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBAA911300B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 01:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c7DHhvGnd/Np9UalaqIYJD61dmmhG94FZON/m+OdSEc=; b=jJtK3VO2K7zdZFHh9H9CpshZmq
 veXkIjx5AlQ3vtOIjZ+BEA/3tzS66FHhIqOZGivgRZQoIvaNcjapXPREtLQZlX3ukbQYn4Fnfiypz
 5LNAdYx14L4g5pnL7Q8wSD6l9coAb5hKb2h5qMaunHRtdnvJy1yWwbIXNvaVh8VXLUrWpt1fs0SlF
 909jBAxQK0jXeKjt2VpIN6Z3dAadur5V8xrxiylx1A7WegAy+sq84mPOr17rgR8ss4QlRUw0KVL1O
 66e/ry4y4lBCZCK6g1oDzRZO0O+nM2WmgPZ9UPvhH8lV+MIHvo+u5alhB9Nyxd31CxkSu2Y2IaYUn
 iZqR7kiw==;
Received: from [177.34.169.177] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rwtpH-005Mj1-AT; Wed, 17 Apr 2024 03:11:03 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Chema Casanova <jmcasanova@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v2 4/4] drm/v3d: Fix race-condition between sysfs/fdinfo and
 interrupt handler
Date: Tue, 16 Apr 2024 21:53:09 -0300
Message-ID: <20240417011021.600889-5-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417011021.600889-1-mcanal@igalia.com>
References: <20240417011021.600889-1-mcanal@igalia.com>
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
the value of `v3d->queue[queue].start_ns` to 0, we come back to
`gpu_stats_show()` to calculate `active_runtime` and now,
`active_runtime = timestamp`.

In this simple example, the user would see a spike in the queue usage,
that didn't matches reality.

In order to address this issue properly, use a seqcount to protect read
and write sections of the code.

Fixes: 09a93cc4f7d1 ("drm/v3d: Implement show_fdinfo() callback for GPU usage stats")
Reported-by: Tvrtko Ursulin <tursulin@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c   | 10 ++++++----
 drivers/gpu/drm/v3d/v3d_drv.h   | 21 +++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_gem.c   |  7 +++++--
 drivers/gpu/drm/v3d/v3d_sched.c |  7 +++++++
 drivers/gpu/drm/v3d/v3d_sysfs.c | 11 +++--------
 5 files changed, 42 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 52e3ba9df46f..cf15fa142968 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -121,6 +121,7 @@ v3d_open(struct drm_device *dev, struct drm_file *file)
 				      1, NULL);
 
 		memset(&v3d_priv->stats[i], 0, sizeof(v3d_priv->stats[i]));
+		seqcount_init(&v3d_priv->stats[i].lock);
 	}
 
 	v3d_perfmon_open_file(v3d_priv);
@@ -150,20 +151,21 @@ static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 
 	for (queue = 0; queue < V3D_MAX_QUEUES; queue++) {
 		struct v3d_stats *stats = &file_priv->stats[queue];
+		u64 active_runtime, jobs_completed;
+
+		v3d_get_stats(stats, timestamp, &active_runtime, &jobs_completed);
 
 		/* Note that, in case of a GPU reset, the time spent during an
 		 * attempt of executing the job is not computed in the runtime.
 		 */
 		drm_printf(p, "drm-engine-%s: \t%llu ns\n",
-			   v3d_queue_to_string(queue),
-			   stats->start_ns ? stats->enabled_ns + timestamp - stats->start_ns
-					   : stats->enabled_ns);
+			   v3d_queue_to_string(queue), active_runtime);
 
 		/* Note that we only count jobs that completed. Therefore, jobs
 		 * that were resubmitted due to a GPU reset are not computed.
 		 */
 		drm_printf(p, "v3d-jobs-%s: \t%llu jobs\n",
-			   v3d_queue_to_string(queue), stats->jobs_completed);
+			   v3d_queue_to_string(queue), jobs_completed);
 	}
 }
 
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 5a198924d568..5211df7c7317 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -40,8 +40,29 @@ struct v3d_stats {
 	u64 start_ns;
 	u64 enabled_ns;
 	u64 jobs_completed;
+
+	/*
+	 * This seqcount is used to protect the access to the GPU stats
+	 * variables. It must be used as, while we are reading the stats,
+	 * IRQs can happen and the stats can be updated.
+	 */
+	seqcount_t lock;
 };
 
+static inline void v3d_get_stats(const struct v3d_stats *stats, u64 timestamp,
+				 u64 *active_runtime, u64 *jobs_completed)
+{
+	unsigned int seq;
+
+	do {
+		seq = read_seqcount_begin(&stats->lock);
+		*active_runtime = stats->enabled_ns;
+		if (stats->start_ns)
+			*active_runtime += timestamp - stats->start_ns;
+		*jobs_completed = stats->jobs_completed;
+	} while (read_seqcount_retry(&stats->lock, seq));
+}
+
 struct v3d_queue_state {
 	struct drm_gpu_scheduler sched;
 
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index d14589d3ae6c..da8faf3b9011 100644
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
+		seqcount_init(&queue->stats.lock);
 	}
 
 	spin_lock_init(&v3d->mm_lock);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index b9614944931c..7cd8c335cd9b 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -114,16 +114,23 @@ v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
 	struct v3d_stats *local_stats = &file->stats[queue];
 	u64 now = local_clock();
 
+	write_seqcount_begin(&local_stats->lock);
 	local_stats->start_ns = now;
+	write_seqcount_end(&local_stats->lock);
+
+	write_seqcount_begin(&global_stats->lock);
 	global_stats->start_ns = now;
+	write_seqcount_end(&global_stats->lock);
 }
 
 static void
 v3d_stats_update(struct v3d_stats *stats, u64 now)
 {
+	write_seqcount_begin(&stats->lock);
 	stats->enabled_ns += now - stats->start_ns;
 	stats->jobs_completed++;
 	stats->start_ns = 0;
+	write_seqcount_end(&stats->lock);
 }
 
 void
diff --git a/drivers/gpu/drm/v3d/v3d_sysfs.c b/drivers/gpu/drm/v3d/v3d_sysfs.c
index 6a8e7acc8b82..d610e355964f 100644
--- a/drivers/gpu/drm/v3d/v3d_sysfs.c
+++ b/drivers/gpu/drm/v3d/v3d_sysfs.c
@@ -15,18 +15,15 @@ gpu_stats_show(struct device *dev, struct device_attribute *attr, char *buf)
 	struct v3d_dev *v3d = to_v3d_dev(drm);
 	enum v3d_queue queue;
 	u64 timestamp = local_clock();
-	u64 active_runtime;
 	ssize_t len = 0;
 
 	len += sysfs_emit(buf, "queue\ttimestamp\tjobs\truntime\n");
 
 	for (queue = 0; queue < V3D_MAX_QUEUES; queue++) {
 		struct v3d_stats *stats = &v3d->queue[queue].stats;
+		u64 active_runtime, jobs_completed;
 
-		if (stats->start_ns)
-			active_runtime = timestamp - stats->start_ns;
-		else
-			active_runtime = 0;
+		v3d_get_stats(stats, timestamp, &active_runtime, &jobs_completed);
 
 		/* Each line will display the queue name, timestamp, the number
 		 * of jobs sent to that queue and the runtime, as can be seem here:
@@ -40,9 +37,7 @@ gpu_stats_show(struct device *dev, struct device_attribute *attr, char *buf)
 		 */
 		len += sysfs_emit_at(buf, len, "%s\t%llu\t%llu\t%llu\n",
 				     v3d_queue_to_string(queue),
-				     timestamp,
-				     stats->jobs_completed,
-				     stats->enabled_ns + active_runtime);
+				     timestamp, jobs_completed, active_runtime);
 	}
 
 	return len;
-- 
2.44.0

