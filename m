Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE2C4B2414
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 12:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AE810EAC5;
	Fri, 11 Feb 2022 11:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31F810EAC7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 11:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644578235; x=1676114235;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UDg/cRMVNZq4VK4Lls+Vec/HeF2777w2e/hwmwIdGoE=;
 b=BWAY8qlMwTWvNZhU8t3wR2WGJ9asxvVdshNHoeel49UmWZOttX3aPLhV
 NrFlx5J/SI7ONm8nU7T27fLaklFIa73Md5UDoBOWEJyuxhK1evsK7dtAL
 wv4XwFDj725tXB1xMDXnZI/0HapsTQvDPfOkawlPgepNWNdy4k4Dabtf/
 1g7fwJthh5p5jnFcfp2W7sGJNTaemQyGvdYts531QNbP3S4nktLSJ1L9E
 xwJeJ19NMIjNI0+Atd9BDefP6KHRwLzuJwNde8jvPizeSmgRnrf/vSHCs
 VOaK7GjzPgcbWhN81lnJjQ15GQ4Xe1YCLrkFKMELt9ODWhS7aVQs5zbN9 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="230356639"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="230356639"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:17:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="623193127"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:17:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nITuQ-003Q6H-Qr; Fri, 11 Feb 2022 13:16:14 +0200
Date: Fri, 11 Feb 2022 13:16:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 4/6] drm/solomon: Add SSD130x OLED displays I2C support
Message-ID: <YgZFfljGSH9p979C@smile.fi.intel.com>
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-5-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211091927.2988283-5-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 10:19:25AM +0100, Javier Martinez Canillas wrote:
> The ssd130x driver only provides the core support for these devices but it
> does not have any bus transport logic. Add a driver to interface over I2C.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
> Changes in v4:
> - Remove unnecessary casting (Geert Uytterhoeven)
> - Remove redundant blank lines (Andy Shevchenko)
> - Remove comma after of_device_id table terminator (Andy Shevchenko)
> 
> Changes in v3:
> - Add a separate driver for SSD130X chips I2C support (Andy Shevchenko)
> 
>  drivers/gpu/drm/solomon/Kconfig       |   9 ++
>  drivers/gpu/drm/solomon/Makefile      |   1 +
>  drivers/gpu/drm/solomon/ssd130x-i2c.c | 116 ++++++++++++++++++++++++++
>  3 files changed, 126 insertions(+)
>  create mode 100644 drivers/gpu/drm/solomon/ssd130x-i2c.c
> 
> diff --git a/drivers/gpu/drm/solomon/Kconfig b/drivers/gpu/drm/solomon/Kconfig
> index 7720a7039e8d..5861c3ab7c45 100644
> --- a/drivers/gpu/drm/solomon/Kconfig
> +++ b/drivers/gpu/drm/solomon/Kconfig
> @@ -10,3 +10,12 @@ config DRM_SSD130X
>  	  the appropriate bus transport in your chip also must be selected.
>  
>  	  If M is selected the module will be called ssd130x.
> +
> +config DRM_SSD130X_I2C
> +	tristate "DRM support for Solomon SSD130x OLED displays (I2C bus)"
> +	depends on DRM_SSD130X && I2C
> +	select REGMAP_I2C
> +	help
> +	  Say Y here if the SSD130x OLED display is connected via I2C bus.
> +
> +	  If M is selected the module will be called ssd130x-i2c.
> diff --git a/drivers/gpu/drm/solomon/Makefile b/drivers/gpu/drm/solomon/Makefile
> index f685addb19fe..4bfc5acb0447 100644
> --- a/drivers/gpu/drm/solomon/Makefile
> +++ b/drivers/gpu/drm/solomon/Makefile
> @@ -1 +1,2 @@
>  obj-$(CONFIG_DRM_SSD130X)	+= ssd130x.o
> +obj-$(CONFIG_DRM_SSD130X_I2C)	+= ssd130x-i2c.o
> diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
> new file mode 100644
> index 000000000000..3126aeda4ced
> --- /dev/null
> +++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
> @@ -0,0 +1,116 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * DRM driver for Solomon SSD130x OLED displays (I2C bus)
> + *
> + * Copyright 2022 Red Hat Inc.
> + * Author: Javier Martinez Canillas <javierm@redhat.com>
> + *
> + * Based on drivers/video/fbdev/ssd1307fb.c
> + * Copyright 2012 Free Electrons
> + */
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +
> +#include "ssd130x.h"
> +
> +#define DRIVER_NAME	"ssd130x-i2c"
> +#define DRIVER_DESC	"DRM driver for Solomon SSD130x OLED displays (I2C)"
> +
> +static const struct regmap_config ssd130x_i2c_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +};
> +
> +static int ssd130x_i2c_probe(struct i2c_client *client)
> +{
> +	struct ssd130x_device *ssd130x;
> +	struct regmap *regmap;
> +
> +	regmap = devm_regmap_init_i2c(client, &ssd130x_i2c_regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	ssd130x = ssd130x_probe(&client->dev, regmap);
> +	if (IS_ERR(ssd130x))
> +		return PTR_ERR(ssd130x);
> +
> +	i2c_set_clientdata(client, ssd130x);
> +
> +	return 0;
> +}
> +
> +static int ssd130x_i2c_remove(struct i2c_client *client)
> +{
> +	struct ssd130x_device *ssd130x = i2c_get_clientdata(client);
> +
> +	return ssd130x_remove(ssd130x);
> +}
> +
> +static void ssd130x_i2c_shutdown(struct i2c_client *client)
> +{
> +	struct ssd130x_device *ssd130x = i2c_get_clientdata(client);
> +
> +	ssd130x_shutdown(ssd130x);
> +}
> +
> +static struct ssd130x_deviceinfo ssd130x_ssd1305_deviceinfo = {
> +	.default_vcomh = 0x34,
> +	.default_dclk_div = 1,
> +	.default_dclk_frq = 7,
> +};
> +
> +static struct ssd130x_deviceinfo ssd130x_ssd1306_deviceinfo = {
> +	.default_vcomh = 0x20,
> +	.default_dclk_div = 1,
> +	.default_dclk_frq = 8,
> +	.need_chargepump = 1,
> +};
> +
> +static struct ssd130x_deviceinfo ssd130x_ssd1307_deviceinfo = {
> +	.default_vcomh = 0x20,
> +	.default_dclk_div = 2,
> +	.default_dclk_frq = 12,
> +	.need_pwm = 1,
> +};
> +
> +static struct ssd130x_deviceinfo ssd130x_ssd1309_deviceinfo = {
> +	.default_vcomh = 0x34,
> +	.default_dclk_div = 1,
> +	.default_dclk_frq = 10,
> +};
> +
> +static const struct of_device_id ssd130x_of_match[] = {
> +	{
> +		.compatible = "solomon,ssd1305fb-i2c",
> +		.data = &ssd130x_ssd1305_deviceinfo,
> +	},
> +	{
> +		.compatible = "solomon,ssd1306fb-i2c",
> +		.data = &ssd130x_ssd1306_deviceinfo,
> +	},
> +	{
> +		.compatible = "solomon,ssd1307fb-i2c",
> +		.data = &ssd130x_ssd1307_deviceinfo,
> +	},
> +	{
> +		.compatible = "solomon,ssd1309fb-i2c",
> +		.data = &ssd130x_ssd1309_deviceinfo,
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ssd130x_of_match);
> +
> +static struct i2c_driver ssd130x_i2c_driver = {
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.of_match_table = ssd130x_of_match,
> +	},
> +	.probe_new = ssd130x_i2c_probe,
> +	.remove = ssd130x_i2c_remove,
> +	.shutdown = ssd130x_i2c_shutdown,
> +};
> +module_i2c_driver(ssd130x_i2c_driver);
> +
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_AUTHOR("Javier Martinez Canillas <javierm@redhat.com>");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


