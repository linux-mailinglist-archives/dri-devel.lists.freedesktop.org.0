Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144C173217B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 23:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E1210E1A3;
	Thu, 15 Jun 2023 21:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 29217 seconds by postgrey-1.36 at gabe;
 Thu, 15 Jun 2023 21:19:30 UTC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696FD10E1A3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 21:19:30 +0000 (UTC)
X-GND-Sasl: cyril@debamax.com
X-GND-Sasl: cyril@debamax.com
X-GND-Sasl: cyril@debamax.com
X-GND-Sasl: cyril@debamax.com
X-GND-Sasl: cyril@debamax.com
X-GND-Sasl: cyril@debamax.com
X-GND-Sasl: cyril@debamax.com
X-GND-Sasl: cyril@debamax.com
X-GND-Sasl: cyril@debamax.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 653F160009;
 Thu, 15 Jun 2023 21:19:25 +0000 (UTC)
Date: Thu, 15 Jun 2023 23:19:24 +0200
From: Cyril Brulebois <cyril@debamax.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] fbdev/offb: Update expected device name
Message-ID: <20230615211924.cf2qs52cfaf7m3f7@debamax.com>
Organization: DEBAMAX
References: <20230412095509.2196162-1-cyril@debamax.com>
 <20230412095509.2196162-2-cyril@debamax.com>
 <ZDvrY7X9mpJ7WZ3z@eldamar.lan>
 <11b342dc-1a46-d1be-5fdd-c6eee661e15a@leemhuis.info>
 <fe3b90b0-b52f-9677-0245-a201975c3e0c@suse.de>
 <20230615132107.GA9196@kitsune.suse.cz>
 <20230615200901.GA1572644-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zpftdcurb5ffwnvh"
Content-Disposition: inline
In-Reply-To: <20230615200901.GA1572644-robh@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
 Salvatore Bonaccorso <carnil@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zpftdcurb5ffwnvh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Rob Herring <robh@kernel.org> (2023-06-15):
> On Thu, Jun 15, 2023 at 03:21:07PM +0200, Michal Such=C3=A1nek wrote:
> > At the time this was proposed it was said that "of-display", is wrong,
> > and that "of-display.0" must be used for the first device instead, and
> > if something breaks an alias can be provided.
> >=20
> > So how does one provide an alias so that offb can find "of-display.0"
> > as "of-display"?
>=20
> I'm not aware of any way. There isn't because device names and paths are=
=20
> not considered ABI. There are mechanisms for getting stable class device=
=20
> indices (e.g. i2c0, mmcblk0, fb0, fb1, etc.) though not implemented for=
=20
> fbN (and please don't add it).=20
>=20
> In any case, this should be an easy fix. Though if "linux,opened" or=20
> "linux,boot-display" is not set, then you'd still get "of-display.0":
>=20
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 78ae84187449..e46482cef9c7 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -553,7 +553,7 @@ static int __init of_platform_default_populate_init(v=
oid)
>                         if (!of_get_property(node, "linux,opened", NULL) =
||
>                             !of_get_property(node, "linux,boot-display", =
NULL))
>                                 continue;
> -                       dev =3D of_platform_device_create(node, "of-displ=
ay.0", NULL);
> +                       dev =3D of_platform_device_create(node, "of-displ=
ay", NULL);
>                         of_node_put(node);
>                         if (WARN_ON(!dev))
>                                 return -ENOMEM;

I've just replaced my clueless workaround with this patch on top of the
kernel found in Debian 12 (Bookworm), i.e. 6.1.27 at this point, and it
indeed fixes the black screen problem in the installer's context.

I didn't run a full installation to check whether this kernel is also fine
after rebooting into the installed system, but as far as I understood for
the original bug report[1], it wasn't affected in the first place.

 1. https://bugs.debian.org/1033058

Will somebody else pick up the torch from here, and submit that for
inclusion in master? Or should I re-submit the above patch on my own?

I see my Debian colleagues have already pushed an updated v6.4-rc6 in
experimental, so it should be rather easy to combine checking latest
master with the distribution's packaging. Once that's done, I'm quite
familiar with building an updated installer image on top of it=E2=80=A6


Thanks,
--=20
Cyril Brulebois -- Debian Consultant @ DEBAMAX -- https://debamax.com/

--zpftdcurb5ffwnvh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEHoutkuoaze1Qayc7lZpsmSeGm2EFAmSLgE4ACgkQlZpsmSeG
m2HGdxAAjx/OIUvMJXqRQbNU18DH4aIs8GtXVP74rC39FpYhMiT25ZtEpk2fwGaL
VaCspAGK1CqN5usg4hD1x8mN7zhROE6gd9fwd5a+wxhDsCWyF3BdpwKrlVpGTjFz
3hCukzRW42ERph5rC93ffpP8xCmwHBMOl8wEXhhHcMoC92LIQt2W8YxK5dK6CdHD
pVNDjluHpsRoOKg8ljJG2PpqSyrYv1gVyNrA2fdmR7cfgxCdHdwqyG0YqXKP5gBM
V642y/YhM1Ds0LuCVtvZi6eU+lqXhEQIr/PFN+2gfvS6q768utWAuvPHHONuF+gU
bzee336Skny9W6B2mUngreLm/JwXBuroaSDEcH1r0fKCOztSs7ii21psBfDp+6ji
fhZfLja0Dm3JMmKrL0T6cF/a5q+ZbStutmiZZu9nQ31xHTs6jky89ZDbN5kWIoXT
ahYfEwy4br3uLu0ddrWSnBsEzZFCBsZjaMuWOnAP1iIADEkxyGeG1HyAmG2Bm6u/
CjpoyKfzt/lSL0wdbJEhhJv5r/sGndmznMfcflveIlAtoqwGef13O2phfanXdS9u
4PkBkzt3IdBKM7rocmH+eo8SNBmaVnjq5tfRgiLfp4HKvv4QRzBPSippVn53CjKX
NlH9CNA9MVJL3YZzJ+f9W1JHG/hz1zugKsKJQMCJXpz7VJ6Y6cI=
=6dGw
-----END PGP SIGNATURE-----

--zpftdcurb5ffwnvh--
