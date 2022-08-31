Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBD85A80A9
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 16:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2C410E41A;
	Wed, 31 Aug 2022 14:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B390910E413;
 Wed, 31 Aug 2022 14:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661957628; x=1693493628;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pj1wf4Ov4TT1gaC9pARNTcENbaaXMLa2tOEXAz25CyM=;
 b=G7/zPAKozSRZMDTBdBN8iloYa4Uuox2xdJwVkdwx3jY+6DhXXcCKet0E
 jndeZgor0lTtXdDNGgEScukZCoWRo0WA4Dhhu2DflwhkIvrkeTIMg8Fs6
 TRTQVaXF3t4e0Fbn6FwvXc0Ug16LS+cP4j1yCdWuhw8GjvRB/hc8UC1sa
 +RjrYZSSrU4Ea6J4FLKsChXI6mDz2SSZByNYTV7gMwo9hhsCzr1KYDpih
 +wSh+Pysr/VGKVpbwsv9aLu6nE2O125dljd3lvwGGSbOrIYwf4XCupKof
 C0R4VFMfEmXNm9dB+1jRDKYuZPXJPT1ukAhtUwO8q6c0CvVBiX7UdoCxC g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="321603046"
X-IronPort-AV: E=Sophos;i="5.93,278,1654585200"; d="scan'208";a="321603046"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 07:53:35 -0700
X-IronPort-AV: E=Sophos;i="5.93,278,1654585200"; d="scan'208";a="641897575"
Received: from salwamoh-mobl.gar.corp.intel.com (HELO [10.214.169.63])
 ([10.214.169.63])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 07:53:32 -0700
Message-ID: <d96ee168-f298-63fe-058c-cd421e2c49a0@intel.com>
Date: Wed, 31 Aug 2022 15:53:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.0
Subject: Re: [PATCH 1/3] drm/i915: audit bo->resource usage
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20220824142353.10293-1-luben.tuikov@amd.com>
 <1de21f6e-4b11-ee9b-1b54-fd67728766ad@amd.com>
 <cc4c59ad-5d69-b174-5464-bd9896459169@intel.com>
 <ce090a95-a822-5079-7b86-0c949e98cd64@amd.com>
 <3f3715fb-1f2b-83a5-bff7-6e06164e5546@intel.com>
 <9c7cc7ea-dd30-6df5-3f06-97a6c6d254e0@amd.com>
 <55d88b45-6986-de38-d574-d0ce7d06c62e@intel.com>
 <1392ea7c-88a3-9a56-1ccb-e2f16cd55f72@amd.com>
 <303ae81e-d9af-6912-8cdb-c881015da634@intel.com>
 <7047e694-997c-2082-48cb-f9f628c40183@amd.com>
 <50b37045-87de-04d0-7464-afcb5f9a2a0d@intel.com>
 <06f90d85-2f31-e815-fd5a-f19af141df63@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <06f90d85-2f31-e815-fd5a-f19af141df63@amd.com>
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
Cc: Luben Tuikov <luben.tuikov@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/08/2022 14:34, Christian König wrote:
> Am 31.08.22 um 14:50 schrieb Matthew Auld:
>> On 31/08/2022 13:35, Christian König wrote:
>>> Am 31.08.22 um 14:06 schrieb Matthew Auld:
>>>> On 31/08/2022 12:03, Christian König wrote:
>>>>> Am 31.08.22 um 12:37 schrieb Matthew Auld:
>>>>>> [SNIP]
>>>>>>>>
>>>>>>>> That hopefully just leaves i915_ttm_shrink(), which is swapping 
>>>>>>>> out shmem ttm_tt and is calling ttm_bo_validate() with empty 
>>>>>>>> placements to force the pipeline-gutting path, which importantly 
>>>>>>>> unpopulates the ttm_tt for us (since ttm_tt_unpopulate is not 
>>>>>>>> exported it seems). But AFAICT it looks like that will now also 
>>>>>>>> nuke the bo->resource, instead of just leaving it in system 
>>>>>>>> memory. My assumption is that when later calling 
>>>>>>>> ttm_bo_validate(), it will just do the bo_move_null() in 
>>>>>>>> i915_ttm_move(), instead of re-populating the ttm_tt and then 
>>>>>>>> potentially copying it back to local-memory?
>>>>>>>
>>>>>>> Well you do ttm_bo_validate() with something like GTT domain, 
>>>>>>> don't you? This should result in re-populating the tt object, but 
>>>>>>> I'm not 100% sure if that really works as expected.
>>>>>>
>>>>>> AFAIK for domains we either have system memory (which uses ttm_tt 
>>>>>> and might be shmem underneath) or local-memory. But perhaps i915 
>>>>>> is doing something wrong here, or abusing TTM in some way. I'm not 
>>>>>> sure tbh.
>>>>>>
>>>>>> Anyway, I think we have two cases here:
>>>>>>
>>>>>> - We have some system memory only object. After doing 
>>>>>> i915_ttm_shrink(), bo->resource is now NULL. We then call 
>>>>>> ttm_bo_validate() at some later point, but here we don't need to 
>>>>>> copy anything, but it also looks like ttm_bo_handle_move_mem() 
>>>>>> won't populate the ttm_tt or us either, since mem_type == 
>>>>>> TTM_PL_SYSTEM. It looks like i915_ttm_move() was taking care of 
>>>>>> this, but now we just call ttm_bo_move_null().
>>>>>>
>>>>>> - We have a local-memory only object, which was evicted to shmem, 
>>>>>> and then swapped out by the shrinker like above. The bo->resource 
>>>>>> is NULL. However this time when calling ttm_bo_validate() we need 
>>>>>> to actually do a copy in i915_ttm_move(), as well as re-populate 
>>>>>> the ttm_tt. i915_ttm_move() was taking care of this, but now we 
>>>>>> just call ttm_bo_move_null().
>>>>>>
>>>>>> Perhaps i915 is doing something wrong in the above two cases?
>>>>>
>>>>> Mhm, as far as I can see that should still work.
>>>>>
>>>>> See previously you should got a transition from SYSTEM->GTT in 
>>>>> i915_ttm_move() to re-create your backing store. Not you get 
>>>>> NULL->SYSTEM which is handled by ttm_bo_move_null() and then 
>>>>> SYSTEM->GTT.
>>>>
>>>> What is GTT here in TTM world? Also I'm not seeing where there is 
>>>> this SYSTEM->GTT transition? Maybe I'm blind. Just to be clear, i915 
>>>> is only calling ttm_bo_validate() once when acquiring the pages, and 
>>>> we don't call it again, unless it was evicted (and potentially 
>>>> swapped out).
>>>
>>> Well GTT means TTM_PL_TT.
>>>
>>> And calling it only once is perfectly fine, TTM will internally see 
>>> that we need two hops to reach TTM_PL_TT and so does the NULL->SYSTEM 
>>> transition and then SYSTEM->TT.
>>
>> Ah interesting, so that's what the multi-hop thing does. But AFAICT 
>> i915 is not using either TTM_PL_TT or -EMULTIHOP.
> 
> Mhm, it could be that we then have a problem and the i915 driver only 
> sees NULL->TT directly. But I really don't know the i915 driver code 
> good enough to judge that.
> 
> Can you take a look at this and test it maybe?

I'll grab a machine and try to see what is going on here.

> 
>>
>> Also what is the difference between TTM_PL_TT and TM_PL_SYSTEM? When 
>> should you use one over the other?
> 
> TTM_PL_SYSTEM means the device is not accessing the buffer and TTM has 
> the control over the backing store and can swapout/swapin as it wants it.
> 
> TTM_PL_TT means that the device is accessing the data (TT stands for 
> translation table) and so TTM can't swap the backing store in/out.
> 
> TTM_PL_VRAM well that one is obvious.

Thanks for the explanation. So it looks like i915 is using TTM_PL_SYSTEM 
even for device access it seems.

> 
> Thanks,
> Christian.
> 
>>
>>>
>>> As far as I can see that should work like it did before.
>>>
>>> Christian.
>>>
>>>>
>>>>>
>>>>> If you just validated to SYSTEM memory before I think the tt object 
>>>>> wouldn't have been populated either.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Christian.
>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>> I've been considering to replacing the ttm_bo_type with a bunch 
>>>>>>>>> of behavior flags for a bo. I'm hoping that this will clean 
>>>>>>>>> things up a bit.
>>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>>>       caching = i915_ttm_select_tt_caching(obj);
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c 
>>>>>>>>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>>>>>>>>>> index 9a7e50534b84bb..c420d1ab605b6f 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>>>>>>>>>> @@ -560,7 +560,7 @@ int i915_ttm_move(struct 
>>>>>>>>>>>> ttm_buffer_object *bo, bool evict,
>>>>>>>>>>>>       bool clear;
>>>>>>>>>>>>       int ret;
>>>>>>>>>>>> -    if (GEM_WARN_ON(!obj)) {
>>>>>>>>>>>> +    if (GEM_WARN_ON(!obj) || !bo->resource) {
>>>>>>>>>>>>           ttm_bo_move_null(bo, dst_mem);
>>>>>>>>>>>>           return 0;
>>>>>>>>>>>>       }
>>>>>>>>>>>
>>>>>>>>>
>>>>>>>
>>>>>
>>>
> 
