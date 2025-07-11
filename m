Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCD5B02022
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 17:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DF410E39A;
	Fri, 11 Jul 2025 15:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hm5itZKO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1181310E2C7;
 Fri, 11 Jul 2025 15:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uj79kPe7q0DnPMg4XBogXAc7PBxyIUnlZ8gbduJv13I=; b=hm5itZKOaRGsMrxZKDzLSq8vHv
 gPhIHAg7ybjApP/FD7GL9ES28ywc4MR+eslMSZLcQozCpP7hCCA0FENalv+eb0+sCTjo9eV99xgOd
 MlsxiIkh/womvpAccCTmTWBRaQjXeKwOrxj7TYrb5R7heUFOw6vhhpYXyK4obK+GB8vHKQlOoguSK
 dHkpw9+W4tVPKIcYqsHa08m6vARZaPaqXk6dG78L1SC2qGjkRHEaUiX73YQxBPIkwKjuQEVnmK0GY
 6IVgnBWtI/a3xANURRh5kBYvqVsfzo7jgc2vZDjzsuVrVCB277AZlMIHcrK4tOjUk+e2rO0Kj6LpC
 yUaLfYsA==;
Received: from [84.65.48.237] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uaFPE-00FQ9D-2q; Fri, 11 Jul 2025 17:11:20 +0200
Message-ID: <6c1ab8a8-a8f5-4be6-a15a-8d43ea38aab1@igalia.com>
Date: Fri, 11 Jul 2025 16:11:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Avoid double re-lock on the job free path
To: phasta@kernel.org, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250708122032.75668-1-tvrtko.ursulin@igalia.com>
 <b06d4a88f0e4ba943972b1bc99ef8d6ef79a4ddb.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <b06d4a88f0e4ba943972b1bc99ef8d6ef79a4ddb.camel@mailbox.org>
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


On 11/07/2025 14:04, Philipp Stanner wrote:
> Late to the party; had overlooked that the discussion with Matt is
> resolved. Some comments below
> 
> On Tue, 2025-07-08 at 13:20 +0100, Tvrtko Ursulin wrote:
>> Currently the job free work item will lock sched->job_list_lock first time
>> to see if there are any jobs, free a single job, and then lock again to
>> decide whether to re-queue itself if there are more finished jobs.
>>
>> Since drm_sched_get_finished_job() already looks at the second job in the
>> queue we can simply add the signaled check and have it return the presence
>> of more jobs to free to the caller. That way the work item does not
> 
> optional nit:
> s/to free/to be freed
> 
> Reads a bit more cleanly.

Done.

> 
>> have
>> to lock the list again and repeat the signaled check.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 37 ++++++++++----------------
>>   1 file changed, 14 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 1f077782ec12..1bce0b66f89c 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -366,22 +366,6 @@ static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
>>   		queue_work(sched->submit_wq, &sched->work_free_job);
>>   }
>>   
>> -/**
>> - * drm_sched_run_free_queue - enqueue free-job work if ready
>> - * @sched: scheduler instance
>> - */
>> -static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
> 
> The function name is now free. See my comment at the bottom.
> 
>> -{
>> -	struct drm_sched_job *job;
>> -
>> -	spin_lock(&sched->job_list_lock);
>> -	job = list_first_entry_or_null(&sched->pending_list,
>> -				       struct drm_sched_job, list);
>> -	if (job && dma_fence_is_signaled(&job->s_fence->finished))
>> -		__drm_sched_run_free_queue(sched);
>> -	spin_unlock(&sched->job_list_lock);
>> -}
>> -
>>   /**
>>    * drm_sched_job_done - complete a job
>>    * @s_job: pointer to the job which is done
>> @@ -1102,12 +1086,13 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>    * drm_sched_get_finished_job - fetch the next finished job to be destroyed
>>    *
>>    * @sched: scheduler instance
>> + * @have_more: are there more finished jobs on the list
> 
> I'd like a very brief sentence below here like:
> 
> "Informs the caller through @have_more whether there are more finished
> jobs besides the returned one."
> 
> Reason being that it's relatively rare in the kernel that status is not
> transmitted through a return value, so we want that to be very obvious.

Done.

> 
>>    *
>>    * Returns the next finished job from the pending list (if there is one)
>>    * ready for it to be destroyed.
>>    */
>>   static struct drm_sched_job *
>> -drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
>> +drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool *have_more)
>>   {
>>   	struct drm_sched_job *job, *next;
>>   
>> @@ -1115,22 +1100,25 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
>>   
>>   	job = list_first_entry_or_null(&sched->pending_list,
>>   				       struct drm_sched_job, list);
>> -
>>   	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>   		/* remove job from pending_list */
>>   		list_del_init(&job->list);
>>   
>>   		/* cancel this job's TO timer */
>>   		cancel_delayed_work(&sched->work_tdr);
>> -		/* make the scheduled timestamp more accurate */
>> +
>> +		*have_more = false;
> 
> Don't we want that bool initialized to false at the very beginning of
> the function? That way it can never be forgotten if the code gets
> reworked.

I opted to leave this as is, given how kerneldoc is clear this is only 
valid if a job was returned.

> 
>>   		next = list_first_entry_or_null(&sched->pending_list,
>>   						typeof(*next), list);
>> -
>>   		if (next) {
>> +			/* make the scheduled timestamp more accurate */
>>   			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
>>   				     &next->s_fence->scheduled.flags))
>>   				next->s_fence->scheduled.timestamp =
>>   					dma_fence_timestamp(&job->s_fence->finished);
>> +
>> +			*have_more = dma_fence_is_signaled(&next->s_fence->finished);
>> +
>>   			/* start TO timer for next job */
>>   			drm_sched_start_timeout(sched);
>>   		}
>> @@ -1189,12 +1177,15 @@ static void drm_sched_free_job_work(struct work_struct *w)
>>   	struct drm_gpu_scheduler *sched =
>>   		container_of(w, struct drm_gpu_scheduler, work_free_job);
>>   	struct drm_sched_job *job;
>> +	bool have_more;
>>   
>> -	job = drm_sched_get_finished_job(sched);
>> -	if (job)
>> +	job = drm_sched_get_finished_job(sched, &have_more);
>> +	if (job) {
>>   		sched->ops->free_job(job);
>> +		if (have_more)
>> +			__drm_sched_run_free_queue(sched);
> 
> Now that drm_sched_run_free_queue() is dead, it's an excellent
> opportunity to give its name to __drm_sched_run_free_queue() \o/
> 
> Cleaner namespace, and reads better with the below
> drm_sched_run_job_queue().

Well spotted - done.

> Besides, cool patch!

Thanks!

Regards,

Tvrtko

>> +	}
>>   
>> -	drm_sched_run_free_queue(sched);
>>   	drm_sched_run_job_queue(sched);
>>   }
>>   
> 

