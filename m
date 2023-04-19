Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D136E7B83
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 16:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E39510E1A8;
	Wed, 19 Apr 2023 14:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB32610E1A8;
 Wed, 19 Apr 2023 14:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681913196; x=1713449196;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zygMLAtbXDmnY/ceGv5NNzBaSf/3MmT3pfChl+j536o=;
 b=L3w3lBV37gtR0d7kawrPvgJokSWPTFRRkpd0Ndl48iAqGXYZ/yC2L9N5
 BlQ/hDWErY+yjvChGt9oQsnL7bEN9zMpKwl0INOB5bIagH/hvbnwMhszh
 GRMj47hBfcaG7dsqm6IUSSWeJUCwYjAy6mDlup3a+UMpHYH8ekLuMeGmI
 IWGgnGrqEPit1USu0xk6A2Q3GS6De7rLcUEuW7wavHbxfvnqy7kjXmFyS
 ZnYCq+LNV7Ku65ZvcU8pda6jCzy+njfcXDYYtotGqUYqnITv71THMMcBK
 Wqc4u2hREsM/Sck6xtuP+0Xf4RcQVXN+1N/OwZtXWU8RcWtmsMdTbC9Ot A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="408364639"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="408364639"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 07:06:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="802930070"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="802930070"
Received: from halahusx-mobl.ger.corp.intel.com (HELO [10.213.223.36])
 ([10.213.223.36])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 07:06:33 -0700
Message-ID: <b7dfb4a6-6636-42d0-ef6f-b8458c856c6a@linux.intel.com>
Date: Wed, 19 Apr 2023 15:06:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC 6/6] drm/i915: Implement fdinfo memory stats printing
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
 <20230417155613.4143258-7-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGuKovR_VL2UwyRddZ_d-AmZK3usC2zJ3Lb=sq-kN6EmAQ@mail.gmail.com>
 <a83f4f2c-f745-cb50-e05a-86862ab0ea96@linux.intel.com>
 <CAF6AEGudH15abZqM04Vb92-LCNt4=x7PNBbbP8LHu+SH83LURQ@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGudH15abZqM04Vb92-LCNt4=x7PNBbbP8LHu+SH83LURQ@mail.gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/04/2023 17:08, Rob Clark wrote:
> On Tue, Apr 18, 2023 at 7:58 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>> On 18/04/2023 15:39, Rob Clark wrote:
>>> On Mon, Apr 17, 2023 at 8:56 AM Tvrtko Ursulin
>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> Show how more driver specific set of memory stats could be shown,
>>>> more specifically where object can reside in multiple regions, showing all
>>>> the supported stats, and where there is more to show than just user visible
>>>> objects.
>>>>
>>>> WIP...
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/i915_driver.c     |   5 ++
>>>>    drivers/gpu/drm/i915/i915_drm_client.c | 102 +++++++++++++++++++++++++
>>>>    drivers/gpu/drm/i915/i915_drm_client.h |   8 ++
>>>>    drivers/gpu/drm/i915/i915_drv.h        |   2 +
>>>>    4 files changed, 117 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>>>> index 6493548c69bf..4c70206cbc27 100644
>>>> --- a/drivers/gpu/drm/i915/i915_driver.c
>>>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>>>> @@ -1806,6 +1806,11 @@ static const struct drm_driver i915_drm_driver = {
>>>>           .dumb_create = i915_gem_dumb_create,
>>>>           .dumb_map_offset = i915_gem_dumb_mmap_offset,
>>>>
>>>> +#ifdef CONFIG_PROC_FS
>>>> +       .query_fdinfo_memory_regions = i915_query_fdinfo_memory_regions,
>>>> +       .query_fdinfo_memory_stats = i915_query_fdinfo_memory_stats,
>>>> +#endif
>>>> +
>>>>           .ioctls = i915_ioctls,
>>>>           .num_ioctls = ARRAY_SIZE(i915_ioctls),
>>>>           .fops = &i915_driver_fops,
>>>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
>>>> index c654984189f7..65857c68bdb3 100644
>>>> --- a/drivers/gpu/drm/i915/i915_drm_client.c
>>>> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
>>>> @@ -12,6 +12,7 @@
>>>>    #include <drm/drm_print.h>
>>>>
>>>>    #include "gem/i915_gem_context.h"
>>>> +#include "intel_memory_region.h"
>>>>    #include "i915_drm_client.h"
>>>>    #include "i915_file_private.h"
>>>>    #include "i915_gem.h"
>>>> @@ -112,4 +113,105 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>>>>           for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++)
>>>>                   show_client_class(p, i915, file_priv->client, i);
>>>>    }
>>>> +
>>>> +char **
>>>> +i915_query_fdinfo_memory_regions(struct drm_device *dev, unsigned int *num)
>>>> +{
>>>> +       struct drm_i915_private *i915 = to_i915(dev);
>>>> +       struct intel_memory_region *mr;
>>>> +       enum intel_region_id id;
>>>> +
>>>> +       /* FIXME move to init */
>>>> +       for_each_memory_region(mr, i915, id) {
>>>> +               if (!i915->mm.region_names[id])
>>>> +                       i915->mm.region_names[id] = mr->name;
>>>> +       }
>>>> +
>>>> +       *num = id;
>>>> +
>>>> +       return i915->mm.region_names;
>>>> +}
>>>> +
>>>> +static void
>>>> +add_obj(struct drm_i915_gem_object *obj, struct drm_fdinfo_memory_stat *stats)
>>>> +{
>>>> +        struct intel_memory_region *mr;
>>>> +       u64 sz = obj->base.size;
>>>> +        enum intel_region_id id;
>>>> +       unsigned int i;
>>>> +
>>>> +       if (!obj)
>>>> +               return;
>>>> +
>>>> +       /* Attribute size and shared to all possible memory regions. */
>>>> +       for (i = 0; i < obj->mm.n_placements; i++) {
>>>> +               mr = obj->mm.placements[i];
>>>> +               id = mr->id;
>>>> +
>>>> +               stats[id].size += sz;
>>>
>>> This implies that summing up all of the categories is not the same as
>>> the toplevel stats that I was proposing
> 
> Sorry, I mis-spoke, I meant "summing up all of the regions is not..."

Ah okay. It could be made like that yes.

I wasn't sure what would be more useful for drivers which support memory 
regions. To see how much memory file could be using worst case, or 
strictly how much it is currently using. So for buffer objects where 
userspace allows kernel to choose the region from a supplied list, I 
thought it would be useful to show that in total size against all 
possible regions.

In a way you see this driver /could/ be using 1G in vram and 1G in 
system, but currently it only has resident 1G in vram. Or you see 
another file which has 1G vram size and 1G resident size and you can 
infer some things.

Perhaps that can be confusing and it would be better to let total size 
migrate between regions at runtime as does resident and other 
categories. But then the total size per region would change at runtime 
influenced by other app activity (as driver is transparently migrating 
buffers between regions). Which can also be very confusing, it would 
appear as if the app is creating/freeing objects when it isn't.
>> Correct, my categories are a bit different. You had private and shared as two mutually exclusive buckets, and then resident as subset of either/both. I have size as analogue to VmSize and resident as a subset of that, analogue to VmRss.
>>
> 
> I split shared because by definition shared buffers can be counted
> against multiple drm_file's, whereas private is only counted against
> the single drm_file.  Driver or app changes are unlikely to change the
> shared size, whereas private footprint is a thing you can optimize to
> some degree.
 >
>> Shared is a bit wishy-washy, not sure about that one in either proposals. It can be either imported or exported buffers, but in essence I think it fits better as a subset of total size.
> 
> Imported vs exported doesn't really matter.. it is just an
> implementation detail of the winsys.  But I think it is useful to know
> how much of an app's footprint is shared vs private.  You could
> express it different ways, but my proposal had private and shared,
> from which you can calculate total:
> 
>     total = private + shared
> 
> but you could flip the path around and advertise just total and
> shared, and calculate private from that.

Yeah I am not sure. My gut feeling was that stable "top level" size is 
the best option. Aka "this is how much this file could be using worst case".

If shared for file A can drop once file B closes the object it 
previously imported from A, I think that could be confusing. Because A 
did nothing - it is not suddenly using more private memory (hasn't 
allocated anything) nor has closed any shared memory objects.

And on a tangent, but what about shared vs private stats when we have 
userptr object created from shared memory? Core cannot really untangle 
those. Or the memory allocated for other than buffer objects as I argue 
in the cover letter.

Regards,

Tvrtko
