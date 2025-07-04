Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D12C1AF9429
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 15:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB4610EA3C;
	Fri,  4 Jul 2025 13:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="E53R+oFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD2910EA34;
 Fri,  4 Jul 2025 13:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VWlOeoozSgIy2XJR0PL1RWlmdt7jGwTWOcY8Rx29kuw=; b=E53R+oFWBy6AueIpE+hmOfUuUq
 bbPh2wqr7Ibj2s170wu3hUhlXMaj3P7O9N1TKowmyJpEqp7I87RYI3Oa/sEC5s+AqNv2YuxVcA4/b
 15XkAeiagyExsnJ1CFFn8ON1uVaKaJxOz0VDdZn50wFVjKoqJ2SYwHJ3n9uBk9Afv5rlAYBg2OIOV
 pJTDJ2V9GQ0rJzPuOHQeOxpyp/+ZyaBpnZLbnAfcszRxzWmTRxQWh5PDXNHX4beNOPd5xSkIodfSq
 tEN+sjXZjOZcTeXrFvyy1ffCW9XGw7jFuedLMgZiqgHXUumA9zn4P3AEk7Nxrhk+oN5+rjjeXC6V4
 BMTTI9MA==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uXgUl-00CRaU-FK; Fri, 04 Jul 2025 15:30:27 +0200
Message-ID: <1a1ef81e-2df4-4d9b-af06-25dfb9bc4192@igalia.com>
Date: Fri, 4 Jul 2025 14:30:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/16] drm/sched: Avoid double re-lock on the job free
 path
To: phasta@kernel.org, =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250623122746.46478-1-tvrtko.ursulin@igalia.com>
 <20250623122746.46478-5-tvrtko.ursulin@igalia.com>
 <3ab04122-72dc-41f4-95af-6c4bf851c6d0@igalia.com>
 <70a5fcd839c0582ed2216c8a61e128834bf81315.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <70a5fcd839c0582ed2216c8a61e128834bf81315.camel@mailbox.org>
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


On 04/07/2025 13:56, Philipp Stanner wrote:
> On Fri, 2025-07-04 at 09:29 -0300, Maíra Canal wrote:
>> Hi Tvrtko,
>>
>> On 23/06/25 09:27, Tvrtko Ursulin wrote:
>>> Currently the job free work item will lock sched->job_list_lock
>>> first time
>>> to see if there are any jobs, free a single job, and then lock
>>> again to
>>> decide whether to re-queue itself if there are more finished jobs.
>>>
>>> Since drm_sched_get_finished_job() already looks at the second job
>>> in the
>>> queue we can simply add the signaled check and have it return the
>>> presence
>>> of more jobs to free to the caller. That way the work item does not
>>> have
>>> to lock the list again and repeat the signaled check.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Philipp Stanner <phasta@kernel.org>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 39 +++++++++++----------
>>> -----
>>>    1 file changed, 16 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 1f077782ec12..c6c26aec07b6 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -366,22 +366,6 @@ static void __drm_sched_run_free_queue(struct
>>> drm_gpu_scheduler *sched)
>>>    		queue_work(sched->submit_wq, &sched-
>>>> work_free_job);
>>>    }
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
>>> -				       struct drm_sched_job,
>>> list);
>>> -	if (job && dma_fence_is_signaled(&job->s_fence->finished))
>>> -		__drm_sched_run_free_queue(sched);
>>> -	spin_unlock(&sched->job_list_lock);
>>> -}
>>> -
>>>    /**
>>>     * drm_sched_job_done - complete a job
>>>     * @s_job: pointer to the job which is done
>>> @@ -1102,12 +1086,13 @@ drm_sched_select_entity(struct
>>> drm_gpu_scheduler *sched)
>>>     * drm_sched_get_finished_job - fetch the next finished job to be
>>> destroyed
>>>     *
>>>     * @sched: scheduler instance
>>> + * @have_more: are there more finished jobs on the list
>>>     *
>>>     * Returns the next finished job from the pending list (if there
>>> is one)
>>>     * ready for it to be destroyed.
>>>     */
>>>    static struct drm_sched_job *
>>> -drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
>>> +drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool
>>> *have_more)
>>>    {
>>>    	struct drm_sched_job *job, *next;
>>>    
>>> @@ -1115,22 +1100,27 @@ drm_sched_get_finished_job(struct
>>> drm_gpu_scheduler *sched)
>>>    
>>>    	job = list_first_entry_or_null(&sched->pending_list,
>>>    				       struct drm_sched_job,
>>> list);
>>> -
>>>    	if (job && dma_fence_is_signaled(&job->s_fence->finished))
>>> {
>>>    		/* remove job from pending_list */
>>>    		list_del_init(&job->list);
>>>    
>>>    		/* cancel this job's TO timer */
>>>    		cancel_delayed_work(&sched->work_tdr);
>>> -		/* make the scheduled timestamp more accurate */
>>> +
>>> +		*have_more = false;
>>>    		next = list_first_entry_or_null(&sched-
>>>> pending_list,
>>>    						typeof(*next),
>>> list);
>>> -
>>>    		if (next) {
>>> +			/* make the scheduled timestamp more
>>> accurate */
>>>    			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
>>>    				     &next->s_fence-
>>>> scheduled.flags))
>>>    				next->s_fence->scheduled.timestamp
>>> =
>>>    					dma_fence_timestamp(&job-
>>>> s_fence->finished);
>>> +
>>> +			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>> +				     &next->s_fence-
>>>> finished.flags))
>>
>> Shouldn't we use dma_fence_is_signaled() to keep the same check that
>> we
>> have in drm_sched_run_free_queue()?
> 
> There is a paused-ongoing discussion about this function:
> 
> https://lore.kernel.org/all/20250522112540.161411-2-phasta@kernel.org/
> 
> 
> dma_fence_is_signaled() can have side effects by actually signaling,
> instead of just checking.
> 
> Not sure if Tvrtko wanted to bypass that behavior here, though.

No, no ulterior motives here. :)

It is ages I wrote this, but now I revisited it, and AFAICT I don't see 
that it matters in this case.

It is a scheduler fence which does not implement fence->ops->signaled() 
so opportunistic signaling does not come into the picture.

I am happy to change it to dma_fence_is_signaled() if that is the 
preference.

Regards,

Tvrtko

>>> +				*have_more = true;
>>> +
>>>    			/* start TO timer for next job */
>>>    			drm_sched_start_timeout(sched);
>>>    		}
>>
>>
> 

