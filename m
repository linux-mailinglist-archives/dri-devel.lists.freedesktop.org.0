Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE658AD66D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 23:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D2E10E50F;
	Mon, 22 Apr 2024 21:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="agKGu6bF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBBF10E50F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 21:17:30 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-518a56cdc03so5988044e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 14:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713820647; x=1714425447;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I0hAn5Mx/R8pfZ4somXg4+rh6iyVeFiKWQ6gBcIcmHA=;
 b=agKGu6bFAPcGy3Bi3hnkyz3Wlw4IvNOyoucsBZG/KmDJ+pshsFbhyHG5o4QhWs8W1V
 QyIXZImnNvdJWpEcC3O/TrEW3pdkeX4frvamFON1M61XCc6AxPi1n38M155mttNgn1WL
 JN7G0iW4SVD/hGBtOQLR2Aqiw0eoU/hlZlVAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713820647; x=1714425447;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I0hAn5Mx/R8pfZ4somXg4+rh6iyVeFiKWQ6gBcIcmHA=;
 b=BfkaPK+B38g9ohs8Gq+guKm4VckEQWj6P8IlrtRKHwmd+b6t2S6k2f61W5oI6z2ZpX
 O2/XF5TGIiiM0XzmieKVohQV9re9lQiVpVBGUyvsGknZy1rszsBB0T//Azyjo13ovktb
 SHMP4K7pKK/ybbWzklJV4ZV2fWet9mci5bqVRdMOpedKFJUytPaHON3VPQvyB3wK2pHQ
 y0Fbh0YL6aT8PF7+70d2T6ICsLmi3QahzuruT8ikJgOP4SkJkHe6bKAuhykIMeAMvk9m
 xAjqgmtP0JeF2MCYr6Z6ZEcAwOFQqPAFCT9XmtYSaTXNAHrGF7QSTN5/ashePb2CvMKe
 qn5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtyVLVH2XFGOvduIRvqcGoJKvQCwYpufjezYdCyMIYvmGDzpX+8LHxo42/5BxS9Rt7K+t/qBwvU6mIe8MvlsnhAhdLDtkRFr40bjnp/2ef
X-Gm-Message-State: AOJu0YyEhx7aKPSI6dq/QfvyIlgOhtY15Z8+1BnVmFkmu1gx82/P5baz
 jlBwqzQ28FoSf+BfaYHSFUQ1OLs3tOIGHrzkDFF5+oT3CLJeRGExRCZhYj1bytLYKKyLkXodQCm
 PYUxE
X-Google-Smtp-Source: AGHT+IEZThZNydW5nH/qH18tOQ1i1/xUlqr6uSYXDxhZeuczwahnWcr8aTx69+Dz1RyNBimVKry9ag==
X-Received: by 2002:a19:5f1b:0:b0:518:c792:47de with SMTP id
 t27-20020a195f1b000000b00518c79247demr6781744lfb.16.1713820647247; 
 Mon, 22 Apr 2024 14:17:27 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 mc11-20020a170906eb4b00b00a5256d8c956sm6139260ejb.61.2024.04.22.14.17.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 14:17:26 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-418820e6effso24995e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 14:17:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVfbuZ3RQIW5iBab7zcqISk/MuD8SpeJd9rCO9AH+tkxIEln4VuNsay7bGOhCj6QmPJgV3GY8nnEGm+lYj4mCM4YzLWesd+xBmc1ddqXvEe
X-Received: by 2002:a05:600c:4f15:b0:418:97c6:188d with SMTP id
 l21-20020a05600c4f1500b0041897c6188dmr14104wmq.7.1713820645655; Mon, 22 Apr
 2024 14:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com>
 <20240422090310.3311429-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240422090310.3311429-3-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Apr 2024 14:17:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2O2aFDVn5CjbXfgcOLkmNp-G3ChVqQKouB2mDB+NZug@mail.gmail.com>
Message-ID: <CAD=FV=V2O2aFDVn5CjbXfgcOLkmNp-G3ChVqQKouB2mDB+NZug@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] drm/panel: himax-hx83102: Break out as separate
 driver
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Apr 22, 2024 at 2:03=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The Starry HX83102 based mipi panel should never have been part of the bo=
e
> tv101wum driver. Discussion with Doug and Linus in V1 [1], we need a
> separate driver to enable the hx83102 controller.
>
> In hx83102 driver, add DSI commands as macros. So it can add some panels
> with same control model in the future.
>
> [1]: https://lore.kernel.org/all/CACRpkdbzYZAS0=3DzBQJUC4CB2wj4s1h6n6aSAZ=
QvdMV95r3zRUw@mail.gmail.com
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    |  99 ---
>  drivers/gpu/drm/panel/panel-himax-hx83102.c   | 567 ++++++++++++++++++
>  4 files changed, 577 insertions(+), 99 deletions(-)
>  create mode 100644 drivers/gpu/drm/panel/panel-himax-hx83102.c
>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfi=
g
> index d037b3b8b999..eb378c897353 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -145,6 +145,15 @@ config DRM_PANEL_LVDS
>           handling of power supplies or control signals. It implements au=
tomatic
>           backlight handling if the panel is attached to a backlight cont=
roller.
>
> +config DRM_PANEL_HIMAX_HX83102
> +       tristate "himax HX83102-based panels"

Capital "h" for "Himax".


> +#define DRV_NAME "panel-himax-hx83102"

I don't think DRV_NAME buys you very much. Get rid of this #define and
just use it below.


> +struct hx83102 {
> +       struct drm_panel base;
> +       struct mipi_dsi_device *dsi;
> +
> +       const struct hx83102_panel_desc *desc;
> +
> +       enum drm_panel_orientation orientation;
> +       struct regulator *pp1800;
> +       struct regulator *avee;
> +       struct regulator *avdd;
> +       struct gpio_desc *enable_gpio;
> +
> +       bool prepared;

We're trying to get rid of the tracking of "prepared" in panels. You
should be able to delete this and remove the code dealing with it. The
core DRM code should ensure that your prepare/unprepare functions are
called appropriately.



> +struct hx83102_panel_desc {
> +       const struct drm_display_mode *modes;
> +       unsigned int bpc;
> +
> +       /**
> +        * @width_mm: width of the panel's active display area
> +        * @height_mm: height of the panel's active display area
> +        */
> +       struct {
> +               unsigned int width_mm;
> +               unsigned int height_mm;
> +       } size;
> +
> +       unsigned long mode_flags;
> +       enum mipi_dsi_pixel_format format;
> +       unsigned int lanes;
> +       bool lp11_before_reset;

Seems like you can remove "lp11_before_reset" since it's always true
for this controller. If later you find someone using this controller
that needs this false then we can always add it back in.

I think you could also remove "bpc", "format", and "mode_flags". If
these are all the same controller then that will be common between all
the panels, right? So you shouldn't need to define those on a
per-panel basis... You could maybe even remove "lanes" unless some
people using this panel are expected to hook up fewer lanes...


> +static int starry_init_cmd(struct hx83102 *ctx)
> +{
> +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> +
> +       mipi_dsi_dcs_write_seq(dsi, HX83102_SETEXTC, 0x83, 0x10, 0x21, 0x=
55, 0x00);
> +
> +       mipi_dsi_dcs_write_seq(dsi, HX83102_SETPOWER, 0x2C, 0xB5, 0xB5, 0=
x31, 0xF1, 0x31, 0xD7, 0x2F,
> +                                                 0x36, 0x36, 0x36, 0x36,=
 0x1A, 0x8B, 0x11, 0x65, 0x00, 0x88, 0xFA, 0xFF,
> +                                                 0xFF, 0x8F, 0xFF, 0x08,=
 0x74, 0x33);

I know this is a sticking point between Linus W. and me, but I'm
really not a fan of all the hardcoded function calls since it bloats
the code so much. I think we need to stick with something more table
based at least for the majority of the commands. If I understand
correctly, Linus was OK w/ something table based as long as it was in
common code [1]. I think he also wanted the "delay" out of the table,
but since those always seem to be at the beginning or the end it seems
like we could still have the majority of the code as table based. Do
you want to make an attempt at that? If not I can try to find some
time to write up a patch in the next week or so.

[1] https://lore.kernel.org/r/CACRpkdYtM=3D5jdQddCqRFgBRXvcJEjk1ULJNKKFz7jh=
hkGxV59Q@mail.gmail.com

...also: nit that, in general, the Linux community prefers lowercase
hex, so 0xfa instead of 0xFA, for instance.


> +static int hx83102_get_modes(struct drm_panel *panel,
> +                           struct drm_connector *connector)
> +{
> +       struct hx83102 *ctx =3D panel_to_hx83102(panel);
> +       const struct drm_display_mode *m =3D ctx->desc->modes;
> +       struct drm_display_mode *mode;
> +
> +       mode =3D drm_mode_duplicate(connector->dev, m);
> +       if (!mode) {
> +               dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> +                       m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
> +               return -ENOMEM;
> +       }

nit: no need for an error message when drm_mode_duplicate() fails. It
is incredibly unlikely that the allocation will fail and the Linux
kernel will already do a stack crawl in the case that it does fail.


> +       /*
> +        * TODO: Remove once all drm drivers call
> +        * drm_connector_set_orientation_from_panel()
> +        */
> +       drm_connector_set_panel_orientation(connector, ctx->orientation);

Pretty sure you can drop the call to
drm_connector_set_panel_orientation() here. I believe that nearly
everyone is using panel_bridge which will handle this for you.


> +static int hx83102_panel_add(struct hx83102 *ctx)
> +{
> +       struct device *dev =3D &ctx->dsi->dev;
> +       int err;
> +
> +       ctx->avdd =3D devm_regulator_get(dev, "avdd");
> +       if (IS_ERR(ctx->avdd))
> +               return PTR_ERR(ctx->avdd);
> +
> +       ctx->avee =3D devm_regulator_get(dev, "avee");
> +       if (IS_ERR(ctx->avee))
> +               return PTR_ERR(ctx->avee);
> +
> +       ctx->pp1800 =3D devm_regulator_get(dev, "pp1800");
> +       if (IS_ERR(ctx->pp1800))
> +               return PTR_ERR(ctx->pp1800);
> +
> +       ctx->enable_gpio =3D devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW)=
;
> +       if (IS_ERR(ctx->enable_gpio)) {
> +               dev_err(dev, "cannot get reset-gpios %ld\n",

it's not "reset-gpios".


> +                       PTR_ERR(ctx->enable_gpio));
> +               return PTR_ERR(ctx->enable_gpio);

Rather than the above, use "dev_err_probe" and combine into one line. Untes=
ted:

if (IS_ERR(ctx->enable_gpio))
  return dev_err_probe(dev, PTR_ERR(ctx->enable_gpio), "Cannot get
enable GPIO\n");


> +       }
> +
> +       gpiod_set_value(ctx->enable_gpio, 0);

You don't need the above line. When you got the GPIO you already
passed "GPIOD_OUT_LOW" which means that this is redundant.


> +
> +       ctx->base.prepare_prev_first =3D true;
> +
> +       drm_panel_init(&ctx->base, dev, &hx83102_drm_funcs,
> +                      DRM_MODE_CONNECTOR_DSI);
> +       err =3D of_drm_get_panel_orientation(dev->of_node, &ctx->orientat=
ion);
> +       if (err < 0) {
> +               dev_err(dev, "%pOF: failed to get orientation %d\n", dev-=
>of_node, err);
> +               return err;
> +       }

Could also use "dev_err_probe" to make the above one line. Not sure
you really need the of_node name, too...

if (err < 0)
  return dev_err_probe(dev, err, "failed to get orientation\n");

-Doug
