Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5DA22E1A0
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 19:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3928E89FDB;
	Sun, 26 Jul 2020 17:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7265089FD9
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 17:22:28 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 590EB20023;
 Sun, 26 Jul 2020 19:22:26 +0200 (CEST)
Date: Sun, 26 Jul 2020 19:22:25 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Subject: Re: [PATCH] video: fbdev: added driver for sharp memory lcd displays
Message-ID: <20200726172225.GG3275923@ravnborg.org>
References: <1595622844-4669-1-git-send-email-455.rodrigo.alencar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595622844-4669-1-git-send-email-455.rodrigo.alencar@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=xTHSAhigAAAA:8 a=e5mUnYsNAAAA:8
 a=tjwcpQj9ubUJbOde5QEA:9 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19
 a=PtaE8TqR3Tqx-mAD:21 a=K8Is3H5jqz_FhoCK:21 a=CjuIK1q_8ugA:10
 a=rAH3zbuqpbFqcAewawHy:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo.

On Fri, Jul 24, 2020 at 05:34:04PM -0300, Rodrigo Alencar wrote:
> The supported displays are ls027b7dh01 (tested), ls044q7dh01,
> ls013b7dh05, ls013b7dh03
> 
> Signed-off-by: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>

Thanks for submitting this driver.
Unfortunately I have some bad news for you...

The binding needs to be submitted as a seperate patch, and all new
bindings must use the DT schema format (.yaml files).
See Documentation/devicetree/bindings/*.rst for more info.

And on top of this fbdev/ is in maintenance mode so no new drivers.
New display drivers and panel drivers must go to gpu/drm/
and use the frameworks available there.

It looks like what we have here is a panel driver.
Look for other similar sharp panels in drm/panel/ to get an idea how to
add support for these new panels.

Soory, but looks forward for an updated patch.

	Sam


> ---
>  .../devicetree/bindings/display/smemlcdfb.txt |  46 ++
>  drivers/video/fbdev/Kconfig                   |  14 +
>  drivers/video/fbdev/Makefile                  |   1 +
>  drivers/video/fbdev/smemlcdfb.c               | 485 ++++++++++++++++++
>  4 files changed, 546 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/smemlcdfb.txt
>  create mode 100644 drivers/video/fbdev/smemlcdfb.c
> 
> diff --git a/Documentation/devicetree/bindings/display/smemlcdfb.txt b/Documentation/devicetree/bindings/display/smemlcdfb.txt
> new file mode 100644
> index 000000000000..e33025dd3374
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/smemlcdfb.txt
> @@ -0,0 +1,46 @@
> +Sharp Memory LCD Linux Framebuffer Driver
> +
> +Required properties:
> +  - compatible: It should be "sharp,<model-no>". The supported displays are 
> +         ls027b7dh01, ls044q7dh01, ls013b7dh05, ls013b7dh03. Maybe other 
> +         monochromatic models can be supported with the current code.
> +  - reg: SPI chip select number for the device.
> +  - spi-max-frequency: Max SPI frequency to use. One must verify the datasheet.
> +  - spi-cs-high: Sharp Memory LCD needs chipselect high.
> +
> +Optional properties:
> +  - sharp,frames-per-sec: It should contain the desired frames per second.
> +         It does not represent the actual frame rate. Default: 10
> +  - sharp,extmode-high: External COM Input signal is expected in EXTCOMIN port.
> +         This is recommended to reduce CPU and SPI Load.
> +  - pwm: If property "sharp,extmode-high" is specified, this is recommended.
> +         It should contain the pwm to use, according to
> +         Documentation/devicetree/bindings/pwm/pwm.txt
> +         Verify the display datasheet for the EXTCOMIN signal period
> +  - disp-gpios: The GPIO used to enable the display, if available. See
> +                 Documentation/devicetree/bindings/gpio/gpio.txt for details.
> +
> +Examples:
> +
> +ls027b7dh01: smemlcd@0 {
> +        compatible = "sharp,ls027b7dh01";
> +        reg = <0>;
> +        spi-max-frequency = <1000000>;
> +        spi-cs-high;
> +        disp-gpios = <&gpio0 7>;
> +        disp-active-high;
> +        sharp,extmode-high;
> +        pwms = <&pwm 0 100000000>;
> +};
> +
> +ls013b7dh05: smemlcd@3 {
> +        compatible = "sharp,ls013b7dh05";
> +        reg = <3>;
> +        spi-max-frequency = <1000000>;
> +        spi-cs-high;
> +        disp-gpios = <&gpio0 13>;
> +        disp-active-high;
> +        sharp,extmode-high;
> +        pwms = <&pwm 0 50000000>;
> +        sharp,frames-per-sec = <20>;
> +};
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index b2c9dd4f0cb5..0fff47a59d8b 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -2221,6 +2221,20 @@ config FB_SSD1307
>  	  This driver implements support for the Solomon SSD1307
>  	  OLED controller over I2C.
>  
> +config FB_SMEMLCD
> +	tristate "Sharp Memory LCD framebuffer support"
> +	depends on FB && SPI
> +	depends on OF
> +	depends on GPIOLIB || COMPILE_TEST
> +	select FB_SYS_FOPS
> +	select FB_SYS_FILLRECT
> +	select FB_SYS_COPYAREA
> +	select FB_SYS_IMAGEBLIT
> +	select FB_DEFERRED_IO
> +	select PWM
> +	help
> +	  This driver implements support for the Sharp Memory LCD
> +
>  config FB_SM712
>  	tristate "Silicon Motion SM712 framebuffer support"
>  	depends on FB && PCI
> diff --git a/drivers/video/fbdev/Makefile b/drivers/video/fbdev/Makefile
> index cad4fb64442a..5c58dfd8ac08 100644
> --- a/drivers/video/fbdev/Makefile
> +++ b/drivers/video/fbdev/Makefile
> @@ -128,6 +128,7 @@ obj-$(CONFIG_FB_OF)               += offb.o
>  obj-$(CONFIG_FB_MX3)		  += mx3fb.o
>  obj-$(CONFIG_FB_DA8XX)		  += da8xx-fb.o
>  obj-$(CONFIG_FB_SSD1307)	  += ssd1307fb.o
> +obj-$(CONFIG_FB_SMEMLCD)          += smemlcdfb.o
>  obj-$(CONFIG_FB_SIMPLE)           += simplefb.o
>  
>  # the test framebuffer is last
> diff --git a/drivers/video/fbdev/smemlcdfb.c b/drivers/video/fbdev/smemlcdfb.c
> new file mode 100644
> index 000000000000..54a0c57b6713
> --- /dev/null
> +++ b/drivers/video/fbdev/smemlcdfb.c
> @@ -0,0 +1,485 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2019 IMBEL http://www.imbel.gov.br 
> + *	Rodrigo Alencar <alencar.fmce@imbel.gov.br>
> + */
> +
> +#include <linux/fb.h>
> +#include <linux/bitrev.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/spi/spi.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/pwm.h>
> +
> +#define SMEMLCD_DATA_UPDATE		0x80
> +#define SMEMLCD_FRAME_INVERSION		0x40
> +#define SMEMLCD_ALL_CLEAR		0x20
> +#define SMEMLCD_DUMMY_DATA		0x00
> +
> +struct smemlcd_info {
> +	u32 width;
> +	u32 height;
> +};
> +
> +struct smemlcd_par {
> +	struct spi_device *spi;
> +	struct fb_info *info;
> +	struct pwm_device *extcomin_pwm;
> +	struct gpio_desc *disp;
> +	struct delayed_work d_work;
> +	struct mutex update_lock;
> +
> +	u8 *spi_buf;
> +
> +	bool extmode;
> +	u32 spi_width;
> +	u32 vmem_width;
> +
> +	u8 vcom;
> +	u32 start;
> +	u32 height;
> +};
> +
> +static const struct fb_fix_screeninfo smemlcd_fix = {
> +	.id = "Sharp Memory LCD",
> +	.type = FB_TYPE_PACKED_PIXELS,
> +	.visual = FB_VISUAL_MONO10,
> +	.xpanstep = 0,
> +	.ypanstep = 0,
> +	.ywrapstep = 0,
> +	.accel = FB_ACCEL_NONE,
> +};
> +
> +static const struct fb_var_screeninfo smemlcd_var = {
> +	.bits_per_pixel	= 1,
> +	.red = { .length = 1 },
> +	.green = { .length = 1 },
> +	.blue = { .length = 1 },
> +};
> +
> +static void smemlcd_update(struct smemlcd_par *par)
> +{
> +	struct spi_device *spi = par->spi;
> +	u8 *vmem = par->info->screen_buffer;
> +	u8 *buf_ptr = par->spi_buf;
> +	int ret;
> +	u32 i,j;
> +
> +	if (par->start + par->height > par->info->var.yres) {
> +		par->start = 0;
> +		par->height = 0;
> +	}
> +	/* go to start line */
> +	vmem += par->start * par->vmem_width;
> +	/* update vcom */
> +	par->vcom ^= SMEMLCD_FRAME_INVERSION;
> +	/* mode selection */
> +	*(buf_ptr++) = (par->height)? (SMEMLCD_DATA_UPDATE | par->vcom) : par->vcom;
> +
> +	/* not all SPI masters have LSB-first mode, bitrev8 is used */
> +	for (i = par->start + 1; i < par->start + par->height + 1; i++) {
> +		/* gate line address */
> +		*(buf_ptr++) = bitrev8(i);
> +		/* data writing */
> +		for (j = 0; j < par->spi_width; j++)
> +			*(buf_ptr++) = bitrev8(*(vmem++));
> +		/* dummy data */
> +		*(buf_ptr++) = SMEMLCD_DUMMY_DATA;
> +		/* video memory alignment */
> +		for (; j < par->vmem_width; j++)
> +			vmem++;
> +	}
> +	/* dummy data */
> +	*(buf_ptr++) = SMEMLCD_DUMMY_DATA;
> +
> +	ret = spi_write(spi, &(par->spi_buf[0]), par->height * (par->spi_width + 2) + 2);
> +	if (ret < 0)
> +		dev_err(&spi->dev, "Couldn't send SPI command.\n");
> +
> +	par->start = U32_MAX;
> +	par->height = 0;
> +}
> +
> +static void smemlcd_frame(struct smemlcd_par *par, u32 req_start, u32 req_height)
> +{
> +	u32 end = par->start + par->height;
> +	u32 req_end = req_start + req_height;
> +	if (req_end > par->info->var.yres)
> +		req_end = par->info->var.yres;
> +	if (par->start > req_start)
> +		par->start = req_start;
> +	if (end < req_end || end > par->info->var.yres)
> +		end = req_end;
> +	par->height = end - par->start;
> +}
> +
> +static void smemlcd_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
> +{
> +	struct smemlcd_par *par = info->par;
> +	sys_fillrect(info, rect);
> +
> +	mutex_lock(&par->update_lock);
> +	smemlcd_frame(par, rect->dy, rect->height);
> +	if(par->extmode)
> +		smemlcd_update(par);
> +	mutex_unlock(&par->update_lock);
> +}
> +
> +static void smemlcd_imageblit(struct fb_info *info, const struct fb_image *image)
> +{
> +	struct smemlcd_par *par = info->par;
> +	sys_imageblit(info, image);
> +
> +	mutex_lock(&par->update_lock);
> +	smemlcd_frame(par, image->dy, image->height);
> +	if(par->extmode)
> +		smemlcd_update(par);
> +	mutex_unlock(&par->update_lock);
> +}
> +
> +static void smemlcd_copyarea(struct fb_info *info, const struct fb_copyarea *area)
> +{
> +	struct smemlcd_par *par = info->par;
> +	sys_copyarea(info, area);
> +
> +	mutex_lock(&par->update_lock);
> +	smemlcd_frame(par, area->dy, area->height);
> +	if(par->extmode)
> +		smemlcd_update(par);
> +	mutex_unlock(&par->update_lock);
> +}
> +
> +static ssize_t smemlcd_write(struct fb_info *info, const char __user * buf, size_t count, loff_t * ppos)
> +{
> +	ssize_t ret;
> +	struct smemlcd_par *par = info->par;
> +	u32 req_start, req_height;
> +	u32 offset = (u32) * ppos;
> +
> +	ret = fb_sys_write(info, buf, count, ppos);
> +	if (ret > 0) {
> +		mutex_lock(&par->update_lock);
> +		req_start = max((int)(offset / par->vmem_width), 0);
> +		req_height = ret / par->vmem_width + 1;
> +		smemlcd_frame(par, req_start, req_height);
> +		if(par->extmode)
> +			smemlcd_update(par);
> +		mutex_unlock(&par->update_lock);
> +	}
> +
> +	return ret;
> +}
> +
> +static int smemlcd_blank(int blank_mode, struct fb_info *info)
> +{
> +	struct smemlcd_par *par = info->par;
> +
> +	if (par->disp) {
> +		if (blank_mode != FB_BLANK_UNBLANK)
> +			gpiod_set_value_cansleep(par->disp, 0);
> +		else
> +			gpiod_set_value_cansleep(par->disp, 1);
> +	}
> +
> +	return 0;
> +}
> +
> +static void smemlcd_deferred_io(struct fb_info *info, struct list_head *pagelist)
> +{
> +	struct smemlcd_par *par = info->par;
> +
> +	mutex_lock(&par->update_lock);
> +
> +	if (!list_empty(pagelist)) {
> +		struct page *cur;
> +		u32 req_start;
> +		u32 req_height = (PAGE_SIZE / par->vmem_width) + 1;
> +
> +		list_for_each_entry(cur, pagelist, lru) {
> +			req_start = (cur->index << PAGE_SHIFT) / par->vmem_width;
> +			smemlcd_frame(par, req_start, req_height);
> +		}
> +	}
> +
> +	if(par->extmode)
> +		smemlcd_update(par);
> +	mutex_unlock(&par->update_lock);
> +}
> +
> +static void smemlcd_update_work(struct work_struct *work)
> +{
> +	struct smemlcd_par *par = container_of(work, struct smemlcd_par, d_work.work);
> +	struct fb_info *info = par->info;
> +
> +	mutex_lock(&par->update_lock);
> +	smemlcd_update(par);
> +	mutex_unlock(&par->update_lock);
> +
> +	if (!par->extmode)
> +		schedule_delayed_work(&par->d_work, info->fbdefio->delay);
> +}
> +
> +static const struct fb_ops smemlcd_ops = {
> +	.owner = THIS_MODULE,
> +	.fb_read = fb_sys_read,
> +	.fb_write = smemlcd_write,
> +	.fb_fillrect = smemlcd_fillrect,
> +	.fb_copyarea = smemlcd_copyarea,
> +	.fb_imageblit = smemlcd_imageblit,
> +	.fb_blank = smemlcd_blank,
> +};
> +
> +static struct smemlcd_info ls027b7dh01_info = {
> +	.width = 400,
> +	.height = 240,
> +};
> +
> +static struct smemlcd_info ls044q7dh01_info = {
> +	.width = 320,
> +	.height = 240,
> +};
> +
> +static struct smemlcd_info ls013b7dh05_info = {
> +	.width = 144,
> +	.height = 168,
> +};
> +
> +static struct smemlcd_info ls013b7dh03_info = {
> +	.width = 128,
> +	.height = 128,
> +};
> +
> +static const struct of_device_id smemlcd_of_match[] = {
> +	{
> +		.compatible = "sharp,ls027b7dh01",
> +		.data = (void *)&ls027b7dh01_info,
> +	},
> +	{
> +		.compatible = "sharp,ls044q7dh01",
> +		.data = (void *)&ls044q7dh01_info,
> +	},
> +	{
> +		.compatible = "sharp,ls013b7dh05",
> +		.data = (void *)&ls013b7dh05_info,
> +	},
> +	{
> +		.compatible = "sharp,ls013b7dh03",
> +		.data = (void *)&ls013b7dh03_info,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, smemlcd_of_match);
> +
> +static int smemlcd_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct fb_info *info;
> +	struct smemlcd_par *par;
> +	const struct smemlcd_info *devinfo;
> +	struct fb_deferred_io *smemlcd_defio;
> +	struct pwm_state state;
> +	u32 vmem_size, fps;
> +	void *vmem;
> +	int ret;
> +
> +	info = framebuffer_alloc(sizeof(struct smemlcd_par), dev);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	par = info->par;
> +	par->info = info;
> +	par->spi = spi;
> +
> +	devinfo = device_get_match_data(dev);
> +
> +	mutex_init(&par->update_lock);
> +	INIT_DELAYED_WORK(&par->d_work, smemlcd_update_work);
> +	par->spi_width = devinfo->width / 8;
> +	par->vmem_width = ((devinfo->width + 31) & ~31) >> 3;
> +	par->vcom = 0;
> +	par->start = 0;
> +	par->height = 0;
> +
> +	par->disp = devm_gpiod_get_optional(dev, "disp", GPIOD_OUT_LOW);
> +	if (IS_ERR(par->disp)) {
> +		ret = PTR_ERR(par->disp);
> +		dev_err(dev, "Failed to get DISP gpio: %d\n", ret);
> +		goto free_fb;
> +	}
> +
> +	par->spi_buf = kzalloc(devinfo->height * (par->spi_width + 2) + 2, GFP_KERNEL);
> +	if (!par->spi_buf) {
> +		ret = -ENOMEM;
> +		dev_err(dev, "Failed to allocate data for spi transfers.\n");
> +		goto free_fb;
> +	}
> +
> +	vmem_size = par->vmem_width * devinfo->height;
> +
> +	vmem = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, get_order(vmem_size));
> +	if (!vmem) {
> +		ret = -ENOMEM;
> +		dev_err(dev, "Failed to allocate video memory.\n");
> +		goto free_spi_buf;
> +	}
> +
> +	par->extmode = device_property_read_bool(dev, "sharp,extmode-high");
> +
> +	if (device_property_read_u32(dev, "sharp,frames-per-sec", &fps))
> +		fps = 10;
> +
> +	smemlcd_defio = devm_kzalloc(dev, sizeof(struct fb_deferred_io), GFP_KERNEL);
> +	if (!smemlcd_defio) {
> +		dev_err(dev, "Couldn't allocate deferred io.\n");
> +		ret = -ENOMEM;
> +		goto free_vmem;
> +	}
> +
> +	smemlcd_defio->delay = HZ / fps;
> +	smemlcd_defio->deferred_io = &smemlcd_deferred_io;
> +
> +	info->var = smemlcd_var;
> +	info->var.xres = devinfo->width;
> +	info->var.xres_virtual = devinfo->width;
> +	info->var.yres = devinfo->height;
> +	info->var.yres_virtual = devinfo->height;
> +
> +	info->screen_buffer = vmem;
> +	info->screen_size = vmem_size;
> +
> +	info->fbops = &smemlcd_ops;
> +	info->fix = smemlcd_fix;
> +	info->fix.line_length = par->vmem_width;
> +	info->fix.smem_start = __pa(vmem);
> +	info->fix.smem_len = vmem_size;
> +
> +	info->fbdefio = smemlcd_defio;
> +
> +	fb_deferred_io_init(info);
> +
> +	spi_set_drvdata(spi, par);
> +
> +	if (par->extmode) {
> +		par->extcomin_pwm = pwm_get(dev, NULL);
> +		if (IS_ERR(par->extcomin_pwm)) {
> +			ret = PTR_ERR(par->extcomin_pwm);
> +			dev_warn(dev, "Failed to get EXTCOMIN pwm: %d\n", ret);
> +			par->extcomin_pwm = NULL;
> +		} else {
> +
> +			pwm_init_state(par->extcomin_pwm, &state);
> +
> +			if (!state.period)
> +				state.period = NSEC_PER_SEC/fps;
> +
> +			state.enabled = true;
> +			state.duty_cycle = state.period/2;
> +
> +			ret = pwm_apply_state(par->extcomin_pwm, &state);
> +			if (ret)
> +				dev_warn(dev, "failed to apply EXTCOMIN pwm state: %d\n", ret);
> +		}
> +	} else {
> +		par->extcomin_pwm = NULL;
> +	}
> +
> +	if (par->disp)
> +		gpiod_set_value_cansleep(par->disp, 1);
> +
> +	/* spi test by clearing the display */
> +	par->spi_buf[0] = SMEMLCD_ALL_CLEAR;
> +	par->spi_buf[1] = SMEMLCD_DUMMY_DATA;
> +	ret = spi_write(spi, &(par->spi_buf[0]), 2);
> +	if (ret < 0){
> +		dev_err(dev, "Couldn't send SPI command\n");
> +		goto disable_hw;
> +	}
> +
> +	ret = register_framebuffer(info);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to register framebuffer\n");
> +		goto disable_hw;
> +	}
> +
> +	dev_info(dev, "fb%d: %s framebuffer device registered, using %d bytes of video memory\n", info->node, info->fix.id, vmem_size);
> +
> +	if (!par->extmode)
> +		schedule_delayed_work(&par->d_work, smemlcd_defio->delay);
> +
> +	return 0;
> +
> +disable_hw:
> +	if (par->disp)
> +		gpiod_set_value_cansleep(par->disp, 0);
> +	if (par->extcomin_pwm) {
> +		pwm_disable(par->extcomin_pwm);
> +		pwm_put(par->extcomin_pwm);
> +	}
> +	fb_deferred_io_cleanup(info);
> +free_vmem:
> +	kfree(vmem);
> +free_spi_buf:
> +	kfree(par->spi_buf);
> +free_fb:
> +	cancel_delayed_work_sync(&par->d_work);
> +	mutex_destroy(&par->update_lock);
> +	framebuffer_release(info);
> +
> +	return ret;
> +}
> +
> +static int smemlcd_remove(struct spi_device *spi)
> +{
> +	struct smemlcd_par *par = dev_get_drvdata(&spi->dev);
> +	struct fb_info *info = par->info;
> +
> +	cancel_delayed_work_sync(&par->d_work);
> +
> +	fb_deferred_io_cleanup(info);
> +
> +	unregister_framebuffer(info);
> +
> +	if (par->disp)
> +		gpiod_set_value_cansleep(par->disp, 0);
> +
> +	if (par->extcomin_pwm) {
> +		pwm_disable(par->extcomin_pwm);
> +		pwm_put(par->extcomin_pwm);
> +	}
> +
> +	fb_deferred_io_cleanup(info);
> +	__free_pages(__va(info->fix.smem_start), get_order(info->fix.smem_len));
> +
> +	kfree(par->spi_buf);
> +
> +	mutex_destroy(&par->update_lock);
> +
> +	framebuffer_release(info);
> +
> +	return 0;
> +}
> +
> +static const struct spi_device_id smemlcd_spi_id[] = {
> +	{"ls027b7dh01", 0},
> +	{"ls044q7dh01", 0},
> +	{"ls013b7dh05", 0},
> +	{"ls013b7dh03", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(spi, smemlcd_spi_id);
> +
> +static struct spi_driver smemlcd_driver = {
> +	.probe = smemlcd_probe,
> +	.remove = smemlcd_remove,
> +	.id_table = smemlcd_spi_id,
> +	.driver = {
> +		   .name = "smemlcdfb",
> +		   .of_match_table = smemlcd_of_match,
> +		   },
> +};
> +module_spi_driver(smemlcd_driver);
> +
> +MODULE_AUTHOR("Rodrigo Alencar <455.rodrigo.alencar@gmail.com>");
> +MODULE_DESCRIPTION("Sharp Memory LCD Linux Framebuffer Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.23.0.rc1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
