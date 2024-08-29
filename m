Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE45D9645C9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 15:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6B110E0C2;
	Thu, 29 Aug 2024 13:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sd20D8xw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785E510E0C2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 13:07:11 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2d3ba4e6ad9so109914a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 06:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724936831; x=1725541631; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d2wOw3ftnrfz6dE2n72M06FNWZzB/eeW9I5dOGD5i7c=;
 b=Sd20D8xww6LmAOLIhI5pIrY7pYRvOs/s2eQWcDszUULhsLHD30mQdXGZoCA2glCcAO
 M7qT0p6Iv79zsHrID3UmxCdB7UA7UyQ0Xf+2B+NVFpv+p4m/ZOh4eja+V47os3fzLmvY
 nJI3VaQ7gHJVZ2oJSyWyk/AgeVkAKmu+KnhMh0DCx0r/4XN8TfIf5/l5TNtLKZEkUCxO
 e/39l7ic+jOHj6UtfBRwTMPTTUHP0IockJ1A/7AWV6nO58u4cfI27UwqR3Z/cQMHSB5S
 WkNXWL5MBoBaZCkG3UVOg20EkT96XDDhbDBhTI7+Cmz4s/hjgwkRD1ycCRTRO08RH/+o
 KPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724936831; x=1725541631;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d2wOw3ftnrfz6dE2n72M06FNWZzB/eeW9I5dOGD5i7c=;
 b=vetf++/Xlj94rEGF67YokG8MvPmis1hXtBUykHaAqgzSPoqV3zdg3K8U79K5fX/WbW
 2k0s0Xct6Cc3qWC4wMULDWGaPoahPA6wRc3KKQ87qArcWLhGKbIE9Txbl4/AbX/JRdO2
 BZd+p/YyedWTErMyS4KWfYQdnhU42p/vIxCBHjSK+vFed2fqZc0DeOMFNHemwzAcm1ie
 9z5N73PHaaLcMv9Hxo0l5YUnrnVUrdu5yUmbsz7DxdY7w0tIwONIGvtWnqaSeBf56Gxr
 dVeSMknC23ozJRvuRuW09wXCgre4GZVk+X+cN8zqhCoY1vSYCmoPt3ynrx1Cd1O2j02r
 S7Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD90fC/kxbt7HD3aF20rzbkxP6gt4sVdezvad14v49jFA76U158qT76df1GuaJgF7iramSErkXorU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9CM0Joxk5pQVH0l3tkr271+GGBPqgEUN6u9DNrPp7+ojZS60G
 pEwyKAVK9MLmjQgSf2uqJLn9jCNGD3LeEn7QG1jsDV9FNjI+GJPqCl3d2FPzYBTT8aQBktjkDoH
 fQEc3rtJ9SYila34T/6BLw9u2pX4=
X-Google-Smtp-Source: AGHT+IH0Jf2eS7UXsTGQ4Bc3cQvfLlMiNA1ekY/mchBFMiPAdFrPF9wpM5HAKSGKavlOSQGQZoDYByEk/N0l5r/pN4o=
X-Received: by 2002:a17:902:f552:b0:200:69e9:5c87 with SMTP id
 d9443c01a7336-2050c228640mr16964675ad.1.1724936830523; Thu, 29 Aug 2024
 06:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240826122541.85663-1-christian.koenig@amd.com>
In-Reply-To: <20240826122541.85663-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Aug 2024 09:06:58 -0400
Message-ID: <CADnq5_N+hgour7JiWX8W3-q5PNvX-jCXTUvKT5Og4wwZUmcs5Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/sched: add optional errno to drm_sched_start()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: daniel.vetter@ffwll.ch, vitaly.prosyak@amd.com, 
 dri-devel@lists.freedesktop.org, ltuikov89@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Aug 26, 2024 at 8:35=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> The current implementation of drm_sched_start uses a hardcoded
> -ECANCELED to dispose of a job when the parent/hw fence is NULL.
> This results in drm_sched_job_done being called with -ECANCELED for
> each job with a NULL parent in the pending list, making it difficult
> to distinguish between recovery methods, whether a queue reset or a
> full GPU reset was used.
>
> To improve this, we first try a soft recovery for timeout jobs and
> use the error code -ENODATA. If soft recovery fails, we proceed with
> a queue reset, where the error code remains -ENODATA for the job.
> Finally, for a full GPU reset, we use error codes -ECANCELED or
> -ETIME. This patch adds an error code parameter to drm_sched_start,
> allowing us to differentiate between queue reset and GPU reset
> failures. This enables user mode and test applications to validate
> the expected correctness of the requested operation. After a
> successful queue reset, the only way to continue normal operation is
> to call drm_sched_job_done with the specific error code -ENODATA.
>
> v1: Initial implementation by Jesse utilized amdgpu_device_lock_reset_dom=
ain
>     and amdgpu_device_unlock_reset_domain to allow user mode to track
>     the queue reset status and distinguish between queue reset and
>     GPU reset.
> v2: Christian suggested using the error codes -ENODATA for queue reset
>     and -ECANCELED or -ETIME for GPU reset, returned to
>     amdgpu_cs_wait_ioctl.
> v3: To meet the requirements, we introduce a new function
>     drm_sched_start_ex with an additional parameter to set
>     dma_fence_set_error, allowing us to handle the specific error
>     codes appropriately and dispose of bad jobs with the selected
>     error code depending on whether it was a queue reset or GPU reset.
> v4: Alex suggested using a new name, drm_sched_start_with_recovery_error,
>     which more accurately describes the function's purpose.
>     Additionally, it was recommended to add documentation details
>     about the new method.
> v5: Fixed declaration of new function drm_sched_start_with_recovery_error=
.(Alex)
> v6 (chk): rebase on upstream changes, cleanup the commit message,
>           drop the new function again and update all callers,
>           apply the errno also to scheduler fences with hw fences
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c          | 4 ++--
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c             | 2 +-
>  drivers/gpu/drm/imagination/pvr_queue.c             | 4 ++--
>  drivers/gpu/drm/lima/lima_sched.c                   | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c             | 2 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c             | 2 +-
>  drivers/gpu/drm/panthor/panthor_mmu.c               | 2 +-
>  drivers/gpu/drm/scheduler/sched_main.c              | 7 ++++---
>  drivers/gpu/drm/v3d/v3d_sched.c                     | 2 +-
>  include/drm/gpu_scheduler.h                         | 2 +-
>  11 files changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/driver=
s/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> index 2320df51c914..18135d8235f9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> @@ -300,7 +300,7 @@ static int suspend_resume_compute_scheduler(struct am=
dgpu_device *adev, bool sus
>                         if (r)
>                                 goto out;
>                 } else {
> -                       drm_sched_start(&ring->sched);
> +                       drm_sched_start(&ring->sched, 0);
>                 }
>         }
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 1cd7d355689c..5891312e44ea 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5879,7 +5879,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device =
*adev,
>                         if (!amdgpu_ring_sched_ready(ring))
>                                 continue;
>
> -                       drm_sched_start(&ring->sched);
> +                       drm_sched_start(&ring->sched, 0);
>                 }
>
>                 if (!drm_drv_uses_atomic_modeset(adev_to_drm(tmp_adev)) &=
& !job_signaled)
> @@ -6374,7 +6374,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
>                 if (!amdgpu_ring_sched_ready(ring))
>                         continue;
>
> -               drm_sched_start(&ring->sched);
> +               drm_sched_start(&ring->sched, 0);
>         }
>
>         amdgpu_device_unset_mp1_state(adev);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/et=
naviv/etnaviv_sched.c
> index ab9ca4824b62..23ced5896c7c 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -72,7 +72,7 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_j=
ob(struct drm_sched_job
>
>         drm_sched_resubmit_jobs(&gpu->sched);
>
> -       drm_sched_start(&gpu->sched);
> +       drm_sched_start(&gpu->sched, 0);
>         return DRM_GPU_SCHED_STAT_NOMINAL;
>
>  out_no_timeout:
> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/im=
agination/pvr_queue.c
> index 20cb46012082..c4f08432882b 100644
> --- a/drivers/gpu/drm/imagination/pvr_queue.c
> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> @@ -782,7 +782,7 @@ static void pvr_queue_start(struct pvr_queue *queue)
>                 }
>         }
>
> -       drm_sched_start(&queue->scheduler);
> +       drm_sched_start(&queue->scheduler, 0);
>  }
>
>  /**
> @@ -842,7 +842,7 @@ pvr_queue_timedout_job(struct drm_sched_job *s_job)
>         }
>         mutex_unlock(&pvr_dev->queues.lock);
>
> -       drm_sched_start(sched);
> +       drm_sched_start(sched, 0);
>
>         return DRM_GPU_SCHED_STAT_NOMINAL;
>  }
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lim=
a_sched.c
> index 1a944edb6ddc..b40c90e97d7e 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -463,7 +463,7 @@ static enum drm_gpu_sched_stat lima_sched_timedout_jo=
b(struct drm_sched_job *job
>         lima_pm_idle(ldev);
>
>         drm_sched_resubmit_jobs(&pipe->base);
> -       drm_sched_start(&pipe->base);
> +       drm_sched_start(&pipe->base, 0);
>
>         return DRM_GPU_SCHED_STAT_NOMINAL;
>  }
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/no=
uveau/nouveau_sched.c
> index eb6c3f9a01f5..4412f2711fb5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -379,7 +379,7 @@ nouveau_sched_timedout_job(struct drm_sched_job *sche=
d_job)
>         else
>                 NV_PRINTK(warn, job->cli, "Generic job timeout.\n");
>
> -       drm_sched_start(sched);
> +       drm_sched_start(sched, 0);
>
>         return stat;
>  }
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/pa=
nfrost/panfrost_job.c
> index df49d37d0e7e..d140800606bf 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -727,7 +727,7 @@ panfrost_reset(struct panfrost_device *pfdev,
>
>         /* Restart the schedulers */
>         for (i =3D 0; i < NUM_JOB_SLOTS; i++)
> -               drm_sched_start(&pfdev->js->queue[i].sched);
> +               drm_sched_start(&pfdev->js->queue[i].sched, 0);
>
>         /* Re-enable job interrupts now that everything has been restarte=
d. */
>         job_write(pfdev, JOB_INT_MASK,
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pant=
hor/panthor_mmu.c
> index d47972806d50..e630cdf47f99 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -827,7 +827,7 @@ static void panthor_vm_stop(struct panthor_vm *vm)
>
>  static void panthor_vm_start(struct panthor_vm *vm)
>  {
> -       drm_sched_start(&vm->sched);
> +       drm_sched_start(&vm->sched, 0);
>  }
>
>  /**
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index ab53ab486fe6..f093616fe53c 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -674,9 +674,10 @@ EXPORT_SYMBOL(drm_sched_stop);
>   * drm_sched_start - recover jobs after a reset
>   *
>   * @sched: scheduler instance
> + * @errno: error to set on the pending fences
>   *
>   */
> -void drm_sched_start(struct drm_gpu_scheduler *sched)
> +void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
>  {
>         struct drm_sched_job *s_job, *tmp;
>
> @@ -691,13 +692,13 @@ void drm_sched_start(struct drm_gpu_scheduler *sche=
d)
>                 atomic_add(s_job->credits, &sched->credit_count);
>
>                 if (!fence) {
> -                       drm_sched_job_done(s_job, -ECANCELED);
> +                       drm_sched_job_done(s_job, errno ?: -ECANCELED);
>                         continue;
>                 }
>
>                 if (dma_fence_add_callback(fence, &s_job->cb,
>                                            drm_sched_job_done_cb))
> -                       drm_sched_job_done(s_job, fence->error);
> +                       drm_sched_job_done(s_job, fence->error ?: errno);
>         }
>
>         drm_sched_start_timeout_unlocked(sched);
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sc=
hed.c
> index fd29a00b233c..b6a89171824b 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -663,7 +663,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct=
 drm_sched_job *sched_job)
>
>         /* Unblock schedulers and restart their jobs. */
>         for (q =3D 0; q < V3D_MAX_QUEUES; q++) {
> -               drm_sched_start(&v3d->queue[q].sched);
> +               drm_sched_start(&v3d->queue[q].sched, 0);
>         }
>
>         mutex_unlock(&v3d->reset_lock);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index fe8edb917360..a8d19b10f9b8 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -579,7 +579,7 @@ bool drm_sched_wqueue_ready(struct drm_gpu_scheduler =
*sched);
>  void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
>  void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
>  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_jo=
b *bad);
> -void drm_sched_start(struct drm_gpu_scheduler *sched);
> +void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);
>  void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
>  void drm_sched_increase_karma(struct drm_sched_job *bad);
>  void drm_sched_reset_karma(struct drm_sched_job *bad);
> --
> 2.34.1
>
