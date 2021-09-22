Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7820B41472C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 13:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960AA6EB74;
	Wed, 22 Sep 2021 11:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932CD6EB74;
 Wed, 22 Sep 2021 11:00:06 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i23so5592143wrb.2;
 Wed, 22 Sep 2021 04:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=4g6a23eFtTo29hJc/EesJyqk+i6yL2oemrveRwRZhhw=;
 b=CUCFaz2n+xatYDb02XfF6UjyiZqwQGqRfeziLVtAMA8dJMWM3+gCmFAY8dtk4MXEYl
 L9fXdYfnzcPsWCoM4480VYxMCBTkbb2TL6InOA9couilEWK8U00Fa0CaAGgIvHtWhvYw
 AzTvBVAbx+zxZkC0Dx5cHihobTP/9mT7MKkIJGBrir8rGDhMlbxGTWFGtt2lZ2HdfFHr
 Nr6DgbGTI/lR3FQiBHm3oGsI//aL7txWfgqUntNHQF5QJVj2GHW3woJmHRkVXyK3dLRr
 ILG746H6v0fZso7Oy2LOsTL3BjXIImxarRD7A96nN95gNOj3BtwUNPV4jjgwVRrccokY
 yl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4g6a23eFtTo29hJc/EesJyqk+i6yL2oemrveRwRZhhw=;
 b=T2bLY8yMqRPKSDwzAzBduKEgAQj+T1yZzQJBQkXZysZG9BE4NUKxLpNyEuU4wE8ZCs
 h5glDEkvXUYNmdFvtqMj/1+TRUGBq85LlRyf/WAJIoAgi/V56hbpf0te5HoBiNozOdBB
 hsTd9WXjOfTJWFElzx4hO6JyafQgrNEP7TIa1dd4nEqmvh8OUWWwwxtBbjvf6E1S8+RC
 2/9RlabXbd1DjIeacnreOWMOPEhsDrgEhggpQR4o6q5aAp4sh0oXXM/PKa/PFw8ybv96
 a88/fMmnlF97KDP4FQsXwvsLbQg8AlYF7PJQgbb1bl1jBOXcgT7lnK+6IqDsWhh43mHz
 XE1w==
X-Gm-Message-State: AOAM533a7yPblbcaEiY1KcDm4x66R0IweXRizRDZcwMU7X/K1G8kJ40J
 alPn0vzV1cORo/CaBD9lI64=
X-Google-Smtp-Source: ABdhPJyjYgC29P1McsGvDeZkXiBtlQKw3QpMUh6IhB2Lj81ZLzBgMgqPqot6ZYAhRv6PheyNjeW5NA==
X-Received: by 2002:a5d:65ce:: with SMTP id e14mr41647853wrw.328.1632308405163; 
 Wed, 22 Sep 2021 04:00:05 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id w5sm1801014wra.87.2021.09.22.04.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 04:00:04 -0700 (PDT)
Subject: Re: [PATCH 18/26] drm/i915: use new iterator in
 i915_gem_object_last_write_engine
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20210922091044.2612-1-christian.koenig@amd.com>
 <20210922091044.2612-19-christian.koenig@amd.com>
 <92e428d5-76d5-e63f-5322-aa5cf1a1952a@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <db679020-b35b-8664-a6b8-3d88ed2ca8c6@gmail.com>
Date: Wed, 22 Sep 2021 13:00:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <92e428d5-76d5-e63f-5322-aa5cf1a1952a@linux.intel.com>
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

Am 22.09.21 um 12:27 schrieb Tvrtko Ursulin:
>
> On 22/09/2021 10:10, Christian König wrote:
>> This is maybe even a fix since the RCU usage here looks incorrect.
>
> I'm afraid I gazumped you here by removing this function shortly 
> before you posted the respin.

Is that already landed in drm-misc-next? If not just give me an Acked-by 
and it will be fixed when merging trees together again by just dropping 
the change.

Alternatively if it is not in drm-next I will ping the drm-misc-next 
maintainer for a merge.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_object.h | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h 
>> b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> index 48112b9d76df..e20efffce3a9 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> @@ -507,16 +507,16 @@ static inline struct intel_engine_cs *
>>   i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
>>   {
>>       struct intel_engine_cs *engine = NULL;
>> +    struct dma_resv_iter cursor;
>>       struct dma_fence *fence;
>>   -    rcu_read_lock();
>> -    fence = dma_resv_get_excl_unlocked(obj->base.resv);
>> -    rcu_read_unlock();
>> -
>> -    if (fence && dma_fence_is_i915(fence) && 
>> !dma_fence_is_signaled(fence))
>> -        engine = to_request(fence)->engine;
>> -    dma_fence_put(fence);
>> -
>> +    dma_resv_iter_begin(&cursor, obj->base.resv, false);
>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>> +        if (fence && dma_fence_is_i915(fence) &&
>> +            !dma_fence_is_signaled(fence))
>> +            engine = to_request(fence)->engine;
>> +    }
>> +    dma_resv_iter_end(&cursor);
>>       return engine;
>>   }
>>

