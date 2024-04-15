Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A969C8A52B3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 16:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85021125E6;
	Mon, 15 Apr 2024 14:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fnvcjFmF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060711125E6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 14:08:55 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-343c2f5b50fso2469351f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 07:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713190134; x=1713794934; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7ffqkZv6NU1XVLoi7ZZmP9xiD5mI03MT5YlX8qNMxec=;
 b=fnvcjFmFRneQoMb+toxKzwSeFIiLMom7Igm10Ua6jM7zAPT3spHj8N04AQ6ykxbhud
 1MbP63lMxgGaIJ20ebOqB6p1rFzoBMWCRGCcFPnADX6OBWH7cndjo51Lp9l7RDbSJx0h
 pcSp4OvtSurN6E33ZWnm+bQcTGAwoWYVn0QK6ntp2K16BslUCZP3zFKZiNIFp6cuRfC0
 hKUEQoQkbrFeuL+AVx5M4SXhHz61frH5KeSbiJfJ5GOw0RYujJtrGYFjVO+1WoJg6QP8
 iNFbGXfDsqqoMc9aDZf8VmXHCMoEXzn5aZ6hg9CBAkNMaDFcIaI8+cFhX5XpAmH8F0MV
 sAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713190134; x=1713794934;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7ffqkZv6NU1XVLoi7ZZmP9xiD5mI03MT5YlX8qNMxec=;
 b=qvvydrGdTcMiBIKPHLDMwds5X/lNHLP+8IIVdiqrApAUiZw92T7OQoJ8221LExpWrw
 3t8DHG5oSCe1VIwRzj+la3JGQBfOm6JiCbUs0nbk//luffiaMxhqLfKnZH0CdYy7jcug
 66hioAaGex5PlcJ55oxDEk7X4d+IHKxUS7Le/Hqr1+u8kXCbquU9E39wNP18FpDB2Rbw
 5nLhPtyw8n7V3vOjQsZivYkAmIS4JHT+0jRicIR16jrZ1z2BfoYee2o9KKGE0hYa8Iou
 cJ7ODE/l0rR9+hHxl15aB7o96phM63mYRQ5auwNjgEHsHejwmnY5ikJ3pdBa+fGxdl6N
 GpCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURzqeqaRvkQwp3pKmLBeFKWFnnOIap7rb1o+H/8aGiyLDcyVcwT8RmD4oK+DREdpcW+uwvEmX9pnTttUpKM9Tsrr/uOLVoHZVRKM5Wal5S
X-Gm-Message-State: AOJu0YxU69bt3biAn+PoqkeAbSIizdSVu9/7pd4Qc3YX4DnOjW5BtAqy
 eYo0SeHeBxJPh2l7629+xWWG9gAXv0zoP+ENk8iWMRqm1VQvC9gI
X-Google-Smtp-Source: AGHT+IE+ktQYgsisac562rlKlz2YFklr2GD1YaoOkMzst5BOYaX9SNUBJ70qkBM1Unjkn7prAQRI0A==
X-Received: by 2002:a5d:4412:0:b0:343:93dc:6255 with SMTP id
 z18-20020a5d4412000000b0034393dc6255mr5913337wrq.27.1713190134125; 
 Mon, 15 Apr 2024 07:08:54 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a5d46ce000000b0034335e47102sm12245491wrs.113.2024.04.15.07.08.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Apr 2024 07:08:53 -0700 (PDT)
Message-ID: <345a958f-dde4-4211-850c-7b23ddd71b0b@gmail.com>
Date: Mon, 15 Apr 2024 16:08:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: stop pooling cached NUMA pages v2
To: Felix Kuehling <felix.kuehling@amd.com>, Alexander.Deucher@amd.com,
 Rajneesh.Bhardwaj@amd.com, Steven.Roberts@amd.com,
 dri-devel@lists.freedesktop.org
References: <20240415134821.1919-1-christian.koenig@amd.com>
 <4b04b1d7-2215-42ae-a65a-eb8103bb847e@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <4b04b1d7-2215-42ae-a65a-eb8103bb847e@amd.com>
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

Am 15.04.24 um 15:53 schrieb Felix Kuehling:
> On 2024-04-15 9:48, Christian König wrote:
>> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>>
>> We only pool write combined and uncached allocations because they
>> require extra overhead on allocation and release.
>>
>> If we also pool cached NUMA it not only means some extra unnecessary
>> overhead, but also that under memory pressure it can happen that
>> pages from the wrong NUMA node enters the pool and are re-used
>> over and over again.
>>
>> This can lead to performance reduction after running into memory
>> pressure.
>>
>> v2: restructure and cleanup the code a bit from the internal hack to
>>      test this.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Fixes: 4482d3c94d7f ("drm/ttm: add NUMA node id to the pool")
>> CC: stable@vger.kernel.org
>> ---
>>   drivers/gpu/drm/ttm/ttm_pool.c | 38 +++++++++++++++++++++++++---------
>>   1 file changed, 28 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c 
>> b/drivers/gpu/drm/ttm/ttm_pool.c
>> index 112438d965ff..6e1fd6985ffc 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -288,17 +288,23 @@ static struct ttm_pool_type 
>> *ttm_pool_select_type(struct ttm_pool *pool,
>>                             enum ttm_caching caching,
>>                             unsigned int order)
>>   {
>> -    if (pool->use_dma_alloc || pool->nid != NUMA_NO_NODE)
>> +    if (pool->use_dma_alloc)
>>           return &pool->caching[caching].orders[order];
>>     #ifdef CONFIG_X86
>>       switch (caching) {
>>       case ttm_write_combined:
>> +        if (pool->nid != NUMA_NO_NODE)
>> +            return &pool->caching[caching].orders[order];
>
> Doesn't this break USWC allocations on NUMA systems, where we set a 
> NUMA node for the default pool (at least we were planning to at some 
> point)?

I don't think so, but I might have missed something. Why do you think 
that would break?

I mean the idea is basically if the pool is associated with a NUMA id we 
should rather use this pool instead of the global one.

And that is true for both cases, the default pool and the specialized ones.

Regards,
Christian.

>
> Regards,
>   Felix
>
>
>> +
>>           if (pool->use_dma32)
>>               return &global_dma32_write_combined[order];
>>             return &global_write_combined[order];
>>       case ttm_uncached:
>> +        if (pool->nid != NUMA_NO_NODE)
>> +            return &pool->caching[caching].orders[order];
>> +
>>           if (pool->use_dma32)
>>               return &global_dma32_uncached[order];
>>   @@ -566,11 +572,17 @@ void ttm_pool_init(struct ttm_pool *pool, 
>> struct device *dev,
>>       pool->use_dma_alloc = use_dma_alloc;
>>       pool->use_dma32 = use_dma32;
>>   -    if (use_dma_alloc || nid != NUMA_NO_NODE) {
>> -        for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>> -            for (j = 0; j < NR_PAGE_ORDERS; ++j)
>> - ttm_pool_type_init(&pool->caching[i].orders[j],
>> -                           pool, i, j);
>> +    for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>> +        for (j = 0; j < NR_PAGE_ORDERS; ++j) {
>> +            struct ttm_pool_type *pt;
>> +
>> +            /* Initialize only pool types which are actually used */
>> +            pt = ttm_pool_select_type(pool, i, j);
>> +            if (pt != &pool->caching[i].orders[j])
>> +                continue;
>> +
>> +            ttm_pool_type_init(pt, pool, i, j);
>> +        }
>>       }
>>   }
>>   EXPORT_SYMBOL(ttm_pool_init);
>> @@ -599,10 +611,16 @@ void ttm_pool_fini(struct ttm_pool *pool)
>>   {
>>       unsigned int i, j;
>>   -    if (pool->use_dma_alloc || pool->nid != NUMA_NO_NODE) {
>> -        for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>> -            for (j = 0; j < NR_PAGE_ORDERS; ++j)
>> - ttm_pool_type_fini(&pool->caching[i].orders[j]);
>> +    for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>> +        for (j = 0; j < NR_PAGE_ORDERS; ++j) {
>> +            struct ttm_pool_type *pt;
>> +
>> +            pt = ttm_pool_select_type(pool, i, j);
>> +            if (pt != &pool->caching[i].orders[j])
>> +                continue;
>> +
>> +            ttm_pool_type_fini(pt);
>> +        }
>>       }
>>         /* We removed the pool types from the LRU, but we need to 
>> also make sure

