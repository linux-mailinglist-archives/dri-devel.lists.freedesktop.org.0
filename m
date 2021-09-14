Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E8540ABDB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 12:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE056E463;
	Tue, 14 Sep 2021 10:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA516E463;
 Tue, 14 Sep 2021 10:39:49 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id t8so14364064wrq.4;
 Tue, 14 Sep 2021 03:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=gaNlTnM22ZgHEti35wvdLQPE6D1YFYS28Y/vm+DUkXQ=;
 b=QqCodjx6Wt7rxplRHp69uRmXcsDdQIGAGXcqU7jaZmKSst71F7O6SY/HtIw2IqE0eL
 g+0Rcnv2rUXqR6bHLdcqSBncLyp5GUhGDRpDeCfr+zzAukioMLm19ML6stXZdOeMF80h
 4AphPhTzQGEi0CFjsXV7fR9xgufdoErodhL4ZuTQqT/lfY19Eel+bLv1+mw8m8IPQq2B
 XAsWcQ0sa3tT3faKlSsfVtXuX/62FouHm6nZPGiyjv0bUU1nRH/2uJHpZXRUXyOCXIMd
 07AgaZSgPv3FSdz+kA2iRlQ1/5VZ0rbm4dibUdqOTkW7zj5FeIP3Wm5NoD7TEif+93Rp
 cDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=gaNlTnM22ZgHEti35wvdLQPE6D1YFYS28Y/vm+DUkXQ=;
 b=I7iImyb+ZIMCoqD75BgDr1yFAFKXHJkpEyFrS7XIlqsmcW5iFxSAIgm9lzgbb61zTS
 aJqm8r5V9UpI1E+94Y+J8GnwhxDsRECqSYH5nkUKO7cUKS3x5uh+3yFNTtZGx7phlYgj
 Amz5DJfoelGkld+7pyaktoYoeNdR9D8E/1dKQ7CEPU72EkjL/qzZQ5QLfyY5Yk1dhU+B
 crbMNHwVTH04NOS0YOLpC5acIV2fnj1RUYBHQhDE8q5PM3No/+D5h7rUafwV9FrPoIFF
 V08iQrckhi3bgTJziUVOfa25tvXqbIHMhzaVXbMSk23a1e8bbugDpuP4v6PKrV7mg40T
 Wp0w==
X-Gm-Message-State: AOAM532hBnwALE0bNd6cixQzdwfNKc9MsZpeS3URomi6alCdg6HrgRh0
 t2aZBnQwk08Q0seuNonAHPUnOq1XOsYoBSbx
X-Google-Smtp-Source: ABdhPJzE0BLcszS++MT/qDVFC7rZ2jvXTXxN6JrKYzMXzPaWIgUtfMSNN5JQc9KRPYzbpk2FJTUZrg==
X-Received: by 2002:adf:f011:: with SMTP id j17mr10547094wro.320.1631615987999; 
 Tue, 14 Sep 2021 03:39:47 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id 129sm750642wmz.26.2021.09.14.03.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 03:39:47 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH 15/26] drm/i915: use the new iterator in
 i915_request_await_object
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
References: <20210913131707.45639-1-christian.koenig@amd.com>
 <20210913131707.45639-16-christian.koenig@amd.com>
 <f9ebc539-3965-b57f-7040-78aaba72afbd@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <698f042e-4fc5-2944-8d77-b89352034fcf@gmail.com>
Date: Tue, 14 Sep 2021 12:39:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f9ebc539-3965-b57f-7040-78aaba72afbd@linux.intel.com>
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

Am 14.09.21 um 12:26 schrieb Tvrtko Ursulin:
>
> On 13/09/2021 14:16, Christian König wrote:
>> Simplifying the code a bit.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/i915/i915_request.c | 36 ++++++-----------------------
>>   1 file changed, 7 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_request.c 
>> b/drivers/gpu/drm/i915/i915_request.c
>> index 37aef1308573..b81045ceb619 100644
>> --- a/drivers/gpu/drm/i915/i915_request.c
>> +++ b/drivers/gpu/drm/i915/i915_request.c
>> @@ -1583,38 +1583,16 @@ i915_request_await_object(struct i915_request 
>> *to,
>>                 struct drm_i915_gem_object *obj,
>>                 bool write)
>>   {
>> -    struct dma_fence *excl;
>> +    struct dma_resv_cursor cursor;
>> +    struct dma_fence *fence;
>>       int ret = 0;
>>   -    if (write) {
>> -        struct dma_fence **shared;
>> -        unsigned int count, i;
>> -
>> -        ret = dma_resv_get_fences(obj->base.resv, &excl, &count,
>> -                      &shared);
>> -        if (ret)
>> -            return ret;
>> -
>> -        for (i = 0; i < count; i++) {
>> -            ret = i915_request_await_dma_fence(to, shared[i]);
>> -            if (ret)
>> -                break;
>> -
>> -            dma_fence_put(shared[i]);
>> +    dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, write, 
>> fence) {
>
> I think callers have the object locked for this one. At least if you 
> haven't tried it it's worth asking CI (you have the assert already so 
> it will tell you). But I think it's important to have an atomic 
> snapshot here.

Thanks for the info. In this case I'm just going to use the locked 
variant of the iterator here for the next round.

Could you point me to the place where the lock is grabed/released for 
reference?

Thanks,
Christian.

>
> Regards,
>
> Tvrtko
>
>> +        ret = i915_request_await_dma_fence(to, fence);
>> +        if (ret) {
>> +            dma_fence_put(fence);
>> +            break;
>>           }
>> -
>> -        for (; i < count; i++)
>> -            dma_fence_put(shared[i]);
>> -        kfree(shared);
>> -    } else {
>> -        excl = dma_resv_get_excl_unlocked(obj->base.resv);
>> -    }
>> -
>> -    if (excl) {
>> -        if (ret == 0)
>> -            ret = i915_request_await_dma_fence(to, excl);
>> -
>> -        dma_fence_put(excl);
>>       }
>>         return ret;
>>

