Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5288979D5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 22:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFC6112ED8;
	Wed,  3 Apr 2024 20:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="NYASSIMl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C3F112ED3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 20:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+j+9dulMSS98DsTwcRnBZoYH6yYV61tfssnvATIv8BA=; b=NYASSIMlXPZca5IQSRwCf05jXx
 geQwfi4rMnz6HWqLXnBaNM4p43tO93jVBgnMwgL+SVVn3j0u3dqtCx+kUsOMOlsF3F/MRjrodpCbs
 STjEzBV9q3Re7LdlzlrM3sDXqYanfszOooFLFgt7dWTLG6oWHhudfke0LfiO0DdkoVIBGeW0IMCZ8
 Y2hRy9M/8DNFF3xdmJRB5dyXmXpcjwBDTGnD0ALWOOR1fEvxn9EjYimhYv8f86VouHcsENx83+LEE
 UUZGS7kAc5vxv30zub/nlkdd0JixSS6WFfbzGrFD3CXkNsPthH8YtDPW0iSdQbGhYhViaqgmxvBmv
 JADRSiHQ==;
Received: from [177.34.169.255] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rs7L2-00124v-E5; Wed, 03 Apr 2024 22:36:05 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Chema Casanova <jmcasanova@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 3/5] drm/v3d: Create a struct to store the GPU stats
Date: Wed,  3 Apr 2024 17:24:52 -0300
Message-ID: <20240403203517.731876-4-mcanal@igalia.com>
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

This will make it easier to instantiate the GPU stats variables and it
will create a structure where we can store all the variables that refer
to GPU stats.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c   | 14 ++++++--------
 drivers/gpu/drm/v3d/v3d_drv.h   | 18 ++++++++++--------
 drivers/gpu/drm/v3d/v3d_gem.c   |  4 +---
 drivers/gpu/drm/v3d/v3d_sched.c | 20 ++++++++++++--------
 drivers/gpu/drm/v3d/v3d_sysfs.c | 10 ++++++----
 5 files changed, 35 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 3debf37e7d9b..cbb62be18aa5 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -115,14 +115,11 @@ v3d_open(struct drm_device *dev, struct drm_file *file)
 	v3d_priv->v3d = v3d;
 
 	for (i = 0; i < V3D_MAX_QUEUES; i++) {
-		v3d_priv->enabled_ns[i] = 0;
-		v3d_priv->start_ns[i] = 0;
-		v3d_priv->jobs_sent[i] = 0;
-
 		sched = &v3d->queue[i].sched;
 		drm_sched_entity_init(&v3d_priv->sched_entity[i],
 				      DRM_SCHED_PRIORITY_NORMAL, &sched,
 				      1, NULL);
+		memset(&v3d_priv->stats[i], 0, sizeof(v3d_priv->stats[i]));
 	}
 
 	v3d_perfmon_open_file(v3d_priv);
@@ -151,20 +148,21 @@ static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	enum v3d_queue queue;
 
 	for (queue = 0; queue < V3D_MAX_QUEUES; queue++) {
+		struct v3d_stats *stats = &file_priv->stats[queue];
+
 		/* Note that, in case of a GPU reset, the time spent during an
 		 * attempt of executing the job is not computed in the runtime.
 		 */
 		drm_printf(p, "drm-engine-%s: \t%llu ns\n",
 			   v3d_queue_to_string(queue),
-			   file_priv->start_ns[queue] ? file_priv->enabled_ns[queue]
-						      + timestamp - file_priv->start_ns[queue]
-						      : file_priv->enabled_ns[queue]);
+			   stats->start_ns ? stats->enabled_ns + timestamp - stats->start_ns
+					   : stats->enabled_ns);
 
 		/* Note that we only count jobs that completed. Therefore, jobs
 		 * that were resubmitted due to a GPU reset are not computed.
 		 */
 		drm_printf(p, "v3d-jobs-%s: \t%llu jobs\n",
-			   v3d_queue_to_string(queue), file_priv->jobs_sent[queue]);
+			   v3d_queue_to_string(queue), stats->jobs_sent);
 	}
 }
 
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index ee3545226d7f..0117593976ed 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -36,15 +36,20 @@ static inline char *v3d_queue_to_string(enum v3d_queue queue)
 	return "UNKNOWN";
 }
 
+struct v3d_stats {
+	u64 start_ns;
+	u64 enabled_ns;
+	u64 jobs_sent;
+};
+
 struct v3d_queue_state {
 	struct drm_gpu_scheduler sched;
 
 	u64 fence_context;
 	u64 emit_seqno;
 
-	u64 start_ns;
-	u64 enabled_ns;
-	u64 jobs_sent;
+	/* Stores the GPU stats for this queue in the global context. */
+	struct v3d_stats stats;
 };
 
 /* Performance monitor object. The perform lifetime is controlled by userspace
@@ -188,11 +193,8 @@ struct v3d_file_priv {
 
 	struct drm_sched_entity sched_entity[V3D_MAX_QUEUES];
 
-	u64 start_ns[V3D_MAX_QUEUES];
-
-	u64 enabled_ns[V3D_MAX_QUEUES];
-
-	u64 jobs_sent[V3D_MAX_QUEUES];
+	/* Stores the GPU stats for a specific queue for this fd. */
+	struct v3d_stats stats[V3D_MAX_QUEUES];
 };
 
 struct v3d_bo {
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index afc565078c78..d14589d3ae6c 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -248,9 +248,7 @@ v3d_gem_init(struct drm_device *dev)
 
 	for (i = 0; i < V3D_MAX_QUEUES; i++) {
 		v3d->queue[i].fence_context = dma_fence_context_alloc(1);
-		v3d->queue[i].start_ns = 0;
-		v3d->queue[i].enabled_ns = 0;
-		v3d->queue[i].jobs_sent = 0;
+		memset(&v3d->queue[i].stats, 0, sizeof(v3d->queue[i].stats));
 	}
 
 	spin_lock_init(&v3d->mm_lock);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 8ca61bcd4b1c..ea5f5a84b55b 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -110,10 +110,12 @@ v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
 {
 	struct v3d_dev *v3d = job->v3d;
 	struct v3d_file_priv *file = job->file->driver_priv;
+	struct v3d_stats *global_stats = &v3d->queue[queue].stats;
+	struct v3d_stats *local_stats = &file->stats[queue];
 	u64 now = local_clock();
 
-	file->start_ns[queue] = now;
-	v3d->queue[queue].start_ns = now;
+	local_stats->start_ns = now;
+	global_stats->start_ns = now;
 }
 
 void
@@ -121,15 +123,17 @@ v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue)
 {
 	struct v3d_dev *v3d = job->v3d;
 	struct v3d_file_priv *file = job->file->driver_priv;
+	struct v3d_stats *global_stats = &v3d->queue[queue].stats;
+	struct v3d_stats *local_stats = &file->stats[queue];
 	u64 now = local_clock();
 
-	file->enabled_ns[queue] += now - file->start_ns[queue];
-	file->jobs_sent[queue]++;
-	file->start_ns[queue] = 0;
+	local_stats->enabled_ns += now - local_stats->start_ns;
+	local_stats->jobs_sent++;
+	local_stats->start_ns = 0;
 
-	v3d->queue[queue].enabled_ns += now - v3d->queue[queue].start_ns;
-	v3d->queue[queue].jobs_sent++;
-	v3d->queue[queue].start_ns = 0;
+	global_stats->enabled_ns += now - global_stats->start_ns;
+	global_stats->jobs_sent++;
+	global_stats->start_ns = 0;
 }
 
 static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
diff --git a/drivers/gpu/drm/v3d/v3d_sysfs.c b/drivers/gpu/drm/v3d/v3d_sysfs.c
index d106845ba890..1eb5f3de6937 100644
--- a/drivers/gpu/drm/v3d/v3d_sysfs.c
+++ b/drivers/gpu/drm/v3d/v3d_sysfs.c
@@ -21,8 +21,10 @@ gpu_stats_show(struct device *dev, struct device_attribute *attr, char *buf)
 	len += sysfs_emit(buf, "queue\ttimestamp\tjobs\truntime\n");
 
 	for (queue = 0; queue < V3D_MAX_QUEUES; queue++) {
-		if (v3d->queue[queue].start_ns)
-			active_runtime = timestamp - v3d->queue[queue].start_ns;
+		struct v3d_stats *stats = &v3d->queue[queue].stats;
+
+		if (stats->start_ns)
+			active_runtime = timestamp - stats->start_ns;
 		else
 			active_runtime = 0;
 
@@ -39,8 +41,8 @@ gpu_stats_show(struct device *dev, struct device_attribute *attr, char *buf)
 		len += sysfs_emit_at(buf, len, "%s\t%llu\t%llu\t%llu\n",
 				     v3d_queue_to_string(queue),
 				     timestamp,
-				     v3d->queue[queue].jobs_sent,
-				     v3d->queue[queue].enabled_ns + active_runtime);
+				     stats->jobs_sent,
+				     stats->enabled_ns + active_runtime);
 	}
 
 	return len;
-- 
2.44.0

