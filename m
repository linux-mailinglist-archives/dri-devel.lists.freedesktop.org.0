Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2673D94E973
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 11:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A261010E071;
	Mon, 12 Aug 2024 09:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VM7o0YLv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1420B10E073
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 09:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wNNCXxQ5JflYOWZDg9/V5zH1lx2i9o1TFyzn7t65r6c=; b=VM7o0YLvWiK9ZQmp0Jb6+9s9I2
 p4/6J6t6aZs8ZZyaHQm149miD/SpBTduaJadpjdRiA7RZWBBcCNS+E0GKvhJH4SWx0EMdeCZYlfAS
 +Ux8ZY2g3QVYm3OeDda7+S1r4CH9WZJWngfdd/zJ6hL5BxUVIsX+p+/EKvZjlHvn1ErfBS1frMxEg
 q6VM5CLi7lRH/x3/ox7iHbg0+g6I7b4Udc18nzKc8s05wkeVa0b8ymoPa6IuV1icBh2HKyN43Z1e6
 B603q7zVK5XEIrx1HtdDGwTu8osgjnR6pEDrlTsOIpsl9zAGrOnxrVAfXVYTI8MErCScUynszv+Bk
 0NtmXmsw==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sdR6U-00BSDs-B0; Mon, 12 Aug 2024 11:12:38 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 2/2] drm/v3d: Appease lockdep while updating GPU stats
Date: Mon, 12 Aug 2024 10:12:18 +0100
Message-ID: <20240812091218.70317-2-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240812091218.70317-1-tursulin@igalia.com>
References: <20240812091218.70317-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Lockdep thinks our seqcount_t usage is unsafe because the update path can
be both from irq and worker context:

 [ ] ================================
 [ ] WARNING: inconsistent lock state
 [ ] 6.10.3-v8-16k-numa #159 Tainted: G        WC
 [ ] --------------------------------
 [ ] inconsistent {HARDIRQ-ON-W} -> {IN-HARDIRQ-W} usage.
 [ ] swapper/0/0 [HC1[1]:SC0[0]:HE0:SE1] takes:
 [ ] ffff80003d7c08d0 (&v3d_priv->stats[i].lock){?.+.}-{0:0}, at: v3d_irq+0xc8/0x660 [v3d]
 [ ] {HARDIRQ-ON-W} state was registered at:
 [ ]   lock_acquire+0x1f8/0x328
 [ ]   v3d_job_start_stats.isra.0+0xd8/0x218 [v3d]
 [ ]   v3d_bin_job_run+0x23c/0x388 [v3d]
 [ ]   drm_sched_run_job_work+0x520/0x6d0 [gpu_sched]
 [ ]   process_one_work+0x62c/0xb48
 [ ]   worker_thread+0x468/0x5b0
 [ ]   kthread+0x1c4/0x1e0
 [ ]   ret_from_fork+0x10/0x20
 [ ] irq event stamp: 337094
 [ ] hardirqs last  enabled at (337093): [<ffffc0008144ce7c>] default_idle_call+0x11c/0x140
 [ ] hardirqs last disabled at (337094): [<ffffc0008144a354>] el1_interrupt+0x24/0x58
 [ ] softirqs last  enabled at (337082): [<ffffc00080061d90>] handle_softirqs+0x4e0/0x538
 [ ] softirqs last disabled at (337073): [<ffffc00080010364>] __do_softirq+0x1c/0x28
 [ ]
                other info that might help us debug this:
 [ ]  Possible unsafe locking scenario:

 [ ]        CPU0
 [ ]        ----
 [ ]   lock(&v3d_priv->stats[i].lock);
 [ ]   <Interrupt>
 [ ]     lock(&v3d_priv->stats[i].lock);
 [ ]
                *** DEADLOCK ***

 [ ] no locks held by swapper/0/0.
 [ ]
               stack backtrace:
 [ ] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        WC         6.10.3-v8-16k-numa #159
 [ ] Hardware name: Raspberry Pi 5 Model B Rev 1.0 (DT)
 [ ] Call trace:
 [ ]  dump_backtrace+0x170/0x1b8
 [ ]  show_stack+0x20/0x38
 [ ]  dump_stack_lvl+0xb4/0xd0
 [ ]  dump_stack+0x18/0x28
 [ ]  print_usage_bug+0x3cc/0x3f0
 [ ]  mark_lock+0x4d0/0x968
 [ ]  __lock_acquire+0x784/0x18c8
 [ ]  lock_acquire+0x1f8/0x328
 [ ]  v3d_job_update_stats+0xec/0x2e0 [v3d]
 [ ]  v3d_irq+0xc8/0x660 [v3d]
 [ ]  __handle_irq_event_percpu+0x1f8/0x488
 [ ]  handle_irq_event+0x88/0x128
 [ ]  handle_fasteoi_irq+0x298/0x408
 [ ]  generic_handle_domain_irq+0x50/0x78

But it is a false positive because all the queue-stats pairs have their
own lock and jobs are also one at a time.

Nevertheless we can appease lockdep by doing two things:

1. Split the locks into two classes:

Because only GPU jobs have the irq context update section, this means no
further changes are required for the CPU based queues.

2. Disable local interrupts in the GPU stats update portions:

This appeases lockdep that all GPU job update sides consistently run with
interrupts disabled. Again, it isn't a real locking issue that this fixes
but it avoids an alarming false positive lockdep splat.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: 6abe93b621ab ("drm/v3d: Fix race-condition between sysfs/fdinfo and interrupt handler")
Cc: Maíra Canal <mcanal@igalia.com>
---
Splitting into two own lock classes is perhaps too complicated and instead
we could use the new v3d_job_start_stats_irqsave() helper from the CPU
jobs too. I *think* that would fix the false positive too.

The naming of v3d_job_start_stats_irqsave() is also a bit dodgy (given
that the irqsave part depends on lockdep), but I have no better ideas at
the moment.

Having said this.. Perhaps simply the #ifdef dance with a comment to
existing v3d_job_start_stats() would be better? It would be a much shorter
and a very localised patch with perhaps no new downsides.
---
 drivers/gpu/drm/v3d/v3d_drv.c   | 16 +++++++++++++++-
 drivers/gpu/drm/v3d/v3d_gem.c   | 15 ++++++++++++++-
 drivers/gpu/drm/v3d/v3d_sched.c | 29 +++++++++++++++++++++++++----
 3 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index d7ff1f5fa481..4a5d3ab1281b 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -106,6 +106,8 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 static int
 v3d_open(struct drm_device *dev, struct drm_file *file)
 {
+	static struct lock_class_key v3d_stats_gpu_lock_class;
+	static struct lock_class_key v3d_stats_cpu_lock_class;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	struct v3d_file_priv *v3d_priv;
 	struct drm_gpu_scheduler *sched;
@@ -118,13 +120,25 @@ v3d_open(struct drm_device *dev, struct drm_file *file)
 	v3d_priv->v3d = v3d;
 
 	for (i = 0; i < V3D_MAX_QUEUES; i++) {
+		struct lock_class_key *key;
+		char *name;
+
 		sched = &v3d->queue[i].sched;
 		drm_sched_entity_init(&v3d_priv->sched_entity[i],
 				      DRM_SCHED_PRIORITY_NORMAL, &sched,
 				      1, NULL);
 
 		memset(&v3d_priv->stats[i], 0, sizeof(v3d_priv->stats[i]));
-		seqcount_init(&v3d_priv->stats[i].lock);
+
+		if (i == V3D_CACHE_CLEAN || i == V3D_CPU) {
+			key = &v3d_stats_cpu_lock_class;
+			name = "v3d_client_stats_cpu_lock";
+		} else {
+			key = &v3d_stats_gpu_lock_class;
+			name = "v3d_client_stats_gpu_lock";
+		}
+
+		__seqcount_init(&v3d_priv->stats[i].lock, name, key);
 	}
 
 	v3d_perfmon_open_file(v3d_priv);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index da8faf3b9011..3567a80e603d 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -242,16 +242,29 @@ v3d_invalidate_caches(struct v3d_dev *v3d)
 int
 v3d_gem_init(struct drm_device *dev)
 {
+	static struct lock_class_key v3d_stats_gpu_lock_class;
+	static struct lock_class_key v3d_stats_cpu_lock_class;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	u32 pt_size = 4096 * 1024;
 	int ret, i;
 
 	for (i = 0; i < V3D_MAX_QUEUES; i++) {
 		struct v3d_queue_state *queue = &v3d->queue[i];
+		struct lock_class_key *key;
+		char *name;
 
 		queue->fence_context = dma_fence_context_alloc(1);
 		memset(&queue->stats, 0, sizeof(queue->stats));
-		seqcount_init(&queue->stats.lock);
+
+		if (i == V3D_CACHE_CLEAN || i == V3D_CPU) {
+			key = &v3d_stats_cpu_lock_class;
+			name = "v3d_stats_cpu_lock";
+		} else {
+			key = &v3d_stats_gpu_lock_class;
+			name = "v3d_stats_gpu_lock";
+		}
+
+		__seqcount_init(&queue->stats.lock, name, key);
 	}
 
 	spin_lock_init(&v3d->mm_lock);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index cc2e5a89467b..b2540e20d30c 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -149,6 +149,27 @@ v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
 	preempt_enable();
 }
 
+/*
+ * We only need to disable local interrupts to appease lockdep who otherwise
+ * would think v3d_job_start_stats vs v3d_stats_update has an unsafe in-irq vs
+ * no-irq-off usage problem. This is a false positive becuase all the locks are
+ * per queue and stats type, and all jobs are completely one at a time
+ * serialised.
+ */
+static void
+v3d_job_start_stats_irqsave(struct v3d_job *job, enum v3d_queue queue)
+{
+#ifdef CONFIG_LOCKDEP
+	unsigned long flags;
+
+	local_irq_save(flags);
+#endif
+	v3d_job_start_stats(job, queue);
+#ifdef CONFIG_LOCKDEP
+	local_irq_restore(flags);
+#endif
+}
+
 static void
 v3d_stats_update(struct v3d_stats *stats, u64 now)
 {
@@ -194,6 +215,7 @@ static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
 	 * reuse the overflow attached to a previous job.
 	 */
 	V3D_CORE_WRITE(0, V3D_PTB_BPOS, 0);
+	v3d_job_start_stats(&job->base, V3D_BIN); /* Piggy-back on existing irq-off section. */
 	spin_unlock_irqrestore(&v3d->job_lock, irqflags);
 
 	v3d_invalidate_caches(v3d);
@@ -209,7 +231,6 @@ static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
 	trace_v3d_submit_cl(dev, false, to_v3d_fence(fence)->seqno,
 			    job->start, job->end);
 
-	v3d_job_start_stats(&job->base, V3D_BIN);
 	v3d_switch_perfmon(v3d, &job->base);
 
 	/* Set the current and end address of the control list.
@@ -261,7 +282,7 @@ static struct dma_fence *v3d_render_job_run(struct drm_sched_job *sched_job)
 	trace_v3d_submit_cl(dev, true, to_v3d_fence(fence)->seqno,
 			    job->start, job->end);
 
-	v3d_job_start_stats(&job->base, V3D_RENDER);
+	v3d_job_start_stats_irqsave(&job->base, V3D_RENDER);
 	v3d_switch_perfmon(v3d, &job->base);
 
 	/* XXX: Set the QCFG */
@@ -294,7 +315,7 @@ v3d_tfu_job_run(struct drm_sched_job *sched_job)
 
 	trace_v3d_submit_tfu(dev, to_v3d_fence(fence)->seqno);
 
-	v3d_job_start_stats(&job->base, V3D_TFU);
+	v3d_job_start_stats_irqsave(&job->base, V3D_TFU);
 
 	V3D_WRITE(V3D_TFU_IIA(v3d->ver), job->args.iia);
 	V3D_WRITE(V3D_TFU_IIS(v3d->ver), job->args.iis);
@@ -339,7 +360,7 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
 
 	trace_v3d_submit_csd(dev, to_v3d_fence(fence)->seqno);
 
-	v3d_job_start_stats(&job->base, V3D_CSD);
+	v3d_job_start_stats_irqsave(&job->base, V3D_CSD);
 	v3d_switch_perfmon(v3d, &job->base);
 
 	csd_cfg0_reg = V3D_CSD_QUEUED_CFG0(v3d->ver);
-- 
2.44.0

