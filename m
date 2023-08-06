Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7147A7716D3
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 23:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475A010E12B;
	Sun,  6 Aug 2023 21:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 504 seconds by postgrey-1.36 at gabe;
 Sun, 06 Aug 2023 10:05:54 UTC
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB98F10E0B6
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Aug 2023 10:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
 t=1691315848; bh=UOudPQ3/CO6UhHrP74TKs9Fd6sG7RIO9+W6jZ5EZKi0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hwj4q8X/jYU7lMagWk7uy6UBEsuN65oXebuyeYiheicALLfN3o7K4Z0ZURgDjCwYp
 DJtTf4THoC5fueJi3OLA5dixDLlNr/ptVHEIX9ei33PC+KHz+5+YZ6oCKgcWf9hqbG
 TOu8w0t1iDFeYuRiOHRxzZceVolzOlXeboo9RsvI=
Date: Sun, 6 Aug 2023 11:57:27 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Julius Zint <julius@zint.sh>
Subject: Re: [PATCH v2 1/1] backlight: hid_bl: Add VESA virtual control panel
 HID backlight driver
Message-ID: <c5795366-f018-431d-bea4-a7f7bcc39d9d@t-8ch.de>
References: <20230806091403.10002-1-julius@zint.sh>
 <20230806091403.10002-2-julius@zint.sh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230806091403.10002-2-julius@zint.sh>
X-Mailman-Approved-At: Sun, 06 Aug 2023 21:43:47 +0000
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
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

this should probably also go to the maintainers of the "HID CORE LAYER"
for review:

HID CORE LAYER
M:	Jiri Kosina <jikos@kernel.org>
M:	Benjamin Tissoires <benjamin.tissoires@redhat.com>
L:	linux-input@vger.kernel.org

And maybe it would better fit to be in  drivers/hid/ ?
(Something for the maintainers to figure out)

Some tiny review comments inline.

On 2023-08-06 11:14:03+0200, Julius Zint wrote:
> The HID spec defines the following Usage IDs (p. 345 ff):
> 
> - Monitor Page (0x80) -> Monitor Control (0x01)
> - VESA Virtual Controls Page (0x82) -> Brightness (0x10)
> 
> Apple made use of them in their Apple Studio Display and most likely on
> other external displays (LG UltraFine 5k, Pro Display XDR).
> 
> The driver will work for any HID device with a report, where the
> application matches the Monitor Control Usage ID and:
> 
> 1. An Input field in this report with the Brightness Usage ID (to get
>    the current brightness)
> 2. A Feature field in this report with the Brightness Usage ID (to
>    set the current brightness)
> 
> This driver has been developed and tested with the Apple Studio Display.
> Here is a small excerpt from the decoded HID descriptor showing the
> feature field for setting the brightness:
> 
>   Usage Page (Monitor VESA VCP),  ; Monitor VESA VPC (82h, monitor page)
>   Usage (10h, Brightness),
>   Logical Minimum (400),
>   Logical Maximum (60000),
>   Unit (Centimeter^-2 * Candela),
>   Unit Exponent (14),
>   Report Size (32),
>   Report Count (1),
>   Feature (Variable, Null State),
> 
> The full HID descriptor dump is available as a comment in the source
> code.
> 
> Signed-off-by: Julius Zint <julius@zint.sh>
> ---
>  drivers/video/backlight/Kconfig  |   8 +
>  drivers/video/backlight/Makefile |   1 +
>  drivers/video/backlight/hid_bl.c | 267 +++++++++++++++++++++++++++++++
>  3 files changed, 276 insertions(+)
>  create mode 100644 drivers/video/backlight/hid_bl.c
> 
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
> +
>  endif # BACKLIGHT_CLASS_DEVICE
>  
>  endmenu
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index f72e1c3c59e9..835f9b8772c7 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -58,3 +58,4 @@ obj-$(CONFIG_BACKLIGHT_WM831X)		+= wm831x_bl.o
>  obj-$(CONFIG_BACKLIGHT_ARCXCNN) 	+= arcxcnn_bl.o
>  obj-$(CONFIG_BACKLIGHT_RAVE_SP)		+= rave-sp-backlight.o
>  obj-$(CONFIG_BACKLIGHT_LED)		+= led_bl.o
> +obj-$(CONFIG_BACKLIGHT_HID)		+= hid_bl.o
> diff --git a/drivers/video/backlight/hid_bl.c b/drivers/video/backlight/hid_bl.c
> new file mode 100644
> index 000000000000..1b9cbaa1551c
> --- /dev/null
> +++ b/drivers/video/backlight/hid_bl.c
> @@ -0,0 +1,267 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/device.h>
> +#include <linux/hid.h>
> +#include <linux/module.h>
> +#include <linux/backlight.h>
> +
> +#define APPLE_STUDIO_DISPLAY_VENDOR_ID  0x05ac
> +#define APPLE_STUDIO_DISPLAY_PRODUCT_ID 0x1114
> +
> +#define HID_USAGE_MONITOR_CTRL			0x800001
> +#define HID_USAGE_VESA_VCP_BRIGHTNESS		0x820010
> +
> +/*
> + * Apple Studio Display HID report descriptor
> + *
> + * Usage Page (Monitor),               ; USB monitor (80h, monitor page)
> + * Usage (01h),
> + * Collection (Application),
> + *     Report ID (1),
> + *
> + *     Usage Page (Monitor VESA VCP),  ; Monitor VESA virtual control panel (82h, monitor page)
> + *     Usage (10h, Brightness),
> + *     Logical Minimum (400),
> + *     Logical Maximum (60000),
> + *     Unit (Centimeter^-2 * Candela),
> + *     Unit Exponent (14),
> + *     Report Size (32),
> + *     Report Count (1),
> + *     Feature (Variable, Null State),
> + *
> + *     Usage Page (PID),               ; Physical interface device (0Fh)
> + *     Usage (50h),
> + *     Logical Minimum (0),
> + *     Logical Maximum (20000),
> + *     Unit (1001h),
> + *     Unit Exponent (13),
> + *     Report Size (16),
> + *     Feature (Variable, Null State),
> + *
> + *     Usage Page (Monitor VESA VCP),  ; Monitor VESA virtual control panel (82h, monitor page)
> + *     Usage (10h, Brightness),
> + *     Logical Minimum (400),
> + *     Logical Maximum (60000),
> + *     Unit (Centimeter^-2 * Candela),
> + *     Unit Exponent (14),
> + *     Report Size (32),
> + *     Report Count (1),
> + *     Input (Variable),
> + * End Collection
> + */
> +
> +struct hid_bl_data {
> +	struct hid_device *hdev;
> +	unsigned int min_brightness;
> +	unsigned int max_brightness;
> +	struct hid_field *input_field;
> +	struct hid_field *feature_field;
> +};
> +
> +static struct hid_field *hid_get_usage_field(struct hid_device *hdev,
> +					     unsigned int report_type,
> +					     unsigned int application, unsigned int usage)
> +{
> +	struct hid_report_enum *re = &hdev->report_enum[report_type];
> +	struct hid_report *report;
> +	int i, j;
> +
> +	list_for_each_entry(report, &re->report_list, list) {
> +		if (report->application != application)
> +			continue;
> +
> +		for (i = 0; i < report->maxfield; i++) {
> +			struct hid_field *field = report->field[i];
> +
> +			for (j = 0; j < field->maxusage; j++)
> +				if (field->usage[j].hid == usage)
> +					return field;
> +		}
> +	}
> +	return NULL;
> +}
> +
> +static void hid_bl_remove(struct hid_device *hdev)
> +{
> +	struct backlight_device *bl;
> +	struct hid_bl_data *data;
> +
> +	hid_dbg(hdev, "remove\n");
> +	bl = hid_get_drvdata(hdev);
> +	data = bl_get_data(bl);
> +
> +	devm_backlight_device_unregister(&hdev->dev, bl);
> +	hid_hw_close(hdev);
> +	hid_hw_stop(hdev);
> +	hid_set_drvdata(hdev, NULL);
> +	devm_kfree(&hdev->dev, data);

Are these explicit devm_ cleanups needed, shouldn't the driver core take
care of it?
I'm not sure myself.

> +}
> +
> +static int hid_get_brightness(struct hid_bl_data *data)
> +{
> +	struct hid_field *field;
> +	int result;
> +
> +	field = data->input_field;
> +	hid_hw_request(data->hdev, field->report, HID_REQ_GET_REPORT);
> +	hid_hw_wait(data->hdev);
> +	result = *field->new_value;
> +	hid_dbg(data->hdev, "get brightness: %d\n", result);
> +
> +	return result;
> +}
> +
> +static int hid_bl_get_brightness(struct backlight_device *bl)
> +{
> +	struct hid_bl_data *data;
> +	int brightness;
> +
> +	data = bl_get_data(bl);
> +	brightness = hid_get_brightness(data);
> +	return brightness - data->min_brightness;
> +}
> +
> +static void hid_set_brightness(struct hid_bl_data *data, int brightness)

Some functions are using the generic hid_ prefix instead of the more
specific hid_bl_, is that intentional?

> +{
> +	struct hid_field *field;
> +
> +	field = data->feature_field;
> +	*field->value = brightness;
> +	hid_hw_request(data->hdev, field->report, HID_REQ_SET_REPORT);
> +	hid_hw_wait(data->hdev);
> +	hid_dbg(data->hdev, "set brightness: %d\n", brightness);
> +}
> +
> +static int hid_bl_update_status(struct backlight_device *bl)
> +{
> +	struct hid_bl_data *data;
> +	int brightness;
> +
> +	data = bl_get_data(bl);
> +	brightness = backlight_get_brightness(bl);
> +	brightness += data->min_brightness;
> +	hid_set_brightness(data, brightness);
> +	return 0;
> +}
> +
> +static const struct backlight_ops hid_bl_ops = {
> +	.update_status  = hid_bl_update_status,
> +	.get_brightness = hid_bl_get_brightness,
> +};
> +
> +static int hid_bl_probe(struct hid_device *hdev, const struct hid_device_id *id)
> +{
> +	int ret;
> +	struct hid_field *input_field;
> +	struct hid_field *feature_field;
> +	struct hid_bl_data *data;
> +	struct backlight_properties props;
> +	struct backlight_device *bl;
> +
> +	hid_dbg(hdev, "probe\n");
> +
> +	ret = hid_parse(hdev);
> +	if (ret)
> +		hid_err(hdev, "parse failed\n");

If this fails should the probe continue?

The errorcodes would be useful to log, too.
(Also in other places)

> +
> +	ret = hid_hw_start(hdev, HID_CONNECT_DRIVER);
> +	if (ret) {
> +		hid_err(hdev, "hw start failed\n");
> +		return ret;
> +	}
> +
> +	input_field = hid_get_usage_field(hdev, HID_INPUT_REPORT,
> +					  HID_USAGE_MONITOR_CTRL,
> +					  HID_USAGE_VESA_VCP_BRIGHTNESS);
> +	if (input_field == NULL) {
> +		ret = -ENODEV;
> +		goto exit_stop;
> +	}
> +
> +	feature_field = hid_get_usage_field(hdev, HID_FEATURE_REPORT,
> +					    HID_USAGE_MONITOR_CTRL,
> +					    HID_USAGE_VESA_VCP_BRIGHTNESS);
> +	if (feature_field == NULL) {
> +		ret = -ENODEV;
> +		goto exit_stop;
> +	}
> +
> +	if (input_field->logical_minimum != feature_field->logical_minimum) {
> +		hid_warn(hdev, "minimums do not match: %d / %d\n",
> +			 input_field->logical_minimum,
> +			 feature_field->logical_minimum);
> +		ret = -ENODEV;
> +		goto exit_stop;
> +	}
> +
> +	if (input_field->logical_maximum != feature_field->logical_maximum) {
> +		hid_warn(hdev, "maximums do not match: %d / %d\n",
> +			 input_field->logical_maximum,
> +			 feature_field->logical_maximum);
> +		ret = -ENODEV;
> +		goto exit_stop;
> +	}
> +
> +	hid_dbg(hdev, "Monitor VESA VCP with brightness control\n");
> +
> +	ret = hid_hw_open(hdev);
> +	if (ret) {
> +		hid_err(hdev, "hw open failed\n");
> +		goto exit_stop;
> +	}
> +
> +	data = devm_kzalloc(&hdev->dev, sizeof(struct hid_bl_data), GFP_KERNEL);

sizeof(*data)

> +	if (data == NULL) {
> +		ret = -ENOMEM;
> +		goto exit_stop;
> +	}
> +	data->hdev = hdev;
> +	data->min_brightness = input_field->logical_minimum;
> +	data->max_brightness = input_field->logical_maximum;
> +	data->input_field = input_field;
> +	data->feature_field = feature_field;
> +
> +	memset(&props, 0, sizeof(props));
> +	props.type = BACKLIGHT_RAW;
> +	props.max_brightness = data->max_brightness - data->min_brightness;
> +
> +	bl = devm_backlight_device_register(&hdev->dev, "vesa_vcp",
> +					    &hdev->dev, data,
> +					    &hid_bl_ops,
> +					    &props);
> +	if (IS_ERR(bl)) {
> +		hid_err(hdev, "failed to register backlight\n");
> +		ret = PTR_ERR(bl);
> +		goto exit_free;
> +	}
> +
> +	hid_set_drvdata(hdev, bl);
> +
> +	return 0;
> +
> +exit_free:
> +	hid_hw_close(hdev);
> +	devm_kfree(&hdev->dev, data);
> +
> +exit_stop:
> +	hid_hw_stop(hdev);
> +	return ret;
> +}
> +
> +static const struct hid_device_id hid_bl_devices[] = {
> +	{ HID_USB_DEVICE(APPLE_STUDIO_DISPLAY_VENDOR_ID,
> +			 APPLE_STUDIO_DISPLAY_PRODUCT_ID) },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(hid, hid_bl_devices);
> +
> +static struct hid_driver hid_bl_driver = {
> +	.name = "hid_backlight",
> +	.id_table = hid_bl_devices,
> +	.probe = hid_bl_probe,
> +	.remove = hid_bl_remove,
> +};
> +module_hid_driver(hid_bl_driver);
> +
> +MODULE_AUTHOR("Julius Zint <julius@zint.sh>");
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Backlight driver for HID devices");
> -- 
> 2.41.0
> 
