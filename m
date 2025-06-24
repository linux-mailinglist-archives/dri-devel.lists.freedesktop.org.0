Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB3FAE6A9E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 17:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496A410E5CA;
	Tue, 24 Jun 2025 15:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X1KW/SJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380E510E5CA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 15:21:33 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so44144405e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 08:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750778492; x=1751383292; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jMQmruM3IB4kG0gbsMC5BfGaSKgwq+QzSOZlCSJ2EU4=;
 b=X1KW/SJgqHVSaVfielka9H10VXtAL5wwLRfMn+jiLW6PE/gg4DyGeEdVvV8jo0sxTp
 jIn1PulZUN331qWCk/iC1ahEHt5Dyy6LXRHmf3XzMTn8gaY3zT8ARbs/v2YaOjE/sjrz
 tKRRKdnQUMLKF5mdKzGIQZanLBAOObA4ns6a94lAUeU69iXLysEA11UO+9m1uz9v/FTn
 4APy3ZXrD0y2BbOKWThKEy39vDdjtR0QC+Gxb4ZcniqqqNbBKMenSV0j1F+tvN7J7WmO
 Ei/5K/G6k5TIamjrbUpWMeZCnVdNnV1PfcOI4hG5LZtX5TnTML3E3w1nj4fCGdMoWYxw
 VpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750778492; x=1751383292;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jMQmruM3IB4kG0gbsMC5BfGaSKgwq+QzSOZlCSJ2EU4=;
 b=exDzyQQ8aLBTFavYXkH0Wt74y+Zv3R38pdfIGLxHr2NYUvhhOli1HlgYWHI2QUODJV
 UobsRoktuJtTICOsGNYqyEWUXnYYOqQ1W/tF2aIS1lX7EULZkNP9TJaGqNtB8qbn2MG5
 8e1Z8pnkK23B1sij9oN1LOigqvbACiqvRYz/IeBb9GPV8JMHby1xiRLUNteeT4Y50U/Y
 7U4t6zJJWDpSdxDmqMhSSdIk2X2pJn0v+XiqWMRL44/2S2UYS+72hinxxXMCRir0ZiNX
 +OZp6hgPnoTelDlaKfFWfsClbjAJWwYVrnl+2hip7MYtl71H4AiplKr57QDeiDejQ2jY
 z7zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXte9KYWJFNZoHJUnD/it2LyInh3YIHt/lCvfm+fEzMclTxfUIuLy0zLee+ibnH7RMHAKfbsYfHKBg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAlLIj7J1AkCmG8ZOt1plUrEqLb7sLIK+WpzJDXScbThaOrbX3
 D+vAdBsPB5nR5xbxukLus2C1OJNxdGo3/YiL2vFiulPneFpxOGRbWaWzJeOhgSfWzqX4s1L+PUF
 OfD/Sl4oAH4LSARkzY14Y9qdE7f0zH8Q=
X-Gm-Gg: ASbGncvMRYRl66ZUIBI21dptr3BHx4QZ605ckWqmREwHEONIr0MVnDva4qoduIHliVg
 b8z9o02LEs7UO7Ia8kEk5j6peQlshWVQdq76xTrvn0ay6gDSoWTav3Y3fbqK5gNTtb84Vj9Blqk
 sCwM6txq1VByaEl0RTZuS/JRkTFUeBZe5cJjxx80ULoprlkQ==
X-Google-Smtp-Source: AGHT+IG2+Lg1aisOevhHRbc5PY9kM66PyJertGShxjtM2Dy5bu0Y6xACQsLOOlAZtYKJLZtlIxN0gyX5pgYwSJxE7+8=
X-Received: by 2002:a05:600c:1991:b0:444:c28f:e81a with SMTP id
 5b1f17b1804b1-453659f5888mr144680775e9.27.1750778491339; Tue, 24 Jun 2025
 08:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530171841.423274-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB1134654039BA3BAB5DA8C0BB08677A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tSMt9SaHAdeEd4vj=QmaDz5bMd4hwJUCx_mBF8-mw2kw@mail.gmail.com>
 <TY3PR01MB1134671558883AAE2C3E0A2C78672A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB1134657A6D7A36FC387938AF7867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134657A6D7A36FC387938AF7867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 24 Jun 2025 16:21:04 +0100
X-Gm-Features: Ac12FXyQhJvTm3Vt5IE8okL9cJwCx1ROPfDGJLKpKmizT9GNro2NPH4XIHLGGPU
Message-ID: <CA+V-a8tUJtABWs5d=9aHJVSY25U5zWt9xE-Ogz5mVYuC8CwVRA@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi Biju,

On Thu, Jun 19, 2025 at 6:05=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Biju Das
> > Sent: 18 June 2025 14:26
> > Subject: RE: [PATCH v6 1/4] clk: renesas: rzv2h-cpg: Add support for DS=
I clocks
> >
> > Hi Prabhakar,
> >
> > > -----Original Message-----
> > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf O=
f
> > > Lad, Prabhakar
> > > Sent: 16 June 2025 11:45
> > > Subject: Re: [PATCH v6 1/4] clk: renesas: rzv2h-cpg: Add support for
> > > DSI clocks
> > >
> > > Hi Biju,
> > >
> > > Thank you for the review.
> > >
> > > On Fri, Jun 13, 2025 at 6:57=E2=80=AFAM Biju Das <biju.das.jz@bp.rene=
sas.com> wrote:
> > > >
> > > > Hi Prabhakar,
> > > >
> > > > > -----Original Message-----
> > > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > > Sent: 30 May 2025 18:19
> > > > .castro.jz@renesas.com>; Prabhakar Mahadev Lad <prabhakar.mahadev-
> > > > > lad.rj@bp.renesas.com>
> > > > > Subject: [PATCH v6 1/4] clk: renesas: rzv2h-cpg: Add support for
> > > > > DSI clocks
> > > > >
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > Add support for PLLDSI and PLLDSI divider clocks.
> > > > >
> > > > > Introduce the `renesas-rzv2h-dsi.h` header to centralize and shar=
e
> > > > > PLLDSI-related data structures, limits, and algorithms between th=
e RZ/V2H CPG and DSI drivers.
> > > > >
> > > > > The DSI PLL is functionally similar to the CPG's PLLDSI, but has
> > > > > slightly different parameter limits and omits the programmable
> > > > > divider present in CPG. To ensure precise frequency
> > > > > calculations-especially for milliHz-level accuracy needed by the
> > > > > DSI driver-the shared algorithm
> > > allows both drivers to compute PLL parameters consistently using the =
same logic and input clock.
> > > > >
> > > > > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > > > Signed-off-by: Lad Prabhakar
> > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > ---
> > > > > v5->v6:
> > > > > - Renamed CPG_PLL_STBY_SSCGEN_WEN to CPG_PLL_STBY_SSC_EN_WEN
> > > > > - Updated CPG_PLL_CLK1_DIV_K, CPG_PLL_CLK1_DIV_M, and
> > > > >   CPG_PLL_CLK1_DIV_P macros to use GENMASK
> > > > > - Updated req->rate in rzv2h_cpg_plldsi_div_determine_rate()
> > > > > - Dropped the cast in rzv2h_cpg_plldsi_div_set_rate()
> > > > > - Dropped rzv2h_cpg_plldsi_round_rate() and implemented
> > > > >   rzv2h_cpg_plldsi_determine_rate() instead
> > > > > - Made use of FIELD_PREP()
> > > > > - Moved CPG_CSDIV1 macro in patch 2/4
> > > > > - Dropped two_pow_s in rzv2h_dsi_get_pll_parameters_values()
> > > > > - Used mul_u32_u32() while calculating output_m and output_k_rang=
e
> > > > > - Used div_s64() instead of div64_s64() while calculating
> > > > >   pll_k
> > > > > - Used mul_u32_u32() while calculating fvco and fvco checks
> > > > > - Rounded the final output using DIV_U64_ROUND_CLOSEST()
> > > > >
> > > > > v4->v5:
> > > > > - No changes
> > > > >
> > > > > v3->v4:
> > > > > - Corrected parameter name in rzv2h_dsi_get_pll_parameters_values=
()
> > > > >   description freq_millihz
> > > > >
> > > > > v2->v3:
> > > > > - Update the commit message to clarify the purpose of `renesas-rz=
v2h-dsi.h`
> > > > >   header
> > > > > - Used mul_u32_u32() in rzv2h_cpg_plldsi_div_determine_rate()
> > > > > - Replaced *_mhz to *_millihz for clarity
> > > > > - Updated u64->u32 for fvco limits
> > > > > - Initialized the members in declaration order for
> > > > >   RZV2H_CPG_PLL_DSI_LIMITS() macro
> > > > > - Used clk_div_mask() in rzv2h_cpg_plldsi_div_recalc_rate()
> > > > > - Replaced `unsigned long long` with u64
> > > > > - Dropped rzv2h_cpg_plldsi_clk_recalc_rate() and reused
> > > > >   rzv2h_cpg_pll_clk_recalc_rate() instead
> > > > > - In rzv2h_cpg_plldsi_div_set_rate() followed the same style
> > > > >   of RMW-operation as done in the other functions
> > > > > - Renamed rzv2h_cpg_plldsi_set_rate() to rzv2h_cpg_pll_set_rate()
> > > > > - Dropped rzv2h_cpg_plldsi_clk_register() and reused
> > > > >   rzv2h_cpg_pll_clk_register() instead
> > > > > - Added a gaurd in renesas-rzv2h-dsi.h header
> > > > >
> > > > > v1->v2:
> > > > > - No changes
> > > > > ---
> > > > >  drivers/clk/renesas/rzv2h-cpg.c       | 278 ++++++++++++++++++++=
+++++-
> > > > >  drivers/clk/renesas/rzv2h-cpg.h       |  13 ++
> > > > >  include/linux/clk/renesas-rzv2h-dsi.h | 210 +++++++++++++++++++
> > > > >  3 files changed, 492 insertions(+), 9 deletions(-)  create mode
> > > > > 100644 include/linux/clk/renesas- rzv2h-dsi.h
> > > > >
> > > > > diff --git a/drivers/clk/renesas/rzv2h-cpg.c
> > > > > b/drivers/clk/renesas/rzv2h-cpg.c index
> > > > > 761da3bf77ce..d590f9f47371 100644
> > > > > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > > > > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > > > > @@ -14,9 +14,13 @@
> > > > >  #include <linux/bitfield.h>
> > > > >  #include <linux/clk.h>
> > > > >  #include <linux/clk-provider.h>
> > > > > +#include <linux/clk/renesas-rzv2h-dsi.h>
> > > > >  #include <linux/delay.h>
> > > > >  #include <linux/init.h>
> > > > >  #include <linux/iopoll.h>
> > > > > +#include <linux/math.h>
> > > >
> > > >
> > > >
> > > > > +     req->rate =3D
> > > > > + DIV_ROUND_CLOSEST_ULL(dsi_dividers->freq_millihz,
> > > > > + MILLI);
> > > > > +
> > > > > +     return 0;
> > > > > +};
> > > > > +
> > > > > +static int rzv2h_cpg_plldsi_div_set_rate(struct clk_hw *hw,
> > > > > +                                      unsigned long rate,
> > > > > +                                      unsigned long parent_rate)=
 {
> > > > > +     struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(=
hw);
> > > > > +     struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > > > > +     struct rzv2h_plldsi_parameters *dsi_dividers =3D &priv->pll=
dsi_div_parameters;
> > > > > +     struct ddiv ddiv =3D dsi_div->ddiv;
> > > > > +     const struct clk_div_table *clkt;
> > > > > +     bool div_found =3D false;
> > > > > +     u32 val, shift, div;
> > > > > +
> > > > > +     div =3D dsi_dividers->csdiv;
> > > > > +     for (clkt =3D dsi_div->dtable; clkt->div; clkt++) {
> > > > > +             if (clkt->div =3D=3D div) {
> > > > > +                     div_found =3D true;
> > > > > +                     break;
> > > > > +             }
> > > > > +     }
> > > > > +
> > > > > +     if (!div_found)
> > > > > +             return -EINVAL;
> > > >
> > > > This check can be done in determine rate and cache the divider??
> > > >
> > > Ok, I'll drop this check as the divider is already cached. The for
> > > loop above is to determine the val which is used below to program the=
 registers.
> >
> > If you are caching actual divider value, then the check is not required=
 here.
> > Otherwise the above code is fine.
> >
> > Assume the csdiv you found, have no corresponding match in the table.
>
>
> 1) By looking at RZ/G3E, can we make this code more scalable?
>
> RZ/G3E has 2 PLL-DSI's
> PLL-DSI1 supports DUAL LVDS, Single LVDS and DSI
> PLL-DSI2 supports single LVDS,  DPI and DSI
>
Sure, I'll make it more scalable.

> In total there will be 4 limit tables (DSI, single LVDS, Dual LVDS and DP=
I)
>
> Based on the display output, each PLL needs to pick the appropriate limit=
 table
> to compute PLL parameters.
>
> 2) Can we drop DSI divider limits from the limit table and use the values=
 from dsi divider table
>    itself which is passed in DEF_PLLDSI_DIV?
>
Sure, I will do that.

Cheers,
Prabhakar
