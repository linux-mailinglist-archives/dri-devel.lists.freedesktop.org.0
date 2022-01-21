Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B71C495E71
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 12:32:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB97810EAAA;
	Fri, 21 Jan 2022 11:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B494A10EAAA
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 11:32:29 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so21850800wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 03:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=aySKClGTvJbUh+ArBQkUevRSCEVtOrzFOgJ/pRIcRB8=;
 b=TadUtlt54znkefpM4bpM+UIFVXMYdYf3Az35ly68LkzKRTY0iybc3WXXoYgnHSRezv
 ok1HyxI1HPuxBOgNwIAIoUEFn5K/cjbjO55tEiPes3mI6pIFDRgVcwzkNeO8F2a6ML7X
 vql3j3EEFdmgMy5cEvFdLWR9Ruo3Gs1A+XYnXdyhuAqYQwh5t9tSIMxdjH5q4yzlBGGy
 EDJo8zb4cUf3KQ16WW02b6WLd47nprkaIUsjlDzIX+gbB/XcGVmm/UmOo1U8xt/K0fgb
 WJJqx3Wmv/3AXvsbFP5IlCkzjaL/IwmJ2/cYVr9EhfbqTR0tXACycQBADhdx4WyLjYtD
 rTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=aySKClGTvJbUh+ArBQkUevRSCEVtOrzFOgJ/pRIcRB8=;
 b=K5Y1vv8ru9Mwx6R3ijfJtpjlQsvwpYLsmzlp/5usIjP8rM3J7JXtSDDoNsrP0v/nV9
 B8+P+p6cmGwImQsEICSAJH1SQapHovLtwdpzCPJfFzpfc2v2OYGw4szwOHN/7/RJkoSm
 IeJj4WoCE+YALcO7r1f6VcWGXNgmb0+p7dBrQiCEmbc8AerWT32dBgRPcl36MT9hy+fI
 XKwuSw4uMfRX4a5/mzUeqBkkRWv8j+7ubGpt/cIH9w+hEdeJPCp6abK5vVniknCBN4UM
 XM9G4hlyObsnQTwUpRwsxMBvTpcA2N4hmaDqmFtIHUaNbV5ln9urTMJO7mIe7I/aQk5k
 wBzA==
X-Gm-Message-State: AOAM531aCXMDQfCzOPF+gsgylog2euPbVbC4e7xl4PzTS0spfuipfmV2
 bTZH3XTF5uHTEaTg7e7Z2ls=
X-Google-Smtp-Source: ABdhPJwZ4LBcRXALNbwZROCZruRSDdN4VgehjgaHJ74emwaJH6vYXG3kkG/1l/qIhqnF1JsCkRxDrQ==
X-Received: by 2002:a05:600c:2253:: with SMTP id
 a19mr378833wmm.8.1642764748283; 
 Fri, 21 Jan 2022 03:32:28 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:a6b8:e14c:cc12:54a6?
 ([2a02:908:1252:fb60:a6b8:e14c:cc12:54a6])
 by smtp.gmail.com with ESMTPSA id m5sm4670360wms.4.2022.01.21.03.32.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 03:32:27 -0800 (PST)
Subject: Re: [Linaro-mm-sig] [PATCH 1/9] dma-buf: consolidate dma_fence
 subclass checking
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 sumit.semwal@linaro.org, gustavo@padovan.org, daniel.vetter@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20220120132747.2348-1-christian.koenig@amd.com>
 <20220120132747.2348-2-christian.koenig@amd.com>
 <93c4213e-41ff-1afa-be40-7ec6789c63da@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c826b129-bdff-9df6-410d-403585774d9e@gmail.com>
Date: Fri, 21 Jan 2022 12:32:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <93c4213e-41ff-1afa-be40-7ec6789c63da@shipmail.org>
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

Am 21.01.22 um 08:41 schrieb Thomas Hellström (Intel):
>
> On 1/20/22 14:27, Christian König wrote:
>> Consolidate the wrapper functions to check for dma_fence
>> subclasses in the dma_fence header.
>>
>> This makes it easier to document and also check the different
>> requirements for fence containers in the subclasses.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   include/linux/dma-fence-array.h | 15 +------------
>>   include/linux/dma-fence-chain.h |  3 +--
>>   include/linux/dma-fence.h       | 38 +++++++++++++++++++++++++++++++++
>>   3 files changed, 40 insertions(+), 16 deletions(-)
>>
>> diff --git a/include/linux/dma-fence-array.h 
>> b/include/linux/dma-fence-array.h
>> index 303dd712220f..fec374f69e12 100644
>> --- a/include/linux/dma-fence-array.h
>> +++ b/include/linux/dma-fence-array.h
>> @@ -45,19 +45,6 @@ struct dma_fence_array {
>>       struct irq_work work;
>>   };
>>   -extern const struct dma_fence_ops dma_fence_array_ops;
>> -
>> -/**
>> - * dma_fence_is_array - check if a fence is from the array subsclass
>> - * @fence: fence to test
>> - *
>> - * Return true if it is a dma_fence_array and false otherwise.
>> - */
>> -static inline bool dma_fence_is_array(struct dma_fence *fence)
>> -{
>> -    return fence->ops == &dma_fence_array_ops;
>> -}
>> -
>>   /**
>>    * to_dma_fence_array - cast a fence to a dma_fence_array
>>    * @fence: fence to cast to a dma_fence_array
>> @@ -68,7 +55,7 @@ static inline bool dma_fence_is_array(struct 
>> dma_fence *fence)
>>   static inline struct dma_fence_array *
>>   to_dma_fence_array(struct dma_fence *fence)
>>   {
>> -    if (fence->ops != &dma_fence_array_ops)
>> +    if (!fence || !dma_fence_is_array(fence))
>>           return NULL;
>>         return container_of(fence, struct dma_fence_array, base);
>> diff --git a/include/linux/dma-fence-chain.h 
>> b/include/linux/dma-fence-chain.h
>> index 54fe3443fd2c..ee906b659694 100644
>> --- a/include/linux/dma-fence-chain.h
>> +++ b/include/linux/dma-fence-chain.h
>> @@ -49,7 +49,6 @@ struct dma_fence_chain {
>>       spinlock_t lock;
>>   };
>>   -extern const struct dma_fence_ops dma_fence_chain_ops;
>>     /**
>>    * to_dma_fence_chain - cast a fence to a dma_fence_chain
>> @@ -61,7 +60,7 @@ extern const struct dma_fence_ops dma_fence_chain_ops;
>>   static inline struct dma_fence_chain *
>>   to_dma_fence_chain(struct dma_fence *fence)
>>   {
>> -    if (!fence || fence->ops != &dma_fence_chain_ops)
>> +    if (!fence || !dma_fence_is_chain(fence))
>>           return NULL;
>>         return container_of(fence, struct dma_fence_chain, base);
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index 1ea691753bd3..775cdc0b4f24 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -587,4 +587,42 @@ struct dma_fence *dma_fence_get_stub(void);
>>   struct dma_fence *dma_fence_allocate_private_stub(void);
>>   u64 dma_fence_context_alloc(unsigned num);
>>   +extern const struct dma_fence_ops dma_fence_array_ops;
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
>> +    return fence->ops == &dma_fence_array_ops;
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
>> +    return fence->ops == &dma_fence_chain_ops;
>> +}
>> +
>> +/**
>> + * dma_fence_is_container - check if a fence is a container for 
>> other fences
>> + * @fence: the fence to test
>> + *
>> + * Return true if this fence is a container for other fences, false 
>> otherwise.
>> + * This is important since we can't build up large fence structure 
>> or otherwise
>> + * we run into recursion during operation on those fences.
>> + */
>> +static inline bool dma_fence_is_container(struct dma_fence *fence)
>> +{
>> +    return dma_fence_is_array(fence) || dma_fence_is_chain(fence);
>> +}
>
> What's the strategy here moving forward if we add more dma_resv 
> containers, or if a driver adds a container that similarly has risc of 
> recursion? Should we perhaps add an ops bool for this, or require that 
> all dma_resv containers that has this limitation be part of the 
> dma-buf subsystem rather than driver-specific?

Good question.

I think that all containers which also implement the dma_fence interface 
should be part of the DMA-buf subsystem and not driver specific. Drivers 
just tend to reinvent something incorrectly.

Where/How should we document that?

Regards,
Christian.

>
> Thanks,
> /Thomas
>
>
>> +
>>   #endif /* __LINUX_DMA_FENCE_H */

