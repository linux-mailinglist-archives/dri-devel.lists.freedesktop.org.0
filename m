Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BBC941183
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 14:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9FF10E513;
	Tue, 30 Jul 2024 12:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TZxKxbYw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9384810E50E;
 Tue, 30 Jul 2024 12:06:13 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4281d812d3eso21496595e9.3; 
 Tue, 30 Jul 2024 05:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722341172; x=1722945972; darn=lists.freedesktop.org;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0+PPI5ptX56UXylCNOliKrFQrzFsNcDbw4iztpvTBU0=;
 b=TZxKxbYw3InSWLkyY58Dv6PDOL9lXB3gEQJgzIng12NcpXJ3DpMsVKZ/VjqDam39Pu
 CZKVfk4ampuCcTg9v1YB14EqEFKQ4xmJ7LUy/uBS+L/B2KUkYDv7EdOy8qv5PT8AzNxY
 7YwFhe4I8mfatYdX4IENg613SIbCwQwlnkUE+Rk2wEKxUez+5mHBPFd/Z58AhBRPsi2X
 MDQxUV6KZxZC1rxi3o7lrCq89s14dx3oc1gc9PoK7KtJThkYU0/B3xzzKfqxXE4pB0Iz
 3hQixFNGmate/8l1sOi5BSVh/Mlz2X7jNpppo7zzk5fNGixUiwJ/UA3kCPzer3+m85Xq
 xVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722341172; x=1722945972;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0+PPI5ptX56UXylCNOliKrFQrzFsNcDbw4iztpvTBU0=;
 b=pG7hiBYs2N5QmimmvTA1unRii7CdX3wXwY3/fhh5c4Dyjva2CSAiBLOc2p4CLu1Wdy
 ptv5kQT9Dh5L9AeZh6hUPPXP1a7B4HRzM8Ysvb5HJO9INrsIKfWQlIvJO1Zfn+VlZRq1
 g1wDPkyO+co9YB4+Kl6n0AG7DjViJjSJHnvqa7IgMCEGrGNO41Ix6Vf8p2q8c6kEbNaO
 Im3UgHUtBmj0CJuD/ATv1FcEkHHtnKo2lo0r66WO5ZmikTwuzXvnWzFkdNmORXwOpIZ7
 1C2QyRBu9USNCcCFgsPvfxGGdv91rBs6dAkFn612LSY6693vbhZpambuqRKBkayKqG2N
 JXpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAAu5LX2n15LfrVth1irQaE1sxfuLRDPo3YeVU/x5yTaE6qyt6hwNUdpBDTlL7T+C+xj74/SLN4wzyt9fEPn24h/L+iSeZf+YII04Ihkvd
X-Gm-Message-State: AOJu0Yz56i9JODYEnNBdxH2g+Lg7kR/2XMO364Wo/1WGq6uQ5esZpFxI
 hH7Wz5q38aUWZAYVMGkaU2Hwou7N7nSljuv3m2g+GkFYHOuz8AbAnXdizlVj
X-Google-Smtp-Source: AGHT+IF9n6J/L08GXQXHj2DAjU8ppmP862nDVWOi4BM47ogW0wPGeMuFXJylfVAycRqqZgC27nsK+A==
X-Received: by 2002:a05:600c:4f16:b0:426:5d4d:d759 with SMTP id
 5b1f17b1804b1-42811dd43d4mr91251995e9.24.1722341171109; 
 Tue, 30 Jul 2024 05:06:11 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367fd071sm14588556f8f.62.2024.07.30.05.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 05:06:10 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------H0bsIBiCPahh7Kb3cWpLDiPI"
Message-ID: <134cd07f-cdaa-426a-9184-e40c31fd6558@gmail.com>
Date: Tue, 30 Jul 2024 14:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: add optional errno to drm_sched_start()
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, jesse.zhang@amd.com, vitaly.prosyak@amd.com
References: <20240726075550.1511-1-christian.koenig@amd.com>
 <ZqOw8URrWjr9RN7A@phenom.ffwll.local>
 <5c634b9f-5b93-4faa-b939-a370ba0d41fd@gmail.com>
 <ZqimKxfJ947B3tZR@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ZqimKxfJ947B3tZR@phenom.ffwll.local>
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

This is a multi-part message in MIME format.
--------------H0bsIBiCPahh7Kb3cWpLDiPI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 30.07.24 um 10:36 schrieb Daniel Vetter:
>> In the end you have a really nice circle dependency.
> Maybe a follow up, so for arb robustness or vk context where we want the
> context to die and refuse to accept any more jobs: We can get at that
> error somehow? I think that's really the only worry I have with a job
> error approach for all this ...

See drm_sched_entity_error(). The idea is that the driver uses this 
function in two ways:

1. In it's prepare callback so that when one submission fails all 
following from the same ctx are marked with an error number as well.

This is intentionally done in a driver callback so that driver decides 
if they want subsequent submissions to fail or not. That can be helpful 
for example for in kernel paging queues where submissions don't depend 
on each other and a failed submission shouldn't cancel all following.

For an example see amdgpu_job_prepare_job().

2. In it's submission IOCTL to reject new submissions and inform 
userspace that it needs to kick of some error handling.

Cheers,
Christian.

>
>>> If we really want to stuff this into per-job fences then I think we should
>>> at least try to document this mess in the sync_file uapi, for a bit of
>>> consistency.
>> Good point. Going to add some documentation.
> Sounds good.
>
> Cheers, Sima
>
>> Regards,
>> Christian.
>>
>>> But yeah without the full picture no idea really what we want here.
>>> -Sima
>>>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c | 2 +-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c          | 4 ++--
>>>>    drivers/gpu/drm/etnaviv/etnaviv_sched.c             | 4 ++--
>>>>    drivers/gpu/drm/imagination/pvr_queue.c             | 4 ++--
>>>>    drivers/gpu/drm/lima/lima_sched.c                   | 2 +-
>>>>    drivers/gpu/drm/nouveau/nouveau_sched.c             | 2 +-
>>>>    drivers/gpu/drm/panfrost/panfrost_job.c             | 2 +-
>>>>    drivers/gpu/drm/panthor/panthor_mmu.c               | 2 +-
>>>>    drivers/gpu/drm/scheduler/sched_main.c              | 7 ++++---
>>>>    drivers/gpu/drm/v3d/v3d_sched.c                     | 2 +-
>>>>    include/drm/gpu_scheduler.h                         | 2 +-
>>>>    11 files changed, 17 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
>>>> index 2320df51c914..18135d8235f9 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
>>>> @@ -300,7 +300,7 @@ static int suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool sus
>>>>    			if (r)
>>>>    				goto out;
>>>>    		} else {
>>>> -			drm_sched_start(&ring->sched);
>>>> +			drm_sched_start(&ring->sched, 0);
>>>>    		}
>>>>    	}
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> index c186fdb198ad..861827deb03f 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -5862,7 +5862,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>>>    			if (!amdgpu_ring_sched_ready(ring))
>>>>    				continue;
>>>> -			drm_sched_start(&ring->sched);
>>>> +			drm_sched_start(&ring->sched, 0);
>>>>    		}
>>>>    		if (!drm_drv_uses_atomic_modeset(adev_to_drm(tmp_adev)) && !job_signaled)
>>>> @@ -6360,7 +6360,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
>>>>    		if (!amdgpu_ring_sched_ready(ring))
>>>>    			continue;
>>>> -		drm_sched_start(&ring->sched);
>>>> +		drm_sched_start(&ring->sched, 0);
>>>>    	}
>>>>    	amdgpu_device_unset_mp1_state(adev);
>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>> index c53641aa146f..2c8666f8ec4a 100644
>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>> @@ -72,12 +72,12 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
>>>>    	drm_sched_resubmit_jobs(&gpu->sched);
>>>> -	drm_sched_start(&gpu->sched);
>>>> +	drm_sched_start(&gpu->sched, 0);
>>>>    	return DRM_GPU_SCHED_STAT_NOMINAL;
>>>>    out_no_timeout:
>>>>    	/* restart scheduler after GPU is usable again */
>>>> -	drm_sched_start(&gpu->sched);
>>>> +	drm_sched_start(&gpu->sched, 0);
>>>>    	return DRM_GPU_SCHED_STAT_NOMINAL;
>>>>    }
>>>> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
>>>> index 20cb46012082..c4f08432882b 100644
>>>> --- a/drivers/gpu/drm/imagination/pvr_queue.c
>>>> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
>>>> @@ -782,7 +782,7 @@ static void pvr_queue_start(struct pvr_queue *queue)
>>>>    		}
>>>>    	}
>>>> -	drm_sched_start(&queue->scheduler);
>>>> +	drm_sched_start(&queue->scheduler, 0);
>>>>    }
>>>>    /**
>>>> @@ -842,7 +842,7 @@ pvr_queue_timedout_job(struct drm_sched_job *s_job)
>>>>    	}
>>>>    	mutex_unlock(&pvr_dev->queues.lock);
>>>> -	drm_sched_start(sched);
>>>> +	drm_sched_start(sched, 0);
>>>>    	return DRM_GPU_SCHED_STAT_NOMINAL;
>>>>    }
>>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>>>> index 1a944edb6ddc..b40c90e97d7e 100644
>>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>>> @@ -463,7 +463,7 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
>>>>    	lima_pm_idle(ldev);
>>>>    	drm_sched_resubmit_jobs(&pipe->base);
>>>> -	drm_sched_start(&pipe->base);
>>>> +	drm_sched_start(&pipe->base, 0);
>>>>    	return DRM_GPU_SCHED_STAT_NOMINAL;
>>>>    }
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>> index eb6c3f9a01f5..4412f2711fb5 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>> @@ -379,7 +379,7 @@ nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
>>>>    	else
>>>>    		NV_PRINTK(warn, job->cli, "Generic job timeout.\n");
>>>> -	drm_sched_start(sched);
>>>> +	drm_sched_start(sched, 0);
>>>>    	return stat;
>>>>    }
>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>> index df49d37d0e7e..d140800606bf 100644
>>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>> @@ -727,7 +727,7 @@ panfrost_reset(struct panfrost_device *pfdev,
>>>>    	/* Restart the schedulers */
>>>>    	for (i = 0; i < NUM_JOB_SLOTS; i++)
>>>> -		drm_sched_start(&pfdev->js->queue[i].sched);
>>>> +		drm_sched_start(&pfdev->js->queue[i].sched, 0);
>>>>    	/* Re-enable job interrupts now that everything has been restarted. */
>>>>    	job_write(pfdev, JOB_INT_MASK,
>>>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
>>>> index d47972806d50..e630cdf47f99 100644
>>>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>>>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>>>> @@ -827,7 +827,7 @@ static void panthor_vm_stop(struct panthor_vm *vm)
>>>>    static void panthor_vm_start(struct panthor_vm *vm)
>>>>    {
>>>> -	drm_sched_start(&vm->sched);
>>>> +	drm_sched_start(&vm->sched, 0);
>>>>    }
>>>>    /**
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index ab53ab486fe6..f093616fe53c 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -674,9 +674,10 @@ EXPORT_SYMBOL(drm_sched_stop);
>>>>     * drm_sched_start - recover jobs after a reset
>>>>     *
>>>>     * @sched: scheduler instance
>>>> + * @errno: error to set on the pending fences
>>>>     *
>>>>     */
>>>> -void drm_sched_start(struct drm_gpu_scheduler *sched)
>>>> +void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
>>>>    {
>>>>    	struct drm_sched_job *s_job, *tmp;
>>>> @@ -691,13 +692,13 @@ void drm_sched_start(struct drm_gpu_scheduler *sched)
>>>>    		atomic_add(s_job->credits, &sched->credit_count);
>>>>    		if (!fence) {
>>>> -			drm_sched_job_done(s_job, -ECANCELED);
>>>> +			drm_sched_job_done(s_job, errno ?: -ECANCELED);
>>>>    			continue;
>>>>    		}
>>>>    		if (dma_fence_add_callback(fence, &s_job->cb,
>>>>    					   drm_sched_job_done_cb))
>>>> -			drm_sched_job_done(s_job, fence->error);
>>>> +			drm_sched_job_done(s_job, fence->error ?: errno);
>>>>    	}
>>>>    	drm_sched_start_timeout_unlocked(sched);
>>>> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
>>>> index 42d4f4a2dba2..cac02284cd19 100644
>>>> --- a/drivers/gpu/drm/v3d/v3d_sched.c
>>>> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
>>>> @@ -653,7 +653,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
>>>>    	/* Unblock schedulers and restart their jobs. */
>>>>    	for (q = 0; q < V3D_MAX_QUEUES; q++) {
>>>> -		drm_sched_start(&v3d->queue[q].sched);
>>>> +		drm_sched_start(&v3d->queue[q].sched, 0);
>>>>    	}
>>>>    	mutex_unlock(&v3d->reset_lock);
>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>> index fe8edb917360..a8d19b10f9b8 100644
>>>> --- a/include/drm/gpu_scheduler.h
>>>> +++ b/include/drm/gpu_scheduler.h
>>>> @@ -579,7 +579,7 @@ bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
>>>>    void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
>>>>    void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
>>>>    void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
>>>> -void drm_sched_start(struct drm_gpu_scheduler *sched);
>>>> +void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);
>>>>    void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
>>>>    void drm_sched_increase_karma(struct drm_sched_job *bad);
>>>>    void drm_sched_reset_karma(struct drm_sched_job *bad);
>>>> -- 
>>>> 2.34.1
>>>>

--------------H0bsIBiCPahh7Kb3cWpLDiPI
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Am 30.07.24 um 10:36 schrieb Daniel Vetter:<br>
    <blockquote type="cite"
      cite="mid:ZqimKxfJ947B3tZR@phenom.ffwll.local"><span
      style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">In the end you have a really nice circle dependency.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Maybe a follow up, so for arb robustness or vk context where we want the
context to die and refuse to accept any more jobs: We can get at that
error somehow? I think that's really the only worry I have with a job
error approach for all this ...</pre>
    </blockquote>
    <br>
    See drm_sched_entity_error(). The idea is that the driver uses this
    function in two ways:<br>
    <br>
    1. In it's prepare callback so that when one submission fails all
    following from the same ctx are marked with an error number as well.<br>
    <br>
    This is intentionally done in a driver callback so that driver
    decides if they want subsequent submissions to fail or not. That can
    be helpful for example for in kernel paging queues where submissions
    don't depend on each other and a failed submission shouldn't cancel
    all following.<br>
    <br>
    For an example see amdgpu_job_prepare_job().<br>
    <br>
    2. In it's submission IOCTL to reject new submissions and inform
    userspace that it needs to kick of some error handling.<br>
    <br>
    Cheers,<br>
    Christian.<br>
    <br>
    <blockquote type="cite"
      cite="mid:ZqimKxfJ947B3tZR@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">If we really want to stuff this into per-job fences then I think we should
at least try to document this mess in the sync_file uapi, for a bit of
consistency.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Good point. Going to add some documentation.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Sounds good.

Cheers, Sima

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
But yeah without the full picture no idea really what we want here.
-Sima

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">---
  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c | 2 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c          | 4 ++--
  drivers/gpu/drm/etnaviv/etnaviv_sched.c             | 4 ++--
  drivers/gpu/drm/imagination/pvr_queue.c             | 4 ++--
  drivers/gpu/drm/lima/lima_sched.c                   | 2 +-
  drivers/gpu/drm/nouveau/nouveau_sched.c             | 2 +-
  drivers/gpu/drm/panfrost/panfrost_job.c             | 2 +-
  drivers/gpu/drm/panthor/panthor_mmu.c               | 2 +-
  drivers/gpu/drm/scheduler/sched_main.c              | 7 ++++---
  drivers/gpu/drm/v3d/v3d_sched.c                     | 2 +-
  include/drm/gpu_scheduler.h                         | 2 +-
  11 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index 2320df51c914..18135d8235f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -300,7 +300,7 @@ static int suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool sus
  			if (r)
  				goto out;
  		} else {
-			drm_sched_start(&amp;ring-&gt;sched);
+			drm_sched_start(&amp;ring-&gt;sched, 0);
  		}
  	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index c186fdb198ad..861827deb03f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5862,7 +5862,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
  			if (!amdgpu_ring_sched_ready(ring))
  				continue;
-			drm_sched_start(&amp;ring-&gt;sched);
+			drm_sched_start(&amp;ring-&gt;sched, 0);
  		}
  		if (!drm_drv_uses_atomic_modeset(adev_to_drm(tmp_adev)) &amp;&amp; !job_signaled)
@@ -6360,7 +6360,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
  		if (!amdgpu_ring_sched_ready(ring))
  			continue;
-		drm_sched_start(&amp;ring-&gt;sched);
+		drm_sched_start(&amp;ring-&gt;sched, 0);
  	}
  	amdgpu_device_unset_mp1_state(adev);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index c53641aa146f..2c8666f8ec4a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -72,12 +72,12 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
  	drm_sched_resubmit_jobs(&amp;gpu-&gt;sched);
-	drm_sched_start(&amp;gpu-&gt;sched);
+	drm_sched_start(&amp;gpu-&gt;sched, 0);
  	return DRM_GPU_SCHED_STAT_NOMINAL;
  out_no_timeout:
  	/* restart scheduler after GPU is usable again */
-	drm_sched_start(&amp;gpu-&gt;sched);
+	drm_sched_start(&amp;gpu-&gt;sched, 0);
  	return DRM_GPU_SCHED_STAT_NOMINAL;
  }
diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index 20cb46012082..c4f08432882b 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -782,7 +782,7 @@ static void pvr_queue_start(struct pvr_queue *queue)
  		}
  	}
-	drm_sched_start(&amp;queue-&gt;scheduler);
+	drm_sched_start(&amp;queue-&gt;scheduler, 0);
  }
  /**
@@ -842,7 +842,7 @@ pvr_queue_timedout_job(struct drm_sched_job *s_job)
  	}
  	mutex_unlock(&amp;pvr_dev-&gt;queues.lock);
-	drm_sched_start(sched);
+	drm_sched_start(sched, 0);
  	return DRM_GPU_SCHED_STAT_NOMINAL;
  }
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 1a944edb6ddc..b40c90e97d7e 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -463,7 +463,7 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
  	lima_pm_idle(ldev);
  	drm_sched_resubmit_jobs(&amp;pipe-&gt;base);
-	drm_sched_start(&amp;pipe-&gt;base);
+	drm_sched_start(&amp;pipe-&gt;base, 0);
  	return DRM_GPU_SCHED_STAT_NOMINAL;
  }
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index eb6c3f9a01f5..4412f2711fb5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -379,7 +379,7 @@ nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
  	else
  		NV_PRINTK(warn, job-&gt;cli, "Generic job timeout.\n");
-	drm_sched_start(sched);
+	drm_sched_start(sched, 0);
  	return stat;
  }
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index df49d37d0e7e..d140800606bf 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -727,7 +727,7 @@ panfrost_reset(struct panfrost_device *pfdev,
  	/* Restart the schedulers */
  	for (i = 0; i &lt; NUM_JOB_SLOTS; i++)
-		drm_sched_start(&amp;pfdev-&gt;js-&gt;queue[i].sched);
+		drm_sched_start(&amp;pfdev-&gt;js-&gt;queue[i].sched, 0);
  	/* Re-enable job interrupts now that everything has been restarted. */
  	job_write(pfdev, JOB_INT_MASK,
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index d47972806d50..e630cdf47f99 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -827,7 +827,7 @@ static void panthor_vm_stop(struct panthor_vm *vm)
  static void panthor_vm_start(struct panthor_vm *vm)
  {
-	drm_sched_start(&amp;vm-&gt;sched);
+	drm_sched_start(&amp;vm-&gt;sched, 0);
  }
  /**
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index ab53ab486fe6..f093616fe53c 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -674,9 +674,10 @@ EXPORT_SYMBOL(drm_sched_stop);
   * drm_sched_start - recover jobs after a reset
   *
   * @sched: scheduler instance
+ * @errno: error to set on the pending fences
   *
   */
-void drm_sched_start(struct drm_gpu_scheduler *sched)
+void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
  {
  	struct drm_sched_job *s_job, *tmp;
@@ -691,13 +692,13 @@ void drm_sched_start(struct drm_gpu_scheduler *sched)
  		atomic_add(s_job-&gt;credits, &amp;sched-&gt;credit_count);
  		if (!fence) {
-			drm_sched_job_done(s_job, -ECANCELED);
+			drm_sched_job_done(s_job, errno ?: -ECANCELED);
  			continue;
  		}
  		if (dma_fence_add_callback(fence, &amp;s_job-&gt;cb,
  					   drm_sched_job_done_cb))
-			drm_sched_job_done(s_job, fence-&gt;error);
+			drm_sched_job_done(s_job, fence-&gt;error ?: errno);
  	}
  	drm_sched_start_timeout_unlocked(sched);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 42d4f4a2dba2..cac02284cd19 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -653,7 +653,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
  	/* Unblock schedulers and restart their jobs. */
  	for (q = 0; q &lt; V3D_MAX_QUEUES; q++) {
-		drm_sched_start(&amp;v3d-&gt;queue[q].sched);
+		drm_sched_start(&amp;v3d-&gt;queue[q].sched, 0);
  	}
  	mutex_unlock(&amp;v3d-&gt;reset_lock);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index fe8edb917360..a8d19b10f9b8 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -579,7 +579,7 @@ bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
  void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
  void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
-void drm_sched_start(struct drm_gpu_scheduler *sched);
+void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);
  void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
  void drm_sched_increase_karma(struct drm_sched_job *bad);
  void drm_sched_reset_karma(struct drm_sched_job *bad);
-- 
2.34.1

</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------H0bsIBiCPahh7Kb3cWpLDiPI--
