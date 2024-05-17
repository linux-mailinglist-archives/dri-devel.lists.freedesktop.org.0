Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3798C8671
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 14:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C978310EE8C;
	Fri, 17 May 2024 12:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJQ7L4Aw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AB810EE89;
 Fri, 17 May 2024 12:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715949920; x=1747485920;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=68E1qQD2oGlLMcluPtJioiToZGSPXXyPLdrgL4hKMP8=;
 b=cJQ7L4Aw/b/coSUf2siJ9RpijBv1IAzaygfaokELwwiSX/hWN31qVS2l
 e2YVftDnBQv4/NXUovtbd56o9YCnnHd+8MUJocXKDR5z3Jd2DwJ3RJJl3
 Z5wwY5l4LwJiwtrhi4+TrDnDwP/QW2+0M3ejg7xUc0FuY+YDs5kp6eXq1
 GqKuBUa14m4+KQD9lV2aIbdNFEpe300Rcb8RUy4w7ED0n8NqDnpGjhD4G
 48p8S+VcHeMdgNMYdRfHLdyi2qc1rhqTnVrjtaNP6Mxb/gMnqsZlxlPNQ
 aV+kSjw6/IxCjP9wBffNP2Evdqg/y/PGwQIhSCVpSPZ0lEcUujJ1gJ1xK A==;
X-CSE-ConnectionGUID: oB7c9I3tTteVlLQ68JL8FQ==
X-CSE-MsgGUID: 0pl5JtNIRemaytAi6wH2Vw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12312622"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="12312622"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 05:45:18 -0700
X-CSE-ConnectionGUID: eH8esXwCSj26MfZK7354hA==
X-CSE-MsgGUID: l6l73S0SQbykOGxcjwmdqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="31795900"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.50.245])
 ([10.246.50.245])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 05:45:16 -0700
Message-ID: <5d07bf2c-9d00-4f73-bbac-3cc8eab18f2e@linux.intel.com>
Date: Fri, 17 May 2024 14:45:13 +0200
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
 <2034982a-6cdf-43d9-a41f-8cb1c9e071c5@linux.intel.com>
 <877cfsbqot.fsf@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <877cfsbqot.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/17/2024 1:53 PM, Jani Nikula wrote:
> On Fri, 17 May 2024, Nirmoy Das <nirmoy.das@linux.intel.com> wrote:
>> Hi Jani,
>>
>> On 5/17/2024 9:39 AM, Jani Nikula wrote:
>>> On Thu, 16 May 2024, Nirmoy Das <nirmoy.das@intel.com> wrote:
>>>> The previous commit 'commit 8d4ba9fc1c6c ("drm/i915/selftests: Pick
>>> "previous commit" is a fairly vague reference once this gets
>>> committed. It's not going to be "previous" in any meaningful sense.
>>>
>>> Please just start with:
>>>
>>> Commit 8d4ba9fc1c6c ("drm/i915/selftests: Pick correct caching mode.")
>>> was not complete...
>> Will do that.
>>
>>
>>> And probably add:
>>>
>>> Fixes: 8d4ba9fc1c6c ("drm/i915/selftests: Pick correct caching mode.")
>> Do we need Fixes for selftest ? I always assumed it is not required as
>> this code is for debug/CI
> Maybe not for stuff that's already in stable, but we do run CI on
> drm-next and -rc kernels, and if this causes issues there, why not have
> them fixed?

Not sure a commit with Fixes flows from drm-intel-next to drm-next/-rc 
but I see no issue adding Fixes without CC-ing to stable.

Pushed it to drm-intel-next with above modifications.  b4-shazam picked 
Fixes as well which was nice.


Thanks,

Nirmoy

>
> BR,
> Jani.
>
>>
>> Thanks,
>>
>> Nirmoy
>>
>>> BR,
>>> Jani.
>>>
>>>> correct caching mode.")' was not complete as for non LLC  sharing platforms
>>>> cpu read can happen from LLC which probably doesn't have the latest
>>>> changes made by GPU.
>>>>
>>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>>> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>>>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>>>> index 65a931ea80e9..3527b8f446fe 100644
>>>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>>>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>>>> @@ -196,7 +196,7 @@ static int verify_access(struct drm_i915_private *i915,
>>>>    	if (err)
>>>>    		goto out_file;
>>>>    
>>>> -	mode = intel_gt_coherent_map_type(to_gt(i915), native_obj, true);
>>>> +	mode = intel_gt_coherent_map_type(to_gt(i915), native_obj, false);
>>>>    	vaddr = i915_gem_object_pin_map_unlocked(native_obj, mode);
>>>>    	if (IS_ERR(vaddr)) {
>>>>    		err = PTR_ERR(vaddr);
