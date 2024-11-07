Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9601C9C0623
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 13:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975AF10E82F;
	Thu,  7 Nov 2024 12:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W8zdS3Dp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8100710E82E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 12:49:00 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-539fbe22ac0so847329e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2024 04:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730983739; x=1731588539; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GzpE9qb2EMxQWUJItUkvqlNcakV4YKBc1CCxaGXFbWA=;
 b=W8zdS3DpG8lJKoPNLH6Osamd46ZZszPXDCyMV/disxtz9TQ7IVEj2dEGnfUe+rWuxx
 Ez1/jwBQvxsE6XXCK5bAh5GyponKEfGbW+opNA1E7bxcOeUS/wwGWxFKF1bLQwHy5F5A
 ev1ansIIkqfIIdpuzV+yEg9R64YOA6MQN+YyZOEm8Up7QhTHLqHge2YZVo2BCWDPPHuj
 MSlYIAsUtB5+xvtdRspjGAgJLydQshuCMXKN+DWNUiyTbnrM2Ns0px7PmoUwhIwkRxcE
 TLAWavUDUKlbN52wERdvcluYVZYHvD+bXmX9OqAzVjFs2Af8Da/gj0yG/7SR9FRJZMPo
 1RFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730983739; x=1731588539;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GzpE9qb2EMxQWUJItUkvqlNcakV4YKBc1CCxaGXFbWA=;
 b=B/p9/DzsVpPxWhZZa+rSiY+qsxRW5A0olpJFkqmyz6ACZ5kNrFFHSI5lCc3PriiGQ5
 ahdqVHNTMIKkGK/JiGmcp9QOAODwaQhi5fjR3CyCGZKFDwMmmXnksv0hlTcO1eTwRxxA
 cx/iVWkAOV3U7wf2wm18Z0I0CNoDryHXYWmengHnJOTOxIAw4YBOsyADfdTkdt5Yq2mD
 KwBUODWgqpaLYpEejENbhA+enKuW4ofKKO9LwLAdvtoLAwQdyJaaBLL0mTnrUL3ptrRZ
 R6yyf4+9wrhdw/+Sw8eBIguEG0TXtNqgJoxu+HvWJoYjlbB5ra8i6JqhylOKDVB8zRKg
 ymwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCViZq9VFAgq+3iPyb6+Pzm9+uMDTRb+grHFh86Y52MJR59giioIWPZ9l7iEb4Q6/TK6yGqG7QDeinU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznnPXYlEpuVBRaXHflBnJlIDtnKUrMXIZFtZrPpSUJ1CP6bfqW
 2LM+1VP1eS37Yv/JVeF1JzI+rGtJu0yO9Y9U+qQ8Ujhk14/egV2J
X-Google-Smtp-Source: AGHT+IE6M7yjAgTJlsZNN5RYDp+9fpOvsDh+TelDAquVRAwgpPO+/VegtcIcWvQFwBtCy2cpEMlqeg==
X-Received: by 2002:a05:6512:159a:b0:52e:7542:f469 with SMTP id
 2adb3069b0e04-53b34721a76mr23342734e87.0.1730983738231; 
 Thu, 07 Nov 2024 04:48:58 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b3de8710sm8481375e9.17.2024.11.07.04.48.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 04:48:56 -0800 (PST)
Message-ID: <ad7dd75e-ae60-436f-a0e7-0207d21934ae@gmail.com>
Date: Thu, 7 Nov 2024 13:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dma-buf/dma-fence_array: use kvzalloc
To: Tvrtko Ursulin <tursulin@ursulin.net>, friedrich.vock@gmx.de,
 Richardqi.Liang@amd.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20241024124159.4519-1-christian.koenig@amd.com>
 <20241024124159.4519-2-christian.koenig@amd.com>
 <8d7bab43-d561-487d-bdc6-86fc230db655@ursulin.net>
 <ca23d4c5-74ff-4d1d-ace0-72ecd51aa527@ursulin.net>
 <6a8d4197-26ec-4d57-b5a3-98bc3008dfc2@gmail.com>
 <bf40ee5e-c3f5-486c-9d23-57e48a4758f1@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <bf40ee5e-c3f5-486c-9d23-57e48a4758f1@ursulin.net>
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

Am 07.11.24 um 12:29 schrieb Tvrtko Ursulin:
>
> On 28/10/2024 10:34, Christian König wrote:
>> Am 25.10.24 um 11:05 schrieb Tvrtko Ursulin:
>>>
>>> On 25/10/2024 09:59, Tvrtko Ursulin wrote:
>>>>
>>>> On 24/10/2024 13:41, Christian König wrote:
>>>>> Reports indicates that some userspace applications try to merge 
>>>>> more than
>>>>> 80k of fences into a single dma_fence_array leading to a warning from
>>>>> kzalloc() that the requested size becomes to big.
>>>>>
>>>>> While that is clearly an userspace bug we should probably handle 
>>>>> that case
>>>>> gracefully in the kernel.
>>>>>
>>>>> So we can either reject requests to merge more than a reasonable 
>>>>> amount of
>>>>> fences (64k maybe?) or we can start to use kvzalloc() instead of 
>>>>> kzalloc().
>>>>> This patch here does the later.
>>>>
>>>> Rejecting would potentially be safer, otherwise there is a path for 
>>>> userspace to trigger a warn in kvmalloc_node (see 0829b5bcdd3b 
>>>> ("drm/i915: 2 GiB of relocations ought to be enough for anybody*")) 
>>>> and spam dmesg at will.
>>>
>>> Actually that is a WARN_ON_*ONCE* there so maybe not so critical to 
>>> invent a limit. Up for discussion I suppose.
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>
>>>> Question is what limit to set...
>>
>> That's one of the reasons why I opted for kvzalloc() initially.
>
> I didn't get that, what was the reason? To not have to invent an 
> arbitrary limit?

Well that I couldn't come up with any arbitrary limit that I had 
confidence would work and not block real world use cases.

Switching to kvzalloc() just seemed the more defensive approach.

>
>> I mean we could use some nice round number like 65536, but that would 
>> be totally arbitrary.
>
> Yeah.. Set an arbitrary limit so a warning in __kvmalloc_node_noprof() 
> is avoided? Or pass __GFP_NOWARN?

Well are we sure that will never hit 65536 in a real world use case? 
It's still pretty low.

>
>> Any comments on the other two patches? I need to get them upstream.
>
> Will look into them shortly.

Thanks,
Christian.

>
> Regards,
>
> Tvrtko
>
>
>> Thanks,
>> Christian.
>>
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>> CC: stable@vger.kernel.org
>>>>> ---
>>>>>   drivers/dma-buf/dma-fence-array.c | 6 +++---
>>>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/dma-buf/dma-fence-array.c 
>>>>> b/drivers/dma-buf/dma-fence-array.c
>>>>> index 8a08ffde31e7..46ac42bcfac0 100644
>>>>> --- a/drivers/dma-buf/dma-fence-array.c
>>>>> +++ b/drivers/dma-buf/dma-fence-array.c
>>>>> @@ -119,8 +119,8 @@ static void dma_fence_array_release(struct 
>>>>> dma_fence *fence)
>>>>>       for (i = 0; i < array->num_fences; ++i)
>>>>>           dma_fence_put(array->fences[i]);
>>>>> -    kfree(array->fences);
>>>>> -    dma_fence_free(fence);
>>>>> +    kvfree(array->fences);
>>>>> +    kvfree_rcu(fence, rcu);
>>>>>   }
>>>>>   static void dma_fence_array_set_deadline(struct dma_fence *fence,
>>>>> @@ -153,7 +153,7 @@ struct dma_fence_array 
>>>>> *dma_fence_array_alloc(int num_fences)
>>>>>   {
>>>>>       struct dma_fence_array *array;
>>>>> -    return kzalloc(struct_size(array, callbacks, num_fences), 
>>>>> GFP_KERNEL);
>>>>> +    return kvzalloc(struct_size(array, callbacks, num_fences), 
>>>>> GFP_KERNEL);
>>>>>   }
>>>>>   EXPORT_SYMBOL(dma_fence_array_alloc);
>>

