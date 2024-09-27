Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1C2988868
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 17:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06E210E221;
	Fri, 27 Sep 2024 15:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="twUpRTJf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796CB10E221
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 15:39:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BABB75C5F2C;
 Fri, 27 Sep 2024 15:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDDCC4CEC4;
 Fri, 27 Sep 2024 15:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727451550;
 bh=MfMhGynU4JvxQVteRfbW8LAV4G55LKO/5OpCwaX9w0w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=twUpRTJfy6Z4b9NHI5mYsH7NhFHIljHDYjs+Ea9xre+kBESToco94DothumvXG4sS
 /jTNKQ5hS1oTTXJ4/fqZyWAbkaDbhpDc6vwd43weyUX7lLo6YwUfhqrH4G50pVpsdp
 hj1NqUpmMl2rCm6xzXr7v8vIIDBGnm9LPQ+wRaJGgMdXmeBoUoWwo86KPmzSttDuzo
 1iY+cHdNHzABI+9TW/kuDo1nCE7PyYzcqc2YpOjwsAnn0/88QfaB3ib/EEaOv5fiwq
 Kv4nxCCgcWYY4TT+7Y9QjonVFmmrMLiglalSAEvff7Zd99Fwwrzvxa99e6dwsN7K1+
 OIFFbl9YXsQTg==
Date: Fri, 27 Sep 2024 17:39:03 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, 
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 Jiri Kosina <jikos@kernel.org>,
 Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
 Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay <kekrby@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/10] HID: hid-appletb-kbd: add driver for the
 keyboard mode
Message-ID: <i4kn5ftusya5ins2gliea33gkfsoubd6cxcy7lhw5zpxsww4ct@m5cg7prilvfj>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <0B505E00-A1D6-4D0E-BE04-311E231874C5@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0B505E00-A1D6-4D0E-BE04-311E231874C5@live.com>
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

On Aug 17 2024, Aditya Garg wrote:
> From: Kerem Karabay <kekrby@gmail.com>
> 
> The Touch Bars found on x86 Macs support two USB configurations: one
> where the device presents itself as a HID keyboard and can display
> predefined sets of keys, and one where the operating system has full
> control over what is displayed. This commit adds a driver for the
> display functionality of the first configuration.
> 
> Note that currently only T2 Macs are supported.
> 
> This driver is based on previous work done by Ronald Tschal�r
> <ronald@innovation.ch>.
> 
> Signed-off-by: Kerem Karabay <kekrby@gmail.com>
> Co-developed-by: Aditya Garg <gargaditya08@live.com>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>  .../ABI/testing/sysfs-driver-hid-appletb-kbd  |  13 +
>  drivers/hid/Kconfig                           |  11 +
>  drivers/hid/Makefile                          |   1 +
>  drivers/hid/hid-appletb-kbd.c                 | 304 ++++++++++++++++++
>  drivers/hid/hid-quirks.c                      |   4 +-
>  5 files changed, 332 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
>  create mode 100644 drivers/hid/hid-appletb-kbd.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd b/Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
> new file mode 100644
> index 000000000..2a19584d0
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
> @@ -0,0 +1,13 @@
> +What:		/sys/bus/hid/drivers/hid-appletb-kbd/<dev>/mode
> +Date:		September, 2023
> +KernelVersion:	6.5
> +Contact:	linux-input@vger.kernel.org
> +Description:
> +		The set of keys displayed on the Touch Bar.
> +		Valid values are:
> +		== =================
> +		0  Escape key only
> +		1  Function keys
> +		2  Media/brightness keys
> +		3  None
> +		== =================
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 4988c1fb2..72b665eda 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -158,6 +158,17 @@ config HID_APPLETB_BL
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called hid-appletb-bl.
>  
> +config HID_APPLETB_KBD
> +	tristate "Apple Touch Bar Keyboard Mode"
> +	depends on USB_HID
> +	help
> +	  Say Y here if you want support for the keyboard mode (escape,
> +	  function, media and brightness keys) of Touch Bars on x86 MacBook
> +	  Pros.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called hid-appletb-kbd.
> +
>  config HID_ASUS
>  	tristate "Asus"
>  	depends on USB_HID
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index 1d825a474..d903c9a26 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -30,6 +30,7 @@ obj-$(CONFIG_HID_ACRUX)		+= hid-axff.o
>  obj-$(CONFIG_HID_APPLE)		+= hid-apple.o
>  obj-$(CONFIG_HID_APPLEIR)	+= hid-appleir.o
>  obj-$(CONFIG_HID_APPLETB_BL)	+= hid-appletb-bl.o
> +obj-$(CONFIG_HID_APPLETB_KBD)	+= hid-appletb-kbd.o
>  obj-$(CONFIG_HID_CREATIVE_SB0540)	+= hid-creative-sb0540.o
>  obj-$(CONFIG_HID_ASUS)		+= hid-asus.o
>  obj-$(CONFIG_HID_AUREAL)	+= hid-aureal.o
> diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
> new file mode 100644
> index 000000000..ecac68fc7
> --- /dev/null
> +++ b/drivers/hid/hid-appletb-kbd.c
> @@ -0,0 +1,304 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Apple Touch Bar Keyboard Mode Driver
> + *
> + * Copyright (c) 2017-2018 Ronald Tschal�r
> + * Copyright (c) 2022-2023 Kerem Karabay <kekrby@gmail.com>
> + * Copyright (c) 2024 Aditya Garg <gargaditya08@live.com>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/hid.h>
> +#include <linux/usb.h>
> +#include <linux/input.h>
> +#include <linux/sysfs.h>
> +#include <linux/bitops.h>
> +#include <linux/module.h>
> +#include <linux/string.h>
> +#include <linux/input/sparse-keymap.h>
> +
> +#include "hid-ids.h"
> +
> +#define APPLETB_KBD_MODE_ESC	0
> +#define APPLETB_KBD_MODE_FN	1
> +#define APPLETB_KBD_MODE_SPCL	2
> +#define APPLETB_KBD_MODE_OFF	3
> +#define APPLETB_KBD_MODE_MAX	APPLETB_KBD_MODE_OFF
> +
> +#define HID_USAGE_MODE		0x00ff0004
> +
> +static int appletb_tb_def_mode = APPLETB_KBD_MODE_SPCL;
> +module_param_named(mode, appletb_tb_def_mode, int, 0444);
> +MODULE_PARM_DESC(mode, "Default touchbar mode:\n"
> +			 "    0 - escape key only\n"
> +			 "    1 - function-keys\n"
> +			 "    [2] - special keys");
> +
> +struct appletb_kbd {
> +	struct hid_field *mode_field;
> +
> +	u8 saved_mode;
> +	u8 current_mode;
> +};
> +
> +static const struct key_entry appletb_kbd_keymap[] = {
> +	{ KE_KEY, KEY_ESC, { KEY_ESC } },
> +	{ KE_KEY, KEY_F1,  { KEY_BRIGHTNESSDOWN } },
> +	{ KE_KEY, KEY_F2,  { KEY_BRIGHTNESSUP } },
> +	{ KE_KEY, KEY_F3,  { KEY_RESERVED } },
> +	{ KE_KEY, KEY_F4,  { KEY_RESERVED } },
> +	{ KE_KEY, KEY_F5,  { KEY_KBDILLUMDOWN } },
> +	{ KE_KEY, KEY_F6,  { KEY_KBDILLUMUP } },
> +	{ KE_KEY, KEY_F7,  { KEY_PREVIOUSSONG } },
> +	{ KE_KEY, KEY_F8,  { KEY_PLAYPAUSE } },
> +	{ KE_KEY, KEY_F9,  { KEY_NEXTSONG } },
> +	{ KE_KEY, KEY_F10, { KEY_MUTE } },
> +	{ KE_KEY, KEY_F11, { KEY_VOLUMEDOWN } },
> +	{ KE_KEY, KEY_F12, { KEY_VOLUMEUP } },
> +	{ KE_END, 0 }
> +};
> +
> +static int appletb_kbd_set_mode(struct appletb_kbd *kbd, u8 mode)
> +{
> +	struct hid_report *report = kbd->mode_field->report;
> +	struct hid_device *hdev = report->device;
> +	int ret;
> +
> +	ret = hid_hw_power(hdev, PM_HINT_FULLON);
> +	if (ret) {
> +		hid_err(hdev, "Device didn't resume (%pe)\n", ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	ret = hid_set_field(kbd->mode_field, 0, mode);
> +	if (ret) {
> +		hid_err(hdev, "Failed to set mode field to %u (%pe)\n", mode, ERR_PTR(ret));
> +		goto power_normal;
> +	}
> +
> +	hid_hw_request(hdev, report, HID_REQ_SET_REPORT);
> +
> +	kbd->current_mode = mode;
> +
> +power_normal:
> +	hid_hw_power(hdev, PM_HINT_NORMAL);
> +
> +	return ret;
> +}
> +
> +static ssize_t mode_show(struct device *dev,
> +			 struct device_attribute *attr, char *buf)
> +{
> +	struct appletb_kbd *kbd = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%d\n", kbd->current_mode);
> +}
> +
> +static ssize_t mode_store(struct device *dev,
> +			  struct device_attribute *attr,
> +			  const char *buf, size_t size)
> +{
> +	struct appletb_kbd *kbd = dev_get_drvdata(dev);
> +	u8 mode;
> +	int ret;
> +
> +	ret = kstrtou8(buf, 0, &mode);
> +	if (ret)
> +		return ret;
> +
> +	if (mode > APPLETB_KBD_MODE_MAX)
> +		return -EINVAL;
> +
> +	ret = appletb_kbd_set_mode(kbd, mode);
> +
> +	return ret < 0 ? ret : size;
> +}
> +static DEVICE_ATTR_RW(mode);
> +
> +struct attribute *appletb_kbd_attrs[] = {
> +	&dev_attr_mode.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(appletb_kbd);
> +
> +static int appletb_tb_key_to_slot(unsigned int code)
> +{
> +	switch (code) {
> +	case KEY_ESC:
> +		return 0;
> +	case KEY_F1 ... KEY_F10:
> +		return code - KEY_F1 + 1;
> +	case KEY_F11 ... KEY_F12:
> +		return code - KEY_F11 + 11;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int appletb_kbd_hid_event(struct hid_device *hdev, struct hid_field *field,
> +				      struct hid_usage *usage, __s32 value)
> +{
> +	struct appletb_kbd *kbd = hid_get_drvdata(hdev);
> +	struct key_entry *translation;
> +	struct input_dev *input;
> +	int slot;
> +
> +	if ((usage->hid & HID_USAGE_PAGE) != HID_UP_KEYBOARD || usage->type != EV_KEY)
> +		return 0;
> +
> +	input = field->hidinput->input;
> +
> +	/*
> +	 * Skip non-touch-bar keys.
> +	 *
> +	 * Either the touch bar itself or usbhid generate a slew of key-down
> +	 * events for all the meta keys. None of which we're at all interested
> +	 * in.
> +	 */
> +	slot = appletb_tb_key_to_slot(usage->code);
> +	if (slot < 0)
> +		return 0;
> +
> +	translation = sparse_keymap_entry_from_scancode(input, usage->code);

You are missing a Kconfig depends or select here because when enabling
this module, we can get

ERROR: modpost: "sparse_keymap_setup" [drivers/hid/hid-appletb-kbd.ko] undefined!
ERROR: modpost: "sparse_keymap_entry_from_scancode" [drivers/hid/hid-appletb-kbd.ko] undefined!

FWIW, I tried "depend on INPUT_SPARSEKMAP" and "select
INPUT_SPARSEKMAP", but in both cases the error was there, so I suspect
there is one extra config to select (could be my script but if I can
enter this state, I believe others will get into it as well).

Cheers,
Benjamin

> +
> +	if (translation && kbd->current_mode == APPLETB_KBD_MODE_SPCL) {
> +		input_event(input, usage->type, translation->keycode, value);
> +
> +		return 1;
> +	}
> +
> +	return kbd->current_mode == APPLETB_KBD_MODE_OFF;
> +}
> +
> +static int appletb_kbd_input_configured(struct hid_device *hdev, struct hid_input *hidinput)
> +{
> +	int idx;
> +	struct input_dev *input = hidinput->input;
> +
> +	/*
> +	 * Clear various input capabilities that are blindly set by the hid
> +	 * driver (usbkbd.c)
> +	 */
> +	memset(input->evbit, 0, sizeof(input->evbit));
> +	memset(input->keybit, 0, sizeof(input->keybit));
> +	memset(input->ledbit, 0, sizeof(input->ledbit));
> +
> +	__set_bit(EV_REP, input->evbit);
> +
> +	sparse_keymap_setup(input, appletb_kbd_keymap, NULL);
> +
> +	for (idx = 0; appletb_kbd_keymap[idx].type != KE_END; idx++) {
> +		input_set_capability(input, EV_KEY, appletb_kbd_keymap[idx].code);
> +	}
> +
> +	return 0;
> +}
> +
> +static int appletb_kbd_probe(struct hid_device *hdev, const struct hid_device_id *id)
> +{
> +	struct appletb_kbd *kbd;
> +	struct device *dev = &hdev->dev;
> +	struct hid_field *mode_field;
> +	int ret;
> +
> +	ret = hid_parse(hdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "HID parse failed\n");
> +
> +	mode_field = hid_find_field(hdev, HID_OUTPUT_REPORT,
> +				    HID_GD_KEYBOARD, HID_USAGE_MODE);
> +	if (!mode_field)
> +		return -ENODEV;
> +
> +	kbd = devm_kzalloc(dev, sizeof(*kbd), GFP_KERNEL);
> +	if (!kbd)
> +		return -ENOMEM;
> +
> +	kbd->mode_field = mode_field;
> +
> +	ret = hid_hw_start(hdev, HID_CONNECT_HIDINPUT);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "HID hw start failed\n");
> +
> +	ret = hid_hw_open(hdev);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "HID hw open failed\n");
> +		goto stop_hw;
> +	}
> +
> +	ret = appletb_kbd_set_mode(kbd, appletb_tb_def_mode);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to set touchbar mode\n");
> +		goto close_hw;
> +	}
> +
> +	hid_set_drvdata(hdev, kbd);
> +
> +	return 0;
> +
> +close_hw:
> +	hid_hw_close(hdev);
> +stop_hw:
> +	hid_hw_stop(hdev);
> +	return ret;
> +}
> +
> +static void appletb_kbd_remove(struct hid_device *hdev)
> +{
> +	struct appletb_kbd *kbd = hid_get_drvdata(hdev);
> +
> +	appletb_kbd_set_mode(kbd, APPLETB_KBD_MODE_OFF);
> +
> +	hid_hw_close(hdev);
> +	hid_hw_stop(hdev);
> +}
> +
> +#ifdef CONFIG_PM
> +static int appletb_kbd_suspend(struct hid_device *hdev, pm_message_t msg)
> +{
> +	struct appletb_kbd *kbd = hid_get_drvdata(hdev);
> +
> +	kbd->saved_mode = kbd->current_mode;
> +	appletb_kbd_set_mode(kbd, APPLETB_KBD_MODE_OFF);
> +
> +	return 0;
> +}
> +
> +static int appletb_kbd_reset_resume(struct hid_device *hdev)
> +{
> +	struct appletb_kbd *kbd = hid_get_drvdata(hdev);
> +
> +	appletb_kbd_set_mode(kbd, kbd->saved_mode);
> +
> +	return 0;
> +}
> +#endif
> +
> +static const struct hid_device_id appletb_kbd_hid_ids[] = {
> +	/* MacBook Pro's 2018, 2019, with T2 chip: iBridge Display */
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY) },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(hid, appletb_kbd_hid_ids);
> +
> +static struct hid_driver appletb_kbd_hid_driver = {
> +	.name = "hid-appletb-kbd",
> +	.id_table = appletb_kbd_hid_ids,
> +	.probe = appletb_kbd_probe,
> +	.remove = appletb_kbd_remove,
> +	.event = appletb_kbd_hid_event,
> +	.input_configured = appletb_kbd_input_configured,
> +#ifdef CONFIG_PM
> +	.suspend = appletb_kbd_suspend,
> +	.reset_resume = appletb_kbd_reset_resume,
> +#endif
> +	.driver.dev_groups = appletb_kbd_groups,
> +};
> +module_hid_driver(appletb_kbd_hid_driver);
> +
> +MODULE_AUTHOR("Ronald Tschal�r");
> +MODULE_AUTHOR("Kerem Karabay <kekrby@gmail.com>");
> +MODULE_DESCRIPTION("MacBookPro Touch Bar Keyboard Mode Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 818d41a35..7c576d654 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -328,7 +328,6 @@ static const struct hid_device_id hid_have_special_driver[] = {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER1_TP_ONLY) },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021) },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021) },
> -	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY) },
>  #endif
>  #if IS_ENABLED(CONFIG_HID_APPLEIR)
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_IRCONTROL) },
> @@ -340,6 +339,9 @@ static const struct hid_device_id hid_have_special_driver[] = {
>  #if IS_ENABLED(CONFIG_HID_APPLETB_BL)
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT) },
>  #endif
> +#if IS_ENABLED(CONFIG_HID_APPLETB_KBD)
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY) },
> +#endif
>  #if IS_ENABLED(CONFIG_HID_ASUS)
>  	{ HID_I2C_DEVICE(USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_I2C_KEYBOARD) },
>  	{ HID_I2C_DEVICE(USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_I2C_TOUCHPAD) },
> -- 
> 2.43.0
> 
