Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD6440D50C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 10:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66D46EB11;
	Thu, 16 Sep 2021 08:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F846EB11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 08:50:45 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so3906291wms.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 01:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=PilEIyPDzJ/vHkRNW8mWcn0rY279xvGJ8VytXsNfdxg=;
 b=BEQZaN/YqxYSBySdLFlA2Qt4YezIWKWr++O7tI096wOBIoAYslO7e3oJijcEr3BPSE
 W53E16slPNvKxvG7h6jVCT1Y18g4Bkb6IJ9noH7bny55Jc63J2DMJ7+6iwoT3a7pmjGi
 t/iEyOHP1+HjEiaZtS1v5GdQmPNh7zo/DcGVHOg8VEnFUkczptYkEkwhCQlpVv+SRNzQ
 EBqa18L0KWVVSz9FsEK4agb1LVc368+WyHWCHuoOkWX/jNuMmKAaFy4z9nNqNR2bvCES
 L/mNScwDewQQSQhVF4OOl5BuYySbd4NIV1db7C7q3kxgwyJ9L5KIejPDbtcPHGQbg0zi
 STWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=PilEIyPDzJ/vHkRNW8mWcn0rY279xvGJ8VytXsNfdxg=;
 b=ylg4cgAbpKz/wFUrbrgPdxpFrma4PuQ5l02Ws7zdYfcqUj5mONxytnKRDvis4bQXbV
 WQsFlOGKcCS+BdOV91fyrS9z4G/50k4IrNdwm88T3CNrLv+RWNAoFLfHXnUjYnWk9TM/
 bHC6l8yHlTOvr5TF/olgSSEhGTHKlPAWkJxMCmr/7dCw+/Y5sGpelQXVQQvXk0JLlIMA
 B43Wnkc9OhYGzr6djg/HF1dkmchHaR5bnmQLz0igthrrNpOX4ve67Gmq5ShaUP8K9NaH
 DAb6tNClTbOAsAmD65bXF2cWvctuxS/NADx/uZTMy+dr0GmNZWfbbUP3x+ZhOBVzVt+u
 XXxA==
X-Gm-Message-State: AOAM533oHfeUaYBu/MOwn6QTRxY8SmY5IPjoeOBmVrPMnCg00AE4RzTQ
 uUCJ/5mNgdTkQvV0jYmsuap4gk3sKII6GlpS
X-Google-Smtp-Source: ABdhPJzNh4a8/BNBtpIRKBCZ7NOCUkwleKD7LJGru4SwOhtzfKVf91HqvZFkEVD2V5oUcIZQQM6lsg==
X-Received: by 2002:a1c:210a:: with SMTP id h10mr3784909wmh.165.1631782244304; 
 Thu, 16 Sep 2021 01:50:44 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id c15sm2678522wrc.83.2021.09.16.01.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 01:50:43 -0700 (PDT)
Subject: Re: [PATCH 01/14] dma-buf: add dma_resv_for_each_fence_unlocked
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20210910082655.82168-1-christian.koenig@amd.com>
 <YUDWHw19iUMfFr7K@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <26f766c9-9a3c-3894-9256-e07090655dc2@gmail.com>
Date: Thu, 16 Sep 2021 10:50:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUDWHw19iUMfFr7K@phenom.ffwll.local>
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

Am 14.09.21 um 19:04 schrieb Daniel Vetter:
> On Fri, Sep 10, 2021 at 10:26:42AM +0200, Christian König wrote:
>> Abstract the complexity of iterating over all the fences
>> in a dma_resv object.
>>
>> The new loop handles the whole RCU and retry dance and
>> returns only fences where we can be sure we grabbed the
>> right one.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-resv.c | 63 ++++++++++++++++++++++++++++++++++++++
>>   include/linux/dma-resv.h   | 36 ++++++++++++++++++++++
>>   2 files changed, 99 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>> index 84fbe60629e3..213a9b7251ca 100644
>> --- a/drivers/dma-buf/dma-resv.c
>> +++ b/drivers/dma-buf/dma-resv.c
>> @@ -323,6 +323,69 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>>   }
>>   EXPORT_SYMBOL(dma_resv_add_excl_fence);
>>   
>> +/**
>> + * dma_resv_walk_unlocked - walk over fences in a dma_resv obj
>> + * @obj: the dma_resv object
>> + * @cursor: cursor to record the current position
>> + * @all_fences: true returns also the shared fences
>> + * @first: if we should start over
>> + *
>> + * Return all the fences in the dma_resv object which are not yet signaled.
>> + * The returned fence has an extra local reference so will stay alive.
>> + * If a concurrent modify is detected the whole iterator is started over again.
>> + */
>> +struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
>> +					 struct dma_resv_cursor *cursor,
>> +					 bool all_fences, bool first)
>> +{
>> +	struct dma_fence *fence = NULL;
>> +
>> +	do {
>> +		/* Drop the reference from the previous round */
>> +		dma_fence_put(fence);
>> +
>> +		cursor->is_first = first;
>> +		if (first) {
>> +			cursor->seq = read_seqcount_begin(&obj->seq);
>> +			cursor->index = -1;
>> +			cursor->fences = dma_resv_shared_list(obj);
>> +			cursor->is_exclusive = true;
>> +
>> +			fence = dma_resv_excl_fence(obj);
>> +			if (fence && test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>> +					      &fence->flags))
>> +				fence = NULL;
>> +		} else {
>> +			fence = NULL;
>> +		}
>> +
>> +		if (fence) {
>> +			fence = dma_fence_get_rcu(fence);
>> +		} else if (all_fences && cursor->fences) {
>> +			struct dma_resv_list *fences = cursor->fences;
>> +
>> +			cursor->is_exclusive = false;
>> +			while (++cursor->index < fences->shared_count) {
>> +				fence = rcu_dereference(fences->shared[
>> +							cursor->index]);
>> +				if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>> +					      &fence->flags))
>> +					break;
>> +			}
>> +			if (cursor->index < fences->shared_count)
>> +				fence = dma_fence_get_rcu(fence);
>> +			else
>> +				fence = NULL;
>> +		}
>> +
>> +		/* For the eventually next round */
>> +		first = true;
>> +	} while (read_seqcount_retry(&obj->seq, cursor->seq));
>> +
>> +	return fence;
>> +}
>> +EXPORT_SYMBOL_GPL(dma_resv_walk_unlocked);
>> +
>>   /**
>>    * dma_resv_copy_fences - Copy all fences from src to dst.
>>    * @dst: the destination reservation object
>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>> index 9100dd3dc21f..f5b91c292ee0 100644
>> --- a/include/linux/dma-resv.h
>> +++ b/include/linux/dma-resv.h
>> @@ -149,6 +149,39 @@ struct dma_resv {
>>   	struct dma_resv_list __rcu *fence;
>>   };
>>   
>> +/**
>> + * struct dma_resv_cursor - current position into the dma_resv fences
>> + * @seq: sequence number to check
>> + * @index: index into the shared fences
>> + * @shared: the shared fences
>> + * @is_first: true if this is the first returned fence
>> + * @is_exclusive: if the current fence is the exclusive one
>> + */
>> +struct dma_resv_cursor {
>> +	unsigned int seq;
>> +	unsigned int index;
>> +	struct dma_resv_list *fences;
>> +	bool is_first;
>> +	bool is_exclusive;
>> +};
> A bit a bikeshed, but I think I'd be nice to align this with the other
> iterators we have, e.g. for the drm_connector list.
>
> So struct dma_resv_fence_iter, dma_resv_fence_iter_begin/next/end().

I've renamed the structure to dma_resv_iter.

> Also I think the for_each macro must not include begin/end calls. If we
> include that then it saves 2 lines of code at the cost of a pile of
> awkward bugs because people break; out of the loop or return early  (only
> continue is safe) and we leak a fence. Or worse.
>
> Explicit begin/end is much more robust at a very marginal cost imo.

The key point is that this makes it quite a bunch more complicated to 
implement. See those functions are easiest when you centralize them and 
try to not spread the functionality into begin/end.

The only thing I could see in the end function would be to drop the 
reference for the dma_fence and that is not really something I would 
like to do because we actually need to keep that reference in a bunch of 
cases.

Regards,
Christian.

>
> Otherwise I think this fence iterator is a solid concept that yeah we
> should roll out everywhere.
> -Daniel
>
>> +
>> +/**
>> + * dma_resv_for_each_fence_unlocked - fence iterator
>> + * @obj: a dma_resv object pointer
>> + * @cursor: a struct dma_resv_cursor pointer
>> + * @all_fences: true if all fences should be returned
>> + * @fence: the current fence
>> + *
>> + * Iterate over the fences in a struct dma_resv object without holding the
>> + * dma_resv::lock. The RCU read side lock must be hold when using this, but can
>> + * be dropped and re-taken as necessary inside the loop. @all_fences controls
>> + * if the shared fences are returned as well.
>> + */
>> +#define dma_resv_for_each_fence_unlocked(obj, cursor, all_fences, fence)    \
>> +	for (fence = dma_resv_walk_unlocked(obj, cursor, all_fences, true); \
>> +	     fence; dma_fence_put(fence),				    \
>> +	     fence = dma_resv_walk_unlocked(obj, cursor, all_fences, false))
>> +
>>   #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>>   #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
>>   
>> @@ -366,6 +399,9 @@ void dma_resv_fini(struct dma_resv *obj);
>>   int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
>>   void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
>>   void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
>> +struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
>> +					 struct dma_resv_cursor *cursor,
>> +					 bool first, bool all_fences);
>>   int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
>>   			unsigned *pshared_count, struct dma_fence ***pshared);
>>   int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
>> -- 
>> 2.25.1
>>

