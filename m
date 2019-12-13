Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C73E11F24E
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65496E3D3;
	Sat, 14 Dec 2019 14:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A238982A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 17:24:59 +0000 (UTC)
Received: from belgarion ([90.55.212.38]) by mwinf5d31 with ME
 id dVQv210090qFw6q03VQvYz; Fri, 13 Dec 2019 18:24:57 +0100
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Fri, 13 Dec 2019 18:24:57 +0100
X-ME-IP: 90.55.212.38
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: corgi: Convert to use GPIO descriptors
References: <20191203123143.118487-1-linus.walleij@linaro.org>
 <87sgluy43j.fsf@belgarion.home>
 <CACRpkdZS0umWreCuXXkdmwLoSVyAtwMrN21EMyqnn4LR8zkFkw@mail.gmail.com>
X-URL: http://belgarath.falguerolles.org/
Date: Fri, 13 Dec 2019 18:24:55 +0100
In-Reply-To: <CACRpkdZS0umWreCuXXkdmwLoSVyAtwMrN21EMyqnn4LR8zkFkw@mail.gmail.com>
 (Linus Walleij's message of "Wed, 11 Dec 2019 00:20:34 +0100")
Message-ID: <87mubwxhnc.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: Andrea Adami <andrea.adami@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Linus Walleij <linus.walleij@linaro.org> writes:

> On Sun, Dec 8, 2019 at 9:06 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>
>> Linus Walleij <linus.walleij@linaro.org> writes:
>> > @@ -525,13 +525,33 @@ static void spitz_bl_kick_battery(void)
>> >       }
>> >  }
>> >
>> > +static struct gpiod_lookup_table spitz_lcdcon_gpio_table = {
>> > +     .dev_id = "spi0.1",
>> How do you know the correct device name is "spi0.1" ?
>
> With SPI devices it is always hard to know without access to the
> actual hardware, so every patch is a request for testing...
>
> I looked at arch/arm/mach-pxa/spitz.c and
> it registers just one spi bus (AFAICT) with 3 chip
> selects so that will be "spi0", and then
> spi_register_board_info() is called with an array of 3
> devices (spitz_spi_devices[]). Those are in order of
> chip select so chip select 0, 1, 2. This is the second
> device so chip select 1.
>
> The code in drivers/spi/spi.c names the devices
> using spi_dev_set_name() like this:
> dev_set_name(&spi->dev, "%s.%u", dev_name(&spi->controller->dev),
>                      spi->chip_select);
>
> So it will theoretically "spi0.1"
>
> Beware about bugs in the above interpreter because it is
> just my brain.
Well, if nobody complains because of testing, why not, your explanation seems as
good as it could be.

Moreover my boards are actually packed for a house move, so I hope for the best
with all the patches for gpiod conversion, as I won't be able to test much for a
month.

If you would be so kind as to carry these changes through your tree instead of
the PXA one, please have my :
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

-- 
Robert
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
