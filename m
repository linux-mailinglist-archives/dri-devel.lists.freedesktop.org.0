Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B836C3A1F50
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E316EB5B;
	Wed,  9 Jun 2021 21:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E646EBC4;
 Wed,  9 Jun 2021 21:46:39 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id o127so4915324wmo.4;
 Wed, 09 Jun 2021 14:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=NcP2hxsWt+AWIjOW8lhWB7xe7QhkvUQ2cJEYITndpDE=;
 b=Dsg9/N1unFgnT+18VTFcptlLHpw6o4auls6IKrK0CYEu/z3KPLyo57xXJEu+ehlnYD
 S2qOP9C2U3pNDKD7DgDA0b+l3QTyGGfZ8qtnhlAoFkM8H5dCKN45ApzUsmphckOLnNye
 yAaUBm8DZsOoXAru70iBLWcY3ba79esfcqGVU5ZIFMrvMNPpnxxOmTwC7YyLAPYKzY/O
 12Py4QuHhuqakiwg/is+75fk+ET2qm6P4RsmOQRBKoGIOUPhHXZ2je7vTBNr+k1noOJz
 XwAACEVcJBEdFpF6gBgjJzc8H5ewVHzlhlMAV7VpbQa1RrY+QewGTjjA9cOTpqFIpGDv
 1SFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=NcP2hxsWt+AWIjOW8lhWB7xe7QhkvUQ2cJEYITndpDE=;
 b=jFgPVT2LPUZaE2FRVD9R1hQHtOpxVEgH7/p11vd+0E9q4ykF5ay1PZnHU1xRMGqo/1
 a6PqSzNn2fy1lJ7AY0Xbg6kbTfB9eWbhBfl0dcNw8YDkj5dpJKyXsHEXV2ww252c1vDo
 2SqDCBhGK4Iv838gZh6zG/2Sf/cLYZ+ciJfBo6FW/zd6OgjyCt/CLMT2nBd9Dd5hYhZJ
 SH4wekzUlp4XKn/SIg3FvEVJzfVXwFzbRgOWBWV8lwop/l2mOfYMNk5u/AtKcHrA77Z4
 HlAawYuf9G37KPTw54ZeZU1mEiN6Z04hkLgG4n6Zpc2gbPYQgEZuG8z6gEdyZ1S070vD
 cMhg==
X-Gm-Message-State: AOAM532mkRfbbIp7bjd0qhiSfHR0qDyh8oc2TyeWKttLQwEIfCcMnj3R
 czIH5wueCXCpsVvAj5Vg/CqxNI3KrstdTJJPPOELu9Nz
X-Google-Smtp-Source: ABdhPJwp2EYOkcg1vhSZsR0tHYdnFf+XmqA1JiZP32GNS/LkSpu7/ehAmzJirbbyYqqlWXd2vidpY49vE9l5UQheypw=
X-Received: by 2002:a1c:23d6:: with SMTP id j205mr12158414wmj.94.1623275198354; 
 Wed, 09 Jun 2021 14:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210601224750.513996-1-robdclark@gmail.com>
 <20210601224750.513996-8-robdclark@gmail.com>
 <20210608152011.ekogby76tzrg7uon@cosmicpenguin.net>
In-Reply-To: <20210608152011.ekogby76tzrg7uon@cosmicpenguin.net>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 9 Jun 2021 14:50:31 -0700
Message-ID: <CAF6AEGtQVKune43JwWDk-DPTmYgZj+_PT32f6S+YadhgFgNovQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] drm/msm: devcoredump iommu fault support
To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, 
 Akhil P Oommen <akhilpo@codeaurora.org>, Eric Anholt <eric@anholt.net>, 
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Jun 8, 2021 at 8:20 AM Jordan Crouse <jordan@cosmicpenguin.net> wrote:
>
> On Tue, Jun 01, 2021 at 03:47:25PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Wire up support to stall the SMMU on iova fault, and collect a devcore-
> > dump snapshot for easier debugging of faults.
> >
> > Currently this is a6xx-only, but mostly only because so far it is the
> > only one using adreno-smmu-priv.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 29 +++++++++++++--
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 15 ++++++++
> >  drivers/gpu/drm/msm/msm_gem.h           |  1 +
> >  drivers/gpu/drm/msm/msm_gem_submit.c    |  1 +
> >  drivers/gpu/drm/msm/msm_gpu.c           | 48 +++++++++++++++++++++++++
> >  drivers/gpu/drm/msm/msm_gpu.h           | 17 +++++++++
> >  drivers/gpu/drm/msm/msm_gpummu.c        |  5 +++
> >  drivers/gpu/drm/msm/msm_iommu.c         | 11 ++++++
> >  drivers/gpu/drm/msm/msm_mmu.h           |  1 +
> >  9 files changed, 126 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index 094dc17fd20f..0dcde917e575 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -1008,6 +1008,16 @@ static int a6xx_fault_handler(void *arg, unsigned long iova, int flags, void *da
> >       struct msm_gpu *gpu = arg;
> >       struct adreno_smmu_fault_info *info = data;
> >       const char *type = "UNKNOWN";
> > +     const char *block;
> > +     bool do_devcoredump = info && !READ_ONCE(gpu->crashstate);
> > +
> > +     /*
> > +      * If we aren't going to be resuming later from fault_worker, then do
> > +      * it now.
> > +      */
> > +     if (!do_devcoredump) {
> > +             gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
> > +     }
> >
> >       /*
> >        * Print a default message if we couldn't get the data from the
> > @@ -1031,15 +1041,30 @@ static int a6xx_fault_handler(void *arg, unsigned long iova, int flags, void *da
> >       else if (info->fsr & ARM_SMMU_FSR_EF)
> >               type = "EXTERNAL";
> >
> > +     block = a6xx_fault_block(gpu, info->fsynr1 & 0xff);
> > +
> >       pr_warn_ratelimited("*** gpu fault: ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
> >                       info->ttbr0, iova,
> > -                     flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ", type,
> > -                     a6xx_fault_block(gpu, info->fsynr1 & 0xff),
> > +                     flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ",
> > +                     type, block,
> >                       gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
> >                       gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
> >                       gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
> >                       gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)));
> >
> > +     if (do_devcoredump) {
> > +             /* Turn off the hangcheck timer to keep it from bothering us */
> > +             del_timer(&gpu->hangcheck_timer);
> > +
> > +             gpu->fault_info.ttbr0 = info->ttbr0;
> > +             gpu->fault_info.iova  = iova;
> > +             gpu->fault_info.flags = flags;
> > +             gpu->fault_info.type  = type;
> > +             gpu->fault_info.block = block;
> > +
> > +             kthread_queue_work(gpu->worker, &gpu->fault_work);
> > +     }
> > +
> >       return 0;
> >  }
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index cf897297656f..4e88d4407667 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -684,6 +684,21 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
> >                       adreno_gpu->info->revn, adreno_gpu->rev.core,
> >                       adreno_gpu->rev.major, adreno_gpu->rev.minor,
> >                       adreno_gpu->rev.patchid);
> > +     /*
> > +      * If this is state collected due to iova fault, so fault related info
> > +      *
> > +      * TTBR0 would not be zero, so this is a good way to distinguish
> > +      */
> > +     if (state->fault_info.ttbr0) {
> > +             const struct msm_gpu_fault_info *info = &state->fault_info;
> > +
> > +             drm_puts(p, "fault-info:\n");
> > +             drm_printf(p, "  - ttbr0=%.16llx\n", info->ttbr0);
> > +             drm_printf(p, "  - iova=%.16lx\n", info->iova);
> > +             drm_printf(p, "  - dir=%s\n", info->flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ");
> > +             drm_printf(p, "  - type=%s\n", info->type);
> > +             drm_printf(p, "  - source=%s\n", info->block);
> > +     }
> >
> >       drm_printf(p, "rbbm-status: 0x%08x\n", state->rbbm_status);
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> > index 03e2cc2a2ce1..405f8411e395 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.h
> > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > @@ -328,6 +328,7 @@ struct msm_gem_submit {
> >       struct dma_fence *fence;
> >       struct msm_gpu_submitqueue *queue;
> >       struct pid *pid;    /* submitting process */
> > +     bool fault_dumped;  /* Limit devcoredump dumping to one per submit */
> >       bool valid;         /* true if no cmdstream patching needed */
> >       bool in_rb;         /* "sudo" mode, copy cmds into RB */
> >       struct msm_ringbuffer *ring;
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > index 5480852bdeda..44f84bfd0c0e 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -50,6 +50,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
> >       submit->cmd = (void *)&submit->bos[nr_bos];
> >       submit->queue = queue;
> >       submit->ring = gpu->rb[queue->prio];
> > +     submit->fault_dumped = false;
> >
> >       /* initially, until copy_from_user() and bo lookup succeeds: */
> >       submit->nr_bos = 0;
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > index 4d280bf446e6..4da2053c1ffb 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -401,6 +401,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
> >       /* Fill in the additional crash state information */
> >       state->comm = kstrdup(comm, GFP_KERNEL);
> >       state->cmd = kstrdup(cmd, GFP_KERNEL);
> > +     state->fault_info = gpu->fault_info;
> >
> >       if (submit) {
> >               int i, nr = 0;
> > @@ -573,6 +574,52 @@ static void recover_worker(struct kthread_work *work)
> >       msm_gpu_retire(gpu);
> >  }
> >
> > +static void fault_worker(struct kthread_work *work)
> > +{
> > +     struct msm_gpu *gpu = container_of(work, struct msm_gpu, fault_work);
> > +     struct drm_device *dev = gpu->dev;
> > +     struct msm_gem_submit *submit;
> > +     struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
> > +     char *comm = NULL, *cmd = NULL;
> > +
> > +     mutex_lock(&dev->struct_mutex);
> > +
> > +     submit = find_submit(cur_ring, cur_ring->memptrs->fence + 1);
> > +     if (submit && submit->fault_dumped)
> > +             goto resume_smmu;
> > +
> > +     if (submit) {
> > +             struct task_struct *task;
> > +
> > +             task = get_pid_task(submit->pid, PIDTYPE_PID);
> > +             if (task) {
> > +                     comm = kstrdup(task->comm, GFP_KERNEL);
> > +                     cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);
> > +                     put_task_struct(task);
> > +             }
> > +
> > +             /*
> > +              * When we get GPU iova faults, we can get 1000s of them,
> > +              * but we really only want to log the first one.
> > +              */
> > +             submit->fault_dumped = true;
> > +     }
> > +
> > +     /* Record the crash state */
> > +     pm_runtime_get_sync(&gpu->pdev->dev);
> > +     msm_gpu_crashstate_capture(gpu, submit, comm, cmd, true);
>
> You are going to run the risk of a race here. Once the IOMMU stalls then the
> various bits of the GPU pipeline are going to stop and as soon one of them hits
> the hang cycles threshold its going to pus the big red HANG! button.
>
> It is fine to keep this infrastructure in place, but at there needs to be an
> escape valve in the hang infrastructure to keep you from double dumping and
> also to keep from resetting the GPU if that isn't your intention.
>
> This can be as simple as adding a RBBM_STATUS3 check in the hang function and
> returning early or you could skip the capture state call here and rely on the
> hang to be the single entry point into the crashstate capture (with the
> appropriate protections to keep from accidentally recovering, of course).

I guess it isn't really the hw hitting the reset button, but just
raising an irq to the driver which hits the reset button?

If this is the case, I think the pragmatic thing is just to check the
stall bit in RBBM_STATUS3.

Even without that we are serializing recover and fault work on a
single worker, so I *think* we are good.. but I suppose the
RBBM_STATUS3 check would be useful to avoid dmesg spam about hangs
when the real issue is a fault

BR,
-R


> Jordan
>
> > +     pm_runtime_put_sync(&gpu->pdev->dev);
> > +
> > +     kfree(cmd);
> > +     kfree(comm);
> > +
> > +resume_smmu:
> > +     memset(&gpu->fault_info, 0, sizeof(gpu->fault_info));
> > +     gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
> > +
> > +     mutex_unlock(&dev->struct_mutex);
> > +}
> > +
> >  static void hangcheck_timer_reset(struct msm_gpu *gpu)
> >  {
> >       mod_timer(&gpu->hangcheck_timer,
> > @@ -949,6 +996,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> >       INIT_LIST_HEAD(&gpu->active_list);
> >       kthread_init_work(&gpu->retire_work, retire_worker);
> >       kthread_init_work(&gpu->recover_work, recover_worker);
> > +     kthread_init_work(&gpu->fault_work, fault_worker);
> >
> >       timer_setup(&gpu->hangcheck_timer, hangcheck_handler, 0);
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> > index c15e5fd675d2..8dae601085ee 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > @@ -71,6 +71,15 @@ struct msm_gpu_funcs {
> >       uint32_t (*get_rptr)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
> >  };
> >
> > +/* Additional state for iommu faults: */
> > +struct msm_gpu_fault_info {
> > +     u64 ttbr0;
> > +     unsigned long iova;
> > +     int flags;
> > +     const char *type;
> > +     const char *block;
> > +};
> > +
> >  struct msm_gpu {
> >       const char *name;
> >       struct drm_device *dev;
> > @@ -135,6 +144,12 @@ struct msm_gpu {
> >  #define DRM_MSM_HANGCHECK_JIFFIES msecs_to_jiffies(DRM_MSM_HANGCHECK_PERIOD)
> >       struct timer_list hangcheck_timer;
> >
> > +     /* Fault info for most recent iova fault: */
> > +     struct msm_gpu_fault_info fault_info;
> > +
> > +     /* work for handling GPU ioval faults: */
> > +     struct kthread_work fault_work;
> > +
> >       /* work for handling GPU recovery: */
> >       struct kthread_work recover_work;
> >
> > @@ -243,6 +258,8 @@ struct msm_gpu_state {
> >       char *comm;
> >       char *cmd;
> >
> > +     struct msm_gpu_fault_info fault_info;
> > +
> >       int nr_bos;
> >       struct msm_gpu_state_bo *bos;
> >  };
> > diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
> > index 379496186c7f..f7d1945e0c9f 100644
> > --- a/drivers/gpu/drm/msm/msm_gpummu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpummu.c
> > @@ -68,6 +68,10 @@ static int msm_gpummu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
> >       return 0;
> >  }
> >
> > +static void msm_gpummu_resume_translation(struct msm_mmu *mmu)
> > +{
> > +}
> > +
> >  static void msm_gpummu_destroy(struct msm_mmu *mmu)
> >  {
> >       struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
> > @@ -83,6 +87,7 @@ static const struct msm_mmu_funcs funcs = {
> >               .map = msm_gpummu_map,
> >               .unmap = msm_gpummu_unmap,
> >               .destroy = msm_gpummu_destroy,
> > +             .resume_translation = msm_gpummu_resume_translation,
> >  };
> >
> >  struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu)
> > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> > index 6975b95c3c29..eed2a762e9dd 100644
> > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > @@ -184,6 +184,9 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
> >        * the arm-smmu driver as a trigger to set up TTBR0
> >        */
> >       if (atomic_inc_return(&iommu->pagetables) == 1) {
> > +             /* Enable stall on iommu fault: */
> > +             adreno_smmu->set_stall(adreno_smmu->cookie, true);
> > +
> >               ret = adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, &ttbr0_cfg);
> >               if (ret) {
> >                       free_io_pgtable_ops(pagetable->pgtbl_ops);
> > @@ -226,6 +229,13 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
> >       return 0;
> >  }
> >
> > +static void msm_iommu_resume_translation(struct msm_mmu *mmu)
> > +{
> > +     struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(mmu->dev);
> > +
> > +     adreno_smmu->resume_translation(adreno_smmu->cookie, true);
> > +}
> > +
> >  static void msm_iommu_detach(struct msm_mmu *mmu)
> >  {
> >       struct msm_iommu *iommu = to_msm_iommu(mmu);
> > @@ -273,6 +283,7 @@ static const struct msm_mmu_funcs funcs = {
> >               .map = msm_iommu_map,
> >               .unmap = msm_iommu_unmap,
> >               .destroy = msm_iommu_destroy,
> > +             .resume_translation = msm_iommu_resume_translation,
> >  };
> >
> >  struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
> > diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> > index a88f44c3268d..de158e1bf765 100644
> > --- a/drivers/gpu/drm/msm/msm_mmu.h
> > +++ b/drivers/gpu/drm/msm/msm_mmu.h
> > @@ -15,6 +15,7 @@ struct msm_mmu_funcs {
> >                       size_t len, int prot);
> >       int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
> >       void (*destroy)(struct msm_mmu *mmu);
> > +     void (*resume_translation)(struct msm_mmu *mmu);
> >  };
> >
> >  enum msm_mmu_type {
> > --
> > 2.31.1
> >
