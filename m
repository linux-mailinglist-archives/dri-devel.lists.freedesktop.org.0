Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 433E3CB6491
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 16:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B0710E846;
	Thu, 11 Dec 2025 15:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="EMiWuFi6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0674C10E83D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 15:13:36 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-63c489f1e6cso338377a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 07:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1765466014; x=1766070814; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BbT9v83NtGR/hvY9uvwIW4Jp2/W/9ozpkYxE5YX4fBc=;
 b=EMiWuFi6zz5IBHtnvMroWMWAFBSS6ilwauOEIkSUQB180VwCcMjW84va6wqYECWH+e
 d/6LXbwz6oD4fcDOvKr/HkrIO6+6PBK1hif9k1m3R6AxNYajfykztGSgfwlEIHcJTd60
 3lZ3dlyfzrwwCt1jzmwQ4KvjkyIWtgvLiGWjcl3FoDG+icuWL3GHaPdU0GhJUu/FNSXv
 w7CiuIzaHXVi43s2Ok8Y/5M2tvEqsHzEzCzdr83yChxksXsk61VIURAQ2cJE7LKpEQpi
 uOjpXh+fr/fn5Pu957zErQ5WlDq2xWbgPTEv5xYOR9OxoOThWZnZ0SKLU5mZJOU9+IDW
 tNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765466014; x=1766070814;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BbT9v83NtGR/hvY9uvwIW4Jp2/W/9ozpkYxE5YX4fBc=;
 b=bmNRHCdYsNtbso2EXfmGQfsVNE2HCoqCGcXoWThdez4aobAzCdN4hRTsRm/MBlDcPV
 2dT/43zX+h+emjp1k8fHb83yvSICDmWIfgAwQ5N9rDzKDqf7A0OAxTWo8os5jhQkqAd7
 C9+3yNWqyeaVuvfwUsEUIvA1zPagpakfDOg9Xr9bynUBd21MG+Ow1PcWC02TqAczdbMW
 myVIKxvnlruF3lQhbuTWPQeHdJKb2DQbXADvsnDlt3SNTPt22Jdzo8bIq33huxI4UVlx
 Q26XDlSJM0fMJPv4Te6nWvqb7sFzbteXdYhZqyfSmhd+OJWNS0JzrJahtnrpcrsD1599
 rlYQ==
X-Gm-Message-State: AOJu0YzSLF4DSaomdsVxxm8RyWGe6l3FwKMe1UEpSDX2QjoqKn0e6j/m
 rbl/ZSUOiYIN//GsRb4Rm1M7irAUEWqk0wRixJ8nN9OzJv86QVYE27VNLkZDvAGSCAE=
X-Gm-Gg: AY/fxX4KT6At4i4VFEFcLZQ7m6wmMn5cWhr8pawRUcmjORWBDfQuvg2ZbabGklMGTAK
 x+ZheEsArHDns0wEZ0kwoQsgvBEhCibwJnZup1lqCOzA3Ewj3JMobe6PUglNrosw+aBeXohOuvI
 ZufHXkh/ozt2leri9mWzcecJnJhmNQJqzHiVv1MJuqAvzLOrdHCrxok7b53LqKFdidTMyW4XMCe
 jPk3ab3bwcUmhl+BJKWEO5JSkXihT0FmiyqvxHGvKUnkWdWP3hzrkCmXq+hoaVmidqnMM5fhmBX
 Yt3YMP3uvfgKu1jZKfkqo7UeA6iBqKPRv5NqAl5hdp+m2j11gzqIiNjkQcECUX6EJ8CZkvo8uul
 tw99ZURr+jV4vxgab0Y3J1pXiOgaWWd4029yB7V6WdJ62QnKD1kkYhXpuNKekqCG6KJPQ/FBJ0U
 Ni4OZGAM0hjS3H6qeW82YGc+AqFNfZhokQeZdkG5w=
X-Google-Smtp-Source: AGHT+IHjcTzERCk8PEdyx93yJUqMMtWP3RFIUcEAwJCjucfiqKKlG3JtMT+NvXn4fwhWGnvcPZ9T8Q==
X-Received: by 2002:a05:6402:144c:b0:645:d07:8924 with SMTP id
 4fb4d7f45d1cf-6498770bf04mr2104557a12.16.1765466014327; 
 Thu, 11 Dec 2025 07:13:34 -0800 (PST)
Received: from [192.168.1.83] ([86.33.28.86]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-649820f77fbsm2698847a12.19.2025.12.11.07.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 07:13:33 -0800 (PST)
Message-ID: <9ef8686f-820f-41e9-985e-40411b4b9bd3@ursulin.net>
Date: Thu, 11 Dec 2025 16:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/19] drm/sched: use inline locks for the drm-sched-fence
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251211122407.1709-1-christian.koenig@amd.com>
 <20251211122407.1709-10-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251211122407.1709-10-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/12/2025 13:16, Christian König wrote:
> Using the inline lock is now the recommended way for dma_fence implementations.
>
> So use this approach for the scheduler fences as well just in case if
> anybody uses this as blueprint for its own implementation.
>
> Also saves about 4 bytes for the external spinlock.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_fence.c | 7 +++----
>   include/drm/gpu_scheduler.h             | 4 ----
>   2 files changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 08ccbde8b2f5..47471b9e43f9 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -161,7 +161,7 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>   	/* If we already have an earlier deadline, keep it: */
>   	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
>   	    ktime_before(fence->deadline, deadline)) {
> -		spin_unlock_irqrestore(&fence->lock, flags);
> +		dma_fence_unlock_irqrestore(f, flags);

Rebase error I guess. Pull into the locking helpers patch.

Regards,

Tvrtko

>   		return;
>   	}
>   
> @@ -217,7 +217,6 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>   
>   	fence->owner = owner;
>   	fence->drm_client_id = drm_client_id;
> -	spin_lock_init(&fence->lock);
>   
>   	return fence;
>   }
> @@ -230,9 +229,9 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>   	fence->sched = entity->rq->sched;
>   	seq = atomic_inc_return(&entity->fence_seq);
>   	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
> -		       &fence->lock, entity->fence_context, seq);
> +		       NULL, entity->fence_context, seq);
>   	dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
> -		       &fence->lock, entity->fence_context + 1, seq);
> +		       NULL, entity->fence_context + 1, seq);
>   }
>   
>   module_init(drm_sched_fence_slab_init);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index fb88301b3c45..b77f24a783e3 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -297,10 +297,6 @@ struct drm_sched_fence {
>            * belongs to.
>            */
>   	struct drm_gpu_scheduler	*sched;
> -        /**
> -         * @lock: the lock used by the scheduled and the finished fences.
> -         */
> -	spinlock_t			lock;
>           /**
>            * @owner: job owner for debugging
>            */

