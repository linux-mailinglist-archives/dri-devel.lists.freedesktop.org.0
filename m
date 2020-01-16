Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E1213DB38
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 14:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD7F6ECFB;
	Thu, 16 Jan 2020 13:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980CE6ECFB;
 Thu, 16 Jan 2020 13:12:56 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id c9so3026806plo.1;
 Thu, 16 Jan 2020 05:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UdGg/fAOpUW6G12ElXdVhk4KCnnAbO4mA+qwiO+O908=;
 b=pBba8JAdVoQBQc6eAieLR//FAyFFvJWS7XBMAAMPLe4DfNPrY4J/BowS52GmF4p1rB
 zzJHbm5zXKtP09xyMZeTXYnMfMnKo0olnENkbhtJW+4VD8p3I8zQGpBObs/FUGQyO9ie
 nXgu69L7HdyaCQTyvg9z4pip/4CCrMhrHq6BktF/j+cvwC9nMwAqn70m6Ai/t4QDUss+
 tfjVrE6d+nyyHDVOcZzbigRd22zk8ViF685UOtpaUs7E35VxnUOqUr5V3lnwNR622XLy
 s614mgzKc9jW0Gz0tf8otCivhb+0B1JXfbFnoCKNSgfmbbCpG2DOzlYRK+V2JmVeIi7e
 rEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UdGg/fAOpUW6G12ElXdVhk4KCnnAbO4mA+qwiO+O908=;
 b=RqtPWfX9bj33WaudjG8yvJi3S0sksox3n8NDeN1Kz8KpOOmweGwXWaZ7cJFuBKC8j7
 NT7Kbbc0vZpE7cRBmgxeYl5lg9vuHllqhrxhwSaRZZkJuGTp/dLwmosX8q/7PSMJ8lDV
 bmFRcJL3PkhcnLxLxa1dyZLRTDwT2LAzDlvV/hvdWnLQjyqgZ+4MPkwFdNLPeghTsgUn
 ypptysrJ2kCBgE2yWNf1wLDFqsIN4fiTa5xXNfqis4fcVtx7Ak1OXWmLigKwHwJEoNQO
 QE+35QsonAjHw2k4zrO7SY1DSwIXD2djCbi/6Zns++iGL8gJfxnDjK0F1KutSVhdm7UM
 4NVg==
X-Gm-Message-State: APjAAAX7EVBCPS6NLaRmT3usPSXr5vKIoU4N8p1RVuQc2mNcwj7n2tA2
 G5P09/lJGjbRCZ7Rz4pEY0ALy5bP
X-Google-Smtp-Source: APXvYqwcx7g7D5vgpL6oed5WaK3ApNisHCT/Q3XnVqu7MjYxSnAy7L5yZZ1I6LF/5S14x0DaE1l+fQ==
X-Received: by 2002:a17:902:8c94:: with SMTP id
 t20mr24235927plo.170.1579180376012; 
 Thu, 16 Jan 2020 05:12:56 -0800 (PST)
Received: from localhost.localdomain ([103.219.195.110])
 by smtp.gmail.com with ESMTPSA id v9sm25945877pfi.37.2020.01.16.05.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 05:12:55 -0800 (PST)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/lima: recover task by enlarging heap buffer
Date: Thu, 16 Jan 2020 21:11:56 +0800
Message-Id: <20200116131157.13346-5-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200116131157.13346-1-yuq825@gmail.com>
References: <20200116131157.13346-1-yuq825@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andreas Baierl <ichgeh@imkreisrum.de>,
 Qiang Yu <yuq825@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Increase heap buffer backup memory when GP receive PLBU
out of memory interrupt, then resume the task.

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_gp.c    | 51 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/lima/lima_mmu.c   |  5 +++
 drivers/gpu/drm/lima/lima_mmu.h   |  1 +
 drivers/gpu/drm/lima/lima_sched.c | 35 ++++++++++++++++++---
 drivers/gpu/drm/lima/lima_sched.h |  6 ++++
 5 files changed, 91 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_gp.c b/drivers/gpu/drm/lima/lima_gp.c
index ccf49faedebf..d1e7826c2d74 100644
--- a/drivers/gpu/drm/lima/lima_gp.c
+++ b/drivers/gpu/drm/lima/lima_gp.c
@@ -11,6 +11,8 @@
 #include "lima_device.h"
 #include "lima_gp.h"
 #include "lima_regs.h"
+#include "lima_gem.h"
+#include "lima_vm.h"
 
 #define gp_write(reg, data) writel(data, ip->iomem + reg)
 #define gp_read(reg) readl(ip->iomem + reg)
@@ -20,6 +22,7 @@ static irqreturn_t lima_gp_irq_handler(int irq, void *data)
 	struct lima_ip *ip = data;
 	struct lima_device *dev = ip->dev;
 	struct lima_sched_pipe *pipe = dev->pipe + lima_pipe_gp;
+	struct lima_sched_task *task = pipe->current_task;
 	u32 state = gp_read(LIMA_GP_INT_STAT);
 	u32 status = gp_read(LIMA_GP_STATUS);
 	bool done = false;
@@ -29,8 +32,14 @@ static irqreturn_t lima_gp_irq_handler(int irq, void *data)
 		return IRQ_NONE;
 
 	if (state & LIMA_GP_IRQ_MASK_ERROR) {
-		dev_err(dev->dev, "gp error irq state=%x status=%x\n",
-			state, status);
+		if ((state & LIMA_GP_IRQ_MASK_ERROR) == LIMA_GP_IRQ_PLBU_OUT_OF_MEM)
+			dev_dbg(dev->dev, "gp out of heap irq status=%x\n", status);
+		else {
+			dev_err(dev->dev, "gp error irq state=%x status=%x\n",
+				state, status);
+			if (task)
+				task->recoverable = false;
+		}
 
 		/* mask all interrupts before hard reset */
 		gp_write(LIMA_GP_INT_MASK, 0);
@@ -43,6 +52,7 @@ static irqreturn_t lima_gp_irq_handler(int irq, void *data)
 		bool active = status & (LIMA_GP_STATUS_VS_ACTIVE |
 					LIMA_GP_STATUS_PLBU_ACTIVE);
 		done = valid && !active;
+		pipe->error = false;
 	}
 
 	gp_write(LIMA_GP_INT_CLEAR, state);
@@ -121,6 +131,19 @@ static void lima_gp_task_run(struct lima_sched_pipe *pipe,
 	u32 cmd = 0;
 	int i;
 
+	/* update real heap buffer size for GP */
+	for (i = 0; i < task->num_bos; i++) {
+		struct lima_bo *bo = task->bos[i];
+		if (bo->heap_size &&
+		    lima_vm_get_va(task->vm, bo) == f[LIMA_GP_PLBU_ALLOC_START_ADDR >> 2]) {
+			f[LIMA_GP_PLBU_ALLOC_END_ADDR >> 2] =
+				f[LIMA_GP_PLBU_ALLOC_START_ADDR >> 2] + bo->heap_size;
+			task->recoverable = true;
+			task->heap = bo;
+			break;
+		}
+	}
+
 	if (f[LIMA_GP_VSCL_START_ADDR >> 2] !=
 	    f[LIMA_GP_VSCL_END_ADDR >> 2])
 		cmd |= LIMA_GP_CMD_START_VS;
@@ -184,6 +207,29 @@ static void lima_gp_task_mmu_error(struct lima_sched_pipe *pipe)
 	lima_sched_pipe_task_done(pipe);
 }
 
+static int lima_gp_task_recover(struct lima_sched_pipe *pipe)
+{
+	struct lima_ip *ip = pipe->processor[0];
+	struct lima_sched_task *task = pipe->current_task;
+	struct drm_lima_gp_frame *frame = task->frame;
+	u32 *f = frame->frame;
+	size_t fail_size =
+		f[LIMA_GP_PLBU_ALLOC_END_ADDR >> 2] -
+		f[LIMA_GP_PLBU_ALLOC_START_ADDR >> 2];
+
+	if (fail_size == task->heap->heap_size) {
+		int ret = lima_heap_alloc(task->heap, task->vm);
+		if (ret < 0)
+			return ret;
+	}
+
+	gp_write(LIMA_GP_INT_MASK, LIMA_GP_IRQ_MASK_USED);
+	gp_write(LIMA_GP_PLBU_ALLOC_END_ADDR,
+		 f[LIMA_GP_PLBU_ALLOC_START_ADDR >> 2] + task->heap->heap_size);
+	gp_write(LIMA_GP_CMD, LIMA_GP_CMD_UPDATE_PLBU_ALLOC);
+	return 0;
+}
+
 static void lima_gp_print_version(struct lima_ip *ip)
 {
 	u32 version, major, minor;
@@ -270,6 +316,7 @@ int lima_gp_pipe_init(struct lima_device *dev)
 	pipe->task_fini = lima_gp_task_fini;
 	pipe->task_error = lima_gp_task_error;
 	pipe->task_mmu_error = lima_gp_task_mmu_error;
+	pipe->task_recover = lima_gp_task_recover;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/lima/lima_mmu.c b/drivers/gpu/drm/lima/lima_mmu.c
index 97ec09dee572..f79d2af427e7 100644
--- a/drivers/gpu/drm/lima/lima_mmu.c
+++ b/drivers/gpu/drm/lima/lima_mmu.c
@@ -99,6 +99,11 @@ void lima_mmu_fini(struct lima_ip *ip)
 
 }
 
+void lima_mmu_flush_tlb(struct lima_ip *ip)
+{
+	mmu_write(LIMA_MMU_COMMAND, LIMA_MMU_COMMAND_ZAP_CACHE);
+}
+
 void lima_mmu_switch_vm(struct lima_ip *ip, struct lima_vm *vm)
 {
 	struct lima_device *dev = ip->dev;
diff --git a/drivers/gpu/drm/lima/lima_mmu.h b/drivers/gpu/drm/lima/lima_mmu.h
index 8c78319bcc8e..4f8ccbebcba1 100644
--- a/drivers/gpu/drm/lima/lima_mmu.h
+++ b/drivers/gpu/drm/lima/lima_mmu.h
@@ -10,6 +10,7 @@ struct lima_vm;
 int lima_mmu_init(struct lima_ip *ip);
 void lima_mmu_fini(struct lima_ip *ip);
 
+void lima_mmu_flush_tlb(struct lima_ip *ip);
 void lima_mmu_switch_vm(struct lima_ip *ip, struct lima_vm *vm);
 void lima_mmu_page_fault_resume(struct lima_ip *ip);
 
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index a31a90c380b6..117f1c8408a1 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -312,6 +312,26 @@ static const struct drm_sched_backend_ops lima_sched_ops = {
 	.free_job = lima_sched_free_job,
 };
 
+static void lima_sched_recover_work(struct work_struct *work)
+{
+	struct lima_sched_pipe *pipe =
+		container_of(work, struct lima_sched_pipe, recover_work);
+	int i;
+
+	for (i = 0; i < pipe->num_l2_cache; i++)
+		lima_l2_cache_flush(pipe->l2_cache[i]);
+
+	if (pipe->bcast_mmu)
+		lima_mmu_flush_tlb(pipe->bcast_mmu);
+	else {
+		for (i = 0; i < pipe->num_mmu; i++)
+			lima_mmu_flush_tlb(pipe->mmu[i]);
+	}
+
+	if (pipe->task_recover(pipe))
+		drm_sched_fault(&pipe->base);
+}
+
 int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 {
 	unsigned int timeout = lima_sched_timeout_ms > 0 ?
@@ -320,6 +340,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 	pipe->fence_context = dma_fence_context_alloc(1);
 	spin_lock_init(&pipe->fence_lock);
 
+	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
+
 	return drm_sched_init(&pipe->base, &lima_sched_ops, 1, 0,
 			      msecs_to_jiffies(timeout), name);
 }
@@ -331,11 +353,14 @@ void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
 
 void lima_sched_pipe_task_done(struct lima_sched_pipe *pipe)
 {
-	if (pipe->error)
-		drm_sched_fault(&pipe->base);
-	else {
-		struct lima_sched_task *task = pipe->current_task;
-
+	struct lima_sched_task *task = pipe->current_task;
+
+	if (pipe->error) {
+		if (task && task->recoverable)
+			schedule_work(&pipe->recover_work);
+		else
+			drm_sched_fault(&pipe->base);
+	} else {
 		pipe->task_fini(pipe);
 		dma_fence_signal(task->fence);
 	}
diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
index 1d814fecbcc0..d64393fb50a9 100644
--- a/drivers/gpu/drm/lima/lima_sched.h
+++ b/drivers/gpu/drm/lima/lima_sched.h
@@ -20,6 +20,9 @@ struct lima_sched_task {
 	struct lima_bo **bos;
 	int num_bos;
 
+	bool recoverable;
+	struct lima_bo *heap;
+
 	/* pipe fence */
 	struct dma_fence *fence;
 };
@@ -68,6 +71,9 @@ struct lima_sched_pipe {
 	void (*task_fini)(struct lima_sched_pipe *pipe);
 	void (*task_error)(struct lima_sched_pipe *pipe);
 	void (*task_mmu_error)(struct lima_sched_pipe *pipe);
+	int (*task_recover)(struct lima_sched_pipe *pipe);
+
+	struct work_struct recover_work;
 };
 
 int lima_sched_task_init(struct lima_sched_task *task,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
