Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FE25A976B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 14:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F1B10E6F4;
	Thu,  1 Sep 2022 12:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBB710E6F4;
 Thu,  1 Sep 2022 12:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662036777; x=1693572777;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qKbpRO4Cbi0WE/Z6/uk8H+b8kd75h75dV866DLi2NfU=;
 b=mBSd9rGSPO1NLsfCiLkXu9yrjefgaUJscOyIx83EVGUfjsOggjy+qj+l
 pA+wO6ryAE8LDWMk8sQERxw3ezG/poiBdvv5AswKVmavyVj/7O2huvh+6
 Zdy9MlvanXuN7MbXHsS+AQZmxY20xxrLXfSK6HSgN30+NehP6HwfSfYSg
 AUmTTgLY6zw4fVdk6KGvdUUPvaknSVj2s35tNoYZZYMcjyB26yC526oxI
 ho0oLzYPJEezauaNM5H8Elp0sgL6hxf5fhJiEP0tiM/jQl9ul8yAVzOj2
 xgc0jOGmt5CrfKqVxmPaljZHwqxhMlibQwyUJ9RVjf1fqBb9urpglLJ9d g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="275452346"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="275452346"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 05:52:56 -0700
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="754810603"
Received: from fbinti7x-mobl.gar.corp.intel.com (HELO [10.213.37.184])
 ([10.213.37.184])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 05:52:53 -0700
Message-ID: <559f1d01-d240-1444-3ea2-f16d650a6bb4@intel.com>
Date: Thu, 1 Sep 2022 13:52:49 +0100
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
 <d96ee168-f298-63fe-058c-cd421e2c49a0@intel.com>
 <aa115f44-3771-fd37-8ac5-d831d13021fb@intel.com>
 <e74ee9bf-82b7-68ba-13b2-4511e73b52e8@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <e74ee9bf-82b7-68ba-13b2-4511e73b52e8@amd.com>
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

On 01/09/2022 09:00, Christian König wrote:
> Am 31.08.22 um 18:32 schrieb Matthew Auld:
>> On 31/08/2022 15:53, Matthew Auld wrote:
>>> On 31/08/2022 14:34, Christian König wrote:
>>>> Am 31.08.22 um 14:50 schrieb Matthew Auld:
>>>>> On 31/08/2022 13:35, Christian König wrote:
>>>>>> Am 31.08.22 um 14:06 schrieb Matthew Auld:
>>>>>>> On 31/08/2022 12:03, Christian König wrote:
>>>>>>>> Am 31.08.22 um 12:37 schrieb Matthew Auld:
>>>>>>>>> [SNIP]
>>>>>>>>>>>
>>>>>>>>>>> That hopefully just leaves i915_ttm_shrink(), which is 
>>>>>>>>>>> swapping out shmem ttm_tt and is calling ttm_bo_validate() 
>>>>>>>>>>> with empty placements to force the pipeline-gutting path, 
>>>>>>>>>>> which importantly unpopulates the ttm_tt for us (since 
>>>>>>>>>>> ttm_tt_unpopulate is not exported it seems). But AFAICT it 
>>>>>>>>>>> looks like that will now also nuke the bo->resource, instead 
>>>>>>>>>>> of just leaving it in system memory. My assumption is that 
>>>>>>>>>>> when later calling ttm_bo_validate(), it will just do the 
>>>>>>>>>>> bo_move_null() in i915_ttm_move(), instead of re-populating 
>>>>>>>>>>> the ttm_tt and then potentially copying it back to local-memory?
>>>>>>>>>>
>>>>>>>>>> Well you do ttm_bo_validate() with something like GTT domain, 
>>>>>>>>>> don't you? This should result in re-populating the tt object, 
>>>>>>>>>> but I'm not 100% sure if that really works as expected.
>>>>>>>>>
>>>>>>>>> AFAIK for domains we either have system memory (which uses 
>>>>>>>>> ttm_tt and might be shmem underneath) or local-memory. But 
>>>>>>>>> perhaps i915 is doing something wrong here, or abusing TTM in 
>>>>>>>>> some way. I'm not sure tbh.
>>>>>>>>>
>>>>>>>>> Anyway, I think we have two cases here:
>>>>>>>>>
>>>>>>>>> - We have some system memory only object. After doing 
>>>>>>>>> i915_ttm_shrink(), bo->resource is now NULL. We then call 
>>>>>>>>> ttm_bo_validate() at some later point, but here we don't need 
>>>>>>>>> to copy anything, but it also looks like 
>>>>>>>>> ttm_bo_handle_move_mem() won't populate the ttm_tt or us 
>>>>>>>>> either, since mem_type == TTM_PL_SYSTEM. It looks like 
>>>>>>>>> i915_ttm_move() was taking care of this, but now we just call 
>>>>>>>>> ttm_bo_move_null().
>>>>>>>>>
>>>>>>>>> - We have a local-memory only object, which was evicted to 
>>>>>>>>> shmem, and then swapped out by the shrinker like above. The 
>>>>>>>>> bo->resource is NULL. However this time when calling 
>>>>>>>>> ttm_bo_validate() we need to actually do a copy in 
>>>>>>>>> i915_ttm_move(), as well as re-populate the ttm_tt. 
>>>>>>>>> i915_ttm_move() was taking care of this, but now we just call 
>>>>>>>>> ttm_bo_move_null().
>>>>>>>>>
>>>>>>>>> Perhaps i915 is doing something wrong in the above two cases?
>>>>>>>>
>>>>>>>> Mhm, as far as I can see that should still work.
>>>>>>>>
>>>>>>>> See previously you should got a transition from SYSTEM->GTT in 
>>>>>>>> i915_ttm_move() to re-create your backing store. Not you get 
>>>>>>>> NULL->SYSTEM which is handled by ttm_bo_move_null() and then 
>>>>>>>> SYSTEM->GTT.
>>>>>>>
>>>>>>> What is GTT here in TTM world? Also I'm not seeing where there is 
>>>>>>> this SYSTEM->GTT transition? Maybe I'm blind. Just to be clear, 
>>>>>>> i915 is only calling ttm_bo_validate() once when acquiring the 
>>>>>>> pages, and we don't call it again, unless it was evicted (and 
>>>>>>> potentially swapped out).
>>>>>>
>>>>>> Well GTT means TTM_PL_TT.
>>>>>>
>>>>>> And calling it only once is perfectly fine, TTM will internally 
>>>>>> see that we need two hops to reach TTM_PL_TT and so does the 
>>>>>> NULL->SYSTEM transition and then SYSTEM->TT.
>>>>>
>>>>> Ah interesting, so that's what the multi-hop thing does. But AFAICT 
>>>>> i915 is not using either TTM_PL_TT or -EMULTIHOP.
>>>>
>>>> Mhm, it could be that we then have a problem and the i915 driver 
>>>> only sees NULL->TT directly. But I really don't know the i915 driver 
>>>> code good enough to judge that.
>>>>
>>>> Can you take a look at this and test it maybe?
>>>
>>> I'll grab a machine and try to see what is going on here.
>>
>> Well at least the issue with the firmware not loading looks to be 
>> fixed now.
>>
>> So running some eviction + oom tests it looks it now does:
>>
>> /* eviction kicks in */
>> i915_ttm_move(bo):  LMEM -> PL_SYSTEM
>>
>> /* shrinker/oom kicks in at some point */
>> i915_ttm_shrink(bo):
>>     bo->resource = NULL, /* pipeline_gutting */
>>     shmem ttm_tt is unpopulated and pages are correctly swapped out
>>
>> /* user touches the same object later */
>> i915_ttm_move(bo):  NULL -> LMEM, bo_move_null()
>>
>> So seems to incorrectly skip swapping it back in and then copy over to 
>> lmem. It just allocates directly in lmem.
>>
>> And previously the last two steps would have been:
>>
>> i915_ttm_shrink(bo):
>>     bo->resource = PL_SYSTEM, /* pipeline_gutting */
>>     shmem ttm_tt is unpopulated and pages are correctly swapped out
>>
>> i915_ttm_move(bo):
>>     PL_SYSTEM -> LMEM,
>>     ttm_tt is repopulated and pages are copied over to lmem
> 
> Mhm, crap. That indeed looks like it won't work.
> 
> How about changing the code like this:
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c 
> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> index c420d1ab605b..1ee7d81ddcbc 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -560,7 +560,17 @@ int i915_ttm_move(struct ttm_buffer_object *bo, 
> bool evict,
>          bool clear;
>          int ret;
> 
> -       if (GEM_WARN_ON(!obj) || !bo->resource) {
> +       if (GEM_WARN_ON(!obj)) {
> +               ttm_bo_move_null(bo, dst_mem);
> +               return 0;
> +       }
> +
> +       if (!bo->resource) {
> +               if (dst_mem->mem_type != TTM_PL_SYSTEM) {
> +                        hop->mem_type = TTM_PL_SYSTEM;
> +                        hop->flags = TTM_PL_FLAG_TEMPORARY;
> +                       return -EMULTIHOP;
> +               }
>                  ttm_bo_move_null(bo, dst_mem);
>                  return 0;
>          }
> 
> That should result in allocating a TTM_PL_SYSTEM resource first and then 
> moving from that to the final destination.

Ok, I played around with this some more. The final diff looks like:
https://patchwork.freedesktop.org/patch/500786/?series=108027&rev=1

It looks like we had some more places where bo->resource == NULL didn't 
end well. It at least now seems to survive my local testing.

> 
> Thanks,
> Christian.
