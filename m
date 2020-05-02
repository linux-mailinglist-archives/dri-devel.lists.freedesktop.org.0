Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C23E1C23B3
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 09:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A324D6E06D;
	Sat,  2 May 2020 07:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBFA6E06D
 for <dri-devel@lists.freedesktop.org>; Sat,  2 May 2020 07:05:35 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 91CCB20034;
 Sat,  2 May 2020 09:05:32 +0200 (CEST)
Date: Sat, 2 May 2020 09:05:31 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [PATCH 1/2] drivers: drm: panel: Add TM5P5 NT35596 panel driver
Message-ID: <20200502070531.GA11754@ravnborg.org>
References: <20200501204825.146424-1-konradybcio@gmail.com>
 <20200501204825.146424-2-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200501204825.146424-2-konradybcio@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=90fzL4WGibWdTmK8KlIA:9
 a=CjuIK1q_8ugA:10
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
Cc: devicetree@vger.kernel.org, skrzynka@konradybcio.pl,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Konrad.

On Fri, May 01, 2020 at 10:48:22PM +0200, Konrad Dybcio wrote:
> This adds support for TMP5P5 NT35596 1080x1920 video
> mode panel that can be found on some Asus Zenfone 2
> Laser (Z00T) devices.

Very well-writen driver. Only a few small things in the following.

	Sam

> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  drivers/gpu/drm/panel/Kconfig               |   9 +
>  drivers/gpu/drm/panel/Makefile              |   1 +
>  drivers/gpu/drm/panel/panel-tm5p5-nt35596.c | 366 ++++++++++++++++++++
>  3 files changed, 376 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-tm5p5-nt35596.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index a1723c1b5fbf8..6ff892334ac4b 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -401,6 +401,15 @@ config DRM_PANEL_SONY_ACX565AKM
>  	  Say Y here if you want to enable support for the Sony ACX565AKM
>  	  800x600 3.5" panel (found on the Nokia N900).
>  
> +config DRM_PANEL_TM5P5_NT35596
> +	tristate "TM5P5 NT35596 panel"
> +	depends on GPIOLIB && OF
> +	depends on DRM_MIPI_DSI
> +	help
> +	  Say Y here if you want to enable support for the TMP5P5
> +	  NT35596 1080x1920 video mode panel as found in some Asus
> +	  Zenfone 2 Laser Z00T devices.
> +
>  config DRM_PANEL_TPO_TD028TTEC1
>  	tristate "Toppoly (TPO) TD028TTEC1 panel driver"
>  	depends on OF && SPI
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 96a883cd66305..4fc7e00b18502 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -42,6 +42,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += panel-sitronix-st7701.o
>  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
>  obj-$(CONFIG_DRM_PANEL_SONY_ACX424AKP) += panel-sony-acx424akp.o
>  obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
> +obj-$(CONFIG_DRM_PANEL_TM5P5_NT35596) += panel-tm5p5-nt35596.o
>  obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
>  obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
>  obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
> diff --git a/drivers/gpu/drm/panel/panel-tm5p5-nt35596.c b/drivers/gpu/drm/panel/panel-tm5p5-nt35596.c
> new file mode 100644
> index 0000000000000..c361ab76812b8
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-tm5p5-nt35596.c
> @@ -0,0 +1,366 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +struct tm5p5_nt35596 {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct regulator_bulk_data supplies[2];
> +	struct gpio_desc *reset_gpio;
> +	bool prepared;
> +};
> +
> +static inline struct tm5p5_nt35596 *to_tm5p5_nt35596(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct tm5p5_nt35596, panel);
> +}
> +
> +#define dsi_generic_write_seq(dsi, seq...) do {				\
> +		static const u8 d[] = { seq };				\
> +		int ret;						\
> +		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));	\
> +		if (ret < 0)						\
> +			return ret;					\
> +	} while (0)
> +
> +#define dsi_dcs_write_seq(dsi, seq...) do {				\
> +		static const u8 d[] = { seq };				\
> +		int ret;						\
> +		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
> +		if (ret < 0)						\
> +			return ret;					\
> +	} while (0)
> +
> +static void tm5p5_nt35596_reset(struct tm5p5_nt35596 *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(15000, 16000);
> +}
> +
> +static int tm5p5_nt35596_on(struct tm5p5_nt35596 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;

Do you have any idea of what happens in the following?
I recall 0xff is explained in a few other drivers for example.

If you get an idea it would be nice with a few headlines.
> +
> +	dsi_generic_write_seq(dsi, 0xff, 0x05);
> +	dsi_generic_write_seq(dsi, 0xfb, 0x01);
> +	dsi_generic_write_seq(dsi, 0xc5, 0x31);
> +	dsi_generic_write_seq(dsi, 0xff, 0x04);
> +	dsi_generic_write_seq(dsi, 0x01, 0x84);
> +	dsi_generic_write_seq(dsi, 0x05, 0x25);
> +	dsi_generic_write_seq(dsi, 0x06, 0x01);
> +	dsi_generic_write_seq(dsi, 0x07, 0x20);
> +	dsi_generic_write_seq(dsi, 0x08, 0x06);
> +	dsi_generic_write_seq(dsi, 0x09, 0x08);
> +	dsi_generic_write_seq(dsi, 0x0a, 0x10);
> +	dsi_generic_write_seq(dsi, 0x0b, 0x10);
> +	dsi_generic_write_seq(dsi, 0x0c, 0x10);
> +	dsi_generic_write_seq(dsi, 0x0d, 0x14);
> +	dsi_generic_write_seq(dsi, 0x0e, 0x14);
> +	dsi_generic_write_seq(dsi, 0x0f, 0x14);
> +	dsi_generic_write_seq(dsi, 0x10, 0x14);
> +	dsi_generic_write_seq(dsi, 0x11, 0x14);
> +	dsi_generic_write_seq(dsi, 0x12, 0x14);
> +	dsi_generic_write_seq(dsi, 0x17, 0xf3);
> +	dsi_generic_write_seq(dsi, 0x18, 0xc0);
> +	dsi_generic_write_seq(dsi, 0x19, 0xc0);
> +	dsi_generic_write_seq(dsi, 0x1a, 0xc0);
> +	dsi_generic_write_seq(dsi, 0x1b, 0xb3);
> +	dsi_generic_write_seq(dsi, 0x1c, 0xb3);
> +	dsi_generic_write_seq(dsi, 0x1d, 0xb3);
> +	dsi_generic_write_seq(dsi, 0x1e, 0xb3);
> +	dsi_generic_write_seq(dsi, 0x1f, 0xb3);
> +	dsi_generic_write_seq(dsi, 0x20, 0xb3);
> +	dsi_generic_write_seq(dsi, 0xfb, 0x01);
> +	dsi_generic_write_seq(dsi, 0xff, 0x00);
> +	dsi_generic_write_seq(dsi, 0xfb, 0x01);
> +	dsi_generic_write_seq(dsi, 0x35, 0x01);
> +	dsi_generic_write_seq(dsi, 0xd3, 0x06);
> +	dsi_generic_write_seq(dsi, 0xd4, 0x04);
> +	dsi_generic_write_seq(dsi, 0x5e, 0x0d);
> +	dsi_generic_write_seq(dsi, 0x11, 0x00);
> +	msleep(100);
> +	dsi_generic_write_seq(dsi, 0x29, 0x00);
> +	dsi_generic_write_seq(dsi, 0x53, 0x24);
> +
> +	return 0;
> +}
> +
> +static int tm5p5_nt35596_off(struct tm5p5_nt35596 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display off: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(60);
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> +		return ret;
> +	}

I wonder why the panel do not need a:
mipi_dsi_dcs_exit_sleep_mode()
and
mipi_dsi_dcs_set_display_on()

in the tm5p5_nt35596_on() function.

Usually the prepare and unprepare steps are
somehow symmetrical.

> +
> +	dsi_dcs_write_seq(dsi, 0x4f, 0x01);
> +
> +	return 0;
> +}
> +
> +static int tm5p5_nt35596_prepare(struct drm_panel *panel)
> +{
> +	struct tm5p5_nt35596 *ctx = to_tm5p5_nt35596(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	if (ctx->prepared)
> +		return 0;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	tm5p5_nt35596_reset(ctx);
> +
> +	ret = tm5p5_nt35596_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
Line too long.

> +		return ret;
> +	}
> +
> +	ctx->prepared = true;
> +	return 0;
> +}
> +
> +static int tm5p5_nt35596_unprepare(struct drm_panel *panel)
> +{
> +	struct tm5p5_nt35596 *ctx = to_tm5p5_nt35596(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	if (!ctx->prepared)
> +		return 0;
> +
> +	ret = tm5p5_nt35596_off(ctx);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +
> +	ctx->prepared = false;
> +	return 0;
> +}
> +
> +static const struct drm_display_mode tm5p5_nt35596_mode = {
> +	.clock = (1080 + 100 + 8 + 16) * (1920 + 4 + 2 + 4) * 60 / 1000,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 100,
> +	.hsync_end = 1080 + 100 + 8,
> +	.htotal = 1080 + 100 + 8 + 16,
> +	.vdisplay = 1920,
> +	.vsync_start = 1920 + 4,
> +	.vsync_end = 1920 + 4 + 2,
> +	.vtotal = 1920 + 4 + 2 + 4,
> +	.vrefresh = 60,
> +	.width_mm = 68,
> +	.height_mm = 121,
> +};
We have patches pending to remove vrefresh, which I thought
was already applied. Anyway, keep it here.
We will eaither remove it later or if the patches crosses
I will do it when applying this patch.

> +
> +static int tm5p5_nt35596_get_modes(struct drm_panel *panel,
> +				   struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, &tm5p5_nt35596_mode);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	drm_mode_set_name(mode);
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs tm5p5_nt35596_panel_funcs = {
> +	.prepare = tm5p5_nt35596_prepare,
> +	.unprepare = tm5p5_nt35596_unprepare,
> +	.get_modes = tm5p5_nt35596_get_modes,
> +};
> +
> +static int tm5p5_nt35596_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = bl->props.brightness;
> +	int ret;
> +
> +	if (bl->props.power != FB_BLANK_UNBLANK ||
> +	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
> +	    bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> +		brightness = 0;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return 0;
> +}
> +
> +// TODO: Check if /sys/class/backlight/.../actual_brightness actually returns
> +// correct values. If not, remove this function.
Please resolve this TODO

> +static int tm5p5_nt35596_bl_get_brightness(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = bl->props.brightness;
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return brightness & 0xff;
> +}
> +
> +static const struct backlight_ops tm5p5_nt35596_bl_ops = {
> +	.update_status = tm5p5_nt35596_bl_update_status,
> +	.get_brightness = tm5p5_nt35596_bl_get_brightness,
> +};
> +
> +static struct backlight_device *
> +tm5p5_nt35596_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.brightness = 255,
> +		.max_brightness = 255,
> +	};
Make props const.

> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &tm5p5_nt35596_bl_ops, &props);
> +}
> +
> +static int tm5p5_nt35596_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct tm5p5_nt35596 *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->supplies[0].supply = "vdd";
> +	ctx->supplies[1].supply = "vddio";
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
> +				      ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		ret = PTR_ERR(ctx->reset_gpio);
> +		dev_err(dev, "Failed to get reset-gpios: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_EOT_PACKET |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
> +
> +	drm_panel_init(&ctx->panel, dev, &tm5p5_nt35596_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	ctx->panel.backlight = tm5p5_nt35596_create_backlight(dsi);
> +	if (IS_ERR(ctx->panel.backlight)) {
> +		ret = PTR_ERR(ctx->panel.backlight);
> +		dev_err(dev, "Failed to create backlight: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = drm_panel_add(&ctx->panel);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to add panel: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tm5p5_nt35596_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct tm5p5_nt35596 *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
Line too long I think

> +
> +	drm_panel_remove(&ctx->panel);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id tm5p5_nt35596_of_match[] = {
> +	{ .compatible = "tm5p5,nt35596" },
vendor tm5p5 is not documented.

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, tm5p5_nt35596_of_match);
> +
> +static struct mipi_dsi_driver tm5p5_nt35596_driver = {
> +	.probe = tm5p5_nt35596_probe,
> +	.remove = tm5p5_nt35596_remove,
> +	.driver = {
> +		.name = "panel-tm5p5-nt35596",
> +		.of_match_table = tm5p5_nt35596_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(tm5p5_nt35596_driver);
> +
> +MODULE_AUTHOR("Konrad Dybcio <konradybcio@gmail.com>");
> +MODULE_DESCRIPTION("DRM driver for tm5p5 nt35596 1080p video mode dsi panel");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.26.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
