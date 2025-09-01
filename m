Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C852B3E458
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 15:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9137E10E039;
	Mon,  1 Sep 2025 13:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="JEIZaDVs";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="x8hDoZTV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1208510E039
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 13:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1756732446;
 bh=7ECHN7M/kl3GQF4/8IGepx+
 i7mB1UdMquaG7D1kI94Y=; b=JEIZaDVseVv66Xf/O+7mENL/rSPdZKDxm+P1qfrfG2sKe9cGMm
 Va2nEqyBaE5cye8aVnHTwcGlR8tSrPNYfbclbY997f3EqaXnBwCO37poOluQSh5vOjD34OjVJUU
 4VRqHA8ALueGYGeoZhBFGw54pTLRNWFqY1MMDMa4voXWVTtUPhZWZVd9+ZPS5byObB4a4qqL53m
 akRFj/NFx5rCX9basg3m360cpHoIDGRGArjKOIqL3+Mjs0BD+Zn/6P5WCdCum4mNQ1G3g0Y46+f
 yMyKpBzh5qjMjWcDb073uaOlBJc9dKYssMCBHSD/F0NYFogg9LkIOsy6vNcMkqpS4Zg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1756732446; bh=7ECHN7M/kl3GQF4/8IGepx+
 i7mB1UdMquaG7D1kI94Y=; b=x8hDoZTVgRBGz3D10HTukWs4uUrl5iV9qZcHI/xxwHu1JkajeL
 K1/FU2cv41gjf0Hzp10Zq5ZHTLpC9we09oCQ==;
Message-ID: <b1a8f459-93dd-4b6c-b29e-c68fba19f6fc@damsy.net>
Date: Mon, 1 Sep 2025 15:14:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/sched: limit sched score update to jobs change
To: phasta@kernel.org,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250822134348.6819-1-pierre-eric.pelloux-prayer@amd.com>
 <20250822134348.6819-2-pierre-eric.pelloux-prayer@amd.com>
 <9b68898ca34483b52d7f4510747a20bce52751c7.camel@mailbox.org>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <9b68898ca34483b52d7f4510747a20bce52751c7.camel@mailbox.org>
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



Le 25/08/2025 à 15:13, Philipp Stanner a écrit :
> On Fri, 2025-08-22 at 15:43 +0200, Pierre-Eric Pelloux-Prayer wrote:
>> Currently, the scheduler score is incremented when a job is pushed to an
>> entity and when an entity is attached to the scheduler.
> 
> It's indeed awkward why attaching is treated equivalently to job
> submission.
> 
> Can you expand the documentation for drm_sched_init_args a bit so that
> it gets clearer what the score is supposed to do?


drm_sched_init_args.score is the feature allowing multiple schedulers to share a 
score so I suppose you meant drm_gpu_scheduler.score?

The doc currently says "score to help loadbalancer pick a idle sched" which is a 
bit vague. It could be modified to become:

   @score: holds the number of yet-to-be-completed jobs pushed to each scheduler.
           It's used when load balancing between different schedulers.

What do you think?

> 
>>
>> This leads to some bad scheduling decision where the score value is
>> largely made of idle entities.
>>
>> For instance, a scenario with 2 schedulers and where 10 entities submit
>> a single job, then do nothing, each scheduler will probably end up with
>> a score of 5.
>> Now, 5 userspace apps exit, so their entities will be dropped.
>>
> 
> "entities will be dropped" == "drm_sched_entity_kill() gets called",
> right?

Yes.

>> In
>> the worst case, these apps' entities where all attached to the same
> 
> s/where/were
> 
> or better yet: "could be"

Will fix, thanks.

> 
>> scheduler and we end up with score=5 (the 5 remaining entities) and
>> score=0, despite the 2 schedulers being idle.
> 
> Sounds indeed like a (small) problem to me.
> 
> 
>> When new entities show up, they will all select the second scheduler
>> based on its low score value, instead of alternating between the 2.
>>
>> Some amdgpu rings depended on this feature, but the previous commit
>> implemented the same thing in amdgpu directly so it can be safely
>> removed from drm/sched.
> 
> Can we be that sure that other drivers don't depend on it, though? I
> suspect it's likely that it's just amdgpu, but…
> 

Aside from the new "rocket" as pointed out by Tvrtko, amdgpu is the only driver 
passing more than one schedulers to entities so they're the only ones that could 
be affected.

I verified amdgpu and Tvrtko pinged the rocket maintainers in the other thread.

> 
> 
> BTW, since you're cleaning up related stuff currently: I saw that it
> seems that the only driver that sets &struct drm_sched_init_args.score
> is amdgpu. Would be cool if you can take a look whether that's still
> needed.

It cannot really be removed yet as it's useful when a single hardware block is 
exposed through different schedulers (so pushing jobs to one of the schedulers 
should increase the load of the underlying hw).

Thanks,
Pierre-Eric

> 
> 
> P.
> 
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 5a550fd76bf0..e6d232a8ec58 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -206,7 +206,6 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>   	if (!list_empty(&entity->list))
>>   		return;
>>   
>> -	atomic_inc(rq->sched->score);
>>   	list_add_tail(&entity->list, &rq->entities);
>>   }
>>   
>> @@ -228,7 +227,6 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>   
>>   	spin_lock(&rq->lock);
>>   
>> -	atomic_dec(rq->sched->score);
>>   	list_del_init(&entity->list);
>>   
>>   	if (rq->current_entity == entity)
