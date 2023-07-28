Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDAF766DA9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 14:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8CD10E0D8;
	Fri, 28 Jul 2023 12:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4BE10E008;
 Fri, 28 Jul 2023 12:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690548958; x=1722084958;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=L4VEhffOgpCKPxckweM3hwztRXYIRfeIsdzYLQ7GH0k=;
 b=KE8ZMHfapaNdFHCvOsS7YobxVuwmmSHFsEoMNIeEOkLFEa11Zdo5PgPd
 lNsB/1r/XVuR/pY6wxUsRkw5gfXAoauF5jqNjpVVaXjSK6WGzj7B8hsp4
 zHkCuhwB3Ea6990RI62PhSMBFpqkgJwv6Csn+CMoqWmZQ98RBta2E4KtW
 /p4F8Er9M0JMdnXTMsimiOSkegm1RiYJ6StuC5mJO/TXP0iI2j1LS0tKo
 dfQ9qK6BMFniHRF2VxP1r8Blv/Kk9STJrrjRg45h1oMalgjUPdIXRlr6j
 cepRSqmNz2mGHVCd0yAwG/QLvbtA55HtPJv+K5phs94Ywfwhis6ZSMSSS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="358612244"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="358612244"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 05:55:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="730740004"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="730740004"
Received: from atoomey-mobl.amr.corp.intel.com (HELO [10.213.197.30])
 ([10.213.197.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 05:55:55 -0700
Message-ID: <c4ff98f9-81e7-3f42-2e63-14782410037a@linux.intel.com>
Date: Fri, 28 Jul 2023 13:55:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 4/8] drm/i915: Refactor PAT/object cache handling
Content-Language: en-US
To: "Yang, Fei" <fei.yang@intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
 <20230727145504.1919316-5-tvrtko.ursulin@linux.intel.com>
 <BYAPR11MB256702AD6B37216420298B699A06A@BYAPR11MB2567.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <BYAPR11MB256702AD6B37216420298B699A06A@BYAPR11MB2567.namprd11.prod.outlook.com>
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


On 28/07/2023 08:14, Yang, Fei wrote:
> [snip]
>> @@ -41,14 +42,17 @@ static bool gpu_write_needs_clflush(struct drm_i915_gem_object *obj)
>>                return false;
>>
>>        /*
>> -      * For objects created by userspace through GEM_CREATE with pat_index
>> -      * set by set_pat extension, i915_gem_object_has_cache_level() will
>> -      * always return true, because the coherency of such object is managed
> 
> i915_gem_object_has_cache_level() always return true means this function
> always return false.
> 
>> -      * by userspace. Othereise the call here would fall back to checking
>> -      * whether the object is un-cached or write-through.
>> +      * Always flush cache for UMD objects with PAT index set.
> 
> (obj->pat_set_by_user == true) indicates UMD knows how to handle the coherency,
> forcing clflush in KMD would be redundant.

For Meteorlake I made gpu_write_needs_clflush() always return false anyway.

Could you please submit a patch with kerneldoc for i915_drm.h explaining 
what the set domain ioctl is expected to do when set pat extension is 
used? With the focus on the use cases of how userspace is managing 
coherency using it, or it isn't, or what.

>>         */
>> -     return !(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||
>> -              i915_gem_object_has_cache_level(obj, I915_CACHE_WT));
>> +     if (obj->pat_set_by_user)
>> +             return true;
> 
> return false;

Oops, thank you! I did warn in the cover letter I was getting confused 
by boolean logic conversions, cross-referencing three versions, and 
extracting the pat_set_by_user to call sites. :)

>> +
>> +     /*
>> +      * Fully coherent cached access may end up with data in the CPU cache
>> +      * which hasn't hit memory yet.
>> +      */
>> +     return i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WB) &&
>> +            i915_gem_object_has_cache_flag(obj, I915_CACHE_FLAG_COH2W);
> 
> Why checking COH2W here? The logic was, if UC or WT return false, otherwise
> return true. So, as long as cache_mode is WB, it's sufficient to say true
> here, right?

I was trying to penetrate the reason behind the check.

Original code was:

        return !(obj->cache_level == I915_CACHE_NONE ||
                 obj->cache_level == I915_CACHE_WT);

Which is equivalent to "is it WB", right? (Since it matches on both old 
LLC flavours.)

Which I thought, in the context of this function, is supposed to answer 
the question of "can there be data in the shared cache written by the 
GPU but not committed to RAM yet".

And then I thought that can only ever happen with 2-way coherency. 
Otherwise GPU writes never end up in the CPU cache.

Did I get that wrong? Maybe I have..

Regards,

Tvrtko
