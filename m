Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EFC744B0A
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 22:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCEA10E0E6;
	Sat,  1 Jul 2023 20:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 612 seconds by postgrey-1.36 at gabe;
 Sat, 01 Jul 2023 12:20:02 UTC
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C6410E05A
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 12:20:01 +0000 (UTC)
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
 by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4QtWG41xgrz8ZD8;
 Sat,  1 Jul 2023 12:09:48 +0000 (UTC)
Authentication-Results: mors-relay8203.netcup.net;
 dkim=permerror (bad message/signature format)
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4QtWG41FYMz8ZC9;
 Sat,  1 Jul 2023 12:09:48 +0000 (UTC)
Received: from mxe217.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4QtWG36SRVz8sZN;
 Sat,  1 Jul 2023 14:09:47 +0200 (CEST)
Received: from thinkpad.fritz.box (p5dccec2e.dip0.t-ipconnect.de
 [93.204.236.46])
 by mxe217.netcup.net (Postfix) with ESMTPSA id 961CF81510;
 Sat,  1 Jul 2023 14:09:35 +0200 (CEST)
From: Julius Zint <julius@zint.sh>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH 1/1] backlight: apple_bl_usb: Add Apple Studio Display support
Date: Sat,  1 Jul 2023 14:08:03 +0200
Message-ID: <20230701120806.11812-2-julius@zint.sh>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230701120806.11812-1-julius@zint.sh>
References: <20230701120806.11812-1-julius@zint.sh>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 961CF81510
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: xxZZds290yZdKeCDCBCYQjZuLGaqfixNp4cm7Xpq
X-Mailman-Approved-At: Sat, 01 Jul 2023 20:32:16 +0000
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
Cc: Julius Zint <julius@zint.sh>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Apple Studio Display does not have any physical buttons and the only
way to get or set the brightness is by sending USB control transfers to a
HID device exposed by the display.

These control transfers take the form of a HID_(GET|SET)_REPORT request
and the payload looks like this:

    struct brightness_ctrl_message_data {
           u8 unknown_1;
           __le16 brightness;
           u8 unkown_2[4];
    } __packed;

When compiled as a module this driver needs to be part of the early boot
environment, otherwise the generic USB HID driver will claim the device.

Signed-off-by: Julius Zint <julius@zint.sh>
---
 drivers/video/backlight/Kconfig        |   8 +
 drivers/video/backlight/Makefile       |   1 +
 drivers/video/backlight/apple_bl_usb.c | 264 +++++++++++++++++++++++++
 3 files changed, 273 insertions(+)
 create mode 100644 drivers/video/backlight/apple_bl_usb.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 51387b1ef012..9383d402ebed 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -290,6 +290,14 @@ config BACKLIGHT_APPLE
 	  If you have an Intel-based Apple say Y to enable a driver for its
 	  backlight.
 
+config BACKLIGHT_APPLE_USB
+	tristate "Apple USB Backlight Driver"
+	depends on USB
+	help
+	  If you have an external display from Apple that is attached via USB
+	  say Y to enable a driver for its backlight. Currently it supports the
+	  Apple Studio Display.
+
 config BACKLIGHT_QCOM_WLED
 	tristate "Qualcomm PMIC WLED Driver"
 	select REGMAP
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index f72e1c3c59e9..c42880655113 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_BACKLIGHT_ADP5520)		+= adp5520_bl.o
 obj-$(CONFIG_BACKLIGHT_ADP8860)		+= adp8860_bl.o
 obj-$(CONFIG_BACKLIGHT_ADP8870)		+= adp8870_bl.o
 obj-$(CONFIG_BACKLIGHT_APPLE)		+= apple_bl.o
+obj-$(CONFIG_BACKLIGHT_APPLE_USB)	+= apple_bl_usb.o
 obj-$(CONFIG_BACKLIGHT_AS3711)		+= as3711_bl.o
 obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
 obj-$(CONFIG_BACKLIGHT_CARILLO_RANCH)	+= cr_bllcd.o
diff --git a/drivers/video/backlight/apple_bl_usb.c b/drivers/video/backlight/apple_bl_usb.c
new file mode 100644
index 000000000000..b746b7822974
--- /dev/null
+++ b/drivers/video/backlight/apple_bl_usb.c
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/usb.h>
+#include <linux/backlight.h>
+#include <asm/byteorder.h>
+
+#define APPLE_STUDIO_DISPLAY_VENDOR_ID  0x05ac
+#define APPLE_STUDIO_DISPLAY_PRODUCT_ID 0x1114
+
+#define HID_GET_REPORT 0x01
+#define HID_SET_REPORT 0x09
+
+#define HID_REPORT_TYPE_FEATURE 0x0300
+
+struct apple_bl_usb_data {
+	struct usb_interface *usb_interface;
+	struct usb_device *usb_dev;
+};
+
+struct brightness_ctrl_message_data {
+	u8 unknown_1;
+	__le16 brightness;
+	u8 unkown_2[4];
+} __packed;
+
+void init_ctrl_msg_data(struct brightness_ctrl_message_data *msg)
+{
+	memset(msg, 0, sizeof(struct brightness_ctrl_message_data));
+	msg->unknown_1 = 0x01;
+}
+
+void set_ctrl_message_brightness(struct brightness_ctrl_message_data *msg,
+				 u16 brightness_value)
+{
+	msg->brightness = cpu_to_le16(brightness_value + 400);
+}
+
+u16 get_ctrl_message_brightness(struct brightness_ctrl_message_data *msg)
+{
+	return le16_to_cpu(msg->brightness) - 400;
+}
+
+int apple_bl_usb_usb_get_brightness(struct usb_interface *interface,
+				    struct usb_device *usb_dev,
+				    int *brightness)
+{
+	int err;
+	u16 interface_nr;
+	int msg_data_size;
+	struct brightness_ctrl_message_data *msg_data;
+
+	msg_data_size = sizeof(struct brightness_ctrl_message_data);
+	msg_data = kzalloc(msg_data_size, GFP_KERNEL);
+	memset(msg_data, 0x00, msg_data_size);
+	interface_nr = interface->cur_altsetting->desc.bInterfaceNumber;
+
+	err = usb_control_msg(usb_dev,
+			      usb_rcvctrlpipe(usb_dev, 0),
+			      HID_GET_REPORT,
+			      USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
+			      /* wValue: HID-Report Type and Report ID */
+			      HID_REPORT_TYPE_FEATURE | 0x01,
+			      interface_nr /* wIndex */,
+			      msg_data,
+			      msg_data_size,
+			      HZ);
+	if (err < 0) {
+		dev_err(&interface->dev,
+			"get: usb control message err: %d\n",
+			err);
+	}
+	*brightness = get_ctrl_message_brightness(msg_data);
+	kfree(msg_data);
+	dev_dbg(&interface->dev, "get brightness: %d\n", *brightness);
+	return 0;
+}
+
+int apple_bl_usb_usb_set_brightness(struct usb_interface *interface,
+				    struct usb_device *usb_dev,
+				    int brightness)
+{
+	int err;
+	u16 interface_nr;
+	struct brightness_ctrl_message_data *msg_data;
+
+	msg_data = kzalloc(sizeof(struct brightness_ctrl_message_data), GFP_KERNEL);
+	interface_nr = interface->cur_altsetting->desc.bInterfaceNumber;
+	init_ctrl_msg_data(msg_data);
+	set_ctrl_message_brightness(msg_data, brightness);
+
+	err = usb_control_msg(usb_dev,
+			      usb_sndctrlpipe(usb_dev, 0),
+			      HID_SET_REPORT,
+			      USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
+			      /* wValue: HID-Report Type and Report ID */
+			      HID_REPORT_TYPE_FEATURE | 0x01,
+			      interface_nr /* wIndex */,
+			      msg_data,
+			      sizeof(struct brightness_ctrl_message_data),
+			      HZ);
+	kfree(msg_data);
+	if (err < 0) {
+		dev_err(&interface->dev,
+			"set: usb control message err: %d\n",
+			err);
+		return err;
+	}
+	dev_dbg(&interface->dev, "set brightness: %d\n", brightness);
+	return 0;
+}
+
+int apple_bl_usb_check_fb(struct backlight_device *bd, struct fb_info *info)
+{
+	dev_info(&bd->dev, "check fb\n");
+	return 0;
+}
+
+int apple_bl_usb_get_brightness(struct backlight_device *bl)
+{
+	int ret;
+	struct apple_bl_usb_data *data;
+	int hw_brightness;
+
+	data = bl_get_data(bl);
+	ret = apple_bl_usb_usb_get_brightness(data->usb_interface,
+					      data->usb_dev,
+					      &hw_brightness);
+	if (!ret)
+		ret = hw_brightness;
+
+	return ret;
+}
+
+int apple_bl_usb_update_status(struct backlight_device *bl)
+{
+	int err;
+	struct apple_bl_usb_data *data;
+
+	data = bl_get_data(bl);
+	err = apple_bl_usb_usb_set_brightness(data->usb_interface,
+					      data->usb_dev,
+					      bl->props.brightness);
+	return err;
+}
+
+static const struct backlight_ops apple_bl_usb_ops = {
+	.update_status  = apple_bl_usb_update_status,
+	.get_brightness = apple_bl_usb_get_brightness,
+	.check_fb       = apple_bl_usb_check_fb,
+};
+
+static void apple_bl_usb_disconnect(struct usb_interface *interface)
+{
+	struct backlight_device *bl;
+
+	dev_dbg(&interface->dev, "disconnect\n");
+
+	bl = usb_get_intfdata(interface);
+	usb_set_intfdata(interface, NULL);
+	backlight_device_unregister(bl);
+}
+
+static int apple_bl_usb_probe(struct usb_interface *interface,
+			      const struct usb_device_id *id)
+{
+	struct backlight_properties props;
+	struct backlight_device *bl;
+	struct usb_device *usb_dev;
+	struct device *dev;
+	struct apple_bl_usb_data *data;
+	int brightness_interface_nr;
+
+	dev_dbg(&interface->dev, "probe\n");
+
+	dev = &interface->dev;
+	usb_dev = interface_to_usbdev(interface);
+
+	switch (usb_dev->config->desc.bConfigurationValue) {
+	case 1:
+		brightness_interface_nr = 0x7;
+		break;
+	case 2:
+		brightness_interface_nr = 0x9;
+		break;
+	case 3:
+		brightness_interface_nr = 0xc;
+		break;
+	default:
+		dev_err(dev,
+			"unexpected configuration value: %d\n",
+			usb_dev->config->desc.bConfigurationValue);
+		return -EINVAL;
+	}
+
+	if (interface->cur_altsetting->desc.bInterfaceNumber != brightness_interface_nr)
+		return -ENODEV;
+
+	data = devm_kzalloc(dev,
+			    sizeof(struct apple_bl_usb_data),
+			    GFP_KERNEL);
+	if (IS_ERR(data)) {
+		dev_err(dev, "failed to allocate memory\n");
+		return PTR_ERR(bl);
+	}
+	data->usb_interface = interface;
+	data->usb_dev = usb_dev;
+
+	// Valid brightness values for the apple studio display range from 400
+	// to 60000. Since the backlight subsystem´s brightness value starts
+	// from 0, we use 0 to 59600 and offset it by the minimum value.
+	memset(&props, 0, sizeof(props));
+	props.type = BACKLIGHT_RAW;
+	props.max_brightness = 59600;
+
+	bl = backlight_device_register("apple_studio_display",
+				       dev,
+				       data,
+				       &apple_bl_usb_ops,
+				       &props);
+	if (IS_ERR(bl)) {
+		dev_err(dev, "failed to register backlight\n");
+		return PTR_ERR(bl);
+	}
+	usb_set_intfdata(interface, bl);
+	return 0;
+}
+
+static int apple_bl_usb_suspend(struct usb_interface *interface,
+				pm_message_t message)
+{
+	dev_dbg(&interface->dev, "suspend\n");
+	return 0;
+}
+
+static int apple_bl_usb_resume(struct usb_interface *interface)
+{
+	dev_dbg(&interface->dev, "resume\n");
+	return 0;
+}
+
+static const struct usb_device_id id_table[] = {
+	{
+		.idVendor    = APPLE_STUDIO_DISPLAY_VENDOR_ID,
+		.idProduct   = APPLE_STUDIO_DISPLAY_PRODUCT_ID,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(usb, id_table);
+
+static struct usb_driver usb_asdbl_driver = {
+	.name         = "apple_bl_usb",
+	.probe        = apple_bl_usb_probe,
+	.disconnect   = apple_bl_usb_disconnect,
+	.id_table     = id_table,
+	.suspend      = apple_bl_usb_suspend,
+	.resume       = apple_bl_usb_resume,
+	.reset_resume = apple_bl_usb_resume
+};
+module_usb_driver(usb_asdbl_driver);
+
+MODULE_AUTHOR("Julius Zint <julius@zint.sh>");
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_DESCRIPTION("Backlight control for USB-C Thunderbolt Apple displays");
-- 
2.41.0

