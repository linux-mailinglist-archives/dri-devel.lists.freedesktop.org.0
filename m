Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 548097043EC
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 05:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BF310E1A8;
	Tue, 16 May 2023 03:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10F210E1A8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 03:26:16 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-77d46c7dd10so1650297241.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 20:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684207575; x=1686799575;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F5lwx9Jf07i09UJuTXUkKPSduss3VnLZfVldzH8agBY=;
 b=PgM1jKoPYp/WcFdxHutBCUIjnDa0d/Zi/7j2JnmgRx3Ylgct09kATGYCfxn572oeqp
 KTAp9SY/StmCmaRrHFxqG9IKXk6srLkjsszKL0D0xd3dlFPngcTrTe7VIJNL+CM6GS3E
 xTsJMZqrsfgflj8rD6G+PfvY7dlqFQzmnylFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684207575; x=1686799575;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F5lwx9Jf07i09UJuTXUkKPSduss3VnLZfVldzH8agBY=;
 b=cRgvrhbUWoVKTv/sNfC59PqQdF8QI8hJA++12oYgGzQHF1NOZvgB0jP/varQhBRHU9
 ghAUTg6Zq1yh8EvAgoczeF0B0eOM/YXCGibjSepgliptEqwfzYbfdbhKQbyBRHIf/5oT
 8SChum6m28qfBBW0S3xd4ygrUVKpL83vmM3WnuZhGAEt242LLTOpfULgwGaD7TyUrpTz
 ZCdIYRvyFnWq/WrvCjA0cvfy5ARzH35mRwTjRQ62V/iT/rPrQS98nDT2xdANC66Ighwm
 j4HWUbTC57OtWLXiXeW009WtRgnmm9wK5869CvjjPzLcXpcHxoPdm6KKdnkA/myqjKSf
 89MA==
X-Gm-Message-State: AC+VfDxxR4Nj68SK5JFdL/Ia64/K8v3g+ItElBo73Mde32HHwzlDTNSR
 6YXMOSsrR23nQRdwoFvd34jGvF81/PVstxhcWwGWBw==
X-Google-Smtp-Source: ACHHUZ5erLgUarQCkUtKfKybfPcSlj7g9pdBXtQEW1xJT0qRyMLNAVKQS7MyKDcQijob+hEvN3uRyr241Ur4ezpJX6E=
X-Received: by 2002:a1f:5c90:0:b0:440:4946:fac with SMTP id
 q138-20020a1f5c90000000b0044049460facmr13239709vkb.4.1684207575548; Mon, 15
 May 2023 20:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230515235713.232939-1-aford173@gmail.com>
 <20230515235713.232939-7-aford173@gmail.com>
In-Reply-To: <20230515235713.232939-7-aford173@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 16 May 2023 11:26:04 +0800
Message-ID: <CAGXv+5EDYvjOiAWDnQsrrp=0iWm54N+pR3O43xDFXYE=UxAw-g@mail.gmail.com>
Subject: Re: [PATCH V6 6/6] drm: bridge: samsung-dsim: Support non-burst mode
To: Adam Ford <aford173@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 7:57=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
>
> The high-speed clock is hard-coded to the burst-clock
> frequency specified in the device tree.  However, when
> using devices like certain bridge chips without burst mode
> and varying resolutions and refresh rates, it may be
> necessary to set the high-speed clock dynamically based
> on the desired pixel clock for the connected device.
>
> This also removes the need to set a clock speed from
> the device tree for non-burst mode operation, since the
> pixel clock rate is the rate requested from the attached
> device like a bridge chip.  This should have no impact
> for people using burst-mode and setting the burst clock
> rate is still required for those users.  If the burst
> clock is not present, change the error message to
> dev_info indicating the clock use the pixel clock.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 3944b7cfbbdf..03b21d13f067 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -655,16 +655,28 @@ static unsigned long samsung_dsim_set_pll(struct sa=
msung_dsim *dsi,
>
>         dsi->hs_clock =3D fout;
>
> +       dsi->hs_clock =3D fout;
> +

Not sure about the double assignment. Was this caused by a rebase?

ChenYu

>         return fout;
>  }
>
>  static int samsung_dsim_enable_clock(struct samsung_dsim *dsi)
>  {
> -       unsigned long hs_clk, byte_clk, esc_clk;
> +       unsigned long hs_clk, byte_clk, esc_clk, pix_clk;
>         unsigned long esc_div;
>         u32 reg;
> +       struct drm_display_mode *m =3D &dsi->mode;
> +       int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> +
> +       /* m->clock is in KHz */
> +       pix_clk =3D m->clock * 1000;
> +
> +       /* Use burst_clk_rate if available, otherwise use the pix_clk */
> +       if (dsi->burst_clk_rate)
> +               hs_clk =3D samsung_dsim_set_pll(dsi, dsi->burst_clk_rate)=
;
> +       else
> +               hs_clk =3D samsung_dsim_set_pll(dsi, DIV_ROUND_UP(pix_clk=
 * bpp, dsi->lanes));
>
> -       hs_clk =3D samsung_dsim_set_pll(dsi, dsi->burst_clk_rate);
>         if (!hs_clk) {
>                 dev_err(dsi->dev, "failed to configure DSI PLL\n");
>                 return -EFAULT;
> @@ -935,7 +947,7 @@ static void samsung_dsim_set_display_mode(struct sams=
ung_dsim *dsi)
>         u32 reg;
>
>         if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> -               int byte_clk_khz =3D dsi->burst_clk_rate / 1000 / 8;
> +               int byte_clk_khz =3D dsi->hs_clock / 1000 / 8;
>                 int hfp =3D (m->hsync_start - m->hdisplay) * byte_clk_khz=
 / m->clock;
>                 int hbp =3D (m->htotal - m->hsync_end) * byte_clk_khz / m=
->clock;
>                 int hsa =3D (m->hsync_end - m->hsync_start) * byte_clk_kh=
z / m->clock;
> @@ -1785,10 +1797,13 @@ static int samsung_dsim_parse_dt(struct samsung_d=
sim *dsi)
>                         return PTR_ERR(pll_clk);
>         }
>
> +       /* If it doesn't exist, use pixel clock instead of failing */
>         ret =3D samsung_dsim_of_read_u32(node, "samsung,burst-clock-frequ=
ency",
> -                                      &dsi->burst_clk_rate, 0);
> -       if (ret < 0)
> -               return ret;
> +                                      &dsi->burst_clk_rate, 1);
> +       if (ret < 0) {
> +               dev_info(dev, "Using pixel clock for HS clock frequency\n=
");
> +               dsi->burst_clk_rate =3D 0;
> +       }
>
>         ret =3D samsung_dsim_of_read_u32(node, "samsung,esc-clock-frequen=
cy",
>                                        &dsi->esc_clk_rate, 0);
> --
> 2.39.2
>
