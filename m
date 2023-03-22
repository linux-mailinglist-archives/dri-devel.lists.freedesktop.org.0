Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E4C6C5AAE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 00:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A99710E41D;
	Wed, 22 Mar 2023 23:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A0310E41D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 23:41:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2981EB81EA0;
 Wed, 22 Mar 2023 23:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1FBC433D2;
 Wed, 22 Mar 2023 23:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679528502;
 bh=AHU0pIED4pdCTNu/Ki2of6GAWy9IUUsw6t/t0Hez+4c=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=qhMrUZAm8XEQhH+BGl6x55Y1Wd0UlbZIqAiPPr++LjM278cFuBNvP6Rpo9lXFGyqL
 uJ6LWk0ZldLVQTkF8EhEtux9mFcIydmVdkkNiB3jsxskjV3J9TxBW+ZWw4AhchZNSS
 M2Mt12jWyLTObCnbEMQVSwcWlQybSHgVqcVm1SCLrDBy1nq0jsAccne6avkIMyuXjA
 +Iylb5tPBf/uEkEjMeRO2JSySC6AvvEaLfkavbQkcL5CdgNLbCm1zo3rBXpbY0HuQl
 /qS04gYV5Ay5BvMbb9UUtlZdBQgsaPJetgh8R5A/sgXgF8t56P/kwN5ccnXw8HrEPJ
 TB1oQwtO3fAag==
Message-ID: <06a293adc75990ed3e297b076fc38d8a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221109110045.j24vwkaq3s4yzoy3@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-56-f6736dec138e@cerno.tech>
 <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
 <20221104145946.orsyrhiqvypisl5j@houat>
 <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
 <20221107085417.xrsh6xy3ouwdkp4z@houat>
 <ucJ6KSBqdPTxfxUQqLUr9C9RGiQRnY1I@localhost>
 <20221109110045.j24vwkaq3s4yzoy3@houat>
Subject: Re: [PATCH v2 56/65] clk: ingenic: cgu: Switch to determine_rate
From: Stephen Boyd <sboyd@kernel.org>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>
Date: Wed, 22 Mar 2023 16:41:40 -0700
User-Agent: alot/0.10
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
Cc: , Ulf Hansson <ulf.hansson@linaro.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Sekhar Nori <nsekhar@ti.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
	Paul Cercueil <paul@crapouillou.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Samuel Holland <samuel@sholland.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Takashi Iwai <tiwai@suse.com>,
	linux-tegra@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
	linux-mips@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-clk@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	alsa-devel@alsa-project.org, Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-actions@lists.infradead.org,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
	".com"@freedesktop.org, Baolin Wang <baolin.wang@linux.alibaba.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	nel.org@freedesktop.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Alessandro Zummo <a.zummo@towertech.it>, linux-sunxi@lists.linux.dev,
	patches@opensource.cirrus.com,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-renesas-soc@vger.ker, David Lechner <david@lechnology.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	linux-rtc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2022-11-09 03:00:45)
> On Mon, Nov 07, 2022 at 08:57:22PM +0000, Aidan MacDonald wrote:
> >=20
> > Maxime Ripard <maxime@cerno.tech> writes:
> >=20
> > > Hi,
> > >
> > > On Fri, Nov 04, 2022 at 05:35:29PM +0000, Aidan MacDonald wrote:
> >=20
> > Assigning the parent clock in the DT works once, at boot, but going off
> > what you wrote in the commit message, if the clock driver has a
> > .determine_rate() implementation that *can* reparent clocks then it
> > probably *will* reparent them, and the DT assignment will be lost.
>=20
> Yes, indeed, but assigned-clock-parents never provided any sort of
> guarantee on whether or not the clock was allowed to reparent or not.
> It's just a one-off thing, right before probe, and a clk_set_parent()
> call at probe will override that just fine.
>=20
> Just like assigned-clock-rates isn't permanent.
>=20
> > What I'm suggesting is a runtime constraint that the clock subsystem
> > would enforce, and actively prevent drivers from changing the parent.
> > Either explicitly with clk_set_parent() or due to .determine_rate().
> >=20
> > That way you could write a .determine_rate() implementation that *can*
> > select a better parent, but if the DT applies a constraint to fix the
> > clock to a particular parent, the clock subsystem will force that parent
> > to be used so you can be sure the clock is never reparented by accident.
>=20
> Yeah, that sounds like a good idea, and CLK_SET_RATE_NO_REPARENT isn't
> too far off from this, it's just ignored by clk_set_parent() for now. I
> guess we could rename CLK_SET_RATE_NO_REPARENT to CLK_NO_REPARENT, make
> clk_set_parent handle it, and set that flag whenever
> assigned-clock-parents is set on a clock.
>=20
> It's out of scope for this series though, and I certainly don't want to
> deal with all the regressions it might create :)
>=20

This sounds like a new dt binding that says the assigned parent should
never change. It sounds sort of like gpio hogs. A clock-hogs binding?
