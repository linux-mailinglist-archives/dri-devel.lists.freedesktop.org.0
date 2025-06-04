Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D74ACDB97
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 12:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1190410E6AA;
	Wed,  4 Jun 2025 10:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KTDH1pSN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C257010E6AA;
 Wed,  4 Jun 2025 10:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749031383; x=1780567383;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=fDrgUdk8GyPk6xwU2bPoaAFuIcVFBrAR0IxiRDoThbI=;
 b=KTDH1pSNj6YO6ET+a7ZWVEQ9qTbhfHJm+BcS4EamgG5k1oI2t7cU2aT/
 +id0P5ML9FSA+1SPMTC1OVY1kU4wdDRVvIBPo8jOPC3t4keuUsgpXeopA
 MKq11t3KO+nTAF78SiWSRnu8HqooNHL0SZszKRg+irGFs0/0lbXkL1KeC
 K1DbQACMk51Sk4u9jynZ1/zUGOGJBgwRAm9I2lu9etmi2H2RMdCGfsuIR
 nQ2poig2YNba6VAsFLVyt1Ge9TmKzfnRC8SQNwjJqju32XZ7TCuApnpfp
 GU5Etz8QHQsJwl5Toq6TJR2rhybWbrLX3VTntTEmimHW+0ytsmj4U8chN Q==;
X-CSE-ConnectionGUID: BQ6nMtwPTBWgrh2fWVSOfw==
X-CSE-MsgGUID: DD99motGTcOcLgG07UjNww==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51105230"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="51105230"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 03:03:02 -0700
X-CSE-ConnectionGUID: 8A1dEDwGSyuUxa4JZnwEIg==
X-CSE-MsgGUID: TQwXu1/8RJut4PprIJCafA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="145159851"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 03:03:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 2/4] drm/edid: Add support for quirks visible to DRM
 core and drivers
In-Reply-To: <20250604091315.16703-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250603121543.17842-3-imre.deak@intel.com>
 <20250604091315.16703-1-imre.deak@intel.com>
Date: Wed, 04 Jun 2025 13:02:57 +0300
Message-ID: <5e16fc31d59f2f284a0be57bf0e508c13ebb0a1a@intel.com>
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

On Wed, 04 Jun 2025, Imre Deak <imre.deak@intel.com> wrote:
> Add support for EDID based quirks which can be queried outside of the
> EDID parser iteself by DRM core and drivers. There are at least two such
> quirks applicable to all drivers: the DPCD register access probe quirk
> and the 128b/132b DPRX Lane Count Conversion quirk (see 3.5.2.16.3 in
> the v2.1a DP Standard). The latter quirk applies to panels with specific
> EDID panel names, accordingly add support for defining quirks based on
> the EDID panel name.
>
> v2: Reset global_quirks in drm_reset_display_info().
>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c  | 34 +++++++++++++++++++++++++++-------
>  include/drm/drm_connector.h |  5 +++++
>  include/drm/drm_edid.h      |  5 +++++
>  3 files changed, 37 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 74e77742b2bd4..5d3a25cbc4d36 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -114,15 +114,21 @@ struct drm_edid_match_closure {
>  #define LEVEL_GTF2	2
>  #define LEVEL_CVT	3
>=20=20
> -#define EDID_QUIRK(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _quir=
ks) \
> +#define PANEL_NAME_ANY	NULL
> +
> +#define DRM_EDID_QUIRK(_panel_id, _panel_name, _quirks) \
>  { \
>  	.ident =3D { \
> -		.panel_id =3D drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, \
> -						     vend_chr_2, product_id), \
> +		.panel_id =3D _panel_id, \
> +		.name =3D _panel_name, \
>  	}, \
>  	.quirks =3D _quirks \
>  }
>=20=20
> +#define EDID_QUIRK(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _quir=
ks) \
> +	DRM_EDID_QUIRK(drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_ch=
r_2, product_id), \
> +		       PANEL_NAME_ANY, _quirks)
> +

I'm not sure why this has to change. It's not explained in the commit
message.

>  static const struct edid_quirk {
>  	const struct drm_edid_ident ident;
>  	u32 quirks;
> @@ -248,6 +254,9 @@ static const struct edid_quirk {
>  	EDID_QUIRK('A', 'U', 'O', 0x1111, EDID_QUIRK_NON_DESKTOP),

Don't we want the other quirk list also be this concise?

>  };
>=20=20
> +static const struct edid_quirk global_edid_quirk_list[] =3D {
> +};
> +
>  /*
>   * Autogenerated from the DMT spec.
>   * This table is copied from xfree86/modes/xf86EdidModes.c.
> @@ -2937,13 +2946,14 @@ EXPORT_SYMBOL(drm_edid_duplicate);
>   *
>   * Return: A u32 represents the quirks to apply.
>   */
> -static u32 edid_get_quirks(const struct drm_edid *drm_edid)
> +static u32 edid_get_quirks(const struct drm_edid *drm_edid,
> +			   const struct edid_quirk *quirk_list, int quirk_list_size)
>  {
>  	const struct edid_quirk *quirk;
>  	int i;
>=20=20
> -	for (i =3D 0; i < ARRAY_SIZE(edid_quirk_list); i++) {
> -		quirk =3D &edid_quirk_list[i];
> +	for (i =3D 0; i < quirk_list_size; i++) {
> +		quirk =3D &quirk_list[i];
>  		if (drm_edid_match(drm_edid, &quirk->ident))
>  			return quirk->quirks;
>  	}
> @@ -6614,6 +6624,7 @@ static void drm_reset_display_info(struct drm_conne=
ctor *connector)
>  	info->vics_len =3D 0;
>=20=20
>  	info->quirks =3D 0;
> +	info->global_quirks =3D 0;

So I am not sure if we really need or want two lists.

I think we could have

drm_edid.h:

enum drm_edid_quirk {
	/* ... */
	DRM_EDID_QUIRK_MAX,
};

drm_edid.c:

enum drm_edid_internal_quirk {
	FOO_QUIRK =3D DRM_EDID_QUIRK_MAX,
        /* etc ... */
};

And just make info->quirks big enough. I think it feels simpler overall.

>=20=20
>  	info->source_physical_address =3D CEC_PHYS_ADDR_INVALID;
>  }
> @@ -6660,7 +6671,10 @@ static void update_display_info(struct drm_connect=
or *connector,
>=20=20
>  	edid =3D drm_edid->edid;
>=20=20
> -	info->quirks =3D edid_get_quirks(drm_edid);
> +	info->quirks =3D edid_get_quirks(drm_edid, edid_quirk_list,
> +				       ARRAY_SIZE(edid_quirk_list));
> +	info->global_quirks =3D edid_get_quirks(drm_edid, global_edid_quirk_lis=
t,
> +					      ARRAY_SIZE(global_edid_quirk_list));
>=20=20
>  	info->width_mm =3D edid->width_cm * 10;
>  	info->height_mm =3D edid->height_cm * 10;
> @@ -7566,3 +7580,9 @@ bool drm_edid_is_digital(const struct drm_edid *drm=
_edid)
>  		drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL;
>  }
>  EXPORT_SYMBOL(drm_edid_is_digital);
> +
> +bool drm_edid_has_quirk(struct drm_connector *connector, enum drm_edid_q=
uirk quirk)
> +{
> +	return connector->display_info.global_quirks & BIT(quirk);
> +}
> +EXPORT_SYMBOL(drm_edid_has_quirk);
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 73903c3c842f3..996ecf229f8c7 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -847,6 +847,11 @@ struct drm_display_info {
>  	 */
>  	u32 quirks;
>=20=20
> +	/**
> +	 * @global_quirks: EDID based quirks. Can be queried by DRM core and dr=
ivers.

Might mention that you should not access directly, but using
drm_edid_has_quirk().

> +	 */
> +	u32 global_quirks;
> +
>  	/**
>  	 * @source_physical_address: Source Physical Address from HDMI
>  	 * Vendor-Specific Data Block, for CEC usage.
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index b38409670868d..3d8e168521c82 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -109,6 +109,10 @@ struct detailed_data_string {
>  #define DRM_EDID_CVT_FLAGS_STANDARD_BLANKING (1 << 3)
>  #define DRM_EDID_CVT_FLAGS_REDUCED_BLANKING  (1 << 4)
>=20=20
> +enum drm_edid_quirk {
> +	DRM_EDID_QUIRK_NONE,
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
