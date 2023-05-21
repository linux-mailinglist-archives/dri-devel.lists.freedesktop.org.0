Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AADFC70AD74
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 12:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6FD10E1C5;
	Sun, 21 May 2023 10:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4486710E1C5
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 10:28:13 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7734C3F270;
 Sun, 21 May 2023 12:28:09 +0200 (CEST)
Date: Sun, 21 May 2023 12:28:06 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: Add driver for Visionox r66451 panel
Message-ID: <kc65fjf5xibvszx4afomzbmfrlld4vcnwfxqxefrupkaxw74fa@j2op4bj2recm>
References: <20230516-b4-r66451-panel-driver-v1-0-4210bcbb1649@quicinc.com>
 <20230516-b4-r66451-panel-driver-v1-2-4210bcbb1649@quicinc.com>
 <3cca2809-fa26-f0cf-2ccc-6737d150b43d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cca2809-fa26-f0cf-2ccc-6737d150b43d@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-18 03:19:49, Dmitry Baryshkov wrote:
> On 16/05/2023 23:20, Jessica Zhang wrote:
> > Add support for the 1080x2340 Visionox R66451 AMOLED DSI panel that
> > comes with the Qualcomm HDK8350 display expansion pack.
> > 
> > The panel enables display compression (DSC v1.2) by default.
> > 
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >   drivers/gpu/drm/panel/Kconfig                 |   8 +
> >   drivers/gpu/drm/panel/Makefile                |   1 +
> >   drivers/gpu/drm/panel/panel-visionox-r66451.c | 395 ++++++++++++++++++++++++++
> >   3 files changed, 404 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> > index 29cf5fa39ff2..9c2c36dbddf3 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -766,6 +766,14 @@ config DRM_PANEL_VISIONOX_VTDR6130
> >   	  Say Y here if you want to enable support for Visionox
> >   	  VTDR6130 1080x2400 AMOLED DSI panel.
> >   
> > +config DRM_PANEL_VISIONOX_R66451
> > +	tristate "Visionox R66451"
> > +	depends on OF
> > +	depends on DRM_MIPI_DSI
> > +	help
> > +	  Say Y here if you want to enable support for Visionox
> > +	  R66451 1080x2340 AMOLED DSI panel.
> > +
> >   config DRM_PANEL_WIDECHIPS_WS2401
> >   	tristate "Widechips WS2401 DPI panel driver"
> >   	depends on SPI && GPIOLIB
> > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> > index b3e8ba29edd3..e043a92ee676 100644
> > --- a/drivers/gpu/drm/panel/Makefile
> > +++ b/drivers/gpu/drm/panel/Makefile
> > @@ -78,5 +78,6 @@ obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
> >   obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
> >   obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
> >   obj-$(CONFIG_DRM_PANEL_VISIONOX_VTDR6130) += panel-visionox-vtdr6130.o
> > +obj-$(CONFIG_DRM_PANEL_VISIONOX_R66451) += panel-visionox-r66451.o
> >   obj-$(CONFIG_DRM_PANEL_WIDECHIPS_WS2401) += panel-widechips-ws2401.o
> >   obj-$(CONFIG_DRM_PANEL_XINPENG_XPP055C272) += panel-xinpeng-xpp055c272.o
> > diff --git a/drivers/gpu/drm/panel/panel-visionox-r66451.c b/drivers/gpu/drm/panel/panel-visionox-r66451.c
> > new file mode 100644
> > index 000000000000..e3648ead3e84
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-visionox-r66451.c
> > @@ -0,0 +1,395 @@
> > +//SPDX-License-Identifier: GPL-2.0-only
> > +//Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> > +
> > +#include <linux/backlight.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_modes.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/display/drm_dsc.h>
> > +#include <drm/display/drm_dsc_helper.h>
> > +
> > +#include <video/mipi_display.h>
> > +
> > +struct visionox_r66451 {
> > +	struct drm_panel panel;
> > +	struct mipi_dsi_device *dsi;
> > +	struct gpio_desc *reset_gpio;
> > +	struct regulator_bulk_data supplies[2];
> > +	bool prepared, enabled;
> > +};
> > +
> > +static inline struct visionox_r66451 *to_visionox_r66451(struct drm_panel *panel)
> > +{
> > +	return container_of(panel, struct visionox_r66451, panel);
> > +}
> > +
> > +static void visionox_r66451_reset(struct visionox_r66451 *ctx)
> > +{
> > +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> > +	usleep_range(10000, 10100);
> > +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > +	usleep_range(10000, 10100);
> > +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> > +	usleep_range(10000, 10100);
> > +}
> > +
> > +static int visionox_r66451_on(struct visionox_r66451 *ctx)
> > +{
> > +	struct mipi_dsi_device *dsi = ctx->dsi;
> > +	struct device *dev = &dsi->dev;
> > +	int ret;
> > +
> > +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> > +
> > +	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xc2,
> > +			       0x09, 0x24, 0x0c, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x00,
> > +			       0x09, 0x3c);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xd7,
> > +			       0x00, 0xb9, 0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a,
> > +			       0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19,
> > +			       0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x80);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xde,
> > +			       0x40, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18,
> > +			       0x10, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, 0x02, 0x00, 0x00);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x04);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xe8, 0x00, 0x02);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x00, 0x08);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xc4,
> > +			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +			       0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x32);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xcf,
> > +			       0x64, 0x0b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
> > +			       0x00, 0x0b, 0x77, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> > +			       0x02, 0x02, 0x02, 0x02, 0x02, 0x03);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xd3,
> > +			       0x45, 0x00, 0x00, 0x01, 0x13, 0x15, 0x00, 0x15, 0x07,
> > +			       0x0f, 0x77, 0x77, 0x77, 0x37, 0xb2, 0x11, 0x00, 0xa0,
> > +			       0x3c, 0x9c);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xd7,
> > +			       0x00, 0xb9, 0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a,
> > +			       0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19,
> > +			       0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xd8,
> > +			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +			       0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 0x3a,
> > +			       0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +			       0x00, 0x0a, 0x00, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0a,
> > +			       0x00, 0x32, 0x00, 0x0a, 0x00, 0x22);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xdf,
> > +			       0x50, 0x42, 0x58, 0x81, 0x2d, 0x00, 0x00, 0x00, 0x00,
> > +			       0x00, 0x00, 0x6b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +			       0x00, 0x00, 0x01, 0x0f, 0xff, 0xd4, 0x0e, 0x00, 0x00,
> > +			       0x00, 0x00, 0x00, 0x00, 0x0f, 0x53, 0xf1, 0x00, 0x00,
> > +			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xf7, 0x01);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x80);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x34, 0xb4, 0x00, 0x00, 0x00, 0x39, 0x04, 0x09, 0x34);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xe6, 0x00);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x04);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x50, 0x40);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x50, 0x00, 0x00, 0x00, 0x00);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x11);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x01, 0x00, 0x00, 0x00, 0x01);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xf4, 0x00, 0x02);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x19);
> > +	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x50, 0x42);
> > +	mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> > +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_COLUMN_ADDRESS, 0x00, 0x00, 0x04, 0x37);
> 
> Please use mipi_dsi_dcs_set_column_address(dsi, 0, 1080 - 1);
> 
> > +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PAGE_ADDRESS, 0x00, 0x00, 0x09, 0x23);
> 
> mipi_dsi_dcs_set_page_address(dsi, 0, 2340 - 1);

Yes please, thanks for already pointing these two out.

> 
> > +
> > +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> > +		return ret;
> > +	}
> > +	msleep(120);
> > +
> > +	ret = mipi_dsi_dcs_set_display_on(dsi);
> 
> Should the mipi_dsi_dcs_set_display_on() (and maybe exit sleep mode) be 
> a a part of _enable()? Correspondingly _off should IMO be a part of 
> _disable callback().
> 
> > +	if (ret < 0) {
> > +		dev_err(dev, "Failed on set display on: %d\n", ret);
> > +		return ret;
> > +	}
> > +	msleep(20);
> 
> 
> Do we need to add here the following line?
> 
> dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> 
> 
> > +
> > +	return 0;
> > +}
> > +
> > +static int visionox_r66451_off(struct visionox_r66451 *ctx)
> > +{
> > +	struct mipi_dsi_device *dsi = ctx->dsi;
> > +	struct device *dev = &dsi->dev;
> > +	int ret;
> > +
> > +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> > +
> > +	ret = mipi_dsi_dcs_set_display_off(dsi);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Failed to set display off: %d\n", ret);
> > +		return ret;
> > +	}
> > +	msleep(20);
> > +
> > +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> > +		return ret;
> > +	}
> > +	msleep(120);
> > +
> > +	return 0;
> > +}
> > +
> > +static int visionox_r66451_prepare(struct drm_panel *panel)
> > +{
> > +	struct visionox_r66451 *ctx = to_visionox_r66451(panel);
> > +	struct device *dev = &ctx->dsi->dev;
> > +	int ret;
> > +
> > +	if (ctx->prepared)
> > +		return 0;
> > +
> > +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies),
> > +				    ctx->supplies);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	visionox_r66451_reset(ctx);
> > +
> > +	ret = visionox_r66451_on(ctx);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> > +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > +		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> > +		return ret;
> > +	}
> > +
> > +	ctx->prepared = true;
> > +	return 0;
> > +}
> > +
> > +static int visionox_r66451_unprepare(struct drm_panel *panel)
> > +{
> > +	struct visionox_r66451 *ctx = to_visionox_r66451(panel);
> > +	struct device *dev = &ctx->dsi->dev;
> > +	int ret;
> > +
> > +	if (!ctx->prepared)
> > +		return 0;
> > +
> > +	ret = visionox_r66451_off(ctx);
> > +	if (ret < 0)
> > +		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> > +
> > +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > +	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> > +
> > +	ctx->prepared = false;
> > +	return 0;
> > +}
> > +
> > +static const struct drm_display_mode visionox_r66451_mode = {
> > +	.clock = (1080 + 95 + 1 + 40) * (2340 + 25 + 1 + 4) * 120 / 1000,
> > +	.hdisplay = 1080,
> > +	.hsync_start = 1080 + 95,
> > +	.hsync_end = 1080 + 95 + 1,
> > +	.htotal = 1080 + 95 + 1 + 40,
> > +	.vdisplay = 2340,
> > +	.vsync_start = 2340 + 25,
> > +	.vsync_end = 2340 + 25 + 1,
> > +	.vtotal = 2340 + 25 + 1 + 4,
> > +	.width_mm = 0,
> > +	.height_mm = 0,
> 
> Please provide real values here.
> 
> > +};
> > +
> > +static int visionox_r66451_enable(struct drm_panel *panel)
> > +{
> > +	struct visionox_r66451 *ctx = to_visionox_r66451(panel);
> > +	struct mipi_dsi_device *dsi = ctx->dsi;
> > +	struct drm_dsc_picture_parameter_set pps;
> > +	int ret;
> > +
> > +	if (ctx->enabled)
> > +		return 0;
> > +
> > +	if (!dsi->dsc) {
> > +		dev_err(&dsi->dev, "DSC not attached to DSI\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	drm_dsc_pps_payload_pack(&pps, dsi->dsc);
> > +	ret = mipi_dsi_picture_parameter_set(dsi, &pps);

This `ret` value is unused.

Do we also need to call mipi_dsi_compression_mode() to enable
compression?  This also selects PPS table 1 (which is supposedly the
default reset value, and the PPS that is uploaded by
mipi_dsi_picture_parameter_set()).  Note that it does set the algorithm
to "VESA DSC Standard 1.1" but i am unsure if it makes a difference
(docs for mipi_dsi_picture_parameter_set() say that it is "1.1" as well)

> > +
> > +	ctx->enabled = true;
> > +
> > +	return 0;
> > +}
> > +
> > +static int visionox_r66451_disable(struct drm_panel *panel)
> > +{
> > +	struct visionox_r66451 *ctx = to_visionox_r66451(panel);
> > +
> > +	ctx->enabled = false;
> > +
> > +	return 0;
> > +}
> > +
> > +static int visionox_r66451_get_modes(struct drm_panel *panel,
> > +				    struct drm_connector *connector)
> > +{
> > +	struct drm_display_mode *mode;
> > +
> > +	mode = drm_mode_duplicate(connector->dev, &visionox_r66451_mode);
> > +	if (!mode)
> > +		return -ENOMEM;
> > +
> > +	drm_mode_set_name(mode);
> > +
> > +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> > +	connector->display_info.width_mm = mode->width_mm;
> > +	connector->display_info.height_mm = mode->height_mm;
> > +	drm_mode_probed_add(connector, mode);
> 
> Can we use drm_connector_helper_get_modes_fixed() instead?

This does not set DRM_MODE_TYPE_DRIVER though; is that preferred?

> > +
> > +	return 1;
> > +}
> > +
> > +static const struct drm_panel_funcs visionox_r66451_funcs = {
> > +	.prepare = visionox_r66451_prepare,
> > +	.unprepare = visionox_r66451_unprepare,
> > +	.get_modes = visionox_r66451_get_modes,
> > +	.enable = visionox_r66451_enable,
> > +	.disable = visionox_r66451_disable,
> > +};
> > +
> > +static int visionox_r66451_bl_update_status(struct backlight_device *bl)
> > +{
> > +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> > +	u16 brightness = backlight_get_brightness(bl);
> > +
> > +	return mipi_dsi_dcs_set_display_brightness(dsi, cpu_to_le16(brightness));
> 
> mipi_dsi_dcs_set_display_brightness() already converts the brightness, 
> so you don't need cpu_to_le16 here.

Tread carefully here: we've had the same issue and conversation on our
Sony panels where this extra inversion is required.
set_display_brightness() sends the bytes as little-endian to the panel
(and it even assumes little-endian in get_display_brightness()) but the
spec for 16-bit brightness values states that they have to be sent in
big-endian.  This is why c9d27c6be518b ("drm/mipi-dsi: Fix byte order of
16-bit DCS set/get brightness") added
mipi_dsi_dcs_set_display_brightness_large().

Jessica, if you need to have the endian swap here (should be very easy
to test with a real panel, but it should be given the max_brightness
value being over 8 bits) please switch to the _large() variant.

> > +}
> > +
> > +static const struct backlight_ops visionox_r66451_bl_ops = {
> > +	.update_status = visionox_r66451_bl_update_status,

Should this implement get_brightness?

> > +};
> > +
> > +static struct backlight_device *
> > +visionox_r66451_create_backlight(struct mipi_dsi_device *dsi)
> > +{
> > +	struct device *dev = &dsi->dev;
> > +	const struct backlight_properties props = {
> > +		.type = BACKLIGHT_RAW,
> > +		.brightness = 255,
> > +		.max_brightness = 4095,
> > +	};
> > +
> > +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> > +					      &visionox_r66451_bl_ops, &props);
> > +}
> > +
> > +static int visionox_r66451_probe(struct mipi_dsi_device *dsi)
> > +{
> > +	struct device *dev = &dsi->dev;
> > +	struct visionox_r66451 *ctx;
> > +	struct drm_dsc_config *dsc;
> > +	int ret = 0;
> > +
> > +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> > +	if (!ctx)
> > +		return -ENOMEM;
> > +
> > +	dsc = devm_kzalloc(dev, sizeof(*dsc), GFP_KERNEL);
> > +	if (!dsc)
> > +		return -ENOMEM;
> > +
> > +	/* Set DSC params */
> > +	dsc->dsc_version_major = 0x1;
> > +	dsc->dsc_version_minor = 0x2;
> > +
> > +	dsc->slice_height = 20;
> > +	dsc->slice_width = 540;
> > +	dsc->slice_count = 2;
> > +	dsc->bits_per_component = 8;
> > +	dsc->bits_per_pixel = 0x8 << 4;

What's the 0x for?  bpc is also just "8" and not 0x8.

- Marijn

> > +	dsc->block_pred_enable = true;
> > +
> > +	dsi->dsc = dsc;
> > +
> > +	ctx->supplies[0].supply = "vddio";
> > +	ctx->supplies[1].supply = "vdd";
> > +
> > +	ret = devm_regulator_bulk_get(&dsi->dev, ARRAY_SIZE(ctx->supplies),
> > +			ctx->supplies);
> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > +	if (IS_ERR(ctx->reset_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio), "Failed to get reset-gpios\n");
> > +
> > +	ctx->dsi = dsi;
> > +	mipi_dsi_set_drvdata(dsi, ctx);
> > +
> > +	dsi->lanes = 4;
> > +	dsi->format = MIPI_DSI_FMT_RGB888;
> > +	dsi->mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
> > +
> > +	drm_panel_init(&ctx->panel, dev, &visionox_r66451_funcs, DRM_MODE_CONNECTOR_DSI);
> > +	ctx->panel.backlight = visionox_r66451_create_backlight(dsi);
> > +	if (IS_ERR(ctx->panel.backlight))
> > +		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> > +				"Failed to create backlight\n");
> > +
> > +	drm_panel_add(&ctx->panel);
> > +
> > +	ret = mipi_dsi_attach(dsi);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> > +		drm_panel_remove(&ctx->panel);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static void visionox_r66451_remove(struct mipi_dsi_device *dsi)
> > +{
> > +	struct visionox_r66451 *ctx = mipi_dsi_get_drvdata(dsi);
> > +	int ret;
> > +
> > +	ret = mipi_dsi_detach(dsi);
> > +	if (ret < 0)
> > +		dev_err(&dsi->dev, "Failed to detach DSI host: %d\n", ret);
> > +
> > +	drm_panel_remove(&ctx->panel);
> > +}
> > +
> > +static const struct of_device_id visionox_r66451_of_match[] = {
> > +	{.compatible = "visionox,r66451"},
> > +	{ /*sentinel*/ }
> > +};
> > +MODULE_DEVICE_TABLE(of, visionox_r66451_of_match);
> > +
> > +static struct mipi_dsi_driver visionox_r66451_driver = {
> > +	.probe = visionox_r66451_probe,
> > +	.remove = visionox_r66451_remove,
> > +	.driver = {
> > +		.name = "panel-visionox-r66451",
> > +		.of_match_table = visionox_r66451_of_match,
> > +	},
> > +};
> > +
> > +module_mipi_dsi_driver(visionox_r66451_driver);
> > +
> > +MODULE_AUTHOR("Jessica Zhang <quic_jesszhan@quicinc.com>");
> > +MODULE_DESCRIPTION("Panel driver for the Visionox R66451 AMOLED DSI panel");
> > +MODULE_LICENSE("GPL");
> > 
> 
> -- 
> With best wishes
> Dmitry
> 
