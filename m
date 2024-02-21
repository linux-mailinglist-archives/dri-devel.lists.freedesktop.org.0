Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941A785D263
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 09:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6512F10E66B;
	Wed, 21 Feb 2024 08:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ciEeTiS5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE38710E452;
 Wed, 21 Feb 2024 08:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708503580; x=1740039580;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wptzrfEDZ7uY8tFslAuxaFNxpRuvhwWRUzq5HlNzcp0=;
 b=ciEeTiS5R/RGtqwEkK/dqf6Up0XntiArmaMikbkFBxn+bR+Idsa5UBdp
 R9DG6fFXCj74SpEaz8Z1PDAozTJng03x9A7Aq4rcfvYb3XwESqb//JdEV
 jmzxmEmocvicfA08npCjg+ksezalTH7ap+HcN9ugic84868d1uwJkgBwN
 0/95pphGA26ygPjDSwuWvOmIwGwhH3PIC51un+FQl+K6lp2iKWFBxH+AB
 NgsERaoz9UnlGsOcTc2oDzs4wR34XQMs2KZpMgYDw0ltMH6cVIajfsO/p
 +qbKxzFp3NvRIlln5/gYPlLeVdZfR6yKF9/logT6Ho3O5ufeNSuY0GYZ9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="6466096"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="6466096"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 00:19:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="9620605"
Received: from jdoyle1x-mobl2.ger.corp.intel.com (HELO [10.213.204.109])
 ([10.213.204.109])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 00:19:36 -0800
Message-ID: <a0f66a4d-12f9-4852-a1bb-a6d27538b436@linux.intel.com>
Date: Wed, 21 Feb 2024 08:19:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/i915/gt: Enable only one CCS for compute
 workload
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>
References: <20240220143526.259109-1-andi.shyti@linux.intel.com>
 <20240220143526.259109-3-andi.shyti@linux.intel.com>
 <af007641-9705-4259-b29c-3cb78f67fc64@linux.intel.com>
 <ZdVAd3NxUNBZofts@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZdVAd3NxUNBZofts@ashyti-mobl2.lan>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/02/2024 00:14, Andi Shyti wrote:
> Hi Tvrtko,
> 
> On Tue, Feb 20, 2024 at 02:48:31PM +0000, Tvrtko Ursulin wrote:
>> On 20/02/2024 14:35, Andi Shyti wrote:
>>> Enable only one CCS engine by default with all the compute sices
>>
>> slices
> 
> Thanks!
> 
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
>>> index 833987015b8b..7041acc77810 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
>>> @@ -243,6 +243,15 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
>>>    		if (engine->uabi_class == I915_NO_UABI_CLASS)
>>>    			continue;
>>> +		/*
>>> +		 * Do not list and do not count CCS engines other than the first
>>> +		 */
>>> +		if (engine->uabi_class == I915_ENGINE_CLASS_COMPUTE &&
>>> +		    engine->uabi_instance > 0) {
>>> +			i915->engine_uabi_class_count[engine->uabi_class]--;
>>> +			continue;
>>> +		}
>>
>> It's a bit ugly to decrement after increment, instead of somehow
>> restructuring the loop to satisfy both cases more elegantly.
> 
> yes, agree, indeed I had a hard time here to accept this change
> myself.
> 
> But moving the check above where the counter was incremented it
> would have been much uglier.
> 
> This check looks ugly everywhere you place it :-)

One idea would be to introduce a separate local counter array for 
name_instance, so not use i915->engine_uabi_class_count[]. First one 
increments for every engine, second only for the exposed ones. That way 
feels wouldn't be too ugly.

> In any case, I'm working on a patch that is splitting this
> function in two parts and there is some refactoring happening
> here (for the first initialization and the dynamic update).
> 
> Please let me know if it's OK with you or you want me to fix it
> in this run.
> 
>> And I wonder if
>> internally (in dmesg when engine name is logged) we don't end up with ccs0
>> ccs0 ccs0 ccs0.. for all instances.
> 
> I don't see this. Even in sysfs we see only one ccs. Where is it?

When you run this patch on something with two or more ccs-es, the 
"renamed ccs... to ccs.." debug logs do not all log the new name as ccs0?

Regards,

Tvrtko

> 
>>> +
>>>    		rb_link_node(&engine->uabi_node, prev, p);
>>>    		rb_insert_color(&engine->uabi_node, &i915->uabi_engines);
> 
> [...]
> 
>>> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
>>> index 3baa2f54a86e..d5a5143971f5 100644
>>> --- a/drivers/gpu/drm/i915/i915_query.c
>>> +++ b/drivers/gpu/drm/i915/i915_query.c
>>> @@ -124,6 +124,7 @@ static int query_geometry_subslices(struct drm_i915_private *i915,
>>>    	return fill_topology_info(sseu, query_item, sseu->geometry_subslice_mask);
>>>    }
>>> +
>>
>> Zap please.
> 
> yes... yes... I noticed it after sending the patch :-)
> 
> Thanks,
> Andi
