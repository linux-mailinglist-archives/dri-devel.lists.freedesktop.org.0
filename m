Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2862C80E8EF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 11:18:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAFB10E566;
	Tue, 12 Dec 2023 10:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD43D10E566
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 10:18:44 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-28abca51775so160667a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 02:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702376324; x=1702981124; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KSUO831C0k3zJ4lMk/4vhFQk4D7Yty6lM+SDoI+HnHs=;
 b=fvgC7m0OwMaaq+4B7mIEJEmVXbTfWbrTrXaGl1uqzeshU+T0AfcWJo5CvD5SpfCogN
 mXvLtJHRLvjPErTA8QzMy9dhumJ1g05/I8OK2YY88WOfSX2aoXd0yyLtprKI9z/QFr4i
 2Nc0SqyQNDbmgos2uqYazk5+Zm2ZFg9/ZmXHNT5Co+MdZvAZti0/Jf2A9Gln3xCUbr6g
 lBbq3gMlkVXaGU3UGlpsfh4c32KP0QJq0E6v/PNZCbzXQtaBdBxbYX/IZp5pgO8X41j+
 w3k1U7KMg9QaDQGud/MLiyeTAEg3jdtocra324qRz5cxGgCC3DxQiksky6qcMkHz8Up1
 y9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702376324; x=1702981124;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KSUO831C0k3zJ4lMk/4vhFQk4D7Yty6lM+SDoI+HnHs=;
 b=JwcbYCffTqKPZofmUujCCPqCRwmdNgyIhO2O60cgWAHOD9xQHVOh/4xWtbvsuRo1bL
 9bPulX8ZZYIFylCMeOVRen7gmgdAbmCAdFDI0ZwVgPw+W5jJfXXlIBtPPV1kzqWYtLEV
 Em8O7hhX2Za74bB3+YTkC06X0VAHGlECkl3xWM3UO8aWEY/lufn9TmRQaPRHWdtas1es
 ZF9pMVDR9DEhPp/Ns2AENCQtGmgC1OY/fwnIZpgQnqevROoXvQQUBUAvJdP03iW4v0g6
 UV0Z0JANM0F0XQyb4VWpTxHMz+ejnLmBe9nNRBTk4267lXwlJmUE2Vgm2ViyxWHYFpC8
 5VEQ==
X-Gm-Message-State: AOJu0YwyMNxCOU0w1wRC1vp07ZPNrcWhJUMmEFS8lEYHyJP3puD/8Ry4
 StTWGXYKvlQGIKZpwhkMNVd7OINlt+3gVt2vYsw=
X-Google-Smtp-Source: AGHT+IEwr8qiMkSf+0nazlS52eBLr0olBbN55l3LGQ5Nkz92qoHujo9VaP50vK9sUbgPdB3EW5DvktPKkO1yQd48Xps=
X-Received: by 2002:a17:90b:ec7:b0:28a:3526:a404 with SMTP id
 gz7-20020a17090b0ec700b0028a3526a404mr2331746pjb.32.1702376324117; Tue, 12
 Dec 2023 02:18:44 -0800 (PST)
MIME-Version: 1.0
References: <20231212033259.189718-1-aford173@gmail.com>
 <6bdf9e39-e938-4644-b0ce-37191e1c00d2@kontron.de>
In-Reply-To: <6bdf9e39-e938-4644-b0ce-37191e1c00d2@kontron.de>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 12 Dec 2023 04:18:33 -0600
Message-ID: <CAHCN7xLSP22-37h7VfQScyVpW=-BcO6k+vvAqN0C+pVYo2=O-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: samsung-dsim: Set P divider based on
 min/max of fin pll
To: Frieder Schrempf <frieder.schrempf@kontron.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, aford@beaconembedded.com,
 Maxime Ripard <mripard@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 2:25=E2=80=AFAM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi Adam,
>
> On 12.12.23 04:32, Adam Ford wrote:
> > The P divider should be set based on the min and max values of
> > the fin pll which may vary between different platforms.
> > These ranges are defined per platform, but hard-coded values
> > were used instead which resulted in a smaller range available
> > on the i.MX8M[MNP] than what was possible.
> >
> > Fixes: 846307185f0f ("drm/bridge: samsung-dsim: update PLL reference cl=
ock")
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/br=
idge/samsung-dsim.c
> > index be5914caa17d..239d253a7d71 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -573,8 +573,8 @@ static unsigned long samsung_dsim_pll_find_pms(stru=
ct samsung_dsim *dsi,
> >       u16 _m, best_m;
> >       u8 _s, best_s;
> >
> > -     p_min =3D DIV_ROUND_UP(fin, (12 * MHZ));
> > -     p_max =3D fin / (6 * MHZ);
> > +     p_min =3D DIV_ROUND_UP(fin, (driver_data->pll_fin_max * MHZ));
> > +     p_max =3D fin / (driver_data->pll_fin_min * MHZ);
>
> I did some tinkering with the PLL settings the other day and this is
> literally one of the things I came up with.
>
> So I'm happy to provide:
>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>

Thank you!

> Regarding the P divider, I'm also wondering if there is an upper limit
> for the p-value (not for the resulting fin_pll) that we should take into
> account, too. The problem is that we have conflicts in the documentation
> (again) so we don't really know what the correct limit would be.
>
> There are the following ranges given in the RMs:
>
> * 1..63 (i.MX8MM RM 13.7.8.18.4)
> * 1..33 (i.MX8MM RM 13.7.10.1)
> * 1..63 (i.MX8MP RM 13.2.3.1.5.2)
> * 1..63 (i.MX8MP RM 13.7.2.4)

1...63 (i.IMX8MN RM 13.7.2.4)
>
> Unfortunately there are similar discrepancies for the other parameters
> and limits.

For what it's worth, I compared these values to the NXP downstream
branch [1], and they seemed to indicate the values were as follows:

.p =3D { .min =3D 1, .max =3D 63, },
.m =3D { .min =3D 64, .max =3D 1023, },
.s =3D { .min =3D 0, .max =3D 5, },
.k =3D { .min =3D 0, .max =3D 32768, }, /* abs(k) */
.fin =3D { .min =3D 6000, .max =3D 300000, }, /* in KHz */
.fpref =3D { .min =3D 2000, .max =3D 30000, }, /* in KHz */
.fvco =3D { .min =3D 1050000, .max =3D 2100000, }, /* in KHz */

In a previous commit [2], I mentioned the fact that I reached out to
NXP asking about the discrepancies and my NXP Rep and I received the
response:

"Yes it is definitely wrong, the one that is part of the NOTE in
MIPI_DPHY_M_PLLPMS register table against PMS_P, PMS_M and PMS_S is
not correct. I will report this to Doc team, the one customer should
be take into account is the Table 13-40 DPHY PLL Parameters and the
Note above."

adam

[1] - https://github.com/nxp-imx/linux-imx/blob/lf-6.1.y/drivers/gpu/drm/im=
x/sec_mipi_pll_1432x.h#L38C1-L47C1
[2] - https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/c=
ommit/drivers/gpu/drm/bridge/samsung-dsim.c?h=3Dnext-20231212&id=3D54f1a83c=
72250b182fa7722b0c5f6eb5e769598d

>
> Thanks
> Frieder
>
> >
> >       for (_p =3D p_min; _p <=3D p_max; ++_p) {
> >               for (_s =3D 0; _s <=3D 5; ++_s) {
>
