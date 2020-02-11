Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC691595FC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 18:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF506EF2B;
	Tue, 11 Feb 2020 17:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B00D6E529;
 Tue, 11 Feb 2020 17:13:36 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 09:13:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="280990266"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 11 Feb 2020 09:13:32 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 11 Feb 2020 19:13:31 +0200
Date: Tue, 11 Feb 2020 19:13:31 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 5/7] drm: Validate encoder->possible_clones
Message-ID: <20200211171331.GY13686@intel.com>
References: <20200211162208.16224-1-ville.syrjala@linux.intel.com>
 <20200211162208.16224-6-ville.syrjala@linux.intel.com>
 <20200211170233.GL2363188@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211170233.GL2363188@phenom.ffwll.local>
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

On Tue, Feb 11, 2020 at 06:02:33PM +0100, Daniel Vetter wrote:
> On Tue, Feb 11, 2020 at 06:22:06PM +0200, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > Many drivers are populating encoder->possible_clones wrong. Let's
> > persuade them to get it right by adding some loud WARNs.
> > =

> > We'll cross check the bits between any two encoders. So either
> > both encoders can clone with the other, or neither can.
> > =

> > We'll also complain about effectively empty possible_clones, and
> > possible_clones containing bits for encoders that don't exist.
> > =

> > v2: encoder->possible_clones now includes the encoder itelf
> > v3: Move to drm_mode_config_validate() (Daniel)
> >     Document that you get a WARN when this is wrong (Daniel)
> >     Extract full_encoder_mask()
> > =

> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> I wonder whether we should start to have some unit tests for stuff like
> this, like set up broken driver, make sure we have a WARN in dmesg. But
> ideally we'd do that with the mocking stuff Kunit hopefully has soon.
> =

> </idle musings>
> =

> =

> > ---
> >  drivers/gpu/drm/drm_mode_config.c | 40 +++++++++++++++++++++++++++++++
> >  include/drm/drm_encoder.h         |  2 ++
> >  2 files changed, 42 insertions(+)
> > =

> > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mo=
de_config.c
> > index 75e357c7e84d..afc91447293a 100644
> > --- a/drivers/gpu/drm/drm_mode_config.c
> > +++ b/drivers/gpu/drm/drm_mode_config.c
> > @@ -533,6 +533,17 @@ void drm_mode_config_cleanup(struct drm_device *de=
v)
> >  }
> >  EXPORT_SYMBOL(drm_mode_config_cleanup);
> >  =

> > +static u32 full_encoder_mask(struct drm_device *dev)
> > +{
> > +	struct drm_encoder *encoder;
> > +	u32 encoder_mask =3D 0;
> > +
> > +	drm_for_each_encoder(encoder, dev)
> > +		encoder_mask |=3D drm_encoder_mask(encoder);
> > +
> > +	return encoder_mask;
> > +}
> > +
> >  /*
> >   * For some reason we want the encoder itself included in
> >   * possible_clones. Make life easy for drivers by allowing them
> > @@ -544,10 +555,39 @@ static void fixup_encoder_possible_clones(struct =
drm_encoder *encoder)
> >  		encoder->possible_clones =3D drm_encoder_mask(encoder);
> >  }
> >  =

> > +static void validate_encoder_possible_clones(struct drm_encoder *encod=
er)
> > +{
> > +	struct drm_device *dev =3D encoder->dev;
> > +	u32 encoder_mask =3D full_encoder_mask(dev);
> > +	struct drm_encoder *other;
> > +
> > +	drm_for_each_encoder(other, dev) {
> > +		WARN(!(encoder->possible_clones & drm_encoder_mask(other)) !=3D
> > +		     !(other->possible_clones & drm_encoder_mask(encoder)),
> =

> Bikeshed: !! as canonical "make this a bool value" might be slightly
> clearer, but whatever.

Can repaint.

> =

> > +		     "possible_clones mismatch: "
> > +		     "[ENCODER:%d:%s] mask=3D0x%x possible_clones=3D0x%x vs. "
> > +		     "[ENCODER:%d:%s] mask=3D0x%x possible_clones=3D0x%x\n",
> > +		     encoder->base.id, encoder->name,
> > +		     drm_encoder_mask(encoder), encoder->possible_clones,
> > +		     other->base.id, other->name,
> > +		     drm_encoder_mask(other), other->possible_clones);
> > +	}
> > +
> > +	WARN((encoder->possible_clones & drm_encoder_mask(encoder)) =3D=3D 0 =
||
> > +	     (encoder->possible_clones & ~encoder_mask) !=3D 0,
> > +	     "Bogus possible_clones: "
> > +	     "[ENCODER:%d:%s] possible_clones=3D0x%x (full encoder mask=3D0x%=
x)\n",
> > +	     encoder->base.id, encoder->name,
> > +	     encoder->possible_clones, encoder_mask);
> > +}
> =

> Since it's next to each another double-checking that the fixup did add the
> self-clone is probably too much :-)

I changed the fixup to be just
if (possible_clones =3D=3D 0)
	possible_clones =3D drm_encoder_mask();

So if the driver tries to set it up but fails and forgets the
encoder itself this WARN will still trip.

> =

> > +
> >  void drm_mode_config_validate(struct drm_device *dev)
> >  {
> >  	struct drm_encoder *encoder;
> >  =

> >  	drm_for_each_encoder(encoder, dev)
> >  		fixup_encoder_possible_clones(encoder);
> > +
> > +	drm_for_each_encoder(encoder, dev)
> > +		validate_encoder_possible_clones(encoder);
> =

> >  }
> > diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> > index 22d6cdf729f1..3741963b9587 100644
> > --- a/include/drm/drm_encoder.h
> > +++ b/include/drm/drm_encoder.h
> > @@ -163,6 +163,8 @@ struct drm_encoder {
> >  	 * any cloning it can leave @possible_clones set to 0. The core will
> >  	 * automagically fix this up by setting the bit for the encoder itsel=
f.
> >  	 *
> > +	 * You will get a WARN if you get this wrong in the driver.
> =

> Nice.
> =

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> =

> > +	 *
> >  	 * Note that since encoder objects can't be hotplugged the assigned i=
ndices
> >  	 * are stable and hence known before registering all objects.
> >  	 */
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
