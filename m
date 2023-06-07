Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C716B726058
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 15:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D19D10E507;
	Wed,  7 Jun 2023 13:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E94C10E4ED
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 13:02:27 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q6snw-0004N0-2C; Wed, 07 Jun 2023 15:02:24 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 1/8] drm/etnaviv: move down etnaviv_gpu_recover_hang() in file
Date: Wed,  7 Jun 2023 15:02:16 +0200
Message-Id: <20230607130223.3533464-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So it can use the event_free function without adding another
forward declaration. No functional change.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 88 +++++++++++++--------------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index de8c9894967c..6d4df9f1aeff 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1059,50 +1059,6 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
 }
 #endif
 
-void etnaviv_gpu_recover_hang(struct etnaviv_gem_submit *submit)
-{
-	struct etnaviv_gpu *gpu = submit->gpu;
-	char *comm = NULL, *cmd = NULL;
-	struct task_struct *task;
-	unsigned int i;
-
-	dev_err(gpu->dev, "recover hung GPU!\n");
-
-	task = get_pid_task(submit->pid, PIDTYPE_PID);
-	if (task) {
-		comm = kstrdup(task->comm, GFP_KERNEL);
-		cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);
-		put_task_struct(task);
-	}
-
-	if (comm && cmd)
-		dev_err(gpu->dev, "offending task: %s (%s)\n", comm, cmd);
-
-	kfree(cmd);
-	kfree(comm);
-
-	if (pm_runtime_get_sync(gpu->dev) < 0)
-		goto pm_put;
-
-	mutex_lock(&gpu->lock);
-
-	etnaviv_hw_reset(gpu);
-
-	/* complete all events, the GPU won't do it after the reset */
-	spin_lock(&gpu->event_spinlock);
-	for_each_set_bit(i, gpu->event_bitmap, ETNA_NR_EVENTS)
-		complete(&gpu->event_free);
-	bitmap_zero(gpu->event_bitmap, ETNA_NR_EVENTS);
-	spin_unlock(&gpu->event_spinlock);
-
-	etnaviv_gpu_hw_init(gpu);
-
-	mutex_unlock(&gpu->lock);
-	pm_runtime_mark_last_busy(gpu->dev);
-pm_put:
-	pm_runtime_put_autosuspend(gpu->dev);
-}
-
 /* fence object management */
 struct etnaviv_fence {
 	struct etnaviv_gpu *gpu;
@@ -1454,6 +1410,50 @@ static void sync_point_worker(struct work_struct *work)
 	etnaviv_gpu_start_fe(gpu, addr + 2, 2);
 }
 
+void etnaviv_gpu_recover_hang(struct etnaviv_gem_submit *submit)
+{
+	struct etnaviv_gpu *gpu = submit->gpu;
+	char *comm = NULL, *cmd = NULL;
+	struct task_struct *task;
+	unsigned int i;
+
+	dev_err(gpu->dev, "recover hung GPU!\n");
+
+	task = get_pid_task(submit->pid, PIDTYPE_PID);
+	if (task) {
+		comm = kstrdup(task->comm, GFP_KERNEL);
+		cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);
+		put_task_struct(task);
+	}
+
+	if (comm && cmd)
+		dev_err(gpu->dev, "offending task: %s (%s)\n", comm, cmd);
+
+	kfree(cmd);
+	kfree(comm);
+
+	if (pm_runtime_get_sync(gpu->dev) < 0)
+		goto pm_put;
+
+	mutex_lock(&gpu->lock);
+
+	etnaviv_hw_reset(gpu);
+
+	/* complete all events, the GPU won't do it after the reset */
+	spin_lock(&gpu->event_spinlock);
+	for_each_set_bit(i, gpu->event_bitmap, ETNA_NR_EVENTS)
+		complete(&gpu->event_free);
+	bitmap_zero(gpu->event_bitmap, ETNA_NR_EVENTS);
+	spin_unlock(&gpu->event_spinlock);
+
+	etnaviv_gpu_hw_init(gpu);
+
+	mutex_unlock(&gpu->lock);
+	pm_runtime_mark_last_busy(gpu->dev);
+pm_put:
+	pm_runtime_put_autosuspend(gpu->dev);
+}
+
 static void dump_mmu_fault(struct etnaviv_gpu *gpu)
 {
 	static const char *fault_reasons[] = {
-- 
2.39.2

