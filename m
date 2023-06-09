Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FB2728D46
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 03:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CA610E62A;
	Fri,  9 Jun 2023 01:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A0A10E62A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 01:49:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F197E652B2;
 Fri,  9 Jun 2023 01:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41180C433EF;
 Fri,  9 Jun 2023 01:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686275370;
 bh=5yCCx637qN6JiLW7I6+8zEHQGblEuFICtzq96prQWME=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=K6IhUHPIMyX6G51Gvg9LBUJ3F+NMA6t6yEqi3fTeDTd+AJzCCvvookTr/6vQqGmIn
 YHm6xCzH29XDY1RxhGUWWRXRiWAz+w4FinVcWL9BZIaqu935rDcsd9srsnN7LexnGZ
 GCkr6cL3K8SIP7mxO9yA8OMPuNRkbBGzshyF7AScJsc0Echnlzdy6HrJq2B3P6eqEB
 C/vA6phGnqUiPVssfsHiLNKrmW37L5wDKBSmCLTQDZ9XlTE9d38MUMidr99RQRsQ6o
 iveJTt876EEgX7IN09+I3JVakkYPpa1Fbdci55u3kgBWbiPwoqFEOp6SBpvW+XcWiw
 hoc+eH+MLB+dw==
Message-ID: <431d1ae3993d1fc78decbcd065442f29.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
Subject: Re: [PATCH v4 00/68] clk: Make determine_rate mandatory for muxes
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>,
 Michael Turquette <mturquette@baylibre.com>
Date: Thu, 08 Jun 2023 18:49:28 -0700
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
 Peng Fan <peng.fan@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Sekhar Nori <nsekhar@ti.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Orson Zhai <orsonzhai@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mips@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-rtc@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 David Lechner <david@lechnology.com>, Pawel Moll <pawel.moll@arm.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdw ood <lgirdwood@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Miles Chen <miles.chen@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Liam Beguin <liambeguin@gmail.com>,
 alsa-devel@alsa-project.org, Shawn Guo <shawnguo@kernel.org>,
 Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2023-05-05 04:25:02)
> Hi,
>=20
> This is a follow-up to a previous series that was printing a warning
> when a mux has a set_parent implementation but is missing
> determine_rate().
>=20
> The rationale is that set_parent() is very likely to be useful when
> changing the rate, but it's determine_rate() that takes the parenting
> decision. If we're missing it, then the current parent is always going
> to be used, and thus set_parent() will not be used. The only exception
> being a direct call to clk_set_parent(), but those are fairly rare
> compared to clk_set_rate().
>=20
> Stephen then asked to promote the warning to an error, and to fix up all
> the muxes that are in that situation first. So here it is :)
>=20

I've applied this to clk-next after squashing in an export. Thanks for
taking this on.

I'll have to monitor for wreckage with any in-flight drivers. I suspect
I'll have to take out the last commit, but maybe we can just let those
in-flight drivers get fixed up later.
