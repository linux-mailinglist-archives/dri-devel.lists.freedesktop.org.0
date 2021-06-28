Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5DC3B5B05
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 11:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9034F6E30D;
	Mon, 28 Jun 2021 09:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA846E30D;
 Mon, 28 Jun 2021 09:12:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="293553325"
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="293553325"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 02:12:27 -0700
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="419097773"
Received: from vipulcha-mobl.ger.corp.intel.com (HELO [10.213.225.54])
 ([10.213.225.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 02:12:25 -0700
Subject: Re: [PATCH v2 2/2] drm/i915/gem: only allow WB for smem only
 placements
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20210625122751.590289-1-matthew.auld@intel.com>
 <20210625122751.590289-2-matthew.auld@intel.com>
 <b6ee3701-2662-315c-3c2a-c4d92623fbbc@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <a7722f16-2f7b-b213-8a2d-27d5f02d893f@intel.com>
Date: Mon, 28 Jun 2021 10:12:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b6ee3701-2662-315c-3c2a-c4d92623fbbc@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/06/2021 08:41, Thomas Hellström wrote:
> 
> On 6/25/21 2:27 PM, Matthew Auld wrote:
>> We only support single mode and this should be immutable. For smem only
>> placements on DGFX this should be WB. On DG1 everything is snooped,
>> always, and so should be coherent.
>>
>> I915_GEM_DOMAIN_GTT looks like it's for the aperture which is now gone
>> for DGFX, so hopefully can also be safely rejected.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_domain.c |  7 +++++++
>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c   | 10 ++++++++++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
>> index d0c91697bb22..e3459a524e64 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
>> @@ -577,6 +577,13 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, 
>> void *data,
>>           goto out_unpin;
>>       }
>> +    if (IS_DGFX(to_i915(obj->base.dev)) && obj->mm.n_placements == 1 &&
>> +        i915_gem_object_placements_contain_type(obj, 
>> INTEL_MEMORY_SYSTEM) &&
>> +        read_domains != I915_GEM_DOMAIN_CPU) {
>> +        err = -EINVAL;
>> +        goto out_unpin;
>> +    }
>> +
>>       if (read_domains & I915_GEM_DOMAIN_WC)
>>           err = i915_gem_object_set_to_wc_domain(obj, write_domain);
>>       else if (read_domains & I915_GEM_DOMAIN_GTT)
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> index f3586b36dd53..afc9f3dc38b9 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> @@ -673,6 +673,7 @@ __assign_mmap_offset(struct drm_i915_gem_object *obj,
>>                enum i915_mmap_type mmap_type,
>>                u64 *offset, struct drm_file *file)
>>   {
>> +    struct drm_i915_private *i915 = to_i915(obj->base.dev);
>>       struct i915_mmap_offset *mmo;
>>       if (i915_gem_object_never_mmap(obj))
>> @@ -697,6 +698,15 @@ __assign_mmap_offset(struct drm_i915_gem_object 
>> *obj,
>>           i915_gem_object_placements_contain_type(obj, 
>> INTEL_MEMORY_LOCAL))
>>           return -ENODEV;
>> +    /*
>> +     * For smem only placements on DGFX we need to default to WB. On DG1
>> +     * everything is snooped always, so should always be coherent.
>> +     */
>> +     if (IS_DGFX(i915) &&
>> +         mmap_type != I915_MMAP_TYPE_WB && obj->mm.n_placements == 1 &&
>> +         i915_gem_object_placements_contain_type(obj, 
>> INTEL_MEMORY_SYSTEM))
>> +        return -ENODEV;
>> +
> 
> Same thing here as in the previous patch.
> 
> Also do we need to modify i915_coherent_map_type() to also include 
> HAS_SNOOP()?
> 
> While we're at it, that "always_coherent" argument to 
> i915_coherent_map_type() appears scary to me and probably needs some 
> documentation. It seems used for page-tables. Is it because we know 
> those are always snooped?

Yeah, it's either because the caller has/will mark the pages as 
coherent(which translates to some special ppGTT bits), or we manually 
flush ourselves. In i915_coherent_map_type() we should account for DG1 
somehow.

Historically I don't think we enabled snooping by default since it's 
considered slow compared to shared LLC. On DG1 this is a different story 
though.

Also the pin_map() interface is pretty much only for kernel internal 
objects, so I don't think we have any users which try to map userspace 
objects with that interface. Ok, except for vm_access it seems, but that 
should hopefully be a simple fix to use the correct caching mode? We can 
maybe add some sanity checking there if someone tries to map a userspace 
object?

For all the other callers of pin_map() which should all be kernel 
internal do we still need to force WB for system memory? By design we 
only support a single mm.mapping there. For lmem we already use WC only.

> 
> /Thomas
> 
> 
>>       mmo = mmap_offset_attach(obj, mmap_type, file);
>>       if (IS_ERR(mmo))
>>           return PTR_ERR(mmo);
