Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE46490722
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 12:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E9910E150;
	Mon, 17 Jan 2022 11:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B7810E150
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 11:26:40 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id p18so19545073wmg.4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 03:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=+4k5VumxcVJVVNeLV0hEcjh27R/lVPWNViYiPj+iiv4=;
 b=m2qCS0fEPAmlNhR7IohXzrLXojwPxkE7ljUHKg1Azcw+A1qSEFZtSS92EcTyHfZboI
 i07Zvukq0lsUePPXtxcb6KUbo5M+OZjnV+bcxjdIelzWoozeEC8ZCl4oLWJ3jxb8XZM+
 ruPgZOewOsIhBz+mrkNSW/zkPRX9wN5XLtfupLOCZ1IHZuc3fW+qBBe3Be6Y8TkypxE4
 2SnwCmTQFEtKzGpOAtYfoap/0Y02gX52cYOE+rYgmhBHlVrtKnRFX3DpGo8NPKa84pQn
 rQMA90XmNhUlq29MxIRdOoWqokJm6YKmY5y6mwfB4BHmKGrDPsL7PJlBG2PZUWcRrrmU
 w8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=+4k5VumxcVJVVNeLV0hEcjh27R/lVPWNViYiPj+iiv4=;
 b=6+IbI4dm06y4pUeAJaLSNgLeH/4sW8UKyvbOeWp88bawy2r5nLsocr6xSbhajtwFtK
 2JpRAew92rEadCbYxc+8yxHM9guwfzOIRNH6tILrLogDhPrz0KhFna7KNnNThPUnlDmX
 X9Lp7utWTs0hlhMw3lhj2tYQvOEN1SNHJUUGX+JNxHMS6g/AfQoYLqznajwz7FGe8kA2
 NB7j+QFAb34BllDP3BYiVy7tfsZWcZhAhceHp5a53gRXM2kEa06b+L3HUUicxYFINGUj
 zth5gTla5J/LF2QL+qVV0hBA8ZuAD0yZ+QUaBHP2ydKVKyY/Ff3OS+TAi16pSZqmV94R
 ff7A==
X-Gm-Message-State: AOAM532HZoxRE0wYoWpd5/wp17ee/8V3ovJYd++6LpGSr57ZlFbCD3up
 hmmtb/Zs1nmZw5Nej2H6Yb8=
X-Google-Smtp-Source: ABdhPJzD8cm9J6JbfH4eaxYYGvBgTSYRK0FQLQwEnx+jtgP/ONrYrJx220lPXyIY78Y5IuZhIIaXbA==
X-Received: by 2002:a05:6000:1d84:: with SMTP id
 bk4mr18167740wrb.708.1642418799172; 
 Mon, 17 Jan 2022 03:26:39 -0800 (PST)
Received: from [192.168.178.21] (p57b0bff8.dip0.t-ipconnect.de.
 [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id t6sm10872638wmq.16.2022.01.17.03.26.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 03:26:38 -0800 (PST)
Subject: Re: [PATCH 04/24] dma-buf: add dma_resv_get_singleton v2
To: Daniel Vetter <daniel@ffwll.ch>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-5-christian.koenig@amd.com>
 <YcOWyHzY22ZCCvef@phenom.ffwll.local>
 <95929048-b381-78d1-462c-e7b910c784b0@gmail.com>
 <YeGlbLXXuUITZlQP@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0b7b9a9f-65d8-706e-163b-5363df426c8b@gmail.com>
Date: Mon, 17 Jan 2022 12:26:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YeGlbLXXuUITZlQP@phenom.ffwll.local>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.01.22 um 17:31 schrieb Daniel Vetter:
> On Mon, Jan 03, 2022 at 12:13:41PM +0100, Christian König wrote:
>> Am 22.12.21 um 22:21 schrieb Daniel Vetter:
>>> On Tue, Dec 07, 2021 at 01:33:51PM +0100, Christian König wrote:
>>>> Add a function to simplify getting a single fence for all the fences in
>>>> the dma_resv object.
>>>>
>>>> v2: fix ref leak in error handling
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>    drivers/dma-buf/dma-resv.c | 52 ++++++++++++++++++++++++++++++++++++++
>>>>    include/linux/dma-resv.h   |  2 ++
>>>>    2 files changed, 54 insertions(+)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>>>> index 480c305554a1..694716a3d66d 100644
>>>> --- a/drivers/dma-buf/dma-resv.c
>>>> +++ b/drivers/dma-buf/dma-resv.c
>>>> @@ -34,6 +34,7 @@
>>>>     */
>>>>    #include <linux/dma-resv.h>
>>>> +#include <linux/dma-fence-array.h>
>>>>    #include <linux/export.h>
>>>>    #include <linux/mm.h>
>>>>    #include <linux/sched/mm.h>
>>>> @@ -657,6 +658,57 @@ int dma_resv_get_fences(struct dma_resv *obj, bool write,
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(dma_resv_get_fences);
>>>> +/**
>>>> + * dma_resv_get_singleton - Get a single fence for all the fences
>>>> + * @obj: the reservation object
>>>> + * @write: true if we should return all fences
>>>> + * @fence: the resulting fence
>>>> + *
>>>> + * Get a single fence representing all the fences inside the resv object.
>>>> + * Returns either 0 for success or -ENOMEM.
>>>> + *
>>>> + * Warning: This can't be used like this when adding the fence back to the resv
>>>> + * object since that can lead to stack corruption when finalizing the
>>>> + * dma_fence_array.
>>> Uh I don't get this one? I thought the only problem with nested fences is
>>> the signalling recursion, which we work around with the irq_work?
>> Nope, the main problem is finalizing the dma_fence_array.
>>
>> E.g. imagine that you build up a chain of dma_fence_array objects like this:
>> a<-b<-c<-d<-e<-f.....
>>
>> With each one referencing the previous dma_fence_array and then you call
>> dma_fence_put() on the last one. That in turn will cause calling
>> dma_fence_put() on the previous one, which in turn will cause
>> dma_fence_put() one the one before the previous one etc....
>>
>> In other words you recurse because each dma_fence_array instance drops the
>> last reference of it's predecessor.
>>
>> What we could do is to delegate dropping the reference to the containing
>> fences in a dma_fence_array as well, but that would require some changes to
>> the irq_work_run_list() function to be halve way efficient.o
>>
>>> Also if there's really an issue with dma_fence_array fences, then that
>>> warning should be on the dma_resv kerneldoc, not somewhere hidden like
>>> this. And finally I really don't see what can go wrong, sure we'll end up
>>> with the same fence once in the dma_resv_list and then once more in the
>>> fence array. But they're all refcounted, so really shouldn't matter.
>>>
>>> The code itself looks correct, but me not understanding what even goes
>>> wrong here freaks me out a bit.
>> Yeah, IIRC we already discussed that with Jason in length as well.
>>
>> Essentially what you can't do is to put a dma_fence_array into another
>> dma_fence_array without causing issues.
>>
>> So I think we should maybe just add a WARN_ON() into dma_fence_array_init()
>> to make sure that this never happens.
> Yeah I think this would be much clearer instead of sprinkling half the
> story as a scary&confusing warning over all kinds of users which
> internally use dma fence arrays.
>
> And then if it goes boom I guess we could fix it internally in
> dma_fence_array_init by flattening fences down again. But only if actually
> needed.

Ok, going to do that first then.

>
> What confused me is why dma_resv is special, and from your reply it sounds
> like it really isn't.

Well, it isn't special in any way. It's just something very obvious 
which could go wrong.

Regards,
Christian.

> -Daniel
>
>
>> Regards,
>> Christian.
>>
>>> I guess something to figure out next year, I kinda hoped I could squeeze a
>>> review in before I disappear :-/
>>> -Daniel
>>>
>>>> + */
>>>> +int dma_resv_get_singleton(struct dma_resv *obj, bool write,
>>>> +			   struct dma_fence **fence)
>>>> +{
>>>> +	struct dma_fence_array *array;
>>>> +	struct dma_fence **fences;
>>>> +	unsigned count;
>>>> +	int r;
>>>> +
>>>> +	r = dma_resv_get_fences(obj, write, &count, &fences);
>>>> +        if (r)
>>>> +		return r;
>>>> +
>>>> +	if (count == 0) {
>>>> +		*fence = NULL;
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +	if (count == 1) {
>>>> +		*fence = fences[0];
>>>> +		kfree(fences);
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +	array = dma_fence_array_create(count, fences,
>>>> +				       dma_fence_context_alloc(1),
>>>> +				       1, false);
>>>> +	if (!array) {
>>>> +		while (count--)
>>>> +			dma_fence_put(fences[count]);
>>>> +		kfree(fences);
>>>> +		return -ENOMEM;
>>>> +	}
>>>> +
>>>> +	*fence = &array->base;
>>>> +	return 0;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
>>>> +
>>>>    /**
>>>>     * dma_resv_wait_timeout - Wait on reservation's objects
>>>>     * shared and/or exclusive fences.
>>>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>>>> index fa2002939b19..cdfbbda6f600 100644
>>>> --- a/include/linux/dma-resv.h
>>>> +++ b/include/linux/dma-resv.h
>>>> @@ -438,6 +438,8 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
>>>>    void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
>>>>    int dma_resv_get_fences(struct dma_resv *obj, bool write,
>>>>    			unsigned int *num_fences, struct dma_fence ***fences);
>>>> +int dma_resv_get_singleton(struct dma_resv *obj, bool write,
>>>> +			   struct dma_fence **fence);
>>>>    int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
>>>>    long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
>>>>    			   unsigned long timeout);
>>>> -- 
>>>> 2.25.1
>>>>

