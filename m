Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB5C155C1C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 17:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1EB6EAD2;
	Fri,  7 Feb 2020 16:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7956EAD2;
 Fri,  7 Feb 2020 16:49:07 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Feb 2020 08:49:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,414,1574150400"; d="scan'208";a="225595113"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 07 Feb 2020 08:49:04 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Feb 2020 18:49:03 +0200
Date: Fri, 7 Feb 2020 18:49:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 6/6] drm: Validate encoder->possible_crtcs
Message-ID: <20200207164903.GO13686@intel.com>
References: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
 <20200207135950.6655-7-ville.syrjala@linux.intel.com>
 <20200207163926.GN43062@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207163926.GN43062@phenom.ffwll.local>
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

On Fri, Feb 07, 2020 at 05:39:26PM +0100, Daniel Vetter wrote:
> On Fri, Feb 07, 2020 at 03:59:50PM +0200, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > WARN if the encoder possible_crtcs is effectively empty or contains
> > bits for non-existing crtcs.
> > =

> > TODO: Or should we perhapst just filter out any bit for a
> > non-exisiting crtc?
> > =

> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> >From a quick grep it looks like at least most drivers seem to get this
> right. Worth a shot to find the hold-outs.
> =

> Two things:
> - Imo also best to move into the drm_mode_config_validate I suggested.
> - Please update the kerneldoc for drm_encoder.possible_crtcs to mention
>   that this will WARN if you get it wrong (and maybe remove the line that
>   most drivers screw this up).

ack

> =

> Check itself lgtm.
> -Daniel
> =

> > ---
> >  drivers/gpu/drm/drm_encoder.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > =

> > diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encode=
r.c
> > index bc2246f27e0d..f16b2a2518d7 100644
> > --- a/drivers/gpu/drm/drm_encoder.c
> > +++ b/drivers/gpu/drm/drm_encoder.c
> > @@ -107,6 +107,23 @@ static void validate_possible_clones(struct drm_en=
coder *encoder)
> >  	     encoder->possible_clones, encoder_mask);
> >  }
> >  =

> > +static void validate_possible_crtcs(struct drm_encoder *encoder)
> > +{
> > +	struct drm_device *dev =3D encoder->dev;
> > +	struct drm_crtc *crtc;
> > +	u32 crtc_mask =3D 0;
> > +
> > +	drm_for_each_crtc(crtc, dev)
> > +		crtc_mask |=3D drm_crtc_mask(crtc);
> > +
> > +	WARN((encoder->possible_crtcs & crtc_mask) =3D=3D 0 ||
> > +	     (encoder->possible_crtcs & ~crtc_mask) !=3D 0,
> > +	     "Bogus possible_crtcs: "
> > +	     "[ENCODER:%d:%s] possible_crtcs=3D0x%x (full crtc mask=3D0x%x)\n=
",
> > +	     encoder->base.id, encoder->name,
> > +	     encoder->possible_crtcs, crtc_mask);
> > +}
> > +
> >  int drm_encoder_register_all(struct drm_device *dev)
> >  {
> >  	struct drm_encoder *encoder;
> > @@ -115,6 +132,7 @@ int drm_encoder_register_all(struct drm_device *dev)
> >  	fixup_possible_clones(dev);
> >  =

> >  	drm_for_each_encoder(encoder, dev) {
> > +		validate_possible_crtcs(encoder);
> >  		validate_possible_clones(encoder);
> >  =

> >  		if (encoder->funcs->late_register)
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
