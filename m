Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC976521A8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 14:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2057789FA5;
	Tue, 20 Dec 2022 13:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9184A10E375;
 Tue, 20 Dec 2022 13:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671543903; x=1703079903;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Q10DAnKVsK0OL7OMHnMNZu5Em0pNle5mFWj77vcVlXQ=;
 b=ShuL3DmumQMZin+wFFYSlW/EiIk+Xj3MmQeivO9qoKrehEU9OnU8I0aQ
 drsXQjbR3cPFXjJRZvFJjX+5Fj+l0zsTrdHokUdDS9M1wW1ZuKjASSC2b
 JaEEIvpMoDm6PmB/jlXSJlMO/1foao7Uc0Iiz0gR+QeFoSN9viAER7Tgm
 FiBFBrOBGNHKcBCeplOMX2Wjktp49HZuPY1ynsqXn/JKyOM4r/5yeRMD6
 k1Zoe77TGCtIDVayU4QRtIrkR2bP5mGFCxGIXNctK/PJ0R+SXWjqayAGB
 u/H7KtQIWpurqGO1yjVd2KG3qBo/RzQJwHA/f3kio2SJ58Leyoqzh+Pzx g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="303036685"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="303036685"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 05:45:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="775311316"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="775311316"
Received: from spalapa-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.60.249])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 05:44:59 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v6 06/12] drm/edid: refactor
 _drm_edid_connector_update() and rename
In-Reply-To: <Y6GyadM7DS6Z+Hvd@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1671206131.git.jani.nikula@intel.com>
 <f35102562feb9ca63462a902a582c3494fccde4d.1671206131.git.jani.nikula@intel.com>
 <Y6GsQXvDKPKsHf30@intel.com> <87wn6m2q6m.fsf@intel.com>
 <Y6GyadM7DS6Z+Hvd@intel.com>
Date: Tue, 20 Dec 2022 15:44:57 +0200
Message-ID: <87sfha2nqe.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Dec 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Dec 20, 2022 at 02:52:01PM +0200, Jani Nikula wrote:
>> On Tue, 20 Dec 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.=
com> wrote:
>> > On Fri, Dec 16, 2022 at 06:00:20PM +0200, Jani Nikula wrote:
>> >> By moving update_display_info() out of _drm_edid_connector_update() we
>> >> make the function purely about adding modes.
>> >
>> > I don't think that's quite true. The 4:2:0 stuff still updates
>> > various display_info things from the mode parsing functions.
>>=20
>> Right. I meant the top level. Will amend the commit message.
>
> So what's going to happen with the 4:2:0 stuff? Are we just clobbering
> it if/when someone calls the update_display_info() stuff w/o calling=20
> add_modes()?

Don't do that then?

*sigh*

I don't know.

It's pretty much the same thing as only calling update_display_info(),
before adding modes, and looking at the relevant info fields *before*
the add modes call. That's probably already happening.

I really wanted to put this all together into one call so nobody could
do that silly stuff. But then for various reasons drivers want to not
only read the EDID but also parse it in ->detect, and ->detect gets
called a lot.

We can't keep adding modes to probed modes in ->detect all the time
without pruning them. I thought about trying to avoid adding duplicated
modes in probed modes list, but it looks like another rabbit hole with
no end in sight. Don't really want to go that route.

If we want to make this fool proof, one way to fix this would be to do
all the info changes in step 1, even the ones that are currently added
via add modes. Iterate through everything, but only do the info
changes. And in step 2 only add the modes to probed modes list.

In any case, the current state of affairs is bonkers already. There's
supposed to be 1) reading the EDID, 2) updating the info, and 3) adding
the modes. But both drm_get_edid() *and* drm_add_edid_modes() do the
display info and property update part too. We've just been adding calls
here and there to patch things up. Nobody cares. Just add more calls
updating stuff, and hope it'll be fine. That's gotta stop.


BR,
Jani.



>
>>=20
>> BR,
>> Jani.
>>=20
>>=20
>> >
>> >> Rename accordingly.
>> >>=20
>> >> Cc: Imre Deak <imre.deak@intel.com>
>> >> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> >> ---
>> >>  drivers/gpu/drm/drm_edid.c | 25 ++++++++++++-------------
>> >>  1 file changed, 12 insertions(+), 13 deletions(-)
>> >>=20
>> >> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> >> index 15f69c362fc3..4ebfd7212bce 100644
>> >> --- a/drivers/gpu/drm/drm_edid.c
>> >> +++ b/drivers/gpu/drm/drm_edid.c
>> >> @@ -6575,19 +6575,12 @@ static int add_displayid_detailed_modes(struc=
t drm_connector *connector,
>> >>  	return num_modes;
>> >>  }
>> >>=20=20
>> >> -static int _drm_edid_connector_update(struct drm_connector *connecto=
r,
>> >> -				      const struct drm_edid *drm_edid)
>> >> +static int _drm_edid_connector_add_modes(struct drm_connector *conne=
ctor,
>> >> +					 const struct drm_edid *drm_edid)
>> >>  {
>> >>  	const struct drm_display_info *info =3D &connector->display_info;
>> >>  	int num_modes =3D 0;
>> >>=20=20
>> >> -	/*
>> >> -	 * CEA-861-F adds ycbcr capability map block, for HDMI 2.0 sinks.
>> >> -	 * To avoid multiple parsing of same block, lets parse that map
>> >> -	 * from sink info, before parsing CEA modes.
>> >> -	 */
>> >> -	update_display_info(connector, drm_edid);
>> >> -
>> >>  	if (!drm_edid)
>> >>  		return 0;
>> >>=20=20
>> >> @@ -6692,7 +6685,9 @@ int drm_edid_connector_update(struct drm_connec=
tor *connector,
>> >>  {
>> >>  	int count;
>> >>=20=20
>> >> -	count =3D _drm_edid_connector_update(connector, drm_edid);
>> >> +	update_display_info(connector, drm_edid);
>> >> +
>> >> +	count =3D _drm_edid_connector_add_modes(connector, drm_edid);
>> >>=20=20
>> >>  	_drm_update_tile_info(connector, drm_edid);
>> >>=20=20
>> >> @@ -6762,7 +6757,8 @@ EXPORT_SYMBOL(drm_connector_update_edid_propert=
y);
>> >>   */
>> >>  int drm_add_edid_modes(struct drm_connector *connector, struct edid =
*edid)
>> >>  {
>> >> -	struct drm_edid drm_edid;
>> >> +	struct drm_edid _drm_edid;
>> >> +	const struct drm_edid *drm_edid;
>> >>=20=20
>> >>  	if (edid && !drm_edid_is_valid(edid)) {
>> >>  		drm_warn(connector->dev, "[CONNECTOR:%d:%s] EDID invalid.\n",
>> >> @@ -6770,8 +6766,11 @@ int drm_add_edid_modes(struct drm_connector *c=
onnector, struct edid *edid)
>> >>  		edid =3D NULL;
>> >>  	}
>> >>=20=20
>> >> -	return _drm_edid_connector_update(connector,
>> >> -					  drm_edid_legacy_init(&drm_edid, edid));
>> >> +	drm_edid =3D drm_edid_legacy_init(&_drm_edid, edid);
>> >> +
>> >> +	update_display_info(connector, drm_edid);
>> >> +
>> >> +	return _drm_edid_connector_add_modes(connector, drm_edid);
>> >>  }
>> >>  EXPORT_SYMBOL(drm_add_edid_modes);
>> >>=20=20
>> >> --=20
>> >> 2.34.1
>>=20
>> --=20
>> Jani Nikula, Intel Open Source Graphics Center

--=20
Jani Nikula, Intel Open Source Graphics Center
