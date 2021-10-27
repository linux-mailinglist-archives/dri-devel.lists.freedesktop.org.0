Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 522D043CC80
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 16:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB236E8B3;
	Wed, 27 Oct 2021 14:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8A36E8B2;
 Wed, 27 Oct 2021 14:40:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="227630639"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="227630639"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 07:40:52 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="465749065"
Received: from smile.fi.intel.com ([10.237.72.184])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 07:40:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mfk6P-001Ti4-3p; Wed, 27 Oct 2021 17:40:29 +0300
Date: Wed, 27 Oct 2021 17:40:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] fbdev: rework FB_DDC dependencies
Message-ID: <YXlk3N4n5BeYl6yO@smile.fi.intel.com>
References: <20211027132732.3993279-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211027132732.3993279-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Wed, Oct 27, 2021 at 03:27:12PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Selecting FB_DDC currently turns on CONFIG_I2C implicitly,
> which is often not desired and can lead to circular dependencies.
> 
> Change this to a 'depends on' and change all drivers that
> rely on FB_DDC to have an appropriate I2C dependency as well.

No objections from me.
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/video/fbdev/Kconfig | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index 6ed5e608dd04..c187a93c9a16 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -62,9 +62,8 @@ config FIRMWARE_EDID
>  
>  config FB_DDC
>  	tristate
> -	depends on FB
> +	depends on FB && I2C
>  	select I2C_ALGOBIT
> -	select I2C
>  
>  config FB_BOOT_VESA_SUPPORT
>  	bool
> @@ -356,6 +355,7 @@ config FB_CYBER2000
>  config FB_CYBER2000_DDC
>  	bool "DDC for CyberPro support"
>  	depends on FB_CYBER2000
> +	depends on I2C=y || I2C=FB_CYBER2000
>  	select FB_DDC
>  	default y
>  	help
> @@ -894,6 +894,7 @@ config FB_NVIDIA
>  config FB_NVIDIA_I2C
>  	bool "Enable DDC Support"
>  	depends on FB_NVIDIA
> +	depends on I2C=y || I2C=FB_NVIDIA
>  	select FB_DDC
>  	help
>  	  This enables I2C support for nVidia Chipsets.  This is used
> @@ -940,6 +941,7 @@ config FB_RIVA
>  config FB_RIVA_I2C
>  	bool "Enable DDC Support"
>  	depends on FB_RIVA
> +	depends on I2C=y || I2C=FB_RIVA
>  	select FB_DDC
>  	help
>  	  This enables I2C support for nVidia Chipsets.  This is used
> @@ -967,7 +969,7 @@ config FB_RIVA_BACKLIGHT
>  
>  config FB_I740
>  	tristate "Intel740 support"
> -	depends on FB && PCI
> +	depends on FB && PCI && I2C
>  	select FB_MODE_HELPERS
>  	select FB_CFB_FILLRECT
>  	select FB_CFB_COPYAREA
> @@ -1021,6 +1023,7 @@ config FB_I810_GTF
>  config FB_I810_I2C
>  	bool "Enable DDC Support"
>  	depends on FB_I810 && FB_I810_GTF
> +	depends on I2C=y || I2C=FB_I810
>  	select FB_DDC
>  	help
>  	  Add DDC/I2C support for i810fb.  This will allow the driver to get
> @@ -1076,6 +1079,7 @@ config FB_INTEL_DEBUG
>  config FB_INTEL_I2C
>  	bool "DDC/I2C for Intel framebuffer support"
>  	depends on FB_INTEL
> +	depends on I2C=y || I2C=FB_INTEL
>  	select FB_DDC
>  	default y
>  	help
> @@ -1155,6 +1159,7 @@ config FB_MATROX_G
>  config FB_MATROX_I2C
>  	tristate "Matrox I2C support"
>  	depends on FB_MATROX
> +	depends on I2C=y || I2C=FB_MATROX
>  	select FB_DDC
>  	help
>  	  This drivers creates I2C buses which are needed for accessing the
> @@ -1220,6 +1225,7 @@ config FB_RADEON
>  config FB_RADEON_I2C
>  	bool "DDC/I2C for ATI Radeon support"
>  	depends on FB_RADEON
> +	depends on I2C=y || I2C=FB_RADEON
>  	select FB_DDC
>  	default y
>  	help
> @@ -1329,6 +1335,7 @@ config FB_S3
>  config FB_S3_DDC
>  	bool "DDC for S3 support"
>  	depends on FB_S3
> +	depends on I2C=y || I2C=FB_S3
>  	select FB_DDC
>  	default y
>  	help
> @@ -1354,6 +1361,7 @@ config FB_SAVAGE
>  config FB_SAVAGE_I2C
>  	bool "Enable DDC2 Support"
>  	depends on FB_SAVAGE
> +	depends on I2C=y || I2C=FB_SAVAGE
>  	select FB_DDC
>  	help
>  	  This enables I2C support for S3 Savage Chipsets.  This is used
> @@ -1493,6 +1501,7 @@ config FB_3DFX_ACCEL
>  config FB_3DFX_I2C
>  	bool "Enable DDC/I2C support"
>  	depends on FB_3DFX
> +	depends on I2C=y || I2C=FB_3DFX
>  	select FB_DDC
>  	default y
>  	help
> @@ -1532,7 +1541,7 @@ config FB_VT8623
>  
>  config FB_TRIDENT
>  	tristate "Trident/CyberXXX/CyberBlade support"
> -	depends on FB && PCI
> +	depends on FB && PCI && I2C
>  	select FB_CFB_FILLRECT
>  	select FB_CFB_COPYAREA
>  	select FB_CFB_IMAGEBLIT
> -- 
> 2.29.2
> 

-- 
With Best Regards,
Andy Shevchenko


