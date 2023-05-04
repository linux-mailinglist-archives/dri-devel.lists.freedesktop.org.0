Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 735716F6CED
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 15:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105B410E4FC;
	Thu,  4 May 2023 13:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFAC10E4EE;
 Thu,  4 May 2023 13:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683206958; x=1714742958;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MrpmeB65/W2rkXQdlYUSm1Sdlsd7s3hQC+sQrAg6dnQ=;
 b=NUh6PiM9sl8o9vjdKpbPzMKYQJiiXvcd5rIXlFHjbzWGcTV0BEU9OLV1
 /rkwWR/Kw0ARRq1zoXacdsYVuuaPiU8XF/LwLXGddWgjRN6BKfQcAqOxK
 FdVHh8rWcoS0Z33t7gBB7P5GFvNUNhKyUocdkQC/8ansmSMayIcmPIPe5
 iTh8RAtVTSfaoAf/b1CjfcpRprzr60zBRZVFcGt+PW7FNw0R3BezLnlKU
 YfdMXUii7yrqGGQVAILxREzS+o2C+6/ntcLim1Rsco4Qlig8BUi13WZqq
 LHGu61tFsW4oxlmeDeXAmjgH9DoC3xir1dQsY1b6325fo8t1EmL/3gaen Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="338082396"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="338082396"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 06:12:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="808717477"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="808717477"
Received: from tarabr1x-mobl.ger.corp.intel.com (HELO [10.213.213.121])
 ([10.213.213.121])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 06:11:59 -0700
Message-ID: <a9be1aae-a796-c9e3-c1be-b544a31c90b8@linux.intel.com>
Date: Thu, 4 May 2023 14:11:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH v4 2/3] drm/i915: use pat_index instead of
 cache_level
Content-Language: en-US
To: "Yang, Fei" <fei.yang@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230502041200.2170424-1-fei.yang@intel.com>
 <20230502041200.2170424-3-fei.yang@intel.com>
 <f0e0df9a-2913-dfc3-042a-867e536c3ceb@linux.intel.com>
 <BYAPR11MB256767693CB508F40A2B17DD9A6C9@BYAPR11MB2567.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <BYAPR11MB256767693CB508F40A2B17DD9A6C9@BYAPR11MB2567.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/05/2023 21:39, Yang, Fei wrote:
> [...]
> 
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> index 8c70a0ec7d2f..27c948350b5b 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> @@ -54,6 +54,25 @@ unsigned int i915_gem_get_pat_index(struct drm_i915_private *i915,
>>>       return INTEL_INFO(i915)->cachelevel_to_pat[level];
>>>    }
>>>
>>> +bool i915_gem_object_has_cache_level(const struct drm_i915_gem_object *obj,
>>> +                                 enum i915_cache_level lvl)
>>> +{
>>> +    /*
>>> +     * cache_level == I915_CACHE_INVAL indicates the UMD's have set the
>>> +     * caching policy through pat_index, in which case the KMD should
>>> +     * leave the coherency to be managed by user space, simply return
>>> +     * true here.
>>> +     */
>>> +    if (obj->cache_level == I915_CACHE_INVAL)
>>> +            return true;
>>> +
>>> +    /*
>>> +     * Otherwise the pat_index should have been converted from cache_level
>>> +     * so that the following comparison is valid.
>>> +     */
>>> +    return obj->pat_index == i915_gem_get_pat_index(obj_to_i915(obj), lvl);
>>> +}
>>> +
>>>    struct drm_i915_gem_object *i915_gem_object_alloc(void)
>>>    {
>>>       struct drm_i915_gem_object *obj;
>>> @@ -133,7 +152,7 @@ void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
>>>    {
>>>       struct drm_i915_private *i915 = to_i915(obj->base.dev);
>>>
>>> -    obj->cache_level = cache_level;
>>> +    obj->pat_index = i915_gem_get_pat_index(i915, cache_level);
>>
>> obj->cache_level is only ever set to "invalid" from the set pat
>> extension? Doesn't that make it a boolean so there is no need for three
>> bits to hold the enum, just the "pat has been externally set" bit really?
> 
> Will update.

Thanks!

> 
>>>
>>>       if (cache_level != I915_CACHE_NONE)
>>>               obj->cache_coherent = (I915_BO_CACHE_COHERENT_FOR_READ |
> 
> [...]
> 
>>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
>>> index 41389a32e998..9a4922da3a71 100644
>>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>>> @@ -139,21 +139,56 @@ static const char *stringify_vma_type(const struct i915_vma *vma)
>>>       return "ppgtt";
>>>    }
>>>
>>> -static const char *i915_cache_level_str(struct drm_i915_private *i915, int type)
>>> -{
>>> -    switch (type) {
>>> -    case I915_CACHE_NONE: return " uncached";
>>> -    case I915_CACHE_LLC: return HAS_LLC(i915) ? " LLC" : " snooped";
>>> -    case I915_CACHE_L3_LLC: return " L3+LLC";
>>> -    case I915_CACHE_WT: return " WT";
>>> -    default: return "";
>>> +static const char *i915_cache_level_str(struct drm_i915_gem_object *obj)
>>> +{
>>> +    struct drm_i915_private *i915 = obj_to_i915(obj);
>>> +
>>> +    if (IS_METEORLAKE(i915)) {
>>> +            switch (obj->pat_index) {
>>> +            case 0: return " WB";
>>> +            case 1: return " WT";
>>> +            case 2: return " UC";
>>> +            case 3: return " WB (1-Way Coh)";
>>> +            case 4: return " WB (2-Way Coh)";
>>> +            default: return " not defined";
>>> +            }
>>> +    } else if (IS_PONTEVECCHIO(i915)) {
>>> +            switch (obj->pat_index) {
>>> +            case 0: return " UC";
>>> +            case 1: return " WC";
>>> +            case 2: return " WT";
>>> +            case 3: return " WB";
>>> +            case 4: return " WT (CLOS1)";
>>> +            case 5: return " WB (CLOS1)";
>>> +            case 6: return " WT (CLOS2)";
>>> +            case 7: return " WT (CLOS2)";
>>> +            default: return " not defined";
>>> +            }
>>> +    } else if (GRAPHICS_VER(i915) >= 12) {
>>> +            switch (obj->pat_index) {
>>> +            case 0: return " WB";
>>> +            case 1: return " WC";
>>> +            case 2: return " WT";
>>> +            case 3: return " UC";
>>> +            default: return " not defined";
>>> +            }
>>> +    } else {
>>> +            if (i915_gem_object_has_cache_level(obj, I915_CACHE_NONE))
>>> +                    return " uncached";
>>
>> This will print uncached for all legacy platforms if set pat extension
>> has been used, regardless of the index set.
> 
> Will update. Should just use obj->pat_index here.

Thanks, it looks better to me in v5.

>> Are we okay with that? I find it questionable and would say no. It
>> diverges from >= 12 and so is confusing.
>>
>>> +            else if (i915_gem_object_has_cache_level(obj, I915_CACHE_LLC))
>>> +                    return HAS_LLC(i915) ? " LLC" : " snooped";
>>> +            else if (i915_gem_object_has_cache_level(obj, I915_CACHE_L3_LLC))
>>> +                    return " L3+LLC";
>>> +            else if (i915_gem_object_has_cache_level(obj, I915_CACHE_WT))
>>> +                    return " WT";
>>> +            else
>>> +                    return " not defined";
>>
>> Another thing is why use different names for caching modes between
>> "legacy" and the rest?
> 
> For new platforms the string matches bspec. For legacy platforms I think it's
> still better to inherit the strings, no surprises here. What do you think?

Not 100% sure but I fear confusion from userspace developer point of 
view if they have code which uses the set pat extension on all platforms 
and then on some they see "WB" and one some they see "LLC" or "snooped". 
Might be less confusing to use the same terminology.

But it also may be true what you say, that someone got used to old 
strings.. However as they (the old strings) will only appear on old 
platforms. And that the BSpec naming on old platforms does not use 
WB&co, if I got that right.

I guess it is only debugfs so okay to to leave this open for later.

Regards,

Tvrtko
