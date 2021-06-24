Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 568983B3840
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 23:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AC16E9A1;
	Thu, 24 Jun 2021 21:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD0E6E9A3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 21:00:46 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id mj3so4165505ejb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IR4aEk4fY+kQz2psBvmLXib2kl0ubSGcHQYCPaxJ2YA=;
 b=nqgmw09ORBqRhCPcSdwNmbOZbO7ESKavpHGGFj6bhvTDAV2O8NGYqISEzzE2yx7wxl
 Q2T4cBqldf5sq0EcWa7YMEyAqx+2pqGgHFXQGPFpt2o82L9EAbluDNZZGdK0WxzoweW4
 XnR86PZdGA5dGWJ90zdW4VAfYU7gP6g2iE6WnlU2Mub1OreYppEprje/Z+c2S7GH0D0Q
 nUIn2ZOmUJA5VjgI4u0/1IVk4Is8N9ianxUPaK+EG7W/bNSERnA6Cmm/O9AcZZKKXxwu
 kxe35JPF4zcjn2upYa1YPReRCa4tXDvWdpRZB01/Xlg4vk+1ghPYNd3TjVbZuzL+0iqr
 fBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IR4aEk4fY+kQz2psBvmLXib2kl0ubSGcHQYCPaxJ2YA=;
 b=bOdJraU6+DuUBTmdHzC9NqNrveOYnQpe3kCipMRlwDjl3YF08gDW9Z4dzzFS7Ydmik
 Z/OToJXLhxrFzT8UZ8tDRcvOk+u2OZwb7TJLslPGeOwBRPsuTjq+cALBqxOwbAN6t7WI
 EAGUtcVH0BS1Hv0PydvueMLJgG0PnBciljcVfLqHJ1ZRFu1YUZx+iCyQtccx1OqpTfsz
 Y27OgNYxm4+q7ebRvTbdStYxT6BqxjNg4U+29JckwcV1HIRy6xw0tMKnUwHjafUXdJhw
 MCiTsyIzDMaGg4+Re9RTwsAYVSU5vNOv52L1MyWeMcE4rC9reHCb30JYKKHuinAmN6yt
 9r7Q==
X-Gm-Message-State: AOAM532KjMHmYNvjlo6L6kE+i4upJfQ9mSSpJhluM4JONrXYuLqQtwi0
 HNibwHJHtOxpWlodkhsWeC744rPUd6xhxAsUQRz9XpExjGSo2sX/
X-Google-Smtp-Source: ABdhPJyZ4lUgJUvjuk8NBMNyhneRJZo/xx5f9zO62wml+jZsqtpsarsBFuhsxF/AMmWn1C2aGDTV2wOlpvQTqGzIkfA=
X-Received: by 2002:a17:906:26c9:: with SMTP id
 u9mr7162402ejc.498.1624568444951; 
 Thu, 24 Jun 2021 14:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210624140025.438303-2-daniel.vetter@ffwll.ch>
 <20210624204535.614168-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210624204535.614168-1-daniel.vetter@ffwll.ch>
From: Emma Anholt <emma@anholt.net>
Date: Thu, 24 Jun 2021 14:00:34 -0700
Message-ID: <CADaigPWe17ddknbNWOVcGLZGkX3u1JfpzkAxySTduwgPUa5okQ@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Split drm_sched_job_init
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Adam Borowski <kilobyte@angband.pl>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sonny Jiang <sonny.jiang@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Jack Zhang <Jack.Zhang1@amd.com>, lima@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Steven Price <steven.price@arm.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>, etnaviv@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Deepak R Varma <mh12gx2825@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Nick Terrell <terrelln@fb.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 linux-media@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 1:45 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> This is a very confusingly named function, because not just does it
> init an object, it arms it and provides a point of no return for
> pushing a job into the scheduler. It would be nice if that's a bit
> clearer in the interface.
>
> But the real reason is that I want to push the dependency tracking
> helpers into the scheduler code, and that means drm_sched_job_init
> must be called a lot earlier, without arming the job.
>
> v2:
> - don't change .gitignore (Steven)
> - don't forget v3d (Emma)
>
> Acked-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Qiang Yu <yuq825@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Adam Borowski <kilobyte@angband.pl>
> Cc: Nick Terrell <terrelln@fb.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Paul Menzel <pmenzel@molgen.mpg.de>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Nirmoy Das <nirmoy.das@amd.com>
> Cc: Deepak R Varma <mh12gx2825@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Kevin Wang <kevin1.wang@amd.com>
> Cc: Chen Li <chenli@uniontech.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: "Marek Ol=C5=A1=C3=A1k" <marek.olsak@amd.com>
> Cc: Dennis Li <Dennis.Li@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Sonny Jiang <sonny.jiang@amd.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Jack Zhang <Jack.Zhang1@amd.com>
> Cc: etnaviv@lists.freedesktop.org
> Cc: lima@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: Emma Anholt <emma@anholt.net>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 ++
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 ++
>  drivers/gpu/drm/lima/lima_sched.c        |  2 ++
>  drivers/gpu/drm/panfrost/panfrost_job.c  |  2 ++
>  drivers/gpu/drm/scheduler/sched_entity.c |  6 +++---
>  drivers/gpu/drm/scheduler/sched_fence.c  | 15 ++++++++++-----
>  drivers/gpu/drm/scheduler/sched_main.c   | 23 ++++++++++++++++++++++-
>  drivers/gpu/drm/v3d/v3d_gem.c            |  2 ++
>  include/drm/gpu_scheduler.h              |  6 +++++-
>  10 files changed, 52 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_cs.c
> index c5386d13eb4a..a4ec092af9a7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1226,6 +1226,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser=
 *p,
>         if (r)
>                 goto error_unlock;
>
> +       drm_sched_job_arm(&job->base);
> +
>         /* No memory allocation is allowed while holding the notifier loc=
k.
>          * The lock is held until amdgpu_cs_submit is finished and fence =
is
>          * added to BOs.
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_job.c
> index d33e6d97cc89..5ddb955d2315 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -170,6 +170,8 @@ int amdgpu_job_submit(struct amdgpu_job *job, struct =
drm_sched_entity *entity,
>         if (r)
>                 return r;
>
> +       drm_sched_job_arm(&job->base);
> +
>         *f =3D dma_fence_get(&job->base.s_fence->finished);
>         amdgpu_job_free_resources(job);
>         drm_sched_entity_push_job(&job->base, entity);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/et=
naviv/etnaviv_sched.c
> index 19826e504efc..af1671f01c7f 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -163,6 +163,8 @@ int etnaviv_sched_push_job(struct drm_sched_entity *s=
ched_entity,
>         if (ret)
>                 goto out_unlock;
>
> +       drm_sched_job_arm(&submit->sched_job);
> +
>         submit->out_fence =3D dma_fence_get(&submit->sched_job.s_fence->f=
inished);
>         submit->out_fence_id =3D idr_alloc_cyclic(&submit->gpu->fence_idr=
,
>                                                 submit->out_fence, 0,
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lim=
a_sched.c
> index ecf3267334ff..bd1af1fd8c0f 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -129,6 +129,8 @@ int lima_sched_task_init(struct lima_sched_task *task=
,
>                 return err;
>         }
>
> +       drm_sched_job_arm(&task->base);
> +
>         task->num_bos =3D num_bos;
>         task->vm =3D lima_vm_get(vm);
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/pa=
nfrost/panfrost_job.c
> index beb62c8fc851..1e950534b9b0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -244,6 +244,8 @@ int panfrost_job_push(struct panfrost_job *job)
>                 goto unlock;
>         }
>
> +       drm_sched_job_arm(&job->base);
> +
>         job->render_done_fence =3D dma_fence_get(&job->base.s_fence->fini=
shed);
>
>         ret =3D panfrost_acquire_object_fences(job->bos, job->bo_count,
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index 79554aa4dbb1..f7347c284886 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -485,9 +485,9 @@ void drm_sched_entity_select_rq(struct drm_sched_enti=
ty *entity)
>   * @sched_job: job to submit
>   * @entity: scheduler entity
>   *
> - * Note: To guarantee that the order of insertion to queue matches
> - * the job's fence sequence number this function should be
> - * called with drm_sched_job_init under common lock.
> + * Note: To guarantee that the order of insertion to queue matches the j=
ob's
> + * fence sequence number this function should be called with drm_sched_j=
ob_arm()
> + * under common lock.
>   *
>   * Returns 0 for success, negative error code otherwise.
>   */
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/sc=
heduler/sched_fence.c
> index 69de2c76731f..0ba810c198bd 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -152,11 +152,10 @@ struct drm_sched_fence *to_drm_sched_fence(struct d=
ma_fence *f)
>  }
>  EXPORT_SYMBOL(to_drm_sched_fence);
>
> -struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *=
entity,
> -                                              void *owner)
> +struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *e=
ntity,
> +                                             void *owner)
>  {
>         struct drm_sched_fence *fence =3D NULL;
> -       unsigned seq;
>
>         fence =3D kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
>         if (fence =3D=3D NULL)
> @@ -166,13 +165,19 @@ struct drm_sched_fence *drm_sched_fence_create(stru=
ct drm_sched_entity *entity,
>         fence->sched =3D entity->rq->sched;
>         spin_lock_init(&fence->lock);
>
> +       return fence;
> +}

If there's an error path between fence_alloc (job_init()) and
fence_create() (job_arm()) time, how does the s_fence get freed?
Before, I was committed to calling drm_sched_entity_push_job() which
lead to the job being processed and freed, but now I think we need
some other non-pushed-job free path.

> +EXPORT_SYMBOL(drm_sched_job_arm);
> +
>  /**
>   * drm_sched_job_cleanup - clean up scheduler job resources
>   *
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.=
c
> index 4eb354226972..5c3a99027ecd 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -475,6 +475,8 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
>         if (ret)
>                 return ret;
>
> +       drm_sched_job_arm(&job->base);
> +
>         job->done_fence =3D dma_fence_get(&job->base.s_fence->finished);
>
>         /* put by scheduler job completion */
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index d18af49fd009..80438d126c9d 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -313,6 +313,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched);
>  int drm_sched_job_init(struct drm_sched_job *job,
>                        struct drm_sched_entity *entity,
>                        void *owner);
> +void drm_sched_job_arm(struct drm_sched_job *job);
>  void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>                                     struct drm_gpu_scheduler **sched_list=
,
>                                     unsigned int num_sched_list);
> @@ -352,8 +353,11 @@ void drm_sched_entity_set_priority(struct drm_sched_=
entity *entity,
>                                    enum drm_sched_priority priority);
>  bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>
> -struct drm_sched_fence *drm_sched_fence_create(
> +struct drm_sched_fence *drm_sched_fence_alloc(
>         struct drm_sched_entity *s_entity, void *owner);
> +void drm_sched_fence_init(struct drm_sched_fence *fence,
> +                         struct drm_sched_entity *entity);
> +
>  void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
>  void drm_sched_fence_finished(struct drm_sched_fence *fence);
>
> --
> 2.32.0.rc2
>
