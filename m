Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E088E11A9C7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 12:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899616EB15;
	Wed, 11 Dec 2019 11:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063556EB15
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 11:23:04 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 03:07:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; d="scan'208";a="203519974"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 11 Dec 2019 03:07:35 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 11 Dec 2019 13:07:35 +0200
Date: Wed, 11 Dec 2019 13:07:35 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tom Anderson <thomasanderson@google.com>
Subject: Re: [v3,3/4] drm/edid: Throw away the dummy VIC 0 cea mode
Message-ID: <20191211110735.GG1208@intel.com>
References: <20190925135502.24055-4-ville.syrjala@linux.intel.com>
 <20191210231854.GB25612@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210231854.GB25612@google.com>
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
Cc: Hans Verkuil <hansverk@cisco.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 10, 2019 at 03:18:54PM -0800, Tom Anderson wrote:
> On Wed, Sep 25, 2019 at 04:55:01PM +0300, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > Now that the cea mode handling is not 100% tied to the single
> > array the dummy VIC 0 mode is pretty much pointles. Throw it
> > out.
> > =

> > Cc: Hans Verkuil <hansverk@cisco.com>
> > Cc: Shashank Sharma <shashank.sharma@intel.com>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 14 +++++---------
> >  1 file changed, 5 insertions(+), 9 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 9f6996323efa..0007004d3221 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -709,11 +709,9 @@ static const struct minimode extra_modes[] =3D {
> >  /*
> >   * From CEA/CTA-861 spec.
> >   *
> > - * Index with VIC.
> > + * Index with VIC-1.
> =

> Since we shouldn't be indexing into this array directly any more, this co=
mment
> should instead be changed to say which functions should be used.

Seems reasonable.

> =

> >   */
> > -static const struct drm_display_mode edid_cea_modes_0[] =3D {
> > -	/* 0 - dummy, VICs start at 1 */
> > -	{ },
> > +static const struct drm_display_mode edid_cea_modes_1[] =3D {
> >  	/* 1 - 640x480@60Hz 4:3 */
> >  	{ DRM_MODE("640x480", DRM_MODE_TYPE_DRIVER, 25175, 640, 656,
> >  		   752, 800, 0, 480, 490, 492, 525, 0,
> > @@ -3211,10 +3209,8 @@ static u8 *drm_find_cea_extension(const struct e=
did *edid)
> >  =

> >  static const struct drm_display_mode *cea_mode_for_vic(u8 vic)
> >  {
> > -	if (!vic)
> > -		return NULL;
> > -	if (vic < ARRAY_SIZE(edid_cea_modes_0))
> > -		return &edid_cea_modes_0[vic];
> > +	if (vic >=3D 1 && vic < 1 + ARRAY_SIZE(edid_cea_modes_1))
> > +		return &edid_cea_modes_1[vic - 1];
> >  	if (vic >=3D 193 && vic < 193 + ARRAY_SIZE(edid_cea_modes_193))
> >  		return &edid_cea_modes_193[vic - 193];
> >  	return NULL;
> > @@ -3227,7 +3223,7 @@ static u8 cea_num_vics(void)
> >  =

> >  static u8 cea_next_vic(u8 vic)
> >  {
> > -	if (++vic =3D=3D ARRAY_SIZE(edid_cea_modes_0))
> > +	if (++vic =3D=3D 1 + ARRAY_SIZE(edid_cea_modes_1))
> >  		vic =3D 193;
> >  	return vic;
> >  }

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
