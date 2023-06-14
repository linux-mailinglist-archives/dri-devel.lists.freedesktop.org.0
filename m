Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA04572F8FD
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 11:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D7D10E115;
	Wed, 14 Jun 2023 09:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5132F10E115
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 09:24:34 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-bd61dd9a346so446980276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 02:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686734673; x=1689326673;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sDzVk9mbx2ENLo9ymz2uOt/ZtkFOrIJEhlU5orTbleQ=;
 b=sde83aXm1cl1eZQWPUv7ef+5jywB0AT6IWQ30gacpvABRNtKMw94Dd7ZMWzR0lgost
 qw01q9JSxV4mezvX0Yp7sZ3hCGOdmxZIegCf26C+2vIK/8TapigQviaNwjGraNAhDioP
 cs0CyUcn34b3U5AkmyftkpDQP2fcRyavmf/WwK8aISCf1tYuzB9cJY/+mwuh0b8qedYw
 31tM/L+CLjRjwmKsq4smKSDTNFlWItQqQVbIfFd0XY5fFdCnjxV4QIv8QlRuDk7wDeXu
 Fwx9Ls7qlw2G2P1Rjh7dFNYIPazvD3lYTSeZtOhsylmAM4nkmhhbkOS5AH8NVk7+JIpm
 suMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686734673; x=1689326673;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sDzVk9mbx2ENLo9ymz2uOt/ZtkFOrIJEhlU5orTbleQ=;
 b=IzuwELq84Ahw3DV4tm2rA6CCFVeES+EBRUGsDsMy6/W4mNgsBoHAxHm7dvgYUAh6X+
 vaIWr5scRoVc7yEJ+anAOwCBCeezsIdShfmqThhVM4WIVrMJBRc+SeJGT17Jp59mzFl8
 bWI8zqdYmJnvm5qZBvVifIjHaS3jhVQQiZwFfR+iaI2iF8+NYuvLxxC0e7eZxyOnikyu
 5DCf15UJZevMfrpT6J01rZt2QN/wG4iFcD2cwyA6ApIV/FSvf7U7Ox2eBTP6bq1Rlf5v
 xpYnUUPy8PVk9GN+/0wA8stE2V0OIGkxYwQEiOPXjTJ8sVVfQ9QkNbQyCogrtnV+tlgK
 KJ0g==
X-Gm-Message-State: AC+VfDyCULaPqbLqZ737IgmFfuQ3QPmqrkRZ7mby+Tj4SX6hzuxqH1hV
 ML/oB+ijapaOQ62mFpPO8tJGH3xUdTdSsE7FV3Ht9Q==
X-Google-Smtp-Source: ACHHUZ7ApgUjIZxAaCm6dCl2/94Zm+UeRt4nf60jMnzsYw3Wof9X0HlPJvyEK0yKlgwJP9KALU4KI90KVetUMvCV1OY=
X-Received: by 2002:a25:bcd1:0:b0:b8f:5639:cb8a with SMTP id
 l17-20020a25bcd1000000b00b8f5639cb8amr1603329ybm.9.1686734672948; Wed, 14 Jun
 2023 02:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230430-nokia770-regression-v4-0-9b6dc5536b17@linaro.org>
 <20230430-nokia770-regression-v4-2-9b6dc5536b17@linaro.org>
 <CAFwpezXJkXRr0Es=owr6fJ8BB_DETYPWdj_EzLbw9+5d7YOxxQ@mail.gmail.com>
In-Reply-To: <CAFwpezXJkXRr0Es=owr6fJ8BB_DETYPWdj_EzLbw9+5d7YOxxQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 Jun 2023 11:24:21 +0200
Message-ID: <CACRpkdbwpWn4h+yBkwosrZjoCw_uoh58yFJFE=JLKXocT0uEjA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] ARM/mmc: Convert old mmci-omap to GPIO descriptors
To: Peter Vasil <petervasil@gmail.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Tony Lindgren <tony@atomide.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Helge Deller <deller@gmx.de>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Andreas Kemnade <andreas@kemnade.info>, linux-input@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-spi@vger.kernel.org,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 14, 2023 at 10:44=E2=80=AFAM Peter Vasil <petervasil@gmail.com>=
 wrote:
> On Mon, May 8, 2023 at 11:21=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:

> > +static struct gpiod_lookup_table nokia810_mmc_gpio_table =3D {
> > +       .dev_id =3D "mmci-omap",
> > +       .table =3D {
> > +               /* Slot index 1, VSD power, GPIO 23 */
> > +               GPIO_LOOKUP_IDX("gpio-16-31", 7,
> > +                               "vsd", 1, GPIO_ACTIVE_HIGH),
>
> Hello everyone,
> not sure if anyone noticed this already, or if I understand it
> wrong... shouldn't the "vsd" name in following lookup descriptor
> actually be "vio"?
>
> > +               /* Slot index 1, VIO power, GPIO 9 */
> > +               GPIO_LOOKUP_IDX("gpio-0-15", 9,
> > +                               "vsd", 1, GPIO_ACTIVE_HIGH),


Ooops. Copy/paste bug.

I'll send a fix.

Yours,
Linus Walleij
