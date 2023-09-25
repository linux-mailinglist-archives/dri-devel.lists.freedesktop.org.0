Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 793617AD75C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 13:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE88410E146;
	Mon, 25 Sep 2023 11:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5F810E146
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 11:59:54 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-59f1dff5298so65650727b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 04:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695643193; x=1696247993;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2rAJ86cN+xrwluhtuXjfUlYkU73XqMR8cTagUgAndoo=;
 b=fb/U7RNtmV5Dz7+QYph00FmLFYZ4j64vuES7OjW1C0GbIMQPt3R3Of8Tnbg+1Mt85q
 84ndhiOfEp5qCFhBOqhjaoIu/FHVfimC05MiurcgTGMwmteFrpTcVANd+kRwr4n0lNN+
 ebDn+ZfNuxEPp9w4OxQlFD6u85mCypP1JWVdBHpeQOHdxJ5F6v/74JPmVyzciX6Iz7b3
 aXHmsu6yVNbOzaH2l+HVROnnH8VNx+qEJXZ+1Mh9Wjk9vYC3yWnynBjXzyLc1Ik9nt8I
 O+VYYJT2VxI7Oo8SrLweWAllUtmlj1F1OGK4On5J2mvSr45wEbTUnNGnG6rFlmvsHlZt
 ZgRA==
X-Gm-Message-State: AOJu0YwfsaV97TbHHG0h4Yz+XJr4n8KC2PBiRP5pshnoV7fYkqsPQFuc
 NjBcpVESWGkKyzt1K9LeeThFb+7R8CGDYg==
X-Google-Smtp-Source: AGHT+IHu3heGOk9dOH7dK8NJvjoMQhxFm7Wk7mDTGkdrYCI2p6h0jlLkD9+lWUQjIHEzWVLYNZq5tA==
X-Received: by 2002:a0d:d7c5:0:b0:584:61df:45e8 with SMTP id
 z188-20020a0dd7c5000000b0058461df45e8mr6505199ywd.13.1695643193049; 
 Mon, 25 Sep 2023 04:59:53 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 o2-20020a817302000000b00598d67585d7sm2352184ywc.117.2023.09.25.04.59.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 04:59:52 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-59f1dff5298so65650307b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 04:59:52 -0700 (PDT)
X-Received: by 2002:a05:690c:4246:b0:59f:4e6d:b565 with SMTP id
 gi6-20020a05690c424600b0059f4e6db565mr4869645ywb.11.1695643192435; Mon, 25
 Sep 2023 04:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230922073714.6164-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230922073714.6164-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Sep 2023 13:59:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDhkhd9rOK7Ns5ViT3JMdDD3OB_sU9tSX4QGJ=7chKqA@mail.gmail.com>
Message-ID: <CAMuHMdXDhkhd9rOK7Ns5ViT3JMdDD3OB_sU9tSX4QGJ=7chKqA@mail.gmail.com>
Subject: Re: [PATCH] drm: tilcdc: don't use devm_pinctrl_get_select_default()
 in probe
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CC pinctrl

On Fri, Sep 22, 2023 at 6:26=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Since commit ab78029ecc34 ("drivers/pinctrl: grab default handles from
> device core"), we can rely on device core for setting the default pins.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
> @@ -6,7 +6,6 @@
>
>  #include <linux/backlight.h>
>  #include <linux/gpio/consumer.h>
> -#include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>
>  #include <video/display_timing.h>
> @@ -308,7 +307,6 @@ static int panel_probe(struct platform_device *pdev)
>         struct backlight_device *backlight;
>         struct panel_module *panel_mod;
>         struct tilcdc_module *mod;
> -       struct pinctrl *pinctrl;
>         int ret;
>
>         /* bail out early if no DT data: */
> @@ -342,10 +340,6 @@ static int panel_probe(struct platform_device *pdev)
>
>         tilcdc_module_init(mod, "panel", &panel_module_ops);
>
> -       pinctrl =3D devm_pinctrl_get_select_default(&pdev->dev);
> -       if (IS_ERR(pinctrl))
> -               dev_warn(&pdev->dev, "pins are not configured\n");
> -
>         panel_mod->timings =3D of_get_display_timings(node);
>         if (!panel_mod->timings) {
>                 dev_err(&pdev->dev, "could not get panel timings\n");

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
