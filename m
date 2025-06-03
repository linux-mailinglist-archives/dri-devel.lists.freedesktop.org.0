Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105C7ACC981
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 16:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EF110E05F;
	Tue,  3 Jun 2025 14:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="OyheRGCI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C67710E05F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 14:47:24 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-45024721cbdso45631805e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1748962043; x=1749566843;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ewHgNoVcNAkcMsUN3iEXCQYm/U3qZvlHPrAzrsMVsXI=;
 b=OyheRGCIIBJwiBOql7yvZqkXhsVvwe8Q4ooyCBw01HV/ansd9GF5DkQ03Ca+lqUXW0
 UfrQevn7lnw95pvWLzuEXCC/H5sZyOFckkMuoJItQQQOUqox+8FvgrQWSHI8iOuqbQHs
 v9m7KHFvhhQaCFeRkOWGJCKy9Vt8feiFpxw3aPfpHvcod7mSwuyVNQAVkh/isq6tuP7C
 vAGnE+kAiDHWPfFQnFcJfOI4nFIm8umHzyAKNN8bJhD8/270Av9py6nJiFQqlLJg7Sdc
 PiiGBNob+lZEk74ayH/3WQvAh4deGhpvphzF8GLGrOmAJy8nPBENWdwclRXk4WkqKUCx
 2ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748962043; x=1749566843;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ewHgNoVcNAkcMsUN3iEXCQYm/U3qZvlHPrAzrsMVsXI=;
 b=MVyYWQp7rP7IYOuhAdxNeMWFydyOGp1OTuIjly3loCzzgv0rlf0PEnRFe09DOY/Ft3
 5m6BmUF1R35TsF2JTTL0XnAV8ws0VRaqVQ0Wd9JyIPn0dyJg9dcXy4qye6ioZc2ULBnS
 4cNby685Pw2jjFgN/iHdSvVihwJXS0oy12AUlEUwa6FiWd0dryEy/RpoJrmOz4Al3N3r
 pZityc6NXdVo2KwD7rw7xCZP4kWkcC4gvAY2A5N3JOcDAZLfl1UvCZB99yW7WS/76OJn
 YBTfg0y5AlbGOdMLRCNI6FpzMD0KecE5TOKDLCSukD6lg4xEBtG0+AqgKlUKJrMIclN4
 jHhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKLtoUAZZRSBhNalPoo895tFyooi4mVuMcNpydsieqVPCmRkF2sVePk1N1YTTesmo/cnMMkQxS8AI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywR3nHI0E2INf+ObQe73KIiHJ8O0s6blSCOxt+XRL3bG7LJOlj
 +Sw4YobkQt4Jjdj3B17VDLxwEnbOafumUsDGlDSOkuSJWv2+eWUPA4nWs8uc4iJnARM=
X-Gm-Gg: ASbGncsKyLRilu/vTj3rUDwPZy8FzzE/qBm8LbG9hwKQ3MSmPqp+7mMdBaicTKe+DVk
 /g/PcE7v8GKr7qri0CHjCc8jZsU29AXSU2CW6MDL+Iher1Faaakbpwqh7A36nPNEJNh3TjrRMGR
 O+Qp5W4Jq7Oz93fKXGaRN4v9hlCnHQa7z5su9sJdZjMCihYyWZ6GaAR36630vYBa220s8bJ+hUY
 2dCbhBDiNaigvm+1eLjwVP3Lsxvf+fgpEiG9UlUm+pZEReevAzBPSzkA8bYRX9h7l6X9AjbCZfu
 dNZMYm4PB1f3WUonhDPvnkBSFP65uFe0GAcyUqeBdmy32DI1QIGGhK/NnfBs8QFsZJLDOjkF8lf
 U
X-Google-Smtp-Source: AGHT+IG9Gr4XQ+5QhvCqE4lU8PgjCYsQT+gY99Td1wBvYZPhIJLspU6C+GyWY8M57zVgeRhfhzV1gw==
X-Received: by 2002:a05:600c:1c96:b0:43c:fc04:6d35 with SMTP id
 5b1f17b1804b1-450d64e2a8amr166817255e9.4.1748962042186; 
 Tue, 03 Jun 2025 07:47:22 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7fb8990sm168843195e9.32.2025.06.03.07.47.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 07:47:21 -0700 (PDT)
Message-ID: <4c41a65e-de43-45c9-b672-88a2760a1a75@ursulin.net>
Date: Tue, 3 Jun 2025 15:47:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/ttm: Increase pool shrinker batch target
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250603112750.34997-1-tvrtko.ursulin@igalia.com>
 <20250603112750.34997-3-tvrtko.ursulin@igalia.com>
 <b5ddbaf7-9f74-49d7-a45f-ed73ed5df0ac@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <b5ddbaf7-9f74-49d7-a45f-ed73ed5df0ac@amd.com>
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


On 03/06/2025 13:57, Christian König wrote:
> On 6/3/25 13:27, Tvrtko Ursulin wrote:
>> The default core shrink target of 128 pages (SHRINK_BATCH) is quite low
>> relative to how cheap TTM pool shrinking is, and how the free pages are
>> distributed in page order pools.
>>
>> We can make the target a bit more aggressive by making it roughly the
>> average number of pages across all pools, freeing more of the cached
>> pages every time shrinker core invokes our callback.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_pool.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>> index c060c90b89c0..e671812789ea 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -1265,10 +1265,16 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>>   }
>>   EXPORT_SYMBOL(ttm_pool_debugfs);
>>   
>> +/* Free average pool number of pages.  */
>> +#define TTM_SHRINKER_BATCH ((1 << (MAX_PAGE_ORDER / 2)) * NR_PAGE_ORDERS)
> 
> To be honest this feels random. But I can't come up with a better idea either and it still looks better than the default as far as I can see.
> 
> So feel free to add Reviewed-by: Christian König <christian.koenig@amd.com> to the series.

Thanks!

> Should I push it to drm-misc-next or do you now have commit rights?

I should be able to, think I've tested it already once.

Regards,

Tvrtko

>> +
>>   /* Test the shrinker functions and dump the result */
>>   static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
>>   {
>> -	struct shrink_control sc = { .gfp_mask = GFP_NOFS };
>> +	struct shrink_control sc = {
>> +		.gfp_mask = GFP_NOFS,
>> +		.nr_to_scan = TTM_SHRINKER_BATCH,
>> +	};
>>   
>>   	fs_reclaim_acquire(GFP_KERNEL);
>>   	seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(mm_shrinker, &sc),
>> @@ -1326,6 +1332,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>>   
>>   	mm_shrinker->count_objects = ttm_pool_shrinker_count;
>>   	mm_shrinker->scan_objects = ttm_pool_shrinker_scan;
>> +	mm_shrinker->batch = TTM_SHRINKER_BATCH;
>>   	mm_shrinker->seeks = 1;
>>   
>>   	shrinker_register(mm_shrinker);
> 

