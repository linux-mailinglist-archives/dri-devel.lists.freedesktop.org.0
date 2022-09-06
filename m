Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4F25AE667
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 13:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963B410E617;
	Tue,  6 Sep 2022 11:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C308310E617
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 11:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662463306; x=1693999306;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=3ZFIWu1iVTrSZh9swgEip3UeXgSl7SQaM85kMXnUI04=;
 b=PEQF6nsdxKlfhRhl75RTpa2gVhAX0ynjXbhyxy9rbQTHrpmTaZf2bCrS
 Eya6AwoNFJbAhjhbFvDUf21IW5pjz1BPSd63p9+eBa1d3cJBFk3Ed6SeA
 DAov27PhQNR6M9mklD54ooDjIJQsYbEZah9sAfpfHehViFV1lX8oDjbQh
 uE7DyLM8o6EndAwF/6rlO2qZ6t0oqEFOMcWhF6HxnR4GXVPprx13Ma7K5
 NaiedF1aKzIsdgtYxVPeoWNP54P+TdTkXLXyopcnD5nAtQM9//mHGFK5J
 uZBnggahPYWrBizKJvze7s5c8cvnnCznvicLrQrc1yAd6v1z3boOlfgWa w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="283563149"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="283563149"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 04:21:46 -0700
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="644132421"
Received: from holmesda-mobl.ger.corp.intel.com (HELO [10.213.204.21])
 ([10.213.204.21])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 04:21:43 -0700
Message-ID: <691e636f-07d6-f4d3-6d83-29a3834ac1a2@linux.intel.com>
Date: Tue, 6 Sep 2022 12:21:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 4/4] dma-buf: Check status of enable-signaling bit on
 debug
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220905163502.4032-1-Arvind.Yadav@amd.com>
 <20220905163502.4032-5-Arvind.Yadav@amd.com>
 <f2e1367f-b056-b2af-365c-8ae4ef03f008@amd.com>
 <ec41b299-4280-d8e4-7ab0-23b5ea6ad401@linux.intel.com>
 <de799b93-1b55-c420-61d9-ad8fa926c7d2@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <de799b93-1b55-c420-61d9-ad8fa926c7d2@amd.com>
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


On 06/09/2022 11:43, Christian König wrote:
> Am 06.09.22 um 12:20 schrieb Tvrtko Ursulin:
>>
>> On 06/09/2022 09:39, Christian König wrote:
>>> Am 05.09.22 um 18:35 schrieb Arvind Yadav:
>>>> The core DMA-buf framework needs to enable signaling
>>>> before the fence is signaled. The core DMA-buf framework
>>>> can forget to enable signaling before the fence is signaled.
>>>
>>> This sentence is a bit confusing. I'm not a native speaker of English 
>>> either, but I suggest something like:
>>>
>>> "Fence signaling must be enable to make sure that the 
>>> dma_fence_is_signaled() function ever returns true."
>>>
>>>> To avoid this scenario on the debug kernel, check the
>>>> DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT status bit before checking
>>>> the signaling bit status to confirm that enable_signaling
>>>> is enabled.
>>>
>>> This describes the implementation, but we should rather describe the 
>>> background of the change. The implementation should be obvious. 
>>> Something like this maybe:
>>>
>>> "
>>> Since drivers and implementations sometimes mess this up enforce 
>>> correct behavior when DEBUG_WW_MUTEX_SLOWPATH is used during debugging.
>>>
>>> This should make any implementations bugs resulting in not signaled 
>>> fences much more obvious.
>>> "
>>
>> I think I follow the idea but am not sure coupling (well "coupling".. 
>> not really, but cross-contaminating in a way) dma-fence.c with a 
>> foreign and effectively unrelated concept of a ww mutex is the best way.
>>
>> Instead, how about a dma-buf specific debug kconfig option?
> 
> Yeah, I was thinking about that as well.

Cool, lets see about the specifics below and then decide.
  
> The slowpath config option was just at hand because when you want to 
> test the slowpath you want to test this here as well.
> 
>>
>> Condition would then be, according to my understanding of the rules 
>> and expectations, along the lines of:
>>
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index 775cdc0b4f24..147a9df2c9d0 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -428,6 +428,17 @@ dma_fence_is_signaled_locked(struct dma_fence 
>> *fence)
>>  static inline bool
>>  dma_fence_is_signaled(struct dma_fence *fence)
>>  {
>> +#ifdef CONFIG_DEBUG_DMAFENCE
>> +       /*
>> +        * Implementations not providing the enable_signaling callback 
>> are
>> +        * required to always have signaling enabled or fences are not
>> +        * guaranteed to ever signal.
>> +        */
> 
> Well that comment is a bit misleading. The intention of the extra check 
> is to find bugs in the frontend and not the backend.

By backend you mean drivers/dma-buf/dma-fence.c and by front end driver specific implementations? Or simply users for dma-fence?

Could be that I got confused.. I was reading these two:


	 * This callback is optional. If this callback is not present, then the
	 * driver must always have signaling enabled.
	 */
	bool (*enable_signaling)(struct dma_fence *fence);

And dma_fence_is_signaled:

  * Returns true if the fence was already signaled, false if not. Since this
  * function doesn't enable signaling, it is not guaranteed to ever return
  * true if dma_fence_add_callback(), dma_fence_wait() or
  * dma_fence_enable_sw_signaling() haven't been called before.

Right, I think I did get confused, apologies. What I was thinking was probably two separate conditions:

  static inline bool
  dma_fence_is_signaled(struct dma_fence *fence)
  {
+#ifdef CONFIG_DEBUG_DMAFENCE
+       if (WARN_ON_ONCE(!fence->ops->enable_signaling &&
+                        !test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags)))
+               return false;
+
+       if (!test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
+               return false;
+#endif
+
         if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
                 return true;

Not sure "is signaled" is the best place for the first one or that it should definitely be added.

Regards,

Tvrtko

> In other words somewhere in the drm_syncobj code we have a 
> dma_fence_is_signaled() call without matching 
> dma_fence_enable_sw_signaling().
> 
> Regards,
> Christian.
> 
>> + if (!fence->ops->enable_signaling &&
>> +           !test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
>> +               return false;
>> +#endif
>> +
>>         if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>                 return true;
>>
>> Thoughts?
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>>>
>>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>>
>>> With the improved commit message this patch is Reviewed-by: Christian 
>>> König <christian.koenig@amd.com>
>>>
>>> Regards,
>>> Christian.
>>>
>>>> ---
>>>>
>>>> Changes in v1 :
>>>> 1- Addressing Christian's comment to replace
>>>> CONFIG_DEBUG_WW_MUTEX_SLOWPATH instead of CONFIG_DEBUG_FS.
>>>> 2- As per Christian's comment moving this patch at last so
>>>> The version of this patch is also changed and previously
>>>> it was [PATCH 1/4]
>>>>
>>>>
>>>> ---
>>>>   include/linux/dma-fence.h | 5 +++++
>>>>   1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>> index 775cdc0b4f24..ba1ddc14c5d4 100644
>>>> --- a/include/linux/dma-fence.h
>>>> +++ b/include/linux/dma-fence.h
>>>> @@ -428,6 +428,11 @@ dma_fence_is_signaled_locked(struct dma_fence 
>>>> *fence)
>>>>   static inline bool
>>>>   dma_fence_is_signaled(struct dma_fence *fence)
>>>>   {
>>>> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
>>>> +    if (!test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
>>>> +        return false;
>>>> +#endif
>>>> +
>>>>       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>>           return true;
>>>
> 
