Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EB08BE2BB
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 14:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AB310EDB6;
	Tue,  7 May 2024 12:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NROAxjMv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EB210EDB6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 12:57:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A241961762
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 12:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26540C4DDF0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 12:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715086654;
 bh=5dWOBGAV1yulOx19L0kSg5lHFwhfe9JMw50lv5bx6mg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NROAxjMv3gbBJXfDpU+ioALD6dqy1I5JEm4hSSOj8ew0uC/Ipp+IBuHIp4rTzbuFV
 T3AnRzwWIGPWtd1sk5Tworn//5HwcOCbhrYGT9YsY4teB9WlacwRC1b0GNwTBCTYEy
 4Dp3mdHQdXq/h1pL09WIWGX0QGtOguhezK+pru1LOsbKHIXYVKqXZS6HSkvgtbgeqq
 zMDw6OV31ojpuOkv+WhD6peOJ8lP1DZBEkYZ8CTI+a8bHuNOAH9z4eKLlkU2yGFaJF
 nRUHWBZz8p0dJyxi09vyT4qL+C6aO57ma11bsLj0p22WdDLy9KUDYs1ySBiQWlRYBL
 2cOlPa+PMWNgg==
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-de604ca3cfcso3050777276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 05:57:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUu+GYpiES94zyOlr8M3mxWYx1fITbPqLxIISj/x2qTyIEMfQBiLGG7ICjbzoJoVdZhXg/Fr8XoIYqnhNzBYWQgBzKwETZMekMKMfTMP7mY
X-Gm-Message-State: AOJu0YxBuOIg89rvbEIhXdk4Ih4UtPHq/+R2mjiOem5w/Zps3t9a1KXd
 ug0FlUhUagf7x9wv2LgPHXPokeWG0aS9j1QW2FlVp5LvGTNgYmFFx1F/vfgB6Yx3GpPIqII2xsB
 I9DeFKQF/CfCoGa3IyXHj4lN+byFDN9rarBu+ww==
X-Google-Smtp-Source: AGHT+IGVjrrbyaO+W2td9MvTHHIHJohjThPzqW9Jq+X0prnVcvnLTyCNz9j38AOvB/d2I/ivjj9VfCgtQ7DsAAbkTuc=
X-Received: by 2002:a05:6902:1343:b0:dc6:e4f8:7e22 with SMTP id
 g3-20020a056902134300b00dc6e4f87e22mr12769105ybu.62.1715086653180; Tue, 07
 May 2024 05:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
 <20240503151129.3901815-5-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-5-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 7 May 2024 14:57:22 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7995885erO70zb53q+PURzrVP+AgJQ+V1Tc57PZHrkqw@mail.gmail.com>
Message-ID: <CAN6tsi7995885erO70zb53q+PURzrVP+AgJQ+V1Tc57PZHrkqw@mail.gmail.com>
Subject: Re: [PATCH 04/14] drm/bridge: analogix_dp: handle clock via runtime PM
To: Lucas Stach <l.stach@pengutronix.de>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>, 
 Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
 patchwork-lst@pengutronix.de
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

On Fri, May 3, 2024 at 5:12=E2=80=AFPM Lucas Stach <l.stach@pengutronix.de>=
 wrote:
>
> There is no reason to enable the controller clock in driver probe, as
> there is no HW initialization done in this function. Instead rely on
> either runtime PM to handle the controller clock or statically enable
> it in the driver bind routine, after which real hardware access is
> required to work.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 78 +++++++++++--------
>  1 file changed, 45 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 0af2a70ae5bf..9e3308257586 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1658,8 +1658,6 @@ analogix_dp_probe(struct device *dev, struct analog=
ix_dp_plat_data *plat_data)
>                 return ERR_CAST(dp->clock);
>         }
>
> -       clk_prepare_enable(dp->clock);
> -
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>
>         dp->reg_base =3D devm_ioremap_resource(&pdev->dev, res);
> @@ -1721,6 +1719,29 @@ analogix_dp_probe(struct device *dev, struct analo=
gix_dp_plat_data *plat_data)
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_probe);
>
> +
> +int analogix_dp_suspend(struct analogix_dp_device *dp)
> +{
> +       clk_disable_unprepare(dp->clock);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(analogix_dp_suspend);
> +
> +int analogix_dp_resume(struct analogix_dp_device *dp)
> +{
> +       int ret;
> +
> +       ret =3D clk_prepare_enable(dp->clock);
> +       if (ret < 0) {
> +               DRM_ERROR("Failed to prepare_enable the clock clk [%d]\n"=
, ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(analogix_dp_resume);
> +
>  int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *d=
rm_dev)
>  {
>         int ret;
> @@ -1728,9 +1749,15 @@ int analogix_dp_bind(struct analogix_dp_device *dp=
, struct drm_device *drm_dev)
>         dp->drm_dev =3D drm_dev;
>         dp->encoder =3D dp->plat_data->encoder;
>
> -       pm_runtime_use_autosuspend(dp->dev);
> -       pm_runtime_set_autosuspend_delay(dp->dev, 100);
> -       pm_runtime_enable(dp->dev);
> +       if (IS_ENABLED(CONFIG_PM)) {
> +               pm_runtime_use_autosuspend(dp->dev);
> +               pm_runtime_set_autosuspend_delay(dp->dev, 100);
> +               pm_runtime_enable(dp->dev);
> +       } else {
> +               ret =3D analogix_dp_resume(dp);
> +               if (ret)
> +                       return ret;
> +       }
>
>         dp->aux.name =3D "DP-AUX";
>         dp->aux.transfer =3D analogix_dpaux_transfer;
> @@ -1754,8 +1781,12 @@ int analogix_dp_bind(struct analogix_dp_device *dp=
, struct drm_device *drm_dev)
>  err_unregister_aux:
>         drm_dp_aux_unregister(&dp->aux);
>  err_disable_pm_runtime:
> -       pm_runtime_dont_use_autosuspend(dp->dev);
> -       pm_runtime_disable(dp->dev);
> +       if (IS_ENABLED(CONFIG_PM)) {
> +               pm_runtime_dont_use_autosuspend(dp->dev);
> +               pm_runtime_disable(dp->dev);
> +       } else {
> +               analogix_dp_suspend(dp);
> +       }
>
>         return ret;
>  }
> @@ -1772,40 +1803,21 @@ void analogix_dp_unbind(struct analogix_dp_device=
 *dp)
>         }
>
>         drm_dp_aux_unregister(&dp->aux);
> -       pm_runtime_dont_use_autosuspend(dp->dev);
> -       pm_runtime_disable(dp->dev);
> +
> +       if (IS_ENABLED(CONFIG_PM)) {
> +               pm_runtime_dont_use_autosuspend(dp->dev);
> +               pm_runtime_disable(dp->dev);
> +       } else {
> +               analogix_dp_suspend(dp);
> +       }
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_unbind);
>
>  void analogix_dp_remove(struct analogix_dp_device *dp)
>  {
> -       clk_disable_unprepare(dp->clock);
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_remove);
>
> -#ifdef CONFIG_PM
> -int analogix_dp_suspend(struct analogix_dp_device *dp)
> -{
> -       clk_disable_unprepare(dp->clock);
> -       return 0;
> -}
> -EXPORT_SYMBOL_GPL(analogix_dp_suspend);
> -
> -int analogix_dp_resume(struct analogix_dp_device *dp)
> -{
> -       int ret;
> -
> -       ret =3D clk_prepare_enable(dp->clock);
> -       if (ret < 0) {
> -               DRM_ERROR("Failed to prepare_enable the clock clk [%d]\n"=
, ret);
> -               return ret;
> -       }
> -
> -       return 0;
> -}
> -EXPORT_SYMBOL_GPL(analogix_dp_resume);
> -#endif
> -
>  int analogix_dp_start_crc(struct drm_connector *connector)
>  {
>         struct analogix_dp_device *dp =3D to_dp(connector);
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
