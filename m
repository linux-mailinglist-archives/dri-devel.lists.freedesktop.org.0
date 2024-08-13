Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E06F950260
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 12:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E58B10E2DD;
	Tue, 13 Aug 2024 10:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TNFHMYlH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED2F10E2DE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RQn5YfxTb0VAMLBpx3eWU99G17Q99Oq4xeBq3YqSESc=; b=TNFHMYlH1OE+ssroX6vcTKJyG7
 V2dfIIHVVFZhe/miWjWhlAHpfo6IAvtjpsd1shbqQkwjI7wrLHzgxGwKbM5A3mAHnvxokx9pWOwdT
 G3T2r2IRsXhBhRei7fTB8NNAz8Ndt2vEfWt8qOBAFPqT9BJNNia5goIIL0EK32qwnQf+ZEnbTzu3j
 Z9lbl8vDwNYk0KkcIlXC9S9NURcCGbfY5kDQuy8ZZW6bgohBgXoJS513tfRdzxSNVLkVh1UCt6Ucq
 EgrsZx06UZhJGchkirXHd962S0nOheZ9mSQ1fMHLUtTJpDMxXKC8FuxGb65/gpqgfavTjlZhyLz7c
 6MzScIoA==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sdoiC-00Bsuw-Mu; Tue, 13 Aug 2024 12:25:08 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 2/2] drm/v3d: Appease lockdep while updating GPU stats
Date: Tue, 13 Aug 2024 11:25:05 +0100
Message-ID: <20240813102505.80512-2-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240813102505.80512-1-tursulin@igalia.com>
References: <20240813102505.80512-1-tursulin@igalia.com>
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

Nevertheless we can appease lockdep by disabling local interrupts to make
it see lock usage is consistent.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: 6abe93b621ab ("drm/v3d: Fix race-condition between sysfs/fdinfo and interrupt handler")
Cc: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_sched.c | 44 ++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index cc2e5a89467b..e4fc3d401edd 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -135,8 +135,31 @@ v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
 	struct v3d_stats *global_stats = &v3d->queue[queue].stats;
 	struct v3d_stats *local_stats = &file->stats[queue];
 	u64 now = local_clock();
+	unsigned long flags;
 
-	preempt_disable();
+	/*
+	 * We only need to disable local interrupts to appease lockdep who
+	 * otherwise would think v3d_job_start_stats vs v3d_stats_update has an
+	 * unsafe in-irq vs no-irq-off usage problem. This is a false positive
+	 * becuase all the locks are per queue and stats type, and all jobs are
+	 * completely one at a time serialised. More specifically:
+	 *
+	 * 1. Locks for GPU queues are updated from interrupt handlers under a
+	 *    spin lock and started here with preemption disabled.
+	 *
+	 * 2. Locks for CPU queues are updated from the worker with preemption
+	 *    disabled and equally started here with preemption disabled.
+	 *
+	 * Therefore both are consistent.
+	 *
+	 * 3. Because next job can only be queued after the previous one has
+	 *    been signaled, and locks are per queue, there is also no scope for
+	 *    the start part to race with the update part.
+	 */
+	if (IS_ENABLED(CONFIG_LOCKDEP))
+		local_irq_save(flags);
+	else
+		preempt_disable();
 
 	write_seqcount_begin(&local_stats->lock);
 	local_stats->start_ns = now;
@@ -146,7 +169,10 @@ v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
 	global_stats->start_ns = now;
 	write_seqcount_end(&global_stats->lock);
 
-	preempt_enable();
+	if (IS_ENABLED(CONFIG_LOCKDEP))
+		local_irq_restore(flags);
+	else
+		preempt_enable();
 }
 
 static void
@@ -167,11 +193,21 @@ v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue)
 	struct v3d_stats *global_stats = &v3d->queue[queue].stats;
 	struct v3d_stats *local_stats = &file->stats[queue];
 	u64 now = local_clock();
+	unsigned long flags;
+
+	/* See comment in v3d_job_start_stats() */
+	if (IS_ENABLED(CONFIG_LOCKDEP))
+		local_irq_save(flags);
+	else
+		preempt_disable();
 
-	preempt_disable();
 	v3d_stats_update(local_stats, now);
 	v3d_stats_update(global_stats, now);
-	preempt_enable();
+
+	if (IS_ENABLED(CONFIG_LOCKDEP))
+		local_irq_restore(flags);
+	else
+		preempt_enable();
 }
 
 static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
-- 
2.44.0

