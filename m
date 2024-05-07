Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 032628BE2F6
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E97C10F529;
	Tue,  7 May 2024 13:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="etWzkfvB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7279D10E091
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:05:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 72D1E6176A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1F9C4DDEC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715087155;
 bh=5PYH91EQi+idBxIKjdhl3K12UjexK5qvIICBveFfKMI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=etWzkfvBRTSYmbIdNGWLnvHkNtxI7DMFj4Sop9h3xY5P1/0sNi8TvnPhY0mCsJi1T
 AHvjrXmYsvmMIV6h3clvKGsR89VJq+jIYYkwDAgMBeb+dmkLS0KHqC4fbyx5Ld9eDN
 ip95v9wvdwMYvA7297jb/v1SR1R+Hvx6yx6HqCFQ3pdDh1oOklj9iYkEbwQPo3Et4p
 ArVqDSlORjEEx1piTzmd0KLdhOV1UYxsImRjbR6k+qg4+oJz8hDyS+fnp/94cmTXBi
 zIURFEitgJ5i1kKaGfGelDDqyBKuTJqJ/PPfwORfOPKRi3OhhLji1kFW78YxaHEjSa
 2pgBjLUte+E/w==
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-de5b1e6beceso3608170276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 06:05:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXkL0TSEadg7DrQMJ2ft/51Yfv8J8abAoJ2298TK51YAogbLeXawthZyA3wkBuEz4SO8KbG+NVmkoweAK9oNTj8jbzBeuUYTVBZGfg9UKVp
X-Gm-Message-State: AOJu0YxfEUedUYimGvcCk22VbV89kx67ePDADMi+sJjjFgqQ2Fbvp+af
 RgHc3LE4dd0OEC3vr6QmVsSnrtYbGcHpqQ2o0n8X1ZZRulSQtbBXE/PVBIN+3H/enprM9cCU1dy
 WM5p0wgpoNSUwE1jAAD3oyJBno8tS1tzQsf/0gA==
X-Google-Smtp-Source: AGHT+IFn91kp+WhuqDQyRw92qtuMTa/GVclyApZ/cSHOyt/QXsb7bezaUvDdlymM+sqt732FQULKq1yg6rUERmbNifg=
X-Received: by 2002:a5b:942:0:b0:de4:8b7:7bbd with SMTP id
 x2-20020a5b0942000000b00de408b77bbdmr12304102ybq.15.1715087154728; 
 Tue, 07 May 2024 06:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
 <20240503151129.3901815-9-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-9-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 7 May 2024 15:05:44 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4SSpfsQRWgzn5VFdVO+v6YePfXWuK=7C3NzWzLyTh-Jg@mail.gmail.com>
Message-ID: <CAN6tsi4SSpfsQRWgzn5VFdVO+v6YePfXWuK=7C3NzWzLyTh-Jg@mail.gmail.com>
Subject: Re: [PATCH 08/14] drm/bridge: analogix_dp: move basic controller init
 into runtime PM
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
> Make sure the controller is in a basic working state after runtime
> resume. Keep the analog function enable in the mode set path as this
> enables parts of the PHY that are only required to be powered when
> there is a data stream being sent out.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 3281c00a39cd..fdb2c2a2b69a 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -41,10 +41,8 @@ struct bridge_init {
>         struct device_node *node;
>  };
>
> -static int analogix_dp_init_dp(struct analogix_dp_device *dp)
> +static void analogix_dp_init_dp(struct analogix_dp_device *dp)
>  {
> -       int ret;
> -
>         analogix_dp_reset(dp);
>
>         analogix_dp_swreset(dp);
> @@ -56,13 +54,9 @@ static int analogix_dp_init_dp(struct analogix_dp_devi=
ce *dp)
>         analogix_dp_enable_sw_function(dp);
>
>         analogix_dp_config_interrupt(dp);
> -       ret =3D analogix_dp_init_analog_func(dp);
> -       if (ret)
> -               return ret;
>
>         analogix_dp_init_hpd(dp);
>         analogix_dp_init_aux(dp);
> -       return 0;
>  }
>
>  static int analogix_dp_detect_hpd(struct analogix_dp_device *dp)
> @@ -1258,9 +1252,9 @@ static int analogix_dp_set_bridge(struct analogix_d=
p_device *dp)
>
>         pm_runtime_get_sync(dp->dev);
>
> -       ret =3D analogix_dp_init_dp(dp);
> +       ret =3D analogix_dp_init_analog_func(dp);
>         if (ret)
> -               goto out_dp_init;
> +               return ret;
>
>         /*
>          * According to DP spec v1.3 chap 3.5.1.2 Link Training,
> @@ -1726,6 +1720,8 @@ int analogix_dp_resume(struct analogix_dp_device *d=
p)
>
>         phy_power_on(dp->phy);
>
> +       analogix_dp_init_dp(dp);
> +
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_resume);
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
