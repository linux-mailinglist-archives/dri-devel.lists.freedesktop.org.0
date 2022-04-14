Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7757C500642
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 08:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1506F112057;
	Thu, 14 Apr 2022 06:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D748A112055;
 Thu, 14 Apr 2022 06:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649918509; x=1681454509;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z0GsyKqmWo4pKu5UTOjWRVFp6xT6xPKxzj1nXTiZMPI=;
 b=aymAFB5R3+yYvG2bbN44otljOvz0b5YP60xT4CUCDdunE1zk4M7fmgEY
 qRolvJT/r4EAtdJhm5wJ8KjT6KHhr6AyFl1S8hgRBdITntzi4WopFqYzM
 iEmvViTAnvJQ7obQSII4idGmfnwjTq5IRiQxzZWFpLN/WgOvsyBYx4HVB
 WlBJOiMjLcGiDgwIU0RAixgKHKeWcIaqMLvCMrL6uBhkWQ7uBuNXXDq5o
 KLq3/xFOf3sLkjPZbS7uBTYnREt8xQrtIdFI/wKXZGwy00EdChoxVgIk4
 Fb0Ll8yYEaZ0aPiy3DR5zp5T2s11DMmmRn6q8HlZf8quVSQCeX2BQiIPQ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="250152139"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="250152139"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 23:41:49 -0700
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="552539476"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com (HELO intel.com)
 ([10.223.74.179])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 23:41:47 -0700
Date: Thu, 14 Apr 2022 12:11:44 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Use i915_probe_error
 instead of drm_err
Message-ID: <20220414064143.GE28908@intel.com>
References: <20220412224852.21501-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220412224852.21501-1-vinay.belgaumkar@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On 2022-04-13 at 04:18:52 +0530, Vinay Belgaumkar wrote:
> This will ensure we don't have false positives when we run
> error injection tests.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 42 ++++++++++-----------
>  1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index b170238aa15c..639de3c10545 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -152,8 +152,8 @@ static int slpc_query_task_state(struct intel_guc_slpc *slpc)
>  
>  	ret = guc_action_slpc_query(guc, offset);
>  	if (unlikely(ret))
As commit logs describe, this code patch can hit, when we run error injection test.
Do we need unlikely() here?
Br,
Anshuman Gupta.
> -		drm_err(&i915->drm, "Failed to query task state (%pe)\n",
> -			ERR_PTR(ret));
> +		i915_probe_error(i915, "Failed to query task state (%pe)\n",
> +				 ERR_PTR(ret));
>  
>  	drm_clflush_virt_range(slpc->vaddr, SLPC_PAGE_SIZE_BYTES);
>  
> @@ -170,8 +170,8 @@ static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
>  
>  	ret = guc_action_slpc_set_param(guc, id, value);
>  	if (ret)
> -		drm_err(&i915->drm, "Failed to set param %d to %u (%pe)\n",
> -			id, value, ERR_PTR(ret));
> +		i915_probe_error(i915, "Failed to set param %d to %u (%pe)\n",
> +				 id, value, ERR_PTR(ret));
>  
>  	return ret;
>  }
> @@ -211,8 +211,8 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>  				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>  				     freq);
>  		if (ret)
> -			drm_err(&i915->drm, "Unable to force min freq to %u: %d",
> -				freq, ret);
> +			i915_probe_error(i915, "Unable to force min freq to %u: %d",
> +					 freq, ret);
>  	}
>  
>  	return ret;
> @@ -247,9 +247,9 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>  
>  	err = intel_guc_allocate_and_map_vma(guc, size, &slpc->vma, (void **)&slpc->vaddr);
>  	if (unlikely(err)) {
> -		drm_err(&i915->drm,
> -			"Failed to allocate SLPC struct (err=%pe)\n",
> -			ERR_PTR(err));
> +		i915_probe_error(i915,
> +				 "Failed to allocate SLPC struct (err=%pe)\n",
> +				 ERR_PTR(err));
>  		return err;
>  	}
>  
> @@ -316,15 +316,15 @@ static int slpc_reset(struct intel_guc_slpc *slpc)
>  	ret = guc_action_slpc_reset(guc, offset);
>  
>  	if (unlikely(ret < 0)) {
> -		drm_err(&i915->drm, "SLPC reset action failed (%pe)\n",
> -			ERR_PTR(ret));
> +		i915_probe_error(i915, "SLPC reset action failed (%pe)\n",
> +				 ERR_PTR(ret));
>  		return ret;
>  	}
>  
>  	if (!ret) {
>  		if (wait_for(slpc_is_running(slpc), SLPC_RESET_TIMEOUT_MS)) {
> -			drm_err(&i915->drm, "SLPC not enabled! State = %s\n",
> -				slpc_get_state_string(slpc));
> +			i915_probe_error(i915, "SLPC not enabled! State = %s\n",
> +					 slpc_get_state_string(slpc));
>  			return -EIO;
>  		}
>  	}
> @@ -616,8 +616,8 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  
>  	ret = slpc_reset(slpc);
>  	if (unlikely(ret < 0)) {
> -		drm_err(&i915->drm, "SLPC Reset event returned (%pe)\n",
> -			ERR_PTR(ret));
> +		i915_probe_error(i915, "SLPC Reset event returned (%pe)\n",
> +				 ERR_PTR(ret));
>  		return ret;
>  	}
>  
> @@ -632,24 +632,24 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  	/* Ignore efficient freq and set min to platform min */
>  	ret = slpc_ignore_eff_freq(slpc, true);
>  	if (unlikely(ret)) {
> -		drm_err(&i915->drm, "Failed to set SLPC min to RPn (%pe)\n",
> -			ERR_PTR(ret));
> +		i915_probe_error(i915, "Failed to set SLPC min to RPn (%pe)\n",
> +				 ERR_PTR(ret));
>  		return ret;
>  	}
>  
>  	/* Set SLPC max limit to RP0 */
>  	ret = slpc_use_fused_rp0(slpc);
>  	if (unlikely(ret)) {
> -		drm_err(&i915->drm, "Failed to set SLPC max to RP0 (%pe)\n",
> -			ERR_PTR(ret));
> +		i915_probe_error(i915, "Failed to set SLPC max to RP0 (%pe)\n",
> +				 ERR_PTR(ret));
>  		return ret;
>  	}
>  
>  	/* Revert SLPC min/max to softlimits if necessary */
>  	ret = slpc_set_softlimits(slpc);
>  	if (unlikely(ret)) {
> -		drm_err(&i915->drm, "Failed to set SLPC softlimits (%pe)\n",
> -			ERR_PTR(ret));
> +		i915_probe_error(i915, "Failed to set SLPC softlimits (%pe)\n",
> +				 ERR_PTR(ret));
>  		return ret;
>  	}
>  
> -- 
> 2.35.1
> 
