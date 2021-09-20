Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 576EF4112BF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 12:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAF06E47A;
	Mon, 20 Sep 2021 10:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3106E47A;
 Mon, 20 Sep 2021 10:14:44 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d21so27984907wra.12;
 Mon, 20 Sep 2021 03:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=+apC5JxraIi9XnUbenkB6zsj+jT1AkPdAZhfDaY0/v0=;
 b=UU5S0gXMkaLgT22FL8u7q7ClemU+rsXCqmg08b57Lq39L1VejhAjRb6zljx7QdAZZh
 zxAg64pHaQO4y6OTgp5uARWIQq3mnLiU9mRR9B15QNXMtU3XIt/6olcCOdat5K4g7i1m
 Q8s4GpiM3WdaNYflS+o/a6P7rMoQeggLekVKLUWZs9KXIix1+rsGLjNkJWsyMt0dGM3j
 AbriRT7fFda6QkaQcMoB5MxrnT1BRfzGzxk8Xfmyf6D9TlYH9eMrlILzkrBilvVkyuVC
 7JrdPFg6KhAiFwkc2QnqPwjPuFGMI2IJWHOjyeDKJGwn598ieFoz0PWkp8hNl+AQfh+5
 IpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=+apC5JxraIi9XnUbenkB6zsj+jT1AkPdAZhfDaY0/v0=;
 b=LGzHyPVT8DhiXnHXowv5Xytc/EHgywkFJeTTHrA18V2QboI3VOzj1tEjmlhuE/LxiN
 0nyS+2BnbZFoaJIIkayjaXO2O6zS0K1sDEhDuBKDAX99hRZx7zuPNQ81J6ZcbqCZ5U1Z
 0uo3rJF4yWxXUhRqhGi837fOad4sm3guBz+PCwsy/Od7XiU3IiI7UsxJU0cezgpaCcLe
 ZOF8slwIyhqp0i+kaB1O1x8ioU0gfKOwiioUa07967NyeygAIpJ3fbL39kedxjeEpfAV
 Yw/NtcjKben/zngQfOYf2SBiwj+Y4ToWOZrfcCjIsXUU9eNIPlP0dIpjqXIOHKxVDuuk
 A8Uw==
X-Gm-Message-State: AOAM530N57SqS7LFUmIQ7dDCu/m3Q2AnZ42qB5RUn16mpjXX1DAt4Ywc
 H9PT5GoOnh9oh1rkd7OuKNE=
X-Google-Smtp-Source: ABdhPJzOGMrZWZx0h8K8o0iVBQ2Hv8r57sd/+E+hm7Ot4KkLG7Ct2SBV+DbPgKDuKkPBBUjH/z4+qg==
X-Received: by 2002:a1c:22c3:: with SMTP id
 i186mr23905344wmi.145.1632132883040; 
 Mon, 20 Sep 2021 03:14:43 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id l124sm19159561wml.8.2021.09.20.03.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 03:14:42 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH 14/26] drm/i915: use the new iterator in
 i915_sw_fence_await_reservation v3
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-15-christian.koenig@amd.com>
 <93b93f00-7ad3-9ea3-e947-77297b4552c9@linux.intel.com>
 <60595ff8-7935-c0a4-7c0f-2a4c3a1d62b9@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3a029992-a648-7684-235e-b5bc53391d5d@gmail.com>
Date: Mon, 20 Sep 2021 12:14:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <60595ff8-7935-c0a4-7c0f-2a4c3a1d62b9@linux.intel.com>
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

Am 20.09.21 um 10:47 schrieb Tvrtko Ursulin:
>
> On 20/09/2021 09:45, Tvrtko Ursulin wrote:
>>
>> On 17/09/2021 13:35, Christian König wrote:
>>> Simplifying the code a bit.
>>>
>>> v2: use dma_resv_for_each_fence instead, according to Tvrtko the 
>>> lock is
>>>      held here anyway.
>>> v3: back to using dma_resv_for_each_fence_unlocked.
>>
>> It did not work out - what happened?
> Wait, my suggestion to try the locked iterator was against 
> i915_request_await_object. I haven't looked at this one at the time or 
> even now.

Exactly! I've mixed the two up and this one here is really called 
without holding a lock.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>
>> Regards,
>>
>> Tvrtko
>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/i915/i915_sw_fence.c | 57 
>>> ++++++++--------------------
>>>   1 file changed, 15 insertions(+), 42 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c 
>>> b/drivers/gpu/drm/i915/i915_sw_fence.c
>>> index c589a681da77..7635b0478ea5 100644
>>> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
>>> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
>>> @@ -572,56 +572,29 @@ int i915_sw_fence_await_reservation(struct 
>>> i915_sw_fence *fence,
>>>                       unsigned long timeout,
>>>                       gfp_t gfp)
>>>   {
>>> -    struct dma_fence *excl;
>>> +    struct dma_resv_iter cursor;
>>> +    struct dma_fence *f;
>>>       int ret = 0, pending;
>>>       debug_fence_assert(fence);
>>>       might_sleep_if(gfpflags_allow_blocking(gfp));
>>> -    if (write) {
>>> -        struct dma_fence **shared;
>>> -        unsigned int count, i;
>>> -
>>> -        ret = dma_resv_get_fences(resv, &excl, &count, &shared);
>>> -        if (ret)
>>> -            return ret;
>>> -
>>> -        for (i = 0; i < count; i++) {
>>> -            if (shared[i]->ops == exclude)
>>> -                continue;
>>> -
>>> -            pending = i915_sw_fence_await_dma_fence(fence,
>>> -                                shared[i],
>>> -                                timeout,
>>> -                                gfp);
>>> -            if (pending < 0) {
>>> -                ret = pending;
>>> -                break;
>>> -            }
>>> -
>>> -            ret |= pending;
>>> -        }
>>> -
>>> -        for (i = 0; i < count; i++)
>>> -            dma_fence_put(shared[i]);
>>> -        kfree(shared);
>>> -    } else {
>>> -        excl = dma_resv_get_excl_unlocked(resv);
>>> -    }
>>> -
>>> -    if (ret >= 0 && excl && excl->ops != exclude) {
>>> -        pending = i915_sw_fence_await_dma_fence(fence,
>>> -                            excl,
>>> -                            timeout,
>>> +    rcu_read_lock();
>>> +    dma_resv_iter_begin(&cursor, resv, write);
>>> +    dma_resv_for_each_fence_unlocked(&cursor, f) {
>>> +        rcu_read_unlock();
>>> +        pending = i915_sw_fence_await_dma_fence(fence, f, timeout,
>>>                               gfp);
>>> -        if (pending < 0)
>>> +        rcu_read_lock();
>>> +        if (pending < 0) {
>>>               ret = pending;
>>> -        else
>>> -            ret |= pending;
>>> -    }
>>> -
>>> -    dma_fence_put(excl);
>>> +            break;
>>> +        }
>>> +        ret |= pending;
>>> +    }
>>> +    dma_resv_iter_end(&cursor);
>>> +    rcu_read_unlock();
>>>       return ret;
>>>   }
>>>

