Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9925575E4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 10:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0123A11A4AB;
	Thu, 23 Jun 2022 08:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC7E11A4A5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 08:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655974255; x=1687510255;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=JcH3KmXjD1KSPa8xGCqAoGHyVkFxXykF2hfdlSvLiD4=;
 b=QPPng5LsiTJxukwsTwyQr7MUOqATr5ER8aG9lZbkppgeSmhiM1si6gxo
 lCQ7ssNJOsaDnXgoPMYBEM78K/FCbB7jeYhFAEQqnorvy3XpZZivHYqKw
 g2h/bcL3GH34AE6oqFhFfPTCHBuiFaZO6lEeeTORmSR88G4dn8VF71XZ8
 PBHBkRq6R+GNKcsBUdSk5SSYOrM53tZ3/LyNVJ+UX7RgkslhEdL02uXfz
 gZTTA9kLdm0yR6TA7RP0YFwg249ESzSa73bpAHSVZQvQHnjVhA8JiRQZT
 bgwy4QuiyC2H4sArgoM5e4cNZvAuwJ/ZP2r/Eu2EGs/fpN2Al/gXiWEo4 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="280711743"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="280711743"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 01:50:54 -0700
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="592609613"
Received: from gknielse-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.61.112])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 01:50:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/4] drm: New function to get luminance range based
 on static hdr metadata
In-Reply-To: <20220620072019.2710652-3-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220620072019.2710652-1-jouni.hogander@intel.com>
 <20220620072019.2710652-3-jouni.hogander@intel.com>
Date: Thu, 23 Jun 2022 11:50:50 +0300
Message-ID: <87edzfrcet.fsf@intel.com>
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Mika Kahola <mika.kahola@intel.com>,
 Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Jun 2022, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> Split luminance min/max calculation using static hdr metadata from
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:update_connector_ext_ca=
ps
> into drm/drm_edid.c and use it during edid parsing. Calculated range is
> stored into connector->display_info->luminance_range.
>
> v2: Calculate range during edid parsing
>
> Cc: Roman Li <roman.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Mika Kahola <mika.kahola@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 50 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 2bdaf1e34a9d..3b367100290f 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5014,6 +5014,49 @@ static void fixup_detailed_cea_mode_clock(struct d=
rm_display_mode *mode)
>  	mode->clock =3D clock;
>  }
>=20=20
> +static void drm_calculate_luminance_range(struct drm_connector *connecto=
r)
> +{
> +	struct hdr_static_metadata *hdr_metadata =3D &connector->hdr_sink_metad=
ata.hdmi_type1;
> +	struct drm_luminance_range_info *luminance_range =3D
> +		&connector->display_info.luminance_range;
> +	static const u8 pre_computed_values[] =3D {
> +		50, 51, 52, 53, 55, 56, 57, 58, 59, 61, 62, 63, 65, 66, 68, 69,
> +		71, 72, 74, 75, 77, 79, 81, 82, 84, 86, 88, 90, 92, 94, 96, 98};

Nitpick, newline before };

> +	u32 max_avg, min_cll, max, min, q, r;
> +
> +	if (!(hdr_metadata->metadata_type & BIT(HDMI_STATIC_METADATA_TYPE1)))
> +		return;
> +
> +	max_avg =3D hdr_metadata->max_fall;
> +	min_cll =3D hdr_metadata->min_cll;
> +
> +	/* From the specification (CTA-861-G), for calculating the maximum

Nitpick, newline after /*.

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
> +	q =3D max_avg >> 5;
> +	r =3D max_avg % 32;
> +	max =3D (1 << q) * pre_computed_values[r];
> +
> +	/* min luminance: maxLum * (CV/255)^2 / 100 */
> +	q =3D DIV_ROUND_CLOSEST(min_cll, 255);
> +	min =3D max * DIV_ROUND_CLOSEST((q * q), 100);
> +
> +	luminance_range->min_luminance =3D min;
> +	luminance_range->max_luminance =3D max;

I'll just trust this; not going to start verifying.

Acked-by: Jani Nikula <jani.nikula@intel.com>

> +}
> +
>  static uint8_t eotf_supported(const u8 *edid_ext)
>  {
>  	return edid_ext[2] &
> @@ -5045,8 +5088,12 @@ drm_parse_hdr_metadata_block(struct drm_connector =
*connector, const u8 *db)
>  		connector->hdr_sink_metadata.hdmi_type1.max_cll =3D db[4];
>  	if (len >=3D 5)
>  		connector->hdr_sink_metadata.hdmi_type1.max_fall =3D db[5];
> -	if (len >=3D 6)
> +	if (len >=3D 6) {
>  		connector->hdr_sink_metadata.hdmi_type1.min_cll =3D db[6];
> +
> +		/* Calculate only when all values are available */
> +		drm_calculate_luminance_range(connector);
> +	}
>  }
>=20=20
>  static void
> @@ -5951,6 +5998,7 @@ drm_reset_display_info(struct drm_connector *connec=
tor)
>=20=20
>  	info->non_desktop =3D 0;
>  	memset(&info->monitor_range, 0, sizeof(info->monitor_range));
> +	memset(&info->luminance_range, 0, sizeof(info->luminance_range));
>=20=20
>  	info->mso_stream_count =3D 0;
>  	info->mso_pixel_overlap =3D 0;

--=20
Jani Nikula, Intel Open Source Graphics Center
