Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089119C5779
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 13:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA8D10E307;
	Tue, 12 Nov 2024 12:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F8lDVZxo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AED810E307
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 12:16:05 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-37d538fe5f2so4079075f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 04:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731413764; x=1732018564; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Xk2r5TT0h30aCjDFZkqWHBN68SqgdgkDve5njd0/CE8=;
 b=F8lDVZxosUL/oSwZsdyJs6mMuxjWoGawzpssgW1DBDHKMiPWHxHXOJv8cZ+jVQQ4lM
 A4hvz498B4YlHhUb2Ybi0vd8HcYU5RuW2yfRtuRsdZxO7zh+e15gR9c17jAumN884tpA
 UUpQQoA4UKAJyZcWdvoWQMZskXBLwfSesPb4Z6Iwmoxfclw6pAsrhcmhn8i/gMbmsqVx
 5QtqekjsWcH8X3HyBvyxF2FSeg/XHBPpjqvR3R522rvoTgBKCRjnAA1VxZVEG46cToXH
 U7SFA5hYbPNFQY5zOfX6ya95oqFEHQMETqfAOgou3X+LLGw3+L9Mg/RT3kfGDnsgBwxB
 OYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731413764; x=1732018564;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xk2r5TT0h30aCjDFZkqWHBN68SqgdgkDve5njd0/CE8=;
 b=RDINGgjAXQPecrGv6UQytQy3bLciYKEzFf1+BljOGaAUHO/Xb5nlVhdRZbKxzZA0db
 nywdQuxhMWNX6zAgczaoyr+/Lg8x/DQaPtyEjLSrVZS7Ze/MFa6BGfDViZoZ5nfIsOag
 ui5iup3tBuv/DQE0jeGrpnexAFrbuknwyBUVMJ1XwJRko95OLjNzh7a15Wy4AxloGC0Z
 Q2wCmNEQqgHpSufKbaKuNRGtiXH2zwF1ffJ9CfcbXa1LfXRqpmZvH1oYqHGn0VXyx33J
 SYItxaKXISEMPu8QnidZt+GMmqi6jZgcFM8AhW8fLw2Snk2X1eCDv+XxbMo6UTalGBJv
 5MHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2ymIVpzBGGbMFN7mIC/2WosO7QqCDxiIankFeD56BmDcffBsXPkFxfRQCZHYpXjW89kuddZuGQ/U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7hU5RGs1M+KYFWZHHvBXV+3G9n/kSQgMyiNqJdGaCJkGTsgWl
 2vcc3MKTSuBaL7n5VUDKPI9WmK5WOzpM4zDMYtqXECe6/d5Mk8/V
X-Google-Smtp-Source: AGHT+IGRstxDyO1wD4iJDn0SplD0kV95VdacDSexL88KEM8+es7bEtlOUGv0CQUkgkPnc1Bh/aoQpg==
X-Received: by 2002:a5d:6d0a:0:b0:37d:4cd6:6f2b with SMTP id
 ffacd0b85a97d-381f17212d2mr13238059f8f.14.1731413763538; 
 Tue, 12 Nov 2024 04:16:03 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed970d89sm15643385f8f.8.2024.11.12.04.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 04:16:02 -0800 (PST)
Message-ID: <5e538c7a-4f75-404f-9d00-4672cb5cbbee@gmail.com>
Date: Tue, 12 Nov 2024 13:16:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: fix dma_fence_array_signaled
To: Tvrtko Ursulin <tursulin@ursulin.net>, boris.brezillon@collabora.com,
 olvaffe@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, lionel.g.landwerlin@intel.com,
 dri-devel@lists.freedesktop.org, faith.ekstrand@collabora.com,
 simona@ffwll.ch
References: <20241108094256.3717-1-christian.koenig@amd.com>
 <20241108094256.3717-2-christian.koenig@amd.com>
 <cce719d7-adc9-4f5b-803a-fd173d325806@ursulin.net>
 <f9d27c0a-084f-4b35-bd6c-af25a6bb830d@gmail.com>
 <c33a5129-10c6-4c58-9443-92156a613cb5@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <c33a5129-10c6-4c58-9443-92156a613cb5@ursulin.net>
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

Am 08.11.24 um 16:52 schrieb Tvrtko Ursulin:
> On 08/11/2024 14:18, Christian König wrote:
>> Am 08.11.24 um 14:01 schrieb Tvrtko Ursulin:
>>>
>>> On 08/11/2024 09:42, Christian König wrote:
>>>> The function silently assumed that signaling was already enabled 
>>>> for the
>>>> dma_fence_array. This meant that without enabling signaling first 
>>>> we would
>>>> never see forward progress.
>>>>
>>>> Fix that by falling back to testing each individual fence when 
>>>> signaling
>>>> isn't enabled yet.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/dma-buf/dma-fence-array.c | 14 +++++++++++++-
>>>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-fence-array.c 
>>>> b/drivers/dma-buf/dma-fence-array.c
>>>> index 46ac42bcfac0..01203796827a 100644
>>>> --- a/drivers/dma-buf/dma-fence-array.c
>>>> +++ b/drivers/dma-buf/dma-fence-array.c
>>>> @@ -103,10 +103,22 @@ static bool 
>>>> dma_fence_array_enable_signaling(struct dma_fence *fence)
>>>>   static bool dma_fence_array_signaled(struct dma_fence *fence)
>>>>   {
>>>>       struct dma_fence_array *array = to_dma_fence_array(fence);
>>>> +    unsigned int i, num_pending;
>>>>   -    if (atomic_read(&array->num_pending) > 0)
>>>> +    num_pending = atomic_read(&array->num_pending);
>>>> +    if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, 
>>>> &array->base.flags)) {
>>>> +        if (!num_pending)
>>>> +            goto signal;
>>>>           return false;
>>>> +    }
>>>> +
>>>> +    for (i = 0; i < array->num_fences; ++i) {
>>>> +        if (dma_fence_is_signaled(array->fences[i]) && 
>>>> !--num_pending)
>>>> +            goto signal;
>>>> +    }
>>>> +    return false;
>>>
>>> Sampling num_pending (and decrementing) and test_bit from an 
>>> unlocked path makes one need to think if there are consequences, 
>>> false negatives, positives or something. Would it be fine to 
>>> simplify like the below?
>>
>> Yeah I've played around with those ideas as well but came to the 
>> conclusion that neither of them are correct.
>>
>>>
>>> static bool dma_fence_array_signaled(struct dma_fence *fence)
>>> {
>>>     struct dma_fence_array *array = to_dma_fence_array(fence);
>>>     unsigned int i;
>>>
>>>     if (atomic_read(&array->num_pending)) {
>>>         for (i = 0; i < array->num_fences; i++) {
>>>             if (!dma_fence_is_signaled(array->fences[i]))
>>>                 return false;
>>
>> That's not correct. num_pending is not necessary equal to the number 
>> of fences in the array.
>>
>> E.g. we have cases where num_pending is just 1 so that the 
>> dma_fence_array signals when *any* fence in it signals.
>
> I forgot about that mode.
>
>>> }
>>>     }
>>>
>>>     dma_fence_array_clear_pending_error(array);
>>>     return true;
>>> }
>>>
>>> Or if the optimisation to not walk the array when signalling is 
>>> already enabled is deemed important, perhaps a less thinking 
>>> inducing way would be this:
>> ...
>>> Decrementing locally cached num_pending in the loop I think does not 
>>> bring anything since when signalling is not enabled it will be stuck 
>>> at num_fences. So the loop walks the whole array versus bail on 
>>> first unsignalled, so latter even more efficient.
>>
>> That is not for optimization but for correctness.
>>
>> What the patch basically does is the following:
>> 1. Grab the current value of num_pending.
>>
>> 2. Test if num_pending was potentially already modified because 
>> signaling is already enabled, if yes just test it and return the result.
>>
>> 3. If it wasn't modified go over the fences and see if we already 
>> have at least num_pending signaled.
>>
>> I should probably add a code comment explaining that.
>
> It would be good yes.
>
> DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT can appear any time, even after the 
> check, hence I am not sure the absence of the bit can be used to 
> guarantee num_pending is stable. But I think this one is safe, since 
> the loop will in any case find the desired number of signalled fences 
> even if num_pending is stale (too high).
>
> Also, can num_pending underflow in signal-on-any mode and if it can 
> what can happen in unsigned int num_pending and the below loop. 
> Potentially just one false negative with the following query returning 
> signalled from the top level dma-fence code.

Oh, good point. Yeah num_pending can indeed underflow when signaling is 
enabled. I've fixed the check accordingly.

> In summary I think patch works. I am just unsure if the above race can 
> silently happen and cause one extra round trip through the query. If 
> it can it still works, but definitely needs a big fat comment to 
> explain it.

I've added the summary from Boris as comment.

Thanks,
Christian.

>
> Regards,
>
> Tvrtko
>
>>
>>> In which case, should dma-fence-chain also be aligned to have the 
>>> fast path bail out?
>>
>> Good point need to double check that code as well.
>>
>> Thanks,
>> Christian.
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>   +signal:
>>>>       dma_fence_array_clear_pending_error(array);
>>>>       return true;
>>>>   }
>>

