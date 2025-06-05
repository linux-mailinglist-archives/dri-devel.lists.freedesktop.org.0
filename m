Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52D8ACEFFD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 15:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E0D10E88B;
	Thu,  5 Jun 2025 13:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SnscMSZq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2307410E85A;
 Thu,  5 Jun 2025 13:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749128839; x=1780664839;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=1it1UrBMHi6//WYbPVYpUqBkybbhsjwWgtDqzIN1M4M=;
 b=SnscMSZqyA1plWK53ZswSAgtlsCcV+zODNQcgysC6lgCW0g6YkjdCLul
 fwqLolOSNMji5e0BUL7aW14g7TOqUhLEMCFsqF401cXDAOvHUGYUB0N/D
 5En1w8rvcj2uzXaKgyUhCmmwvjxZPKTVs/qJjTuDIES0Z2hcyW2mzd3PQ
 w2qQg/tAUWscUJ7OtswDA8+BGmzkyI0mzV07Co9Jy2lTg5HBifYV5Skva
 ELj711AIQqYzoEc81Aib3SNwruoIGz+vX1Kl9lco5KeQqawzIKYE7v5sI
 5j4avx6Ou1rNzthbbJOAQZKGUqPbEI9VLAXS4pl2voEZmOLVVzk3Mlmf7 Q==;
X-CSE-ConnectionGUID: XKXwhnPyTOWysHJhQ2fOoQ==
X-CSE-MsgGUID: 66ZVnTEhSKu/11GxzvOVKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="68801020"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="68801020"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 06:07:19 -0700
X-CSE-ConnectionGUID: n4DuMEPMTre6NJSj9V6yoA==
X-CSE-MsgGUID: B3pVlE8DS82bjwgqHRbm/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="145463286"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.67])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 06:07:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 3/5] drm/edid: Add support for quirks visible to DRM
 core and drivers
In-Reply-To: <20250605082850.65136-4-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250605082850.65136-1-imre.deak@intel.com>
 <20250605082850.65136-4-imre.deak@intel.com>
Date: Thu, 05 Jun 2025 16:07:15 +0300
Message-ID: <282001987f2a20ce67d5ca67298df1736242d218@intel.com>
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
> Add support for EDID based quirks which can be queried outside of the
> EDID parser iteself by DRM core and drivers. There are at least two such
> quirks applicable to all drivers: the DPCD register access probe quirk
> and the 128b/132b DPRX Lane Count Conversion quirk (see 3.5.2.16.3 in
> the v2.1a DP Standard). The latter quirk applies to panels with specific
> EDID panel names, support for defining a quirk this way will be added as
> a follow-up.
>
> v2: Reset global_quirks in drm_reset_display_info().
> v3: (Jani)
> - Use one list for both the global and internal quirks.
> - Drop change for panel name specific quirks.
> - Add comment about the way quirks should be queried.
>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c  | 8 +++++++-
>  include/drm/drm_connector.h | 4 +++-
>  include/drm/drm_edid.h      | 5 +++++
>  3 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 857ae0c47a1c3..9cca1e6e4736c 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -68,7 +68,7 @@ static int oui(u8 first, u8 second, u8 third)
>=20=20
>  enum drm_edid_internal_quirk {
>  	/* First detailed mode wrong, use largest 60Hz mode */
> -	EDID_QUIRK_PREFER_LARGE_60,
> +	EDID_QUIRK_PREFER_LARGE_60 =3D DRM_EDID_QUIRK_NUM,
>  	/* Reported 135MHz pixel clock is too high, needs adjustment */
>  	EDID_QUIRK_135_CLOCK_TOO_HIGH,
>  	/* Prefer the largest mode at 75 Hz */
> @@ -2959,6 +2959,12 @@ static bool drm_edid_has_internal_quirk(struct drm=
_connector *connector,
>  	return connector->display_info.quirks & BIT(quirk);
>  }
>=20=20
> +bool drm_edid_has_quirk(struct drm_connector *connector, enum drm_edid_q=
uirk quirk)

Nitpick, this could've been const.

Regardless,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>



> +{
> +	return connector->display_info.quirks & BIT(quirk);
> +}
> +EXPORT_SYMBOL(drm_edid_has_quirk);
> +
>  #define MODE_SIZE(m) ((m)->hdisplay * (m)->vdisplay)
>  #define MODE_REFRESH_DIFF(c,t) (abs((c) - (t)))
>=20=20
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 73903c3c842f3..137773dd138ea 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -843,7 +843,9 @@ struct drm_display_info {
>  	int vics_len;
>=20=20
>  	/**
> -	 * @quirks: EDID based quirks. Internal to EDID parsing.
> +	 * @quirks: EDID based quirks. DRM core and drivers can query the
> +	 * @drm_edid_quirk quirks using drm_edid_has_quirk(), the rest of
> +	 * the quirks also tracked here are internal to EDID parsing.
>  	 */
>  	u32 quirks;
>=20=20
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index b38409670868d..77fd42608e706 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -109,6 +109,10 @@ struct detailed_data_string {
>  #define DRM_EDID_CVT_FLAGS_STANDARD_BLANKING (1 << 3)
>  #define DRM_EDID_CVT_FLAGS_REDUCED_BLANKING  (1 << 4)
>=20=20
> +enum drm_edid_quirk {
> +	DRM_EDID_QUIRK_NUM,
> +};
> +
>  struct detailed_data_monitor_range {
>  	u8 min_vfreq;
>  	u8 max_vfreq;
> @@ -476,5 +480,6 @@ void drm_edid_print_product_id(struct drm_printer *p,
>  u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid);
>  bool drm_edid_match(const struct drm_edid *drm_edid,
>  		    const struct drm_edid_ident *ident);
> +bool drm_edid_has_quirk(struct drm_connector *connector, enum drm_edid_q=
uirk quirk);
>=20=20
>  #endif /* __DRM_EDID_H__ */

--=20
Jani Nikula, Intel
