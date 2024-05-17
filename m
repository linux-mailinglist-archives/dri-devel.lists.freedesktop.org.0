Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C28208C85E5
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 13:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E6A10E0D6;
	Fri, 17 May 2024 11:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZMLxjlyq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EA710E0D6;
 Fri, 17 May 2024 11:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715946795; x=1747482795;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NmHDYiu9DuzvRtiaeJsydd3ZKV5k6U8m90dyBBTMp6Y=;
 b=ZMLxjlyqmsgtRmmYu0N0qzuxc+/BQy25nDAcEOFNjzLNQON6MgjqZutR
 mIFMDqFUWaw1IQObrn6Ia/ukjX7Kywa3683uJhdUsqK8cqDsGaKiucJhF
 3IbK8bZeFjbGnDTI1Eq+tHqmPYzynGXLUEg1JS7GXSnEoAQpLeOB4tTcG
 9jGgU7zp6ynzXN6H57Elak3qIz1V1eXEVcMO7FaSJUhBu2sYr77WIouGV
 IHs6ALy2EtsFErO9qatuf4WBV5FwWzgmy2iTTT7Y9B+Nc4nh2OilEHYqF
 gzOZgLBLx+w3qEX5l5RTnWhA1QTnCOQI3xg9tCPN0gU7tEQozuD73LNt7 A==;
X-CSE-ConnectionGUID: n1bWWlxKRJehLV3Bikfnrg==
X-CSE-MsgGUID: vWaQm9ohSHyun9ncJLTP3Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12289824"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="12289824"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:53:15 -0700
X-CSE-ConnectionGUID: LdWX7r9OSzuEipQ0XmcGAg==
X-CSE-MsgGUID: Ci5kVUyjQ4GcC8XZl/tGCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="36193250"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.30])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:53:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Andi Shyti
 <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Set always_coherent to false when
 reading from CPU
In-Reply-To: <2034982a-6cdf-43d9-a41f-8cb1c9e071c5@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240516151403.2875-1-nirmoy.das@intel.com>
 <87bk54c2fx.fsf@intel.com>
 <2034982a-6cdf-43d9-a41f-8cb1c9e071c5@linux.intel.com>
Date: Fri, 17 May 2024 14:53:06 +0300
Message-ID: <877cfsbqot.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 17 May 2024, Nirmoy Das <nirmoy.das@linux.intel.com> wrote:
> Hi Jani,
>
> On 5/17/2024 9:39 AM, Jani Nikula wrote:
>> On Thu, 16 May 2024, Nirmoy Das <nirmoy.das@intel.com> wrote:
>>> The previous commit 'commit 8d4ba9fc1c6c ("drm/i915/selftests: Pick
>> "previous commit" is a fairly vague reference once this gets
>> committed. It's not going to be "previous" in any meaningful sense.
>>
>> Please just start with:
>>
>> Commit 8d4ba9fc1c6c ("drm/i915/selftests: Pick correct caching mode.")
>> was not complete...
>
> Will do that.
>
>
>>
>> And probably add:
>>
>> Fixes: 8d4ba9fc1c6c ("drm/i915/selftests: Pick correct caching mode.")
>
> Do we need Fixes for selftest ? I always assumed it is not required as 
> this code is for debug/CI

Maybe not for stuff that's already in stable, but we do run CI on
drm-next and -rc kernels, and if this causes issues there, why not have
them fixed?

BR,
Jani.

>
>
> Thanks,
>
> Nirmoy
>
>>
>> BR,
>> Jani.
>>
>>> correct caching mode.")' was not complete as for non LLC  sharing platforms
>>> cpu read can happen from LLC which probably doesn't have the latest
>>> changes made by GPU.
>>>
>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>>> index 65a931ea80e9..3527b8f446fe 100644
>>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>>> @@ -196,7 +196,7 @@ static int verify_access(struct drm_i915_private *i915,
>>>   	if (err)
>>>   		goto out_file;
>>>   
>>> -	mode = intel_gt_coherent_map_type(to_gt(i915), native_obj, true);
>>> +	mode = intel_gt_coherent_map_type(to_gt(i915), native_obj, false);
>>>   	vaddr = i915_gem_object_pin_map_unlocked(native_obj, mode);
>>>   	if (IS_ERR(vaddr)) {
>>>   		err = PTR_ERR(vaddr);

-- 
Jani Nikula, Intel
