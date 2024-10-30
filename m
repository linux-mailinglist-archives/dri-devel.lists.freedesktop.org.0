Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EBB9B65AB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 15:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484C110E2B9;
	Wed, 30 Oct 2024 14:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Buo/FA05";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D7D10E2B9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 14:22:40 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53a0c160b94so7555341e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730298158; x=1730902958; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ewnGVP+QrjApj2Lvmg0PwEBD+Hc0GWAQIlAQdlFJ7d4=;
 b=Buo/FA05aduZhQ/MmkJ5PkNu1cmF810p8wCid8Pt2yTWXMfvbDNJjnSyL+VoybQN04
 OjNB0lbrlAv9ApYSczssx+eYtY29gXgR190eGNxwC3Ai6VLPrZPuyloe9ndJ9QGrNrME
 fCUsOliSwSfQOpxwJzq5YB2IO3lKcyW5lEYVsEI1vMxSy65fNukj9kjVYMio8rlcQcGC
 LgJwf81NCoGJrdThp/YMGvP4H6x+7yaGNR21IlH1RVig7RdXh3YFLfKPG3SpPpw6a1bQ
 IFGRMZOgwc0mJFowaCG2T9PsaZCUi4nKkTmUgHBMlxiLCub5UuTuuS4YIVFyIPeKcuI4
 Q85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730298158; x=1730902958;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ewnGVP+QrjApj2Lvmg0PwEBD+Hc0GWAQIlAQdlFJ7d4=;
 b=eMX9X7JUG2ZZUrlcSKayNcYznVr4TeI3CG0sCmDOkCLRh2GPtFZU/KTFfvjMFAt4Ib
 ItT5SQECEN4nE0/bjP2ZHxJoThTTUnbfuEx1JWY1By4ZKTY0FGnuewJInm9Mhj0bsNzq
 2Hwp5PpuXMHceOWdc87klEct6QqzXU70OPM74N25DDQwgxH9zJ/7QwvZuHbRWg4Ff7S+
 +VgSW0BO3NUXb75eHrIDGd+jtrbJSWC33hd85wJupmQysi2kIv7caAbzwRAHaDQ0DyJ+
 PM1pprY6fAGWfSIY/STRDHaIghep8A9mQflTMhAu7FW+KRyBXyzEO9FI4qvpPoTb9RwM
 tqQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4dbKIexJQNdX5J2ilUA4byd5IRvMRYOvGr0vUglB7JdMPLAt2ZkowBG+rScpQZgGr6mvQU9EBQmY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyy+Xhwb6jodLnuTDcEceFHm5cBElVNMVTeREER41J50LRVV3FI
 65JWB0uPfCScGi+uzxVek2fkyRFkB/MbBBJLYY2hF5/MW9TIy89+
X-Google-Smtp-Source: AGHT+IFzvNeBt85cLaltZb4hURbuKvOGXkGcfFUIS8hKlUSO2SBZD/ukPEh6Gqf4BB5Op6ItWhHZGQ==
X-Received: by 2002:a05:6512:4024:b0:539:8d9b:b624 with SMTP id
 2adb3069b0e04-53b34a31f8fmr8307703e87.55.1730298158222; 
 Wed, 30 Oct 2024 07:22:38 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bb793e51sm29710995e9.1.2024.10.30.07.22.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 07:22:37 -0700 (PDT)
Message-ID: <b4051b8f-a82a-4d77-80c4-09a7a4124845@gmail.com>
Date: Wed, 30 Oct 2024 15:22:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dma-buf/dma-fence_array: use kvzalloc
To: Friedrich Vock <friedrich.vock@gmx.de>,
 Matthew Brost <matthew.brost@intel.com>
Cc: Richardqi.Liang@amd.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20241024124159.4519-1-christian.koenig@amd.com>
 <20241024124159.4519-2-christian.koenig@amd.com>
 <ZxquPRn1QtaVzydE@DUT025-TGLU.fm.intel.com>
 <1ee2453d-f661-4ea6-8b54-3f911b179420@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <1ee2453d-f661-4ea6-8b54-3f911b179420@gmx.de>
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

Am 25.10.24 um 08:52 schrieb Friedrich Vock:
> On 24.10.24 22:29, Matthew Brost wrote:
>> On Thu, Oct 24, 2024 at 02:41:57PM +0200, Christian König wrote:
>>> Reports indicates that some userspace applications try to merge more 
>>> than
>>> 80k of fences into a single dma_fence_array leading to a warning from
>>
>> Really, yikes.
>
> Not really IME. Unless Christian means some reports I don't have access
> to, the cases where userspace applications tried to do that were really
> just cases where the fence count exploded exponentially because
> dma_fence_unwrap_merge failed to actually merge identical fences (see
> patch 2). At no point have I actually seen apps trying to merge 80k+
> unique fences.

While working on it I've modified our stress test tool to send the same 
1GiB SDMA copy to 100k different contexts.

Turned out it's perfectly possible to create so many fences, there is 
nothing blocking userspace to do it.

While this isn't a realistic use case the kernel should at least not 
crash or spill a warning, but either handle or reject it gracefully.

Friedrich can you confirm that patch two in this series fixes the 
problem? I would really like to get it into drm-misc-fixes before 6.12 
comes out.

Thanks,
Christian.

>
> Regards,
> Friedrich
>
>>
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
>>>
>>
>> This patch seems reasonable to me if the above use is in fact valid.
>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> CC: stable@vger.kernel.org
>>
>> Fixes tag?
>>
>> Patch itself LGTM:
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>
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
>>>
>>> -    kfree(array->fences);
>>> -    dma_fence_free(fence);
>>> +    kvfree(array->fences);
>>> +    kvfree_rcu(fence, rcu);
>>>   }
>>>
>>>   static void dma_fence_array_set_deadline(struct dma_fence *fence,
>>> @@ -153,7 +153,7 @@ struct dma_fence_array 
>>> *dma_fence_array_alloc(int num_fences)
>>>   {
>>>       struct dma_fence_array *array;
>>>
>>> -    return kzalloc(struct_size(array, callbacks, num_fences), 
>>> GFP_KERNEL);
>>> +    return kvzalloc(struct_size(array, callbacks, num_fences), 
>>> GFP_KERNEL);
>>>   }
>>>   EXPORT_SYMBOL(dma_fence_array_alloc);
>>>
>>> -- 
>>> 2.34.1
>>>
>

