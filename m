Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E82792160
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 11:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4939610E479;
	Tue,  5 Sep 2023 09:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FC110E478
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 09:18:40 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-52bca2e8563so3089723a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 02:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693905519; x=1694510319; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7285Q0BPUJS4AjXHwwaQDN150bP7NlXYvd7YB5q6cnI=;
 b=G305ZaCzv1YHxplIoxtjmY5dBZnFowxx7R2XVkk1ESC3xIExbBEQSFrIU0paZ/XUvK
 s9SsZMi22LGP/5Wq/Agvi+6NFseh2vFFw2ExI46E86hEld1HA31suXXCG7rmTlcygkUp
 uZX4T3k91vaWekUY6usGqwvZeEGl1Ugir3XaSqDQCBjwCie3TTtIDXuY/frna09Xm30X
 EPrsXod4+cV1cCARwjsIUwcOEH053K+sz5UpZ4yVqNumyyRbfzITYn+16e4e4t4b3v1X
 3djm/PHqL/swSom2Baz+Il5sQ++kUk+wodqcMI9SSF5ynHjytBy3bxsKaRDrxQ03mu+R
 w/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693905519; x=1694510319;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7285Q0BPUJS4AjXHwwaQDN150bP7NlXYvd7YB5q6cnI=;
 b=XhiURCajjsL4/EBvQqh6SS00HVEsJBbExLh/5k/atQXiEXNuszysI1bvKuzEaYJncC
 yKQ32drzAc6wwp+yrLTqLN7iA0AJ2Esr/lysQyoRdUdQQjYT/oOJBd+3EE36MagUDK6M
 P+iMrpkS2JHaa1Zf0sytBlbu3+vtEtDYnGq9xwOGR5EpRetWrzuwXkF/r8qmZ5Ioax9b
 vDW1omR22fYYDt8dg9SPigQU5bncO0ulkC96zZZP501hTVnC53o4peHTSXOFFfDvLPQz
 fX3JF+vkxGp6lLp/j3x3sy3bB7NWfdC5rtw16f4ORVknzoLfu3BDZq9w66NYNZNjZmAs
 dMwA==
X-Gm-Message-State: AOJu0Yyxl5wRESjrHS/86UFV7xteyUNuhxqKnhmXatY6h8GyBriu8bAg
 7rsO/bU7N4u30CaxBCNVud8ThI9pPS0wa+c8B7U=
X-Google-Smtp-Source: AGHT+IG80+yCL6hqxPRLpyl/TIbEROVavNAYNr7SkJxJ6/XeKQrqhbQs7MJKKY0FLpANWTlzShx8+xXmKDOb+W2ntkQ=
X-Received: by 2002:a05:6402:358:b0:523:d715:b7b0 with SMTP id
 r24-20020a056402035800b00523d715b7b0mr8863834edw.31.1693905518703; Tue, 05
 Sep 2023 02:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <20230818-samsung-dsim-v1-2-b39716db6b7a@pengutronix.de>
 <CAAQKjZOuRVsF7vE6ghBG7KH_QkE-5_UXjXMY080ynzZLpDjs7w@mail.gmail.com>
 <20230904110443.GB224131@pengutronix.de>
In-Reply-To: <20230904110443.GB224131@pengutronix.de>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 5 Sep 2023 18:18:26 +0900
Message-ID: <CAAQKjZMc76KqO3XaZCyhNVZF82_KqUfWy0WBOTUpAQ74pLEt8Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/bridge: samsung-dsim: reread ref clock before
 configuring PLL
To: Michael Tretter <m.tretter@pengutronix.de>
Content-Type: multipart/alternative; boundary="000000000000b9b91a0604991c9a"
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
 Jonas Karlman <jonas@kwiboo.se>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, kernel@pengutronix.de,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000b9b91a0604991c9a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2023=EB=85=84 9=EC=9B=94 4=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 8:05, Mi=
chael Tretter <m.tretter@pengutronix.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:

> On Mon, 04 Sep 2023 13:38:33 +0900, Inki Dae wrote:
> > 2023=EB=85=84 8=EC=9B=94 29=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 12:=
59, Michael Tretter <m.tretter@pengutronix.de>=EB=8B=98=EC=9D=B4
> =EC=9E=91=EC=84=B1:
> >
> > >
> > > The PLL reference clock may change at runtime. Thus, reading the cloc=
k
> > > rate during probe is not sufficient to correctly configure the PLL fo=
r
> > > the expected hs clock.
> > >
> > > Read the actual rate of the reference clock before calculating the PL=
L
> > > configuration parameters.
> > >
> > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > ---
> > >  drivers/gpu/drm/bridge/samsung-dsim.c | 16 +++++++++-------
> > >  include/drm/bridge/samsung-dsim.h     |  1 +
> > >  2 files changed, 10 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > index 6778f1751faa..da90c2038042 100644
> > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > @@ -611,7 +611,12 @@ static unsigned long samsung_dsim_set_pll(struct
> samsung_dsim *dsi,
> > >         u16 m;
> > >         u32 reg;
> > >
> > > -       fin =3D dsi->pll_clk_rate;
> > > +       if (dsi->pll_clk)
> > > +               fin =3D clk_get_rate(dsi->pll_clk);
> > > +       else
> > > +               fin =3D dsi->pll_clk_rate;
> > > +       dev_dbg(dsi->dev, "PLL ref clock freq %lu\n", fin);
> > > +
> >
> > Could you share us the actual use case that in runtime the pll
> > reference clock can be changed?
>
> On i.MX8M Nano, the VIDEO_PLL_CLK drives the DISPLAY_PIXEL_CLK_ROOT, whic=
h
> is
> used as pixel clock by the LCDIF. Changes to the pixel clock propagate to
> the
> VIDEO_PLL_CLK and may reconfigure the VIDEO_PLL_CLK. This is done to redu=
ce
> the error on the pixel clock.
>
> As the ADV3575 as MIPI-DSI device reconstructs the pixel clock, it is
> necessary to keep the pixel clock and MIDI-DSI reference clock in
> sync. This can be done by using the VIDEO_PLL_CLK to drive the PLL
> reference
> clock (MIPI_DSI_CORE_CLK_ROOT). Without this, a connected HDMI Monitor wi=
ll
> occasionally loose sync.
>
> In this setup, a mode change that changes the pixel clock may change the
> VIDEO_PLL, which will change the PLL reference clock.
>

Thanks for sharing.


> >
> > This patch is trying to change clock binding behavior which is
> > described in dt binding[1]
> > [1]
> Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> >
> > It says,
> > "DISM oscillator clock frequency. If absent, the clock frequency of
> > sclk_mipi will be used instead."
> >
> > However, this patch makes the sclk_mipi to be used first.
>
> No, the behavior, as described in the dt binding, is preserved by the hun=
k
> below. dsi->pll_clk is only set, if the samsung,pll-clock-frequency
> property
> is absent. If the dt property exists, dsi->pll_clk will be NULL and
> dsi->pll_clk_rate will be used here.
>

It's true. No behavior change. There was my mistake. Thanks. :)


> Michael
>
> >
> > Thanks,
> > Inki Dae
> >
> > >         fout =3D samsung_dsim_pll_find_pms(dsi, fin, freq, &p, &m, &s=
);
> > >         if (!fout) {
> > >                 dev_err(dsi->dev,
> > > @@ -1821,18 +1826,15 @@ static int samsung_dsim_parse_dt(struct
> samsung_dsim *dsi)
> > >         u32 lane_polarities[5] =3D { 0 };
> > >         struct device_node *endpoint;
> > >         int i, nr_lanes, ret;
> > > -       struct clk *pll_clk;
> > >
> > >         ret =3D samsung_dsim_of_read_u32(node,
> "samsung,pll-clock-frequency",
> > >                                        &dsi->pll_clk_rate, 1);
> > >         /* If it doesn't exist, read it from the clock instead of
> failing */
> > >         if (ret < 0) {
> > >                 dev_dbg(dev, "Using sclk_mipi for pll clock
> frequency\n");
> > > -               pll_clk =3D devm_clk_get(dev, "sclk_mipi");
> > > -               if (!IS_ERR(pll_clk))
> > > -                       dsi->pll_clk_rate =3D clk_get_rate(pll_clk);
> > > -               else
> > > -                       return PTR_ERR(pll_clk);
> > > +               dsi->pll_clk =3D devm_clk_get(dev, "sclk_mipi");
> > > +               if (IS_ERR(dsi->pll_clk))
> > > +                       return PTR_ERR(dsi->pll_clk);
> > >         }
> > >
> > >         /* If it doesn't exist, use pixel clock instead of failing */
> > > diff --git a/include/drm/bridge/samsung-dsim.h
> b/include/drm/bridge/samsung-dsim.h
> > > index 05100e91ecb9..31ff88f152fb 100644
> > > --- a/include/drm/bridge/samsung-dsim.h
> > > +++ b/include/drm/bridge/samsung-dsim.h
> > > @@ -87,6 +87,7 @@ struct samsung_dsim {
> > >         void __iomem *reg_base;
> > >         struct phy *phy;
> > >         struct clk **clks;
> > > +       struct clk *pll_clk;
> > >         struct regulator_bulk_data supplies[2];
> > >         int irq;
> > >         struct gpio_desc *te_gpio;
> > >
> > > --
> > > 2.39.2
> > >
> >
>

--000000000000b9b91a0604991c9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">2023=EB=85=84 9=EC=9B=94 4=EC=9D=BC (=EC=9B=94) =EC=98=
=A4=ED=9B=84 8:05, Michael Tretter &lt;<a href=3D"mailto:m.tretter@pengutro=
nix.de">m.tretter@pengutronix.de</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">On Mon, 04 Sep 2023 13:38:33 +=
0900, Inki Dae wrote:<br>
&gt; 2023=EB=85=84 8=EC=9B=94 29=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 12=
:59, Michael Tretter &lt;<a href=3D"mailto:m.tretter@pengutronix.de" target=
=3D"_blank" rel=3D"noreferrer">m.tretter@pengutronix.de</a>&gt;=EB=8B=98=EC=
=9D=B4 =EC=9E=91=EC=84=B1:<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; The PLL reference clock may change at runtime. Thus, reading the =
clock<br>
&gt; &gt; rate during probe is not sufficient to correctly configure the PL=
L for<br>
&gt; &gt; the expected hs clock.<br>
&gt; &gt;<br>
&gt; &gt; Read the actual rate of the reference clock before calculating th=
e PLL<br>
&gt; &gt; configuration parameters.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Michael Tretter &lt;<a href=3D"mailto:m.tretter@pe=
ngutronix.de" target=3D"_blank" rel=3D"noreferrer">m.tretter@pengutronix.de=
</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 drivers/gpu/drm/bridge/samsung-dsim.c | 16 +++++++++-------=
<br>
&gt; &gt;=C2=A0 include/drm/bridge/samsung-dsim.h=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 1 +<br>
&gt; &gt;=C2=A0 2 files changed, 10 insertions(+), 7 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/=
drm/bridge/samsung-dsim.c<br>
&gt; &gt; index 6778f1751faa..da90c2038042 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/bridge/samsung-dsim.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/bridge/samsung-dsim.c<br>
&gt; &gt; @@ -611,7 +611,12 @@ static unsigned long samsung_dsim_set_pll(st=
ruct samsung_dsim *dsi,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u16 m;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fin =3D dsi-&gt;pll_clk_rate;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dsi-&gt;pll_clk)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fin =3D c=
lk_get_rate(dsi-&gt;pll_clk);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fin =3D d=
si-&gt;pll_clk_rate;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(dsi-&gt;dev, &quot;PLL ref cl=
ock freq %lu\n&quot;, fin);<br>
&gt; &gt; +<br>
&gt; <br>
&gt; Could you share us the actual use case that in runtime the pll<br>
&gt; reference clock can be changed?<br>
<br>
On i.MX8M Nano, the VIDEO_PLL_CLK drives the DISPLAY_PIXEL_CLK_ROOT, which =
is<br>
used as pixel clock by the LCDIF. Changes to the pixel clock propagate to t=
he<br>
VIDEO_PLL_CLK and may reconfigure the VIDEO_PLL_CLK. This is done to reduce=
<br>
the error on the pixel clock.<br>
<br>
As the ADV3575 as MIPI-DSI device reconstructs the pixel clock, it is<br>
necessary to keep the pixel clock and MIDI-DSI reference clock in<br>
sync. This can be done by using the VIDEO_PLL_CLK to drive the PLL referenc=
e<br>
clock (MIPI_DSI_CORE_CLK_ROOT). Without this, a connected HDMI Monitor will=
<br>
occasionally loose sync.<br>
<br>
In this setup, a mode change that changes the pixel clock may change the<br=
>
VIDEO_PLL, which will change the PLL reference clock.<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for sharing.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<br>
&gt; <br>
&gt; This patch is trying to change clock binding behavior which is<br>
&gt; described in dt binding[1]<br>
&gt; [1] Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim=
.yaml<br>
&gt; <br>
&gt; It says,<br>
&gt; &quot;DISM oscillator clock frequency. If absent, the clock frequency =
of<br>
&gt; sclk_mipi will be used instead.&quot;<br>
&gt; <br>
&gt; However, this patch makes the sclk_mipi to be used first.<br>
<br>
No, the behavior, as described in the dt binding, is preserved by the hunk<=
br>
below. dsi-&gt;pll_clk is only set, if the samsung,pll-clock-frequency prop=
erty<br>
is absent. If the dt property exists, dsi-&gt;pll_clk will be NULL and<br>
dsi-&gt;pll_clk_rate will be used here.<br></blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">It&#39;s true. No behavior change. T=
here was my mistake. Thanks. :)</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Michael<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Inki Dae<br>
&gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fout =3D samsung_dsim_pll_find_p=
ms(dsi, fin, freq, &amp;p, &amp;m, &amp;s);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fout) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_=
err(dsi-&gt;dev,<br>
&gt; &gt; @@ -1821,18 +1826,15 @@ static int samsung_dsim_parse_dt(struct s=
amsung_dsim *dsi)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 lane_polarities[5] =3D { 0 }=
;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *endpoint;<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int i, nr_lanes, ret;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk *pll_clk;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D samsung_dsim_of_read_u32=
(node, &quot;samsung,pll-clock-frequency&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
amp;dsi-&gt;pll_clk_rate, 1);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If it doesn&#39;t exist, read=
 it from the clock instead of failing */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_=
dbg(dev, &quot;Using sclk_mipi for pll clock frequency\n&quot;);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pll_clk =
=3D devm_clk_get(dev, &quot;sclk_mipi&quot;);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!IS_E=
RR(pll_clk))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0dsi-&gt;pll_clk_rate =3D clk_get_rate(pll_clk);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return PTR_ERR(pll_clk);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dsi-&gt;p=
ll_clk =3D devm_clk_get(dev, &quot;sclk_mipi&quot;);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ER=
R(dsi-&gt;pll_clk))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return PTR_ERR(dsi-&gt;pll_clk);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If it doesn&#39;t exist, use =
pixel clock instead of failing */<br>
&gt; &gt; diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/brid=
ge/samsung-dsim.h<br>
&gt; &gt; index 05100e91ecb9..31ff88f152fb 100644<br>
&gt; &gt; --- a/include/drm/bridge/samsung-dsim.h<br>
&gt; &gt; +++ b/include/drm/bridge/samsung-dsim.h<br>
&gt; &gt; @@ -87,6 +87,7 @@ struct samsung_dsim {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *reg_base;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct phy *phy;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk **clks;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk *pll_clk;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct regulator_bulk_data suppl=
ies[2];<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int irq;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct gpio_desc *te_gpio;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.39.2<br>
&gt; &gt;<br>
&gt; <br>
</blockquote></div></div></div>

--000000000000b9b91a0604991c9a--
