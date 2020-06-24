Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 937AF20737E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 14:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE19989D81;
	Wed, 24 Jun 2020 12:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AB29F89D81
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 12:37:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D8941F1;
 Wed, 24 Jun 2020 05:37:56 -0700 (PDT)
Received: from [10.57.9.128] (unknown [10.57.9.128])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A71433F6CF;
 Wed, 24 Jun 2020 05:37:53 -0700 (PDT)
Subject: Re: [RESEND PATCH v5 3/5] drivers core: allow probe_err accept
 integer and pointer types
To: Andrzej Hajda <a.hajda@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114136eucas1p1c84f81b1d78e2dbad7ac1b762f0a4b4f@eucas1p1.samsung.com>
 <20200624114127.3016-4-a.hajda@samsung.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <2203e0c2-016b-4dbe-452d-63c857f06dd1@arm.com>
Date: Wed, 24 Jun 2020 13:37:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624114127.3016-4-a.hajda@samsung.com>
Content-Language: en-GB
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

On 2020-06-24 12:41, Andrzej Hajda wrote:
> Many resource acquisition functions return error value encapsulated in
> pointer instead of integer value. To simplify coding we can use macro
> which will accept both types of error.
> With this patch user can use:
> 	probe_err(dev, ptr, ...)
> instead of:
> 	probe_err(dev, PTR_ERR(ptr), ...)
> Without loosing old functionality:
> 	probe_err(dev, err, ...)

Personally I'm not convinced that simplification has much value, and I'd 
say it *does* have a significant downside. This:

	if (IS_ERR(x))
		do_something_with(PTR_ERR(x));

is a familiar and expected pattern when reading/reviewing code, and at a 
glance is almost certainly doing the right thing. If I see this, on the 
other hand:

	if (IS_ERR(x))
		do_something_with(x);

my immediate instinct is to be suspicious, and now I've got to go off 
and double-check that if do_something_with() really expects a pointer 
it's also robust against PTR_ERR values. Off-hand I can't think of any 
APIs that work that way in the areas with which I'm familiar, so it 
would be a pretty unusual and non-obvious thing.

Furthermore, an error helper that explicitly claims to accept "pointer 
type" values seems like it could easily lead to misunderstandings like this:

	int init_my_buffer(struct my_device *d)
	{
		d->buffer = kzalloc(d->buffer_size, GFP_KERNEL);
		return probe_err(d->dev, d->buffer, "failed to init buffer\n");
	}

and allowing that to compile without any hint of an error seems a 
little... unfair.

Robin.

> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>   drivers/base/core.c    | 25 ++-----------------------
>   include/linux/device.h | 25 ++++++++++++++++++++++++-
>   2 files changed, 26 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 2a96954d5460..df283c62d9c0 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -3953,28 +3953,7 @@ define_dev_printk_level(_dev_info, KERN_INFO);
>   
>   #endif
>   
> -/**
> - * probe_err - probe error check and log helper
> - * @dev: the pointer to the struct device
> - * @err: error value to test
> - * @fmt: printf-style format string
> - * @...: arguments as specified in the format string
> - *
> - * This helper implements common pattern present in probe functions for error
> - * checking: print message if the error is not -EPROBE_DEFER and propagate it.
> - * In case of -EPROBE_DEFER it sets defer probe reason, which can be checked
> - * later by reading devices_deferred debugfs attribute.
> - * It replaces code sequence:
> - * 	if (err != -EPROBE_DEFER)
> - * 		dev_err(dev, ...);
> - * 	return err;
> - * with
> - * 	return probe_err(dev, err, ...);
> - *
> - * Returns @err.
> - *
> - */
> -int probe_err(const struct device *dev, int err, const char *fmt, ...)
> +int __probe_err(const struct device *dev, int err, const char *fmt, ...)
>   {
>   	struct va_format vaf;
>   	va_list args;
> @@ -3992,7 +3971,7 @@ int probe_err(const struct device *dev, int err, const char *fmt, ...)
>   
>   	return err;
>   }
> -EXPORT_SYMBOL_GPL(probe_err);
> +EXPORT_SYMBOL_GPL(__probe_err);
>   
>   static inline bool fwnode_is_primary(struct fwnode_handle *fwnode)
>   {
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 40a90d9bf799..22d3c3d4f461 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -965,7 +965,30 @@ void device_links_supplier_sync_state_pause(void);
>   void device_links_supplier_sync_state_resume(void);
>   
>   extern __printf(3, 4)
> -int probe_err(const struct device *dev, int err, const char *fmt, ...);
> +int __probe_err(const struct device *dev, int err, const char *fmt, ...);
> +
> +/**
> + * probe_err - probe error check and log helper
> + * @dev: the pointer to the struct device
> + * @err: error value to test, can be integer or pointer type
> + * @fmt: printf-style format string
> + * @...: arguments as specified in the format string
> + *
> + * This helper implements common pattern present in probe functions for error
> + * checking: print message if the error is not -EPROBE_DEFER and propagate it.
> + * In case of -EPROBE_DEFER it sets defer probe reason, which can be checked
> + * later by reading devices_deferred debugfs attribute.
> + * It replaces code sequence:
> + * 	if (err != -EPROBE_DEFER)
> + * 		dev_err(dev, ...);
> + * 	return err;
> + * with
> + * 	return probe_err(dev, err, ...);
> + *
> + * Returns @err.
> + *
> + */
> +#define probe_err(dev, err, args...) __probe_err(dev, (long)(err), args)
>   
>   /* Create alias, so I can be autoloaded. */
>   #define MODULE_ALIAS_CHARDEV(major,minor) \
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
