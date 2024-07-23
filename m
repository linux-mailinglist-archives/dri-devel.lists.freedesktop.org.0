Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CF393A7A1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 21:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD7710E61E;
	Tue, 23 Jul 2024 19:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ViAcdTIe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE96C10E61E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 19:17:45 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-26109c97728so2902922fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 12:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721762265; x=1722367065;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0HgeFN0Ay5AIJvxgptlaXcddVWeUebYTJmY/Mw+Yg0=;
 b=ViAcdTIeWfMcAUlgAhM9yHyh0lb8lF3/qq6PCBpG9KQwfLVUa/gKcnVXke5u7kcU4M
 v2sr1qmvObUJ0rzGTQ3is3WFbBsKFkFePbSVe4vW0GG9nvGPRDJIcoug4kZO6aiHu6MU
 fK1++kAL49qSh35k3LluYaXrhNysFxpptnZTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721762265; x=1722367065;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R0HgeFN0Ay5AIJvxgptlaXcddVWeUebYTJmY/Mw+Yg0=;
 b=BqTe+eawbHHj3UFl2hrtiHoCrTLQrQ0UDuBgbTjNvyjpIY6ULYnjA/WtbzjWvuaDaT
 wCeNUEEGRO3k/e6KbRgIJ/qdJtV69ICLGnKE0tm/61e3G0qK7Y8BrLJzkLj1cI2b0Pqn
 ujNxV7K1Qbahzhjdb+MHRj+y+p/G659RoWsfoSMLJcbsZ9hMyDXE9DN7WWJ/+PDBH4H5
 bT9RUOPs/Wrw0foOWYI/xPl2VwxxYhVUkvYSe+ZIEslesYDUsvMIiAk0W8C0VvAXcZ9g
 KL3rbSR4zowvIblwCphfsSxHl1KO2KFe0ePRlxXmEApBBpGSZrSwjM2ZGwCDi1ATrCU3
 BjfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYycA+obS67pHGEn+Yv1EeYgh9YQIhGEDPQSamLoUj7YWNU+Pi7M6q7F9XAf7jWMXIvGXLWQHzrThCxkB41gV1yStskhSJywDp1GW7E6Ue
X-Gm-Message-State: AOJu0YxuH/5IbtSeSDXK+ZuvgCXEOJlhnM+gjanwkdbnAZUR1NzMDrmH
 2Ab48uoOq2WWMAp7oSHgcXmQyJsVGoPEPW+4ikZeVlLtrBVZnaBOp2jiMfwklRKN1VexctTcmwU
 =
X-Google-Smtp-Source: AGHT+IG8WSYjS4xjc+8UnsNgkDSqmLGL/Q7VQiGMpamemRSokepcD/AoPrppaP/vo3K4vsj4pvnR0Q==
X-Received: by 2002:a05:6870:f10f:b0:261:6bc:9b8e with SMTP id
 586e51a60fabf-264876e58b4mr693549fac.26.1721762264836; 
 Tue, 23 Jul 2024 12:17:44 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
 [209.85.160.174]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1990792a0sm506378185a.109.2024.07.23.12.17.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 12:17:44 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-447f8aa87bfso91511cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 12:17:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUA6h9AbyIUG+fsTkItfgfGptCyVQoGEkr9d3Ofb33VPMJLjFe6sD3IWuRzfiIJ/YYoHCJseUMLg+PTcOAxELeI/aoQYcAZZVgrxanFe1kx
X-Received: by 2002:a05:622a:491:b0:447:d81a:9320 with SMTP id
 d75a77b69052e-44fd4c6382dmr843151cf.20.1721762263871; Tue, 23 Jul 2024
 12:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240709-topic-sdm450-upstream-tbx605f-panel-v1-0-af473397835d@linaro.org>
 <20240709-topic-sdm450-upstream-tbx605f-panel-v1-2-af473397835d@linaro.org>
In-Reply-To: <20240709-topic-sdm450-upstream-tbx605f-panel-v1-2-af473397835d@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 Jul 2024 12:17:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VL1Wxd0veW7N+0Hy=LdKMzNbBang9_EZ9Zo_d-wZOBfw@mail.gmail.com>
Message-ID: <CAD=FV=VL1Wxd0veW7N+0Hy=LdKMzNbBang9_EZ9Zo_d-wZOBfw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: add BOE tv101wum-ll2 panel driver
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Jul 9, 2024 at 6:06=E2=80=AFAM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:
>
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makef=
ile
> index 5581387707c6..79c90894b6a4 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_DRM_PANEL_BOE_BF060Y8M_AJ0) +=3D panel-boe-b=
f060y8m-aj0.o
>  obj-$(CONFIG_DRM_PANEL_BOE_HIMAX8279D) +=3D panel-boe-himax8279d.o
>  obj-$(CONFIG_DRM_PANEL_BOE_TH101MB31UIG002_28A) +=3D panel-boe-th101mb31=
ig002-28a.o
>  obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_NL6) +=3D panel-boe-tv101wum-nl6.o
> +obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_LL2) +=3D panel-boe-tv101wum-ll2.o

nit: please sort. L comes before N.


>  obj-$(CONFIG_DRM_PANEL_DSI_CM) +=3D panel-dsi-cm.o
>  obj-$(CONFIG_DRM_PANEL_LVDS) +=3D panel-lvds.o
>  obj-$(CONFIG_DRM_PANEL_SIMPLE) +=3D panel-simple.o
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c b/drivers/gpu=
/drm/panel/panel-boe-tv101wum-ll2.c
> new file mode 100644
> index 000000000000..5513cb48d949
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c
> @@ -0,0 +1,240 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Generated with linux-mdss-dsi-panel-driver-generator from vendor devi=
ce tree:
> +//   Copyright (c) 2013, The Linux Foundation. All rights reserved.
> +//   Copyright (c) 2024, Neil Armstrong <neil.armstrong@linaro.org>
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>

nit: sort header files?

> +static int boe_tv101wum_ll2_prepare(struct drm_panel *panel)
> +{
> +       struct boe_tv101wum_ll2 *ctx =3D to_boe_tv101wum_ll2(panel);
> +       struct device *dev =3D &ctx->dsi->dev;
> +       int ret;
> +
> +       ret =3D regulator_bulk_enable(ARRAY_SIZE(ctx->supplies),
> +                                   ctx->supplies);
> +       if (ret < 0)
> +               return ret;
> +
> +       boe_tv101wum_ll2_reset(ctx);
> +
> +       ret =3D boe_tv101wum_ll2_on(ctx);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to initialize panel: %d\n", ret);

nit: Do you really need this error message? The "_multi" variants are
all chatty and print the error message, so we don't really need this
here...


> +               gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +               return ret;

Shouldn't you turn off the regulators?


> +static int boe_tv101wum_ll2_unprepare(struct drm_panel *panel)
> +{
> +       struct boe_tv101wum_ll2 *ctx =3D to_boe_tv101wum_ll2(panel);
> +       struct device *dev =3D &ctx->dsi->dev;
> +       int ret;
> +
> +       ret =3D boe_tv101wum_ll2_off(ctx);
> +       if (ret < 0)
> +               dev_err(dev, "Failed to un-initialize panel: %d\n", ret);

nit: Do you really need this error message? The "_multi" variants are
all chatty and print the error message, so we don't really need this
here...


> +
> +       gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +
> +       regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +
> +       return 0;

Maybe add a comment justifying why you don't return the error code
that boe_tv101wum_ll2_off() returned?


> +static int boe_tv101wum_ll2_get_modes(struct drm_panel *panel,
> +                                     struct drm_connector *connector)
> +{
> +       return drm_connector_helper_get_modes_fixed(connector, &boe_tv101=
wum_ll2_mode);

Random question for you: on panels that don't use the
drm_connector_helper the "bpc" gets set here. Is there a reason why
some panel drivers (like this one) don't set bpc?


> +static int boe_tv101wum_ll2_probe(struct mipi_dsi_device *dsi)
> +{
> +       struct device *dev =3D &dsi->dev;
> +       struct boe_tv101wum_ll2 *ctx;
> +       int ret;
> +
> +       ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +       if (!ctx)
> +               return -ENOMEM;
> +
> +       ctx->supplies[0].supply =3D "vsp";
> +       ctx->supplies[1].supply =3D "vsn";
> +
> +       ret =3D devm_regulator_bulk_get(&dsi->dev, ARRAY_SIZE(ctx->suppli=
es),
> +                                     ctx->supplies);

Any chance I can convince you to use devm_regulator_bulk_get_const()?
Then you can list your supply structures as "static const" instead of
having to initialize them via code.


> +       if (ret < 0)
> +               return ret;
> +
> +       ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +       if (IS_ERR(ctx->reset_gpio))
> +               return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +                                    "Failed to get reset-gpios\n");
> +
> +       ctx->dsi =3D dsi;
> +       mipi_dsi_set_drvdata(dsi, ctx);
> +
> +       dsi->lanes =3D 4;
> +       dsi->format =3D MIPI_DSI_FMT_RGB888;
> +       dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BUR=
ST |
> +                         MIPI_DSI_MODE_VIDEO_HSE;
> +
> +       drm_panel_init(&ctx->panel, dev, &boe_tv101wum_ll2_panel_funcs,
> +                      DRM_MODE_CONNECTOR_DSI);
> +       ctx->panel.prepare_prev_first =3D true;
> +
> +       ret =3D drm_panel_of_backlight(&ctx->panel);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to get backlight\n=
");
> +
> +       drm_panel_add(&ctx->panel);

Any chance you could add devm_drm_panel_add() and then use it? Then
you can fully get rid of your remove and error handling since
devm_mipi_dsi_attach() already exists. Note that this would not change
object lifetimes at all since you're already calling
drm_panel_remove() in your remove code--it would just clean up the
code...


> +static struct mipi_dsi_driver boe_tv101wum_ll2_driver =3D {
> +       .probe =3D boe_tv101wum_ll2_probe,
> +       .remove =3D boe_tv101wum_ll2_remove,
> +       .driver =3D {
> +               .name =3D "panel-boe-tv101wum_ll2",
> +               .of_match_table =3D boe_tv101wum_ll2_of_match,
> +       },
> +};
> +module_mipi_dsi_driver(boe_tv101wum_ll2_driver);
> +
> +MODULE_DESCRIPTION("DRM driver for Boe TV101WUM-LL2 Panel");

Should "Boe" be "BOE" ?
