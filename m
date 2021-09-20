Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3254112BC
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 12:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DABA6E47B;
	Mon, 20 Sep 2021 10:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374256E47A;
 Mon, 20 Sep 2021 10:13:45 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u18so26277945wrg.5;
 Mon, 20 Sep 2021 03:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Ijf8BnGoBReJLtthF3oociyimY+iDY1OqlO2QvejboY=;
 b=Sdr32UjiaBTNtRHHGYIY+toV7a1CRVt3k2GCdQ5p+wRqBziXgsCEf14miJvrVfmfa4
 8dN9n7FZV18YNiUqdGAOo1cFYVs0x5IZ52yFAoblW7M0S7CWNyHYACE+wz91ll50CP3L
 P14akjFNafFfAllxmDjcO4sh14Piz0TzWs0nQOKdublydqwC53nPA9cy0MSDG5TKKWoG
 TQaS1WkjFrMW27PgRFtN2pVQbIm701MgfyREbZvbliFlOA3R3zk9c1mhGl3HyU3zmo9X
 QaH+9iZ4iW1n71dk8QNSxGL5qSCO7lYaSyIJ6L56pKNqpd9m0hvab7Gq3Uq5xGZMTqSy
 5sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Ijf8BnGoBReJLtthF3oociyimY+iDY1OqlO2QvejboY=;
 b=NXH0Gm0wurmWMP84F0QngY6tnO0stnihI60dIAzUx3ilJYJSoUg/T7w/17Cb3xfF+5
 7E7rnhWBw5HyoGwgiavBbaBRVSeAxGoINreV2EwzS9zbQwQGjUjlolTlX3/8Vqvd/48W
 pIiC1oCc5773ZSjHXrGWMYYup2oiaKyy+C6DC0JVfjM9PUKqUw0sc4v2mGA51oE3bSOQ
 Fc2ygZlNUSofX3R7FCbHPeu1/pGezG+JpfZCEuhSr8ia2gvqU5WbqCKrltJWnVq1XoXU
 BgloFLaWiGUmZoX9ScDbNF2nTwT9Xh/90nMDOywz1bkumAAtFyZuT/B/q3bv61bfy4nm
 3q+Q==
X-Gm-Message-State: AOAM5327W6ffk328MqEtz4caU1sFAx006UAr9mU9eEdbqlNdId79LrnT
 D1sU5BRqb3BDPxp7RPEXVXk=
X-Google-Smtp-Source: ABdhPJxDEIj93yjMQea+LHs4FRqtqwAVoag8hA/rDb0lD5JZEwAo34hl2lIOUjmZXosR7OvYy3iMWA==
X-Received: by 2002:a1c:1b10:: with SMTP id b16mr23308889wmb.194.1632132823778; 
 Mon, 20 Sep 2021 03:13:43 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id c8sm8208615wru.30.2021.09.20.03.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 03:13:43 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH 13/26] drm/i915: use the new iterator in
 i915_gem_busy_ioctl
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-14-christian.koenig@amd.com>
 <6fbaca09-ec51-c44e-708c-334ef8be8595@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <368e8495-f4de-cbb2-3584-e022a5937885@gmail.com>
Date: Mon, 20 Sep 2021 12:13:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6fbaca09-ec51-c44e-708c-334ef8be8595@linux.intel.com>
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

Am 20.09.21 um 10:45 schrieb Tvrtko Ursulin:
>
> On 17/09/2021 13:35, Christian König wrote:
>> This makes the function much simpler since the complex
>> retry logic is now handled else where.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 32 ++++++++----------------
>>   1 file changed, 11 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>> index 6234e17259c1..b1cb7ba688da 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>> @@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void 
>> *data,
>>   {
>>       struct drm_i915_gem_busy *args = data;
>>       struct drm_i915_gem_object *obj;
>> -    struct dma_resv_list *list;
>> -    unsigned int seq;
>> +    struct dma_resv_iter cursor;
>> +    struct dma_fence *fence;
>>       int err;
>>         err = -ENOENT;
>> @@ -109,27 +109,17 @@ i915_gem_busy_ioctl(struct drm_device *dev, 
>> void *data,
>>        * to report the overall busyness. This is what the wait-ioctl 
>> does.
>>        *
>>        */
>> -retry:
>> -    seq = raw_read_seqcount(&obj->base.resv->seq);
>> -
>> -    /* Translate the exclusive fence to the READ *and* WRITE engine */
>> -    args->busy = 
>> busy_check_writer(dma_resv_excl_fence(obj->base.resv));
>> -
>> -    /* Translate shared fences to READ set of engines */
>> -    list = dma_resv_shared_list(obj->base.resv);
>> -    if (list) {
>> -        unsigned int shared_count = list->shared_count, i;
>> -
>> -        for (i = 0; i < shared_count; ++i) {
>> -            struct dma_fence *fence =
>> -                rcu_dereference(list->shared[i]);
>> -
>> +    args->busy = false;
>> +    dma_resv_iter_begin(&cursor, obj->base.resv, true);
>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>
> You did not agree with my suggestion to reset args->busy on restart 
> and so preserve current behaviour?

No, I want to keep the restart behavior internally to the dma_resv 
object and as far as I can see it should not make a difference here.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>> +        if (dma_resv_iter_is_exclusive(&cursor))
>> +            /* Translate the exclusive fence to the READ *and* WRITE 
>> engine */
>> +            args->busy = busy_check_writer(fence);
>> +        else
>> +            /* Translate shared fences to READ set of engines */
>>               args->busy |= busy_check_reader(fence);
>> -        }
>>       }
>> -
>> -    if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
>> -        goto retry;
>> +    dma_resv_iter_end(&cursor);
>>         err = 0;
>>   out:
>>

