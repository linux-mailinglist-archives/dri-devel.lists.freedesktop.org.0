Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968226C4F47
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 16:19:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9330710E97F;
	Wed, 22 Mar 2023 15:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205AD10E97F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 15:19:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 376E9CE1DE0;
 Wed, 22 Mar 2023 15:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8301DC433D2;
 Wed, 22 Mar 2023 15:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679498358;
 bh=EEErT/PnRAtdQE0xsUp/GkoJjA2tZIOlkEavkERihSA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=biz9bCMNpkK2ZEQa+eaU+sNLjl7taEonfLGWnhALLtgkorM899mr4nkh/IxFNN3nN
 nJ8zf6kd9ma1XWWQN723hJBFbunjh7bWY6cNcMki8eHBAltLh6IIJI508urmj1MapD
 JTUNJwewzxCeo4W5xDNfWE9SRxilevfEGZeplSUxKR8eK6JDEGdZGqtC1yaB/GX/d5
 Hm4YlBRnG9Uo9db85S4u3R8JymPLotvxLSzr/8NbFvPABTfLD1D9ZdxDncX/1SKkhB
 J8j13I8QXDyGwrgpvNRQ/GUh8VH55YjjyNRF38nHR9RbQQi71Z28jdsata/N9enUg3
 lfo4mo3dbV8dA==
Message-ID: <a5e4e878bbd2493e27ef9acd6a1f9af1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230322100153.gzyznaukbdngcvko@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <f804380a14c346fdbbf3286bcb40b3c2.sboyd@kernel.org>
 <20230322100153.gzyznaukbdngcvko@houat>
Subject: Re: [PATCH v2 00/65] clk: Make determine_rate mandatory for muxes
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 22 Mar 2023 08:19:16 -0700
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
	Samuel Holland <samuel@sholland.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Takashi Iwai <tiwai@suse.com>,
	linux-tegra@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mips@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	David Lechner <david@lechnology.com>, alsa-devel@alsa-project.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	linux-renesas-soc@vger.ker, Shawn Guo <shawnguo@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2023-03-22 03:01:53)
> Hi Stephen,
>=20
> On Tue, Mar 21, 2023 at 04:55:03PM -0700, Stephen Boyd wrote:
> > Quoting Maxime Ripard (2022-11-04 06:17:17)
> > > Hi,
> > >=20
> > > This is a follow-up to a previous series that was printing a warning
> > > when a mux has a set_parent implementation but is missing
> > > determine_rate().
> > >=20
> > > The rationale is that set_parent() is very likely to be useful when
> > > changing the rate, but it's determine_rate() that takes the parenting
> > > decision. If we're missing it, then the current parent is always going
> > > to be used, and thus set_parent() will not be used. The only exception
> > > being a direct call to clk_set_parent(), but those are fairly rare
> > > compared to clk_set_rate().
> > >=20
> > > Stephen then asked to promote the warning to an error, and to fix up =
all
> > > the muxes that are in that situation first. So here it is :)
> > >=20
> > > Let me know what you think,
> >=20
> > What's the plan here? Are you going to resend?
>=20
> It wasn't clear to me whether or not this was something that you wanted,
> and I got some pushback on the drivers so I kind of forgot about it.
>=20
> If you do want it (and it looks like you do), I'll resend it.

Let me read the whole series first. I was ignoring it because I was
assuming it was going to be resent.
