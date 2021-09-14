Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4BF40ADBF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 14:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AA689F97;
	Tue, 14 Sep 2021 12:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB6689F97;
 Tue, 14 Sep 2021 12:32:26 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t18so19974484wrb.0;
 Tue, 14 Sep 2021 05:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=sXfmj2M53N/TbaZbI+SjUFAeDqc/IDs8+uMoYaNJZU4=;
 b=HsubuF+h35O423vb5Yp0swD0qMN+3hCwxw3dc/16JLxG0DIyTNvxC4YxwfyZvtWQVX
 rSx1Lw2MYv8ZOu5BVcvz2VwYhchipWP/QTN6bpLRmKFw+e7jfCCsLV32rPFrvDc5ngGF
 e8fyjI01dTfr4qq98OQWgNYWEthIUTTPA5AFBYnnf1qGsU5vDcar7CpDcIj1NfCBWOd+
 dwNBwRhtxKQntju13I7fK1VfRcirolcc5bzYX9EyUXmZekQFNo2vVsCdOBA3nxhG2wYN
 GgE1A8LGVf1z+DvrE7FERo3vz/aqwQVUP/gCLfHwTpbeEWtPiFZRkgNAILPm7GfVvA5e
 uaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=sXfmj2M53N/TbaZbI+SjUFAeDqc/IDs8+uMoYaNJZU4=;
 b=YAOIVYrAIGboEbMOxK9rJ4Po8zzzs1kZLUe0v3qfMfj3qGb2Nn8smEkhacITtYrFRP
 8Kw/RJHqVD9qMDTQ6Ra53UUY7HOmnELABaG88w/fLbg0xlhAXP49BjrnT3oFlt68aEXl
 I3tYPNxOHjqQVKxIDXV1Zskt01DDOCAoxG2gdVMxMF4qg8rzJffmqrpdFBB7GbvjEXmx
 Zlg/IAkb47pxHlYwKo4nGeWCVZCrBvcmLFmpUv6nJQ5OAZPgcCkXGcCB7fYIbPiJ6k5n
 cUFvQHwOctRfCjYq7NG4X4MNzh12Y2aLNrwmJoXPtBQDAoTr3AyGlI3OoRzhNniA/ZG4
 POMw==
X-Gm-Message-State: AOAM531cld454VE7z7p6+fAbklUFfzSNdKexvMXjFUWeRlAbZV3Yz28V
 /MKcTwmuKImlQ2OwB8v6G4aQ1Na4aoALlvcl
X-Google-Smtp-Source: ABdhPJw33KA2/3TyF4xFL116xXN7VUkrI/GJWvVPoOdm3sQFvhn6EKH6DIF1b9oPfcp5I4CKY2EVTA==
X-Received: by 2002:adf:e349:: with SMTP id n9mr19135425wrj.326.1631622745310; 
 Tue, 14 Sep 2021 05:32:25 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id y9sm1153302wmj.36.2021.09.14.05.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 05:32:24 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH 18/26] drm/i915: use new iterator in
 i915_gem_object_last_write_engine
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
References: <20210913131707.45639-1-christian.koenig@amd.com>
 <20210913131707.45639-19-christian.koenig@amd.com>
 <46a40614-b448-7f2d-7b6b-0705c4277e2b@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6c0217a7-6ac8-0c12-4087-ee55f456f99c@gmail.com>
Date: Tue, 14 Sep 2021 14:32:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <46a40614-b448-7f2d-7b6b-0705c4277e2b@linux.intel.com>
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

Am 14.09.21 um 14:27 schrieb Tvrtko Ursulin:
>
> On 13/09/2021 14:16, Christian König wrote:
>> This is maybe even a fix since the RCU usage here looks incorrect.
>
> What you think is incorrect? Pointless extra rcu locking?

Yeah, exactly that. I also wondered for a second if rcu_read_lock() can 
nest or not. But obviously it either works or lockdep hasn't complained yet.

But I've made a mistake here and at a couple of other places to remove 
to many rcu_read_lock() calls. Thanks for pointing that out, going to 
fix it as well.

> Also, FWIW, I submitted a patch to remove this function altogether 
> since its IMO pretty useless, just failed in getting anyone to ack it 
> so far.

I was on the edge of suggesting that as well since it's only debugfs 
usage looked quite pointless to me.

Feel free to CC me on the patch and you can have my acked-by.

Thanks,
Christian.

>
> Regards,
>
> Tvrtko
>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_object.h | 15 +++++++--------
>>   1 file changed, 7 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h 
>> b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> index e9eecebf5c9d..3343922af4d6 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> @@ -500,16 +500,15 @@ static inline struct intel_engine_cs *
>>   i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
>>   {
>>       struct intel_engine_cs *engine = NULL;
>> +    struct dma_resv_cursor cursor;
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
>> +    dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, false,
>> +                     fence) {
>> +        if (fence && dma_fence_is_i915(fence) &&
>> +            !dma_fence_is_signaled(fence))
>> +            engine = to_request(fence)->engine;
>> +    }
>>       return engine;
>>   }
>>

