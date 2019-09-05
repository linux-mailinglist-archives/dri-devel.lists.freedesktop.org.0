Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C658AA406
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 15:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11996E0C2;
	Thu,  5 Sep 2019 13:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D476E082
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 13:13:28 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 9B3B7C0006;
 Thu,  5 Sep 2019 13:13:19 +0000 (UTC)
Date: Thu, 5 Sep 2019 15:14:53 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 08/14] drm: rcar-du: Add support for CMM
Message-ID: <20190905131453.7ortosddn4afxd5j@uno.localdomain>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-9-jacopo+renesas@jmondi.org>
 <20190827002422.GQ5031@pendragon.ideasonboard.com>
 <20190827145619.33s7gkv7tgtsr6nz@uno.localdomain>
 <20190827163423.GB5054@pendragon.ideasonboard.com>
 <20190905095757.gg6s5pse5tvivxbs@uno.localdomain>
 <20190905111712.GG5035@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20190905111712.GG5035@pendragon.ideasonboard.com>
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
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: multipart/mixed; boundary="===============1244729335=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1244729335==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iuoqgpboxu2vm3n7"
Content-Disposition: inline


--iuoqgpboxu2vm3n7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Thu, Sep 05, 2019 at 02:17:12PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> > >>>> +/**
> > >>>> + * rcar_cmm_enable() - enable the CMM unit
> > >>>> + *
> > >>>> + * @pdev: The platform device associated with the CMM instance
> > >>>> + *
> > >>>> + * Enable the CMM unit by enabling the parent clock and enabling =
the CMM
> > >>>> + * components, such as 1-D LUT, if requested.
> > >>>> + */
> > >>>> +int rcar_cmm_enable(struct platform_device *pdev)
> > >>>> +{
> > >>>> +	struct rcar_cmm *rcmm =3D platform_get_drvdata(pdev);
> > >>>> +	int ret;
> > >>>> +
> > >>>> +	if (!rcmm)
> > >>>> +		return -EPROBE_DEFER;
> > >>>
> > >>> This function is called in rcar_du_crtc_atomic_enable(), so that's =
not
> > >>> the right error code. It seems we need another function for the CMM=
 API
> > >>> to defer probing :-/ I would call it rcar_cmm_init(). This check wo=
uld
> > >>> then be removed.
> > >>
> > >> I agree about the return code, but not the name, as this function
> > >> actually enables the CMM.
> > >
> > > I meant creating a new rcar_cmm_init() function that would just have =
the
> > > !rcmm check.
> > >
> > >> PROBE_DEFER does not make any sense here, I
> > >> wonder where it come from, as the probing of CMM and DU has long
> > >> happened once we get here (at least, I assume so, if we receive a
> > >> gamma_table, userspace has already been running, and both DU and CMM
> > >> should have probed. Otherwise, we can exploit the newly created devi=
ce
> > >> link, and make sure DU probes after the CMM).
> > >>
> > >> I would just change the return value here, and possibly use the devi=
ce
> > >> link to ensure the correct probing sequence.
> > >
> > > How does device link help here ?
> >
> > Currently it doesn't, as we are creating a stateless link.
> >
> > But if we go for a managed device link (which is the default, by the
> > way, you have to opt-out from it) we can guarantee the CMM has probed
> > before the DU probes, so that we have a guarantee when we get here
> > !rcmm cannot happen.
> >
> > https://www.kernel.org/doc/html/v5.2-rc7/driver-api/device_link.html
> > "The consumer devices are not probed before the supplier is bound to a =
driver,
> >  and they=E2=80=99re unbound before the supplier is unbound."
> >
> > As we create the link, the CMM is the supplier of DU, so we could just
> > drop the DL_FLAG_STATELESS flag in device_link_add() in 10/14.
> >
> > Does this match your understanding ?
>
> Except there's a bit of a chicken and egg issue, as you call
> device_link_add() from rcar_du_cmm_init(), which thus require the DU
> driver to probe first :-) For this to work we would probably need an
> early initcall in the DU driver.
>

Yes indeed, the point where the link is created at the moment is too
late... Is it worth an early initcall, or should we just assume that
at the point where the LUT is operated userspace has already been
running and both the CMM and the DU have probed already?

--iuoqgpboxu2vm3n7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1xCk0ACgkQcjQGjxah
Vjy4WhAAs0hFWf0KGDxzpxaW2Is+PYr+7r9FJJCvIRLtHJrvMMa7ZiUHu6snKcwi
c1af164xRrIBq9jUAnWlDfDACdyVgZIAZm1sKTXF8Y7lulTX8prColnNv9PbJkSf
GFPk2NS60LnPYPDLxa5YnD/wCEluH6zZP0Iec0F60xCs288jmWasZUk1GE/nt6en
tYOPmEtnGL74VYbqVzx9cYXQ/x/NEwpVRvTGTb5Z8JAWw0fiKoJcbWVNklfy++VE
up2vaz4OSOJ5LT+KPIGqXW0FrTPHYVyu6FYHrxDzM+/IKmXWtWCNq4iRypltPd5R
iixHQkqBq/G8aedqIzJbpeVFW/v2LowO/HlDwo2LmLmXkaJeBfX4V7/HK8dGNCjc
XCnefTL1pFgJ0kP+pO8rybOtt74T/gcjcU3Yxj0EcOUXauzUiFYyKyt0pgyhfJxl
8AYzAfmLAdQDawPntPIZ011LYVa5oF27Wek05zw3oWRC98VtJMro5CxX8vebKFrA
gtqfZB2pz6MzO8IbNeAPr+LLcSjgHhSe13JlO9iAxJ0bDYHtnT9TEKxu49LagXnN
xsKlzgRajJCcJEf5ldjFu0Ew9UM+BoiLuR7AKMiFdxCpCGlsBiUSGMWgEAtfbs4e
TQ8x0CruiKbwXTirVnSU/mlf6+oh3fJ4CPB1+AhH7Mjjn4L5kXE=
=ww4d
-----END PGP SIGNATURE-----

--iuoqgpboxu2vm3n7--

--===============1244729335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1244729335==--
