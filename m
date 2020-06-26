Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CC920C096
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 12:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4824B6E13B;
	Sat, 27 Jun 2020 10:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3EC6E14F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 17:11:27 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05QHBEAZ099969;
 Fri, 26 Jun 2020 12:11:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1593191474;
 bh=ux4wGZ9FAMPewCIiFjxwKiWjPcBoQzrGx8Tm3T6HdSc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=FPWXKFQsFWefNWyjFpNnCg6GFcS2w6ONHUfxScGAaLZiH1uHyFU5LPQggJYBMiUNb
 aYdeFyNv7Oh5q83ZCeegGXkmFQPJief1rBfW76/uD11wLWctFgYWYynkZ+Tze28htF
 3ScskuRr3exh6uXw+3J3hpksHzWB1/1UFq2eG/dA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05QHBEOU025758
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 26 Jun 2020 12:11:14 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 26
 Jun 2020 12:11:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 26 Jun 2020 12:11:13 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05QHB9sn000377;
 Fri, 26 Jun 2020 12:11:10 -0500
Subject: Re: [PATCH v6 2/4] driver core: add deferring probe reason to
 devices_deferred property
To: Andrzej Hajda <a.hajda@samsung.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
References: <20200626100103.18879-1-a.hajda@samsung.com>
 <CGME20200626100110eucas1p2c5b91f2c98a5c6e5739f5af3207d192e@eucas1p2.samsung.com>
 <20200626100103.18879-3-a.hajda@samsung.com>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <5f159e00-44fd-515b-dd8c-4db9845dc9e6@ti.com>
Date: Fri, 26 Jun 2020 20:11:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200626100103.18879-3-a.hajda@samsung.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Sat, 27 Jun 2020 10:12:42 +0000
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, andy.shevchenko@gmail.com,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 26/06/2020 13:01, Andrzej Hajda wrote:
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
>   drivers/base/base.h |  3 +++
>   drivers/base/core.c |  8 ++++++--
>   drivers/base/dd.c   | 23 ++++++++++++++++++++++-
>   3 files changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/base/base.h b/drivers/base/base.h
> index 95c22c0f9036..6954fccab3d7 100644
> --- a/drivers/base/base.h
> +++ b/drivers/base/base.h
> @@ -93,6 +93,7 @@ struct device_private {
>   	struct klist_node knode_class;
>   	struct list_head deferred_probe;
>   	struct device_driver *async_driver;
> +	char *deferred_probe_reason;
>   	struct device *device;
>   	u8 dead:1;
>   };
> @@ -134,6 +135,8 @@ extern void device_release_driver_internal(struct device *dev,
>   extern void driver_detach(struct device_driver *drv);
>   extern int driver_probe_device(struct device_driver *drv, struct device *dev);
>   extern void driver_deferred_probe_del(struct device *dev);
> +extern void device_set_deferred_probe_reson(const struct device *dev,
> +					    struct va_format *vaf);
>   static inline int driver_match_device(struct device_driver *drv,
>   				      struct device *dev)
>   {
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 3a827c82933f..fee047f03681 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -3963,6 +3963,8 @@ define_dev_printk_level(_dev_info, KERN_INFO);
>    * This helper implements common pattern present in probe functions for error
>    * checking: print debug or error message depending if the error value is
>    * -EPROBE_DEFER and propagate error upwards.
> + * In case of -EPROBE_DEFER it sets also defer probe reason, which can be
> + * checked later by reading devices_deferred debugfs attribute.
>    * It replaces code sequence:
>    * 	if (err != -EPROBE_DEFER)
>    * 		dev_err(dev, ...);
> @@ -3984,10 +3986,12 @@ int dev_err_probe(const struct device *dev, int err, const char *fmt, ...)
>   	vaf.fmt = fmt;
>   	vaf.va = &args;
>   
> -	if (err != -EPROBE_DEFER)
> +	if (err != -EPROBE_DEFER) {
>   		dev_err(dev, "error %d: %pV", err, &vaf);
> -	else
> +	} else {
> +		device_set_deferred_probe_reson(dev, &vaf);
>   		dev_dbg(dev, "error %d: %pV", err, &vaf);
> +	}
>   
>   	va_end(args);
>   
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 9a1d940342ac..dd5683b61f74 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -27,6 +27,7 @@
>   #include <linux/async.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/pinctrl/devinfo.h>
> +#include <linux/slab.h>
>   
>   #include "base.h"
>   #include "power/power.h"
> @@ -136,6 +137,8 @@ void driver_deferred_probe_del(struct device *dev)
>   	if (!list_empty(&dev->p->deferred_probe)) {
>   		dev_dbg(dev, "Removed from deferred list\n");
>   		list_del_init(&dev->p->deferred_probe);
> +		kfree(dev->p->deferred_probe_reason);
> +		dev->p->deferred_probe_reason = NULL;
>   	}
>   	mutex_unlock(&deferred_probe_mutex);
>   }
> @@ -211,6 +214,23 @@ void device_unblock_probing(void)
>   	driver_deferred_probe_trigger();
>   }
>   
> +/**
> + * device_set_deferred_probe_reson() - Set defer probe reason message for device
> + * @dev: the pointer to the struct device
> + * @vaf: the pointer to va_format structure with message
> + */
> +void device_set_deferred_probe_reson(const struct device *dev, struct va_format *vaf)
> +{
> +	const char *drv = dev_driver_string(dev);
> +
> +	mutex_lock(&deferred_probe_mutex);
> +
> +	kfree(dev->p->deferred_probe_reason);
> +	dev->p->deferred_probe_reason = kasprintf(GFP_KERNEL, "%s: %pV", drv, vaf);
> +
> +	mutex_unlock(&deferred_probe_mutex);
> +}
> +
>   /*
>    * deferred_devs_show() - Show the devices in the deferred probe pending list.
>    */
> @@ -221,7 +241,8 @@ static int deferred_devs_show(struct seq_file *s, void *data)
>   	mutex_lock(&deferred_probe_mutex);
>   
>   	list_for_each_entry(curr, &deferred_probe_pending_list, deferred_probe)
> -		seq_printf(s, "%s\n", dev_name(curr->device));
> +		seq_printf(s, "%s\t%s", dev_name(curr->device),
> +			   curr->device->p->deferred_probe_reason ?: "\n");
>   
>   	mutex_unlock(&deferred_probe_mutex);
>   
> 

Sry, may be i missing smth, but shouldn't it be optional
(CONFIG_DEBUG_FS is probably too generic).

-- 
Best regards,
grygorii
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
