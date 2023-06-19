Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B623734BA1
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 08:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4363010E0D1;
	Mon, 19 Jun 2023 06:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46DF10E0A5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 06:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1687155464; x=1687760264; i=deller@gmx.de;
 bh=j8Su5wMzjOPPSISVkkcHhs9OHS/mzcKPAPEPXyKxmT8=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=i/5px73n5/VDTfsEOt2YRWJJzuZn8xysFfjA1D7cNTVMqulJ+dQLoVvkaejRZmA/0FQ+btc
 s/bnn7/hzLRuppWuMOEffBvGu8cDOfy6kHOJ6NodN0Eatz3vBZvvFXKnVVEe3Yo/4pSJhKKcz
 2fC4lVGo25rB7iNTh0mJMSHjXxn4b9S2hZE4qQ/sUPbukc9+nBpO8gLykrS13F0hydqXqRVbO
 qlsHFHW2Bn2nysYTD196FpSNrwbz4YHhT/TmAvGhAPWOzC4ls6nAEt2b+QlEZB/mrKUo7DpLX
 KWALrG3iOcRRKW449A7XTKPup5bDtNgf/AoxUn35t3cDLw7uXq9w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.144.204]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTABT-1qXJOp1mZz-00Uefs; Mon, 19
 Jun 2023 08:17:44 +0200
Message-ID: <25586376-7733-f6c9-613d-a29054d09bc1@gmx.de>
Date: Mon, 19 Jun 2023 08:17:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] fbdev/media: Use GPIO descriptors for VIA GPIO
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet
 <corbet@lwn.net>, Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20230613063314.736889-1-linus.walleij@linaro.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230613063314.736889-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5asyLdlKDXvFF5fyvHchqMvm8GqGrClcs1ha1HuIuNDxfaCWWfY
 Wvib+9885q4qwDU4iqZvOeUzBEh+rI9mQOWlHCppnYp7l75pat9lS1UdFUuiqkcRmcksbPv
 nxx2P1cuP61Pf7kFyxXXeynnglqZ8Hh6EPuzEymqtndaOxHz2s6FBCD1KdpwCsqfYo+EEqP
 FMKoSnJgtEnCBK5GfbZUQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kNvd5mZPcnY=;whMfjcgVe2jwNYOwyVa7dff2Xzk
 fyODUZq5g2ekSRvgMei5RaNPY06vIQK163coEx/SJ1YTa6R/O+wK/x/IXxrODWpkSAdqP6H43
 BLgP6JDajoUs1NBCXh6dTW4FmqXeGw+po6xpsYTbsUiVjegIS5yAH4BPz/JdaSlbNCJntidle
 Vet1SU1eKCnjYaq1eA/9VdF43JMYLztd2PlmknsfYOdOgTy/4Dmb41uGADDgfZ7QbNuil5glB
 VmjxEYb2FCBM9pcILpWWVeMlK4wTH9djea9CK+R8MtKerfV0f5dYeu9gNPELML4apX6URL4wi
 Lf0sU538lwFiiF6T1yRcBt1zocLrwrEfQ9u1MX2LTxCa/SotXelFsPIZpo7zIrsgM5mqR88SA
 wBWMQAcp2F8DFJjuTpeUMbxWwvEKeArc1NFIHgVZhi4Vyi4nT/i5j4TA8fbnwnQylM7SGrY81
 WOvO5J67pWzsRss5w43m6nNTEafzOprUhzm4x+ndcEx6/4BvpHZZXegdgcbjKm8di/xoFj2yX
 LVxRKMVv/Okryhig48YGCmPmQT+kC+wZFYJy3DWRIEtQFb+onjA0HM4S3emTgb0QM46Uk4h7e
 cqgHdHb86xl9MpNb4F7KLl4WMVe9+bmmiUs9cL8XzYcdx8ttzZr7zSop9/PkhmZVrhcDInel2
 EuayE5Yfcb73krR6ne8sWmX78xXBYFQ1s4NEsNBgOIh3gw/nS6Nw+0V7rtULuAhFLFiJLb4iU
 v81n8XoTL5uVbyCClXzhzZgT4MbYuJbu4HDo76s1d7ZO0tp3fRL4fWxJPpYl97W4oC4G9q5Uo
 OMKd2lyrlZTg3ktuAJVbnPn8dpUDBhX3mYI/q9QaJ8GUdCxd16cRuqAGEPzntT/XOIYwhRAou
 VP8U0I245aEQ5RZ0KoTfsHZyv0I1QmfgtY1LLkL8Is+suCDya44x/DjHST1QyEGJtyguzzzMb
 pOqW/YZMUOfaJBIrZtYUtpczGnA=
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/13/23 08:33, Linus Walleij wrote:
> The VIA fbdev exposes a custom GPIO chip for its GPIOs, these
> are in turn looked up the camera driver using a custom API.
>
> Drop the custom API, provide a look-up table and convert to
> GPIO descriptors. Note proper polarity on the RESET line.
>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Fix a missed include (I guess I had an old compiled
>    object that just worked...)
>
> I don't know about the merge path for this one, let's merge
> it in the provider (fbdev) if possible.

I've applied it to the fbdev git tree.

Thanks!
Helge



> This looks like OLPC stuff.
> ---
>   drivers/media/platform/via/via-camera.c       | 51 ++++++++-----------
>   drivers/video/fbdev/via/via-core.c            |  2 +-
>   drivers/video/fbdev/via/via-gpio.c            | 28 +++++-----
>   .../video/fbdev/via}/via-gpio.h               |  1 -
>   4 files changed, 35 insertions(+), 47 deletions(-)
>   rename {include/linux =3D> drivers/video/fbdev/via}/via-gpio.h (84%)
>
> diff --git a/drivers/media/platform/via/via-camera.c b/drivers/media/pla=
tform/via/via-camera.c
> index 450254403fa8..4cb8f29e2f14 100644
> --- a/drivers/media/platform/via/via-camera.c
> +++ b/drivers/media/platform/via/via-camera.c
> @@ -11,7 +11,7 @@
>   #include <linux/device.h>
>   #include <linux/list.h>
>   #include <linux/pci.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/interrupt.h>
>   #include <linux/platform_device.h>
>   #include <linux/videodev2.h>
> @@ -26,7 +26,6 @@
>   #include <linux/dma-mapping.h>
>   #include <linux/pm_qos.h>
>   #include <linux/via-core.h>
> -#include <linux/via-gpio.h>
>   #include <linux/via_i2c.h>
>
>   #ifdef CONFIG_X86
> @@ -71,8 +70,8 @@ struct via_camera {
>   	/*
>   	 * GPIO info for power/reset management
>   	 */
> -	int power_gpio;
> -	int reset_gpio;
> +	struct gpio_desc *power_gpio;
> +	struct gpio_desc *reset_gpio;
>   	/*
>   	 * I/O memory stuff.
>   	 */
> @@ -180,27 +179,19 @@ static struct via_format *via_find_format(u32 pixe=
lformat)
>    */
>   static int via_sensor_power_setup(struct via_camera *cam)
>   {
> -	int ret;
> +	struct device *dev =3D &cam->platdev->dev;
> +
> +	cam->power_gpio =3D devm_gpiod_get(dev, "VGPIO3", GPIOD_OUT_LOW);
> +	if (IS_ERR(cam->power_gpio))
> +		return dev_err_probe(dev, PTR_ERR(cam->power_gpio),
> +				     "failed to get power GPIO");
> +
> +	/* Request the reset line asserted */
> +	cam->reset_gpio =3D devm_gpiod_get(dev, "VGPIO2", GPIOD_OUT_HIGH);
> +	if (IS_ERR(cam->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(cam->reset_gpio),
> +				     "failed to get reset GPIO");
>
> -	cam->power_gpio =3D viafb_gpio_lookup("VGPIO3");
> -	cam->reset_gpio =3D viafb_gpio_lookup("VGPIO2");
> -	if (!gpio_is_valid(cam->power_gpio) || !gpio_is_valid(cam->reset_gpio)=
) {
> -		dev_err(&cam->platdev->dev, "Unable to find GPIO lines\n");
> -		return -EINVAL;
> -	}
> -	ret =3D gpio_request(cam->power_gpio, "viafb-camera");
> -	if (ret) {
> -		dev_err(&cam->platdev->dev, "Unable to request power GPIO\n");
> -		return ret;
> -	}
> -	ret =3D gpio_request(cam->reset_gpio, "viafb-camera");
> -	if (ret) {
> -		dev_err(&cam->platdev->dev, "Unable to request reset GPIO\n");
> -		gpio_free(cam->power_gpio);
> -		return ret;
> -	}
> -	gpio_direction_output(cam->power_gpio, 0);
> -	gpio_direction_output(cam->reset_gpio, 0);
>   	return 0;
>   }
>
> @@ -209,25 +200,23 @@ static int via_sensor_power_setup(struct via_camer=
a *cam)
>    */
>   static void via_sensor_power_up(struct via_camera *cam)
>   {
> -	gpio_set_value(cam->power_gpio, 1);
> -	gpio_set_value(cam->reset_gpio, 0);
> +	gpiod_set_value(cam->power_gpio, 1);
> +	gpiod_set_value(cam->reset_gpio, 1);
>   	msleep(20);  /* Probably excessive */
> -	gpio_set_value(cam->reset_gpio, 1);
> +	gpiod_set_value(cam->reset_gpio, 0);
>   	msleep(20);
>   }
>
>   static void via_sensor_power_down(struct via_camera *cam)
>   {
> -	gpio_set_value(cam->power_gpio, 0);
> -	gpio_set_value(cam->reset_gpio, 0);
> +	gpiod_set_value(cam->power_gpio, 0);
> +	gpiod_set_value(cam->reset_gpio, 1);
>   }
>
>
>   static void via_sensor_power_release(struct via_camera *cam)
>   {
>   	via_sensor_power_down(cam);
> -	gpio_free(cam->power_gpio);
> -	gpio_free(cam->reset_gpio);
>   }
>
>   /* -------------------------------------------------------------------=
-------*/
> diff --git a/drivers/video/fbdev/via/via-core.c b/drivers/video/fbdev/vi=
a/via-core.c
> index 2c1803eb196f..908524a74a38 100644
> --- a/drivers/video/fbdev/via/via-core.c
> +++ b/drivers/video/fbdev/via/via-core.c
> @@ -11,7 +11,7 @@
>   #include <linux/aperture.h>
>   #include <linux/via-core.h>
>   #include <linux/via_i2c.h>
> -#include <linux/via-gpio.h>
> +#include "via-gpio.h"
>   #include "global.h"
>
>   #include <linux/module.h>
> diff --git a/drivers/video/fbdev/via/via-gpio.c b/drivers/video/fbdev/vi=
a/via-gpio.c
> index f1b670397c02..2719943c06f4 100644
> --- a/drivers/video/fbdev/via/via-gpio.c
> +++ b/drivers/video/fbdev/via/via-gpio.c
> @@ -7,10 +7,11 @@
>
>   #include <linux/spinlock.h>
>   #include <linux/gpio/driver.h>
> +#include <linux/gpio/machine.h>
>   #include <linux/platform_device.h>
>   #include <linux/via-core.h>
> -#include <linux/via-gpio.h>
>   #include <linux/export.h>
> +#include "via-gpio.h"
>
>   /*
>    * The ports we know about.  Note that the port-25 gpios are not
> @@ -189,19 +190,14 @@ static struct viafb_pm_hooks viafb_gpio_pm_hooks =
=3D {
>   };
>   #endif /* CONFIG_PM */
>
> -/*
> - * Look up a specific gpio and return the number it was assigned.
> - */
> -int viafb_gpio_lookup(const char *name)
> -{
> -	int i;
> -
> -	for (i =3D 0; i < viafb_gpio_config.gpio_chip.ngpio; i++)
> -		if (!strcmp(name, viafb_gpio_config.active_gpios[i]->vg_name))
> -			return viafb_gpio_config.gpio_chip.base + i;
> -	return -1;
> -}
> -EXPORT_SYMBOL_GPL(viafb_gpio_lookup);
> +static struct gpiod_lookup_table viafb_gpio_table =3D {
> +	.dev_id =3D "viafb-camera",
> +	.table =3D {
> +		GPIO_LOOKUP("via-gpio", 2, "VGPIO2", GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP("via-gpio", 3, "VGPIO3", GPIO_ACTIVE_HIGH),
> +		{ }
> +	},
> +};
>
>   /*
>    * Platform device stuff.
> @@ -249,12 +245,16 @@ static int viafb_gpio_probe(struct platform_device=
 *platdev)
>   	 * Get registered.
>   	 */
>   	viafb_gpio_config.gpio_chip.base =3D -1;  /* Dynamic */
> +	viafb_gpio_config.gpio_chip.label =3D "via-gpio";
>   	ret =3D gpiochip_add_data(&viafb_gpio_config.gpio_chip,
>   				&viafb_gpio_config);
>   	if (ret) {
>   		printk(KERN_ERR "viafb: failed to add gpios (%d)\n", ret);
>   		viafb_gpio_config.gpio_chip.ngpio =3D 0;
>   	}
> +
> +	gpiod_add_lookup_table(&viafb_gpio_table);
> +
>   #ifdef CONFIG_PM
>   	viafb_pm_register(&viafb_gpio_pm_hooks);
>   #endif
> diff --git a/include/linux/via-gpio.h b/drivers/video/fbdev/via/via-gpio=
.h
> similarity index 84%
> rename from include/linux/via-gpio.h
> rename to drivers/video/fbdev/via/via-gpio.h
> index ac34668fd442..2ffedf282f7e 100644
> --- a/include/linux/via-gpio.h
> +++ b/drivers/video/fbdev/via/via-gpio.h
> @@ -8,7 +8,6 @@
>   #ifndef __VIA_GPIO_H__
>   #define __VIA_GPIO_H__
>
> -extern int viafb_gpio_lookup(const char *name);
>   extern int viafb_gpio_init(void);
>   extern void viafb_gpio_exit(void);
>   #endif

