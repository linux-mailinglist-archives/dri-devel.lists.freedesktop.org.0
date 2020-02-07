Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E550E155A0B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 15:50:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDED6FCE2;
	Fri,  7 Feb 2020 14:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B466FCE0;
 Fri,  7 Feb 2020 14:50:05 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Feb 2020 06:50:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,413,1574150400"; d="scan'208";a="220816121"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 07 Feb 2020 06:50:02 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Feb 2020 16:50:01 +0200
Date: Fri, 7 Feb 2020 16:50:01 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/6] drm: Include the encoder itself in possible_clones
Message-ID: <20200207145001.GI13686@intel.com>
References: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
 <20200207135950.6655-2-ville.syrjala@linux.intel.com>
 <d58f13cf-6c9e-9a1c-5cbd-e51e1ad04e80@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d58f13cf-6c9e-9a1c-5cbd-e51e1ad04e80@suse.de>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 07, 2020 at 03:28:35PM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 07.02.20 um 14:59 schrieb Ville Syrjala:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > The docs say possible_clones should always include the encoder itself.
> > Since most drivers don't want to deal with the complexities of cloning
> > let's allow them to set possible_clones=3D0 and instead we'll fix that
> > up in the core.
> > =

> > We can't put this special case into drm_encoder_init() because drivers
> > will have to fill up possible_clones after adding all the relevant
> > encoders. Otherwise they wouldn't know the proper encoder indexes to
> > use. So we'll just do it just before registering the encoders.
> > =

> > TODO: Should we do something similar for possible_crtcs=3D=3D0?
> > =

> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> May this fixup function should warn iff possible_clones was set to non-0
> by the driver, but the encoder itself is missing.

Yeah, I guess we could do that.

> In any case
> =

> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> =

> > ---
> >  drivers/gpu/drm/drm_encoder.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > =

> > diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encode=
r.c
> > index e555281f43d4..f761d9306028 100644
> > --- a/drivers/gpu/drm/drm_encoder.c
> > +++ b/drivers/gpu/drm/drm_encoder.c
> > @@ -66,11 +66,26 @@ static const struct drm_prop_enum_list drm_encoder_=
enum_list[] =3D {
> >  	{ DRM_MODE_ENCODER_DPI, "DPI" },
> >  };
> >  =

> > +/*
> > + * For some reason we want the encoder itself included in
> > + * possible_clones. Make life easy for drivers by allowing them
> > + * to leave possible_clones unset if no cloning is possible.
> > + */
> > +static void fixup_possible_clones(struct drm_device *dev)
> > +{
> > +	struct drm_encoder *encoder;
> > +
> > +	drm_for_each_encoder(encoder, dev)
> > +		encoder->possible_clones |=3D drm_encoder_mask(encoder);
> > +}
> > +
> >  int drm_encoder_register_all(struct drm_device *dev)
> >  {
> >  	struct drm_encoder *encoder;
> >  	int ret =3D 0;
> >  =

> > +	fixup_possible_clones(dev);
> > +
> >  	drm_for_each_encoder(encoder, dev) {
> >  		if (encoder->funcs->late_register)
> >  			ret =3D encoder->funcs->late_register(encoder);
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
