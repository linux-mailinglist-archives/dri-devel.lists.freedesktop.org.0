Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C204AF152A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 14:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA6D10E294;
	Wed,  2 Jul 2025 12:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31E210E294
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 12:16:04 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id 18B0A1F00053
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 12:15:54 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id A127CAC9A6B; Wed,  2 Jul 2025 12:15:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
 autolearn=disabled version=4.0.0
Received: from collins (unknown [192.168.1.1])
 by laika.paulk.fr (Postfix) with ESMTPSA id B1D2AAC9A5F;
 Wed,  2 Jul 2025 12:15:48 +0000 (UTC)
Date: Wed, 2 Jul 2025 14:15:46 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.xyz>,
 Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 5/5] drm/sun4i: Run the mixer clock at 297 MHz on V3s
Message-ID: <aGUi8ot1-0WaReyp@collins>
References: <20250701201124.812882-1-paulk@sys-base.io>
 <20250701201124.812882-6-paulk@sys-base.io>
 <20250702-psychedelic-stalwart-jerboa-a626eb@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VVuCxM2QjPKpSc9g"
Content-Disposition: inline
In-Reply-To: <20250702-psychedelic-stalwart-jerboa-a626eb@houat>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--VVuCxM2QjPKpSc9g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

Le Wed 02 Jul 25, 13:36, Maxime Ripard a =C3=A9crit :
> On Tue, Jul 01, 2025 at 10:11:24PM +0200, Paul Kocialkowski wrote:
> > The DE mixer clock is currently set to run at 150 MHz, while the
> > Allwinner BSP configures it at 300 MHz and other platforms typically
> > run at 297 MHz.
> >=20
> > 150 MHz appears to be enough given the restricted graphics capabilities
> > of the SoC (with a work area of only 1024x1024). However it typically
> > causes the DE clock to be parented to the periph0 pll instead of the
> > video PLL.
> >=20
> > While this should generally not be a concern, it appears (based on
> > experimentation) that both the DE and TCON clocks need to be parented
> > to the same PLL for these units to work. While we cannot represent this
> > constraint in the clock driver, it appears that the TCON clock will
> > often get parented to the video pll (typically running at 297 MHz for
> > the CSI units needs), for instance when driving displays with a 33 MHz
> > pixel clock (33 being a natural divider of 297).
> >=20
> > Running the DE clock at 297 MHz will typically result in parenting to
> > the video pll instead of the periph0 pll, thus making the display
> > output functional.
> >=20
> > This is all a bit fragile but it solves the issue with displays running
> > at 33 Mhz and brings V3s to use the same frequency as other platforms,
> > making support more unified.
>=20
> It's beyond fragile, and doesn't have anything to do with the DRM driver.
>=20
> You should set up the clock tree properly in the clock driver, and then
> add NO_REPARENT to the DE clock to make sure it stays that way.

Thanks for the suggestion! I wasn't aware there was a flag to avoid
reparenting, sounds like the most reasonable way to solve this issue then.

I'll send another iteration reworking the clock tree then.

> And then, you can change the clock rate if you want to, but at least you
> don't set a rate and hope that the side effects work your way, and won't
> happen again.

We might as well still change it. To be honest I don't really see why it was
set to 150 MHz in the first place.

Cheers,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--VVuCxM2QjPKpSc9g
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhlIvIACgkQhP3B6o/u
lQyH5w/+JIxMLNpE+lve3HbxC4wqX2HIz1pGfWw1ZFhfrKgJmKhN4IiqfmZpGnPe
mC+U8F1T4hnqbmEc57eIo6Q1C3hEncq7EyY3oN0TJj7N5MM81Z/eVP1JUZ7XHq3V
q4Xy9b8/Zm5gDakbUe8ZZD4mLaugMafHA0lQK7OmKd75MeqP+OV68OPpuXCTCQnA
pVL7vDw19P0paH9sIUOe0NQ0SWYbFYZExVsOxoQnfT1BHz6ltM4bCyTdRNKDcakp
j56Yd0hPMnlV0khThy0+3tDenkUjPgiznqTzC6pWzhtysXvT4XRQOWQGXaN9C/w5
BrPbm79yFJ4UOZE0YBIcQNEvpNLP/7ApnMstKs2B4PlU1B6zJeYRWuPWmj7ZJIiO
H4ckfdJN0+KMtWsm/qOGQ95PgfE2ZjZX17NRq742azRJ/i+YvdjLQQS/BkflehU6
PUKcSgVecGQU8FXeU3da6ZMViNjy8xalVFceDaoLOMMruRA7dY1hJnRhawQIGJd1
1soYIRsyZq3y9F+Ij05BxC8TVp5rarfwlwDGdA/53ghGd0/uTikAMzsxpY+HKlCi
z+JXYN6BqGkUQ7YnqtRU0NoDcKwDWjiinOGaypzT9ULFaPhglmUkHfofqP7R1S7w
NCbV9amc9uAOOaFNSLb+zIYpYIPr0UPaQ8xCkwJJ1cPHGTUPQgQ=
=z/Ou
-----END PGP SIGNATURE-----

--VVuCxM2QjPKpSc9g--
