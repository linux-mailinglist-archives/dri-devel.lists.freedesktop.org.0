Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B1264B31F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 11:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6C910E2F2;
	Tue, 13 Dec 2022 10:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5051410E1B4;
 Tue, 13 Dec 2022 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670926829; x=1702462829;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=mUeCvS5vxdUdAfFMurPlmDgqt2LjB8ylpCXBkTGh5Fs=;
 b=l/niHI1c3rRx4r4AIQwzISWD5BEcZTv0H+S390g7L7Ke9dazH3A4SlRG
 c2J6FupRWLFu2dsk7xBQBcnWtww+56U53Wn8GEHImQwaIG2Nr1kTZh/b4
 DNRc9l8Fl2Wtkn2yqFpM4u2SrIw9x9aNfAh1EthprQIq5DZkh866g0/oa
 hpL/xV5KYlvBxGUP0yEsiFCMsZWiKMqCB05/iomLQ6HkQZ7nrTng6jvM5
 /AOV6co5OlfCLEl1sNhP9bngICmn3z9QWvjAhV5cBslrF+Cl+j8z1KEZG
 jJtZbyii4tEKzoZ0FT6H8MqB1cO5CuECPK7PzWGmk8BoZmocqMetcPE6F w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="315733408"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="315733408"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 02:20:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="822828602"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="822828602"
Received: from amicu-mobl.ger.corp.intel.com (HELO localhost) ([10.252.19.220])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 02:20:25 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 06/16] drm/connector: Allow drivers to pass list of
 supported colorspaces
In-Reply-To: <20221212182137.374625-7-harry.wentland@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-7-harry.wentland@amd.com>
Date: Tue, 13 Dec 2022 12:20:22 +0200
Message-ID: <87ilify595.fsf@intel.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 12 Dec 2022, Harry Wentland <harry.wentland@amd.com> wrote:
> Drivers might not support all colorspaces defined in
> dp_colorspaces and hdmi_colorspaces. This results in
> undefined behavior when userspace is setting an
> unsupported colorspace.
>
> Allow drivers to pass the list of supported colorspaces
> when creating the colorspace property.
>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> ---
>  drivers/gpu/drm/drm_connector.c               | 140 +++++++++---------
>  .../gpu/drm/i915/display/intel_connector.c    |   4 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
>  include/drm/drm_connector.h                   |   8 +-
>  4 files changed, 83 insertions(+), 71 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index ddba0b9fcc17..0df5db3e4fec 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1012,64 +1012,57 @@ static const struct drm_prop_enum_list drm_dp_sub=
connector_enum_list[] =3D {
>  DRM_ENUM_NAME_FN(drm_get_dp_subconnector_name,
>  		 drm_dp_subconnector_enum_list)
>=20=20
> -static const struct drm_prop_enum_list hdmi_colorspaces[] =3D {
> -	/* For Default case, driver will set the colorspace */
> -	{ DRM_MODE_COLORIMETRY_DEFAULT, "Default" },
> -	/* Standard Definition Colorimetry based on CEA 861 */
> -	{ DRM_MODE_COLORIMETRY_SMPTE_170M_YCC, "SMPTE_170M_YCC" },
> -	{ DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
> -	/* Standard Definition Colorimetry based on IEC 61966-2-4 */
> -	{ DRM_MODE_COLORIMETRY_XVYCC_601, "XVYCC_601" },
> -	/* High Definition Colorimetry based on IEC 61966-2-4 */
> -	{ DRM_MODE_COLORIMETRY_XVYCC_709, "XVYCC_709" },
> -	/* Colorimetry based on IEC 61966-2-1/Amendment 1 */
> -	{ DRM_MODE_COLORIMETRY_SYCC_601, "SYCC_601" },
> -	/* Colorimetry based on IEC 61966-2-5 [33] */
> -	{ DRM_MODE_COLORIMETRY_OPYCC_601, "opYCC_601" },
> -	/* Colorimetry based on IEC 61966-2-5 */
> -	{ DRM_MODE_COLORIMETRY_OPRGB, "opRGB" },
> -	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
> -	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
> -	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
> -	/* Added as part of Additional Colorimetry Extension in 861.G */
> -	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
> -	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER, "DCI-P3_RGB_Theater" },
> +static const char * const colorspace_names[] =3D {
> +	[DRM_MODE_COLORIMETRY_DEFAULT] =3D "Default",
> +	[DRM_MODE_COLORIMETRY_SMPTE_170M_YCC] =3D "SMPTE_170M_YCC",
> +	[DRM_MODE_COLORIMETRY_BT709_YCC] =3D "BT709_YCC",
> +	[DRM_MODE_COLORIMETRY_XVYCC_601] =3D "XVYCC_601",
> +	[DRM_MODE_COLORIMETRY_XVYCC_709] =3D "XVYCC_709",
> +	[DRM_MODE_COLORIMETRY_SYCC_601] =3D "SYCC_601",
> +	[DRM_MODE_COLORIMETRY_OPYCC_601] =3D "opYCC_601",
> +	[DRM_MODE_COLORIMETRY_OPRGB] =3D "opRGB",
> +	[DRM_MODE_COLORIMETRY_BT2020_CYCC] =3D "BT2020_CYCC",
> +	[DRM_MODE_COLORIMETRY_BT2020_RGB] =3D "BT2020_RGB",
> +	[DRM_MODE_COLORIMETRY_BT2020_YCC] =3D "BT2020_YCC",
> +	[DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65] =3D "P3_RGB_D65",
> +	[DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER] =3D "P3_RGB_Theater",
> +	[DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED] =3D "RGB_WIDE_FIXED",
> +	[DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT] =3D "RGB_WIDE_FLOAT",
> +	[DRM_MODE_COLORIMETRY_BT601_YCC] =3D "BT601_YCC",
>  };
>=20=20
> +static const u32 hdmi_colorspaces =3D
> +	BIT(DRM_MODE_COLORIMETRY_SMPTE_170M_YCC) |
> +	BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
> +	BIT(DRM_MODE_COLORIMETRY_XVYCC_601) |
> +	BIT(DRM_MODE_COLORIMETRY_XVYCC_709) |
> +	BIT(DRM_MODE_COLORIMETRY_SYCC_601) |
> +	BIT(DRM_MODE_COLORIMETRY_OPYCC_601) |
> +	BIT(DRM_MODE_COLORIMETRY_OPRGB) |
> +	BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
> +	BIT(DRM_MODE_COLORIMETRY_BT2020_RGB) |
> +	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC) |
> +	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65) |
> +	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER);
> +
>  /*
>   * As per DP 1.4a spec, 2.2.5.7.5 VSC SDP Payload for Pixel Encoding/Col=
orimetry
>   * Format Table 2-120
>   */
> -static const struct drm_prop_enum_list dp_colorspaces[] =3D {
> -	/* For Default case, driver will set the colorspace */
> -	{ DRM_MODE_COLORIMETRY_DEFAULT, "Default" },
> -	{ DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED, "RGB_Wide_Gamut_Fixed_Point" },
> -	/* Colorimetry based on scRGB (IEC 61966-2-2) */
> -	{ DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT, "RGB_Wide_Gamut_Floating_Point" =
},
> -	/* Colorimetry based on IEC 61966-2-5 */
> -	{ DRM_MODE_COLORIMETRY_OPRGB, "opRGB" },
> -	/* Colorimetry based on SMPTE RP 431-2 */
> -	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
> -	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
> -	{ DRM_MODE_COLORIMETRY_BT601_YCC, "BT601_YCC" },
> -	{ DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
> -	/* Standard Definition Colorimetry based on IEC 61966-2-4 */
> -	{ DRM_MODE_COLORIMETRY_XVYCC_601, "XVYCC_601" },
> -	/* High Definition Colorimetry based on IEC 61966-2-4 */
> -	{ DRM_MODE_COLORIMETRY_XVYCC_709, "XVYCC_709" },
> -	/* Colorimetry based on IEC 61966-2-1/Amendment 1 */
> -	{ DRM_MODE_COLORIMETRY_SYCC_601, "SYCC_601" },
> -	/* Colorimetry based on IEC 61966-2-5 [33] */
> -	{ DRM_MODE_COLORIMETRY_OPYCC_601, "opYCC_601" },
> -	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
> -	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
> -};
> +static const u32 dp_colorspaces =3D
> +	BIT(DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED) |
> +	BIT(DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT) |
> +	BIT(DRM_MODE_COLORIMETRY_OPRGB) |
> +	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65) |
> +	BIT(DRM_MODE_COLORIMETRY_BT2020_RGB) |
> +	BIT(DRM_MODE_COLORIMETRY_BT601_YCC) |
> +	BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
> +	BIT(DRM_MODE_COLORIMETRY_XVYCC_601) |
> +	BIT(DRM_MODE_COLORIMETRY_XVYCC_709) |
> +	BIT(DRM_MODE_COLORIMETRY_SYCC_601) |
> +	BIT(DRM_MODE_COLORIMETRY_OPYCC_601) |
> +	BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
> +	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
>=20=20
>  /**
>   * DOC: standard connector properties
> @@ -1972,21 +1965,34 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_proper=
ty);
>   */
>=20=20
>  static int drm_mode_create_colorspace_property(struct drm_connector *con=
nector,
> -					const struct drm_prop_enum_list *colorspaces,
> -					int size)
> +					u32 supported_colorspaces)
>  {
>  	struct drm_device *dev =3D connector->dev;
> +	u32 colorspaces =3D supported_colorspaces | BIT(DRM_MODE_COLORIMETRY_DE=
FAULT);
> +	struct drm_prop_enum_list enum_list[DRM_MODE_COLORIMETRY_MAX];
> +	int i, len;
>=20=20
>  	if (connector->colorspace_property)
>  		return 0;
>=20=20
> -	if (!colorspaces)
> -		return 0;
> +	if (WARN_ON(supported_colorspaces =3D=3D 0 ||
> +		    (supported_colorspaces & -BIT(DRM_MODE_COLORIMETRY_MAX)) !=3D 0))
> +		return -EINVAL;
> +
> +	len =3D 0;
> +	for (i =3D 0; i < DRM_MODE_COLORIMETRY_MAX; i++) {
> +		if ((colorspaces & BIT(i)) =3D=3D 0)
> +			continue;
> +
> +		enum_list[len].type =3D i;
> +		enum_list[len].name =3D colorspace_names[i];
> +		len++;
> +	}
>=20=20
>  	connector->colorspace_property =3D
>  		drm_property_create_enum(dev, DRM_MODE_PROP_ENUM, "Colorspace",
> -					colorspaces,
> -					size);
> +					enum_list,
> +					len);
>=20=20
>  	if (!connector->colorspace_property)
>  		return -ENOMEM;
> @@ -2003,11 +2009,12 @@ static int drm_mode_create_colorspace_property(st=
ruct drm_connector *connector,
>   * Returns:
>   * Zero on success, negative errno on failure.
>   */
> -int drm_mode_create_hdmi_colorspace_property(struct drm_connector *conne=
ctor)
> +int drm_mode_create_hdmi_colorspace_property(struct drm_connector *conne=
ctor,
> +					     u32 supported_colorspaces)
>  {
> -	return drm_mode_create_colorspace_property(connector,
> -						   hdmi_colorspaces,
> -						   ARRAY_SIZE(hdmi_colorspaces));
> +	u32 colorspaces =3D supported_colorspaces & hdmi_colorspaces;
> +
> +	return drm_mode_create_colorspace_property(connector, colorspaces);
>  }
>  EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
>=20=20
> @@ -2021,11 +2028,12 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_pro=
perty);
>   * Returns:
>   * Zero on success, negative errno on failure.
>   */
> -int drm_mode_create_dp_colorspace_property(struct drm_connector *connect=
or)
> +int drm_mode_create_dp_colorspace_property(struct drm_connector *connect=
or,
> +					   u32 supported_colorspaces)
>  {
> -	return drm_mode_create_colorspace_property(connector,
> -						   dp_colorspaces,
> -						   ARRAY_SIZE(dp_colorspaces));
> +	u32 colorspaces =3D supported_colorspaces & dp_colorspaces;
> +
> +	return drm_mode_create_colorspace_property(connector, colorspaces);
>  }
>  EXPORT_SYMBOL(drm_mode_create_dp_colorspace_property);
>=20=20
> diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu=
/drm/i915/display/intel_connector.c
> index 1dcc268927a2..6e7cef58a626 100644
> --- a/drivers/gpu/drm/i915/display/intel_connector.c
> +++ b/drivers/gpu/drm/i915/display/intel_connector.c
> @@ -283,13 +283,13 @@ intel_attach_aspect_ratio_property(struct drm_conne=
ctor *connector)
>  void
>  intel_attach_hdmi_colorspace_property(struct drm_connector *connector)
>  {
> -	if (!drm_mode_create_hdmi_colorspace_property(connector))
> +	if (!drm_mode_create_hdmi_colorspace_property(connector, 0xffffffff))
>  		drm_connector_attach_colorspace_property(connector);
>  }
>=20=20
>  void
>  intel_attach_dp_colorspace_property(struct drm_connector *connector)
>  {
> -	if (!drm_mode_create_dp_colorspace_property(connector))
> +	if (!drm_mode_create_dp_colorspace_property(connector, 0xffffffff))
>  		drm_connector_attach_colorspace_property(connector);
>  }

The 0xffffffff here looks rather ugly. Since 0 is a forbidden value for
the mask and there's a WARN_ON() for it, could we perhaps repurpose 0
for the default "all"?

If the intention is for drivers to fix the default afterwards, there
could even be a drm_dbg_kms() to log this. Something like this, for
drm_mode_create_hdmi_colorspace_property():

	u32 colorspaces =3D supported_colorspaces & hdmi_colorspaces;

	if (!supported_colorspaces) {
        	colorspaces =3D hdmi_colorspaces;
                drm_dbg_kms(...);
        }

BR,
Jani.


> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 6ab83296b0e4..8d08d6a36f37 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -416,7 +416,7 @@ static int vc4_hdmi_connector_init(struct drm_device =
*dev,
>  	if (ret)
>  		return ret;
>=20=20
> -	ret =3D drm_mode_create_hdmi_colorspace_property(connector);
> +	ret =3D drm_mode_create_hdmi_colorspace_property(connector, 0xffffffff);
>  	if (ret)
>  		return ret;
>=20=20
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index edef65388c29..5825c6ab969b 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -30,6 +30,7 @@
>  #include <linux/notifier.h>
>  #include <drm/drm_mode_object.h>
>  #include <drm/drm_util.h>
> +#include <drm/drm_property.h>
>=20=20
>  #include <uapi/drm/drm_mode.h>
>=20=20
> @@ -393,6 +394,7 @@ enum drm_colorspace {
>  	DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED,
>  	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT,
>  	DRM_MODE_COLORIMETRY_BT601_YCC,
> +	DRM_MODE_COLORIMETRY_MAX
>  };
>=20=20
>  /**
> @@ -1818,8 +1820,10 @@ int drm_connector_attach_hdr_output_metadata_prope=
rty(struct drm_connector *conn
>  bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state =
*old_state,
>  					     struct drm_connector_state *new_state);
>  int drm_mode_create_aspect_ratio_property(struct drm_device *dev);
> -int drm_mode_create_hdmi_colorspace_property(struct drm_connector *conne=
ctor);
> -int drm_mode_create_dp_colorspace_property(struct drm_connector *connect=
or);
> +int drm_mode_create_hdmi_colorspace_property(struct drm_connector *conne=
ctor,
> +					     u32 supported_colorspaces);
> +int drm_mode_create_dp_colorspace_property(struct drm_connector *connect=
or,
> +					   u32 supported_colorspaces);
>  int drm_mode_create_content_type_property(struct drm_device *dev);
>  int drm_mode_create_suggested_offset_properties(struct drm_device *dev);

--=20
Jani Nikula, Intel Open Source Graphics Center
