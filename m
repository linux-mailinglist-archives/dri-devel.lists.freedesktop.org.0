Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5961C6920E4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 15:36:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7116710ED57;
	Fri, 10 Feb 2023 14:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B4210ED4E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 14:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2HkX4AU3kEiKnZRT1PX6qW+HYrCqq6+rOJp/ZpstYAc=; b=J72x5a/hkSYfv795Xyz0Hx6j8z
 AHBNJ2R2oXKeVzlS/dSb/TuhhKICXd2l4UxbC6i7TddxDatsIY0Re1rZ/puZ7ey9lt+2XQ/aQQCF/
 QQQ+0edglac2UkLPBSqkw/3gQML2ohxOsXhV+msEGG/MXYUtJEpHDaqJW/Cdg/ZAJsCnt4NhuHG6k
 EisWSok7DUtdWVFcbHB+vTjClc9RFSyjOh3xvXqR9t6dJ+D/aF2nWkLHFSIchbDuFOiP1ku+7NmEi
 PclUiQ7otW0J+31LwETT6Cap0FBQIQL8tvyBqQ5EdbSga/6biskwDHwTJFlJTJd0k+SYOQ1XEZ5Wd
 WuTiOZRg==;
Received: from 215.43.165.83.dynamic.reverse-mundo-r.com ([83.165.43.215]
 helo=rivendell.jupiter) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pQUVg-00F7Tq-KO; Fri, 10 Feb 2023 15:36:20 +0100
From: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
To: Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/v3d: New debugfs end-points to query GPU usage stats.
Date: Fri, 10 Feb 2023 15:34:21 +0100
Message-Id: <20230210143421.1879915-1-jmcasanova@igalia.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two new debugfs interfaces are implemented to expose
the usage stats of the GPU scheduling queues.

- gpu_usage: exposes the total runtime since boot of each
of the 5 scheduling queues available at V3D (BIN, RENDER,
CSD, TFU, CACHE_CLEAN). So if the interface is queried at
two different points of time the usage percentage of each
of the queues can be calculated.

- gpu_pid_usage: exposes the same information but to the
level of detail of each process using the V3D driver. The
runtime for process using the driver is stored. So the
percentages of usage by PID can be calculated with
measures at different timestamps.

The storage of gpu_pid_usage stats is only done if
the debugfs interface is polled during the last 70 seconds.
If a process does not submit a GPU job during last 70
seconds its stats will also be purged.

Signed-off-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_debugfs.c |  91 +++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_drv.h     |  60 ++++++++++++
 drivers/gpu/drm/v3d/v3d_gem.c     |   1 +
 drivers/gpu/drm/v3d/v3d_irq.c     |   5 +
 drivers/gpu/drm/v3d/v3d_sched.c   | 146 +++++++++++++++++++++++++++++-
 5 files changed, 302 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index 330669f51fa7..42d36e3f6fa8 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -5,6 +5,7 @@
 #include <linux/ctype.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
+#include <linux/sched/clock.h>
 #include <linux/string_helpers.h>
 
 #include <drm/drm_debugfs.h>
@@ -202,6 +203,94 @@ static int v3d_debugfs_bo_stats(struct seq_file *m, void *unused)
 	return 0;
 }
 
+static int v3d_debugfs_gpu_usage(struct seq_file *m, void *unused)
+{
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
+	struct v3d_dev *v3d = to_v3d_dev(dev);
+	struct v3d_queue_stats *queue_stats;
+	enum v3d_queue queue;
+	u64 timestamp = local_clock();
+	u64 active_runtime;
+	char active;
+
+	seq_printf(m, "timestamp;%llu;\n", local_clock());
+	seq_puts(m, "\"QUEUE\";\"JOBS\";\"RUNTIME\";\"ACTIVE\";\n");
+	for (queue = 0; queue < V3D_MAX_QUEUES; queue++) {
+		if (!v3d->queue[queue].sched.ready)
+			continue;
+
+		queue_stats = &v3d->gpu_queue_stats[queue];
+		mutex_lock(&queue_stats->lock);
+		v3d_sched_stats_update(queue_stats);
+		if (queue_stats->last_pid) {
+			active_runtime = timestamp -
+				queue_stats->last_exec_start;
+			active = '1';
+		} else {
+			active_runtime = 0;
+			active = '0';
+		}
+
+		seq_printf(m, "%s;%d;%llu;%c;\n",
+			   v3d_queue_to_string(queue),
+			   queue_stats->jobs_sent,
+			   queue_stats->runtime + active_runtime,
+			   active);
+		mutex_unlock(&queue_stats->lock);
+	}
+
+	return 0;
+}
+
+static int v3d_debugfs_gpu_pid_usage(struct seq_file *m, void *unused)
+{
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
+	struct v3d_dev *v3d = to_v3d_dev(dev);
+	struct v3d_queue_stats *queue_stats;
+	struct v3d_queue_pid_stats *cur;
+	enum v3d_queue queue;
+	u64 active_runtime;
+	u64 timestamp = local_clock();
+	char active;
+
+	seq_printf(m, "timestamp;%llu;\n", timestamp);
+	seq_puts(m, "\"QUEUE\";\"PID\",\"JOBS\";\"RUNTIME\";\"ACTIVE\";\n");
+	for (queue = 0; queue < V3D_MAX_QUEUES; queue++) {
+
+		if (!v3d->queue[queue].sched.ready)
+			continue;
+
+		queue_stats = &v3d->gpu_queue_stats[queue];
+		mutex_lock(&queue_stats->lock);
+		v3d_sched_stats_update(queue_stats);
+		queue_stats->collect_pid_stats = 1;
+		queue_stats->pid_stats_timeout =
+			jiffies + V3D_QUEUE_STATS_TIMEOUT;
+		list_for_each_entry(cur, &queue_stats->pid_stats_list, list) {
+
+			if (cur->pid == queue_stats->last_pid) {
+				active_runtime = timestamp -
+						 queue_stats->last_exec_start;
+				active = '1';
+			} else {
+				active_runtime = 0;
+				active = '0';
+			}
+
+			seq_printf(m, "%s;%d;%d;%llu;%c;\n",
+				   v3d_queue_to_string(queue),
+				   cur->pid, cur->jobs_sent,
+				   cur->runtime + active_runtime,
+				   active);
+		}
+		mutex_unlock(&queue_stats->lock);
+	}
+
+	return 0;
+}
+
 static int v3d_measure_clock(struct seq_file *m, void *unused)
 {
 	struct drm_debugfs_entry *entry = m->private;
@@ -241,6 +330,8 @@ static const struct drm_debugfs_info v3d_debugfs_list[] = {
 	{"v3d_regs", v3d_v3d_debugfs_regs, 0},
 	{"measure_clock", v3d_measure_clock, 0},
 	{"bo_stats", v3d_debugfs_bo_stats, 0},
+	{"gpu_usage", v3d_debugfs_gpu_usage, 0},
+	{"gpu_pid_usage", v3d_debugfs_gpu_pid_usage, 0},
 };
 
 void
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index b74b1351bfc8..5c1f3177fc86 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -21,6 +21,19 @@ struct reset_control;
 
 #define V3D_MAX_QUEUES (V3D_CACHE_CLEAN + 1)
 
+static inline char *
+v3d_queue_to_string(enum v3d_queue queue)
+{
+	switch (queue) {
+	case V3D_BIN: return "v3d_bin";
+	case V3D_RENDER: return "v3d_render";
+	case V3D_TFU: return "v3d_tfu";
+	case V3D_CSD: return "v3d_csd";
+	case V3D_CACHE_CLEAN: return "v3d_cache_clean";
+	}
+	return "UNKNOWN";
+}
+
 struct v3d_queue_state {
 	struct drm_gpu_scheduler sched;
 
@@ -28,6 +41,45 @@ struct v3d_queue_state {
 	u64 emit_seqno;
 };
 
+struct v3d_queue_pid_stats {
+	struct	list_head list;
+	u64	runtime;
+	/* Time in jiffes.to purge the stats of this process. Every time a
+	 * process sends a new job to the queue, this timeout is delayed by
+	 * V3D_QUEUE_STATS_TIMEOUT while the pid_stats_timeout of the queue
+	 * is not reached.
+	 */
+	unsigned long timeout_purge;
+	u32	jobs_sent;
+	pid_t	pid;
+};
+
+struct v3d_queue_stats {
+	struct mutex	 lock;
+	u64		 last_exec_start;
+	u64		 last_exec_end;
+	u64		 runtime;
+	u32		 jobs_sent;
+	pid_t		 last_pid;
+	bool		 collect_pid_stats;
+	/* Time in jiffes to stop collecting gpu stats by process. This is
+	 * increased by every access to*the debugfs interface gpu_pid_usage.
+	 * If the debugfs is not used stats are not collected.
+	 */
+	unsigned long	 pid_stats_timeout;
+	struct list_head pid_stats_list;
+};
+
+/* pid_stats by process (v3d_queue_pid_stats) are recorded if there is an
+ * access to the gpu_pid_usageare debugfs interface for the last
+ * V3D_QUEUE_STATS_TIMEOUT (70s).
+ *
+ * The same timeout is used to purge the stats by process for those process
+ * that have not sent jobs this period.
+ */
+#define V3D_QUEUE_STATS_TIMEOUT (70 * HZ)
+
+
 /* Performance monitor object. The perform lifetime is controlled by userspace
  * using perfmon related ioctls. A perfmon can be attached to a submit_cl
  * request, and when this is the case, HW perf counters will be activated just
@@ -141,6 +193,8 @@ struct v3d_dev {
 		u32 num_allocated;
 		u32 pages_allocated;
 	} bo_stats;
+
+	struct v3d_queue_stats gpu_queue_stats[V3D_MAX_QUEUES];
 };
 
 static inline struct v3d_dev *
@@ -238,6 +292,11 @@ struct v3d_job {
 	 */
 	struct v3d_perfmon *perfmon;
 
+	/* PID of the process that submitted the job that could be used to
+	 * for collecting stats by process of gpu usage.
+	 */
+	pid_t client_pid;
+
 	/* Callback for the freeing of the job on refcount going to 0. */
 	void (*free)(struct kref *ref);
 };
@@ -402,6 +461,7 @@ void v3d_mmu_remove_ptes(struct v3d_bo *bo);
 /* v3d_sched.c */
 int v3d_sched_init(struct v3d_dev *v3d);
 void v3d_sched_fini(struct v3d_dev *v3d);
+void v3d_sched_stats_update(struct v3d_queue_stats *queue_stats);
 
 /* v3d_perfmon.c */
 void v3d_perfmon_get(struct v3d_perfmon *perfmon);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 5da1806f3969..8ec56470a403 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -429,6 +429,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	job = *container;
 	job->v3d = v3d;
 	job->free = free;
+	job->client_pid = current->pid;
 
 	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
 				 v3d_priv);
diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index e714d5318f30..9b8e8a3229cb 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -14,6 +14,7 @@
  */
 
 #include <linux/platform_device.h>
+#include <linux/sched/clock.h>
 
 #include "v3d_drv.h"
 #include "v3d_regs.h"
@@ -100,6 +101,7 @@ v3d_irq(int irq, void *arg)
 	if (intsts & V3D_INT_FLDONE) {
 		struct v3d_fence *fence =
 			to_v3d_fence(v3d->bin_job->base.irq_fence);
+		v3d->gpu_queue_stats[V3D_BIN].last_exec_end = local_clock();
 
 		trace_v3d_bcl_irq(&v3d->drm, fence->seqno);
 		dma_fence_signal(&fence->base);
@@ -109,6 +111,7 @@ v3d_irq(int irq, void *arg)
 	if (intsts & V3D_INT_FRDONE) {
 		struct v3d_fence *fence =
 			to_v3d_fence(v3d->render_job->base.irq_fence);
+		v3d->gpu_queue_stats[V3D_RENDER].last_exec_end = local_clock();
 
 		trace_v3d_rcl_irq(&v3d->drm, fence->seqno);
 		dma_fence_signal(&fence->base);
@@ -118,6 +121,7 @@ v3d_irq(int irq, void *arg)
 	if (intsts & V3D_INT_CSDDONE) {
 		struct v3d_fence *fence =
 			to_v3d_fence(v3d->csd_job->base.irq_fence);
+		v3d->gpu_queue_stats[V3D_CSD].last_exec_end = local_clock();
 
 		trace_v3d_csd_irq(&v3d->drm, fence->seqno);
 		dma_fence_signal(&fence->base);
@@ -154,6 +158,7 @@ v3d_hub_irq(int irq, void *arg)
 	if (intsts & V3D_HUB_INT_TFUC) {
 		struct v3d_fence *fence =
 			to_v3d_fence(v3d->tfu_job->base.irq_fence);
+		v3d->gpu_queue_stats[V3D_TFU].last_exec_end = local_clock();
 
 		trace_v3d_tfu_irq(&v3d->drm, fence->seqno);
 		dma_fence_signal(&fence->base);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 06238e6d7f5c..94dc2df2110f 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -18,6 +18,7 @@
  * semaphores to interlock between them.
  */
 
+#include <linux/sched/clock.h>
 #include <linux/kthread.h>
 
 #include "v3d_drv.h"
@@ -72,6 +73,120 @@ v3d_switch_perfmon(struct v3d_dev *v3d, struct v3d_job *job)
 		v3d_perfmon_start(v3d, job->perfmon);
 }
 
+/*
+ * Updates the scheduling stats of the gpu queues runtime for completed jobs.
+ *
+ * It should be called before any new job submission to the queue or before
+ * accessing the stats from the debugfs interface.
+ *
+ * It is expected that calls to this function are done with queue_stats->lock
+ * locked.
+ */
+void
+v3d_sched_stats_update(struct v3d_queue_stats *queue_stats)
+{
+	struct list_head *pid_stats_list = &queue_stats->pid_stats_list;
+	struct v3d_queue_pid_stats *cur, *tmp;
+	u64 runtime = 0;
+	bool purge_all_pid_stats = 0;
+
+	/* If debugfs stats gpu_pid_usage has not been polled for a period,
+	 * the pid stats collection is stopped and we purge any existing
+	 * pid_stats.
+	 *
+	 * pid_stats are also purged for clients that have reached the
+	 * timeout_purge because the process probably does not exist anymore.
+	 */
+	if (queue_stats->collect_pid_stats) {
+		if (time_is_before_jiffies(queue_stats->pid_stats_timeout)) {
+			purge_all_pid_stats = 1;
+			queue_stats->collect_pid_stats = 0;
+		}
+		list_for_each_entry_safe_reverse(cur, tmp, pid_stats_list, list) {
+			if (time_is_before_jiffies(cur->timeout_purge) ||
+			    purge_all_pid_stats) {
+				list_del(&cur->list);
+				kfree(cur);
+			} else {
+				break;
+			}
+		}
+	}
+	/* If a job has finished its stats are updated. */
+	if (queue_stats->last_pid && queue_stats->last_exec_end) {
+		runtime = queue_stats->last_exec_end -
+			  queue_stats->last_exec_start;
+		queue_stats->runtime += runtime;
+
+		if (queue_stats->collect_pid_stats) {
+			struct v3d_queue_pid_stats *pid_stats;
+			/* Last job info is always at the head of the list */
+			pid_stats = list_first_entry_or_null(pid_stats_list,
+				struct v3d_queue_pid_stats, list);
+			if (pid_stats &&
+			    pid_stats->pid == queue_stats->last_pid) {
+				pid_stats->runtime += runtime;
+			}
+		}
+		queue_stats->last_pid = 0;
+	}
+}
+
+/*
+ * Updates the queue usage adding the information of a new job that is
+ * about to be sent to the GPU to be executed.
+ */
+int
+v3d_sched_stats_add_job(struct v3d_queue_stats *queue_stats,
+			struct drm_sched_job *sched_job)
+{
+
+	struct v3d_queue_pid_stats *pid_stats = NULL;
+	struct v3d_job *job = sched_job?to_v3d_job(sched_job):NULL;
+	struct v3d_queue_pid_stats *cur;
+	struct list_head *pid_stats_list = &queue_stats->pid_stats_list;
+	int ret = 0;
+
+	mutex_lock(&queue_stats->lock);
+
+	/* Completion of previous job requires an update of its runtime */
+	v3d_sched_stats_update(queue_stats);
+
+	queue_stats->last_exec_start = local_clock();
+	queue_stats->last_exec_end = 0;
+	queue_stats->jobs_sent++;
+	queue_stats->last_pid = job->client_pid;
+
+	/* gpu usage stats by process are being collected */
+	if (queue_stats->collect_pid_stats) {
+		list_for_each_entry(cur, pid_stats_list, list) {
+			if (cur->pid == job->client_pid) {
+				pid_stats = cur;
+				break;
+			}
+		}
+		/* client pid_stats is moved to the head of the list. */
+		if (pid_stats) {
+			list_move(&pid_stats->list, pid_stats_list);
+		} else {
+			pid_stats = kzalloc(sizeof(struct v3d_queue_pid_stats),
+					    GFP_KERNEL);
+			if (!pid_stats) {
+				ret = -ENOMEM;
+				goto err_mem;
+			}
+			pid_stats->pid = job->client_pid;
+			list_add(&pid_stats->list, pid_stats_list);
+		}
+		pid_stats->jobs_sent++;
+		pid_stats->timeout_purge = jiffies + V3D_QUEUE_STATS_TIMEOUT;
+	}
+
+err_mem:
+	mutex_unlock(&queue_stats->lock);
+	return ret;
+}
+
 static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
 {
 	struct v3d_bin_job *job = to_bin_job(sched_job);
@@ -107,6 +222,7 @@ static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
 	trace_v3d_submit_cl(dev, false, to_v3d_fence(fence)->seqno,
 			    job->start, job->end);
 
+	v3d_sched_stats_add_job(&v3d->gpu_queue_stats[V3D_BIN], sched_job);
 	v3d_switch_perfmon(v3d, &job->base);
 
 	/* Set the current and end address of the control list.
@@ -158,6 +274,7 @@ static struct dma_fence *v3d_render_job_run(struct drm_sched_job *sched_job)
 	trace_v3d_submit_cl(dev, true, to_v3d_fence(fence)->seqno,
 			    job->start, job->end);
 
+	v3d_sched_stats_add_job(&v3d->gpu_queue_stats[V3D_RENDER], sched_job);
 	v3d_switch_perfmon(v3d, &job->base);
 
 	/* XXX: Set the QCFG */
@@ -190,6 +307,8 @@ v3d_tfu_job_run(struct drm_sched_job *sched_job)
 
 	trace_v3d_submit_tfu(dev, to_v3d_fence(fence)->seqno);
 
+	v3d_sched_stats_add_job(&v3d->gpu_queue_stats[V3D_TFU], sched_job);
+
 	V3D_WRITE(V3D_TFU_IIA, job->args.iia);
 	V3D_WRITE(V3D_TFU_IIS, job->args.iis);
 	V3D_WRITE(V3D_TFU_ICA, job->args.ica);
@@ -231,6 +350,7 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
 
 	trace_v3d_submit_csd(dev, to_v3d_fence(fence)->seqno);
 
+	v3d_sched_stats_add_job(&v3d->gpu_queue_stats[V3D_CSD], sched_job);
 	v3d_switch_perfmon(v3d, &job->base);
 
 	for (i = 1; i <= 6; i++)
@@ -247,7 +367,10 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched_job)
 	struct v3d_job *job = to_v3d_job(sched_job);
 	struct v3d_dev *v3d = job->v3d;
 
+	v3d_sched_stats_add_job(&v3d->gpu_queue_stats[V3D_CACHE_CLEAN],
+				sched_job);
 	v3d_clean_caches(v3d);
+	v3d->gpu_queue_stats[V3D_CACHE_CLEAN].last_exec_end = local_clock();
 
 	return NULL;
 }
@@ -385,8 +508,18 @@ v3d_sched_init(struct v3d_dev *v3d)
 	int hw_jobs_limit = 1;
 	int job_hang_limit = 0;
 	int hang_limit_ms = 500;
+	enum v3d_queue q;
 	int ret;
 
+	for (q = 0; q < V3D_MAX_QUEUES; q++) {
+		INIT_LIST_HEAD(&v3d->gpu_queue_stats[q].pid_stats_list);
+		/* Setting timeout before current jiffies disables collecting
+		 * pid_stats on scheduling init.
+		 */
+		v3d->gpu_queue_stats[q].pid_stats_timeout = jiffies - 1;
+		mutex_init(&v3d->gpu_queue_stats[q].lock);
+	}
+
 	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
 			     &v3d_bin_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
@@ -440,9 +573,20 @@ void
 v3d_sched_fini(struct v3d_dev *v3d)
 {
 	enum v3d_queue q;
+	struct v3d_queue_stats *queue_stats;
 
 	for (q = 0; q < V3D_MAX_QUEUES; q++) {
-		if (v3d->queue[q].sched.ready)
+		if (v3d->queue[q].sched.ready) {
+			queue_stats = &v3d->gpu_queue_stats[q];
+			mutex_lock(&queue_stats->lock);
+			/* Setting pid_stats_timeout to jiffies-1 will make
+			 * v3d_sched_stats_update to purge all allocated
+			 * pid_stats.
+			 */
+			queue_stats->pid_stats_timeout = jiffies - 1;
+			v3d_sched_stats_update(queue_stats);
+			mutex_unlock(&queue_stats->lock);
 			drm_sched_fini(&v3d->queue[q].sched);
+		}
 	}
 }
-- 
2.30.2

