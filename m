Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 862956FB3E7
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 17:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62FB10E278;
	Mon,  8 May 2023 15:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi
 [62.142.5.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D39F10E278
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 15:33:34 +0000 (UTC)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
 by fgw20.mail.saunalahti.fi (Halon) with ESMTP
 id 71d38cae-edb3-11ed-b3cf-005056bd6ce9;
 Mon, 08 May 2023 18:17:29 +0300 (EEST)
From: andy.shevchenko@gmail.com
Date: Mon, 8 May 2023 18:17:28 +0300
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/3] ARM: omap1: Fix up the Nokia 770 board device IRQs
Message-ID: <ZFkSiM9GRfN5n7n4@surfacebook>
References: <20230430-nokia770-regression-v3-0-a6d0a89ffa8b@linaro.org>
 <20230430-nokia770-regression-v3-3-a6d0a89ffa8b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430-nokia770-regression-v3-3-a6d0a89ffa8b@linaro.org>
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

Fri, May 05, 2023 at 01:16:57PM +0200, Linus Walleij kirjoitti:
> The platform devices on the Nokia 770 is using some
> board-specific IRQs that get statically assigned to platform
> devices in the boardfile.
> 
> This does not work with dynamic IRQ chip bases.
> 
> Utilize the NULL device to define some board-specific
> GPIO lookups and use these to immediately look up the
> same GPIOs, convert to IRQ numbers and pass as resources
> to the devices. This is ugly but should work.

...

> +static struct gpiod_lookup_table nokia770_irq_gpio_table = {
> +	.dev_id = NULL,
> +	.table = {
> +		/* GPIO used by SPI device 1 */
> +		GPIO_LOOKUP("gpio-0-15", 15, "ads7846_irq",
> +			    GPIO_ACTIVE_HIGH),
> +		/* GPIO used for retu IRQ */
> +		GPIO_LOOKUP("gpio-48-63", 15, "retu_irq",
> +			    GPIO_ACTIVE_HIGH),
> +		/* GPIO used for tahvo IRQ */
> +		GPIO_LOOKUP("gpio-32-47", 8, "tahvo_irq",
> +			    GPIO_ACTIVE_HIGH),

Missing terminator.

> +	},
> +};

-- 
With Best Regards,
Andy Shevchenko


