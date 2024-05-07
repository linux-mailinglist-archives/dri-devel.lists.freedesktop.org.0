Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A248BE2EC
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2565910F56F;
	Tue,  7 May 2024 13:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eguwRJcX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6F210F532
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:01:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B53A461752
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745BBC4DDEC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715086912;
 bh=tHVK/OSHp5sKNPT7Tv7H1XD40NSCZFHElj9hZQKPyUQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eguwRJcX/4VYB/PyMWWUR+tcTOv0G34if3IV/gmp2rcL/vg9UEacIkhg3UKuc2d5y
 fkGl76hSFjlXtsHHFHr0eU5dNwOOPri9dgihx6eoTlKLsTXPba4psC4n8cADjrXa+u
 cwxIdtpgXppy0VNNKeqwj5vKzKtRuqrygKWxXAneZiPb9LMn7WTKBySEo3ovwv15I9
 8Is2D39HItGl6+SmDPsKBpnGrW24d9N8YSO7ykji6wX/ef9yvvf+ZBUWyr1CJjgqak
 rBNg9PzDa2Qayt9FQYp21Skk9pfxCRcHKiRbLRwe39DtfE00M0vHysvUhMvBNNp39+
 rsL9gg1Cl3yAA==
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-de46b113a5dso3172907276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 06:01:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVr1ZafQbPYCo2tec6YDKReaKWlvTVeVwlvFuRB+CEeU5044fDPrDmQm7qRtwlpE0jwX9k1eiiaBh62KN/O878Zrdf+Vu5ZX/Zzm75jTMgK
X-Gm-Message-State: AOJu0YxnX1NP702Al5UZ97qGLYSiGRtrC9x8r89LMwqGD4xZSKal7YUO
 UDchHGiczaGt2fnDXVZ7+gR+ohri88LPp1xBMvnEf32r6DwmvgADQMTsqSlaKUoq0GoybT2eV65
 mPDyuXcKW4Xd8nW+TKR6phSn2hF9n29oaIuRtNw==
X-Google-Smtp-Source: AGHT+IGVoBB2KRC+J+e7019EfznjBMxIVrKNmwrzqOiYbxqXgUaaap+Cuf7kSvAKD4Hz1/UNtTrSTy6fS0xXp+atLOo=
X-Received: by 2002:a05:6902:4cf:b0:de6:b80:f7a3 with SMTP id
 v15-20020a05690204cf00b00de60b80f7a3mr12780894ybs.62.1715086911730; Tue, 07
 May 2024 06:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
 <20240503151129.3901815-8-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-8-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 7 May 2024 15:01:41 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6z_aN88ApoF-5EiemrTHsVN2yYoL_muz0Euru2uO6gTg@mail.gmail.com>
Message-ID: <CAN6tsi6z_aN88ApoF-5EiemrTHsVN2yYoL_muz0Euru2uO6gTg@mail.gmail.com>
Subject: Re: [PATCH 07/14] drm/bridge: analogix_dp: move platform and PHY
 power handling into runtime PM
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
> Platform and PHY power isn't only required when the actual display data
> stream is active, but may be required earlier to support AUX channel
> transactions. Move them into the runtime PM calls, so they are properly
> managed whenever various other parts of the driver need them to be active=
.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 23 ++++++++-----------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 311e1e67486d..3281c00a39cd 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1258,11 +1258,6 @@ static int analogix_dp_set_bridge(struct analogix_=
dp_device *dp)
>
>         pm_runtime_get_sync(dp->dev);
>
> -       if (dp->plat_data->power_on)
> -               dp->plat_data->power_on(dp->plat_data);
> -
> -       phy_power_on(dp->phy);
> -
>         ret =3D analogix_dp_init_dp(dp);
>         if (ret)
>                 goto out_dp_init;
> @@ -1288,10 +1283,6 @@ static int analogix_dp_set_bridge(struct analogix_=
dp_device *dp)
>         return 0;
>
>  out_dp_init:
> -       phy_power_off(dp->phy);
> -       if (dp->plat_data->power_off)
> -               dp->plat_data->power_off(dp->plat_data);
> -
>         pm_runtime_put_sync(dp->dev);
>
>         return ret;
> @@ -1354,11 +1345,7 @@ static void analogix_dp_bridge_disable(struct drm_=
bridge *bridge)
>
>         disable_irq(dp->irq);
>
> -       if (dp->plat_data->power_off)
> -               dp->plat_data->power_off(dp->plat_data);
> -
>         analogix_dp_set_analog_power_down(dp, POWER_ALL, 1);
> -       phy_power_off(dp->phy);
>
>         pm_runtime_put_sync(dp->dev);
>
> @@ -1713,6 +1700,11 @@ EXPORT_SYMBOL_GPL(analogix_dp_probe);
>
>  int analogix_dp_suspend(struct analogix_dp_device *dp)
>  {
> +       phy_power_off(dp->phy);
> +
> +       if (dp->plat_data->power_off)
> +               dp->plat_data->power_off(dp->plat_data);
> +
>         clk_disable_unprepare(dp->clock);
>
>         return 0;
> @@ -1729,6 +1721,11 @@ int analogix_dp_resume(struct analogix_dp_device *=
dp)
>                 return ret;
>         }
>
> +       if (dp->plat_data->power_on)
> +               dp->plat_data->power_on(dp->plat_data);
> +
> +       phy_power_on(dp->phy);
> +
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_resume);
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
