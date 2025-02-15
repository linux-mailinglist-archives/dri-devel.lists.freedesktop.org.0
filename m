Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5C0A36E39
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 13:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A71810E0F0;
	Sat, 15 Feb 2025 12:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TI7OwbBe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E2910E0F0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 12:50:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C8520A40362;
 Sat, 15 Feb 2025 12:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84BD0C4CEE9;
 Sat, 15 Feb 2025 12:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739623822;
 bh=drN/Xok8UudjMurUXacPKQ2++MI+GHNgJsb1gQKHxmw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TI7OwbBejVq+s0MNcjVR0OO68WWGeU3nLMSFjv/iooPZQkFgekvtYlJVZMHL4yhGu
 X+NvMH38mriKk1PDUcyHjwbzECOAXrRCBNn9U36VXx/c8m+LhK9r+9CyTE6RYI4i18
 r1pLW7R4TInPKnEeFX9WUG5PqtfWIPuLmmuUoi3E8A0A0/4ZupRtFx5ykSkJfxoWU1
 JSSIsK/AtdQvdtCF3n/UYl3JTA4Hs4cA70QyCuK0IzY+i8/ZvMd1HSVZ2fGkRVyFmc
 3KBpadsxw7ag6TDN+7Q0Rn0JRDwxVXa6Ic4DnHHR5HSm4OAwa2yr2Q1DySe1dJlh9Y
 F8vI+B2Os2Bpg==
Date: Sat, 15 Feb 2025 12:50:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Danilo Krummrich <dakr@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 2/7] reset: mpfs: use the auxiliary device creation
 helper
Message-ID: <20250215-scared-clothing-942f9bf3d039@spud>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-2-7edb50524909@baylibre.com>
 <20250213-crown-clustered-81c6434c892b@spud>
 <1jv7tczytk.fsf@starbuckisacylon.baylibre.com>
 <CAD=FV=VeSrZktEbxNXXTgD80QGTpW5b-WiXUFko+a8FUzmN+fQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2DqldZNjQ+dLYWFk"
Content-Disposition: inline
In-Reply-To: <CAD=FV=VeSrZktEbxNXXTgD80QGTpW5b-WiXUFko+a8FUzmN+fQ@mail.gmail.com>
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


--2DqldZNjQ+dLYWFk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 07:25:59AM -0800, Doug Anderson wrote:
> Hi,
>=20
> On Fri, Feb 14, 2025 at 12:59=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.=
com> wrote:
> >
> > > One think that's always felt a bit meh to me is this id number stuff,
> > > I just threw in 666 for meme value.
> >
> > :)
> >
> > > The whole thing seems super
> > > arbitrary, do any of the users of this helper actually put meaningful
> > > values into the id parameter?
> >
> > In example changes I've sent, no.
> >
> > In other simple usages (those using container_of()) of the auxiliary
> > bus, I think there are a few that uses 0 and 1 for 2 instances.
> >
> > I guess your question is "do we really need this parameter here ?"
> >
> > We could remove it and still address 90% of the original target.
> >
> > Keeping it leaves the door open in case the figure above does not hold
> > and it is pretty cheap to do. It could also enable drivers requiring an
> > IDA to use the helper, possibly.
>=20
> FWIW, once you resolve the conflicts in drm-misc with ti-sn65dsi86
> you'll need the ID value. ;-)
>=20
> There was a big-ol' discussion here:
>=20
> https://lore.kernel.org/r/8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.172918=
0470.git.geert+renesas@glider.be
>=20
> I eventually pushed v2 of the patch:
>=20
> https://lore.kernel.org/r/7a68a0e3f927e26edca6040067fb653eb06efb79.173384=
0089.git.geert+renesas@glider.be

Think it makes sense to have a "simplified" wrapper for the cases where
the id has no meaning then? Not really a fan of the drivers coming up with
magic numbers.

--2DqldZNjQ+dLYWFk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ7CNhAAKCRB4tDGHoIJi
0tAUAQCqnRPkOySGXu//3wT8OcQkfE+e51feUW6fi3X49on2qQD9FeMpjQKlnQ9Q
UjJ/Rxce6BMBO5o9ndbm21Ie8SKdSAY=
=owAZ
-----END PGP SIGNATURE-----

--2DqldZNjQ+dLYWFk--
