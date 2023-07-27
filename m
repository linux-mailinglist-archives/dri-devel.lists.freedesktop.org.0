Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A45127655FB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C9510E58F;
	Thu, 27 Jul 2023 14:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5E310E58D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ki7TDsIt5/qaMsjYoGJKwxTIrZQsmO3aIV0PUEtbysY=; b=qb8b9sbkLbD0mi1ReikTBPVKP0
 jPPmZc77pywfTlNbjAthxTBH/Qq4IXnIGx8NZmVNYxLMtsF/2+2ggWd7pErMNz9s8i5XoFVBS0Yq7
 FFaahW3QnSVc1G5qciyXoceTTdT+HIY7vtKqULcmfdI7GJAc0ib8AR5MlkyI49GVK6/AyZHBUCK3A
 yy7Bw/BQ/z8iKmJCDqUJHHzKcKwZA/IMYglzF/Lgeg5plpRms9jdS+bsdlg5Nqw0I2Xz445EWEDci
 0TO6MsV8DRdKo0PAQV781cC+SYCrP4Nd1u1mwQ3e+JXWB7PvaTzBFoN7vnSEaOLEBSZ52oT0QyOro
 mha1Qrxw==;
Received: from [187.36.235.191] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qP20E-004gQz-DN; Thu, 27 Jul 2023 16:30:06 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/v3d: Expose the total GPU usage stats on debugfs
Date: Thu, 27 Jul 2023 11:23:28 -0300
Message-ID: <20230727142929.1275149-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727142929.1275149-1-mcanal@igalia.com>
References: <20230727142929.1275149-1-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The previous patch exposed the accumulated amount of active time per
client for each V3D queue. But this doesn't provide a global notion of
the GPU usage.

Therefore, provide the accumulated amount of active time for each V3D
queue (BIN, RENDER, CSD, TFU and CACHE_CLEAN), considering all the jobs
submitted to the queue, independent of the client.

This data is exposed through the debugfs interface, so that if the
interface is queried at two different points of time the usage percentage
of each of the queues can be calculated.

Co-developed-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
Signed-off-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_debugfs.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_drv.h     |  3 +++
 drivers/gpu/drm/v3d/v3d_gem.c     |  5 ++++-
 drivers/gpu/drm/v3d/v3d_irq.c     | 24 ++++++++++++++++++++----
 drivers/gpu/drm/v3d/v3d_sched.c   | 13 ++++++++++++-
 5 files changed, 66 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index 330669f51fa7..3b7329343649 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -4,6 +4,7 @@
 #include <linux/circ_buf.h>
 #include <linux/ctype.h>
 #include <linux/debugfs.h>
+#include <linux/sched/clock.h>
 #include <linux/seq_file.h>
 #include <linux/string_helpers.h>

@@ -236,11 +237,37 @@ static int v3d_measure_clock(struct seq_file *m, void *unused)
 	return 0;
 }

+static int v3d_debugfs_gpu_usage(struct seq_file *m, void *unused)
+{
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
+	struct v3d_dev *v3d = to_v3d_dev(dev);
+	enum v3d_queue queue;
+	u64 timestamp = local_clock();
+	u64 active_runtime;
+
+	seq_printf(m, "timestamp: %llu\n", timestamp);
+
+	for (queue = 0; queue < V3D_MAX_QUEUES; queue++) {
+		if (v3d->queue[queue].start_ns)
+			active_runtime = timestamp - v3d->queue[queue].start_ns;
+		else
+			active_runtime = 0;
+
+		seq_printf(m, "%s: %llu ns\n",
+			   v3d_queue_to_string(queue),
+			   v3d->queue[queue].enabled_ns + active_runtime);
+	}
+
+	return 0;
+}
+
 static const struct drm_debugfs_info v3d_debugfs_list[] = {
 	{"v3d_ident", v3d_v3d_debugfs_ident, 0},
 	{"v3d_regs", v3d_v3d_debugfs_regs, 0},
 	{"measure_clock", v3d_measure_clock, 0},
 	{"bo_stats", v3d_debugfs_bo_stats, 0},
+	{"gpu_usage", v3d_debugfs_gpu_usage, 0},
 };

 void
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index ee5e12d0db1c..b41b32ecd991 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -38,6 +38,9 @@ struct v3d_queue_state {

 	u64 fence_context;
 	u64 emit_seqno;
+
+	u64 start_ns;
+	u64 enabled_ns;
 };

 /* Performance monitor object. The perform lifetime is controlled by userspace
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 40ed0c7c3fad..630ea2db8f8f 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -1014,8 +1014,11 @@ v3d_gem_init(struct drm_device *dev)
 	u32 pt_size = 4096 * 1024;
 	int ret, i;

-	for (i = 0; i < V3D_MAX_QUEUES; i++)
+	for (i = 0; i < V3D_MAX_QUEUES; i++) {
 		v3d->queue[i].fence_context = dma_fence_context_alloc(1);
+		v3d->queue[i].start_ns = 0;
+		v3d->queue[i].enabled_ns = 0;
+	}

 	spin_lock_init(&v3d->mm_lock);
 	spin_lock_init(&v3d->job_lock);
diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index c898800ae9c2..be4ff7559309 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -102,9 +102,13 @@ v3d_irq(int irq, void *arg)
 		struct v3d_fence *fence =
 			to_v3d_fence(v3d->bin_job->base.irq_fence);
 		struct v3d_file_priv *file = v3d->bin_job->base.file->driver_priv;
+		u64 runtime = local_clock() - file->start_ns[V3D_BIN];

-		file->enabled_ns[V3D_BIN] += local_clock() - file->start_ns[V3D_BIN];
 		file->start_ns[V3D_BIN] = 0;
+		v3d->queue[V3D_BIN].start_ns = 0;
+
+		file->enabled_ns[V3D_BIN] += runtime;
+		v3d->queue[V3D_BIN].enabled_ns += runtime;

 		trace_v3d_bcl_irq(&v3d->drm, fence->seqno);
 		dma_fence_signal(&fence->base);
@@ -115,9 +119,13 @@ v3d_irq(int irq, void *arg)
 		struct v3d_fence *fence =
 			to_v3d_fence(v3d->render_job->base.irq_fence);
 		struct v3d_file_priv *file = v3d->render_job->base.file->driver_priv;
+		u64 runtime = local_clock() - file->start_ns[V3D_RENDER];

-		file->enabled_ns[V3D_RENDER] += local_clock() - file->start_ns[V3D_RENDER];
 		file->start_ns[V3D_RENDER] = 0;
+		v3d->queue[V3D_RENDER].start_ns = 0;
+
+		file->enabled_ns[V3D_RENDER] += runtime;
+		v3d->queue[V3D_RENDER].enabled_ns += runtime;

 		trace_v3d_rcl_irq(&v3d->drm, fence->seqno);
 		dma_fence_signal(&fence->base);
@@ -128,9 +136,13 @@ v3d_irq(int irq, void *arg)
 		struct v3d_fence *fence =
 			to_v3d_fence(v3d->csd_job->base.irq_fence);
 		struct v3d_file_priv *file = v3d->csd_job->base.file->driver_priv;
+		u64 runtime = local_clock() - file->start_ns[V3D_CSD];

-		file->enabled_ns[V3D_CSD] += local_clock() - file->start_ns[V3D_CSD];
 		file->start_ns[V3D_CSD] = 0;
+		v3d->queue[V3D_CSD].start_ns = 0;
+
+		file->enabled_ns[V3D_CSD] += runtime;
+		v3d->queue[V3D_CSD].enabled_ns += runtime;

 		trace_v3d_csd_irq(&v3d->drm, fence->seqno);
 		dma_fence_signal(&fence->base);
@@ -168,9 +180,13 @@ v3d_hub_irq(int irq, void *arg)
 		struct v3d_fence *fence =
 			to_v3d_fence(v3d->tfu_job->base.irq_fence);
 		struct v3d_file_priv *file = v3d->tfu_job->base.file->driver_priv;
+		u64 runtime = local_clock() - file->start_ns[V3D_TFU];

-		file->enabled_ns[V3D_TFU] += local_clock() - file->start_ns[V3D_TFU];
 		file->start_ns[V3D_TFU] = 0;
+		v3d->queue[V3D_TFU].start_ns = 0;
+
+		file->enabled_ns[V3D_TFU] += runtime;
+		v3d->queue[V3D_TFU].enabled_ns += runtime;

 		trace_v3d_tfu_irq(&v3d->drm, fence->seqno);
 		dma_fence_signal(&fence->base);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index b360709c0765..1a9c7f395862 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -110,6 +110,7 @@ static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
 			    job->start, job->end);

 	file->start_ns[V3D_BIN] = local_clock();
+	v3d->queue[V3D_BIN].start_ns = file->start_ns[V3D_BIN];
 	file->jobs_sent[V3D_BIN]++;

 	v3d_switch_perfmon(v3d, &job->base);
@@ -165,6 +166,7 @@ static struct dma_fence *v3d_render_job_run(struct drm_sched_job *sched_job)
 			    job->start, job->end);

 	file->start_ns[V3D_RENDER] = local_clock();
+	v3d->queue[V3D_RENDER].start_ns = file->start_ns[V3D_RENDER];
 	file->jobs_sent[V3D_RENDER]++;

 	v3d_switch_perfmon(v3d, &job->base);
@@ -201,6 +203,7 @@ v3d_tfu_job_run(struct drm_sched_job *sched_job)
 	trace_v3d_submit_tfu(dev, to_v3d_fence(fence)->seqno);

 	file->start_ns[V3D_TFU] = local_clock();
+	v3d->queue[V3D_TFU].start_ns = file->start_ns[V3D_TFU];
 	file->jobs_sent[V3D_TFU]++;

 	V3D_WRITE(V3D_TFU_IIA, job->args.iia);
@@ -246,6 +249,7 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
 	trace_v3d_submit_csd(dev, to_v3d_fence(fence)->seqno);

 	file->start_ns[V3D_CSD] = local_clock();
+	v3d->queue[V3D_CSD].start_ns = file->start_ns[V3D_CSD];
 	file->jobs_sent[V3D_CSD]++;

 	v3d_switch_perfmon(v3d, &job->base);
@@ -264,14 +268,21 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched_job)
 	struct v3d_job *job = to_v3d_job(sched_job);
 	struct v3d_dev *v3d = job->v3d;
 	struct v3d_file_priv *file = job->file->driver_priv;
+	u64 runtime;

 	file->start_ns[V3D_CACHE_CLEAN] = local_clock();
+	v3d->queue[V3D_CACHE_CLEAN].start_ns = file->start_ns[V3D_CACHE_CLEAN];
 	file->jobs_sent[V3D_CACHE_CLEAN]++;

 	v3d_clean_caches(v3d);

-	file->enabled_ns[V3D_CACHE_CLEAN] += local_clock() - file->start_ns[V3D_CACHE_CLEAN];
+	runtime = local_clock() - file->start_ns[V3D_CACHE_CLEAN];
+
+	file->enabled_ns[V3D_CACHE_CLEAN] += runtime;
+	v3d->queue[V3D_CACHE_CLEAN].enabled_ns += runtime;
+
 	file->start_ns[V3D_CACHE_CLEAN] = 0;
+	v3d->queue[V3D_CACHE_CLEAN].start_ns = 0;

 	return NULL;
 }
--
2.41.0

