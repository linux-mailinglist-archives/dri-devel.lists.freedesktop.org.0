Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EC86F87C8
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 19:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020CB10E642;
	Fri,  5 May 2023 17:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06A410E029
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 17:39:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 507DC612A8
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 17:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA8DC433A8
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 17:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683308352;
 bh=He2VD5WDJqObFt05b2FpAEZOvPVyPfhb6478Y3/8MxY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eQYJY2iF5yjQC7rU1s/b490L/utwiGhyxd+4mDES2GFaugkxpHqeRv5PaEJRitgXc
 xVswx8FbPQorgmnLl+ReF5FFefbX+yeRR/jMEbhmWVwtCVtkpGxxiSr+Kpm3cI6jsT
 8SEzZFk6CG4t//A8Z4tqO02jj9ZXVv4dBpwHOqySvQFLonXHn2alAaOgjK0E4Vl3YO
 JfQT8QeAp+yqtySUfwI9AehFyJj2lcdKzeim29E4DFcngvKy7KrXtwZat/cra7I96U
 LcWjd5t+Gu+qlRWy8VYvEBdS+n3HVaAIOt6j8BXHj64aaJhzskp4ZlOxCLrLsdfrQQ
 7Kr7nQc0KEnBg==
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-518d325b8a2so1825121a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 10:39:12 -0700 (PDT)
X-Gm-Message-State: AC+VfDygwLo1Yhs9zNM4xTi0tB6dgLty5zPK32pwAcHjGcXJ/ErnhwuE
 ZzK+ydhuCzEqHewpEArS4c9cQfRmAUMe32e8Q1G8Dw==
X-Google-Smtp-Source: ACHHUZ4Srhe0cJpjgons5yFqosWk+nmV6h5CJkAZUs0SS+EYfHlmueEYNFOMB1s8KLFPSPTA2LJj9MO5MZNVlWjyVGo=
X-Received: by 2002:a17:90a:8e83:b0:250:3e1e:acd with SMTP id
 f3-20020a17090a8e8300b002503e1e0acdmr985112pjo.7.1683308351652; Fri, 05 May
 2023 10:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230427142934.55435-1-francesco@dolcini.it>
 <20230427142934.55435-4-francesco@dolcini.it>
In-Reply-To: <20230427142934.55435-4-francesco@dolcini.it>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 5 May 2023 19:39:00 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5fBur-WSd5xN-=yyFDGiUWEq-U9=xXbYRSqzdeo8CxLw@mail.gmail.com>
Message-ID: <CAN6tsi5fBur-WSd5xN-=yyFDGiUWEq-U9=xXbYRSqzdeo8CxLw@mail.gmail.com>
Subject: Re: [PATCH v1 3/9] drm/bridge: tc358768: fix PLL target frequency
To: Francesco Dolcini <francesco@dolcini.it>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 27, 2023 at 4:32=E2=80=AFPM Francesco Dolcini <francesco@dolcin=
i.it> wrote:
>
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> Correctly compute the PLL target frequency, the current formula works
> correctly only when the input bus width is 24bit, actually to properly
> compute the PLL target frequency what is relevant is the bits-per-pixel
> on the DSI link.
>
> No regression expected since the DSI format is currently hard-coded as
> MIPI_DSI_FMT_RGB888.
>
> Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/t=
c358768.c
> index e9e3f9e02bba..dba1bf3912f1 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -146,6 +146,7 @@ struct tc358768_priv {
>
>         u32 pd_lines; /* number of Parallel Port Input Data Lines */
>         u32 dsi_lanes; /* number of DSI Lanes */
> +       u32 dsi_bpp; /* number of Bits Per Pixel over DSI */
>
>         /* Parameters for PLL programming */
>         u32 fbd;        /* PLL feedback divider */
> @@ -284,12 +285,12 @@ static void tc358768_hw_disable(struct tc358768_pri=
v *priv)
>
>  static u32 tc358768_pll_to_pclk(struct tc358768_priv *priv, u32 pll_clk)
>  {
> -       return (u32)div_u64((u64)pll_clk * priv->dsi_lanes, priv->pd_line=
s);
> +       return (u32)div_u64((u64)pll_clk * priv->dsi_lanes, priv->dsi_bpp=
);
>  }
>
>  static u32 tc358768_pclk_to_pll(struct tc358768_priv *priv, u32 pclk)
>  {
> -       return (u32)div_u64((u64)pclk * priv->pd_lines, priv->dsi_lanes);
> +       return (u32)div_u64((u64)pclk * priv->dsi_bpp, priv->dsi_lanes);
>  }
>
>  static int tc358768_calc_pll(struct tc358768_priv *priv,
> @@ -426,6 +427,7 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_h=
ost *host,
>         priv->output.panel =3D panel;
>
>         priv->dsi_lanes =3D dev->lanes;
> +       priv->dsi_bpp =3D mipi_dsi_pixel_format_to_bpp(dev->format);
>
>         /* get input ep (port0/endpoint0) */
>         ret =3D -EINVAL;
> @@ -437,7 +439,7 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_h=
ost *host,
>         }
>
>         if (ret)
> -               priv->pd_lines =3D mipi_dsi_pixel_format_to_bpp(dev->form=
at);
> +               priv->pd_lines =3D priv->dsi_bpp;
>
>         drm_bridge_add(&priv->bridge);
>
> --
> 2.25.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
