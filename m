Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F778C453F
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 18:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002B510E36D;
	Mon, 13 May 2024 16:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gXBlPQP7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A1410E36D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:47:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DB1B160ECF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479A7C4AF10
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715618874;
 bh=h7vzUvX2zQjQBOkrXlrxjwi+zJ42g7c9kQixCI/jlBc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gXBlPQP7bjFzZ7zeaHdl9SR8wlDp9uy96SS87szMkJSCJwB97aXQ3JZsL+tloHMrG
 FXw9KKWJpzLp11AplWRk2x+l7NvdA65w9EXu2tDnWBBHMl9I/2bRNMXvRUVY15w/md
 Md/yv6Lta6v+MRRbz5EyqXBLarppqqivttRd8djmicJXeDFR/QuTQnYnqpKVjR/DqH
 CxOGYGgP0KxW444fhddNFNYgRBtTBUSesg6zalzfgDzqD4PppgOE0Tt9ulXsAl+0ko
 VPQeQrb635vn5MCBsgwLgquGT6V/SYE/AiQnk9/KB5Tvn7d8kFHxUP35hwKMAKGr24
 h5UsbLuXXCADg==
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-de603e3072dso5127049276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 09:47:54 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywz7GWFJ/IToBp2LmcVoHtH+6Ptnk0IwHMtds+BTXhruUM5Dqrb
 sFQF9S1zJuKB4w6dI3XUySlfW3hZE+vZL+jI+M0caJlyVzWjk4DbWBZSS5JRw6XD3hGsLmkHBS6
 J38XmtHBkH2N/LJuqU10f9st4PW81+OU++xzKBw==
X-Google-Smtp-Source: AGHT+IEMxbT5eJCwu3xFH9rNUmu0w1maM2+wG0e3i72OCAq0YZOeQIXmG8UmixcPkN7EqF1ReC7YxsNOT2o5LC4PX8w=
X-Received: by 2002:a05:6902:206:b0:de5:5bca:ecb0 with SMTP id
 3f1490d57ef6-dee4f0e529amr8815457276.0.1715618873393; Mon, 13 May 2024
 09:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240513021607.129111-1-marex@denx.de>
In-Reply-To: <20240513021607.129111-1-marex@denx.de>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 13 May 2024 18:47:42 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7cwjn2h_Fqde7fytBi7k-UB7P16nEz+eYsnR6DOqXVMQ@mail.gmail.com>
Message-ID: <CAN6tsi7cwjn2h_Fqde7fytBi7k-UB7P16nEz+eYsnR6DOqXVMQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: tc358767: Enable FRMSYNC timing generator
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Adam Ford <aford173@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
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

On Mon, May 13, 2024 at 4:16=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> TC9595 datasheet Video Path0 Control (VPCTRL0) Register bit FRMSYNC descr=
iption
> says "This bit should be disabled only in video mode transmission where H=
ost
> transmits video timing together with video data and where pixel clock sou=
rce
> is from DSI clock." . This driver always sources pixel clock from externa=
l xtal,
> therefore the FRMSYNC bit must always be enabled, enable it.
>
> This fixes an actual issue with DSI-to-DPI mode, where the display would
> randomly show subtle pixel flickering, or wobble, or shimmering. This is
> visible on solid gray color, but the degree of the shimmering differs
> between boots, which makes it hard to debug.
>
> There is a caveat to the FRMSYNC and this bridge pixel PLL, which can onl=
y
> generate pixel clock with limited accuracy, it may therefore be necessary
> to reduce the HFP to fit into line length of input pixel data, to avoid a=
ny
> possible overflows, which make the output video look striped horizontally=
.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Michael Walle <mwalle@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: kernel@dh-electronics.com
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index 166f9a3e9622d..fe2b93546eaef 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -382,6 +382,9 @@ struct tc_data {
>
>         /* HPD pin number (0 or 1) or -ENODEV */
>         int                     hpd_pin;
> +
> +       /* Number of pixels to subtract from a line due to pixel clock de=
lta */
> +       u32                     line_pixel_subtract;
>  };
>
>  static inline struct tc_data *aux_to_tc(struct drm_dp_aux *a)
> @@ -577,6 +580,11 @@ static int tc_pllupdate(struct tc_data *tc, unsigned=
 int pllctrl)
>         return 0;
>  }
>
> +static u32 div64_round_up(u64 v, u32 d)
> +{
> +       return div_u64(v + d - 1, d);
> +}
> +

Could the DIV_ROUND_UP macro in math,h replace this function?

>  static int tc_pxl_pll_en(struct tc_data *tc, u32 refclk, u32 pixelclock)
>  {
>         int ret;
> @@ -658,8 +666,11 @@ static int tc_pxl_pll_en(struct tc_data *tc, u32 ref=
clk, u32 pixelclock)
>                 return -EINVAL;
>         }
>
> -       dev_dbg(tc->dev, "PLL: got %d, delta %d\n", best_pixelclock,
> -               best_delta);
> +       tc->line_pixel_subtract =3D tc->mode.htotal -
> +               div64_round_up(tc->mode.htotal * (u64)best_pixelclock, pi=
xelclock);
> +
> +       dev_dbg(tc->dev, "PLL: got %d, delta %d (subtract %d px)\n", best=
_pixelclock,
> +               best_delta, tc->line_pixel_subtract);
>         dev_dbg(tc->dev, "PLL: %d / %d / %d * %d / %d\n", refclk,
>                 ext_div[best_pre], best_div, best_mul, ext_div[best_post]=
);
>
> @@ -885,6 +896,12 @@ static int tc_set_common_video_mode(struct tc_data *=
tc,
>                 upper_margin, lower_margin, vsync_len);
>         dev_dbg(tc->dev, "total: %dx%d\n", mode->htotal, mode->vtotal);
>
> +       if (right_margin > tc->line_pixel_subtract) {
> +               right_margin -=3D tc->line_pixel_subtract;
> +       } else {
> +               dev_err(tc->dev, "Bridge pixel clock too slow for mode\n"=
);
> +               right_margin =3D 0;
> +       }
>
>         /*
>          * LCD Ctl Frame Size
> @@ -894,7 +911,7 @@ static int tc_set_common_video_mode(struct tc_data *t=
c,
>          */
>         ret =3D regmap_write(tc->regmap, VPCTRL0,
>                            FIELD_PREP(VSDELAY, right_margin + 10) |
> -                          OPXLFMT_RGB888 | FRMSYNC_DISABLED | MSF_DISABL=
ED);
> +                          OPXLFMT_RGB888 | FRMSYNC_ENABLED | MSF_DISABLE=
D);
>         if (ret)
>                 return ret;
>
> --
> 2.43.0
>

With the above question resolved, feel free to add my r-b. I will
snooze this for a week before looking at applying this.

Reviewed-by: Robert Foss <rfoss@kernel.org>
