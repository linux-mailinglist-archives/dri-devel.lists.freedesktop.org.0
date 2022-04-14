Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 345FF501867
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 18:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54B110E293;
	Thu, 14 Apr 2022 16:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4006410E1E0;
 Thu, 14 Apr 2022 16:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649952831; x=1681488831;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2PerYRLeWmwNN2upOwLhrGPtggRCe+TPP8aRS1u8aSM=;
 b=hnZ0w1LzILFqIeVdREhTnLoRx6vbGO54reHUzTYcPRlnxozxw9iKSozq
 Tynm1dNbeSq55zOitCEBDNRhzo751eBO/zt/xXj/AghQCztfIr/kAO8QO
 Nl9FCr2L62LRTH35OWDuzPFv0hNx+ZYyD8tVVGNyHQUCySqh23yDYDs+L
 zQoDknsHJjRdj6wfN2f9Q+RX8WkHw6h0iJIf4t09S54lk2rvAygZ8UQpL
 bGy6aynqM3NxAh4PES0HFFs3JeJ/LZoYwM6VzxxS58PMETC90T3pK6hM2
 as7l2SgtNFZNv+HYvbYBG0NIGVjDj76oqDkfR3FOSMTfpypFvEZOwbvbj A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="323411459"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="323411459"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 09:13:50 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="725419679"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 09:13:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Use i915_probe_error
 instead of drm_err
In-Reply-To: <5853d85e-da43-5eb7-abda-a475283ff6e1@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220412224852.21501-1-vinay.belgaumkar@intel.com>
 <20220414064143.GE28908@intel.com>
 <5853d85e-da43-5eb7-abda-a475283ff6e1@intel.com>
Date: Thu, 14 Apr 2022 19:13:49 +0300
Message-ID: <875ynbej7m.fsf@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Apr 2022, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com> wrote:
> On 4/13/2022 11:41 PM, Anshuman Gupta wrote:
>> On 2022-04-13 at 04:18:52 +0530, Vinay Belgaumkar wrote:
>>> This will ensure we don't have false positives when we run
>>> error injection tests.
>>>
>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 42 ++++++++++-----------
>>>   1 file changed, 21 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>> index b170238aa15c..639de3c10545 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>> @@ -152,8 +152,8 @@ static int slpc_query_task_state(struct intel_guc_slpc *slpc)
>>>   
>>>   	ret = guc_action_slpc_query(guc, offset);
>>>   	if (unlikely(ret))
>> As commit logs describe, this code patch can hit, when we run error injection test.
>> Do we need unlikely() here?
>> Br,
>> Anshuman Gupta.
>
> I think we still need the unlikely(). Majority of the time, we still 
> need the compiler optimization.
>
> Only in the rare case of running the error injection test will it not be 
> needed.

IMO most uses of likely/unlikely (and inline for that matter) are
premature optimization that just shouldn't be there. They're a
distraction to human readers, and a style that all too easily gets cargo
culted all over the place. In most cases, please just let the compiler
do what it does best.

And *then* if you still need to squeeze extra cycles out of the code,
and can quantify it, by all means optimize. But in that case, maybe the
root cause is somewhere other than a missing likely/unlikely/inline?


BR,
Jani.


>
> Thanks,
>
> Vinay.
>
>>> -		drm_err(&i915->drm, "Failed to query task state (%pe)\n",
>>> -			ERR_PTR(ret));
>>> +		i915_probe_error(i915, "Failed to query task state (%pe)\n",
>>> +				 ERR_PTR(ret));
>>>   
>>>   	drm_clflush_virt_range(slpc->vaddr, SLPC_PAGE_SIZE_BYTES);
>>>   
>>> @@ -170,8 +170,8 @@ static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
>>>   
>>>   	ret = guc_action_slpc_set_param(guc, id, value);
>>>   	if (ret)
>>> -		drm_err(&i915->drm, "Failed to set param %d to %u (%pe)\n",
>>> -			id, value, ERR_PTR(ret));
>>> +		i915_probe_error(i915, "Failed to set param %d to %u (%pe)\n",
>>> +				 id, value, ERR_PTR(ret));
>>>   
>>>   	return ret;
>>>   }
>>> @@ -211,8 +211,8 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>>>   				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>>   				     freq);
>>>   		if (ret)
>>> -			drm_err(&i915->drm, "Unable to force min freq to %u: %d",
>>> -				freq, ret);
>>> +			i915_probe_error(i915, "Unable to force min freq to %u: %d",
>>> +					 freq, ret);
>>>   	}
>>>   
>>>   	return ret;
>>> @@ -247,9 +247,9 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>>   
>>>   	err = intel_guc_allocate_and_map_vma(guc, size, &slpc->vma, (void **)&slpc->vaddr);
>>>   	if (unlikely(err)) {
>>> -		drm_err(&i915->drm,
>>> -			"Failed to allocate SLPC struct (err=%pe)\n",
>>> -			ERR_PTR(err));
>>> +		i915_probe_error(i915,
>>> +				 "Failed to allocate SLPC struct (err=%pe)\n",
>>> +				 ERR_PTR(err));
>>>   		return err;
>>>   	}
>>>   
>>> @@ -316,15 +316,15 @@ static int slpc_reset(struct intel_guc_slpc *slpc)
>>>   	ret = guc_action_slpc_reset(guc, offset);
>>>   
>>>   	if (unlikely(ret < 0)) {
>>> -		drm_err(&i915->drm, "SLPC reset action failed (%pe)\n",
>>> -			ERR_PTR(ret));
>>> +		i915_probe_error(i915, "SLPC reset action failed (%pe)\n",
>>> +				 ERR_PTR(ret));
>>>   		return ret;
>>>   	}
>>>   
>>>   	if (!ret) {
>>>   		if (wait_for(slpc_is_running(slpc), SLPC_RESET_TIMEOUT_MS)) {
>>> -			drm_err(&i915->drm, "SLPC not enabled! State = %s\n",
>>> -				slpc_get_state_string(slpc));
>>> +			i915_probe_error(i915, "SLPC not enabled! State = %s\n",
>>> +					 slpc_get_state_string(slpc));
>>>   			return -EIO;
>>>   		}
>>>   	}
>>> @@ -616,8 +616,8 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>>   
>>>   	ret = slpc_reset(slpc);
>>>   	if (unlikely(ret < 0)) {
>>> -		drm_err(&i915->drm, "SLPC Reset event returned (%pe)\n",
>>> -			ERR_PTR(ret));
>>> +		i915_probe_error(i915, "SLPC Reset event returned (%pe)\n",
>>> +				 ERR_PTR(ret));
>>>   		return ret;
>>>   	}
>>>   
>>> @@ -632,24 +632,24 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>>   	/* Ignore efficient freq and set min to platform min */
>>>   	ret = slpc_ignore_eff_freq(slpc, true);
>>>   	if (unlikely(ret)) {
>>> -		drm_err(&i915->drm, "Failed to set SLPC min to RPn (%pe)\n",
>>> -			ERR_PTR(ret));
>>> +		i915_probe_error(i915, "Failed to set SLPC min to RPn (%pe)\n",
>>> +				 ERR_PTR(ret));
>>>   		return ret;
>>>   	}
>>>   
>>>   	/* Set SLPC max limit to RP0 */
>>>   	ret = slpc_use_fused_rp0(slpc);
>>>   	if (unlikely(ret)) {
>>> -		drm_err(&i915->drm, "Failed to set SLPC max to RP0 (%pe)\n",
>>> -			ERR_PTR(ret));
>>> +		i915_probe_error(i915, "Failed to set SLPC max to RP0 (%pe)\n",
>>> +				 ERR_PTR(ret));
>>>   		return ret;
>>>   	}
>>>   
>>>   	/* Revert SLPC min/max to softlimits if necessary */
>>>   	ret = slpc_set_softlimits(slpc);
>>>   	if (unlikely(ret)) {
>>> -		drm_err(&i915->drm, "Failed to set SLPC softlimits (%pe)\n",
>>> -			ERR_PTR(ret));
>>> +		i915_probe_error(i915, "Failed to set SLPC softlimits (%pe)\n",
>>> +				 ERR_PTR(ret));
>>>   		return ret;
>>>   	}
>>>   
>>> -- 
>>> 2.35.1
>>>

-- 
Jani Nikula, Intel Open Source Graphics Center
