Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCDaKQzLnmm0XQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 11:12:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F261958FC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 11:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CA610E358;
	Wed, 25 Feb 2026 10:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="hofSd5jE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB12D10E358
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 10:12:24 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so80045705e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 02:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1772014343; x=1772619143; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aw12o64ZQ+b31ud7bMQ0ZbBMNE3G6BKIOfe+4rhRyHU=;
 b=hofSd5jEY3mG3BWhqD6JIO7Lhh24/Z4cjLkdLSIyAQlXIPX9IE3nhYtopPIrmiHDfq
 85Yl+UjckryMKMFhUDt+tjuVG0IzVWhbpyxfxu3A51OAIfdd74Jd7rV+Ih/uq8DFBc2g
 kYtYZw+OmAmYYPXrVmgVZVvBA0KAxYkptIAlZDOG7/kM4KPIng/6TCbXoq6rBy22meUi
 hfqTWO59+zCqSTzYgM0Pi96T5F9KJjPYkjt7h+Rj0NAow25W3PzxkjUzXJwNawV6hUpU
 H+a7DqhEkXNRY8WSwH0m3QDG2Dd9cdzuPt2YYzbELzM+U3yzZQfay2dWFlfIpPJ4JuzR
 pszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772014343; x=1772619143;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aw12o64ZQ+b31ud7bMQ0ZbBMNE3G6BKIOfe+4rhRyHU=;
 b=YvxtuIm8ZQkU2e7pQMk8Mm+4ptGTh2w4wFNy02kcSyoSIBcuJuJJ6wIJF394mvBdmQ
 rRhbjK2O2sYB+nzRdGu1lldB/CeTIyzK4QCRCVeuOh4fQ5HZQvZzWcfgx6VX/Ivn8lbY
 /sxbaj/6Yv5qb7gmP3J8Cn/mmReK96SbNKlRaZHds4on17rG4FJ49xa/VQ8qxEI6u76J
 byhl6/zjxA24FyyT223lnRDYVtgyFCgk1pkJZUSPuabaLuAuOfLyCiCZKyAt8c81/5ve
 jLRHFPK7zy+M80seu0ZLY9oRa+787PTbV7nLkmupfHqWw+shGGBkexOgyB2vsSQi9dQ9
 d6Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa6TVlo335NohcT91JtCJs/860znqTQun6NIP50y7jTNH0O837mKUtfw6wgNlm67bJgXSfE8TKD7s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yys0/GcrBR0w4aCVEFKeQyXeZwlBeN1/TvqnXotSDMbe6Bxp338
 QYDxFt7aSoy/LfpolYDMt+IQkRKvVVALTRIUnfp1rsxUSyHu1F3r+1FySB4v28xXZqU=
X-Gm-Gg: ATEYQzzkRwXp8V8/q7veQj9EtJ7LS2K9vQ41t4zhnTdtwsLno6XEO+GZkPuYMCLZaHL
 1oeI/q4CQgyJg7EndrHClziYxiD/ms6Fq+3j5AS3eCvyjPT9ZT5qdc/TiH16iGLrjLQ1aliNUHF
 gRKYxTIVOlLhHypqyx69wcKM11EHDjl/0Jn+apyiLlUiXuU4LrHSt3UeFu9kzRxSDMkm6MZsd+t
 Us7uRKRiofzRU/W3VD6EinANHcLhABTy00TIbOdG1ztMow7tPo0/epX/vB7AuyjIxjYFc09MTgz
 eniMTda6DAP5E5rLJc3MLwZ9A1bgHyrY9VG1HVwe+JTqcnTLg9bpKmVZjIv4XyhjkBvy1n6IENx
 OsEYGJe10JUp2Ul3wG0b2CL2YDmb+8kzPhalQNDmsyxUokXycpuLSdGkxVi8tQ6GpvMeCF8zoeD
 cnuQ027OYFKXg/+1YrPZ2Gu73rejj+fnIXKVOaZTF993tg
X-Received: by 2002:a05:600c:3e8d:b0:46e:761b:e7ff with SMTP id
 5b1f17b1804b1-483a95f5a48mr238388485e9.28.1772014342664; 
 Wed, 25 Feb 2026 02:12:22 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970bfa015sm33188082f8f.8.2026.02.25.02.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 02:12:22 -0800 (PST)
Message-ID: <e097bf9b-0078-4de4-929c-0b9e0b26af8e@ursulin.net>
Date: Wed, 25 Feb 2026 10:12:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] drm/ttm: Be more aggressive when allocating below
 protection limit
To: Natalie Vock <natalie.vock@gmx.de>, Maarten Lankhorst <dev@lankhorst.se>, 
 Maxime Ripard <mripard@kernel.org>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Christian Koenig <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251110-dmemcg-aggressive-protect-v3-0-219ffcfc54e9@gmx.de>
 <20251110-dmemcg-aggressive-protect-v3-4-219ffcfc54e9@gmx.de>
 <4d9e2fb9-1cea-476e-b7f8-d2caaef4a579@ursulin.net>
 <fdf710df-8991-4ee1-9eca-78b21ecdc828@gmx.de>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <fdf710df-8991-4ee1-9eca-78b21ecdc828@gmx.de>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:natalie.vock@gmx.de,m:dev@lankhorst.se,m:mripard@kernel.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:cgroups@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ursulin.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmx.de,lankhorst.se,kernel.org,cmpxchg.org,suse.com,amd.com,intel.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ursulin.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gmx.de:email,ursulin.net:mid,ursulin.net:dkim]
X-Rspamd-Queue-Id: D0F261958FC
X-Rspamd-Action: no action


On 25/02/2026 09:49, Natalie Vock wrote:
> On 2/24/26 17:40, Tvrtko Ursulin wrote:
>>
>> On 10/11/2025 12:37, Natalie Vock wrote:
>>> When the cgroup's memory usage is below the low/min limit and allocation
>>> fails, try evicting some unprotected buffers to make space. Otherwise,
>>> application buffers may be forced to go into GTT even though usage is
>>> below the corresponding low/min limit, if other applications filled VRAM
>>> with their allocations first.
>>>
>>> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_bo.c       | 75 +++++++++++++++++++++++++++ 
>>> + ++++++----
>>>   drivers/gpu/drm/ttm/ttm_resource.c | 48 +++++++++++++++++-------
>>>   include/drm/ttm/ttm_resource.h     |  6 ++-
>>>   3 files changed, 108 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>>> index 829d994798835..bd467c965e1bc 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -490,8 +490,12 @@ int ttm_bo_evict_first(struct ttm_device *bdev, 
>>> struct ttm_resource_manager *man
>>>   }
>>>   struct ttm_bo_alloc_state {
>>> +    /** @charge_pool: The memory pool the resource is charged to */
>>> +    struct dmem_cgroup_pool_state *charge_pool;
>>>       /** @limit_pool: Which pool limit we should test against */
>>>       struct dmem_cgroup_pool_state *limit_pool;
>>> +    /** @only_evict_unprotected: If eviction should be restricted to 
>>> unprotected BOs */
>>> +    bool only_evict_unprotected;
>>>   };
>>>   /**
>>> @@ -546,7 +550,7 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk 
>>> *walk, struct ttm_buffer_object *
>>>       evict_walk->evicted++;
>>>       if (evict_walk->res)
>>>           lret = ttm_resource_alloc(evict_walk->evictor, evict_walk- 
>>> >place,
>>> -                      evict_walk->res, NULL);
>>> +                      evict_walk->res, evict_walk->alloc_state- 
>>> >charge_pool);
>>>       if (lret == 0)
>>>           return 1;
>>>   out:
>>> @@ -589,7 +593,7 @@ static int ttm_bo_evict_alloc(struct ttm_device 
>>> *bdev,
>>>       lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
>>>       /* One more attempt if we hit low limit? */
>>> -    if (!lret && evict_walk.hit_low) {
>>> +    if (!lret && evict_walk.hit_low && !state- 
>>> >only_evict_unprotected) {
>>
>> What is unprotected synonymous with? No low watermark set? Should 
>> dmem_cgroup_state_evict_valuable() even set *hit_low = true for if low 
>> is not set to begin with?
> 
> In terms of cgroup usage, a cgroup (and by extension, its BOs) is 
> protected as long as its usage stays under the low watermark (if not 
> set, that watermark is zero and any BO is trivially unprotected). If the 
> usage exceeds the low watermark, the cgroup/its BOs become unprotected 
> and can be evicted (more easily), until the usage goes below the 
> watermark again.

Got it thanks, so either no low set, or usage above low. Makes sense.

> With only_evict_unprotected, what we're trying to do is evict buffers 
> from any cgroup that currently exceeds its low (or min) watermark, but 
> leave alone cgroups that are within their limits. I've elaborated on the 
> rationale more in the cover letter, but essentially, this is supposed to 
> make TTM honor the low/min protection better for cgroups that are 
> allocating and currently within their low/min watermark, by allowing 
> them to push out BOs from cgroups that exceed their respective watermarks.

Yep, I got that part. Just that I will need a second pass to fully grasp 
the extended logic. Problem being more booleans and passes make things 
more complex. That is why I made this side question on whether it even 
makes sense for dmem_cgroup_state_evict_valuable() to set hit_low if the 
low is not even set. Assuming I got it right it can happen:

	if (!ignore_low) {
		low = READ_ONCE(ctest->elow);
		if (used > low)
			return true;

		*ret_hit_low = true;
		return false;
	}

So I was wondering what would be the effect of making that like this:

	if (!ignore_low) {
		low = READ_ONCE(ctest->elow);
		if (used > low)
			return true;

+		if (low)
+			*ret_hit_low = true;

		return false;
	}


Could that somehow simplify the logic, maybe allow for not having to add 
the additional condition above. Possibly not, it seems more complex than 
that. But I am just thinking out loud at this point. Again, I need to 
make a second reading pass.

> I'll add some comments to the only_evict_unprotected docs to explain 
> what "unprotected" means here.
> 
>>
>>>           evict_walk.try_low = true;
>>>           lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
>>>       }
>>> @@ -610,7 +614,8 @@ static int ttm_bo_evict_alloc(struct ttm_device 
>>> *bdev,
>>>       } while (!lret && evict_walk.evicted);
>>>       /* We hit the low limit? Try once more */
>>> -    if (!lret && evict_walk.hit_low && !evict_walk.try_low) {
>>> +    if (!lret && evict_walk.hit_low && !evict_walk.try_low &&
>>> +            !state->only_evict_unprotected) {
>>>           evict_walk.try_low = true;
>>>           goto retry;
>>>       }
>>> @@ -719,20 +724,72 @@ static int ttm_bo_alloc_at_place(struct 
>>> ttm_buffer_object *bo,
>>>                    struct ttm_resource **res,
>>>                    struct ttm_bo_alloc_state *alloc_state)
>>>   {
>>> -    bool may_evict;
>>> +    bool may_evict, below_low = false;
>>>       int ret;
>>>       may_evict = (force_space && place->mem_type != TTM_PL_SYSTEM);
>>> +    ret = ttm_resource_try_charge(bo, place, &alloc_state->charge_pool,
>>> +                      force_space ? &alloc_state->limit_pool : NULL);
>>> +    if (ret) {
>>> +        /*
>>> +         * -EAGAIN means the charge failed, which we treat like an
>>> +         * allocation failure. Therefore, return an error code 
>>> indicating
>>> +         * the allocation failed - either -EBUSY if the allocation 
>>> should
>>> +         * be retried with eviction, or -ENOSPC if there should be 
>>> no second
>>> +         * attempt.
>>> +         */
>>> +        if (ret == -EAGAIN)
>>> +            ret = may_evict ? -EBUSY : -ENOSPC;
>>> +        return ret;
>>> +    }
>>> -    ret = ttm_resource_alloc(bo, place, res,
>>> -                 force_space ? &alloc_state->limit_pool : NULL);
>>> +    /*
>>> +     * cgroup protection plays a special role in eviction.
>>> +     * Conceptually, protection of memory via the dmem cgroup 
>>> controller
>>> +     * entitles the protected cgroup to use a certain amount of memory.
>>> +     * There are two types of protection - the 'low' limit is a
>>> +     * "best-effort" protection, whereas the 'min' limit provides a 
>>> hard
>>> +     * guarantee that memory within the cgroup's allowance will not be
>>> +     * evicted under any circumstance.
>>> +     *
>>> +     * To faithfully model this concept in TTM, we also need to take 
>>> cgroup
>>> +     * protection into account when allocating. When allocation in one
>>> +     * place fails, TTM will default to trying other places first 
>>> before
>>> +     * evicting.
>>> +     * If the allocation is covered by dmem cgroup protection, however,
>>> +     * this prevents the allocation from using the memory it is 
>>> "entitled"
>>> +     * to. To make sure unprotected allocations cannot push new 
>>> protected
>>> +     * allocations out of places they are "entitled" to use, we should
>>> +     * evict buffers not covered by any cgroup protection, if this
>>> +     * allocation is covered by cgroup protection.
>>> +     *
>>> +     * Buffers covered by 'min' protection are a special case - the 
>>> 'min'
>>> +     * limit is a stronger guarantee than 'low', and thus buffers 
>>> protected
>>> +     * by 'low' but not 'min' should also be considered for eviction.
>>> +     * Buffers protected by 'min' will never be considered for eviction
>>> +     * anyway, so the regular eviction path should be triggered here.
>>> +     * Buffers protected by 'low' but not 'min' will take a special
>>> +     * eviction path that only evicts buffers covered by neither 
>>> 'low' or
>>> +     * 'min' protections.
>>> +     */
>>> +    may_evict |= dmem_cgroup_below_min(NULL, alloc_state->charge_pool);
>>> +    below_low = dmem_cgroup_below_low(NULL, alloc_state->charge_pool);
>>> +    alloc_state->only_evict_unprotected = !may_evict && below_low;
>>> +
>>> +    ret = ttm_resource_alloc(bo, place, res, alloc_state->charge_pool);
>>>       if (ret) {
>>> -        if ((ret == -ENOSPC || ret == -EAGAIN) && may_evict)
>>> +        if ((ret == -ENOSPC || ret == -EAGAIN) &&
>>> +                (may_evict || below_low))
>>>               ret = -EBUSY;
>>>           return ret;
>>>       }
>>> +    /*
>>> +     * Ownership of charge_pool has been transferred to the TTM 
>>> resource,
>>> +     * don't make the caller think we still hold a reference to it.
>>> +     */
>>> +    alloc_state->charge_pool = NULL;
>>>       return 0;
>>>   }
>>> @@ -787,6 +844,7 @@ static int ttm_bo_alloc_resource(struct 
>>> ttm_buffer_object *bo,
>>>                   res, &alloc_state);
>>>           if (ret == -ENOSPC) {
>>> +            dmem_cgroup_pool_state_put(alloc_state.charge_pool);
>>>               dmem_cgroup_pool_state_put(alloc_state.limit_pool);
>>>               continue;
>>>           } else if (ret == -EBUSY) {
>>> @@ -796,11 +854,14 @@ static int ttm_bo_alloc_resource(struct 
>>> ttm_buffer_object *bo,
>>>               dmem_cgroup_pool_state_put(alloc_state.limit_pool);
>>>               if (ret) {
>>> +                dmem_cgroup_pool_state_put(
>>> +                        alloc_state.charge_pool);
>>
>> Funky line break.
> 
> Will fix.
> 
>>
>>>                   if (ret != -ENOSPC && ret != -EBUSY)
>>>                       return ret;
>>>                   continue;
>>>               }
>>>           } else if (ret) {
>>> +            dmem_cgroup_pool_state_put(alloc_state.charge_pool);
>>>               dmem_cgroup_pool_state_put(alloc_state.limit_pool);
>>>               return ret;
>>>           }
>>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ 
>>> ttm/ ttm_resource.c
>>> index e2c82ad07eb44..fcfa8b51b0337 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>> @@ -372,30 +372,52 @@ void ttm_resource_fini(struct 
>>> ttm_resource_manager *man,
>>>   }
>>>   EXPORT_SYMBOL(ttm_resource_fini);
>>> +/**
>>> + * ttm_resource_try_charge - charge a resource manager's cgroup pool
>>> + * @bo: buffer for which an allocation should be charged
>>> + * @place: where the allocation is attempted to be placed
>>> + * @ret_pool: on charge success, the pool that was charged
>>> + * @ret_limit_pool: on charge failure, the pool responsible for the 
>>> failure
>>> + *
>>> + * Should be used to charge cgroups before attempting resource 
>>> allocation.
>>> + * When charging succeeds, the value of ret_pool should be passed to
>>> + * ttm_resource_alloc.
>>> + *
>>> + * Returns: 0 on charge success, negative errno on failure.
>>> + */
>>> +int ttm_resource_try_charge(struct ttm_buffer_object *bo,
>>> +                const struct ttm_place *place,
>>> +                struct dmem_cgroup_pool_state **ret_pool,
>>> +                struct dmem_cgroup_pool_state **ret_limit_pool)
>>> +{
>>> +    struct ttm_resource_manager *man =
>>> +        ttm_manager_type(bo->bdev, place->mem_type);
>>> +
>>> +    if (!man->cg) {
>>> +        *ret_pool = NULL;
>>> +        if (ret_limit_pool)
>>> +            *ret_limit_pool = NULL;
>>> +        return 0;
>>> +    }
>>> +
>>> +    return dmem_cgroup_try_charge(man->cg, bo->base.size, ret_pool,
>>> +                      ret_limit_pool);
>>> +}
>>> +
>>>   int ttm_resource_alloc(struct ttm_buffer_object *bo,
>>>                  const struct ttm_place *place,
>>>                  struct ttm_resource **res_ptr,
>>> -               struct dmem_cgroup_pool_state **ret_limit_pool)
>>> +               struct dmem_cgroup_pool_state *charge_pool)
>>>   {
>>>       struct ttm_resource_manager *man =
>>>           ttm_manager_type(bo->bdev, place->mem_type);
>>> -    struct dmem_cgroup_pool_state *pool = NULL;
>>>       int ret;
>>> -    if (man->cg) {
>>> -        ret = dmem_cgroup_try_charge(man->cg, bo->base.size, &pool, 
>>> ret_limit_pool);
>>> -        if (ret)
>>> -            return ret;
>>> -    }
>>> -
>>>       ret = man->func->alloc(man, bo, place, res_ptr);
>>> -    if (ret) {
>>> -        if (pool)
>>> -            dmem_cgroup_uncharge(pool, bo->base.size);
>>> +    if (ret)
>>>           return ret;
>>> -    }
>>> -    (*res_ptr)->css = pool;
>>> +    (*res_ptr)->css = charge_pool;
>>
>> Is it possible to somehow split this patch into two? I mean first a 
>> patch which changes the prototype of ttm_resource_alloc(), adjusting 
>> the callers, set out new rules for owning the charge pool, etc, then 
>> the patch which only adds the cgroup smarts to 
>> ttm_bo_alloc_at_place(). If that could be made without creating any 
>> functional difference to the eviction alone I think it could make it 
>> easier to review.
> 
> Will try.

Only if it sounds plausible that it can be sensibly done. Otherwise 
don't spend too much time if you think it makes no sense. I'll wait for 
the verdict, or for v4 to appear and then have another go of making 
sense of the existing vs new eviction logic.

Regards,

Tvrtko


> Thanks,
> Natalie
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>       spin_lock(&bo->bdev->lru_lock);
>>>       ttm_resource_add_bulk_move(*res_ptr, bo);
>>> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ 
>>> ttm_resource.h
>>> index e52bba15012f7..3aef7efdd7cfb 100644
>>> --- a/include/drm/ttm/ttm_resource.h
>>> +++ b/include/drm/ttm/ttm_resource.h
>>> @@ -442,10 +442,14 @@ void ttm_resource_init(struct ttm_buffer_object 
>>> *bo,
>>>   void ttm_resource_fini(struct ttm_resource_manager *man,
>>>                  struct ttm_resource *res);
>>> +int ttm_resource_try_charge(struct ttm_buffer_object *bo,
>>> +                const struct ttm_place *place,
>>> +                struct dmem_cgroup_pool_state **ret_pool,
>>> +                struct dmem_cgroup_pool_state **ret_limit_pool);
>>>   int ttm_resource_alloc(struct ttm_buffer_object *bo,
>>>                  const struct ttm_place *place,
>>>                  struct ttm_resource **res,
>>> -               struct dmem_cgroup_pool_state **ret_limit_pool);
>>> +               struct dmem_cgroup_pool_state *charge_pool);
>>>   void ttm_resource_free(struct ttm_buffer_object *bo, struct 
>>> ttm_resource **res);
>>>   bool ttm_resource_intersects(struct ttm_device *bdev,
>>>                    struct ttm_resource *res,
>>>
>>
> 

