Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56415463E9D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 20:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7B96E05C;
	Tue, 30 Nov 2021 19:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A73B6E05C;
 Tue, 30 Nov 2021 19:28:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="216318966"
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; d="scan'208";a="216318966"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 11:27:54 -0800
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; d="scan'208";a="595566014"
Received: from hekner-mobl5.ger.corp.intel.com (HELO [10.249.254.206])
 ([10.249.254.206])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 11:27:52 -0800
Message-ID: <49cf2d43-9a8a-7738-0889-7e16b0256249@linux.intel.com>
Date: Tue, 30 Nov 2021 20:27:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 1/2] dma-fence: Avoid establishing a locking order
 between fence classes
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211130121936.586031-1-thomas.hellstrom@linux.intel.com>
 <20211130121936.586031-2-thomas.hellstrom@linux.intel.com>
 <c7502701-e85c-39f0-c249-702d029faa9e@linux.intel.com>
 <b440cfbc-2b9a-1aa2-76d6-17337f835777@linux.intel.com>
 <52a7cf8c-59c7-fec0-2274-d19bdc505314@amd.com>
 <57df8b0b-1d65-155f-a9a6-8073bbd4f28f@linux.intel.com>
 <2551da4d-2e51-cc24-7d4a-84ae00a1547c@amd.com>
 <29d096c91d720fbe5d410124580a02b663155b56.camel@linux.intel.com>
 <250a8e47-2093-1a98-3859-0204ec4e60e6@amd.com>
 <712b54fa1c09ae5cc1d75739ad8a7286f1dae8db.camel@linux.intel.com>
In-Reply-To: <712b54fa1c09ae5cc1d75739ad8a7286f1dae8db.camel@linux.intel.com>
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
Cc: linaro-mm-sig@lists.linaro.org, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/30/21 19:12, Thomas Hellström wrote:
> On Tue, 2021-11-30 at 16:02 +0100, Christian König wrote:
>> Am 30.11.21 um 15:35 schrieb Thomas Hellström:
>>> On Tue, 2021-11-30 at 14:26 +0100, Christian König wrote:
>>>> Am 30.11.21 um 13:56 schrieb Thomas Hellström:
>>>>> On 11/30/21 13:42, Christian König wrote:
>>>>>> Am 30.11.21 um 13:31 schrieb Thomas Hellström:
>>>>>>> [SNIP]
>>>>>>>> Other than that, I didn't investigate the nesting fails
>>>>>>>> enough to
>>>>>>>> say I can accurately review this. :)
>>>>>>> Basically the problem is that within enable_signaling()
>>>>>>> which
>>>>>>> is
>>>>>>> called with the dma_fence lock held, we take the dma_fence
>>>>>>> lock
>>>>>>> of
>>>>>>> another fence. If that other fence is a dma_fence_array, or
>>>>>>> a
>>>>>>> dma_fence_chain which in turn tries to lock a
>>>>>>> dma_fence_array
>>>>>>> we hit
>>>>>>> a splat.
>>>>>> Yeah, I already thought that you constructed something like
>>>>>> that.
>>>>>>
>>>>>> You get the splat because what you do here is illegal, you
>>>>>> can't
>>>>>> mix
>>>>>> dma_fence_array and dma_fence_chain like this or you can end
>>>>>> up
>>>>>> in a
>>>>>> stack corruption.
>>>>> Hmm. Ok, so what is the stack corruption, is it that the
>>>>> enable_signaling() will end up with endless recursion? If so,
>>>>> wouldn't
>>>>> it be more usable we break that recursion chain and allow a
>>>>> more
>>>>> general use?
>>>> The problem is that this is not easily possible for
>>>> dma_fence_array
>>>> containers. Just imagine that you drop the last reference to the
>>>> containing fences during dma_fence_array destruction if any of
>>>> the
>>>> contained fences is another container you can easily run into
>>>> recursion
>>>> and with that stack corruption.
>>> Indeed, that would require some deeper surgery.
>>>
>>>> That's one of the major reasons I came up with the
>>>> dma_fence_chain
>>>> container. This one you can chain any number of elements together
>>>> without running into any recursion.
>>>>
>>>>> Also what are the mixing rules between these? Never use a
>>>>> dma-fence-chain as one of the array fences and never use a
>>>>> dma-fence-array as a dma-fence-chain fence?
>>>> You can't add any other container to a dma_fence_array, neither
>>>> other
>>>> dma_fence_array instances nor dma_fence_chain instances.
>>>>
>>>> IIRC at least technically a dma_fence_chain can contain a
>>>> dma_fence_array if you absolutely need that, but Daniel, Jason
>>>> and I
>>>> already had the same discussion a while back and came to the
>>>> conclusion
>>>> to avoid that as well if possible.
>>> Yes, this is actually the use-case. But what I can't easily
>>> guarantee
>>> is that that dma_fence_chain isn't fed into a dma_fence_array
>>> somewhere
>>> else. How do you typically avoid that?
>>>
>>> Meanwhile I guess I need to take a different approach in the driver
>>> to
>>> avoid this altogether.
>> Jason and I came up with a deep dive iterator for his use case, but I
>> think we don't want to use that any more after my dma_resv rework.
>>
>> In other words when you need to create a new dma_fence_array you
>> flatten
>> out the existing construct which is at worst case
>> dma_fence_chain->dma_fence_array->dma_fence.
> Ok, Are there any cross-driver contract here, Like every driver using a
> dma_fence_array need to check for dma_fence_chain and flatten like
> above?
>
> /Thomas

Oh, and a follow up question:

If there was a way to break the recursion on final put() (using the same 
basic approach as patch 2 in this series uses to break recursion in 
enable_signaling()), so that none of these containers did require any 
special treatment, would it be worth pursuing? I guess it might be 
possible by having the callbacks drop the references rather than the 
loop in the final put. + a couple of changes in code iterating over the 
fence pointers.

/Thomas

>
>> Regards,
>> Christian.
>>
>>> /Thomas
>>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> /Thomas
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> But I'll update the commit message with a typical splat.
>>>>>>>
>>>>>>> /Thomas
