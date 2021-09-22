Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C74B2414895
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 14:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED276EB8C;
	Wed, 22 Sep 2021 12:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFB26EB97;
 Wed, 22 Sep 2021 12:15:36 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q11so6082731wrr.9;
 Wed, 22 Sep 2021 05:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=GnxpSz2YTPBv5eN5//0MtqAUk2h+KB4qVZEHzUyCAZw=;
 b=ZNBG4vyTdhDJp3JwVLvKNp3mKoy0RSvoXQXHg5eaQTQY3S6jyzt2hNYcBBRadfBRV4
 cBaAR2PTmi8z1PGYZEzfaOWNtvUzynb1qjrOjUaF1zVusEHfptJBBICNjmwbSMeeqvzZ
 DBYuFe0cAe/rKGxOVpA0LxMs3pBkL2Mb+whDdZC/MDJUaLcg4+ZNJih+7pohsTG9rmXr
 ohQZURtxN8cBMWDOSXJKYEUkB2cRx6rQwcb7ioNoPvz1t8u8OKX7z3XQfl9BZoK+msxw
 Xo0gYRT/hx9gqaW9iwnKkURJv1lGk7Qkbha7z2wY4tmnk6qWEJMnGVrfuoHEQTcZ5PI+
 r3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=GnxpSz2YTPBv5eN5//0MtqAUk2h+KB4qVZEHzUyCAZw=;
 b=QaMt6LC+M+vfxiBkEtK2l6HhxxpyiPn27BIKc6Hfp9yFJKVYf6KIIc9/N76iyCNBu6
 8cPuIuSc+FZ2Eme38sP+YnM6O+RXuq1IpPdajW6E/db8/wOJjuZZTSxBOWH+MXHXNoqq
 SXV+QzynQVflBMxUPxDmuaLDzEjcUitoogyP0X9iwp4x2yz/Sh88O5KiRaOYLtIzSQMw
 VNKy4H5PwneecZztgdTBAHBv6DDtoh7Ey5OavEjYw3K5KVZY5DrdUlbE84hrCm01QLBo
 4TCrN03euF5JWIl7WKdg15YF0Oo3SAJeGsCMVeQaaPATKhmTIzRfoAxaaQndxX1Nj2Q1
 0hJg==
X-Gm-Message-State: AOAM531ygSAsIVYbtzWS8yfKarU2vENL8JQxHlkpNI7ieta/CLUupLB8
 +MdBlh1O5vVLwCZLLgpLcrA=
X-Google-Smtp-Source: ABdhPJxArNaumdFR5k7zQh5umtGKKovsq13VN0RWOn1Titd3CtqtdYE/3R+onTeTvl+mta5khRMTuQ==
X-Received: by 2002:a1c:9888:: with SMTP id
 a130mr10155375wme.102.1632312935065; 
 Wed, 22 Sep 2021 05:15:35 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id o13sm2357309wri.53.2021.09.22.05.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 05:15:34 -0700 (PDT)
Subject: Re: [PATCH 13/26] drm/i915: use the new iterator in
 i915_gem_busy_ioctl
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20210922091044.2612-1-christian.koenig@amd.com>
 <20210922091044.2612-14-christian.koenig@amd.com>
 <6b22cb75-6c41-db55-83f2-3eae87b585aa@linux.intel.com>
 <4c357136-3279-ff57-1c4f-62276534c887@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <acc297ce-287e-295c-8b54-223610fb2093@gmail.com>
Date: Wed, 22 Sep 2021 14:15:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4c357136-3279-ff57-1c4f-62276534c887@linux.intel.com>
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

Am 22.09.21 um 13:46 schrieb Tvrtko Ursulin:
>
> On 22/09/2021 11:21, Tvrtko Ursulin wrote:
>>
>> On 22/09/2021 10:10, Christian König wrote:
>>> This makes the function much simpler since the complex
>>> retry logic is now handled else where.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 35 
>>> ++++++++++--------------
>>>   1 file changed, 14 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>> index 6234e17259c1..313afb4a11c7 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>> @@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void 
>>> *data,
>>>   {
>>>       struct drm_i915_gem_busy *args = data;
>>>       struct drm_i915_gem_object *obj;
>>> -    struct dma_resv_list *list;
>>> -    unsigned int seq;
>>> +    struct dma_resv_iter cursor;
>>> +    struct dma_fence *fence;
>>>       int err;
>>>       err = -ENOENT;
>>> @@ -109,27 +109,20 @@ i915_gem_busy_ioctl(struct drm_device *dev, 
>>> void *data,
>>>        * to report the overall busyness. This is what the wait-ioctl 
>>> does.
>>>        *
>>>        */
>>> -retry:
>>> -    seq = raw_read_seqcount(&obj->base.resv->seq);
>>> -
>>> -    /* Translate the exclusive fence to the READ *and* WRITE engine */
>>> -    args->busy = 
>>> busy_check_writer(dma_resv_excl_fence(obj->base.resv));
>>> -
>>> -    /* Translate shared fences to READ set of engines */
>>> -    list = dma_resv_shared_list(obj->base.resv);
>>> -    if (list) {
>>> -        unsigned int shared_count = list->shared_count, i;
>>> -
>>> -        for (i = 0; i < shared_count; ++i) {
>>> -            struct dma_fence *fence =
>>> -                rcu_dereference(list->shared[i]);
>>> -
>>> +    args->busy = false;
>>
>> You can drop this line, especially since it is not a boolean. With that:
>>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Having said this, one thing to add in the commit message is some 
> commentary that although simpler in code, the new implementation has a 
> lot more atomic instructions due all the extra fence get/put.
>
> Saying this because I remembered busy ioctl is quite an over-popular 
> one. Thinking about traces from some real userspaces I looked at in 
> the past.
>
> So I think ack from maintainers will be required here. Because I just 
> don't know if any performance impact will be visible or not. So view 
> my r-b as "code looks fine" but I am on the fence if it should 
> actually be merged. Probably leaning towards no actually - given how 
> the code is localised here and I dislike burdening old platforms with 
> more CPU time it could be cheaply left as is.

Well previously we would have allocated memory, which as far as I know 
has more overhead than a few extra atomic operations.

On the other hand I could as well stick with dma_resv_get_fences() here.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>
>>
>> Regards,
>>
>> Tvrtko
>>
>>> +    dma_resv_iter_begin(&cursor, obj->base.resv, true);
>>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>> +        if (dma_resv_iter_is_restarted(&cursor))
>>> +            args->busy = 0;
>>> +
>>> +        if (dma_resv_iter_is_exclusive(&cursor))
>>> +            /* Translate the exclusive fence to the READ *and* 
>>> WRITE engine */
>>> +            args->busy |= busy_check_writer(fence);
>>> +        else
>>> +            /* Translate shared fences to READ set of engines */
>>>               args->busy |= busy_check_reader(fence);
>>> -        }
>>>       }
>>> -
>>> -    if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
>>> -        goto retry;
>>> +    dma_resv_iter_end(&cursor);
>>>       err = 0;
>>>   out:
>>>

