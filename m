Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C95F44205B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 19:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BBB6E288;
	Mon,  1 Nov 2021 18:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A836E288
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 18:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635792957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iYinJrPYeEwjd2EPn1DkCMOFKpBLlTfl9POTocMusBI=;
 b=SI3eayESfrU8yy8zRJoo+7XMiBA9w4Wn4/+bQ9YjbtZDiD2o/PFSdgWbBZ5OBMBvwNBxsv
 IAu6J3R6Iw9h1mZ7skQle9oYaszapDc/s8S0ruJ2Zlc87ml/fye8pmEVg3uaoyMXQFPCda
 Dg/91TbycR8aEvdtz/NxCRrLLIu7bxU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-lKzzuFAZOW690T99W4sc0w-1; Mon, 01 Nov 2021 14:55:51 -0400
X-MC-Unique: lKzzuFAZOW690T99W4sc0w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A802B8066EB;
 Mon,  1 Nov 2021 18:55:50 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71B5660C17;
 Mon,  1 Nov 2021 18:55:49 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH 3/3] backlight: lp855x: Add support ACPI enumeration
Date: Mon,  1 Nov 2021 19:55:17 +0100
Message-Id: <20211101185518.306728-3-hdegoede@redhat.com>
In-Reply-To: <20211101185518.306728-1-hdegoede@redhat.com>
References: <20211101185518.306728-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Xiaomi Mi Pad 2 tablet uses an ACPI enumerated LP8556 backlight
controller for its LCD-panel, with a Xiaomi specific ACPI HID of
"XMCC0001", add support for this.

Note the new "if (id)" check also fixes a NULL pointer deref when a user
tries to manually bind the driver from sysfs.

When CONFIG_ACPI is disabled acpi_match_device() will always return NULL,
so the lp855x_parse_acpi() call will get optimized away.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/video/backlight/lp855x_bl.c | 70 ++++++++++++++++++++++++-----
 1 file changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index d1d27d5eb0f2..f075ec84acfb 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -5,6 +5,7 @@
  *			Copyright (C) 2011 Texas Instruments
  */
 
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/i2c.h>
@@ -330,7 +331,7 @@ static int lp855x_parse_dt(struct lp855x *lp)
 {
 	struct device *dev = lp->dev;
 	struct device_node *node = dev->of_node;
-	struct lp855x_platform_data *pdata;
+	struct lp855x_platform_data *pdata = lp->pdata;
 	int rom_length;
 
 	if (!node) {
@@ -338,10 +339,6 @@ static int lp855x_parse_dt(struct lp855x *lp)
 		return -EINVAL;
 	}
 
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return -ENOMEM;
-
 	of_property_read_string(node, "bl-name", &pdata->name);
 	of_property_read_u8(node, "dev-ctrl", &pdata->device_control);
 	of_property_read_u8(node, "init-brt", &pdata->initial_brightness);
@@ -379,8 +376,31 @@ static int lp855x_parse_dt(struct lp855x *lp)
 }
 #endif
 
+static int lp855x_parse_acpi(struct lp855x *lp)
+{
+	int ret;
+
+	/*
+	 * On ACPI the device has already been initialized by the firmware
+	 * so we read back the settings from the registers.
+	 */
+	ret = i2c_smbus_read_byte_data(lp->client, lp->cfg->reg_brightness);
+	if (ret < 0)
+		return ret;
+
+	lp->pdata->initial_brightness = ret;
+
+	ret = i2c_smbus_read_byte_data(lp->client, lp->cfg->reg_devicectrl);
+	if (ret < 0)
+		return ret;
+
+	lp->pdata->device_control = ret;
+	return 0;
+}
+
 static int lp855x_probe(struct i2c_client *cl, const struct i2c_device_id *id)
 {
+	const struct acpi_device_id *acpi_id = NULL;
 	struct device *dev = &cl->dev;
 	struct lp855x *lp;
 	int ret;
@@ -394,10 +414,20 @@ static int lp855x_probe(struct i2c_client *cl, const struct i2c_device_id *id)
 
 	lp->client = cl;
 	lp->dev = dev;
-	lp->chipname = id->name;
-	lp->chip_id = id->driver_data;
 	lp->pdata = dev_get_platdata(dev);
 
+	if (id) {
+		lp->chipname = id->name;
+		lp->chip_id = id->driver_data;
+	} else {
+		acpi_id = acpi_match_device(dev->driver->acpi_match_table, dev);
+		if (!acpi_id)
+			return -ENODEV;
+
+		lp->chipname = acpi_id->id;
+		lp->chip_id = acpi_id->driver_data;
+	}
+
 	switch (lp->chip_id) {
 	case LP8550:
 	case LP8551:
@@ -415,9 +445,19 @@ static int lp855x_probe(struct i2c_client *cl, const struct i2c_device_id *id)
 	}
 
 	if (!lp->pdata) {
-		ret = lp855x_parse_dt(lp);
-		if (ret < 0)
-			return ret;
+		lp->pdata = devm_kzalloc(dev, sizeof(*lp->pdata), GFP_KERNEL);
+		if (!lp->pdata)
+			return -ENOMEM;
+
+		if (id) {
+			ret = lp855x_parse_dt(lp);
+			if (ret < 0)
+				return ret;
+		} else {
+			ret = lp855x_parse_acpi(lp);
+			if (ret < 0)
+				return ret;
+		}
 	}
 
 	if (lp->pdata->period_ns > 0)
@@ -537,10 +577,20 @@ static const struct i2c_device_id lp855x_ids[] = {
 };
 MODULE_DEVICE_TABLE(i2c, lp855x_ids);
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id lp855x_acpi_match[] = {
+	/* Xiaomi specific HID used for the LP8556 on the Mi Pad 2 */
+	{ "XMCC0001", LP8556 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, lp855x_acpi_match);
+#endif
+
 static struct i2c_driver lp855x_driver = {
 	.driver = {
 		   .name = "lp855x",
 		   .of_match_table = of_match_ptr(lp855x_dt_ids),
+		   .acpi_match_table = ACPI_PTR(lp855x_acpi_match),
 		   },
 	.probe = lp855x_probe,
 	.remove = lp855x_remove,
-- 
2.31.1

