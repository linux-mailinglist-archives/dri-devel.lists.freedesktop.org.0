Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785499B2CF4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698B610E45E;
	Mon, 28 Oct 2024 10:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HRbDQiu+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9873010E45E
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:34:15 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53a097aa3daso3485297e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 03:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730111654; x=1730716454; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g7nrYUHUQAGlqcSF1DH4MZfbh2UDaXnpWdDb0g1xC7A=;
 b=HRbDQiu+s1to3QN23g50hAwgq0aHgUvZt7Ma3BSbctQEL0c2K86HDhU0PkfDS1YiwB
 fLo/uUCRfVQv9IVrMaVsStfbfG6J5DHYQeuUxPnYlvh6HS3sK8Ntd8zDlW8VERMP0ZGj
 ccy5ziUPCF+Pi2fEUzU/0OnMEnnEVyTohvqjCRiQRAyrmeX9Cp3NA7PSdp9bpBFenwX6
 L/x4H0RGl0ymtZREtxOO93eg0pE1aqWzQKuSw7T8NWMg0RhNKUjtb9m03dfYh1kuXjE4
 PEAAKBdZWHFin3+FqG+E2Ww90j8NH72zOfI21lwR7gTGg6AIIPMmjWvoCn3owpzCC6wf
 u9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730111654; x=1730716454;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g7nrYUHUQAGlqcSF1DH4MZfbh2UDaXnpWdDb0g1xC7A=;
 b=ozQEUWJpu2t9FDv+JouexYP5siRf4gYzoBLMthAuOaRKJEqKQTq4HB5fRKs/pkR2R4
 oyLHNWjIBcwB4mi1Qa8crjkK2DtqJLnzqIok6nAooHcZg4VQjPuyQhItW1x3HvEO+kxv
 b4x8e19cw15T9tlwWy17SHjSIhtmbFNZSCXRdQtMa5pzZMNPdmIeuLphuulIr7BufH7Y
 svXmBqonaIM5UbLReHBjMFpccCvKH/gjQnQkYHU0QnWpHDXbRIZFWmBnfW5PlDAKcgwU
 Z/WjEo3OMEusL029xJkql5SvGvhmFc1u0zJ805yYqyZ4JQe8oTmpJRuFzmV9lSPpGBDj
 nhKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq3f6ls6xUyUHhaUDZdWPE2N+M6DqwdTzFcbhUD98u3lr7NxFs7TtG4WvGmIQGueg1c8aeUyBM7Ig=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVLE1UHPkWZlVKYLYntOGQ+cCL1MRbmRI7b58o8V9ukCxDlBgN
 AssUFzKchkNTL718AbXdTUREcB+k38SJc5wFv3g4uzkv1sR9rAf1
X-Google-Smtp-Source: AGHT+IHoBe6oO8PYZGl3+qBTM5n53ghlUJDEj0r9DYaH/xfvybkBeP2XPFw42uN0pzrRgBB+YLIjIQ==
X-Received: by 2002:a05:6512:23a9:b0:536:55cf:3148 with SMTP id
 2adb3069b0e04-53b348deb93mr2968873e87.31.1730111653332; 
 Mon, 28 Oct 2024 03:34:13 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4318b58b7e8sm137070495e9.48.2024.10.28.03.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 03:34:12 -0700 (PDT)
Message-ID: <6a8d4197-26ec-4d57-b5a3-98bc3008dfc2@gmail.com>
Date: Mon, 28 Oct 2024 11:34:11 +0100
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
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ca23d4c5-74ff-4d1d-ace0-72ecd51aa527@ursulin.net>
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

Am 25.10.24 um 11:05 schrieb Tvrtko Ursulin:
>
> On 25/10/2024 09:59, Tvrtko Ursulin wrote:
>>
>> On 24/10/2024 13:41, Christian König wrote:
>>> Reports indicates that some userspace applications try to merge more 
>>> than
>>> 80k of fences into a single dma_fence_array leading to a warning from
>>> kzalloc() that the requested size becomes to big.
>>>
>>> While that is clearly an userspace bug we should probably handle 
>>> that case
>>> gracefully in the kernel.
>>>
>>> So we can either reject requests to merge more than a reasonable 
>>> amount of
>>> fences (64k maybe?) or we can start to use kvzalloc() instead of 
>>> kzalloc().
>>> This patch here does the later.
>>
>> Rejecting would potentially be safer, otherwise there is a path for 
>> userspace to trigger a warn in kvmalloc_node (see 0829b5bcdd3b 
>> ("drm/i915: 2 GiB of relocations ought to be enough for anybody*")) 
>> and spam dmesg at will.
>
> Actually that is a WARN_ON_*ONCE* there so maybe not so critical to 
> invent a limit. Up for discussion I suppose.
>
> Regards,
>
> Tvrtko
>
>>
>> Question is what limit to set...

That's one of the reasons why I opted for kvzalloc() initially.

I mean we could use some nice round number like 65536, but that would be 
totally arbitrary.

Any comments on the other two patches? I need to get them upstream.

Thanks,
Christian.

>>
>> Regards,
>>
>> Tvrtko
>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> CC: stable@vger.kernel.org
>>> ---
>>>   drivers/dma-buf/dma-fence-array.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence-array.c 
>>> b/drivers/dma-buf/dma-fence-array.c
>>> index 8a08ffde31e7..46ac42bcfac0 100644
>>> --- a/drivers/dma-buf/dma-fence-array.c
>>> +++ b/drivers/dma-buf/dma-fence-array.c
>>> @@ -119,8 +119,8 @@ static void dma_fence_array_release(struct 
>>> dma_fence *fence)
>>>       for (i = 0; i < array->num_fences; ++i)
>>>           dma_fence_put(array->fences[i]);
>>> -    kfree(array->fences);
>>> -    dma_fence_free(fence);
>>> +    kvfree(array->fences);
>>> +    kvfree_rcu(fence, rcu);
>>>   }
>>>   static void dma_fence_array_set_deadline(struct dma_fence *fence,
>>> @@ -153,7 +153,7 @@ struct dma_fence_array 
>>> *dma_fence_array_alloc(int num_fences)
>>>   {
>>>       struct dma_fence_array *array;
>>> -    return kzalloc(struct_size(array, callbacks, num_fences), 
>>> GFP_KERNEL);
>>> +    return kvzalloc(struct_size(array, callbacks, num_fences), 
>>> GFP_KERNEL);
>>>   }
>>>   EXPORT_SYMBOL(dma_fence_array_alloc);

