Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8537F120995
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 16:24:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C2F6E02D;
	Mon, 16 Dec 2019 15:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543636E02D;
 Mon, 16 Dec 2019 15:24:03 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 07:23:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,322,1571727600"; d="scan'208";a="212243744"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 16 Dec 2019 07:23:56 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 16 Dec 2019 17:23:55 +0200
Date: Mon, 16 Dec 2019 17:23:55 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tom Anderson <thomasanderson@google.com>
Subject: Re: [PATCH v4 1/4] drm/edid: Abstract away cea_edid_modes[]
Message-ID: <20191216152355.GX1208@intel.com>
References: <20191213174348.27261-1-ville.syrjala@linux.intel.com>
 <20191213174348.27261-2-ville.syrjala@linux.intel.com>
 <20191213210330.GA131138@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213210330.GA131138@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Hans Verkuil <hansverk@cisco.com>,
 Manasi Navare <manasi.d.navare@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 01:03:30PM -0800, Tom Anderson wrote:
> Latest patch looks good to me, thanks for the changes!
> =

> Reviewed-by: Thomas Anderson <thomasanderson@google.com>

Thanks for the review. Series pushed to drm-misc-next.

> =

> On Fri, Dec 13, 2019 at 07:43:45PM +0200, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > We're going to need two cea mode tables (one for VICs < 128,
> > another one for VICs >=3D 193). To that end replace the direct
> > edid_cea_modes[] lookups with a function call. And we'll rename
> > the array to edid_cea_modes_0[] to indicate how it's to be
> > indexed.
> > =

> > v2: Fix typos (Tom)
> >     Drop the pointless NULL checks in the loops (Tom)
> >     Assign when declaring (Tom)
> >     Improve the comment for cea_modes_*[] to indicate
> >     that one should always use cea_mode_for_vic() (Tom)
> > =

> > Cc: Tom Anderson <thomasanderson@google.com>
> > Cc: Hans Verkuil <hansverk@cisco.com>
> > Cc: Manasi Navare <manasi.d.navare@intel.com>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 67 +++++++++++++++++++++++++-------------
> >  1 file changed, 45 insertions(+), 22 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 5b33b7cfd645..00a543b9daab 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -710,12 +710,11 @@ static const struct minimode extra_modes[] =3D {
> >  };
> >  =

> >  /*
> > - * Probably taken from CEA-861 spec.
> > - * This table is converted from xorg's hw/xfree86/modes/xf86EdidModes.=
c.
> > + * From CEA/CTA-861 spec.
> >   *
> > - * Index using the VIC.
> > + * Do not access directly, instead always use cea_mode_for_vic().
> >   */
> > -static const struct drm_display_mode edid_cea_modes[] =3D {
> > +static const struct drm_display_mode edid_cea_modes_0[] =3D {
> >  	/* 0 - dummy, VICs start at 1 */
> >  	{ },
> >  	/* 1 - 640x480@60Hz 4:3 */
> > @@ -3071,6 +3070,25 @@ static u8 *drm_find_cea_extension(const struct e=
did *edid)
> >  	return cea;
> >  }
> >  =

> > +static const struct drm_display_mode *cea_mode_for_vic(u8 vic)
> > +{
> > +	if (!vic)
> > +		return NULL;
> > +	if (vic < ARRAY_SIZE(edid_cea_modes_0))
> > +		return &edid_cea_modes_0[vic];
> > +	return NULL;
> > +}
> > +
> > +static u8 cea_num_vics(void)
> > +{
> > +	return ARRAY_SIZE(edid_cea_modes_0);
> > +}
> > +
> > +static u8 cea_next_vic(u8 vic)
> > +{
> > +	return vic + 1;
> > +}
> > +
> >  /*
> >   * Calculate the alternate clock for the CEA mode
> >   * (60Hz vs. 59.94Hz etc.)
> > @@ -3108,14 +3126,14 @@ cea_mode_alternate_timings(u8 vic, struct drm_d=
isplay_mode *mode)
> >  	 * get the other variants by simply increasing the
> >  	 * vertical front porch length.
> >  	 */
> > -	BUILD_BUG_ON(edid_cea_modes[8].vtotal !=3D 262 ||
> > -		     edid_cea_modes[9].vtotal !=3D 262 ||
> > -		     edid_cea_modes[12].vtotal !=3D 262 ||
> > -		     edid_cea_modes[13].vtotal !=3D 262 ||
> > -		     edid_cea_modes[23].vtotal !=3D 312 ||
> > -		     edid_cea_modes[24].vtotal !=3D 312 ||
> > -		     edid_cea_modes[27].vtotal !=3D 312 ||
> > -		     edid_cea_modes[28].vtotal !=3D 312);
> > +	BUILD_BUG_ON(cea_mode_for_vic(8)->vtotal !=3D 262 ||
> > +		     cea_mode_for_vic(9)->vtotal !=3D 262 ||
> > +		     cea_mode_for_vic(12)->vtotal !=3D 262 ||
> > +		     cea_mode_for_vic(13)->vtotal !=3D 262 ||
> > +		     cea_mode_for_vic(23)->vtotal !=3D 312 ||
> > +		     cea_mode_for_vic(24)->vtotal !=3D 312 ||
> > +		     cea_mode_for_vic(27)->vtotal !=3D 312 ||
> > +		     cea_mode_for_vic(28)->vtotal !=3D 312);
> >  =

> >  	if (((vic =3D=3D 8 || vic =3D=3D 9 ||
> >  	      vic =3D=3D 12 || vic =3D=3D 13) && mode->vtotal < 263) ||
> > @@ -3143,8 +3161,8 @@ static u8 drm_match_cea_mode_clock_tolerance(cons=
t struct drm_display_mode *to_m
> >  	if (to_match->picture_aspect_ratio)
> >  		match_flags |=3D DRM_MODE_MATCH_ASPECT_RATIO;
> >  =

> > -	for (vic =3D 1; vic < ARRAY_SIZE(edid_cea_modes); vic++) {
> > -		struct drm_display_mode cea_mode =3D edid_cea_modes[vic];
> > +	for (vic =3D 1; vic < cea_num_vics(); vic =3D cea_next_vic(vic)) {
> > +		struct drm_display_mode cea_mode =3D *cea_mode_for_vic(vic);
> >  		unsigned int clock1, clock2;
> >  =

> >  		/* Check both 60Hz and 59.94Hz */
> > @@ -3182,8 +3200,8 @@ u8 drm_match_cea_mode(const struct drm_display_mo=
de *to_match)
> >  	if (to_match->picture_aspect_ratio)
> >  		match_flags |=3D DRM_MODE_MATCH_ASPECT_RATIO;
> >  =

> > -	for (vic =3D 1; vic < ARRAY_SIZE(edid_cea_modes); vic++) {
> > -		struct drm_display_mode cea_mode =3D edid_cea_modes[vic];
> > +	for (vic =3D 1; vic < cea_num_vics(); vic =3D cea_next_vic(vic)) {
> > +		struct drm_display_mode cea_mode =3D *cea_mode_for_vic(vic);
> >  		unsigned int clock1, clock2;
> >  =

> >  		/* Check both 60Hz and 59.94Hz */
> > @@ -3206,12 +3224,17 @@ EXPORT_SYMBOL(drm_match_cea_mode);
> >  =

> >  static bool drm_valid_cea_vic(u8 vic)
> >  {
> > -	return vic > 0 && vic < ARRAY_SIZE(edid_cea_modes);
> > +	return cea_mode_for_vic(vic) !=3D NULL;
> >  }
> >  =

> >  static enum hdmi_picture_aspect drm_get_cea_aspect_ratio(const u8 vide=
o_code)
> >  {
> > -	return edid_cea_modes[video_code].picture_aspect_ratio;
> > +	const struct drm_display_mode *mode =3D cea_mode_for_vic(video_code);
> > +
> > +	if (mode)
> > +		return mode->picture_aspect_ratio;
> > +
> > +	return HDMI_PICTURE_ASPECT_NONE;
> >  }
> >  =

> >  static enum hdmi_picture_aspect drm_get_hdmi_aspect_ratio(const u8 vid=
eo_code)
> > @@ -3323,7 +3346,7 @@ add_alternate_cea_modes(struct drm_connector *con=
nector, struct edid *edid)
> >  		unsigned int clock1, clock2;
> >  =

> >  		if (drm_valid_cea_vic(vic)) {
> > -			cea_mode =3D &edid_cea_modes[vic];
> > +			cea_mode =3D cea_mode_for_vic(vic);
> >  			clock2 =3D cea_mode_alternate_clock(cea_mode);
> >  		} else {
> >  			vic =3D drm_match_hdmi_mode(mode);
> > @@ -3398,7 +3421,7 @@ drm_display_mode_from_vic_index(struct drm_connec=
tor *connector,
> >  	if (!drm_valid_cea_vic(vic))
> >  		return NULL;
> >  =

> > -	newmode =3D drm_mode_duplicate(dev, &edid_cea_modes[vic]);
> > +	newmode =3D drm_mode_duplicate(dev, cea_mode_for_vic(vic));
> >  	if (!newmode)
> >  		return NULL;
> >  =

> > @@ -3432,7 +3455,7 @@ static int do_y420vdb_modes(struct drm_connector =
*connector,
> >  		if (!drm_valid_cea_vic(vic))
> >  			continue;
> >  =

> > -		newmode =3D drm_mode_duplicate(dev, &edid_cea_modes[vic]);
> > +		newmode =3D drm_mode_duplicate(dev, cea_mode_for_vic(vic));
> >  		if (!newmode)
> >  			break;
> >  		bitmap_set(hdmi->y420_vdb_modes, vic, 1);
> > @@ -4001,7 +4024,7 @@ static void fixup_detailed_cea_mode_clock(struct =
drm_display_mode *mode)
> >  	vic =3D drm_match_cea_mode_clock_tolerance(mode, 5);
> >  	if (drm_valid_cea_vic(vic)) {
> >  		type =3D "CEA";
> > -		cea_mode =3D &edid_cea_modes[vic];
> > +		cea_mode =3D cea_mode_for_vic(vic);
> >  		clock1 =3D cea_mode->clock;
> >  		clock2 =3D cea_mode_alternate_clock(cea_mode);
> >  	} else {
> > -- =

> > 2.23.0
> > =


-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
