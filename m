Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ECA6E577D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 04:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEE810E658;
	Tue, 18 Apr 2023 02:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF92E10E658
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 02:29:57 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-63b57c49c4cso1410315b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 19:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681784997; x=1684376997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=67tDMZwaozkC/4h2hdsCG2SkbsBh10T01ijQGIySkUo=;
 b=VJarTu7ueI5jKfXJfk+sjPdWWMUCCCD6nLfSLTw6040i2UYSycKSAllI/xAR7zCoYu
 OItvn0Oeemlm5n9LFQCXKTfuy8D8a0KV/HJTU9e5FTaY1m789aYYem58VdwQbzozMGuO
 o6DOc+DXHNLkHxf0SrVu/H9w/aiTxiARFSfOOmT1zNos5os7TTkg2fmWd4aIe8siOduN
 5cIo1HFO6CvnO5qWrKf7sYcZekO9EVXSC3gy7qjeeE0gr8lDbA8mAXZ8fd03elp3hfrL
 aHdZWThvlq6kFwPX927MP9zOSAuNMOusekXfci4qH8FVvoVgT2Bh2CF9FbRVPD+QpIoi
 y8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681784997; x=1684376997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=67tDMZwaozkC/4h2hdsCG2SkbsBh10T01ijQGIySkUo=;
 b=jDdESnZlAM4YHaR4+MSMDXIODShL/sKog4/6cw3yXQKIYCx+NnmIc92riXts8leygk
 lf+JNlRV5/b6tbuuYDY3VQ8BYLDo6cHBSE5zOLjzQAw5q5BxnQ49ZFH8xXa5y3+LaDnP
 Izwc66I/BVm2xED3bSFqtG/7kBtBNIGXbwFHAWKve40AvVJO1TkHPAQOxaUC+F5GOzqH
 C3OsuXG2NL+vqq+cYWN90j3mVIVHTeMKwjyTuOud8mCgTVZGVxSIQNV/5y2OhfwBtZ0f
 2Rh1mjVyj8b87hVdy3wHqjxsHqeyfv7k55gUlR63Anni5Hg5Vpfefbpwwj5dYDOZA99O
 m7aw==
X-Gm-Message-State: AAQBX9eu7PbNEVKnL3sduoaqd78DQ1nQwOEF9wauG+Oq28OVZOuDXeu3
 gKE2pdrtr0/+ZgHzFlaY34+eeWH892qYTYM+UMg=
X-Google-Smtp-Source: AKy350a8gUiMivOsGNvLuu+CPxSUKtbHvfaXMbOwAEVLwgvkJrDx2eY3Li4L6RzuwTjiYRjvOxHRH6bVfvLtalZZ9bI=
X-Received: by 2002:a17:902:e88e:b0:1a5:25db:5bc0 with SMTP id
 w14-20020a170902e88e00b001a525db5bc0mr217740plg.3.1681784996433; Mon, 17 Apr
 2023 19:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230415104104.5537-1-aford173@gmail.com>
 <20230415104104.5537-3-aford173@gmail.com>
 <7eed74e8-9f67-a410-3cec-f61a6db85238@denx.de>
In-Reply-To: <7eed74e8-9f67-a410-3cec-f61a6db85238@denx.de>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 17 Apr 2023 21:29:44 -0500
Message-ID: <CAHCN7xKw26TQ=t75TEDbEkA0mb9rnEwNW=7ei1=WFBZjiJMf=g@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm: bridge: samsung-dsim: Fetch pll-clock-frequency
 automatically
To: Marek Vasut <marex@denx.de>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 aford@beaconembedded.com, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, m.szyprowski@samsung.com,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 16, 2023 at 5:08=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> On 4/15/23 12:41, Adam Ford wrote:
> > Fetch the clock rate of "sclk_mipi" (or "pll_clk") instead of
> > having an entry in the device tree for samsung,pll-clock-frequency.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > ---
> >   drivers/gpu/drm/bridge/samsung-dsim.c | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/br=
idge/samsung-dsim.c
> > index 9fec32b44e05..73f0c3fbbdf5 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -1744,11 +1744,6 @@ static int samsung_dsim_parse_dt(struct samsung_=
dsim *dsi)
> >       struct device_node *node =3D dev->of_node;
> >       int ret;
> >
> > -     ret =3D samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequen=
cy",
> > -                                    &dsi->pll_clk_rate);
> > -     if (ret < 0)
> > -             return ret;
> > -
> >       ret =3D samsung_dsim_of_read_u32(node, "samsung,burst-clock-frequ=
ency",
> >                                      &dsi->burst_clk_rate);
> >       if (ret < 0)
>
> Does this break compatibility with old samsung DTs ?

My goal here was to declutter the device tree stuff and fetch data
automatically if possible. What if I changed this to make them
optional?  If they exist, we can use them, if they don't exist, we
could read the clock rate.  Would that be acceptable?

adam
