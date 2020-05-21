Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE281DE068
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 08:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9BD6E984;
	Fri, 22 May 2020 06:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB886E918
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 09:13:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D9664AEAC;
 Thu, 21 May 2020 09:13:41 +0000 (UTC)
Message-ID: <8e5cfb2da29984dc655157b18ef0f34dd576fb21.camel@suse.de>
Subject: Re: [PATCH v2 20/91] clk: bcm: rpi: Discover the firmware clocks
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 21 May 2020 11:13:35 +0200
In-Reply-To: <20200515081914.lejcqqwezn3zwpft@gilmour.lan>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <1a25b4f079dcdc669d4b29d3658ef0b72be2651e.1587742492.git-series.maxime@cerno.tech>
 <c9a7e50f88022179ef913fc6dfd066ec44b27988.camel@suse.de>
 <20200515081914.lejcqqwezn3zwpft@gilmour.lan>
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 May 2020 06:56:06 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0089041762=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0089041762==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Z2brrfBcjslVzIscsWuS"


--=-Z2brrfBcjslVzIscsWuS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Fri, 2020-05-15 at 10:19 +0200, Maxime Ripard wrote:
> Hi Nicolas,
>=20
> On Mon, May 04, 2020 at 02:05:47PM +0200, Nicolas Saenz Julienne wrote:
> > Hi Maxime, as always, thanks for the series!
> > Some extra context, and comments below.
> >=20
> > On Fri, 2020-04-24 at 17:34 +0200, Maxime Ripard wrote:
> > > The RaspberryPi4 firmware actually exposes more clocks than are curre=
ntly
> > > handled by the driver and we will need to change some of them directl=
y
> > > based on the pixel rate for the display related clocks, or the load f=
or
> > > the
> > > GPU.
> > >=20
> > > This rate change can have a number of side-effects, including adjusti=
ng
> > > the
> > > various PLL voltages or the PLL parents. The firmware will also updat=
e
> > > those clocks by itself for example if the SoC runs too hot.
> >=20
> > To complete this:
> >=20
> > RPi4's firmware implements DVFS. Clock frequency and SoC voltage are
> > correlated, if you can determine all clocks are running below a maximum=
 then
> > it
> > should be safe to lower the voltage. Currently, firmware actively monit=
ors
> > arm,
> > core, h264, v3d, isp and hevc to determine what voltage can be reduced =
to,
> > and
> > if arm increases any of those clocks behind the firmware's back, when i=
t has
> > a
> > lowered voltage, a crash is highly likely.
> >=20
> > As pointed out to me by RPi foundation engineers hsm/pixel aren't curre=
ntly
> > being monitored, as driving a high resolution display also requires a h=
igh
> > core
> > clock, which already sets an acceptable min voltage threshold. But that
> > might
> > change if needed.
> >=20
> > Ultimately, from the DVFS, the safe way to change clocks from arm would=
 be
> > to
> > always use the firmware interface, which we're far from doing right now=
. On
> > the
> > other hand, AFAIK not all clocks have a firmware counterpart.
> >=20
> > Note that we could also have a word with the RPi foundation and see if
> > disabling DVFS is possible (AFAIK it's not an option right now). Althou=
gh I
> > personally prefer to support this upstream, aside from the obvious bene=
fits
> > to
> > battery powered use cases, not consuming power unnecessarily is always =
big
> > plus.
> >=20
> > > In order to make Linux play as nice as possible with those constraint=
s, it
> > > makes sense to rely on the firmware clocks as much as possible.
> >=20
> > As I comment above, not as simple as it seems. I suggest, for now, we o=
nly
> > register the clocks we're going to use and that are likely to be affect=
ed by
> > DVFS. hsm being a contender here.
> >=20
> > As we'd be settling on a hybrid solution here, which isn't ideal to say=
 the
> > least, I'd like to gather some opinions on whether pushing towards a fu=
lly
> > firmware based solution is something you'd like to see.
>=20
> Thanks for the summary above, I'll try to adjust that commit log to refle=
ct
> this. As for my opinion, I don't really think that an hybrid approach is
> practical, since that would leave us with weird interactions between the
> firmware (and possibly multiple versinos of it) and the linux driver, and=
 this
> would be pretty hard to maintain in the long run.
>=20
> That leaves us either the MMIO-based driver or the firmware-based one, an=
d
> here
> with what you said above, at the moment, the firmware based one is a clea=
r
> winner.

We're on the same page here :)

My remaining concern is the fact there isn't a firmware counterpart to ever=
y
clock used right now. But it's something we can work out in the future.

Regards,
Nicolas


--=-Z2brrfBcjslVzIscsWuS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl7GRj8ACgkQlfZmHno8
x/4MlggAsfI2netGKXQo2DPYuKoQrXmOvYiA7Nr5rN8c+4B05Qv+kpCf2DNFnHof
Z26RxWKypweAbv69gcLkx9zD2GdR/FEFppfg1kgNXBlQ77x2+75a+S2h5z9qria5
ilV9oZERoJoOyyk7UpejkWfTieOlIfoWqMFPvwi8RSOFBf9+iPbWaazGB9YdgFIZ
lwbIH/QBZAn7pvJQIdI+qSJRsCbR7sD3WlzDq9SP/tFHtkPlyi+2RMI06XlxFJyK
QQnQTVH4Dkc8GZYtx6Np9zwUynBulz2RJaa7tJnpsItMwf/+AimPeVsnrrJBsuWv
2rgmf2QJ06QX1OnXfiNY0ZdXH+XLkg==
=EKcD
-----END PGP SIGNATURE-----

--=-Z2brrfBcjslVzIscsWuS--


--===============0089041762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0089041762==--

