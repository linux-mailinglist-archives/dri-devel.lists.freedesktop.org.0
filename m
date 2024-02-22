Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFA5860547
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 22:58:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8169C10EA9F;
	Thu, 22 Feb 2024 21:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 963 seconds by postgrey-1.36 at gabe;
 Thu, 22 Feb 2024 21:58:19 UTC
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi
 [62.142.5.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D694510EA9F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 21:58:19 +0000 (UTC)
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
 by fgw20.mail.saunalahti.fi (Halon) with ESMTP
 id 3c868ecd-d1cb-11ee-b3cf-005056bd6ce9;
 Thu, 22 Feb 2024 23:42:13 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Thu, 22 Feb 2024 23:42:11 +0200
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Aleksandr Mezin <mezin.alexander@gmail.com>,
 Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-gpio@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 George Stark <gnstark@salutedevices.com>
Subject: Re: [PATCH 1/2] devm-helpers: Add resource managed version of mutex
 init
Message-ID: <Zde_s8iecR2ArKjC@surfacebook.localdomain>
References: <20240222145838.12916-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240222145838.12916-1-kabel@kernel.org>
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

Thu, Feb 22, 2024 at 03:58:37PM +0100, Marek Behún kirjoitti:
> A few drivers are doing resource-managed mutex initialization by
> implementing ad-hoc one-liner mutex dropping functions and using them
> with devm_add_action_or_reset(). Help drivers avoid these repeated
> one-liners by adding managed version of mutex initialization.
> 
> Use the new function devm_mutex_init() in the following drivers:
>   drivers/gpio/gpio-pisosr.c
>   drivers/gpio/gpio-sim.c
>   drivers/gpu/drm/xe/xe_hwmon.c
>   drivers/hwmon/nzxt-smart2.c
>   drivers/leds/leds-is31fl319x.c
>   drivers/power/supply/mt6370-charger.c
>   drivers/power/supply/rt9467-charger.c

Pardon me, but why?

https://lore.kernel.org/linux-leds/20231214173614.2820929-1-gnstark@salutedevices.com/

Can you cooperate, folks, instead of doing something independently?


> --- a/include/linux/devm-helpers.h
> +++ b/include/linux/devm-helpers.h
> @@ -24,6 +24,8 @@
>   */
>  
>  #include <linux/device.h>
> +#include <linux/kconfig.h>
> +#include <linux/mutex.h>
>  #include <linux/workqueue.h>
>  
>  static inline void devm_delayed_work_drop(void *res)
> @@ -76,4 +78,34 @@ static inline int devm_work_autocancel(struct device *dev,
>  	return devm_add_action(dev, devm_work_drop, w);
>  }
>  
> +static inline void devm_mutex_drop(void *res)
> +{
> +	mutex_destroy(res);
> +}
> +
> +/**
> + * devm_mutex_init - Resource managed mutex initialization
> + * @dev:	Device which lifetime mutex is bound to
> + * @lock:	Mutex to be initialized (and automatically destroyed)
> + *
> + * Initialize mutex which is automatically destroyed when driver is detached.
> + * A few drivers initialize mutexes which they want destroyed before driver is
> + * detached, for debugging purposes.
> + * devm_mutex_init() can be used to omit the explicit mutex_destroy() call when
> + * driver is detached.
> + */
> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
> +{
> +	mutex_init(lock);
> +
> +	/*
> +	 * mutex_destroy() is an empty function if CONFIG_DEBUG_MUTEXES is
> +	 * disabled. No need to allocate an action in that case.
> +	 */
> +	if (IS_ENABLED(CONFIG_DEBUG_MUTEXES))
> +		return devm_add_action_or_reset(dev, devm_mutex_drop, lock);
> +	else
> +		return 0;
> +}

Cc: George Stark <gnstark@salutedevices.com>

-- 
With Best Regards,
Andy Shevchenko


