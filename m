Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAEBAA1CC0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 23:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C9F10E02A;
	Tue, 29 Apr 2025 21:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07BE10E30B;
 Tue, 29 Apr 2025 11:58:34 +0000 (UTC)
Message-ID: <fcb7d35d-e418-4af2-938f-72299c5f2888@lankhorst.se>
Date: Tue, 29 Apr 2025 13:58:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] drm/display/dp: Export fn to calculate link symbol
 cycles
To: Arun R Murthy <arun.r.murthy@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: imre.deak@intel.com, vinod.govindapillai@intel.com
References: <20250424-hblank-v7-0-8b002f1506cc@intel.com>
 <20250424-hblank-v7-1-8b002f1506cc@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten@lankhorst.se>
In-Reply-To: <20250424-hblank-v7-1-8b002f1506cc@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 29 Apr 2025 21:18:39 +0000
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



On 2025-04-24 17:15, Arun R Murthy wrote:
> Unify the function to calculate the link symbol cycles for both dsc and
> non-dsc case and export the function so that it can be used in the
> respective platform display drivers for other calculations.
>
> v2: unify the fn for both dsc and non-dsc case (Imre)
> v3: rename drm_dp_link_symbol_cycles to drm_dp_link_data_symbol_cycles
>     retain slice_eoc_cycles as is (Imre)
> v4: Expose only drm_dp_link_symbol_cycles() (Imre)
> v6: Add slice pixels which was removed unknowingly (Vinod)
>
> Reviewed-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 52 +++++++++++++++++++++------------
>  include/drm/display/drm_dp_helper.h     |  2 ++
>  2 files changed, 36 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 57828f2b7b5a0582ca4a6f2a9be2d5909fe8ad24..56c7e3318f01079c3bde492a21c76ed37e9724ca 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -4393,8 +4393,9 @@ EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
>  #endif
>  
>  /* See DP Standard v2.1 2.6.4.4.1.1, 2.8.4.4, 2.8.7 */
> -static int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
> -				     int symbol_size, bool is_mst)
> +static int drm_dp_link_data_symbol_cycles(int lane_count, int pixels,
> +					  int bpp_x16, int symbol_size,
> +					  bool is_mst)
>  {
>  	int cycles = DIV_ROUND_UP(pixels * bpp_x16, 16 * symbol_size * lane_count);
>  	int align = is_mst ? 4 / lane_count : 1;
> @@ -4402,22 +4403,42 @@ static int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
>  	return ALIGN(cycles, align);
>  }
>  
> -static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_count,
> -					 int bpp_x16, int symbol_size, bool is_mst)
> +/**
> + * drm_dp_link_symbol_cycles - calculate the link symbol count with/without dsc
> + * @lane_count: DP link lane count
> + * @pixels: number of pixels in a scanline
> + * @dsc_slice_count: number of slices for DSC or '0' for non-DSC
> + * @bpp_x16: bits per pixel in .4 binary fixed format
> + * @symbol_size: DP symbol size
> + * @is_mst: %true for MST and %false for SST
> + *
> + * Calculate the link symbol cycles for both DSC (@dsc_slice_count !=0) and
> + * non-DSC case (@dsc_slice_count == 0) and return the count.
> + */
> +int drm_dp_link_symbol_cycles(int lane_count, int pixels, int dsc_slice_count,
> +			      int bpp_x16, int symbol_size, bool is_mst)
>  {
> +	int slice_count = dsc_slice_count ? : 1;
>  	int slice_pixels = DIV_ROUND_UP(pixels, slice_count);
> -	int slice_data_cycles = drm_dp_link_symbol_cycles(lane_count, slice_pixels,
> -							  bpp_x16, symbol_size, is_mst);
> -	int slice_eoc_cycles = is_mst ? 4 / lane_count : 1;
> +	int slice_data_cycles = drm_dp_link_data_symbol_cycles(lane_count,
> +							       slice_pixels,
> +							       bpp_x16,
> +							       symbol_size,
> +							       is_mst);
> +	int slice_eoc_cycles = 0;
> +
> +	if (dsc_slice_count)
> +		slice_eoc_cycles = is_mst ? 4 / lane_count : 1;
>  
>  	return slice_count * (slice_data_cycles + slice_eoc_cycles);
>  }
> +EXPORT_SYMBOL(drm_dp_link_symbol_cycles);
>  
>  /**
>   * drm_dp_bw_overhead - Calculate the BW overhead of a DP link stream
>   * @lane_count: DP link lane count
>   * @hactive: pixel count of the active period in one scanline of the stream
> - * @dsc_slice_count: DSC slice count if @flags/DRM_DP_LINK_BW_OVERHEAD_DSC is set
> + * @dsc_slice_count: number of slices for DSC or '0' for non-DSC
>   * @bpp_x16: bits per pixel in .4 binary fixed point
>   * @flags: DRM_DP_OVERHEAD_x flags
>   *
> @@ -4431,7 +4452,7 @@ static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_c
>   * as well as the stream's
>   * - @hactive timing
>   * - @bpp_x16 color depth
> - * - compression mode (@flags / %DRM_DP_OVERHEAD_DSC).
> + * - compression mode (@dsc_slice_count != 0)
>   * Note that this overhead doesn't account for the 8b/10b, 128b/132b
>   * channel coding efficiency, for that see
>   * @drm_dp_link_bw_channel_coding_efficiency().
> @@ -4486,15 +4507,10 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
>  	WARN_ON((flags & DRM_DP_BW_OVERHEAD_UHBR) &&
>  		(flags & DRM_DP_BW_OVERHEAD_FEC));
>  
> -	if (flags & DRM_DP_BW_OVERHEAD_DSC)
> -		symbol_cycles = drm_dp_link_dsc_symbol_cycles(lane_count, hactive,
> -							      dsc_slice_count,
> -							      bpp_x16, symbol_size,
> -							      is_mst);
> -	else
> -		symbol_cycles = drm_dp_link_symbol_cycles(lane_count, hactive,
> -							  bpp_x16, symbol_size,
> -							  is_mst);
> +	symbol_cycles = drm_dp_link_symbol_cycles(lane_count, hactive,
> +						  dsc_slice_count,
> +						  bpp_x16, symbol_size,
> +						  is_mst);
>  
>  	return DIV_ROUND_UP_ULL(mul_u32_u32(symbol_cycles * symbol_size * lane_count,
>  					    overhead * 16),
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index d9614e2c89397536f44bb7258e894628ae1dccc9..7b19192c70313d66dce1b7ba40dd59c14f80a182 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -971,5 +971,7 @@ int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
>  int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes);
>  
>  ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc, struct dp_sdp *sdp);
> +int drm_dp_link_symbol_cycles(int lane_count, int pixels, int dsc_slice_count,
> +			      int bpp_x16, int symbol_size, bool is_mst);
>  
>  #endif /* _DRM_DP_HELPER_H_ */
>
For inclusion into  drm-intel:
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

