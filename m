Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C391B09DC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 10:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAFA6EC34;
	Thu, 12 Sep 2019 08:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CEF6EC34
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 08:05:54 +0000 (UTC)
X-Originating-IP: 85.243.204.24
Received: from uno.localdomain (bl10-204-24.dsl.telepac.pt [85.243.204.24])
 (Authenticated sender: jacopo@jmondi.org)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 296811BF210;
 Thu, 12 Sep 2019 08:05:43 +0000 (UTC)
Date: Thu, 12 Sep 2019 10:07:20 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 6/9] drm: rcar-du: crtc: Enable and disable CMMs
Message-ID: <20190912080720.bn7bmu2o3gacrpf4@uno.localdomain>
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-7-jacopo+renesas@jmondi.org>
 <bc443263-5f20-f022-34c8-1e521243dec1@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <bc443263-5f20-f022-34c8-1e521243dec1@ideasonboard.com>
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
 horms@verge.net.au, geert@linux-m68k.org, laurent.pinchart@ideasonboard.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com, uli+renesas@fpond.eu
Content-Type: multipart/mixed; boundary="===============1070681084=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1070681084==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k2rlv3ba7xccay6w"
Content-Disposition: inline


--k2rlv3ba7xccay6w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Kieran,

On Wed, Sep 11, 2019 at 07:40:27PM +0100, Kieran Bingham wrote:
> Hi Jacopo,
>
> On 06/09/2019 14:54, Jacopo Mondi wrote:
> > Enable/disable the CMM associated with a CRTC at CRTC start and stop
> > time and enable the CMM unit through the Display Extensional Functions
> > register at group setup time.
> >
> > Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 7 +++++++
> >  drivers/gpu/drm/rcar-du/rcar_du_group.c | 8 ++++++++
> >  drivers/gpu/drm/rcar-du/rcar_du_regs.h  | 5 +++++
> >  3 files changed, 20 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > index 23f1d6cc1719..3dac605c3a67 100644
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
> > @@ -619,6 +620,9 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
> >  	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
> >  		rcar_du_vsp_disable(rcrtc);
> >
> > +	if (rcrtc->cmm)
> > +		rcar_cmm_disable(rcrtc->cmm);
> > +
> >  	/*
> >  	 * Select switch sync mode. This stops display operation and configures
> >  	 * the HSYNC and VSYNC signals as inputs.
> > @@ -686,6 +690,9 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
> >  	}
> >
> >  	rcar_du_crtc_start(rcrtc);
> > +
> > +	if (rcrtc->cmm)
> > +		rcar_cmm_enable(rcrtc->cmm);
> >  }
> >
> >  static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> > index 9eee47969e77..25d0fc125d7a 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> > @@ -147,6 +147,14 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
> >
> >  	rcar_du_group_setup_pins(rgrp);
> >
> > +	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CMM)) {
> > +		u32 defr7 = DEFR7_CODE
> > +			  | (rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0)
> > +			  | (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);
> > +
> > +		rcar_du_group_write(rgrp, DEFR7, defr7);
> > +	}
> > +
>
> What's the effect here on platforms with a CMM, but with
> CONFIG_DRM_RCAR_CMM unset?
>
> Will this incorrectly configure the DU ?
>
> Will it stall the display if the DU tries to interact with another
> module which is not enabled?

I recall I tested that (that's why I had to add stubs for CMM
functions, as I had linkage errors otherwise) and thing seems to be
fine as the CMM configuration/enblement resolve to an empty function.

Would you prefer to have this guarded by an #if IS_ENABLED() ?

Thanks
   j
>
>
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

--k2rlv3ba7xccay6w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl15/LgACgkQcjQGjxah
Vjx7txAAkCrsetrmnCoC6E1dVAdGEDFhdoD9Yba7icsaHU2h1A3HP9VQSAEk7qKr
gpLa1OqvyLhpFHy3atZM4vxXq4AUA3g2Usvuth1CKfnbrNG3olfjEyYo3A+07Q82
9SheDJpz4jVFlqcgLD5jEbR1ZxDWiQ5WZdmw+fMxTvn7ZwpRiNSOml6aFpWLx6ET
4pIodHvxzp7+XYhzO7YUEVhihQjdfNDIJS2X2rfaPDR5mwHLFsiyOmQ4r7xxuoYT
YCoXNDrwu1V6bks+LF4dhQU2tntJIf4FBl4MxzLToztE3zQcWq1ZFOlEO2qZLXHx
hC+hoadzWweV5X4djR1DcSEV0d9oVBBsVqfY2daY7g3Eg8VQM9Kx41WgixZC4dM0
lsgWskHICclFQxaMw15TVf7Ruijaml/OXsD2qNNpWabzsWze0ITZxjQC5MpPzsj/
MGLVYrXZ62bQl2hPj2lItDiqbf1OmpDwJj+bsRA5ZWrEZ8JF803c73HLTtH5weyC
KsLl1+gPd56BgzARQvBEwJ6oewgOauQR0AuoUBfdhiQ2rgxQoM+hawqBeXuuMCWY
JO6hxT97nuQ0jwN8f55MJPdOCWb4y36ZltKaZLHmSexuAPFDThlaiffnGvdm5l7F
WwWpx/+fg5BhdTCZXTnq/+xvU7uvxbdVNS5uWXUPfSH4GoBy7mE=
=5xVC
-----END PGP SIGNATURE-----

--k2rlv3ba7xccay6w--

--===============1070681084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1070681084==--
