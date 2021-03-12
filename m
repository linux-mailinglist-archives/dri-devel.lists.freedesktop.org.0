Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3EB338495
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 05:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACEA86F3F3;
	Fri, 12 Mar 2021 04:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257846F3D6;
 Fri, 12 Mar 2021 04:14:06 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 q127-20020a4a33850000b02901b646aa81b1so1232979ooq.8; 
 Thu, 11 Mar 2021 20:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1sC1c3GM4d4PpjHBCn2pyPX01ML0fns+oICqAl7QWVM=;
 b=iuMyxg0tJD/JfREL9krTDuI+t8+CimaSqUYpw/pA0OS9la4N1QcUfBVSY5PL0V27kw
 j4q6zmwtcOAmTvZGJ5CJZJ9i148LbgUr1//NxFZ93q6k4mVy8JAaAC1FBBhmJ6MbviKe
 O5gi+01jRlgJ53+N+BOm3xjDJCtHlEObkImvCnoabkbH1iLNNafmKkRGWiSHxYt8YseB
 idKEeQr7TUavlWr4dlAxHxJFZyta59bxt8cezqdAGKfouxWobHkufkYyZr0vzkhkRU3H
 sB0E/T+F9CuoiPzNNkj5FnKi6wfIxMjPaYxEiMC9irE5Kapzicz7Z6ROPhWHR5TO4QNW
 dRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1sC1c3GM4d4PpjHBCn2pyPX01ML0fns+oICqAl7QWVM=;
 b=bI0I2bVSgRENm+ExFsOXt1Q1zomb5Y33ij80ZxaSwrbeiSWbMwtOfvggLn9NYTcTx/
 O+NHZ77StbV7LsGuZpqz2EGTGZJ6qBo4fyBu2q3D3WVni62mCjlqDghKGHTM5tEPXQZ2
 87VCtV467elVeTO3B+5OUgbm8if+DSZYHuQzkjovO/1VFj0w4F0SDVJOZlx/6w8PT6YX
 Qx+Of6EOFSmUqiZuhi6EfFibOdEv7bTneN/RUg8nMUSixpFvl5ZWgsaXgdpaLF76/QZC
 0k+Grb09Vwocc/S7KGl08RX9pAZA6eWR9T4od/aqy8H4qYWzefL+3uyMjppcJfwwYfXj
 GSQg==
X-Gm-Message-State: AOAM532H2kxniwM4Vm4mfKEph0U8g5KkkQ451uy5q2SmR6jANxK29QSb
 7gUmqU9lI/KxnwH3htSDikCFe7s3mZ3RNpJ4jFxiTAQ3
X-Google-Smtp-Source: ABdhPJzv6ZSSWudokjUv2m6FCGJn8vJMXPGfPJp8XXy59BPX1CWGzl1GNa14j1X6mXRizdW+5iH46Kv1ScyMx5l4ivQ=
X-Received: by 2002:a4a:9801:: with SMTP id y1mr1817003ooi.90.1615522445429;
 Thu, 11 Mar 2021 20:14:05 -0800 (PST)
MIME-Version: 1.0
References: <20210312035746.1089855-1-Jack.Zhang1@amd.com>
In-Reply-To: <20210312035746.1089855-1-Jack.Zhang1@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 11 Mar 2021 23:13:54 -0500
Message-ID: <CADnq5_N88ahLAz2w=OgFU3vv7zX8uupW+_GzsHcLrqVbPoURUA@mail.gmail.com>
Subject: Re: [PATCH] drm/scheduler re-insert Bailing job to avoid memleak
To: Jack Zhang <Jack.Zhang1@amd.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Cc: "monk.liu" <Monk.Liu@amd.com>, Christian Koenig <Christian.Koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Emily Deng <Emily.Deng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+dri-devel

Please be sure to cc dri-devel when you send out gpu scheduler patches.

On Thu, Mar 11, 2021 at 10:57 PM Jack Zhang <Jack.Zhang1@amd.com> wrote:
>
> re-insert Bailing jobs to avoid memory leak.
>
> Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 +++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 8 ++++++--
>  drivers/gpu/drm/scheduler/sched_main.c     | 8 +++++++-
>  include/drm/gpu_scheduler.h                | 1 +
>  4 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 79b9cc73763f..86463b0f936e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4815,8 +4815,10 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>                                         job ? job->base.id : -1);
>
>                 /* even we skipped this reset, still need to set the job to guilty */
> -               if (job)
> +               if (job) {
>                         drm_sched_increase_karma(&job->base);
> +                       r = DRM_GPU_SCHED_STAT_BAILING;
> +               }
>                 goto skip_recovery;
>         }
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 759b34799221..41390bdacd9e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -34,6 +34,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>         struct amdgpu_job *job = to_amdgpu_job(s_job);
>         struct amdgpu_task_info ti;
>         struct amdgpu_device *adev = ring->adev;
> +       int ret;
>
>         memset(&ti, 0, sizeof(struct amdgpu_task_info));
>
> @@ -52,8 +53,11 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>                   ti.process_name, ti.tgid, ti.task_name, ti.pid);
>
>         if (amdgpu_device_should_recover_gpu(ring->adev)) {
> -               amdgpu_device_gpu_recover(ring->adev, job);
> -               return DRM_GPU_SCHED_STAT_NOMINAL;
> +               ret = amdgpu_device_gpu_recover(ring->adev, job);
> +               if (ret == DRM_GPU_SCHED_STAT_BAILING)
> +                       return DRM_GPU_SCHED_STAT_BAILING;
> +               else
> +                       return DRM_GPU_SCHED_STAT_NOMINAL;
>         } else {
>                 drm_sched_suspend_timeout(&ring->sched);
>                 if (amdgpu_sriov_vf(adev))
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 92d8de24d0a1..a44f621fb5c4 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>  {
>         struct drm_gpu_scheduler *sched;
>         struct drm_sched_job *job;
> +       int ret;
>
>         sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>
> @@ -331,8 +332,13 @@ static void drm_sched_job_timedout(struct work_struct *work)
>                 list_del_init(&job->list);
>                 spin_unlock(&sched->job_list_lock);
>
> -               job->sched->ops->timedout_job(job);
> +               ret = job->sched->ops->timedout_job(job);
>
> +               if (ret == DRM_GPU_SCHED_STAT_BAILING) {
> +                       spin_lock(&sched->job_list_lock);
> +                       list_add(&job->node, &sched->ring_mirror_list);
> +                       spin_unlock(&sched->job_list_lock);
> +               }
>                 /*
>                  * Guilty job did complete and hence needs to be manually removed
>                  * See drm_sched_stop doc.
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 4ea8606d91fe..8093ac2427ef 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -210,6 +210,7 @@ enum drm_gpu_sched_stat {
>         DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
>         DRM_GPU_SCHED_STAT_NOMINAL,
>         DRM_GPU_SCHED_STAT_ENODEV,
> +       DRM_GPU_SCHED_STAT_BAILING,
>  };
>
>  /**
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
