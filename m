Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82928702EB8
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 15:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86DD10E1D5;
	Mon, 15 May 2023 13:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11F310E1D5;
 Mon, 15 May 2023 13:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684158671; x=1715694671;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=j7T61y8BuhzBAuiqVQj29xbrPcpXMiytN/YPhkiOn2M=;
 b=AyxaviuL9AD7ZaiFfiuLgvQ4hNanXZM6ahDZKNFCiTKm9W310YZ/IcHi
 /wn+sibLp4YpNhZsTZAgz5aq86uvIP2bfBTqN6f+kI3zdUpU5FRO0IEkI
 PBfgTMPn/fvxoIfGebVvtY0CdeYfHlxcofdZMDo2iySyC4If+X5Azfv09
 PY/0JKamBS5iILPPMOCrxhYBIULOKykXnr7QdQTbsgGO6isfwHcouOfNF
 CNTWcmyWk01IA0pAv2gZCfJC9tc3kiwY8DbD2jisp1ncTPWaHnp1EE/SY
 ZIZ5Iboplepn9nKT3y57itxcfnY3iLWVfO9BWAoL7cGQ0I1C9QwsNszUy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="414601112"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="414601112"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 06:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="700966526"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="700966526"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga002.jf.intel.com with SMTP; 15 May 2023 06:51:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 15 May 2023 16:51:07 +0300
Date: Mon, 15 May 2023 16:51:07 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 04/13] drm/i915/dp: Update Bigjoiner interface bits for
 computing compressed bpp
Message-ID: <ZGI4y-6NKngtl0wh@intel.com>
References: <20230512062417.2584427-1-ankit.k.nautiyal@intel.com>
 <20230512062417.2584427-5-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230512062417.2584427-5-ankit.k.nautiyal@intel.com>
X-Patchwork-Hint: comment
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
Cc: stanislav.lisovskiy@intel.com, intel-gfx@lists.freedesktop.org,
 anusha.srivatsa@intel.com, navaremanasi@google.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 11:54:08AM +0530, Ankit Nautiyal wrote:
> In Bigjoiner check for DSC, bigjoiner interface bits for DP for
> DISPLAY > 13 is 36 (Bspec: 49259).
> 
> v2: Corrected Display ver to 13.
> 
> v3: Follow convention for conditional statement. (Ville)
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 24de25551a49..bca80c0793e9 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -783,8 +783,9 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
>  	bits_per_pixel = min(bits_per_pixel, max_bpp_small_joiner_ram);
>  
>  	if (bigjoiner) {
> +		int bigjoiner_interface_bits = DISPLAY_VER(i915) > 13 ? 36 : 24;

'x >= 14' is the usual convention.

with that
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>  		u32 max_bpp_bigjoiner =
> -			i915->display.cdclk.max_cdclk_freq * 48 /
> +			i915->display.cdclk.max_cdclk_freq * 2 * bigjoiner_interface_bits /
>  			intel_dp_mode_to_fec_clock(mode_clock);
>  
>  		bits_per_pixel = min(bits_per_pixel, max_bpp_bigjoiner);
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
