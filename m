Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE98C5A7A2E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 11:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC2310E2AF;
	Wed, 31 Aug 2022 09:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0185E10E2B3;
 Wed, 31 Aug 2022 09:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661937994; x=1693473994;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fIwfwdIBs5pwJ2B0E3aD+iKeDfwJ3a08TjfPeG65ptQ=;
 b=JDCNTr2xwGvixSupjcjj9tYpBSkdXOP337gt9EF69+xV9sVzwf2K0Pb1
 s2pHAtlrAx983Dhno0RITKgzjCcEUnLs0AkjUpO6fPfWevjnxlvqniGAC
 6a8cP5lLXS6VPjEHYW5hA498HuEfTr6l+ufYRpEji5DtNM00wgPayUf+Q
 ecbM4JoDHmTBKmRasy4eHVqV9KLTovB5Dc+ptuSVqq38GTw4zUHPMkD6L
 5QZTJBgIKYlOxBOIrSeeyglcNidkLIdY3f/FW4fJHvJkP3LmBpVHYPrIo
 c1JivR1bWrvI+Sgjd0VhW4oT/i0VfeoI+QZhsLqBdZ7Uhnz3JltoZIg3u g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="381706853"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="381706853"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 02:26:33 -0700
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="641778629"
Received: from salwamoh-mobl.gar.corp.intel.com (HELO [10.214.169.63])
 ([10.214.169.63])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 02:26:30 -0700
Message-ID: <3f3715fb-1f2b-83a5-bff7-6e06164e5546@intel.com>
Date: Wed, 31 Aug 2022 10:26:26 +0100
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
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ce090a95-a822-5079-7b86-0c949e98cd64@amd.com>
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

On 31/08/2022 09:16, Christian König wrote:
> Hi Matthew,
> 
> Am 30.08.22 um 12:45 schrieb Matthew Auld:
>> Hi,
>>
>> On 30/08/2022 08:33, Christian König wrote:
>>> Hi guys,
>>>
>>> can we get an rb/acked-by for this i915 change?
>>>
>>> Basically we are just making sure that the driver doesn't crash when 
>>> bo->resource is NULL and a bo doesn't have any backing store assigned 
>>> to it.
>>>
>>> The Intel CI seems to be happy with this change, so I'm pretty sure 
>>> it is correct.
>>
>> It looks like DG2/DG1 (which happen to use TTM here) are no longer 
>> loading the module:
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fintel-gfx-ci.01.org%2Ftree%2Fdrm-tip%2FPatchwork_107680v1%2Findex.html&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Caa9bdb0e31064859568708da8a74b899%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637974531164663116%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=UW8BEnIFXHawhAfLUcknGmE88g2wwAiTLAQ3Y5v1pFA%3D&amp;reserved=0?
>>
>> According to the logs the firmware is failing to load, so perhaps 
>> related to I915_BO_ALLOC_CPU_CLEAR, since that is one of the rare 
>> users. See below.
>>
>>>
>>> Thanks,
>>> Christian.
>>>
>>> Am 24.08.22 um 16:23 schrieb Luben Tuikov:
>>>> From: Christian König <christian.koenig@amd.com>
>>>>
>>>> Make sure we can at least move and alloc TT objects without backing 
>>>> store.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 6 ++----
>>>>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 2 +-
>>>>   2 files changed, 3 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>> index bc9c432edffe03..45ce2d1f754cc4 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>> @@ -271,8 +271,6 @@ static struct ttm_tt *i915_ttm_tt_create(struct 
>>>> ttm_buffer_object *bo,
>>>>   {
>>>>       struct drm_i915_private *i915 = container_of(bo->bdev, 
>>>> typeof(*i915),
>>>>                                bdev);
>>>> -    struct ttm_resource_manager *man =
>>>> -        ttm_manager_type(bo->bdev, bo->resource->mem_type);
>>>>       struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>>>>       unsigned long ccs_pages = 0;
>>>>       enum ttm_caching caching;
>>>> @@ -286,8 +284,8 @@ static struct ttm_tt *i915_ttm_tt_create(struct 
>>>> ttm_buffer_object *bo,
>>>>       if (!i915_tt)
>>>>           return NULL;
>>>> -    if (obj->flags & I915_BO_ALLOC_CPU_CLEAR &&
>>>> -        man->use_tt)
>>>> +    if (obj->flags & I915_BO_ALLOC_CPU_CLEAR && bo->resource &&
>>>> +        ttm_manager_type(bo->bdev, bo->resource->mem_type)->use_tt)
>>>>           page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
>>
>> AFAICT i915 was massively relying on everything starting out in a 
>> "dummy" system memory resource (ttm_tt), where it then later 
>> "transitions" to the real resource. And if we need to clear the memory 
>> we rely on ZERO_ALLOC being set before calling into the 
>> i915_ttm_move() callback (even when allocating local-memory).
>>
>> For ttm_bo_type_device objects (userspace stuff) it looks like this 
>> was previously handled by ttm_bo_validate() always doing:
>>
>>   ret = ttm_tt_create(bo, true); /* clear = true */
>>
>> Which we would always hit since the resource was always "compatible" 
>> for the dummy case. But it looks like this is no longer even called, 
>> since we can now call into ttm_move with bo->resource == NULL, which 
>> still calls tt_create eventually, which not always with clear = true.
>>
>> All other objects are then ttm_bo_type_kernel so we don't care about 
>> clearing, except in the rare case of ALLOC_CPU_CLEAR, which was 
>> handled as per above in i915_ttm_tt_create(). But I think here 
>> bo->resource is NULL at the start when first creating the object, 
>> which will skip setting ZERO_ALLOC, which might explain the CI failure.
>>
>> The other possible concern (not sure since CI didn't get that far) is 
>> around ttm_bo_pipeline_gutting(), which now leaves bo->resource = 
>> NULL. It looks like i915_ttm_shrink() was relying on that to 
>> unpopulate the ttm_tt. When later calling ttm_bo_validate(), 
>> i915_ttm_move() would see the SWAPPED flag set on the ttm_tt , 
>> re-populate it and then potentially move it back to local-memory.
>>
>> What are your thoughts here? Also sorry if i915 is making a bit of 
>> mess here.
> 
> First of all thanks a lot for taking a look. We previously got reports 
> about strange crashes with this patch, but couldn't really reproduce 
> them (even not by sending them out again). This explains that a bit.
> 
> The simplest solution would be to just change the && into a ||, e.g. 
> when previously either no resource is allocated or the resource requires 
> to use a tt we clear it.
> 
> That should give you the same behavior as before, but I agree that this 
> is a bit messy.

Yeah, that should do the trick.

That hopefully just leaves i915_ttm_shrink(), which is swapping out 
shmem ttm_tt and is calling ttm_bo_validate() with empty placements to 
force the pipeline-gutting path, which importantly unpopulates the 
ttm_tt for us (since ttm_tt_unpopulate is not exported it seems). But 
AFAICT it looks like that will now also nuke the bo->resource, instead 
of just leaving it in system memory. My assumption is that when later 
calling ttm_bo_validate(), it will just do the bo_move_null() in 
i915_ttm_move(), instead of re-populating the ttm_tt and then 
potentially copying it back to local-memory?

> 
> I've been considering to replacing the ttm_bo_type with a bunch of 
> behavior flags for a bo. I'm hoping that this will clean things up a bit.
> 
> Regards,
> Christian.
> 
>>
>>>>       caching = i915_ttm_select_tt_caching(obj);
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c 
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>> index 9a7e50534b84bb..c420d1ab605b6f 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>> @@ -560,7 +560,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, 
>>>> bool evict,
>>>>       bool clear;
>>>>       int ret;
>>>> -    if (GEM_WARN_ON(!obj)) {
>>>> +    if (GEM_WARN_ON(!obj) || !bo->resource) {
>>>>           ttm_bo_move_null(bo, dst_mem);
>>>>           return 0;
>>>>       }
>>>
> 
