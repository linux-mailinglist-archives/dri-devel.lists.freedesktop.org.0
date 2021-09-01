Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2EC3FD479
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 09:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E466E133;
	Wed,  1 Sep 2021 07:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF416E133
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 07:35:16 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id m9so3034462wrb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 00:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=JGtsR6BLnFG1UF+8zLEEcTtFp5RK4ru7w1KvRvT+9SM=;
 b=JdbglUv7TCcIf3AnWW2XFsC0iwJBjlCIijSlcMjO051TpSaoF3rd89A08grNM7HvR1
 wvyBkyrd9XcTN5M86NlWFocTwjrrn3QnWa+mqgJgBLvlOZ27GMwi9hORgpxEvj/vOP/s
 6kXbbhsAeIwcxd/7yEDnk6jnFflPtvbR56q5ahkBROKt1yRJKefHxyortTJvWD0avjyV
 nXXGZ7VuKdaxHvmFC6kbTZ9FAPn+jtxqRaRan/wmhGFDqjlVNwnbjiWCmkSOCokEwqLi
 EMR95J0a4u2Wumz+VffBNrXWpaJ748t+6BIZo2rrEMb53zSu+yf4LpQa4qF9D3JrmZPk
 hbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=JGtsR6BLnFG1UF+8zLEEcTtFp5RK4ru7w1KvRvT+9SM=;
 b=KAWeyDj6WS08FWrR395r5iPgvcF3c28rhSVUDajd40L09wpv0YSXIoILZHGAuZH8g8
 jyX/aneg6mzWk5Qbfm3PUxLkGkEGLvYwaBn/O+pJhfrJZV+piLGKHk7YRFejeetdmoPb
 Sd8FGnlPWyFlxoYkMz6aDHyl/YnxaQz5uGa79PN5CJ3nXRXbaaNlKiDiZ6gDS+jcHWKm
 03zrG2qEcROnEFiB1nsbDg5riB7Eg4E/bGQI1rt8YoUBWN4RQJD8JC8Li3nBlmpVBXqR
 F1qF1YhTaUL39YCkkiYfeQGwKeDFZ/9Zd2GGBVFVZX4jRt63UqBY5UdEnS3MhwXyNII7
 xsFw==
X-Gm-Message-State: AOAM533b2pcGa6T7BuRso4HigSzDw712/y3CDXa43Pj2XUPewqCujz24
 cuoFt/+BU3+3LAZqfv3tuw0=
X-Google-Smtp-Source: ABdhPJyOqecfvKDRDck0Vo5SfglK8RXlXFUwskisGvv32nbqmvU/aXznAA0xviG4jtsI581qQgwGVA==
X-Received: by 2002:a5d:5447:: with SMTP id w7mr36244679wrv.137.1630481715128; 
 Wed, 01 Sep 2021 00:35:15 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id r129sm4588196wmr.7.2021.09.01.00.35.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 00:35:14 -0700 (PDT)
Subject: Re: [PATCH 2/5] drm/ttm: add busy and idle placement flags
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 ray.huang@amd.com
References: <20210831112110.113196-1-christian.koenig@amd.com>
 <20210831112110.113196-2-christian.koenig@amd.com>
 <YS4sNDmk/HKowHxr@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9d0a5eea-b35d-12af-1e38-2fbcdb807132@gmail.com>
Date: Wed, 1 Sep 2021 09:35:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YS4sNDmk/HKowHxr@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Am 31.08.21 um 15:18 schrieb Daniel Vetter:
> On Tue, Aug 31, 2021 at 01:21:07PM +0200, Christian König wrote:
>> More flexible than the busy placements.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c    | 8 +++++++-
>>   include/drm/ttm/ttm_placement.h | 6 ++++++
>>   2 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index 0a3127436f61..c7034040c67f 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -834,6 +834,9 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>>   		const struct ttm_place *place = &placement->placement[i];
>>   		struct ttm_resource_manager *man;
>>   
>> +		if (place->flags & TTM_PL_FLAG_BUSY)
>> +			continue;
>> +
>>   		man = ttm_manager_type(bdev, place->mem_type);
>>   		if (!man || !ttm_resource_manager_used(man))
>>   			continue;
>> @@ -860,6 +863,9 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>>   		const struct ttm_place *place = &placement->busy_placement[i];
>>   		struct ttm_resource_manager *man;
>>   
>> +		if (place->flags & TTM_PL_FLAG_IDLE)
>> +			continue;
>> +
>>   		man = ttm_manager_type(bdev, place->mem_type);
>>   		if (!man || !ttm_resource_manager_used(man))
>>   			continue;
>> @@ -869,7 +875,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>>   		if (likely(!ret))
>>   			return 0;
>>   
>> -		if (ret && ret != -EBUSY)
>> +		if (ret != -EBUSY)
>>   			goto error;
>>   	}
>>   
>> diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
>> index 8995c9e4ec1b..63f7217354c0 100644
>> --- a/include/drm/ttm/ttm_placement.h
>> +++ b/include/drm/ttm/ttm_placement.h
>> @@ -53,6 +53,12 @@
>>   /* For multihop handling */
>>   #define TTM_PL_FLAG_TEMPORARY   (1 << 2)
>>   
>> +/* Placement is only used when we are evicting */
>> +#define TTM_PL_FLAG_BUSY	(1 << 3)
>> +
>> +/* Placement is only used when we are not evicting */
>> +#define TTM_PL_FLAG_IDLE	(1 << 4)
> Using an enum for this (with BIT() macro or so) and then slapping
> kerneldoc on top would be nice. That way you can also use the same enum in
> parameters and structures and it's all a bit easier to find and connect.

I don't really like to define flags as enums since they are not really 
an enumeration.

But some more kerneldoc sounds like a good idea to me.

> Otherwise I think this series makes sense, but probably better for nouveau
> folks to do review/testing.

Yeah, agree completely. I can do some smoke testing with nouveau, but 
that's about it.

Christian.

> -Daniel
>
>> +
>>   /**
>>    * struct ttm_place
>>    *
>> -- 
>> 2.25.1
>>

