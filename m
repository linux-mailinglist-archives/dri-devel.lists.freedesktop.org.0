Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3823B51BDA4
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 13:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F82010F7AB;
	Thu,  5 May 2022 11:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D3410F7AB;
 Thu,  5 May 2022 11:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651748569; x=1683284569;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1kZrf5iYfENp6NglA3xL1INf9ahgbEpfdabChSreAHg=;
 b=eoPNTMrtZMus75kz17RJo1TfymvY4/+hVF57zhx/VHeuHOfAxUGLr3wj
 ok5lbcYEpKO9ZvupMv16c2C3k5Ni6702J1dKI9cEmHX9xdPYfjnAoE7Tv
 c940Y3hwhS1exZ1fArGj1vkOklx1c21b2PNQ8Wwrd8BQiaN8fAIFEHebv
 RUlL2B3mv3JZfcqT8VbtUiMMNpYPF5QT6FNcl1v5/y+1ZScyjuLzHhNQg
 XnAoEKyvzqlYFAzbpGQfoKQXvJV/mpghz9+Xx0riBCfNse33ckqezp/yB
 ypJI4uIOcrneesmPcCf64d9junlwhdatoDTWvUzwYlW/RWYBpvxTJUJEU w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="331060868"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="331060868"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 04:02:48 -0700
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="517461735"
Received: from mrbroom-mobl.ger.corp.intel.com (HELO [10.213.206.41])
 ([10.213.206.41])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 04:02:47 -0700
Message-ID: <a746320b-8431-a171-4c73-3ed64eedc726@linux.intel.com>
Date: Thu, 5 May 2022 12:02:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] drm/i915: Don't use DRM_DEBUG_WARN_ON for unexpected
 l3bank/mslice config
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20220504120715.911045-1-tvrtko.ursulin@linux.intel.com>
 <YnKuX0F0bDBF5ahP@mdroper-desk1.amr.corp.intel.com>
 <12d849fb-3255-139a-7905-2d3dd679e3c8@linux.intel.com>
 <YnLDMANc6xdnjOdy@mdroper-desk1.amr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <YnLDMANc6xdnjOdy@mdroper-desk1.amr.corp.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/05/2022 19:17, Matt Roper wrote:
> On Wed, May 04, 2022 at 06:59:32PM +0100, Tvrtko Ursulin wrote:
>>
>> On 04/05/2022 17:48, Matt Roper wrote:
>>> On Wed, May 04, 2022 at 01:07:14PM +0100, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> DRM_DEBUG_WARN_ON should only be used when we are certain CI is guaranteed
>>>> to exercise a certain code path, so in case of values coming from MMIO
>>>> reads we cannot be sure CI will have all the possible SKUs and parts.
>>>>
>>>> Use drm_warn instead and move logging to init phase while at it.
>>>
>>> Changing to drm_warn looks good, although moving the location changes
>>> the intent a bit; I think originally the idea was to warn if we were
>>> trying to do a steering lookup for a type that we never initialized
>>> (e.g., an LNCF lookup for a !HAS_MSLICES platform where we never even
>>> read the register in the first place).  But I don't think we've ever
>>> made a mistake that would cause us to trip the warning, so it probably
>>> isn't terribly important to keep it there.
>>
>> Ah I see.. there we could put something like:
>>
>> 	case MSLICE:
>> 		GEM_WARN_ON(!HAS_MSLICES(...));
>>
> 
> Yeah, that would work for MSLICE and LNCF.  Although L3BANK is a bit
> stranger since we have multiple platforms that obtain the L3 bank mask
> in completely different ways (Xe_HP reads it from XEHP_FUSE4, whereas
> gen11/gen12 reads it from GEN10_MIRROR_FUSE3).  We want to make sure
> there that no matter which branch of init we take, we didn't forget to
> initialize l3bank_mask somehow.

The two init paths are not something present in drm-tip at this point, 
right? At least I couldn't find it. In which case it could be handled 
later by moving the drm_warn to tail of intel_gt_init_mmio, give or take.

Anyway, I've sent v2 out with your r-b and GEM_WARN_ON for mslice/lncf. 
I won't merge it though until you definitely are okay with it so please 
have a look and confirm.

Regards,

Tvrtko


> 
> Matt
> 
>> ?
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>>
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/intel_gt.c | 13 ++++++-------
>>>>    1 file changed, 6 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>>>> index 53307ca0eed0..c474e5c3ea5e 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>>>> @@ -153,11 +153,14 @@ int intel_gt_init_mmio(struct intel_gt *gt)
>>>>    	 * An mslice is unavailable only if both the meml3 for the slice is
>>>>    	 * disabled *and* all of the DSS in the slice (quadrant) are disabled.
>>>>    	 */
>>>> -	if (HAS_MSLICES(i915))
>>>> +	if (HAS_MSLICES(i915)) {
>>>>    		gt->info.mslice_mask =
>>>>    			slicemask(gt, GEN_DSS_PER_MSLICE) |
>>>>    			(intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3) &
>>>>    			 GEN12_MEML3_EN_MASK);
>>>> +		if (!gt->info.mslice_mask) /* should be impossible! */
>>>> +			drm_warn(&i915->drm, "mslice mask all zero!\n");
>>>> +	}
>>>>    	if (IS_DG2(i915)) {
>>>>    		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
>>>> @@ -171,6 +174,8 @@ int intel_gt_init_mmio(struct intel_gt *gt)
>>>>    		gt->info.l3bank_mask =
>>>>    			~intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3) &
>>>>    			GEN10_L3BANK_MASK;
>>>> +		if (!gt->info.l3bank_mask) /* should be impossible! */
>>>> +			drm_warn(&i915->drm, "L3 bank mask is all zero!\n");
>>>>    	} else if (HAS_MSLICES(i915)) {
>>>>    		MISSING_CASE(INTEL_INFO(i915)->platform);
>>>>    	}
>>>> @@ -882,20 +887,14 @@ static void intel_gt_get_valid_steering(struct intel_gt *gt,
>>>>    {
>>>>    	switch (type) {
>>>>    	case L3BANK:
>>>> -		GEM_DEBUG_WARN_ON(!gt->info.l3bank_mask); /* should be impossible! */
>>>> -
>>>>    		*sliceid = 0;		/* unused */
>>>>    		*subsliceid = __ffs(gt->info.l3bank_mask);
>>>>    		break;
>>>>    	case MSLICE:
>>>> -		GEM_DEBUG_WARN_ON(!gt->info.mslice_mask); /* should be impossible! */
>>>> -
>>>>    		*sliceid = __ffs(gt->info.mslice_mask);
>>>>    		*subsliceid = 0;	/* unused */
>>>>    		break;
>>>>    	case LNCF:
>>>> -		GEM_DEBUG_WARN_ON(!gt->info.mslice_mask); /* should be impossible! */
>>>> -
>>>>    		/*
>>>>    		 * An LNCF is always present if its mslice is present, so we
>>>>    		 * can safely just steer to LNCF 0 in all cases.
>>>> -- 
>>>> 2.32.0
>>>>
>>>
> 
