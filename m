Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27136BA4ACD
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 18:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA67410EAA5;
	Fri, 26 Sep 2025 16:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cFVa5au1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA8E10EAA5;
 Fri, 26 Sep 2025 16:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758904704; x=1790440704;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pac1Mv7zTZoaja3rdv8S45+ytdxw89jXZXk5fwVx+Js=;
 b=cFVa5au1dC70kVEjDvAvtz4dR0umnJkh7TPSxzieJnX+pOmRtad6FkFT
 Oz4lmgE2qpXsKuQHJiTwkoHL7NInXgMjoh4NTRqZ04vua09XRBNtbylIk
 MtOScvF750+ritEFhcJHktWHzXWU47oLNYB5JX2Gb9oUXPA46glYKoiY9
 ai10h8AhvAjcQwrlK6g2SoVoL42SW20byutGoB2aLGwXz2sGOCHKIHYBB
 gxykV/A+emfONfNQhRt1pY8gWMJ3T2FVPGDxJBukFpQzwGiWGrJiV8fyF
 /4jPtCGNGAYNtxfSmrZa/8ekBPXLJcfz89OR2n4J++D+xIMv7DXmJ3uVQ A==;
X-CSE-ConnectionGUID: yg2DNNDfSbCErXqYb5YiMQ==
X-CSE-MsgGUID: pMUspF9HQGanNE1WzE+38g==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="72674997"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="72674997"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 09:38:24 -0700
X-CSE-ConnectionGUID: gg0p/+o2QdOidic9vrfR6Q==
X-CSE-MsgGUID: TMR6VpQ0SQeyVlFCxZJFJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="182060316"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.11])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 09:38:21 -0700
Date: Fri, 26 Sep 2025 19:38:19 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/6] drm/dp: Add helpers to query the branch DSC max
 throughput/line-width
Message-ID: <aNbBe86ubBUMF3L8@intel.com>
References: <20250924152332.359768-1-imre.deak@intel.com>
 <20250924152332.359768-3-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250924152332.359768-3-imre.deak@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Wed, Sep 24, 2025 at 06:23:28PM +0300, Imre Deak wrote:
> Add helpers to query the DP branch device's per-slice throughput as well
> as overall throughput and line-width capabilities.
> 
> Cc: dri-devel@lists.freedesktop.org
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 133 ++++++++++++++++++++++++
>  include/drm/display/drm_dp.h            |   1 +
>  include/drm/display/drm_dp_helper.h     |   5 +
>  3 files changed, 139 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 1c74fe9459ad9..9d9928daaab59 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2844,6 +2844,139 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
>  }
>  EXPORT_SYMBOL(drm_dp_dsc_sink_supported_input_bpcs);
>  
> +/*
> + * See DP Standard v2.1a 2.8.4 Minimum Slices/Display, Table 2-159 and
> + * Appendix L.1 Derivation of Slice Count Requirements.
> + */
> +static int dsc_branch_min_slice_throughput(int pixel_clock)
> +{
> +	if (pixel_clock >= 4800000)
> +		return 600000;
> +	else if (pixel_clock >= 2700000)
> +		return 400000;
> +	else
> +		return 340000;

One slightly worrying thing in the spec says the ppr is the cumulative
rate for all streams feeding a single display. Then elsewhere it seems
to be saying this only applies to MST streams. So I guess multiple
links with SST doesn't count. And it's anyone's guess which way multiple
links with MST should be interpreted...

Anyways, that's not really something this helper needs to deal with.
But perhaps the "pixel_clock" needs to be changed to something else.
So just "peak_pixel_rate"? Or maybe even "cumulative_peak_pixel_rate" 
for extra clarity?

> +}
> +
> +/**
> + * drm_dp_dsc_branch_max_slice_throughput() - Branch device's max DSC pixel throughput per slice
> + * @dsc_dpcd: DSC capabilities from DPCD
> + * @pixel_clock: Pixel clock of mode in kHz
> + * @is_rgb_yuv444: The mode is either RGB or YUV444
> + *
> + * Return the branch device's maximum per slice DSC pixel throughput, based on
> + * the device's DPCD DSC capabilities, @pixel_clock and whether the output
> + * format @is_rgb_yuv444 or yuv422/yuv420.
> + *
> + * Returns:
> + * The maximum DSC pixel throughput per slice supported by the branch device
> + * in kPixels/sec.
> + */
> +int drm_dp_dsc_branch_max_slice_throughput(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],

The "branch" in the name doesn't seem correct. Isn't this
some kind of "DSC sink" limit?

> +					   int pixel_clock, bool is_rgb_yuv444)
> +{
> +	int throughput;
> +
> +	throughput = dsc_dpcd[DP_DSC_PEAK_THROUGHPUT - DP_DSC_SUPPORT];
> +
> +	if (is_rgb_yuv444)
> +		throughput = (throughput & DP_DSC_THROUGHPUT_MODE_0_MASK) >>
> +			     DP_DSC_THROUGHPUT_MODE_0_SHIFT;
> +	else
> +		throughput = (throughput & DP_DSC_THROUGHPUT_MODE_1_MASK) >>
> +			     DP_DSC_THROUGHPUT_MODE_1_SHIFT;
> +
> +	switch (throughput) {
> +	case 0:
> +		return dsc_branch_min_slice_throughput(pixel_clock);
> +	case 1:
> +		return 340000;
> +	case 2 ... 14:
> +		return 400000 + 50000 * (throughput - 2);
> +	case 15:
> +		return 170000;
> +	default:
> +		WARN(1, "Missing case %d\n", throughput);
> +		return 340000;
> +	}
> +}
> +EXPORT_SYMBOL(drm_dp_dsc_branch_max_slice_throughput);
> +
> +static u8 dsc_branch_dpcd_cap(const u8 dpcd[DP_DSC_BRANCH_CAP_SIZE], int reg)
> +{
> +	return dpcd[reg - DP_DSC_BRANCH_OVERALL_THROUGHPUT_0];
> +}
> +
> +/**
> + * drm_dp_dsc_branch_max_overall_throughput() - Branch device's max overall DSC pixel throughput
> + * @dsc_branch_dpcd: DSC branch capabilities from DPCD
> + * @is_rgb_yuv444: The mode is either RGB or YUV444
> + *
> + * Return the branch device's maximum overall DSC pixel throughput, based on
> + * the device's DPCD DSC branch capabilities, and whether the output
> + * format @is_rgb_yuv444 or yuv422/yuv420.
> + *
> + * Returns:
> + * - 0:   The maximum overall throughput capability is not indicated by
> + *        the device separately and it must be determined from the per-slice
> + *        max throughput (see @drm_dp_dsc_branch_slice_max_throughput())
> + *        and the maximum slice count supported by the device.
> + * - > 0: The maximum overall DSC pixel throughput supported by the branch
> + *        device in kPixels/sec.
> + */
> +int drm_dp_dsc_branch_max_overall_throughput(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE],
> +					     bool is_rgb_yuv444)
> +{
> +	int throughput;
> +
> +	if (is_rgb_yuv444)
> +		throughput = dsc_branch_dpcd_cap(dsc_branch_dpcd,
> +						 DP_DSC_BRANCH_OVERALL_THROUGHPUT_0);
> +	else
> +		throughput = dsc_branch_dpcd_cap(dsc_branch_dpcd,
> +						 DP_DSC_BRANCH_OVERALL_THROUGHPUT_1);
> +
> +	switch (throughput) {
> +	case 0:
> +		return 0;
> +	case 1:
> +		return 680000;
> +	default:
> +		return 600000 + 50000 * throughput;
> +	}
> +}
> +EXPORT_SYMBOL(drm_dp_dsc_branch_max_overall_throughput);
> +
> +/**
> + * drm_dp_dsc_branch_max_line_width() - Branch device's max DSC line width
> + * @dsc_branch_dpcd: DSC branch capabilities from DPCD
> + *
> + * Return the branch device's maximum overall DSC line width, based on
> + * the device's @dsc_branch_dpcd capabilities.
> + *
> + * Returns:
> + * - 0:        The maximum line width is not indicated by the device
> + *             separately and it must be determined from the maximum
> + *             slice count and slice-width supported by the device.
> + * - %-EINVAL: The device indicates an invalid maximum line width
> + *             (< 2560 pixels).
> + * - >= 2560:  The maximum line width in pixels.
> + */
> +int drm_dp_dsc_branch_max_line_width(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE])
> +{
> +	int line_width = dsc_branch_dpcd_cap(dsc_branch_dpcd, DP_DSC_BRANCH_MAX_LINE_WIDTH);
> +
> +	switch (line_width) {
> +	case 0:
> +		return 0;
> +	case 1 ... 7:
> +		return -EINVAL;
> +	default:
> +		return line_width * 320;
> +	}
> +}
> +EXPORT_SYMBOL(drm_dp_dsc_branch_max_line_width);
> +
>  static int drm_dp_read_lttpr_regs(struct drm_dp_aux *aux,
>  				  const u8 dpcd[DP_RECEIVER_CAP_SIZE], int address,
>  				  u8 *buf, int buf_size)
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index cf318e3ddb5c5..43978ddd15056 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1686,6 +1686,7 @@ enum drm_dp_phy {
>  #define DP_BRANCH_OUI_HEADER_SIZE	0xc
>  #define DP_RECEIVER_CAP_SIZE		0xf
>  #define DP_DSC_RECEIVER_CAP_SIZE        0x10 /* DSC Capabilities 0x60 through 0x6F */
> +#define DP_DSC_BRANCH_CAP_SIZE		3
>  #define EDP_PSR_RECEIVER_CAP_SIZE	2
>  #define EDP_DISPLAY_CTL_CAP_SIZE	5
>  #define DP_LTTPR_COMMON_CAP_SIZE	8
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index e438c44409952..cb0cd13d632d2 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -211,6 +211,11 @@ u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
>  u8 drm_dp_dsc_sink_line_buf_depth(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
>  int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpc[DP_DSC_RECEIVER_CAP_SIZE],
>  					 u8 dsc_bpc[3]);
> +int drm_dp_dsc_branch_max_slice_throughput(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
> +					   int mode_clock, bool is_rgb_yuv444);
> +int drm_dp_dsc_branch_max_overall_throughput(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE],
> +					     bool is_rgb_yuv444);
> +int drm_dp_dsc_branch_max_line_width(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE]);
>  
>  static inline bool
>  drm_dp_sink_supports_dsc(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
> -- 
> 2.49.1

-- 
Ville Syrjälä
Intel
