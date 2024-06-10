Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCDB9020D8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 13:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D43410E1D2;
	Mon, 10 Jun 2024 11:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sLZ1gIZ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F2710E345
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 11:56:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 97323CE130D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 11:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D34DC4AF63
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 11:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718020583;
 bh=kv8PfW7sT6WPzyG1imjSjaRyNaJ4MzIY6YMO4SL7ECk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sLZ1gIZ6w3o8PkaaKyaQKAUa1rJGewFp/6rjgJVkcGyclF84OxXFzupAX3fL4mdaq
 h8UqS+JN4rFYuTKZN/lPnxIx3QhkKU+uNzqVMdyE/us3r/VqTj4yc2j5cBWLa9jEme
 dI9g7NwpU3/2mQ+YbKWYu0lHXX1vWwQJt0QNKCU7Wv20OHb3VZ4R6k9w/yGoUds+Zc
 gZ2uq4t4Knqp6rCLHXjEE5na/PQbqDCdhK7M5MoUm30VENOhiX5pMaQPmqclbLs+EC
 mLmKkc7qOcI6R4PCvOwBhXpIzCjpS58eanqU8/awbqm1IAUzamqFTt/mEgZ3NPy8KU
 vJhaGJhbyaxVg==
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-df78b040314so4247850276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 04:56:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX/dHPmkmYhAC2HyGZ8/G/owOEI76NRt+RIxvHB0D0pE1aq9O6jCTc6M45ZfnIcqYGshf+Zj2G0t+3Uw+dX6fSY7QN17LfzvPdujZNxx0TN
X-Gm-Message-State: AOJu0Yz9Y187hRY4sCs/6etH2vZwpCMQDF/mRZqZD6E7JMLzhL0Xb3Fn
 VzIVXTCPxBtOc7A+QXP34cybD7ByAZkq7eqETxeIyOLVfWJFscSNoMeurgGavfjxdyZG9FqcV7r
 cqeCnyL92nY9yytGIo97mq6fML+EIHIXXB/de+Q==
X-Google-Smtp-Source: AGHT+IGQisIzvOX5qdhL2+YdNLcxMsgMAZrupqh/ejWYIXF9j4p2gncloTwF653234Rp7SUaIvgTUTcW+9wXqCigJN4=
X-Received: by 2002:a25:ac01:0:b0:dfa:9484:686f with SMTP id
 3f1490d57ef6-dfaf65e6758mr7576966276.22.1718020582581; Mon, 10 Jun 2024
 04:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
 <20240503151129.3901815-14-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-14-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 10 Jun 2024 13:56:11 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5Q3uYi6ZUptV_5jktk1JeuX_c0dM2gnyP+tM6Y1sj5Lw@mail.gmail.com>
Message-ID: <CAN6tsi5Q3uYi6ZUptV_5jktk1JeuX_c0dM2gnyP+tM6Y1sj5Lw@mail.gmail.com>
Subject: Re: [PATCH 13/14] drm/bridge: analogix_dp: only read AUX status when
 an error occured
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
> All AUX error responses raise the AUX_ERR interrupt, so there is no
> need to read the AUX status register in normal operation. Only read
> the status when an error occured and we can expect a different status
> than OK.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.c
> index 143a78b1d156..0f016dca9f3d 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -924,7 +924,6 @@ ssize_t analogix_dp_transfer(struct analogix_dp_devic=
e *dp,
>                              struct drm_dp_aux_msg *msg)
>  {
>         u32 reg;
> -       u32 status_reg;
>         u8 *buffer =3D msg->buffer;
>         unsigned int i;
>         int ret;
> @@ -1011,12 +1010,14 @@ ssize_t analogix_dp_transfer(struct analogix_dp_d=
evice *dp,
>
>         /* Clear interrupt source for AUX CH access error */
>         reg =3D readl(dp->reg_base + ANALOGIX_DP_INT_STA);
> -       status_reg =3D readl(dp->reg_base + ANALOGIX_DP_AUX_CH_STA);
> -       if ((reg & AUX_ERR) || (status_reg & AUX_STATUS_MASK)) {
> +       if ((reg & AUX_ERR)) {
> +               u32 aux_status =3D readl(dp->reg_base + ANALOGIX_DP_AUX_C=
H_STA) &
> +                                AUX_STATUS_MASK;
> +
>                 writel(AUX_ERR, dp->reg_base + ANALOGIX_DP_INT_STA);
>
>                 dev_warn(dp->dev, "AUX CH error happened: %#x (%d)\n",
> -                        status_reg & AUX_STATUS_MASK, !!(reg & AUX_ERR))=
;
> +                        aux_status, !!(reg & AUX_ERR));
>                 goto aux_error;
>         }
>
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
