Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7550E6D81F8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 17:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF79A10E9F3;
	Wed,  5 Apr 2023 15:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC6B10E9F3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 15:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1680708591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mjb6j+bIXE7b8JKh7kXdb3mAp/fvDvyUInzyZqABl7c=;
 b=KkyZeRD8zRr9DUPi8E+yaAiJ6llkrkavOcg1hU9CiniByzzr5DJTX0SyfBAelvEuN8MeEv
 jL7uDqd+LBP5S8A6OuKPnyJCiz26onUF85KEMt1FysxEno2QjGawIYOL+G+P8JgGTbkscL
 0Btl6oFLBPglYsRqL+QJzG3n9bKa4SU=
Message-ID: <84dea45aa0a46f531d38369a31d08420dc43dfe3.camel@crapouillou.net>
Subject: Re: [PATCH v2 56/65] clk: ingenic: cgu: Switch to determine_rate
From: Paul Cercueil <paul@crapouillou.net>
To: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 05 Apr 2023 17:29:47 +0200
In-Reply-To: <g24dkwtsobslw6qdvs4vbcdmk2txrlrephm5zmlff2fusrxheo@mqxrprzctymk>
References: <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
 <20221107085417.xrsh6xy3ouwdkp4z@houat>
 <ucJ6KSBqdPTxfxUQqLUr9C9RGiQRnY1I@localhost>
 <20221109110045.j24vwkaq3s4yzoy3@houat>
 <06a293adc75990ed3e297b076fc38d8a.sboyd@kernel.org>
 <xpKMzGb1sOsucWMTlJIMzrT5KjLlZ7JP@localhost>
 <20230324111959.frjf4neopbs67ugd@houat>
 <rTJKpeLOBeu3eOLW5z3P5fEpcOJJLrGs@localhost>
 <20230327192430.b2cp3yyrkzy4g4vw@penduick>
 <1e0e8e9fe44c27e844e7e918a985704e58da2c27.camel@crapouillou.net>
 <g24dkwtsobslw6qdvs4vbcdmk2txrlrephm5zmlff2fusrxheo@mqxrprzctymk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Max Filippov <jcmvbkbc@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Abel Vesa <abelvesa@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-mips@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-sunxi@lists.linux.dev,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <david@lechnology.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mercredi 05 avril 2023 =C3=A0 16:50 +0200, Maxime Ripard a =C3=A9crit=C2=
=A0:
> On Wed, Apr 05, 2023 at 02:57:26PM +0200, Paul Cercueil wrote:
> > Le lundi 27 mars 2023 =C3=A0 21:24 +0200, Maxime Ripard a =C3=A9crit=C2=
=A0:
> > > On Fri, Mar 24, 2023 at 08:58:48PM +0000, Aidan MacDonald wrote:
> > > > > > My suggestion: add a per-clock bitmap to keep track of
> > > > > > which
> > > > > > parents
> > > > > > are allowed. Any operation that would select a parent clock
> > > > > > not
> > > > > > on the
> > > > > > whitelist should fail. Automatic reparenting should only
> > > > > > select
> > > > > > from
> > > > > > clocks on the whitelist. And we need new DT bindings for
> > > > > > controlling
> > > > > > the whitelist, for example:
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0 clock-parents-0 =3D <&clk1>, <&pll_c>;
> > > > > > =C2=A0=C2=A0=C2=A0 clock-parents-1 =3D <&clk2>, <&pll_a>, <&pll=
_b>;
> > > > > >=20
> > > > > > This means that clk1 can only have pll_c as a parent, while
> > > > > > clk2 can
> > > > > > have pll_a or pll_b as parents. By default every clock will
> > > > > > be
> > > > > > able
> > > > > > to use any parent, so a list is only needed if the machine
> > > > > > needs a
> > > > > > more restrictive policy.
> > > > > >=20
> > > > > > assigned-clock-parents should disable automatic
> > > > > > reparenting,
> > > > > > but allow
> > > > > > explicit clk_set_parent(). This will allow clock drivers to
> > > > > > start doing
> > > > > > reparenting without breaking old DTs.
> > > > >=20
> > > > > I'm generally not a fan of putting all these policies in the
> > > > > device
> > > > > tree. Do you have an example where it wouldn't be possible to
> > > > > do
> > > > > exactly
> > > > > this from the driver itself?
> > > >=20
> > > > I'm confused. What's implicit in the example is clk1 and clk2
> > > > might
> > > > have *other* possible choices of parent clock and the device
> > > > tree
> > > > is
> > > > limiting what the OS is allowed to choose.
> > > >=20
> > > > Why would you put such arbitrary limitations into the driver?
> > >=20
> > > Why would we put such arbitrary limitations in the firmware? As
> > > this
> > > entire thread can attest, people are already using the device
> > > tree to
> > > work around the limitations of the Linux driver, or reduce the
> > > features of Linux because they can rely on the device tree.
> > > Either
> > > way, it's linked to the state of the Linux driver, and any other
> > > OS
> > > or
> > > Linux version could very well implement something more dynamic.
> >=20
> > Probably because if we have to choose between setting policy in the
> > kernel or in the firmware, it is arguably better to set it in the
> > firmware.
>=20
> I have a very different view on this I guess. Firmware is (most of
> the
> time) hard to update, and the policy depend on the state of support
> of a
> given OS so it's likely to evolve. The kernel is the best place to me
> to
> put that kind of policy. Why do you think differently?

Because the clocks configuration can be board-specific. And you don't
really want board-specific stuff in the driver.

If we take the Ingenic JZ4770 SoC as example, on one board we parent
everything we can to the PLL1 clock and set it to 432 MHz (the least
common multiple). Then the PLL0 (which drives the DDR and CPU clocks)
can be updated to overclock/underclock the CPU and RAM.

So should that be hardcoded in the driver? Well, for a different board,
for which overclock is not really needed, it's better to parent
everything to PLL0 so that PLL1 can be shut down to save power. So what
policy should be hardcoded in the driver?

>=20
> > Especially when talking about clocks, as the firmware is already
> > the
> > one programming the boot clocks.
>=20
> I'm not sure what your point is there. I don't think I ever saw a
> firmware getting the clocks right for every possible scenario on a
> given
> platform. And if it was indeed the case, then we wouldn't even a
> kernel
> driver.

My point is that there is already policy in how the firmware sets up
the hardware; and most often than not, the kernel driver won't change
that (e.g. you're probably not going to touch the DDR clock). It's
better to have all policy in the firmware then, instead of having some
in the firmware, and some in the kernel driver.

Cheers,
-Paul
