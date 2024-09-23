Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF6597F1BB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 22:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A725810E18B;
	Mon, 23 Sep 2024 20:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="SX65W5Er";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982C410E18B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 20:44:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727124239; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bbv/4jCMcBOF5HgaymPjh0y1vjUro6JqYjTkAQRqQmulsOJqeKs2Le0SIchOvB2Q0B6wfm3rde/YFsd67lsr0kxlYMtdBJ6/IrSelelLR0MQSg64yc25IZ5NevqC81riDRIC3vcBdtO/zooULdJBZGjjKCh0QCZFQuMhk4ZDZw8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1727124239;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=qO5/iZDqFuCKnKM9suqmYmujHR/uSc9bE+582ofPyHU=; 
 b=dXWcUoAY0djTkMhD/6I1p+uEpjFeMxow1puDsxg1Wzvw4z6EsrnkE98zv0gOApE8BQIWer+3R1N7LdDI0zFxfKK0qaFRFdewv7I8XVpWs32irJNLjM6hZ2YCQ3yEy5E6h8HwXr1aDodrdctE5p92SQBFQWuVfo5uVbSEP1ou+WA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727124239; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=qO5/iZDqFuCKnKM9suqmYmujHR/uSc9bE+582ofPyHU=;
 b=SX65W5ErjI0YyRfd7AIvRguc4ci8xer09iy9h4AJHDQtcTp+DUXALfXRh47rpEYU
 Bst49mOvfbOs8IBnkwS4FKAYuQfMupPxTUWd8+I3NWM9JtWlLBxBtGYcjaHsNLk9cFm
 1srQaTuMeB9Q33XIypItRHAImFU+rSFxH6uXqkn0=
Received: by mx.zohomail.com with SMTPS id 1727124238084594.9642189780285;
 Mon, 23 Sep 2024 13:43:58 -0700 (PDT)
Date: Mon, 23 Sep 2024 21:43:53 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v6 1/5] drm/panthor: introduce job cycle and timestamp
 accounting
Message-ID: <jgdknf77n6vqanh4jv2yixe4n4hsbhqqhth4beued4topggwgz@wx7bumhrbpje>
References: <5c4d1008-261f-4c47-ab73-c527675484a4@arm.com>
 <bq6lctwgpsxvrdaajmjo3xdjt32srmsxvjhtzyebdj6izjzoaw@6duby4axg3pf>
 <ef799587-f7c2-472a-8550-9c40a395eccb@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef799587-f7c2-472a-8550-9c40a395eccb@arm.com>
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

Hi Steve,

On 23.09.2024 09:55, Steven Price wrote:
>On 20/09/2024 23:36, Adrián Larumbe wrote:
>> Hi Steve, thanks for the review.
>
>Hi Adrián,
>
>> I've applied all of your suggestions for the next patch series revision, so I'll
>> only be answering to your question about the calc_profiling_ringbuf_num_slots
>> function further down below.
>> 
>
>[...]
>
>>>> @@ -3003,6 +3190,34 @@ static const struct drm_sched_backend_ops panthor_queue_sched_ops = {
>>>>  	.free_job = queue_free_job,
>>>>  };
>>>>  
>>>> +static u32 calc_profiling_ringbuf_num_slots(struct panthor_device *ptdev,
>>>> +				       u32 cs_ringbuf_size)
>>>> +{
>>>> +	u32 min_profiled_job_instrs = U32_MAX;
>>>> +	u32 last_flag = fls(PANTHOR_DEVICE_PROFILING_ALL);
>>>> +
>>>> +	/*
>>>> +	 * We want to calculate the minimum size of a profiled job's CS,
>>>> +	 * because since they need additional instructions for the sampling
>>>> +	 * of performance metrics, they might take up further slots in
>>>> +	 * the queue's ringbuffer. This means we might not need as many job
>>>> +	 * slots for keeping track of their profiling information. What we
>>>> +	 * need is the maximum number of slots we should allocate to this end,
>>>> +	 * which matches the maximum number of profiled jobs we can place
>>>> +	 * simultaneously in the queue's ring buffer.
>>>> +	 * That has to be calculated separately for every single job profiling
>>>> +	 * flag, but not in the case job profiling is disabled, since unprofiled
>>>> +	 * jobs don't need to keep track of this at all.
>>>> +	 */
>>>> +	for (u32 i = 0; i < last_flag; i++) {
>>>> +		if (BIT(i) & PANTHOR_DEVICE_PROFILING_ALL)
>>>> +			min_profiled_job_instrs =
>>>> +				min(min_profiled_job_instrs, calc_job_credits(BIT(i)));
>>>> +	}
>>>> +
>>>> +	return DIV_ROUND_UP(cs_ringbuf_size, min_profiled_job_instrs * sizeof(u64));
>>>> +}
>>>
>>> I may be missing something, but is there a situation where this is
>>> different to calc_job_credits(0)? AFAICT the infrastructure you've added
>>> can only add extra instructions to the no-flags case - whereas this
>>> implies you're thinking that instructions may also be removed (or replaced).
>>>
>>> Steve
>> 
>> Since we create a separate kernel BO to hold the profiling information slot, we
>> need one that would be able to accomodate as many slots as the maximum number of
>> profiled jobs we can insert simultaneously into the queue's ring buffer. Because
>> profiled jobs always take more instructions than unprofiled ones, then we would
>> usually need fewer slots than the number of unprofiled jobs we could insert at
>> once in the ring buffer.
>> 
>> Because we represent profiling metrics with a bit mask, then we need to test the
>> size of the CS for every single metric enabled in isolation, since enabling more
>> than one will always mean a bigger CS, and therefore fewer jobs tracked at once
>> in the queue's ring buffer.
>> 
>> In our case, calling calc_job_credits(0) would simply tell us the number of
>> instructions we need for a normal job with no profiled features enabled, which
>> would always requiere less instructions than profiled ones, and therefore more
>> slots in the profiling info kernel BO. But we don't need to keep track of
>> profiling numbers for unprofiled jobs, so there's no point in calculating this
>> number.
>> 
>> At first I was simply allocating a profiling info kernel BO as big as the number
>> of simultaneous unprofiled job slots in the ring queue, but Boris pointed out
>> that since queue ringbuffers can be as big as 2GiB, a lot of this memory would
>> be wasted, since profiled jobs always require more slots because they hold more
>> instructions, so fewer profiling slots in said kernel BO.
>> 
>> The value of this approach will eventually manifest if we decided to keep track of
>> more profiling metrics, since this code won't have to change at all, other than
>> adding new profiling flags in the panthor_device_profiling_flags enum.
>
>Thanks for the detailed explanation. I think what I was missing is that
>the loop is checking each bit flag independently and *not* checking
>calc_job_credits(0).
>
>The check for (BIT(i) & PANTHOR_DEVICE_PROFILING_ALL) is probably what
>confused me - that should be completely redundant. Or at least we need
>something more intelligent if we have profiling bits which are not
>mutually compatible.

I thought of an alternative that would only test bits that are actually part of
the mask:

static u32 calc_profiling_ringbuf_num_slots(struct panthor_device *ptdev,
				       u32 cs_ringbuf_size)
{
	u32 min_profiled_job_instrs = U32_MAX;
	u32 profiling_mask = PANTHOR_DEVICE_PROFILING_ALL;

	while (profiling_mask) {
		u32 i = ffs(profiling_mask) - 1;
		profiling_mask &= ~BIT(i);
		min_profiled_job_instrs =
			min(min_profiled_job_instrs, calc_job_credits(BIT(i)));
	}

	return DIV_ROUND_UP(cs_ringbuf_size, min_profiled_job_instrs * sizeof(u64));
}

However, I don't think this would be more efficient, because ffs() is probably
fetching the first set bit by performing register shifts, and I guess this would
take somewhat longer than iterating over every single bit from the last one,
even if also matching them against the whole mask, just in case in future
additions of performance metrics we decide to leave some of the lower
significance bits untouched.

Regarding your question about mutual compatibility, I don't think that is an
issue here, because we're testing bits in isolation. If in the future we find
out that some of the values we're profiling cannot be sampled at once, we can
add that logic to the sysfs knob handler, to make sure UM cannot set forbidden
profiling masks.

>I'm also not entirely sure that the amount of RAM saved is significant,
>but you've already written the code so we might as well have the saving ;)

I think this was more evident before Boris suggested we reduce the basic slot
size to that of a single cache line, because then the minimum profiled job
might've taken twice as many ringbuffer slots as a nonprofiled one. In that
case, we would need a half as big BO for holding the sampled data (in case the
least size profiled job CS would extend over the 16 instruction boundary).
I still think this is a good idea so that in the future we don't need to worry
about adjusting the code that deals with preparing the right boilerplate CS,
since it'll only be a matter of adding new instructions inside prepare_job_instrs().

>Thanks,
>Steve
>
>> Regards,
>> Adrian
>> 
>>>> +
>>>>  static struct panthor_queue *
>>>>  group_create_queue(struct panthor_group *group,
>>>>  		   const struct drm_panthor_queue_create *args)
>>>> @@ -3056,9 +3271,35 @@ group_create_queue(struct panthor_group *group,
>>>>  		goto err_free_queue;
>>>>  	}
>>>>  
>>>> +	queue->profiling.slot_count =
>>>> +		calc_profiling_ringbuf_num_slots(group->ptdev, args->ringbuf_size);
>>>> +
>>>> +	queue->profiling.slots =
>>>> +		panthor_kernel_bo_create(group->ptdev, group->vm,
>>>> +					 queue->profiling.slot_count *
>>>> +					 sizeof(struct panthor_job_profiling_data),
>>>> +					 DRM_PANTHOR_BO_NO_MMAP,
>>>> +					 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>>>> +					 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
>>>> +					 PANTHOR_VM_KERNEL_AUTO_VA);
>>>> +
>>>> +	if (IS_ERR(queue->profiling.slots)) {
>>>> +		ret = PTR_ERR(queue->profiling.slots);
>>>> +		goto err_free_queue;
>>>> +	}
>>>> +
>>>> +	ret = panthor_kernel_bo_vmap(queue->profiling.slots);
>>>> +	if (ret)
>>>> +		goto err_free_queue;
>>>> +
>>>> +	/*
>>>> +	 * Credit limit argument tells us the total number of instructions
>>>> +	 * across all CS slots in the ringbuffer, with some jobs requiring
>>>> +	 * twice as many as others, depending on their profiling status.
>>>> +	 */
>>>>  	ret = drm_sched_init(&queue->scheduler, &panthor_queue_sched_ops,
>>>>  			     group->ptdev->scheduler->wq, 1,
>>>> -			     args->ringbuf_size / (NUM_INSTRS_PER_SLOT * sizeof(u64)),
>>>> +			     args->ringbuf_size / sizeof(u64),
>>>>  			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
>>>>  			     group->ptdev->reset.wq,
>>>>  			     NULL, "panthor-queue", group->ptdev->base.dev);
>>>> @@ -3354,6 +3595,7 @@ panthor_job_create(struct panthor_file *pfile,
>>>>  {
>>>>  	struct panthor_group_pool *gpool = pfile->groups;
>>>>  	struct panthor_job *job;
>>>> +	u32 credits;
>>>>  	int ret;
>>>>  
>>>>  	if (qsubmit->pad)
>>>> @@ -3407,9 +3649,16 @@ panthor_job_create(struct panthor_file *pfile,
>>>>  		}
>>>>  	}
>>>>  
>>>> +	job->profiling.mask = pfile->ptdev->profile_mask;
>>>> +	credits = calc_job_credits(job->profiling.mask);
>>>> +	if (credits == 0) {
>>>> +		ret = -EINVAL;
>>>> +		goto err_put_job;
>>>> +	}
>>>> +
>>>>  	ret = drm_sched_job_init(&job->base,
>>>>  				 &job->group->queues[job->queue_idx]->entity,
>>>> -				 1, job->group);
>>>> +				 credits, job->group);
>>>>  	if (ret)
>>>>  		goto err_put_job;
>>>>  
>> 


Adrian Larumbe
