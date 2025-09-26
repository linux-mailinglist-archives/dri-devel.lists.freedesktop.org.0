Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C190CBA2F0C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 10:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D36210E9FF;
	Fri, 26 Sep 2025 08:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="unR/6/6h";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="aPCMQVM9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A16B10E9FF
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 08:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1758875193;
 bh=F2OzFM3T9UbaWHojhoseCQw
 u6OLvdoYSG4Ss6eGnrQM=; b=unR/6/6h1PiOR5EX8XTZn6gJDTuqDpoYc4VyHYVQp7FDosVOlO
 8d6SR084FA9qAfws85M4EEsMm77x/QfZU0cp5CZuDlfO8FMc+h/0a6l5C/LG49o1YJbCyYFMENy
 f30lTQpCUaTjYvravNwE/X+iXPOxK14vvE3ggCYXeSuZ+432BQJiSgB1sGAkyHCnSRfkVMFTlQq
 h3zJblN1v1Ucf1jxZWoYttItbtHRnctUcJrn0Z2O+b+JqNSV67QDiMF7sppdojTUUijU5vUvKw4
 ArNX/ChgflWmMe9ZVRo6Y2kKxUB5B/mBqRGKSEvqsd6DfdR87Y32Z7a2yPLiXFfCajA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1758875193; bh=F2OzFM3T9UbaWHojhoseCQw
 u6OLvdoYSG4Ss6eGnrQM=; b=aPCMQVM9cp+MhVLlfuG5SFG1R0W4wX+MGuk4gYPTkhrQZvT1pl
 zr3dzBbv9Dsl8vFoyaz1hVOJHCP3YziEWICQ==;
Message-ID: <1eeb09dd-a27e-478f-a0f1-30d059f20018@damsy.net>
Date: Fri, 26 Sep 2025 10:26:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/sched: limit sched score update to jobs change
To: Tvrtko Ursulin <tursulin@ursulin.net>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Philipp Stanner <phasta@kernel.org>
References: <20250822134348.6819-1-pierre-eric.pelloux-prayer@amd.com>
 <20250822134348.6819-2-pierre-eric.pelloux-prayer@amd.com>
 <abb776bc-5b13-4db7-9421-59259119b859@ursulin.net>
 <5183ed88-1634-42c2-9bd8-ed0e626f877b@damsy.net>
 <f5a7ceb4-2313-48b9-bf75-628e9ad91757@ursulin.net>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <f5a7ceb4-2313-48b9-bf75-628e9ad91757@ursulin.net>
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



Le 26/09/2025 à 10:24, Tvrtko Ursulin a écrit :
> 
> On 26/09/2025 09:20, Pierre-Eric Pelloux-Prayer wrote:
>> Hi,
>>
>> Le 01/09/2025 à 11:20, Tvrtko Ursulin a écrit :
>>>
>>>
>>> + Tomeu and Oded
>>>
>>> On 22/08/2025 14:43, Pierre-Eric Pelloux-Prayer wrote:
>>>> Currently, the scheduler score is incremented when a job is pushed to an
>>>> entity and when an entity is attached to the scheduler.
>>>>
>>>> This leads to some bad scheduling decision where the score value is
>>>> largely made of idle entities.
>>>>
>>>> For instance, a scenario with 2 schedulers and where 10 entities submit
>>>> a single job, then do nothing, each scheduler will probably end up with
>>>> a score of 5.
>>>> Now, 5 userspace apps exit, so their entities will be dropped. In
>>>> the worst case, these apps' entities where all attached to the same
>>>> scheduler and we end up with score=5 (the 5 remaining entities) and
>>>> score=0, despite the 2 schedulers being idle.
>>>> When new entities show up, they will all select the second scheduler
>>>> based on its low score value, instead of alternating between the 2.
>>>>
>>>> Some amdgpu rings depended on this feature, but the previous commit
>>>> implemented the same thing in amdgpu directly so it can be safely
>>>> removed from drm/sched.
>>>>
>>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux- prayer@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/scheduler/sched_main.c | 2 --
>>>>   1 file changed, 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/ drm/ 
>>>> scheduler/sched_main.c
>>>> index 5a550fd76bf0..e6d232a8ec58 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -206,7 +206,6 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>>>       if (!list_empty(&entity->list))
>>>>           return;
>>>> -    atomic_inc(rq->sched->score);
>>>>       list_add_tail(&entity->list, &rq->entities);
>>>>   }
>>>> @@ -228,7 +227,6 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>       spin_lock(&rq->lock);
>>>> -    atomic_dec(rq->sched->score);
>>>>       list_del_init(&entity->list);
>>>>       if (rq->current_entity == entity)
>>>
>>> LGTM.
>>>
>>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>
>>
>> Thanks.
>>
>>> Only detail is, I did a revisit of the scheduler users and it looks like the 
>>> new rocket driver is the only one other than amdgpu which passes a list of 
>>> more than one scheduler to drm_sched_entity_init. I don't *think* it would be 
>>> affected though. It would still pick the least loaded (based on active jobs) 
>>> scheduler at job submit time. Unless there is some hidden behaviour in that 
>>> driver where it would be important to consider number of entities too. 
>>> Anyway, it would be good for rocket driver to double-check and ack.
>>>
>>
>> Tomeu, Oded: any concerns about this change?
> 
> Tomeu acked it in case you missed it:
> 
> https://lore.kernel.org/dri-devel/20250822134348.6819-1-pierre-eric.pelloux- 
> prayer@amd.com/T/#m4efa0d69211b2bb378cfb302e459faa30e57f58c

Indeed I missed it, sorry!

I'll update patch 1/2 based on Philipp's comment and send v2 then.

Thanks.

