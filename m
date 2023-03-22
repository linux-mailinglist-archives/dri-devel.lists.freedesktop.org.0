Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C656C5A61
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 00:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A2010E2BF;
	Wed, 22 Mar 2023 23:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27EF10E2BF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 23:31:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 87DAAB81E94;
 Wed, 22 Mar 2023 23:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B207C433EF;
 Wed, 22 Mar 2023 23:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679527867;
 bh=xaxJcW60Zwm6f9XPRDjOw9G3g9bY4jCl5plhR8QQllk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=XxL+a663rdYJkDC0EvA0wRWxQU8y8/wWyIMLeyVQpd56JOh3PJ4xG6Xmen7aCsY0x
 7e3+3wtdF5cWlnmjzCRbTiOZhXLKETe/N5ieLkfIJ0mqWcfMYF9JT3L0KV10igMyNC
 HY349TuBWnVBR9NllNibpe2C+ERSVILvH8HzPnK07mFfLk4J9+/8dv0UiQMhzWHloR
 +xjBBKkeesHxI/3mJ4WsYkOpZtDhTsAKnz2w07QHOc6gUXQ8yTDYiB8QxhmBHWA6j0
 5+G+v0OLs2kTWq+w5AKi1yVkG5GaJd11PliF38D+NgM7H6u8noC2UbLXnzJAmwusQa
 GUT4P28HQzXrA==
Message-ID: <5819b1362f35ce306e1b6d566bfd44e5.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221107152603.57qimyzkinhifx5p@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-43-f6736dec138e@cerno.tech>
 <Y2UzdYyjgahJsbHg@sirena.org.uk> <20221104155123.qomguvthehnogkdd@houat>
 <Y2U2+ePwRieYkNjv@sirena.org.uk> <20221107084322.gk4j75r52zo5k7xk@houat>
 <Y2j0r0wX1XtQBvqO@sirena.org.uk> <20221107152603.57qimyzkinhifx5p@houat>
Subject: Re: [PATCH v2 43/65] ASoC: tlv320aic32x4: Add a determine_rate hook
From: Stephen Boyd <sboyd@kernel.org>
To: Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>
Date: Wed, 22 Mar 2023 16:31:04 -0700
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
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	alsa-devel@alsa-project.org, Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-clk@vger.kernel.org,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-mediatek@lists.infradead.org, ".com"@freedesktop.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, linux-actions@lists.infr,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessandro Zummo <a.zummo@towertech.it>, linux-sunxi@lists.linux.dev,
	adead.org@freedesktop.org, patches@opensource.cirrus.com,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>,
	linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	David Lechner <david@lechnology.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	linux-rtc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2022-11-07 07:26:03)
> On Mon, Nov 07, 2022 at 12:06:07PM +0000, Mark Brown wrote:
> > On Mon, Nov 07, 2022 at 09:43:22AM +0100, Maxime Ripard wrote:
> > > On Fri, Nov 04, 2022 at 03:59:53PM +0000, Mark Brown wrote:
> >=20
> > > > Well, hopefully everyone for whom it's an issue currently will be
> > > > objecting to this version of the change anyway so we'll either know
> > > > where to set the flag or we'll get the whack-a-mole with the series
> > > > being merged?
> >=20
> > > I'm sorry, I'm not sure what you mean here. The only issue to fix at =
the
> > > moment is that determine_rate and set_parent aren't coupled, and it l=
ed
> > > to issues due to oversight.
> >=20
> > > I initially added a warning but Stephen wanted to fix all users in th=
at
> > > case and make that an error instead.
> >=20
> > My suggestion is that instead of doing either of these things it'd be
> > quicker and less error prone to just fix the core to provide the default
> > implementation if nothing more specific is provided.  Any issues that
> > causes would already be present with your current series.
> >=20
> > > If I filled __clk_mux_determine_rate into clocks that weren't using it
> > > before, I would change their behavior. With that flag set, on all use=
rs
> > > I add __clk_mux_determine_rate to, the behavior is the same than what=
 we
> > > previously had, so the risk of regressions is minimal, and everything
> > > should keep going like it was?
> >=20
> > The series does fill in __clk_mux_determine_rate for everything though -
> > if it was just assumed by default the only thing that'd be needed would
> > be adding the flag.
>=20
> The behavior assumed by default was equivalent to
> __clk_mux_determine_rate + CLK_SET_RATE_NO_REPARENT. We could indeed set
> both if determine_rate is missing in the core, but that's unprecedented
> in the clock framework so I think we'll want Stephen to comment here :)

The clk_ops pointer is const (no writeable jump tables) so we'd have to
copy the clk_ops struct on registration to set the
__clk_mux_determine_rate() op. We could set the flag though and then
check for the absence of a determine_rate op. Things like
clk_core_can_round() would need to check for the flag. I'd actually
forgotten about this flag. In hindsight I think we should delete it.
I'd expect it to be used when walking the clk tree during rate rounding,
but it's only used in the determine rate clk op.

>=20
> It's also replacing one implicit behavior by another. The point of this
> series was to raise awareness on that particular point, so I'm not sure
> it actually fixes things. We'll see what Stephen thinks about it.
>=20

Right. A decade ago (!) when determine_rate() was introduced we
introduced CLK_SET_RATE_NO_REPARENT and set it on each mux user (see
commit  819c1de344c5 ("clk: add CLK_SET_RATE_NO_REPARENT flag")). This
way driver behavior wouldn't change and the status quo would be
maintained, i.e. that clk_set_rate() on a mux wouldn't change parents.
We didn't enforce that determine_rate exists if the set_parent() op
existed at the same time though. Probably an oversight.

Most of the replies to this series have been "DT is setting the parent",
which makes me believe that there are 'assigned-clock-parents' being
used. The clk_set_parent() path is valid for those cases. Probably
nobody cares about determine_rate because they don't set rates on these
clks. Some drivers even explicitly left out
determine_rate()/round_rate() because they didn't want to have some
other clk round up to the mux and change the parent.

Eventually we want drivers to migrate to determine_rate op so we can get
rid of the round_rate op and save a pointer (we're so greedy). It's been
10 years though, and that hasn't been done. Sigh! I can see value in
this series from the angle of migrating, but adding a determine_rate op
when there isn't a round_rate op makes it hard to reason about. What if
something copies the clk_ops or sets a different flag? Now we've just
added parent changing support to clk_set_rate(). What if the clk has
CLK_SET_RATE_PARENT flag set? Now we're going to ask the parent clk to
change rate. Fun bugs.

TL;DR: If the set_parent op exists but determine_rate/round_rate doesn't
then the clk is a mux that doesn't want to support clk_set_rate(). Make
a new mux function that's the contents of the CLK_SET_RATE_NO_REPARENT
branch in clk_mux_determine_rate_flags() and call that directly from the
clk_ops so it is clear what's happening,
clk_hw_mux_same_parent_determine_rate() or something with a better name.
Otherwise migrate the explicit determine_rate op to this new function
and don't set the flag.

It may be possible to entirely remove the CLK_SET_RATE_NO_REPARENT flag
with this design, if the determine_rate clk_op can call the inner
wrapper function instead of __clk_mux_determine_rate*() (those
underscores are awful, we should just prefix them with clk_hw_mux_*()
and live happier). That should be another patch series.
