Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FCA3B5B75
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 11:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647926E3C4;
	Mon, 28 Jun 2021 09:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4916E3B7;
 Mon, 28 Jun 2021 09:38:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="271778926"
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="271778926"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 02:38:05 -0700
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="454450822"
Received: from danielmi-mobl2.ger.corp.intel.com (HELO [10.249.254.242])
 ([10.249.254.242])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 02:38:03 -0700
Subject: Re: [PATCH v2 2/2] drm/i915/gem: only allow WB for smem only
 placements
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210625122751.590289-1-matthew.auld@intel.com>
 <20210625122751.590289-2-matthew.auld@intel.com>
 <b6ee3701-2662-315c-3c2a-c4d92623fbbc@linux.intel.com>
 <a7722f16-2f7b-b213-8a2d-27d5f02d893f@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <d19caf7e-ed3b-5cfe-632a-46536aac03f4@linux.intel.com>
Date: Mon, 28 Jun 2021 11:38:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a7722f16-2f7b-b213-8a2d-27d5f02d893f@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/28/21 11:12 AM, Matthew Auld wrote:
> On 28/06/2021 08:41, Thomas Hellström wrote:
>>
>> On 6/25/21 2:27 PM, Matthew Auld wrote:
>>> We only support single mode and this should be immutable. For smem only
>>> placements on DGFX this should be WB. On DG1 everything is snooped,
>>> always, and so should be coherent.
>>>
>>> I915_GEM_DOMAIN_GTT looks like it's for the aperture which is now gone
>>> for DGFX, so hopefully can also be safely rejected.
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_domain.c |  7 +++++++
>>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c   | 10 ++++++++++
>>>   2 files changed, 17 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
>>> index d0c91697bb22..e3459a524e64 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
>>> @@ -577,6 +577,13 @@ i915_gem_set_domain_ioctl(struct drm_device 
>>> *dev, void *data,
>>>           goto out_unpin;
>>>       }
>>> +    if (IS_DGFX(to_i915(obj->base.dev)) && obj->mm.n_placements == 
>>> 1 &&
>>> +        i915_gem_object_placements_contain_type(obj, 
>>> INTEL_MEMORY_SYSTEM) &&
>>> +        read_domains != I915_GEM_DOMAIN_CPU) {
>>> +        err = -EINVAL;
>>> +        goto out_unpin;
>>> +    }
>>> +
>>>       if (read_domains & I915_GEM_DOMAIN_WC)
>>>           err = i915_gem_object_set_to_wc_domain(obj, write_domain);
>>>       else if (read_domains & I915_GEM_DOMAIN_GTT)
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>> index f3586b36dd53..afc9f3dc38b9 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>> @@ -673,6 +673,7 @@ __assign_mmap_offset(struct drm_i915_gem_object 
>>> *obj,
>>>                enum i915_mmap_type mmap_type,
>>>                u64 *offset, struct drm_file *file)
>>>   {
>>> +    struct drm_i915_private *i915 = to_i915(obj->base.dev);
>>>       struct i915_mmap_offset *mmo;
>>>       if (i915_gem_object_never_mmap(obj))
>>> @@ -697,6 +698,15 @@ __assign_mmap_offset(struct drm_i915_gem_object 
>>> *obj,
>>>           i915_gem_object_placements_contain_type(obj, 
>>> INTEL_MEMORY_LOCAL))
>>>           return -ENODEV;
>>> +    /*
>>> +     * For smem only placements on DGFX we need to default to WB. 
>>> On DG1
>>> +     * everything is snooped always, so should always be coherent.
>>> +     */
>>> +     if (IS_DGFX(i915) &&
>>> +         mmap_type != I915_MMAP_TYPE_WB && obj->mm.n_placements == 
>>> 1 &&
>>> +         i915_gem_object_placements_contain_type(obj, 
>>> INTEL_MEMORY_SYSTEM))
>>> +        return -ENODEV;
>>> +
>>
>> Same thing here as in the previous patch.
>>
>> Also do we need to modify i915_coherent_map_type() to also include 
>> HAS_SNOOP()?
>>
>> While we're at it, that "always_coherent" argument to 
>> i915_coherent_map_type() appears scary to me and probably needs some 
>> documentation. It seems used for page-tables. Is it because we know 
>> those are always snooped?
>
> Yeah, it's either because the caller has/will mark the pages as 
> coherent(which translates to some special ppGTT bits), or we manually 
> flush ourselves. In i915_coherent_map_type() we should account for DG1 
> somehow.
>
> Historically I don't think we enabled snooping by default since it's 
> considered slow compared to shared LLC. On DG1 this is a different 
> story though.
>
> Also the pin_map() interface is pretty much only for kernel internal 
> objects, so I don't think we have any users which try to map userspace 
> objects with that interface. Ok, except for vm_access it seems, but 
> that should hopefully be a simple fix to use the correct caching mode? 
> We can maybe add some sanity checking there if someone tries to map a 
> userspace object?
I'm not fully sure that's sufficient, see below.
>
> For all the other callers of pin_map() which should all be kernel 
> internal do we still need to force WB for system memory? By design we 
> only support a single mm.mapping there. For lmem we already use WC only.

We're only allowed to map with the same caching mode as the linear 
kernel mapping for discrete. Otherwise things may blow up on non-intel 
architectures. We can probably update 195_ttm_select_tt_caching to 
always use WB for system pages for kernel objects, but then we must make 
sure we don't try to map these WC.

/Thomas


>
>>
>> /Thomas
>>
>>
>>>       mmo = mmap_offset_attach(obj, mmap_type, file);
>>>       if (IS_ERR(mmo))
>>>           return PTR_ERR(mmo);
