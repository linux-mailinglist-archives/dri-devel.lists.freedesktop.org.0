Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A300BC9343
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 15:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E2D10EA3F;
	Thu,  9 Oct 2025 13:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QWfg4Naj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61EE10EA3F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 13:08:47 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-46e3a50bc0fso7364125e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 06:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760015326; x=1760620126; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qhovi4HUngN4Wor+KHpxSd3sVb2276HUKfA4yNG8cvE=;
 b=QWfg4Naja30FKbL/DAwL5/BX/mDaNrUNHwsds9G+IKUA1zsAypn7gazNTjU8wveI/G
 rjVSDqG0vDbmxAxb2CNDMUDDCITpP33wxacW0ZbnceyyGQXlLAN3iWEOCqgN+wCLmp4Y
 YPcene6FnLL1a3CQDw8HtI563otYKS6SN0R7UF/gPNiHw+mJH06hGmQrO/pEpDLDrwb/
 WAfsj8wFT/M0f/engxEfi2NbfxusmQKNdBEsEB1OSMkynPI48VJWsJNJpu0K+hJiS6u2
 mrxq74P4phEIln1ACg2ApK51ZmrVwrLcQqq2y0B3RsDYRnalYZ9YA/DQPnubbMqmuoK+
 SD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760015326; x=1760620126;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qhovi4HUngN4Wor+KHpxSd3sVb2276HUKfA4yNG8cvE=;
 b=eY45jGdYIg9TD4jZ1AQuu0suY8vNuN9g6Cad+0j6F4Pu/Mgd4CPzEOIxAW6RDjtjek
 l40ns8nabHaCTPtChpBc3HDakBtFzQlmVXnDurz2VOjRFJYx5QrJ7h2f/JnxXIOpxYx2
 D+BjmczUaoeOTr0SXy3VTiKaqCIQm+kpVWw4/mUIBFvbvUFq0Z4xDaz7E+3ikyZyELtV
 PANnoCYKxtk7kevcdcgnPdIuhqMDNRoe6VqfdHbdr+3iqARUuj3/dUqcGDOI/pnL0t/Q
 cTIP7Qq2HurKHx84bvAjdC9iWLVM7kMhgzzZouKF9LnE4uaVBbT1x6vcPG+Wje+ESAOo
 PKJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnqFgAoR3lrU5mmGgxWIhnAhflMR+ty6UPTsgvC7xeVpSk7IGeTWl5cK5ZU/cNYnU4/1x8Evm27qI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4UpMKP+66l4zFzhjx2JFn6/QcK9QWY3Qpj3LpAvI6CXkIVbrc
 BrhNAFQdA6cdOdlSZrttgcWA9zJ8pXlqlTjPvlvoXALxPdlNMQahOoFk5gY09LQploUQfQ5jHiE
 u5g6FXmzgi9/8kvrUNwi+oadtkBLklQQ=
X-Gm-Gg: ASbGncv2xjCAQA0iS0cMQgLnDSwZM6pkSzVpS8BfBdRANCEpOFI8gA7nMHA8U2RvfjY
 8Aa0rt/m3XV5QeRLfCr5nV5z3U8lje7rCV65GR6T7Rbbuw4WaD/xMSW9T/5YG2eUTW3MphWdUbg
 KdcqsHgFkJkY1oKk6kKBWPewx7nrRSPnjE1ENaG1m3nLKCLdTgy/2I8lpp2hmju48eZpzRDBVSo
 z+PdqX1pYfWaW92HIIFIyZd0jFuwswZCoZ8mCiZCya/csQs6TVzBwZjHmBS7VBxPnjzSXnbl/Q=
X-Google-Smtp-Source: AGHT+IFBEmfcqddrXrL/Z1EH2lks0Dwq8+yKxv5/UdWltkE4DG7UysEBFkKmbef4z8X6f+H3A2Gk6BgSHDVYwx1ZvP4=
X-Received: by 2002:a05:600c:6383:b0:46e:32dd:1b1a with SMTP id
 5b1f17b1804b1-46fa9a8f146mr49327895e9.7.1760015326038; Thu, 09 Oct 2025
 06:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251002161728.186024-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVP4xgsc6rD_Z6OMAXR-mOe9WdfZb2jXZSzDmXdgZzFSw@mail.gmail.com>
In-Reply-To: <CAMuHMdVP4xgsc6rD_Z6OMAXR-mOe9WdfZb2jXZSzDmXdgZzFSw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 9 Oct 2025 14:08:19 +0100
X-Gm-Features: AS18NWC5rsslB-cfQdgL7VawbRMgX6qh2J8jZ5sIkVStSJ8rbfHF59Zw3xWMXPw
Message-ID: <CA+V-a8uWYsQcfHx-4BRaLoH30uy3vaT-e9zqrW_kwoX_bsb8Xw@mail.gmail.com>
Subject: Re: [PATCH v9 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
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

On Mon, Oct 6, 2025 at 1:45=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 2 Oct 2025 at 18:17, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for PLLDSI and its post-dividers in the RZ/V2H CPG driver a=
nd
> > export helper APIs for use by the DSI driver.
> >
> > Introduce per-PLL-DSI state in the CPG private structure and provide a
> > set of helper functions that find valid PLL parameter combinations for
> > a requested frequency. The new helpers are rzv2h_get_pll_pars(),
> > rzv2h_get_pll_div_pars(), rzv2h_get_pll_divs_pars() and
> > rzv2h_get_pll_dtable_pars() and they are exported in the "RZV2H_CPG"
> > namespace for use by other consumers (notably the DSI driver). These
> > helpers perform iterative searches over PLL parameters (M, K, P, S)
> > and optional post-dividers and return the best match (or an exact
> > match when possible).
> >
> > Move PLL/CLK related limits and parameter types into the shared
> > include (include/linux/clk/renesas.h) by adding struct rzv2h_pll_limits=
,
> > struct rzv2h_pll_pars and struct rzv2h_pll_div_pars plus the
> > RZV2H_CPG_PLL_DSI_LIMITS() helper macro to define DSI PLL limits.
> >
> > This change centralises the PLLDSI algorithms so the CPG and DSI
> > drivers compute PLL parameters consistently and allows the DSI driver
> > to accurately request rates and program its PLL.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v8->v9:
> > - Dropped `renesas-rzv2h-cpg-pll.h` header and merged into `renesas.h`
> > - Exported the symbols for PLL calculation apis
> > - Updated commit message
> > - Dropped reviewed-by tags due to above changes
>
> Thanks for the update!
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > +/*
> > + * rzv2h_get_pll_div_pars - Finds the best combination of PLL paramete=
rs
> > + * and divider value for a given frequency.
> > + *
> > + * @limits: Pointer to the structure containing the limits for the PLL=
 parameters
> > + * @pars: Pointer to the structure where the best calculated PLL param=
eters and
> > + * divider values will be stored
> > + * @divider: Divider value to be applied to the PLL output
> > + * @freq_millihz: Target output frequency in millihertz
> > + *
> > + * This function calculates the best set of PLL parameters (M, K, P, S=
) where
> > + * the divider value is already known. See rzv2h_get_pll_pars() for mo=
re details
> > + * on how the PLL parameters are calculated.
> > + */
> > +bool rzv2h_get_pll_div_pars(const struct rzv2h_pll_limits *limits,
> > +                           struct rzv2h_pll_div_pars *pars, u8 divider=
,
> > +                           u64 freq_millihz)
> > +{
> > +       if (!rzv2h_get_pll_pars(limits, &pars->pll, freq_millihz * divi=
der))
> > +               return false;
> > +
> > +       pars->div.divider_value =3D divider;
> > +       pars->div.freq_millihz =3D DIV_U64_ROUND_CLOSEST(pars->pll.freq=
_millihz, divider);
> > +       pars->div.error_millihz =3D freq_millihz - pars->div.freq_milli=
hz;
> > +
> > +       return true;
> > +}
> > +EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_div_pars, "RZV2H_CPG");
>
> This function does not seem to be used outside this module yet,
> so why is it exported?
>
Agreed, I will drop it.

> If you do ever need it, you could define a simple wrapper in the
> header file:
>
>     static inline bool rzv2h_get_pll_div_pars(const struct
> rzv2h_pll_limits *limits,
>                                               struct rzv2h_pll_div_pars *=
pars,
>                                               u8 divider, u64 freq_millih=
z)
>     {
>             return rzv2h_get_pll_divs_pars(limits, pars, &divider, 1,
> freq_millihz);
>     }
>
Agreed.

> > +
> > +/*
> > + * rzv2h_get_pll_divs_pars - Finds the best combination of PLL paramet=
ers
> > + * and divider value for a given frequency.
> > + *
> > + * @limits: Pointer to the structure containing the limits for the PLL=
 parameters
> > + * @pars: Pointer to the structure where the best calculated PLL param=
eters and
> > + * divider values will be stored
> > + * @table: Pointer to the array of valid divider values
> > + * @table_size: Size of the divider values array
> > + * @freq_millihz: Target output frequency in millihertz
> > + *
> > + * This function calculates the best set of PLL parameters (M, K, P, S=
) and divider
> > + * value to achieve the desired frequency. See rzv2h_get_pll_pars() fo=
r more details
> > + * on how the PLL parameters are calculated.
> > + *
> > + * freq_millihz is the desired frequency generated by the PLL followed=
 by a
> > + * a gear.
> > + */
> > +bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
> > +                            struct rzv2h_pll_div_pars *pars,
> > +                            const u8 *table, u8 table_size, u64 freq_m=
illihz)
> > +{
> > +       struct rzv2h_pll_div_pars p, best;
> > +
> > +       best.div.error_millihz =3D S64_MAX;
> > +       p.div.error_millihz =3D S64_MAX;
> > +       for (unsigned int i =3D 0; i < table_size; i++) {
> > +               if (!rzv2h_get_pll_div_pars(limits, &p, table[i], freq_=
millihz))
>
> If you don't need rzv2h_get_pll_div_pars() elsewhere, you could just
> expand it here.
>
Agreed, I will expand it here and drop rzv2h_get_pll_div_pars().

> > +                       continue;
> > +
> > +               if (p.div.error_millihz =3D=3D 0) {
> > +                       *pars =3D p;
> > +                       return true;
> > +               }
> > +
> > +               if (abs(best.div.error_millihz) > abs(p.div.error_milli=
hz))
> > +                       best =3D p;
> > +       }
> > +
> > +       if (best.div.error_millihz =3D=3D S64_MAX)
> > +               return false;
> > +
> > +       *pars =3D best;
> > +       return true;
> > +}
> > +EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_divs_pars, "RZV2H_CPG");
> > +
> > +/*
> > + * rzv2h_get_pll_dtable_pars - Finds the best combination of PLL param=
eters
> > + * and divider value for a given frequency using a divider table.
> > + *
> > + * @limits: Pointer to the structure containing the limits for the PLL=
 parameters
> > + * @pars: Pointer to the structure where the best calculated PLL param=
eters and
> > + * divider values will be stored
> > + * @dtable: Pointer to the array of valid divider values
> > + * @freq_millihz: Target output frequency in millihertz
> > + *
> > + * See rzv2h_get_pll_divs_pars() for more details on how the PLL
> > + * parameters and divider values are calculated.
> > + */
> > +bool rzv2h_get_pll_dtable_pars(const struct rzv2h_pll_limits *limits,
> > +                              struct rzv2h_pll_div_pars *pars,
> > +                              const struct clk_div_table *dtable, u64 =
freq_millihz)
> > +{
> > +       const struct clk_div_table *div =3D dtable;
> > +       u8 table[RZV2H_MAX_DIV_TABLES] =3D { 0 };
> > +       unsigned int i =3D 0;
> > +
> > +       for (; div->div; div++) {
> > +               if (i >=3D RZV2H_MAX_DIV_TABLES)
> > +                       return false;
> > +               table[i++] =3D div->div;
> > +       }
> > +
> > +       return rzv2h_get_pll_divs_pars(limits, pars, table, i, freq_mil=
lihz);
> > +}
> > +EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_dtable_pars, "RZV2H_CPG");
>
> This function does not seem to be used outside this module yet,
> so why is it exported?
>
Agreed, I will drop it.

> > +
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
> > +       div &=3D clk_div_mask(ddiv.width);
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
> > +       struct pll_clk *pll_clk =3D to_pll(clk_hw_get_parent(hw));
> > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +       struct rzv2h_pll_div_pars *dsi_params;
> > +       struct rzv2h_pll_dsi_info *dsi_info;
> > +       u64 rate_millihz;
> > +
> > +       dsi_info =3D &priv->pll_dsi_info[pll_clk->pll.instance];
> > +       dsi_params =3D &dsi_info->pll_dsi_parameters;
> > +
> > +       rate_millihz =3D mul_u32_u32(req->rate, MILLI);
> > +       if (rate_millihz =3D=3D dsi_params->div.error_millihz + dsi_par=
ams->div.freq_millihz)
> > +               goto exit_determine_rate;
> > +
> > +       if (!rzv2h_get_pll_dtable_pars(dsi_info->pll_dsi_limits, dsi_pa=
rams, dsi_div->dtable,
> > +                                      rate_millihz)) {
>
> If you don't need rzv2h_get_pll_dtable_pars() elsewhere, you could just
> expand it here.
>
Ok, I will expand it here.

> > +               dev_err(priv->dev,
> > +                       "failed to determine rate for req->rate: %lu\n"=
,
> > +                       req->rate);
> > +               return -EINVAL;
> > +       }
> > +
> > +exit_determine_rate:
> > +       req->rate =3D DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millih=
z, MILLI);
> > +       req->best_parent_rate =3D req->rate * dsi_params->div.divider_v=
alue;
> > +       dsi_info->req_pll_dsi_rate =3D req->best_parent_rate;
> > +
> > +       return 0;
> > +}
>
> > --- a/include/linux/clk/renesas.h
> > +++ b/include/linux/clk/renesas.h
> > @@ -10,7 +10,9 @@
> >  #ifndef __LINUX_CLK_RENESAS_H_
> >  #define __LINUX_CLK_RENESAS_H_
> >
> > +#include <linux/clk-provider.h>
> >  #include <linux/types.h>
> > +#include <linux/units.h>
> >
> >  struct device;
> >  struct device_node;
> > @@ -32,4 +34,138 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *=
unused, struct device *dev);
> >  #define cpg_mssr_attach_dev    NULL
> >  #define cpg_mssr_detach_dev    NULL
> >  #endif
> > +
> > +/**
> > + * struct rzv2h_pll_limits - PLL parameter constraints
> > + *
> > + * This structure defines the minimum and maximum allowed values for
> > + * various parameters used to configure a PLL. These limits ensure
> > + * the PLL operates within valid and stable ranges.
> > + *
> > + * @fout: Output frequency range (in MHz)
> > + * @fout.min: Minimum allowed output frequency
> > + * @fout.max: Maximum allowed output frequency
> > + *
> > + * @fvco: PLL oscillation frequency range (in MHz)
> > + * @fvco.min: Minimum allowed VCO frequency
> > + * @fvco.max: Maximum allowed VCO frequency
> > + *
> > + * @m: Main-divider range
> > + * @m.min: Minimum main-divider value
> > + * @m.max: Maximum main-divider value
> > + *
> > + * @p: Pre-divider range
> > + * @p.min: Minimum pre-divider value
> > + * @p.max: Maximum pre-divider value
> > + *
> > + * @s: Divider range
> > + * @s.min: Minimum divider value
> > + * @s.max: Maximum divider value
> > + *
> > + * @k: Delta-sigma modulator range (signed)
> > + * @k.min: Minimum delta-sigma value
> > + * @k.max: Maximum delta-sigma value
> > + */
> > +struct rzv2h_pll_limits {
> > +       struct {
> > +               u32 min;
> > +               u32 max;
> > +       } fout;
> > +
> > +       struct {
> > +               u32 min;
> > +               u32 max;
> > +       } fvco;
> > +
> > +       struct {
> > +               u16 min;
> > +               u16 max;
> > +       } m;
> > +
> > +       struct {
> > +               u8 min;
> > +               u8 max;
> > +       } p;
> > +
> > +       struct {
> > +               u8 min;
> > +               u8 max;
> > +       } s;
> > +
> > +       struct {
> > +               s16 min;
> > +               s16 max;
> > +       } k;
> > +};
> > +
> > +/**
> > + * struct rzv2h_pll_pars - PLL configuration parameters
> > + *
> > + * This structure contains the configuration parameters for the
> > + * Phase-Locked Loop (PLL), used to achieve a specific output frequenc=
y.
> > + *
> > + * @m: Main divider value
> > + * @p: Pre-divider value
> > + * @s: Output divider value
> > + * @k: Delta-sigma modulation value
> > + * @freq_millihz: Calculated PLL output frequency in millihertz
> > + * @error_millihz: Frequency error from target in millihertz (signed)
> > + */
> > +struct rzv2h_pll_pars {
> > +       u16 m;
> > +       u8 p;
> > +       u8 s;
> > +       s16 k;
> > +       u64 freq_millihz;
> > +       s64 error_millihz;
> > +};
> > +
> > +/**
> > + * struct rzv2h_pll_div_pars - PLL parameters with post-divider
> > + *
> > + * This structure is used for PLLs that include an additional post-div=
ider
> > + * stage after the main PLL block. It contains both the PLL configurat=
ion
> > + * parameters and the resulting frequency/error values after the divid=
er.
> > + *
> > + * @pll: Main PLL configuration parameters (see struct rzv2h_pll_pars)
> > + *
> > + * @div: Post-divider configuration and result
> > + * @div.divider_value: Divider applied to the PLL output
> > + * @div.freq_millihz: Output frequency after divider in millihertz
> > + * @div.error_millihz: Frequency error from target in millihertz (sign=
ed)
> > + */
> > +struct rzv2h_pll_div_pars {
> > +       struct rzv2h_pll_pars pll;
> > +       struct {
> > +               u8 divider_value;
> > +               u64 freq_millihz;
> > +               s64 error_millihz;
> > +       } div;
> > +};
> > +
> > +#define RZV2H_CPG_PLL_DSI_LIMITS(name)                                =
 \
> > +       static const struct rzv2h_pll_limits (name) =3D {              =
   \
> > +               .fout =3D { .min =3D 25 * MEGA, .max =3D 375 * MEGA }, =
       \
> > +               .fvco =3D { .min =3D 1600 * MEGA, .max =3D 3200 * MEGA =
},     \
> > +               .m =3D { .min =3D 64, .max =3D 533 },                  =
       \
> > +               .p =3D { .min =3D 1, .max =3D 4 },                     =
       \
> > +               .s =3D { .min =3D 0, .max =3D 6 },                     =
       \
> > +               .k =3D { .min =3D -32768, .max =3D 32767 },            =
       \
> > +       }                                                              =
 \
> > +
> > +bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
> > +                       struct rzv2h_pll_pars *pars, u64 freq_millihz);
>
> Please add a dummy returning false for the !CONFIG_CLK_RZV2H case.
>
Agreed, I will add a static inline helper returning false.

> > +
> > +bool rzv2h_get_pll_div_pars(const struct rzv2h_pll_limits *limits,
> > +                           struct rzv2h_pll_div_pars *pars, u8 divider=
,
> > +                           u64 freq_millihz);
>
> Unused, please drop.
>
OK.

> > +
> > +bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
> > +                            struct rzv2h_pll_div_pars *pars,
> > +                            const u8 *table, u8 table_size, u64 freq_m=
illihz);
>
> Please add a dummy returning false for the !CONFIG_CLK_RZV2H case.
>
Agreed, I will add a static inline helper returning false.

> > +
> > +bool rzv2h_get_pll_dtable_pars(const struct rzv2h_pll_limits *limits,
> > +                              struct rzv2h_pll_div_pars *pars,
> > +                              const struct clk_div_table *dtable, u64 =
freq_millihz);
>
> Unused, please drop.
>
Ok.

Cheers,
Prabhakar
