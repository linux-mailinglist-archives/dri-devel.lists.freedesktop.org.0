Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0A2AFE64D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 12:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DEF10E798;
	Wed,  9 Jul 2025 10:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BofmsTM+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938BA10E797;
 Wed,  9 Jul 2025 10:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q5u+6AafBmRCe5AiLkVQpA4VXoPEsutgemkpBMiv/Ok=; b=BofmsTM++0++Qmt13yj9bU6iQ6
 yemmNUTRcGjWCzhXd6V5AGOAXItd2XXrwSwQ8ftcUKPJ2owPMX3tcuQDswn6ffYju9lCzYw1/LmtZ
 YFNeX8DlBbcBJS6hjM83pQn6QArLOJ7oYuEHH3T/sdiIHXr/5gXFHVzDffo5pjCxJPSfwOCKH0v2S
 vKiIAPGF0q90B/NTB53T5T6QgG0sdgFgC3AyFTB1DmS6ovKTEARlgRxbe1infMHANOtdzDQSPYEZj
 wMWanH/rQimXDnSntlEtUn51YNQoJ8n3WBELy8GrhlNjSAfzevMwH2PHSUBPliY6ZQ/BjnQqQwsIN
 zHfEGbig==;
Received: from [84.65.48.237] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uZSMz-00EQhA-8r; Wed, 09 Jul 2025 12:49:45 +0200
Message-ID: <9826ee93-d14f-473a-a53f-581f02391569@igalia.com>
Date: Wed, 9 Jul 2025 11:49:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Avoid double re-lock on the job free path
To: Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
References: <20250708122032.75668-1-tvrtko.ursulin@igalia.com>
 <aG3z38CePTKpvjfE@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aG3z38CePTKpvjfE@lstrano-desk.jf.intel.com>
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


On 09/07/2025 05:45, Matthew Brost wrote:
> On Tue, Jul 08, 2025 at 01:20:32PM +0100, Tvrtko Ursulin wrote:
>> Currently the job free work item will lock sched->job_list_lock first time
>> to see if there are any jobs, free a single job, and then lock again to
>> decide whether to re-queue itself if there are more finished jobs.
>>
>> Since drm_sched_get_finished_job() already looks at the second job in the
>> queue we can simply add the signaled check and have it return the presence
>> of more jobs to free to the caller. That way the work item does not have
>> to lock the list again and repeat the signaled check.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
> 
> The patch looks correct, we do have CI failure in a section which
> stresses scheduling though. Probably noise though. Do you have Intel
> hardware? I suggest running xe_exec_threads in a loop on either LNL or
> BMG and see if the CI failure pops. If you don't have hardware, let me
> know and I can do this.
> 
> With a bit of investigation in the CI failure:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks! I don't have the HW but I was able to press re-test in the CI so 
lets see. Although at the moment I can't imagine a failure mode like 
that could be caused by this patch.

Regards,

Tvrtko

> 
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 37 ++++++++++----------------
>>   1 file changed, 14 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 1f077782ec12..1bce0b66f89c 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -366,22 +366,6 @@ static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
>>   		queue_work(sched->submit_wq, &sched->work_free_job);
>>   }
>>   
>> -/**
>> - * drm_sched_run_free_queue - enqueue free-job work if ready
>> - * @sched: scheduler instance
>> - */
>> -static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
>> -{
>> -	struct drm_sched_job *job;
>> -
>> -	spin_lock(&sched->job_list_lock);
>> -	job = list_first_entry_or_null(&sched->pending_list,
>> -				       struct drm_sched_job, list);
>> -	if (job && dma_fence_is_signaled(&job->s_fence->finished))
>> -		__drm_sched_run_free_queue(sched);
>> -	spin_unlock(&sched->job_list_lock);
>> -}
>> -
>>   /**
>>    * drm_sched_job_done - complete a job
>>    * @s_job: pointer to the job which is done
>> @@ -1102,12 +1086,13 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>    * drm_sched_get_finished_job - fetch the next finished job to be destroyed
>>    *
>>    * @sched: scheduler instance
>> + * @have_more: are there more finished jobs on the list
>>    *
>>    * Returns the next finished job from the pending list (if there is one)
>>    * ready for it to be destroyed.
>>    */
>>   static struct drm_sched_job *
>> -drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
>> +drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool *have_more)
>>   {
>>   	struct drm_sched_job *job, *next;
>>   
>> @@ -1115,22 +1100,25 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
>>   
>>   	job = list_first_entry_or_null(&sched->pending_list,
>>   				       struct drm_sched_job, list);
>> -
>>   	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>   		/* remove job from pending_list */
>>   		list_del_init(&job->list);
>>   
>>   		/* cancel this job's TO timer */
>>   		cancel_delayed_work(&sched->work_tdr);
>> -		/* make the scheduled timestamp more accurate */
>> +
>> +		*have_more = false;
>>   		next = list_first_entry_or_null(&sched->pending_list,
>>   						typeof(*next), list);
>> -
>>   		if (next) {
>> +			/* make the scheduled timestamp more accurate */
>>   			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
>>   				     &next->s_fence->scheduled.flags))
>>   				next->s_fence->scheduled.timestamp =
>>   					dma_fence_timestamp(&job->s_fence->finished);
>> +
>> +			*have_more = dma_fence_is_signaled(&next->s_fence->finished);
>> +
>>   			/* start TO timer for next job */
>>   			drm_sched_start_timeout(sched);
>>   		}
>> @@ -1189,12 +1177,15 @@ static void drm_sched_free_job_work(struct work_struct *w)
>>   	struct drm_gpu_scheduler *sched =
>>   		container_of(w, struct drm_gpu_scheduler, work_free_job);
>>   	struct drm_sched_job *job;
>> +	bool have_more;
>>   
>> -	job = drm_sched_get_finished_job(sched);
>> -	if (job)
>> +	job = drm_sched_get_finished_job(sched, &have_more);
>> +	if (job) {
>>   		sched->ops->free_job(job);
>> +		if (have_more)
>> +			__drm_sched_run_free_queue(sched);
>> +	}
>>   
>> -	drm_sched_run_free_queue(sched);
>>   	drm_sched_run_job_queue(sched);
>>   }
>>   
>> -- 
>> 2.48.0
>>

