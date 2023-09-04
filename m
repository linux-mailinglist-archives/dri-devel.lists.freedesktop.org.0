Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 711D3791030
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 04:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD00410E281;
	Mon,  4 Sep 2023 02:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8EC10E281;
 Mon,  4 Sep 2023 02:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693795996; x=1725331996;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PdSreeHi69xtNSRx7r99DqJLAzGyuw0+MVwLHFkzqMU=;
 b=Z6V6YNZi3ZinCX1yi3cHOKwEjgMwyLd/E0xhY5V+RDVTe29aXgXLK53b
 uFK2Wii7yQbrD0xKDmO6S37nmn43bosHSprebXSRqmnMic2P/il8QzgWo
 nhpcbyb8HcIuFEA81zFaLy0Q1i7dLME8YIuTBPE+wF3zWO44+hDPwQS4I
 kjO79cQ12YaukBMuGNMa5Hwk2mk9s+qNzelKOyyITiHWgtUwlHs2a8rVS
 i7uaTNZEyufuyHvY/y0rsiF5jFzVhgzUbvfA2UnsT1zzSIHfcfNhI7dr6
 xki0HVXZHBYKfeHUgzj2HbhXZjbdJRW8YoOYjG/QlcbhXEZR0d79UO7ir A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="380297323"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; d="scan'208";a="380297323"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2023 19:53:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="883879938"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; d="scan'208";a="883879938"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by fmsmga001.fm.intel.com with SMTP; 03 Sep 2023 19:53:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 04 Sep 2023 05:53:11 +0300
Date: Mon, 4 Sep 2023 05:53:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 09/22] drm/dp_mst: Fix fractional bpp
 scaling in drm_dp_calc_pbn_mode()
Message-ID: <ZPVGl4iQEvgtZz3f@intel.com>
References: <20230824080517.693621-1-imre.deak@intel.com>
 <20230824080517.693621-10-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230824080517.693621-10-imre.deak@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 11:05:04AM +0300, Imre Deak wrote:
> For fractional bpp values passed to the function in a .4 fixed point
> format, the fractional part is currently ignored due to scaling bpp too
> early. Fix this by scaling the overhead factor instead and to avoid an
> overflow multiplying bpp with the overhead factor instead of the clock
> rate.
> 
> While at it simplify the formula, and pass the expected fixed point bpp
> values in the kunit tests.
> 
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c  | 7 ++-----
>  drivers/gpu/drm/tests/drm_dp_mst_helper_test.c | 8 ++++----
>  2 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index ed96cfcfa3040..bd0f35a0ea5fb 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -4712,12 +4712,9 @@ int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc)
>  	 * factor in the numerator rather than the denominator to avoid
>  	 * integer overflow
>  	 */
> +	u32 bpp_m = (dsc ? 64 / 16 : 64) * 1006 * bpp;
>  
> -	if (dsc)
> -		return DIV_ROUND_UP_ULL(mul_u32_u32(clock * (bpp / 16), 64 * 1006),
> -					8 * 54 * 1000 * 1000);
> -
> -	return DIV_ROUND_UP_ULL(mul_u32_u32(clock * bpp, 64 * 1006),
> +	return DIV_ROUND_UP_ULL(mul_u32_u32(clock, bpp_m),
>  				8 * 54 * 1000 * 1000);

I thought I sorted out this mess already...
https://patchwork.freedesktop.org/patch/535005/?series=117201&rev=3
Apparently I forgot to push that.

>  }
>  EXPORT_SYMBOL(drm_dp_calc_pbn_mode);
> diff --git a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
> index 545beea33e8c7..ea2182815ebe8 100644
> --- a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
> @@ -40,15 +40,15 @@ static const struct drm_dp_mst_calc_pbn_mode_test drm_dp_mst_calc_pbn_mode_cases
>  	},
>  	{
>  		.clock = 332880,
> -		.bpp = 24,
> +		.bpp = 24 << 4,
>  		.dsc = true,
> -		.expected = 50
> +		.expected = 1191
>  	},
>  	{
>  		.clock = 324540,
> -		.bpp = 24,
> +		.bpp = 24 << 4,
>  		.dsc = true,
> -		.expected = 49
> +		.expected = 1161
>  	},
>  };
>  
> -- 
> 2.37.2

-- 
Ville Syrjälä
Intel
