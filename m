Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CF7A13EA5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 17:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC1610E9B8;
	Thu, 16 Jan 2025 16:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="hCT5XgOG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2646D10E9B8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 16:01:10 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso7488455e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 08:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1737043269; x=1737648069;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ip0Rudecr5+ytAH+ftJ9c2xkgLcBkdn240TSBDYVLuU=;
 b=hCT5XgOGUunhoMQ7Q4pbWAKfNDfcBjyFu5yn2Nq3ywHgtjZBrKX4pRfj0VhQxaOEbE
 umBIDgtgTIhMAOVOxff8IaQeV4QeW6Jq8p0ohiIZ9IOVvnSMt/mGYWofo+Fak/pLqrng
 jKo1qnQjpGdcCGAa1XE4xHHi5x/FUkGhWvJ0DXs+QI/X/vmXnvfzwUzCUauAZi8csP4G
 UJuSM98Ix0g3w8avdDd+hOT5hruz7l61DTiv2ze8f/3KvnWeENRqEUJnBRe8zr4acjfu
 4urlS7IkfMjerhdxgeIO47+enrZVAEQgVbl85aIoH2XLgCh8KXjhYE3st9KUMw/otsOh
 Ry6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737043269; x=1737648069;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ip0Rudecr5+ytAH+ftJ9c2xkgLcBkdn240TSBDYVLuU=;
 b=kOw1Wd/QLEqIgIr4p7ZrkLb08Pse7KuSaFxGV7yWvFUXqI9EByEdEV+KvAZxk4QIpa
 YQuE/nCXK6FvZ3nNDfyB77Khnl4ZG7w75S37MAlXqRG/eJceyvyuPTdJhbxS88zZGuIS
 2GwpPFBFdhD0nppQD5aS0lKzh16/hliuN7DlgUVtoN17x2gwyegLJZuMDlRsCW8zOAFD
 4hcQ1rwxEBrePQKFc5jmJ1AKZhoctxjpImTHFvACEHzlkpJOV1ZmWSoI325Otoaw0lPW
 v1GSfBmZOiatnGMhmPIgbr5GLP/Q/FV3S9IhzZ+9a7hTLU4kH8JtJtJusseL0J8xTDXF
 oX4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPqAy+SY/5V9fIJHzz5NlK8XMWhtYpvhJ2ynjJKTqcgS7ew7ncdKLx8ExOmVhtM/bsCEq5mifRc88=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxT9NlFxHqZoDrlendqDlNdbAlGdOwPHzF0EAoa7rKLTd82B7k+
 nvmvKZGJ2fiDfTYLb56qTlL7cNYZLKHx1WE3ObsEIcOwimX4K+EvEa2M/3MgHqU=
X-Gm-Gg: ASbGncuFwwRnx717LFfB600Xhy2BVe07mue53g17/7JkFQ9znkLFUdGS3LdL8PpPJz0
 APGeZyRpUTyCzlyNQmIvDpaGpCs3IqHqsQjgm3YdoYlizfH0clGJCOCkri35niHu7rh/ZUHLC0u
 RntXJkQBVI/ZiYfxZkVvFGzOpIc1ZJqpXfDuVPd6BQqEMvudPyv2/4K5z9nHj2jNSkRYhFiGXLF
 zbgrSEc3hLv7KAs7xIsFqnkJcQ9pXmqlH/1ThU5bYu2AmQye8N41XT74k69iACnkFBvQlmA
X-Google-Smtp-Source: AGHT+IG6/sPar/npl4XCBjOqUMT6BXxljSKPCApYMlAl7l1r8Uny0RDVC4ETAKIlJxaEmFGbhTaobA==
X-Received: by 2002:a05:6000:4023:b0:385:f7a3:fed1 with SMTP id
 ffacd0b85a97d-38a87336e53mr33477567f8f.44.1737043268058; 
 Thu, 16 Jan 2025 08:01:08 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf322236csm219943f8f.39.2025.01.16.08.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 08:01:07 -0800 (PST)
Message-ID: <d399035a-4308-41c0-b300-a9fd3b2ffb33@ursulin.net>
Date: Thu, 16 Jan 2025 16:01:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Remove job submit/free race when using
 unordered workqueues
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
References: <20250110111452.76976-1-tvrtko.ursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250110111452.76976-1-tvrtko.ursulin@igalia.com>
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


On 10/01/2025 11:14, Tvrtko Ursulin wrote:
> After commit f7fe64ad0f22 ("drm/sched: Split free_job into own work item")
> and with drivers who use the unordered workqueue sched_jobs can be freed
> in parallel as soon as the complete_all(&entity->entity_idle) is called.
> This makes all dereferencing in the lower part of the worker unsafe so
> lets fix it by moving the complete_all() call to after the worker is done
> touching the job.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: f7fe64ad0f22 ("drm/sched: Split free_job into own work item")

I went back to write a comment for a v2 of this patch and realised the 
Fixes: target is wrong. And maybe even there was no race to begin with.

I *think* when looking into this I was mistaken that freeing of jobs 
happens in the job free worker - but actually for the 
drm_sched_entity_fini() case I was worried about it happens from the 
system_wq.

And that relies on the entity->last_scheduled keeping a reference. So as 
long as the pop and run work are serialized in one worker, and the 
asynchronous drm_sched_entity_fini() waits for entity to idle, I think 
there actually isn't a race. Regardless of the placement of 
complete_all() in the worker.

So as long as someone doesn't disagree I think this patch can go back to 
the initial version. Which had no Fixes: and was just removing the 
s_fence local variable. Maybe that local was needed at some point but I 
don't see how it is with the current code base.

Regards,

Tvrtko

P.S. What potentially could be confusing is how both job free worker and 
entity fini work via the sched->ops->free_job() vfunc. Kind of giving 
out the impression it is the final "put" - not involving fence reference 
counting. While in actually most drivers call drm_sched_job_cleanup() 
from the vfunc - which uses dma_fence_put. Perhaps a more intuitive 
design would be if the scheduler core would be calling dma_fence_put and 
the driver specific vfunc was actually called from the scheduler fence 
release vfunc. But I don't know.. don't particularly want to go there at 
this time.

> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Cc: <stable@vger.kernel.org> # v6.8+
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 57da84908752..f0d02c061c23 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1188,7 +1188,6 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   		container_of(w, struct drm_gpu_scheduler, work_run_job);
>   	struct drm_sched_entity *entity;
>   	struct dma_fence *fence;
> -	struct drm_sched_fence *s_fence;
>   	struct drm_sched_job *sched_job;
>   	int r;
>   
> @@ -1207,15 +1206,12 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   		return;
>   	}
>   
> -	s_fence = sched_job->s_fence;
> -
>   	atomic_add(sched_job->credits, &sched->credit_count);
>   	drm_sched_job_begin(sched_job);
>   
>   	trace_drm_run_job(sched_job, entity);
>   	fence = sched->ops->run_job(sched_job);
> -	complete_all(&entity->entity_idle);
> -	drm_sched_fence_scheduled(s_fence, fence);
> +	drm_sched_fence_scheduled(sched_job->s_fence, fence);
>   
>   	if (!IS_ERR_OR_NULL(fence)) {
>   		/* Drop for original kref_init of the fence */
> @@ -1232,6 +1228,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   				   PTR_ERR(fence) : 0);
>   	}
>   
> +	complete_all(&entity->entity_idle);
>   	wake_up(&sched->job_scheduled);
>   	drm_sched_run_job_queue(sched);
>   }
