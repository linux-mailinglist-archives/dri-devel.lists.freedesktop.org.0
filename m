Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APP+A9sKoGnbfQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 09:56:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703431A2FFA
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 09:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA5E10E885;
	Thu, 26 Feb 2026 08:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="bCf5BvOf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5236E10E885
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 08:56:54 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-48370174e18so3233145e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 00:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1772096213; x=1772701013; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=M3pO8yIEbAexJAFnCsvgrzJYhoU8FdG0mP6bKvQFCxc=;
 b=bCf5BvOfpg27AEqcR2ezBa++HnjTGeEVpVf73D+TsP+d4HBvDKxCgw92MJ1k9ga6Nx
 3/z6ycv9LS8Oq7cexEowS0KVQb8PcR8xPw2quEGVml19g08qhotm649lEGZ+b2pqps8c
 XI+nYQoXxoJ3Vj/wS5q/jLLZuWoUAwujFUWA9xjrc/Hkxc2FTGMPp3NweLL6IxfSt3J9
 FlmuxRIyM1VbFHojB0UJ6mYlVSsh1FyWDzZMSJD9TVV29WreQkw56lum6u7cNTp0Fb08
 jUP2+Hg8zKNZSv1BS4HedUU/9SO7FmZjt6GcKfQxtElQYhnXdOD8p9zrxkMIZ14hv/Io
 Eb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772096213; x=1772701013;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M3pO8yIEbAexJAFnCsvgrzJYhoU8FdG0mP6bKvQFCxc=;
 b=BIDhNonNDRuregg8q/VNPNvsgyKPfEA4kincm3452R5ftEsiktJ/rMv7NueulErEc5
 oQFHlzAXCdoxoH23kIvO0j1PHLWU1X+W5YTROQgDopbq97krG3OvT/C66zhJdUaLH1c7
 qRlIhtfkbTgKwymW4RLpLMa5psUzpY9g3FSLHKUvtWnXPchqYy1M+EY+Q7uSfo16uT9C
 ls8kX47BKvNbowdym9cwLZayxQxU+Nz/fPMjcctTFf/WFkjr14iNYBnz/V0p51D3C4cz
 lvT3yEEDgeo6lBd/C2Kx93AjJ/3YCcPez8nKGcwQto3GzbmyMaKmY4n9NpUDQq8iRvXk
 u7aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeD+Ul5RrQrkeYY/qIKyjvzqfR0bAvbYjZjg7rgB4RroUmF91QQTU/4NBBymJeHTOz82Mbmwh0Q3A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNsS67ev19lUW9TOIejcJ7ZfGXJjBDHNPfbJGV34v7yeimUMlu
 zohfivX7ZPAY0dXld9Kz9NFCFAtPlswas4qMRRUE/091VVqndZPQtF3QtL0IR03wMdTkbIc7q04
 hx+rwPqI=
X-Gm-Gg: ATEYQzwToiC0loCrpNrj11gIDBNCJjVAT3+a0n2zNQXb1EP0TwFDAs5lOEnbep+IKwz
 lMrV6fVdEqLRpxwwyKslC/8evBNOiZ50eEpE1c+AYl0Xc50y7oOE4ZNY08SyhvX3cV+yt1JeANj
 t0dcJRZHinOSQQd9YSsuvBMihC6k7CDLbT5soRJEVVQdRZscTdtcodRcGcszPFm5QZGpaUH4SFI
 sfXcPw/ivzAop4CfcNMrdaBGHpVzkbKI/24dQ6/rkL6PL99aJHFPMtQVrTOfn8gDLXYpn0HF0b6
 mxnqZnhACF+0wSOn6U9Hpyz8lO37G3jabQkomCocp5FqhTZwPC0/JOpjncrQ/nZ6hb+Yaj2onBJ
 x67MxkgVP/xai0Ju9mQzw4KLkLIw453yTWnXrnUy8XXOat1R/Hv0fbGSVGW2V59PZwBe5l/BSmB
 n6XJF8fsqvVks/1fnxO+3JBFirzty9CWQN3v92Bj7WnraO
X-Received: by 2002:a05:600c:3acf:b0:483:6d4a:7e6d with SMTP id
 5b1f17b1804b1-483c21a747bmr58697185e9.30.1772096212494; 
 Thu, 26 Feb 2026 00:56:52 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bffc17dasm57003635e9.2.2026.02.26.00.56.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 00:56:52 -0800 (PST)
Message-ID: <bf4d04be-880e-4605-bdfc-46e38e312835@ursulin.net>
Date: Thu, 26 Feb 2026 08:56:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] drm/ttm: Extract code for attempting allocation in
 a place
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
 <20260225-dmemcg-aggressive-protect-v4-3-de847ab35184@gmx.de>
 <235fd4f7-dbb7-44c8-9bbc-f1d8297fb8b9@ursulin.net>
Content-Language: en-GB
In-Reply-To: <235fd4f7-dbb7-44c8-9bbc-f1d8297fb8b9@ursulin.net>
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:natalie.vock@gmx.de,m:dev@lankhorst.se,m:mripard@kernel.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:cgroups@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ursulin.net];
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
X-Rspamd-Queue-Id: 703431A2FFA
X-Rspamd-Action: no action


On 25/02/2026 15:27, Tvrtko Ursulin wrote:
> 
> On 25/02/2026 12:10, Natalie Vock wrote:
>> Move all code for attempting allocation for a specific place to
>> ttm_bo_alloc_place. With subsequent patches, this logic is going to get
>> more complicated, so it helps readability to have this separate.
>>
>> ttm_bo_alloc_at_place takes a pointer to a struct ttm_bo_alloc_state.
>> This struct holds various state produced by the allocation (e.g. cgroup
>> resource associated with the allocation) that the caller needs to keep
>> track of (and potentially dispose of). This is just the limiting cgroup
>> pool for now, but future patches will add more state needing to be 
>> tracked.
>>
>> ttm_bo_alloc_at_place also communicates via return codes if eviction
>> using ttm_bo_evict_alloc should be attempted. This is preparation for
>> attempting eviction in more cases than just force_space being set.
>>
>> No functional change intended.
>>
>> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c | 109 ++++++++++++++++++++++++++++++++ 
>> +----------
>>   1 file changed, 84 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index acb9197db8798..48dbaaa46824c 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -489,6 +489,11 @@ int ttm_bo_evict_first(struct ttm_device *bdev, 
>> struct ttm_resource_manager *man
>>       return ret;
>>   }
>> +struct ttm_bo_alloc_state {
>> +    /** @limit_pool: Which pool limit we should test against */
>> +    struct dmem_cgroup_pool_state *limit_pool;
>> +};
>> +
>>   /**
>>    * struct ttm_bo_evict_walk - Parameters for the evict walk.
>>    */
>> @@ -504,12 +509,13 @@ struct ttm_bo_evict_walk {
>>       /** @evicted: Number of successful evictions. */
>>       unsigned long evicted;
>> -    /** @limit_pool: Which pool limit we should test against */
>> -    struct dmem_cgroup_pool_state *limit_pool;
>>       /** @try_low: Whether we should attempt to evict BO's with low 
>> watermark threshold */
>>       bool try_low;
>>       /** @hit_low: If we cannot evict a bo when @try_low is false 
>> (first pass) */
>>       bool hit_low;
>> +
>> +    /** @alloc_state: State associated with the allocation attempt. */
>> +    struct ttm_bo_alloc_state *alloc_state;
>>   };
>>   static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct 
>> ttm_buffer_object *bo)
>> @@ -518,8 +524,9 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk 
>> *walk, struct ttm_buffer_object *
>>           container_of(walk, typeof(*evict_walk), walk);
>>       s64 lret;
>> -    if (!dmem_cgroup_state_evict_valuable(evict_walk->limit_pool, bo- 
>> >resource->css,
>> -                          evict_walk->try_low, &evict_walk->hit_low))
>> +    if (!dmem_cgroup_state_evict_valuable(evict_walk->alloc_state- 
>> >limit_pool,
>> +                          bo->resource->css, evict_walk->try_low,
>> +                          &evict_walk->hit_low))
>>           return 0;
>>       if (bo->pin_count || !bo->bdev->funcs->eviction_valuable(bo, 
>> evict_walk->place))
>> @@ -561,7 +568,7 @@ static int ttm_bo_evict_alloc(struct ttm_device 
>> *bdev,
>>                     struct ttm_operation_ctx *ctx,
>>                     struct ww_acquire_ctx *ticket,
>>                     struct ttm_resource **res,
>> -                  struct dmem_cgroup_pool_state *limit_pool)
>> +                  struct ttm_bo_alloc_state *state)
>>   {
>>       struct ttm_bo_evict_walk evict_walk = {
>>           .walk = {
>> @@ -574,7 +581,7 @@ static int ttm_bo_evict_alloc(struct ttm_device 
>> *bdev,
>>           .place = place,
>>           .evictor = evictor,
>>           .res = res,
>> -        .limit_pool = limit_pool,
>> +        .alloc_state = state,
>>       };
>>       s64 lret;
>> @@ -689,6 +696,58 @@ static int 
>> ttm_bo_add_pipelined_eviction_fences(struct ttm_buffer_object *bo,
>>       return dma_resv_reserve_fences(bo->base.resv, 1);
>>   }
>> +
>> +/**
>> + * ttm_bo_alloc_at_place - Attempt allocating a BO's backing store in 
>> a place
>> + *
>> + * @bo: The buffer to allocate the backing store of
>> + * @place: The place to attempt allocation in
>> + * @ctx: ttm_operation_ctx associated with this allocation
>> + * @force_space: If we should evict buffers to force space
>> + * @res: On allocation success, the resulting struct ttm_resource.
>> + * @alloc_state: Object holding allocation state such as charged 
>> cgroups.
>> + *
>> + * Returns:
>> + * -EBUSY: No space available, but allocation should be retried with 
>> ttm_bo_evict_alloc.
>> + * -ENOSPC: No space available, allocation should not be retried.
>> + * -ERESTARTSYS: An interruptible sleep was interrupted by a signal.
>> + *
>> + */
>> +static int ttm_bo_alloc_at_place(struct ttm_buffer_object *bo,
>> +                 const struct ttm_place *place,
>> +                 struct ttm_operation_ctx *ctx,
>> +                 bool force_space,
>> +                 struct ttm_resource **res,
>> +                 struct ttm_bo_alloc_state *alloc_state)
>> +{
>> +    bool may_evict;
>> +    int ret;
>> +
>> +    may_evict = (force_space && place->mem_type != TTM_PL_SYSTEM);
>> +
>> +    ret = ttm_resource_alloc(bo, place, res,
>> +                 force_space ? &alloc_state->limit_pool : NULL);
>> +
>> +    if (ret) {
>> +        /*
>> +         * -EAGAIN means the charge failed, which we treat like an
>> +         * allocation failure. Therefore, return an error code 
>> indicating
>> +         * the allocation failed - either -EBUSY if the allocation 
>> should
>> +         * be retried with eviction, or -ENOSPC if there should be no 
>> second
>> +         * attempt.
>> +         */
> 
> Ah having started reading 4/6 I see this comment actually is one patch 
> premature. So please fix that and keep my r-b.

Or perhaps you are talking about charge here, not because in a later 
patch the call to try charge is put right here, but because even now it 
is happening inside the ttm_resource_alloc? I guess that's passable 
although not immediately obvious from just the context of this function. 
Okay, I think the comment can stay as is since in the next patch it 
becomes immediately obvious, sorry for the noise.

Regards,

Tvrtko

>> +        if (ret == -EAGAIN)
>> +            return may_evict ? -EBUSY : -ENOSPC;
>> +
>> +        if (ret == -ENOSPC && may_evict)
>> +            return -EBUSY;
>> +
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   /**
>>    * ttm_bo_alloc_resource - Allocate backing store for a BO
>>    *
>> @@ -714,7 +773,9 @@ static int ttm_bo_alloc_resource(struct 
>> ttm_buffer_object *bo,
>>                    bool force_space,
>>                    struct ttm_resource **res)
>>   {
>> +    struct ttm_bo_alloc_state alloc_state = {0};
>>       struct ttm_device *bdev = bo->bdev;
>> +    struct ttm_resource_manager *man;
>>       struct ww_acquire_ctx *ticket;
>>       int i, ret;
>> @@ -725,9 +786,6 @@ static int ttm_bo_alloc_resource(struct 
>> ttm_buffer_object *bo,
>>       for (i = 0; i < placement->num_placement; ++i) {
>>           const struct ttm_place *place = &placement->placement[i];
>> -        struct dmem_cgroup_pool_state *limit_pool = NULL;
>> -        struct ttm_resource_manager *man;
>> -        bool may_evict;
>>           man = ttm_manager_type(bdev, place->mem_type);
>>           if (!man || !ttm_resource_manager_used(man))
>> @@ -737,25 +795,26 @@ static int ttm_bo_alloc_resource(struct 
>> ttm_buffer_object *bo,
>>                       TTM_PL_FLAG_FALLBACK))
>>               continue;
>> -        may_evict = (force_space && place->mem_type != TTM_PL_SYSTEM);
>> -        ret = ttm_resource_alloc(bo, place, res, force_space ? 
>> &limit_pool : NULL);
>> -        if (ret) {
>> -            if (ret != -ENOSPC && ret != -EAGAIN) {
>> -                dmem_cgroup_pool_state_put(limit_pool);
>> -                return ret;
>> -            }
>> -            if (!may_evict) {
>> -                dmem_cgroup_pool_state_put(limit_pool);
>> -                continue;
>> -            }
>> +        ret = ttm_bo_alloc_at_place(bo, place, ctx, force_space,
>> +                res, &alloc_state);
>> +        if (ret == -ENOSPC) {
>> +            dmem_cgroup_pool_state_put(alloc_state.limit_pool);
>> +            continue;
>> +        } else if (ret == -EBUSY) {
>>               ret = ttm_bo_evict_alloc(bdev, man, place, bo, ctx,
>> -                         ticket, res, limit_pool);
>> -            dmem_cgroup_pool_state_put(limit_pool);
>> -            if (ret == -EBUSY)
>> +                         ticket, res, &alloc_state);
>> +
>> +            dmem_cgroup_pool_state_put(alloc_state.limit_pool);
>> +
>> +            if (ret) {
>> +                if (ret != -EBUSY)
>> +                    return ret;
>>                   continue;
>> -            if (ret)
>> -                return ret;
>> +            }
>> +        } else if (ret) {
>> +            dmem_cgroup_pool_state_put(alloc_state.limit_pool);
>> +            return ret;
>>           }
>>           ret = ttm_bo_add_pipelined_eviction_fences(bo, man, ctx- 
>> >no_wait_gpu);
>>
> 

