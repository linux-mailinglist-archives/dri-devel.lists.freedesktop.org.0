Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E555E8BE1CE
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 14:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E592E10F04C;
	Tue,  7 May 2024 12:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a5QjcowB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057C310EFB7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 12:15:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 48A6B61629
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 12:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B448AC4DDE1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 12:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715084120;
 bh=4ExG0FZDY6f08QETasOyXD/lspkhULsMREyw3QJterw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=a5QjcowBooTLKsJ6gz38m+jIt54nTjxBfVH6+887vRX+2ePl/1N0JXPqOJ6ddL/7a
 psgRAAWSWxGyl7C0p1XuhHKSZDXX6tBrhpxVL7tud+zb+59IbIwzFMnA2H4jXFGfPK
 nzdTCAKdsSXAUiw8QSvHP4mDTPSTIqtQ/H9ePriZpv8mMRxLAxYNkCJ2ssUPa+JHu1
 7GwN8wax3xFXk4zspZvtaUFDxxpKnZ9BhHWRHjlE2Q4T0V9lQp+vTGc+JEUYgLJucR
 HzNyk4Ji/xrt3WG2C3k8+Y+/THV2mVRQYGRygxjB3lkyVOFKhPB5Sa6nQ6ruC+5JSB
 TULtxMoHc/BLw==
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6203b1bc935so31729167b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 05:15:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUfFKvLHaKr9loTRnAJY5PuEi1i12FF4sRbcTMyj7LFEbmtx4Ztdr0yt1qjYyMbIXYZ79JyIZCX1ofzP3cXzJTDtEfKzF9cFxn4hcA0Osvh
X-Gm-Message-State: AOJu0Yyia0loKX0l8ksN9lNxl0vGCdzKtskBvqjSiclI84SOAbIDGFvA
 PFcCHqs8xVFrX4yMEIHJj4NLncvC/VR4fFW+G5wUymvl39vcyAVtGr5sq5unD3H/FV7Qk0/pN36
 AcW96UZ8GBRiAPqai/gAosTLBmz9nQevMoQ5RNQ==
X-Google-Smtp-Source: AGHT+IH+Pja8EgUMLpfJwhO7v0UjdoeL8if8dUGCw6qXcAIWrNDLG5aoxfpLWtSpJvCmWyUWR2rEmCfBWkFANDX1uvw=
X-Received: by 2002:a05:6902:2cb:b0:de6:86f:c6a4 with SMTP id
 w11-20020a05690202cb00b00de6086fc6a4mr16605659ybh.44.1715084119930; Tue, 07
 May 2024 05:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
 <20240503151129.3901815-3-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-3-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 7 May 2024 14:15:09 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4PBmr9mXj16rDod_6-pJQAsvbTWhfCmmG0=2n5bBM0Rg@mail.gmail.com>
Message-ID: <CAN6tsi4PBmr9mXj16rDod_6-pJQAsvbTWhfCmmG0=2n5bBM0Rg@mail.gmail.com>
Subject: Re: [PATCH 02/14] drm/rockchip: analogix_dp: add runtime PM handling
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
> Hook up the runtime PM suspend/resume paths to make the rockchip
> glue behave more like the exynos one. The same suspend/resume
> functions are used for system sleep via the runtime PM force
> suspend/resume.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gp=
u/drm/rockchip/analogix_dp-rockchip.c
> index baeb41875a4b..8214265f1497 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -13,6 +13,7 @@
>  #include <linux/of.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/clk.h>
> @@ -430,7 +431,6 @@ static void rockchip_dp_remove(struct platform_device=
 *pdev)
>         analogix_dp_remove(dp->adp);
>  }
>
> -#ifdef CONFIG_PM_SLEEP
>  static int rockchip_dp_suspend(struct device *dev)
>  {
>         struct rockchip_dp_device *dp =3D dev_get_drvdata(dev);
> @@ -450,14 +450,9 @@ static int rockchip_dp_resume(struct device *dev)
>
>         return analogix_dp_resume(dp->adp);
>  }
> -#endif
>
> -static const struct dev_pm_ops rockchip_dp_pm_ops =3D {
> -#ifdef CONFIG_PM_SLEEP
> -       .suspend_late =3D rockchip_dp_suspend,
> -       .resume_early =3D rockchip_dp_resume,
> -#endif
> -};
> +static DEFINE_RUNTIME_DEV_PM_OPS(rockchip_dp_pm_ops, rockchip_dp_suspend=
,
> +               rockchip_dp_resume, NULL);
>
>  static const struct rockchip_dp_chip_data rk3399_edp =3D {
>         .lcdsel_grf_reg =3D RK3399_GRF_SOC_CON20,
> @@ -485,7 +480,7 @@ struct platform_driver rockchip_dp_driver =3D {
>         .remove_new =3D rockchip_dp_remove,
>         .driver =3D {
>                    .name =3D "rockchip-dp",
> -                  .pm =3D &rockchip_dp_pm_ops,
> +                  .pm =3D pm_ptr(&rockchip_dp_pm_ops),
>                    .of_match_table =3D rockchip_dp_dt_ids,
>         },
>  };
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
