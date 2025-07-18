Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDD6B0A078
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 12:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5950010E942;
	Fri, 18 Jul 2025 10:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="OAjG/WbA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB9510E940;
 Fri, 18 Jul 2025 10:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aEtRLscCkdZ/WwAepzG57aESIU4DJhtby8VKrgzbpVc=; b=OAjG/WbAkf2JPPhKVLz02shunt
 cLywRymDx6MCh/2HqhIff+/SugpGEVm96Qut03cx2K+TU6kPK3a54ZYocYz40asIn/i66EW5cMaNj
 tZ12DzowwvKmROAJMwPQZM21v01floH9QXzeTTT7UmV8lgPAJNLLkb3TfXrzXTam/a2BgPIuxDFFl
 vL0y0/Fv/Xy3Lva3oMVd8XI0nr6DXn0oM17qsLaon7f2bBv2DXvBNfBMokMcK/zGbWcNnbp7Jee5C
 SMEHTaqLJuw5Wexa6fer1aBNWbz4sg9qpoVIrGlVwpwNW72QbOF+HQWeDqKmG2j5AGZiwK6QreWWq
 3AsiGbKA==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uciB9-000Wcn-Fx; Fri, 18 Jul 2025 12:18:59 +0200
Message-ID: <2ac70557-0295-4cc4-bfab-ed3452a72199@igalia.com>
Date: Fri, 18 Jul 2025 11:18:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Avoid double re-lock on the job free path
To: phasta@kernel.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>
References: <20250716085117.56864-1-tvrtko.ursulin@igalia.com>
 <8e527b62-d968-4bc3-a0dc-491d193c02ce@igalia.com>
 <52d32846-0286-4979-ab2f-c1aa1aa02e20@igalia.com>
 <f535c0bf-225a-40c9-b6a1-5bfbb5ebec0d@igalia.com>
 <b5ff1fba-0e2c-4d02-8b9d-49c3c313e65d@igalia.com>
 <c1c9bb53-399d-4f1a-a6de-8cf354c2e903@igalia.com>
 <ad66eeac-26d7-4f46-b29c-7b43ce793ea8@igalia.com>
 <3448a6cf097051ea9fbd5beba741b624c831df2c.camel@mailbox.org>
 <c4e252ba-6ac2-4115-9606-c7f6f18f1abf@igalia.com>
 <48c311e35a4ed983433fc049bf465edde7930405.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <48c311e35a4ed983433fc049bf465edde7930405.camel@mailbox.org>
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


On 18/07/2025 10:41, Philipp Stanner wrote:
> On Fri, 2025-07-18 at 10:35 +0100, Tvrtko Ursulin wrote:
>>
>> On 18/07/2025 10:31, Philipp Stanner wrote:
>>> On Fri, 2025-07-18 at 08:13 +0100, Tvrtko Ursulin wrote:
>>>>
>>>> On 16/07/2025 21:44, Maíra Canal wrote:
>>>>> Hi Tvrtko,
>>>>>
>>>>> On 16/07/25 11:46, Tvrtko Ursulin wrote:
>>>>>>
>>>>>> On 16/07/2025 15:30, Maíra Canal wrote:
>>>>>>> Hi Tvrtko,
>>>>>>>
>>>>>>> On 16/07/25 10:49, Tvrtko Ursulin wrote:
>>>>>>>>
>>>>>>>> On 16/07/2025 14:31, Maíra Canal wrote:
>>>>>>>>> Hi Tvrtko,
>>>>>>>>>
>>>>>>>>> On 16/07/25 05:51, Tvrtko Ursulin wrote:
>>>>>>>>>> Currently the job free work item will lock sched-
>>>>>>>>>>> job_list_lock
>>>>>>>>>> first time
>>>>>>>>>> to see if there are any jobs, free a single job, and
>>>>>>>>>> then lock
>>>>>>>>>> again to
>>>>>>>>>> decide whether to re-queue itself if there are more
>>>>>>>>>> finished jobs.
>>>>>>>>>>
>>>>>>>>>> Since drm_sched_get_finished_job() already looks at
>>>>>>>>>> the second job
>>>>>>>>>> in the
>>>>>>>>>> queue we can simply add the signaled check and have
>>>>>>>>>> it return the
>>>>>>>>>> presence
>>>>>>>>>> of more jobs to be freed to the caller. That way the
>>>>>>>>>> work item
>>>>>>>>>> does not
>>>>>>>>>> have to lock the list again and repeat the signaled
>>>>>>>>>> check.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Tvrtko Ursulin
>>>>>>>>>> <tvrtko.ursulin@igalia.com>
>>>>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>>>>>>>> Cc: Maíra Canal <mcanal@igalia.com>
>>>>>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>>> Cc: Philipp Stanner <phasta@kernel.org>
>>>>>>>>>> ---
>>>>>>>>>> v2:
>>>>>>>>>>     * Improve commit text and kerneldoc. (Philipp)
>>>>>>>>>>     * Rename run free work helper. (Philipp)
>>>>>>>>>>
>>>>>>>>>> v3:
>>>>>>>>>>     * Rebase on top of Maira's changes.
>>>>>>>>>> ---
>>>>>>>>>>     drivers/gpu/drm/scheduler/sched_main.c | 53
>>>>>>>>>> +++++++++
>>>>>>>>>> +----------------
>>>>>>>>>>     1 file changed, 21 insertions(+), 32 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>> b/drivers/gpu/
>>>>>>>>>> drm/ scheduler/sched_main.c
>>>>>>>>>> index e2cda28a1af4..5a550fd76bf0 100644
>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>> @@ -349,34 +349,13 @@ static void
>>>>>>>>>> drm_sched_run_job_queue(struct
>>>>>>>>>> drm_gpu_scheduler *sched)
>>>>>>>>>>     }
>>>>>>>>>>     /**
>>>>>>>>>> - * __drm_sched_run_free_queue - enqueue free-job
>>>>>>>>>> work
>>>>>>>>>> - * @sched: scheduler instance
>>>>>>>>>> - */
>>>>>>>>>> -static void __drm_sched_run_free_queue(struct
>>>>>>>>>> drm_gpu_scheduler
>>>>>>>>>> *sched)
>>>>>>>>>> -{
>>>>>>>>>> -    if (!READ_ONCE(sched->pause_submit))
>>>>>>>>>> -        queue_work(sched->submit_wq, &sched-
>>>>>>>>>>> work_free_job);
>>>>>>>>>> -}
>>>>>>>>>> -
>>>>>>>>>> -/**
>>>>>>>>>> - * drm_sched_run_free_queue - enqueue free-job work
>>>>>>>>>> if ready
>>>>>>>>>> + * drm_sched_run_free_queue - enqueue free-job work
>>>>>>>>>>      * @sched: scheduler instance
>>>>>>>>>>      */
>>>>>>>>>>     static void drm_sched_run_free_queue(struct
>>>>>>>>>> drm_gpu_scheduler
>>>>>>>>>> *sched)
>>>>>>>>>>     {
>>>>>>>>>> -    struct drm_sched_job *job;
>>>>>>>>>> -
>>>>>>>>>> -    job = list_first_entry_or_null(&sched-
>>>>>>>>>>> pending_list,
>>>>>>>>>> -                       struct drm_sched_job, list);
>>>>>>>>>> -    if (job && dma_fence_is_signaled(&job->s_fence-
>>>>>>>>>>> finished))
>>>>>>>>>> -        __drm_sched_run_free_queue(sched);
>>>>>>>>>
>>>>>>>>> I believe we'd still need this chunk for
>>>>>>>>> DRM_GPU_SCHED_STAT_NO_HANG
>>>>>>>>> (check the comment in
>>>>>>>>> drm_sched_job_reinsert_on_false_timeout()). How
>>>>>>>>
>>>>>>>> You mean the "is there a signaled job in the list check"
>>>>>>>> is needed
>>>>>>>> for drm_sched_job_reinsert_on_false_timeout()? Hmm why?
>>>>>>>> Worst case
>>>>>>>> is a false positive wakeup on the free worker, no?
>>>>>>>
>>>>>>> Correct me if I'm mistaken, we would also have a false
>>>>>>> positive wake-up
>>>>>>> on the run_job worker, which I believe it could be
>>>>>>> problematic in the
>>>>>>> cases that we skipped the reset because the job is still
>>>>>>> running.
>>>>>>
>>>>>> Run job worker exits when it sees no free credits so I don't
>>>>>> think
>>>>>> there is a problem. What am I missing?
>>>>>>
>>>>>
>>>>> I was the one missing the code in `drm_sched_can_queue()`.
>>>>> Sorry for the
>>>>> misleading comments. This is:
>>>>>
>>>>> Reviewed-by: Maíra Canal <mcanal@igalia.com>
>>>>
>>>> No worries, and thanks!
>>>>
>>>> Philipp - are you okay with this version? V2 was done to address
>>>> your
>>>> feedback so that should be good now.
>>>
>>> Was just giving it another spin when you wrote. (a [PATCH v3]
>>> would've
>>> been neat for identification, though – I almost pulled the wrong
>>> patch
>>> from the archive *wink*)
>>
>> Oops, my bad.
>>
>>> LGTM, improves things, can be merged.
>>>
>>> However, we had to merge Lin Cao's bug fix [1] recently. That one
>>> is
>>> now in drm-misc-fixes, and your patch should go to drm-misc-next.
>>> This
>>> would cause a conflict once the two branches meet.
>>>
>>> So I suggest that we wait with this non-urgent patch until drm-
>>> misc-
>>> fixes / Linus's -rc gets merged into drm-misc-next, and then we
>>> apply
>>> it. Should be next week or the week after AFAIK.
>>>
>>> Unless somebody has a better idea, of course?
>>
>> Lin's patch touches sched_entity.c only and mine only sched_main.c -
>> ie.
>> no conflict AFAICT?
> 
> Aaahhh, I had a hallucination ^^'
> 
> It doesn't apply to drm-misc-fixes, but that is because fixes misses
> changes that yours is based on. Because Lin's patch was the last thing
> I touched on that branch I seem to have jumped to that conclusion.
> 
> Should be fine, then. My bad.
> 
> Will apply.

Thank you!

This enables me to send out a rebase of the fair DRM scheduler series soon.

Regards,

Tvrtko

>>> Remind me in case I forget.
>>>
>>>
>>> P.
>>>
>>> [1]
>>> https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/15f77764e90a713ee3916ca424757688e4f565b9
>>>
>>>
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>
>>
> 

