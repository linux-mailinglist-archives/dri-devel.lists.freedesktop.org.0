Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 577773BA036
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 14:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A4A89170;
	Fri,  2 Jul 2021 12:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1187A6E154;
 Fri,  2 Jul 2021 12:08:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="196010109"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="196010109"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 05:08:25 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="455931353"
Received: from juanniex-mobl.ger.corp.intel.com (HELO [10.213.253.90])
 ([10.213.253.90])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 05:08:24 -0700
Subject: Re: [Intel-gfx] [PATCH 05/53] drm/i915/gen12: Use fuse info to enable
 SFC
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
 <20210701202427.1547543-6-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <bc1afd40-23be-2f8a-2d97-9bbe9507449c@linux.intel.com>
Date: Fri, 2 Jul 2021 13:08:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701202427.1547543-6-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 01/07/2021 21:23, Matt Roper wrote:
> From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
> 
> In Gen12 there are various fuse combinations and in each configuration
> vdbox engine may be connected to SFC depending on which engines are
> available, so we need to set the SFC capability based on fuse value from
> the hardware. Even numbered phyical instance always have SFC, odd

physical

> numbered physical instances have SFC only if previous even instance is
> fused off.

Just a few nits.

> Bspec: 48028
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c | 30 ++++++++++++++++++-----
>   1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 151870d8fdd3..4ab2c9abb943 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -442,6 +442,28 @@ void intel_engines_free(struct intel_gt *gt)
>   	}
>   }
>   
> +static inline

Inline is not desired here.

> +bool vdbox_has_sfc(struct drm_i915_private *i915, unsigned int physical_vdbox,
> +		   unsigned int logical_vdbox, u16 vdbox_mask)
> +{

I'd be tempted to prefix the function name with gen11_ so it is clearer 
it does not apply to earlier gens. Because if looking just at the diff 
out of context below, one can wonder if there is a functional change or 
not. There isn't, because there is a bailout for gen < 11 early in 
init_engine_mask(), but perhaps gen11 function name prefix would make 
this a bit more self-documenting.

> +	/*
> +	 * In Gen11, only even numbered logical VDBOXes are hooked
> +	 * up to an SFC (Scaler & Format Converter) unit.
> +	 * In Gen12, Even numbered phyical instance always are connected

physical

> +	 * to an SFC. Odd numbered physical instances have SFC only if
> +	 * previous even instance is fused off.
> +	 */
> +	if (GRAPHICS_VER(i915) == 12) {
> +		return (physical_vdbox % 2 == 0) ||
> +			!(BIT(physical_vdbox - 1) & vdbox_mask);
> +	} else if (GRAPHICS_VER(i915) == 11) {
> +		return logical_vdbox % 2 == 0;
> +	}

Not need for curlies on these branches.

> +
> +	MISSING_CASE(GRAPHICS_VER(i915));
> +	return false;
> +}
> +
>   /*
>    * Determine which engines are fused off in our particular hardware.
>    * Note that we have a catch-22 situation where we need to be able to access
> @@ -493,13 +515,9 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
>   			continue;
>   		}
>   
> -		/*
> -		 * In Gen11, only even numbered logical VDBOXes are
> -		 * hooked up to an SFC (Scaler & Format Converter) unit.
> -		 * In TGL each VDBOX has access to an SFC.
> -		 */
> -		if (GRAPHICS_VER(i915) >= 12 || logical_vdbox++ % 2 == 0)
> +		if (vdbox_has_sfc(i915, i, logical_vdbox, vdbox_mask))
>   			gt->info.vdbox_sfc_access |= BIT(i);
> +		logical_vdbox++;
>   	}
>   	drm_dbg(&i915->drm, "vdbox enable: %04x, instances: %04lx\n",
>   		vdbox_mask, VDBOX_MASK(gt));
> 

Regards,

Tvrtko
