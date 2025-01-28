Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C09B3A213B4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 22:50:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B84510E105;
	Tue, 28 Jan 2025 21:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aAa2xMtN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F1210E703;
 Tue, 28 Jan 2025 21:49:59 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2162c0f6a39so2058185ad.0; 
 Tue, 28 Jan 2025 13:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738100999; x=1738705799; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n9ti4727rCjJ8t4FxJKh2JN1x1pJdAgODWQPy/1+1ZQ=;
 b=aAa2xMtNxnccoI3ZTOWRn/Lefm9EGQ3xWbQuk9idJyiQH8Sana9M5Lr4nZdY4cxbKo
 sx5TNJxXGa09LnDr2R0eu0dE6th1AILrPe/EdSsyCvIEmejfEjImofbJoFAp9YGbzSpn
 HsjxwM5TQ4kYUYBbzLhw2DiJJyZUgjzcWEUphGjwOQAhLqJfs66bmvYAO8rVdRhhB76/
 BX6BCrhUF7JkCMY0BO9y8DmthtjmjAt5dO/bqOiSMxPMMrOt5Msnp53kzGRCfhzRwRg4
 TIGdzWbKCcV/pelrgvmMdZM76Xz5M9N1OwGy3tvMJHgis0IXTgwU3QDZ68ecif5S440V
 jX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738100999; x=1738705799;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n9ti4727rCjJ8t4FxJKh2JN1x1pJdAgODWQPy/1+1ZQ=;
 b=IsLwwFQ+Brz7ojkGaS4WPmjpOylKpKy9GDICsL4+40bX5XgIDFdU7NgHd/rEAC0oV3
 1BUIvhkk31u8gs7xs7GkBISaxPT/dTWAMv+jwAA6w5uH0JpSRhSYtVxdwAGHfMYa+Pwn
 j2f/3xTfO8lME6sVSB0/XbErYB/p55ghJwaA7xVclLhaLKjoroFv7uvB9m3a1n/VMiVV
 9S29l+oM5+0PUTA1V7rvp52XXlnLJtlLm1jzu49kWELthafYgXhXgguIYcer5iRxucOu
 CHzDUL1xyltVay2EKCxk81E5YVsaUIvNZoMJfbdiZ9CEZrr4dqpf993sihk7IUx5aUaJ
 Qrjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG1uzcDYWzJzhj2uqNjDVFM3lVTuvn4vxiGwahYr9iTj+TczH5zRDb2Aeq2tvQ8g84zVfIKUh4Lw==@lists.freedesktop.org,
 AJvYcCVMDt7qfX0XO14TZIurqTUA23Q963FG8U/k6Lv6X5bgNhoeX3UAskWXnbtiFREgFgvSKZ+HxceL@lists.freedesktop.org,
 AJvYcCVOJMlNqqG6YK5J76NRk6W01M5SCPA03eQAbK+oOjZqlPCuyAivrOEHAzLUK8I8PFlRPwbKvw==@lists.freedesktop.org,
 AJvYcCVRh7kaVpCS+dpVSfM8KyT45IysDZmSn+Vs50qXzBVNI0zJdIuXjYz1lI/ZtGZXrsOynirA0Lmb/8Y=@lists.freedesktop.org,
 AJvYcCVWnm4Ek99vLZIBRB2cR8ZBzlfGrPkVjZruREJ3VCFMX2usbApasLxbnJnnLTvXLqWicBVKhfk3MNTd@lists.freedesktop.org,
 AJvYcCX1Y5rRpljzYzlfQKKz7CUzs4cLuY3h/br4SQgTYZSc2rWv3Awsx2/4782id53iSUPQ8esqsGXu/A==@lists.freedesktop.org,
 AJvYcCXTn1gQLMori1A7Zi4twt3qMLEWbFUxGy8x/ggjCbaEGUiPdHncPwZJs+sLEmX8lrpaZnZoKiLNV9SL@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiGmy5n8kTYcwggx6T+uc/bEmNCYUPrmLRNmU6iWeCTm3KabDL
 HJFQggCUv3JQ3So+tZu3BuWMxrlwkzxlMvIP70ZnqVFWZC3h+Lt9yHaBiAm/IaK5qza3mywFbBr
 xYyiaEYswEKVrCu8LgP8rCSbpLX8=
X-Gm-Gg: ASbGnctg82+FbRRQtL+7pM7sl3KzCFPxwiH9VXVfsPJd26Q1hSBIWfx1pBhdjKtfHpl
 KKkiMdLpFUebB9eklClUwQ+QyK62Y6g4lVUwm9ecFk0ayVw3J/Ilw6T6WbQ6WDRJgW2wPFDw=
X-Google-Smtp-Source: AGHT+IF4QLN5I5Neke+aXhALwYQ+4rmdTVEsi1FFiTEboVq+p4Y7dM8N+vzpK73y2kwr6DjXw9jm9xPC3ekIkV14R+s=
X-Received: by 2002:a05:6a00:2918:b0:72a:78a3:7f57 with SMTP id
 d2e1a72fcca58-72fd0928643mr1197072b3a.9.1738100999057; Tue, 28 Jan 2025
 13:49:59 -0800 (PST)
MIME-Version: 1.0
References: <20250128142927.103290-2-phasta@kernel.org>
In-Reply-To: <20250128142927.103290-2-phasta@kernel.org>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Tue, 28 Jan 2025 22:49:47 +0100
X-Gm-Features: AWEUYZl7jxwB35URfs9ZDAM199OWxFSJGxqZwQN6-R6gAD95htjjkOr7G9JmtT8
Message-ID: <CAH9NwWeTVv3kABmADJD8mNcE1Psq2ToLfzjO4HzbSfJ4+gkxDw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/sched: Use struct for drm_sched_init() params
To: Philipp Stanner <phasta@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Matthew Brost <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>, 
 Yunxiang Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org
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

>
> drm_sched_init() has a great many parameters and upcoming new
> functionality for the scheduler might add even more. Generally, the
> great number of parameters reduces readability and has already caused
> one missnaming in:
>
> commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in nouveau_sched=
_init()").
>
> Introduce a new struct for the scheduler init parameters and port all
> users.
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Changes in v2:
>   - Point out that the hang-limit is deprecated. (Christian)
>   - Initialize the structs to 0 at declaration. (Planet Earth)
>   - Don't set stuff explicitly to 0 / NULL. (Tvrtko)
>   - Make the structs const where possible. (Boris)
>   - v3d: Use just 1, universal, function for sched-init. (Ma=C3=ADra)
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 ++++--
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    | 20 +++----
>  drivers/gpu/drm/imagination/pvr_queue.c    | 18 ++++--
>  drivers/gpu/drm/lima/lima_sched.c          | 16 +++--
>  drivers/gpu/drm/msm/msm_ringbuffer.c       | 17 +++---
>  drivers/gpu/drm/nouveau/nouveau_sched.c    | 15 +++--
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 20 ++++---
>  drivers/gpu/drm/panthor/panthor_mmu.c      | 16 +++--
>  drivers/gpu/drm/panthor/panthor_sched.c    | 29 +++++----
>  drivers/gpu/drm/scheduler/sched_main.c     | 50 ++++++----------
>  drivers/gpu/drm/v3d/v3d_sched.c            | 68 +++++++++-------------
>  drivers/gpu/drm/xe/xe_execlist.c           | 16 +++--
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c      | 17 +++++-
>  include/drm/gpu_scheduler.h                | 37 ++++++++++--
>  14 files changed, 206 insertions(+), 151 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 96316111300a..daf58b0ff0fa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2816,6 +2816,12 @@ static int amdgpu_device_fw_loading(struct amdgpu_=
device *adev)
>
>  static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>  {
> +       struct drm_sched_init_args args =3D {
> +               .ops =3D &amdgpu_sched_ops,
> +               .num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> +               .timeout_wq =3D adev->reset_domain->wq,
> +               .dev =3D adev->dev
> +       };
>         long timeout;
>         int r, i;
>
> @@ -2841,12 +2847,12 @@ static int amdgpu_device_init_schedulers(struct a=
mdgpu_device *adev)
>                         break;
>                 }
>
> -               r =3D drm_sched_init(&ring->sched, &amdgpu_sched_ops, NUL=
L,
> -                                  DRM_SCHED_PRIORITY_COUNT,
> -                                  ring->num_hw_submission, 0,
> -                                  timeout, adev->reset_domain->wq,
> -                                  ring->sched_score, ring->name,
> -                                  adev->dev);
> +               args.timeout =3D timeout;
> +               args.credit_limit =3D ring->num_hw_submission;
> +               args.score =3D ring->sched_score;
> +               args.name =3D ring->name;
> +
> +               r =3D drm_sched_init(&ring->sched, &args);
>                 if (r) {
>                         DRM_ERROR("Failed to create scheduler on ring %s.=
\n",
>                                   ring->name);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/et=
naviv/etnaviv_sched.c
> index 5b67eda122db..1693fd660bf1 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -144,17 +144,17 @@ int etnaviv_sched_push_job(struct etnaviv_gem_submi=
t *submit)
>
>  int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>  {
> -       int ret;
> +       const struct drm_sched_init_args args =3D {

Why not declare it as static const struct drm_sched_init_args args =3D { ?
This question applies to all similar occurrences in the patch.

> +               .ops =3D &etnaviv_sched_ops,
> +               .num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> +               .credit_limit =3D etnaviv_hw_jobs_limit,
> +               .hang_limit =3D etnaviv_job_hang_limit,
> +               .timeout =3D msecs_to_jiffies(500),
> +               .name =3D dev_name(gpu->dev),
> +               .dev =3D gpu->dev
> +       };
>
> -       ret =3D drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
> -                            DRM_SCHED_PRIORITY_COUNT,
> -                            etnaviv_hw_jobs_limit, etnaviv_job_hang_limi=
t,
> -                            msecs_to_jiffies(500), NULL, NULL,
> -                            dev_name(gpu->dev), gpu->dev);
> -       if (ret)
> -               return ret;
> -
> -       return 0;
> +       return drm_sched_init(&gpu->sched, &args);
>  }
>
>  void etnaviv_sched_fini(struct etnaviv_gpu *gpu)
> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/im=
agination/pvr_queue.c
> index c4f08432882b..d5c22874a9c1 100644
> --- a/drivers/gpu/drm/imagination/pvr_queue.c
> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> @@ -1210,6 +1210,17 @@ struct pvr_queue *pvr_queue_create(struct pvr_cont=
ext *ctx,
>                 },
>         };
>         struct pvr_device *pvr_dev =3D ctx->pvr_dev;
> +       const struct drm_sched_init_args sched_args =3D {
> +               .ops =3D &pvr_queue_sched_ops,
> +               .submit_wq =3D pvr_dev->sched_wq,
> +               .num_rqs =3D 1,
> +               .credit_limit =3D 64 * 1024,
> +               .hang_limit =3D 1,
> +               .timeout =3D msecs_to_jiffies(500),
> +               .timeout_wq =3D pvr_dev->sched_wq,
> +               .name =3D "pvr-queue",
> +               .dev =3D pvr_dev->base.dev
> +       };
>         struct drm_gpu_scheduler *sched;
>         struct pvr_queue *queue;
>         int ctx_state_size, err;
> @@ -1282,12 +1293,7 @@ struct pvr_queue *pvr_queue_create(struct pvr_cont=
ext *ctx,
>
>         queue->timeline_ufo.value =3D cpu_map;
>
> -       err =3D drm_sched_init(&queue->scheduler,
> -                            &pvr_queue_sched_ops,
> -                            pvr_dev->sched_wq, 1, 64 * 1024, 1,
> -                            msecs_to_jiffies(500),
> -                            pvr_dev->sched_wq, NULL, "pvr-queue",
> -                            pvr_dev->base.dev);
> +       err =3D drm_sched_init(&queue->scheduler, &sched_args);
>         if (err)
>                 goto err_release_ufo;
>
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lim=
a_sched.c
> index b40c90e97d7e..137adbd2b52d 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -515,18 +515,22 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pi=
pe, const char *name)
>  {
>         unsigned int timeout =3D lima_sched_timeout_ms > 0 ?
>                                lima_sched_timeout_ms : 10000;
> +       const struct drm_sched_init_args args =3D {
> +               .ops =3D &lima_sched_ops,
> +               .num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> +               .credit_limit =3D 1,
> +               .hang_limit =3D lima_job_hang_limit,
> +               .timeout =3D msecs_to_jiffies(timeout),
> +               .name =3D name,
> +               .dev =3D pipe->ldev->dev
> +       };
>
>         pipe->fence_context =3D dma_fence_context_alloc(1);
>         spin_lock_init(&pipe->fence_lock);
>
>         INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
>
> -       return drm_sched_init(&pipe->base, &lima_sched_ops, NULL,
> -                             DRM_SCHED_PRIORITY_COUNT,
> -                             1,
> -                             lima_job_hang_limit,
> -                             msecs_to_jiffies(timeout), NULL,
> -                             NULL, name, pipe->ldev->dev);
> +       return drm_sched_init(&pipe->base, &args);
>  }
>
>  void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/m=
sm_ringbuffer.c
> index c803556a8f64..c9d5283df3e3 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -59,8 +59,14 @@ static const struct drm_sched_backend_ops msm_sched_op=
s =3D {
>  struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>                 void *memptrs, uint64_t memptrs_iova)
>  {
> +       struct drm_sched_init_args args =3D {
> +               .ops =3D &msm_sched_ops,
> +               .num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> +               .credit_limit =3D num_hw_submissions,
> +               .timeout =3D MAX_SCHEDULE_TIMEOUT,
> +               .dev =3D gpu->dev->dev
> +       };
>         struct msm_ringbuffer *ring;
> -       long sched_timeout;
>         char name[32];
>         int ret;
>
> @@ -87,6 +93,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gp=
u *gpu, int id,
>         }
>
>         msm_gem_object_set_name(ring->bo, "ring%d", id);
> +       args.name =3D to_msm_bo(ring->bo)->name,
>
>         ring->end   =3D ring->start + (MSM_GPU_RINGBUFFER_SZ >> 2);
>         ring->next  =3D ring->start;
> @@ -95,13 +102,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_=
gpu *gpu, int id,
>         ring->memptrs =3D memptrs;
>         ring->memptrs_iova =3D memptrs_iova;
>
> -        /* currently managing hangcheck ourselves: */
> -       sched_timeout =3D MAX_SCHEDULE_TIMEOUT;
> -
> -       ret =3D drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> -                            DRM_SCHED_PRIORITY_COUNT,
> -                            num_hw_submissions, 0, sched_timeout,
> -                            NULL, NULL, to_msm_bo(ring->bo)->name, gpu->=
dev->dev);
> +       ret =3D drm_sched_init(&ring->sched, &args);
>         if (ret) {
>                 goto fail;
>         }
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/no=
uveau/nouveau_sched.c
> index 4412f2711fb5..b5aac8eebfdd 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -404,7 +404,15 @@ nouveau_sched_init(struct nouveau_sched *sched, stru=
ct nouveau_drm *drm,
>  {
>         struct drm_gpu_scheduler *drm_sched =3D &sched->base;
>         struct drm_sched_entity *entity =3D &sched->entity;
> -       const long timeout =3D msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT=
_MS);
> +       const struct drm_sched_init_args args =3D {
> +               .ops =3D &nouveau_sched_ops,
> +               .submit_wq =3D wq,
> +               .num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> +               .credit_limit =3D credit_limit,
> +               .timeout =3D msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_M=
S),
> +               .name =3D "nouveau_sched",
> +               .dev =3D drm->dev->dev
> +       };
>         int ret;
>
>         if (!wq) {
> @@ -416,10 +424,7 @@ nouveau_sched_init(struct nouveau_sched *sched, stru=
ct nouveau_drm *drm,
>                 sched->wq =3D wq;
>         }
>
> -       ret =3D drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
> -                            NOUVEAU_SCHED_PRIORITY_COUNT,
> -                            credit_limit, 0, timeout,
> -                            NULL, NULL, "nouveau_sched", drm->dev->dev);
> +       ret =3D drm_sched_init(drm_sched, &args);
>         if (ret)
>                 goto fail_wq;
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/pa=
nfrost/panfrost_job.c
> index 9b8e82fb8bc4..893fd91cf5b0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -836,8 +836,16 @@ static irqreturn_t panfrost_job_irq_handler(int irq,=
 void *data)
>
>  int panfrost_job_init(struct panfrost_device *pfdev)
>  {
> +       struct drm_sched_init_args args =3D {
> +               .ops =3D &panfrost_sched_ops,
> +               .num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> +               .credit_limit =3D 2,
> +               .timeout =3D msecs_to_jiffies(JOB_TIMEOUT_MS),
> +               .timeout_wq =3D pfdev->reset.wq,
> +               .name =3D "pan_js",
> +               .dev =3D pfdev->dev
> +       };
>         struct panfrost_job_slot *js;
> -       unsigned int nentries =3D 2;
>         int ret, j;
>
>         /* All GPUs have two entries per queue, but without jobchain
> @@ -845,7 +853,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>          * so let's just advertise one entry in that case.
>          */
>         if (!panfrost_has_hw_feature(pfdev, HW_FEATURE_JOBCHAIN_DISAMBIGU=
ATION))
> -               nentries =3D 1;
> +               args.credit_limit =3D 1;
>
>         pfdev->js =3D js =3D devm_kzalloc(pfdev->dev, sizeof(*js), GFP_KE=
RNEL);
>         if (!js)
> @@ -875,13 +883,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>         for (j =3D 0; j < NUM_JOB_SLOTS; j++) {
>                 js->queue[j].fence_context =3D dma_fence_context_alloc(1)=
;
>
> -               ret =3D drm_sched_init(&js->queue[j].sched,
> -                                    &panfrost_sched_ops, NULL,
> -                                    DRM_SCHED_PRIORITY_COUNT,
> -                                    nentries, 0,
> -                                    msecs_to_jiffies(JOB_TIMEOUT_MS),
> -                                    pfdev->reset.wq,
> -                                    NULL, "pan_js", pfdev->dev);
> +               ret =3D drm_sched_init(&js->queue[j].sched, &args);
>                 if (ret) {
>                         dev_err(pfdev->dev, "Failed to create scheduler: =
%d.", ret);
>                         goto err_sched;
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pant=
hor/panthor_mmu.c
> index 5ce80e2532d5..22b196ff686c 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2278,6 +2278,16 @@ panthor_vm_create(struct panthor_device *ptdev, bo=
ol for_mcu,
>         u64 full_va_range =3D 1ull << va_bits;
>         struct drm_gem_object *dummy_gem;
>         struct drm_gpu_scheduler *sched;
> +       const struct drm_sched_init_args sched_args =3D {
> +               .ops =3D &panthor_vm_bind_ops,
> +               .submit_wq =3D ptdev->mmu->vm.wq,
> +               .num_rqs =3D 1,
> +               .credit_limit =3D 1,
> +               /* Bind operations are synchronous for now, no timeout ne=
eded. */
> +               .timeout =3D MAX_SCHEDULE_TIMEOUT,
> +               .name =3D "panthor-vm-bind",
> +               .dev =3D ptdev->base.dev
> +       };
>         struct io_pgtable_cfg pgtbl_cfg;
>         u64 mair, min_va, va_range;
>         struct panthor_vm *vm;
> @@ -2335,11 +2345,7 @@ panthor_vm_create(struct panthor_device *ptdev, bo=
ol for_mcu,
>                 goto err_mm_takedown;
>         }
>
> -       /* Bind operations are synchronous for now, no timeout needed. */
> -       ret =3D drm_sched_init(&vm->sched, &panthor_vm_bind_ops, ptdev->m=
mu->vm.wq,
> -                            1, 1, 0,
> -                            MAX_SCHEDULE_TIMEOUT, NULL, NULL,
> -                            "panthor-vm-bind", ptdev->base.dev);
> +       ret =3D drm_sched_init(&vm->sched, &sched_args);
>         if (ret)
>                 goto err_free_io_pgtable;
>
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index 5844a7f639e0..44713cfdcd74 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3284,6 +3284,22 @@ static struct panthor_queue *
>  group_create_queue(struct panthor_group *group,
>                    const struct drm_panthor_queue_create *args)
>  {
> +       const struct drm_sched_init_args sched_args =3D {
> +               .ops =3D &panthor_queue_sched_ops,
> +               .submit_wq =3D group->ptdev->scheduler->wq,
> +               .num_rqs =3D 1,
> +               /*
> +                * The credit limit argument tells us the total number of
> +                * instructions across all CS slots in the ringbuffer, wi=
th
> +                * some jobs requiring twice as many as others, depending=
 on
> +                * their profiling status.
> +                */
> +               .credit_limit =3D args->ringbuf_size / sizeof(u64),
> +               .timeout =3D msecs_to_jiffies(JOB_TIMEOUT_MS),
> +               .timeout_wq =3D group->ptdev->reset.wq,
> +               .name =3D "panthor-queue",
> +               .dev =3D group->ptdev->base.dev
> +       };
>         struct drm_gpu_scheduler *drm_sched;
>         struct panthor_queue *queue;
>         int ret;
> @@ -3354,17 +3370,8 @@ group_create_queue(struct panthor_group *group,
>         if (ret)
>                 goto err_free_queue;
>
> -       /*
> -        * Credit limit argument tells us the total number of instruction=
s
> -        * across all CS slots in the ringbuffer, with some jobs requirin=
g
> -        * twice as many as others, depending on their profiling status.
> -        */
> -       ret =3D drm_sched_init(&queue->scheduler, &panthor_queue_sched_op=
s,
> -                            group->ptdev->scheduler->wq, 1,
> -                            args->ringbuf_size / sizeof(u64),
> -                            0, msecs_to_jiffies(JOB_TIMEOUT_MS),
> -                            group->ptdev->reset.wq,
> -                            NULL, "panthor-queue", group->ptdev->base.de=
v);
> +
> +       ret =3D drm_sched_init(&queue->scheduler, &sched_args);
>         if (ret)
>                 goto err_free_queue;
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index a48be16ab84f..6295b2654a7c 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1244,40 +1244,24 @@ static void drm_sched_run_job_work(struct work_st=
ruct *w)
>   * drm_sched_init - Init a gpu scheduler instance
>   *
>   * @sched: scheduler instance
> - * @ops: backend operations for this scheduler
> - * @submit_wq: workqueue to use for submission. If NULL, an ordered wq i=
s
> - *            allocated and used
> - * @num_rqs: number of runqueues, one for each priority, up to DRM_SCHED=
_PRIORITY_COUNT
> - * @credit_limit: the number of credits this scheduler can hold from all=
 jobs
> - * @hang_limit: number of times to allow a job to hang before dropping i=
t
> - * @timeout: timeout value in jiffies for the scheduler
> - * @timeout_wq: workqueue to use for timeout work. If NULL, the system_w=
q is
> - *             used
> - * @score: optional score atomic shared with other schedulers
> - * @name: name used for debugging
> - * @dev: target &struct device
> + * @args: scheduler initialization arguments
>   *
>   * Return 0 on success, otherwise error code.
>   */
> -int drm_sched_init(struct drm_gpu_scheduler *sched,
> -                  const struct drm_sched_backend_ops *ops,
> -                  struct workqueue_struct *submit_wq,
> -                  u32 num_rqs, u32 credit_limit, unsigned int hang_limit=
,
> -                  long timeout, struct workqueue_struct *timeout_wq,
> -                  atomic_t *score, const char *name, struct device *dev)
> +int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sch=
ed_init_args *args)
>  {
>         int i;
>
> -       sched->ops =3D ops;
> -       sched->credit_limit =3D credit_limit;
> -       sched->name =3D name;
> -       sched->timeout =3D timeout;
> -       sched->timeout_wq =3D timeout_wq ? : system_wq;
> -       sched->hang_limit =3D hang_limit;
> -       sched->score =3D score ? score : &sched->_score;
> -       sched->dev =3D dev;
> +       sched->ops =3D args->ops;
> +       sched->credit_limit =3D args->credit_limit;
> +       sched->name =3D args->name;
> +       sched->timeout =3D args->timeout;
> +       sched->timeout_wq =3D args->timeout_wq ? : system_wq;
> +       sched->hang_limit =3D args->hang_limit;
> +       sched->score =3D args->score ? args->score : &sched->_score;
> +       sched->dev =3D args->dev;
>
> -       if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> +       if (args->num_rqs > DRM_SCHED_PRIORITY_COUNT) {
>                 /* This is a gross violation--tell drivers what the  prob=
lem is.
>                  */
>                 drm_err(sched, "%s: num_rqs cannot be greater than DRM_SC=
HED_PRIORITY_COUNT\n",
> @@ -1292,16 +1276,16 @@ int drm_sched_init(struct drm_gpu_scheduler *sche=
d,
>                 return 0;
>         }
>
> -       if (submit_wq) {
> -               sched->submit_wq =3D submit_wq;
> +       if (args->submit_wq) {
> +               sched->submit_wq =3D args->submit_wq;
>                 sched->own_submit_wq =3D false;
>         } else {
>  #ifdef CONFIG_LOCKDEP
> -               sched->submit_wq =3D alloc_ordered_workqueue_lockdep_map(=
name,
> +               sched->submit_wq =3D alloc_ordered_workqueue_lockdep_map(=
args->name,
>                                                                        WQ=
_MEM_RECLAIM,
>                                                                        &d=
rm_sched_lockdep_map);
>  #else
> -               sched->submit_wq =3D alloc_ordered_workqueue(name, WQ_MEM=
_RECLAIM);
> +               sched->submit_wq =3D alloc_ordered_workqueue(args->name, =
WQ_MEM_RECLAIM);
>  #endif
>                 if (!sched->submit_wq)
>                         return -ENOMEM;
> @@ -1309,11 +1293,11 @@ int drm_sched_init(struct drm_gpu_scheduler *sche=
d,
>                 sched->own_submit_wq =3D true;
>         }
>
> -       sched->sched_rq =3D kmalloc_array(num_rqs, sizeof(*sched->sched_r=
q),
> +       sched->sched_rq =3D kmalloc_array(args->num_rqs, sizeof(*sched->s=
ched_rq),
>                                         GFP_KERNEL | __GFP_ZERO);
>         if (!sched->sched_rq)
>                 goto Out_check_own;
> -       sched->num_rqs =3D num_rqs;
> +       sched->num_rqs =3D args->num_rqs;
>         for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>                 sched->sched_rq[i] =3D kzalloc(sizeof(*sched->sched_rq[i]=
), GFP_KERNEL);
>                 if (!sched->sched_rq[i])
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sc=
hed.c
> index 961465128d80..dfccb4cda3a1 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -820,67 +820,57 @@ static const struct drm_sched_backend_ops v3d_cpu_s=
ched_ops =3D {
>         .free_job =3D v3d_cpu_job_free
>  };
>
> +/*
> + * v3d's scheduler instances are all identical, except for ops and name.
> + */
> +static int
> +v3d_queue_sched_init(struct v3d_dev *v3d, const struct drm_sched_backend=
_ops *ops,
> +                    enum v3d_queue queue, const char *name)
> +{
> +       struct drm_sched_init_args args =3D {
> +               .num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> +               .credit_limit =3D 1,
> +               .timeout =3D msecs_to_jiffies(500),
> +               .dev =3D v3d->drm.dev
> +       };
> +
> +       args.ops =3D ops;
> +       args.name =3D name;
> +
> +       return drm_sched_init(&v3d->queue[queue].sched, &args);
> +}
> +
>  int
>  v3d_sched_init(struct v3d_dev *v3d)
>  {
> -       int hw_jobs_limit =3D 1;
> -       int job_hang_limit =3D 0;
> -       int hang_limit_ms =3D 500;
>         int ret;
>
> -       ret =3D drm_sched_init(&v3d->queue[V3D_BIN].sched,
> -                            &v3d_bin_sched_ops, NULL,
> -                            DRM_SCHED_PRIORITY_COUNT,
> -                            hw_jobs_limit, job_hang_limit,
> -                            msecs_to_jiffies(hang_limit_ms), NULL,
> -                            NULL, "v3d_bin", v3d->drm.dev);
> +       ret =3D v3d_queue_sched_init(v3d, &v3d_bin_sched_ops, V3D_BIN, "v=
3d_bin");
>         if (ret)
>                 return ret;
>
> -       ret =3D drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> -                            &v3d_render_sched_ops, NULL,
> -                            DRM_SCHED_PRIORITY_COUNT,
> -                            hw_jobs_limit, job_hang_limit,
> -                            msecs_to_jiffies(hang_limit_ms), NULL,
> -                            NULL, "v3d_render", v3d->drm.dev);
> +       ret =3D v3d_queue_sched_init(v3d, &v3d_render_sched_ops, V3D_REND=
ER,
> +                                  "v3d_render");
>         if (ret)
>                 goto fail;
>
> -       ret =3D drm_sched_init(&v3d->queue[V3D_TFU].sched,
> -                            &v3d_tfu_sched_ops, NULL,
> -                            DRM_SCHED_PRIORITY_COUNT,
> -                            hw_jobs_limit, job_hang_limit,
> -                            msecs_to_jiffies(hang_limit_ms), NULL,
> -                            NULL, "v3d_tfu", v3d->drm.dev);
> +       ret =3D v3d_queue_sched_init(v3d, &v3d_tfu_sched_ops, V3D_TFU, "v=
3d_tfu");
>         if (ret)
>                 goto fail;
>
>         if (v3d_has_csd(v3d)) {
> -               ret =3D drm_sched_init(&v3d->queue[V3D_CSD].sched,
> -                                    &v3d_csd_sched_ops, NULL,
> -                                    DRM_SCHED_PRIORITY_COUNT,
> -                                    hw_jobs_limit, job_hang_limit,
> -                                    msecs_to_jiffies(hang_limit_ms), NUL=
L,
> -                                    NULL, "v3d_csd", v3d->drm.dev);
> +               ret =3D v3d_queue_sched_init(v3d, &v3d_csd_sched_ops, V3D=
_CSD,
> +                                          "v3d_csd");
>                 if (ret)
>                         goto fail;
>
> -               ret =3D drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched=
,
> -                                    &v3d_cache_clean_sched_ops, NULL,
> -                                    DRM_SCHED_PRIORITY_COUNT,
> -                                    hw_jobs_limit, job_hang_limit,
> -                                    msecs_to_jiffies(hang_limit_ms), NUL=
L,
> -                                    NULL, "v3d_cache_clean", v3d->drm.de=
v);
> +               ret =3D v3d_queue_sched_init(v3d, &v3d_cache_clean_sched_=
ops,
> +                                          V3D_CACHE_CLEAN, "v3d_cache_cl=
ean");
>                 if (ret)
>                         goto fail;
>         }
>
> -       ret =3D drm_sched_init(&v3d->queue[V3D_CPU].sched,
> -                            &v3d_cpu_sched_ops, NULL,
> -                            DRM_SCHED_PRIORITY_COUNT,
> -                            1, job_hang_limit,
> -                            msecs_to_jiffies(hang_limit_ms), NULL,
> -                            NULL, "v3d_cpu", v3d->drm.dev);
> +       ret =3D v3d_queue_sched_init(v3d, &v3d_cpu_sched_ops, V3D_CPU, "v=
3d_cpu");
>         if (ret)
>                 goto fail;
>
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_exe=
clist.c
> index a8c416a48812..db1c52dcf1a6 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -332,6 +332,15 @@ static const struct drm_sched_backend_ops drm_sched_=
ops =3D {
>  static int execlist_exec_queue_init(struct xe_exec_queue *q)
>  {
>         struct drm_gpu_scheduler *sched;
> +       const struct drm_sched_init_args args =3D {
> +               .ops =3D &drm_sched_ops,
> +               .num_rqs =3D 1,
> +               .credit_limit =3D q->lrc[0]->ring.size / MAX_JOB_SIZE_BYT=
ES,
> +               .hang_limit =3D XE_SCHED_HANG_LIMIT,
> +               .timeout =3D XE_SCHED_JOB_TIMEOUT,
> +               .name =3D q->hwe->name,
> +               .dev =3D gt_to_xe(q->gt)->drm.dev
> +       };
>         struct xe_execlist_exec_queue *exl;
>         struct xe_device *xe =3D gt_to_xe(q->gt);
>         int err;
> @@ -346,11 +355,8 @@ static int execlist_exec_queue_init(struct xe_exec_q=
ueue *q)
>
>         exl->q =3D q;
>
> -       err =3D drm_sched_init(&exl->sched, &drm_sched_ops, NULL, 1,
> -                            q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES,
> -                            XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
> -                            NULL, NULL, q->hwe->name,
> -                            gt_to_xe(q->gt)->drm.dev);
> +
> +       err =3D drm_sched_init(&exl->sched, &args);
>         if (err)
>                 goto err_free;
>
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/x=
e_gpu_scheduler.c
> index 50361b4638f9..be95f4cca007 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -63,13 +63,24 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
>                   atomic_t *score, const char *name,
>                   struct device *dev)
>  {
> +       const struct drm_sched_init_args args =3D {
> +               .ops =3D ops,
> +               .submit_wq =3D submit_wq,
> +               .num_rqs =3D 1,
> +               .credit_limit =3D hw_submission,
> +               .hang_limit =3D hang_limit,
> +               .timeout =3D timeout,
> +               .timeout_wq =3D timeout_wq,
> +               .score =3D score,
> +               .name =3D name,
> +               .dev =3D dev
> +       };
> +
>         sched->ops =3D xe_ops;
>         INIT_LIST_HEAD(&sched->msgs);
>         INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
>
> -       return drm_sched_init(&sched->base, ops, submit_wq, 1, hw_submiss=
ion,
> -                             hang_limit, timeout, timeout_wq, score, nam=
e,
> -                             dev);
> +       return drm_sched_init(&sched->base, &args);
>  }
>
>  void xe_sched_fini(struct xe_gpu_scheduler *sched)
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index a0ff08123f07..f0f5435598a8 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -540,12 +540,39 @@ struct drm_gpu_scheduler {
>         struct device                   *dev;
>  };
>
> +/**
> + * struct drm_sched_init_args - parameters for initializing a DRM GPU sc=
heduler
> + *
> + * @ops: backend operations provided by the driver
> + * @submit_wq: workqueue to use for submission. May be NULL.
> + *     If NULL, an ordered wq is allocated and used.
> + * @num_rqs: Number of run-queues. This may be at most DRM_SCHED_PRIORIT=
Y_COUNT,
> + *     as there's usually one run-queue per priority, but may be less.
> + * @credit_limit: the number of credits this scheduler can hold from all=
 jobs
> + * @hang_limit: number of times to allow a job to hang before dropping i=
t.
> + *     This mechanism is DEPRECATED. Set it to 0.
> + * @timeout: timeout value in jiffies for the scheduler
> + * @timeout_wq: workqueue to use for timeout work. May be NULL.
> + *     If NULL, the system_wq is used.
> + * @score: score atomic shared with other schedulers. May be NULL.
> + * @name: name used for debugging
> + * @dev: associated device. Used for debugging
> + */
> +struct drm_sched_init_args {
> +       const struct drm_sched_backend_ops *ops;
> +       struct workqueue_struct *submit_wq;
> +       struct workqueue_struct *timeout_wq;
> +       u32 num_rqs;
> +       u32 credit_limit;
> +       unsigned int hang_limit;
> +       long timeout;
> +       atomic_t *score;
> +       const char *name;
> +       struct device *dev;
> +};
> +
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
> -                  const struct drm_sched_backend_ops *ops,
> -                  struct workqueue_struct *submit_wq,
> -                  u32 num_rqs, u32 credit_limit, unsigned int hang_limit=
,
> -                  long timeout, struct workqueue_struct *timeout_wq,
> -                  atomic_t *score, const char *name, struct device *dev)=
;
> +               const struct drm_sched_init_args *args);
>
>  void drm_sched_fini(struct drm_gpu_scheduler *sched);
>  int drm_sched_job_init(struct drm_sched_job *job,
> --
> 2.47.1
>


--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
