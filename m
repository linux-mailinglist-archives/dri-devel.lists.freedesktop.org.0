Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A46A6D7D0D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 14:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D952A10E939;
	Wed,  5 Apr 2023 12:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F09810E939
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 12:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1680699450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mq/p4txhSsRLR5xVgrA62YXfgD49tU+mOTycAeKgsHg=;
 b=Mb98f9ufodGaozAOY4xYrOH4ki7sxYY/vAA0bNDznfkO1jY7oQ7vUoy9gBV18sQyg7Fqkp
 4iw1OtIZgkWKHd7enKxNHs2560FyoXBFO6izP6fR7+5aCxwEgm0s0Qni1/6h8kIbFM1q0N
 AxvQ9vdC4gf6sPGfRYLz7iOkrkLShI8=
Message-ID: <1e0e8e9fe44c27e844e7e918a985704e58da2c27.camel@crapouillou.net>
Subject: Re: [PATCH v2 56/65] clk: ingenic: cgu: Switch to determine_rate
From: Paul Cercueil <paul@crapouillou.net>
To: Maxime Ripard <maxime@cerno.tech>, Aidan MacDonald
 <aidanmacdonald.0x0@gmail.com>
Date: Wed, 05 Apr 2023 14:57:26 +0200
In-Reply-To: <20230327192430.b2cp3yyrkzy4g4vw@penduick>
References: <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
 <20221104145946.orsyrhiqvypisl5j@houat>
 <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
 <20221107085417.xrsh6xy3ouwdkp4z@houat>
 <ucJ6KSBqdPTxfxUQqLUr9C9RGiQRnY1I@localhost>
 <20221109110045.j24vwkaq3s4yzoy3@houat>
 <06a293adc75990ed3e297b076fc38d8a.sboyd@kernel.org>
 <xpKMzGb1sOsucWMTlJIMzrT5KjLlZ7JP@localhost>
 <20230324111959.frjf4neopbs67ugd@houat>
 <rTJKpeLOBeu3eOLW5z3P5fEpcOJJLrGs@localhost>
 <20230327192430.b2cp3yyrkzy4g4vw@penduick>
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
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
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

Hi Maxime,

Le lundi 27 mars 2023 =C3=A0 21:24 +0200, Maxime Ripard a =C3=A9crit=C2=A0:
> On Fri, Mar 24, 2023 at 08:58:48PM +0000, Aidan MacDonald wrote:
> > > > My suggestion: add a per-clock bitmap to keep track of which
> > > > parents
> > > > are allowed. Any operation that would select a parent clock not
> > > > on the
> > > > whitelist should fail. Automatic reparenting should only select
> > > > from
> > > > clocks on the whitelist. And we need new DT bindings for
> > > > controlling
> > > > the whitelist, for example:
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0 clock-parents-0 =3D <&clk1>, <&pll_c>;
> > > > =C2=A0=C2=A0=C2=A0 clock-parents-1 =3D <&clk2>, <&pll_a>, <&pll_b>;
> > > >=20
> > > > This means that clk1 can only have pll_c as a parent, while
> > > > clk2 can
> > > > have pll_a or pll_b as parents. By default every clock will be
> > > > able
> > > > to use any parent, so a list is only needed if the machine
> > > > needs a
> > > > more restrictive policy.
> > > >=20
> > > > assigned-clock-parents should disable automatic reparenting,
> > > > but allow
> > > > explicit clk_set_parent(). This will allow clock drivers to
> > > > start doing
> > > > reparenting without breaking old DTs.
> > >=20
> > > I'm generally not a fan of putting all these policies in the
> > > device
> > > tree. Do you have an example where it wouldn't be possible to do
> > > exactly
> > > this from the driver itself?
> >=20
> > I'm confused. What's implicit in the example is clk1 and clk2 might
> > have *other* possible choices of parent clock and the device tree
> > is
> > limiting what the OS is allowed to choose.
> >=20
> > Why would you put such arbitrary limitations into the driver?
>=20
> Why would we put such arbitrary limitations in the firmware? As this
> entire thread can attest, people are already using the device tree to
> work around the limitations of the Linux driver, or reduce the
> features of Linux because they can rely on the device tree. Either
> way, it's linked to the state of the Linux driver, and any other OS
> or
> Linux version could very well implement something more dynamic.

Probably because if we have to choose between setting policy in the
kernel or in the firmware, it is arguably better to set it in the
firmware.

Especially when talking about clocks, as the firmware is already the
one programming the boot clocks.

Cheers,
-Paul

> > They would be different from machine to machine, unless the clock
> > tree is so simple there is only *one* meaningful way to configure
> > it.
>=20
> If we look at the device trees we have in-tree, most of the users of
> assigned-clocks are the same from one board to another.
>=20
> > Most SoCs are complicated enough that there will be tradeoffs
> > depending on what peripherals you are using (typically a single
> > machine will not use *every* peripheral device provided by the
> > SoC).
>=20
> We already have APIs to lock parents or rates on a given clock from
> the consumer. It's far superior (feature-wise) than what the device
> tree will ever offer because it's code, and it depends on the usage
> already since an unused driver won't probe.
>=20
> Maxime

