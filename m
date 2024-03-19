Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7AC87FA95
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAD910F8EA;
	Tue, 19 Mar 2024 09:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jSd3te2J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6E410F8EA;
 Tue, 19 Mar 2024 09:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710840022; x=1742376022;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=t5zLAiPGDjYvEg28eW85aJhdk06xzltJlc8ZhxM6IlM=;
 b=jSd3te2Jo06VwIywrHiOGCWwuV9ewfgwUVoWAn5N2gLTPI/y5QVLlSLN
 ZTnjH5f35JtV6XGq5CH60nbrERjNbmz6n042WX70HtfDJSLMVIHGC/EWJ
 YgHLkg+2swm2eJ7aH3QcEzFP74xAczw0mlqAiW3bWIB+HGbQ0opAVF/yp
 yBReTKBUBIAa4+LOVeJtMPjecEzuw3Dq5jsZQXarhVJNR6uJGOwtDlffs
 PDL9byCwmY049RzM/e9sulxTjQArVZLv+7kLJUTlVWLskEd8ByGMAWOLN
 dLj8wS47qNMn8sCM9Y56VixFap20eslqgsp8PDE1V8R9sz9hj3lHJ6E7d w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="23153797"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="23153797"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:20:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="13791152"
Received: from rcritchl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.36.139])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:20:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Arun R Murthy <arun.r.murthy@intel.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [RESEND v3 1/6] drm/mst: read sideband messaging cap
In-Reply-To: <b32a3704934871a67d06420b760e148b76c5ced8.1710839496.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1710839496.git.jani.nikula@intel.com>
 <b32a3704934871a67d06420b760e148b76c5ced8.1710839496.git.jani.nikula@intel.com>
Date: Tue, 19 Mar 2024 11:20:16 +0200
Message-ID: <87v85io9wv.fsf@intel.com>
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

On Tue, 19 Mar 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Amend drm_dp_read_mst_cap() to return an enum, indicating "SST", "SST
> with sideband messaging", or "MST". Modify all call sites to take the
> new return value into account.

drm-misc and nouveau maintainers, ack for merging this via drm-intel,
please?

BR,
Jani.



>
> v2:
> - Rename enumerators (Ville)
>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 20 ++++++++++------
>  drivers/gpu/drm/i915/display/intel_dp.c       |  4 ++--
>  drivers/gpu/drm/nouveau/nouveau_dp.c          |  2 +-
>  include/drm/display/drm_dp_mst_helper.h       | 23 ++++++++++++++++++-
>  4 files changed, 38 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index 03d528209426..c193be3577f7 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -3608,24 +3608,30 @@ fixed20_12 drm_dp_get_vc_payload_bw(const struct =
drm_dp_mst_topology_mgr *mgr,
>  EXPORT_SYMBOL(drm_dp_get_vc_payload_bw);
>=20=20
>  /**
> - * drm_dp_read_mst_cap() - check whether or not a sink supports MST
> + * drm_dp_read_mst_cap() - Read the sink's MST mode capability
>   * @aux: The DP AUX channel to use
>   * @dpcd: A cached copy of the DPCD capabilities for this sink
>   *
> - * Returns: %True if the sink supports MST, %false otherwise
> + * Returns: enum drm_dp_mst_mode to indicate MST mode capability
>   */
> -bool drm_dp_read_mst_cap(struct drm_dp_aux *aux,
> -			 const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> +enum drm_dp_mst_mode drm_dp_read_mst_cap(struct drm_dp_aux *aux,
> +					 const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  {
>  	u8 mstm_cap;
>=20=20
>  	if (dpcd[DP_DPCD_REV] < DP_DPCD_REV_12)
> -		return false;
> +		return DRM_DP_SST;
>=20=20
>  	if (drm_dp_dpcd_readb(aux, DP_MSTM_CAP, &mstm_cap) !=3D 1)
> -		return false;
> +		return DRM_DP_SST;
> +
> +	if (mstm_cap & DP_MST_CAP)
> +		return DRM_DP_MST;
> +
> +	if (mstm_cap & DP_SINGLE_STREAM_SIDEBAND_MSG)
> +		return DRM_DP_SST_SIDEBAND_MSG;
>=20=20
> -	return mstm_cap & DP_MST_CAP;
> +	return DRM_DP_SST;
>  }
>  EXPORT_SYMBOL(drm_dp_read_mst_cap);
>=20=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index af7ca00e9bc0..91c42949ac7e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4046,7 +4046,7 @@ intel_dp_can_mst(struct intel_dp *intel_dp)
>=20=20
>  	return i915->display.params.enable_dp_mst &&
>  		intel_dp_mst_source_support(intel_dp) &&
> -		drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
> +		drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) =3D=3D DRM_DP_MST;
>  }
>=20=20
>  static void
> @@ -4055,7 +4055,7 @@ intel_dp_configure_mst(struct intel_dp *intel_dp)
>  	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
>  	struct intel_encoder *encoder =3D
>  		&dp_to_dig_port(intel_dp)->base;
> -	bool sink_can_mst =3D drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpc=
d);
> +	bool sink_can_mst =3D drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpc=
d) =3D=3D DRM_DP_MST;
>=20=20
>  	drm_dbg_kms(&i915->drm,
>  		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s\n",
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouve=
au/nouveau_dp.c
> index 7de7707ec6a8..fb06ee17d9e5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -181,7 +181,7 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_co=
nnector,
>  	if (nouveau_mst) {
>  		mstm =3D outp->dp.mstm;
>  		if (mstm)
> -			mstm->can_mst =3D drm_dp_read_mst_cap(aux, dpcd);
> +			mstm->can_mst =3D drm_dp_read_mst_cap(aux, dpcd) =3D=3D DRM_DP_MST;
>  	}
>=20=20
>  	if (nouveau_dp_has_sink_count(connector, outp)) {
> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/displa=
y/drm_dp_mst_helper.h
> index 3ae88a383a41..cbcb49cb6a46 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -817,7 +817,28 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_t=
opology_mgr *mgr,
>=20=20
>  void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr *mgr=
);
>=20=20
> -bool drm_dp_read_mst_cap(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIV=
ER_CAP_SIZE]);
> +/**
> + * enum drm_dp_mst_mode - sink's MST mode capability
> + */
> +enum drm_dp_mst_mode {
> +	/**
> +	 * @DRM_DP_SST: The sink does not support MST nor single stream sideband
> +	 * messaging.
> +	 */
> +	DRM_DP_SST,
> +	/**
> +	 * @DRM_DP_MST: Sink supports MST, more than one stream and single
> +	 * stream sideband messaging.
> +	 */
> +	DRM_DP_MST,
> +	/**
> +	 * @DRM_DP_SST_SIDEBAND_MSG: Sink supports only one stream and single
> +	 * stream sideband messaging.
> +	 */
> +	DRM_DP_SST_SIDEBAND_MSG,
> +};
> +
> +enum drm_dp_mst_mode drm_dp_read_mst_cap(struct drm_dp_aux *aux, const u=
8 dpcd[DP_RECEIVER_CAP_SIZE]);
>  int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr,=
 bool mst_state);
>=20=20
>  int drm_dp_mst_hpd_irq_handle_event(struct drm_dp_mst_topology_mgr *mgr,

--=20
Jani Nikula, Intel
