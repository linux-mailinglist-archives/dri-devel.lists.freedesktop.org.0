Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5670E9CB32
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 10:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F76D6E06D;
	Mon, 26 Aug 2019 08:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64906E06D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 08:01:30 +0000 (UTC)
X-Originating-IP: 87.18.63.98
Received: from uno.localdomain (unknown [87.18.63.98])
 (Authenticated sender: jacopo@jmondi.org)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E4E4A1BF209;
 Mon, 26 Aug 2019 08:01:19 +0000 (UTC)
Date: Mon, 26 Aug 2019 10:02:50 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 08/14] drm: rcar-du: Add support for CMM
Message-ID: <20190826080250.av3z2vunbd2z7hzu@uno.localdomain>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-9-jacopo+renesas@jmondi.org>
 <CAMuHMdUuWFGSTUcAR2aV6cg4hpfzMs5EQBJTNM+ym2k8Ht-bVA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUuWFGSTUcAR2aV6cg4hpfzMs5EQBJTNM+ym2k8Ht-bVA@mail.gmail.com>
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
Cc: muroya@ksk.co.jp, Ulrich Hecht <uli@fpond.eu>,
 Simon Horman <horms@verge.net.au>, VenkataRajesh.Kalakodima@in.bosch.com,
 David Airlie <airlied@linux.ie>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: multipart/mixed; boundary="===============1479060905=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1479060905==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sbblrgvskuirlqsw"
Content-Disposition: inline


--sbblrgvskuirlqsw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Geert,

On Mon, Aug 26, 2019 at 09:31:02AM +0200, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Sun, Aug 25, 2019 at 3:51 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > Add a driver for the R-Car Display Unit Color Correction Module.
> > In most of Gen3 SoCs, each DU output channel is provided with a CMM unit
> > to perform image enhancement and color correction.
> >
> > Add support for CMM through a driver that supports configuration of
> > the 1-dimensional LUT table. More advanced CMM feature will be
> > implemented on top of this basic one.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
>
> > +static const struct of_device_id rcar_cmm_of_table[] = {
> > +       { .compatible = "renesas,cmm-r8a7795", },
> > +       { .compatible = "renesas,cmm-r8a7796", },
> > +       { .compatible = "renesas,cmm-r8a77965", },
> > +       { .compatible = "renesas,cmm-r8a77990", },
> > +       { .compatible = "renesas,cmm-r8a77995", },
> > +       { .compatible = "renesas,rcar-gen3-cmm", },
>
> As they're all handled the same, you can drop the SoC-specific values
> from the driver's match table.
>
> > +       { .compatible = "renesas,rcar-gen2-cmm", },
>
> Just wondering: has this been tested on R-Car Gen2?
>

Not from me :(
It might not be the smartest move to add a compatible for an un-tested
chip generation. I dragged the gen2 compatible in along the series as
it was there in the downstream driver and I assumed BSP has been
tested there, but since I've not been able to run any test on Gen2
board I should probably drop it? Any volunteer with a Gen2 board that
want to run a test?

Thanks
  j

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

--sbblrgvskuirlqsw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1jkioACgkQcjQGjxah
Vjz2zA/9GA5pNTNrK1sLbSQr1l5T/m5J1t7HdVRkrl24WFP5Mpjzm1g/Du5cRFPQ
XtI6YoSrvzWADCbeDldUaIGCQ+1b+EQntwVU3dkkV50FrxiDuZ+4b2+Qco1lTT9W
5uuWRkc14jpDdIT5bFYB79V4yckKLy54rzRHVgB5uX+KzswQgs26SICnlgecA+9d
7Dy6Q0gMVfnxrNiCSVrrr637sXfdKaQUAHz+y+X4bJTgQsjcjKD+WU4pqmG4hLs/
CsY9+FErIXk9yB2EOX7hCP6k6KsX/BHHRGW4uHq/neunFZECfDyI48yC/9qCWtWk
JjZdAO+ZzPXFB1kjKeyfaunqa1oKhdR2C2traKN5E1i8EkRzTU1HB5CJElFDU5Xf
OLOKApejqaZKSza693g9cU2Gv0UVO1jJuie2kEnp+5MH9BY+sJFxE47qmmdGeIlZ
hIZ7X1A67eZD0z9FocQVpfBOLpztswaL3dNzOPw0azxdH4MgcTBoQYSFB/GVJLqS
Az3r2R1w/kIDaJhmWNFLuPSiFJNdL1Sqrd/SChrQYoYbXGqqFE3O7a1TS+5k1tE+
ecLmjUPerqRP29vehz8lgipCdirotVmR+kCfGotGMnC6mpcqfR1WyghGLcl/nItc
H78K5Xu8knqi0kV4ieP0PnIw60OC92IsceQBl3arkkrMkr/ukew=
=MgVV
-----END PGP SIGNATURE-----

--sbblrgvskuirlqsw--

--===============1479060905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1479060905==--
