Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74229703069
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 16:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E120610E212;
	Mon, 15 May 2023 14:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC4510E20D;
 Mon, 15 May 2023 14:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684161895; x=1715697895;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dbdYZxpv8Dp836KhZ0+xTY5eyMUNNRfcGEvrAv4PrQ0=;
 b=I2R0HLxIFqKWlM9tYXqKzsU1mEInDWsStqCJCd7zpZcVP2t4VQRgv+a1
 VzotjXxm4e7DbTAL/dPEVcoPb+xbm/3Itkh4/b3QUpoWUfoxFU5NLDI3Q
 JoEwTIk9S2tnu9RUImcxGXE6TQt9+VhwZkr0afLJ803kxkGz/DcFE5RJ4
 T+yxD0gFGs5aKK0sqj0Ags0VGZ9JKPdr7VpPYkGm8mZhGWWXAwxEFKEsW
 lzeeFMK9B2dltXxegGUVZ80M3Ci2wWQt1u6jPqVwax8iQTtBUGBOTq7+4
 JSTuCtPv7Z6Vb0Msys4q99hPntnkOmtDJ4Ricqf8FfJczTXoQPhf+kGjR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="416870168"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="416870168"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 07:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="695035485"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="695035485"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga007.jf.intel.com with SMTP; 15 May 2023 07:44:51 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 15 May 2023 17:44:51 +0300
Date: Mon, 15 May 2023 17:44:51 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 05/13] drm/i915/intel_cdclk: Add vdsc with bigjoiner
 constraints on min_cdlck
Message-ID: <ZGJFYziCKeW-vfpF@intel.com>
References: <20230512062417.2584427-1-ankit.k.nautiyal@intel.com>
 <20230512062417.2584427-6-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230512062417.2584427-6-ankit.k.nautiyal@intel.com>
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

On Fri, May 12, 2023 at 11:54:09AM +0530, Ankit Nautiyal wrote:
> As per Bsepc:49259, Bigjoiner BW check puts restriction on the
> compressed bpp for a given CDCLK, pixelclock in cases where
> Bigjoiner + DSC are used.
> 
> Currently compressed bpp is computed first, and it is ensured that
> the bpp will work at least with the max CDCLK freq.
> 
> Since the CDCLK is computed later, lets account for Bigjoiner BW
> check while calculating Min CDCLK.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 49 ++++++++++++++++++----
>  1 file changed, 42 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
> index 6bed75f1541a..3532640c5027 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -2520,6 +2520,46 @@ static int intel_planes_min_cdclk(const struct intel_crtc_state *crtc_state)
>  	return min_cdclk;
>  }
>  
> +static int intel_vdsc_min_cdclk(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
> +	int min_cdclk = 0;
> +
> +	/*
> +	 * When we decide to use only one VDSC engine, since
> +	 * each VDSC operates with 1 ppc throughput, pixel clock
> +	 * cannot be higher than the VDSC clock (cdclk)
> +	 */
> +	if (!crtc_state->dsc.dsc_split)
> +		min_cdclk = max(min_cdclk, (int)crtc_state->pixel_rate);
> +
> +	if (crtc_state->bigjoiner_pipes) {
> +		/*
> +		 * According to Bigjoiner bw check:
> +		 * compressed_bpp <= PPC * CDCLK * Big joiner Interface bits / Pixel clock
> +		 *
> +		 * We have already computed compressed_bpp, so now compute the min CDCLK that
> +		 * is required to support this compressed_bpp.
> +		 *
> +		 * => CDCLK >= compressed_bpp * Pixel clock / (PPC * Bigjoiner Interface bits)
> +		 *
> +		 * Since Num of pipes joined = 2, and PPC = 2 with bigjoiner
> +		 * => CDCLK >= compressed_bpp * pixel_rate  / Bigjoiner Interface bits
> +		 *
> +		 * #TODO Bspec mentions to account for FEC overhead while using pixel clock.
> +		 * Check if we need to use FEC overhead in the above calculations.
> +		 */
> +		int bigjoiner_interface_bits = DISPLAY_VER(i915) > 13 ? 36 : 24;
> +		int min_cdclk_bj = crtc_state->dsc.compressed_bpp * crtc_state->pixel_rate /
> +				   bigjoiner_interface_bits;

pixel_rate is the downscale adjusted thing, so it doesn't seem
like the correct thing to use here.

Hmm. Assuming that the single VDSC engine really throttles the entire
pipe to 1 PPC then we should probably account for the 1 vs. 2 PPC
difference in *_plane_min_cdclk() and intel_pixel_rate_to_cdclk()
directly. Currently all of those assume 2 PPC.

> +
> +		min_cdclk = max(min_cdclk, min_cdclk_bj);
> +	}
> +
> +	return min_cdclk;
> +}
> +
>  int intel_crtc_compute_min_cdclk(const struct intel_crtc_state *crtc_state)
>  {
>  	struct drm_i915_private *dev_priv =
> @@ -2591,13 +2631,8 @@ int intel_crtc_compute_min_cdclk(const struct intel_crtc_state *crtc_state)
>  	/* Account for additional needs from the planes */
>  	min_cdclk = max(intel_planes_min_cdclk(crtc_state), min_cdclk);
>  
> -	/*
> -	 * When we decide to use only one VDSC engine, since
> -	 * each VDSC operates with 1 ppc throughput, pixel clock
> -	 * cannot be higher than the VDSC clock (cdclk)
> -	 */
> -	if (crtc_state->dsc.compression_enable && !crtc_state->dsc.dsc_split)
> -		min_cdclk = max(min_cdclk, (int)crtc_state->pixel_rate);
> +	if (crtc_state->dsc.compression_enable)
> +		min_cdclk = max(min_cdclk, intel_vdsc_min_cdclk(crtc_state));
>  
>  	/*
>  	 * HACK. Currently for TGL/DG2 platforms we calculate
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
