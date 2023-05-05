Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 272C16F87B9
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 19:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7147410E041;
	Fri,  5 May 2023 17:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3047410E041
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 17:36:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9562163F86
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 17:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D86C433A8
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 17:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683308194;
 bh=w4Z1MEcrGAUorgRMVjLaEf7C6XDfZ1w1NUIKHP+j/Es=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=j8TQNIHvpjg5DuFZo7Wxzfx5mlTTF/ud0veNC2AVePcYLEMgPEqw+ZMmO0aen9ypu
 y1uWY9bLsmr0pDSj74rA5SeVgX2j/Yo0ryjAKaGIUdKPbsLtWY7RKiVKOjdFhUDBvo
 qMi+ISWkBs+0F2MsF5vOX9x4nCj4nvJ2OV5Jf+u8EviTA/I+gziP/1ypK6mslucP2z
 UbTop4F5lOeG9mnTSmVImhOim3F7nfn+dsvd2TXhQ5rmaszxGHlpN8PPy3QnuRmrY1
 03ew6tXqpJfHVWdZ9BLxZnDSTC1INqG36brUyfbY3FQCKjCy5Hn/xYOIeB2078toqi
 asaRf9Tv8rqwQ==
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-24decf5cc03so1518112a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 10:36:34 -0700 (PDT)
X-Gm-Message-State: AC+VfDwhyFD5CBgy733SNdF/0hOnmYUo56C0ubId2O01BwX/ffBAESyK
 h2USUaH2Ml+gHK29x9hOKWubh5al/9MlZSlDWK+MEA==
X-Google-Smtp-Source: ACHHUZ7ZCkzKI9Zaj5jP68h8v7c3MU5c5EOrbQarPjcriROyALxtFHt7soa6bh0tc7EgfxTGjlAUFy6dhdsP4YQexPo=
X-Received: by 2002:a17:90a:c282:b0:247:ad6d:7250 with SMTP id
 f2-20020a17090ac28200b00247ad6d7250mr2419176pjt.12.1683308194060; Fri, 05 May
 2023 10:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230427142934.55435-1-francesco@dolcini.it>
 <20230427142934.55435-3-francesco@dolcini.it>
In-Reply-To: <20230427142934.55435-3-francesco@dolcini.it>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 5 May 2023 19:36:23 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5qt9yK9PsOBOXBoUqrAhUPDjnfRgXWSdMqdSemS71Dvw@mail.gmail.com>
Message-ID: <CAN6tsi5qt9yK9PsOBOXBoUqrAhUPDjnfRgXWSdMqdSemS71Dvw@mail.gmail.com>
Subject: Re: [PATCH v1 2/9] drm/bridge: tc358768: fix PLL parameters
 computation
To: Francesco Dolcini <francesco@dolcini.it>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 27, 2023 at 4:35=E2=80=AFPM Francesco Dolcini <francesco@dolcin=
i.it> wrote:
>
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> According to Toshiba documentation the PLL input clock after the divider
> should be not less than 4MHz, fix the PLL parameters computation
> accordingly.
>
> Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/t=
c358768.c
> index 8f349bf4fc32..e9e3f9e02bba 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -334,13 +334,17 @@ static int tc358768_calc_pll(struct tc358768_priv *=
priv,
>                 u32 fbd;
>
>                 for (fbd =3D 0; fbd < 512; ++fbd) {
> -                       u32 pll, diff;
> +                       u32 pll, diff, pll_in;
>
>                         pll =3D (u32)div_u64((u64)refclk * (fbd + 1), div=
isor);
>
>                         if (pll >=3D max_pll || pll < min_pll)
>                                 continue;
>
> +                       pll_in =3D (u32)div_u64((u64)refclk, prd + 1);
> +                       if (pll_in < 4000000)
> +                               continue;
> +
>                         diff =3D max(pll, target_pll) - min(pll, target_p=
ll);
>
>                         if (diff < best_diff) {
> --
> 2.25.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
