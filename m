Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5430A40C3E4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 12:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B2A6E905;
	Wed, 15 Sep 2021 10:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432646E905;
 Wed, 15 Sep 2021 10:46:25 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d6so3106351wrc.11;
 Wed, 15 Sep 2021 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=D9nsboeoRFRFMehNMSk+eKmCHRNzoEroL4U7NXf5xHE=;
 b=JPbeJFkuszuQHi62VBPFVyfsXE7vZIeRAcKmlRyPAcUXrtDixV1O2vSpzNP+27dS5b
 Oc+x3Ox1YY3dN6n1Wmt6/LHjo17mdc/I9jAtbqgnoPV8X52nfezTfcWVsrlnLx1MTNlk
 LJBDP13s+Z2MBEoQItK+ztISeVq9VVdxsm6yMqVqZ813/JJXRoxF+l4D5iJfwRvst520
 gkMgX+/6jR6uh9U9BP9HkLYgmDyNcy4DQm0ZiVcZ7cwO1AFWcxP6G9Liu60pOCVJLnMD
 NcmOSs2I3eBKe8HqozjGaZN3AAkYTxCAHK0u1umJnemFmsh4A132BZNkXj1ORbe1SbmA
 /C5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=D9nsboeoRFRFMehNMSk+eKmCHRNzoEroL4U7NXf5xHE=;
 b=DOKj4lam/+XWO48ZommAteyg1Yy9cmzgo3XIwY8V6wI8dYPFlSEzzvzgk5dNOkaSRO
 QL52MgW9zQfrG5EhLzHRB+N5DADtW0AofiNDlfmm44ePAowBtGWIMumGCXAymb3GeNv5
 XR0zhyZAwL2d8vxZvghmxeG9wIRczezb9nbK6z+PSNIlGif68Ao4EaykvPCYWBt5WAUn
 XXGh9c3JlQ075AJqsZiE08u+1W75rcteA9aNpoT8y/lSaXYBfdVpUX1WjAaMWTuwI4Cy
 Lf9HXiuW0jknLC7soCEy11CUoJ2tK3q9uB9TlZkQlpB6/oI8SnRxy2DJ1or8Lez2lUDr
 gT9g==
X-Gm-Message-State: AOAM532tLfcwMA192sjOltBJjxgWEwe8Z4FcxFfaC2lYoiyjOe7x3nwH
 74HImWxkFiCGlRPEBh01CCvWPRHyKeY=
X-Google-Smtp-Source: ABdhPJyhAqvQHAu9Wliypo7hySMKWisUP9ZWL1O87o2QWfl41r7mOXE9Jd9sB6J0ZYNElkdIpUFJBw==
X-Received: by 2002:adf:e649:: with SMTP id b9mr4299584wrn.309.1631702783814; 
 Wed, 15 Sep 2021 03:46:23 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:d03d:8939:3840:1f95?
 ([2a02:908:1252:fb60:d03d:8939:3840:1f95])
 by smtp.gmail.com with ESMTPSA id q128sm4727091wma.27.2021.09.15.03.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 03:46:23 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH 01/26] dma-buf: add
 dma_resv_for_each_fence_unlocked
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
References: <20210913131707.45639-1-christian.koenig@amd.com>
 <20210913131707.45639-2-christian.koenig@amd.com>
 <1eee4105-e154-9d1d-b92b-d17c6f8f8432@linux.intel.com>
 <abeccf85-13d1-9e3a-26c9-1ca0f6d4c322@gmail.com>
 <c03a61f2-9d70-c6f4-584d-b91c89ec7462@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4da378ec-0411-aaf5-fb02-e3a18e7175d3@gmail.com>
Date: Wed, 15 Sep 2021 12:46:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c03a61f2-9d70-c6f4-584d-b91c89ec7462@linux.intel.com>
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

Am 14.09.21 um 15:07 schrieb Tvrtko Ursulin:
> On 14/09/2021 12:25, Christian König wrote:
>> Am 14.09.21 um 12:53 schrieb Tvrtko Ursulin:
>>>
>>> On 13/09/2021 14:16, Christian König wrote:
>>>> [SNIP]
>>>> +        if (fence) {
>>>> +            fence = dma_fence_get_rcu(fence);
>>>> +        } else if (all_fences && cursor->fences) {
>>>> +            struct dma_resv_list *fences = cursor->fences;
>>>
>>> If rcu lock is allowed to be dropped while walking the list what 
>>> guarantees list of fences hasn't been freed?
>>
>> Ah, good point! We need to test the sequence number when we enter the 
>> function as well. Going to fix that.
>
> Right, but just to say, I am still on the fence a bit on the concept 
> of the unlocked iterator. So for now I am looking only superficially 
> at the implementation and i915 side of things.

I'm really in favor of taking the lock as well and contain the unlocked 
operation into the dma_resv object code and I think Daniel is on 
absolutely the same side as well.

But the use cases are as they are for now and I think containing the 
internal structure of the dma_resv object is the right next step.

>>> [SNIP]
>>>>   +/**
>>>> + * struct dma_resv_cursor - current position into the dma_resv fences
>>>> + * @seq: sequence number to check
>>>> + * @index: index into the shared fences
>>>> + * @shared: the shared fences
>>>> + * @is_first: true if this is the first returned fence
>>>> + * @is_exclusive: if the current fence is the exclusive one
>>>> + */
>>>> +struct dma_resv_cursor {
>>>> +    unsigned int seq;
>>>> +    unsigned int index;
>>>> +    struct dma_resv_list *fences;
>>>> +    bool is_first;
>>>
>>> Is_first is useful to callers - like they are legitimately allowed 
>>> to look inside this, what could otherwise be private object?
>>
>> Yes, I was pondering on the same question. Key point is that this is 
>> only used by other dma_resv functions which also use cursor.fences 
>> for example.
>>
>> So this is only supposed to be used by code working with other 
>> privates of the dma_resv object as well.
>
> Hmmm and you think external callers have no legitimate case of 
> detecting restarts?

Yes, if somebody needs a snapshot of the current state and can't for 
some reason take the lock they should use dma_resv_get_fences() instead.

On the other hand allocating memory in dma_resv_get_fences() has 
probably more overhead than just grabbing and releasing the lock.

> Or to better say will not have the need of distinguishing between real 
> restarts and just the first iteration? I need to read more of the 
> series to get a more complete opinion here.

Yeah, that's indeed a good point. Off hand I don't see any, but we 
should probably decide for each place individually if we should take the 
lock, allocate memory or use the lockless iterator.

> [SNIP]
>>>
>>>> +};
>>>> +
>>>> +/**
>>>> + * dma_resv_for_each_fence_unlocked - fence iterator
>>>> + * @obj: a dma_resv object pointer
>>>> + * @cursor: a struct dma_resv_cursor pointer
>>>> + * @all_fences: true if all fences should be returned
>>>> + * @fence: the current fence
>>>> + *
>>>> + * Iterate over the fences in a struct dma_resv object without 
>>>> holding the
>>>> + * dma_resv::lock. The RCU read side lock must be hold when using 
>>>> this, but can
>>>> + * be dropped and re-taken as necessary inside the loop. 
>>>> @all_fences controls
>>>> + * if the shared fences are returned as well.
>>>> + */
>>>> +#define dma_resv_for_each_fence_unlocked(obj, cursor, all_fences, 
>>>> fence)    \
>>>> +    for (fence = dma_resv_walk_unlocked(obj, cursor, all_fences, 
>>>> true); \
>>>> +         fence; dma_fence_put(fence),                    \
>>>> +         fence = dma_resv_walk_unlocked(obj, cursor, all_fences, 
>>>> false))
>>>
>>> Has the fact RCU lock can be dropped so there is potential to walk 
>>> over completely different snapshots been discussed?
>>
>> Well that's basically the heart of the functionality. Even without 
>> dropping the RCU lock there can be an restart at any time when the 
>> dma_resv object is modified.
>
> Hm yes.. that's one of the thing which makes me undecided yet whether 
> a generalised helper is desirable. For example i915_gem_busy_ioctl, as 
> converted, is not completely like-for-like. Maybe it is irrelevant for 
> that one, but then the question needs to be answered for all of the 
> replacements.
>
>>
>>> At least if I followed the code correctly - it appears there is 
>>> potential the walk restarts from the start (exclusive slot) at any 
>>> point during the walk.
>>
>> Correct, yes.
>>
>>> Because theoretically I think you could take an atomic snapshot of 
>>> everything (given you have a cursor object) and then release it on 
>>> the end condition.
>>
>> That's what the dma_resv_get_fences() function is good for, yes. This 
>> one returns an array of fences.
>>
>> The key difference is that we need to allocate memory for that which 
>> is at least sometimes not feasible or desired.
>
> Ah true.. dma_resv_list is not reference counted to simply grab it 
> during setup.
>
>> Thanks for the review,
>
> Np, it is intriguing to look at the option of code consolidation. Just 
> need to read more of the series to form a better high level opinion.

Really appreciated, thanks for looking into this.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>> Christian.
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> +
>>>>   #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>>>>   #define dma_resv_assert_held(obj) 
>>>> lockdep_assert_held(&(obj)->lock.base)
>>>>   @@ -366,6 +399,9 @@ void dma_resv_fini(struct dma_resv *obj);
>>>>   int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int 
>>>> num_fences);
>>>>   void dma_resv_add_shared_fence(struct dma_resv *obj, struct 
>>>> dma_fence *fence);
>>>>   void dma_resv_add_excl_fence(struct dma_resv *obj, struct 
>>>> dma_fence *fence);
>>>> +struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
>>>> +                     struct dma_resv_cursor *cursor,
>>>> +                     bool first, bool all_fences);
>>>>   int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence 
>>>> **pfence_excl,
>>>>               unsigned *pshared_count, struct dma_fence ***pshared);
>>>>   int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv 
>>>> *src);
>>>>
>>

