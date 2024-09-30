Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F353498A08B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 13:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB2210E3EC;
	Mon, 30 Sep 2024 11:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 87BE110E3EC
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 11:28:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67F22DA7;
 Mon, 30 Sep 2024 04:29:01 -0700 (PDT)
Received: from [10.57.76.28] (unknown [10.57.76.28])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E3C73F58B;
 Mon, 30 Sep 2024 04:28:28 -0700 (PDT)
Message-ID: <43d92e28-1fef-4408-b4a4-efede6bed263@arm.com>
Date: Mon, 30 Sep 2024 12:28:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] drm/panthor: introduce job cycle and timestamp
 accounting
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <5c4d1008-261f-4c47-ab73-c527675484a4@arm.com>
 <bq6lctwgpsxvrdaajmjo3xdjt32srmsxvjhtzyebdj6izjzoaw@6duby4axg3pf>
 <ef799587-f7c2-472a-8550-9c40a395eccb@arm.com>
 <jgdknf77n6vqanh4jv2yixe4n4hsbhqqhth4beued4topggwgz@wx7bumhrbpje>
 <033f8885-9c0e-4c5a-a272-baf48807dc5d@arm.com>
 <gxtbgvg6dihcbcwm7sihnfl7cqnfx72ekr7mgvgykeukpltwak@b3pdwok2n5p6>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <gxtbgvg6dihcbcwm7sihnfl7cqnfx72ekr7mgvgykeukpltwak@b3pdwok2n5p6>
Content-Type: text/plain; charset=UTF-8
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

On 27/09/2024 15:53, Adrián Larumbe wrote:
> On 25.09.2024 10:56, Steven Price wrote:
>> On 23/09/2024 21:43, Adrián Larumbe wrote:
>>> Hi Steve,
>>>
>>> On 23.09.2024 09:55, Steven Price wrote:
>>>> On 20/09/2024 23:36, Adrián Larumbe wrote:
>>>>> Hi Steve, thanks for the review.
>>>>
>>>> Hi Adrián,
>>>>
>>>>> I've applied all of your suggestions for the next patch series revision, so I'll
>>>>> only be answering to your question about the calc_profiling_ringbuf_num_slots
>>>>> function further down below.
>>>>>
>>>>
>>>> [...]
>>>>
>>>>>>> @@ -3003,6 +3190,34 @@ static const struct drm_sched_backend_ops panthor_queue_sched_ops = {
>>>>>>>  	.free_job = queue_free_job,
>>>>>>>  };
>>>>>>>  
>>>>>>> +static u32 calc_profiling_ringbuf_num_slots(struct panthor_device *ptdev,
>>>>>>> +				       u32 cs_ringbuf_size)
>>>>>>> +{
>>>>>>> +	u32 min_profiled_job_instrs = U32_MAX;
>>>>>>> +	u32 last_flag = fls(PANTHOR_DEVICE_PROFILING_ALL);
>>>>>>> +
>>>>>>> +	/*
>>>>>>> +	 * We want to calculate the minimum size of a profiled job's CS,
>>>>>>> +	 * because since they need additional instructions for the sampling
>>>>>>> +	 * of performance metrics, they might take up further slots in
>>>>>>> +	 * the queue's ringbuffer. This means we might not need as many job
>>>>>>> +	 * slots for keeping track of their profiling information. What we
>>>>>>> +	 * need is the maximum number of slots we should allocate to this end,
>>>>>>> +	 * which matches the maximum number of profiled jobs we can place
>>>>>>> +	 * simultaneously in the queue's ring buffer.
>>>>>>> +	 * That has to be calculated separately for every single job profiling
>>>>>>> +	 * flag, but not in the case job profiling is disabled, since unprofiled
>>>>>>> +	 * jobs don't need to keep track of this at all.
>>>>>>> +	 */
>>>>>>> +	for (u32 i = 0; i < last_flag; i++) {
>>>>>>> +		if (BIT(i) & PANTHOR_DEVICE_PROFILING_ALL)
>>>>>>> +			min_profiled_job_instrs =
>>>>>>> +				min(min_profiled_job_instrs, calc_job_credits(BIT(i)));
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	return DIV_ROUND_UP(cs_ringbuf_size, min_profiled_job_instrs * sizeof(u64));
>>>>>>> +}
>>>>>>
>>>>>> I may be missing something, but is there a situation where this is
>>>>>> different to calc_job_credits(0)? AFAICT the infrastructure you've added
>>>>>> can only add extra instructions to the no-flags case - whereas this
>>>>>> implies you're thinking that instructions may also be removed (or replaced).
>>>>>>
>>>>>> Steve
>>>>>
>>>>> Since we create a separate kernel BO to hold the profiling information slot, we
>>>>> need one that would be able to accomodate as many slots as the maximum number of
>>>>> profiled jobs we can insert simultaneously into the queue's ring buffer. Because
>>>>> profiled jobs always take more instructions than unprofiled ones, then we would
>>>>> usually need fewer slots than the number of unprofiled jobs we could insert at
>>>>> once in the ring buffer.
>>>>>
>>>>> Because we represent profiling metrics with a bit mask, then we need to test the
>>>>> size of the CS for every single metric enabled in isolation, since enabling more
>>>>> than one will always mean a bigger CS, and therefore fewer jobs tracked at once
>>>>> in the queue's ring buffer.
>>>>>
>>>>> In our case, calling calc_job_credits(0) would simply tell us the number of
>>>>> instructions we need for a normal job with no profiled features enabled, which
>>>>> would always requiere less instructions than profiled ones, and therefore more
>>>>> slots in the profiling info kernel BO. But we don't need to keep track of
>>>>> profiling numbers for unprofiled jobs, so there's no point in calculating this
>>>>> number.
>>>>>
>>>>> At first I was simply allocating a profiling info kernel BO as big as the number
>>>>> of simultaneous unprofiled job slots in the ring queue, but Boris pointed out
>>>>> that since queue ringbuffers can be as big as 2GiB, a lot of this memory would
>>>>> be wasted, since profiled jobs always require more slots because they hold more
>>>>> instructions, so fewer profiling slots in said kernel BO.
>>>>>
>>>>> The value of this approach will eventually manifest if we decided to keep track of
>>>>> more profiling metrics, since this code won't have to change at all, other than
>>>>> adding new profiling flags in the panthor_device_profiling_flags enum.
>>>>
>>>> Thanks for the detailed explanation. I think what I was missing is that
>>>> the loop is checking each bit flag independently and *not* checking
>>>> calc_job_credits(0).
>>>>
>>>> The check for (BIT(i) & PANTHOR_DEVICE_PROFILING_ALL) is probably what
>>>> confused me - that should be completely redundant. Or at least we need
>>>> something more intelligent if we have profiling bits which are not
>>>> mutually compatible.
>>>
>>> I thought of an alternative that would only test bits that are actually part of
>>> the mask:
>>>
>>> static u32 calc_profiling_ringbuf_num_slots(struct panthor_device *ptdev,
>>> 				       u32 cs_ringbuf_size)
>>> {
>>> 	u32 min_profiled_job_instrs = U32_MAX;
>>> 	u32 profiling_mask = PANTHOR_DEVICE_PROFILING_ALL;
>>>
>>> 	while (profiling_mask) {
>>> 		u32 i = ffs(profiling_mask) - 1;
>>> 		profiling_mask &= ~BIT(i);
>>> 		min_profiled_job_instrs =
>>> 			min(min_profiled_job_instrs, calc_job_credits(BIT(i)));
>>> 	}
>>>
>>> 	return DIV_ROUND_UP(cs_ringbuf_size, min_profiled_job_instrs * sizeof(u64));
>>> }
>>>
>>> However, I don't think this would be more efficient, because ffs() is probably
>>> fetching the first set bit by performing register shifts, and I guess this would
>>> take somewhat longer than iterating over every single bit from the last one,
>>> even if also matching them against the whole mask, just in case in future
>>> additions of performance metrics we decide to leave some of the lower
>>> significance bits untouched.
>>
>> Efficiency isn't very important here - we're not on a fast path, so it's
>> more about ensuring the code is readable. I don't think the above is
>> more readable then the original for loop.
>>
>>> Regarding your question about mutual compatibility, I don't think that is an
>>> issue here, because we're testing bits in isolation. If in the future we find
>>> out that some of the values we're profiling cannot be sampled at once, we can
>>> add that logic to the sysfs knob handler, to make sure UM cannot set forbidden
>>> profiling masks.
>>
>> My comment about compatibility is because in the original above you were
>> calculating the top bit of PANTHOR_DEVICE_PROFILING_ALL:
>>
>>> u32 last_flag = fls(PANTHOR_DEVICE_PROFILING_ALL);
>>
>> then looping between 0 and that bit:
>>
>>> for (u32 i = 0; i < last_flag; i++) {
>>
>> So the test:
>>
>>> if (BIT(i) & PANTHOR_DEVICE_PROFILING_ALL)
>>
>> would only fail if PANTHOR_DEVICE_PROFILING_ALL had gaps in the bits
>> that it set. The only reason I can think for that to be true in the
>> future is if there is some sort of incompatibility - e.g. maybe there's
>> an old and new way of doing some form of profiling with the old way
>> being kept for backwards compatibility. But I suspect if/when that is
>> required we'll need to revisit this function anyway. So that 'if'
>> statement seems completely redundant (it's trivially always true).
> 
> I think you're right about this. Would you be fine with the rest of the patch
> as it is in revision 8 if I also deleted this bitmask check?

Yes the rest of it looks fine.

Thanks,
Steve

>> Steve
>>
>>>> I'm also not entirely sure that the amount of RAM saved is significant,
>>>> but you've already written the code so we might as well have the saving ;)
>>>
>>> I think this was more evident before Boris suggested we reduce the basic slot
>>> size to that of a single cache line, because then the minimum profiled job
>>> might've taken twice as many ringbuffer slots as a nonprofiled one. In that
>>> case, we would need a half as big BO for holding the sampled data (in case the
>>> least size profiled job CS would extend over the 16 instruction boundary).
>>> I still think this is a good idea so that in the future we don't need to worry
>>> about adjusting the code that deals with preparing the right boilerplate CS,
>>> since it'll only be a matter of adding new instructions inside prepare_job_instrs().
>>>
>>>> Thanks,
>>>> Steve
>>>>
>>>>> Regards,
>>>>> Adrian
>>>>>
>>>>>>> +
>>>>>>>  static struct panthor_queue *
>>>>>>>  group_create_queue(struct panthor_group *group,
>>>>>>>  		   const struct drm_panthor_queue_create *args)
>>>>>>> @@ -3056,9 +3271,35 @@ group_create_queue(struct panthor_group *group,
>>>>>>>  		goto err_free_queue;
>>>>>>>  	}
>>>>>>>  
>>>>>>> +	queue->profiling.slot_count =
>>>>>>> +		calc_profiling_ringbuf_num_slots(group->ptdev, args->ringbuf_size);
>>>>>>> +
>>>>>>> +	queue->profiling.slots =
>>>>>>> +		panthor_kernel_bo_create(group->ptdev, group->vm,
>>>>>>> +					 queue->profiling.slot_count *
>>>>>>> +					 sizeof(struct panthor_job_profiling_data),
>>>>>>> +					 DRM_PANTHOR_BO_NO_MMAP,
>>>>>>> +					 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>>>>>>> +					 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
>>>>>>> +					 PANTHOR_VM_KERNEL_AUTO_VA);
>>>>>>> +
>>>>>>> +	if (IS_ERR(queue->profiling.slots)) {
>>>>>>> +		ret = PTR_ERR(queue->profiling.slots);
>>>>>>> +		goto err_free_queue;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	ret = panthor_kernel_bo_vmap(queue->profiling.slots);
>>>>>>> +	if (ret)
>>>>>>> +		goto err_free_queue;
>>>>>>> +
>>>>>>> +	/*
>>>>>>> +	 * Credit limit argument tells us the total number of instructions
>>>>>>> +	 * across all CS slots in the ringbuffer, with some jobs requiring
>>>>>>> +	 * twice as many as others, depending on their profiling status.
>>>>>>> +	 */
>>>>>>>  	ret = drm_sched_init(&queue->scheduler, &panthor_queue_sched_ops,
>>>>>>>  			     group->ptdev->scheduler->wq, 1,
>>>>>>> -			     args->ringbuf_size / (NUM_INSTRS_PER_SLOT * sizeof(u64)),
>>>>>>> +			     args->ringbuf_size / sizeof(u64),
>>>>>>>  			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
>>>>>>>  			     group->ptdev->reset.wq,
>>>>>>>  			     NULL, "panthor-queue", group->ptdev->base.dev);
>>>>>>> @@ -3354,6 +3595,7 @@ panthor_job_create(struct panthor_file *pfile,
>>>>>>>  {
>>>>>>>  	struct panthor_group_pool *gpool = pfile->groups;
>>>>>>>  	struct panthor_job *job;
>>>>>>> +	u32 credits;
>>>>>>>  	int ret;
>>>>>>>  
>>>>>>>  	if (qsubmit->pad)
>>>>>>> @@ -3407,9 +3649,16 @@ panthor_job_create(struct panthor_file *pfile,
>>>>>>>  		}
>>>>>>>  	}
>>>>>>>  
>>>>>>> +	job->profiling.mask = pfile->ptdev->profile_mask;
>>>>>>> +	credits = calc_job_credits(job->profiling.mask);
>>>>>>> +	if (credits == 0) {
>>>>>>> +		ret = -EINVAL;
>>>>>>> +		goto err_put_job;
>>>>>>> +	}
>>>>>>> +
>>>>>>>  	ret = drm_sched_job_init(&job->base,
>>>>>>>  				 &job->group->queues[job->queue_idx]->entity,
>>>>>>> -				 1, job->group);
>>>>>>> +				 credits, job->group);
>>>>>>>  	if (ret)
>>>>>>>  		goto err_put_job;
>>>>>>>  
>>>>>

