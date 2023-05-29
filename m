Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 345F57150D5
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 23:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E189610E2EF;
	Mon, 29 May 2023 21:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06DD10E2EF
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 21:07:19 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6076F3F255;
 Mon, 29 May 2023 23:07:16 +0200 (CEST)
Date: Mon, 29 May 2023 23:07:15 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH RFC 03/10] drm/panel: Add LGD panel driver for Sony
 Xperia XZ3
Message-ID: <oxgtbj7qmsdvz5gl4bud64jedmhdmvphjfge7uy6uwulefqfsa@pleslv2zgwbp>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-3-541c341d6bee@somainline.org>
 <ccc97880-8e74-b85b-9679-9c12c44c4b99@linaro.org>
 <71675a02-0801-62dc-2673-4a0907636b21@linaro.org>
 <CAA8EJpq=HZqiBZ6bpUNH47VmASuH+Mi5OD5BHmg0TPwtsKHf8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpq=HZqiBZ6bpUNH47VmASuH+Mi5OD5BHmg0TPwtsKHf8w@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Caleb Connolly <caleb@connolly.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sam Ravnborg <sam@ravnborg.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, neil.armstrong@linaro.org,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-22 15:58:56, Dmitry Baryshkov wrote:
> On Mon, 22 May 2023 at 12:04, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >
> > On 22/05/2023 03:16, Dmitry Baryshkov wrote:
> > > On 22/05/2023 00:23, Marijn Suijten wrote:
> > >> Sony provides an unlabeled LGD + Atmel maXTouch assembly in its Xperia
> > >> XZ3 (tama akatsuki) phone, with custom DCS commands to match.
> > >>
> > >> This panel features Display Stream Compression 1.1.
> > >>
> > >> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > >> ---
> > >>   drivers/gpu/drm/panel/Kconfig                   |  11 +
> > >>   drivers/gpu/drm/panel/Makefile                  |   1 +
> > >>   drivers/gpu/drm/panel/panel-sony-akatsuki-lgd.c | 362 ++++++++++++++++++++++++
> > >>   3 files changed, 374 insertions(+)
> > >>
> > >> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> > >> index 67ef898d133f2..18bd116e78a71 100644
> > >> --- a/drivers/gpu/drm/panel/Kconfig
> > >> +++ b/drivers/gpu/drm/panel/Kconfig
> > >> @@ -706,6 +706,17 @@ config DRM_PANEL_SONY_ACX565AKM
> > >>         Say Y here if you want to enable support for the Sony ACX565AKM
> > >>         800x600 3.5" panel (found on the Nokia N900).
> > >> +config DRM_PANEL_SONY_AKATSUKI_LGD
> > >> +    tristate "Sony Xperia XZ3 LGD panel"
> > >> +    depends on GPIOLIB && OF
> > >> +    depends on DRM_MIPI_DSI
> > >> +    depends on BACKLIGHT_CLASS_DEVICE
> > >> +    help
> > >> +      Say Y here if you want to enable support for the Sony Xperia XZ3
> > >> +      1440x2880@60 6.0" OLED DSI cmd mode panel produced by LG Display.
> > >> +
> > >> +      This panel uses Display Stream Compression 1.1.
> > >> +
> > >>   config DRM_PANEL_SONY_TD4353_JDI
> > >>       tristate "Sony TD4353 JDI panel"
> > >>       depends on GPIOLIB && OF
> > >> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> > >> index ff169781e82d7..85133f73558f3 100644
> > >> --- a/drivers/gpu/drm/panel/Makefile
> > >> +++ b/drivers/gpu/drm/panel/Makefile
> > >> @@ -71,6 +71,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += panel-sitronix-st7701.o
> > >>   obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
> > >>   obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
> > >>   obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
> > >> +obj-$(CONFIG_DRM_PANEL_SONY_AKATSUKI_LGD) += panel-sony-akatsuki-lgd.o
> > >>   obj-$(CONFIG_DRM_PANEL_SONY_TD4353_JDI) += panel-sony-td4353-jdi.o
> > >>   obj-$(CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521) += panel-sony-tulip-truly-nt35521.o
> > >>   obj-$(CONFIG_DRM_PANEL_TDO_TL070WSH30) += panel-tdo-tl070wsh30.o
> > >> diff --git a/drivers/gpu/drm/panel/panel-sony-akatsuki-lgd.c b/drivers/gpu/drm/panel/panel-sony-akatsuki-lgd.c
> > >> new file mode 100644
> > >> index 0000000000000..f55788f963dab
> > >> --- /dev/null
> > >> +++ b/drivers/gpu/drm/panel/panel-sony-akatsuki-lgd.c
> > >> @@ -0,0 +1,362 @@
> > >> +// SPDX-License-Identifier: GPL-2.0-only
> > >> +/*
> > >> + * Copyright (c) 2023 Marijn Suijten <marijn.suijten@somainline.org>
> > >> + *
> > >> + * Based on Sony Downstream's "Atmel LGD ID5" Akatsuki panel dtsi.
> > >> + */
> > >> +
> > >> +#include <linux/backlight.h>
> > >> +#include <linux/delay.h>
> > >> +#include <linux/gpio/consumer.h>
> > >> +#include <linux/module.h>
> > >> +#include <linux/of.h>
> > >> +#include <linux/of_device.h>
> > >> +#include <linux/regulator/consumer.h>
> > >> +
> > >> +#include <video/mipi_display.h>
> > >> +
> > >> +#include <drm/drm_mipi_dsi.h>
> > >> +#include <drm/drm_modes.h>
> > >> +#include <drm/drm_panel.h>
> > >> +#include <drm/drm_probe_helper.h>
> > >> +#include <drm/display/drm_dsc.h>
> > >> +#include <drm/display/drm_dsc_helper.h>
> > >> +
> > >> +struct sony_akatsuki_lgd {
> > >> +    struct drm_panel panel;
> > >> +    struct mipi_dsi_device *dsi;
> > >> +    struct regulator *vddio;
> > >> +    struct gpio_desc *reset_gpio;
> > >> +    bool prepared;
> > >> +};
> > >> +
> > >> +static inline struct sony_akatsuki_lgd *to_sony_akatsuki_lgd(struct drm_panel *panel)
> > >> +{
> > >> +    return container_of(panel, struct sony_akatsuki_lgd, panel);
> > >> +}
> > >> +
> > >> +static int sony_akatsuki_lgd_on(struct sony_akatsuki_lgd *ctx)
> > >> +{
> > >> +    struct mipi_dsi_device *dsi = ctx->dsi;
> > >> +    struct device *dev = &dsi->dev;
> > >> +    int ret;
> > >> +
> > >> +    dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> > >> +
> > >> +    mipi_dsi_dcs_write_seq(dsi, 0x7f, 0x5a, 0x5a);
> > >> +    mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> > >> +    mipi_dsi_dcs_write_seq(dsi, 0xf1, 0x5a, 0x5a);
> > >> +    mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x5a, 0x5a);
> > >> +    mipi_dsi_dcs_write_seq(dsi, 0x02, 0x01);
> > >> +    mipi_dsi_dcs_write_seq(dsi, 0x59, 0x01);
> > >> +    /* Enable backlight control */
> > >> +    mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, BIT(5));
> > >> +    mipi_dsi_dcs_write_seq(dsi, 0x57, 0x20, 0x80, 0xde, 0x60, 0x00);
> > >> +
> > >> +    ret = mipi_dsi_dcs_set_column_address(dsi, 0, 1440 - 1);
> > >> +    if (ret < 0) {
> > >> +        dev_err(dev, "Failed to set column address: %d\n", ret);
> > >> +        return ret;
> > >> +    }
> > >> +
> > >> +    ret = mipi_dsi_dcs_set_page_address(dsi, 0, 2880 - 1);
> > >> +    if (ret < 0) {
> > >> +        dev_err(dev, "Failed to set page address: %d\n", ret);
> > >> +        return ret;
> > >> +    }
> > >> +
> > >> +    mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
> > >> +
> > >> +    ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> > >> +    if (ret < 0) {
> > >> +        dev_err(dev, "Failed to set tear on: %d\n", ret);
> > >> +        return ret;
> > >> +    }
> > >> +
> > >> +    mipi_dsi_dcs_write_seq(dsi, 0x7f, 0x5a, 0x5a);
> > >> +    mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> > >> +    mipi_dsi_dcs_write_seq(dsi, 0xf1, 0x5a, 0x5a);
> > >> +    mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x5a, 0x5a);
> > >> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x03);
> > >> +    mipi_dsi_dcs_write_seq(dsi, 0xf6, 0x04);
> > >> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x05);
> > >> +    mipi_dsi_dcs_write_seq(dsi, 0xf6, 0x01, 0x7f, 0x00);
> > >> +
> > >> +    ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> > >> +    if (ret < 0) {
> > >> +        dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> > >> +        return ret;
> > >> +    }
> > >> +    msleep(120);
> > >> +
> > >> +    mipi_dsi_dcs_write_seq(dsi, 0xe3, 0xac, 0x19, 0x34, 0x14, 0x7d);
> > >> +
> > >> +    ret = mipi_dsi_dcs_set_display_on(dsi);
> > >> +    if (ret < 0) {
> > >> +        dev_err(dev, "Failed to turn display on: %d\n", ret);
> > >> +        return ret;
> > >> +    }
> > >
> > > My usual question: should the mipi_dsi_dcs_exit_sleep_mode() / mipi_dsi_dcs_set_display_on() be moved from prepare() to enable() part?
> >
> >
> > No, prepare is called before the video stream is started and when display is still in LPM mode and the mode hasn't been set.
> >
> 
> Yes, that's my point. Shouldn't we enable the panel _after_ starting the stream?

I have never investigated what it takes to split these functions, but
some of these panels do show some corruption at startup which may be
circumvented by powering the panel on after starting the video stream?

I'm just not sure where to make the split: downstream does describe a
qcom,mdss-dsi-on-command and qcom,mdss-dsi-post-panel-on-command, where
the latter only contains set_display_on() (not exit_sleep_mode()).
It is documented like:

    same as "qcom,mdss-dsi-on-command" except commands are sent after
    displaying an image."

So this seems like the right way to split them up, I'll test this out on
all submitted panel drivers.

- Marijn

> 
> -- 
> With best wishes
> Dmitry
