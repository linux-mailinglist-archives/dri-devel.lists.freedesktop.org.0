Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9006DD7EB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 12:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243D510E1AD;
	Tue, 11 Apr 2023 10:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F93A10E1AD
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 10:28:15 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 f10-20020a9d2c0a000000b006a13f728172so1498809otb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 03:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681208894;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9k4ZTujQ4vL3rn+nuolFAvnH5smJoZ+VnOtxKctHstQ=;
 b=gNEjuFBcqn6/lOVatQwMmR1GcF8thXowqr/fRJPkgNghhMYcjv2oZp1NgB+QeocHo/
 HasUYvHM3pU+Fboe+DKH3dlSRYwEPMic7S8vyD1tqbAySk8qZMwgr6FCWqpca3C1IUUi
 VkvWBMflZrQutak3rPgI2bamP6/oglkZZoNuTIfzpyDDmxZ5pMHdF0D5v6piw8rF9lZV
 UDECTLJhuaGa3PTMIddmyby4q94trv7YaVLdDmnHSJHK2hLyai/8HTwGC2E31G1794k6
 ecBsXGlpTjiPZBRUtfpz+2D23yClaqh4+B7hMng0JR+o6wEhd1Fx82Sn2tQ6RTnDSjLn
 NhZg==
X-Gm-Message-State: AAQBX9cYBPhkOrXk995ohqxEbpaDc9x9FGb0ndvvSH0VGXFh3n7vSXIN
 5rAc7I+bBvNQiT1FvwIopmBZZ7CAvcuacUt+
X-Google-Smtp-Source: AKy350Z+cbMYT+8MdL98t6djxCWA0fgy80xTg0BWVym5OcAGSh6cVHk+jQZ1sF2kLVq6E3LAKGCpOw==
X-Received: by 2002:a9d:774b:0:b0:69d:8cb2:d38 with SMTP id
 t11-20020a9d774b000000b0069d8cb20d38mr5931974otl.11.1681208893696; 
 Tue, 11 Apr 2023 03:28:13 -0700 (PDT)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com.
 [209.85.161.45]) by smtp.gmail.com with ESMTPSA id
 n19-20020a9d64d3000000b0069f0794861asm5206573otl.63.2023.04.11.03.28.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 03:28:12 -0700 (PDT)
Received: by mail-oo1-f45.google.com with SMTP id
 c17-20020a4aa4d1000000b005418821052aso2096029oom.6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 03:28:12 -0700 (PDT)
X-Received: by 2002:a25:d74c:0:b0:b46:c5aa:86ef with SMTP id
 o73-20020a25d74c000000b00b46c5aa86efmr5126210ybg.12.1681208871324; Tue, 11
 Apr 2023 03:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-28-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-28-9a1358472d52@cerno.tech>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2023 12:27:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUEOP_3zjf8nwDyHvZVG-D0AsBjnr=esKzejMMcEiLSQ@mail.gmail.com>
Message-ID: <CAMuHMdXUEOP_3zjf8nwDyHvZVG-D0AsBjnr=esKzejMMcEiLSQ@mail.gmail.com>
Subject: Re: [PATCH v3 28/65] clk: renesas: r9a06g032: Add a determine_rate
 hook
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>,
 linux-tegra@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mips@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-rtc@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 David Lechner <david@lechnology.com>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-sunxi@lists.linux.dev,
 Ralph Siemsen <ralph.siemsen@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 patches@opensource.cirrus.com, Peter De Schrijver <pdeschrijver@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CC Gareth, Herv=C3=A9, Miquel, Ralph

On Tue, Apr 4, 2023 at 2:44=E2=80=AFPM Maxime Ripard <maxime@cerno.tech> wr=
ote:
> The Renesas r9a06g032 bitselect clock implements a mux with a set_parent
> hook, but doesn't provide a determine_rate implementation.
>
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidate to
> trigger that parent change is a call to clk_set_rate(), with
> determine_rate() figuring out which parent is the best suited for a
> given rate.
>
> The other trigger would be a call to clk_set_parent(), but it's far less
> used, and it doesn't look like there's any obvious user for that clock.
>
> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().
>
> The latter case would be equivalent to setting the flag
> CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
> to __clk_mux_determine_rate(). Indeed, if no determine_rate
> implementation is provided, clk_round_rate() (through
> clk_core_round_rate_nolock()) will call itself on the parent if
> CLK_SET_RATE_PARENT is set, and will not change the clock rate
> otherwise. __clk_mux_determine_rate() has the exact same behavior when
> CLK_SET_RATE_NO_REPARENT is set.
>
> And if it was an oversight, then we are at least explicit about our
> behavior now and it can be further refined down the line.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
But I do not have the hardware.

> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -1121,6 +1121,7 @@ static int r9a06g032_clk_mux_set_parent(struct clk_=
hw *hw, u8 index)
>  }
>
>  static const struct clk_ops clk_bitselect_ops =3D {
> +       .determine_rate =3D __clk_mux_determine_rate,
>         .get_parent =3D r9a06g032_clk_mux_get_parent,
>         .set_parent =3D r9a06g032_clk_mux_set_parent,
>  };
> @@ -1145,7 +1146,7 @@ r9a06g032_register_bitsel(struct r9a06g032_priv *cl=
ocks,
>
>         init.name =3D desc->name;
>         init.ops =3D &clk_bitselect_ops;
> -       init.flags =3D CLK_SET_RATE_PARENT;
> +       init.flags =3D CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
>         init.parent_names =3D names;
>         init.num_parents =3D 2;
>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
