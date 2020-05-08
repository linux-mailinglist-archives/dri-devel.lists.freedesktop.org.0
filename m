Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5717D1CA6B5
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 11:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9B86EAB1;
	Fri,  8 May 2020 09:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C1F6EAB1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 09:02:57 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 52E5E2002C;
 Fri,  8 May 2020 11:02:54 +0200 (CEST)
Date: Fri, 8 May 2020 11:02:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dillon.minfei@gmail.com
Subject: Re: [PATCH v2 5/5] drm/panel: add panel driver for Ilitek ili9341
 panels
Message-ID: <20200508090247.GA11575@ravnborg.org>
References: <1588911194-12433-1-git-send-email-dillon.minfei@gmail.com>
 <1588911194-12433-6-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1588911194-12433-6-git-send-email-dillon.minfei@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=f00rTkaq7gsWSwZchSUA:9
 a=V3FauXp4hO1YZiWc:21 a=DYt0V8K-_OyiRC18:21 a=CjuIK1q_8ugA:10
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
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, airlied@linux.ie, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, sboyd@kernel.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dillon.

Patch submissions starts to look fine.

On Fri, May 08, 2020 at 12:13:14PM +0800, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> This is a driver for 320x240 TFT panels, accepting a rgb input
> streams that get adapted and scaled to the panel.
This driver is, I suppose, prepared to be a driver for ILI9341 based
panles, and as such not for a fixed resolution.
I expect (hope) we in the future will see more panels added.


Some things to fix, see comments in the follwoing.

	Sam

> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                |   8 +
>  drivers/gpu/drm/panel/Makefile               |   1 +
>  drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 561 +++++++++++++++++++++++++++
>  3 files changed, 570 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index a1723c1..e42692c 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -95,6 +95,14 @@ config DRM_PANEL_ILITEK_IL9322
>  	  Say Y here if you want to enable support for Ilitek IL9322
>  	  QVGA (320x240) RGB, YUV and ITU-T BT.656 panels.
>  
> +config DRM_PANEL_ILITEK_IL9341
ILI9341 - so the config name matches the name of the driver IC.

> +	tristate "Ilitek ILI9341 240x320 QVGA panels"
> +	depends on OF && SPI
> +	select REGMAP
> +	help
> +	  Say Y here if you want to enable support for Ilitek IL9341
> +	  QVGA (240x320) RGB panels.
See comment to the changelog, the driver is more generic - I assume.
So the wording here can be improved to express this.

> +
>  config DRM_PANEL_ILITEK_ILI9881C
>  	tristate "Ilitek ILI9881C-based panels"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 96a883c..d123543 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
>  obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) += panel-feixin-k101-im2ba02.o
>  obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
>  obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
> +obj-$(CONFIG_DRM_PANEL_ILITEK_IL9341) += panel-ilitek-ili9341.o
>  obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
>  obj-$(CONFIG_DRM_PANEL_INNOLUX_P079ZCA) += panel-innolux-p079zca.o
>  obj-$(CONFIG_DRM_PANEL_JDI_LT070ME05000) += panel-jdi-lt070me05000.o
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> new file mode 100644
> index 0000000..ec22d80
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> @@ -0,0 +1,561 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Ilitek ILI9341 TFT LCD drm_panel driver.
> + *
> + * This panel can be configured to support:
> + * - 16-bit parallel RGB interface
The interface to ILI9341 is SPI, and the interface between the ILI9341
and the panel is more of an itnernal thing. Or did I get this worng?

> + *
> + * Copyright (C) 2020 Dillon Min <dillon.minfei@gmail.com>
> + * Derived from drivers/drm/gpu/panel/panel-ilitek-ili9322.c
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/spi/spi.h>
> +
> +#include <video/mipi_display.h>
> +#include <video/of_videomode.h>
> +#include <video/videomode.h>
> +
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
> +#define DEFAULT_SPI_SPEED	10000000
> +

Please use same case for hex numbers in the driver.
My personal preferences is lower-case.

> +#define ILI9341_SLEEP_OUT            0x11   /* Sleep out register */
> +#define ILI9341_GAMMA                0x26   /* Gamma register */
> +#define ILI9341_DISPLAY_OFF          0x28   /* Display off register */
> +#define ILI9341_DISPLAY_ON           0x29   /* Display on register */
> +#define ILI9341_COLUMN_ADDR          0x2A   /* Colomn address register */
> +#define ILI9341_PAGE_ADDR            0x2B   /* Page address register */
> +#define ILI9341_GRAM                 0x2C   /* GRAM register */
> +#define ILI9341_MAC                  0x36   /* Memory Access Control register*/
> +#define ILI9341_PIXEL_FORMAT         0x3A   /* Pixel Format register */
> +#define ILI9341_WDB                  0x51   /* Write Brightness Display
> +					     * register
> +					     */
> +#define ILI9341_WCD                  0x53   /* Write Control Display
> +					     * register
> +					     */
> +#define ILI9341_RGB_INTERFACE        0xB0   /* RGB Interface Signal Control */
> +#define ILI9341_FRC                  0xB1   /* Frame Rate Control register */
> +#define ILI9341_BPC                  0xB5   /* Blanking Porch Control
> +					     * register
> +					     */
> +#define ILI9341_DFC                  0xB6   /* Display Function Control
> +					     * register
> +					     */
> +#define ILI9341_POWER1               0xC0   /* Power Control 1 register */
> +#define ILI9341_POWER2               0xC1   /* Power Control 2 register */
> +#define ILI9341_VCOM1                0xC5   /* VCOM Control 1 register */
> +#define ILI9341_VCOM2                0xC7   /* VCOM Control 2 register */
> +#define ILI9341_POWERA               0xCB   /* Power control A register */
> +#define ILI9341_POWERB               0xCF   /* Power control B register */
> +#define ILI9341_PGAMMA               0xE0   /* Positive Gamma Correction
> +					     * register
> +					     */
> +#define ILI9341_NGAMMA               0xE1   /* Negative Gamma Correction
> +					     * register
> +					     */
> +#define ILI9341_DTCA                 0xE8   /* Driver timing control A */
> +#define ILI9341_DTCB                 0xEA   /* Driver timing control B */
> +#define ILI9341_POWER_SEQ            0xED   /* Power on sequence register */
> +#define ILI9341_3GAMMA_EN            0xF2   /* 3 Gamma enable register */
> +#define ILI9341_INTERFACE            0xF6   /* Interface control register */
> +#define ILI9341_PRC                  0xF7   /* Pump ratio control register */
> +

All the following should be const.
Can any of the below be replaces by DEFINED constants?
> +static u8 ili9341_cmd0[] = {0xc3, 0x08, 0x50};
> +static u8 ili9341_powerb[] = {0x00, 0xc1, 0x30};
> +static u8 ili9341_power_seq[] = {0x64, 0x03, 0x12, 0x81};
> +static u8 ili9341_dtca[] = {0x85, 0x00, 0x78};
> +static u8 ili9341_powera[] = {0x39, 0x2c, 0x00, 0x34, 0x02};
> +static u8 ili9341_prc[] = {0x20};
> +static u8 ili9341_dtcb[] = {0x00, 0x00};
> +static u8 ili9341_frc[] = {0x00, 0x1b};
> +static u8 ili9341_dfc1[] = {0x0a, 0xa2};
> +static u8 ili9341_power1[] = {0x10};
> +static u8 ili9341_power2[] = {0x10};
> +static u8 ili9341_vcom1[] = {0x45, 0x15};
> +static u8 ili9341_vcom2[] = {0x90};
> +static u8 ili9341_mac[] = {0xc8};
> +static u8 ili9341_gamma_en[] = {0x00};
> +static u8 ili9341_rgb_intr[] = {0xc2};
> +static u8 ili9341_dfc2[] = {0x0a, 0xa7, 0x27, 0x04};
> +static u8 ili9341_column_addr[] = {0x00, 0x00, 0x00, 0xef};
> +static u8 ili9341_page_addr[] = {0x00, 0x00, 0x01, 0x3f};
> +static u8 ili9341_intr[] = {0x01, 0x00, 0x06};
> +static u8 ili9341_gamma[] = {0x01};
> +static u8 ili9341_pgamma[] = {0x0f, 0x29, 0x24, 0x0c, 0x0e, 0x09, 0x4e, 0x78,
> +				0x3c, 0x09, 0x13, 0x05,	0x17, 0x11, 0x00};
> +static u8 ili9341_ngamma[] = {0x00, 0x16, 0x1b, 0x04, 0x11, 0x07, 0x31, 0x33,
> +				0x42, 0x05, 0x0c, 0x0a, 0x28, 0x2f, 0x0f};
> +
> +/**
> + * enum ili9341_input - the format of the incoming signal to the panel
> + *
> + * The panel can be connected to various input streams and four of them can
> + * be selected by electronic straps on the display. However it is possible
> + * to select another mode or override the electronic default with this
> + * setting.
> + */
> +enum ili9341_input {
> +	ILI9341_INPUT_PRGB_THROUGH = 0x0,
> +	ILI9341_INPUT_PRGB_ALIGNED = 0x1,
> +	ILI9341_INPUT_UNKNOWN = 0xf,
> +};
> +
> +/**
> + * struct ili9341_config - the system specific ILI9341 configuration
> + * @width_mm: physical panel width [mm]
> + * @height_mm: physical panel height [mm]
> + * @input: the input/entry type used in this system, if this is set to
> + * ILI9341_INPUT_UNKNOWN the driver will try to figure it out by probing
> + * the hardware
> + * @dclk_active_high: data/pixel clock active high, data will be clocked
> + * in on the rising edge of the DCLK (this is usually the case).
> + * @de_active_high: DE (data entry) is active high
> + * @hsync_active_high: HSYNC is active high
> + * @vsync_active_high: VSYNC is active high
> + */
> +struct ili9341_config {
> +	u32 width_mm;
> +	u32 height_mm;
> +	enum ili9341_input input;
> +	bool dclk_active_high;
> +	bool de_active_high;
> +	bool hsync_active_high;
> +	bool vsync_active_high;
> +};
> +
> +struct ili9341 {
> +	struct device *dev;
> +	const struct ili9341_config *conf;
> +	struct drm_panel panel;
> +	struct regmap *regmap;
> +	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *dc_gpio;
> +	enum ili9341_input input;

> +	struct videomode vm;
videomode is not used. So drop this field and drop the include files
that are no logner needed.

> +};
> +
> +static inline struct ili9341 *panel_to_ili9341(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct ili9341, panel);
> +}
> +
> +int ili9341_spi_transfer(struct spi_device *spi, u32 speed_hz,
> +			  u8 bpw, const void *buf, size_t len)
> +{
> +	size_t max_chunk = spi_max_transfer_size(spi);
> +	struct spi_transfer tr = {
const?

> +		.bits_per_word = bpw,
> +		.speed_hz = speed_hz,
> +		.len = len,
> +	};
> +	struct spi_message m;
> +	size_t chunk;
> +	int ret;
> +
> +	spi_message_init_with_transfers(&m, &tr, 1);
> +
> +	while (len) {
> +		chunk = min(len, max_chunk);
> +
> +		tr.tx_buf = buf;
> +		tr.len = chunk;
> +		buf += chunk;
> +		len -= chunk;
> +
> +		ret = spi_sync(spi, &m);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +static int ili9341_regmap_spi_write(void *context, const void *data,
> +				    size_t count)
> +{
> +	struct device *dev = context;
> +	struct spi_device *spi = to_spi_device(dev);
> +	struct ili9341 *ili = spi_get_drvdata(spi);
> +	int ret = 0;
> +
> +	gpiod_set_value_cansleep(ili->dc_gpio, 0);
> +
> +	ret = ili9341_spi_transfer(spi, DEFAULT_SPI_SPEED, 8, data+0, 1);
> +	if (ret || count == 1 ||
> +			((u8 *)data)[0] == ILI9341_GRAM ||
> +			((u8 *)data)[0] == ILI9341_DISPLAY_ON ||
> +			((u8 *)data)[0] == ILI9341_SLEEP_OUT ||
> +			((u8 *)data)[0] == ILI9341_DISPLAY_OFF)
> +		return ret;
> +
> +	gpiod_set_value_cansleep(ili->dc_gpio, 1);
> +
> +	return ili9341_spi_transfer(spi, DEFAULT_SPI_SPEED, 8, data+1, count-1);
> +}
> +
> +static int ili9341_regmap_spi_read(void *context, const void *reg,
> +				   size_t reg_size, void *val, size_t val_size)
> +{
> +	return 0;
> +}
Is this function really needed? If not delete it.

> +
> +static struct regmap_bus ili9341_regmap_bus = {
> +	.write = ili9341_regmap_spi_write,
> +	.read = ili9341_regmap_spi_read,
> +	.reg_format_endian_default = REGMAP_ENDIAN_BIG,
> +	.val_format_endian_default = REGMAP_ENDIAN_BIG,
> +};
> +
> +static bool ili9341_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	return false;
> +}
Is this function really nedded? If not delete it.

> +
> +static bool ili9341_writeable_reg(struct device *dev, unsigned int reg)
> +{
> +	/* Just register 0 is read-only */
> +	if (reg == 0x00)
> +		return false;
> +	return true;
> +}
> +
> +static const struct regmap_config ili9341_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0xff,
> +	.cache_type = REGCACHE_RBTREE,
> +	.volatile_reg = ili9341_volatile_reg,
> +	.writeable_reg = ili9341_writeable_reg,
> +};
> +

No error checks - consider something like:

static int bulk_write(struct ili9341 *ili, u8 reg, const u8[] data, int len)
{
	int err = ili->err;

	if (!err) {
		err = regmap_bulk_write(ili->regmap, reg, data, len);
		if (err) {
			dev_err(...);
			ili->err = err;
		}
	}

	return err;
}

Then you can use this in the following, and make this more readable.

> +static int ili9341_init(struct drm_panel *panel, struct ili9341 *ili)
> +{
> +	regmap_bulk_write(ili->regmap, 0xca,
> +					ili9341_cmd0, sizeof(ili9341_cmd0));
> +	regmap_bulk_write(ili->regmap, ILI9341_POWERB,
> +				ili9341_powerb, sizeof(ili9341_powerb));
> +	regmap_bulk_write(ili->regmap, ILI9341_POWER_SEQ,
> +				ili9341_power_seq, sizeof(ili9341_power_seq));
> +	regmap_bulk_write(ili->regmap, ILI9341_DTCA,
> +				ili9341_dtca, sizeof(ili9341_dtca));
> +	regmap_bulk_write(ili->regmap, ILI9341_POWERA,
> +				ili9341_powera, sizeof(ili9341_powera));
> +	regmap_write(ili->regmap, ILI9341_PRC, ili9341_prc[0]);
> +	regmap_bulk_write(ili->regmap, ILI9341_DTCB,
> +				ili9341_dtcb, sizeof(ili9341_dtcb));
> +	regmap_bulk_write(ili->regmap, ILI9341_FRC,
> +				ili9341_frc, sizeof(ili9341_frc));
> +	regmap_bulk_write(ili->regmap, ILI9341_DFC,
> +				ili9341_dfc1, sizeof(ili9341_dfc1));
> +	regmap_write(ili->regmap, ILI9341_POWER1, ili9341_power1[0]);
> +	regmap_write(ili->regmap, ILI9341_POWER2, ili9341_power2[0]);
> +	regmap_bulk_write(ili->regmap, ILI9341_VCOM1,
> +				ili9341_vcom1, sizeof(ili9341_vcom1));
> +	regmap_write(ili->regmap, ILI9341_VCOM2, ili9341_vcom2[0]);
> +	regmap_write(ili->regmap, ILI9341_MAC, ili9341_mac[0]);
> +	regmap_write(ili->regmap, ILI9341_3GAMMA_EN, ili9341_gamma_en[0]);
> +	regmap_write(ili->regmap, ILI9341_RGB_INTERFACE, ili9341_rgb_intr[0]);
> +	regmap_bulk_write(ili->regmap, ILI9341_DFC,
> +				ili9341_dfc2, sizeof(ili9341_dfc2));
> +
> +	/* colomn address set */
> +	regmap_bulk_write(ili->regmap, ILI9341_COLUMN_ADDR,
> +			ili9341_column_addr, sizeof(ili9341_column_addr));
> +
> +	/* Page Address Set */
> +	regmap_bulk_write(ili->regmap, ILI9341_PAGE_ADDR,
> +				ili9341_page_addr, sizeof(ili9341_page_addr));
> +	regmap_bulk_write(ili->regmap, ILI9341_INTERFACE,
> +				ili9341_intr, sizeof(ili9341_intr));
> +	regmap_write(ili->regmap, ILI9341_GRAM, 0);
> +	msleep(200);
> +
> +	regmap_write(ili->regmap, ILI9341_GAMMA, ili9341_gamma[0]);
> +	regmap_bulk_write(ili->regmap, ILI9341_PGAMMA,
> +				ili9341_pgamma, sizeof(ili9341_pgamma));
> +	regmap_bulk_write(ili->regmap, ILI9341_NGAMMA,
> +				ili9341_ngamma, sizeof(ili9341_ngamma));
> +	regmap_write(ili->regmap, ILI9341_SLEEP_OUT, 0);
> +	msleep(200);
> +
> +	regmap_write(ili->regmap, ILI9341_DISPLAY_ON, 0);
> +
> +	/* GRAM start writing */
> +	regmap_write(ili->regmap, ILI9341_GRAM, 0);
> +
> +	dev_info(ili->dev, "initialized display\n");
> +
> +	return 0;
> +}
> +
> +/*
> + * This power-on sequence if from the datasheet, page 57.
> + */
> +static int ili9341_power_on(struct ili9341 *ili)
> +{
> +	/* Assert RESET */
> +	gpiod_set_value(ili->reset_gpio, 1);
> +
> +	msleep(20);
> +
> +	/* De-assert RESET */
> +	gpiod_set_value(ili->reset_gpio, 0);
> +
> +	msleep(10);
> +
> +	return 0;
> +}
> +
> +static int ili9341_power_off(struct ili9341 *ili)
> +{

	Assert reset?

> +	return 0;
> +}
> +
> +static int ili9341_disable(struct drm_panel *panel)
> +{
> +	struct ili9341 *ili = panel_to_ili9341(panel);
> +	int ret;
> +
> +	ret = regmap_write(ili->regmap, ILI9341_DISPLAY_OFF, 0);
> +	if (ret) {
> +		dev_err(ili->dev, "unable to go to standby mode\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ili9341_unprepare(struct drm_panel *panel)
> +{
> +	struct ili9341 *ili = panel_to_ili9341(panel);
> +
> +	return ili9341_power_off(ili);
> +}
> +
> +static int ili9341_prepare(struct drm_panel *panel)
> +{
> +	struct ili9341 *ili = panel_to_ili9341(panel);
> +	int ret;
> +
> +	ret = ili9341_power_on(ili);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ili9341_init(panel, ili);
> +	if (ret < 0)
> +		ili9341_unprepare(panel);
> +
> +	return ret;
> +}
> +
> +static int ili9341_enable(struct drm_panel *panel)
> +{
> +	struct ili9341 *ili = panel_to_ili9341(panel);
> +	int ret;
> +
> +	ret = regmap_write(ili->regmap, ILI9341_DISPLAY_ON, 0);
> +	if (ret) {
> +		dev_err(ili->dev, "unable to enable panel\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/* This is the only mode listed for parallel RGB in the datasheet */
> +static const struct drm_display_mode prgb_320x240_mode = {
> +	.clock = 6100,
> +	.hdisplay = 240,
> +	.hsync_start = 240 + 10,
> +	.hsync_end = 240 + 10 + 10,
> +	.htotal = 280,
> +	.vdisplay = 320,
> +	.vsync_start = 320 + 4,
> +	.vsync_end = 320 + 4 + 2,
> +	.vtotal = 328,
> +	.vrefresh = 60,
> +	.flags = 0,
> +};
> +
> +static int ili9341_get_modes(struct drm_panel *panel,
> +				struct drm_connector *connector)
> +{
> +	struct ili9341 *ili = panel_to_ili9341(panel);
> +	struct drm_device *drm = connector->dev;
> +	struct drm_display_mode *mode;
> +	struct drm_display_info *info;
> +
> +	info = &connector->display_info;
> +	info->width_mm = ili->conf->width_mm;
> +	info->height_mm = ili->conf->height_mm;
> +	if (ili->conf->dclk_active_high)
> +		info->bus_flags |= DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE;
> +	else
> +		info->bus_flags |= DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
> +
> +	if (ili->conf->de_active_high)
> +		info->bus_flags |= DRM_BUS_FLAG_DE_HIGH;
> +	else
> +		info->bus_flags |= DRM_BUS_FLAG_DE_LOW;
> +
> +	switch (ili->input) {
> +	case ILI9341_INPUT_PRGB_THROUGH:
> +	case ILI9341_INPUT_PRGB_ALIGNED:
> +		mode = drm_mode_duplicate(drm, &prgb_320x240_mode);
> +		break;
> +	default:
> +		mode = NULL;
> +		break;
> +	}
> +	if (!mode) {
> +		DRM_ERROR("bad mode or failed to add mode\n");
> +		return -EINVAL;
> +	}
> +	drm_mode_set_name(mode);
> +	/*
> +	 * This is the preferred mode because most people are going
> +	 * to want to use the display with VGA type graphics.
> +	 */
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +
> +	/* Set up the polarity */
> +	if (ili->conf->hsync_active_high)
> +		mode->flags |= DRM_MODE_FLAG_PHSYNC;
> +	else
> +		mode->flags |= DRM_MODE_FLAG_NHSYNC;
> +	if (ili->conf->vsync_active_high)
> +		mode->flags |= DRM_MODE_FLAG_PVSYNC;
> +	else
> +		mode->flags |= DRM_MODE_FLAG_NVSYNC;
> +
> +	mode->width_mm = ili->conf->width_mm;
> +	mode->height_mm = ili->conf->height_mm;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1; /* Number of modes */
> +}
> +
> +static const struct drm_panel_funcs ili9341_drm_funcs = {
> +	.disable = ili9341_disable,
> +	.unprepare = ili9341_unprepare,
> +	.prepare = ili9341_prepare,
> +	.enable = ili9341_enable,
> +	.get_modes = ili9341_get_modes,
> +};
> +
> +static int ili9341_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct ili9341 *ili;
> +	const struct regmap_config *regmap_config;
> +	int ret;
> +
> +	ili = devm_kzalloc(dev, sizeof(struct ili9341), GFP_KERNEL);
> +	if (!ili)
> +		return -ENOMEM;
> +
> +	spi_set_drvdata(spi, ili);
> +
> +	ili->dev = dev;
> +	/*
> +	 * Every new incarnation of this display must have a unique
> +	 * data entry for the system in this driver.
> +	 */
> +	ili->conf = of_device_get_match_data(dev);
> +	if (!ili->conf) {
> +		dev_err(dev, "missing device configuration\n");
> +		return -ENODEV;
> +	}
> +
> +	ili->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ili->reset_gpio)) {
> +		dev_err(dev, "failed to get RESET GPIO\n");
> +		return PTR_ERR(ili->reset_gpio);
> +	}
> +
> +	ili->dc_gpio = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
> +	if (IS_ERR(ili->dc_gpio)) {
> +		dev_err(dev, "failed to get DC GPIO\n");
> +		return PTR_ERR(ili->dc_gpio);
> +	}
> +
> +	spi->bits_per_word = 8;
> +	ret = spi_setup(spi);
> +	if (ret < 0) {
> +		dev_err(dev, "spi setup failed.\n");
> +		return ret;
> +	}
> +
> +	regmap_config = &ili9341_regmap_config;
> +
> +	ili->regmap = devm_regmap_init(dev, &ili9341_regmap_bus, dev,
> +				       regmap_config);
> +	if (IS_ERR(ili->regmap)) {
> +		dev_err(dev, "failed to allocate register map\n");
> +		return PTR_ERR(ili->regmap);
> +	}
> +
> +	ili->input = ili->conf->input;
> +
> +	drm_panel_init(&ili->panel, dev, &ili9341_drm_funcs,
> +		       DRM_MODE_CONNECTOR_DPI);
> +
> +	return drm_panel_add(&ili->panel);
> +}
> +
> +static int ili9341_remove(struct spi_device *spi)
> +{
> +	struct ili9341 *ili = spi_get_drvdata(spi);
> +
> +	ili9341_power_off(ili);
> +	drm_panel_remove(&ili->panel);
> +
> +	return 0;
> +}
> +
> +/*
> + * The Stm32f429-disco board has a panel ili9341 connected to ltdc controller
> + */
> +static const struct ili9341_config ili9341_data = {
This should be named "disco" something as this is m32f429-disco
specific.

> +	.width_mm = 65,
> +	.height_mm = 50,
> +	.input = ILI9341_INPUT_PRGB_THROUGH,
> +	.dclk_active_high = true,
> +	.de_active_high = false,
> +	.hsync_active_high = false,
> +	.vsync_active_high = false,
> +};
> +
> +static const struct of_device_id ili9341_of_match[] = {
> +	{
> +		.compatible = "stm32f429,ltdc-panel",
> +		.data = &ili9341_data,
> +	},


> +	{
> +		.compatible = "ilitek,ili9341",
> +		.data = NULL,
This part is wrong, as ilitek,ili9341 is just the generic part.
Only the first entry is relevant.


> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ili9341_of_match);
> +
> +static struct spi_driver ili9341_driver = {
> +	.probe = ili9341_probe,
> +	.remove = ili9341_remove,
> +	.driver = {
> +		.name = "panel-ilitek-ili9341",
> +		.of_match_table = ili9341_of_match,
> +	},
> +};
> +module_spi_driver(ili9341_driver);
> +
> +MODULE_AUTHOR("Dillon Min <dillon.minfei@gmail.com>");
> +MODULE_DESCRIPTION("ILI9341 LCD panel driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
