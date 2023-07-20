Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8E075AABE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 11:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B49110E58C;
	Thu, 20 Jul 2023 09:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D2410E58B;
 Thu, 20 Jul 2023 09:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689845349; x=1721381349;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LwyYG3kq73k6xlbMi77IIXREUaRBdAaGhm1/R2UVDMM=;
 b=cXZff/b8OQXxlCvWv73q+Dk9o1lAJOGSzXZw/imM9hw3zv8n5HKP3dK/
 eBFn2ayr22pvqq2YOruhweQG3SQTn/JlXsrktxw904Krt4so7A3m/6NE7
 7I+0WwIM+vc8ipgNcLM7s2/9DgwYeDnCMfng0i29Z9B1TmdXv+R7KTEUk
 cHZxENBpM6oUcdP9QoVoYMNY7mvT8HK8v4pDVzkmjW0Hs4GFVChw9/i+5
 oAg8zu6dnmUBDQ6tYgARYddnZXNmy5FRYA+Py0dPErjrSbmDuscJh2coV
 yrmSSPQkdECEr9IJgcJQv5KiVO9EVE5RlKDhfSji3ueWZuGKqhy4+ofPR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="370251306"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="370251306"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 02:29:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="701561877"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="701561877"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 02:29:07 -0700
Date: Thu, 20 Jul 2023 12:29:04 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 05/19] drm/i915/dp: Update Bigjoiner interface bits for
 computing compressed bpp
Message-ID: <ZLj+YEpuQMDcogN4@intel.com>
References: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
 <20230713103346.1163315-6-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230713103346.1163315-6-ankit.k.nautiyal@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, anusha.srivatsa@intel.com,
 dri-devel@lists.freedesktop.org, navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 13, 2023 at 04:03:32PM +0530, Ankit Nautiyal wrote:
> In Bigjoiner check for DSC, bigjoiner interface bits for DP for
> DISPLAY > 13 is 36 (Bspec: 49259).
> 
> v2: Corrected Display ver to 13.
> 
> v3: Follow convention for conditional statement. (Ville)
> 
> v4: Fix check for display ver. (Ville)
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 19768ac658ba..c1fd448d80e1 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -802,8 +802,9 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
>  	bits_per_pixel = min(bits_per_pixel, max_bpp_small_joiner_ram);
>  
>  	if (bigjoiner) {
> +		int bigjoiner_interface_bits = DISPLAY_VER(i915) >= 14 ? 36 : 24;
>  		u32 max_bpp_bigjoiner =
> -			i915->display.cdclk.max_cdclk_freq * 48 /
> +			i915->display.cdclk.max_cdclk_freq * 2 * bigjoiner_interface_bits /

Probably "num_vdsc_instances = intel_dsc_get_num_vdsc_instances(crtc_state);" again,
instead of "2"? 

With that clarified, 

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

>  			intel_dp_mode_to_fec_clock(mode_clock);
>  
>  		bits_per_pixel = min(bits_per_pixel, max_bpp_bigjoiner);
> -- 
> 2.40.1
> 
