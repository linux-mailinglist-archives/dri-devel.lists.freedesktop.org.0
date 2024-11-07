Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E6B9C03FA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 12:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5B510E307;
	Thu,  7 Nov 2024 11:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="r1hhdRxf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3864710E307
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 11:29:30 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43155abaf0bso7790085e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2024 03:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1730978968; x=1731583768;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NDPsSx73LywL/q27NrvbFNdAii7+R064iVsafnYXABc=;
 b=r1hhdRxfm9ApCy+13pII27SJWf8IM3VKpAdFvzzidvRqvKBu9MLaUe1kI+gn9iRD4F
 Cf2FFYi4Q4B94iTzNJ1i6h05PfOHrOckdD8OwtQaOIGrqnpfthD8gjzSKn1ZX+VW5Y37
 l1eSnlpm0riOoNBkB+opJDVM/6MH/xSQ+7+pxyfmTibUWF4Y4WlsRdKcy+0WGM80SyfK
 /smKIQCSbqGKkYUR/T0by9uAB/1vHhy1ABbPp8OaBRpMSnPsn6zPJfJRCt4iCfcXRK4b
 +QUFig8lOWeYNW8gE2uF0wDJW4piZ4h/uhhitwpH7pKg673tIqsUrYjEhs5ej4esnirJ
 g52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730978968; x=1731583768;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NDPsSx73LywL/q27NrvbFNdAii7+R064iVsafnYXABc=;
 b=o2jPI0QCDlJMSBloSoqEtiyqOU2wUsJjJWJiGHir2k5hgoIe7SwkVVxfroydMtLqoh
 nvC+pv1KpgWx4vq2C7iD4x42uDZnTL4PXmASf7MRZZhkHaqOimz/8//zKwcSLPobdnn3
 tWx04pzhe3h4yum7Q4apa9u876TEJ2XbnuOsGnVKB5zW6Cb1NU5mlqsT1Xo4uuhHYQJX
 RaHWMKkVFIJt4Odfr3IBroX+ldv2iUL6cWMAEB+9XIASEcz8lLe/2FHRUsGmQMrPikAQ
 6zXIspCe3HfWuOcN1aPdKp84yOn/zjPDNBPwrnnZXoP2Vu8ofcXmvo6NieZCd/QK+YpV
 7ipA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWju10ksHB20ALHxA0yUiHBRoxkB0oTtMCrXiGldPKaz2ngagAcJlgggY9hjgp+QgBajTYuEs5IDus=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGxq1EkSiJOSLeggm7zC2hlSkwjMma35+CrpKYtSQvBNXCI5JF
 i6pWCp2jyq7vdrXy18j+dJdc5SIfv+XY3xB5wDCDxN5ynpL5yyktogGopTY37Z8=
X-Google-Smtp-Source: AGHT+IGJE0ZSy8KNC0lQcr9qTsV9YjSrpMVPplZP95jSq0f9t8AqspZLMFAJmyRPe0WOASupleafAA==
X-Received: by 2002:a05:6000:1844:b0:37d:481e:8e29 with SMTP id
 ffacd0b85a97d-381c7a5e1b6mr18626721f8f.25.1730978968368; 
 Thu, 07 Nov 2024 03:29:28 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed9f8f0asm1514125f8f.79.2024.11.07.03.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 03:29:27 -0800 (PST)
Message-ID: <bf40ee5e-c3f5-486c-9d23-57e48a4758f1@ursulin.net>
Date: Thu, 7 Nov 2024 11:29:27 +0000
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
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <6a8d4197-26ec-4d57-b5a3-98bc3008dfc2@gmail.com>
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


On 28/10/2024 10:34, Christian König wrote:
> Am 25.10.24 um 11:05 schrieb Tvrtko Ursulin:
>>
>> On 25/10/2024 09:59, Tvrtko Ursulin wrote:
>>>
>>> On 24/10/2024 13:41, Christian König wrote:
>>>> Reports indicates that some userspace applications try to merge more 
>>>> than
>>>> 80k of fences into a single dma_fence_array leading to a warning from
>>>> kzalloc() that the requested size becomes to big.
>>>>
>>>> While that is clearly an userspace bug we should probably handle 
>>>> that case
>>>> gracefully in the kernel.
>>>>
>>>> So we can either reject requests to merge more than a reasonable 
>>>> amount of
>>>> fences (64k maybe?) or we can start to use kvzalloc() instead of 
>>>> kzalloc().
>>>> This patch here does the later.
>>>
>>> Rejecting would potentially be safer, otherwise there is a path for 
>>> userspace to trigger a warn in kvmalloc_node (see 0829b5bcdd3b 
>>> ("drm/i915: 2 GiB of relocations ought to be enough for anybody*")) 
>>> and spam dmesg at will.
>>
>> Actually that is a WARN_ON_*ONCE* there so maybe not so critical to 
>> invent a limit. Up for discussion I suppose.
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> Question is what limit to set...
> 
> That's one of the reasons why I opted for kvzalloc() initially.

I didn't get that, what was the reason? To not have to invent an 
arbitrary limit?

> I mean we could use some nice round number like 65536, but that would be 
> totally arbitrary.

Yeah.. Set an arbitrary limit so a warning in __kvmalloc_node_noprof() 
is avoided? Or pass __GFP_NOWARN?

> Any comments on the other two patches? I need to get them upstream.

Will look into them shortly.

Regards,

Tvrtko


> Thanks,
> Christian.
> 
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> CC: stable@vger.kernel.org
>>>> ---
>>>>   drivers/dma-buf/dma-fence-array.c | 6 +++---
>>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-fence-array.c 
>>>> b/drivers/dma-buf/dma-fence-array.c
>>>> index 8a08ffde31e7..46ac42bcfac0 100644
>>>> --- a/drivers/dma-buf/dma-fence-array.c
>>>> +++ b/drivers/dma-buf/dma-fence-array.c
>>>> @@ -119,8 +119,8 @@ static void dma_fence_array_release(struct 
>>>> dma_fence *fence)
>>>>       for (i = 0; i < array->num_fences; ++i)
>>>>           dma_fence_put(array->fences[i]);
>>>> -    kfree(array->fences);
>>>> -    dma_fence_free(fence);
>>>> +    kvfree(array->fences);
>>>> +    kvfree_rcu(fence, rcu);
>>>>   }
>>>>   static void dma_fence_array_set_deadline(struct dma_fence *fence,
>>>> @@ -153,7 +153,7 @@ struct dma_fence_array 
>>>> *dma_fence_array_alloc(int num_fences)
>>>>   {
>>>>       struct dma_fence_array *array;
>>>> -    return kzalloc(struct_size(array, callbacks, num_fences), 
>>>> GFP_KERNEL);
>>>> +    return kvzalloc(struct_size(array, callbacks, num_fences), 
>>>> GFP_KERNEL);
>>>>   }
>>>>   EXPORT_SYMBOL(dma_fence_array_alloc);
> 
