Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4FFD24A36
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 14:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA9310E74B;
	Thu, 15 Jan 2026 13:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HY9RN5iy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67D310E74B;
 Thu, 15 Jan 2026 13:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hI2XGBmnAx7AK0CnYLPJQo6KsOpGL5RfbYsXGfWU2vo=; b=HY9RN5iyIM/tyNsTZC8OcyUcAk
 qsBJwq/0EbH7XKEd7Kq+B0QHTLZs3pbHFIUMjx16jms0sKjBsyboGrTJc7in02xmVIkTNxUTg9aZq
 5Coj6FVRb+z316dcUU98jA1jCYFuz0rYjkrCaqTs75X5dvtlZd0vvdXCMGO3eDgL4FwL7j0JyOCaQ
 p5YUGfwIP80F3TKzGQmi9/LGCPr82v4SXLxSHHQJvauAz7oMpvuwl8FFz0dZDDC3Tk7vO8w3ODqtn
 x4nOXSMqBltw0mBp1vrBKnC6dvs9qkLwp6zjhGuxy/35baJ8ISNeUF+nKIbv2uHTI2L5k35sLT0Wh
 JAqtOy5A==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vgMxL-005ju1-W9; Thu, 15 Jan 2026 14:00:08 +0100
Message-ID: <7b1d848c-a0e3-4960-94da-4f9001c1d96f@igalia.com>
Date: Thu, 15 Jan 2026 13:00:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/28] drm/sched: Add fair scheduling policy
To: Danilo Krummrich <dakr@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20251219135351.25880-1-tvrtko.ursulin@igalia.com>
 <20251219135351.25880-10-tvrtko.ursulin@igalia.com>
 <DFONORJMB1ZM.1JHSIXB9ULHJV@kernel.org>
 <1fceb644-ff22-45c8-bd83-4a32786c35f2@igalia.com>
 <DFP4XVVKNIRC.2O817MGMKCQ3P@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <DFP4XVVKNIRC.2O817MGMKCQ3P@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 15/01/2026 11:44, Danilo Krummrich wrote:
> On Thu Jan 15, 2026 at 9:28 AM CET, Tvrtko Ursulin wrote:
>>
>> On 14/01/2026 22:13, Danilo Krummrich wrote:
>>> On Fri Dec 19, 2025 at 2:53 PM CET, Tvrtko Ursulin wrote:
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
>>>> index 2d1f579d8352..2fde309d02a6 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_rq.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
>>>> @@ -16,6 +16,35 @@ drm_sched_entity_compare_before(struct rb_node *a, const struct rb_node *b)
>>>>    	return ktime_before(ea->oldest_job_waiting, eb->oldest_job_waiting);
>>>>    }
>>>>    
>>>> +static void drm_sched_rq_update_prio(struct drm_sched_rq *rq)
>>>> +{
>>>> +	enum drm_sched_priority prio = DRM_SCHED_PRIORITY_INVALID;
>>>> +	struct rb_node *rb;
>>>> +
>>>> +	lockdep_assert_held(&rq->lock);
>>>> +
>>>> +	rb = rb_first_cached(&rq->rb_tree_root);
>>>> +	if (rb) {
>>>> +		struct drm_sched_entity *entity =
>>>> +			rb_entry(rb, typeof(*entity), rb_tree_node);
>>>> +
>>>> +		/*
>>>> +		 * The normal locking order is entity then run-queue so taking
>>>> +		 * the entity lock here would be a locking inversion for the
>>>> +		 * case when the current head of the run-queue is different from
>>>> +		 * the one we already have locked. The unlocked read is fine
>>>> +		 * though, because if the priority had just changed it is no big
>>>> +		 * deal for our algorithm, but just a transient reachable only
>>>> +		 * by drivers with userspace dynamic priority changes API. Equal
>>>> +		 * in effect to the priority change becoming visible a few
>>>> +		 * instructions later.
>>>> +		 */
>>>> +		prio = READ_ONCE(entity->priority);
>>>
>>> I still think that we should address the root cause of the lock inversion
>>> problem instead.
>>>
>>> I previously mentioned that I can take a look at this beginning of this year,
>>> which I can do soon.
>>>
>>> In the meantime, can you please explain what's the problem with this specific
>>> case? This function is only ever called from drm_sched_rq_remove_fifo_locked()
>>> and drm_sched_rq_update_fifo_locked(), which already seem to hold both locks.
>>
>> The entity which is locked is likely not the same as entity at the head
>> of the run-queue from either call chains.
>>
>> In one case we have just removed the locked entity from the run-queue,
>> while in the other tree has been re-balanced so a different entity may
>> have taken the head position.
> 
> Ick! That makes it even worse because this would mean that even if we would be
> able to take the entity lock here, this is also prone to lock inversion between
> entities.

Not sure what you mean by also an even worse? It is the same entity->rq 
vs rq->entity lock order inversion. What other inversion is there?

> I.e. that is a huge indicator that it is even more necessary to revisit locking
> design in general.
> 
>> Also to note is 99% of cases entity->priority is invariant. Only amdgpu
>> allows for change of priority post entity creation. So for the rest
>> locking would not gain anything.
>>
>> Even for amdgpu the unlocked read is not very relevant, since the only
>> thing this is used is to determine the run-queue insertion position of a
>> re-joining entity. So worst thing that could happen, if userspace thread
>> would race set priority with the job worker picking the next job, is to
>> *one time* pick a different job.
> 
> I get that; it is less that dealing with the priority field by itself is a huge
> issue we can't handle, it is more that the above workaround clearly points out a
> (locking) design issue, which we should not ignore. It's not only about code
> the code working or being correct, it's also about maintainability.
> 
> (Even though I'm aware that DRM scheduler maintainability is a bit the DRM
> equivalent of the infamous 3x+1 problem. :)
> 
>> Also to address the root cause of the lock inversion would IMHO be to
>> re-design the whole scheduler and this specific function here does not
>> seem should be the trigger for that.
> 
> I'm not sure it is that bad, let me take a look in the next days and see what
> options we have.

Okay but I am sure you know there are memory barriers, RCU, SPSC queue, 
completions, worker management, and at least two locks, and everything 
is interdependent. This series at least removes a bunch of code without 
making things more complicated and so can be a good base for further 
rework. If you suggest to hold it until all of the above is resolved it 
will be a few more years easily.

Regards,

Tvrtko

