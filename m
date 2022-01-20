Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC37494A0F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 09:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59EE610E7CF;
	Thu, 20 Jan 2022 08:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4994D10E930
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 08:50:51 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id c66so10418686wma.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 00:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Ko6KL9eo2/amN6Mkm8rkJt9A+k3vlAsHv5U99GctgVw=;
 b=mudBSflgmCVgxMfMnCti2aKgRfjy3SsdsOzbU1Eobjq0FtoFaPNeAQUgOiQUfsywKC
 eaZEzlJ2l3FkgUKf/FAvTI0IJfSjDB8WjsfDF4MW2SC6mUtuTpqKgnug7QoxgFZ6jj2y
 he2MazseQFGXxIP0GMQrZWNqwKke4d6Epqc7j7etPBh0WyE4bHhybIBvwMfTnkN+sxo3
 kn+v1cXrtNQC0Ib8Z2+Yj//CuNjNiQJYynXdNmgGocE9QY/WXicnE0T8nVL6RvBQsnP4
 pFStQM/91rOGzV7+3zazEM0vXEjbrmUsdkQC1oHnxY6RLYr55DLUfHpRlVTPDKUC7Bmd
 o3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Ko6KL9eo2/amN6Mkm8rkJt9A+k3vlAsHv5U99GctgVw=;
 b=HcL92FOFem0PRowOXcoNrof3aGYZWpmVETnO32jrCOFdGWkA06scyktXffvTj6w2Jk
 zEHyuzANIIlyahn+sDxKW1BYs6ODjcfP98qoEAHclQRxfWH381TW02cf0Fi9Jtjx9Ekc
 KjK2XS3WVYIFkwbS3B/sb8dEYEZupVbT4Doc45t8lQ1RmWQBKwlEWGI4wXWm5mFI8FjD
 pnCHpegTO59dJKfP2B3btIntBEo6BY0dLBXAXlXDKIsSedIHSbqAwmsVUH5FUDXidK1q
 Ct/U6vxruww5anHnDoeRCu+Vn136nlz3vNgNxHaXFndSkFh5l5RPkrZ9lM3v4L46dTwm
 7c2w==
X-Gm-Message-State: AOAM530AwxPM1i8/htlikCEA3KFKHkNERbLyBqwYvtjqMOGswk0WzDGu
 jU+nAsBwVIoxs7IbxLJ2VEY=
X-Google-Smtp-Source: ABdhPJx95ZJNeIu0qZQZdChuFJEWtlTJdxUxS2ff/zIsq0hpP3JIZVsYxNZgwU2vQtGPjj87idBBdg==
X-Received: by 2002:a7b:cd81:: with SMTP id y1mr7883640wmj.4.1642668649697;
 Thu, 20 Jan 2022 00:50:49 -0800 (PST)
Received: from [192.168.178.21] (p57b0bff8.dip0.t-ipconnect.de.
 [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id d6sm2088784wrs.85.2022.01.20.00.50.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 00:50:49 -0800 (PST)
Subject: Re: [PATCH 1/4] dma-buf: consolidate dma_fence subclass checking
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220119134339.3102-1-christian.koenig@amd.com>
 <YehHX7ID/of9kxmE@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <364f8edb-07b5-c1b4-71ea-0003b45ce7e3@gmail.com>
Date: Thu, 20 Jan 2022 09:50:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YehHX7ID/of9kxmE@phenom.ffwll.local>
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
Cc: gustavo@padovan.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, daniel.vetter@ffwll.ch,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.01.22 um 18:16 schrieb Daniel Vetter:
> On Wed, Jan 19, 2022 at 02:43:36PM +0100, Christian König wrote:
>> Consolidate the wrapper functions to check for dma_fence
>> subclasses in the dma_fence header.
>>
>> This makes it easier to document and also check the different
>> requirements for fence containers in the subclasses.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   include/linux/dma-fence-array.h | 15 +------------
>>   include/linux/dma-fence-chain.h |  3 +--
>>   include/linux/dma-fence.h       | 38 +++++++++++++++++++++++++++++++++
>>   3 files changed, 40 insertions(+), 16 deletions(-)
>>
>> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
>> index 303dd712220f..fec374f69e12 100644
>> --- a/include/linux/dma-fence-array.h
>> +++ b/include/linux/dma-fence-array.h
>> @@ -45,19 +45,6 @@ struct dma_fence_array {
>>   	struct irq_work work;
>>   };
>>   
>> -extern const struct dma_fence_ops dma_fence_array_ops;
>> -
>> -/**
>> - * dma_fence_is_array - check if a fence is from the array subsclass
>> - * @fence: fence to test
>> - *
>> - * Return true if it is a dma_fence_array and false otherwise.
>> - */
>> -static inline bool dma_fence_is_array(struct dma_fence *fence)
>> -{
>> -	return fence->ops == &dma_fence_array_ops;
>> -}
>> -
>>   /**
>>    * to_dma_fence_array - cast a fence to a dma_fence_array
>>    * @fence: fence to cast to a dma_fence_array
>> @@ -68,7 +55,7 @@ static inline bool dma_fence_is_array(struct dma_fence *fence)
>>   static inline struct dma_fence_array *
>>   to_dma_fence_array(struct dma_fence *fence)
>>   {
>> -	if (fence->ops != &dma_fence_array_ops)
>> +	if (!fence || !dma_fence_is_array(fence))
>>   		return NULL;
>>   
>>   	return container_of(fence, struct dma_fence_array, base);
>> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
>> index 54fe3443fd2c..ee906b659694 100644
>> --- a/include/linux/dma-fence-chain.h
>> +++ b/include/linux/dma-fence-chain.h
>> @@ -49,7 +49,6 @@ struct dma_fence_chain {
>>   	spinlock_t lock;
>>   };
>>   
>> -extern const struct dma_fence_ops dma_fence_chain_ops;
>>   
>>   /**
>>    * to_dma_fence_chain - cast a fence to a dma_fence_chain
>> @@ -61,7 +60,7 @@ extern const struct dma_fence_ops dma_fence_chain_ops;
>>   static inline struct dma_fence_chain *
>>   to_dma_fence_chain(struct dma_fence *fence)
>>   {
>> -	if (!fence || fence->ops != &dma_fence_chain_ops)
>> +	if (!fence || !dma_fence_is_chain(fence))
>>   		return NULL;
>>   
>>   	return container_of(fence, struct dma_fence_chain, base);
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index 1ea691753bd3..775cdc0b4f24 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -587,4 +587,42 @@ struct dma_fence *dma_fence_get_stub(void);
>>   struct dma_fence *dma_fence_allocate_private_stub(void);
>>   u64 dma_fence_context_alloc(unsigned num);
>>   
>> +extern const struct dma_fence_ops dma_fence_array_ops;
>> +extern const struct dma_fence_ops dma_fence_chain_ops;
>> +
>> +/**
>> + * dma_fence_is_array - check if a fence is from the array subclass
>> + * @fence: the fence to test
>> + *
>> + * Return true if it is a dma_fence_array and false otherwise.
>> + */
>> +static inline bool dma_fence_is_array(struct dma_fence *fence)
>> +{
>> +	return fence->ops == &dma_fence_array_ops;
>> +}
>> +
>> +/**
>> + * dma_fence_is_chain - check if a fence is from the chain subclass
>> + * @fence: the fence to test
>> + *
>> + * Return true if it is a dma_fence_chain and false otherwise.
>> + */
>> +static inline bool dma_fence_is_chain(struct dma_fence *fence)
>> +{
>> +	return fence->ops == &dma_fence_chain_ops;
>> +}
>> +
>> +/**
>> + * dma_fence_is_container - check if a fence is a container for other fences
>> + * @fence: the fence to test
>> + *
>> + * Return true if this fence is a container for other fences, false otherwise.
>> + * This is important since we can't build up large fence structure or otherwise
>> + * we run into recursion during operation on those fences.
>> + */
>> +static inline bool dma_fence_is_container(struct dma_fence *fence)
> Code looks all good, but I'm not super enthusiastic about exporting the
> ops to drivers and letting them do random nonsense. At least i915 does
> pretty enormous amounts of stuff with that instead of having pushed
> priority boosting into dma-fence as a proper concept. And maybe a few
> other things.
>
> Now i915-gem team having gone off the rails of good upstream conduct is
> another thing maybe, but I'd like to not encourage that.
>
> So could we perhaps do this all in header which is entirely private to
> drivers/dma-buf, like dma-fence-internal or so? And maybe whack a big
> fixme onto the current abuse in drivers (of which __dma_fence_is_chain()
> gets a special price for "not how upstream should be done" *sigh*).

WTF is __dma_fence_is_chain? Seeing that for the first time now.

And yes even if you do priority boosting manually that code in i915 is 
just way to complicated.

I'm sure you don't have any objections that I clean up that mess now you 
pointed it out :)

Thanks,
Christian.

>
> Cheers, Daniel
>
>> +{
>> +	return dma_fence_is_array(fence) || dma_fence_is_chain(fence);
>> +}
>> +
>>   #endif /* __LINUX_DMA_FENCE_H */
>> -- 
>> 2.25.1
>>

