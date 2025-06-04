Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBAAACDBAA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 12:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD2610E726;
	Wed,  4 Jun 2025 10:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYSPhixF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E2D10E646;
 Wed,  4 Jun 2025 10:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749031874; x=1780567874;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=UKTuN8dMUiFvGYw3XQzXjqX7yw68TU86YeKNV8ood0k=;
 b=XYSPhixFlrOJ3FLGJQyHivVfpCTggMA/zrsRXT5UeqGN2pbiLpDOrR/E
 SZLz76XrDXe+lbcJkCOvcGoabEPeTV8ei2Cwy/dNe1DI8TmJ62OBeloL0
 NyVXlZe9W/P93jxSFqV6vBV7LEwwO+dqQsIbKLAZs9fWh0iAOpzGdIKSf
 N7fPWhkX7YDp9Ew4GaKgJ52LgA7IB40oO1/GzM2EWOaagEZCS0CizrSic
 Y63EL5ISJ9pcjantMTCWDFxtVeBENKvKSwlFB0F2tLy0Lv+yvDRO1IIoh
 IVk0pb6tuHMxwUAgyOrkkJhLroujub1KOkDJtgXZnjQsmvpDw4CpqAu3M Q==;
X-CSE-ConnectionGUID: i5nHP3JuTjyMvZPEuUvFRA==
X-CSE-MsgGUID: M95kVDnWSV+vQpFOD7B+XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50973649"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="50973649"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 03:11:13 -0700
X-CSE-ConnectionGUID: 6m41okHkSoSro9dtiCWpCg==
X-CSE-MsgGUID: fOXuwbufSQuPA9y4w9hDeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="145035847"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 03:11:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 3/4] drm/dp: Add an EDID quirk for the DPCD register
 access probe
In-Reply-To: <20250603153627.33645-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250603121543.17842-4-imre.deak@intel.com>
 <20250603153627.33645-1-imre.deak@intel.com>
Date: Wed, 04 Jun 2025 13:11:08 +0300
Message-ID: <8e9b69d29d95d6d228fe04e40cdef9e30e5410f1@intel.com>
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

On Tue, 03 Jun 2025, Imre Deak <imre.deak@intel.com> wrote:
> Reading DPCD registers has side-effects and some of these can cause a
> problem for instance during link training. Based on this it's better to
> avoid the probing quirk done before each DPCD register read, limiting
> this to the monitor which requires it. Add an EDID quirk for this. Leave
> the quirk enabled by default, allowing it to be disabled after the
> monitor is detected.
>
> v2: Fix lockdep wrt. drm_dp_aux::hw_mutex when calling
>     drm_dp_dpcd_set_probe_quirk() with a dependent lock already held.
>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 13 ++++++++++++-
>  drivers/gpu/drm/drm_edid.c              |  3 +++
>  include/drm/display/drm_dp_helper.h     |  6 ++++++
>  include/drm/drm_edid.h                  |  3 ++-
>  4 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/di=
splay/drm_dp_helper.c
> index dc622c78db9d4..4dad677ac6ebe 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -691,6 +691,17 @@ void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux,=
 bool powered)
>  }
>  EXPORT_SYMBOL(drm_dp_dpcd_set_powered);
>=20=20
> +/**
> + * drm_dp_dpcd_set_dpcd_probe_quirk() - Set whether a probing before DPC=
D access is done
> + * @aux: DisplayPort AUX channel
> + * @enable: Enable the probing if required
> + */
> +void drm_dp_dpcd_set_probe_quirk(struct drm_dp_aux *aux, bool enable)
> +{
> +	WRITE_ONCE(aux->dpcd_probe_disabled, !enable);
> +}
> +EXPORT_SYMBOL(drm_dp_dpcd_set_probe_quirk);

We don't use this yet, which feels a bit odd.

> +
>  /**
>   * drm_dp_dpcd_read() - read a series of bytes from the DPCD
>   * @aux: DisplayPort AUX channel (SST or MST)
> @@ -724,7 +735,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsi=
gned int offset,
>  	 * We just have to do it before any DPCD access and hope that the
>  	 * monitor doesn't power down exactly after the throw away read.
>  	 */
> -	if (!aux->is_remote) {
> +	if (!aux->is_remote && !READ_ONCE(aux->dpcd_probe_disabled)) {

I think it would be worth it to add a small helper to decide whether to
do a dpcd probe. It would include the ->is_remote check as well, and the
big comment could be moved there, simplifying drm_dp_dpcd_read().

>  		ret =3D drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
>  		if (ret < 0)
>  			return ret;
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index e867315253493..9250b425ae230 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -255,6 +255,9 @@ static const struct edid_quirk {
>  };
>=20=20
>  static const struct edid_quirk global_edid_quirk_list[] =3D {
> +	/* HP ZR24w DP AUX DPCD access requires probing to prevent corruption. =
*/
> +	DRM_EDID_QUIRK(drm_edid_encode_panel_id('H', 'W', 'P', 0x2869), PANEL_N=
AME_ANY,
> +		       BIT(DRM_EDID_QUIRK_DP_DPCD_PROBE)),

So I think we should keep using EDID_QUIRK(), and maybe add
EDID_QUIRK_NAME() companion to also assign a name !=3D NULL, so we don't
have to pass PANEL_NAME_ANY to all uses. Less verbose that way I think.

>  };
>=20=20
>  /*
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/dr=
m_dp_helper.h
> index e4ca35143ff96..75fa9548aefa0 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -523,10 +523,16 @@ struct drm_dp_aux {
>  	 * @no_zero_sized: If the hw can't use zero sized transfers (NVIDIA)
>  	 */
>  	bool no_zero_sized;
> +
> +	/**
> +	 * @dpcd_probe_disabled: If probing before a DPCD access is disabled.
> +	 */
> +	bool dpcd_probe_disabled;

Is this a negative just so it's false by default?

>  };
>=20=20
>  int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
>  void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered);
> +void drm_dp_dpcd_set_probe_quirk(struct drm_dp_aux *aux, bool enable);
>  ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
>  			 void *buffer, size_t size);
>  ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 3d8e168521c82..a878805c81d97 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -110,7 +110,8 @@ struct detailed_data_string {
>  #define DRM_EDID_CVT_FLAGS_REDUCED_BLANKING  (1 << 4)
>=20=20
>  enum drm_edid_quirk {
> -	DRM_EDID_QUIRK_NONE,
> +	/* Do a dummy read before DPCD accesses, to prevent corruption. */
> +	DRM_EDID_QUIRK_DP_DPCD_PROBE,
>  };
>=20=20
>  struct detailed_data_monitor_range {

--=20
Jani Nikula, Intel
