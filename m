Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 233796F6CF0
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 15:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC89910E503;
	Thu,  4 May 2023 13:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5E110E503
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 13:30:34 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6436e004954so607998b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 May 2023 06:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683207034; x=1685799034;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e5zsZyieTVAbp2iRxHeQ6n3AI+4u6cFOmhvnnOshY8E=;
 b=E8quQU+cUGSfXkNGJShwkhCuwJjqDNhbti1Y4b019xq7w0dS++lpvHBnw2QSiPSMxf
 LuaeypMAOIiyIfqmCxiwOluwfRTIaPBV06A3yuXOOw68c+y+gwSWyYIvdBKbkecsq86g
 rR1Lo6wYkHJ9bzswQzSinQmcnFfnxTIh8udre29Nn5LNn8TIL0wdjy3U8YqRqmVp4MPh
 KlGchG1khmNbJejhidFwncu9YWgxYxy7yR0QUHcGmyzfNAXaVC7+k5KLExoIyyx/OmdC
 fuygIFZeSYM1hC9gq3ehmbFmmqkcGJYRQYzuXUquMc6nlq418nnDWvH98RG5Xbd54vLu
 Y6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683207034; x=1685799034;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e5zsZyieTVAbp2iRxHeQ6n3AI+4u6cFOmhvnnOshY8E=;
 b=IAxyHrLFS/n4hGXU6w7MRRoZfe6RRcKdsppLsyq2Piv0MTrewLv1V9PTfsUunWRMMB
 6TgAbpZePom/dU+lyKxmRuaSsa3V7OgjC4z+9zfmjHgvQWJtS2ByOyq55SvongNT6frq
 VNEmdHuDJNt44swrLZkNo2e1xBMXsmXnjDF45o3Pyurk7VIdhPHDjrr46gMHi66drkqP
 vPrXqoiKaPPO6E+CJbbVUrX8NOTbog+3NjuWhgcxRoeQFxwjcUsWIaa9Cw1ds2/Uy3R6
 IsiU5SJgHbNFzI0qKH96t/7qWRb2pJNN8TflkhR0ZQiWFCephyl8uhAvsZEx+GpBAZxZ
 NOBA==
X-Gm-Message-State: AC+VfDyxV28F6jDvXeJ4BaYe89NC/W+M18S7uUJgIXnvWBTWGOv0kxEj
 GdvfY9qRXRYPg3+Mp0B8KaRd28NVfMwjvH8hNnM=
X-Google-Smtp-Source: ACHHUZ5ffjYF492JruMj8ZfHqNuPp7FprBS7oBRNSilULYkqheWPo8hzmZDSdXYCqgXvwFMUg6B4PH7mh7jbtm4WC24=
X-Received: by 2002:a05:6a20:a226:b0:f5:6530:c7a8 with SMTP id
 u38-20020a056a20a22600b000f56530c7a8mr1766188pzk.22.1683207033691; Thu, 04
 May 2023 06:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230502010759.17282-1-aford173@gmail.com>
 <1759996.VLH7GnMWUR@steina-w>
 <CAHCN7x+Me-wbUNNyN9fJwg3KETE+0S2MfPOsAb=-CSuSUvZvPg@mail.gmail.com>
 <1856543.CQOukoFCf9@steina-w>
In-Reply-To: <1856543.CQOukoFCf9@steina-w>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 4 May 2023 08:30:22 -0500
Message-ID: <CAHCN7xKcpD5w640a-W3cofdY4g3uK=Vt_w2BMWOuz-Q6m4gjaQ@mail.gmail.com>
Subject: Re: [PATCH V3 3/7] drm: bridge: samsung-dsim: Fetch
 pll-clock-frequency automatically
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 4, 2023 at 8:18=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Donnerstag, 4. Mai 2023, 14:57:01 CEST schrieb Adam Ford:
> > On Thu, May 4, 2023 at 7:40=E2=80=AFAM Alexander Stein
> >
> > <alexander.stein@ew.tq-group.com> wrote:
> > > Hi Adam,
> > >
> > > Am Donnerstag, 4. Mai 2023, 14:00:08 CEST schrieb Adam Ford:
> > > > On Thu, May 4, 2023 at 4:21=E2=80=AFAM Alexander Stein
> > > >
> > > > <alexander.stein@ew.tq-group.com> wrote:
> > > > > Am Dienstag, 2. Mai 2023, 03:07:55 CEST schrieb Adam Ford:
> > > > > > Make the pll-clock-frequency optional.  If it's present, use it
> > > > > > to maintain backwards compatibility with existing hardware.  If=
 it
> > > > > > is absent, read clock rate of "sclk_mipi" to determine the rate=
.
> > > > > >
> > > > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > > > > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > > > ---
> > > > > >
> > > > > >  drivers/gpu/drm/bridge/samsung-dsim.c | 12 ++++++++++--
> > > > > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > > > b/drivers/gpu/drm/bridge/samsung-dsim.c index
> > > > > > bf4b33d2de76..2dc02a9e37c0
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > > > @@ -1726,12 +1726,20 @@ static int samsung_dsim_parse_dt(struct
> > > > > > samsung_dsim *dsi) {
> > > > > >
> > > > > >       struct device *dev =3D dsi->dev;
> > > > > >       struct device_node *node =3D dev->of_node;
> > > > > >
> > > > > > +     struct clk *pll_clk;
> > > > > >
> > > > > >       int ret;
> > > > > >
> > > > > >       ret =3D samsung_dsim_of_read_u32(node,
> > > > > >       "samsung,pll-clock-frequency",
> > > > > >
> > > > > >                                      &dsi->pll_clk_rate);
> > > > > >
> > > > > > -     if (ret < 0)
> > > > > > -             return ret;
> > > > > > +
> > > > > > +     /* If it doesn't exist, read it from the clock instead of
> > > > > > failing
> > > > > > */
> > > > > > +     if (ret < 0) {
> > > > > > +             pll_clk =3D devm_clk_get(dev, "sclk_mipi");
> > > > > > +             if (!IS_ERR(pll_clk))
> > > > > > +                     dsi->pll_clk_rate =3D clk_get_rate(pll_cl=
k);
> > > > > > +             else
> > > > > > +                     return PTR_ERR(pll_clk);
> > > > > > +     }
> > > > >
> > > > > Now that 'samsung,pll-clock-frequency' is optional the error in
> > > > > samsung_dsim_of_read_u32() should be changed. Otherwise you will =
get
> > > > >
> > > > > > /soc@0/bus@32c00000/dsi@32e10000: failed to get 'samsung,pll-cl=
ock-
> > > > >
> > > > > frequency' property
> > > >
> > > > I'll change the message from err to info with a message that reads =
"no
> > > > samsung,pll-clock-frequency, using pixel clock"
> > > >
> > > > Does that work?
> > >
> > > Having just a info is totally fine with me. Thanks.
> > > Although your suggested message somehow implies (to me) using pixel c=
lock
> > > is just a fallback. I'm a bit concerned some might think
> > > "samsung,pll-clock- frequency" should be provided in DT. But this mig=
ht
> > > just be me.
> >
> > Oops, I got the PLL and burst burst clock confused.  I think both
> > burst-clock and pll clock messages should get updates.
> >
> > The pll clock should say something like "samsung,pll-clock-frequency
> > not defined, using sclk_mipi"
> >
> > The imx8m n/m/p have the sclk_mipi defined in the device tree, and
> > this patch allows them to not have
> > to manually set the pll clock since it can be read.  This allows to
> > people to change the frequency of the PLL in
> > in one place and let the driver read it instead of having to set the
> > value in two places for the same clock.
>
> That's why I would like to make it sound less error-like.
> How about "Using sclk_mipi for pll clock frequency"?
>
> > For the burst clock, I'd like to propose
> > "samsung,burst-clock-frequency not defined, using pixel clock"
>
> Similar to above how about "Using pixel clock for burst clock frequency"?

I like that.

>
> > Does that work for you?
>
> But I'm okay with both ways. Up to you.

 I'll wait another day or two to see if anyone else has any feedback,
and I'll submit V4 with some other items addressed too.

Thank you for your review!

adam

>
> Thanks and best regards,
> Alexander
>
>
> > > frequency
> > >
> > >
> > > Best regards,
> > > Alexander
> > >
> > > > adam
> > > >
> > > > > Best regards,
> > > > > Alexander
> > > > >
> > > > > >       ret =3D samsung_dsim_of_read_u32(node, "samsung,burst-clo=
ck-
> > > > >
> > > > > frequency",
> > > > >
> > > > > >                                      &dsi->burst_clk_rate);
> > > > >
> > > > > --
> > > > > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 See=
feld, Germany
> > > > > Amtsgericht M=C3=BCnchen, HRB 105018
> > > > > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, =
Stefan Schneider
> > > > > http://www.tq-group.com/
> > >
> > > --
> > > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld=
, Germany
> > > Amtsgericht M=C3=BCnchen, HRB 105018
> > > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stef=
an Schneider
> > > http://www.tq-group.com/
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>
