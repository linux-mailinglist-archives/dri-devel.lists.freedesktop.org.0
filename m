Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C40AB6693
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 10:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632CC10E25C;
	Wed, 14 May 2025 08:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="q5c+X1f9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C47B10E1FB;
 Wed, 14 May 2025 08:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qx3a7o9rYqhXw/D6fn/4Lnl51qVNgm5ncFSFSrbK1tM=; b=q5c+X1f9WD+xUTWI08G/lGFYQ/
 sPKswimc8qBc6dIYeg8DTojHCQU5HFjHFWi9Ug6+ejnVhyJ0p3555K4Fwm6B7Lo0b5C//fyhYqwRX
 NQr025N+DVt5vzgXxBKXbyNzsq26PEKekzt9q9fsXmvLKnx3ZVQZcCxytkwxPvMQSE+MN4HzkRMF1
 TYXBnHAkP7ILU9PEI3CiXWYl2q+ccn89kKw/wF+1U2GizRt940y+mTIbZv4P3wFTRZheN/zmLp9Fw
 BUwiooQPPzpZcP7jV19yRfOrQLOkgwgy30mxVbk35MsZoveE7n7VFMA/cCavM2v6SluBM12xmJDLX
 9RZbxvWA==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uF7nV-0083n1-5j; Wed, 14 May 2025 10:54:48 +0200
Message-ID: <f379dc13-3915-4ec8-8ab3-8b797c795598@igalia.com>
Date: Wed, 14 May 2025 09:54:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 04/16] drm/sched: Avoid double re-lock on the job free
 path
To: Matthew Brost <matthew.brost@intel.com>, phasta@kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>
References: <20250425102034.85133-1-tvrtko.ursulin@igalia.com>
 <20250425102034.85133-5-tvrtko.ursulin@igalia.com>
 <657c053d7cd443ff310dfff19d03ab11e0f17289.camel@mailbox.org>
 <aCHwSFBWTAm1PPP0@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aCHwSFBWTAm1PPP0@lstrano-desk.jf.intel.com>
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


On 12/05/2025 13:57, Matthew Brost wrote:
> On Mon, May 12, 2025 at 02:49:55PM +0200, Philipp Stanner wrote:
>> On Fri, 2025-04-25 at 11:20 +0100, Tvrtko Ursulin wrote:
>>> Currently the job free work item will lock sched->job_list_lock first
>>> time
>>> to see if there are any jobs, free a single job, and then lock again
>>> to
>>> decide whether to re-queue itself if there are more finished jobs.
>>>
>>> Since drm_sched_get_finished_job() already looks at the second job in
>>> the
>>> queue we can simply add the signaled check and have it return the
>>> presence
>>> of more jobs to free to the caller. That way the work item does not
>>> have
>>> to lock the list again and repeat the signaled check.
>>
>> Are you convinced that this is worth it?
>>
>> I'm torn. It's rare that one returns a status through a boolean by
>> reference.
>>
> 
> I'd say no to this (mirco optimization) and to freeing / running more

It would be nice if the "no" came with some explanation.

> than job per worker invocation. The later was rejected in original work
> queue conversion.

This applies to two other patches from the series.

For sched->credit_limit, I could limit it to batches or via 
cond_resched() perhaps, if that is your concern.

Although TBH for 1:1 drivers like xe (with large-ish credit_limit) I 
would have thought you would actually be extra motivated to pass along 
as much as possible to the GuC, as soon as possible, and not rely on 
work items re-queues.

For freeing in batches, I need it for more accurate GPU utilisation 
stats. What reason you see for that to be problematic?

Regards,

Tvrtko

>> Independently from that, this is a candidate which certainly can be
>> branched out from this series, to make the series completely about the
>> new scheduling policy, not general other improvements.
>>
>>
>> P.
>>
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Philipp Stanner <phasta@kernel.org>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_main.c | 39 +++++++++++-------------
>>> --
>>>   1 file changed, 16 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 86e40157b09b..a45b02fd2af3 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -365,22 +365,6 @@ static void __drm_sched_run_free_queue(struct
>>> drm_gpu_scheduler *sched)
>>>   		queue_work(sched->submit_wq, &sched->work_free_job);
>>>   }
>>>   
>>> -/**
>>> - * drm_sched_run_free_queue - enqueue free-job work if ready
>>> - * @sched: scheduler instance
>>> - */
>>> -static void drm_sched_run_free_queue(struct drm_gpu_scheduler
>>> *sched)
>>> -{
>>> -	struct drm_sched_job *job;
>>> -
>>> -	spin_lock(&sched->job_list_lock);
>>> -	job = list_first_entry_or_null(&sched->pending_list,
>>> -				       struct drm_sched_job, list);
>>> -	if (job && dma_fence_is_signaled(&job->s_fence->finished))
>>> -		__drm_sched_run_free_queue(sched);
>>> -	spin_unlock(&sched->job_list_lock);
>>> -}
>>> -
>>>   /**
>>>    * drm_sched_job_done - complete a job
>>>    * @s_job: pointer to the job which is done
>>> @@ -1097,12 +1081,13 @@ drm_sched_select_entity(struct
>>> drm_gpu_scheduler *sched)
>>>    * drm_sched_get_finished_job - fetch the next finished job to be
>>> destroyed
>>>    *
>>>    * @sched: scheduler instance
>>> + * @have_more: are there more finished jobs on the list
>>>    *
>>>    * Returns the next finished job from the pending list (if there is
>>> one)
>>>    * ready for it to be destroyed.
>>>    */
>>>   static struct drm_sched_job *
>>> -drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
>>> +drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool
>>> *have_more)
>>>   {
>>>   	struct drm_sched_job *job, *next;
>>>   
>>> @@ -1110,22 +1095,27 @@ drm_sched_get_finished_job(struct
>>> drm_gpu_scheduler *sched)
>>>   
>>>   	job = list_first_entry_or_null(&sched->pending_list,
>>>   				       struct drm_sched_job, list);
>>> -
>>>   	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>>   		/* remove job from pending_list */
>>>   		list_del_init(&job->list);
>>>   
>>>   		/* cancel this job's TO timer */
>>>   		cancel_delayed_work(&sched->work_tdr);
>>> -		/* make the scheduled timestamp more accurate */
>>> +
>>> +		*have_more = false;
>>>   		next = list_first_entry_or_null(&sched-
>>>> pending_list,
>>>   						typeof(*next),
>>> list);
>>> -
>>>   		if (next) {
>>> +			/* make the scheduled timestamp more
>>> accurate */
>>>   			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
>>>   				     &next->s_fence-
>>>> scheduled.flags))
>>>   				next->s_fence->scheduled.timestamp =
>>>   					dma_fence_timestamp(&job-
>>>> s_fence->finished);
>>> +
>>> +			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>> +				     &next->s_fence-
>>>> finished.flags))
>>> +				*have_more = true;
>>> +
>>>   			/* start TO timer for next job */
>>>   			drm_sched_start_timeout(sched);
>>>   		}
>>> @@ -1184,12 +1174,15 @@ static void drm_sched_free_job_work(struct
>>> work_struct *w)
>>>   	struct drm_gpu_scheduler *sched =
>>>   		container_of(w, struct drm_gpu_scheduler,
>>> work_free_job);
>>>   	struct drm_sched_job *job;
>>> +	bool have_more;
>>>   
>>> -	job = drm_sched_get_finished_job(sched);
>>> -	if (job)
>>> +	job = drm_sched_get_finished_job(sched, &have_more);
>>> +	if (job) {
>>>   		sched->ops->free_job(job);
>>> +		if (have_more)
>>> +			__drm_sched_run_free_queue(sched);
>>> +	}
>>>   
>>> -	drm_sched_run_free_queue(sched);
>>>   	drm_sched_run_job_queue(sched);
>>>   }
>>>   
>>

