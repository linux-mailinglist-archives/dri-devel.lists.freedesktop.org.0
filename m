Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92584791098
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 06:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99D410E28D;
	Mon,  4 Sep 2023 04:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A584910E28D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 04:39:12 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-52c74a2e8edso1425547a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 21:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693802351; x=1694407151; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zai6pQtazglqz8kDEJ8B8RnVR840k0ZXmvJDFgMRz6I=;
 b=bRzo61zKqrJuuW7czmBLmfhtyAxsk86aTOjRg8F98ERorzjkp9QeWz9UNZFGZxlM5Q
 blgNIDzGwYfibG6VBJEpA0biCkFv8tROVD4E1eo3amZ6t4L2HLRft0uk82j3vXyGsou2
 9ZISeKzfVQd8nVv8t4w9v1qAPA8qbaej0wM7CjueUqPduSPmkawYyQfjXkpjspIe51DE
 /F7M/IuR6MBxScVsx7R5E0bbYz1dhwJt486kev+3z5RJlEj8t+642zlI6xh2VQ/J4rSh
 Pqb5L4TkrGRc8wLTE+lJhxmeyZqlBvsaNp3gxXKPBuTXG62kvPQ2Qb7Q0I/1bLwilXJS
 Vlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693802351; x=1694407151;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zai6pQtazglqz8kDEJ8B8RnVR840k0ZXmvJDFgMRz6I=;
 b=AmSuGDPqIMZ6jwAPmi0BVaXXF/mt8xhUmvNDU9xhr9uRzXdjyr7RizlIXYSA6tXVO+
 Kg1GI61dA2I7hymx5Du8zw5IUmpypspZt/KsSA3b8NqOBjpwTr+Ba4X7bHMPTtDFZTjT
 hq+JJmisYThj+l1u9Zb7Pj2lVjhuCLQ9hz4mtx2Y0bhIbhMa4mKc0Z1KBZistG9k3RNj
 VHSJKHhYXG6gk7d/We7MVfYxlXqueTXfvDImWK57nxz+ilEzY4ySqMb01ptjfb6KWC7R
 k3r0TCJuoca5QiVQ1gzWBsktmLwthpPVagbqny51pL6pyufz2vT8wXegTqOnXs6qqzQG
 Niaw==
X-Gm-Message-State: AOJu0YzBNXB2iLojp8H3IrK0ijGmVtwQBNc/ouF14kEXjjuHRYIz3OPR
 uN50VTGWNoNYF3Npvfe1QarEeywtTKDHi+62fZM=
X-Google-Smtp-Source: AGHT+IFq9ARrNEcYLIVZ5msETKzqjI5MvFo6Q9yv0et+z12YNwGoM/pI9g8OSeAZROzWsBCI/ZeXdtvXgoGhLPzkjV4=
X-Received: by 2002:aa7:d58f:0:b0:52b:d169:b374 with SMTP id
 r15-20020aa7d58f000000b0052bd169b374mr7398932edq.3.1693802350757; Sun, 03 Sep
 2023 21:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <20230818-samsung-dsim-v1-2-b39716db6b7a@pengutronix.de>
In-Reply-To: <20230818-samsung-dsim-v1-2-b39716db6b7a@pengutronix.de>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 4 Sep 2023 13:38:33 +0900
Message-ID: <CAAQKjZOuRVsF7vE6ghBG7KH_QkE-5_UXjXMY080ynzZLpDjs7w@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/bridge: samsung-dsim: reread ref clock before
 configuring PLL
To: Michael Tretter <m.tretter@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, kernel@pengutronix.de,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

2023=EB=85=84 8=EC=9B=94 29=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 12:59, =
Michael Tretter <m.tretter@pengutronix.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:

>
> The PLL reference clock may change at runtime. Thus, reading the clock
> rate during probe is not sufficient to correctly configure the PLL for
> the expected hs clock.
>
> Read the actual rate of the reference clock before calculating the PLL
> configuration parameters.
>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 16 +++++++++-------
>  include/drm/bridge/samsung-dsim.h     |  1 +
>  2 files changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 6778f1751faa..da90c2038042 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -611,7 +611,12 @@ static unsigned long samsung_dsim_set_pll(struct sam=
sung_dsim *dsi,
>         u16 m;
>         u32 reg;
>
> -       fin =3D dsi->pll_clk_rate;
> +       if (dsi->pll_clk)
> +               fin =3D clk_get_rate(dsi->pll_clk);
> +       else
> +               fin =3D dsi->pll_clk_rate;
> +       dev_dbg(dsi->dev, "PLL ref clock freq %lu\n", fin);
> +

Could you share us the actual use case that in runtime the pll
reference clock can be changed?

This patch is trying to change clock binding behavior which is
described in dt binding[1]
[1] Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml

It says,
"DISM oscillator clock frequency. If absent, the clock frequency of
sclk_mipi will be used instead."

However, this patch makes the sclk_mipi to be used first.

Thanks,
Inki Dae

>         fout =3D samsung_dsim_pll_find_pms(dsi, fin, freq, &p, &m, &s);
>         if (!fout) {
>                 dev_err(dsi->dev,
> @@ -1821,18 +1826,15 @@ static int samsung_dsim_parse_dt(struct samsung_d=
sim *dsi)
>         u32 lane_polarities[5] =3D { 0 };
>         struct device_node *endpoint;
>         int i, nr_lanes, ret;
> -       struct clk *pll_clk;
>
>         ret =3D samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequen=
cy",
>                                        &dsi->pll_clk_rate, 1);
>         /* If it doesn't exist, read it from the clock instead of failing=
 */
>         if (ret < 0) {
>                 dev_dbg(dev, "Using sclk_mipi for pll clock frequency\n")=
;
> -               pll_clk =3D devm_clk_get(dev, "sclk_mipi");
> -               if (!IS_ERR(pll_clk))
> -                       dsi->pll_clk_rate =3D clk_get_rate(pll_clk);
> -               else
> -                       return PTR_ERR(pll_clk);
> +               dsi->pll_clk =3D devm_clk_get(dev, "sclk_mipi");
> +               if (IS_ERR(dsi->pll_clk))
> +                       return PTR_ERR(dsi->pll_clk);
>         }
>
>         /* If it doesn't exist, use pixel clock instead of failing */
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsu=
ng-dsim.h
> index 05100e91ecb9..31ff88f152fb 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -87,6 +87,7 @@ struct samsung_dsim {
>         void __iomem *reg_base;
>         struct phy *phy;
>         struct clk **clks;
> +       struct clk *pll_clk;
>         struct regulator_bulk_data supplies[2];
>         int irq;
>         struct gpio_desc *te_gpio;
>
> --
> 2.39.2
>
