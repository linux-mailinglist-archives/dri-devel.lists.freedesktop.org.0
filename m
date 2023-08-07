Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7B5773123
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 23:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C6610E385;
	Mon,  7 Aug 2023 21:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA19110E385
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 21:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mlF5UDBDbOnmfRRS/7aeAvmhPRmiuJzrDv7fWqR3RvU=; b=bZ7+HyeIlYs4hOygft9bO/twYE
 0JjrJrZs6aHdZF2m2Z+qxq6eR+M/tMS86343FiCnQLayWlVeXipQZwJpIuLTbiY/yvndae6EJVZTG
 aOPICXoo7DEveMJkywfgpTHHUxSDwBKiZb8qJKLC7Sm1XQ5bFu/+kyZYrH1JVnd0PZmDpZeQnoBY5
 NyIjhe+hthONXUjpKni27CjMULWx7vssuz3gq7wxGOgLdXmN5ZjlJSUJaft0nKxg2HN4h0WUK7Bev
 0p/X/qQ1qENGPzvfLFeFPwKFVh7dg5gMgYpVQR2CKjB6UNmYlFmWu1nJK8zVwsw7CVnanefcIsqZc
 9UTahmLA==;
Received: from [177.34.168.16] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qT7dN-00F1NC-V3; Mon, 07 Aug 2023 23:19:26 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH v2 2/2] drm/v3d: Expose the total GPU usage stats on sysfs
Date: Mon,  7 Aug 2023 18:12:55 -0300
Message-ID: <20230807211849.49867-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807211849.49867-1-mcanal@igalia.com>
References: <20230807211849.49867-1-mcanal@igalia.com>
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

This data is exposed through the sysfs interface, so that if the
interface is queried at two different points of time the usage percentage
of each of the queues can be calculated.

Co-developed-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
Signed-off-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/Makefile    |   3 +-
 drivers/gpu/drm/v3d/v3d_drv.c   |   9 +++
 drivers/gpu/drm/v3d/v3d_drv.h   |   7 +++
 drivers/gpu/drm/v3d/v3d_gem.c   |   5 +-
 drivers/gpu/drm/v3d/v3d_irq.c   |  24 ++++++--
 drivers/gpu/drm/v3d/v3d_sched.c |  13 +++-
 drivers/gpu/drm/v3d/v3d_sysfs.c | 101 ++++++++++++++++++++++++++++++++
 7 files changed, 155 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/v3d/v3d_sysfs.c

diff --git a/drivers/gpu/drm/v3d/Makefile b/drivers/gpu/drm/v3d/Makefile
index e8b314137020..4b21b20e4998 100644
--- a/drivers/gpu/drm/v3d/Makefile
+++ b/drivers/gpu/drm/v3d/Makefile
@@ -11,7 +11,8 @@ v3d-y := \
 	v3d_mmu.o \
 	v3d_perfmon.o \
 	v3d_trace_points.o \
-	v3d_sched.o
+	v3d_sched.o \
+	v3d_sysfs.o
 
 v3d-$(CONFIG_DEBUG_FS) += v3d_debugfs.o
 
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index ca65c707da03..7fc84a2525ca 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -309,8 +309,14 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	if (ret)
 		goto irq_disable;
 
+	ret = v3d_sysfs_init(dev);
+	if (ret)
+		goto drm_unregister;
+
 	return 0;
 
+drm_unregister:
+	drm_dev_unregister(drm);
 irq_disable:
 	v3d_irq_disable(v3d);
 gem_destroy:
@@ -324,6 +330,9 @@ static void v3d_platform_drm_remove(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
 	struct v3d_dev *v3d = to_v3d_dev(drm);
+	struct device *dev = &pdev->dev;
+
+	v3d_sysfs_destroy(dev);
 
 	drm_dev_unregister(drm);
 
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 7f2897e5b2cb..c8f95a91af46 100644
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
@@ -441,3 +444,7 @@ int v3d_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
 			      struct drm_file *file_priv);
 int v3d_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file_priv);
+
+/* v3d_sysfs.c */
+int v3d_sysfs_init(struct device *dev);
+void v3d_sysfs_destroy(struct device *dev);
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
diff --git a/drivers/gpu/drm/v3d/v3d_sysfs.c b/drivers/gpu/drm/v3d/v3d_sysfs.c
new file mode 100644
index 000000000000..19cef3ddb7c6
--- /dev/null
+++ b/drivers/gpu/drm/v3d/v3d_sysfs.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Igalia S.L.
+ */
+
+#include <linux/sched/clock.h>
+#include <linux/sysfs.h>
+
+#include "v3d_drv.h"
+
+static u64
+v3d_sysfs_emit_total_runtime(struct v3d_dev *v3d, enum v3d_queue queue, char *buf)
+{
+	u64 timestamp = local_clock();
+	u64 active_runtime;
+
+	if (v3d->queue[queue].start_ns)
+		active_runtime = timestamp - v3d->queue[queue].start_ns;
+	else
+		active_runtime = 0;
+
+	return sysfs_emit(buf, "timestamp: %llu %s: %llu ns\n",
+			  timestamp,
+			  v3d_queue_to_string(queue),
+			  v3d->queue[queue].enabled_ns + active_runtime);
+}
+
+static ssize_t
+bin_queue_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct v3d_dev *v3d = to_v3d_dev(drm);
+
+	return v3d_sysfs_emit_total_runtime(v3d, V3D_BIN, buf);
+}
+static DEVICE_ATTR_RO(bin_queue);
+
+static ssize_t
+render_queue_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct v3d_dev *v3d = to_v3d_dev(drm);
+
+	return v3d_sysfs_emit_total_runtime(v3d, V3D_RENDER, buf);
+}
+static DEVICE_ATTR_RO(render_queue);
+
+static ssize_t
+tfu_queue_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct v3d_dev *v3d = to_v3d_dev(drm);
+
+	return v3d_sysfs_emit_total_runtime(v3d, V3D_TFU, buf);
+}
+static DEVICE_ATTR_RO(tfu_queue);
+
+static ssize_t
+csd_queue_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct v3d_dev *v3d = to_v3d_dev(drm);
+
+	return v3d_sysfs_emit_total_runtime(v3d, V3D_CSD, buf);
+}
+static DEVICE_ATTR_RO(csd_queue);
+
+static ssize_t
+cache_clean_queue_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct v3d_dev *v3d = to_v3d_dev(drm);
+
+	return v3d_sysfs_emit_total_runtime(v3d, V3D_CACHE_CLEAN, buf);
+}
+static DEVICE_ATTR_RO(cache_clean_queue);
+
+static struct attribute *v3d_sysfs_entries[] = {
+	&dev_attr_bin_queue.attr,
+	&dev_attr_render_queue.attr,
+	&dev_attr_tfu_queue.attr,
+	&dev_attr_csd_queue.attr,
+	&dev_attr_cache_clean_queue.attr,
+	NULL,
+};
+
+static struct attribute_group v3d_sysfs_attr_group = {
+	.attrs = v3d_sysfs_entries,
+};
+
+int
+v3d_sysfs_init(struct device *dev)
+{
+	return sysfs_create_group(&dev->kobj, &v3d_sysfs_attr_group);
+}
+
+void
+v3d_sysfs_destroy(struct device *dev)
+{
+	return sysfs_remove_group(&dev->kobj, &v3d_sysfs_attr_group);
+}
-- 
2.41.0

