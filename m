Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA8MCNocn2lcZAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 17:01:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAF819A2BD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 17:01:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD7410E77D;
	Wed, 25 Feb 2026 16:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="kwekfssq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E5010E1C6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 16:01:20 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so66369005e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 08:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1772035279; x=1772640079; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QYTH6TRxaDTqbQ4lt+lqgj9OS3vmhH7j+1w2VyEOxF0=;
 b=kwekfssqe8qLothdyhXsNlYtif79fUR7WK5/Z84BTUmlGODLzfZwktmOm/RwmGx1ky
 Gp+fk7aTx3mU8kEaG1pmSWs2zs34dX3R09AmiIc89znVFxpGimLR/8GBgFqEx47hjRXQ
 GvNBCGN6+V9oHCYaIn8SdNyQBxejSHkMo3yrYJJ9W8R6HS1phl0WkfZdpMQ1nn+oUEHe
 4/p++KNGBzv70vBpcyr9m25TPmr7wm3SfWGOJUPqYKMBF+JchClnfqAL1kByM3ndGfR7
 BkK3btjaY0K0+LQjP9LiY4clRRT5bmLhLFNPqM68XFdG7zWT7xWItA0hkkcjkGzFfYiR
 DZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772035279; x=1772640079;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QYTH6TRxaDTqbQ4lt+lqgj9OS3vmhH7j+1w2VyEOxF0=;
 b=NuK/O04g7XvBSaJN+Fl7gwtuCX+/wp6SWRmapuqNFtGfFGCK0x1rKgyPLuM7HFXnkz
 ZKULPAn8RYG06IVNwN3xkIhD5mUQsh2zrU/5z6GXfZN9kS8D0iBtE/dsktN8ggl1UR3o
 nLac7XZ1MdB8Lp45FZm2Q+ALIiolJGcatrM8tnCIARPcSdOYWUaaPz0XBZnq4U6g/KbW
 fgIGftvqNKhD9Gb47Zi0U+e1lBbQlIvC3l2dN0x/+Ui7iN3phlX/HPNdb/SKOQsEFFDt
 PLiuTlaGPDrT8Nu4479v28UCyJz+KxF743Q4MEGsLrhh/PYv6EfObynaolbeB9iO+mzj
 xhnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxorJ2Mt6HuigH4Mtg1iSAc146CdhEL3I74wF4SwXnYMWRumGq34IJ/M3eaYXfXo4K1kLf2ZXIM3s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDMg7cPzzUfy/KXw9iizyUlugM9JCZOGSxJrGdG4jTZjKnpshE
 zAOQGYerWJuVmR0vqIV4WvUhz0xp4eFAYQZQHEMKr7RB4PyLxvZGw5abK0VsDRJafJQ=
X-Gm-Gg: ATEYQzzlunKknFtxZT1uOxA+usO7AH4KFhAf4O4JhRCoa7VqoCUTuh6jLCEesOMRf4l
 piUjNGKnN7AnacwweyxWaUtlG51sbgbbTMcj2CyW+chNTZsw4lxUDeWhULwzv5wUduQvvUWOPXR
 HJ7/d7ulsV14rE6BzGp+CBTvtVCkXdGe3dYWKYMpBEYGD2ETYZA8r7BTU/i37MazU1PUiEvBy9M
 ZbS78RlvvvvJLaj/VzUuFkpEpGg3WlWCxouQbQFw6Q90OkFFnnsXfnxmq21o7G8x5XaC6kQgFUe
 5JxZDcxrwha+9tR+22tQbGxGkggEA3ti3JE9A2k23131xaqvI7yvpMegSx3PRHpon7EBO8kbT5z
 deS3M4hzF2BdxJEqwYwDJ7ZeyhIqmJ9Zt5UD2iKV7YkvgjJKJ/k0KxyPxSLF9srcL2fLn9xuFL8
 RlKTOrjJl1jVExg6WBfJl8/u7RzQbMvm2lp/j1PWU19Aag
X-Received: by 2002:a05:600c:6291:b0:477:8985:4036 with SMTP id
 5b1f17b1804b1-483a95b5a7dmr281901675e9.1.1772035277667; 
 Wed, 25 Feb 2026 08:01:17 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd75df9fsm81675695e9.13.2026.02.25.08.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 08:01:16 -0800 (PST)
Message-ID: <dee1922d-9905-484e-b161-641fe8db4d51@ursulin.net>
Date: Wed, 25 Feb 2026 16:01:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] drm/ttm: Split cgroup charge and resource
 allocation
From: Tvrtko Ursulin <tursulin@ursulin.net>
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
References: <20260225-dmemcg-aggressive-protect-v4-0-de847ab35184@gmx.de>
 <20260225-dmemcg-aggressive-protect-v4-4-de847ab35184@gmx.de>
 <9f726505-cce3-430a-8d16-fd9695dc4577@ursulin.net>
Content-Language: en-GB
In-Reply-To: <9f726505-cce3-430a-8d16-fd9695dc4577@ursulin.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:natalie.vock@gmx.de,m:dev@lankhorst.se,m:mripard@kernel.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:cgroups@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ursulin.net];
	FREEMAIL_TO(0.00)[gmx.de,lankhorst.se,kernel.org,cmpxchg.org,suse.com,amd.com,intel.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	RSPAMD_URIBL_FAIL(0.00)[ursulin.net:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ursulin.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RSPAMD_EMAILBL_FAIL(0.00)[natalie.vock.gmx.de:query timed out];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AAAF819A2BD
X-Rspamd-Action: no action


On 25/02/2026 15:33, Tvrtko Ursulin wrote:
> 
> On 25/02/2026 12:10, Natalie Vock wrote:
>> Coupling resource allocation and cgroup charging is racy when charging
>> succeeds, but subsequent resource allocation fails. Certain eviction
>> decisions are made on the basis of whether the allocating cgroup is
>> protected, i.e. within its min/low limits, but with the charge being
>> tied to resource allocation (and uncharged when the resource allocation
>> fails), this check is done at a poin where the allocation is not actually
> 
> s/poin/point/
> 
>> charged to the cgroup.
>>
>> This is subtly wrong if the allocation were to cause the cgroup to exceed
>> the min/low protection, but it's even more wrong if the same cgroup tries
>> allocating multiple buffers concurrently: In this case, the min/low
>> protection may pass for all allocation attempts when the real min/low
>> protection covers only some, or potentially none of the allocated
>> buffers.
> 
> Interesting! Do I understand correctly this would be a scenario with 
> multi-threaded buffer allocation or there is another path to it?
> 
> In any case moving the charge to before allocation makes sense to me. 
> With a caveat that I wasn't involved in the dmem cgroup controller 
> design so may be missing something.
> 
>> Instead, charge the allocation to the cgroup once and keep the charge
>> for as long as we try to allocate a ttm_resource, and only undo the 
>> charge
>> if allocating the resource is ultimately unsuccessful and we move on to
>> a different ttm_place.
>>
>> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c       | 28 +++++++++++++++-------
>>   drivers/gpu/drm/ttm/ttm_resource.c | 48 ++++++++++++++++++++++++++ 
>> +-----------
>>   include/drm/ttm/ttm_resource.h     |  6 ++++-
>>   3 files changed, 60 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index 48dbaaa46824c..a8914d20b0c32 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -490,6 +490,8 @@ int ttm_bo_evict_first(struct ttm_device *bdev, 
>> struct ttm_resource_manager *man
>>   }
>>   struct ttm_bo_alloc_state {
>> +    /** @charge_pool: The memory pool the resource is charged to */
>> +    struct dmem_cgroup_pool_state *charge_pool;
>>       /** @limit_pool: Which pool limit we should test against */
>>       struct dmem_cgroup_pool_state *limit_pool;
>>   };
>> @@ -546,7 +548,7 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk 
>> *walk, struct ttm_buffer_object *
>>       evict_walk->evicted++;
>>       if (evict_walk->res)
>>           lret = ttm_resource_alloc(evict_walk->evictor, evict_walk- 
>> >place,
>> -                      evict_walk->res, NULL);
>> +                      evict_walk->res, evict_walk->alloc_state- 
>> >charge_pool);
>>       if (lret == 0)
>>           return 1;
>>   out:
>> @@ -724,10 +726,8 @@ static int ttm_bo_alloc_at_place(struct 
>> ttm_buffer_object *bo,
>>       int ret;
>>       may_evict = (force_space && place->mem_type != TTM_PL_SYSTEM);
>> -
>> -    ret = ttm_resource_alloc(bo, place, res,
>> -                 force_space ? &alloc_state->limit_pool : NULL);
>> -
>> +    ret = ttm_resource_try_charge(bo, place, &alloc_state->charge_pool,
>> +                      force_space ? &alloc_state->limit_pool : NULL);
>>       if (ret) {
>>           /*
>>            * -EAGAIN means the charge failed, which we treat like an
>> @@ -737,14 +737,23 @@ static int ttm_bo_alloc_at_place(struct 
>> ttm_buffer_object *bo,
>>            * attempt.
>>            */
>>           if (ret == -EAGAIN)
>> -            return may_evict ? -EBUSY : -ENOSPC;
>> +            ret = may_evict ? -EBUSY : -ENOSPC;
>> +        return ret;
>> +    }
>> -        if (ret == -ENOSPC && may_evict)
>> -            return -EBUSY;
>> +    ret = ttm_resource_alloc(bo, place, res, alloc_state->charge_pool);
> 
> No need for a blank line here.
> 
>> +    if (ret) {
>> +        if (ret == -ENOSPC && may_evict)
>> +            ret = -EBUSY;
> 
> Why did you remove EAGAIN handling from after ttm_resource_alloc()?

I figured this part out. I guess EAGAIN can only come out 
dmem_cgroup_try_charge() which is no longer here. Makes sense.

Return code handling changes look fine to me in this case. Just the 
question of uncharging remains.

Regards,

Tvrtko

> 
>>           return ret;
>>       }
>> +    /*
>> +     * Ownership of charge_pool has been transferred to the TTM 
>> resource,
>> +     * don't make the caller think we still hold a reference to it.
>> +     */
>> +    alloc_state->charge_pool = NULL;
>>       return 0;
>>   }
>> @@ -799,6 +808,7 @@ static int ttm_bo_alloc_resource(struct 
>> ttm_buffer_object *bo,
>>                   res, &alloc_state);
>>           if (ret == -ENOSPC) {
>> +            dmem_cgroup_pool_state_put(alloc_state.charge_pool);
>>               dmem_cgroup_pool_state_put(alloc_state.limit_pool);
>>               continue;
>>           } else if (ret == -EBUSY) {
>> @@ -808,11 +818,13 @@ static int ttm_bo_alloc_resource(struct 
>> ttm_buffer_object *bo,
>>               dmem_cgroup_pool_state_put(alloc_state.limit_pool);
>>               if (ret) {
>> +                dmem_cgroup_pool_state_put(alloc_state.charge_pool);
>>                   if (ret != -EBUSY)
>>                       return ret;
>>                   continue;
>>               }
>>           } else if (ret) {
>> +            dmem_cgroup_pool_state_put(alloc_state.charge_pool);
> 
> Is uncharge in the failure case hidden in dmem_cgroup_pool_state_put() 
> somehow?
> 
> Regards,
> 
> Tvrtko
> 
>>               dmem_cgroup_pool_state_put(alloc_state.limit_pool);
>>               return ret;
>>           }
>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ 
>> ttm_resource.c
>> index 192fca24f37e4..a8a836f6e376a 100644
>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>> @@ -373,30 +373,52 @@ void ttm_resource_fini(struct 
>> ttm_resource_manager *man,
>>   }
>>   EXPORT_SYMBOL(ttm_resource_fini);
>> +/**
>> + * ttm_resource_try_charge - charge a resource manager's cgroup pool
>> + * @bo: buffer for which an allocation should be charged
>> + * @place: where the allocation is attempted to be placed
>> + * @ret_pool: on charge success, the pool that was charged
>> + * @ret_limit_pool: on charge failure, the pool responsible for the 
>> failure
>> + *
>> + * Should be used to charge cgroups before attempting resource 
>> allocation.
>> + * When charging succeeds, the value of ret_pool should be passed to
>> + * ttm_resource_alloc.
>> + *
>> + * Returns: 0 on charge success, negative errno on failure.
>> + */
>> +int ttm_resource_try_charge(struct ttm_buffer_object *bo,
>> +                const struct ttm_place *place,
>> +                struct dmem_cgroup_pool_state **ret_pool,
>> +                struct dmem_cgroup_pool_state **ret_limit_pool)
>> +{
>> +    struct ttm_resource_manager *man =
>> +        ttm_manager_type(bo->bdev, place->mem_type);
>> +
>> +    if (!man->cg) {
>> +        *ret_pool = NULL;
>> +        if (ret_limit_pool)
>> +            *ret_limit_pool = NULL;
>> +        return 0;
>> +    }
>> +
>> +    return dmem_cgroup_try_charge(man->cg, bo->base.size, ret_pool,
>> +                      ret_limit_pool);
>> +}
>> +
>>   int ttm_resource_alloc(struct ttm_buffer_object *bo,
>>                  const struct ttm_place *place,
>>                  struct ttm_resource **res_ptr,
>> -               struct dmem_cgroup_pool_state **ret_limit_pool)
>> +               struct dmem_cgroup_pool_state *charge_pool)
>>   {
>>       struct ttm_resource_manager *man =
>>           ttm_manager_type(bo->bdev, place->mem_type);
>> -    struct dmem_cgroup_pool_state *pool = NULL;
>>       int ret;
>> -    if (man->cg) {
>> -        ret = dmem_cgroup_try_charge(man->cg, bo->base.size, &pool, 
>> ret_limit_pool);
>> -        if (ret)
>> -            return ret;
>> -    }
>> -
>>       ret = man->func->alloc(man, bo, place, res_ptr);
>> -    if (ret) {
>> -        if (pool)
>> -            dmem_cgroup_uncharge(pool, bo->base.size);
>> +    if (ret)
>>           return ret;
>> -    }
>> -    (*res_ptr)->css = pool;
>> +    (*res_ptr)->css = charge_pool;
>>       spin_lock(&bo->bdev->lru_lock);
>>       ttm_resource_add_bulk_move(*res_ptr, bo);
>> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ 
>> ttm_resource.h
>> index 33e80f30b8b82..549b5b796884d 100644
>> --- a/include/drm/ttm/ttm_resource.h
>> +++ b/include/drm/ttm/ttm_resource.h
>> @@ -456,10 +456,14 @@ void ttm_resource_init(struct ttm_buffer_object 
>> *bo,
>>   void ttm_resource_fini(struct ttm_resource_manager *man,
>>                  struct ttm_resource *res);
>> +int ttm_resource_try_charge(struct ttm_buffer_object *bo,
>> +                const struct ttm_place *place,
>> +                struct dmem_cgroup_pool_state **ret_pool,
>> +                struct dmem_cgroup_pool_state **ret_limit_pool);
>>   int ttm_resource_alloc(struct ttm_buffer_object *bo,
>>                  const struct ttm_place *place,
>>                  struct ttm_resource **res,
>> -               struct dmem_cgroup_pool_state **ret_limit_pool);
>> +               struct dmem_cgroup_pool_state *charge_pool);
>>   void ttm_resource_free(struct ttm_buffer_object *bo, struct 
>> ttm_resource **res);
>>   bool ttm_resource_intersects(struct ttm_device *bdev,
>>                    struct ttm_resource *res,
>>
> 

