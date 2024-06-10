Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FC09020EB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 13:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6267510E12A;
	Mon, 10 Jun 2024 11:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d8ayLrHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B56010E12A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 11:58:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5B419CE132C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 11:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162A0C4AF51
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 11:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718020685;
 bh=POvMMbemgagGX/OsL8/KxXdQJWPxAsQm3y1/QOQKLbM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d8ayLrHYkgb+EvM/r7xlw/Z0kymTN4criLUnIcSJPYzYevf6mGV+aKDZ7teYSpE+q
 ssJwJn5a1eN0vzV1xeQP6XkvpF38RqhLDnGyfTQmd9xu9YsS5C7oJiPaL2DDcATkEa
 n8dky92BVglwUc14FAZ2fBu5IfFU8tKw463atZ9bTtXTm2EhTuTMvSON3lqa8CNbuS
 iWzuxR9G2E3jaof1ZgEa7Wdv0mC6LXEPJiXXxmtz6nigbMKBIYzyNHu1OxZmnfwREw
 Tfe1OZ3kY+QlCmVGAdwQZOmdhWtRVixr/W0k35M+B9QJ3RygkmbjfgPEngMzIHewZZ
 YOiQ90oOxJIbw==
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-df771b6cf71so4368860276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 04:58:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUuXOtu2gNwN5wHA6S9V9dyyu2x6qfi8iCKi7/KL25MogsuPP+SbDwNyHj/vinXASV3LzlAlzKPpP0ZMHCBAD97rNCmAO3keDa16zwspSIs
X-Gm-Message-State: AOJu0YyvglsQJ514VCMR6ojZ+ISUQOkaTpdrrYxmoVrgl5QoASgDh0fU
 PYqL/hioSH7GM5LwRyPCqOCZXYUVKsiS6Vm9Y+U8pQqxOBsjPsSrojbJRx1uh80eK2y2HQJYfpe
 I9rJGntO7zd8PimUg6bTpQd+RUCKOc6Jolt2bxQ==
X-Google-Smtp-Source: AGHT+IGintgEC/j4dYDyfIa1RO+nKgzqYT4Sk+4nw62RjjN4n4XVnULBkA021mO0I8ht5rqnlR0mDzvCtFC5RHzQie4=
X-Received: by 2002:a25:360b:0:b0:dfb:cea:9a0f with SMTP id
 3f1490d57ef6-dfb0cea9cb7mr5934278276.8.1718020684307; Mon, 10 Jun 2024
 04:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
 <20240503151129.3901815-15-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-15-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 10 Jun 2024 13:57:52 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6Ppv2nARvfTzJnE_9fgDAdioj+QzBpFSd9JmJuRZBS6Q@mail.gmail.com>
Message-ID: <CAN6tsi6Ppv2nARvfTzJnE_9fgDAdioj+QzBpFSd9JmJuRZBS6Q@mail.gmail.com>
Subject: Re: [PATCH 14/14] drm/bridge: analogix_dp: handle AUX transfer
 timeouts
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
> Timeouts on the AUX bus are to be expected in certain normal operating
> conditions. There is no need to raise an error log or re-initialize the
> whole AUX state machine. Simply acknowledge the AUX_ERR interrupt and
> let upper layers know about the timeout.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 3 +++
>  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h | 9 +++++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.c
> index 0f016dca9f3d..3afc73c858c4 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -1016,6 +1016,9 @@ ssize_t analogix_dp_transfer(struct analogix_dp_dev=
ice *dp,
>
>                 writel(AUX_ERR, dp->reg_base + ANALOGIX_DP_INT_STA);
>
> +               if (aux_status =3D=3D AUX_STATUS_TIMEOUT_ERROR)
> +                       return -ETIMEDOUT;
> +
>                 dev_warn(dp->dev, "AUX CH error happened: %#x (%d)\n",
>                          aux_status, !!(reg & AUX_ERR));
>                 goto aux_error;
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.h
> index e284ee8da58b..12735139046c 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
> @@ -361,6 +361,15 @@
>  /* ANALOGIX_DP_AUX_CH_STA */
>  #define AUX_BUSY                               (0x1 << 4)
>  #define AUX_STATUS_MASK                                (0xf << 0)
> +#define AUX_STATUS_OK                          (0x0 << 0)
> +#define AUX_STATUS_NACK_ERROR                  (0x1 << 0)
> +#define AUX_STATUS_TIMEOUT_ERROR               (0x2 << 0)
> +#define AUX_STATUS_UNKNOWN_ERROR               (0x3 << 0)
> +#define AUX_STATUS_MUCH_DEFER_ERROR            (0x4 << 0)
> +#define AUX_STATUS_TX_SHORT_ERROR              (0x5 << 0)
> +#define AUX_STATUS_RX_SHORT_ERROR              (0x6 << 0)
> +#define AUX_STATUS_NACK_WITHOUT_M_ERROR                (0x7 << 0)
> +#define AUX_STATUS_I2C_NACK_ERROR              (0x8 << 0)
>
>  /* ANALOGIX_DP_AUX_CH_DEFER_CTL */
>  #define DEFER_CTRL_EN                          (0x1 << 7)
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>

This series has a few checkpath --strict warnings, could you fix those
and I'll merge v2?


Rob.
