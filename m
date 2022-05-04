Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9480C51AC02
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 20:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680A610E090;
	Wed,  4 May 2022 18:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE37210E090;
 Wed,  4 May 2022 18:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651687203; x=1683223203;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=137n4q3rIiVFQ23AX+AScuap7Y7qDgjczT3TzpRbZCQ=;
 b=R/J8iuj95eHlYePHcwP5jKXWnoWhun+AWqBvjUi86q7uUgMMsluVGUGq
 P0NuVm7fuELA8runq2AIXj6aVy74pXeI1NSiLRvWyjvVOlxjtRF/1YEuq
 43dZrh/76RBCAFi7YG/JdnHwcBktVM+ttYJosq56upAGvrZaec88DKvo6
 avuwxNNlGVSAKNhi3lBPZ3j+ngyKHxk0lm/b0PeWck7rnZDZihW1xdR83
 iT91A51V2TfTIigFylSAzQL/VYWoGYQQwiAkMItocLx2BEdbW+wrzWYrp
 EOuykbx33evdIT+kMgmfEB/1l35DFaN2wOlqgp6pnR+BJ1OcEs9hEDynh w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="265435855"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="265435855"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 10:59:36 -0700
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="664576151"
Received: from gidaly-mobl1.ger.corp.intel.com (HELO [10.213.236.183])
 ([10.213.236.183])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 10:59:34 -0700
Message-ID: <12d849fb-3255-139a-7905-2d3dd679e3c8@linux.intel.com>
Date: Wed, 4 May 2022 18:59:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] drm/i915: Don't use DRM_DEBUG_WARN_ON for unexpected
 l3bank/mslice config
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20220504120715.911045-1-tvrtko.ursulin@linux.intel.com>
 <YnKuX0F0bDBF5ahP@mdroper-desk1.amr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <YnKuX0F0bDBF5ahP@mdroper-desk1.amr.corp.intel.com>
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


On 04/05/2022 17:48, Matt Roper wrote:
> On Wed, May 04, 2022 at 01:07:14PM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> DRM_DEBUG_WARN_ON should only be used when we are certain CI is guaranteed
>> to exercise a certain code path, so in case of values coming from MMIO
>> reads we cannot be sure CI will have all the possible SKUs and parts.
>>
>> Use drm_warn instead and move logging to init phase while at it.
> 
> Changing to drm_warn looks good, although moving the location changes
> the intent a bit; I think originally the idea was to warn if we were
> trying to do a steering lookup for a type that we never initialized
> (e.g., an LNCF lookup for a !HAS_MSLICES platform where we never even
> read the register in the first place).  But I don't think we've ever
> made a mistake that would cause us to trip the warning, so it probably
> isn't terribly important to keep it there.

Ah I see.. there we could put something like:

	case MSLICE:
		GEM_WARN_ON(!HAS_MSLICES(...));

?

Regards,

Tvrtko

> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt.c | 13 ++++++-------
>>   1 file changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>> index 53307ca0eed0..c474e5c3ea5e 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> @@ -153,11 +153,14 @@ int intel_gt_init_mmio(struct intel_gt *gt)
>>   	 * An mslice is unavailable only if both the meml3 for the slice is
>>   	 * disabled *and* all of the DSS in the slice (quadrant) are disabled.
>>   	 */
>> -	if (HAS_MSLICES(i915))
>> +	if (HAS_MSLICES(i915)) {
>>   		gt->info.mslice_mask =
>>   			slicemask(gt, GEN_DSS_PER_MSLICE) |
>>   			(intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3) &
>>   			 GEN12_MEML3_EN_MASK);
>> +		if (!gt->info.mslice_mask) /* should be impossible! */
>> +			drm_warn(&i915->drm, "mslice mask all zero!\n");
>> +	}
>>   
>>   	if (IS_DG2(i915)) {
>>   		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
>> @@ -171,6 +174,8 @@ int intel_gt_init_mmio(struct intel_gt *gt)
>>   		gt->info.l3bank_mask =
>>   			~intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3) &
>>   			GEN10_L3BANK_MASK;
>> +		if (!gt->info.l3bank_mask) /* should be impossible! */
>> +			drm_warn(&i915->drm, "L3 bank mask is all zero!\n");
>>   	} else if (HAS_MSLICES(i915)) {
>>   		MISSING_CASE(INTEL_INFO(i915)->platform);
>>   	}
>> @@ -882,20 +887,14 @@ static void intel_gt_get_valid_steering(struct intel_gt *gt,
>>   {
>>   	switch (type) {
>>   	case L3BANK:
>> -		GEM_DEBUG_WARN_ON(!gt->info.l3bank_mask); /* should be impossible! */
>> -
>>   		*sliceid = 0;		/* unused */
>>   		*subsliceid = __ffs(gt->info.l3bank_mask);
>>   		break;
>>   	case MSLICE:
>> -		GEM_DEBUG_WARN_ON(!gt->info.mslice_mask); /* should be impossible! */
>> -
>>   		*sliceid = __ffs(gt->info.mslice_mask);
>>   		*subsliceid = 0;	/* unused */
>>   		break;
>>   	case LNCF:
>> -		GEM_DEBUG_WARN_ON(!gt->info.mslice_mask); /* should be impossible! */
>> -
>>   		/*
>>   		 * An LNCF is always present if its mslice is present, so we
>>   		 * can safely just steer to LNCF 0 in all cases.
>> -- 
>> 2.32.0
>>
> 
