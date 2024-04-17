Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D805F8A7A11
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 03:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AA5112FFA;
	Wed, 17 Apr 2024 01:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LBU3Mb6V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D49F10F469
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 01:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dldzqvRogGotuH7Q+X1MOaslK1ZDVhWrpj/EWOjyIMQ=; b=LBU3Mb6VLLlRB3iXXo36TbAMSr
 wvsHu4kr8J8CvIVgCAst2pqtSsOWip4l6GAjhGDouKrR265dAL4Maf/Ayq9m4JiRjBtVfFbdj4+Ag
 9yNI2UdXNjUg0CJUppZT1QwwvzgsDKIRTD6+2VM+SvxaASZwW9Lf6dqdq7fNF90jQojnEN0tvXno+
 t/xH1bbb8kw6PP2p6ehfHhPWiLFGTH+f4QF0LUVFuHzcl8cbzDYghiP+lD8VxKCz52kFtF0bLuR5N
 ANz4pJ9HqbMN9cLUE4WFqqZYRHE4DmRHa3J7yUb4qkc9KJkAkIeEMrudqxHcUib6xTCTY6rtPICUv
 2KHMQeGg==;
Received: from [177.34.169.177] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rwtp8-005Mj1-3Q; Wed, 17 Apr 2024 03:10:54 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Chema Casanova <jmcasanova@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v2 2/4] drm/v3d: Create a struct to store the GPU stats
Date: Tue, 16 Apr 2024 21:53:07 -0300
Message-ID: <20240417011021.600889-3-mcanal@igalia.com>
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

This will make it easier to instantiate the GPU stats variables and it
will create a structure where we can store all the variables that refer
to GPU stats.

Note that, when we created the struct `v3d_stats`, we renamed
`jobs_sent` to `jobs_completed`. This better express the semantics of
the variable, as we are only accounting jobs that have been completed.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c   | 15 +++++++--------
 drivers/gpu/drm/v3d/v3d_drv.h   | 18 ++++++++++--------
 drivers/gpu/drm/v3d/v3d_gem.c   |  4 +---
 drivers/gpu/drm/v3d/v3d_sched.c | 20 ++++++++++++--------
 drivers/gpu/drm/v3d/v3d_sysfs.c | 10 ++++++----
 5 files changed, 36 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 3debf37e7d9b..52e3ba9df46f 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -115,14 +115,12 @@ v3d_open(struct drm_device *dev, struct drm_file *file)
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
+
+		memset(&v3d_priv->stats[i], 0, sizeof(v3d_priv->stats[i]));
 	}
 
 	v3d_perfmon_open_file(v3d_priv);
@@ -151,20 +149,21 @@ static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)
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
+			   v3d_queue_to_string(queue), stats->jobs_completed);
 	}
 }
 
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index ee3545226d7f..5a198924d568 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -36,15 +36,20 @@ static inline char *v3d_queue_to_string(enum v3d_queue queue)
 	return "UNKNOWN";
 }
 
+struct v3d_stats {
+	u64 start_ns;
+	u64 enabled_ns;
+	u64 jobs_completed;
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
index 8ca61bcd4b1c..b6b5542c3fcf 100644
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
+	local_stats->jobs_completed++;
+	local_stats->start_ns = 0;
 
-	v3d->queue[queue].enabled_ns += now - v3d->queue[queue].start_ns;
-	v3d->queue[queue].jobs_sent++;
-	v3d->queue[queue].start_ns = 0;
+	global_stats->enabled_ns += now - global_stats->start_ns;
+	global_stats->jobs_completed++;
+	global_stats->start_ns = 0;
 }
 
 static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
diff --git a/drivers/gpu/drm/v3d/v3d_sysfs.c b/drivers/gpu/drm/v3d/v3d_sysfs.c
index d106845ba890..6a8e7acc8b82 100644
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
+				     stats->jobs_completed,
+				     stats->enabled_ns + active_runtime);
 	}
 
 	return len;
-- 
2.44.0

