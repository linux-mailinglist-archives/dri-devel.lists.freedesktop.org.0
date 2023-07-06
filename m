Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C781D74980D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 11:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B2410E49D;
	Thu,  6 Jul 2023 09:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BAE10E49D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 09:13:24 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6b71ee710edso406013a34.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 02:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1688634803; x=1691226803;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s4z5eEpTPvay/6CVOmHJTXP35NdcdpfCaDARpCSZzWY=;
 b=zRRM+Qi7i521/2BjoIcMMyQsW70ZQ3Ssy71LW2GvcNcK+5fX5NQD84Yinngk3VBd8m
 XyZBVtxoFMzeQmKRK8atiYMT3E+NI8n5HHrum7sVnfC6QpDAOivKBaZLbSihup3xCu71
 dKmi4N8qVZ5onjL4Zw0B4mi/XFzQVQD2YgIjin6B9JLuVm0c1sIfrryl8yiq2uJd9nsW
 mB7M1evckNTBIA45xyPXZw2lc4+oI9qAAVzKKiIdLg4vrg5rKADcuSnBe/KB1Q7Yh6N2
 1ZNO6wPs++FGp/G9LTiIbtK1rTenMobFKcF7girsmTIDaPLfe/qcZEScoUPoQN43E/Xx
 5u2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688634803; x=1691226803;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s4z5eEpTPvay/6CVOmHJTXP35NdcdpfCaDARpCSZzWY=;
 b=j9bTloCWn2r1NG4wVcCYqAMT34n7zTokSFNxdEpXaUDH/00NDVlpldA8tTnieEdXta
 4JZRvDTVZeP4RU+0N1MFpp/jckN4QuwiJoegHA+Ph64hSePUoWPP2HwWvojdO1Jrr5K6
 L8H1eMsMRzqmAxPoI4bhnBo4/3paZH4AG6osCHnDjIYudkqimVqyhs2KzpXQaVT66Idv
 tEyEEzY5y4MJQ6iUp5kvy8Ytc5tgRx+J9Woe/m7cBAMheX8eM9wX1leF04+8bO+b4pl8
 D7R1zzYepYSk77xgsXUx0eKL8X0OftRBky1cVCWd9UydWH/AJjLmb2Ye1FjW6uu9SzhN
 /abw==
X-Gm-Message-State: ABy/qLYtLxKQdRfnyGjQQnhgZue7vzz68Z7bLi+vikELHfFc+MIuJ9V9
 I7NKG/9WjbKZER+6XkS54PPreSb/5LKX55fR2PqBjw==
X-Google-Smtp-Source: APBJJlFzql70CAJbc773CoOpi1a/c9q5w16gLNnXGHdoZRoQRQ+3+t7luebj7FnnTVYn+HRl0U3IUC1qN2UEy5Myf04=
X-Received: by 2002:a05:6358:2490:b0:134:c584:5585 with SMTP id
 m16-20020a056358249000b00134c5845585mr1757370rwc.3.1688634803446; Thu, 06 Jul
 2023 02:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org>
 <20230703-fix-boe-tv101wum-nl6-v3-4-bd6e9432c755@linaro.org>
In-Reply-To: <20230703-fix-boe-tv101wum-nl6-v3-4-bd6e9432c755@linaro.org>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Thu, 6 Jul 2023 17:13:12 +0800
Message-ID: <CAHwB_NKuhPzH-0qPDgXnjr-giKmDu3kP9-nLpiS8+f7XrHZoFA@mail.gmail.com>
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
 Jitao Shi <jitao.shi@mediatek.com>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>,
 Hsin-Yi Wang <hsinyi@google.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 3, 2023 at 9:22=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
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
>
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
> +       if (ret) {
> +               dev_err(&dsi->dev,
> +                       "error switching panel controller page (%d)\n", r=
et);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
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
>         mipi_dsi_dcs_write_seq(dsi, 0xE0, 0x01);
>         mipi_dsi_dcs_write_seq(dsi, 0xE2, 0x01);
>         mipi_dsi_dcs_write_seq(dsi, 0xE5, 0x91);
> @@ -224,10 +244,10 @@ static int starry_ili9882t_init(struct mipi_dsi_dev=
ice *dsi)
>         mipi_dsi_dcs_write_seq(dsi, 0xE7, 0x00);
>         mipi_dsi_dcs_write_seq(dsi, 0xE8, 0xFA);
>
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x12);
> +       ili9882t_switch_page(dsi, 0x12);
>         mipi_dsi_dcs_write_seq(dsi, 0x87, 0x2C);
>
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x05);
> +       ili9882t_switch_page(dsi, 0x05);
>         mipi_dsi_dcs_write_seq(dsi, 0x73, 0xE5);
>         mipi_dsi_dcs_write_seq(dsi, 0x7F, 0x6B);
>         mipi_dsi_dcs_write_seq(dsi, 0x6D, 0xA4);
> @@ -242,7 +262,7 @@ static int starry_ili9882t_init(struct mipi_dsi_devic=
e *dsi)
>         mipi_dsi_dcs_write_seq(dsi, 0x1D, 0x90);
>         mipi_dsi_dcs_write_seq(dsi, 0x86, 0x87);
>
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x06);
> +       ili9882t_switch_page(dsi, 0x06);
>         mipi_dsi_dcs_write_seq(dsi, 0xC0, 0x80);
>         mipi_dsi_dcs_write_seq(dsi, 0xC1, 0x07);
>         mipi_dsi_dcs_write_seq(dsi, 0xCA, 0x58);
> @@ -256,7 +276,7 @@ static int starry_ili9882t_init(struct mipi_dsi_devic=
e *dsi)
>         mipi_dsi_dcs_write_seq(dsi, 0xD6, 0x55);
>         mipi_dsi_dcs_write_seq(dsi, 0xDC, 0x38);
>
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x08);
> +       ili9882t_switch_page(dsi, 0x08);
>         mipi_dsi_dcs_write_seq(dsi, 0xE0, 0x00, 0x10, 0x2A, 0x4D, 0x61, 0=
x56, 0x6A, 0x6E, 0x79,
>                                0x76, 0x8F, 0x95, 0x98, 0xAE, 0xAA, 0xB2, =
0xBB, 0xCE, 0xC6, 0xBD,
>                                0xD5, 0xE2, 0xE8);
> @@ -264,10 +284,10 @@ static int starry_ili9882t_init(struct mipi_dsi_dev=
ice *dsi)
>                                0x76, 0x8F, 0x95, 0x98, 0xAE, 0xAA, 0xB2, =
0xBB, 0xCE, 0xC6, 0xBD,
>                                0xD5, 0xE2, 0xE8);
>
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x04);
> +       ili9882t_switch_page(dsi, 0x04);
>         mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x81);
>
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x0C);
> +       ili9882t_switch_page(dsi, 0x0c);
>         mipi_dsi_dcs_write_seq(dsi, 0x00, 0x02);
>         mipi_dsi_dcs_write_seq(dsi, 0x01, 0x00);
>         mipi_dsi_dcs_write_seq(dsi, 0x02, 0x03);
> @@ -333,10 +353,10 @@ static int starry_ili9882t_init(struct mipi_dsi_dev=
ice *dsi)
>         mipi_dsi_dcs_write_seq(dsi, 0x3E, 0x0A);
>         mipi_dsi_dcs_write_seq(dsi, 0x3F, 0x1F);
>
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x04);
> +       ili9882t_switch_page(dsi, 0x04);
>         mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x01);
>
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x0E);
> +       ili9882t_switch_page(dsi, 0x0e);
>         mipi_dsi_dcs_write_seq(dsi, 0x02, 0x0C);
>         mipi_dsi_dcs_write_seq(dsi, 0x20, 0x10);
>         mipi_dsi_dcs_write_seq(dsi, 0x25, 0x16);
> @@ -373,12 +393,12 @@ static int starry_ili9882t_init(struct mipi_dsi_dev=
ice *dsi)
>         mipi_dsi_dcs_write_seq(dsi, 0x07, 0x21);
>         mipi_dsi_dcs_write_seq(dsi, 0x04, 0x10);
>
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x1E);
> +       ili9882t_switch_page(dsi, 0x1e);
>         mipi_dsi_dcs_write_seq(dsi, 0x60, 0x00);
>         mipi_dsi_dcs_write_seq(dsi, 0x64, 0x00);
>         mipi_dsi_dcs_write_seq(dsi, 0x6D, 0x00);
>
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x0B);
> +       ili9882t_switch_page(dsi, 0x0b);
>         mipi_dsi_dcs_write_seq(dsi, 0xA6, 0x44);
>         mipi_dsi_dcs_write_seq(dsi, 0xA7, 0xB6);
>         mipi_dsi_dcs_write_seq(dsi, 0xA8, 0x03);
> @@ -389,13 +409,13 @@ static int starry_ili9882t_init(struct mipi_dsi_dev=
ice *dsi)
>         mipi_dsi_dcs_write_seq(dsi, 0xBD, 0x92);
>         mipi_dsi_dcs_write_seq(dsi, 0xBE, 0xA1);
>
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x05);
> +       ili9882t_switch_page(dsi, 0x05);
>         mipi_dsi_dcs_write_seq(dsi, 0x86, 0x87);
>
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x06);
> +       ili9882t_switch_page(dsi, 0x06);
>         mipi_dsi_dcs_write_seq(dsi, 0x92, 0x22);
>
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x00);
> +       ili9882t_switch_page(dsi, 0x00);
>
>         ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
>         if (ret)
>
> --
> 2.34.1
>

Tested-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
