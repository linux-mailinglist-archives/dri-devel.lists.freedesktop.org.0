Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75792A9384B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 16:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FB210EBAC;
	Fri, 18 Apr 2025 14:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cUgWJpEy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E2610EBB1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 14:10:51 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-39c1ef4ae3aso1217415f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 07:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744985450; x=1745590250; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/+4iqs0h57Kp8/rbjBz5taHDUwf5MhBA1y6Qwn3HIfw=;
 b=cUgWJpEyln5pyD62fh3YpD4jvMXBYhDued/DJGbQANzWQ3t09wZSySNzTyBhYYdsas
 Gj0Y9mbqia1AmbVLHnUuU1Kg2MavyQw4H+1+A0Dh3vY1dFjeVuuLcBdRXAZnqbb29vRo
 qwJA6gNhXV7bVZyHdvvXwij8U4TWSs4i7v8lzu+LHRn1Am0jjDkxwtGi3BhdxUViBNaW
 jlii5kN1bDi6/uN1gY3t75zt77q8KOjvaheEtwGrzHmJXbXXeAkVeKqlJvS6isfhDv2j
 RP/758bn4i6hY+v2IPbyGBAraI5bdMguHmzOUD5QKApS6AzYN+RkHFNv2O4yF/oqqxR3
 YPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744985450; x=1745590250;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/+4iqs0h57Kp8/rbjBz5taHDUwf5MhBA1y6Qwn3HIfw=;
 b=JCohxD7YMmOv+umS6Ip+pMzwBYFOuDIvd4vklTH+dmsd+8E7dqA0utKVkDBakUb3g+
 1XBKSJS6cAJPQN4m4pE0xK0H2Vg/ROHg9tNDKgDti8ka34zsFCH4SsBvZCJY6VOJSYK4
 LUBRmLDvWPStmKsG2/05Kh4JIMxxIg5/VGu6mH+Xy3G4pyy6v+v66EU4gZCtULx6kaJC
 UWmHKhWTbaRkMP/J1tN1AqV4bDihVPogdaCb5Vyn8Hf7sfHXpt1XFbuzm5skxjCCMrSR
 YtKRfRpnGPPSjNEbd1QXlrlOsxWCAUaZBpkNyHEBYfj36ueTgaMkREmh6rNBeNaYwe+V
 OWSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW04Q7BS0aIFcFyVAJKWaIXD8jfo8Llo3liABUxa5DWhN6LZYnRZy2XAcyXxPvxrS1pDxnVhd784KM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlnKbQpCQyPUTkUdesuajLRQP8h6NouManauIOkAqkmdTGEw9f
 2SYPjEqtYKooQOsO+Gfh9/2RozI8nSGUkcMHAQahb2r0UYovn1Hjwbj+S5lHMIZJirSVvrrsics
 H4mlFx2W61B+Tu0RMo2NdYINuV9M=
X-Gm-Gg: ASbGncshXjeJSccnlJFffcd5KFZ5+PxYLBlPruwLP1jSvDpsOJeVM4H58jTqSQJQFo+
 bRgCdIWsSzRxBAtocnoa+jKqvdpXsU7XXpOLlTBl0UXN4Geeyc9Gy3t90BIrzdZx24m55I41PHL
 f0vY3uOxUomLNlhxsYP0PftOMjXHe2+3SNUSKFkK1rH2lDviXMDJPfZrkiLTNQVR8vFw==
X-Google-Smtp-Source: AGHT+IHl9tpgA/X6cm1KcAI4eONzkSnegsGij5ld5XhyA6vN+eGT7ytBy/PX8eLr/WPj2yiqupDHgYfSrkeaXPBrFCE=
X-Received: by 2002:a05:6000:2481:b0:390:e535:8750 with SMTP id
 ffacd0b85a97d-39efbd60d22mr2430124f8f.9.1744985449778; Fri, 18 Apr 2025
 07:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250408200916.93793-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVjVEVh+dHKG_afZwyqsXwHj2FR7enHNrfuE9HJ0ELjEA@mail.gmail.com>
In-Reply-To: <CAMuHMdVjVEVh+dHKG_afZwyqsXwHj2FR7enHNrfuE9HJ0ELjEA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 18 Apr 2025 15:10:23 +0100
X-Gm-Features: ATxdqUGhurULd5jkQDU7jJeZchOr269Y4azGw9tpFZslMsIVw--s37FvGHYrIio
Message-ID: <CA+V-a8uLA0urp8hPkUmHqNyH=n1Z2fkMnroc3qw=gq06kHUWfQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] clk: renesas: rzv2h-cpg: Add support for DSI
 clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the review.

On Wed, Apr 16, 2025 at 10:27=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar, Fabrizio,
>
> Thanks for your patch!
>
> On Tue, 8 Apr 2025 at 22:09, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for PLLDSI and PLLDSI divider clocks.
> >
> > The `renesas-rzv2h-dsi.h` header file is added to share the PLL divider
> > algorithm between the CPG and DSI drivers.
>
> Please explain here why the DSI driver needs access to this algorithm.
>
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > @@ -196,6 +225,253 @@ static int rzv2h_cpg_pll_clk_enable(struct clk_hw=
 *hw)
> >         return ret;
> >  }
> >
> > +static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *h=
w,
> > +                                                     unsigned long par=
ent_rate)
> > +{
> > +       struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +       struct ddiv ddiv =3D dsi_div->ddiv;
> > +       u32 div;
> > +
> > +       div =3D readl(priv->base + ddiv.offset);
> > +       div >>=3D ddiv.shift;
> > +       div &=3D ((2 << ddiv.width) - 1);
>
> Shouldn't that "2" be "1"?
> GENMASK(ddiv.width - 1, 0), or even better: clk_div_mask(ddiv.width).
>
Agreed, I'll switch to clk_div_mask(ddiv.width)

> > +
> > +       div =3D dsi_div->dtable[div].div;
> > +
> > +       return DIV_ROUND_CLOSEST_ULL(parent_rate, div);
> > +}
> > +
> > +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> > +                                              struct clk_rate_request =
*req)
> > +{
> > +       struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +       struct rzv2h_plldsi_parameters *dsi_dividers =3D &priv->plldsi_=
div_parameters;
> > +       unsigned long long rate_mhz;
>
> u64?
OK.

> Please use "millihz" instead of "mhz" everywhere, so it becomes very
> clear this is really "mHz" and not "MHz".
>
OK.

> > +
> > +       /*
> > +        * Adjust the requested clock rate (`req->rate`) to ensure it f=
alls within
> > +        * the supported range of 5.44 MHz to 187.5 MHz.
> > +        */
> > +       req->rate =3D clamp(req->rate, 5440000UL, 187500000UL);
> > +
> > +       rate_mhz =3D req->rate * MILLI * 1ULL;
> > +       if (rate_mhz =3D=3D dsi_dividers->error_mhz + dsi_dividers->fre=
q_mhz)
> > +               goto exit_determine_rate;
> > +
> > +       if (!rzv2h_dsi_get_pll_parameters_values(priv->dsi_limits,
> > +                                                dsi_dividers, rate_mhz=
)) {
> > +               dev_err(priv->dev,
> > +                       "failed to determine rate for req->rate: %lu\n"=
,
> > +                       req->rate);
> > +               return -EINVAL;
> > +       }
> > +
> > +exit_determine_rate:
> > +       req->best_parent_rate =3D req->rate * dsi_dividers->csdiv;
> > +
> > +       return 0;
> > +};
> > +
> > +static int rzv2h_cpg_plldsi_div_set_rate(struct clk_hw *hw,
> > +                                        unsigned long rate,
> > +                                        unsigned long parent_rate)
> > +{
> > +       struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +       struct rzv2h_plldsi_parameters *dsi_dividers =3D &priv->plldsi_=
div_parameters;
> > +       struct ddiv ddiv =3D dsi_div->ddiv;
> > +       const struct clk_div_table *clkt;
> > +       u32 reg, shift, div;
> > +
> > +       div =3D dsi_dividers->csdiv;
> > +       for (clkt =3D dsi_div->dtable; clkt->div; clkt++) {
> > +               if (clkt->div =3D=3D div)
> > +                       break;
> > +       }
> > +
> > +       if (!clkt->div && !clkt->val)
> > +               return -EINVAL;
>
> No need to check clkt->dev.
>
I'll drop this check and use a bool flag to determine if a div is found.

> > +
> > +       shift =3D ddiv.shift;
> > +       reg =3D readl(priv->base + ddiv.offset);
> > +       reg &=3D ~(GENMASK(shift + ddiv.width, shift));
> > +
> > +       writel(reg | (clkt->val << shift) |
> > +              DDIV_DIVCTL_WEN(shift), priv->base + ddiv.offset);
> > +
> > +       return 0;
>
> This function is very similar to the existing rzv2h_ddiv_set_rate().
> If you can't re-use it as-is, please consider factoring out the common
> part, or at least follow the same style of RMW-operation.
>
Ok, I'll follow the same RMW operation.

> > +};
>
>
> > +static long rzv2h_cpg_plldsi_round_rate(struct clk_hw *hw,
> > +                                       unsigned long rate,
> > +                                       unsigned long *parent_rate)
> > +{
> > +       return clamp(rate, 25000000UL, 375000000UL);
>
> This only rounds rates outside the range from 25 to 375 MHz.
> What about rates between 25 and 375 MHz?
>
> > +}
> > +
> > +static unsigned long rzv2h_cpg_plldsi_clk_recalc_rate(struct clk_hw *h=
w,
> > +                                                     unsigned long par=
ent_rate)
> > +{
> > +       struct pll_clk *pll_clk =3D to_pll(hw);
> > +       struct rzv2h_cpg_priv *priv =3D pll_clk->priv;
> > +       unsigned int val1, val2;
> > +       u64 rate;
> > +
> > +       val1 =3D readl(priv->base + CPG_PLL_CLK1(pll_clk->pll.offset));
> > +       val2 =3D readl(priv->base + CPG_PLL_CLK2(pll_clk->pll.offset));
> > +
> > +       rate =3D mul_u64_u32_shr(parent_rate, (CPG_PLL_CLK1_MDIV(val1) =
<< 16) +
> > +                              CPG_PLL_CLK1_KDIV(val1), 16 + CPG_PLL_CL=
K2_SDIV(val2));
> > +
> > +       return DIV_ROUND_CLOSEST_ULL(rate, CPG_PLL_CLK1_PDIV(val1));
>
> Can't you just reuse the existing rzv2h_cpg_pll_clk_recalc_rate()?
>
Agreed.

> > +}
> > +
> > +static int rzv2h_cpg_plldsi_set_rate(struct clk_hw *hw,
> > +                                    unsigned long rate,
> > +                                    unsigned long parent_rate)
> > +{
> > +       struct pll_clk *pll_clk =3D to_pll(hw);
> > +       struct rzv2h_cpg_priv *priv =3D pll_clk->priv;
> > +       struct rzv2h_plldsi_parameters *dsi_dividers;
> > +       struct pll pll =3D pll_clk->pll;
> > +       u16 offset =3D pll.offset;
> > +       u32 val;
> > +       int ret;
> > +
> > +       /* Put PLL into standby mode */
> > +       writel(CPG_PLL_STBY_RESETB_WEN, priv->base + CPG_PLL_STBY(offse=
t));
> > +       ret =3D readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offs=
et),
> > +                                       val, !(val & CPG_PLL_MON_LOCK),
> > +                                       100, 2000);
> > +       if (ret) {
> > +               dev_err(priv->dev, "Failed to put PLLDSI into standby m=
ode");
> > +               return ret;
> > +       }
> > +
> > +       dsi_dividers =3D &priv->plldsi_div_parameters;
> > +       /* Output clock setting 1 */
> > +       writel((dsi_dividers->k << 16) | (dsi_dividers->m << 6) | (dsi_=
dividers->p),
> > +              priv->base + CPG_PLL_CLK1(offset));
> > +
> > +       /* Output clock setting 2 */
> > +       val =3D readl(priv->base + CPG_PLL_CLK2(offset));
> > +       writel((val & ~GENMASK(2, 0)) | dsi_dividers->s,
> > +              priv->base + CPG_PLL_CLK2(offset));
> > +
> > +       /* Put PLL to normal mode */
> > +       writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB,
> > +              priv->base + CPG_PLL_STBY(offset));
> > +
> > +       /* PLL normal mode transition, output clock stability check */
> > +       ret =3D readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offs=
et),
> > +                                       val, (val & CPG_PLL_MON_LOCK),
> > +                                       100, 2000);
> > +       if (ret) {
> > +               dev_err(priv->dev, "Failed to put PLLDSI into normal mo=
de");
> > +               return ret;
> > +       }
> > +
> > +       return 0;
>
> This function could be reused for non-DSI PLLs?
>
Yes it could be reused, I'll rename this to rzv2h_cpg_pll_set_rate().

> > +};
> > +
> > +static const struct clk_ops rzv2h_cpg_plldsi_ops =3D {
> > +       .recalc_rate =3D rzv2h_cpg_plldsi_clk_recalc_rate,
> > +       .round_rate =3D rzv2h_cpg_plldsi_round_rate,
> > +       .set_rate =3D rzv2h_cpg_plldsi_set_rate,
> > +};
> > +
> > +static struct clk * __init
> > +rzv2h_cpg_plldsi_clk_register(const struct cpg_core_clk *core,
> > +                             struct rzv2h_cpg_priv *priv)
> > +{
> > +       void __iomem *base =3D priv->base;
> > +       struct device *dev =3D priv->dev;
> > +       struct clk_init_data init;
> > +       const struct clk *parent;
> > +       const char *parent_name;
> > +       struct pll_clk *pll_clk;
> > +       int ret;
> > +
> > +       parent =3D priv->clks[core->parent];
> > +       if (IS_ERR(parent))
> > +               return ERR_CAST(parent);
> > +
> > +       pll_clk =3D devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
> > +       if (!pll_clk)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       parent_name =3D __clk_get_name(parent);
> > +       init.name =3D core->name;
> > +       init.ops =3D &rzv2h_cpg_plldsi_ops;
> > +       init.flags =3D 0;
> > +       init.parent_names =3D &parent_name;
> > +       init.num_parents =3D 1;
> > +
> > +       pll_clk->hw.init =3D &init;
> > +       pll_clk->pll =3D core->cfg.pll;
> > +       pll_clk->base =3D base;
> > +       pll_clk->priv =3D priv;
> > +
> > +       /* Disable SSC and turn on PLL clock when init */
> > +       writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB |
> > +              CPG_PLL_STBY_SSCGEN_WEN, base + CPG_PLL_STBY(pll_clk->pl=
l.offset));
>
> Apart from the three lines above, this function does the same as the
> existing rzv2h_cpg_pll_clk_register().  Merge/reuse?
>
Agreed, I'll reuse this function and introduce a bool flag to turn on the P=
LL.

> > +
> > +       ret =3D devm_clk_hw_register(dev, &pll_clk->hw);
> > +       if (ret)
> > +               return ERR_PTR(ret);
> > +
> > +       return pll_clk->hw.clk;
> > +}
> > +
> >  static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
> >                                                    unsigned long parent=
_rate)
> >  {
>
> > --- /dev/null
> > +++ b/include/linux/clk/renesas-rzv2h-dsi.h
> > @@ -0,0 +1,207 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Renesas RZ/V2H(P) DSI CPG helper
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corp.
> > + */
>
> Missing include guard.
>
Ouch, Ill add one.

> > +
> > +#include <linux/limits.h>
> > +#include <linux/math.h>
> > +#include <linux/math64.h>
> > +#include <linux/units.h>
> > +
> > +#define OSC_CLK_IN_MEGA                (24 * MEGA)
> > +
> > +struct rzv2h_plldsi_div_limits {
>
> This structure looks applicable to all RZ/V2H PLLs, so perhaps drop the
> "dsi" part from the name?
>
Agreed.

Cheers,
Prabhakar
