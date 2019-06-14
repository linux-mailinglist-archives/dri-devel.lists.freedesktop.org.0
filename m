Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0175A4589A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 11:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764D48944A;
	Fri, 14 Jun 2019 09:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEDE8944A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 09:26:40 +0000 (UTC)
X-Originating-IP: 37.177.88.254
Received: from uno.localdomain (unknown [37.177.88.254])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1B0CBC0019;
 Fri, 14 Jun 2019 09:26:34 +0000 (UTC)
Date: Fri, 14 Jun 2019 11:27:45 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
 VenkataRajesh.Kalakodima@in.bosch.com,
 Harsha.ManjulaMallikarjun@in.bosch.com,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 19/20] drm: rcar-du: crtc: Register GAMMA_LUT properties
Message-ID: <20190614092745.wznk3iv5dgehmjsb@uno.localdomain>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-20-jacopo+renesas@jmondi.org>
 <20190607120304.GH7593@pendragon.ideasonboard.com>
 <20190614081507.3ky4pcyijjxnr7mp@uno.localdomain>
 <20190614084251.GW23020@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20190614084251.GW23020@phenom.ffwll.local>
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
Content-Type: multipart/mixed; boundary="===============1690204451=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1690204451==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sj54nnncvdq22ppw"
Content-Disposition: inline


--sj54nnncvdq22ppw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Daniel,

On Fri, Jun 14, 2019 at 10:42:51AM +0200, Daniel Vetter wrote:
> On Fri, Jun 14, 2019 at 10:15:52AM +0200, Jacopo Mondi wrote:
> > Hi Laurent,
> >    thanks for review
> >
> > On Fri, Jun 07, 2019 at 03:03:04PM +0300, Laurent Pinchart wrote:
> > > Hi Jacopo,
> > >
> > > Thank you for the patch.
> > >
> > > On Thu, Jun 06, 2019 at 04:22:19PM +0200, Jacopo Mondi wrote:
> > > > Enable the GAMMA_LUT KMS property using the framework helpers to
> > > > register the proeprty and the associated gamma table size maximum size.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > ---
> > > >  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > > > index e6d3df37c827..c920fb5dba65 100644
> > > > --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > > > @@ -1207,6 +1207,9 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
> > > >  	    rcdu->cmms[swindex]) {
> > > >  		rcrtc->cmm = rcdu->cmms[swindex];
> > > >  		rgrp->cmms_mask |= BIT(hwindex % 2);
> > > > +
> > > > +		drm_mode_crtc_set_gamma_size(crtc, CMM_GAMMA_LUT_SIZE);
> > > > +		drm_crtc_enable_color_mgmt(crtc, 0, false, CMM_GAMMA_LUT_SIZE);
> > >
> > > This change looks good, but you also need to add support for legacy API.
> > > According to the function's documentation,
> > >
> > >  * Drivers should use drm_atomic_helper_legacy_gamma_set() to implement the
> > >  * legacy &drm_crtc_funcs.gamma_set callback.
> > >
> >
> > Drivers 'shuld' or drivers 'shall' ?
> > Isn't this required only to support the 'legacy APIs' ? Do we want that?
>
> You're calling drm_mode_crtc_set_gamma_size, which is only useful for the
> legacy ioctls. should here = assuming your hw supports something that
> legacy gamma ioctl can use. Feel free to patch up the docs.

Oh, I see. I should either leave the old API alone without calling
drm_mode_crtc_set_gamma_size(), or set the .gamma_set callback to
point to drm_atomic_helper_legacy_gamma_set(), which translates the
old gamma table interface to a blob property and attach it to a crtc
state which is then commited and applied through the atomic helpers.

So I would change the doc to prescribe that if the driver intends to
support the legacy SETGAMMA/GETGAMMA IOCTLs it should declare the
gamma table size with drm_mode_crtc_set_gamma_size() first, and set
the .gamma_set crtc callback to drm_atomic_helper_legacy_gamma_set(),
which translates the legacy interface to a GAMMA_LUT property blob
and commit it.

If that works, I'll make a small patch to the documentation in v2.

Thanks
  j


> -Daniel
>
> >
> > Thanks
> >    j
> >
> > > >  	}
> > > >
> > > >  	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
> > > >
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--sj54nnncvdq22ppw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0DaJEACgkQcjQGjxah
VjyZGw//cZKIgD3YBAnD/okoI7Ik01icCdrGdWWeIC9/Z0xJL8Dby8DaDoHJqfoS
A8QEj+V8gJKXy5NBC2OUScmMxIHV1bR05HrMd11+sVHlcGdt/g9c/A5BRVG8R0P9
V4SKMzy9foDWYr6weedp6+PKpV0rV3BoexzpEAU7Op6rd+foNuxSH9tKaabzWcfs
C+zK4ptII8U4eNZUf7bAuLojs8PdZFTwfMyTwdeztmUg9KvQIZvUTkPNdIOA41kj
R5joK3EOA5El7uKl/L9kJbRnpiNlJJoihNtc2bO8i7ApzX6hNods2nj0ackJTnlM
0/VUceYdSFCwAypt8fBAUBVy9HfG1MhQnEGW3rvlgm46yzHytSVo8Mz8vTFOYN+p
hQG8FE822naJpMITM4aAddW/LKkKUXKyYNkn9Fvf+8EjGgXMBgEauQ56WUlxXKrk
YpslnrXSzWJrmtGnshFgsnbM95zJ3TB9YtuVzVl++M5yAv8fMo2JC8Q8PROy/+S1
B5sltyBaoA9SZPJ7y88JoEZCsT20f+1UfXch4kkP32BIm54IlCF7vDe99/WTsfCQ
nqNBg1M5QZt4g3OLy/mVXMoZ/mZAV3XrSmXBSKjPaHr7l5Yz8n8eAeh7QzIJWc/C
cui0ZFX8PCPJOsI+wDPggV/Tc8/OuJ4qaMLAPvoIces8BA2M6I8=
=jBlM
-----END PGP SIGNATURE-----

--sj54nnncvdq22ppw--

--===============1690204451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1690204451==--
