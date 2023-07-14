Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0073753783
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 12:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7092510E857;
	Fri, 14 Jul 2023 10:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E0B10E856;
 Fri, 14 Jul 2023 10:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689329311; x=1720865311;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rC90GUe53H8utdI+cv5Pr+kHFumRR61LUE2KGRx9xMo=;
 b=CvE6XOsOrOpP550zVR6+wU13Vw6QOOfoEJMizOtwHIVQ0GM7KlmjzAPa
 Y33MXINVd/Cx2QDhWK1L3tzX+mlaFDE6A9NfdkKZoYIlBaoO0v36XSfbf
 +LAiI/bOW/L6eGToqBA8putKFraQ+O+gduQNyx/jiSqwaGM/1sRKgreUC
 6dXxiUwmByi82yUCHNw9pfLg1sF1MPRjYPCWwKwEkxh5bEv9B1lGbCaIK
 H6j4m8S/NtLsbqz+H09/yDa+uIbEfFj8yJT4xUOdfJQat75vuq5RaQ9TN
 w2cUH+NVpyAC7BWbUdPcluDKHUYDdwP7VMJukKvzLVzpwmGJ1q7LZ4OCL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="345753613"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="345753613"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 03:08:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="757518174"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="757518174"
Received: from ptquigle-mobl1.ger.corp.intel.com (HELO [10.213.210.155])
 ([10.213.210.155])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 03:08:20 -0700
Message-ID: <756f24a7-94a7-2841-7462-8762462b4775@linux.intel.com>
Date: Fri, 14 Jul 2023 11:08:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 1/2] drm/i915: Refactor PAT/object cache handling
Content-Language: en-US
To: "Yang, Fei" <fei.yang@intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20230713152718.645488-1-tvrtko.ursulin@linux.intel.com>
 <BYAPR11MB25677FCEE39C65B1FED423799A34A@BYAPR11MB2567.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <BYAPR11MB25677FCEE39C65B1FED423799A34A@BYAPR11MB2567.namprd11.prod.outlook.com>
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 14/07/2023 06:36, Yang, Fei wrote:
> [snip]
>> @@ -326,10 +330,10 @@ int i915_gem_get_caching_ioctl(struct drm_device *dev, void *data,
>>                goto out;
>>        }
>>
>> -     if (i915_gem_object_has_cache_level(obj, I915_CACHE_LLC) ||
>> -         i915_gem_object_has_cache_level(obj, I915_CACHE_L3_LLC))
>> +     if (i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WB) &&
>> +         i915_gem_object_has_cache_flag(obj, I915_CACHE_FLAG_COH1W) == 1)
> 
> Need to check L3 flag as well? The original code has L3_LLC.
> if (i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WB) &&
>      (i915_gem_object_has_cache_flag(obj, I915_CACHE_FLAG_COH1W) == 1 ||
>       i915_gem_object_has_cache_flag(obj, I915_CACHE_FLAG_L3) == 1))

Don't think so, because I have:

   [2] = __I915_CACHE(WB, BIT(I915_CACHE_FLAG_COH1W) | BIT(I915_CACHE_FLAG_L3)), \

So L3 and COH1W are both set for the equivalent of old I915_CACHE_L3_LLC, meaning I915_CACHING_CACHED will be returned for either - same as old code.

> 
>>                args->caching = I915_CACHING_CACHED;
> 
> [snip]
>> +int i915_cache_init(struct drm_i915_private *i915)
>> +{
>> +     struct drm_printer p = drm_info_printer(i915->drm.dev);
>> +     char buf[I915_CACHE_NAME_LEN];
>> +     int ret;
>> +
>> +     i915->cache = HAS_LLC(i915) ? I915_CACHE_CACHED : I915_CACHE_NONE;
>> +     i915_cache_print(buf, sizeof(buf), "", i915->cache);
>> +     drm_printf(&p, "Coherent cache mode %s", buf);
>> +
>> +     ret = i915_cache_find_pat(i915, I915_CACHE_NONE);
>> +     if (ret < 0)
>> +             return -ENODEV;
>> +     drm_info(&i915->drm, "Using PAT index %u for uncached access\n", ret);
>> +     i915->pat_uc = ret;
>> +
>> +     ret = i915_cache_find_pat(i915, I915_CACHE_CACHED);
>> +     if (ret < 0)
>> +             return -ENODEV;
>> +     drm_info(&i915->drm, "Using PAT index %u for write-back access\n", ret);
>> +     i915->pat_wb = ret;
> 
> I think i915->pat_wt is needed as well, because display driver has code like this,
> HAS_WT(i915) ? I915_CACHE_WT : I915_CACHE_NONE
> 
> How did you handle functions like initial_plane_vma() and i915_gem_object_pin_to_display_plane()?

They have:

	i915_gem_object_set_cache_coherency(obj, HAS_WT(i915) ?
					    I915_CACHE_WT : I915_CACHE_NONE);

Where HAS_WT is equal to HAS_EDRAM. So it is not always WT. I don't have the history/background of that but that is how it is.

So I could add i915->pat_wt but a) I don't think it is right for display (display would need more like i915->display_pat), and b) there would be no call sites for it.

i915->display_pat (or display_cache actually) would be similar to how I added i915->cache, not be best name I know, but it is replacing many occurrences of:

   cache_level = HAS_LLC(mem->i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
   i915_gem_object_set_cache_coherency(obj, cache_level)

I am unsure what would be the proper name for i915->cache, which would make it correctly self-documenting?

> 
>> +     return 0;
>> +}
> 
> [snip]
>> -#define TGL_CACHELEVEL \
>> -     .cachelevel_to_pat = { \
>> -             [I915_CACHE_NONE]   = 3, \
>> -             [I915_CACHE_LLC]    = 0, \
>> -             [I915_CACHE_L3_LLC] = 0, \
>> -             [I915_CACHE_WT]     = 2, \
>> +/*
>> + * TODO/QQQ
>> + *
>> + * PAT 0 - is it 1-way or 2-way?
> 
> 1-way
> 
>> + */
>> +#define GEN12_CACHE_MODES \
>> +     .cache_modes = { \
>> +             [0] = _I915_CACHE(WB, COH1W), \
>> +             [1] = I915_CACHE(WC), \
>> +             [2] = I915_CACHE(WT), \
>> +             [3] = I915_CACHE(UC), \
>>        }
> 
> [snip]
>> -#define PVC_CACHELEVEL \
>> -     .cachelevel_to_pat = { \
>> -             [I915_CACHE_NONE]   = 0, \
>> -             [I915_CACHE_LLC]    = 3, \
>> -             [I915_CACHE_L3_LLC] = 3, \
>> -             [I915_CACHE_WT]     = 2, \
>> +/*
>> + * TODO/QQQ
>> + *
>> + * PAT 3 - is it 1-way or 2-way?
> 
> 1-way
> 
> PVC access is always coherent, it should have 1-way for [5] and [7] as well.

Thanks x2!

Regards,

Tvrtko

> 
>> + */
>> +#define PVC_CACHE_MODES \
>> +     .cache_modes = { \
>> +             [0] = I915_CACHE(UC), \
>> +             [1] = I915_CACHE(WC), \
>> +             [2] = I915_CACHE(WT), \
>> +             [3] = _I915_CACHE(WB, COH1W), \
>> +             [4] = _I915_CACHE(WT, CLOS1), \
>> +             [5] = _I915_CACHE(WB, CLOS1), \
>> +             [6] = _I915_CACHE(WT, CLOS2), \
>> +             [7] = _I915_CACHE(WB, CLOS2), \
>>        }
