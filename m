Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D29A99FB2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 21:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1D76EA37;
	Thu, 22 Aug 2019 19:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531406EA37
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 19:18:02 +0000 (UTC)
X-Originating-IP: 87.18.63.98
Received: from uno.localdomain (unknown [87.18.63.98])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 52EAEC0007;
 Thu, 22 Aug 2019 19:17:56 +0000 (UTC)
Date: Thu, 22 Aug 2019 21:19:25 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 19/19] drm: rcar-du: kms: Update CMM in atomic commit
 tail
Message-ID: <20190822191925.dnbdihnt3ole2nqx@uno.localdomain>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-20-jacopo+renesas@jmondi.org>
 <20190820184215.GM10820@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20190820184215.GM10820@pendragon.ideasonboard.com>
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: multipart/mixed; boundary="===============1598877851=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1598877851==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3qbfvdcd762hsr7u"
Content-Disposition: inline


--3qbfvdcd762hsr7u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Tue, Aug 20, 2019 at 09:42:15PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Sat, Jul 06, 2019 at 04:07:46PM +0200, Jacopo Mondi wrote:
> > Update CMM settings at in the atomic commit tail helper method.
> >
> > The CMM is updated with new gamma values provided to the driver
> > in the GAMMA_LUT blob property.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 35 +++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > index b79cda2f5531..f9aece78ca5f 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > @@ -21,6 +21,7 @@
> >  #include <linux/of_platform.h>
> >  #include <linux/wait.h>
> >
> > +#include "rcar_cmm.h"
> >  #include "rcar_du_crtc.h"
> >  #include "rcar_du_drv.h"
> >  #include "rcar_du_encoder.h"
> > @@ -287,6 +288,37 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> >   * Atomic Check and Update
> >   */
> >
> > +static void rcar_du_atomic_commit_update_cmm(struct drm_crtc *crtc,
> > +					     struct drm_crtc_state *old_state)
> > +{
> > +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> > +	struct rcar_cmm_config cmm_config = {};
> > +
> > +	if (!rcrtc->cmm || !crtc->state->color_mgmt_changed)
> > +		return;
> > +
> > +	if (!crtc->state->gamma_lut) {
> > +		cmm_config.lut.enable = false;
> > +		rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> > +
> > +		return;
> > +	}
> > +
> > +	cmm_config.lut.enable = true;
> > +	cmm_config.lut.table = (struct drm_color_lut *)
> > +			       crtc->state->gamma_lut->data;
> > +
> > +	/* Set LUT table size to 0 if entries should not be updated. */
> > +	if (!old_state->gamma_lut ||
> > +	    old_state->gamma_lut->base.id != crtc->state->gamma_lut->base.id)
> > +		cmm_config.lut.size = crtc->state->gamma_lut->length
> > +				    / sizeof(cmm_config.lut.table[0]);
> > +	else
> > +		cmm_config.lut.size = 0;
> > +
> > +	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> > +}
> > +
> >  static int rcar_du_atomic_check(struct drm_device *dev,
> >  				struct drm_atomic_state *state)
> >  {
> > @@ -329,6 +361,9 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
> >  			rcdu->dpad1_source = rcrtc->index;
> >  	}
> >
> > +	for_each_old_crtc_in_state(old_state, crtc, crtc_state, i)
> > +		rcar_du_atomic_commit_update_cmm(crtc, crtc_state);
> > +
>
> I think this looks good overall, but I wonder if we couldn't simplify
> the CMM driver suspend/resume and LUT caching due to config while not
> enabled by handling it on the DU side. I have a rework on the commit
> tail handler in progress, I'll think how this could be done. For now I
> think you can leave it as is.
>

Does this mean I have your R-b tag ? :)

Thanks
  j

> >  	/* Apply the atomic update. */
> >  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> >  	drm_atomic_helper_commit_planes(dev, old_state,
>
> --
> Regards,
>
> Laurent Pinchart

--3qbfvdcd762hsr7u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1e6r0ACgkQcjQGjxah
VjwIoBAAnnFT2D1f5giY7bIuwi3DtCaXzY6/kEPbXXSqxroLRiNDRATdQXBA+HVr
Z212k0ILVX4BkLQcksmd6ZXdac9TxS2y6/ejFF6474NE8LJ5TpkDQzSzgSMb1Y0F
LrJOEw7xVImUIDt5Lo7tpFoyT3KdMRgYbpGYFDVRvhxGsApsmDz8KIA/QTrw+PTB
P74B9kKM5V0FxMbSaTJotxiyqY5J1mQtwCNGdX2ud8rZc1AC1uhKVOxtYLTLPiIp
PIOTWPimzIpVmFN7GLQDfObLARsrN6kfnqk3SZheOJCA7AG1YGoW8nza7iX/cWkl
Dn+Tvs955Czre7c+z1HOAo/bc6Ch3Ejux7sMtkF1b26Pgvrb3u5GSiByf+4nnfk1
uGox2IFORT0pfKHDnqDfQwVYD3vWrOBa6fZvsv1+rk/WldQrinYeDf9HPNG1KH+J
AJBrEbKMmvjJvQNWNOGGdyuHngQtfMPNFQ980olWNhAj5Rgl44dnY0/kIgOXuEN+
St996VyO46itGP7zygleeEtmWIFryzbDymhBTUaahhL0WUyUutNauZ6KZ7iwNQzY
FVZzaq8ZtjRifFiwy8F924rJd+VdNwjDHaY8lmEmr18m3EWoL73sva3qn/AZ57cV
CWzAE/kTGqiyxfMRSnIM5bU4GXMdpg5sBnWzHoftuLI/i5xjTLw=
=IuZt
-----END PGP SIGNATURE-----

--3qbfvdcd762hsr7u--

--===============1598877851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1598877851==--
