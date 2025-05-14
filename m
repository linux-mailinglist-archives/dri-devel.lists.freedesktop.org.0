Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A15AB6E51
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 16:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8682310E645;
	Wed, 14 May 2025 14:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="S33IKIC6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E6110E287;
 Wed, 14 May 2025 14:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1619jyZXxzYHmTJfqftpu2moaBovrtQFLfq9OyUu/3s=; b=S33IKIC6uyB3wLhWCYkRu61I35
 WTaamvv/C9zPqU56DRdY+E6wsuPzRQaHmxiTISpK3IE0CeKqFXTyRIr8TWvPuMOZFZbQtkMoisYRe
 eXJ7bbk22LKQBtALPrjEIqyeErA5xsL9BFGNbeLOM3euENwRRZHXAu/zioISu7QchTSKC64/hkYg5
 X3qzo/08a7HrOgj/Tf1Q0/xJ5vvbeEnEK966NonMQbbNrLm+ZUVGtP8F5Ke4mm3vXXXsQ6dbiWyx2
 SwifCASijN4OLB8EQJND9YonjqHAJ+79dRUFgVYXJyRNC9IxKzuIwPQAHky1DsEAzq/fNPEUf+qJ5
 TSKEhhag==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uFDHt-008CBt-3D; Wed, 14 May 2025 16:46:35 +0200
Message-ID: <8e0239ce-64f2-4a4b-a2a3-0952ca7f9ad0@igalia.com>
Date: Wed, 14 May 2025 15:46:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 07/10] dma-fence: Add safe access helpers and document
 the rules
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250513074513.81727-1-tvrtko.ursulin@igalia.com>
 <20250513074513.81727-8-tvrtko.ursulin@igalia.com>
 <00d3e903-76fe-463d-bb5c-232e4dac4bb5@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <00d3e903-76fe-463d-bb5c-232e4dac4bb5@amd.com>
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


On 14/05/2025 14:50, Christian König wrote:
> I'm going to push patches #1-#6 to drm-misc-next.
> 
> They make sense as a stand alone cleanups anyway.

Holding off for now because the 64 bit seqno flag needs a build fix. I 
have it locally but was waiting for more feedback on the series.
  > But that here needs a bit more documentation I think.
> 
> On 5/13/25 09:45, Tvrtko Ursulin wrote:
>> Dma-fence objects currently suffer from a potential use after free problem
>> where fences exported to userspace and other drivers can outlive the
>> exporting driver, or the associated data structures.
>>
>> The discussion on how to address this concluded that adding reference
>> counting to all the involved objects is not desirable, since it would need
>> to be very wide reaching and could cause unloadable drivers if another
>> entity would be holding onto a signaled fence reference potentially
>> indefinitely.
>>
>> This patch enables the safe access by introducing and documenting a
>> contract between fence exporters and users. It documents a set of
>> contraints and adds helpers which a) drivers with potential to suffer from
>> the use after free must use and b) users of the dma-fence API must use as
>> well.
>>
>> Premise of the design has multiple sides:
>>
>> 1. Drivers (fence exporters) MUST ensure a RCU grace period between
>> signalling a fence and freeing the driver private data associated with it.
> 
> That's a must have anyway, otherwise functions like dma_fence_get_rcu() won't work.

That one is for the fence object itself, right? Above I was specifically 
talking about the data pointed to from the fence such as the lock and 
and driver data accessible via the ops vfuncs.

> I hope that we have documented that somewhere, but I'm not 100% sure to be honest.
> 
>> The grace period does not have to follow the signalling immediately but
>> HAS to happen before data is freed.
> 
> That is the new requirement we have to document somehow.

It is still the same number 1) bullet point. Just clarifying that one 
does not need engineer for grace periods right after signalling.

> I'm not 100% sure but I think module unloading waits for an RCU grace period anyway.
> 
> 
>> 2. Users of the dma-fence API marked with such requirement MUST contain
>> the complete access to the data within a single code block guarded by the
>> new dma_fence_access_begin() and dma_fence_access_end() helpers.
>>
>> The combination of the two ensures that whoever sees the
>> DMA_FENCE_FLAG_SIGNALED_BIT not set is guaranteed to have access to a
>> valid fence->lock and valid data potentially accessed by the fence->ops
>> virtual functions, until the call to dma_fence_access_end().
> 
> Mhm, how about returning copies of the string?
> 
> This is only for debugging anyway and kstrdup_const() isn't that costly.

Not sure exactly how that would work. Wouldn't it imply either 
GFP_ATOMIC or upgrading the RCU requirements to SRCU?

Regards,

Tvrtko

>> 3. Module unload (fence->ops) disappearing is for now explicitly not
>> handled. That would required a more complex protection, possibly needing
>> SRCU instead of RCU to handle callers such as dma_fence_wait_timeout(),
>> where race between dma_fence_enable_sw_signaling, signalling, and
>> dereference of fence->ops->wait() would need a sleeping SRCU context.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>   drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++++++++++++++
>>   include/linux/dma-fence.h   | 32 ++++++++++++-----
>>   2 files changed, 93 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index dc2456f68685..cfe1d7b79c22 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -533,6 +533,7 @@ void dma_fence_release(struct kref *kref)
>>   	struct dma_fence *fence =
>>   		container_of(kref, struct dma_fence, refcount);
>>   
>> +	dma_fence_access_begin();
>>   	trace_dma_fence_destroy(fence);
>>   
>>   	if (WARN(!list_empty(&fence->cb_list) &&
>> @@ -560,6 +561,8 @@ void dma_fence_release(struct kref *kref)
>>   		fence->ops->release(fence);
>>   	else
>>   		dma_fence_free(fence);
>> +
>> +	dma_fence_access_end();
>>   }
>>   EXPORT_SYMBOL(dma_fence_release);
>>   
>> @@ -982,11 +985,13 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
>>    */
>>   void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>>   {
>> +	dma_fence_access_begin();
>>   	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
>>   		   dma_fence_driver_name(fence),
>>   		   dma_fence_timeline_name(fence),
>>   		   fence->seqno,
>>   		   dma_fence_is_signaled(fence) ? "" : "un");
>> +	dma_fence_access_end();
>>   }
>>   EXPORT_SYMBOL(dma_fence_describe);
>>   
>> @@ -1033,3 +1038,67 @@ dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>   	__set_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags);
>>   }
>>   EXPORT_SYMBOL(dma_fence_init64);
>> +
>> +/**
>> + * dma_fence_driver_name - Access the driver name
>> + * @fence: the fence to query
>> + *
>> + * Returns a driver name backing the dma-fence implementation.
>> + *
>> + * IMPORTANT CONSIDERATION:
>> + * Dma-fence contract stipulates that access to driver provided data (data not
>> + * directly embedded into the object itself), such as the &dma_fence.lock and
>> + * memory potentially accessed by the &dma_fence.ops functions, is forbidden
>> + * after the fence has been signalled. Drivers are allowed to free that data,
>> + * and some do.
>> + *
>> + * To allow safe access drivers are mandated to guarantee a RCU grace period
>> + * between signalling the fence and freeing said data.
>> + *
>> + * As such access to the driver name is only valid inside a RCU locked section.
>> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block guarded
>> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
>> + */
>> +const char *dma_fence_driver_name(struct dma_fence *fence)
>> +{
>> +	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>> +			 "rcu_read_lock() required for safe access to returned string");
>> +
>> +	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>> +		return fence->ops->get_driver_name(fence);
>> +	else
>> +		return "detached-driver";
>> +}
>> +EXPORT_SYMBOL(dma_fence_driver_name);
>> +
>> +/**
>> + * dma_fence_timeline_name - Access the timeline name
>> + * @fence: the fence to query
>> + *
>> + * Returns a timeline name provided by the dma-fence implementation.
>> + *
>> + * IMPORTANT CONSIDERATION:
>> + * Dma-fence contract stipulates that access to driver provided data (data not
>> + * directly embedded into the object itself), such as the &dma_fence.lock and
>> + * memory potentially accessed by the &dma_fence.ops functions, is forbidden
>> + * after the fence has been signalled. Drivers are allowed to free that data,
>> + * and some do.
>> + *
>> + * To allow safe access drivers are mandated to guarantee a RCU grace period
>> + * between signalling the fence and freeing said data.
>> + *
>> + * As such access to the driver name is only valid inside a RCU locked section.
>> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block guarded
>> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
>> + */
>> +const char *dma_fence_timeline_name(struct dma_fence *fence)
>> +{
>> +	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>> +			 "rcu_read_lock() required for safe access to returned string");
>> +
>> +	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>> +		return fence->ops->get_driver_name(fence);
>> +	else
>> +		return "signaled-timeline";
>> +}
>> +EXPORT_SYMBOL(dma_fence_timeline_name);
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index c5ac37e10d85..b39e430142ea 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -377,15 +377,31 @@ bool dma_fence_remove_callback(struct dma_fence *fence,
>>   			       struct dma_fence_cb *cb);
>>   void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>>   
>> -static inline const char *dma_fence_driver_name(struct dma_fence *fence)
>> -{
>> -	return fence->ops->get_driver_name(fence);
>> -}
>> +/**
>> + * DOC: Safe external access to driver provided object members
>> + *
>> + * All data not stored directly in the dma-fence object, such as the
>> + * &dma_fence.lock and memory potentially accessed by functions in the
>> + * &dma_fence.ops table, MUST NOT be accessed after the fence has been signalled
>> + * because after that point drivers are allowed to free it.
>> + *
>> + * All code accessing that data via the dma-fence API (or directly, which is
>> + * discouraged), MUST make sure to contain the complete access within a
>> + * &dma_fence_access_begin and &dma_fence_access_end pair.
>> + *
>> + * Some dma-fence API handles this automatically, while other, as for example
>> + * &dma_fence_driver_name and &dma_fence_timeline_name, leave that
>> + * responsibility to the caller.
>> + *
>> + * To enable this scheme to work drivers MUST ensure a RCU grace period elapses
>> + * between signalling the fence and freeing the said data.
>> + *
>> + */
>> +#define dma_fence_access_begin	rcu_read_lock
>> +#define dma_fence_access_end	rcu_read_unlock
>>   
>> -static inline const char *dma_fence_timeline_name(struct dma_fence *fence)
>> -{
>> -	return fence->ops->get_timeline_name(fence);
>> -}
>> +const char *dma_fence_driver_name(struct dma_fence *fence);
>> +const char *dma_fence_timeline_name(struct dma_fence *fence);
>>   
>>   /**
>>    * dma_fence_is_signaled_locked - Return an indication if the fence
> 

