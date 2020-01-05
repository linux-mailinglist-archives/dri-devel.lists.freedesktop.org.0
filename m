Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0BB1306E4
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2020 10:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172716E0C4;
	Sun,  5 Jan 2020 09:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0A06E0C4
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jan 2020 09:13:08 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 720D880441;
 Sun,  5 Jan 2020 10:13:04 +0100 (CET)
Date: Sun, 5 Jan 2020 10:13:03 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 3/3] drm: tiny: st7735r: Add support for Okaya RH128128T
Message-ID: <20200105091303.GB29102@ravnborg.org>
References: <20200102141246.370-1-geert+renesas@glider.be>
 <20200102141246.370-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200102141246.370-4-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=WZHNqt2aAAAA:8
 a=e5mUnYsNAAAA:8 a=bDZ8_mipTldAwkuLC-IA:9 a=CjuIK1q_8ugA:10
 a=PrHl9onO2p7xFKlKy1af:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=pHzHmUro8NiASowvMSCR:22 a=6VlIyEUom7LUIeUMNQJH:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Lechner <david@lechnology.com>, David Airlie <airlied@linux.ie>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Chris Brandt <chris.brandt@renesas.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert.

Good to see we add more functionality to the smallest driver in DRM.
The patch triggered a few comments - see below.
Some comments relates to the original driver - and not your changes.

	Sam

On Thu, Jan 02, 2020 at 03:12:46PM +0100, Geert Uytterhoeven wrote:
> Add support for the Okaya RH128128T display to the st7735r driver.
> 
> The RH128128T is a 128x128 1.44" TFT display driven by a Sitronix
> ST7715R TFT Controller/Driver.  The latter is very similar to the
> ST7735R, and can be handled by the existing st7735r driver.

As a general comment - it would have eased review if this was split
in two patches.
One patch to introduce the infrastructure to deal with another set of
controller/display and one patch introducing the new combination.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/tiny/st7735r.c | 65 ++++++++++++++++++++++++++++------
>  1 file changed, 55 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
> index 3f4487c716848cf8..05d162e76d8481e5 100644
> --- a/drivers/gpu/drm/tiny/st7735r.c
> +++ b/drivers/gpu/drm/tiny/st7735r.c
> @@ -1,8 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
> - * DRM driver for Sitronix ST7735R panels
> + * DRM driver for Sitronix ST7715R/ST7735R panels

This comment could describe the situation a little better.
This is a sitronix st7735r controller with a jianda jd-t18003-t01
display.
Or a sitronix st7715r controller with a okaya rh128128t display.


>   *
>   * Copyright 2017 David Lechner <david@lechnology.com>
> + * Copyright (C) 2019 Glider bvba
>   */
>  
>  #include <linux/backlight.h>
> @@ -10,6 +11,7 @@
>  #include <linux/dma-buf.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> +#include <linux/of_device.h>
>  #include <linux/property.h>
>  #include <linux/spi/spi.h>
>  #include <video/mipi_display.h>
> @@ -37,12 +39,28 @@
>  #define ST7735R_MY	BIT(7)
>  #define ST7735R_MX	BIT(6)
>  #define ST7735R_MV	BIT(5)
> +#define ST7735R_RGB	BIT(3)
> +
> +struct st7735r_cfg {
> +	const struct drm_display_mode mode;
> +	unsigned int left_offset;
> +	unsigned int top_offset;
> +	unsigned int write_only:1;
> +	unsigned int rgb:1;		/* RGB (vs. BGR) */
> +};
> +
> +struct st7735r_priv {
> +	struct mipi_dbi_dev dbidev;	/* Must be first for .release() */
> +	unsigned int rgb:1;
> +};

The structs here uses "st7735r" as the generic prefix.
But the rest of this file uses "jd_t18003_t01" as the generic prefix.

It would help readability if the same prefix is used for the common
stuff everywhere.

struct st7735r_priv includes "rgb" which is copied from struct
st7735r_cfg.
Maybe just add a const pointer to struct st7735r_cfg,
so when we later add more configuration items we do not need to have two
copies. And then ofc drop st7735r_priv.rgb.

>  
>  static void jd_t18003_t01_pipe_enable(struct drm_simple_display_pipe *pipe,
>  				      struct drm_crtc_state *crtc_state,
>  				      struct drm_plane_state *plane_state)
>  {
>  	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
> +	struct st7735r_priv *priv = container_of(dbidev, struct st7735r_priv,
> +						 dbidev);
>  	struct mipi_dbi *dbi = &dbidev->dbi;
>  	int ret, idx;
>  	u8 addr_mode;
> @@ -87,6 +105,10 @@ static void jd_t18003_t01_pipe_enable(struct drm_simple_display_pipe *pipe,
>  		addr_mode = ST7735R_MY | ST7735R_MV;
>  		break;
>  	}
> +
> +	if (priv->rgb)
> +		addr_mode |= ST7735R_RGB;
> +
>  	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
>  	mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT,
>  			 MIPI_DCS_PIXEL_FMT_16BIT);
> @@ -116,8 +138,17 @@ static const struct drm_simple_display_pipe_funcs jd_t18003_t01_pipe_funcs = {
>  	.prepare_fb	= drm_gem_fb_simple_display_pipe_prepare_fb,
>  };
>  
> -static const struct drm_display_mode jd_t18003_t01_mode = {
> -	DRM_SIMPLE_MODE(128, 160, 28, 35),
> +static const struct st7735r_cfg jd_t18003_t01_cfg = {
> +	.mode		= { DRM_SIMPLE_MODE(128, 160, 28, 35) },
> +	/* Cannot read from Adafruit 1.8" display via SPI */
> +	.write_only	= true,
> +};
> +
> +static const struct st7735r_cfg rh128128t_cfg = {
> +	.mode		= { DRM_SIMPLE_MODE(128, 128, 25, 26) },
> +	.left_offset	= 2,
> +	.top_offset	= 3,
> +	.rgb		= true,
>  };
>  
>  DEFINE_DRM_GEM_CMA_FOPS(st7735r_fops);
> @@ -136,13 +167,14 @@ static struct drm_driver st7735r_driver = {
>  };
>  
>  static const struct of_device_id st7735r_of_match[] = {
> -	{ .compatible = "jianda,jd-t18003-t01" },
> +	{ .compatible = "jianda,jd-t18003-t01", .data = &jd_t18003_t01_cfg },
> +	{ .compatible = "okaya,rh128128t", .data = &rh128128t_cfg },
>  	{ },
{ /* sentinel },

Also - which is not a new thing - this fails to check that we have the
correct combination of two compatibles.
From the binding:

    Must be one of the following combinations:
    - "jianda,jd-t18003-t01", "sitronix,st7735r"
    - "okaya,rh128128t", "sitronix,st7715r"

>  };
>  MODULE_DEVICE_TABLE(of, st7735r_of_match);
>  
>  static const struct spi_device_id st7735r_id[] = {
> -	{ "jd-t18003-t01", 0 },
> +	{ "jd-t18003-t01", (uintptr_t)&jd_t18003_t01_cfg },
>  	{ },
{ /* sentinel */ },

Do we need an entry for "okaya,rh128128t" here?

Note: I have not fully understood how MODULE_DEVICE_TABLE()
works - so forgive me my ignorance.

>  };
>  MODULE_DEVICE_TABLE(spi, st7735r_id);
> @@ -150,17 +182,26 @@ MODULE_DEVICE_TABLE(spi, st7735r_id);
>  static int st7735r_probe(struct spi_device *spi)
>  {
>  	struct device *dev = &spi->dev;
> +	const struct st7735r_cfg *cfg;
>  	struct mipi_dbi_dev *dbidev;
> +	struct st7735r_priv *priv;
>  	struct drm_device *drm;
>  	struct mipi_dbi *dbi;
>  	struct gpio_desc *dc;
>  	u32 rotation = 0;
>  	int ret;
>  
> -	dbidev = kzalloc(sizeof(*dbidev), GFP_KERNEL);
> -	if (!dbidev)
> +	cfg = of_device_get_match_data(&spi->dev);
> +	if (!cfg)
> +		cfg = (void *)spi_get_device_id(spi)->driver_data;
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
>  		return -ENOMEM;
>  
> +	dbidev = &priv->dbidev;
> +	priv->rgb = cfg->rgb;
> +
>  	dbi = &dbidev->dbi;
>  	drm = &dbidev->drm;
>  	ret = devm_drm_dev_init(dev, drm, &st7735r_driver);
> @@ -193,10 +234,14 @@ static int st7735r_probe(struct spi_device *spi)
>  	if (ret)
>  		return ret;
>  
> -	/* Cannot read from Adafruit 1.8" display via SPI */
> -	dbi->read_commands = NULL;
> +	if (cfg->write_only)
> +		dbi->read_commands = NULL;
> +
> +	dbidev->left_offset = cfg->left_offset;
> +	dbidev->top_offset = cfg->top_offset;
>  
> -	ret = mipi_dbi_dev_init(dbidev, &jd_t18003_t01_pipe_funcs, &jd_t18003_t01_mode, rotation);
> +	ret = mipi_dbi_dev_init(dbidev, &jd_t18003_t01_pipe_funcs, &cfg->mode,
> +				rotation);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
