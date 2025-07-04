Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F39AF9372
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 15:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D719810EA33;
	Fri,  4 Jul 2025 13:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SmUN8GyC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D4F10EA32;
 Fri,  4 Jul 2025 13:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=py5A+mTjJfQwePZEaeWGodwGhnzboaGdBw2mdGTNslA=; b=SmUN8GyCNRTS8LZ2UvjDIPgLu/
 ThhriUBbVmy2ghAG2awdLc8McDwmReB6INWZBgHPBwE+pcqkCOtdJL94byldJFpNAOWimdPteRI9f
 t8y/taeE+t1WzlU6Oys+4fVUCYqqwfQqwK+vcGYbdL0DkUAAzovFmaGPfaSMQ15n6nVG+/OWE2ATn
 bW2CfEDLWc73GLQZCTK1P1b2klL1ywzku1d3t+RsHJT+RJ4Kwl3izjYs6Ubnfly+CxbhmIXbMacXK
 SLPy7kEBnDzlWZuKNh48W8LAST0esDN6L81xY9G0n3GSRh+AT99WosI34ufAO3EyzvDqptTA6cG5P
 DxPqWATA==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uXg46-00CR1v-3V; Fri, 04 Jul 2025 15:02:54 +0200
Message-ID: <54c318bc-11ca-4dee-9f7f-be9f82f9b647@igalia.com>
Date: Fri, 4 Jul 2025 14:02:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/16] drm/sched: De-clutter drm_sched_init
To: phasta@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250623122746.46478-1-tvrtko.ursulin@igalia.com>
 <20250623122746.46478-4-tvrtko.ursulin@igalia.com>
 <f010325d1d49b4d7cae44d12c77110c3c36de214.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <f010325d1d49b4d7cae44d12c77110c3c36de214.camel@mailbox.org>
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


On 04/07/2025 13:59, Philipp Stanner wrote:
> On Mon, 2025-06-23 at 13:27 +0100, Tvrtko Ursulin wrote:
>> Move work queue allocation into a helper for a more streamlined
>> function
>> body.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 33 ++++++++++++++++--------
>> --
>>   1 file changed, 20 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index a1b445c3b4db..1f077782ec12 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -84,12 +84,6 @@
>>   #define CREATE_TRACE_POINTS
>>   #include "gpu_scheduler_trace.h"
>>   
>> -#ifdef CONFIG_LOCKDEP
>> -static struct lockdep_map drm_sched_lockdep_map = {
>> -	.name = "drm_sched_lockdep_map"
>> -};
>> -#endif
>> -
>>   int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>>   
>>   /**
>> @@ -1263,6 +1257,25 @@ static void drm_sched_run_job_work(struct
>> work_struct *w)
>>   	drm_sched_run_job_queue(sched);
>>   }
>>   
>> +static struct workqueue_struct *drm_sched_alloc_wq(const char *name)
>> +{
>> +#if (IS_ENABLED(CONFIG_LOCKDEP))
>> +	static struct lockdep_map map = {
>> +		.name = "drm_sched_lockdep_map"
>> +	};
>> +
>> +	/*
>> +	 * Avoid leaking a lockdep map on each drm sched creation
>> and
>> +	 * destruction by using a single lockdep map for all drm
>> sched
>> +	 * allocated submit_wq.
>> +	 */
>> +
>> +	return alloc_ordered_workqueue_lockdep_map(name,
>> WQ_MEM_RECLAIM, &map);
>> +#else
>> +	return alloc_ordered_workqueue(name, WQ_MEM_RECLAIM);
>> +#endif
>> +}
>> +
>>   /**
>>    * drm_sched_init - Init a gpu scheduler instance
>>    *
>> @@ -1303,13 +1316,7 @@ int drm_sched_init(struct drm_gpu_scheduler
>> *sched, const struct drm_sched_init_
>>   		sched->submit_wq = args->submit_wq;
>>   		sched->own_submit_wq = false;
>>   	} else {
>> -#ifdef CONFIG_LOCKDEP
>> -		sched->submit_wq =
>> alloc_ordered_workqueue_lockdep_map(args->name,
>> -
>> 								       WQ_MEM_RECLAIM,
>> -
>> 								       &drm_sched_lockdep_map);
>> -#else
>> -		sched->submit_wq = alloc_ordered_workqueue(args-
>>> name, WQ_MEM_RECLAIM);
>> -#endif
>> +		sched->submit_wq = drm_sched_alloc_wq(args->name);
>>   		if (!sched->submit_wq)
>>   			return -ENOMEM;
> 
> You could send this patch separately any time *wink wink*
> 
> We definitely wanna merge that, and you could then just rebase your RFC
> series on drm-misc-next.

Will do. I was waiting for acks or r-bs on the easy patches from the 
head of the series to extract them. As mentioned before it was all 
supposed to be structured in a way that there are logical points in the 
series up to where it makes sense even without going to the end.

Regards,

Tvrtko

