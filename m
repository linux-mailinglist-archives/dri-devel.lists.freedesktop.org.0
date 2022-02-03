Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 580544A817F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:33:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB7910EC06;
	Thu,  3 Feb 2022 09:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1538961E;
 Thu,  3 Feb 2022 09:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643880783; x=1675416783;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PQSVPgZOFmH9u9MbRQP2CJmZuBeHJWh4QwxBEmyMkeA=;
 b=D/eji6J66LWFvXqQBFsNlYzpjhupoV/vFUUuS/NSOwMEHpZFtAh8bIy2
 ZABxZWAQNuNrAWZqTEnhCbh0R4g8ioh/TEwc/KOW9mh6cfaR/wBZb1gEe
 DZdHx1NNj9lfhZCRZ4gGriaeorugOQU2apa+uXT9kXCpl+Ggs2C/vPoFZ
 oaPo0P6FF1p21YOMGFd8n2rWQSFK6F7Qw/S0DD7gb2xkFnsnsRmsEckN9
 atNAphvNNJ7ChWSmorlaCjgTBJL76FEDBCiRWPzGZXWYaPNWs/QBoabuc
 3ctcCiuRL82cf9HQyjY8rw4qC5o4Ik5y2WBOeowQyGr6WdDsgLYWjydgP Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="311412793"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="311412793"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:33:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="627377129"
Received: from blovejoy-mobl.ger.corp.intel.com (HELO [10.252.16.183])
 ([10.252.16.183])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:33:01 -0800
Message-ID: <24afd86a-d500-4acd-0543-6334101064b7@intel.com>
Date: Thu, 3 Feb 2022 09:32:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 16/20] drm/i915/create: apply ALLOC_TOPDOWN by default
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220126152155.3070602-1-matthew.auld@intel.com>
 <20220126152155.3070602-17-matthew.auld@intel.com>
 <ed116a09-65f9-f093-4800-e0f4e4718ef7@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ed116a09-65f9-f093-4800-e0f4e4718ef7@linux.intel.com>
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

On 03/02/2022 09:17, Thomas Hellström wrote:
> 
> On 1/26/22 16:21, Matthew Auld wrote:
>> Starting from DG2+, when dealing with LMEM, we assume that by default
>> all userspace allocations should be placed in the non-mappable portion
>> of LMEM.  Note that dumb buffers are not included here, since these are
>> not "GPU accelerated" and likely need CPU access.
>>
>> In a later patch userspace will be able to provide a hint if CPU access
>> to the buffer is needed.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_create.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> index 9402d4bf4ffc..e7456443f163 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> @@ -424,6 +424,15 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, 
>> void *data,
>>           ext_data.n_placements = 1;
>>       }
>> +    /*
>> +     * TODO: add a userspace hint to force CPU_ACCESS for the object, 
>> which
>> +     * can override this.
>> +     */
>> +    if (!IS_DG1(i915) && (ext_data.n_placements > 1 ||
>> +                  ext_data.placements[0]->type !=
>> +                  INTEL_MEMORY_SYSTEM))
>> +        ext_data.flags |= I915_BO_ALLOC_TOPDOWN;
> 
> Perhaps we should include DG1 here as well, so that the same paths are 
> taken regardless whether this is only a test on DG1?

I think the only reason was EXEC_CAPTURE, where atm we just reject 
anything marked with I915_BO_ALLOC_TOPDOWN, but that must not break 
existing DG1 uapi.

> 
> 
> 
> 
>> +
>>       obj = __i915_gem_object_create_user_ext(i915, args->size,
>>                           ext_data.placements,
>>                           ext_data.n_placements,
