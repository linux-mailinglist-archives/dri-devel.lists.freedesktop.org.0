Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABF0CAF539
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 09:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B7110E4BF;
	Tue,  9 Dec 2025 08:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8623A10E4BC;
 Tue,  9 Dec 2025 08:49:23 +0000 (UTC)
Received: from mobile-access-5d6aa7-235.dhcp.inet.fi ([93.106.167.235]
 helo=[192.168.8.139])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1vStPA-00000000gSt-2kEr; Tue, 09 Dec 2025 10:49:20 +0200
Message-ID: <1f07e6ed6f0016d77b0fd7d9cdaaf4f9ea548ccf.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Date: Tue, 09 Dec 2025 10:48:43 +0200
In-Reply-To: <20251127175023.1522538-3-imre.deak@intel.com>
References: <20251127175023.1522538-1-imre.deak@intel.com>
 <20251127175023.1522538-3-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-7 
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 4.0.2 (2025-08-27) on farmhouse.coelho.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=4.0.2
Subject: Re: [PATCH 02/50] drm/dp: Add drm_dp_dsc_sink_slice_count_mask()
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

On Thu, 2025-11-27 at 19:49 +0200, Imre Deak wrote:
> A DSC sink supporting DSC slice count N, not necessarily supports slice
> counts less than N. Hence the driver should check the sink's support for
> a particular slice count before using that slice count. Add the helper
> functions required for this.
>=20
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 82 +++++++++++++++++--------
>  include/drm/display/drm_dp_helper.h     |  3 +
>  2 files changed, 61 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/di=
splay/drm_dp_helper.c
> index 19564c1afba6c..a697cc227e289 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2705,56 +2705,90 @@ u8 drm_dp_dsc_sink_bpp_incr(const u8 dsc_dpcd[DP_=
DSC_RECEIVER_CAP_SIZE])
>  EXPORT_SYMBOL(drm_dp_dsc_sink_bpp_incr);
> =20
>  /**
> - * drm_dp_dsc_sink_max_slice_count() - Get the max slice count
> - * supported by the DSC sink.
> - * @dsc_dpcd: DSC capabilities from DPCD
> - * @is_edp: true if its eDP, false for DP
> + * drm_dp_dsc_slice_count_to_mask() - Convert a slice count to a slice c=
ount mask
> + * @slice_count: slice count
>   *
> - * Read the slice capabilities DPCD register from DSC sink to get
> - * the maximum slice count supported. This is used to populate
> - * the DSC parameters in the &struct drm_dsc_config by the driver.
> - * Driver creates an infoframe using these parameters to populate
> - * &struct drm_dsc_pps_infoframe. These are sent to the sink using DSC
> - * infoframe using the helper function drm_dsc_pps_infoframe_pack()
> + * Convert @slice_count to a slice count mask.
> + *
> + * Returns the slice count mask.
> + */
> +u32 drm_dp_dsc_slice_count_to_mask(int slice_count)
> +{
> +	return BIT(slice_count - 1);
> +}
> +EXPORT_SYMBOL(drm_dp_dsc_slice_count_to_mask);
> +
> +/**
> + * drm_dp_dsc_sink_slice_count_mask() - Get the mask of valid DSC sink s=
lice counts
> + * @dsc_dpcd: the sink's DSC DPCD capabilities
> + * @is_edp: %true for an eDP sink
> + *
> + * Get the mask of supported slice counts from the sink's DSC DPCD regis=
ter.
>   *
>   * Returns:
> - * Maximum slice count supported by DSC sink or 0 its invalid
> + * Mask of slice counts supported by the DSC sink:
> + * - > 0: bit#0,1,3,5..,23 set if the sink supports 1,2,4,6..,24 slices
> + * - 0:   if the sink doesn't support any slices
>   */
> -u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP=
_SIZE],
> -				   bool is_edp)
> +u32 drm_dp_dsc_sink_slice_count_mask(const u8 dsc_dpcd[DP_DSC_RECEIVER_C=
AP_SIZE],
> +				     bool is_edp)
>  {
>  	u8 slice_cap1 =3D dsc_dpcd[DP_DSC_SLICE_CAP_1 - DP_DSC_SUPPORT];
> +	u32 mask =3D 0;
> =20
>  	if (!is_edp) {
>  		/* For DP, use values from DSC_SLICE_CAP_1 and DSC_SLICE_CAP2 */
>  		u8 slice_cap2 =3D dsc_dpcd[DP_DSC_SLICE_CAP_2 - DP_DSC_SUPPORT];
> =20
>  		if (slice_cap2 & DP_DSC_24_PER_DP_DSC_SINK)
> -			return 24;
> +			mask |=3D drm_dp_dsc_slice_count_to_mask(24);
>  		if (slice_cap2 & DP_DSC_20_PER_DP_DSC_SINK)
> -			return 20;
> +			mask |=3D drm_dp_dsc_slice_count_to_mask(20);
>  		if (slice_cap2 & DP_DSC_16_PER_DP_DSC_SINK)
> -			return 16;
> +			mask |=3D drm_dp_dsc_slice_count_to_mask(16);
>  	}
> =20
>  	/* DP, eDP v1.5+ */
>  	if (slice_cap1 & DP_DSC_12_PER_DP_DSC_SINK)
> -		return 12;
> +		mask |=3D drm_dp_dsc_slice_count_to_mask(12);
>  	if (slice_cap1 & DP_DSC_10_PER_DP_DSC_SINK)
> -		return 10;
> +		mask |=3D drm_dp_dsc_slice_count_to_mask(10);
>  	if (slice_cap1 & DP_DSC_8_PER_DP_DSC_SINK)
> -		return 8;
> +		mask |=3D drm_dp_dsc_slice_count_to_mask(8);
>  	if (slice_cap1 & DP_DSC_6_PER_DP_DSC_SINK)
> -		return 6;
> +		mask |=3D drm_dp_dsc_slice_count_to_mask(6);
>  	/* DP, eDP v1.4+ */
>  	if (slice_cap1 & DP_DSC_4_PER_DP_DSC_SINK)
> -		return 4;
> +		mask |=3D drm_dp_dsc_slice_count_to_mask(4);
>  	if (slice_cap1 & DP_DSC_2_PER_DP_DSC_SINK)
> -		return 2;
> +		mask |=3D drm_dp_dsc_slice_count_to_mask(2);
>  	if (slice_cap1 & DP_DSC_1_PER_DP_DSC_SINK)
> -		return 1;
> +		mask |=3D drm_dp_dsc_slice_count_to_mask(1);
> =20
> -	return 0;
> +	return mask;
> +}
> +EXPORT_SYMBOL(drm_dp_dsc_sink_slice_count_mask);
> +
> +/**
> + * drm_dp_dsc_sink_max_slice_count() - Get the max slice count
> + * supported by the DSC sink.
> + * @dsc_dpcd: DSC capabilities from DPCD
> + * @is_edp: true if its eDP, false for DP
> + *
> + * Read the slice capabilities DPCD register from DSC sink to get
> + * the maximum slice count supported. This is used to populate
> + * the DSC parameters in the &struct drm_dsc_config by the driver.
> + * Driver creates an infoframe using these parameters to populate
> + * &struct drm_dsc_pps_infoframe. These are sent to the sink using DSC
> + * infoframe using the helper function drm_dsc_pps_infoframe_pack()
> + *
> + * Returns:
> + * Maximum slice count supported by DSC sink or 0 its invalid
> + */
> +u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP=
_SIZE],
> +				   bool is_edp)
> +{
> +	return fls(drm_dp_dsc_sink_slice_count_mask(dsc_dpcd, is_edp));
>  }
>  EXPORT_SYMBOL(drm_dp_dsc_sink_max_slice_count);
> =20
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/dr=
m_dp_helper.h
> index df2f24b950e4c..85e868238e287 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -206,6 +206,9 @@ drm_dp_is_branch(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> =20
>  /* DP/eDP DSC support */
>  u8 drm_dp_dsc_sink_bpp_incr(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])=
;
> +u32 drm_dp_dsc_slice_count_to_mask(int slice_count);
> +u32 drm_dp_dsc_sink_slice_count_mask(const u8 dsc_dpcd[DP_DSC_RECEIVER_C=
AP_SIZE],
> +				     bool is_edp);
>  u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP=
_SIZE],
>  				   bool is_edp);
>  u8 drm_dp_dsc_sink_line_buf_depth(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_=
SIZE]);

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
