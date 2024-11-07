Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 520B49C06E2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 14:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6707A10E31B;
	Thu,  7 Nov 2024 13:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="l2//meDt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D449510E31B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 13:08:24 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2fb3c3d5513so8942961fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2024 05:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1730984903; x=1731589703;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tWyOrqyZCzJoURJb2KP6x8DH/aczXFT6+1UEfBPMgBA=;
 b=l2//meDtz09BPsHz2HBWj6RPT112AE4PtErG8FK4m46oWVhrrUnl944WyGfIteKI3v
 v/nSL+CI3cbs67McecLuHMyrIyDgFtrTzFgEn5/2OwqB0xuaep0v7DrcQkOE/V6GMoGe
 JiTv7Yu55Ya7ZWDNOg/NhCmteqn8RhyJAJqjP8kvkwAh651ZQ/PEZeTkQkib43EExCWc
 HK6yLRfc2MhjbRgCU07Bw6rDAjVNx8kjxJe1RAsUT03dRsZZZ6BquWSlKOgIojWwe3Oo
 mmSg5noK8tj2SV6Zkwps1kz1rENWvkkK5BgbixEJWIC877wAclt97waUSzDqRdIHl4wU
 vzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730984903; x=1731589703;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tWyOrqyZCzJoURJb2KP6x8DH/aczXFT6+1UEfBPMgBA=;
 b=VuQR7/pXfsolCTJ09AmsvDm6cwacUK4T3uxqzxBp2NlXSqMHETOUeCpCN9Jas09LNu
 6gAN+l4Ihdf+U6w/dis9fstETvT+lqzeD2XOl0R+CcD/9pmZHH+Zzi8eKSBJd8BKnj2R
 G4FCkYsI/Xidz38/SQOToWLDdHtqaGtZcWFA/GD+uOEK7tm9Mi5Bk4O3rrqgHygLPp+e
 IOkx8VqZOg/1Dpm1HL4hP+Ee66r/gHFMxfyZW8pysHo8moNu2r7Si98IkWJPwOMY7gQU
 wRdo3+8K/uPuri4IM7gCPcQ/JMgy/OxweRnXao4wU8uKRrYpt+/Cv7BWJdzXQASOE7Oc
 4fKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/jLsfhtg+4iymMOoCHEZflWqBt1u1A/FsmEHSqo94n9NxUCRa4a0EBqGJpTRt+g68wGdeNXbiNnI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1kx+bolQbQQSUmtpHDm9xBTTGRDaImhlKN4T8/l9EOckabo6S
 VmSWa+64QKL6Orl6zQbt0enVucN6XhLuJnEEkjPTD+byZATPR49nzMqU1tigbY8=
X-Google-Smtp-Source: AGHT+IFBXcrfSw2Uq4+hlm6z6CRrPz+8RdwwT7Kpr9e/Dj/GEo9Oic8Q4+VWsyDfo/unUb5x0P/eBQ==
X-Received: by 2002:a05:651c:b0a:b0:2fb:5740:9f9a with SMTP id
 38308e7fff4ca-2ff1aadce59mr9591731fa.29.1730984902793; 
 Thu, 07 Nov 2024 05:08:22 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b05c0d33sm23859515e9.27.2024.11.07.05.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 05:08:22 -0800 (PST)
Message-ID: <698513cb-1032-4ced-9a41-ccf21356c501@ursulin.net>
Date: Thu, 7 Nov 2024 13:08:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dma-buf/dma-fence_array: use kvzalloc
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 friedrich.vock@gmx.de, Richardqi.Liang@amd.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20241024124159.4519-1-christian.koenig@amd.com>
 <20241024124159.4519-2-christian.koenig@amd.com>
 <8d7bab43-d561-487d-bdc6-86fc230db655@ursulin.net>
 <ca23d4c5-74ff-4d1d-ace0-72ecd51aa527@ursulin.net>
 <6a8d4197-26ec-4d57-b5a3-98bc3008dfc2@gmail.com>
 <bf40ee5e-c3f5-486c-9d23-57e48a4758f1@ursulin.net>
 <ad7dd75e-ae60-436f-a0e7-0207d21934ae@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <ad7dd75e-ae60-436f-a0e7-0207d21934ae@gmail.com>
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


On 07/11/2024 12:48, Christian König wrote:
> Am 07.11.24 um 12:29 schrieb Tvrtko Ursulin:
>>
>> On 28/10/2024 10:34, Christian König wrote:
>>> Am 25.10.24 um 11:05 schrieb Tvrtko Ursulin:
>>>>
>>>> On 25/10/2024 09:59, Tvrtko Ursulin wrote:
>>>>>
>>>>> On 24/10/2024 13:41, Christian König wrote:
>>>>>> Reports indicates that some userspace applications try to merge 
>>>>>> more than
>>>>>> 80k of fences into a single dma_fence_array leading to a warning from
>>>>>> kzalloc() that the requested size becomes to big.
>>>>>>
>>>>>> While that is clearly an userspace bug we should probably handle 
>>>>>> that case
>>>>>> gracefully in the kernel.
>>>>>>
>>>>>> So we can either reject requests to merge more than a reasonable 
>>>>>> amount of
>>>>>> fences (64k maybe?) or we can start to use kvzalloc() instead of 
>>>>>> kzalloc().
>>>>>> This patch here does the later.
>>>>>
>>>>> Rejecting would potentially be safer, otherwise there is a path for 
>>>>> userspace to trigger a warn in kvmalloc_node (see 0829b5bcdd3b 
>>>>> ("drm/i915: 2 GiB of relocations ought to be enough for anybody*")) 
>>>>> and spam dmesg at will.
>>>>
>>>> Actually that is a WARN_ON_*ONCE* there so maybe not so critical to 
>>>> invent a limit. Up for discussion I suppose.
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>>
>>>>> Question is what limit to set...
>>>
>>> That's one of the reasons why I opted for kvzalloc() initially.
>>
>> I didn't get that, what was the reason? To not have to invent an 
>> arbitrary limit?
> 
> Well that I couldn't come up with any arbitrary limit that I had 
> confidence would work and not block real world use cases.
> 
> Switching to kvzalloc() just seemed the more defensive approach.

Yeah it is.

>>> I mean we could use some nice round number like 65536, but that would 
>>> be totally arbitrary.
>>
>> Yeah.. Set an arbitrary limit so a warning in __kvmalloc_node_noprof() 
>> is avoided? Or pass __GFP_NOWARN?
> 
> Well are we sure that will never hit 65536 in a real world use case? 
> It's still pretty low.

Ah no, I did not express myself clearly. I did not mean 64k, but a limit 
to align with INT_MAX __kvmalloc_node_noprof(). Or __GFP_NOWARN might be 
better when allocation size is userspace controlled.

Regards,

Tvrtko

>>> Any comments on the other two patches? I need to get them upstream.
>>
>> Will look into them shortly.
> 
> Thanks,
> Christian.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>
>>> Thanks,
>>> Christian.
>>>
>>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>> CC: stable@vger.kernel.org
>>>>>> ---
>>>>>>   drivers/dma-buf/dma-fence-array.c | 6 +++---
>>>>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/dma-buf/dma-fence-array.c 
>>>>>> b/drivers/dma-buf/dma-fence-array.c
>>>>>> index 8a08ffde31e7..46ac42bcfac0 100644
>>>>>> --- a/drivers/dma-buf/dma-fence-array.c
>>>>>> +++ b/drivers/dma-buf/dma-fence-array.c
>>>>>> @@ -119,8 +119,8 @@ static void dma_fence_array_release(struct 
>>>>>> dma_fence *fence)
>>>>>>       for (i = 0; i < array->num_fences; ++i)
>>>>>>           dma_fence_put(array->fences[i]);
>>>>>> -    kfree(array->fences);
>>>>>> -    dma_fence_free(fence);
>>>>>> +    kvfree(array->fences);
>>>>>> +    kvfree_rcu(fence, rcu);
>>>>>>   }
>>>>>>   static void dma_fence_array_set_deadline(struct dma_fence *fence,
>>>>>> @@ -153,7 +153,7 @@ struct dma_fence_array 
>>>>>> *dma_fence_array_alloc(int num_fences)
>>>>>>   {
>>>>>>       struct dma_fence_array *array;
>>>>>> -    return kzalloc(struct_size(array, callbacks, num_fences), 
>>>>>> GFP_KERNEL);
>>>>>> +    return kvzalloc(struct_size(array, callbacks, num_fences), 
>>>>>> GFP_KERNEL);
>>>>>>   }
>>>>>>   EXPORT_SYMBOL(dma_fence_array_alloc);
>>>
> 
