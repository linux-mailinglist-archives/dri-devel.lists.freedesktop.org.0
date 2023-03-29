Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C5A6CF401
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 22:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059A310EC23;
	Wed, 29 Mar 2023 20:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F14E10EC08
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 20:04:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B515561E1B;
 Wed, 29 Mar 2023 20:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090DEC433D2;
 Wed, 29 Mar 2023 20:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680120256;
 bh=4zOE3jMEKOhNI25UF0fOfIL08piHi2bqDz6TyK76qR4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=uw7qtD3HESWGMQ9Baj1w6twvKM7JMNgmt7PKXoCvJOczY0u340GfBpvymvmBiBWVx
 qf+kcFVYf4dg0yAAoDZF/aYBqaksZ6Fa6+sA1PoByUd2LNaPRyh7sgPqRQE/0pwpm6
 kLBCPzCQv/zuh06cTNQJrCxJ0npzPNiAuiOv4nPQtFpsUot5FTUeXXUIthYvejQLJp
 rYE7s1omKIT+oMjKorhMYWPlc7LMeX1LkHhCE8Dy2xq0wbdX6qu2wzq8S2YfmcMFVE
 ghrqf/6Xyf4MjMXD1dbNaL7jIuCYUjU2Xzl7KYDgsErEqGoLGnH3utZKKa/Vvp72NN
 7AGUd6HAiLFYg==
Message-ID: <da1ea2d9278c15a4aa9d4fb3d459e819.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230329195049.lbdbkbqu6zbq5xii@penduick>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-43-f6736dec138e@cerno.tech>
 <Y2UzdYyjgahJsbHg@sirena.org.uk> <20221104155123.qomguvthehnogkdd@houat>
 <Y2U2+ePwRieYkNjv@sirena.org.uk> <20221107084322.gk4j75r52zo5k7xk@houat>
 <Y2j0r0wX1XtQBvqO@sirena.org.uk> <20221107152603.57qimyzkinhifx5p@houat>
 <5819b1362f35ce306e1b6d566bfd44e5.sboyd@kernel.org>
 <20230329195049.lbdbkbqu6zbq5xii@penduick>
Subject: Re: [PATCH v2 43/65] ASoC: tlv320aic32x4: Add a determine_rate hook
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 29 Mar 2023 13:04:13 -0700
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Sekhar Nori <nsekhar@ti.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
	Paul Cercueil <paul@crapouillou.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Abel Vesa <abelvesa@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Samuel Holland <samuel@sholland.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Takashi Iwai <tiwai@suse.com>,
	linux-tegra@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
	linux-mips@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-rtc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	alsa-devel@alsa-project.org, Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-actions@lists.infradead.org,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
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
	Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2023-03-29 12:50:49)
> On Wed, Mar 22, 2023 at 04:31:04PM -0700, Stephen Boyd wrote:
>=20
> > The clk_set_parent() path is valid for those cases. Probably nobody
> > cares about determine_rate because they don't set rates on these clks.
> > Some drivers even explicitly left out determine_rate()/round_rate()
> > because they didn't want to have some other clk round up to the mux
> > and change the parent.
> >=20
> > Eventually we want drivers to migrate to determine_rate op so we can get
> > rid of the round_rate op and save a pointer (we're so greedy). It's been
> > 10 years though, and that hasn't been done. Sigh! I can see value in
> > this series from the angle of migrating, but adding a determine_rate op
> > when there isn't a round_rate op makes it hard to reason about. What if
> > something copies the clk_ops or sets a different flag? Now we've just
> > added parent changing support to clk_set_rate(). What if the clk has
> > CLK_SET_RATE_PARENT flag set? Now we're going to ask the parent clk to
> > change rate. Fun bugs.
> >=20
> > TL;DR: If the set_parent op exists but determine_rate/round_rate doesn't
> > then the clk is a mux that doesn't want to support clk_set_rate(). Make
> > a new mux function that's the contents of the CLK_SET_RATE_NO_REPARENT
> > branch in clk_mux_determine_rate_flags() and call that directly from the
> > clk_ops so it is clear what's happening,
> > clk_hw_mux_same_parent_determine_rate() or something with a better name.
> > Otherwise migrate the explicit determine_rate op to this new function
> > and don't set the flag.
> >=20
> > It may be possible to entirely remove the CLK_SET_RATE_NO_REPARENT flag
> > with this design, if the determine_rate clk_op can call the inner
> > wrapper function instead of __clk_mux_determine_rate*() (those
> > underscores are awful, we should just prefix them with clk_hw_mux_*()
> > and live happier). That should be another patch series.
>=20
> Sorry but it's not really clear to me what you expect in the v2 of this
> series (if you even expect one). It looks that you don't like the
> assignment-if-missing idea Mark suggested, but should I just
> rebase/resend or did you expect something else?
>=20

Yes, we want explicit code. Just rebase & resend. Don't add a
determine_rate if there isn't a round_rate. Don't add more users of
CLK_SET_RATE_NO_REPARENT. Instead, make an explicit determine_rate
function for that. If you want to work on the removal of
CLK_SET_RATE_NO_REPARENT go for it. Otherwise I'll take care of it after
this series.
