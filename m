Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31FC766D89
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 14:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195AA10E696;
	Fri, 28 Jul 2023 12:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1DF10E696;
 Fri, 28 Jul 2023 12:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690548307; x=1722084307;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=o6u4iNFXfCh80+QFgmW516xl1aldtBc74PpdXPGYNms=;
 b=YB42ry7IVVi0dPKo3ziTunETi0FuFu0p4FM+Hs8ML2D6kFH1IDXWD3sl
 aLn6QrkmDo7HE4ldPw+7XnWADcexM7dBhLgzyJInUf2oBla7HVKRAZXZU
 VLgJp9WAqxL0htIJiaI0vOLTokMkvT6WkWwMxnA2gQ+HsUGEW9pI7s4UM
 M6ap9Hs5ONCJxvYZcWewxO2f/zl1yopMkKaiD4+5Aaft796OEQGR7NuZB
 YVrPwRzQTke5xnRxnM/fkG8c4oJkWQ+FUEkDNriiBKw69xz8JaGvO3OTD
 wkjUBJ1bgs2Iv2JsVU2kdaL+H8ptiL/avRW5vpZ2POMFGjLV0w8XedRGo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="454941248"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="454941248"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 05:45:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="1058133455"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="1058133455"
Received: from atoomey-mobl.amr.corp.intel.com (HELO [10.213.197.30])
 ([10.213.197.30])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 05:45:05 -0700
Message-ID: <82bd65ee-f84d-f6a0-2477-36c4927f48a8@linux.intel.com>
Date: Fri, 28 Jul 2023 13:45:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 7/8] drm/i915: Lift the user PAT restriction from
 use_cpu_reloc
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
 <20230727145504.1919316-8-tvrtko.ursulin@linux.intel.com>
 <20230728000948.GG138014@mdroper-desk1.amr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230728000948.GG138014@mdroper-desk1.amr.corp.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, Fei Yang <fei.yang@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/07/2023 01:09, Matt Roper wrote:
> On Thu, Jul 27, 2023 at 03:55:03PM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Now that i915 understands the caching modes behind PAT indices, we can
>> refine the check in use_cpu_reloc() to not reject the uncached PAT if it
>> was set by userspace.
>>
>> Instead it can decide based on the presence of full coherency which
>> should be functionally equivalent on legacy platforms. We can ignore WT
>> since it is only used by the display, and we can ignore Meteorlake since
>> it will fail on the existing "has_llc" condition before the object cache
>> mode check.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Fei Yang <fei.yang@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 9 +--------
>>   1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> index 9d6e49c8a4c6..f74b33670bad 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> @@ -640,16 +640,9 @@ static inline int use_cpu_reloc(const struct reloc_cache *cache,
>>   	if (DBG_FORCE_RELOC == FORCE_GTT_RELOC)
>>   		return false;
>>   
>> -	/*
>> -	 * For objects created by userspace through GEM_CREATE with pat_index
>> -	 * set by set_pat extension, i915_gem_object_has_cache_level() always
>> -	 * return true, otherwise the call would fall back to checking whether
>> -	 * the object is un-cached.
>> -	 */
>>   	return (cache->has_llc ||
>>   		obj->cache_dirty ||
>> -		!(obj->pat_set_by_user ||
>> -		  i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC)));
>> +		i915_gem_object_has_cache_flag(obj, I915_CACHE_FLAG_COH2W));
> 
> My understanding of relocations is minimal, but does 2W actually matter
> here (CPU snooping GPU caches)?  I would have expected only 1W coherency
> to be necessary (GPU snooping CPU caches)?

I struggled with this one. Original code was:

         return (cache->has_llc ||
                 obj->cache_dirty ||
                 obj->cache_level != I915_CACHE_NONE);

And I struggled to figure out the intent. It is not "don't do CPU 
relocations for uncached" because it will do them when LLC or dirty 
regardless.

You could be right.. can we interpret it as any mode apart from uncached 
was viewed as coherent for CPU writes being seen by the GPU?

In which case should/could it be based on I915_BO_CACHE_COHERENT_FOR_WRITE?

Regards,

Tvrtko

> 
> 
> Matt
> 
>>   }
>>   
>>   static int eb_reserve_vma(struct i915_execbuffer *eb,
>> -- 
>> 2.39.2
>>
> 
