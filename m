Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0CF9020AD
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 13:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816FD10E050;
	Mon, 10 Jun 2024 11:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fMeRg7oc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7090710E050
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 11:48:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 87082CE1310
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 11:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94CBC4AF4D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 11:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718020104;
 bh=EnvLMHWlQfTpDHyBkrIDp4WoWKYs33FSYEF6HxK5HXQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fMeRg7oc+uRBQ5R4Q4pbBqGxSe3N7OyiofvQlNXsGjh4JGfxQ/uYwWNBNCQssDs9a
 nNsqfs8k/o3o/Bf4wa4Khv2UC6XGjiyEm61Wd+Upn9dTl5FQyO8RSCpqwc0tySJ6ck
 Lr+hEC8SLp+sskpFECKkRWe7Ght+Fq92kmTUSXALoRUHRlnNxHTCAgCbTOdkkEfySL
 GT61h2HYrHVU4z0k6MHtg2P/KXGmV7danOmb+QQkEoAbb3SumL0PTgSpoKCyUutxva
 sLFY94VAoS3aTwvD7DH0nQ1MH1GJjZsCGqV8x5roacVBRxfwvchIUl/AMAUX9WN8fu
 8N2MChk6DUrzA==
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-627efad69b4so43049567b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 04:48:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV757DjmtphiO/cGgkLXicJh70bnmp7F/m3jQLHYsIlw1JglP+gc4l6hV3PBko2BmayHwLZ3Ex8ooJApxqkoDvcd0qQVWD8dY9Fq2G/qet4
X-Gm-Message-State: AOJu0YyhZL5wQiotX0RMSULy77vHSZfZOb3KugQZoYRfvH2mkKTH/a9q
 EAXY8BTHAlG4fr2T6x/yYH7GCMwDAz3Zugd8IdoUtQ9DJse9GCfG8pa66Ht7cJUVAlvJm9PjZ5r
 +oiIm7M1howIuwxJQLFHppOmAwwkuLBFhqsRXWQ==
X-Google-Smtp-Source: AGHT+IGEKCo6gyyeWBzcK4b58/vCeVtAp7ZUoLZg7ARJvO2tHiONaUv9G9RmAjiSJYn4x9eDt1uJKoCxs9bAlp3RHLw=
X-Received: by 2002:a25:b319:0:b0:dfb:be1:b1d1 with SMTP id
 3f1490d57ef6-dfb0be1b892mr5743703276.35.1718020104093; Mon, 10 Jun 2024
 04:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
 <20240503151129.3901815-12-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-12-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 10 Jun 2024 13:48:13 +0200
X-Gmail-Original-Message-ID: <CAN6tsi55PdW0Z7H_-7S6tPjkhAewacKNjxmfe7qcaXXZ=6-GYg@mail.gmail.com>
Message-ID: <CAN6tsi55PdW0Z7H_-7S6tPjkhAewacKNjxmfe7qcaXXZ=6-GYg@mail.gmail.com>
Subject: Re: [PATCH 11/14] drm/bridge: analogix_dp: don't wait for PLL lock
 too early
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
> The PLL will be reconfigured later, which may cause it to go out of lock
> anyways, so there is no point in waiting for the PLL to lock here. Instea=
d
> we can continue execution of the link setup, which will properly set the
> PLL parameters and will wait for the PLL to lock at the appropriate times=
.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.c
> index d267cf05cbca..e9c643a8b6fc 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -356,7 +356,6 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>  int analogix_dp_init_analog_func(struct analogix_dp_device *dp)
>  {
>         u32 reg;
> -       int timeout_loop =3D 0;
>
>         analogix_dp_set_analog_power_down(dp, POWER_ALL, 0);
>
> @@ -368,18 +367,7 @@ int analogix_dp_init_analog_func(struct analogix_dp_=
device *dp)
>         writel(reg, dp->reg_base + ANALOGIX_DP_DEBUG_CTL);
>
>         /* Power up PLL */
> -       if (analogix_dp_get_pll_lock_status(dp) =3D=3D PLL_UNLOCKED) {
> -               analogix_dp_set_pll_power_down(dp, 0);
> -
> -               while (analogix_dp_get_pll_lock_status(dp) =3D=3D PLL_UNL=
OCKED) {
> -                       timeout_loop++;
> -                       if (DP_TIMEOUT_LOOP_COUNT < timeout_loop) {
> -                               dev_err(dp->dev, "failed to get pll lock =
status\n");
> -                               return -ETIMEDOUT;
> -                       }
> -                       usleep_range(10, 20);
> -               }
> -       }
> +       analogix_dp_set_pll_power_down(dp, 0);
>
>         /* Enable Serdes FIFO function and Link symbol clock domain modul=
e */
>         reg =3D readl(dp->reg_base + ANALOGIX_DP_FUNC_EN_2);
> --
> 2.39.2
>


Reviewed-by: Robert Foss <rfoss@kernel.org>
