Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B067AB32D4
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 11:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B1210E343;
	Mon, 12 May 2025 09:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aeryY/03";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572F310E341;
 Mon, 12 May 2025 09:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UyjmjMDOJ7vntls8sQp1NolBIvCBCwal59oSs6Egk5w=; b=aeryY/03qztXYCkrZgIDs5ce2p
 UCO5TB7ODqBSkyUWnk9PnYX4oNDVWTJ9J7Htc/6TUeeRHOGaL4n7888WQhOzHngs4lFowe0ZmELzZ
 fLMYUg9dG14gzm0kCfJagZcFrgCM4jYd+17BrEbtMuSp2eM2PCG2zxFjMBJtR278/4YzLpGhqp7EA
 /rtly7vfikFzboOrSmqk0KL3hYfnoszyz5VSckeuaB+hmbC5Be+VdiDeXQvLyV2BuMDLq0gVsWKd3
 tzS0rStGrLyO8i8AGHnN+pj/sQlI5amFJD+XHaEMI6CuwOfKJ4xEk2ZLC8qr7jtRRzu4LBLZbgrbd
 pmn+55SQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uEP9z-006zc4-VL; Mon, 12 May 2025 11:14:38 +0200
Message-ID: <34263299-6279-44a2-a224-6a094a319ea6@igalia.com>
Date: Mon, 12 May 2025 10:14:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 04/13] dma-fence: Move array and chain checks to flags
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-5-tvrtko.ursulin@igalia.com>
 <f75f6d26-ac93-48cb-a9e2-adffe0af1ed8@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <f75f6d26-ac93-48cb-a9e2-adffe0af1ed8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 12/05/2025 09:19, Christian König wrote:
> On 5/9/25 17:33, Tvrtko Ursulin wrote:
>> With the goal of reducing the need for drivers to touch fence->ops, we
>> add explicit flags for struct dma_fence_array and struct dma_fence_chain
>> and make the respective helpers (dma_fence_is_array() and
>> dma_fence_is_chain()) use them.
>>
>> This also allows us to remove the exported symbols for the respective
>> operation tables.
> 
> That looks like overkill to me. We don't de-reference the ops for the check, instead just the values are compared.
> 
> Since the array and chain are always build in that should be completely unproblematic for driver unload.

You are right this is not strictly needed. Idea was just to reduce any 
access to ops as much as we can and this fell under that scope.

Another benefit one could perhaps argue is two fewer EXPORT_SYMBOLs, 
which is perhaps a little bit cleaner design (less exporting of 
implementation details to the outside), but it is not a super strong 
argument.

If we will not be going for this one then I would be taking 1/13 via 
drm-intel-gt-next.

Regards,

Tvrtko

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>   drivers/dma-buf/dma-fence-array.c | 2 +-
>>   drivers/dma-buf/dma-fence-chain.c | 2 +-
>>   include/linux/dma-fence.h         | 9 ++++-----
>>   3 files changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
>> index 6657d4b30af9..daf444f5d228 100644
>> --- a/drivers/dma-buf/dma-fence-array.c
>> +++ b/drivers/dma-buf/dma-fence-array.c
>> @@ -167,7 +167,6 @@ const struct dma_fence_ops dma_fence_array_ops = {
>>   	.release = dma_fence_array_release,
>>   	.set_deadline = dma_fence_array_set_deadline,
>>   };
>> -EXPORT_SYMBOL(dma_fence_array_ops);
>>   
>>   /**
>>    * dma_fence_array_alloc - Allocate a custom fence array
>> @@ -207,6 +206,7 @@ void dma_fence_array_init(struct dma_fence_array *array,
>>   	spin_lock_init(&array->lock);
>>   	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
>>   		       context, seqno);
>> +	__set_bit(DMA_FENCE_FLAG_ARRAY_BIT, &array->base.flags);
>>   	init_irq_work(&array->work, irq_dma_fence_array_work);
>>   
>>   	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
>> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
>> index a8a90acf4f34..f4abe41fb092 100644
>> --- a/drivers/dma-buf/dma-fence-chain.c
>> +++ b/drivers/dma-buf/dma-fence-chain.c
>> @@ -225,7 +225,6 @@ const struct dma_fence_ops dma_fence_chain_ops = {
>>   	.release = dma_fence_chain_release,
>>   	.set_deadline = dma_fence_chain_set_deadline,
>>   };
>> -EXPORT_SYMBOL(dma_fence_chain_ops);
>>   
>>   /**
>>    * dma_fence_chain_init - initialize a fence chain
>> @@ -263,6 +262,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>>   
>>   	dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
>>   			 context, seqno);
>> +	__set_bit(DMA_FENCE_FLAG_CHAIN_BIT, &chain->base.flags);
>>   
>>   	/*
>>   	 * Chaining dma_fence_chain container together is only allowed through
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index ac6535716dbe..5bafd0a5f1f1 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -98,6 +98,8 @@ struct dma_fence {
>>   
>>   enum dma_fence_flag_bits {
>>   	DMA_FENCE_FLAG_SEQNO64_BIT,
>> +	DMA_FENCE_FLAG_ARRAY_BIT,
>> +	DMA_FENCE_FLAG_CHAIN_BIT,
>>   	DMA_FENCE_FLAG_SIGNALED_BIT,
>>   	DMA_FENCE_FLAG_TIMESTAMP_BIT,
>>   	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>> @@ -632,9 +634,6 @@ struct dma_fence *dma_fence_get_stub(void);
>>   struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp);
>>   u64 dma_fence_context_alloc(unsigned num);
>>   
>> -extern const struct dma_fence_ops dma_fence_array_ops;
>> -extern const struct dma_fence_ops dma_fence_chain_ops;
>> -
>>   /**
>>    * dma_fence_is_array - check if a fence is from the array subclass
>>    * @fence: the fence to test
>> @@ -643,7 +642,7 @@ extern const struct dma_fence_ops dma_fence_chain_ops;
>>    */
>>   static inline bool dma_fence_is_array(struct dma_fence *fence)
>>   {
>> -	return fence->ops == &dma_fence_array_ops;
>> +	return test_bit(DMA_FENCE_FLAG_ARRAY_BIT, &fence->flags);
>>   }
>>   
>>   /**
>> @@ -654,7 +653,7 @@ static inline bool dma_fence_is_array(struct dma_fence *fence)
>>    */
>>   static inline bool dma_fence_is_chain(struct dma_fence *fence)
>>   {
>> -	return fence->ops == &dma_fence_chain_ops;
>> +	return test_bit(DMA_FENCE_FLAG_CHAIN_BIT, &fence->flags);
>>   }
>>   
>>   /**
> 

