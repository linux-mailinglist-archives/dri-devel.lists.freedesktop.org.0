Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D786EC60A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 08:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FA810E228;
	Mon, 24 Apr 2023 06:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [IPv6:2607:f8b0:4864:20::a35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ED410E228
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 06:12:45 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-4403aef7f1fso1399494e0c.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 23:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682316764; x=1684908764;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JgFvI+LxbVIm85f8BZpv/0ZWVUfXjU6FVdaXomGuv8g=;
 b=Tpt/gphztEtrApm4K78ADo1DrsbV8qnPLfoR7rdRiG/5EVNaMqe9v7M1FCxSanBZbP
 S27wSpQz6/nlgdF/3DLIt76XmLLeWz8q0RwcQJw7fA9Ml9tx9gxOOpIsjCS3UGpX17kN
 qhz8X9dtGC55Un1r27GsHe1QrwUBRh6Wnd+yA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682316764; x=1684908764;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JgFvI+LxbVIm85f8BZpv/0ZWVUfXjU6FVdaXomGuv8g=;
 b=QC/EGlsxVBNSvZxiFdpATwujss+l8cbzPwOdK7fOmJzkK4q+azjXIAIBdSZgCy+/+r
 frtw8B2xrAVzsVF+pJ0SyOdFJRndar7cNqz7tHaJ2DR30zRNE5d36z1p1+BoVvUwsmMd
 5hfTezsrZnWrx1tg6ghPT3kB+nOxGNacDB7jzdz1rn5DsgtoZm/H9NsmkOl1+W/A1fUi
 gxVqiftPJ3k7cg55z2ri41cyq2P5fVwpDDvaUcZEpp2/0A8DII1BFVNes2zGUIc9Z62H
 uxX5XEFQ053Y7CJtqGWQ1KpUos/wsmCfkZYPiCOHDH5P/gCUeV7ujTdRJQlTxTFD076e
 gnIg==
X-Gm-Message-State: AAQBX9ehEB8ofCGzxKUw5u5HoP0i7AAPVRB24xvY2o0ewHvkCENcDmbr
 hWYvmMTwqEpkDuaBwquUq0hjcx/g1C46cw3qxt3bgg==
X-Google-Smtp-Source: AKy350YVWyIkqN6pbUBvPQxbRUZAa0b2cmm33uMWfJEfs3lKehplJwEfC2Qb5jA7g8kUZ7eZdw0RlFNuecAdkY7Wyzc=
X-Received: by 2002:a1f:3dc4:0:b0:3ea:7af1:9ea4 with SMTP id
 k187-20020a1f3dc4000000b003ea7af19ea4mr2615252vka.12.1682316764548; Sun, 23
 Apr 2023 23:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230423121232.1345909-1-aford173@gmail.com>
 <20230423121232.1345909-5-aford173@gmail.com>
In-Reply-To: <20230423121232.1345909-5-aford173@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Apr 2023 14:12:33 +0800
Message-ID: <CAGXv+5GHcigEahCp+UefxR+AboF7i-kYJjiNftz8fPDLAZVMow@mail.gmail.com>
Subject: Re: [PATCH V2 4/6] drm: bridge: samsung-dsim: Dynamically configure
 DPHY timing
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
 dario.binacchi@amarulasolutions.com, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, m.szyprowski@samsung.com,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 23, 2023 at 8:13=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> The DPHY timings are currently hard coded. Since the input
> clock can be variable, the phy timings need to be variable
> too.  Add an additional variable to the driver data to enable
> this feature to prevent breaking boards that don't support it.
>
> The phy_mipi_dphy_get_default_config function configures the
> DPHY timings in pico-seconds, and a small macro converts those
> timings into clock cycles based on the pixel clock rate.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 79 +++++++++++++++++++++++----
>  include/drm/bridge/samsung-dsim.h     |  1 +
>  2 files changed, 70 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 5b6e7825b92f..f165483d5044 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -18,9 +18,7 @@
>  #include <linux/media-bus-format.h>
>  #include <linux/of_device.h>
>  #include <linux/phy/phy.h>
> -
>  #include <video/mipi_display.h>
> -
>  #include <drm/bridge/samsung-dsim.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
> @@ -218,6 +216,8 @@
>
>  #define OLD_SCLK_MIPI_CLK_NAME         "pll_clk"
>
> +#define PS_TO_CYCLE(PS, MHz) DIV64_U64_ROUND_CLOSEST(((PS) * (MHz)), 100=
0000000000ULL)
> +
>  static const char *const clk_names[5] =3D {
>         "bus_clk",
>         "sclk_mipi",
> @@ -487,6 +487,7 @@ static const struct samsung_dsim_driver_data imx8mm_d=
si_driver_data =3D {
>         .m_min =3D 64,
>         .m_max =3D 1023,
>         .vco_min =3D 1050,
> +       .dynamic_dphy =3D 1,
>  };
>
>  static const struct samsung_dsim_driver_data *
> @@ -698,13 +699,50 @@ static void samsung_dsim_set_phy_ctrl(struct samsun=
g_dsim *dsi)
>         const struct samsung_dsim_driver_data *driver_data =3D dsi->drive=
r_data;
>         const unsigned int *reg_values =3D driver_data->reg_values;
>         u32 reg;
> +       struct drm_display_mode *m =3D &dsi->mode;
> +       int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> +       struct phy_configure_opts_mipi_dphy cfg;
> +       int clk_prepare, lpx, clk_zero, clk_post, clk_trail;
> +       int hs_exit, hs_prepare, hs_zero, hs_trail;
> +       unsigned long long clock_in_hz =3D m->clock * 1000;
>
>         if (driver_data->has_freqband)
>                 return;
>
> +       /* The dynamic_phy has the ability to adjust PHY Timing settings =
*/
> +       if (driver_data->dynamic_dphy) {
> +               phy_mipi_dphy_get_default_config(clock_in_hz, bpp, dsi->l=
anes, &cfg);

This requires adding "select GENERIC_PHY_MIPI_DPHY" to DRM_SAMSUNG_DSIM,
otherwise with CONFIG_DRM_SAMSUNG_DSIM=3Dm:

ERROR: modpost: "phy_mipi_dphy_get_default_config"
[drivers/gpu/drm/bridge/samsung-dsim.ko] undefined!
make[5]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
make[4]: *** [Makefile:1978: modpost] Error 2
make[3]: *** [Makefile:357: __build_one_by_one] Error 2

I'm sure there'll be a similar error if CONFIG_DRM_SAMSUNG_DSIM=3Dy.

> +
> +               /*
> +                * TODO:
> +                * The tech reference manual for i.MX8M Mini/Nano/Plus
> +                * doesn't state what the definition of the PHYTIMING
> +                * bits are beyond their address and bit position.
> +                * After reviewing NXP's downstream code, it appears
> +                * that the various PHYTIMING registers take the number
> +                * of cycles and use various dividers on them.  This
> +                * calculation does not result in an exact match to the
> +                * downstream code, but it is very close, and it appears
> +                * to sync at a variety of resolutions. If someone
> +                * can get a more accurate mathematical equation needed
> +                * for these registers, this should be updated.
> +                */
> +
> +               lpx =3D PS_TO_CYCLE(cfg.lpx, clock_in_hz);
> +               hs_exit =3D PS_TO_CYCLE(cfg.hs_exit, clock_in_hz);
> +               clk_prepare =3D PS_TO_CYCLE(cfg.clk_prepare, clock_in_hz)=
;
> +               clk_zero =3D PS_TO_CYCLE(cfg.clk_zero, clock_in_hz);
> +               clk_post =3D PS_TO_CYCLE(cfg.clk_post, clock_in_hz);
> +               clk_trail =3D PS_TO_CYCLE(cfg.clk_trail, clock_in_hz);
> +               hs_prepare =3D PS_TO_CYCLE(cfg.hs_prepare, clock_in_hz);
> +               hs_zero =3D PS_TO_CYCLE(cfg.hs_zero, clock_in_hz);
> +               hs_trail =3D PS_TO_CYCLE(cfg.hs_trail, clock_in_hz);
> +       }
> +
>         /* B D-PHY: D-PHY Master & Slave Analog Block control */
>         reg =3D reg_values[PHYCTRL_ULPS_EXIT] | reg_values[PHYCTRL_VREG_L=
P] |
>                 reg_values[PHYCTRL_SLEW_UP];
> +
>         samsung_dsim_write(dsi, DSIM_PHYCTRL_REG, reg);
>
>         /*
> @@ -712,7 +750,11 @@ static void samsung_dsim_set_phy_ctrl(struct samsung=
_dsim *dsi)
>          * T HS-EXIT: Time that the transmitter drives LP-11 following a =
HS
>          *      burst
>          */
> -       reg =3D reg_values[PHYTIMING_LPX] | reg_values[PHYTIMING_HS_EXIT]=
;
> +       if (driver_data->dynamic_dphy)
> +               reg  =3D DSIM_PHYTIMING_LPX(lpx) | DSIM_PHYTIMING_HS_EXIT=
(hs_exit);
> +       else
> +               reg =3D reg_values[PHYTIMING_LPX] | reg_values[PHYTIMING_=
HS_EXIT];
> +
>         samsung_dsim_write(dsi, DSIM_PHYTIMING_REG, reg);
>
>         /*
> @@ -728,10 +770,17 @@ static void samsung_dsim_set_phy_ctrl(struct samsun=
g_dsim *dsi)
>          * T CLK-TRAIL: Time that the transmitter drives the HS-0 state a=
fter
>          *      the last payload clock bit of a HS transmission burst
>          */
> -       reg =3D reg_values[PHYTIMING_CLK_PREPARE] |
> -               reg_values[PHYTIMING_CLK_ZERO] |
> -               reg_values[PHYTIMING_CLK_POST] |
> -               reg_values[PHYTIMING_CLK_TRAIL];
> +       if (driver_data->dynamic_dphy) {
> +               reg =3D DSIM_PHYTIMING1_CLK_PREPARE(clk_prepare)  |
> +                     DSIM_PHYTIMING1_CLK_ZERO(clk_zero)        |
> +                     DSIM_PHYTIMING1_CLK_POST(clk_post)        |
> +                     DSIM_PHYTIMING1_CLK_TRAIL(clk_trail);
> +       } else {
> +               reg =3D reg_values[PHYTIMING_CLK_PREPARE] |
> +                     reg_values[PHYTIMING_CLK_ZERO] |
> +                     reg_values[PHYTIMING_CLK_POST] |
> +                     reg_values[PHYTIMING_CLK_TRAIL];
> +       }
>
>         samsung_dsim_write(dsi, DSIM_PHYTIMING1_REG, reg);
>
> @@ -744,8 +793,17 @@ static void samsung_dsim_set_phy_ctrl(struct samsung=
_dsim *dsi)
>          * T HS-TRAIL: Time that the transmitter drives the flipped diffe=
rential
>          *      state after last payload data bit of a HS transmission bu=
rst
>          */
> -       reg =3D reg_values[PHYTIMING_HS_PREPARE] | reg_values[PHYTIMING_H=
S_ZERO] |
> -               reg_values[PHYTIMING_HS_TRAIL];
> +
> +       if (driver_data->dynamic_dphy) {
> +               reg =3D DSIM_PHYTIMING2_HS_PREPARE(hs_prepare) |
> +                     DSIM_PHYTIMING2_HS_ZERO(hs_zero) |
> +                     DSIM_PHYTIMING2_HS_TRAIL(hs_trail);
> +       } else {
> +               reg =3D reg_values[PHYTIMING_HS_PREPARE] |
> +                     reg_values[PHYTIMING_HS_ZERO] |
> +                     reg_values[PHYTIMING_HS_TRAIL];
> +       }
> +
>         samsung_dsim_write(dsi, DSIM_PHYTIMING2_REG, reg);
>  }
>
> @@ -1337,7 +1395,8 @@ static int samsung_dsim_init(struct samsung_dsim *d=
si)
>         samsung_dsim_enable_clock(dsi);
>         if (driver_data->wait_for_reset)
>                 samsung_dsim_wait_for_reset(dsi);
> -       samsung_dsim_set_phy_ctrl(dsi);
> +       if (!driver_data->has_freqband)
> +               samsung_dsim_set_phy_ctrl(dsi);
>         samsung_dsim_init_link(dsi);
>
>         dsi->state |=3D DSIM_STATE_INITIALIZED;
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsu=
ng-dsim.h
> index a088d84579bc..25475d78adb3 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -62,6 +62,7 @@ struct samsung_dsim_driver_data {
>         u16 m_min;
>         u16 m_max;
>         u64 vco_min;
> +       bool dynamic_dphy;
>  };
>
>  struct samsung_dsim_host_ops {
> --
> 2.39.2
>
