Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B07D627413
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 02:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BE910E255;
	Mon, 14 Nov 2022 01:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFB910E255
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 01:11:30 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id s204so4268089vkb.3
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 17:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l2JJJpT0ZAjed7VELB5YPuXJMHJUvXdHN4Gx50WFZ2Q=;
 b=dbe3cQHbcFqonNsjvCZQxgrzGLGy8dfsGA55BO3FuXHwPkRofmYZFbA+gd7jJDCmc8
 Qa8IXmkZIB6FVJETBpi2t5ZBpgw8T5c4MPh2DqY9K57vX/1/xhcif4E04r/vao7gwLv6
 s7voBGiIy4NEzxwqdVANa8ZMpEDvndGprBV6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l2JJJpT0ZAjed7VELB5YPuXJMHJUvXdHN4Gx50WFZ2Q=;
 b=xK65vmZx04/zcLdkdrHPtA7dSEvCQ2HEC/u2kOUrZPY3WpjZTmUkJ0nDYeO1RExzcd
 CyntiBuF7u7faY0pl4KPTWwll/7ssuC+KVX7SJF0gR36r/XKCyJpnWeS3V9oOtX+wm5U
 qPkRvqfbLTzwt5iSfs37lJkoRf5quxNjy6GqiXvjhSe7JvmwS2XF79sjpcmMdUMb3bun
 1XJN7KDyzRSjAqpdcvqpOgWkIvcXViysj8Vmf1hVeiZQS+yaJXoGDmSoAflXercHukm3
 vtqfHS5R8pUCBe8AN+/pA3e5o43RLuxekFQSV+q8JQiljFIgVPqcNXaasJIhw8FoA4Fu
 qvIg==
X-Gm-Message-State: ANoB5pkBSwPDCLyDXyZy2Rvi27w2O2l/gz3aptbVv61YIx1+JZ9VRHaQ
 lX6ikY99sDUqrEUtsbFAWjYbnCiY558yC1HT+ybN0g==
X-Google-Smtp-Source: AA0mqf7OCNSTYyU8cwy8NjWFqYTpVq0mYrZ6+3c5WtDvjw5nmr5nQzFmn/CpTIoO/+6tW19gfFk+dUy7QDooVct8Z7o=
X-Received: by 2002:a05:6122:1786:b0:3b8:a3f9:be82 with SMTP id
 o6-20020a056122178600b003b8a3f9be82mr5348280vkf.18.1668388288785; Sun, 13 Nov
 2022 17:11:28 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-2-jagan@amarulasolutions.com>
 <CANMq1KCHQExVVp1jHjhRB2pMqeFFE1Cg1GVmnN83v=z1KzJt0Q@mail.gmail.com>
 <CAMty3ZBC3pbWf4yixjv4DZWFR+fYkPctiL3hzubgY8RF4ZGHmA@mail.gmail.com>
 <CANMq1KDmF+cMo8qZh7UyM1vyZ6BD_cFPc6j2MNMNPFiutqxL3w@mail.gmail.com>
 <c82a77f3-17a1-1b59-96da-924daae3678c@denx.de>
In-Reply-To: <c82a77f3-17a1-1b59-96da-924daae3678c@denx.de>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 14 Nov 2022 09:11:17 +0800
Message-ID: <CANMq1KBMJDcfcbfYGtRj+MDJgFKg_i5Rw6ZJuoZy0D_kzkob3Q@mail.gmail.com>
Subject: Re: [PATCH v8 01/14] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 13, 2022 at 8:29 AM Marek Vasut <marex@denx.de> wrote:
>
> On 11/11/22 13:12, Nicolas Boichat wrote:
>
> [...]
>
> >>> BTW, are you sure DSIM_HSE_MODE is correct now?
> >>
> >> Yes, we have tested in imx8m platforms as well. S=C3=A9bastien Szymans=
ki
> >> initially observed this issue on the imx8m platform.
> >
> > I'll repeat, are you sure about HSE specifically? You invert the
> > polarity for HBP, HFP, and HSA, which makes sense given your patch
> > 02/14.
> >
> > I'm concerned about HSE. Is the bit really a disable bit?
> > MIPI_DSI_MODE_VIDEO_HSE is supposed to be an enable flag, so you
> > should not do `reg |=3D DSIM_HSE_DISABLE;`, probably.
>
> I suspect the HSE bit is a misnomer, but its handling in the driver is
> correct.
>
> i.MX 8M Plus Applications Processor Reference Manual, Rev. 1, 06/2021
> Page 5436
>
> 23 HseDisableMode
>
> In Vsync pulse and Vporch area, MIPI DSI master transfers only Hsync
> start packet to MIPI DSI slave at MIPI DSI spec 1.1r02. This bit
> transfers Hsync end packet in Vsync pulse and Vporch area (optional).
>
> 0 =3D Disables transfer
> 1 =3D Enables transfer
>
> In command mode, this bit is ignored.

Okay. I'd suggest adding a comment in the code, it'd be so tempting to
attempt to "fix" this as the if/or pattern looks different from the
others.

But it's up to you all.

Thanks,
