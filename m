Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D2C7E0199
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 11:39:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC7A10E53F;
	Fri,  3 Nov 2023 10:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A419510E09E;
 Fri,  3 Nov 2023 10:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699007962; x=1730543962;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=L6xD/YnR5JrgAo2GAG4ToWdjFbmeaizcxvCa5mmgq2E=;
 b=Wm98hmrxWf93cGIEETP88+lpJpNNTWND21asuq7MbUU1O8+ElCMPF9FW
 z2kEI/ELiOEXMglsPHg+hqngi5OXfnwLMtyo0j13jmrrF2kHYcT7YiGPh
 vENOlui9384VLqZ2QYdlwl4sh9lHYH0f3kUq56rXUJnSenaOwBeKFoN9w
 jqyBlsfKT00s1TQA2iMK+2F3LMCnz4rbLlI64AMuzMR9aiRLwE2Mp+BMD
 8k9VdDqZJuPgk8pryXqgI58T01utnUCRaJPN7A/l9uIwMkTeF5Zp5bGS9
 DTk5Wk2lWPpTAeTgNPJ7V09CIH+370tLR4jwkfCCI/7R/O+SL9pLUUR1n Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="391792358"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="391792358"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 03:39:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1093030708"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1093030708"
Received: from sdobbela-mobl.ger.corp.intel.com (HELO [10.213.223.51])
 ([10.213.223.51])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 03:39:17 -0700
Message-ID: <d2bf144f-e388-4cb1-bc18-12efad4f677b@linux.intel.com>
Date: Fri, 3 Nov 2023 10:39:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Eliminate drm_sched_run_job_queue_if_ready()
Content-Language: en-US
To: Luben Tuikov <ltuikov89@gmail.com>
References: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
 <20231102224653.5785-2-ltuikov89@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20231102224653.5785-2-ltuikov89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: matthew.brost@intel.com, robdclark@chromium.org, sarah.walker@imgtec.com,
 ltuikov@yahoo.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 02/11/2023 22:46, Luben Tuikov wrote:
> Eliminate drm_sched_run_job_queue_if_ready() and instead just call
> drm_sched_run_job_queue() in drm_sched_free_job_work(). The problem is that
> the former function uses drm_sched_select_entity() to determine if the
> scheduler had an entity ready in one of its run-queues, and in the case of the
> Round-Robin (RR) scheduling, the function drm_sched_rq_select_entity_rr() does
> just that, selects the _next_ entity which is ready, sets up the run-queue and
> completion and returns that entity. The FIFO scheduling algorithm is unaffected.
> 
> Now, since drm_sched_run_job_work() also calls drm_sched_select_entity(), then
> in the case of RR scheduling, that would result in calling select_entity()
> twice, which may result in skipping a ready entity if more than one entity is
> ready. This commit fixes this by eliminating the if_ready() variant.

Fixes: is missing since the regression already landed.

> 
> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 98b2ad54fc7071..05816e7cae8c8b 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1040,16 +1040,6 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>   }
>   EXPORT_SYMBOL(drm_sched_pick_best);
>   
> -/**
> - * drm_sched_run_job_queue_if_ready - enqueue run-job work if ready
> - * @sched: scheduler instance
> - */
> -static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> -{
> -	if (drm_sched_select_entity(sched))
> -		drm_sched_run_job_queue(sched);
> -}
> -
>   /**
>    * drm_sched_free_job_work - worker to call free_job
>    *
> @@ -1069,7 +1059,7 @@ static void drm_sched_free_job_work(struct work_struct *w)
>   		sched->ops->free_job(cleanup_job);
>   
>   		drm_sched_free_job_queue_if_done(sched);
> -		drm_sched_run_job_queue_if_ready(sched);
> +		drm_sched_run_job_queue(sched);

It works but is a bit wasteful causing needless CPU wake ups with a 
potentially empty queue, both here and in drm_sched_run_job_work below.

What would be the problem in having a "peek" type helper? It would be 
easy to do it in a single spin lock section instead of drop and re-acquire.

What is even the point of having the re-queue here _inside_ the if 
(cleanup_job) block? See 
https://lists.freedesktop.org/archives/dri-devel/2023-November/429037.html. 
Because of the lock drop and re-acquire I don't see that it makes sense 
to make potential re-queue depend on the existence of current finished job.

Also the point of doing the re-queue of the run job queue from the free 
worker?

(I suppose re-queuing the _free_ worker itself is needed in the current 
design, albeit inefficient.)

Regards,

Tvrtko

>   	}
>   }
>   
> @@ -1127,7 +1117,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   	}
>   
>   	wake_up(&sched->job_scheduled);
> -	drm_sched_run_job_queue_if_ready(sched);
> +	drm_sched_run_job_queue(sched);
>   }
>   
>   /**
> 
> base-commit: 6fd9487147c4f18ad77eea00bd8c9189eec74a3e
