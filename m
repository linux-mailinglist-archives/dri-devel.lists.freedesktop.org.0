Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A758BE312
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B6010F4A8;
	Tue,  7 May 2024 13:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="La39XD2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102E910F4A8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:08:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4084CCE1316
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90EF9C4DDE3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715087282;
 bh=3/orngILiWj0h/Zc8gguyZeLCrqym826AoHxOP1iVNI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=La39XD2yqRK/G+9z04jDZ6vq4T/uGTcbER+Concp/okiC7j3/F/Fb4EfX/plvLLyL
 T6CEa46SZXQ9140v0/GRi6Cmoy8kfzR4GGLGVcx6RdVP35HHOMnshxUbo7MayY9LCw
 HJPQT4A69WUcxZg25XR0nyTjDG9wAfY/wmCjlw4cg3pwKef0E8K6gZY550hPV4ZtA0
 BO2qS3GY51ZXm+y1EEqPaqctlHMAIadSesSiN7RdiWOdmv5epfoy9evS2WbDkx5v5w
 8Lm36amC45RPJoBemqDHuExSgtgdzz50sxcKJ0oKB8AeCWpBwqD3zyn4M2Q4fvM6pC
 qJOVB6HShzU0g==
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-db4364ecd6aso3065679276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 06:08:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUymizf/55JRr6pF7WvXMJ9sI14mQNt7QxSaYVoKRfWmbGsRlcYKp12SW0vqytR8FLJ/cplBq1OCrJD+FQMwLLgVbArmYsYmzfNWywB57xO
X-Gm-Message-State: AOJu0Yxg4Ma61ew9t7AfhGo9/y0cpM5fRodu6/gHhQW6RUmzokHb26vC
 B59Rq/WWK4LJTg2qUxTV6u6B2WDKGUVPNGneZSNBg3T3kl9bOTa/kxvkW69osBxP3QKU5MKpyho
 yjbzKuHcw57NO3xBP+Jb+dLqKGzC9zJ9Vw2uYSw==
X-Google-Smtp-Source: AGHT+IFc5saJCdUL2vxHJBNGDA/y81y2ftT95Tql6oKxh0pSmgmZu7WlK/MfGiNVlBc/hnWXS8mxDvJ+DYWKa3mnTtc=
X-Received: by 2002:a05:6902:603:b0:dcc:2f09:4742 with SMTP id
 d3-20020a056902060300b00dcc2f094742mr11666684ybt.51.1715087281881; Tue, 07
 May 2024 06:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
 <20240503151129.3901815-11-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-11-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 7 May 2024 15:07:51 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4js9jb3Q2tTKLo=3ueCPsQaezZ-FDyzHjJ14D0-Z7ttg@mail.gmail.com>
Message-ID: <CAN6tsi4js9jb3Q2tTKLo=3ueCPsQaezZ-FDyzHjJ14D0-Z7ttg@mail.gmail.com>
Subject: Re: [PATCH 10/14] drm/bridge: analogix_dp: move macro reset after
 link bandwidth setting
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
> Setting the link bandwidth may change the PLL parameters, which will caus=
e
> the PLL to go out of lock, so make sure to apply the MACRO_RST, which
> according to the comment is required to be pulsed after the PLL is locked=
.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index b4a47311cfe8..736b2ed745e1 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -243,6 +243,11 @@ static int analogix_dp_link_start(struct analogix_dp=
_device *dp)
>
>         /* Set link rate and count as you want to establish*/
>         analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
> +       /*
> +        * MACRO_RST must be applied after the PLL_LOCK to avoid
> +        * the DP inter pair skew issue for at least 10 us
> +        */
> +       analogix_dp_reset_macro(dp);
>         analogix_dp_set_lane_count(dp, dp->link_train.lane_count);
>
>         /* Setup RX configuration */
> @@ -565,12 +570,6 @@ static int analogix_dp_full_link_train(struct analog=
ix_dp_device *dp,
>         int retval =3D 0;
>         bool training_finished =3D false;
>
> -       /*
> -        * MACRO_RST must be applied after the PLL_LOCK to avoid
> -        * the DP inter pair skew issue for at least 10 us
> -        */
> -       analogix_dp_reset_macro(dp);
> -
>         /* Initialize by reading RX's DPCD */
>         analogix_dp_get_max_rx_bandwidth(dp, &dp->link_train.link_rate);
>         analogix_dp_get_max_rx_lane_count(dp, &dp->link_train.lane_count)=
;
> @@ -637,9 +636,12 @@ static int analogix_dp_fast_link_train(struct analog=
ix_dp_device *dp)
>         u8 link_align, link_status[2];
>         enum pll_status status;
>
> -       analogix_dp_reset_macro(dp);
> -
>         analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
> +       /*
> +        * MACRO_RST must be applied after the PLL_LOCK to avoid
> +        * the DP inter pair skew issue for at least 10 us
> +        */
> +       analogix_dp_reset_macro(dp);
>         analogix_dp_set_lane_count(dp, dp->link_train.lane_count);
>         analogix_dp_set_lane_link_training(dp);
>
> --
> 2.39.2
>

This patch does not apply on drm-misc/drm-misc-next as far as I can tell.
