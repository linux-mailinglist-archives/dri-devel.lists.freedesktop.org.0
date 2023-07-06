Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF71C74A5CC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 23:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E839F10E4B3;
	Thu,  6 Jul 2023 21:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EAA10E4B3
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 21:16:40 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b6a6f224a1so18310751fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 14:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1688678195; x=1691270195;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pSqkWwImnB4/tT82n7a07m0rVEFuEASlgb/xLJ5s/v4=;
 b=dciEL14CoNqgy0XvKZaeGcEAL1W1DNKg7bQ1usZ0N/miY3r5SJ/vXMXIW7JVmlnVfJ
 I5vxpKloI1HStUPzADtCXYGzAsdAIxgEcclC0ud2h5/qPokxlZrgQDBIlEaK0IWWiyIn
 dy62Wo7wG4M8W8q0Kn+CELSLk5GXjs6sMSm7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688678195; x=1691270195;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pSqkWwImnB4/tT82n7a07m0rVEFuEASlgb/xLJ5s/v4=;
 b=dz3Y719yY/2f17D1FbD/XKJo8ochufE3rsl6AMAZwA2jfKKgFMNthTAtCTLMZ8GHKU
 CDvTsxrp7fwCKNO/svCH9rsdeKw0WD49HKz+rm3I2LiOWdj/wz3dx4wZCNoPIMgoZYWh
 dfHkvVGwlE+BRFfHHSRY4GJMeU637790xS/8XRBdg3KOhD53WjwUy+2WNfBlhnaGIsiy
 7BM1LO/mNY3H2QJ9PNJssFnE/J+EAY0edPDh1FR869SCxqqLVt0Yl98l1y7hSjNyplUL
 hBp1fwP+ZelA6nBxh7F77PXoUWcTqUu7VLTrYVVEYrTd4EY6fqQRqBHZ83I6CJrU+7jK
 wdOg==
X-Gm-Message-State: ABy/qLbI/tL8/8cuVWd67OtbFOo8hY0EHpGqJyBFf4KWrmgYqrNXEM6r
 1i9VFgnc64soGKH9tJgsskRl8A7/dzVAMm2l0pbSjErI
X-Google-Smtp-Source: APBJJlHWQe1lC1yFiGZnM5RTuhmKlMtPFcvpnoC3IjZf2z2xVB7Y/WVq31u8gGIMaEZmYAetWKBrAQ==
X-Received: by 2002:a05:6512:70f:b0:4fb:889a:b410 with SMTP id
 b15-20020a056512070f00b004fb889ab410mr2199703lfs.65.1688678195405; 
 Thu, 06 Jul 2023 14:16:35 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 q3-20020aa7da83000000b0051e0ea53eaasm1169302eds.97.2023.07.06.14.16.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 14:16:35 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-51ddbf83ff9so3268a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 14:16:34 -0700 (PDT)
X-Received: by 2002:a50:ab56:0:b0:51a:2012:5b34 with SMTP id
 t22-20020a50ab56000000b0051a20125b34mr29571edc.4.1688678194287; Thu, 06 Jul
 2023 14:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org>
 <20230703-fix-boe-tv101wum-nl6-v3-4-bd6e9432c755@linaro.org>
In-Reply-To: <20230703-fix-boe-tv101wum-nl6-v3-4-bd6e9432c755@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Jul 2023 14:16:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UvobraoZELdLmCmuu1u1RpFbzEuobyWRuCn45n1b4-XA@mail.gmail.com>
Message-ID: <CAD=FV=UvobraoZELdLmCmuu1u1RpFbzEuobyWRuCn45n1b4-XA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/panel: ili9882t: Break out function for
 switching page
To: Linus Walleij <linus.walleij@linaro.org>
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
 Jitao Shi <jitao.shi@mediatek.com>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 3, 2023 at 6:22=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> The ILI9882t has similarities with other Ilitek panels, such
> as the characteristic internal page switching code that uses
> the model number (0x98, 0x82) as parameter.
>
> We can clearly abstract out the page switching sequence from
> the initialization code.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 54 ++++++++++++++++++---=
------
>  1 file changed, 37 insertions(+), 17 deletions(-)

This is nice, thanks!


> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/=
drm/panel/panel-ilitek-ili9882t.c
> index 20f3cc37fa83..c1a0f10fbaf7 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> @@ -55,13 +55,33 @@ struct ili9882t {
>         struct gpio_desc *enable_gpio;
>  };
>
> +/* ILI9882-specific commands, add new commands as you decode them */
> +#define ILI9882T_DCS_SWITCH_PAGE       0xFF
> +
> +static int ili9882t_switch_page(struct mipi_dsi_device *dsi, u8 page)
> +{
> +       u8 switch_cmd[] =3D {0x98, 0x82, 0x00};
> +       int ret;
> +
> +       switch_cmd[2] =3D page;
> +
> +       ret =3D mipi_dsi_dcs_write(dsi, ILI9882T_DCS_SWITCH_PAGE, switch_=
cmd, 3);

nit: Instead of "3", "ARRAY_SIZE(switch_cmd)" would be more documenting.


> +       if (ret) {
> +               dev_err(&dsi->dev,
> +                       "error switching panel controller page (%d)\n", r=
et);
> +               return ret;
> +       }
> +
> +       return 0;

This is a static function and you don't check the error code anywhere.
Why bother returning it?

...although in patch #1 I'm suggesting adding to the core the ability
to have a "sequence of sequences". If that makes sense then perhaps
the code below that uses this will be short enough that it won't look
bad to error check each call?


>  static int starry_ili9882t_init(struct mipi_dsi_device *dsi)
>  {
>         int ret;
>
>         msleep(5);
>
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x01);
> +       ili9882t_switch_page(dsi, 0x01);
>         mipi_dsi_dcs_write_seq(dsi, 0x00, 0x42);
>         mipi_dsi_dcs_write_seq(dsi, 0x01, 0x11);
>         mipi_dsi_dcs_write_seq(dsi, 0x02, 0x00);
> @@ -192,7 +212,7 @@ static int starry_ili9882t_init(struct mipi_dsi_devic=
e *dsi)
>         mipi_dsi_dcs_write_seq(dsi, 0x8B, 0x07);
>         mipi_dsi_dcs_write_seq(dsi, 0x8C, 0x07);
>
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x02);
> +       ili9882t_switch_page(dsi, 0x02);
>         mipi_dsi_dcs_write_seq(dsi, 0x29, 0x3A);
>         mipi_dsi_dcs_write_seq(dsi, 0x2A, 0x3B);
>
> @@ -211,12 +231,12 @@ static int starry_ili9882t_init(struct mipi_dsi_dev=
ice *dsi)
>         mipi_dsi_dcs_write_seq(dsi, 0x5E, 0x40);
>         mipi_dsi_dcs_write_seq(dsi, 0x84, 0x00);
>
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x03);
> +       ili9882t_switch_page(dsi, 0x03);
>         mipi_dsi_dcs_write_seq(dsi, 0x20, 0x01);
>         mipi_dsi_dcs_write_seq(dsi, 0x21, 0x3C);
>         mipi_dsi_dcs_write_seq(dsi, 0x22, 0xFA);
>
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x0A);
> +       ili9882t_switch_page(dsi, 0x0a);

Super nitty: Even though Linux in general has hex constants in
lowercase, this driver seems to consistently use uppercase. You've
introduced a few inconsistencies here (and a few more below). Can you
make this consistent? Maybe do the upper-to-lower conversion as part
of your efforts to break the driver out?

-Doug
