Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E865F5138
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 10:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE3110E1AB;
	Wed,  5 Oct 2022 08:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D1D10E1AB;
 Wed,  5 Oct 2022 08:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664960121; x=1696496121;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=PAMzlPy8xXqCuMGUI5kJ3ducvgdsZTKRFiblO/VmJOQ=;
 b=ipTTrx9j0324Fw8gH0tjIJrJ9egyDm4Y3Tun8K55EB+JoRINNcwkMW69
 rOrFWV/2kJ5ojWSGVOFovj/i4Cwz251SZ5j57OBWwoEaR4L6o3B44cDNA
 SRppeyrymW1DdtNDq/aSVTX01hsiWDVYpUP3vmqyHOoO4+KQFxg5Dnz9f
 0gH07En1txFmuspJzbaWTkHQVy9trg5z62dNPDljpE7clrt3iOoQgIAPA
 MDjQIZX3mbhIB0y0txDrXGUY8RWJXhVEzH9kW316kCnVih7Z1s6VglbgN
 3/nx8scMEADjAVCit8KVevgKuBbcmY0AGdE/mkbIS1bFHxOVWJLLv/75v Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="286326394"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="286326394"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 01:55:20 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="657446007"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="657446007"
Received: from gionescu-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.39.173])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 01:55:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/i915/slpc: Update the frequency
 debugfs
In-Reply-To: <20221004222903.23898-3-vinay.belgaumkar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221004222903.23898-1-vinay.belgaumkar@intel.com>
 <20221004222903.23898-3-vinay.belgaumkar@intel.com>
Date: Wed, 05 Oct 2022 11:55:16 +0300
Message-ID: <87bkqqsl8r.fsf@intel.com>
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

On Tue, 04 Oct 2022, Vinay Belgaumkar <vinay.belgaumkar@intel.com> wrote:
> Read the values stored in the SLPC structures. Remove the
> fields that are no longer valid (like RPS interrupts) as
> well.
>
> v2: Move all functionality changes to this patch (Jani)
>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_rps.c | 46 ++++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 737db780db00..8181d85e89f8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -2219,7 +2219,7 @@ u32 intel_rps_get_rpn_frequency(struct intel_rps *rps)
>  		return intel_gpu_freq(rps, rps->min_freq);
>  }
>  
> -void gen6_rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
> +void rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
>  {
>  	struct intel_gt *gt = rps_to_gt(rps);
>  	struct drm_i915_private *i915 = gt->i915;
> @@ -2382,6 +2382,50 @@ void gen6_rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
>  		   intel_gpu_freq(rps, rps->efficient_freq));
>  }
>  
> +static void slpc_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	struct intel_uncore *uncore = gt->uncore;
> +	struct intel_rps_freq_caps caps;
> +	u32 pm_mask;
> +
> +	gen6_rps_get_freq_caps(rps, &caps);
> +	pm_mask = intel_uncore_read(uncore, GEN6_PMINTRMSK);
> +
> +	drm_printf(p, "PM MASK=0x%08x\n", pm_mask);
> +	drm_printf(p, "pm_intrmsk_mbz: 0x%08x\n",
> +		   rps->pm_intrmsk_mbz);
> +	drm_printf(p, "RPSTAT1: 0x%08x\n", intel_uncore_read(uncore, GEN6_RPSTAT1));
> +	drm_printf(p, "RPNSWREQ: %dMHz\n", intel_rps_get_requested_frequency(rps));
> +	drm_printf(p, "Lowest (RPN) frequency: %dMHz\n",
> +		   intel_gpu_freq(rps, caps.min_freq));
> +	drm_printf(p, "Nominal (RP1) frequency: %dMHz\n",
> +		   intel_gpu_freq(rps, caps.rp1_freq));
> +	drm_printf(p, "Max non-overclocked (RP0) frequency: %dMHz\n",
> +		   intel_gpu_freq(rps, caps.rp0_freq));
> +	drm_printf(p, "Current freq: %d MHz\n",
> +		   intel_rps_get_requested_frequency(rps));
> +	drm_printf(p, "Actual freq: %d MHz\n",
> +		   intel_rps_read_actual_frequency(rps));
> +	drm_printf(p, "Min freq: %d MHz\n",
> +		   intel_rps_get_min_frequency(rps));
> +	drm_printf(p, "Boost freq: %d MHz\n",
> +		   intel_rps_get_boost_frequency(rps));
> +	drm_printf(p, "Max freq: %d MHz\n",
> +		   intel_rps_get_max_frequency(rps));
> +	drm_printf(p,
> +		   "efficient (RPe) frequency: %d MHz\n",
> +		   intel_gpu_freq(rps, caps.rp1_freq));
> +}
> +
> +void gen6_rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
> +{
> +	if (!rps_uses_slpc(rps))

Please don't use "if not" when you have two branches like this. Just
flip them around and use the positive.

BR,
Jani.


> +		return rps_frequency_dump(rps, p);
> +	else
> +		return slpc_frequency_dump(rps, p);
> +}
> +
>  static int set_max_freq(struct intel_rps *rps, u32 val)
>  {
>  	struct drm_i915_private *i915 = rps_to_i915(rps);

-- 
Jani Nikula, Intel Open Source Graphics Center
