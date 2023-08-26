Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C13789C14
	for <lists+dri-devel@lfdr.de>; Sun, 27 Aug 2023 10:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41F810E174;
	Sun, 27 Aug 2023 08:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476EA10E02B
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 10:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
 t=1693044950; bh=PnvzGxtclCb9TxkP/3PB4DGO6+FyzrMczE9z63c14OU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c8YfexUMXelmyffaROif3m7Hs/CoMOPtfjOxzp/pvJ2H4SDV1NESIuOa1LWwJK0p7
 BvrwbwmYpOWXzMmN7/dMIkXZpyi/nVE8gZjffUtJmF0gIlfDQhzn8JxQVislnikCNU
 ylclk5xx3BYNGm2fmkxs5ElXZtfaSBDodqJcCWOs=
Date: Sat, 26 Aug 2023 12:15:49 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Julius Zint <julius@zint.sh>
Subject: Re: [PATCH v3 1/1] backlight: hid_bl: Add VESA VCP HID backlight
 driver
Message-ID: <9f7475eb-7e57-45cf-9854-90fb4e8da8a0@t-8ch.de>
References: <20230820094118.20521-1-julius@zint.sh>
 <20230820094118.20521-2-julius@zint.sh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230820094118.20521-2-julius@zint.sh>
X-Mailman-Approved-At: Sun, 27 Aug 2023 08:16:19 +0000
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jiri Kosina <jikos@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-fbdev@vger.kernel.org, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-08-20 11:41:18+0200, Julius Zint wrote:
> [..]

> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 51387b1ef012..b964a820956d 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -472,6 +472,14 @@ config BACKLIGHT_LED
>  	  If you have a LCD backlight adjustable by LED class driver, say Y
>  	  to enable this driver.
>  
> +config BACKLIGHT_HID
> +	tristate "VESA VCP HID Backlight Driver"
> +	depends on HID
> +	help
> +	  If you have an external display with VESA compliant HID brightness
> +	  controls then say Y to enable this backlight driver. Currently the
> +	  only supported device is the Apple Studio Display.

Is the last sentence needed?
It will go out of date soon, requiring updates to the Kconfig.

> +
>  endif # BACKLIGHT_CLASS_DEVICE
>  
>  endmenu

> [..]

> diff --git a/drivers/video/backlight/hid_bl.c b/drivers/video/backlight/hid_bl.c
> new file mode 100644
> index 000000000000..b40f8f412ee2
> --- /dev/null
> +++ b/drivers/video/backlight/hid_bl.c
> @@ -0,0 +1,269 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/device.h>
> +#include <linux/hid.h>
> +#include <linux/module.h>
> +#include <linux/backlight.h>
> +
> +#define APPLE_STUDIO_DISPLAY_VENDOR_ID  0x05ac
> +#define APPLE_STUDIO_DISPLAY_PRODUCT_ID 0x1114

Use hid-ids.h.  The vendor ID already has an entry.

> +
> +#define HID_USAGE_MONITOR_CTRL			0x800001
> +#define HID_USAGE_VESA_VCP_BRIGHTNESS		0x820010

> [..]

> +static int hid_bl_probe(struct hid_device *hdev, const struct hid_device_id *id)
> +{

> [..]

> +
> +	memset(&props, 0, sizeof(props));
> +	props.type = BACKLIGHT_RAW;

Wouldn't this be more a BACKLIGHT_FIRMWARE?

> +	props.max_brightness = data->max_brightness - data->min_brightness;
> +
> +	bl = devm_backlight_device_register(&hdev->dev, "vesa_vcp",

It's non-obvious that the "vesa_vcp" backlight comes from the
"hid_backlight" driver. Maybe align the names.

What happens when multiple compatible devices are used?
That seems to be possible with external monitors.

Can existing userspace figure out which display the backlight device
belongs to?
(I don't know either)

> +					    &hdev->dev, data,
> +					    &hid_bl_ops,
> +					    &props);

> [..]
