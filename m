Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEC31AE315
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 19:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE316E044;
	Fri, 17 Apr 2020 17:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054C86E044
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 17:04:49 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 47D2E804EF;
 Fri, 17 Apr 2020 19:04:45 +0200 (CEST)
Date: Fri, 17 Apr 2020 19:04:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/8] fbdev: rework backlight dependencies
Message-ID: <20200417170444.GB30483@ravnborg.org>
References: <20200417155553.675905-1-arnd@arndb.de>
 <20200417155553.675905-8-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417155553.675905-8-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=8lmh6C7IyTPJoQKiCR8A:9
 a=wtOHmKyMUfKVnwvn:21 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
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
Cc: marex@denx.de, linux-renesas-soc@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dsd@laptop.org, Nicolas Pitre <nico@fluxnic.net>,
 airlied@linux.ie, masahiroy@kernel.org, jfrederich@gmail.com,
 Saeed Mahameed <saeedm@mellanox.com>, thellstrom@vmware.com,
 haojian.zhuang@gmail.com, Andrzej Hajda <a.hajda@samsung.com>,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com,
 robert.jarzmik@free.fr, Jason Gunthorpe <jgg@ziepe.ca>, daniel@zonque.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd.

On Fri, Apr 17, 2020 at 05:55:52PM +0200, Arnd Bergmann wrote:
> Rather than having CONFIG_FB_BACKLIGHT select CONFIG_BACKLIGHT_CLASS_DEVICE,
> make any driver that needs it have a dependency on the class device
> being available, to prevent circular dependencies.
> 
> This is the same way that the backlight is already treated for the DRM
> subsystem.

I am not happy with the direction of this patch.
It is not easy to understand that one has to enable backlight to
be allowed to select a display or an fbdev driver.


How about somthing like this:

config BACKLIGHT_CLASS_DEVICE
	tristate
	# Will enable backlight module
	# Has no dependencies

config	BACKLIGHT
	bool "Backlight drivers"
	# Will make the backlight drivers visible - a visibility option
	# only

if BACKLIGHT

config BACKLIGHT_ATMEL_LCDC
	...
config BACKLIGHT_EP93XX

endif


All drivers outside video/backlight/ can then select
BACKLIGHT_CLASS_DEVICE to get the backlight core
module.
Or in other words BACKLIGHT_CLASS_DEVICE is used as a sort
of library symbol that gices us access to backlight functionality.

I tried something like this some time ago - but it did not work out for me.
But maybe I just missed something obviously in the maze of Kconfig.

Loking at your patch it is obviously that the approach I suggest above
would require all relevant drivers to explicit add a
select BACKLIGHT_CLASS_DEVICE.

But that is not a bad thing IMO.


	Sam


> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/auxdisplay/Kconfig        |  1 +
>  drivers/macintosh/Kconfig         |  1 +
>  drivers/staging/fbtft/Kconfig     |  1 +
>  drivers/staging/olpc_dcon/Kconfig |  2 +-
>  drivers/video/fbdev/Kconfig       | 14 +++++++++++---
>  5 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
> index 48efa7a047f3..f5751b5b0e88 100644
> --- a/drivers/auxdisplay/Kconfig
> +++ b/drivers/auxdisplay/Kconfig
> @@ -144,6 +144,7 @@ config IMG_ASCII_LCD
>  config HT16K33
>  	tristate "Holtek Ht16K33 LED controller with keyscan"
>  	depends on FB && OF && I2C && INPUT
> +	depends on BACKLIGHT_CLASS_DEVICE
>  	select FB_SYS_FOPS
>  	select FB_SYS_FILLRECT
>  	select FB_SYS_COPYAREA
> diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
> index cbd46c1c5bf7..a1c6677c7043 100644
> --- a/drivers/macintosh/Kconfig
> +++ b/drivers/macintosh/Kconfig
> @@ -113,6 +113,7 @@ config PMAC_MEDIABAY
>  config PMAC_BACKLIGHT
>  	bool "Backlight control for LCD screens"
>  	depends on PPC_PMAC && ADB_PMU && FB = y && (BROKEN || !PPC64)
> +	depends on BACKLIGHT_CLASS_DEVICE
>  	select FB_BACKLIGHT
>  	help
>  	  Say Y here to enable Macintosh specific extensions of the generic
> diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
> index dad1ddcd7b0c..c4f2f01cd798 100644
> --- a/drivers/staging/fbtft/Kconfig
> +++ b/drivers/staging/fbtft/Kconfig
> @@ -3,6 +3,7 @@ menuconfig FB_TFT
>  	tristate "Support for small TFT LCD display modules"
>  	depends on FB && SPI
>  	depends on GPIOLIB || COMPILE_TEST
> +	depends on BACKLIGHT_CLASS_DEVICE
>  	select FB_SYS_FILLRECT
>  	select FB_SYS_COPYAREA
>  	select FB_SYS_IMAGEBLIT
> diff --git a/drivers/staging/olpc_dcon/Kconfig b/drivers/staging/olpc_dcon/Kconfig
> index d1a0dea09ef0..a9f36538d7ab 100644
> --- a/drivers/staging/olpc_dcon/Kconfig
> +++ b/drivers/staging/olpc_dcon/Kconfig
> @@ -4,7 +4,7 @@ config FB_OLPC_DCON
>  	depends on OLPC && FB
>  	depends on I2C
>  	depends on GPIO_CS5535 && ACPI
> -	select BACKLIGHT_CLASS_DEVICE
> +	depends on BACKLIGHT_CLASS_DEVICE
>  	help
>  	  In order to support very low power operation, the XO laptop uses a
>  	  secondary Display CONtroller, or DCON.  This secondary controller
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index bcf7834dbdbf..47e1b65276f4 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -186,7 +186,7 @@ config FB_MACMODES
>  config FB_BACKLIGHT
>  	tristate
>  	depends on FB
> -	select BACKLIGHT_CLASS_DEVICE
> +	depends on BACKLIGHT_CLASS_DEVICE
>  
>  config FB_MODE_HELPERS
>  	bool "Enable Video Mode Handling Helpers"
> @@ -275,12 +275,12 @@ config FB_ARMCLCD
>  	tristate "ARM PrimeCell PL110 support"
>  	depends on ARM || ARM64 || COMPILE_TEST
>  	depends on FB && ARM_AMBA && HAS_IOMEM
> +	depends on BACKLIGHT_CLASS_DEVICE || !OF
>  	select FB_CFB_FILLRECT
>  	select FB_CFB_COPYAREA
>  	select FB_CFB_IMAGEBLIT
>  	select FB_MODE_HELPERS if OF
>  	select VIDEOMODE_HELPERS if OF
> -	select BACKLIGHT_CLASS_DEVICE if OF
>  	help
>  	  This framebuffer device driver is for the ARM PrimeCell PL110
>  	  Colour LCD controller.  ARM PrimeCells provide the building
> @@ -861,6 +861,7 @@ config FB_ATMEL
>  	tristate "AT91 LCD Controller support"
>  	depends on FB && OF && HAVE_CLK && HAS_IOMEM
>  	depends on HAVE_FB_ATMEL || COMPILE_TEST
> +	depends on BACKLIGHT_CLASS_DEVICE
>  	select FB_BACKLIGHT
>  	select FB_CFB_FILLRECT
>  	select FB_CFB_COPYAREA
> @@ -914,6 +915,7 @@ config FB_NVIDIA_DEBUG
>  config FB_NVIDIA_BACKLIGHT
>  	bool "Support for backlight control"
>  	depends on FB_NVIDIA
> +	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_NVIDIA
>  	default y
>  	help
>  	  Say Y here if you want to control the backlight of your display.
> @@ -961,6 +963,7 @@ config FB_RIVA_DEBUG
>  config FB_RIVA_BACKLIGHT
>  	bool "Support for backlight control"
>  	depends on FB_RIVA
> +	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_RIVA
>  	default y
>  	help
>  	  Say Y here if you want to control the backlight of your display.
> @@ -1232,6 +1235,7 @@ config FB_RADEON_I2C
>  config FB_RADEON_BACKLIGHT
>  	bool "Support for backlight control"
>  	depends on FB_RADEON
> +	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_RADEON
>  	default y
>  	help
>  	  Say Y here if you want to control the backlight of your display.
> @@ -1263,6 +1267,7 @@ config FB_ATY128
>  config FB_ATY128_BACKLIGHT
>  	bool "Support for backlight control"
>  	depends on FB_ATY128
> +	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_ATY128
>  	default y
>  	help
>  	  Say Y here if you want to control the backlight of your display.
> @@ -1312,6 +1317,7 @@ config FB_ATY_GX
>  
>  config FB_ATY_BACKLIGHT
>  	bool "Support for backlight control"
> +	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_ATY
>  	depends on FB_ATY
>  	default y
>  	help
> @@ -1855,6 +1861,7 @@ config FB_SH_MOBILE_LCDC
>  	tristate "SuperH Mobile LCDC framebuffer support"
>  	depends on FB && HAVE_CLK && HAS_IOMEM
>  	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
> +	depends on BACKLIGHT_CLASS_DEVICE
>  	select FB_SYS_FILLRECT
>  	select FB_SYS_COPYAREA
>  	select FB_SYS_IMAGEBLIT
> @@ -2183,7 +2190,7 @@ config FB_PRE_INIT_FB
>  config FB_MX3
>  	tristate "MX3 Framebuffer support"
>  	depends on FB && MX3_IPU
> -	select BACKLIGHT_CLASS_DEVICE
> +	depends on BACKLIGHT_CLASS_DEVICE
>  	select FB_CFB_FILLRECT
>  	select FB_CFB_COPYAREA
>  	select FB_CFB_IMAGEBLIT
> @@ -2250,6 +2257,7 @@ config FB_SSD1307
>  	depends on FB && I2C
>  	depends on OF
>  	depends on GPIOLIB || COMPILE_TEST
> +	depends on BACKLIGHT_CLASS_DEVICE
>  	select FB_SYS_FOPS
>  	select FB_SYS_FILLRECT
>  	select FB_SYS_COPYAREA
> -- 
> 2.26.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
