Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AD7753793
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 12:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B25310E85C;
	Fri, 14 Jul 2023 10:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA8E10E850;
 Fri, 14 Jul 2023 10:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689329501; x=1720865501;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kpFte//AC2j7ixvUImFt8v5aroh40NBGz8lssmLpSAs=;
 b=n5g4JpOIJie2CU/pBRODG5flGLuuFUAJJJ/ekpIxOAh4HTkDiXGiwjHK
 JNjdlUzj9RV7k8L6sFtbZLXfN8dxOKPr37UUWYgBmyPO8cj5MXy2yEHVz
 arrkaSg6Dp4NA3gIfp9HPKCB8QsUJGwSbHF5/7jZN68l5mUVtonbu88Ps
 Orv8QBbGrH45O1F68YJTiAftaPdgW8NMOFCBDfLvPoWMoPmDPE+GvWFaw
 Zxtz3DP96EKghTrc/shm0x90Ls+hNmkFz8xHcOhgdXZRKAyAh2L4EAfmz
 M9ZZqtrYKdABn1G/Nq9u6sHjloxdOcvKq9FJI9luJ2Ses26L/V5iRzCtS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="362905756"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="362905756"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 03:11:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="792392517"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="792392517"
Received: from ptquigle-mobl1.ger.corp.intel.com (HELO [10.213.210.155])
 ([10.213.210.155])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 03:11:32 -0700
Message-ID: <999114a1-e334-5de9-065e-9a5d3801e23e@linux.intel.com>
Date: Fri, 14 Jul 2023 11:11:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 2/2] drm/i915: Remove PAT hack from
 i915_gem_object_can_bypass_llc
Content-Language: en-US
To: "Yang, Fei" <fei.yang@intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20230713152718.645488-1-tvrtko.ursulin@linux.intel.com>
 <20230713152718.645488-2-tvrtko.ursulin@linux.intel.com>
 <BYAPR11MB25673D3525AF7C5A5FFB44129A34A@BYAPR11MB2567.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <BYAPR11MB25673D3525AF7C5A5FFB44129A34A@BYAPR11MB2567.namprd11.prod.outlook.com>
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


On 14/07/2023 06:43, Yang, Fei wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> According to the comment in i915_gem_object_can_bypass_llc the
>> purpose of the function is to return false if the platform/object
>> has a caching mode where GPU can bypass the LLC.
>>
>> So far the only platforms which allegedly can do this are Jasperlake
>> and Elkhartlake, and that via MOCS (not PAT).
>>
>> Instead of blindly assuming that objects where userspace has set the
>> PAT index can (bypass the LLC), question is is there a such PAT index
>> on a platform. Probably starting with Meteorlake since that one is the
>> only one where set PAT extension can be currently used. Or if there is
>> a MOCS entry which can achieve the same thing on Meteorlake.
>>
>> If there is such PAT, now that i915 can be made to understand them
>> better, we can make the check more fine grained. Or if there is a MOCS
>> entry then we probably should apply the blanket IS_METEORLAKE condition.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Fixes: 9275277d5324 ("drm/i915: use pat_index instead of cache_level")
>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>> Cc: Fei Yang <fei.yang@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 6 ------
>>   1 file changed, 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> index 33a1e97d18b3..1e34171c4162 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> @@ -229,12 +229,6 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
>>        if (!(obj->flags & I915_BO_ALLOC_USER))
>>                return false;
>>
>> -     /*
>> -      * Always flush cache for UMD objects at creation time.
>> -      */
>> -     if (obj->pat_set_by_user)
> 
> I'm afraid this is going to break MESA. Can we run MESA tests with this patch?

I can't, but question is why it would break Mesa which would need a nice 
comment here?

For instance should the check be IS_METEORLAKE?

Or should it be "is wb" && "not has 1-way coherent"?

Or both?

Or, given how Meteorlake does not have LLC, how can anything bypass it 
there? Or is it about snooping on Meteorlake and how?

Regards,

Tvrtko

> 
>>        /*
>>         * EHL and JSL add the 'Bypass LLC' MOCS entry, which should make it
>>         * possible for userspace to bypass the GTT caching bits set by the
>> --
>> 2.39.2
