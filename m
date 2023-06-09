Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E95729917
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 14:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988B110E69B;
	Fri,  9 Jun 2023 12:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA09C10E69B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 12:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686312566; x=1717848566;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=W8q4UQwfW9AHpoNcI+cy1SQRkvpQ//7pJFNA+GxGD4w=;
 b=MgLgAU8c8dMT99Bup9MAomG+roKPGYxLTT2wWoNnwvfARSbj9iYd5cI4
 LI7QJE5g9M+g7I5qUfmfveBfmcr005ehq+MtUlN+Hz3+duB59f7HAdwnS
 JWLtLMooMTS7SGeTi+wYW5PcJsBw+IOUF9NF2BWsT/Y5GD8xWcdMW1hOG
 DmBM2bOcfdnYpUK05npgfqc2ThaRg9m+XmGw1GI7w9vzlu85gOZEXjO4B
 ZjcBjxaxGQFep94zlUNrtvPz7Ctmaa+zFySiGsjI7i4Nw5Sf7Kq9TrtLl
 XQZSIKFC3uLslUMQngQmmmEjn2F/D6m9joP/vglHiBicWQAWAOuWKVv9Z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="356473992"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="356473992"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 05:09:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="1040480971"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="1040480971"
Received: from pjdillon-mobl1.ger.corp.intel.com (HELO [10.213.210.241])
 ([10.213.210.241])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 05:09:16 -0700
Message-ID: <9bbc64c9-d4af-9183-f002-01225ae8f74b@linux.intel.com>
Date: Fri, 9 Jun 2023 13:09:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dma-fence: Bypass signaling annotation from
 dma_fence_is_signaled
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20230608143059.1038115-1-tvrtko.ursulin@linux.intel.com>
 <b8f0ea1e-4ab3-8ff1-5e69-4e723adf8c2a@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <b8f0ea1e-4ab3-8ff1-5e69-4e723adf8c2a@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 09/06/2023 07:32, Christian König wrote:
> Am 08.06.23 um 16:30 schrieb Tvrtko Ursulin:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> For dma_fence_is_signaled signaling critical path annotations are an
>> annoying cause of false positives when using dma_fence_is_signaled and
>> indirectly higher level helpers such as dma_resv_test_signaled etc.
>>
>> Drop the critical path annotation since the "is signaled" API does not
>> guarantee to ever change the signaled status anyway.
>>
>> We do that by adding a low level _dma_fence_signal helper and use it from
>> dma_fence_is_signaled.
> 
> I have been considering dropping the signaling from the 
> dma_fence_is_signaled() function altogether.
> 
> Doing this together with the spin locking we have in the dma_fence is 
> just utterly nonsense since the purpose of the external spinlock is to 
> keep the signaling in order while this here defeats that.
> 
> The quick check is ok I think, but signaling the dma_fence and issuing 
> the callbacks should always come from the interrupt handler.

What do you think is broken with regards to ordering with the current 
code? The unlocked fast check?

Regards,

Tvrtko

> 
> Christian.
> 
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---
>>   drivers/dma-buf/dma-fence.c | 26 ++++++++++++++++++++------
>>   include/linux/dma-fence.h   |  3 ++-
>>   2 files changed, 22 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index f177c56269bb..ace1415f0566 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -444,6 +444,25 @@ int dma_fence_signal_locked(struct dma_fence *fence)
>>   }
>>   EXPORT_SYMBOL(dma_fence_signal_locked);
>> +/**
>> + * __dma_fence_signal - signal completion of a fence bypassing 
>> critical section annotation
>> + * @fence: the fence to signal
>> + *
>> + * This low-level helper should not be used by code external to 
>> dma-fence.h|c!
>> + */
>> +int _dma_fence_signal(struct dma_fence *fence)
>> +{
>> +    unsigned long flags;
>> +    int ret;
>> +
>> +    spin_lock_irqsave(fence->lock, flags);
>> +    ret = dma_fence_signal_timestamp_locked(fence, ktime_get());
>> +    spin_unlock_irqrestore(fence->lock, flags);
>> +
>> +    return ret;
>> +}
>> +EXPORT_SYMBOL(_dma_fence_signal);
>> +
>>   /**
>>    * dma_fence_signal - signal completion of a fence
>>    * @fence: the fence to signal
>> @@ -459,7 +478,6 @@ EXPORT_SYMBOL(dma_fence_signal_locked);
>>    */
>>   int dma_fence_signal(struct dma_fence *fence)
>>   {
>> -    unsigned long flags;
>>       int ret;
>>       bool tmp;
>> @@ -467,11 +485,7 @@ int dma_fence_signal(struct dma_fence *fence)
>>           return -EINVAL;
>>       tmp = dma_fence_begin_signalling();
>> -
>> -    spin_lock_irqsave(fence->lock, flags);
>> -    ret = dma_fence_signal_timestamp_locked(fence, ktime_get());
>> -    spin_unlock_irqrestore(fence->lock, flags);
>> -
>> +    ret = _dma_fence_signal(fence);
>>       dma_fence_end_signalling(tmp);
>>       return ret;
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index d54b595a0fe0..d94768ad70e4 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -387,6 +387,7 @@ static inline void dma_fence_end_signalling(bool 
>> cookie) {}
>>   static inline void __dma_fence_might_wait(void) {}
>>   #endif
>> +int _dma_fence_signal(struct dma_fence *fence);
>>   int dma_fence_signal(struct dma_fence *fence);
>>   int dma_fence_signal_locked(struct dma_fence *fence);
>>   int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t 
>> timestamp);
>> @@ -452,7 +453,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
>>           return true;
>>       if (fence->ops->signaled && fence->ops->signaled(fence)) {
>> -        dma_fence_signal(fence);
>> +        _dma_fence_signal(fence);
>>           return true;
>>       }
> 
