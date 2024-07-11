Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF9892E8DC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 15:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D1110EA5E;
	Thu, 11 Jul 2024 13:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="bdjw0FS9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 621 seconds by postgrey-1.36 at gabe;
 Thu, 11 Jul 2024 13:08:20 UTC
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E67C10EA5B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 13:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UP29LTmvlHTs/OoBfoU8insLR5ShRbL+0hC3P+TNI/s=; t=1720703300; x=1721308100; 
 b=bdjw0FS9hKCvCN9ON8YrkuPvyPRV8+/rR/1/0sOtJbigcEk3h/NQi4KXQj03RyWQL5ixgonu1Z5
 DpZARKXY0mWiiN+gbdCwMkI9oZ0t1PQPzyaPPOGyY6jR5BAlXX6bakV6axJEZU+asPV7wF1G+Cunw
 YPUrmNVm2xvdnZvxzkDZjGUXd9kdHVeeDCRuVHQciRwTInguF34Z2wAha5mkdVfRUpxUczawFEDly
 sFFwkdS6PG4pBjPeV5tAUyfYozSJR/W7MnIzAd4YzxNO3LiBdLkBMjpXCuu97IefdQBn0TF8gKm0d
 r8etQyyPJKkOb7CDeOiYoINsUNnM4wJPh3sw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.98) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1sRtMO-00000003KGI-40qJ; Thu, 11 Jul 2024 14:57:20 +0200
Received: from p5b13a475.dip0.t-ipconnect.de ([91.19.164.117]
 helo=[192.168.178.20]) by inpost2.zedat.fu-berlin.de (Exim 4.98)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1sRtMO-00000001SHj-2Zok; Thu, 11 Jul 2024 14:57:20 +0200
Message-ID: <cb7a69949c08be858b107a2b8184d1da92d794a0.camel@physik.fu-berlin.de>
Subject: Re: [DO NOT MERGE v8 20/36] serial: sh-sci: fix SH4 OF support.
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Geert Uytterhoeven
 <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,  David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Thomas Gleixner
 <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,  Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Rich Felker <dalias@libc.org>, Lee Jones
 <lee@kernel.org>, Helge Deller <deller@gmx.de>, Heiko Stuebner
 <heiko.stuebner@cherry.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Baoquan He <bhe@redhat.com>, Andrew
 Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Azeem Shaikh <azeemshaikh38@gmail.com>, Guo Ren
 <guoren@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>, Herve Codina <herve.codina@bootlin.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Anup Patel
 <apatel@ventanamicro.com>,  Jacky Huang <ychuang3@nuvoton.com>, Hugo
 Villeneuve <hvilleneuve@dimonoff.com>, Jonathan Corbet <corbet@lwn.net>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Sam Ravnborg
 <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>, Sergey
 Shtylyov <s.shtylyov@omp.ru>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, linux-ide@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
Date: Thu, 11 Jul 2024 14:57:18 +0200
In-Reply-To: <57525900a4876323467612d73eded183315c1680.1716965617.git.ysato@users.sourceforge.jp>
References: <cover.1716965617.git.ysato@users.sourceforge.jp>
 <57525900a4876323467612d73eded183315c1680.1716965617.git.ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.164.117
X-ZEDAT-Hint: PO
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yoshinori,

On Wed, 2024-05-29 at 17:01 +0900, Yoshinori Sato wrote:
> - Separated RZ's earlycon initialization from normal SCIF.
> - fix earlyprintk hung (NULL pointer reference).
> - fix SERIAL_SH_SCI_EARLYCON enablement

I feel like this could actually be split into three patches.

Adrian

> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/tty/serial/Kconfig  | 2 +-
>  drivers/tty/serial/sh-sci.c | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index 4fdd7857ef4d..eeb22b582470 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -664,7 +664,7 @@ config SERIAL_SH_SCI_EARLYCON
>  	depends on SERIAL_SH_SCI=3Dy
>  	select SERIAL_CORE_CONSOLE
>  	select SERIAL_EARLYCON
> -	default ARCH_RENESAS
> +	default ARCH_RENESAS || SUPERH
> =20
>  config SERIAL_SH_SCI_DMA
>  	bool "DMA support" if EXPERT
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index f738980a8b2c..068f483401e3 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -2723,7 +2723,7 @@ static int sci_remap_port(struct uart_port *port)
>  	if (port->membase)
>  		return 0;
> =20
> -	if (port->dev->of_node || (port->flags & UPF_IOREMAP)) {
> +	if (dev_of_node(port->dev) || (port->flags & UPF_IOREMAP)) {
>  		port->membase =3D ioremap(port->mapbase, sport->reg_size);
>  		if (unlikely(!port->membase)) {
>  			dev_err(port->dev, "can't remap port#%d\n", port->line);
> @@ -3551,8 +3551,8 @@ static int __init hscif_early_console_setup(struct =
earlycon_device *device,
> =20
>  OF_EARLYCON_DECLARE(sci, "renesas,sci", sci_early_console_setup);
>  OF_EARLYCON_DECLARE(scif, "renesas,scif", scif_early_console_setup);
> -OF_EARLYCON_DECLARE(scif, "renesas,scif-r7s9210", rzscifa_early_console_=
setup);
> -OF_EARLYCON_DECLARE(scif, "renesas,scif-r9a07g044", rzscifa_early_consol=
e_setup);
> +OF_EARLYCON_DECLARE(rzscifa, "renesas,scif-r7s9210", rzscifa_early_conso=
le_setup);
> +OF_EARLYCON_DECLARE(rzscifa, "renesas,scif-r9a07g044", rzscifa_early_con=
sole_setup);
>  OF_EARLYCON_DECLARE(scifa, "renesas,scifa", scifa_early_console_setup);
>  OF_EARLYCON_DECLARE(scifb, "renesas,scifb", scifb_early_console_setup);
>  OF_EARLYCON_DECLARE(hscif, "renesas,hscif", hscif_early_console_setup);

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
