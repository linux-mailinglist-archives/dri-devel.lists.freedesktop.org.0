Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A9C419F02
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 21:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522FF6E02E;
	Mon, 27 Sep 2021 19:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CCF6E02E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 19:18:09 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id n17so19339809vsr.10
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 12:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5Jsv32VfU5hBBVE/3KBDNXL1joUgiLLTxTYv11HZBOw=;
 b=hKLSuiRjl5puCUN7GmUGuprTq2dlTRXFw9ors+IsTcufm2RiSe+htT5nuUtE57JMYi
 YvydtcHyipu6ObND9WDIo/pgGcB4pWbgXKYH/3U4RwDLmGvI1iL8wLuSZksxe8U0x7kF
 sER3zy1z2RkzTd8LMHvPhJEOpJICuO6badaqm3Do5ZX5l+R4qIwC4iyt3BdRIC/AHF/e
 lmCNBPwB/Mg/oS1aUULs+w2yByruCwmuFRx2+xkJvO7ENUw6OIlU9Zs82AuNFydjhTs9
 3PeY++el/5NhZW181tnTCMdgkV+VFGzKGmmx8QWWlq0hCSxqurdRTUv+1f/OyLpiQw0z
 46Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5Jsv32VfU5hBBVE/3KBDNXL1joUgiLLTxTYv11HZBOw=;
 b=wtgifIhTIPa+XUg3js291+gr1BD8CP26AOulDFcNlMX7HF9wC62hIeJ6cWFUgYiYHb
 wofas+XOJ6vJTSwPdNp2LFiSSLtBuoolZ86nvx+VcDx+7nQ29xMugdyKZs4plCsXMAeB
 aSVW0VUG/Q4T9WGwhj1GIdC43fhDOK07hrkggyPFg0laqlgqW9HGA8mpjnnwTxnlSKC6
 6I6vzyRuZZMjCtdmsmCHiu/tUBRkp7o36/g9mdzlYLcOuryozmcdcYVLPv6PMVKSVk1d
 IktYWUyI+j912AFqqvxUKFn9fynKHh4hpYeHmhFz0Y2OhUo7cBLafjx0//5HWr76MJQW
 BNtg==
X-Gm-Message-State: AOAM5311bIfhF2r7NZg/JDA/D4IjXHh/YwPsFotaIQ3uHqsM23dnBgPT
 sl/7EtkfnDc9MVXZ4Qcf2IwaTFa/9ljMO0uc6dg=
X-Google-Smtp-Source: ABdhPJyIdI5dIgMfDZhLLkDgOk/YLsWKuK6ti6v6hc2gXUdp2QXsIkfUi1gy49q80Ng2nFf1JZ0wd1/tOp+ynYphDN4=
X-Received: by 2002:a67:ab04:: with SMTP id u4mr1667828vse.12.1632770288152;
 Mon, 27 Sep 2021 12:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210927175944.3381314-1-briannorris@chromium.org>
 <20210927105928.v2.1.Ic2904d37f30013a7f3d8476203ad3733c186827e@changeid>
In-Reply-To: <20210927105928.v2.1.Ic2904d37f30013a7f3d8476203ad3733c186827e@changeid>
From: Tom Hebb <tommyhebb@gmail.com>
Date: Mon, 27 Sep 2021 12:17:57 -0700
Message-ID: <CAMcCCgS_r17Lj_qPX9TdH3=7D_tiXu9OzL=dDNS+9MZyOUv-+Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/rockchip: dsi: Hold pm-runtime across
 bind/unbind
To: Brian Norris <briannorris@chromium.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wenst@chromium.org>, 
 linux-rockchip@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>, 
 linux-kernel@vger.kernel.org, aleksandr.o.makarov@gmail.com, 
 stable@vger.kernel.org, 
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
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

Reviewed-by: Thomas Hebb <tommyhebb@gmail.com>

Thank you for catching this, and sorry that my original fix broke things.
There had actually been a report of this breakage from my patch, but I
missed that email until it had already been merged and then didn't have
time to follow up on it. Totally my bad.

[Resending because my last reply was HTML.]

On Mon, Sep 27, 2021 at 11:00 AM Brian Norris <briannorris@chromium.org> wr=
ote:
>
> In commit 43c2de1002d2, we moved most HW configuration to bind(), but we
> didn't move the runtime PM management. Therefore, depending on initial
> boot state, runtime-PM workqueue delays, and other timing factors, we
> may disable our power domain in between the hardware configuration
> (bind()) and when we enable the display. This can cause us to lose
> hardware state and fail to configure our display. For example:
>
>   dw-mipi-dsi-rockchip ff968000.mipi: failed to write command FIFO
>   panel-innolux-p079zca ff960000.mipi.0: failed to write command 0
>
> or:
>
>   dw-mipi-dsi-rockchip ff968000.mipi: failed to write command FIFO
>   panel-kingdisplay-kd097d04 ff960000.mipi.0: failed write init cmds: -11=
0
>
> We should match the runtime PM to the lifetime of the bind()/unbind()
> cycle.
>
> Tested on Acer Chrometab 10 (RK3399 Gru-Scarlet), with panel drivers
> built either as modules or built-in.
>
> Side notes: it seems one is more likely to see this problem when the
> panel driver is built into the kernel. I've also seen this problem
> bisect down to commits that simply changed Kconfig dependencies, because
> it changed the order in which driver init functions were compiled into
> the kernel, and therefore the ordering and timing of built-in device
> probe.
>
> Fixes: 43c2de1002d2 ("drm/rockchip: dsi: move all lane config except LCDC=
 mux to bind()")
> Link: https://lore.kernel.org/linux-rockchip/9aedfb528600ecf871885f7293ca=
4207c84d16c1.camel@gmail.com/
> Reported-by: <aleksandr.o.makarov@gmail.com>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>
> Changes in v2:
> - Clean up pm-runtime state in error cases.
> - Correct git hash for Fixes.
>
>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 37 ++++++++++---------
>  1 file changed, 19 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gp=
u/drm/rockchip/dw-mipi-dsi-rockchip.c
> index a2262bee5aa4..45676b23c019 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> @@ -773,10 +773,6 @@ static void dw_mipi_dsi_encoder_enable(struct drm_en=
coder *encoder)
>         if (mux < 0)
>                 return;
>
> -       pm_runtime_get_sync(dsi->dev);
> -       if (dsi->slave)
> -               pm_runtime_get_sync(dsi->slave->dev);
> -
>         /*
>          * For the RK3399, the clk of grf must be enabled before writing =
grf
>          * register. And for RK3288 or other soc, this grf_clk must be NU=
LL,
> @@ -795,20 +791,10 @@ static void dw_mipi_dsi_encoder_enable(struct drm_e=
ncoder *encoder)
>         clk_disable_unprepare(dsi->grf_clk);
>  }
>
> -static void dw_mipi_dsi_encoder_disable(struct drm_encoder *encoder)
> -{
> -       struct dw_mipi_dsi_rockchip *dsi =3D to_dsi(encoder);
> -
> -       if (dsi->slave)
> -               pm_runtime_put(dsi->slave->dev);
> -       pm_runtime_put(dsi->dev);
> -}
> -
>  static const struct drm_encoder_helper_funcs
>  dw_mipi_dsi_encoder_helper_funcs =3D {
>         .atomic_check =3D dw_mipi_dsi_encoder_atomic_check,
>         .enable =3D dw_mipi_dsi_encoder_enable,
> -       .disable =3D dw_mipi_dsi_encoder_disable,
>  };
>
>  static int rockchip_dsi_drm_create_encoder(struct dw_mipi_dsi_rockchip *=
dsi,
> @@ -938,10 +924,14 @@ static int dw_mipi_dsi_rockchip_bind(struct device =
*dev,
>                 put_device(second);
>         }
>
> +       pm_runtime_get_sync(dsi->dev);
> +       if (dsi->slave)
> +               pm_runtime_get_sync(dsi->slave->dev);
> +
>         ret =3D clk_prepare_enable(dsi->pllref_clk);
>         if (ret) {
>                 DRM_DEV_ERROR(dev, "Failed to enable pllref_clk: %d\n", r=
et);
> -               return ret;
> +               goto out_pm_runtime;
>         }
>
>         /*
> @@ -953,7 +943,7 @@ static int dw_mipi_dsi_rockchip_bind(struct device *d=
ev,
>         ret =3D clk_prepare_enable(dsi->grf_clk);
>         if (ret) {
>                 DRM_DEV_ERROR(dsi->dev, "Failed to enable grf_clk: %d\n",=
 ret);
> -               return ret;
> +               goto out_pm_runtime;
>         }
>
>         dw_mipi_dsi_rockchip_config(dsi);
> @@ -965,16 +955,23 @@ static int dw_mipi_dsi_rockchip_bind(struct device =
*dev,
>         ret =3D rockchip_dsi_drm_create_encoder(dsi, drm_dev);
>         if (ret) {
>                 DRM_DEV_ERROR(dev, "Failed to create drm encoder\n");
> -               return ret;
> +               goto out_pm_runtime;
>         }
>
>         ret =3D dw_mipi_dsi_bind(dsi->dmd, &dsi->encoder);
>         if (ret) {
>                 DRM_DEV_ERROR(dev, "Failed to bind: %d\n", ret);
> -               return ret;
> +               goto out_pm_runtime;
>         }
>
>         return 0;
> +
> +out_pm_runtime:
> +       pm_runtime_put(dsi->dev);
> +       if (dsi->slave)
> +               pm_runtime_put(dsi->slave->dev);
> +
> +       return ret;
>  }
>
>  static void dw_mipi_dsi_rockchip_unbind(struct device *dev,
> @@ -989,6 +986,10 @@ static void dw_mipi_dsi_rockchip_unbind(struct devic=
e *dev,
>         dw_mipi_dsi_unbind(dsi->dmd);
>
>         clk_disable_unprepare(dsi->pllref_clk);
> +
> +       pm_runtime_put(dsi->dev);
> +       if (dsi->slave)
> +               pm_runtime_put(dsi->slave->dev);
>  }
>
>  static const struct component_ops dw_mipi_dsi_rockchip_ops =3D {
> --
> 2.33.0.685.g46640cef36-goog
>
