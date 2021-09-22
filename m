Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD011414BFC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 16:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740DC6EC0A;
	Wed, 22 Sep 2021 14:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49216EC07;
 Wed, 22 Sep 2021 14:31:14 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u18so7466934wrg.5;
 Wed, 22 Sep 2021 07:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=6+ziFqfFy8tUj5gzWw86pYLxOc595Xo/AjkfAmBa908=;
 b=K67bSyxTp3ZCWesKPb97kyJAm3vnTIN17UBOtqFBWEV5azCeYOHHHhVlux5V0oR2j6
 HbAAnVqAcX6k0GQXAe5oPRd8d5+YvMlK0QtRdtTWHmWMvGJj0oZOS6kpO881yrpPs12X
 Q0zPhcxDkxPlw5lB00MtlRIzjlZBiJOkVpRNuIF2AHXtAODNvmqKq1Frvy4eZ/aczBKh
 lEH1ETXwtO0jQg8eSmSXI7OBtNMR/NCe7T3e48Jqf8ztmSWvqZVAN1rVR4BYkNQ1bHwg
 aoPaFCPYECdPKrFGfEd4rH7FNOA33hx051yI8kMWhTT54PKAOr9XADHjgletpWicG3I8
 IQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=6+ziFqfFy8tUj5gzWw86pYLxOc595Xo/AjkfAmBa908=;
 b=7rM2IrvTerjVI0xGqyNVfv2fjmORZyyD3c4hYmKvdDk0C5+3SdQL21Dymqu+Y+5Nux
 JRWCzKq7r969h0MtAx3psmixYE07Uc3zKj6hUkvpGm40WBg6UKbwUUA1u8P+IklGHbO2
 ue1i7dBeKbRQJCluc3ukIyA4G7lBNzdjOj8mBYWl6C2H/Zn7akBsrWZJRx8n6l7tp/ww
 u/Yh9WKKs6wEsGNO9MU/zP9qtbXxHfDeIUc14vg3B3JAx/F3hoDdEMtX7ObfgTjzmP20
 aIWNUkHfTJboi49iTaUHycYCfXhaRmP5gl0t/Mketz8IuH3DnmctEZSGToXXm72os0SG
 fHLQ==
X-Gm-Message-State: AOAM5316jbI2S5rackqrCqPaWBoU/5eAdwsT0zdiINTph2KsF1PoO+KW
 h2r11th3QcBoWMm4od63SUE=
X-Google-Smtp-Source: ABdhPJx+1fhNG4+4ei6QAwpCbb/RRpqC5TGiPZYBRWYQUFK2+/82eGkOvanY1qn8p5mJxdbPjVmGEg==
X-Received: by 2002:adf:d21c:: with SMTP id j28mr1660105wrh.43.1632321073308; 
 Wed, 22 Sep 2021 07:31:13 -0700 (PDT)
Received: from [192.168.158.115] (ip-178-202-40-91.hsi09.unitymediagroup.de.
 [178.202.40.91])
 by smtp.gmail.com with ESMTPSA id j21sm2348710wrd.48.2021.09.22.07.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 07:31:11 -0700 (PDT)
Subject: Re: [PATCH 13/26] drm/i915: use the new iterator in
 i915_gem_busy_ioctl
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20210922091044.2612-1-christian.koenig@amd.com>
 <20210922091044.2612-14-christian.koenig@amd.com>
 <6b22cb75-6c41-db55-83f2-3eae87b585aa@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2afbdc22-28a7-9a47-186c-f47b4f5aceab@gmail.com>
Date: Wed, 22 Sep 2021 16:31:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6b22cb75-6c41-db55-83f2-3eae87b585aa@linux.intel.com>
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

Am 22.09.21 um 12:21 schrieb Tvrtko Ursulin:
>
> On 22/09/2021 10:10, Christian König wrote:
>> This makes the function much simpler since the complex
>> retry logic is now handled else where.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 35 ++++++++++--------------
>>   1 file changed, 14 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>> index 6234e17259c1..313afb4a11c7 100644
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
>> @@ -109,27 +109,20 @@ i915_gem_busy_ioctl(struct drm_device *dev, 
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
>
> You can drop this line, especially since it is not a boolean. With that:

I just realized that this won't work. We still need to initialize the 
return value when there is no fence at all in the resv object.

>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Does that still counts if I set args->busy to zero?

Thanks,
Christian.

>
> Regards,
>
> Tvrtko
>
>> +    dma_resv_iter_begin(&cursor, obj->base.resv, true);
>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>> +        if (dma_resv_iter_is_restarted(&cursor))
>> +            args->busy = 0;
>> +
>> +        if (dma_resv_iter_is_exclusive(&cursor))
>> +            /* Translate the exclusive fence to the READ *and* WRITE 
>> engine */
>> +            args->busy |= busy_check_writer(fence);
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

