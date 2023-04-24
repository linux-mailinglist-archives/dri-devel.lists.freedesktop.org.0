Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D90236EC801
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 10:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E125E10E05E;
	Mon, 24 Apr 2023 08:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB3610E02E;
 Mon, 24 Apr 2023 08:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682325715; x=1713861715;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=C0WY56DhBtxK9SE7rL80AoiDBYOymyc5lvBygCq/NSo=;
 b=EpqIO7mWJrMe2AeNPSq9PPFp1+4Q+NpSmJo7upQM+TMRYyamz9cK8Mez
 5u94tuZ5plCqeGf8X8BiPUdQk6kSQojhunacOdoyXZOLm4F+wVDI3sxBh
 cN7vUMliKd71JtlfJHNXPtbr3c9400R23Vc1xNR7LWOhrR/f3VWmMZrHU
 v8/nfXuW1vbfxjhX/ISVGlz5P3RUHoqsGcOuVkl0Hlfu6yu9VzkwmoI0A
 0IzFhp20zjebFw8Es3ckM5P5AMUBX0iOzEXATKLUkIhx9QCnp3Ip1MBEa
 hX+0JySQl2FsXuieKEIKc43QHFCWaQvkJPM4L12+8O00isgQW9/w0LhAA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="346422091"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="346422091"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 01:41:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="670441226"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="670441226"
Received: from maisasax-mobl.ger.corp.intel.com (HELO [10.213.209.63])
 ([10.213.209.63])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 01:41:53 -0700
Message-ID: <cf94406c-3970-cfbd-71aa-fd51d0c07627@linux.intel.com>
Date: Mon, 24 Apr 2023 09:41:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 7/8] drm/i915: use pat_index instead of
 cache_level
Content-Language: en-US
To: "Yang, Fei" <fei.yang@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-8-fei.yang@intel.com>
 <705b5e5b-78cd-857f-ad26-80835217520c@linux.intel.com>
 <BYAPR11MB25676CAFE8FA0CD0E6ED6EA69A669@BYAPR11MB2567.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <BYAPR11MB25676CAFE8FA0CD0E6ED6EA69A669@BYAPR11MB2567.namprd11.prod.outlook.com>
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


On 23/04/2023 07:12, Yang, Fei wrote:
>> On 20/04/2023 00:00, fei.yang@intel.com wrote:
>>> From: Fei Yang <fei.yang@intel.com>
>>>
>>> Currently the KMD is using enum i915_cache_level to set caching policy
>>> for buffer objects. This is flaky because the PAT index which really
>>> controls the caching behavior in PTE has far more levels than what's
>>> defined in the enum. In addition, the PAT index is platform dependent,
>>> having to translate between i915_cache_level and PAT index is not
>>> reliable, and makes the code more complicated.
>>>
>>>  From UMD's perspective there is also a necessity to set caching policy for
>>> performance fine tuning. It's much easier for the UMD to directly use
>>> PAT index because the behavior of each PAT index is clearly defined in Bspec.
>>> Having the abstracted i915_cache_level sitting in between would only
>>> cause more ambiguity.
>>>
>>> For these reasons this patch replaces i915_cache_level with PAT index.
>>> Also note, the cache_level is not completely removed yet, because the
>>> KMD still has the need of creating buffer objects with simple cache
>>> settings such as cached, uncached, or writethrough. For such simple
>>> cases, using cache_level would help simplify the code.
>>>
>>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>
>> [snip]
>>
>>>
>>>    bool i915_gem_cpu_write_needs_clflush(struct drm_i915_gem_object
>>> *obj) @@ -267,7 +267,7 @@ int i915_gem_object_set_cache_level(struct drm_i915_gem_object *obj,
>>>    {
>>>       int ret;
>>>
>>> -    if (obj->cache_level == cache_level)
>>> +    if (i915_gem_object_has_cache_level(obj, cache_level))
>>>               return 0;
>>
>> When userspace calls i915_gem_set_caching_ioctl
> 
> We are ending the support for set_caching_ioctl.

Not on all platforms.

>> after having set the PAT index explicitly this will make it silently succeed
>> regardless of the cache level passed in, no? Because of:
> 
> Yes, that's the point. For objects created by userspace with PAT index set,
> KMD is not supposed to touch the setting.

Why would that be a reason to lie to it? What would would be the problem 
with telling it of the mistake?

>> +bool i915_gem_object_has_cache_level(const struct drm_i915_gem_object *obj,
>> +                                  enum i915_cache_level lvl)
>> +{
>> +     /*
>> +      * cache_level == I915_CACHE_INVAL indicates the UMD's have set the
>> +      * caching policy through pat_index, in which case the KMD should
>> +      * leave the coherency to be managed by user space, simply return
>> +      * true here.
>> +      */
>> +     if (obj->cache_level == I915_CACHE_INVAL)
>> +             return true;
>>
>> I think we need to let it know it is doing it wrong with an error.
> 
> This is not an error, by design userspace should know exactly what it's doing.

IMO when return values can be misleading that means the API is not great.

I don't see a good reason to lie to both in kernel callers and to 
userspace (set_caching).

Regards,

Tvrtko
