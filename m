Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B32FC9EB5C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 16:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FC489C33;
	Tue, 27 Aug 2019 14:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B148889C33
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 14:43:00 +0000 (UTC)
X-Originating-IP: 87.18.63.98
Received: from uno.localdomain (unknown [87.18.63.98])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id CEF00C0003;
 Tue, 27 Aug 2019 14:42:50 +0000 (UTC)
Date: Tue, 27 Aug 2019 16:44:21 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 13/14] drm: rcar-du: kms: Update CMM in atomic commit
 tail
Message-ID: <20190827144421.vbcoizfjxj5ashv2@uno.localdomain>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-14-jacopo+renesas@jmondi.org>
 <20190827000017.GB5274@pendragon.ideasonboard.com>
 <20190827001927.GA5926@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20190827001927.GA5926@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: muroya@ksk.co.jp, uli@fpond.eu, horms@verge.net.au,
 VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com, Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: multipart/mixed; boundary="===============0693891037=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0693891037==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3m3cb2q7h77rk35u"
Content-Disposition: inline


--3m3cb2q7h77rk35u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

HI Laurent,

On Tue, Aug 27, 2019 at 03:19:27AM +0300, Laurent Pinchart wrote:
> On Tue, Aug 27, 2019 at 03:00:17AM +0300, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> > Thank you for the patch.
> >
> > On Sun, Aug 25, 2019 at 03:51:53PM +0200, Jacopo Mondi wrote:
> > > Update CMM settings at in the atomic commit tail helper method.
> > >
> > > The CMM is updated with new gamma values provided to the driver
> > > in the GAMMA_LUT blob property.
> > >
> > > Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 35 +++++++++++++++++++++++++++
> > >  1 file changed, 35 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > > index 61ca1d3c379a..047fdb982a11 100644
> > > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > > @@ -22,6 +22,7 @@
> > >  #include <linux/of_platform.h>
> > >  #include <linux/wait.h>
> > >
> > > +#include "rcar_cmm.h"
> > >  #include "rcar_du_crtc.h"
> > >  #include "rcar_du_drv.h"
> > >  #include "rcar_du_encoder.h"
> > > @@ -368,6 +369,37 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> > >   * Atomic Check and Update
> > >   */
> > >
> > > +static void rcar_du_atomic_commit_update_cmm(struct drm_crtc *crtc,
> > > +					     struct drm_crtc_state *old_state)
> > > +{
> > > +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> > > +	struct rcar_cmm_config cmm_config = {};
> > > +
> > > +	if (!rcrtc->cmm || !crtc->state->color_mgmt_changed)
> > > +		return;
> > > +
> > > +	if (!crtc->state->gamma_lut) {
> > > +		cmm_config.lut.enable = false;
> > > +		rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> > > +
> > > +		return;
> > > +	}
> > > +
> > > +	cmm_config.lut.enable = true;
> > > +	cmm_config.lut.table = (struct drm_color_lut *)
> > > +			       crtc->state->gamma_lut->data;
> > > +
> > > +	/* Set LUT table size to 0 if entries should not be updated. */
> > > +	if (!old_state->gamma_lut ||
> > > +	    old_state->gamma_lut->base.id != crtc->state->gamma_lut->base.id)
> > > +		cmm_config.lut.size = crtc->state->gamma_lut->length
> > > +				    / sizeof(cmm_config.lut.table[0]);
> >
> > It has just occurred to me that the hardware only support LUTs of

Where did you find this strict requirement ? I have tried programming
less than 256 entries in the 1-D LUT table, and it seems to me things
are working fine (from a visual inspection of the output image, I
don't see much differences from when I program the full table, maybe
that's an indication something is bad?)

Thanks
   j
> > exactly 256 entries. Should we remove cmm_config.lut.size (simplifying
> > the code in the CMM driver), and add a check to the CRTC .atomic_check()
> > handler to reject invalid LUTs ? Sorry for not having caught this
> > earlier.
>
> Just an additional comment, if we drop the size field, then the
> cmm_config.lut.table pointer should be set to NULL when the LUT contents
> don't need to be updated.
>
> > > +	else
> > > +		cmm_config.lut.size = 0;
> > > +
> > > +	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> > > +}
> > > +
> > >  static int rcar_du_atomic_check(struct drm_device *dev,
> > >  				struct drm_atomic_state *state)
> > >  {
> > > @@ -410,6 +442,9 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
> > >  			rcdu->dpad1_source = rcrtc->index;
> > >  	}
> > >
> > > +	for_each_old_crtc_in_state(old_state, crtc, crtc_state, i)
> > > +		rcar_du_atomic_commit_update_cmm(crtc, crtc_state);
> > > +
> > >  	/* Apply the atomic update. */
> > >  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> > >  	drm_atomic_helper_commit_planes(dev, old_state,
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
> --
> Regards,
>
> Laurent Pinchart

--3m3cb2q7h77rk35u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1lQcUACgkQcjQGjxah
VjzMqRAAvjI1dIl75COJM8s3AwAk9V/Sl1o3l0ttHp1a6JrSakhJCJidsuH29+GC
XbkCLizR1XSBa2yrfWyAPtFlltJjO35+iypOc73L7OI9tBFyIar7dsRDeCzQ853N
U26ToA5f9JCvHHAMyc6NJzzqWpp1QkkT2GPJmxavvyvhi0k4zHRvNMhkKmUfq/XS
vGGV/3q96JTPnHy+loaMRiasMhwt7Ow2SwTgjLlvwQy7v+bFxqXfPGTp+1ovUVxg
6FUccyq3e2CWH/sL2hcTomIUj4efvnhI5rHZ/pmayxmi++TeUPiZ+qQDZfGVU1hQ
9R6kUWBgZahFStAeqU4k3Hum4xklB77oeKeB9ndV5IgHzVE+5mpvdQMTYV4bkltT
KKkleHPtb8CH2Fqm+cu1Odake+iXOWKmjWtsVyAe81GCt80DjdzE01IlPnuuqxP4
aLS5Q1SAOLN1Z7EiBCU62JyBVB2vl6teH42yD8Y48ctU+0wtLuQ6tS1J8xVAdiQ0
SdB+gFIHa1skyA4KVR8DxOkaucO2ldAhHLSj0pLKKeR29Ojp9HjfmpJpb/Z+cFYA
Px2v0e4l/HGXEAvNEr2Glrss6a/Znz4qledwHJBYNDTgp9WqFnD5+1dDWJK0dzOJ
mS6b+uN5iNbHTQ1TSDDDkAxryETL+mUDPIN1Gnxfq5H5X+NTo08=
=RTB1
-----END PGP SIGNATURE-----

--3m3cb2q7h77rk35u--

--===============0693891037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0693891037==--
