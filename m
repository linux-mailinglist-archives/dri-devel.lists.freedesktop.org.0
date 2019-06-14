Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9680D4570C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 10:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE7689336;
	Fri, 14 Jun 2019 08:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD26489336
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 08:15:13 +0000 (UTC)
X-Originating-IP: 37.177.88.254
Received: from uno.localdomain (unknown [37.177.88.254])
 (Authenticated sender: jacopo@jmondi.org)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 399AA1BF207;
 Fri, 14 Jun 2019 08:14:53 +0000 (UTC)
Date: Fri, 14 Jun 2019 10:15:52 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 19/20] drm: rcar-du: crtc: Register GAMMA_LUT properties
Message-ID: <20190614081507.3ky4pcyijjxnr7mp@uno.localdomain>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-20-jacopo+renesas@jmondi.org>
 <20190607120304.GH7593@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20190607120304.GH7593@pendragon.ideasonboard.com>
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
Content-Type: multipart/mixed; boundary="===============1897153112=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1897153112==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="khgtppfahw6u47d7"
Content-Disposition: inline


--khgtppfahw6u47d7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,
   thanks for review

On Fri, Jun 07, 2019 at 03:03:04PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Thu, Jun 06, 2019 at 04:22:19PM +0200, Jacopo Mondi wrote:
> > Enable the GAMMA_LUT KMS property using the framework helpers to
> > register the proeprty and the associated gamma table size maximum size.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > index e6d3df37c827..c920fb5dba65 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > @@ -1207,6 +1207,9 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
> >  	    rcdu->cmms[swindex]) {
> >  		rcrtc->cmm = rcdu->cmms[swindex];
> >  		rgrp->cmms_mask |= BIT(hwindex % 2);
> > +
> > +		drm_mode_crtc_set_gamma_size(crtc, CMM_GAMMA_LUT_SIZE);
> > +		drm_crtc_enable_color_mgmt(crtc, 0, false, CMM_GAMMA_LUT_SIZE);
>
> This change looks good, but you also need to add support for legacy API.
> According to the function's documentation,
>
>  * Drivers should use drm_atomic_helper_legacy_gamma_set() to implement the
>  * legacy &drm_crtc_funcs.gamma_set callback.
>

Drivers 'shuld' or drivers 'shall' ?
Isn't this required only to support the 'legacy APIs' ? Do we want that?

Thanks
   j

> >  	}
> >
> >  	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
> >
>
> --
> Regards,
>
> Laurent Pinchart

--khgtppfahw6u47d7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0DV7gACgkQcjQGjxah
Vjz5Jg//aFLz0tKq8wZCeVMJnKKzD7XcpXLs8B+mK1kVLNxct1Exnl2h4SIPmr1s
/49MgCXJkN5/Aljw/y0WqifR4S4QvT5jFvuC/hc3Q1ggY0ycGxEICHSXXNyooV/a
VpxHLQpgtadlRtUWpdxIYErbD/o8idWN39UWueI4zRkDSrfWAbjWjsH/86hrAq3R
FMmfTaKbzddFytvX1Lh4x3gcKoO/64AvDwZoT/IMrVpINFZRTKw2sT7T7HeUFbh7
f94rAsGPrX/z0u+xcYucQoUeXLG4XCx3Xy95yzYdmNmLxwy5SW44QF9IVWM+cR6z
PaSfwATFHDRp5Shaq+kXhdPUlVHQTldm7McKw128xswE3oeChu1mFUseZxzJx6pi
jUL8aHE4FEdZ1C1fy6F7eaSf6Kha4uklxea5Fdl5gl/uRf9RK+5sJC+T6BaKy2J9
/fA2xnKXYbxeZabLGkeDp2mHSLv8w7fnv/AxcuW1O4+omnWzCMN364J5oUvfIs61
aRRi3T5lb7zi16Jcy88yjXnQXOFqNDx9+noFaJ0wv1nUOv4bX4h7l/q+PDd37onE
fdfxdEd9TsypZaVifSssDMRl1tkLFAgSkTtX1QmeJlqLz9Nfpo9YFeE4xxpiARcc
Zh6mYjr2gpp7336mA1agpxJgiibvViHLPgh3gBFq9bVdcOza5Hw=
=G1Ty
-----END PGP SIGNATURE-----

--khgtppfahw6u47d7--

--===============1897153112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1897153112==--
