Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A15433AC8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 17:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955DB6E4B0;
	Tue, 19 Oct 2021 15:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573E46E4B0;
 Tue, 19 Oct 2021 15:38:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="215714407"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="215714407"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 08:38:14 -0700
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="494153612"
Received: from jsanz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.211.239])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 08:38:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com
Subject: Re: [PATCH 3/3] drm/i915/dp: use new link training delay helpers
In-Reply-To: <20211014150059.28957-3-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211014150059.28957-1-jani.nikula@intel.com>
 <20211014150059.28957-3-jani.nikula@intel.com>
Date: Tue, 19 Oct 2021 18:38:10 +0300
Message-ID: <87wnm9owil.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 14 Oct 2021, Jani Nikula <jani.nikula@intel.com> wrote:
> Use the new link training delay helpers, fixing the delays for
> 128b/132b.
>
> For existing 8b/10b functionality, this will cause additional 1-byte
> DPCD reads for LTTPR delays instead of using the cached values. It's
> just too complicated to combine generic helpers with local caching in a
> sensible way.
>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Thanks for the review.

Pushed & got patches 1-2 merged via a topic branch to both drm-misc-next
and drm-intel-next, and pushed patch 3 on top to drm-intel-next.

BR,
Jani.


> ---
>  .../drm/i915/display/intel_dp_link_training.c | 38 +++++++------------
>  1 file changed, 13 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/driv=
ers/gpu/drm/i915/display/intel_dp_link_training.c
> index 85676c953e0a..a72f2dc93718 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -683,15 +683,6 @@ intel_dp_prepare_link_train(struct intel_dp *intel_d=
p,
>  	return true;
>  }
>=20=20
> -static void intel_dp_link_training_clock_recovery_delay(struct intel_dp =
*intel_dp,
> -							enum drm_dp_phy dp_phy)
> -{
> -	if (dp_phy =3D=3D DP_PHY_DPRX)
> -		drm_dp_link_train_clock_recovery_delay(&intel_dp->aux, intel_dp->dpcd);
> -	else
> -		drm_dp_lttpr_link_train_clock_recovery_delay();
> -}
> -
>  static bool intel_dp_adjust_request_changed(const struct intel_crtc_stat=
e *crtc_state,
>  					    const u8 old_link_status[DP_LINK_STATUS_SIZE],
>  					    const u8 new_link_status[DP_LINK_STATUS_SIZE])
> @@ -750,6 +741,11 @@ intel_dp_link_training_clock_recovery(struct intel_d=
p *intel_dp,
>  	u8 link_status[DP_LINK_STATUS_SIZE];
>  	bool max_vswing_reached =3D false;
>  	char phy_name[10];
> +	int delay_us;
> +
> +	delay_us =3D drm_dp_read_clock_recovery_delay(&intel_dp->aux,
> +						    intel_dp->dpcd, dp_phy,
> +						    intel_dp_is_uhbr(crtc_state));
>=20=20
>  	intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name));
>=20=20
> @@ -777,7 +773,7 @@ intel_dp_link_training_clock_recovery(struct intel_dp=
 *intel_dp,
>=20=20
>  	voltage_tries =3D 1;
>  	for (cr_tries =3D 0; cr_tries < max_cr_tries; ++cr_tries) {
> -		intel_dp_link_training_clock_recovery_delay(intel_dp, dp_phy);
> +		usleep_range(delay_us, 2 * delay_us);
>=20=20
>  		if (drm_dp_dpcd_read_phy_link_status(&intel_dp->aux, dp_phy,
>  						     link_status) < 0) {
> @@ -895,19 +891,6 @@ static u32 intel_dp_training_pattern(struct intel_dp=
 *intel_dp,
>  	return DP_TRAINING_PATTERN_2;
>  }
>=20=20
> -static void
> -intel_dp_link_training_channel_equalization_delay(struct intel_dp *intel=
_dp,
> -						  enum drm_dp_phy dp_phy)
> -{
> -	if (dp_phy =3D=3D DP_PHY_DPRX) {
> -		drm_dp_link_train_channel_eq_delay(&intel_dp->aux, intel_dp->dpcd);
> -	} else {
> -		const u8 *phy_caps =3D intel_dp_lttpr_phy_caps(intel_dp, dp_phy);
> -
> -		drm_dp_lttpr_link_train_channel_eq_delay(&intel_dp->aux, phy_caps);
> -	}
> -}
> -
>  /*
>   * Perform the link training channel equalization phase on the given DP =
PHY
>   * using one of training pattern 2, 3 or 4 depending on the source and
> @@ -925,6 +908,11 @@ intel_dp_link_training_channel_equalization(struct i=
ntel_dp *intel_dp,
>  	u8 link_status[DP_LINK_STATUS_SIZE];
>  	bool channel_eq =3D false;
>  	char phy_name[10];
> +	int delay_us;
> +
> +	delay_us =3D drm_dp_read_channel_eq_delay(&intel_dp->aux,
> +						intel_dp->dpcd, dp_phy,
> +						intel_dp_is_uhbr(crtc_state));
>=20=20
>  	intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name));
>=20=20
> @@ -944,8 +932,8 @@ intel_dp_link_training_channel_equalization(struct in=
tel_dp *intel_dp,
>  	}
>=20=20
>  	for (tries =3D 0; tries < 5; tries++) {
> -		intel_dp_link_training_channel_equalization_delay(intel_dp,
> -								  dp_phy);
> +		usleep_range(delay_us, 2 * delay_us);
> +
>  		if (drm_dp_dpcd_read_phy_link_status(&intel_dp->aux, dp_phy,
>  						     link_status) < 0) {
>  			drm_err(&i915->drm,

--=20
Jani Nikula, Intel Open Source Graphics Center
