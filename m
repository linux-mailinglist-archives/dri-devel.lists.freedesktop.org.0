Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 243098BE27D
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 14:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51FB10E446;
	Tue,  7 May 2024 12:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eABs82m1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAC610E446
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 12:49:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6F9B26173C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 12:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227ECC4AF66
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 12:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715086183;
 bh=oD6rvzEgDMgWG2vtFEnISqggPQoEaDhmk8mNgqIWbIo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eABs82m1AtKjOhNtBJTU0uty9AQ3gYq+B5rCkmi83qAwaXyPrZwid0INIHE4WKRwU
 Vdn9KQfHByTy5BGU0IPuAXMmfB1QUlVfsTCake802pzTtw231WR6AxBrXCyD0KsQHS
 vJxXxJP4xrLVcxWwycVzh6tUUrifWihZ9L1miCe5j7ieedBPGgfnuRFkyNcoeyF2yX
 GsIvx3/FeF5/dj3mWUB1HL6Vg5BVxqJ7PHfBb2DQ/wzBPXix/2DgM9uISy0bswMMIc
 T6FESYRG/yGj2BWSGr/G0fVJFy8HSy5yBwuYpTHLQ4Fs/LO6/NxQscbRi9X+c6qY1E
 hBgOsJbpey4Dw==
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-db4364ecd6aso3043922276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 05:49:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVJpAN+0GNwpDfRSr7zQyRLUM4Uj8giF3N2YGOvhWwm9QCUmNAj8/63hhdXre3VaIhDmOkPA6G1SRoxPcVoavIOXZRRXKYqkji2dl/2fNBt
X-Gm-Message-State: AOJu0YwJwA/AxqMeYYKlPvcjBLMgh3V8dyRApewE6k2NzyZp40RNGWJ2
 JHP4rOFNd108nEZzR9XcdxMd/a4fY5TdFg70SVLUDTeQ8vS01tUMnPny8m1jod7Q2SJ1MvvN7Rj
 vOw86T2L/c6VE1PhGfhfL936MEMXen4rCfYYkbg==
X-Google-Smtp-Source: AGHT+IHTUvOiQuZXH5tWOLURVMUkaKIGLnwcoEtMxsrNy0hFgSoz1lGl+EUVn28GEgtHJMUNMRmgv3SGgEfOvaqU8mQ=
X-Received: by 2002:a05:6902:4d2:b0:dcd:aa73:e349 with SMTP id
 v18-20020a05690204d200b00dcdaa73e349mr11497694ybs.12.1715086182345; Tue, 07
 May 2024 05:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
 <20240503151129.3901815-4-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-4-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 7 May 2024 14:49:30 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7hM+BLkaTnS=6-eHqERp7hCi3NM93=OMfHkwKohtBHEw@mail.gmail.com>
Message-ID: <CAN6tsi7hM+BLkaTnS=6-eHqERp7hCi3NM93=OMfHkwKohtBHEw@mail.gmail.com>
Subject: Re: [PATCH 03/14] drm/bridge: analogix_dp: register AUX bus after
 enabling runtime PM
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
> AUX transactions require the controller to be in working state and
> take a runtime PM reference. To avoid potential races beween the
> first transactions on the bus and runtime PM being set up, move the
> AUX registration behind the runtime PM setup.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index b39721588980..0af2a70ae5bf 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1728,31 +1728,34 @@ int analogix_dp_bind(struct analogix_dp_device *d=
p, struct drm_device *drm_dev)
>         dp->drm_dev =3D drm_dev;
>         dp->encoder =3D dp->plat_data->encoder;
>
> +       pm_runtime_use_autosuspend(dp->dev);
> +       pm_runtime_set_autosuspend_delay(dp->dev, 100);
> +       pm_runtime_enable(dp->dev);
> +
>         dp->aux.name =3D "DP-AUX";
>         dp->aux.transfer =3D analogix_dpaux_transfer;
>         dp->aux.dev =3D dp->dev;
>         dp->aux.drm_dev =3D drm_dev;
>
>         ret =3D drm_dp_aux_register(&dp->aux);
> -       if (ret)
> -               return ret;
> -
> -       pm_runtime_use_autosuspend(dp->dev);
> -       pm_runtime_set_autosuspend_delay(dp->dev, 100);
> -       pm_runtime_enable(dp->dev);
> +       if (ret) {
> +               DRM_ERROR("failed to register AUX (%d)\n", ret);
> +               goto err_disable_pm_runtime;
> +       }
>
>         ret =3D analogix_dp_create_bridge(drm_dev, dp);
>         if (ret) {
>                 DRM_ERROR("failed to create bridge (%d)\n", ret);
> -               goto err_disable_pm_runtime;
> +               goto err_unregister_aux;
>         }
>
>         return 0;
>
> +err_unregister_aux:
> +       drm_dp_aux_unregister(&dp->aux);
>  err_disable_pm_runtime:
>         pm_runtime_dont_use_autosuspend(dp->dev);
>         pm_runtime_disable(dp->dev);
> -       drm_dp_aux_unregister(&dp->aux);
>
>         return ret;
>  }
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
