Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2777D97D1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 14:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C2F10E98F;
	Fri, 27 Oct 2023 12:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2071610E0D2;
 Fri, 27 Oct 2023 12:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698409317; x=1729945317;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GrV4vqEUiCepsBTCoXXbxd0FR3jymBJbEOGa2C1L7SU=;
 b=K7NJbgD5e68TOk0dkcvOGIYb/xaIPblIAggeMzX77vc/rdNx7iZcAvIq
 rQxg4vfXLhrZ8EESmi2PzmDivpdb8Cq+QevFezf531ix+0HClO4kQj8uC
 6XE1syienKvZIVqjH40P2I/dr+18Xfoi3EuoonqlGaVdvUDoFR3++Seef
 9OTIa90s3+LkPgV6vTUrGoSMu2yzeMSIpCi+OMJqjhY4tBtgSXsFAtOf2
 ggpPcKbfrWk0oHWJ9JKOT4cTv3qLeWoBl+gd/RNaVuPdzVg2voKSBSys9
 iXahINL4hgWcS8dzdupJZD2NmqpkX7mgSzboKaKs7h1YvTDnZmawdh9mI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="367109959"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; d="scan'208";a="367109959"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 05:21:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="883168231"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; d="scan'208";a="883168231"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 05:21:55 -0700
Date: Fri, 27 Oct 2023 15:21:51 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Imre Deak <imre.deak@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 08/29] drm/dp: Add helpers to calculate
 the link BW overhead
Message-ID: <ZTurX7SyvFTy5E0r@intel.com>
References: <20231024010925.3949910-9-imre.deak@intel.com>
 <20231024102219.4035939-2-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024102219.4035939-2-imre.deak@intel.com>
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

On Tue, Oct 24, 2023 at 01:22:17PM +0300, Imre Deak wrote:
> Add helpers drivers can use to calculate the BW allocation overhead -
> due to SSC, FEC, DSC and data alignment on symbol cycles - and the
> channel coding efficiency - due to the 8b/10b, 128b/132b encoding. On
> 128b/132b links the FEC overhead is part of the coding efficiency, so
> not accounted for in the BW allocation overhead.
> 
> The drivers can use these functions to calculate a ratio, controlling
> the stream symbol insertion rate of the source device in each SST TU
> or MST MTP frame. Drivers can calculate this
> 
> m/n = (pixel_data_rate * drm_dp_bw_overhead()) /
>       (link_data_rate * drm_dp_bw_channel_coding_efficiency())
> 
> ratio for a given link and pixel stream and with that the
> 
> mtp_count = CEIL(64 * m / n)
> 
> allocated MTPs for the stream in a link frame and
> 
> pbn = CEIL(64 * dm_mst_get_pbn_divider() * m / n)
> 
> allocated PBNs for the stream on the MST link path.
> 
> Take drm_dp_bw_overhead() into use in drm_dp_calc_pbn_mode(), for
> drivers calculating the PBN value directly.
> 
> v2:
> - Add dockbook description to drm_dp_bw_channel_coding_efficiency().
>   (LKP).
> - Clarify the way m/n ratio is calculated in the commit log.

Could not spot any obivous issues here, but wondering, whether someone
could also take a look, as this seems to be affecting quite a lot.

Anyways, from my side:

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> 
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: kernel test robot <lkp@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c       | 124 ++++++++++++++++++
>  drivers/gpu/drm/display/drm_dp_mst_topology.c |  23 +++-
>  include/drm/display/drm_dp_helper.h           |  11 ++
>  3 files changed, 152 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index e5d7970a9ddd0..79629bf7547bf 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -3899,4 +3899,128 @@ int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux)
>  }
>  EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
>  
> +/* See DP Standard v2.1 2.6.4.4.1.1, 2.8.4.4, 2.8.7 */
> +static int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
> +				     int symbol_size, bool is_mst)
> +{
> +	int cycles = DIV_ROUND_UP(pixels * bpp_x16, 16 * symbol_size * lane_count);
> +	int align = is_mst ? 4 / lane_count : 1;
> +
> +	return ALIGN(cycles, align);
> +}
> +
> +static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_count,
> +					 int bpp_x16, int symbol_size, bool is_mst)
> +{
> +	int slice_pixels = DIV_ROUND_UP(pixels, slice_count);
> +	int slice_data_cycles = drm_dp_link_symbol_cycles(lane_count, slice_pixels,
> +							  bpp_x16, symbol_size, is_mst);
> +	int slice_eoc_cycles = is_mst ? 4 / lane_count : 1;
> +
> +	return slice_count * (slice_data_cycles + slice_eoc_cycles);
> +}
> +
> +/**
> + * drm_dp_bw_overhead - Calculate the BW overhead of a DP link stream
> + * @lane_count: DP link lane count
> + * @hactive: pixel count of the active period in one scanline of the stream
> + * @dsc_slice_count: DSC slice count if @flags/DRM_DP_LINK_BW_OVERHEAD_DSC is set
> + * @bpp_x16: bits per pixel in .4 binary fixed point
> + * @flags: DRM_DP_OVERHEAD_x flags
> + *
> + * Calculate the BW allocation overhead of a DP link stream, depending
> + * on the link's
> + * - @lane_count
> + * - SST/MST mode (@flags / %DRM_DP_OVERHEAD_MST)
> + * - symbol size (@flags / %DRM_DP_OVERHEAD_UHBR)
> + * - FEC mode (@flags / %DRM_DP_OVERHEAD_FEC)
> + * - SSC mode (@flags / %DRM_DP_OVERHEAD_SSC)
> + * as well as the stream's
> + * - @hactive timing
> + * - @bpp_x16 color depth
> + * - compression mode (@flags / %DRM_DP_OVERHEAD_DSC).
> + * Note that this overhead doesn't account for the 8b/10b, 128b/132b
> + * channel coding efficiency, for that see
> + * @drm_dp_link_bw_channel_coding_efficiency().
> + *
> + * Returns the overhead as 100% + overhead% in 1ppm units.
> + */
> +int drm_dp_bw_overhead(int lane_count, int hactive,
> +		       int dsc_slice_count,
> +		       int bpp_x16, unsigned long flags)
> +{
> +	int symbol_size = flags & DRM_DP_BW_OVERHEAD_UHBR ? 32 : 8;
> +	bool is_mst = flags & DRM_DP_BW_OVERHEAD_MST;
> +	u32 overhead = 1000000;
> +	int symbol_cycles;
> +
> +	/*
> +	 * DP Standard v2.1 2.6.4.1
> +	 * SSC downspread and ref clock variation margin:
> +	 *   5300ppm + 300ppm ~ 0.6%
> +	 */
> +	if (flags & DRM_DP_BW_OVERHEAD_SSC)
> +		overhead += 6000;
> +
> +	/*
> +	 * DP Standard v2.1 2.6.4.1.1:
> +	 * FEC symbol insertions for 8b/10b channel coding:
> +	 *   2.4%
> +	 */
> +	if (flags & DRM_DP_BW_OVERHEAD_FEC)
> +		overhead += 24000;
> +
> +	/*
> +	 * DP Standard v2.1 2.7.9, 5.9.7
> +	 * The FEC overhead for UHBR is accounted for in its 96.71% channel
> +	 * coding efficiency.
> +	 */
> +	WARN_ON((flags & DRM_DP_BW_OVERHEAD_UHBR) &&
> +		(flags & DRM_DP_BW_OVERHEAD_FEC));
> +
> +	if (flags & DRM_DP_BW_OVERHEAD_DSC)
> +		symbol_cycles = drm_dp_link_dsc_symbol_cycles(lane_count, hactive,
> +							      dsc_slice_count,
> +							      bpp_x16, symbol_size,
> +							      is_mst);
> +	else
> +		symbol_cycles = drm_dp_link_symbol_cycles(lane_count, hactive,
> +							  bpp_x16, symbol_size,
> +							  is_mst);
> +
> +	return DIV_ROUND_UP_ULL(mul_u32_u32(symbol_cycles * symbol_size * lane_count,
> +					    overhead * 16),
> +				hactive * bpp_x16);
> +}
> +EXPORT_SYMBOL(drm_dp_bw_overhead);
> +
> +/**
> + * drm_dp_bw_channel_coding_efficiency - Get a DP link's channel coding efficiency
> + * @is_uhbr: Whether the link has a 128b/132b channel coding
> + *
> + * Return the channel coding efficiency of the given DP link type, which is
> + * either 8b/10b or 128b/132b (aka UHBR). The corresponding overhead includes
> + * the 8b -> 10b, 128b -> 132b pixel data to link symbol conversion overhead
> + * and for 128b/132b any link or PHY level control symbol insertion overhead
> + * (LLCP, FEC, PHY sync, see DP Standard v2.1 3.5.2.18). For 8b/10b the
> + * corresponding FEC overhead is BW allocation specific, included in the value
> + * returned by drm_dp_bw_overhead().
> + *
> + * Returns the efficiency in the 100%/coding-overhead% ratio in
> + * 1ppm units.
> + */
> +int drm_dp_bw_channel_coding_efficiency(bool is_uhbr)
> +{
> +	if (is_uhbr)
> +		return 967100;
> +	else
> +		/*
> +		 * Note that on 8b/10b MST the efficiency is only
> +		 * 78.75% due to the 1 out of 64 MTPH packet overhead,
> +		 * not accounted for here.
> +		 */
> +		return 800000;
> +}
> +EXPORT_SYMBOL(drm_dp_bw_channel_coding_efficiency);
> +
>  #endif
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index cc0a8fe84d290..d7383f2fd6cfe 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -4726,17 +4726,28 @@ EXPORT_SYMBOL(drm_dp_check_act_status);
>  int drm_dp_calc_pbn_mode(int clock, int bpp)
>  {
>  	/*
> -	 * margin 5300ppm + 300ppm ~ 0.6% as per spec, factor is 1.006
>  	 * The unit of 54/64Mbytes/sec is an arbitrary unit chosen based on
>  	 * common multiplier to render an integer PBN for all link rate/lane
>  	 * counts combinations
>  	 * calculate
> -	 * peak_kbps *= (1006/1000)
> -	 * peak_kbps *= (64/54)
> -	 * peak_kbps *= 8    convert to bytes
> +	 * peak_kbps = clock * bpp / 16
> +	 * peak_kbps *= SSC overhead / 1000000
> +	 * peak_kbps /= 8    convert to Kbytes
> +	 * peak_kBps *= (64/54) / 1000    convert to PBN
>  	 */
> -	return DIV_ROUND_UP_ULL(mul_u32_u32(clock * bpp, 64 * 1006 >> 4),
> -				1000 * 8 * 54 * 1000);
> +	/*
> +	 * TODO: Use the actual link and mode parameters to calculate
> +	 * the overhead. For now it's assumed that these are
> +	 * 4 link lanes, 4096 hactive pixels, which don't add any
> +	 * significant data padding overhead and that there is no DSC
> +	 * or FEC overhead.
> +	 */
> +	int overhead = drm_dp_bw_overhead(4, 4096, 0, bpp,
> +					  DRM_DP_BW_OVERHEAD_MST |
> +					  DRM_DP_BW_OVERHEAD_SSC);
> +
> +	return DIV64_U64_ROUND_UP(mul_u32_u32(clock * bpp, 64 * overhead >> 4),
> +				  1000000ULL * 8 * 54 * 1000);
>  }
>  EXPORT_SYMBOL(drm_dp_calc_pbn_mode);
>  
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index da94932f4262b..d0f7406c510a8 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -788,4 +788,15 @@ bool drm_dp_downstream_rgb_to_ycbcr_conversion(const u8 dpcd[DP_RECEIVER_CAP_SIZ
>  					       const u8 port_cap[4], u8 color_spc);
>  int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc);
>  
> +#define DRM_DP_BW_OVERHEAD_MST	BIT(0)
> +#define DRM_DP_BW_OVERHEAD_UHBR	BIT(1)
> +#define DRM_DP_BW_OVERHEAD_SSC	BIT(2)
> +#define DRM_DP_BW_OVERHEAD_FEC	BIT(3)
> +#define DRM_DP_BW_OVERHEAD_DSC	BIT(4)
> +
> +int drm_dp_bw_overhead(int lane_count, int hactive,
> +		       int dsc_slice_count,
> +		       int bpp_x16, unsigned long flags);
> +int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
> +
>  #endif /* _DRM_DP_HELPER_H_ */
> -- 
> 2.39.2
> 
