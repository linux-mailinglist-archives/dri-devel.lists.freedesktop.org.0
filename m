Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAIlEPOmk2ln7QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A60321480BF
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E5110E0F3;
	Mon, 16 Feb 2026 23:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=r-sc.ca header.i=@r-sc.ca header.b="a68cbfiv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 372 seconds by postgrey-1.36 at gabe;
 Mon, 16 Feb 2026 18:45:03 UTC
Received: from out-06.smtp.spacemail.com (out-06.smtp.spacemail.com
 [66.29.159.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE0B10E03C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 18:45:03 +0000 (UTC)
Received: from Mac.pk.shawcable.net (S0106dceb699ec90f.pk.shawcable.net
 [24.69.43.232])
 (using TLSv1.3 with cipher TLS_CHACHA20_POLY1305_SHA256 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA512)
 (No client certificate requested)
 by mail.spacemail.com (Postfix) with ESMTPSA id 4fFBPL5jb0z6tkL;
 Mon, 16 Feb 2026 18:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-sc.ca;
 s=spacemail; t=1771267129;
 bh=AqDSStJaHwjFuQmZp9bFFOPQD77ZB+Vf7mh356gt73w=;
 h=From:To:Cc:Subject:Date:From;
 b=a68cbfiviOKkJSeNSG6JAH2Yd4ywXE0o2mWpL8YoZQl03DmVHBoM4LfPkKRufkrN8
 RPZWMywAm0ogY/8ZQkTBRZM+UOfNBsXIfhA9hSt53S/ysorvS3UQGXaBkx1mlfcM0D
 LkYrgJMfbrgfg/ZBcDq/TLbCYJ+7Ri0OALw1Ctv8pP+ShNI+MJu+oGkaZJjBYjGmqr
 c/5MXOwORfp2aynsLD5En9kJLmMI4PvBxFc07lTY/eW1C0clyeIvnI8O1kMZCxbT31
 CaWLECsOng8Qv5FdODh8+CPj7rU8Xt89dsu+FnqmXzbtcxFiGUsBuTiTi6p4u80OZ2
 WrS5Xc9PM2RGA==
From: Ross Cawston <ross@r-sc.ca>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, tomeu@tomeuvizoso.net, ogabbay@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jeff.hugo@oss.qualcomm.com,
 jani.nikula@intel.com, me@brighamcampbell.com, heiko@sntech.de,
 Ross Cawston <ross@r-sc.ca>
Subject: [PATCH] accel/rocket: Add per-task flags and interrupt mask for
 flexible job handling
Date: Mon, 16 Feb 2026 10:38:19 -0800
Message-ID: <20260216183819.99991-1-ross@r-sc.ca>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 16 Feb 2026 23:23:19 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[r-sc.ca:s=spacemail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[r-sc.ca];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,tomeuvizoso.net,kernel.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,oss.qualcomm.com,intel.com,brighamcampbell.com,sntech.de,r-sc.ca];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[ross@r-sc.ca,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[r-sc.ca:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A60321480BF
X-Rspamd-Action: no action

The Rocket NPU supports multiple task types:
- Convolutional workloads that use CNA, Core, and DPU blocks
- Standalone post-processing (PPU) tasks such as pooling and element-wise operations
- Pipelined DPU→PPU workloads

The current driver has several limitations that prevent correct execution of
non-convolutional workloads and multi-core operation:

- CNA and Core S_POINTER registers are always initialized, re-arming them
  with stale state from previous jobs and corrupting standalone DPU/PPU tasks.
- Completion is hard-coded to wait only for DPU interrupts, causing PPU-only
  or DPU→PPU pipeline jobs to time out.
- Ping-pong mode is unconditionally enabled, which is unnecessary for
  single-task jobs.
- Non-zero cores hang because the vendor-specific "extra bit" (bit 28 × core
  index) in S_POINTER is not set; the BSP sets this via MMIO because userspace
  cannot know which core the scheduler will select.
- Timeout and IRQ debugging information is minimal.

This patch introduces two new per-task fields to struct rocket_task:

- u32 int_mask: specifies which block completion interrupts signal task done
  (DPU_0|DPU_1 for convolutional/standalone DPU, PPU_0|PPU_1 for PPU tasks).
  Zero defaults to DPU_0|DPU_1 for backward compatibility.
- u32 flags: currently used for ROCKET_TASK_NO_CNA_CORE to indicate standalone
  DPU/PPU tasks that must not touch CNA/Core state.

Additional changes:
- Only initialize CNA and Core S_POINTER (with the required per-core extra bit)
  when ROCKET_TASK_NO_CNA_CORE is not set.
- Set the per-core extra bit via MMIO to fix hangs on non-zero cores.
- Enable ping-pong mode only when the job contains multiple tasks.
- Mask and clear interrupts according to the task's int_mask.
- Accept both DPU and PPU completion interrupts in the IRQ handler.
- Minor error-path fix in GEM object creation (check error after unlocking
  mm_lock).

These changes, derived from vendor BSP behavior, enable correct execution
of PPU-only tasks, pipelined workloads, and reliable multi-core operation
while preserving backward compatibility.
---
 drivers/accel/rocket/rocket_gem.c |  2 +
 drivers/accel/rocket/rocket_job.c | 99 +++++++++++++++++++++++++------
 drivers/accel/rocket/rocket_job.h |  2 +
 include/uapi/drm/rocket_accel.h   | 30 ++++++++++
 4 files changed, 115 insertions(+), 18 deletions(-)

diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index 624c4ecf5a34..db1ff3544af2 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -95,6 +95,8 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 					 rkt_obj->size, PAGE_SIZE,
 					 0, 0);
 	mutex_unlock(&rocket_priv->mm_lock);
+	if (ret)
+		goto err;
 
 	ret = iommu_map_sgtable(rocket_priv->domain->domain,
 				rkt_obj->mm.start,
diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index acd606160dc9..dd69b195d0e6 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -96,6 +96,13 @@ rocket_copy_tasks(struct drm_device *dev,
 
 		rjob->tasks[i].regcmd = task.regcmd;
 		rjob->tasks[i].regcmd_count = task.regcmd_count;
+		rjob->tasks[i].int_mask = task.int_mask;
+		rjob->tasks[i].flags = task.flags;
+
+		/* Default to DPU completion if no mask specified */
+		if (!rjob->tasks[i].int_mask)
+			rjob->tasks[i].int_mask = PC_INTERRUPT_MASK_DPU_0 |
+						   PC_INTERRUPT_MASK_DPU_1;
 	}
 
 	return 0;
@@ -108,7 +115,6 @@ rocket_copy_tasks(struct drm_device *dev,
 static void rocket_job_hw_submit(struct rocket_core *core, struct rocket_job *job)
 {
 	struct rocket_task *task;
-	unsigned int extra_bit;
 
 	/* Don't queue the job if a reset is in progress */
 	if (atomic_read(&core->reset.pending))
@@ -121,29 +127,61 @@ static void rocket_job_hw_submit(struct rocket_core *core, struct rocket_job *jo
 
 	rocket_pc_writel(core, BASE_ADDRESS, 0x1);
 
-	 /* From rknpu, in the TRM this bit is marked as reserved */
-	extra_bit = 0x10000000 * core->index;
-	rocket_cna_writel(core, S_POINTER, CNA_S_POINTER_POINTER_PP_EN(1) |
-					   CNA_S_POINTER_EXECUTER_PP_EN(1) |
-					   CNA_S_POINTER_POINTER_PP_MODE(1) |
-					   extra_bit);
-
-	rocket_core_writel(core, S_POINTER, CORE_S_POINTER_POINTER_PP_EN(1) |
-					    CORE_S_POINTER_EXECUTER_PP_EN(1) |
-					    CORE_S_POINTER_POINTER_PP_MODE(1) |
-					    extra_bit);
+	/*
+	 * Initialize CNA and Core S_POINTER for ping-pong mode via MMIO.
+	 *
+	 * Each core needs a per-core extra_bit (bit 28 * core_index) which
+	 * the TRM marks as reserved but the BSP rknpu driver sets. Without
+	 * it, non-zero cores hang. This MUST be done via MMIO (not regcmd)
+	 * because userspace doesn't know which core the scheduler picks.
+	 *
+	 * DPU/DPU_RDMA and PPU/PPU_RDMA S_POINTERs are set by the regcmd
+	 * itself — they don't need the per-core extra_bit.
+	 *
+	 * For standalone DPU/PPU tasks (element-wise ops, pooling), CNA
+	 * and Core have no work. Writing their S_POINTERs would re-arm
+	 * them with stale state from the previous conv task, corrupting
+	 * the DPU/PPU output. Userspace signals this via the
+	 * ROCKET_TASK_NO_CNA_CORE flag.
+	 */
+	if (!(task->flags & ROCKET_TASK_NO_CNA_CORE)) {
+		unsigned int extra_bit = 0x10000000 * core->index;
+		rocket_cna_writel(core, S_POINTER,
+				  CNA_S_POINTER_POINTER_PP_EN(1) |
+				  CNA_S_POINTER_EXECUTER_PP_EN(1) |
+				  CNA_S_POINTER_POINTER_PP_MODE(1) |
+				  extra_bit);
+
+		rocket_core_writel(core, S_POINTER,
+				   CORE_S_POINTER_POINTER_PP_EN(1) |
+				   CORE_S_POINTER_EXECUTER_PP_EN(1) |
+				   CORE_S_POINTER_POINTER_PP_MODE(1) |
+				   extra_bit);
+	}
 
 	rocket_pc_writel(core, BASE_ADDRESS, task->regcmd);
 	rocket_pc_writel(core, REGISTER_AMOUNTS,
 			 PC_REGISTER_AMOUNTS_PC_DATA_AMOUNT((task->regcmd_count + 1) / 2 - 1));
 
-	rocket_pc_writel(core, INTERRUPT_MASK, PC_INTERRUPT_MASK_DPU_0 | PC_INTERRUPT_MASK_DPU_1);
-	rocket_pc_writel(core, INTERRUPT_CLEAR, PC_INTERRUPT_CLEAR_DPU_0 | PC_INTERRUPT_CLEAR_DPU_1);
+	/*
+	 * Enable interrupts for the last block in this task's pipeline.
+	 *
+	 * The int_mask field from userspace specifies which block completion
+	 * signals that this task is done:
+	 *   - Conv/DPU tasks: DPU_0 | DPU_1
+	 *   - PPU tasks (DPU→PPU pipeline): PPU_0 | PPU_1
+	 *
+	 * Only enabling the terminal block's interrupt prevents the kernel
+	 * from stopping the pipeline early (e.g. DPU fires before PPU has
+	 * finished writing its output).
+	 */
+	rocket_pc_writel(core, INTERRUPT_MASK, task->int_mask);
+	rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
 
 	rocket_pc_writel(core, TASK_CON, PC_TASK_CON_RESERVED_0(1) |
 					 PC_TASK_CON_TASK_COUNT_CLEAR(1) |
 					 PC_TASK_CON_TASK_NUMBER(1) |
-					 PC_TASK_CON_TASK_PP_EN(1));
+					 PC_TASK_CON_TASK_PP_EN(job->task_count > 1 ? 1 : 0));
 
 	rocket_pc_writel(core, TASK_DMA_BASE_ADDR, PC_TASK_DMA_BASE_ADDR_DMA_BASE_ADDR(0x0));
 
@@ -385,7 +423,23 @@ static enum drm_gpu_sched_stat rocket_job_timedout(struct drm_sched_job *sched_j
 	struct rocket_device *rdev = job->rdev;
 	struct rocket_core *core = sched_to_core(rdev, sched_job->sched);
 
-	dev_err(core->dev, "NPU job timed out");
+	{
+		u32 raw = rocket_pc_readl(core, INTERRUPT_RAW_STATUS);
+		u32 status = rocket_pc_readl(core, INTERRUPT_STATUS);
+		u32 mask = rocket_pc_readl(core, INTERRUPT_MASK);
+		u32 op_en = rocket_pc_readl(core, OPERATION_ENABLE);
+		u32 task_status = rocket_pc_readl(core, TASK_STATUS);
+		u32 cna_s_status = rocket_cna_readl(core, S_STATUS);
+		u32 core_s_status = rocket_core_readl(core, S_STATUS);
+		u32 core_misc = readl(core->core_iomem + 0x10);  /* MISC_CFG */
+		u32 core_op_en = readl(core->core_iomem + 0x08);  /* OPERATION_ENABLE */
+
+		dev_err(core->dev,
+			"NPU job timed out: raw=0x%08x mask=0x%08x op_en=0x%x task_status=0x%x cna_s=0x%x core_s=0x%x core_misc=0x%x core_op_en=0x%x task=%u/%u",
+			raw, mask, op_en, task_status,
+			cna_s_status, core_s_status, core_misc, core_op_en,
+			job->next_task_idx, job->task_count);
+	}
 
 	atomic_set(&core->reset.pending, 1);
 	rocket_reset(core, sched_job);
@@ -424,8 +478,17 @@ static irqreturn_t rocket_job_irq_handler(int irq, void *data)
 	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
 	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_WRITE_ERROR);
 
-	if (!(raw_status & PC_INTERRUPT_RAW_STATUS_DPU_0 ||
-	      raw_status & PC_INTERRUPT_RAW_STATUS_DPU_1))
+	/*
+	 * Check for any job completion interrupt: DPU or PPU.
+	 *
+	 * Conv and standalone DPU jobs signal via DPU_0/DPU_1.
+	 * PPU pooling jobs signal via PPU_0/PPU_1.
+	 * We must recognize both to avoid PPU job timeouts.
+	 */
+	if (!(raw_status & (PC_INTERRUPT_RAW_STATUS_DPU_0 |
+			    PC_INTERRUPT_RAW_STATUS_DPU_1 |
+			    PC_INTERRUPT_RAW_STATUS_PPU_0 |
+			    PC_INTERRUPT_RAW_STATUS_PPU_1)))
 		return IRQ_NONE;
 
 	rocket_pc_writel(core, INTERRUPT_MASK, 0x0);
diff --git a/drivers/accel/rocket/rocket_job.h b/drivers/accel/rocket/rocket_job.h
index 4ae00feec3b9..6931dfed8615 100644
--- a/drivers/accel/rocket/rocket_job.h
+++ b/drivers/accel/rocket/rocket_job.h
@@ -13,6 +13,8 @@
 struct rocket_task {
 	u64 regcmd;
 	u32 regcmd_count;
+	u32 int_mask;
+	u32 flags;
 };
 
 struct rocket_job {
diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
index 14b2e12b7c49..b041bcb05e27 100644
--- a/include/uapi/drm/rocket_accel.h
+++ b/include/uapi/drm/rocket_accel.h
@@ -73,6 +73,11 @@ struct drm_rocket_fini_bo {
 	__u32 reserved;
 };
 
+/**
+ * Flags for drm_rocket_task.flags
+ */
+#define ROCKET_TASK_NO_CNA_CORE		0x1
+
 /**
  * struct drm_rocket_task - A task to be run on the NPU
  *
@@ -84,6 +89,31 @@ struct drm_rocket_task {
 
 	/** Input: Number of commands in the register command buffer */
 	__u32 regcmd_count;
+
+	/**
+	 * Input: Interrupt mask specifying which block completion signals
+	 * that this task is done. Uses PC_INTERRUPT_MASK_* bits.
+	 *
+	 * For conv/DPU tasks: DPU_0 | DPU_1 (0x0300)
+	 * For PPU tasks:      PPU_0 | PPU_1 (0x0C00)
+	 *
+	 * If zero, defaults to DPU_0 | DPU_1 for backwards compatibility.
+	 */
+	__u32 int_mask;
+
+	/**
+	 * Input: Task flags.
+	 *
+	 * ROCKET_TASK_NO_CNA_CORE: Skip CNA and Core S_POINTER MMIO
+	 * writes for this task. Used for standalone DPU element-wise
+	 * and PPU pooling tasks that don't use CNA/Core. Without this
+	 * flag, CNA/Core get re-armed with stale state from the
+	 * previous conv task, corrupting the DPU/PPU output.
+	 *
+	 * Zero means write CNA/Core S_POINTER (default for conv tasks,
+	 * backwards compatible with old userspace).
+	 */
+	__u32 flags;
 };
 
 /**
-- 
2.52.0

