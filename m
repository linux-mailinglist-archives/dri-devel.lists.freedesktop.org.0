Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240A78BE309
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3078810E091;
	Tue,  7 May 2024 13:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Eypp4xRI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2176810E091
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:07:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7937361763
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30643C4AF67
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715087225;
 bh=j+wghIRtU8XRBH9LfF5TF5xcsTvdGeZIbDN38hCooeQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Eypp4xRINrHZA63eREhh7B6svDPcuXYUGCAIfefcr/dYVbpy1jpmCPc4Y/fapRZfX
 fnWUjdhhsvbNDOz1jh6xO8IxTJJK/pG9EMEGEWvOF1LusthULEUKCu7hJiQ/G5AKkY
 f9LRFsApDbqAxCNP/wdjUjgwb6CtqWihlWFGOCZlDGYyYKoxYhlUFy1dUqP9e+SRfI
 i3KC3i5bLMPY2yG35jboDohUcjbZvGuE6MQJVN9ffr3IUKmGpD72ritmlGp+vccDVQ
 NpdoTlTDo7J8nb4+58sRz27gBnEaziRhm0WoPJSGX9cNLNH/oKakILgN3LB1WesRRc
 3mFT6F4CBLKoA==
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-de45dba157cso2508430276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 06:07:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXOItIV8JiCiKjtHUwFpjhAIYXOxPCjAd6zIrkYrYW2DzKnrWD7QOH+SLfgv3J5e2+o22jRY0iic6FnukuRyJzdv0gJSiAlMGgpqGH0rZH5
X-Gm-Message-State: AOJu0YxjzSCtsAwmPivq7W1ry+Si0Wz7TrzOF6KlOf9krkRPi9/p3+t1
 XIRnyjaqGN1ygIl9WzsmMl+hzLY/cCqL/ttbU3chXF6SJk1whdtUBIbQzVDlZiAJfqaLBLFsGmy
 ygvIe+LUvBA8tpiNx4iUAznb3LUdOZsyKRWY6VQ==
X-Google-Smtp-Source: AGHT+IHdyD26pVJBgrb9c4Ow6dW/EnHwHak0Zk5si1N+G/I8HPhJ47kGZx/tFd/LtFMXYIPi3VN1ol1LI2O6iJHNVs4=
X-Received: by 2002:a5b:c42:0:b0:dcd:13ba:cdd6 with SMTP id
 d2-20020a5b0c42000000b00dcd13bacdd6mr11816255ybr.47.1715087224457; Tue, 07
 May 2024 06:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
 <20240503151129.3901815-10-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-10-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 7 May 2024 15:06:53 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6HJDg3dWF=FGJNoONths7GWQrUmDtbW=Z4fVzi2CegOQ@mail.gmail.com>
Message-ID: <CAN6tsi6HJDg3dWF=FGJNoONths7GWQrUmDtbW=Z4fVzi2CegOQ@mail.gmail.com>
Subject: Re: [PATCH 09/14] drm/bridge: analogix_dp: remove PLL lock check from
 analogix_dp_config_video
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

On Fri, May 3, 2024 at 5:13=E2=80=AFPM Lucas Stach <l.stach@pengutronix.de>=
 wrote:
>
> This check is way too late in the DP enable flow. The PLL must be locked
> much earlier, before any link training can happen. If the PLL is unlocked
> at that point in time there is something seriously wrong in the enable fl=
ow.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index fdb2c2a2b69a..b4a47311cfe8 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -720,11 +720,6 @@ static int analogix_dp_config_video(struct analogix_=
dp_device *dp)
>
>         analogix_dp_set_video_color_format(dp);
>
> -       if (analogix_dp_get_pll_lock_status(dp) =3D=3D PLL_UNLOCKED) {
> -               dev_err(dp->dev, "PLL is not locked yet.\n");
> -               return -EINVAL;
> -       }
> -
>         for (;;) {
>                 timeout_loop++;
>                 if (analogix_dp_is_slave_video_stream_clock_on(dp) =3D=3D=
 0)
> --
> 2.39.2
>

Reviewed-by: Robet Foss <rfoss@kernel.org>
