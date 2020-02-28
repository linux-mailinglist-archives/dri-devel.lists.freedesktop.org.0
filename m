Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2065B174615
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 11:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4936E1D3;
	Sat, 29 Feb 2020 10:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB286E0F8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 19:57:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7F7DBAC58;
 Fri, 28 Feb 2020 19:57:17 +0000 (UTC)
Message-ID: <d19470274ef0dc8198fab35b039edb68a02f0358.camel@suse.de>
Subject: Re: [PATCH 07/89] clk: bcm: rpi: Allow the driver to be probed by DT
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 28 Feb 2020 20:57:13 +0100
In-Reply-To: <20200226150113.oqymkr6h2cxs2uia@gilmour.lan>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <c358081207dcf4f320a6b7e2932f0d5365bf3242.1582533919.git-series.maxime@cerno.tech>
 <71cd7b35af81ee91c3b4dc5e7c05760ecd590c5d.camel@suse.de>
 <20200226150113.oqymkr6h2cxs2uia@gilmour.lan>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 29 Feb 2020 10:13:17 +0000
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
 linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0188504089=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0188504089==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-1Cpbyod9TIcXBG/YDz/T"


--=-1Cpbyod9TIcXBG/YDz/T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Wed, 2020-02-26 at 16:01 +0100, Maxime Ripard wrote:

[...]

> This was actually a shameless bait to start that discussion, so I'm
> glad it worked ;)

:)

[...]

> > - Some of those fw managed clocks you're creating have their mmio
> > counterpart
> >   being registered by clk-bcm238. IMO either register one or the other,
> > giving
> >   precedence to the mmio counterpart. Note that for pllb, we deleted th=
e
> >   relevant code from clk-bcm2385.
>=20
> Indeed, and it's really that part of the discussion I wanted to
> start. For some reason, it looks like a good chunk of those clocks are
> non-functional at the moment (they all report 0).

Yes, although they should be alright. I think it's just a matter of passing=
 the
right flags to the clk framework (disable caching and so on), but never fou=
nd
the time to investigate further.

> If we're going to
> use the firmware clocks as I did here, we'd have to modify most of the
> device clocks used so far (UART, especially) to derive from the core
> clock. I wasn't really sure of the implications though, since it's my fir=
st
> experience with the RPi clock tree.

That's something I'm confused about. I played around with your code and the=
 HSM
clock changes seem to be completely unrelated to the VPU clock. Actually it
seems it's derived from 'plld_per' (here Florian can maybe contradict me). =
I
found out by feeding the mmio HSM clock to your driver, which actually seem=
ed
to work (albeit maybe just out of luck since the FW already set up everythi=
ng).

Bare in mind, we disable turbo mode upstream so as for the firmware not to
change the VPU frequencies on par with CPU changes (controlled by a special=
 bit
in the CPU clock mailbox property). So, if I'm not wrong, this simplifies
things. As we don't have to worry about re-clocking all peripherals with ev=
ery
resolution change.

This even opens up another question. Which clocks is the firmware interface
monitoring for DVFS? If it's just the VPU and CPU we could be over-complica=
ting
things here, and MMIO clks could be an option, isn't it?

On the subject of re-clocking, I had a word with the clk maintainers on how=
 to
properly implement it, see the two last paragraphs here if curious:
https://www.spinics.net/lists/linux-clk/msg36937.html

> > - The same way we were able to map the fw CPU clock into the clk tree
> >   (pllb/pllb_arm) there are no reasons we shouldn't be able to do the s=
ame
> > for
> >   the VPU clocks. It's way nicer and less opaque to users (this being a
> >   learning platform adds to the argument).
>=20
> This would make the Linux clock tree match the one in hardware, which
> would indeed be more readable to a beginner, but I see three main
> drawbacks with this:
>=20
>   - The parent / child relationship is already encoded in the firmware
>     discovery mechanism. It's not used yet by the driver, because the
>     firmware reports all of them as root clocks, but that's pretty
>     easy to fix.

Had a look at this, they all return root as their parent. Which is somewhat
true from the fw interface perspective (only leaves are represented), but n=
ot
too endearing.

>   - It would make the code far more complicated and confusing than it
>     could, especially to beginners. And as far as I know, only the RPi
>     is doing that, while pretty much all the other platforms either
>     have the clock tree entirely defined, or rely on the firmware, but
>     don't have an hybrid. So they would learn something that cannot
>     really be applied to anywhere else.

Fair enough. Still, for now, I think I prefer a hybrid clk tree approach.

>   - I have no idea what the clock tree is supposed to look like :)

I don't have access to the official clock tree either. The closest we have =
is
whatever the mmio clk driver exposes.

> > - On top of that, having a special case for the CPU clock registration =
is
> >   nasty. Lets settle for one solution and make everyone follow it.
>=20
> It seemed to me that the CPU clock had a factor between the actual CPU
> frequency and its clock? If not, then yeah we should definitely get
> rid of it.

Yes, IIRC, there is a factor because the CPU clock firmware interface actua=
lly
controls the underlying PLL frequency which is then divided by 2 before
reaching the CPU. Which kind of breaks the FW interface design if you ask
me (alongside this turbo mode thing).

> > - I don't see what's so bad about creating clock lookups. IIUC there ar=
e
> > only
> >   two clocks that need this special handling CPU & HDMI, It's manageabl=
e.
> > You
> >   don't even have to mess with the consumer driver, if there was ever t=
o be
> > a
> >   dt provided mmio option to this clock.
>=20
> V3D needs one too, and I might have missed a bunch of them in that
> series given how the current debugging of the remaining issues turn
> out to be.

Would be nice to see if V3D is also affected by DVFS, and the rest of clock=
s
for that matter.

> And clk_lookups are local to devices, so you need to factor that by the
> number of devices you have. Sure, it works, but it feels to me like that'=
s
> going to be an issue pretty fast, especially with the lookups on the way =
out?

I see your point, TBH I don't mind moving it into the device-tree if things=
 are
going to get nasty.


> > >  drivers/clk/bcm/clk-raspberrypi.c | 11 ++++++++---
> > >  1 file changed, 8 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-
> > > raspberrypi.c
> > > index 1654fd0eedc9..94870234824c 100644
> > > --- a/drivers/clk/bcm/clk-raspberrypi.c
> > > +++ b/drivers/clk/bcm/clk-raspberrypi.c
> > > @@ -255,15 +255,13 @@ static int raspberrypi_clk_probe(struct
> > > platform_device
> > > *pdev)
> > >  	struct raspberrypi_clk *rpi;
> > >  	int ret;
> > >=20
> > > -	firmware_node =3D of_find_compatible_node(NULL, NULL,
> > > -					"raspberrypi,bcm2835-firmware");
> > > +	firmware_node =3D of_parse_phandle(dev->of_node, "raspberrypi,firmw=
are",
> > > 0);
> >=20
> > There is no such phandle in the upstream device tree. Maybe this was ai=
med
> > at
> > the downstream dt?
>=20
> raspberrypi,firmware is the property, it points to the /soc/firmware
> node that is defined in bcm2835-rpi.dtsi

Yes, my bad. On that topic, I kind of like Robh's suggestion of making this
driver a child of the firmware node (see an example in
input/touchscreen/raspberrypi-ts.c).

Regards,
Nicolas


--=-1Cpbyod9TIcXBG/YDz/T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl5ZcJkACgkQlfZmHno8
x/7qkAgAnKf47HcMZjcr44eDMhGGEgNotW7Ypk7We9YIl6H3luwT8iFCQWn08AOs
cZAxa9p+UGEF4FOmETJxQNIkykv3W4wvIyjPk5jEe2SwvAX+kv9S8JpQkB9ynSdu
aLIBA8DwLwsr5BilidRIXNzm8sozE4jvpTtQU6wgqLkvShw5qvp4K2Gjon0TwPT3
mToCPqtHyto6DHT/Dc8TpsMxELqPNkl19E5812GOIIs9FAo0yx6hT2ukFMuMx37p
uHQBolswmSqnknHBzfjs+gin1FQXUKxgmc7rNkc1ctoYP2hHR+Lz2vV5bHVx7FQE
VVi2TUJ1wO4IpudaNWJbsfgKP/Su2g==
=dI+Q
-----END PGP SIGNATURE-----

--=-1Cpbyod9TIcXBG/YDz/T--


--===============0188504089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0188504089==--

