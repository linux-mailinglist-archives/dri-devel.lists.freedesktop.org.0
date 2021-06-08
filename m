Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5733A39FA3A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 17:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DE56EC18;
	Tue,  8 Jun 2021 15:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04A66EC18
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 15:20:14 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so20653559oth.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cosmicpenguin-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=L1b2ArJ9Z1B3pD6qPPXEgf7MYEDQ7cfIADCWdgpEOZ4=;
 b=GOOMKizYGt0vG8Ehf7dsUGVlmQ2yxK7a/3vdJfzlm6eFPs8ETJpTucmZEzTpkuVAdv
 THNHT8QZdPPnWHb4khDdSQ2jNlbBeUQL8WB5b8AIjMqIyq4EFi7vB7plG0PGDx/c1jPQ
 /E8MqGjjTsJC0lQ8MSCqFMZdLUTwARXeuc940HMV0yOb8Mi4VDqdfqcRkpd95jY3VrME
 mRCPwhOfguKPQ8NUrsIM54DAYdE3OGOP2g8t0yg0yRDCh3xPb2QyVhqwWbxHnU7rfbwF
 ZWMw4ui3sIEFNsnpclqEBV7CYxmaW7HpHvGbXqDOJ/Bi8e58De3kLIPKeeH/QldirSvZ
 J2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=L1b2ArJ9Z1B3pD6qPPXEgf7MYEDQ7cfIADCWdgpEOZ4=;
 b=l5o/evUTDlshIeeXZ8/k1GTpTwRoB/rIOlrfzvfXO1M7ZHzJlKYYqZWEM4fe2912Zj
 rWKRUDb8cQzBNrsHp63k6Fe1m0SRfQwWsdegVKCZP+/cUQKJVJ7AS87f+pZXo+7WBx+W
 n6EG3vPN7m1eJ7zLufPt0ywy/Yx9vu182GmBM+wzVS+5Um4MuHxiXAhy+5Q4PtwbD/th
 n5OWSEBv/trg+Sv7u2aDIm3I7zsqBPzFuHv95SgbrWlgge4K5facUCoxBmq3lP5Z4kcb
 yYphrW3qdYjz+KL6O/DvTLm/9NMBw2mzi00TafqnMGNT84HROUbzN1YmVq4a3cdbTMqP
 zWJw==
X-Gm-Message-State: AOAM533+fboPzclirDRIV+SMyklvlO1vNwQjWbaTJUpdx4EkPkDt3h5k
 FGNuuyhiuPutK2GDvTV+rQW0NQ==
X-Google-Smtp-Source: ABdhPJwc4YraQhY2MZB6zbRmUEWMpq+oM/bf9+xQwpYa0l/q37A6+hg4h7Byf7/xFJw9ZxNlQ9qjcg==
X-Received: by 2002:a9d:7749:: with SMTP id t9mr17096otl.58.1623165613877;
 Tue, 08 Jun 2021 08:20:13 -0700 (PDT)
Received: from cosmicpenguin.net (c-71-237-100-236.hsd1.co.comcast.net.
 [71.237.100.236])
 by smtp.gmail.com with ESMTPSA id g2sm2125050otk.40.2021.06.08.08.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 08:20:13 -0700 (PDT)
Date: Tue, 8 Jun 2021 09:20:11 -0600
From: Jordan Crouse <jordan@cosmicpenguin.net>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v4 6/6] drm/msm: devcoredump iommu fault support
Message-ID: <20210608152011.ekogby76tzrg7uon@cosmicpenguin.net>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Eric Anholt <eric@anholt.net>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20210601224750.513996-1-robdclark@gmail.com>
 <20210601224750.513996-8-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601224750.513996-8-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 01, 2021 at 03:47:25PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Wire up support to stall the SMMU on iova fault, and collect a devcore-
> dump snapshot for easier debugging of faults.
> 
> Currently this is a6xx-only, but mostly only because so far it is the
> only one using adreno-smmu-priv.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 29 +++++++++++++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 15 ++++++++
>  drivers/gpu/drm/msm/msm_gem.h           |  1 +
>  drivers/gpu/drm/msm/msm_gem_submit.c    |  1 +
>  drivers/gpu/drm/msm/msm_gpu.c           | 48 +++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_gpu.h           | 17 +++++++++
>  drivers/gpu/drm/msm/msm_gpummu.c        |  5 +++
>  drivers/gpu/drm/msm/msm_iommu.c         | 11 ++++++
>  drivers/gpu/drm/msm/msm_mmu.h           |  1 +
>  9 files changed, 126 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 094dc17fd20f..0dcde917e575 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1008,6 +1008,16 @@ static int a6xx_fault_handler(void *arg, unsigned long iova, int flags, void *da
>  	struct msm_gpu *gpu = arg;
>  	struct adreno_smmu_fault_info *info = data;
>  	const char *type = "UNKNOWN";
> +	const char *block;
> +	bool do_devcoredump = info && !READ_ONCE(gpu->crashstate);
> +
> +	/*
> +	 * If we aren't going to be resuming later from fault_worker, then do
> +	 * it now.
> +	 */
> +	if (!do_devcoredump) {
> +		gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
> +	}
>  
>  	/*
>  	 * Print a default message if we couldn't get the data from the
> @@ -1031,15 +1041,30 @@ static int a6xx_fault_handler(void *arg, unsigned long iova, int flags, void *da
>  	else if (info->fsr & ARM_SMMU_FSR_EF)
>  		type = "EXTERNAL";
>  
> +	block = a6xx_fault_block(gpu, info->fsynr1 & 0xff);
> +
>  	pr_warn_ratelimited("*** gpu fault: ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
>  			info->ttbr0, iova,
> -			flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ", type,
> -			a6xx_fault_block(gpu, info->fsynr1 & 0xff),
> +			flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ",
> +			type, block,
>  			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
>  			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
>  			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
>  			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)));
>  
> +	if (do_devcoredump) {
> +		/* Turn off the hangcheck timer to keep it from bothering us */
> +		del_timer(&gpu->hangcheck_timer);
> +
> +		gpu->fault_info.ttbr0 = info->ttbr0;
> +		gpu->fault_info.iova  = iova;
> +		gpu->fault_info.flags = flags;
> +		gpu->fault_info.type  = type;
> +		gpu->fault_info.block = block;
> +
> +		kthread_queue_work(gpu->worker, &gpu->fault_work);
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index cf897297656f..4e88d4407667 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -684,6 +684,21 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>  			adreno_gpu->info->revn, adreno_gpu->rev.core,
>  			adreno_gpu->rev.major, adreno_gpu->rev.minor,
>  			adreno_gpu->rev.patchid);
> +	/*
> +	 * If this is state collected due to iova fault, so fault related info
> +	 *
> +	 * TTBR0 would not be zero, so this is a good way to distinguish
> +	 */
> +	if (state->fault_info.ttbr0) {
> +		const struct msm_gpu_fault_info *info = &state->fault_info;
> +
> +		drm_puts(p, "fault-info:\n");
> +		drm_printf(p, "  - ttbr0=%.16llx\n", info->ttbr0);
> +		drm_printf(p, "  - iova=%.16lx\n", info->iova);
> +		drm_printf(p, "  - dir=%s\n", info->flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ");
> +		drm_printf(p, "  - type=%s\n", info->type);
> +		drm_printf(p, "  - source=%s\n", info->block);
> +	}
>  
>  	drm_printf(p, "rbbm-status: 0x%08x\n", state->rbbm_status);
>  
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 03e2cc2a2ce1..405f8411e395 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -328,6 +328,7 @@ struct msm_gem_submit {
>  	struct dma_fence *fence;
>  	struct msm_gpu_submitqueue *queue;
>  	struct pid *pid;    /* submitting process */
> +	bool fault_dumped;  /* Limit devcoredump dumping to one per submit */
>  	bool valid;         /* true if no cmdstream patching needed */
>  	bool in_rb;         /* "sudo" mode, copy cmds into RB */
>  	struct msm_ringbuffer *ring;
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 5480852bdeda..44f84bfd0c0e 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -50,6 +50,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>  	submit->cmd = (void *)&submit->bos[nr_bos];
>  	submit->queue = queue;
>  	submit->ring = gpu->rb[queue->prio];
> +	submit->fault_dumped = false;
>  
>  	/* initially, until copy_from_user() and bo lookup succeeds: */
>  	submit->nr_bos = 0;
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 4d280bf446e6..4da2053c1ffb 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -401,6 +401,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
>  	/* Fill in the additional crash state information */
>  	state->comm = kstrdup(comm, GFP_KERNEL);
>  	state->cmd = kstrdup(cmd, GFP_KERNEL);
> +	state->fault_info = gpu->fault_info;
>  
>  	if (submit) {
>  		int i, nr = 0;
> @@ -573,6 +574,52 @@ static void recover_worker(struct kthread_work *work)
>  	msm_gpu_retire(gpu);
>  }
>  
> +static void fault_worker(struct kthread_work *work)
> +{
> +	struct msm_gpu *gpu = container_of(work, struct msm_gpu, fault_work);
> +	struct drm_device *dev = gpu->dev;
> +	struct msm_gem_submit *submit;
> +	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
> +	char *comm = NULL, *cmd = NULL;
> +
> +	mutex_lock(&dev->struct_mutex);
> +
> +	submit = find_submit(cur_ring, cur_ring->memptrs->fence + 1);
> +	if (submit && submit->fault_dumped)
> +		goto resume_smmu;
> +
> +	if (submit) {
> +		struct task_struct *task;
> +
> +		task = get_pid_task(submit->pid, PIDTYPE_PID);
> +		if (task) {
> +			comm = kstrdup(task->comm, GFP_KERNEL);
> +			cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);
> +			put_task_struct(task);
> +		}
> +
> +		/*
> +		 * When we get GPU iova faults, we can get 1000s of them,
> +		 * but we really only want to log the first one.
> +		 */
> +		submit->fault_dumped = true;
> +	}
> +
> +	/* Record the crash state */
> +	pm_runtime_get_sync(&gpu->pdev->dev);
> +	msm_gpu_crashstate_capture(gpu, submit, comm, cmd, true);

You are going to run the risk of a race here. Once the IOMMU stalls then the
various bits of the GPU pipeline are going to stop and as soon one of them hits
the hang cycles threshold its going to pus the big red HANG! button.

It is fine to keep this infrastructure in place, but at there needs to be an
escape valve in the hang infrastructure to keep you from double dumping and
also to keep from resetting the GPU if that isn't your intention.

This can be as simple as adding a RBBM_STATUS3 check in the hang function and
returning early or you could skip the capture state call here and rely on the
hang to be the single entry point into the crashstate capture (with the
appropriate protections to keep from accidentally recovering, of course).

Jordan

> +	pm_runtime_put_sync(&gpu->pdev->dev);
> +
> +	kfree(cmd);
> +	kfree(comm);
> +
> +resume_smmu:
> +	memset(&gpu->fault_info, 0, sizeof(gpu->fault_info));
> +	gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
> +
> +	mutex_unlock(&dev->struct_mutex);
> +}
> +
>  static void hangcheck_timer_reset(struct msm_gpu *gpu)
>  {
>  	mod_timer(&gpu->hangcheck_timer,
> @@ -949,6 +996,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  	INIT_LIST_HEAD(&gpu->active_list);
>  	kthread_init_work(&gpu->retire_work, retire_worker);
>  	kthread_init_work(&gpu->recover_work, recover_worker);
> +	kthread_init_work(&gpu->fault_work, fault_worker);
>  
>  	timer_setup(&gpu->hangcheck_timer, hangcheck_handler, 0);
>  
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index c15e5fd675d2..8dae601085ee 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -71,6 +71,15 @@ struct msm_gpu_funcs {
>  	uint32_t (*get_rptr)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
>  };
>  
> +/* Additional state for iommu faults: */
> +struct msm_gpu_fault_info {
> +	u64 ttbr0;
> +	unsigned long iova;
> +	int flags;
> +	const char *type;
> +	const char *block;
> +};
> +
>  struct msm_gpu {
>  	const char *name;
>  	struct drm_device *dev;
> @@ -135,6 +144,12 @@ struct msm_gpu {
>  #define DRM_MSM_HANGCHECK_JIFFIES msecs_to_jiffies(DRM_MSM_HANGCHECK_PERIOD)
>  	struct timer_list hangcheck_timer;
>  
> +	/* Fault info for most recent iova fault: */
> +	struct msm_gpu_fault_info fault_info;
> +
> +	/* work for handling GPU ioval faults: */
> +	struct kthread_work fault_work;
> +
>  	/* work for handling GPU recovery: */
>  	struct kthread_work recover_work;
>  
> @@ -243,6 +258,8 @@ struct msm_gpu_state {
>  	char *comm;
>  	char *cmd;
>  
> +	struct msm_gpu_fault_info fault_info;
> +
>  	int nr_bos;
>  	struct msm_gpu_state_bo *bos;
>  };
> diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
> index 379496186c7f..f7d1945e0c9f 100644
> --- a/drivers/gpu/drm/msm/msm_gpummu.c
> +++ b/drivers/gpu/drm/msm/msm_gpummu.c
> @@ -68,6 +68,10 @@ static int msm_gpummu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
>  	return 0;
>  }
>  
> +static void msm_gpummu_resume_translation(struct msm_mmu *mmu)
> +{
> +}
> +
>  static void msm_gpummu_destroy(struct msm_mmu *mmu)
>  {
>  	struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
> @@ -83,6 +87,7 @@ static const struct msm_mmu_funcs funcs = {
>  		.map = msm_gpummu_map,
>  		.unmap = msm_gpummu_unmap,
>  		.destroy = msm_gpummu_destroy,
> +		.resume_translation = msm_gpummu_resume_translation,
>  };
>  
>  struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu)
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 6975b95c3c29..eed2a762e9dd 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -184,6 +184,9 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
>  	 * the arm-smmu driver as a trigger to set up TTBR0
>  	 */
>  	if (atomic_inc_return(&iommu->pagetables) == 1) {
> +		/* Enable stall on iommu fault: */
> +		adreno_smmu->set_stall(adreno_smmu->cookie, true);
> +
>  		ret = adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, &ttbr0_cfg);
>  		if (ret) {
>  			free_io_pgtable_ops(pagetable->pgtbl_ops);
> @@ -226,6 +229,13 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
>  	return 0;
>  }
>  
> +static void msm_iommu_resume_translation(struct msm_mmu *mmu)
> +{
> +	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(mmu->dev);
> +
> +	adreno_smmu->resume_translation(adreno_smmu->cookie, true);
> +}
> +
>  static void msm_iommu_detach(struct msm_mmu *mmu)
>  {
>  	struct msm_iommu *iommu = to_msm_iommu(mmu);
> @@ -273,6 +283,7 @@ static const struct msm_mmu_funcs funcs = {
>  		.map = msm_iommu_map,
>  		.unmap = msm_iommu_unmap,
>  		.destroy = msm_iommu_destroy,
> +		.resume_translation = msm_iommu_resume_translation,
>  };
>  
>  struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> index a88f44c3268d..de158e1bf765 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -15,6 +15,7 @@ struct msm_mmu_funcs {
>  			size_t len, int prot);
>  	int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
>  	void (*destroy)(struct msm_mmu *mmu);
> +	void (*resume_translation)(struct msm_mmu *mmu);
>  };
>  
>  enum msm_mmu_type {
> -- 
> 2.31.1
> 
