Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1901B50FF39
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 15:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8783B10E351;
	Tue, 26 Apr 2022 13:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1DD10E351
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 13:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650980280; x=1682516280;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=/ct5vfVY/J/7oMaT8ca4hIIkYw5QjuJ7/yVqDlXOBDk=;
 b=LDwPBch4HvKhxeSU+426dpabNIYHiD+8fyQBJVMdX9JPe7FTYQi3Wqol
 xh3M8Z7ZZpodWawt5L+yi2RFY2kVGseIPPblsg5CMvZRHer2lBRFwh2jo
 aeatsfwEVtndEBo1gPzOWP6fiw8bPR8iDBPv6N8YWgANz4SwqdBeppyrV
 zPzBEBGW4H8YTfthCukRSxaKARtRpI1B9jQLaIzujOh23Ibd+vKxe5lyh
 7Ky5QVjT9du25GB7EJqrLITnhtHKvjecKroTDeRS5roKPtI+UQuDL+lYe
 MlLllOm/8xvwulZEtD6QwMlMir1C323f9wyZzMLnhNOMsjbMwzw9ROHh+ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="328521230"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="328521230"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 06:38:00 -0700
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="558313717"
Received: from vhlushch-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.132.136])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 06:37:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm: New function to get luminance range based on
 static hdr metadata
In-Reply-To: <20220426123044.320415-2-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220426123044.320415-1-jouni.hogander@intel.com>
 <20220426123044.320415-2-jouni.hogander@intel.com>
Date: Tue, 26 Apr 2022 16:37:54 +0300
Message-ID: <87levst171.fsf@intel.com>
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
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Mika Kahola <mika.kahola@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 Apr 2022, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> Split luminance min/max calculation using static hdr metadata from
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:update_connector_ext_ca=
ps
> into drm/drm_edid.c.

IMO all of this should be computed at EDID parsing time once and stored
in the metadata. Maybe in drm_parse_hdr_metadata_block().

Over time we've added a bunch of functions to do this type of stuff, and
all drivers call them at slightly different times and different ways,
and it just grows complicated.

(Also, I think basically everything that comes out of the EDID or
DisplayID should be stored in connector->display_info instead of being
spread around like we currently do. But that's for another patch series,
another time.)

BR,
Jani.

>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Mika Kahola <mika.kahola@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 55 ++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_edid.h     |  4 +++
>  2 files changed, 59 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 7a8482b75071..1cb886debbbe 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4005,6 +4005,61 @@ drm_display_mode_from_cea_vic(struct drm_device *d=
ev,
>  }
>  EXPORT_SYMBOL(drm_display_mode_from_cea_vic);
>=20=20
> +/**
> + * drm_luminance_range_from_static_hdr_metadata() - luminance range from=
 static hdr
> + * metadata
> + * @connector: connector we're calculating for
> + * @min: Calculated min value
> + * @max: Calculated max value
> + *
> + * Calculates backlight min and max as described in CTA-861-G
> + *
> + * Returns: True when calculation succeeds.
> + */
> +bool
> +drm_luminance_range_from_static_hdr_metadata(struct drm_connector *conne=
ctor,
> +					     u32 *min, u32 *max)
> +{
> +	struct hdr_sink_metadata *hdr_metadata =3D &connector->hdr_sink_metadat=
a;
> +	static const u8 pre_computed_values[] =3D {
> +		50, 51, 52, 53, 55, 56, 57, 58, 59, 61, 62, 63, 65, 66, 68, 69,
> +		71, 72, 74, 75, 77, 79, 81, 82, 84, 86, 88, 90, 92, 94, 96, 98};
> +	u32 min_cll, max_cll, q, r;
> +
> +	if (!(hdr_metadata->hdmi_type1.metadata_type &
> +	      BIT(HDMI_STATIC_METADATA_TYPE1)))
> +		return false;
> +
> +	max_cll =3D hdr_metadata->hdmi_type1.max_cll;
> +	min_cll =3D hdr_metadata->hdmi_type1.min_cll;
> +
> +	/* From the specification (CTA-861-G), for calculating the maximum
> +	 * luminance we need to use:
> +	 *	Luminance =3D 50*2**(CV/32)
> +	 * Where CV is a one-byte value.
> +	 * For calculating this expression we may need float point precision;
> +	 * to avoid this complexity level, we take advantage that CV is divided
> +	 * by a constant. From the Euclids division algorithm, we know that CV
> +	 * can be written as: CV =3D 32*q + r. Next, we replace CV in the
> +	 * Luminance expression and get 50*(2**q)*(2**(r/32)), hence we just
> +	 * need to pre-compute the value of r/32. For pre-computing the values
> +	 * We just used the following Ruby line:
> +	 *	(0...32).each {|cv| puts (50*2**(cv/32.0)).round}
> +	 * The results of the above expressions can be verified at
> +	 * pre_computed_values.
> +	 */
> +	q =3D max_cll >> 5;
> +	r =3D max_cll % 32;
> +	*max =3D (1 << q) * pre_computed_values[r];
> +
> +	/* min luminance: maxLum * (CV/255)^2 / 100 */
> +	q =3D DIV_ROUND_CLOSEST(min_cll, 255);
> +	*min =3D *max * DIV_ROUND_CLOSEST((q * q), 100);
> +
> +	return true;
> +}
> +EXPORT_SYMBOL(drm_luminance_range_from_static_hdr_metadata);
> +
>  static int
>  do_cea_modes(struct drm_connector *connector, const u8 *db, u8 len)
>  {
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index c3204a58fb09..63e441c84d72 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -406,6 +406,10 @@ drm_hdmi_avi_infoframe_quant_range(struct hdmi_avi_i=
nfoframe *frame,
>  				   const struct drm_display_mode *mode,
>  				   enum hdmi_quantization_range rgb_quant_range);
>=20=20
> +bool
> +drm_luminance_range_from_static_hdr_metadata(struct drm_connector *conne=
ctor,
> +					     u32 *min, u32 *max);
> +
>  /**
>   * drm_eld_mnl - Get ELD monitor name length in bytes.
>   * @eld: pointer to an eld memory structure with mnl set

--=20
Jani Nikula, Intel Open Source Graphics Center
