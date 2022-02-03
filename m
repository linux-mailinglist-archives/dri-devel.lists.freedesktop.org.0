Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A27274A8342
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 12:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8CC10F2BE;
	Thu,  3 Feb 2022 11:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC2210F2BE;
 Thu,  3 Feb 2022 11:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643888301; x=1675424301;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qtwebsNDn3JSOqii7VlCgdGg9Igsedo07JZe2aMFruo=;
 b=SsB36y93S1lni9ccbtMyq8Wd+Z3LLIQMUI2vzP5YlyVOQ/bUlUutmyfC
 yhEufF41CgpB6ElaNYcIf2pm7wEbXRfEVQ5xOFSq0hT1s9upMBL0vAO8F
 cEiDqWIG9GpOgbRvPFzDRIrzM4uIWAH/mwmrcCy903I1PnWQFerQJuekk
 Cj1wtMmzdTUAROagW+JzozYF9r3vaL1kTE6iZQ02b3hL+ILwKpu7kcuFJ
 pVRACo9UJ8uW1+cmrKhDch726QOOAbfxxqHyNsuThiZ8XHp1MPPvt+n+m
 7C0HV6YzSC2PGPmlpRaLuxuu0nM0QMa/YK1XuPfLbOQxU+/52ILDL4hCT A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="247891807"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="247891807"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 03:38:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="627409335"
Received: from blovejoy-mobl.ger.corp.intel.com (HELO [10.252.16.183])
 ([10.252.16.183])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 03:38:19 -0800
Message-ID: <79378fce-e917-f5f7-d133-92b73a0e7b91@intel.com>
Date: Thu, 3 Feb 2022 11:38:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 17/20] drm/i915/uapi: add NEEDS_CPU_ACCESS hint
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, "Bloomfield, Jon" <jon.bloomfield@intel.com>
References: <20220126152155.3070602-1-matthew.auld@intel.com>
 <20220126152155.3070602-18-matthew.auld@intel.com>
 <e9007965-a122-9f4d-e0fd-cfd2a8e1fb3d@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <e9007965-a122-9f4d-e0fd-cfd2a8e1fb3d@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/02/2022 09:28, Thomas Hellström wrote:
> 
> On 1/26/22 16:21, Matthew Auld wrote:
>> If set, force the allocation to be placed in the mappable portion of
>> LMEM. One big restriction here is that system memory must be given as a
>> potential placement for the object, that way we can always spill the
>> object into system memory if we can't make space.
>>
>> XXX: Still very much WIP and needs IGTs. Including now just for the sake
>> of having more complete picture.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_create.c | 28 ++++++++++++-------
>>   include/uapi/drm/i915_drm.h                | 31 +++++++++++++++++++++-
>>   2 files changed, 49 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> index e7456443f163..98d63cb21e94 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> @@ -238,6 +238,7 @@ struct create_ext {
>>       struct drm_i915_private *i915;
>>       struct intel_memory_region *placements[INTEL_REGION_UNKNOWN];
>>       unsigned int n_placements;
>> +    unsigned int placement_mask;
>>       unsigned long flags;
>>   };
>> @@ -334,6 +335,7 @@ static int set_placements(struct 
>> drm_i915_gem_create_ext_memory_regions *args,
>>       for (i = 0; i < args->num_regions; i++)
>>           ext_data->placements[i] = placements[i];
>> +    ext_data->placement_mask = mask;
>>       return 0;
>>   out_dump:
>> @@ -408,7 +410,7 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, 
>> void *data,
>>       struct drm_i915_gem_object *obj;
>>       int ret;
>> -    if (args->flags)
>> +    if (args->flags & ~I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS)
>>           return -EINVAL;
>>       ret = i915_user_extensions(u64_to_user_ptr(args->extensions),
>> @@ -424,14 +426,22 @@ i915_gem_create_ext_ioctl(struct drm_device 
>> *dev, void *data,
>>           ext_data.n_placements = 1;
>>       }
>> -    /*
>> -     * TODO: add a userspace hint to force CPU_ACCESS for the object, 
>> which
>> -     * can override this.
>> -     */
>> -    if (!IS_DG1(i915) && (ext_data.n_placements > 1 ||
>> -                  ext_data.placements[0]->type !=
>> -                  INTEL_MEMORY_SYSTEM))
>> -        ext_data.flags |= I915_BO_ALLOC_TOPDOWN;
>> +    if (args->flags & I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS) {
>> +        if (ext_data.n_placements == 1)
>> +            return -EINVAL;
>> +
>> +        /*
>> +         * We always need to be able to spill to system memory, if we
>> +         * can't place in the mappable part of LMEM.
>> +         */
>> +        if (!(ext_data.placement_mask & BIT(INTEL_REGION_SMEM)))
>> +            return -EINVAL;
>> +    } else {
>> +        if (!IS_DG1(i915) && (ext_data.n_placements > 1 ||
>> +                      ext_data.placements[0]->type !=
>> +                      INTEL_MEMORY_SYSTEM))
>> +            ext_data.flags |= I915_BO_ALLOC_TOPDOWN;
>> +    }
>>       obj = __i915_gem_object_create_user_ext(i915, args->size,
>>                           ext_data.placements,
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 914ebd9290e5..ecfa805549a7 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -3157,7 +3157,36 @@ struct drm_i915_gem_create_ext {
>>        * Object handles are nonzero.
>>        */
>>       __u32 handle;
>> -    /** @flags: MBZ */
>> +    /**
>> +     * @flags: Optional flags.
>> +     *
>> +     * Supported values:
>> +     *
>> +     * I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS - Signal to the 
>> kernel that
>> +     * the object will need to be accessed via the CPU.
>> +     *
>> +     * Only valid when placing objects in I915_MEMORY_CLASS_DEVICE, and
>> +     * only strictly required on platforms where only some of the device
>> +     * memory is directly visible or mappable through the CPU, like 
>> on DG2+.
>> +     *
>> +     * One of the placements MUST also be I915_MEMORY_CLASS_SYSTEM, to
>> +     * ensure we can always spill the allocation to system memory, if we
>> +     * can't place the object in the mappable part of
>> +     * I915_MEMORY_CLASS_DEVICE.
>> +     *
>> +     * Note that buffers that need to be captured with 
>> EXEC_OBJECT_CAPTURE,
>> +     * will need to enable this hint, if the object can also be 
>> placed in
>> +     * I915_MEMORY_CLASS_DEVICE, starting from DG2+. The execbuf call 
>> will
>> +     * throw an error otherwise. This also means that such objects 
>> will need
>> +     * I915_MEMORY_CLASS_SYSTEM set as a possible placement.
>> +     *
> 
> I wonder, should we try to migrate capture objects at execbuf time 
> instead on an on-demand basis? If migration fails, then we just skip 
> capturing that object, similar to how the capture code handles errors?

So IIUC if the object has been marked for capture, unmark the TOPDOWN 
annotation, if it has been set, to force allocating in the mappable 
portion, or spill to system memory(if the placements allow it)? I think 
that should work. Jon any thoughts?

> 
>> +     * Without this hint, the kernel will assume that non-mappable
>> +     * I915_MEMORY_CLASS_DEVICE is preferred for this object. Note 
>> that the
>> +     * kernel can still migrate the object to the mappable part, as a 
>> last
>> +     * resort, if userspace ever CPU faults this object, but this 
>> might be
>> +     * expensive, and so ideally should be avoided.
>> +     */
>> +#define I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS (1<<0)
>>       __u32 flags;
>>       /**
>>        * @extensions: The chain of extensions to apply to this object.
