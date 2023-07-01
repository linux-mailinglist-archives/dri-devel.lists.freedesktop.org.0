Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF01744B9E
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jul 2023 00:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA4E10E122;
	Sat,  1 Jul 2023 22:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07E710E122
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 22:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=aNT+gGft12BfYIdNaF797cPbj08SwdIbd2wcB4+Y1P0=; b=2DLhD7ylKYE6Zcp7pp4P0723wG
 ljgabZpZ4nYDZPGrv9bs3H9D32DAR2p3wv6az2uoYVjg9D+wLfeJL+kj6VSfot0pKg+GCdqAxBtKi
 2ROgEMqHG4HJETr+P5YwI9sB08vjN72d4A0LBWopSLwSWTRbhQaRNF2y431fdbjQBuHOmljVETueg
 hUVqk0OOFcq8krBgEdZSoO1WKLOFXTpbsShQ4cSOBTj3w3lS1Dh3wPvbu+iXbzMr1b5tXrbF/UXNO
 SOXq46d8bB8rRBpY6jkE4aKLFxkT3CuakwlZvUmTZMX42PlHWZz/BC6vp7x33aDQR0F4bdPu5Vqvc
 Z+Hz5JQg==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qFix1-006isr-0h; Sat, 01 Jul 2023 22:20:19 +0000
Message-ID: <4416a125-534e-345b-65a9-26b2c075890f@infradead.org>
Date: Sat, 1 Jul 2023 15:20:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] fbdev: Split frame buffer support in FB and
 FB_CORE symbols
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20230701214503.550549-1-javierm@redhat.com>
 <20230701214503.550549-2-javierm@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230701214503.550549-2-javierm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, x86@kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


Does this series apply on top of the previous series or on what?


On 7/1/23 14:44, Javier Martinez Canillas wrote:
> Currently the CONFIG_FB option has to be enabled even if no legacy fbdev
> drivers are needed (e.g: only to have support for framebuffer consoles).
> 
> The DRM subsystem has a fbdev emulation layer, but depends on CONFIG_FB
> and so it can only be enabled if that dependency is enabled as well.
> 
> That means fbdev drivers have to be explicitly disabled if users want to
> enable CONFIG_FB, only to use fbcon and/or the DRM fbdev emulation layer.
> 
> This patch introduces a non-visible CONFIG_FB_CORE symbol that could be
> enabled just to have core support needed for CONFIG_DRM_FBDEV_EMULATION,
> allowing CONFIG_FB to be disabled (and automatically disabling all the
> fbdev drivers).
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
> Changes in v2:
> - Keep "depends on FB" for FB_DDC, FB_HECUBA, FB_SVGALIB, FB_MACMODES,
>   FB_BACKLIGHT, FB_MODE_HELPERS and FB_TILEBLITTING (Arnd Bergmann).
> - Don't change the fb.o object name (Arnd Bergmann).
> - Make FB_CORE a non-visible Kconfig symbol instead (Thomas Zimmermann).
> 
>  arch/x86/Makefile                 |  2 +-
>  arch/x86/video/Makefile           |  2 +-
>  drivers/video/console/Kconfig     |  2 +-
>  drivers/video/fbdev/Kconfig       | 40 +++++++++++++++++++------------
>  drivers/video/fbdev/core/Makefile |  2 +-
>  5 files changed, 29 insertions(+), 19 deletions(-)
> 

> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index cecf15418632..da6f7d588f17 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -6,8 +6,12 @@
>  config FB_NOTIFY
>  	bool
>  
> +menuconfig FB_CORE
> +	tristate "Core support for frame buffer devices"
> +

I could be reading this incorrectly, but FB_CORE does not appear to
be a non-visible Kconfig symbol here.

>  menuconfig FB
> -	tristate "Support for frame buffer devices"
> +	tristate "Support for frame buffer device drivers"
> +	select FB_CORE
>  	select FB_NOTIFY
>  	select VIDEO_CMDLINE
>  	help

thanks.
-- 
~Randy
