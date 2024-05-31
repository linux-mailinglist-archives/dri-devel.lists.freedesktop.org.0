Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9048D5EFF
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 11:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB4110E434;
	Fri, 31 May 2024 09:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hu5bMmVB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8269710E434
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 09:57:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E2CA9CE1A9C;
 Fri, 31 May 2024 09:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A56C116B1;
 Fri, 31 May 2024 09:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717149424;
 bh=pG1FuJNpg4iD5VvuUxyaJG1TPUBzdsFzeembK8i33cE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hu5bMmVBc986akPDt9Ge9tIAY28LTFO3zwiOt/Joe+hTEGWcqkK1uspvfXfUgXXxe
 37xIAg+mkLYdlb3Hs9WdiXpCF1VeQrUhl78CihP1szlXYNSBa15MdkJ/xVV25GxxSe
 GoFHLTigYu0YGr12LUzpQPJDP6vTnVpL49ILbXi3zxAMPLAoxFNkYdK1EVTmNJFn7f
 CA1vM3tFKh3BQ8+a2Mrj8F6+o+ltODCoNMa/d4HHrTNiLP+FE/f+tft+dne1biNKt8
 EM2SBRlBln82aT4Aeemi64mL4//CHv+Iem7UQVhtCKN9l9VGh3B5qbmCfUa1q0Ty4h
 r2ZCGXufem1Qw==
Date: Fri, 31 May 2024 10:56:50 +0100
From: Lee Jones <lee@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Helge Deller <deller@gmx.de>, Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Baoquan He <bhe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Azeem Shaikh <azeemshaikh38@gmail.com>, Guo Ren <guoren@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Anup Patel <apatel@ventanamicro.com>, Jacky Huang <ychuang3@nuvoton.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [DO NOT MERGE v8 23/36] mfd: sm501: Convert platform_data to OF
 property
Message-ID: <20240531095650.GD8682@google.com>
References: <cover.1716965617.git.ysato@users.sourceforge.jp>
 <c139d3a42c61d978296aa2e513de073c643e4fbe.1716965617.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c139d3a42c61d978296aa2e513de073c643e4fbe.1716965617.git.ysato@users.sourceforge.jp>
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

On Wed, 29 May 2024, Yoshinori Sato wrote:

> Various parameters of SM501 can be set using platform_data,
> so parameters cannot be passed in the DeviceTree target.
> Expands the parameters set in platform_data so that they can be
> specified using DeviceTree properties.
> 
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  drivers/mfd/sm501.c           | 238 ++++++++++++++++++++++++++++++++++
>  drivers/video/fbdev/sm501fb.c |  87 +++++++++++++
>  2 files changed, 325 insertions(+)
> 
> diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
> index b3592982a83b..d373aded0c3b 100644
> --- a/drivers/mfd/sm501.c
> +++ b/drivers/mfd/sm501.c
> @@ -20,6 +20,7 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/gpio/machine.h>
>  #include <linux/slab.h>
> +#include <linux/clk.h>
>  
>  #include <linux/sm501.h>
>  #include <linux/sm501-regs.h>
> @@ -82,6 +83,16 @@ struct sm501_devdata {
>  	unsigned int			 rev;
>  };
>  
> +struct sm501_config_props_uint {
> +	char *name;
> +	u32 shift;
> +};
> +
> +struct sm501_config_props_flag {
> +	char *clr_name;
> +	char *set_name;
> +	u32 bit;
> +};
>  
>  #define MHZ (1000 * 1000)
>  
> @@ -1370,6 +1381,227 @@ static int sm501_init_dev(struct sm501_devdata *sm)
>  	return 0;
>  }
>  
> +#define FIELD_WIDTH 4
> +struct dt_values {
> +	char *name;
> +	unsigned int offset;
> +	unsigned int width;
> +	char *val[(1 << FIELD_WIDTH) + 1];
> +};
> +
> +#define fld(_name, _offset, _width, ...)	\
> +	{ \
> +		.name = _name, \
> +		.offset = _offset, \
> +		.width = _width,	\
> +		.val = { __VA_ARGS__, NULL},	\
> +	}
> +
> +static const struct dt_values misc_timing[] = {
> +	fld("ex", 28, 4,
> +	    "none", "16", "32", "48", "64", "80", "96", "112",
> +	    "128", "144", "160", "176", "192", "208", "224", "240"),
> +	fld("xc", 24, 2, "internal-pll", "hclk", "gpio30"),
> +	fld("us", 23, 1, "disable", "enable"),
> +	fld("ssm1", 20, 1, "288", "divider"),
> +	fld("sm1", 16, 4,
> +	    "1", "2", "4", "8", "16", "32", "64", "128",
> +	    "3", "6", "12", "24", "48", "96", "192", "384"),
> +	fld("ssm0", 12, 1, "288", "divider"),
> +	fld("sm0", 8, 4,
> +	    "1", "2", "4", "8", "16", "32", "64", "128",
> +	    "3", "6", "12", "24", "48", "96", "192", "384"),
> +	fld("deb", 7, 1, "input-reference", "output"),
> +	fld("a", 6, 1, "no-acpi", "acpi"),
> +	fld("divider", 4, 2, "336", "288", "240", "192"),
> +	fld("u", 3, 1, "normal", "simulation"),
> +	fld("delay", 0, 3, "none", "0.5", "1.0", "1.5", "2.0", "2.5"),
> +	{ .name = NULL },
> +};
> +
> +static const struct dt_values misc_control[] = {
> +	fld("pad", 30, 2, "24", "12", "8"),
> +	fld("usbclk", 28, 2, "xtal", "96", "48"),
> +	fld("ssp", 27, 1, "uart1", "ssp1"),
> +	fld("lat", 26, 1, "disable", "enable"),
> +	fld("fp", 25, 1, "18", "24"),
> +	fld("freq", 24, 1, "24", "12"),
> +	fld("refresh", 21, 2, "8", "16", "32", "64"),
> +	fld("hold", 18, 3, "fifo-empty", "8", "16", "24", "32"),
> +	fld("sh", 17, 1, "active-low", "active-high"),
> +	fld("ii", 16, 1, "normal", "inverted"),
> +	fld("pll", 15, 1, "disable", "enable"),
> +	fld("gap", 13, 2, "0"),
> +	fld("dac", 12, 1, "enable", "disable"),
> +	fld("mc", 11, 1, "cpu", "8051"),
> +	fld("bl", 10, 8, "1"),
> +	fld("usb", 9, 1, "master", "slave"),
> +	fld("vr", 4, 1, "0x1e00000", "0x3e00000"),
> +	{ .name = NULL },
> +};

I've been avoiding this set for a while now!

I appreciate the amount of work that you've put into this, but this is a
bit of a disaster.  It's a hell of lot of over-complex infrastructure
just to pull out some values from DT.

Forgive me if I have this wrong, but it looks like you're defining
various structs then populating static versions with hard-coded offsets
into DT arrays!  Then you have a bunch of hoop-jumpy functions to
firstly parse the offset-structs, then conduct look-ups to pull the
final value which in turn gets shifted into an encoded variable ready
for to write out to the registers.  Bonkers.

What does 'timing' even mean in this context?  Clocks?

What other devices require this kind of handling?  Why is this device so
different from all other supported devices to date?  Instead of
attempting to shoehorn this into a 20 year old driver, why not reshape
it to bring it into alignment with how we do things today?

E.g. handle all clocking from the clock driver, all display settings
(including timing?) from the display driver, etc.

-- 
Lee Jones [李琼斯]
