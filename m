Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7306FACF009
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 15:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B651F10E8C3;
	Thu,  5 Jun 2025 13:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKHx+SZJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666BF10E8C3;
 Thu,  5 Jun 2025 13:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749129121; x=1780665121;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=vWgANLeG0rqV5vOeKNJWjY14NmWVpytQLSpHxrPtcX8=;
 b=NKHx+SZJV2XbgK40fR04i+eCXK55z7lSSAFAzTXLpnShThnR9PGLyqTf
 fEvvpworlIqHCb7tiQ0HD2RfTCKV2Iajwfn2VmUMwIl8VRuGkfYTFASzZ
 uhb8Xte7GtsO+4KRZLEDRm0ucFuPjEM63KUx1scQfOm3zSTb4e9bDDssM
 uv1HBOA2h4vv3ZFGaM06TuoePMMxjFTdLBYO+NGF4szfGeS/mfFgCrLQD
 Xcs0uJ/1krT2/WIspTWonhEmzULCTvgj5AleHHzHWcj4dLbKh93Oakoi3
 t96JV122L7wsMBsVi+FqCSZyRn49yHzP99zaljmjNsh05hS4wOymDlpFx A==;
X-CSE-ConnectionGUID: 6KxTZP/ATMG0iRFWnv5lTA==
X-CSE-MsgGUID: LEWk/LC4RQC1Yp5MbFdImw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51392291"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="51392291"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 06:12:00 -0700
X-CSE-ConnectionGUID: Odr98Jy0Q9CMCpoQ6hHepg==
X-CSE-MsgGUID: hfc529pFQbSw/ZABH0R/Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="150769410"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.67])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 06:11:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 4/5] drm/dp: Add an EDID quirk for the DPCD register
 access probe
In-Reply-To: <20250605082850.65136-5-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250605082850.65136-1-imre.deak@intel.com>
 <20250605082850.65136-5-imre.deak@intel.com>
Date: Thu, 05 Jun 2025 16:11:55 +0300
Message-ID: <8316fe4e8ffd9e96a04dc0976bb13200d526daec@intel.com>
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

On Thu, 05 Jun 2025, Imre Deak <imre.deak@intel.com> wrote:
> Reading DPCD registers has side-effects and some of these can cause a
> problem for instance during link training. Based on this it's better to
> avoid the probing quirk done before each DPCD register read, limiting
> this to the monitor which requires it. Add an EDID quirk for this. Leave
> the quirk enabled by default, allowing it to be disabled after the
> monitor is detected.
>
> v2: Fix lockdep wrt. drm_dp_aux::hw_mutex when calling
>     drm_dp_dpcd_set_probe_quirk() with a dependent lock already held.
> v3: Add a helper for determining if DPCD probing is needed. (Jani)
>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 42 +++++++++++++++++--------
>  drivers/gpu/drm/drm_edid.c              |  3 ++
>  include/drm/display/drm_dp_helper.h     |  6 ++++
>  include/drm/drm_edid.h                  |  3 ++
>  4 files changed, 41 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/di=
splay/drm_dp_helper.c
> index dc622c78db9d4..d0b9f672d743c 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -691,6 +691,34 @@ void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux,=
 bool powered)
>  }
>  EXPORT_SYMBOL(drm_dp_dpcd_set_powered);
>=20=20
> +/**
> + * drm_dp_dpcd_set_dpcd_probe_quirk() - Set whether a probing before DPC=
D access is done

Musing, not sure if this needs to be called "quirk". This is just used
to enable/disable the extra probe. aux->dpcd_probe_disabled doesn't
mention the quirk either, and shouldn't.

Not a big deal.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> + * @aux: DisplayPort AUX channel
> + * @enable: Enable the probing if required
> + */
> +void drm_dp_dpcd_set_probe_quirk(struct drm_dp_aux *aux, bool enable)
> +{
> +	WRITE_ONCE(aux->dpcd_probe_disabled, !enable);
> +}
> +EXPORT_SYMBOL(drm_dp_dpcd_set_probe_quirk);
> +
> +static bool dpcd_access_needs_probe(struct drm_dp_aux *aux)
> +{
> +	/*
> +	 * HP ZR24w corrupts the first DPCD access after entering power save
> +	 * mode. Eg. on a read, the entire buffer will be filled with the same
> +	 * byte. Do a throw away read to avoid corrupting anything we care
> +	 * about. Afterwards things will work correctly until the monitor
> +	 * gets woken up and subsequently re-enters power save mode.
> +	 *
> +	 * The user pressing any button on the monitor is enough to wake it
> +	 * up, so there is no particularly good place to do the workaround.
> +	 * We just have to do it before any DPCD access and hope that the
> +	 * monitor doesn't power down exactly after the throw away read.
> +	 */
> +	return !aux->is_remote && !READ_ONCE(aux->dpcd_probe_disabled);
> +}
> +
>  /**
>   * drm_dp_dpcd_read() - read a series of bytes from the DPCD
>   * @aux: DisplayPort AUX channel (SST or MST)
> @@ -712,19 +740,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, uns=
igned int offset,
>  {
>  	int ret;
>=20=20
> -	/*
> -	 * HP ZR24w corrupts the first DPCD access after entering power save
> -	 * mode. Eg. on a read, the entire buffer will be filled with the same
> -	 * byte. Do a throw away read to avoid corrupting anything we care
> -	 * about. Afterwards things will work correctly until the monitor
> -	 * gets woken up and subsequently re-enters power save mode.
> -	 *
> -	 * The user pressing any button on the monitor is enough to wake it
> -	 * up, so there is no particularly good place to do the workaround.
> -	 * We just have to do it before any DPCD access and hope that the
> -	 * monitor doesn't power down exactly after the throw away read.
> -	 */
> -	if (!aux->is_remote) {
> +	if (dpcd_access_needs_probe(aux)) {
>  		ret =3D drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
>  		if (ret < 0)
>  			return ret;
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 9cca1e6e4736c..5f45820ad62d5 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -248,6 +248,9 @@ static const struct edid_quirk {
>  	/* OSVR HDK and HDK2 VR Headsets */
>  	EDID_QUIRK('S', 'V', 'R', 0x1019, BIT(EDID_QUIRK_NON_DESKTOP)),
>  	EDID_QUIRK('A', 'U', 'O', 0x1111, BIT(EDID_QUIRK_NON_DESKTOP)),
> +
> +	/* HP ZR24w DP AUX DPCD access requires probing to prevent corruption. =
*/
> +	EDID_QUIRK('H', 'W', 'P', 0x2869, BIT(DRM_EDID_QUIRK_DP_DPCD_PROBE)),
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
>  };
>=20=20
>  int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
>  void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered);
> +void drm_dp_dpcd_set_probe_quirk(struct drm_dp_aux *aux, bool enable);
>  ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
>  			 void *buffer, size_t size);
>  ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 77fd42608e706..3d1aecfec9b2a 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -110,6 +110,9 @@ struct detailed_data_string {
>  #define DRM_EDID_CVT_FLAGS_REDUCED_BLANKING  (1 << 4)
>=20=20
>  enum drm_edid_quirk {
> +	/* Do a dummy read before DPCD accesses, to prevent corruption. */
> +	DRM_EDID_QUIRK_DP_DPCD_PROBE,
> +
>  	DRM_EDID_QUIRK_NUM,
>  };

--=20
Jani Nikula, Intel
