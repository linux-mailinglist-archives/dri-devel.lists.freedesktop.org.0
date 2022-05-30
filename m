Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E67EB538683
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 19:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1319B10F177;
	Mon, 30 May 2022 17:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB2810F16D;
 Mon, 30 May 2022 17:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653930311; x=1685466311;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zIXjxULTglrK6wOg8sEfr+qLEcpHGeXA7PkcPJbOx1Q=;
 b=TAlxxceD1nbBKsPN6hPPvNh353F8H6RSDIwWGxQQH2E8talgvEIPxl+d
 T7wtyW26sOsgqpC1dUqO9G4BV2NomNwkDcssDqqxKx1ukfTYXx9wpXdSN
 wu8PUt31Ne4wJeoGBHH3HDeLthxJh9omR/eIX8LXlmrsfbsyZdGOa7mW/
 PHJ4mhyYz+aNsp8kzriIthkZQzVve5Qgw94SM7JSuUR0bU/c+QUJ7SpBx
 D1xwPj0i+PNbUGiOrk6ddQ/GXTterwnFZih0t7/s6BFoquh2F8y3V6OWn
 zoBKKhlm01+KgnnMSjTbcgA6fe9AUlNSfjDwOyyO6WMaiacFPO/xxCaxC A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="361422467"
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; d="scan'208";a="361422467"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 10:05:10 -0700
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; d="scan'208";a="632686971"
Received: from dairecol-mobl2.ger.corp.intel.com (HELO [10.213.233.68])
 ([10.213.233.68])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 10:05:08 -0700
Message-ID: <9bc69924-1da1-d756-40d4-d88aaab689c1@intel.com>
Date: Mon, 30 May 2022 18:05:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 03/10] drm/i915/uapi: expose the avail tracking
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220525184337.491763-1-matthew.auld@intel.com>
 <20220525184337.491763-4-matthew.auld@intel.com>
 <db5b82b1-4eb0-0d26-eaa8-b814b0de4dc0@linux.intel.com>
 <4acbf57d-fe19-8e6a-2521-5557bf842e54@intel.com>
 <c9affa00-1d47-094a-4b21-bdd1522c02c7@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <c9affa00-1d47-094a-4b21-bdd1522c02c7@linux.intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/05/2022 09:33, Tvrtko Ursulin wrote:
> 
> On 26/05/2022 09:10, Matthew Auld wrote:
>> On 26/05/2022 08:58, Tvrtko Ursulin wrote:
>>>
>>> On 25/05/2022 19:43, Matthew Auld wrote:
>>>> Vulkan would like to have a rough measure of how much device memory can
>>>> in theory be allocated. Also add unallocated_cpu_visible_size to track
>>>> the visible portion, in case the device is using small BAR.
>>>
>>> I have concerns here that it isn't useful and could even be 
>>> counter-productive. If we give unprivileged access it may be 
>>> considered a side channel, but if we "lie" (report total region size) 
>>> to unprivileged clients (like in this patch), then they don't 
>>> co-operate well and end trashing.
>>>
>>> Is Vulkan really sure it wants this and why?
>>
>> Lionel pointed out: 
>> https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VK_EXT_memory_budget.html 
> 
> 
> So this query would provide 
> VkPhysicalDeviceMemoryBudgetPropertiesEXT::heapBudget. Apart that it 
> wouldn't since we thought to lie. And apart that it's text says:
> 
> """
> ...how much total memory from each heap the current process can use at 
> any given time, before allocations may start failing or causing 
> performance degradation. The values may change based on other activity 
> in the system that is outside the scope and control of the Vulkan 
> implementation.
> """
> 
> It acknowledges itself in the second sentence that the first sentence is 
> questionable.
> 
> And VkPhysicalDeviceMemoryBudgetPropertiesEXT::heapUsage would be still 
> missing and would maybe come via fdinfo? Or you plan to add it to this 
> same query later?

IIUC the heapUsage is something like per app usage, which already looks 
to be tracked in anv, although I don't think it knows if stuff is 
actually resident or not. The heapBudget looks to then be roughly the 
heapUsage + info.unallocated.

> 
> I like to source knowledge of best practices from the long established 
> world of CPU scheduling and process memory management. Is anyone aware 
> of this kind of techniques there - applications actively looking at free 
> memory data from /proc/meminfo and dynamically adjusting their runtime 
> behaviour based on it? And that they are not single application on a 
> dedicated system type of things.
> 
> Or perhaps this Vk extension is envisaged for exactly those kind of 
> scenarios? However if so then userspace can know all this data from 
> probed size and the data set it created.
> 
>> Also note that the existing behaviour was to lie. I'm not sure what's 
>> the best option here.
> 
> Uapi reserved -1 for unknown so we could do that?

AFAICT we can do that for the info.unallocated_cpu_visible, but not for 
the existing info.unallocated without maybe breaking something?

> 
> Regards,
> 
> Tvrtko
> 
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> Testcase: igt@i915_query@query-regions-unallocated
>>>> Testcase: igt@i915_query@query-regions-sanity-check
>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>>> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> Cc: Jordan Justen <jordan.l.justen@intel.com>
>>>> Cc: Kenneth Graunke <kenneth@whitecape.org>
>>>> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/i915_query.c             | 10 +++++-
>>>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 20 ++++++++++++
>>>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |  3 ++
>>>>   drivers/gpu/drm/i915/intel_memory_region.c    | 14 +++++++++
>>>>   drivers/gpu/drm/i915/intel_memory_region.h    |  3 ++
>>>>   include/uapi/drm/i915_drm.h                   | 31 
>>>> ++++++++++++++++++-
>>>>   6 files changed, 79 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/i915_query.c 
>>>> b/drivers/gpu/drm/i915/i915_query.c
>>>> index 9aa0b28aa6ee..e095c55f4d4b 100644
>>>> --- a/drivers/gpu/drm/i915/i915_query.c
>>>> +++ b/drivers/gpu/drm/i915/i915_query.c
>>>> @@ -502,7 +502,15 @@ static int query_memregion_info(struct 
>>>> drm_i915_private *i915,
>>>>           else
>>>>               info.probed_cpu_visible_size = mr->total;
>>>> -        info.unallocated_size = mr->avail;
>>>> +        if (perfmon_capable()) {
>>>> +            intel_memory_region_avail(mr,
>>>> +                          &info.unallocated_size,
>>>> +                          &info.unallocated_cpu_visible_size);
>>>> +        } else {
>>>> +            info.unallocated_size = info.probed_size;
>>>> +            info.unallocated_cpu_visible_size =
>>>> +                info.probed_cpu_visible_size;
>>>> +        }
>>>>           if (__copy_to_user(info_ptr, &info, sizeof(info)))
>>>>               return -EFAULT;
>>>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c 
>>>> b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>>>> index a5109548abc0..aa5c91e44438 100644
>>>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>>>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>>>> @@ -365,6 +365,26 @@ u64 i915_ttm_buddy_man_visible_size(struct 
>>>> ttm_resource_manager *man)
>>>>       return bman->visible_size;
>>>>   }
>>>> +/**
>>>> + * i915_ttm_buddy_man_visible_size - Query the avail tracking for 
>>>> the manager.
>>>> + *
>>>> + * @man: The buddy allocator ttm manager
>>>> + * @avail: The total available memory in pages for the entire manager.
>>>> + * @visible_avail: The total available memory in pages for the CPU 
>>>> visible
>>>> + * portion. Note that this will always give the same value as 
>>>> @avail on
>>>> + * configurations that don't have a small BAR.
>>>> + */
>>>> +void i915_ttm_buddy_man_avail(struct ttm_resource_manager *man,
>>>> +                 u64 *avail, u64 *visible_avail)
>>>> +{
>>>> +    struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>>> +
>>>> +    mutex_lock(&bman->lock);
>>>> +    *avail = bman->mm.avail >> PAGE_SHIFT;
>>>> +    *visible_avail = bman->visible_avail;
>>>> +    mutex_unlock(&bman->lock);
>>>> +}
>>>> +
>>>>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>>>>   void i915_ttm_buddy_man_force_visible_size(struct 
>>>> ttm_resource_manager *man,
>>>>                          u64 size)
>>>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h 
>>>> b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>>>> index 52d9586d242c..d64620712830 100644
>>>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>>>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>>>> @@ -61,6 +61,9 @@ int i915_ttm_buddy_man_reserve(struct 
>>>> ttm_resource_manager *man,
>>>>   u64 i915_ttm_buddy_man_visible_size(struct ttm_resource_manager 
>>>> *man);
>>>> +void i915_ttm_buddy_man_avail(struct ttm_resource_manager *man,
>>>> +                  u64 *avail, u64 *avail_visible);
>>>> +
>>>>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>>>>   void i915_ttm_buddy_man_force_visible_size(struct 
>>>> ttm_resource_manager *man,
>>>>                          u64 size);
>>>> diff --git a/drivers/gpu/drm/i915/intel_memory_region.c 
>>>> b/drivers/gpu/drm/i915/intel_memory_region.c
>>>> index e38d2db1c3e3..94ee26e99549 100644
>>>> --- a/drivers/gpu/drm/i915/intel_memory_region.c
>>>> +++ b/drivers/gpu/drm/i915/intel_memory_region.c
>>>> @@ -279,6 +279,20 @@ void intel_memory_region_set_name(struct 
>>>> intel_memory_region *mem,
>>>>       va_end(ap);
>>>>   }
>>>> +void intel_memory_region_avail(struct intel_memory_region *mr,
>>>> +                   u64 *avail, u64 *visible_avail)
>>>> +{
>>>> +    if (mr->type == INTEL_MEMORY_LOCAL) {
>>>> +        i915_ttm_buddy_man_avail(mr->region_private,
>>>> +                     avail, visible_avail);
>>>> +        *avail <<= PAGE_SHIFT;
>>>> +        *visible_avail <<= PAGE_SHIFT;
>>>> +    } else {
>>>> +        *avail = mr->total;
>>>> +        *visible_avail = mr->total;
>>>> +    }
>>>> +}
>>>> +
>>>>   void intel_memory_region_destroy(struct intel_memory_region *mem)
>>>>   {
>>>>       int ret = 0;
>>>> diff --git a/drivers/gpu/drm/i915/intel_memory_region.h 
>>>> b/drivers/gpu/drm/i915/intel_memory_region.h
>>>> index 3d8378c1b447..2214f251bec3 100644
>>>> --- a/drivers/gpu/drm/i915/intel_memory_region.h
>>>> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
>>>> @@ -127,6 +127,9 @@ int intel_memory_region_reserve(struct 
>>>> intel_memory_region *mem,
>>>>   void intel_memory_region_debug(struct intel_memory_region *mr,
>>>>                      struct drm_printer *printer);
>>>> +void intel_memory_region_avail(struct intel_memory_region *mr,
>>>> +                   u64 *avail, u64 *visible_avail);
>>>> +
>>>>   struct intel_memory_region *
>>>>   i915_gem_ttm_system_setup(struct drm_i915_private *i915,
>>>>                 u16 type, u16 instance);
>>>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>>> index 9df419a45244..e30f31a440b3 100644
>>>> --- a/include/uapi/drm/i915_drm.h
>>>> +++ b/include/uapi/drm/i915_drm.h
>>>> @@ -3228,7 +3228,15 @@ struct drm_i915_memory_region_info {
>>>>        */
>>>>       __u64 probed_size;
>>>> -    /** @unallocated_size: Estimate of memory remaining (-1 = 
>>>> unknown) */
>>>> +    /**
>>>> +     * @unallocated_size: Estimate of memory remaining (-1 = unknown)
>>>> +     *
>>>> +     * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable 
>>>> accounting.
>>>> +     * Without this (or if this is an older kernel) the value here 
>>>> will
>>>> +     * always equal the @probed_size. Note this is only currently 
>>>> tracked
>>>> +     * for I915_MEMORY_CLASS_DEVICE regions (for other types the 
>>>> value here
>>>> +     * will always equal the @probed_size).
>>>> +     */
>>>>       __u64 unallocated_size;
>>>>       union {
>>>> @@ -3262,6 +3270,27 @@ struct drm_i915_memory_region_info {
>>>>                * @probed_size.
>>>>                */
>>>>               __u64 probed_cpu_visible_size;
>>>> +
>>>> +            /**
>>>> +             * @unallocated_cpu_visible_size: Estimate of CPU
>>>> +             * visible memory remaining (-1 = unknown).
>>>> +             *
>>>> +             * Note this is only tracked for
>>>> +             * I915_MEMORY_CLASS_DEVICE regions (for other types the
>>>> +             * value here will always equal the
>>>> +             * @probed_cpu_visible_size).
>>>> +             *
>>>> +             * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
>>>> +             * accounting.  Without this the value here will always
>>>> +             * equal the @probed_cpu_visible_size. Note this is only
>>>> +             * currently tracked for I915_MEMORY_CLASS_DEVICE
>>>> +             * regions (for other types the value here will also
>>>> +             * always equal the @probed_cpu_visible_size).
>>>> +             *
>>>> +             * If this is an older kernel the value here will be
>>>> +             * zero, see also @probed_cpu_visible_size.
>>>> +             */
>>>> +            __u64 unallocated_cpu_visible_size;
>>>>           };
>>>>       };
>>>>   };
