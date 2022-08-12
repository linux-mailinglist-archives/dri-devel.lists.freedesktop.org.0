Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0DD590C3D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 09:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CE793D24;
	Fri, 12 Aug 2022 07:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD69E9363E;
 Fri, 12 Aug 2022 07:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660287890; x=1691823890;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Wv3mliKJHlOvyzG83octad0uOqX2aKpqEvow5oXSetg=;
 b=iV8Ua9PW9/BCMIOcqZ0cX4g7WFsAQyrc8fyahj0kmRiTlyMRsQUg5P0E
 AKQ9tR+dlaQAe+En+c4oap/Z70Z/GzkvxB8PdsjjxT+j5DOSjaCpidqXz
 XgN3MnRD9sq08Q9s4Ep3LtP1RANcVk9JzqjI+08ZuWJ/Z9LYEUIKyUj+7
 dUZi77wfcD2IaTCOto4YrFUzSDLyuqrjESz/B5UjDvKzGBZ+i8wcHihMj
 12h6wob9NGZAIeHBwG70ANm1kTluWGsRDVYpwh3Wc2hgKNmJc1Dd52zrB
 MhOyHNV+aWJhwqgCNiBL4daLEo8U/rfyxG1f5kazsCYteX1Jwzaz7+aae A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="292801785"
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; d="scan'208";a="292801785"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2022 00:04:50 -0700
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; d="scan'208";a="581987316"
Received: from ebrazil-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.37.174])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2022 00:04:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, Jouni =?utf-8?Q?H?=
 =?utf-8?Q?=C3=B6gander?=
 <jouni.hogander@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v3 2/3] drm/amdgpu_dm: Rely on split out luminance
 calculation function
In-Reply-To: <BL1PR12MB5144D129C543A4FAD451FFF1F7649@BL1PR12MB5144.namprd12.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220719095700.14923-1-jouni.hogander@intel.com>
 <20220719095700.14923-3-jouni.hogander@intel.com>
 <877d3opc4d.fsf@intel.com>
 <BL1PR12MB5144D129C543A4FAD451FFF1F7649@BL1PR12MB5144.namprd12.prod.outlook.com>
Date: Fri, 12 Aug 2022 10:04:44 +0300
Message-ID: <87h72irlgz.fsf@intel.com>
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
Cc: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Li,
 Roman" <Roman.Li@amd.com>, Manasi Navare <manasi.d.navare@intel.com>,
 Mika Kahola <mika.kahola@intel.com>,
 Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Aug 2022, "Deucher, Alexander" <Alexander.Deucher@amd.com> wrote:
> [Public]
>
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Jani
>> Nikula
>> Sent: Thursday, August 4, 2022 5:55 AM
>> To: Jouni H=C3=B6gander <jouni.hogander@intel.com>; dri-
>> devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; amd-
>> gfx@lists.freedesktop.org
>> Cc: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Li, Roman
>> <Roman.Li@amd.com>; Manasi Navare <manasi.d.navare@intel.com>; Mika
>> Kahola <mika.kahola@intel.com>; Jouni H=C3=B6gander
>> <jouni.hogander@intel.com>; Wentland, Harry
>> <Harry.Wentland@amd.com>
>> Subject: Re: [PATCH v3 2/3] drm/amdgpu_dm: Rely on split out luminance
>> calculation function
>>=20
>> On Tue, 19 Jul 2022, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrot=
e:
>> > Luminance range calculation was split out into drm_edid.c and is now
>> > part of edid parsing. Rely on values calculated during edid parsing
>> > and use these for caps->aux_max_input_signal and caps-
>> >aux_min_input_signal.
>>=20
>> Harry, I'll merge patches 1 & 3 in this series through drm-misc-next, be=
cause I
>> think they're good to go, and fix stuff in i915.
>>=20
>> Can I get your rb/ack to merge this patch as well, or do you want to tak=
e this
>> later via your tree?
>
> You can take this via drm-misc.
> Acked-by: Alex Deucher <alexander.deucher@amd.com>

Thanks, pushed the series to drm-misc-next.

BR,
Jani.

>
>
>>=20
>> BR,
>> Jani.
>>=20
>>=20
>> >
>> > v2: Use values calculated during edid parsing
>> >
>> > Cc: Roman Li <roman.li@amd.com>
>> > Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>> > Cc: Harry Wentland <harry.wentland@amd.com>
>> > Cc: Lyude Paul <lyude@redhat.com>
>> > Cc: Mika Kahola <mika.kahola@intel.com>
>> > Cc: Jani Nikula <jani.nikula@intel.com>
>> > Cc: Manasi Navare <manasi.d.navare@intel.com>
>> > Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>
>> > ---
>> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 35
>> > +++----------------
>> >  1 file changed, 4 insertions(+), 31 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> > index 3e83fed540e8..eb7abdeb8653 100644
>> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> > @@ -2903,15 +2903,12 @@ static struct drm_mode_config_helper_funcs
>> > amdgpu_dm_mode_config_helperfuncs =3D {
>> >
>> >  static void update_connector_ext_caps(struct amdgpu_dm_connector
>> > *aconnector)  {
>> > -	u32 max_avg, min_cll, max, min, q, r;
>> >  	struct amdgpu_dm_backlight_caps *caps;
>> >  	struct amdgpu_display_manager *dm;
>> >  	struct drm_connector *conn_base;
>> >  	struct amdgpu_device *adev;
>> >  	struct dc_link *link =3D NULL;
>> > -	static const u8 pre_computed_values[] =3D {
>> > -		50, 51, 52, 53, 55, 56, 57, 58, 59, 61, 62, 63, 65, 66, 68, 69,
>> > -		71, 72, 74, 75, 77, 79, 81, 82, 84, 86, 88, 90, 92, 94, 96, 98};
>> > +	struct drm_luminance_range_info *luminance_range;
>> >  	int i;
>> >
>> >  	if (!aconnector || !aconnector->dc_link) @@ -2933,8 +2930,6 @@
>> > static void update_connector_ext_caps(struct amdgpu_dm_connector
>> *aconnector)
>> >  	caps =3D &dm->backlight_caps[i];
>> >  	caps->ext_caps =3D &aconnector->dc_link->dpcd_sink_ext_caps;
>> >  	caps->aux_support =3D false;
>> > -	max_avg =3D conn_base->hdr_sink_metadata.hdmi_type1.max_fall;
>> > -	min_cll =3D conn_base->hdr_sink_metadata.hdmi_type1.min_cll;
>> >
>> >  	if (caps->ext_caps->bits.oled =3D=3D 1 /*||
>> >  	    caps->ext_caps->bits.sdr_aux_backlight_control =3D=3D 1 || @@
>> > -2946,31 +2941,9 @@ static void update_connector_ext_caps(struct
>> amdgpu_dm_connector *aconnector)
>> >  	else if (amdgpu_backlight =3D=3D 1)
>> >  		caps->aux_support =3D true;
>> >
>> > -	/* From the specification (CTA-861-G), for calculating the maximum
>> > -	 * luminance we need to use:
>> > -	 *	Luminance =3D 50*2**(CV/32)
>> > -	 * Where CV is a one-byte value.
>> > -	 * For calculating this expression we may need float point precision;
>> > -	 * to avoid this complexity level, we take advantage that CV is divi=
ded
>> > -	 * by a constant. From the Euclids division algorithm, we know that
>> CV
>> > -	 * can be written as: CV =3D 32*q + r. Next, we replace CV in the
>> > -	 * Luminance expression and get 50*(2**q)*(2**(r/32)), hence we
>> just
>> > -	 * need to pre-compute the value of r/32. For pre-computing the
>> values
>> > -	 * We just used the following Ruby line:
>> > -	 *	(0...32).each {|cv| puts (50*2**(cv/32.0)).round}
>> > -	 * The results of the above expressions can be verified at
>> > -	 * pre_computed_values.
>> > -	 */
>> > -	q =3D max_avg >> 5;
>> > -	r =3D max_avg % 32;
>> > -	max =3D (1 << q) * pre_computed_values[r];
>> > -
>> > -	// min luminance: maxLum * (CV/255)^2 / 100
>> > -	q =3D DIV_ROUND_CLOSEST(min_cll, 255);
>> > -	min =3D max * DIV_ROUND_CLOSEST((q * q), 100);
>> > -
>> > -	caps->aux_max_input_signal =3D max;
>> > -	caps->aux_min_input_signal =3D min;
>> > +	luminance_range =3D &conn_base->display_info.luminance_range;
>> > +	caps->aux_min_input_signal =3D luminance_range->min_luminance;
>> > +	caps->aux_max_input_signal =3D luminance_range->max_luminance;
>> >  }
>> >
>> >  void amdgpu_dm_update_connector_after_detect(
>>=20
>> --
>> Jani Nikula, Intel Open Source Graphics Center

--=20
Jani Nikula, Intel Open Source Graphics Center
