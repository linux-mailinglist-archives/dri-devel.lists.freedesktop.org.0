Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8FA8C82A4
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 10:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882F110E196;
	Fri, 17 May 2024 08:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ak819Gie";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0600A10E122;
 Fri, 17 May 2024 08:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715935224; x=1747471224;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wL7w5wmoOT3OW5SgsuCpvsUuzyR02piwhufSJI/A0AE=;
 b=Ak819Gie9FU2UIrcmR8N6egnZAMYXa/JdUZl1FZz9ri2AbJCE8sjmB/q
 FqbtHAw3sIPKlWWebIQJHRBxB07+J8Zn91c+O9JJOxj+aN2A3FyeHJov4
 g0eCb4jC6gAqJKeUgcqHxTCCw9sIbY1qJjmMMLnX5bomoMtqCa/ogAuNh
 WTyDKKWzPEGTDXoVanVuM/sECRh5DWy69ct8lPA8mcwiE1yYdsOm66K0c
 DT4YSif/varIogLHTfAKEw2FjOXWTzvlO3m0FtSW2chie/6PKGa0RE7/I
 UYoSRodswlsMuDG7NGgLvUwJOIAWAVivhmxZJxJVH/YkLTs0jj0C2a/s/ w==;
X-CSE-ConnectionGUID: x9/GC5HGS96fiX6NAbefhQ==
X-CSE-MsgGUID: 7ff/8F8jRzeJ4NmZ7IDXUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12270443"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="12270443"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 01:40:24 -0700
X-CSE-ConnectionGUID: rQJBTk30QAyogmxX6kR1NQ==
X-CSE-MsgGUID: iR2cIiJOR5WY1+loGvLE6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="31729650"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.50.245])
 ([10.246.50.245])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 01:40:22 -0700
Message-ID: <2034982a-6cdf-43d9-a41f-8cb1c9e071c5@linux.intel.com>
Date: Fri, 17 May 2024 10:40:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/selftests: Set always_coherent to false when
 reading from CPU
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20240516151403.2875-1-nirmoy.das@intel.com>
 <87bk54c2fx.fsf@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <87bk54c2fx.fsf@intel.com>
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

Hi Jani,

On 5/17/2024 9:39 AM, Jani Nikula wrote:
> On Thu, 16 May 2024, Nirmoy Das <nirmoy.das@intel.com> wrote:
>> The previous commit 'commit 8d4ba9fc1c6c ("drm/i915/selftests: Pick
> "previous commit" is a fairly vague reference once this gets
> committed. It's not going to be "previous" in any meaningful sense.
>
> Please just start with:
>
> Commit 8d4ba9fc1c6c ("drm/i915/selftests: Pick correct caching mode.")
> was not complete...

Will do that.


>
> And probably add:
>
> Fixes: 8d4ba9fc1c6c ("drm/i915/selftests: Pick correct caching mode.")

Do we need Fixes for selftest ? I always assumed it is not required as 
this code is for debug/CI


Thanks,

Nirmoy

>
> BR,
> Jani.
>
>> correct caching mode.")' was not complete as for non LLC  sharing platforms
>> cpu read can happen from LLC which probably doesn't have the latest
>> changes made by GPU.
>>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>> index 65a931ea80e9..3527b8f446fe 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>> @@ -196,7 +196,7 @@ static int verify_access(struct drm_i915_private *i915,
>>   	if (err)
>>   		goto out_file;
>>   
>> -	mode = intel_gt_coherent_map_type(to_gt(i915), native_obj, true);
>> +	mode = intel_gt_coherent_map_type(to_gt(i915), native_obj, false);
>>   	vaddr = i915_gem_object_pin_map_unlocked(native_obj, mode);
>>   	if (IS_ERR(vaddr)) {
>>   		err = PTR_ERR(vaddr);
