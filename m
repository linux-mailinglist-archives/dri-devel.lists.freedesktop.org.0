Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F007194DCB9
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 14:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C9310E012;
	Sat, 10 Aug 2024 12:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=t-8ch.de header.i=@t-8ch.de header.b="lLdNfR/p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 385 seconds by postgrey-1.36 at gabe;
 Sat, 10 Aug 2024 12:22:37 UTC
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA0610E012
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 12:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
 t=1723292169; bh=M0XuYlvk64IDGYRv6NB5VVRv8gm1gU+xvL6omOK0J/Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lLdNfR/ptyeqGZyt0AGIApDKyKlkY4MfcpjVmAwvAUlASd4OgVojp89dQ3nlWd0Lr
 /gG975CNGvDwapa7oU0p/a6cH/lXGytXBXRoQa9hCELluGzn8f05HQ3saHV2HgFvtI
 JJcuJmxzsgUNKi1GgLj7z/dO4zMYbpNpOQNwTrsw=
Date: Sat, 10 Aug 2024 14:16:08 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Aditya Garg <gargaditya08@live.com>
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, 
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 Jiri Kosina <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>, 
 Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay <kekrby@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/9] HID: hid-appletb-bl: add driver for the backlight
 of Apple Touch Bars
Message-ID: <9e398f1b-05c2-4dd3-bc56-2b61c6784aef@t-8ch.de>
References: <1368FEE8-58BB-41C9-B9AD-7F2F68FF1D53@live.com>
 <0DDD5C22-A42A-49F2-984C-F3595F71AB1C@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0DDD5C22-A42A-49F2-984C-F3595F71AB1C@live.com>
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

On 2024-08-08 13:50:33+0000, Aditya Garg wrote:
> From: Kerem Karabay <kekrby@gmail.com>
> 
> This commit adds a driver for the backlight of Apple Touch Bars on x86
> Macs. Note that currently only T2 Macs are supported.
> 
> This driver is based on previous work done by Ronald Tschalär
> <ronald@innovation.ch>.
> 
> Signed-off-by: Kerem Karabay <kekrby@gmail.com>
> Co-developed-by: Aditya Garg <gargaditya08@live.com>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>  MAINTAINERS                  |   6 +
>  drivers/hid/Kconfig          |  10 ++
>  drivers/hid/Makefile         |   1 +
>  drivers/hid/hid-appletb-bl.c | 206 +++++++++++++++++++++++++++++++++++
>  drivers/hid/hid-quirks.c     |   4 +-
>  5 files changed, 226 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/hid/hid-appletb-bl.c
> 

<snip>

> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index e40f1ddeb..1d825a474 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_HID_ALPS)		+= hid-alps.o
>  obj-$(CONFIG_HID_ACRUX)		+= hid-axff.o
>  obj-$(CONFIG_HID_APPLE)		+= hid-apple.o
>  obj-$(CONFIG_HID_APPLEIR)	+= hid-appleir.o
> +obj-$(CONFIG_HID_APPLETB_BL)	+= hid-appletb-bl.o
>  obj-$(CONFIG_HID_CREATIVE_SB0540)	+= hid-creative-sb0540.o
>  obj-$(CONFIG_HID_ASUS)		+= hid-asus.o
>  obj-$(CONFIG_HID_AUREAL)	+= hid-aureal.o
> diff --git a/drivers/hid/hid-appletb-bl.c b/drivers/hid/hid-appletb-bl.c
> new file mode 100644
> index 000000000..00bbe45df
> --- /dev/null
> +++ b/drivers/hid/hid-appletb-bl.c
> @@ -0,0 +1,206 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Apple Touch Bar Backlight Driver
> + *
> + * Copyright (c) 2017-2018 Ronald Tschalär
> + * Copyright (c) 2022-2023 Kerem Karabay <kekrby@gmail.com>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

This is unused.

#include <linux/device.h>

> +#include <linux/hid.h>
> +#include <linux/backlight.h>
> +
> +#include "hid-ids.h"
> +
> +#define APPLETB_BL_ON			1
> +#define APPLETB_BL_DIM			3
> +#define APPLETB_BL_OFF			4
> +
> +#define HID_UP_APPLEVENDOR_TB_BL	0xff120000
> +
> +#define HID_VD_APPLE_TB_BRIGHTNESS	0xff120001
> +#define HID_USAGE_AUX1			0xff120020
> +#define HID_USAGE_BRIGHTNESS		0xff120021
> +
> +static int appletb_bl_def_brightness = 2;
> +module_param_named(brightness, appletb_bl_def_brightness, int, 0444);
> +MODULE_PARM_DESC(brightness, "Default brightness:\n"
> +			 "    0 - Touchbar is off\n"
> +			 "    1 - Dim brightness\n"
> +			 "    [2] - Full brightness");
> +
> +struct appletb_bl {
> +	struct hid_field *aux1_field, *brightness_field;
> +	struct backlight_device *bdev;
> +
> +	bool full_on;
> +};
> +
> +const u8 appletb_bl_brightness_map[] = {

static?

> +	APPLETB_BL_OFF,
> +	APPLETB_BL_DIM,
> +	APPLETB_BL_ON

The last element is not a sentinel element, so it should have comma.

> +};
> +
> +static int appletb_bl_set_brightness(struct appletb_bl *bl, u8 brightness)
> +{
> +	struct hid_report *report = bl->brightness_field->report;
> +	struct hid_device *hdev = report->device;
> +	int ret;
> +
> +	ret = hid_set_field(bl->aux1_field, 0, 1);
> +	if (ret) {
> +		hid_err(hdev, "Failed to set auxiliary field (%pe)\n", ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	ret = hid_set_field(bl->brightness_field, 0, brightness);
> +	if (ret) {
> +		hid_err(hdev, "Failed to set brightness field (%pe)\n", ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	if (!bl->full_on) {
> +		ret = hid_hw_power(hdev, PM_HINT_FULLON);
> +		if (ret < 0) {
> +			hid_err(hdev, "Device didn't power on (%pe)\n", ERR_PTR(ret));
> +			return ret;
> +		}
> +
> +		bl->full_on = true;
> +	}
> +
> +	hid_hw_request(hdev, report, HID_REQ_SET_REPORT);
> +
> +	if (brightness == APPLETB_BL_OFF) {
> +		hid_hw_power(hdev, PM_HINT_NORMAL);
> +		bl->full_on = false;
> +	}
> +
> +	return 0;
> +}
> +
> +static int appletb_bl_update_status(struct backlight_device *bdev)
> +{
> +	struct appletb_bl *bl = bl_get_data(bdev);
> +	u16 brightness;
> +
> +	if (bdev->props.state & BL_CORE_SUSPENDED)
> +		brightness = 0;

From backlight.h:

 * backlight drivers are expected to use backlight_is_blank()
 * in their update_status() operation rather than reading the
 * state property.

Seems to be applicable here.

Also the hardcoded "0" as index into appletb_bl_brightness_map could be
avoided by some restructuring.

> +	else
> +		brightness = backlight_get_brightness(bdev);
> +
> +	return appletb_bl_set_brightness(bl, appletb_bl_brightness_map[brightness]);
> +}
> +
> +static const struct backlight_ops appletb_bl_backlight_ops = {
> +	.options = BL_CORE_SUSPENDRESUME,
> +	.update_status = appletb_bl_update_status,
> +};
> +
> +static int appletb_bl_probe(struct hid_device *hdev, const struct hid_device_id *id)
> +{
> +	struct hid_field *aux1_field, *brightness_field;
> +	struct backlight_properties bl_props = { 0 };
> +	struct device *dev = &hdev->dev;
> +	struct appletb_bl *bl;
> +	int ret;
> +
> +	ret = hid_parse(hdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "HID parse failed\n");
> +
> +	aux1_field = hid_find_field(hdev, HID_FEATURE_REPORT,
> +				    HID_VD_APPLE_TB_BRIGHTNESS, HID_USAGE_AUX1);
> +
> +	brightness_field = hid_find_field(hdev, HID_FEATURE_REPORT,
> +					  HID_VD_APPLE_TB_BRIGHTNESS, HID_USAGE_BRIGHTNESS);
> +
> +	if (!aux1_field || !brightness_field)
> +		return -ENODEV;
> +
> +	if (aux1_field->report != brightness_field->report)
> +		return dev_err_probe(dev, -ENODEV, "Encountered unexpected report structure\n");
> +
> +	bl = devm_kzalloc(dev, sizeof(*bl), GFP_KERNEL);
> +	if (!bl)
> +		return -ENOMEM;
> +
> +	ret = hid_hw_start(hdev, HID_CONNECT_DRIVER);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "HID hardware start failed\n");
> +
> +	ret = hid_hw_open(hdev);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "HID hardware open failed\n");
> +		goto stop_hw;
> +	}
> +
> +	bl->aux1_field = aux1_field;
> +	bl->brightness_field = brightness_field;
> +
> +	if (appletb_bl_def_brightness == 0)
> +		ret = appletb_bl_set_brightness(bl, APPLETB_BL_OFF);
> +	else if (appletb_bl_def_brightness == 1)
> +		ret = appletb_bl_set_brightness(bl, APPLETB_BL_DIM);
> +	else
> +		ret = appletb_bl_set_brightness(bl, APPLETB_BL_ON);
> +
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to set touch bar brightness to off\n");
> +		goto close_hw;
> +	}
> +
> +	bl_props.type = BACKLIGHT_RAW;
> +	bl_props.max_brightness = ARRAY_SIZE(appletb_bl_brightness_map) - 1;
> +
> +	bl->bdev = devm_backlight_device_register(dev, "appletb_backlight", dev, bl,
> +						  &appletb_bl_backlight_ops, &bl_props);
> +	if (IS_ERR(bl->bdev)) {
> +		ret = PTR_ERR(bl->bdev);
> +		dev_err_probe(dev, ret, "Failed to register backlight device\n");
> +		goto close_hw;
> +	}
> +
> +	hid_set_drvdata(hdev, bl);
> +
> +	return 0;
> +
> +close_hw:
> +	hid_hw_close(hdev);
> +stop_hw:
> +	hid_hw_stop(hdev);
> +
> +	return ret;
> +}
> +
> +static void appletb_bl_remove(struct hid_device *hdev)
> +{
> +	struct appletb_bl *bl = hid_get_drvdata(hdev);
> +
> +	appletb_bl_set_brightness(bl, APPLETB_BL_OFF);
> +
> +	hid_hw_close(hdev);
> +	hid_hw_stop(hdev);
> +}
> +
> +static const struct hid_device_id appletb_bl_hid_ids[] = {
> +	/* MacBook Pro's 2018, 2019, with T2 chip: iBridge DFR Brightness */
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT) },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(hid, appletb_bl_hid_ids);
> +
> +static struct hid_driver appletb_bl_hid_driver = {
> +	.name = "hid-appletb-bl",
> +	.id_table = appletb_bl_hid_ids,
> +	.probe = appletb_bl_probe,
> +	.remove = appletb_bl_remove,
> +};
> +module_hid_driver(appletb_bl_hid_driver);
> +
> +MODULE_AUTHOR("Ronald Tschalär");
> +MODULE_AUTHOR("Kerem Karabay <kekrby@gmail.com>");
> +MODULE_DESCRIPTION("MacBookPro Touch Bar Backlight Driver");
> +MODULE_LICENSE("GPL");

<snip>
