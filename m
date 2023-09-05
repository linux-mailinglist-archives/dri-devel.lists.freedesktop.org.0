Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF02D79216D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 11:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1894910E47E;
	Tue,  5 Sep 2023 09:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE8610E47C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 09:25:58 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-500b0f06136so4022018e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 02:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693905956; x=1694510756; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QHcYyoIiDgAQdHRNkCiPLRvJafQGkqn7cXLRB147Zwk=;
 b=SjIkn10DmwAUFRaTQfEnVrRaVeOYugC69vtIvjpOL9bI3qL7wriNZqnQlGjdF5So+h
 RHhqdPGBuz8Rkr1BkSfq50kSC8w5nuf7FT6rAEzTb91kJHEjvjdTvoap7y2uoTxLzEUh
 UCoa94HB0vn35m/eoHGuvwZj00XbJmqN4b1c6FaIevcr69oBZoo8dGVEMHGVLNn3rPfq
 AiIhfErXDoCtoLLzppjV2W0cphmpNCyGMVtRHtxOlVEq9/GNgRR7aAv1Zy4N/1p9WsdS
 q8p3bvSWXZC3VREArOXYWmJkMNb5ffpECCT9PTJnhGvA13TbvMlgcRKg2Q0Zp9b4iLIj
 VtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693905956; x=1694510756;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QHcYyoIiDgAQdHRNkCiPLRvJafQGkqn7cXLRB147Zwk=;
 b=CZstxuCcUxUkrzoFiVmLYNI53d28IOPWeNoNJS0ZKUcQhk7GUuAX/4H3WYzvts8Prs
 QDNLz7QF2UNYqzxDhHv0J0D1RnE58dfKC12fd6qcWDbl7U6v2l0KuzX7BirYZ0XDeFEb
 uuiXZak6NH7sPIR+TzONWGUX7QxvVg+hhUeCW3YAQ4EYu/W4qpQM00T97bh6w61wwd2e
 drgYbDnsTJqHubIK11X+20GcrsqW3uwX+DBU4PdXCWmTfO1bMZW+wprq+IlRZUd/L6+v
 4gsvZM6V4qQHSjAJhm2d00Nv3/lJkWwkyoq4uN93LxlkuxwPe4wns/8LtYcRNh2A4WCF
 WFNg==
X-Gm-Message-State: AOJu0YyZU+yRM8qLsbu5gtZs0T2md15Fv2fZtKERfntAuEdg7TGunEGE
 c0kq+qjUpNI4y0dsdZdmdLipozT/X7UqW9LtswI=
X-Google-Smtp-Source: AGHT+IEIAbucUJoykB1B/ZCoAVDLu/W06ff51fkzJJlHXvGCnq0BC1pkB1LQVeIAflThABeQKL5YoycM/Bg4ZYDQ8Yc=
X-Received: by 2002:a19:8c1d:0:b0:4f8:711b:18b0 with SMTP id
 o29-20020a198c1d000000b004f8711b18b0mr8209606lfd.3.1693905956134; Tue, 05 Sep
 2023 02:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <20230818-samsung-dsim-v1-2-b39716db6b7a@pengutronix.de>
In-Reply-To: <20230818-samsung-dsim-v1-2-b39716db6b7a@pengutronix.de>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 5 Sep 2023 18:25:44 +0900
Message-ID: <CAAQKjZPk-VEKt6GxfRDcRZgU8OzOgZc1hEoMZX2h2JSyccxx5Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/bridge: samsung-dsim: reread ref clock before
 configuring PLL
To: Michael Tretter <m.tretter@pengutronix.de>
Content-Type: multipart/alternative; boundary="000000000000cc651f060499364a"
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

--000000000000cc651f060499364a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2023=EB=85=84 8=EC=9B=94 29=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 12:59, =
Michael Tretter <m.tretter@pengutronix.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:

> The PLL reference clock may change at runtime. Thus, reading the clock
> rate during probe is not sufficient to correctly configure the PLL for
> the expected hs clock.
>
> Read the actual rate of the reference clock before calculating the PLL
> configuration parameters.
>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>


Reviewed-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 16 +++++++++-------
>  include/drm/bridge/samsung-dsim.h     |  1 +
>  2 files changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 6778f1751faa..da90c2038042 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -611,7 +611,12 @@ static unsigned long samsung_dsim_set_pll(struct
> samsung_dsim *dsi,
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
>         fout =3D samsung_dsim_pll_find_pms(dsi, fin, freq, &p, &m, &s);
>         if (!fout) {
>                 dev_err(dsi->dev,
> @@ -1821,18 +1826,15 @@ static int samsung_dsim_parse_dt(struct
> samsung_dsim *dsi)
>         u32 lane_polarities[5] =3D { 0 };
>         struct device_node *endpoint;
>         int i, nr_lanes, ret;
> -       struct clk *pll_clk;
>
>         ret =3D samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequen=
cy",
>                                        &dsi->pll_clk_rate, 1);
>         /* If it doesn't exist, read it from the clock instead of failing
> */
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
> diff --git a/include/drm/bridge/samsung-dsim.h
> b/include/drm/bridge/samsung-dsim.h
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
>

--000000000000cc651f060499364a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">2023=EB=85=84 8=EC=9B=94 29=EC=9D=BC (=ED=99=94) =EC=
=98=A4=EC=A0=84 12:59, Michael Tretter &lt;<a href=3D"mailto:m.tretter@peng=
utronix.de">m.tretter@pengutronix.de</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">The PLL reference clock may=
 change at runtime. Thus, reading the clock<br>
rate during probe is not sufficient to correctly configure the PLL for<br>
the expected hs clock.<br>
<br>
Read the actual rate of the reference clock before calculating the PLL<br>
configuration parameters.<br>
<br>
Signed-off-by: Michael Tretter &lt;<a href=3D"mailto:m.tretter@pengutronix.=
de" target=3D"_blank" rel=3D"noreferrer">m.tretter@pengutronix.de</a>&gt;<b=
r></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Reviewed-by: Inki Dae &lt;<a href=3D"mailto:inki.=
dae@samsung.com">inki.dae@samsung.com</a>&gt;</div><div dir=3D"auto">Acked-=
by: Inki Dae &lt;<a href=3D"mailto:inki.dae@samsung.com">inki.dae@samsung.c=
om</a>&gt;</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div>=
<div dir=3D"auto">Inki Dae</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
---<br>
=C2=A0drivers/gpu/drm/bridge/samsung-dsim.c | 16 +++++++++-------<br>
=C2=A0include/drm/bridge/samsung-dsim.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 10 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge=
/samsung-dsim.c<br>
index 6778f1751faa..da90c2038042 100644<br>
--- a/drivers/gpu/drm/bridge/samsung-dsim.c<br>
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c<br>
@@ -611,7 +611,12 @@ static unsigned long samsung_dsim_set_pll(struct samsu=
ng_dsim *dsi,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u16 m;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 reg;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fin =3D dsi-&gt;pll_clk_rate;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dsi-&gt;pll_clk)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fin =3D clk_get_rat=
e(dsi-&gt;pll_clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fin =3D dsi-&gt;pll=
_clk_rate;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(dsi-&gt;dev, &quot;PLL ref clock freq %=
lu\n&quot;, fin);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fout =3D samsung_dsim_pll_find_pms(dsi, fin, fr=
eq, &amp;p, &amp;m, &amp;s);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!fout) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dsi-&gt;dev=
,<br>
@@ -1821,18 +1826,15 @@ static int samsung_dsim_parse_dt(struct samsung_dsi=
m *dsi)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 lane_polarities[5] =3D { 0 };<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_node *endpoint;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i, nr_lanes, ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk *pll_clk;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D samsung_dsim_of_read_u32(node, &quot;sa=
msung,pll-clock-frequency&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;dsi-=
&gt;pll_clk_rate, 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If it doesn&#39;t exist, read it from the cl=
ock instead of failing */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_dbg(dev, &quot;=
Using sclk_mipi for pll clock frequency\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pll_clk =3D devm_cl=
k_get(dev, &quot;sclk_mipi&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!IS_ERR(pll_clk=
))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dsi-&gt;pll_clk_rate =3D clk_get_rate(pll_clk);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return PTR_ERR(pll_clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dsi-&gt;pll_clk =3D=
 devm_clk_get(dev, &quot;sclk_mipi&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(dsi-&gt;=
pll_clk))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return PTR_ERR(dsi-&gt;pll_clk);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If it doesn&#39;t exist, use pixel clock ins=
tead of failing */<br>
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung=
-dsim.h<br>
index 05100e91ecb9..31ff88f152fb 100644<br>
--- a/include/drm/bridge/samsung-dsim.h<br>
+++ b/include/drm/bridge/samsung-dsim.h<br>
@@ -87,6 +87,7 @@ struct samsung_dsim {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void __iomem *reg_base;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct phy *phy;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct clk **clks;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk *pll_clk;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct regulator_bulk_data supplies[2];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int irq;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gpio_desc *te_gpio;<br>
<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div></div></div>

--000000000000cc651f060499364a--
