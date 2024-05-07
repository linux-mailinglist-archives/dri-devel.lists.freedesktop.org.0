Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9E18BE321
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9356A10F582;
	Tue,  7 May 2024 13:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bRuS7tJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B1910F582
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:11:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D32C6CE10C7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43EA8C3277B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715087464;
 bh=vdFUPxI2rK4X4ACGJc33PkZDLQWpMwoj2Qa0AfmlRj8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bRuS7tJMq+xHrEpU4ae6gPZ2EEu5SybMRZl3bh9uURvV+iW/7I2akJSej6K6C5ka8
 FD3b1REImXZQSTOQ+wWwjyCzCbhyS2cwqAFH2KkgSwVurKOFaY/f3m1eqGi2/K4l6C
 pdM7qvRhxbL32bDuXLeG5iWRfVc/41dCdU1WBjABjTjdtn8uxBlW3lsVX/Jl2THTAc
 vJWzZX/f+LbDYyriS6BtBlQ74NMRUkL+PG3Xnhv5rH0lgIT8hS+qjJqfoPxSuTK0O4
 17epchFWegWRlMvHL9ihYiVFKtIXrECg408jacU7u2Ys1dAlNLtH7VARQONs/8BccM
 4Y9zRlFPfXTog==
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-deb5f006019so3412264276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 06:11:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVCcGhje2ahEENwVszn0milZc3qAVPadxMxiFnGwfjvS8835sdB9riti4PNwHv2+RDB9j4q+jo9otbQSJDbqMqk4knjPSd1e3R0XPB9FDZZ
X-Gm-Message-State: AOJu0Yz3FUtRjXLLRQ0LzAPSErL4RWA1DWaX7atCafHlp36FBtZI1H//
 f30gcALKgJ1bXyKPNsslmxNKiTViwSwOsjwKO8ok8apm+1Qu+qxMLe9ZjK9EmSF49giummzTy0C
 QfZicclJuMUh5caouHSjCYRN4IpDAO+h7Aohc6g==
X-Google-Smtp-Source: AGHT+IFsm9DC3DaDqy/o8t6hXSkYeTcEajdfOC7CkRK6RkveYsEckuITQhToPeKR3ocgyQC/Xu6yE8vpx90pCLe4bg0=
X-Received: by 2002:a05:6902:250a:b0:de5:d1cd:b593 with SMTP id
 dt10-20020a056902250a00b00de5d1cdb593mr14853945ybb.33.1715087463592; Tue, 07
 May 2024 06:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-1-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 7 May 2024 15:10:52 +0200
X-Gmail-Original-Message-ID: <CAN6tsi73ks50-Xg78Jpj6Me80hpaR0ww=RXOMKJoT2V6Zg8_Yg@mail.gmail.com>
Message-ID: <CAN6tsi73ks50-Xg78Jpj6Me80hpaR0ww=RXOMKJoT2V6Zg8_Yg@mail.gmail.com>
Subject: Re: [PATCH 00/14] improve Analogix DP AUX channel handling
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
> Currently the AUX channel support in the Analogix DP driver is severely
> limited as the AUX block of the bridge is only initialized when the video
> link is to be enabled. This is okay for the purposes of link training,
> but does not allow to detect displays by probing for EDID. This series
> reworks the driver to allow AUX transactions before the video link is
> active.
>
> As this requires to rework some of the controller initialization and
> also handling of both internal and external clocks, the series includes
> quite a few changes to add better runtime PM handling.
>
> Lucas Stach (14):
>   drm/bridge: analogix_dp: remove unused platform power_on_end callback
>   drm/rockchip: analogix_dp: add runtime PM handling
>   drm/bridge: analogix_dp: register AUX bus after enabling runtime PM
>   drm/bridge: analogix_dp: handle clock via runtime PM
>   drm/bridge: analogix_dp: remove unused analogix_dp_remove
>   drm/bridge: analogix_dp: remove clk handling from
>     analogix_dp_set_bridge
>   drm/bridge: analogix_dp: move platform and PHY power handling into
>     runtime PM
>   drm/bridge: analogix_dp: move basic controller init into runtime PM
>   drm/bridge: analogix_dp: remove PLL lock check from
>     analogix_dp_config_video
>   drm/bridge: analogix_dp: move macro reset after link bandwidth setting
>   drm/bridge: analogix_dp: don't wait for PLL lock too early
>   drm/bridge: analogix_dp: simplify and correct PLL lock checks
>   drm/bridge: analogix_dp: only read AUX status when an error occured
>   drm/bridge: analogix_dp: handle AUX transfer timeouts
>
>  .../drm/bridge/analogix/analogix_dp_core.c    | 196 ++++++++----------
>  .../drm/bridge/analogix/analogix_dp_core.h    |   7 +-
>  .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  38 ++--
>  .../gpu/drm/bridge/analogix/analogix_dp_reg.h |   9 +
>  drivers/gpu/drm/exynos/exynos_dp.c            |   5 +-
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  26 +--
>  include/drm/bridge/analogix_dp.h              |   4 +-
>  7 files changed, 120 insertions(+), 165 deletions(-)
>
> --
> 2.39.2
>

There are some checkpatch --strict warnings, and the patch 10/14 does
not apply. Other than that the series looks very good.

Maybe rebase on drm-misc/drm-misc-next, fix the applicable checkpatch
--strict warnings and send a new version of this series. Then the last
patches can be reviewed.
