Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ECF6FB3D9
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 17:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAA810E0CB;
	Mon,  8 May 2023 15:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 964 seconds by postgrey-1.36 at gabe;
 Mon, 08 May 2023 15:32:12 UTC
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi
 [62.142.5.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4122F10E0CB
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 15:32:12 +0000 (UTC)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
 by fgw20.mail.saunalahti.fi (Halon) with ESMTP
 id 3dcf1144-edb3-11ed-b3cf-005056bd6ce9;
 Mon, 08 May 2023 18:16:02 +0300 (EEST)
From: andy.shevchenko@gmail.com
Date: Mon, 8 May 2023 18:16:00 +0300
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/3] Input: ads7846 - Convert to use software nodes
Message-ID: <ZFkSMBhw5UaWdpsM@surfacebook>
References: <20230430-nokia770-regression-v3-0-a6d0a89ffa8b@linaro.org>
 <20230430-nokia770-regression-v3-1-a6d0a89ffa8b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430-nokia770-regression-v3-1-a6d0a89ffa8b@linaro.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Tony Lindgren <tony@atomide.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Helge Deller <deller@gmx.de>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Andreas Kemnade <andreas@kemnade.info>, linux-input@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-spi@vger.kernel.org,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fri, May 05, 2023 at 01:16:55PM +0200, Linus Walleij kirjoitti:
> The Nokia 770 is using GPIOs from the global numberspace on the
> CBUS node to pass down to the LCD controller. This regresses when we
> let the OMAP GPIO driver use dynamic GPIO base.
> 
> The Nokia 770 now has dynamic allocation of IRQ numbers, so this
> needs to be fixed for it to work.
> 
> As this is the only user of LCD MIPID we can easily augment the
> driver to use a GPIO descriptor instead and resolve the issue.
> 
> The platform data .shutdown() callback wasn't even used in the
> code, but we encode a shutdown asserting RESET in the remove()
> callback for completeness sake.
> 
> The CBUS also has the ADS7846 touchscreen attached.
> 
> Populate the devices on the Nokia 770 CBUS I2C using software
> nodes instead of platform data quirks. This includes the LCD
> and the ADS7846 touchscreen so the conversion just brings the LCD
> along with it as software nodes is an all-or-nothing design
> pattern.
> 
> The ADS7846 has some limited support for using GPIO descriptors,
> let's convert it over completely to using device properties and then
> fix all remaining boardfile users to provide all platform data using
> software nodes.
> 
> Dump the of includes and of_match_ptr() in the ADS7846 driver as part
> of the job.
> 
> Since we have to move ADS7846 over to obtaining the GPIOs it is
> using exclusively from descriptors, we provide descriptor tables
> for the two remaining in-kernel boardfiles using ADS7846:
> 
> - PXA Spitz
> - MIPS Alchemy DB1000 development board
> 
> It was too hard for me to include software node conversion of
> these two remaining users at this time: the spitz is using a
> hscync callback in the platform data that would require further
> GPIO descriptor conversion of the Spitz, and moving the hsync
> callback down into the driver: it will just become too big of
> a job, but it can be done separately.
> 
> The MIPS Alchemy DB1000 is simply something I cannot test, so take
> the easier approach of just providing some GPIO descriptors in
> this case as I don't want the patch to grow too intrusive.

...

>  #include <linux/gpio.h>

Do we need it after this patch?

>  #include <linux/gpio/machine.h>
> +#include <linux/gpio/property.h>

...

> +static const struct software_node *nokia770_gpiochip_nodes[] = {
> +	&nokia770_mpuio_gpiochip_node,
> +	&nokia770_gpiochip1_node,
> +	&nokia770_gpiochip2_node,
> +	NULL,

Comma is redundant for the terminator entry.

> +};

...

> +static struct gpiod_lookup_table spitz_ads7846_gpio_table = {
> +	.dev_id = "spi2.0",
> +	.table = {
> +		GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_TP_INT,
> +			    "pendown", GPIO_ACTIVE_HIGH),
> +		{ },

Ditto.

> +	},
> +};

...

> +static struct gpiod_lookup_table db1100_touch_gpio_table = {
> +	.dev_id = "spi0.0",
> +	.table = {
> +		GPIO_LOOKUP("alchemy-gpio2", 21,
> +			    "pendown", GPIO_ACTIVE_HIGH),
> +		{ },

Ditto.

> +	},
> +};

-- 
With Best Regards,
Andy Shevchenko


