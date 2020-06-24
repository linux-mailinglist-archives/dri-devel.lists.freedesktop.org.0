Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C81C207367
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 14:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52C389CDF;
	Wed, 24 Jun 2020 12:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7585F89CDF
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 12:34:40 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B57A920E65;
 Wed, 24 Jun 2020 12:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593002080;
 bh=qfSj1ptFbPtQoHsR9HGcQDGFx6Aq81c6MnnNldPe7+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xehCxHf8eN6B8fsbunRwbnsKFrg8kS7Sq5NLNbcFc7Kwku8wgy4i7dh5fyXhVfd84
 WEWAGSLGntFIxaM+1pBzYpDxPRAG3yMn/+GH3N7LYzQQ0+OWEWoGJ84GzjScaAU3iP
 v5HU5+UYzsLjAvLF9XXUV7fesuail1JrKHzGnvpk=
Date: Wed, 24 Jun 2020 14:34:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RESEND PATCH v5 2/5] driver core: add deferring probe reason to
 devices_deferred property
Message-ID: <20200624123438.GC1773782@kroah.com>
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114136eucas1p1a3a31d95d86754201c7965f26ccd5de0@eucas1p1.samsung.com>
 <20200624114127.3016-3-a.hajda@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624114127.3016-3-a.hajda@samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 andy.shevchenko@gmail.com, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 24, 2020 at 01:41:24PM +0200, Andrzej Hajda wrote:
> /sys/kernel/debug/devices_deferred property contains list of deferred devices.
> This list does not contain reason why the driver deferred probe, the patch
> improves it.
> The natural place to set the reason is probe_err function introduced recently,
> ie. if probe_err will be called with -EPROBE_DEFER instead of printk the message
> will be attached to deferred device and printed when user read devices_deferred
> property.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
>  drivers/base/base.h |  3 +++
>  drivers/base/core.c | 10 ++++++----
>  drivers/base/dd.c   | 21 ++++++++++++++++++++-
>  3 files changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/base/base.h b/drivers/base/base.h
> index 95c22c0f9036..93ef1c2f4c1f 100644
> --- a/drivers/base/base.h
> +++ b/drivers/base/base.h
> @@ -93,6 +93,7 @@ struct device_private {
>  	struct klist_node knode_class;
>  	struct list_head deferred_probe;
>  	struct device_driver *async_driver;
> +	char *deferred_probe_msg;
>  	struct device *device;
>  	u8 dead:1;
>  };
> @@ -134,6 +135,8 @@ extern void device_release_driver_internal(struct device *dev,
>  extern void driver_detach(struct device_driver *drv);
>  extern int driver_probe_device(struct device_driver *drv, struct device *dev);
>  extern void driver_deferred_probe_del(struct device *dev);
> +extern void __deferred_probe_set_msg(const struct device *dev,
> +				     struct va_format *vaf);
>  static inline int driver_match_device(struct device_driver *drv,
>  				      struct device *dev)
>  {
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index ee9da66bff1b..2a96954d5460 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -3962,6 +3962,8 @@ define_dev_printk_level(_dev_info, KERN_INFO);
>   *
>   * This helper implements common pattern present in probe functions for error
>   * checking: print message if the error is not -EPROBE_DEFER and propagate it.
> + * In case of -EPROBE_DEFER it sets defer probe reason, which can be checked
> + * later by reading devices_deferred debugfs attribute.
>   * It replaces code sequence:
>   * 	if (err != -EPROBE_DEFER)
>   * 		dev_err(dev, ...);
> @@ -3977,14 +3979,14 @@ int probe_err(const struct device *dev, int err, const char *fmt, ...)
>  	struct va_format vaf;
>  	va_list args;
>  
> -	if (err == -EPROBE_DEFER)
> -		return err;
> -
>  	va_start(args, fmt);
>  	vaf.fmt = fmt;
>  	vaf.va = &args;
>  
> -	dev_err(dev, "error %d: %pV", err, &vaf);
> +	if (err == -EPROBE_DEFER)
> +		__deferred_probe_set_msg(dev, &vaf);
> +	else
> +		dev_err(dev, "error %d: %pV", err, &vaf);
>  
>  	va_end(args);
>  
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 9a1d940342ac..f44d26454b6a 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -27,6 +27,7 @@
>  #include <linux/async.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pinctrl/devinfo.h>
> +#include <linux/slab.h>
>  
>  #include "base.h"
>  #include "power/power.h"
> @@ -136,6 +137,8 @@ void driver_deferred_probe_del(struct device *dev)
>  	if (!list_empty(&dev->p->deferred_probe)) {
>  		dev_dbg(dev, "Removed from deferred list\n");
>  		list_del_init(&dev->p->deferred_probe);
> +		kfree(dev->p->deferred_probe_msg);
> +		dev->p->deferred_probe_msg = NULL;
>  	}
>  	mutex_unlock(&deferred_probe_mutex);
>  }
> @@ -211,6 +214,21 @@ void device_unblock_probing(void)
>  	driver_deferred_probe_trigger();
>  }
>  
> +/*
> + * __deferred_probe_set_msg() - Set defer probe reason message for device
> + */
> +void __deferred_probe_set_msg(const struct device *dev, struct va_format *vaf)
> +{
> +	const char *drv = dev_driver_string(dev);
> +
> +	mutex_lock(&deferred_probe_mutex);
> +
> +	kfree(dev->p->deferred_probe_msg);
> +	dev->p->deferred_probe_msg = kasprintf(GFP_KERNEL, "%s: %pV", drv, vaf);

What about the device name?  Don't you also want that?

You want the same format that __dev_printk() outputs, please use that
to be consistant with all other messages that drivers are spitting out.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
