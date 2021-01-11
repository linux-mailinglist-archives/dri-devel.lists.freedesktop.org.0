Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C04952F0DCF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 09:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C601C8997C;
	Mon, 11 Jan 2021 08:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 359 seconds by postgrey-1.36 at gabe;
 Mon, 11 Jan 2021 07:27:44 UTC
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
 by gabe.freedesktop.org (Postfix) with ESMTP id C485E8995F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 07:27:44 +0000 (UTC)
Received: from [192.168.178.79] (pd95ef192.dip0.t-ipconnect.de
 [217.94.241.146])
 by mail.bugwerft.de (Postfix) with ESMTPSA id A77CB4A190F;
 Mon, 11 Jan 2021 07:21:42 +0000 (UTC)
Subject: Re: [PATCH v8] backlight: lms283gf05: Convert to GPIO descriptors
To: Linus Walleij <linus.walleij@linaro.org>, Lee Jones
 <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>
References: <20210110120926.80471-1-linus.walleij@linaro.org>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <d05de658-ad0e-a151-f371-68adc38416e2@zonque.org>
Date: Mon, 11 Jan 2021 08:21:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210110120926.80471-1-linus.walleij@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 11 Jan 2021 08:20:05 +0000
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
Cc: Marek Vasut <marex@denx.de>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

On 10/1/2021 1:09 pm, Linus Walleij wrote:
> This converts the lms283gf05 backlight driver to use GPIO
> descriptors and switches the single PXA Palm Z2 device
> over to defining these.
> 
> Since the platform data was only used to convey GPIO
> information we can delete the platform data header.
> 
> Notice that we define the proper active low semantics in
> the board file GPIO descriptor table (active low) and
> assert the reset line by bringing it to "1" (asserted).
> 
> Cc: Marek Vasut <marex@denx.de>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Reviewed-by: Daniel Mack <daniel@zonque.org>

Thanks for working on this! The PXA tree is usually maintained by
Robert, but I haven't heard from him in a while.

Maybe this patch can go through some broader ARM tree like Arnd's (cc'ed)?


Daniel


> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v7->v8:
> - Rebase onto v5.11-rc1
> - I wonder why this never seems to get merged...?
> ChangeLog v6->v7:
> - Rebase onto v5.10-rc1
> ChangeLog v5->v6:
> - Rebase onto v5.9-rc1
> ChangeLog v4->v5:
> - Rebase on v5.8-rc1
> - Collected Daniel's Reviewed-by tag.
> ChangeLog v3->v4:
> - Check IS_ERR() on the returned GPIO descriptor.
> - Unconditionally set consumer name since the API tolerates NULL.
> ChangeLog v2->v3:
> - Fix a use-before-allocated bug discovered by compile tests.
> - Remove unused ret variable as autobuilders complained.
> ChangeLog v1->v2:
> - Bring up the GPIO de-asserted in probe()
> 
> Marek: I saw this was written by you, are you regularly
> testing the Z2 device?
> ---
>  arch/arm/mach-pxa/z2.c               | 12 +++++---
>  drivers/video/backlight/lms283gf05.c | 43 +++++++++++-----------------
>  include/linux/spi/lms283gf05.h       | 16 -----------
>  3 files changed, 25 insertions(+), 46 deletions(-)
>  delete mode 100644 include/linux/spi/lms283gf05.h
> 
> diff --git a/arch/arm/mach-pxa/z2.c b/arch/arm/mach-pxa/z2.c
> index 21fd76bb09cd..89eb5243c85f 100644
> --- a/arch/arm/mach-pxa/z2.c
> +++ b/arch/arm/mach-pxa/z2.c
> @@ -20,7 +20,6 @@
>  #include <linux/spi/spi.h>
>  #include <linux/spi/pxa2xx_spi.h>
>  #include <linux/spi/libertas_spi.h>
> -#include <linux/spi/lms283gf05.h>
>  #include <linux/power_supply.h>
>  #include <linux/mtd/physmap.h>
>  #include <linux/gpio.h>
> @@ -578,8 +577,13 @@ static struct pxa2xx_spi_chip lms283_chip_info = {
>  	.gpio_cs	= GPIO88_ZIPITZ2_LCD_CS,
>  };
>  
> -static const struct lms283gf05_pdata lms283_pdata = {
> -	.reset_gpio	= GPIO19_ZIPITZ2_LCD_RESET,
> +static struct gpiod_lookup_table lms283_gpio_table = {
> +	.dev_id = "spi2.0", /* SPI bus 2 chip select 0 */
> +	.table = {
> +		GPIO_LOOKUP("gpio-pxa", GPIO19_ZIPITZ2_LCD_RESET,
> +			    "reset", GPIO_ACTIVE_LOW),
> +		{ },
> +	},
>  };
>  
>  static struct spi_board_info spi_board_info[] __initdata = {
> @@ -595,7 +599,6 @@ static struct spi_board_info spi_board_info[] __initdata = {
>  {
>  	.modalias		= "lms283gf05",
>  	.controller_data	= &lms283_chip_info,
> -	.platform_data		= &lms283_pdata,
>  	.max_speed_hz		= 400000,
>  	.bus_num		= 2,
>  	.chip_select		= 0,
> @@ -615,6 +618,7 @@ static void __init z2_spi_init(void)
>  {
>  	pxa2xx_set_spi_info(1, &pxa_ssp1_master_info);
>  	pxa2xx_set_spi_info(2, &pxa_ssp2_master_info);
> +	gpiod_add_lookup_table(&lms283_gpio_table);
>  	spi_register_board_info(spi_board_info, ARRAY_SIZE(spi_board_info));
>  }
>  #else
> diff --git a/drivers/video/backlight/lms283gf05.c b/drivers/video/backlight/lms283gf05.c
> index 0e45685bcc1c..36856962ed83 100644
> --- a/drivers/video/backlight/lms283gf05.c
> +++ b/drivers/video/backlight/lms283gf05.c
> @@ -9,16 +9,16 @@
>  #include <linux/kernel.h>
>  #include <linux/delay.h>
>  #include <linux/slab.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/lcd.h>
>  
>  #include <linux/spi/spi.h>
> -#include <linux/spi/lms283gf05.h>
>  #include <linux/module.h>
>  
>  struct lms283gf05_state {
>  	struct spi_device	*spi;
>  	struct lcd_device	*ld;
> +	struct gpio_desc	*reset;
>  };
>  
>  struct lms283gf05_seq {
> @@ -90,13 +90,13 @@ static const struct lms283gf05_seq disp_pdwnseq[] = {
>  };
>  
>  
> -static void lms283gf05_reset(unsigned long gpio, bool inverted)
> +static void lms283gf05_reset(struct gpio_desc *gpiod)
>  {
> -	gpio_set_value(gpio, !inverted);
> +	gpiod_set_value(gpiod, 0); /* De-asserted */
>  	mdelay(100);
> -	gpio_set_value(gpio, inverted);
> +	gpiod_set_value(gpiod, 1); /* Asserted */
>  	mdelay(20);
> -	gpio_set_value(gpio, !inverted);
> +	gpiod_set_value(gpiod, 0); /* De-asserted */
>  	mdelay(20);
>  }
>  
> @@ -125,18 +125,15 @@ static int lms283gf05_power_set(struct lcd_device *ld, int power)
>  {
>  	struct lms283gf05_state *st = lcd_get_data(ld);
>  	struct spi_device *spi = st->spi;
> -	struct lms283gf05_pdata *pdata = dev_get_platdata(&spi->dev);
>  
>  	if (power <= FB_BLANK_NORMAL) {
> -		if (pdata)
> -			lms283gf05_reset(pdata->reset_gpio,
> -					pdata->reset_inverted);
> +		if (st->reset)
> +			lms283gf05_reset(st->reset);
>  		lms283gf05_toggle(spi, disp_initseq, ARRAY_SIZE(disp_initseq));
>  	} else {
>  		lms283gf05_toggle(spi, disp_pdwnseq, ARRAY_SIZE(disp_pdwnseq));
> -		if (pdata)
> -			gpio_set_value(pdata->reset_gpio,
> -					pdata->reset_inverted);
> +		if (st->reset)
> +			gpiod_set_value(st->reset, 1); /* Asserted */
>  	}
>  
>  	return 0;
> @@ -150,24 +147,18 @@ static struct lcd_ops lms_ops = {
>  static int lms283gf05_probe(struct spi_device *spi)
>  {
>  	struct lms283gf05_state *st;
> -	struct lms283gf05_pdata *pdata = dev_get_platdata(&spi->dev);
>  	struct lcd_device *ld;
> -	int ret = 0;
> -
> -	if (pdata != NULL) {
> -		ret = devm_gpio_request_one(&spi->dev, pdata->reset_gpio,
> -				GPIOF_DIR_OUT | (!pdata->reset_inverted ?
> -				GPIOF_INIT_HIGH : GPIOF_INIT_LOW),
> -				"LMS283GF05 RESET");
> -		if (ret)
> -			return ret;
> -	}
>  
>  	st = devm_kzalloc(&spi->dev, sizeof(struct lms283gf05_state),
>  				GFP_KERNEL);
>  	if (st == NULL)
>  		return -ENOMEM;
>  
> +	st->reset = gpiod_get_optional(&spi->dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(st->reset))
> +		return PTR_ERR(st->reset);
> +	gpiod_set_consumer_name(st->reset, "LMS283GF05 RESET");
> +
>  	ld = devm_lcd_device_register(&spi->dev, "lms283gf05", &spi->dev, st,
>  					&lms_ops);
>  	if (IS_ERR(ld))
> @@ -179,8 +170,8 @@ static int lms283gf05_probe(struct spi_device *spi)
>  	spi_set_drvdata(spi, st);
>  
>  	/* kick in the LCD */
> -	if (pdata)
> -		lms283gf05_reset(pdata->reset_gpio, pdata->reset_inverted);
> +	if (st->reset)
> +		lms283gf05_reset(st->reset);
>  	lms283gf05_toggle(spi, disp_initseq, ARRAY_SIZE(disp_initseq));
>  
>  	return 0;
> diff --git a/include/linux/spi/lms283gf05.h b/include/linux/spi/lms283gf05.h
> deleted file mode 100644
> index f237b2d062e9..000000000000
> --- a/include/linux/spi/lms283gf05.h
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * lms283gf05.h - Platform glue for Samsung LMS283GF05 LCD
> - *
> - * Copyright (C) 2009 Marek Vasut <marek.vasut@gmail.com>
> -*/
> -
> -#ifndef _INCLUDE_LINUX_SPI_LMS283GF05_H_
> -#define _INCLUDE_LINUX_SPI_LMS283GF05_H_
> -
> -struct lms283gf05_pdata {
> -	unsigned long	reset_gpio;
> -	bool		reset_inverted;
> -};
> -
> -#endif /* _INCLUDE_LINUX_SPI_LMS283GF05_H_ */
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
