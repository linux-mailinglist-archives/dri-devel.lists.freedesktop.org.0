Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8713E724080
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 13:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA70410E21E;
	Tue,  6 Jun 2023 11:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1C910E220;
 Tue,  6 Jun 2023 11:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686049771; x=1717585771;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=RnaiRohVK6pDBHWcCxjpZLIE39HmJHUZhpOModbjKko=;
 b=bPS/qaC/PGIO1EgUtRMpFefk6M+O2udovSGF/DYxUuQGuckX5CP8FXyX
 5TH67mTCdxryJEsN5WYvFve9J6858VdVdCiuDqYXSCtxhMxtML5Riiz/E
 bD1HLlSfmSvb1o+qIfQcMtsw0+AA+OeyN/EkZacD1oJNh/nEIQTfZK4hJ
 CI3mlKBDO65epY8sobm1v5/3/mVlWWu6d9L567vjfYhXhz7p7C+tlePaf
 pZ8cNHqz7jn/Vdw0Vuneu1ZCtYFU+kScmNyIt0mYQAz0ykbUyGgl4uIlO
 oci3VDphperCrfQNstmQG1/Z79KnmQK1D8ekYylwdldojuzooAikWuXXA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="341275308"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="341275308"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:09:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="686506066"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="686506066"
Received: from wacarey-mobl1.ger.corp.intel.com (HELO [10.213.192.12])
 ([10.213.192.12])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:09:28 -0700
Message-ID: <2ae9d24d-d1be-a072-90ec-6168a72778b9@linux.intel.com>
Date: Tue, 6 Jun 2023 12:09:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Implement fdinfo memory stats
 printing
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230605143720.435046-1-tvrtko.ursulin@linux.intel.com>
 <ZH5gMSkMrUiXhuTL@ashyti-mobl2.lan>
 <ee3ee473-6800-d4b4-292c-135caa9571b3@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ee3ee473-6800-d4b4-292c-135caa9571b3@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/06/2023 10:47, Tvrtko Ursulin wrote:
> 
> On 05/06/2023 23:22, Andi Shyti wrote:
>> Hi Tvrtko,
>>
>> On Mon, Jun 05, 2023 at 03:37:20PM +0100, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> Use the newly added drm_print_memory_stats helper to show memory
>>> utilisation of our objects in drm/driver specific fdinfo output.
>>>
>>> To collect the stats we walk the per memory regions object lists
>>> and accumulate object size into the respective drm_memory_stats
>>> categories.
>>>
>>> Objects with multiple possible placements are reported in multiple
>>> regions for total and shared sizes, while other categories are
>>> counted only for the currently active region.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: Rob Clark <robdclark@gmail.com>
>>> ---
>>>   drivers/gpu/drm/i915/i915_drm_client.c | 66 ++++++++++++++++++++++++++
>>>   1 file changed, 66 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c 
>>> b/drivers/gpu/drm/i915/i915_drm_client.c
>>> index 2a44b3876cb5..2a40f763f8f6 100644
>>> --- a/drivers/gpu/drm/i915/i915_drm_client.c
>>> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
>>> @@ -41,6 +41,70 @@ void __i915_drm_client_free(struct kref *kref)
>>>   }
>>>   #ifdef CONFIG_PROC_FS
>>> +static void
>>> +add_obj_meminfo(struct drm_i915_gem_object *obj,
>>> +        struct intel_memory_region *mr,
>>> +        struct drm_memory_stats stats[INTEL_REGION_UNKNOWN])
>>> +{
>>> +    u64 sz = obj->base.size;
>>> +    enum intel_region_id id;
>>> +    unsigned int i;
>>> +
>>> +    id = mr->id;
>>> +    if (obj->base.handle_count > 1)
>>> +        stats[id].shared += sz;
>>> +    else
>>> +        stats[id].private += sz;
>>> +
>>> +    if (i915_gem_object_has_pages(obj)) {
>>> +        stats[id].resident += sz;
>>> +
>>> +        if (!dma_resv_test_signaled(obj->base.resv,
>>> +                        dma_resv_usage_rw(true)))
>>> +            stats[id].active += sz;
>>> +        else if (i915_gem_object_is_shrinkable(obj) &&
>>> +             obj->mm.madv == I915_MADV_DONTNEED)
>>> +            stats[id].purgeable += sz;
>>
>> this is a bit off... otherwise:
>>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Thanks!
> 
> I will sit on this until I can find time to add some tests to drm_fdinfo.c.

Actually.. Aravind pointed off list that my brain wasn't switched on 
when writing this. Fdinfo stats need to be per client and this patch is 
therefore almost completely bogus.

Regards,

Tvrtko

>>
>> Andi
>>
>>> +    }
>>> +
>>> +    /* Attribute size and shared to all possible object memory 
>>> regions. */
>>> +    for (i = 0; i < obj->mm.n_placements; i++) {
>>> +        if (obj->mm.placements[i] == mr)
>>> +            continue;
>>> +
>>> +        id = obj->mm.placements[i]->id;
>>> +        if (obj->base.handle_count > 1)
>>> +            stats[id].shared += sz;
>>> +        else
>>> +            stats[id].private += sz;
>>> +    }
>>> +}
>>> +
>>> +static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>>> +{
>>> +    struct drm_i915_file_private *file_priv = file->driver_priv;
>>> +    struct drm_memory_stats stats[INTEL_REGION_UNKNOWN] = {};
>>> +    struct drm_i915_private *i915 = file_priv->i915;
>>> +    struct intel_memory_region *mr;
>>> +    unsigned int id;
>>> +
>>> +    for_each_memory_region(mr, i915, id) {
>>> +        struct drm_i915_gem_object *obj;
>>> +
>>> +        mutex_lock(&mr->objects.lock);
>>> +        list_for_each_entry(obj, &mr->objects.list, mm.region_link)
>>> +            add_obj_meminfo(obj, mr, stats);
>>> +        mutex_unlock(&mr->objects.lock);
>>> +    }
>>> +
>>> +    for_each_memory_region(mr, i915, id)
>>> +        drm_print_memory_stats(p,
>>> +                       &stats[id],
>>> +                       DRM_GEM_OBJECT_RESIDENT |
>>> +                       DRM_GEM_OBJECT_PURGEABLE,
>>> +                       mr->name);
>>> +}
>>> +
>>>   static const char * const uabi_class_names[] = {
>>>       [I915_ENGINE_CLASS_RENDER] = "render",
>>>       [I915_ENGINE_CLASS_COPY] = "copy",
>>> @@ -102,6 +166,8 @@ void i915_drm_client_fdinfo(struct drm_printer 
>>> *p, struct drm_file *file)
>>>        * 
>>> ******************************************************************
>>>        */
>>> +    show_meminfo(p, file);
>>> +
>>>       if (GRAPHICS_VER(i915) < 8)
>>>           return;
>>> -- 
>>> 2.39.2
