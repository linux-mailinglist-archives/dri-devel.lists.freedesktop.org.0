Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E9B33EAB3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 08:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593BD6E103;
	Wed, 17 Mar 2021 07:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9E789A8B;
 Wed, 17 Mar 2021 07:43:38 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id j3so1013943edp.11;
 Wed, 17 Mar 2021 00:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=hMZ0sTLd+GtZrcVWM9uMcCoDvk0vIa13FCgLGfmne7o=;
 b=F4D2065An/z8HQX8fy+3HCcn7NPj1RfZroiwQP3Stlc+velOjojA+lsYTqdhFvqr+N
 lXX5F6I7XtjXv8nUAEALGo1GA7dSxCV0ikkrs2/PUMeIy/ryCMah048b1bWhgbA6XcZa
 UYW0cr7U+Lr9OeurdG10OrWgI7Ul0rliFvj88Wt/de9U2JW4G82XEJ6ouAjwAGPiBsjG
 BL69iNQWuve8Uz8jiPRWbLb1gcckJCYlK0jlVZ4kcQrff5J0dJVfpOIIZ/eGAG8yd9tn
 WgO+2xi69/vGDgkCElkktEMMThGOKXeoefnWIGUuSGKmLXZaKkSsiZLBlrfmHu40CrH/
 vgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=hMZ0sTLd+GtZrcVWM9uMcCoDvk0vIa13FCgLGfmne7o=;
 b=GCm8xFTTGBwFsP6U2kCY8IoTGw8ISPrzIkkc/PLzyCWDODJEmkUFZOz+TzVVlOMaI2
 gqnM1I0iCPQmFX66vXuMQrKpZuAublVrBwarbmQMukcVAw5fuYZcel37vHJi/yo1qI08
 O+th3VCin51MVfIMQj9eS4JaTKfE/T0DzxegNBh2+YaYeZRdUOb8v8T2BvdUjbkqROxi
 h9cXxpAx5ANHBdf1+gMSYO9V3wCkVP5E8hDFDjTRnSokOG7ybJF6g+DyUY4nzvJSB1vW
 a8F6nVNtMk4d6rcXpC5z+UkcjOo211hHBZzgYX5GovO5NCcDrF+sSCXIJ1XN1SuwVmn9
 qKIA==
X-Gm-Message-State: AOAM530y8MaMdPTiwQvV0Vgs7I+U36W0Y1gK3sFXicYNZsXCkbhzOAoc
 a+S4V4wJbUKggVkQ06mFm4I=
X-Google-Smtp-Source: ABdhPJx34e5gFsdjxsUDrUJFVgj0nf8u9N6aPsHyglVy2AB7ilhLX917KFNNW5wvku3scg9fSiikmg==
X-Received: by 2002:aa7:cf14:: with SMTP id a20mr40356536edy.49.1615967017095; 
 Wed, 17 Mar 2021 00:43:37 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:ccdd:b6ca:11e:5cc5?
 ([2a02:908:1252:fb60:ccdd:b6ca:11e:5cc5])
 by smtp.gmail.com with ESMTPSA id d9sm5991608ejj.5.2021.03.17.00.43.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 00:43:36 -0700 (PDT)
Subject: Re: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak
To: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "Liu, Monk" <Monk.Liu@amd.com>, "Deng, Emily" <Emily.Deng@amd.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>
References: <20210315052036.1113638-1-Jack.Zhang1@amd.com>
 <DM5PR1201MB020453AA9A2A5C5173AF4D84BB6C9@DM5PR1201MB0204.namprd12.prod.outlook.com>
 <DM5PR1201MB020461EEDC275748389BB631BB6B9@DM5PR1201MB0204.namprd12.prod.outlook.com>
 <DM5PR1201MB020459FE1FFA08DD3A32F7B5BB6A9@DM5PR1201MB0204.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9b48b715-52dd-e435-2873-2472427dffda@gmail.com>
Date: Wed, 17 Mar 2021 08:43:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <DM5PR1201MB020459FE1FFA08DD3A32F7B5BB6A9@DM5PR1201MB0204.namprd12.prod.outlook.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I was hoping Andrey would take a look since I'm really busy with other 
work right now.

Regards,
Christian.

Am 17.03.21 um 07:46 schrieb Zhang, Jack (Jian):
> Hi, Andrey/Crhistian and Team,
>
> I didn't receive the reviewer's message from maintainers on panfrost driver for several days.
> Due to this patch is urgent for my current working project.
> Would you please help to give some review ideas?
>
> Many Thanks,
> Jack
> -----Original Message-----
> From: Zhang, Jack (Jian)
> Sent: Tuesday, March 16, 2021 3:20 PM
> To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Liu, Monk <Monk.Liu@amd.com>; Deng, Emily <Emily.Deng@amd.com>; Rob Herring <robh@kernel.org>; Tomeu Vizoso <tomeu.vizoso@collabora.com>; Steven Price <steven.price@arm.com>
> Subject: RE: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak
>
> [AMD Public Use]
>
> Ping
>
> -----Original Message-----
> From: Zhang, Jack (Jian)
> Sent: Monday, March 15, 2021 1:24 PM
> To: Jack Zhang <Jack.Zhang1@amd.com>; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Liu, Monk <Monk.Liu@amd.com>; Deng, Emily <Emily.Deng@amd.com>; Rob Herring <robh@kernel.org>; Tomeu Vizoso <tomeu.vizoso@collabora.com>; Steven Price <steven.price@arm.com>
> Subject: RE: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak
>
> [AMD Public Use]
>
> Hi, Rob/Tomeu/Steven,
>
> Would you please help to review this patch for panfrost driver?
>
> Thanks,
> Jack Zhang
>
> -----Original Message-----
> From: Jack Zhang <Jack.Zhang1@amd.com>
> Sent: Monday, March 15, 2021 1:21 PM
> To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Liu, Monk <Monk.Liu@amd.com>; Deng, Emily <Emily.Deng@amd.com>
> Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com>
> Subject: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak
>
> re-insert Bailing jobs to avoid memory leak.
>
> V2: move re-insert step to drm/scheduler logic
> V3: add panfrost's return value for bailing jobs in case it hits the memleak issue.
>
> Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 +++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 8 ++++++--
>   drivers/gpu/drm/panfrost/panfrost_job.c    | 4 ++--
>   drivers/gpu/drm/scheduler/sched_main.c     | 8 +++++++-
>   include/drm/gpu_scheduler.h                | 1 +
>   5 files changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 79b9cc73763f..86463b0f936e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4815,8 +4815,10 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   					job ? job->base.id : -1);
>   
>   		/* even we skipped this reset, still need to set the job to guilty */
> -		if (job)
> +		if (job) {
>   			drm_sched_increase_karma(&job->base);
> +			r = DRM_GPU_SCHED_STAT_BAILING;
> +		}
>   		goto skip_recovery;
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 759b34799221..41390bdacd9e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -34,6 +34,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>   	struct amdgpu_job *job = to_amdgpu_job(s_job);
>   	struct amdgpu_task_info ti;
>   	struct amdgpu_device *adev = ring->adev;
> +	int ret;
>   
>   	memset(&ti, 0, sizeof(struct amdgpu_task_info));
>   
> @@ -52,8 +53,11 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>   		  ti.process_name, ti.tgid, ti.task_name, ti.pid);
>   
>   	if (amdgpu_device_should_recover_gpu(ring->adev)) {
> -		amdgpu_device_gpu_recover(ring->adev, job);
> -		return DRM_GPU_SCHED_STAT_NOMINAL;
> +		ret = amdgpu_device_gpu_recover(ring->adev, job);
> +		if (ret == DRM_GPU_SCHED_STAT_BAILING)
> +			return DRM_GPU_SCHED_STAT_BAILING;
> +		else
> +			return DRM_GPU_SCHED_STAT_NOMINAL;
>   	} else {
>   		drm_sched_suspend_timeout(&ring->sched);
>   		if (amdgpu_sriov_vf(adev))
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 6003cfeb1322..e2cb4f32dae1 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -444,7 +444,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
>   	 * spurious. Bail out.
>   	 */
>   	if (dma_fence_is_signaled(job->done_fence))
> -		return DRM_GPU_SCHED_STAT_NOMINAL;
> +		return DRM_GPU_SCHED_STAT_BAILING;
>   
>   	dev_err(pfdev->dev, "gpu sched timeout, js=%d, config=0x%x, status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",
>   		js,
> @@ -456,7 +456,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
>   
>   	/* Scheduler is already stopped, nothing to do. */
>   	if (!panfrost_scheduler_stop(&pfdev->js->queue[js], sched_job))
> -		return DRM_GPU_SCHED_STAT_NOMINAL;
> +		return DRM_GPU_SCHED_STAT_BAILING;
>   
>   	/* Schedule a reset if there's no reset in progress. */
>   	if (!atomic_xchg(&pfdev->reset.pending, 1)) diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 92d8de24d0a1..a44f621fb5c4 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)  {
>   	struct drm_gpu_scheduler *sched;
>   	struct drm_sched_job *job;
> +	int ret;
>   
>   	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>   
> @@ -331,8 +332,13 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   		list_del_init(&job->list);
>   		spin_unlock(&sched->job_list_lock);
>   
> -		job->sched->ops->timedout_job(job);
> +		ret = job->sched->ops->timedout_job(job);
>   
> +		if (ret == DRM_GPU_SCHED_STAT_BAILING) {
> +			spin_lock(&sched->job_list_lock);
> +			list_add(&job->node, &sched->ring_mirror_list);
> +			spin_unlock(&sched->job_list_lock);
> +		}
>   		/*
>   		 * Guilty job did complete and hence needs to be manually removed
>   		 * See drm_sched_stop doc.
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h index 4ea8606d91fe..8093ac2427ef 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -210,6 +210,7 @@ enum drm_gpu_sched_stat {
>   	DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
>   	DRM_GPU_SCHED_STAT_NOMINAL,
>   	DRM_GPU_SCHED_STAT_ENODEV,
> +	DRM_GPU_SCHED_STAT_BAILING,
>   };
>   
>   /**
> --
> 2.25.1
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
