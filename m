Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4003A363C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 23:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B8E6EDFB;
	Thu, 10 Jun 2021 21:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEE96EDFB;
 Thu, 10 Jun 2021 21:44:29 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id y15so2722456pfl.4;
 Thu, 10 Jun 2021 14:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SoDSAahz8WqiKkvp+ENZtdixHOsGfRU1PDRsy+fA7ls=;
 b=MJngB6EqJeR3LcRVovEKQ+RTXkejrnpOR67X7tb6XKrNp4/KEjdC4mS4+i6j1GTEFT
 VCEq8Z7s97NXYVQM7vq43dScDEJHJDhJhBss3J5JRLlYjSz8upOFBcl6mnI3MjZqCyst
 fBfeJKkx3ROxw6/KSgNMbeH5vJmYpWJ00YMXa5Oj67DpkC8JkLBOJSz8OZxTxBaw05Yh
 DF5T11AwtDQZUyfxWkgpm66grUYnZ3okqLj4yNJwZm0Zp3iGapluwkRGLsdJx1PuLCMd
 +QxtTQxLSDrhvv3kYpVz8QJe8ZUjyESVeFd7YGRow4jHU002HptV4ZMm/JOFiNVSPE+d
 aofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SoDSAahz8WqiKkvp+ENZtdixHOsGfRU1PDRsy+fA7ls=;
 b=mkDgU1iYCoUNlraBuwu+voMR5BQwhXL6XozoqHW9sOqFxzAmlUAMvHFMY0aVGhLV8u
 +VhQr11M6X4JOLsS1C8Kr4PfdVNxU1089MH7z/vw5rnoet7KN8ep+QLlN4wsEW/K92OX
 YTqyIHNCxi4OZUu5Q/7c80WpPMdigF0gT/dPklgcHyh1UlTDwnrm+NpbuI29sGZe8VUW
 AXyLbVBjX3RTMoVodRZb+1oJavjx4mTuPtoOlNTjbf3+oT+hwlOakgkJJeCuhOUvspmJ
 PKArYt6XjtCGG3cNb6XNNHnRjQa9XQ92cDrNS2g2btV2N/TfJ7fa85B0T/kGizeTiLob
 71yg==
X-Gm-Message-State: AOAM531bE+LjbZEiFq1iTsbrimYaJWeyRDZ/YkrN0gOo+5eFPZnv878Z
 a0o0dUDRnl5hL8vMRO6N1tad9Wa2zVSIXA==
X-Google-Smtp-Source: ABdhPJyZf6ZiQyvKPYWqv/fuojAJShM0eWNJPziC267FLkJYP5M6WZHuOLRgMI23PcAEIFNRHoYIsg==
X-Received: by 2002:a63:4f54:: with SMTP id p20mr432317pgl.428.1623361468179; 
 Thu, 10 Jun 2021 14:44:28 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id c7sm3416025pgh.72.2021.06.10.14.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:44:27 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH v5 5/5] drm/msm: devcoredump iommu fault support
Date: Thu, 10 Jun 2021 14:44:13 -0700
Message-Id: <20210610214431.539029-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610214431.539029-1-robdclark@gmail.com>
References: <20210610214431.539029-1-robdclark@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 Dave Airlie <airlied@redhat.com>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, Sean Paul <sean@poorly.run>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Wire up support to stall the SMMU on iova fault, and collect a devcore-
dump snapshot for easier debugging of faults.

Currently this is a6xx-only, but mostly only because so far it is the
only one using adreno-smmu-priv.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       | 19 +++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 38 +++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 42 ++++++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     | 15 +++++++
 drivers/gpu/drm/msm/msm_gem.h               |  1 +
 drivers/gpu/drm/msm/msm_gem_submit.c        |  1 +
 drivers/gpu/drm/msm/msm_gpu.c               | 48 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h               | 17 ++++++++
 drivers/gpu/drm/msm/msm_gpummu.c            |  5 +++
 drivers/gpu/drm/msm/msm_iommu.c             | 11 +++++
 drivers/gpu/drm/msm/msm_mmu.h               |  1 +
 11 files changed, 186 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index eb030b00bff4..7a271de9a212 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1200,6 +1200,15 @@ static void a5xx_fault_detect_irq(struct msm_gpu *gpu)
 	struct drm_device *dev = gpu->dev;
 	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
 
+	/*
+	 * If stalled on SMMU fault, we could trip the GPU's hang detection,
+	 * but the fault handler will trigger the devcore dump, and we want
+	 * to otherwise resume normally rather than killing the submit, so
+	 * just bail.
+	 */
+	if (gpu_read(gpu, REG_A5XX_RBBM_STATUS3) & BIT(24))
+		return;
+
 	DRM_DEV_ERROR(dev->dev, "gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
 		ring ? ring->id : -1, ring ? ring->seqno : 0,
 		gpu_read(gpu, REG_A5XX_RBBM_STATUS),
@@ -1523,6 +1532,7 @@ static struct msm_gpu_state *a5xx_gpu_state_get(struct msm_gpu *gpu)
 {
 	struct a5xx_gpu_state *a5xx_state = kzalloc(sizeof(*a5xx_state),
 			GFP_KERNEL);
+	bool stalled = !!(gpu_read(gpu, REG_A5XX_RBBM_STATUS3) & BIT(24));
 
 	if (!a5xx_state)
 		return ERR_PTR(-ENOMEM);
@@ -1535,8 +1545,13 @@ static struct msm_gpu_state *a5xx_gpu_state_get(struct msm_gpu *gpu)
 
 	a5xx_state->base.rbbm_status = gpu_read(gpu, REG_A5XX_RBBM_STATUS);
 
-	/* Get the HLSQ regs with the help of the crashdumper */
-	a5xx_gpu_state_get_hlsq_regs(gpu, a5xx_state);
+	/*
+	 * Get the HLSQ regs with the help of the crashdumper, but only if
+	 * we are not stalled in an iommu fault (in which case the crashdumper
+	 * would not have access to memory)
+	 */
+	if (!stalled)
+		a5xx_gpu_state_get_hlsq_regs(gpu, a5xx_state);
 
 	a5xx_set_hwcg(gpu, true);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index fc19db10bff1..c3699408bd1f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1081,6 +1081,16 @@ static int a6xx_fault_handler(void *arg, unsigned long iova, int flags, void *da
 	struct msm_gpu *gpu = arg;
 	struct adreno_smmu_fault_info *info = data;
 	const char *type = "UNKNOWN";
+	const char *block;
+	bool do_devcoredump = info && !READ_ONCE(gpu->crashstate);
+
+	/*
+	 * If we aren't going to be resuming later from fault_worker, then do
+	 * it now.
+	 */
+	if (!do_devcoredump) {
+		gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
+	}
 
 	/*
 	 * Print a default message if we couldn't get the data from the
@@ -1104,15 +1114,30 @@ static int a6xx_fault_handler(void *arg, unsigned long iova, int flags, void *da
 	else if (info->fsr & ARM_SMMU_FSR_EF)
 		type = "EXTERNAL";
 
+	block = a6xx_fault_block(gpu, info->fsynr1 & 0xff);
+
 	pr_warn_ratelimited("*** gpu fault: ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
 			info->ttbr0, iova,
-			flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ", type,
-			a6xx_fault_block(gpu, info->fsynr1 & 0xff),
+			flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ",
+			type, block,
 			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
 			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
 			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
 			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)));
 
+	if (do_devcoredump) {
+		/* Turn off the hangcheck timer to keep it from bothering us */
+		del_timer(&gpu->hangcheck_timer);
+
+		gpu->fault_info.ttbr0 = info->ttbr0;
+		gpu->fault_info.iova  = iova;
+		gpu->fault_info.flags = flags;
+		gpu->fault_info.type  = type;
+		gpu->fault_info.block = block;
+
+		kthread_queue_work(gpu->worker, &gpu->fault_work);
+	}
+
 	return 0;
 }
 
@@ -1164,6 +1189,15 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
 
+	/*
+	 * If stalled on SMMU fault, we could trip the GPU's hang detection,
+	 * but the fault handler will trigger the devcore dump, and we want
+	 * to otherwise resume normally rather than killing the submit, so
+	 * just bail.
+	 */
+	if (gpu_read(gpu, REG_A6XX_RBBM_STATUS3) & A6XX_RBBM_STATUS3_SMMU_STALLED_ON_FAULT)
+		return;
+
 	/*
 	 * Force the GPU to stay on until after we finish
 	 * collecting information
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 21c49c5b4519..ad4ea0ed5d99 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -832,6 +832,20 @@ static void a6xx_get_registers(struct msm_gpu *gpu,
 		a6xx_get_ahb_gpu_registers(gpu,
 				a6xx_state, &a6xx_vbif_reglist,
 				&a6xx_state->registers[index++]);
+	if (!dumper) {
+		/*
+		 * We can't use the crashdumper when the SMMU is stalled,
+		 * because the GPU has no memory access until we resume
+		 * translation (but we don't want to do that until after
+		 * we have captured as much useful GPU state as possible).
+		 * So instead collect registers via the CPU:
+		 */
+		for (i = 0; i < ARRAY_SIZE(a6xx_reglist); i++)
+			a6xx_get_ahb_gpu_registers(gpu,
+				a6xx_state, &a6xx_reglist[i],
+				&a6xx_state->registers[index++]);
+		return;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(a6xx_reglist); i++)
 		a6xx_get_crashdumper_registers(gpu,
@@ -905,11 +919,13 @@ static void a6xx_get_indexed_registers(struct msm_gpu *gpu,
 
 struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 {
-	struct a6xx_crashdumper dumper = { 0 };
+	struct a6xx_crashdumper _dumper = { 0 }, *dumper = NULL;
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gpu_state *a6xx_state = kzalloc(sizeof(*a6xx_state),
 		GFP_KERNEL);
+	bool stalled = !!(gpu_read(gpu, REG_A6XX_RBBM_STATUS3) &
+			A6XX_RBBM_STATUS3_SMMU_STALLED_ON_FAULT);
 
 	if (!a6xx_state)
 		return ERR_PTR(-ENOMEM);
@@ -928,14 +944,24 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	/* Get the banks of indexed registers */
 	a6xx_get_indexed_registers(gpu, a6xx_state);
 
-	/* Try to initialize the crashdumper */
-	if (!a6xx_crashdumper_init(gpu, &dumper)) {
-		a6xx_get_registers(gpu, a6xx_state, &dumper);
-		a6xx_get_shaders(gpu, a6xx_state, &dumper);
-		a6xx_get_clusters(gpu, a6xx_state, &dumper);
-		a6xx_get_dbgahb_clusters(gpu, a6xx_state, &dumper);
+	/*
+	 * Try to initialize the crashdumper, if we are not dumping state
+	 * with the SMMU stalled.  The crashdumper needs memory access to
+	 * write out GPU state, so we need to skip this when the SMMU is
+	 * stalled in response to an iova fault
+	 */
+	if (!stalled && !a6xx_crashdumper_init(gpu, &_dumper)) {
+		dumper = &_dumper;
+	}
+
+	a6xx_get_registers(gpu, a6xx_state, dumper);
+
+	if (dumper) {
+		a6xx_get_shaders(gpu, a6xx_state, dumper);
+		a6xx_get_clusters(gpu, a6xx_state, dumper);
+		a6xx_get_dbgahb_clusters(gpu, a6xx_state, dumper);
 
-		msm_gem_kernel_put(dumper.bo, gpu->aspace, true);
+		msm_gem_kernel_put(dumper->bo, gpu->aspace, true);
 	}
 
 	if (snapshot_debugbus)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index c1b02f790804..2bfe014995c7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -684,6 +684,21 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 			adreno_gpu->info->revn, adreno_gpu->rev.core,
 			adreno_gpu->rev.major, adreno_gpu->rev.minor,
 			adreno_gpu->rev.patchid);
+	/*
+	 * If this is state collected due to iova fault, so fault related info
+	 *
+	 * TTBR0 would not be zero, so this is a good way to distinguish
+	 */
+	if (state->fault_info.ttbr0) {
+		const struct msm_gpu_fault_info *info = &state->fault_info;
+
+		drm_puts(p, "fault-info:\n");
+		drm_printf(p, "  - ttbr0=%.16llx\n", info->ttbr0);
+		drm_printf(p, "  - iova=%.16lx\n", info->iova);
+		drm_printf(p, "  - dir=%s\n", info->flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ");
+		drm_printf(p, "  - type=%s\n", info->type);
+		drm_printf(p, "  - source=%s\n", info->block);
+	}
 
 	drm_printf(p, "rbbm-status: 0x%08x\n", state->rbbm_status);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 03e2cc2a2ce1..405f8411e395 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -328,6 +328,7 @@ struct msm_gem_submit {
 	struct dma_fence *fence;
 	struct msm_gpu_submitqueue *queue;
 	struct pid *pid;    /* submitting process */
+	bool fault_dumped;  /* Limit devcoredump dumping to one per submit */
 	bool valid;         /* true if no cmdstream patching needed */
 	bool in_rb;         /* "sudo" mode, copy cmds into RB */
 	struct msm_ringbuffer *ring;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 5480852bdeda..44f84bfd0c0e 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -50,6 +50,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	submit->cmd = (void *)&submit->bos[nr_bos];
 	submit->queue = queue;
 	submit->ring = gpu->rb[queue->prio];
+	submit->fault_dumped = false;
 
 	/* initially, until copy_from_user() and bo lookup succeeds: */
 	submit->nr_bos = 0;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index fa7691cb4614..414ba2dd34e5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -400,6 +400,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	/* Fill in the additional crash state information */
 	state->comm = kstrdup(comm, GFP_KERNEL);
 	state->cmd = kstrdup(cmd, GFP_KERNEL);
+	state->fault_info = gpu->fault_info;
 
 	if (submit) {
 		int i, nr = 0;
@@ -572,6 +573,52 @@ static void recover_worker(struct kthread_work *work)
 	msm_gpu_retire(gpu);
 }
 
+static void fault_worker(struct kthread_work *work)
+{
+	struct msm_gpu *gpu = container_of(work, struct msm_gpu, fault_work);
+	struct drm_device *dev = gpu->dev;
+	struct msm_gem_submit *submit;
+	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
+	char *comm = NULL, *cmd = NULL;
+
+	mutex_lock(&dev->struct_mutex);
+
+	submit = find_submit(cur_ring, cur_ring->memptrs->fence + 1);
+	if (submit && submit->fault_dumped)
+		goto resume_smmu;
+
+	if (submit) {
+		struct task_struct *task;
+
+		task = get_pid_task(submit->pid, PIDTYPE_PID);
+		if (task) {
+			comm = kstrdup(task->comm, GFP_KERNEL);
+			cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);
+			put_task_struct(task);
+		}
+
+		/*
+		 * When we get GPU iova faults, we can get 1000s of them,
+		 * but we really only want to log the first one.
+		 */
+		submit->fault_dumped = true;
+	}
+
+	/* Record the crash state */
+	pm_runtime_get_sync(&gpu->pdev->dev);
+	msm_gpu_crashstate_capture(gpu, submit, comm, cmd);
+	pm_runtime_put_sync(&gpu->pdev->dev);
+
+	kfree(cmd);
+	kfree(comm);
+
+resume_smmu:
+	memset(&gpu->fault_info, 0, sizeof(gpu->fault_info));
+	gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
+
+	mutex_unlock(&dev->struct_mutex);
+}
+
 static void hangcheck_timer_reset(struct msm_gpu *gpu)
 {
 	mod_timer(&gpu->hangcheck_timer,
@@ -948,6 +995,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	INIT_LIST_HEAD(&gpu->active_list);
 	kthread_init_work(&gpu->retire_work, retire_worker);
 	kthread_init_work(&gpu->recover_work, recover_worker);
+	kthread_init_work(&gpu->fault_work, fault_worker);
 
 	timer_setup(&gpu->hangcheck_timer, hangcheck_handler, 0);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 7a082a12d98f..8eefb3aeca10 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -71,6 +71,15 @@ struct msm_gpu_funcs {
 	uint32_t (*get_rptr)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 };
 
+/* Additional state for iommu faults: */
+struct msm_gpu_fault_info {
+	u64 ttbr0;
+	unsigned long iova;
+	int flags;
+	const char *type;
+	const char *block;
+};
+
 struct msm_gpu {
 	const char *name;
 	struct drm_device *dev;
@@ -135,6 +144,12 @@ struct msm_gpu {
 #define DRM_MSM_HANGCHECK_JIFFIES msecs_to_jiffies(DRM_MSM_HANGCHECK_PERIOD)
 	struct timer_list hangcheck_timer;
 
+	/* Fault info for most recent iova fault: */
+	struct msm_gpu_fault_info fault_info;
+
+	/* work for handling GPU ioval faults: */
+	struct kthread_work fault_work;
+
 	/* work for handling GPU recovery: */
 	struct kthread_work recover_work;
 
@@ -243,6 +258,8 @@ struct msm_gpu_state {
 	char *comm;
 	char *cmd;
 
+	struct msm_gpu_fault_info fault_info;
+
 	int nr_bos;
 	struct msm_gpu_state_bo *bos;
 };
diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
index 379496186c7f..f7d1945e0c9f 100644
--- a/drivers/gpu/drm/msm/msm_gpummu.c
+++ b/drivers/gpu/drm/msm/msm_gpummu.c
@@ -68,6 +68,10 @@ static int msm_gpummu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
 	return 0;
 }
 
+static void msm_gpummu_resume_translation(struct msm_mmu *mmu)
+{
+}
+
 static void msm_gpummu_destroy(struct msm_mmu *mmu)
 {
 	struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
@@ -83,6 +87,7 @@ static const struct msm_mmu_funcs funcs = {
 		.map = msm_gpummu_map,
 		.unmap = msm_gpummu_unmap,
 		.destroy = msm_gpummu_destroy,
+		.resume_translation = msm_gpummu_resume_translation,
 };
 
 struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 6975b95c3c29..eed2a762e9dd 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -184,6 +184,9 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 	 * the arm-smmu driver as a trigger to set up TTBR0
 	 */
 	if (atomic_inc_return(&iommu->pagetables) == 1) {
+		/* Enable stall on iommu fault: */
+		adreno_smmu->set_stall(adreno_smmu->cookie, true);
+
 		ret = adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, &ttbr0_cfg);
 		if (ret) {
 			free_io_pgtable_ops(pagetable->pgtbl_ops);
@@ -226,6 +229,13 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
 	return 0;
 }
 
+static void msm_iommu_resume_translation(struct msm_mmu *mmu)
+{
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(mmu->dev);
+
+	adreno_smmu->resume_translation(adreno_smmu->cookie, true);
+}
+
 static void msm_iommu_detach(struct msm_mmu *mmu)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
@@ -273,6 +283,7 @@ static const struct msm_mmu_funcs funcs = {
 		.map = msm_iommu_map,
 		.unmap = msm_iommu_unmap,
 		.destroy = msm_iommu_destroy,
+		.resume_translation = msm_iommu_resume_translation,
 };
 
 struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index a88f44c3268d..de158e1bf765 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -15,6 +15,7 @@ struct msm_mmu_funcs {
 			size_t len, int prot);
 	int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
 	void (*destroy)(struct msm_mmu *mmu);
+	void (*resume_translation)(struct msm_mmu *mmu);
 };
 
 enum msm_mmu_type {
-- 
2.31.1

