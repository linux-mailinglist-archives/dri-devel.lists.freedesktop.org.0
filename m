Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA77FD778D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 15:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DFF6E262;
	Tue, 15 Oct 2019 13:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E77E6E286
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 13:38:37 +0000 (UTC)
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id BA1073AA107
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 13:36:34 +0000 (UTC)
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6A49420001D;
 Tue, 15 Oct 2019 13:36:04 +0000 (UTC)
Date: Tue, 15 Oct 2019 15:37:52 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v5 5/8] drm: rcar-du: crtc: Control CMM operations
Message-ID: <20191015133752.oyb3p6iyr3ekjxic@uno.localdomain>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20191015104621.62514-6-jacopo+renesas@jmondi.org>
 <42ae76b8-c65f-8c5e-e83a-fc6a422d2624@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <42ae76b8-c65f-8c5e-e83a-fc6a422d2624@ideasonboard.com>
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
Cc: muroya@ksk.co.jp, seanpaul@chromium.org,
 VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 horms@verge.net.au, geert@linux-m68k.org, laurent.pinchart@ideasonboard.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com, uli+renesas@fpond.eu,
 ezequiel@collabora.com
Content-Type: multipart/mixed; boundary="===============0893835003=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0893835003==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v5ggakj7spcktmjw"
Content-Disposition: inline


--v5ggakj7spcktmjw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Kieran,

On Tue, Oct 15, 2019 at 02:15:35PM +0100, Kieran Bingham wrote:
> Hi Jacopo,
>
> On 15/10/2019 11:46, Jacopo Mondi wrote:
> > Implement CMM handling in the crtc begin and enable atomic callbacks,
> > and enable CMM unit through the Display Extensional Functions
>
> Extensional ?
>
> Perhaps this should just be Display Extension Functions?
> Wow - that's actually what they call it in the data-sheet.
>
> > register at group setup time.
> >
>
> Only a trivial extra blank line below that I can find... so
>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 79 +++++++++++++++++++++++++
> >  drivers/gpu/drm/rcar-du/rcar_du_group.c |  5 ++
> >  drivers/gpu/drm/rcar-du/rcar_du_regs.h  |  5 ++
> >  3 files changed, 89 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > index 23f1d6cc1719..4bc50a3f4a00 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > @@ -21,6 +21,7 @@
> >  #include <drm/drm_plane_helper.h>
> >  #include <drm/drm_vblank.h>
> >
> > +#include "rcar_cmm.h"
> >  #include "rcar_du_crtc.h"
> >  #include "rcar_du_drv.h"
> >  #include "rcar_du_encoder.h"
> > @@ -474,6 +475,70 @@ static void rcar_du_crtc_wait_page_flip(struct rcar_du_crtc *rcrtc)
> >  	rcar_du_crtc_finish_page_flip(rcrtc);
> >  }
> >
> > +/* -----------------------------------------------------------------------------
> > + * Color Management Module (CMM)
> > + */
> > +static int rcar_du_cmm_enable(struct drm_crtc *crtc)
> > +{
> > +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> > +
> > +	if (!rcrtc->cmm)
> > +		return 0;
> > +
> > +	return rcar_cmm_enable(rcrtc->cmm);
> > +}
> > +
> > +static void rcar_du_cmm_disable(struct drm_crtc *crtc)
> > +{
> > +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> > +
> > +	if (!rcrtc->cmm)
> > +		return;
> > +
> > +	rcar_cmm_disable(rcrtc->cmm);
> > +}
> > +
> > +static int rcar_du_cmm_check(struct drm_crtc *crtc,
> > +			     struct drm_crtc_state *state)
> > +{
> > +	struct drm_property_blob *drm_lut = state->gamma_lut;
> > +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> > +	struct device *dev = rcrtc->dev->dev;
> > +
> > +	if (!rcrtc->cmm || !drm_lut)
> > +		return 0;
> > +
> > +	/* We only accept fully populated LUT tables. */
> > +	if (CM2_LUT_SIZE * sizeof(struct drm_color_lut) !=
> > +	    drm_lut->length) {
> > +		dev_err(dev, "invalid gamma lut size: %lu bytes\n",
> > +			drm_lut->length);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void rcar_du_cmm_setup(struct drm_crtc *crtc)
> > +{
> > +	struct drm_property_blob *drm_lut = crtc->state->gamma_lut;
> > +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> > +	struct rcar_cmm_config cmm_config = {};
> > +
> > +	if (!rcrtc->cmm)
> > +		return;
> > +
> > +	if (drm_lut) {
> > +		cmm_config.lut.enable = true;
> > +		cmm_config.lut.table = (struct drm_color_lut *)drm_lut->data;
> > +
> > +	} else {
> > +		cmm_config.lut.enable = false;
> > +	}
> > +
> > +	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> > +}
> > +
> >  /* -----------------------------------------------------------------------------
> >   * Start/Stop and Suspend/Resume
> >   */
> > @@ -619,6 +684,8 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
> >  	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
> >  		rcar_du_vsp_disable(rcrtc);
> >
> > +	rcar_du_cmm_disable(crtc);
> > +
> >  	/*
> >  	 * Select switch sync mode. This stops display operation and configures
> >  	 * the HSYNC and VSYNC signals as inputs.
> > @@ -631,6 +698,7 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
> >  					   DSYSR_TVM_SWITCH);
> >
> >  	rcar_du_group_start_stop(rcrtc->group, false);
> > +
>
> Extra blank line...
>

Thanks for spotting this. I'm quite sure I run checkpatch (I just
re-did) and not warnings for the extra white space in the previous
patch, or this extra blank line o_0

>
> >  }
> >
> >  /* -----------------------------------------------------------------------------
> > @@ -642,6 +710,11 @@ static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
> >  {
> >  	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(state);
> >  	struct drm_encoder *encoder;
> > +	int ret;
> > +
> > +	ret = rcar_du_cmm_check(crtc, state);
> > +	if (ret)
> > +		return ret;
> >
> >  	/* Store the routes from the CRTC output to the DU outputs. */
> >  	rstate->outputs = 0;
> > @@ -667,6 +740,7 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
> >  	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(crtc->state);
> >  	struct rcar_du_device *rcdu = rcrtc->dev;
> >
> > +	rcar_du_cmm_enable(crtc);
> >  	rcar_du_crtc_get(rcrtc);
> >
> >  	/*
> > @@ -686,6 +760,7 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
> >  	}
> >
> >  	rcar_du_crtc_start(rcrtc);
> > +	rcar_du_cmm_setup(crtc);
> >  }
> >
> >  static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
> > @@ -739,6 +814,10 @@ static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
> >  	 */
> >  	rcar_du_crtc_get(rcrtc);
> >
> > +	/* If the active state changed, we let .atomic_enable handle CMM. */
> > +	if (crtc->state->color_mgmt_changed && !crtc->state->active_changed)
> > +		rcar_du_cmm_setup(crtc);
>
> Aha, this is quite neat for handling the timings.
>

Yes, much more streamlined than what we had. Thanks Sean and Ezequiel :)


> > +
> >  	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
> >  		rcar_du_vsp_atomic_begin(rcrtc);
> >  }
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> > index 9eee47969e77..583de800a66d 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> > @@ -135,6 +135,7 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
> >  static void rcar_du_group_setup(struct rcar_du_group *rgrp)
> >  {
> >  	struct rcar_du_device *rcdu = rgrp->dev;
> > +	u32 defr7 = DEFR7_CODE;
> >
> >  	/* Enable extended features */
> >  	rcar_du_group_write(rgrp, DEFR, DEFR_CODE | DEFR_DEFE);
> > @@ -147,6 +148,10 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
> >
> >  	rcar_du_group_setup_pins(rgrp);
> >
> > +	defr7 |= (rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0) |
> > +		 (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);
> > +	rcar_du_group_write(rgrp, DEFR7, defr7);
> > +
> >  	if (rcdu->info->gen >= 2) {
> >  		rcar_du_group_setup_defr8(rgrp);
> >  		rcar_du_group_setup_didsr(rgrp);
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> > index bc87f080b170..fb9964949368 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> > @@ -197,6 +197,11 @@
> >  #define DEFR6_MLOS1		(1 << 2)
> >  #define DEFR6_DEFAULT		(DEFR6_CODE | DEFR6_TCNE1)
> >
> > +#define DEFR7			0x000ec
> > +#define DEFR7_CODE		(0x7779 << 16)
> > +#define DEFR7_CMME1		BIT(6)
> > +#define DEFR7_CMME0		BIT(4)
> > +
> >  /* -----------------------------------------------------------------------------
> >   * R8A7790-only Control Registers
> >   */
> >
>

--v5ggakj7spcktmjw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2ly7AACgkQcjQGjxah
Vjw8ow//d6tiU5Dt4TuX4+n05Bzj/DCA2QLAoWOMYLO1GxgQj6Hc53NM+zKwRHVi
fIHbO8qafVfgjyRzbNubhPpn+jZsX+v7uS7EGvR4KqguzaZUlWg+7N6UA1pZEsKj
1xFAyi8TEP4grNDNwZJ8yOiNXuXKswR0dww8pUGwfNnS+O400YKoNwBtiyuCkSdp
Q9Sk+tiEEBVyVw1/JuqA0E8T3ATG28bSHqPoEBOBDW22jh2T0lPH9YdY330apaVA
17MtoXS9RWgkhyJVbR0Do98OMnTEV5sgab1Fy9fV9811IV8N3ZdwlWP2URyxWl9X
LKh+snGLJkMIo5BFKDU/EJ67+bm161jY2p980VJRes1P5PKkKKif98I09HAl+s9c
x0EoXN9VhqwGLHlSVpyT0/YfG+mQPApEVm8apE2obUfhIDk/uf82dLvlfpRCZtfU
4m/SWD0xit/vq9MKS4Du3NwUAukN5prERJnKLrsiGVJb3GHjTFz//twFrpgMPOVH
Rr13q8UlDpVu5MOrzFIFQTUFHtTYpg+iA2BakhkNYD28WzcOo39wk01dbN3YY1YE
DIJ7BCErIRq6MTS01qfirUvyzfudFIOaIC3GicigWdYhxjnMuxJAoy7jMwJ6eI2t
paxFkBzMxk5heqXQUD7cWeRePt8e+9L3jcG7HTTBGMu42TilTQw=
=/A/1
-----END PGP SIGNATURE-----

--v5ggakj7spcktmjw--

--===============0893835003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0893835003==--
