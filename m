Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E735971AFD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 15:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A268010E56D;
	Mon,  9 Sep 2024 13:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="m9E5qXxF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615F710E56D;
 Mon,  9 Sep 2024 13:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2yQhDSOt8/EbRfKKNAwDkSfCqLJvpk2XxpjWlczDXx0=; b=m9E5qXxFoF4mNLRawylfn7rXdn
 LcH8twcuwCQmynPhgg4WdlMJ417rgdGRMuREnsimQWMzv0RXF04dGroKUMAigd/DkHjzNwSywraQb
 b8HJ+fPA+yCkBzHeH1dDqfZXEC1kmbPz/d21iRsj8c2845Xset4hPpmDPjPuh0fBlQeWO3i4ZS4IG
 y6KaW+ds8p+pugG6rmSmvJpYFfh31n6ltEV7euxoLkwNB+hJzhF/IFCQJ7+uR2lmvnA7YBcpPi7CQ
 eLhc3bl+Iw2rjuIDLB8+KKB28r21pcwI/wxV2/TzBmNNSTGc5ovO7nBymYISKBS+ounhkRiGl6DxI
 LFMfw58Q==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sneQG-00BYyl-NE; Mon, 09 Sep 2024 15:27:16 +0200
Message-ID: <1848b0fc-7031-46f2-b7f8-f7c086fb00ce@igalia.com>
Date: Mon, 9 Sep 2024 14:27:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/4] drm/sched: Add locking to drm_sched_entity_modify_sched
To: Philipp Stanner <pstanner@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 stable@vger.kernel.org
References: <20240906180618.12180-1-tursulin@igalia.com>
 <20240906180618.12180-2-tursulin@igalia.com>
 <8d763e5162ebc130a05da3cefbff148cdb6ce042.camel@redhat.com>
 <80e02cde-19e7-4fb6-a572-fb45a639a3b7@amd.com>
 <2356e3d66da3e5795295267e527042ab44f192c8.camel@redhat.com>
 <fb9556a1-b48d-49ed-9b9c-74b21fb76af4@amd.com>
 <14ef37f4-b982-41c1-8121-80882917e9c0@igalia.com>
 <d8944e6ad57e4efcd480d917a38f9cee9475d59c.camel@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <d8944e6ad57e4efcd480d917a38f9cee9475d59c.camel@redhat.com>
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


On 09/09/2024 13:46, Philipp Stanner wrote:
> On Mon, 2024-09-09 at 13:37 +0100, Tvrtko Ursulin wrote:
>>
>> On 09/09/2024 13:18, Christian König wrote:
>>> Am 09.09.24 um 14:13 schrieb Philipp Stanner:
>>>> On Mon, 2024-09-09 at 13:29 +0200, Christian König wrote:
>>>>> Am 09.09.24 um 11:44 schrieb Philipp Stanner:
>>>>>> On Fri, 2024-09-06 at 19:06 +0100, Tvrtko Ursulin wrote:
>>>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>>>
>>>>>>> Without the locking amdgpu currently can race
>>>>>>> amdgpu_ctx_set_entity_priority() and drm_sched_job_arm(),
>>>>>> I would explicitly say "amdgpu's
>>>>>> amdgpu_ctx_set_entity_priority()
>>>>>> races
>>>>>> through drm_sched_entity_modify_sched() with
>>>>>> drm_sched_job_arm()".
>>>>>>
>>>>>> The actual issue then seems to be drm_sched_job_arm() calling
>>>>>> drm_sched_entity_select_rq(). I would mention that, too.
>>>>>>
>>>>>>
>>>>>>> leading to the
>>>>>>> latter accesing potentially inconsitent entity->sched_list
>>>>>>> and
>>>>>>> entity->num_sched_list pair.
>>>>>>>
>>>>>>> The comment on drm_sched_entity_modify_sched() however
>>>>>>> says:
>>>>>>>
>>>>>>> """
>>>>>>>     * Note that this must be called under the same common
>>>>>>> lock for
>>>>>>> @entity as
>>>>>>>     * drm_sched_job_arm() and drm_sched_entity_push_job(),
>>>>>>> or the
>>>>>>> driver
>>>>>>> needs to
>>>>>>>     * guarantee through some other means that this is never
>>>>>>> called
>>>>>>> while
>>>>>>> new jobs
>>>>>>>     * can be pushed to @entity.
>>>>>>> """
>>>>>>>
>>>>>>> It is unclear if that is referring to this race or
>>>>>>> something
>>>>>>> else.
>>>>>> That comment is indeed a bit awkward. Both
>>>>>> drm_sched_entity_push_job()
>>>>>> and drm_sched_job_arm() take rq_lock. But
>>>>>> drm_sched_entity_modify_sched() doesn't.
>>>>>>
>>>>>> The comment was written in 981b04d968561. Interestingly, in
>>>>>> drm_sched_entity_push_job(), this "common lock" is mentioned
>>>>>> with
>>>>>> the
>>>>>> soft requirement word "should" and apparently is more about
>>>>>> keeping
>>>>>> sequence numbers in order when inserting.
>>>>>>
>>>>>> I tend to think that the issue discovered by you is unrelated
>>>>>> to
>>>>>> that
>>>>>> comment. But if no one can make sense of the comment, should
>>>>>> it
>>>>>> maybe
>>>>>> be removed? Confusing comment is arguably worse than no
>>>>>> comment
>>>>> Agree, we probably mixed up in 981b04d968561 that submission
>>>>> needs a
>>>>> common lock and that rq/priority needs to be protected by the
>>>>> rq_lock.
>>>>>
>>>>> There is also the big FIXME in the drm_sched_entity
>>>>> documentation
>>>>> pointing out that this is most likely not implemented
>>>>> correctly.
>>>>>
>>>>> I suggest to move the rq, priority and rq_lock fields together
>>>>> in the
>>>>> drm_sched_entity structure and document that rq_lock is
>>>>> protecting
>>>>> the two.
>>>> That could also be a great opportunity for improving the lock
>>>> naming:
>>>
>>> Well that comment made me laugh because I point out the same when
>>> the
>>> scheduler came out ~8years ago and nobody cared about it since
>>> then.
>>>
>>> But yeah completely agree :)
>>
>> Maybe, but we need to keep in sight the fact some of these fixes may
>> be
>> good to backport. In which case re-naming exercises are best left to
>> follow.
> 
> My argument basically. It's good if fixes and other improvements are
> separated, in general, unless there is a practical / good reason not
> to.

Ah cool, I am happy to add follow up patches after the fixes.

>> Also..
>>
>>>> void drm_sched_rq_update_fifo(struct drm_sched_entity *entity,
>>>> ktime_t
>>>> ts)
>>>> {
>>>>      /*
>>>>       * Both locks need to be grabbed, one to protect from entity-
>>>>> rq
>>>> change
>>>>       * for entity from within concurrent
>>>> drm_sched_entity_select_rq
>>>> and the
>>>>       * other to update the rb tree structure.
>>>>       */
>>>>      spin_lock(&entity->rq_lock);
>>>>      spin_lock(&entity->rq->lock);
>>
>> .. I agree this is quite unredable and my initial reaction was a
>> similar
>> ugh. However.. What names would you guys suggest and for what to make
>> this better and not lessen the logic of naming each individually?
> 
> According to the documentation, drm_sched_rq.lock does not protect the
> entire runque, but "@lock: to modify the entities list."
> 
> So I would keep drm_sched_entity.rq_lock as it is, because it indeed
> protects the entire runqueue.

Agreed on entity->rq_lock.

> And drm_sched_rq.lock could be named "entities_lock" or
> "entities_list_lock" or something. That's debatable, but it should be
> something that highlights that this lock is not for locking the entire
> runque as the one in the entity apparently is.

AFAICT it also protects rq->current_entity and rq->rb_tree_root in which 
case it is a bit more tricky. Only rq->sched is outside its scope. Hm. 
Maybe just re-arrange the struct to be like:

struct drm_sched_rq {
	struct drm_gpu_scheduler	*sched;

	spinlock_t			lock;
	/* Following members are protected by the @lock: */
	struct list_head		entities;
	struct drm_sched_entity		*current_entity;
	struct rb_root_cached		rb_tree_root;
};

I have no ideas for better naming. But this would be inline with 
Christian's suggestion for tidying the order in drm_sched_entity.

I am also not sure what is the point of setting rq->current_entity in 
drm_sched_rq_select_entity_fifo().

Regards,

Tvrtko

> 
> 
> Cheers,
> P.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>> [...]
>>>>
>>>>
>>>> P.
>>>>
>>>>
>>>>> Then audit the code if all users of rq and priority actually
>>>>> hold the
>>>>> correct locks while reading and writing them.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> P.
>>>>>>
>>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>>> Fixes: b37aced31eb0 ("drm/scheduler: implement a function
>>>>>>> to
>>>>>>> modify
>>>>>>> sched list")
>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>>>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>>>> Cc: <stable@vger.kernel.org> # v5.7+
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/scheduler/sched_entity.c | 2 ++
>>>>>>>     1 file changed, 2 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> index 58c8161289fe..ae8be30472cd 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> @@ -133,8 +133,10 @@ void
>>>>>>> drm_sched_entity_modify_sched(struct
>>>>>>> drm_sched_entity *entity,
>>>>>>>     {
>>>>>>>         WARN_ON(!num_sched_list || !sched_list);
>>>>>>> +    spin_lock(&entity->rq_lock);
>>>>>>>         entity->sched_list = sched_list;
>>>>>>>         entity->num_sched_list = num_sched_list;
>>>>>>> +    spin_unlock(&entity->rq_lock);
>>>>>>>     }
>>>>>>>     EXPORT_SYMBOL(drm_sched_entity_modify_sched);
>>>
>>
> 
