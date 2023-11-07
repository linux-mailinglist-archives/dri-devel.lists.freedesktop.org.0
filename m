Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF86B7E45EE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 17:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD20610E611;
	Tue,  7 Nov 2023 16:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB6110E611;
 Tue,  7 Nov 2023 16:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699374250; x=1730910250;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lfYBtwpGnYqFTHraBV3veQq67A3UWZf4Fhz9bkojw3Y=;
 b=WRxPyg35Boe9154l8HKO1APtmrYSDwSEgMzmni06zVO6Zh8gnKT43BEN
 MprZ83gVu/SEkWuhwzfswXyLWg1Ku7Rwz6HnMJmBBw0RdiFe/zDHeBimG
 uc75ETOUPb/9sA6Jx2M7AYu6nuLjXnimvIoROKbKKnJ71lwmvSS5pX0Zh
 qLLi3Xbm/1elmwVSADPQpYD6E/TCFhZbp/znF2l7iI3oJ+M+FQem/rg+T
 XQHzlxbIBD8FhHjGkHSZ4XdoOLoY/eIeMic3854v/s3P8p8bXr8fp8ON4
 VIPoahmV2yY2zdSeWcKToeyh2EpxFPisHXpi4cP/GJkDAgr+L7Is1Blwi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="388418067"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="388418067"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 08:24:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="756243152"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="756243152"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 07 Nov 2023 08:24:05 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 07 Nov 2023 18:24:04 +0200
Date: Tue, 7 Nov 2023 18:24:04 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v4 09/30] drm/dp: Add helpers to calculate the link BW
 overhead
Message-ID: <ZUpkpH-nddJQt_OR@intel.com>
References: <20231030155843.2251023-1-imre.deak@intel.com>
 <20231030155843.2251023-10-imre.deak@intel.com>
 <ZUlbR4FGcRPuXXfM@intel.com>
 <ZUloiFDQkl+om9wX@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZUloiFDQkl+om9wX@ideak-desk.fi.intel.com>
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
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 intel-gfx@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 07, 2023 at 12:28:24AM +0200, Imre Deak wrote:
> On Mon, Nov 06, 2023 at 11:31:51PM +0200, Ville Syrjälä wrote:
> > On Mon, Oct 30, 2023 at 05:58:22PM +0200, Imre Deak wrote:
> > > Add helpers drivers can use to calculate the BW allocation overhead -
> > > due to SSC, FEC, DSC and data alignment on symbol cycles - and the
> > > channel coding efficiency - due to the 8b/10b, 128b/132b encoding. On
> > > 128b/132b links the FEC overhead is part of the coding efficiency, so
> > > not accounted for in the BW allocation overhead.
> > > 
> > > The drivers can use these functions to calculate a ratio, controlling
> > > the stream symbol insertion rate of the source device in each SST TU
> > > or MST MTP frame. Drivers can calculate this
> > > 
> > > m/n = (pixel_data_rate * drm_dp_bw_overhead()) /
> > >       (link_data_rate * drm_dp_bw_channel_coding_efficiency())
> > > 
> > > ratio for a given link and pixel stream and with that the
> > > 
> > > mtp_count = CEIL(64 * m / n)
> > > 
> > > allocated MTPs for the stream in a link frame and
> > > 
> > > pbn = CEIL(64 * dm_mst_get_pbn_divider() * m / n)
> > > 
> > > allocated PBNs for the stream on the MST link path.
> > > 
> > > Take drm_dp_bw_overhead() into use in drm_dp_calc_pbn_mode(), for
> > > drivers calculating the PBN value directly.
> > > 
> > > v2:
> > > - Add dockbook description to drm_dp_bw_channel_coding_efficiency().
> > >   (LKP).
> > > - Clarify the way m/n ratio is calculated in the commit log.
> > > v3:
> > > - Fix compile breakage for !CONFIG_BACKLIGHT_CLASS_DEVICE. (LKP)
> > > - Account for FEC_PM overhead (+ 0.0015625 %), add comment
> > >   with the formula to calculate the total FEC overhead. (Ville)
> > > v4:
> > > - Rename DRM_DP_OVERHEAD_SSC to DRM_DP_OVERHEAD_SSC_REF_CLK. (Ville)
> > > 
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > Cc: kernel test robot <lkp@intel.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com> (v2)
> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > ---
> > >  drivers/gpu/drm/display/drm_dp_helper.c       | 132 ++++++++++++++++++
> > >  drivers/gpu/drm/display/drm_dp_mst_topology.c |  23 ++-
> > >  include/drm/display/drm_dp_helper.h           |  11 ++
> > >  3 files changed, 160 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > > index e5d7970a9ddd0..72ba9ae89f862 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > > @@ -3900,3 +3900,135 @@ int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux)
> > >  EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
> > >  
> > >  #endif
> > > +
> > > +/* See DP Standard v2.1 2.6.4.4.1.1, 2.8.4.4, 2.8.7 */
> > > +static int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
> > > +				     int symbol_size, bool is_mst)
> > > +{
> > > +	int cycles = DIV_ROUND_UP(pixels * bpp_x16, 16 * symbol_size * lane_count);
> > > +	int align = is_mst ? 4 / lane_count : 1;
> > > +
> > > +	return ALIGN(cycles, align);
> > > +}
> > > +
> > > +static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_count,
> > > +					 int bpp_x16, int symbol_size, bool is_mst)
> > > +{
> > > +	int slice_pixels = DIV_ROUND_UP(pixels, slice_count);
> > > +	int slice_data_cycles = drm_dp_link_symbol_cycles(lane_count, slice_pixels,
> > > +							  bpp_x16, symbol_size, is_mst);
> > > +	int slice_eoc_cycles = is_mst ? 4 / lane_count : 1;
> > > +
> > > +	return slice_count * (slice_data_cycles + slice_eoc_cycles);
> > > +}
> > > +
> > > +/**
> > > + * drm_dp_bw_overhead - Calculate the BW overhead of a DP link stream
> > > + * @lane_count: DP link lane count
> > > + * @hactive: pixel count of the active period in one scanline of the stream
> > > + * @dsc_slice_count: DSC slice count if @flags/DRM_DP_LINK_BW_OVERHEAD_DSC is set
> > > + * @bpp_x16: bits per pixel in .4 binary fixed point
> > > + * @flags: DRM_DP_OVERHEAD_x flags
> > > + *
> > > + * Calculate the BW allocation overhead of a DP link stream, depending
> > > + * on the link's
> > > + * - @lane_count
> > > + * - SST/MST mode (@flags / %DRM_DP_OVERHEAD_MST)
> > > + * - symbol size (@flags / %DRM_DP_OVERHEAD_UHBR)
> > > + * - FEC mode (@flags / %DRM_DP_OVERHEAD_FEC)
> > > + * - SSC/REF_CLK mode (@flags / %DRM_DP_OVERHEAD_SSC_REF_CLK)
> > > + * as well as the stream's
> > > + * - @hactive timing
> > > + * - @bpp_x16 color depth
> > > + * - compression mode (@flags / %DRM_DP_OVERHEAD_DSC).
> > > + * Note that this overhead doesn't account for the 8b/10b, 128b/132b
> > > + * channel coding efficiency, for that see
> > > + * @drm_dp_link_bw_channel_coding_efficiency().
> > > + *
> > > + * Returns the overhead as 100% + overhead% in 1ppm units.
> > > + */
> > > +int drm_dp_bw_overhead(int lane_count, int hactive,
> > > +		       int dsc_slice_count,
> > > +		       int bpp_x16, unsigned long flags)
> > > +{
> > > +	int symbol_size = flags & DRM_DP_BW_OVERHEAD_UHBR ? 32 : 8;
> > > +	bool is_mst = flags & DRM_DP_BW_OVERHEAD_MST;
> > > +	u32 overhead = 1000000;
> > > +	int symbol_cycles;
> > > +
> > > +	/*
> > > +	 * DP Standard v2.1 2.6.4.1
> > > +	 * SSC downspread and ref clock variation margin:
> > > +	 *   5300ppm + 300ppm ~ 0.6%
> > > +	 */
> > > +	if (flags & DRM_DP_BW_OVERHEAD_SSC_REF_CLK)
> > > +		overhead += 6000;
> > > +
> > > +	/*
> > > +	 * DP Standard v2.1 2.6.4.1.1, 3.5.1.5.4:
> > > +	 * FEC symbol insertions for 8b/10b channel coding:
> > > +	 * After each 250 data symbols on 2-4 lanes:
> > > +	 *   250 LL + 5 FEC_PARITY_PH + 1 CD_ADJ   (256 byte FEC block)
> > > +	 * After each 2 x 250 data symbols on 1 lane:
> > > +	 *   2 * 250 LL + 11 FEC_PARITY_PH + 1 CD_ADJ (512 byte FEC block)
> > > +	 * After 256 (2-4 lanes) or 128 (1 lane) FEC blocks:
> > > +	 *   256 * 256 bytes + 1 FEC_PM
> > > +	 * or
> > > +	 *   128 * 512 bytes + 1 FEC_PM
> > > +	 * (256 * 6 + 1) / (256 * 250) = 2.4015625 %
> > > +	 */
> > > +	if (flags & DRM_DP_BW_OVERHEAD_FEC)
> > > +		overhead += 24016;
> > 
> > Hmm. Shouldn't we be multiplying the overheads, not add them up?
> > Though I suppose in this case the error won't be huge.
> 
> Yes logically these should be multiplied. I added them here, because
> that's what the spec does with explicitly mentioning the 3% total
> overhead.
>
> I presume it's a simplification, maybe because the 0.6%
> SSC+REF_CLK overhead is already a rounded-up value, the exact one being
> only 0.53% for SSC and 0.03% for REF_CLK.

Yeah, they also didn't bother multiplying those two together
and just added them together. But for the rest they rather just
give rough estimates instead of exact numbers.

However
 ((256*256+1)/(256*250))*1.0053 = ~1.02944
vs.
 1.0+0.006+0.024016 = 1.030016
so yeah, it does look like we should be safe with just
adding them up (and the rough 3% total the spec mentions
would also be safe).

> 
> > > +
> > > +	/*
> > > +	 * DP Standard v2.1 2.7.9, 5.9.7
> > > +	 * The FEC overhead for UHBR is accounted for in its 96.71% channel
> > > +	 * coding efficiency.
> > > +	 */
> > > +	WARN_ON((flags & DRM_DP_BW_OVERHEAD_UHBR) &&
> > > +		(flags & DRM_DP_BW_OVERHEAD_FEC));
> > > +
> > > +	if (flags & DRM_DP_BW_OVERHEAD_DSC)
> > > +		symbol_cycles = drm_dp_link_dsc_symbol_cycles(lane_count, hactive,
> > > +							      dsc_slice_count,
> > > +							      bpp_x16, symbol_size,
> > > +							      is_mst);
> > > +	else
> > > +		symbol_cycles = drm_dp_link_symbol_cycles(lane_count, hactive,
> > > +							  bpp_x16, symbol_size,
> > > +							  is_mst);
> > > +
> > > +	return DIV_ROUND_UP_ULL(mul_u32_u32(symbol_cycles * symbol_size * lane_count,
> > > +					    overhead * 16),
> > > +				hactive * bpp_x16);
> > > +}
> > > +EXPORT_SYMBOL(drm_dp_bw_overhead);
> > > +
> > > +/**
> > > + * drm_dp_bw_channel_coding_efficiency - Get a DP link's channel coding efficiency
> > > + * @is_uhbr: Whether the link has a 128b/132b channel coding
> > > + *
> > > + * Return the channel coding efficiency of the given DP link type, which is
> > > + * either 8b/10b or 128b/132b (aka UHBR). The corresponding overhead includes
> > > + * the 8b -> 10b, 128b -> 132b pixel data to link symbol conversion overhead
> > > + * and for 128b/132b any link or PHY level control symbol insertion overhead
> > > + * (LLCP, FEC, PHY sync, see DP Standard v2.1 3.5.2.18). For 8b/10b the
> > > + * corresponding FEC overhead is BW allocation specific, included in the value
> > > + * returned by drm_dp_bw_overhead().
> > > + *
> > > + * Returns the efficiency in the 100%/coding-overhead% ratio in
> > > + * 1ppm units.
> > > + */
> > > +int drm_dp_bw_channel_coding_efficiency(bool is_uhbr)
> > > +{
> > > +	if (is_uhbr)
> > > +		return 967100;
> > > +	else
> > > +		/*
> > > +		 * Note that on 8b/10b MST the efficiency is only
> > > +		 * 78.75% due to the 1 out of 64 MTPH packet overhead,
> > > +		 * not accounted for here.
> > > +		 */
> > > +		return 800000;
> > > +}
> > > +EXPORT_SYMBOL(drm_dp_bw_channel_coding_efficiency);
> > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > index cc0a8fe84d290..4d72c9a32026e 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > @@ -4726,17 +4726,28 @@ EXPORT_SYMBOL(drm_dp_check_act_status);
> > >  int drm_dp_calc_pbn_mode(int clock, int bpp)
> > >  {
> > >  	/*
> > > -	 * margin 5300ppm + 300ppm ~ 0.6% as per spec, factor is 1.006
> > >  	 * The unit of 54/64Mbytes/sec is an arbitrary unit chosen based on
> > >  	 * common multiplier to render an integer PBN for all link rate/lane
> > >  	 * counts combinations
> > >  	 * calculate
> > > -	 * peak_kbps *= (1006/1000)
> > > -	 * peak_kbps *= (64/54)
> > > -	 * peak_kbps *= 8    convert to bytes
> > > +	 * peak_kbps = clock * bpp / 16
> > > +	 * peak_kbps *= SSC overhead / 1000000
> > > +	 * peak_kbps /= 8    convert to Kbytes
> > > +	 * peak_kBps *= (64/54) / 1000    convert to PBN
> > >  	 */
> > > -	return DIV_ROUND_UP_ULL(mul_u32_u32(clock * bpp, 64 * 1006 >> 4),
> > > -				1000 * 8 * 54 * 1000);
> > > +	/*
> > > +	 * TODO: Use the actual link and mode parameters to calculate
> > > +	 * the overhead. For now it's assumed that these are
> > > +	 * 4 link lanes, 4096 hactive pixels, which don't add any
> > > +	 * significant data padding overhead and that there is no DSC
> > > +	 * or FEC overhead.
> > > +	 */
> > > +	int overhead = drm_dp_bw_overhead(4, 4096, 0, bpp,
> > > +					  DRM_DP_BW_OVERHEAD_MST |
> > > +					  DRM_DP_BW_OVERHEAD_SSC_REF_CLK);
> > > +
> > > +	return DIV64_U64_ROUND_UP(mul_u32_u32(clock * bpp, 64 * overhead >> 4),
> > > +				  1000000ULL * 8 * 54 * 1000);
> > >  }
> > >  EXPORT_SYMBOL(drm_dp_calc_pbn_mode);
> > >  
> > > diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> > > index da94932f4262b..caee29d28463c 100644
> > > --- a/include/drm/display/drm_dp_helper.h
> > > +++ b/include/drm/display/drm_dp_helper.h
> > > @@ -788,4 +788,15 @@ bool drm_dp_downstream_rgb_to_ycbcr_conversion(const u8 dpcd[DP_RECEIVER_CAP_SIZ
> > >  					       const u8 port_cap[4], u8 color_spc);
> > >  int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc);
> > >  
> > > +#define DRM_DP_BW_OVERHEAD_MST		BIT(0)
> > > +#define DRM_DP_BW_OVERHEAD_UHBR		BIT(1)
> > > +#define DRM_DP_BW_OVERHEAD_SSC_REF_CLK	BIT(2)
> > > +#define DRM_DP_BW_OVERHEAD_FEC		BIT(3)
> > > +#define DRM_DP_BW_OVERHEAD_DSC		BIT(4)
> > > +
> > > +int drm_dp_bw_overhead(int lane_count, int hactive,
> > > +		       int dsc_slice_count,
> > > +		       int bpp_x16, unsigned long flags);
> > > +int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
> > > +
> > >  #endif /* _DRM_DP_HELPER_H_ */
> > > -- 
> > > 2.39.2
> > 
> > -- 
> > Ville Syrjälä
> > Intel

-- 
Ville Syrjälä
Intel
