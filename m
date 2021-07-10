Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3539B3C3609
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 20:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1336EB51;
	Sat, 10 Jul 2021 18:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB776EB50;
 Sat, 10 Jul 2021 18:15:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10041"; a="189521496"
X-IronPort-AV: E=Sophos;i="5.84,229,1620716400"; d="scan'208";a="189521496"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2021 11:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,229,1620716400"; d="scan'208";a="429204778"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga002.jf.intel.com with ESMTP; 10 Jul 2021 11:15:25 -0700
Received: from [10.249.151.15] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.151.15])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 16AIFOaf009187; Sat, 10 Jul 2021 19:15:24 +0100
Subject: Re: [Intel-gfx] [PATCH 12/16] drm/i915/guc/slpc: Cache platform
 frequency limits for slpc
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
 <20210710012026.19705-13-vinay.belgaumkar@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <660d584d-b080-590a-9a4a-ea23cbcf023e@intel.com>
Date: Sat, 10 Jul 2021 20:15:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210710012026.19705-13-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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



On 10.07.2021 03:20, Vinay Belgaumkar wrote:
> Cache rp0, rp1 and rpn platform limits into slpc structure
> for range checking while setting min/max frequencies.
> 
> Also add "soft" limits which keep track of frequency changes
> made from userland. These are initially set to platform min
> and max.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 41 +++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index d32274cd1db7..6e978f27b7a6 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -86,6 +86,9 @@ static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
>  		return err;
>  	}
>  
> +	slpc->max_freq_softlimit = 0;
> +	slpc->min_freq_softlimit = 0;

as mentioned earlier, now it is time to introduce these fields in .h

> +
>  	return err;
>  }
>  
> @@ -384,6 +387,29 @@ void intel_guc_pm_intrmsk_enable(struct intel_gt *gt)
>  			   GEN6_PMINTRMSK, pm_intrmsk_mbz, 0);
>  }
>  
> +static int intel_guc_slpc_set_softlimits(struct intel_guc_slpc *slpc)
> +{
> +	int ret = 0;
> +
> +	/* Softlimits are initially equivalent to platform limits
> +	 * unless they have deviated from defaults, in which case,
> +	 * we retain the values and set min/max accordingly.
> +	 */
> +	if (!slpc->max_freq_softlimit)
> +		slpc->max_freq_softlimit = slpc->rp0_freq;
> +	else if (slpc->max_freq_softlimit != slpc->rp0_freq)
> +		ret = intel_guc_slpc_set_max_freq(slpc,
> +					slpc->max_freq_softlimit);
> +
> +	if (!slpc->min_freq_softlimit)
> +		slpc->min_freq_softlimit = slpc->min_freq;
> +	else if (slpc->min_freq_softlimit != slpc->min_freq)
> +		ret = intel_guc_slpc_set_min_freq(slpc,
> +					slpc->min_freq_softlimit);
> +
> +	return ret;
> +}
> +
>  /*
>   * intel_guc_slpc_enable() - Start SLPC
>   * @slpc: pointer to intel_guc_slpc.
> @@ -402,6 +428,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>  	struct slpc_shared_data *data;
>  	int ret;
> +	u32 rp_state_cap;

move up to keep "ret" last

>  
>  	GEM_BUG_ON(!slpc->vma);
>  
> @@ -445,6 +472,20 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  			DIV_ROUND_CLOSEST(data->task_state_data.max_unslice_freq *
>  				GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER));
>  
> +	rp_state_cap = intel_uncore_read(i915->gt.uncore, GEN6_RP_STATE_CAP);
> +
> +	slpc->rp0_freq = ((rp_state_cap >> 0) & 0xff) * GT_FREQUENCY_MULTIPLIER;
> +	slpc->min_freq = ((rp_state_cap >> 16) & 0xff) * GT_FREQUENCY_MULTIPLIER;
> +	slpc->rp1_freq = ((rp_state_cap >> 8) & 0xff) * GT_FREQUENCY_MULTIPLIER;

we should have definitions for these bits and then we should be able to
use REG_FIELD_GET

> +
> +	if (intel_guc_slpc_set_softlimits(slpc))
> +		drm_err(&i915->drm, "Unable to set softlimits");

missing \n
maybe we can also print error ?

> +
> +	drm_info(&i915->drm,
> +		 "Platform fused frequency values -  min: %u Mhz, max: %u Mhz",

missing \n
double space before 'min'

Michal

> +		 slpc->min_freq,
> +		 slpc->rp0_freq);
> +
>  	return 0;
>  }
>  
> 
