Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E3F1595FE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 18:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBDB6E523;
	Tue, 11 Feb 2020 17:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AFD6E523;
 Tue, 11 Feb 2020 17:14:55 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 09:14:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="347315034"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 11 Feb 2020 09:14:51 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 11 Feb 2020 19:14:51 +0200
Date: Tue, 11 Feb 2020 19:14:51 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 7/7] drm: Allow drivers to leave
 encoder->possible_crtcs==0
Message-ID: <20200211171450.GZ13686@intel.com>
References: <20200211162208.16224-1-ville.syrjala@linux.intel.com>
 <20200211162208.16224-8-ville.syrjala@linux.intel.com>
 <20200211170545.GN2363188@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211170545.GN2363188@phenom.ffwll.local>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 06:05:45PM +0100, Daniel Vetter wrote:
> On Tue, Feb 11, 2020 at 06:22:08PM +0200, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > Let's simplify life of driver by allowing them to leave
> > encoder->possible_crtcs unset if they have no restrictions
> > in crtc<->encoder linkage. We'll just populate possible_crtcs
> > with the full crtc mask when registering the encoder so that
> > userspace doesn't have to deal with drivers not populating
> > this correctly.
> > =

> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> > We might not actually need/want this, but included it here for
> > future reference if that assumption turns out to be wrong.
> =

> I think this one is most definitely needed. _Lots_ of drivers get this
> toally wrong and just leave the value blank. It's encoded as official
> fallback in most userspace compositors.

OK. It's been a while since I dug around so can't really remmber how
this was being handled. I'll reorder before pushing.

> =

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> =

> > ---
> >  drivers/gpu/drm/drm_mode_config.c | 15 ++++++++++++++-
> >  include/drm/drm_encoder.h         |  4 ++++
> >  2 files changed, 18 insertions(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mo=
de_config.c
> > index 4c1b350ddb95..ce18c3dd0bde 100644
> > --- a/drivers/gpu/drm/drm_mode_config.c
> > +++ b/drivers/gpu/drm/drm_mode_config.c
> > @@ -592,6 +592,17 @@ static u32 full_crtc_mask(struct drm_device *dev)
> >  	return crtc_mask;
> >  }
> >  =

> > +/*
> > + * Make life easy for drivers by allowing them to leave
> > + * possible_crtcs unset if there are not crtc<->encoder
> > + * restrictions.
> > + */
> > +static void fixup_encoder_possible_crtcs(struct drm_encoder *encoder)
> > +{
> > +	if (encoder->possible_crtcs =3D=3D 0)
> > +		encoder->possible_crtcs =3D full_crtc_mask(encoder->dev);
> > +}
> > +
> >  static void validate_encoder_possible_crtcs(struct drm_encoder *encode=
r)
> >  {
> >  	u32 crtc_mask =3D full_crtc_mask(encoder->dev);
> > @@ -608,8 +619,10 @@ void drm_mode_config_validate(struct drm_device *d=
ev)
> >  {
> >  	struct drm_encoder *encoder;
> >  =

> > -	drm_for_each_encoder(encoder, dev)
> > +	drm_for_each_encoder(encoder, dev) {
> >  		fixup_encoder_possible_clones(encoder);
> > +		fixup_encoder_possible_crtcs(encoder);
> > +	}
> >  =

> >  	drm_for_each_encoder(encoder, dev) {
> >  		validate_encoder_possible_clones(encoder);
> > diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> > index b236269f41ac..bd033c5618bf 100644
> > --- a/include/drm/drm_encoder.h
> > +++ b/include/drm/drm_encoder.h
> > @@ -142,6 +142,10 @@ struct drm_encoder {
> >  	 * the bits for all &drm_crtc objects this encoder can be connected to
> >  	 * before calling drm_dev_register().
> >  	 *
> > +	 * As an exception to the above rule if any crtc can be connected to
> > +	 * the encoder the driver can leave @possible_crtcs set to 0. The core
> > +	 * will automagically fix this up by setting the bit for every crtc.
> > +	 *
> >  	 * You will get a WARN if you get this wrong in the driver.
> >  	 *
> >  	 * Note that since CRTC objects can't be hotplugged the assigned indi=
ces
> > -- =

> > 2.24.1
> > =

> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
