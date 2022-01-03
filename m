Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7295483050
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 12:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847F210E12F;
	Mon,  3 Jan 2022 11:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD6010E12F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 11:13:43 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v6so7506127wra.8
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 03:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/xDzVRxEQgayAR/omopzMywYnd6ZJL04kxWXjVBYmcY=;
 b=bxaad7VnMibEW4dJkJ6HWX5/Yc01WVK/oxOBJKAJt88uAdvC43ytPYU6vOnAuFdMoj
 8tw+BLHSaWLSVxmrz1fl9i2diL4C8CLnuq8hrnTyXw5K6C02mKkTTagRbrPPQV1MaT7e
 V2EMmUKe0C2R1z+gtmA82ipKzovJ3zm+/QBZyfyjyRgnkXNZ+49P7WUQJEgYxU6rBThL
 E3CeM6FNyHOxaM71++6t4moVTh9iNuSAggqycIB3sQx/0Cus89AovfqmRxgczEJqwTf7
 ZuLupS1XNbT16HF2RFHJyckqKfRWeWtaRhjx3M081n1BgHBINlYn45iNbuN4zxpAlx8g
 FwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/xDzVRxEQgayAR/omopzMywYnd6ZJL04kxWXjVBYmcY=;
 b=jyuhIjdkV6wl7aXEP7797tAVFj/FIFdSK8gR/5ukuyOYM0EBW/IkZJXuVNLg5w4gLG
 0e8SE2EenZ/Jec+DDf5DTFuV3RXRqsG+HhLFL5gMmvpjA7PsaLPnW/0FGufFDJ9SyEEv
 1M3tCPdJWsWc/bNy+6d8HEPf+DH4mrVTi6i1vO0RXXMizrx218J20g9nMh+Pt1fPbh+H
 YnEAgRfccHdbv6nD/fQfxnTQRCHX9S8pXd4TUA1A9JIKtPvRzwfYeTrvatr0f+nMyccy
 T7ZaynIcq8N0X5JjYwi1zF7I6RPjNH5XrqoStoglUj3aCAEAHry90E3AeByyvNbW7J9u
 QXYA==
X-Gm-Message-State: AOAM532qruSGLGq/yu/wcJcnRpSo21hswh/ehXoGg+S/ii0AYS6LFlS0
 mEfCRfffHxEHSQlOYmVnWrQ=
X-Google-Smtp-Source: ABdhPJyW8Grrm1qyFuYKgMlpX+Xa8vCtLrhGQ0I2VioTMYdmGjNeBX1oMUxsHxqlcaq9M/5gTbsIag==
X-Received: by 2002:a5d:4acb:: with SMTP id y11mr38736631wrs.64.1641208422431; 
 Mon, 03 Jan 2022 03:13:42 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:4bf5:8542:f955:f736?
 ([2a02:908:1252:fb60:4bf5:8542:f955:f736])
 by smtp.gmail.com with ESMTPSA id z6sm40497699wmp.9.2022.01.03.03.13.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 03:13:42 -0800 (PST)
Subject: Re: [PATCH 04/24] dma-buf: add dma_resv_get_singleton v2
To: Daniel Vetter <daniel@ffwll.ch>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-5-christian.koenig@amd.com>
 <YcOWyHzY22ZCCvef@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <95929048-b381-78d1-462c-e7b910c784b0@gmail.com>
Date: Mon, 3 Jan 2022 12:13:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcOWyHzY22ZCCvef@phenom.ffwll.local>
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

Am 22.12.21 um 22:21 schrieb Daniel Vetter:
> On Tue, Dec 07, 2021 at 01:33:51PM +0100, Christian König wrote:
>> Add a function to simplify getting a single fence for all the fences in
>> the dma_resv object.
>>
>> v2: fix ref leak in error handling
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-resv.c | 52 ++++++++++++++++++++++++++++++++++++++
>>   include/linux/dma-resv.h   |  2 ++
>>   2 files changed, 54 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>> index 480c305554a1..694716a3d66d 100644
>> --- a/drivers/dma-buf/dma-resv.c
>> +++ b/drivers/dma-buf/dma-resv.c
>> @@ -34,6 +34,7 @@
>>    */
>>   
>>   #include <linux/dma-resv.h>
>> +#include <linux/dma-fence-array.h>
>>   #include <linux/export.h>
>>   #include <linux/mm.h>
>>   #include <linux/sched/mm.h>
>> @@ -657,6 +658,57 @@ int dma_resv_get_fences(struct dma_resv *obj, bool write,
>>   }
>>   EXPORT_SYMBOL_GPL(dma_resv_get_fences);
>>   
>> +/**
>> + * dma_resv_get_singleton - Get a single fence for all the fences
>> + * @obj: the reservation object
>> + * @write: true if we should return all fences
>> + * @fence: the resulting fence
>> + *
>> + * Get a single fence representing all the fences inside the resv object.
>> + * Returns either 0 for success or -ENOMEM.
>> + *
>> + * Warning: This can't be used like this when adding the fence back to the resv
>> + * object since that can lead to stack corruption when finalizing the
>> + * dma_fence_array.
> Uh I don't get this one? I thought the only problem with nested fences is
> the signalling recursion, which we work around with the irq_work?

Nope, the main problem is finalizing the dma_fence_array.

E.g. imagine that you build up a chain of dma_fence_array objects like this:
a<-b<-c<-d<-e<-f.....

With each one referencing the previous dma_fence_array and then you call 
dma_fence_put() on the last one. That in turn will cause calling 
dma_fence_put() on the previous one, which in turn will cause 
dma_fence_put() one the one before the previous one etc....

In other words you recurse because each dma_fence_array instance drops 
the last reference of it's predecessor.

What we could do is to delegate dropping the reference to the containing 
fences in a dma_fence_array as well, but that would require some changes 
to the irq_work_run_list() function to be halve way efficient.

> Also if there's really an issue with dma_fence_array fences, then that
> warning should be on the dma_resv kerneldoc, not somewhere hidden like
> this. And finally I really don't see what can go wrong, sure we'll end up
> with the same fence once in the dma_resv_list and then once more in the
> fence array. But they're all refcounted, so really shouldn't matter.
>
> The code itself looks correct, but me not understanding what even goes
> wrong here freaks me out a bit.

Yeah, IIRC we already discussed that with Jason in length as well.

Essentially what you can't do is to put a dma_fence_array into another 
dma_fence_array without causing issues.

So I think we should maybe just add a WARN_ON() into 
dma_fence_array_init() to make sure that this never happens.

Regards,
Christian.

>
> I guess something to figure out next year, I kinda hoped I could squeeze a
> review in before I disappear :-/
> -Daniel
>
>> + */
>> +int dma_resv_get_singleton(struct dma_resv *obj, bool write,
>> +			   struct dma_fence **fence)
>> +{
>> +	struct dma_fence_array *array;
>> +	struct dma_fence **fences;
>> +	unsigned count;
>> +	int r;
>> +
>> +	r = dma_resv_get_fences(obj, write, &count, &fences);
>> +        if (r)
>> +		return r;
>> +
>> +	if (count == 0) {
>> +		*fence = NULL;
>> +		return 0;
>> +	}
>> +
>> +	if (count == 1) {
>> +		*fence = fences[0];
>> +		kfree(fences);
>> +		return 0;
>> +	}
>> +
>> +	array = dma_fence_array_create(count, fences,
>> +				       dma_fence_context_alloc(1),
>> +				       1, false);
>> +	if (!array) {
>> +		while (count--)
>> +			dma_fence_put(fences[count]);
>> +		kfree(fences);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	*fence = &array->base;
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
>> +
>>   /**
>>    * dma_resv_wait_timeout - Wait on reservation's objects
>>    * shared and/or exclusive fences.
>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>> index fa2002939b19..cdfbbda6f600 100644
>> --- a/include/linux/dma-resv.h
>> +++ b/include/linux/dma-resv.h
>> @@ -438,6 +438,8 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
>>   void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
>>   int dma_resv_get_fences(struct dma_resv *obj, bool write,
>>   			unsigned int *num_fences, struct dma_fence ***fences);
>> +int dma_resv_get_singleton(struct dma_resv *obj, bool write,
>> +			   struct dma_fence **fence);
>>   int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
>>   long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
>>   			   unsigned long timeout);
>> -- 
>> 2.25.1
>>

