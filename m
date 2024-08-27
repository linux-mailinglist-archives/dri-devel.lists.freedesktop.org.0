Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB86960C4F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 15:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59D010E325;
	Tue, 27 Aug 2024 13:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cIiepjKZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAA710E325
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 13:39:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 26B6ACE10BD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 13:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879E7C61044
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 13:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724765962;
 bh=mgFOFeLBlxfh1P2qLfqCzzCjjawBaBWoDeRs88GUP3E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cIiepjKZP59TRjQCYRUf/RkWIINV6yDOQUisRhLkeUF3MRNQ09DI1nuvEG0fq8gnw
 5dp7cQ/hzVPP+OFI+6O3jMh1HJf5nKM3DuTTMmPaecfGVnFrisLnUdBOm2inJRq5i6
 wEwrydxZfuO7EotJ3uZAQJxJek8VZkNrcONHbKRyQmj00vuZeq7rGc3v0j4dhKnxu/
 iATTz8KppC/sHd53Qh6gyEaxUtWDGYJFxXwzSOQY9slMmLg20fKmhdnwkTH2A/mNGS
 a4UuQBsyR2QN9aCkPZDznBouITtZr6ZwxHpZXoJ1iyrN0xiYOL8/N1e+guQuDXjCIz
 iXZH2M7XHC0KA==
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e13c23dbabdso5274757276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 06:39:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWFEBS0Gn3uKftL9MwskZofnTCiunxjQMF6Gh8ww4PA7lQG9/0sSMm7BoAl3u6UdHkzu5SY2NKLR7E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHqVsooxtw/t8kOypZMh3IGrk9oLdz+Wojc19PXI+OL7Unj7Ng
 inIpCF7mCCfDCI1wUmpdvKs0xjFWT2SMQs0UfFoYSG3l70olRBYHSMrhImvoM7AA4AHgvAmAq9O
 MXPzXCua3L8pSCgtoQHEF/ag+6lfnWu16pbkpcg==
X-Google-Smtp-Source: AGHT+IGXnhHqNrJhk46Rl+P1U8Op9Mh+U4zroGn3/eljhE3p4XH2WiUerYGsPqzGwn7EwuvEBtyqueJvGIXDJt/wOYs=
X-Received: by 2002:a05:6902:1006:b0:e13:d834:603e with SMTP id
 3f1490d57ef6-e17a8e42776mr14587824276.45.1724765961830; Tue, 27 Aug 2024
 06:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240812-tdp158-v5-0-78684a84ec23@freebox.fr>
 <20240812-tdp158-v5-2-78684a84ec23@freebox.fr>
In-Reply-To: <20240812-tdp158-v5-2-78684a84ec23@freebox.fr>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 27 Aug 2024 15:39:10 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7UEZ1B3BmTxL-WEeX4Dm0cOYpJSW2QFv6t1vCxcaM8KA@mail.gmail.com>
Message-ID: <CAN6tsi7UEZ1B3BmTxL-WEeX4Dm0cOYpJSW2QFv6t1vCxcaM8KA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] drm/bridge: add support for TI TDP158
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
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

On Mon, Aug 12, 2024 at 4:51=E2=80=AFPM Marc Gonzalez <mgonzalez@freebox.fr=
> wrote:
>
> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
> It supports DVI 1.0, HDMI 1.4b and 2.0b.
> It supports 4 TMDS channels, HPD, and a DDC interface.
> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
> for power reduction. Several methods of power management are
> implemented to reduce overall power consumption.
> It supports fixed receiver EQ gain using I2C or pin strap to
> compensate for different lengths input cable or board traces.
>
> Features
>
> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
> data rate, compatible with HDMI 2.0b electrical parameters
> - DisplayPort dual-mode standard version 1.1
> - Programmable fixed receiver equalizer up to 15.5dB
> - Global or independent high speed lane control, pre-emphasis
> and transmit swing, and slew rate control
> - I2C or pin strap programmable
> - Configurable as a DisplayPort redriver through I2C
> - Full lane swap on main lanes
> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
>
> https://www.ti.com/lit/ds/symlink/tdp158.pdf
>
> On our board, I2C_EN is pulled high.
> Thus, this code defines a module_i2c_driver.
>
> The default settings work fine for our use-case.
> So this basic driver doesn't need to tweak any I2C registers.
>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  drivers/gpu/drm/bridge/Kconfig     |   7 +++
>  drivers/gpu/drm/bridge/Makefile    |   1 +
>  drivers/gpu/drm/bridge/ti-tdp158.c | 108 +++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 116 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index c621be1a99a89..c0ab5b620b57d 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -368,6 +368,13 @@ config DRM_TI_DLPC3433
>           It supports up to 720p resolution with 60 and 120 Hz refresh
>           rates.
>
> +config DRM_TI_TDP158
> +       tristate "TI TDP158 HDMI/TMDS bridge"
> +       depends on OF
> +       select DRM_PANEL_BRIDGE
> +       help
> +         Texas Instruments TDP158 HDMI/TMDS Bridge driver
> +
>  config DRM_TI_TFP410
>         tristate "TI TFP410 DVI/HDMI bridge"
>         depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Mak=
efile
> index 7df87b582dca3..3daf803ce80b6 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -32,6 +32,7 @@ obj-$(CONFIG_DRM_I2C_ADV7511) +=3D adv7511/
>  obj-$(CONFIG_DRM_TI_DLPC3433) +=3D ti-dlpc3433.o
>  obj-$(CONFIG_DRM_TI_SN65DSI83) +=3D ti-sn65dsi83.o
>  obj-$(CONFIG_DRM_TI_SN65DSI86) +=3D ti-sn65dsi86.o
> +obj-$(CONFIG_DRM_TI_TDP158) +=3D ti-tdp158.o
>  obj-$(CONFIG_DRM_TI_TFP410) +=3D ti-tfp410.o
>  obj-$(CONFIG_DRM_TI_TPD12S015) +=3D ti-tpd12s015.o
>  obj-$(CONFIG_DRM_NWL_MIPI_DSI) +=3D nwl-dsi.o
> diff --git a/drivers/gpu/drm/bridge/ti-tdp158.c b/drivers/gpu/drm/bridge/=
ti-tdp158.c
> new file mode 100644
> index 0000000000000..4ee0ad29874de
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/ti-tdp158.c
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2024 Freebox SAS
> + */
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <linux/i2c.h>
> +
> +struct tdp158 {
> +       struct drm_bridge bridge;
> +       struct drm_bridge *next;
> +       struct gpio_desc *enable; // Operation Enable - pin 36
> +       struct regulator *vcc; // 3.3V
> +       struct regulator *vdd; // 1.1V
> +       struct device *dev;
> +};
> +
> +static void tdp158_enable(struct drm_bridge *bridge, struct drm_bridge_s=
tate *prev)
> +{
> +       int err;
> +       struct tdp158 *tdp158 =3D bridge->driver_private;
> +
> +       err =3D regulator_enable(tdp158->vcc);
> +       if (err)
> +               dev_err(tdp158->dev, "failed to enable vcc: %d", err);
> +
> +       err =3D regulator_enable(tdp158->vdd);
> +       if (err)
> +               dev_err(tdp158->dev, "failed to enable vdd: %d", err);
> +
> +       gpiod_set_value_cansleep(tdp158->enable, 1);
> +}
> +
> +static void tdp158_disable(struct drm_bridge *bridge, struct drm_bridge_=
state *prev)
> +{
> +       struct tdp158 *tdp158 =3D bridge->driver_private;
> +
> +       gpiod_set_value_cansleep(tdp158->enable, 0);
> +       regulator_disable(tdp158->vdd);
> +       regulator_disable(tdp158->vcc);
> +}
> +
> +static int tdp158_attach(struct drm_bridge *bridge, enum drm_bridge_atta=
ch_flags flags)
> +{
> +       struct tdp158 *tdp158 =3D bridge->driver_private;
> +
> +       return drm_bridge_attach(bridge->encoder, tdp158->next, bridge, f=
lags);
> +}
> +
> +static const struct drm_bridge_funcs tdp158_bridge_funcs =3D {
> +       .attach =3D tdp158_attach,
> +       .atomic_enable =3D tdp158_enable,
> +       .atomic_disable =3D tdp158_disable,
> +       .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_st=
ate,
> +       .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> +       .atomic_reset =3D drm_atomic_helper_bridge_reset,
> +};
> +
> +static int tdp158_probe(struct i2c_client *client)
> +{
> +       struct tdp158 *tdp158;
> +       struct device *dev =3D &client->dev;
> +
> +       tdp158 =3D devm_kzalloc(dev, sizeof(*tdp158), GFP_KERNEL);
> +       if (!tdp158)
> +               return -ENOMEM;
> +
> +       tdp158->next =3D devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> +       if (IS_ERR(tdp158->next))
> +               return dev_err_probe(dev, PTR_ERR(tdp158->next), "missing=
 bridge");
> +
> +       tdp158->vcc =3D devm_regulator_get(dev, "vcc");
> +       if (IS_ERR(tdp158->vcc))
> +               return dev_err_probe(dev, PTR_ERR(tdp158->vcc), "vcc");
> +
> +       tdp158->vdd =3D devm_regulator_get(dev, "vdd");
> +       if (IS_ERR(tdp158->vdd))
> +               return dev_err_probe(dev, PTR_ERR(tdp158->vdd), "vdd");
> +
> +       tdp158->enable =3D devm_gpiod_get_optional(dev, "enable", GPIOD_O=
UT_LOW);
> +       if (IS_ERR(tdp158->enable))
> +               return dev_err_probe(dev, PTR_ERR(tdp158->enable), "enabl=
e");
> +
> +       tdp158->bridge.of_node =3D dev->of_node;
> +       tdp158->bridge.funcs =3D &tdp158_bridge_funcs;
> +       tdp158->bridge.driver_private =3D tdp158;
> +       tdp158->dev =3D dev;
> +
> +       return devm_drm_bridge_add(dev, &tdp158->bridge);
> +}
> +
> +static const struct of_device_id tdp158_match_table[] =3D {
> +       { .compatible =3D "ti,tdp158" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, tdp158_match_table);
> +
> +static struct i2c_driver tdp158_driver =3D {
> +       .probe =3D tdp158_probe,
> +       .driver =3D {
> +               .name =3D "tdp158",
> +               .of_match_table =3D tdp158_match_table,
> +       },
> +};
> +module_i2c_driver(tdp158_driver);
> +
> +MODULE_DESCRIPTION("TI TDP158 driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
