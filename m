Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6E96ADE4A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 13:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9C110E443;
	Tue,  7 Mar 2023 12:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B77010E443
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 12:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678190746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=OV3TXQN7O8oKayamqJhsqwDR10DSkew1hqIvq2D1i/8=;
 b=ZqFqcVEApvQIf9f4l+H4wLxvGCCrFXOHKzLna6LcXdpKFc0bMGcMiI84HITlfYo7Mlb5CN
 NtkQDr41Ixin13lBrsdWixAyUgpQ1J2QTNzAcBMXx8bCK+v6BRi4Mfa0QzKz7Na6BEcsp1
 Qmlbm5oV1lsrIkNDAKy7aWPvewB3STA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-Jf3khm7oP1qc-96GI0Io5w-1; Tue, 07 Mar 2023 07:05:43 -0500
X-MC-Unique: Jf3khm7oP1qc-96GI0Io5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 979DA18F0242;
 Tue,  7 Mar 2023 12:05:42 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF3952166B26;
 Tue,  7 Mar 2023 12:05:40 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH] backlight: apple_bl: Use acpi_video_get_backlight_type()
Date: Tue,  7 Mar 2023 13:05:40 +0100
Message-Id: <20230307120540.389920-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Aditya Garg <gargaditya08@live.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some MacBooks both the apple_bl and the apple-gmux backlight drivers
may be able to export a /sys/class/backlight device.

To avoid having 2 backlight devices for one LCD panel until now
the apple-gmux driver has been calling apple_bl_unregister() to move
the apple_bl backlight device out of the way when it loads.

Similar problems exist on other x86 laptops and all backlight drivers
which may be used on x86 laptops have moved to using
acpi_video_get_backlight_type() to determine whether they should load
or not.

Switch apple_bl to this model too, so that it is consistent with all
the other x86 backlight drivers.

Besides code-simplification and consistency this has 2 other benefits:

1) It removes a race during boot where userspace will briefly see
   an apple_bl backlight and then have it disappear again, leading to e.g.:
   https://bbs.archlinux.org/viewtopic.php?id=269920

2) This allows user to switch between the drivers by passing
   acpi_backlight=apple_gmux or acpi_backlight=vendor on the kernel
   commandline.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
A note to the backlight class / subsystem maintainers, this change
applies on top of a similar patch for drivers/platform/x86/apple-gmux.c
which makes that driver use acpi_video_get_backlight_type(). See:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I believe it is easiest to also merge this patch through
the platform-drivers-x86 tree, may I please have your Ack for this ?
---
 drivers/platform/x86/Kconfig       |  1 -
 drivers/platform/x86/apple-gmux.c  | 11 -----------
 drivers/video/backlight/Kconfig    |  1 +
 drivers/video/backlight/apple_bl.c | 31 ++++++++++--------------------
 include/linux/apple_bl.h           | 27 --------------------------
 5 files changed, 11 insertions(+), 60 deletions(-)
 delete mode 100644 include/linux/apple_bl.h

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index d2619e7025c7..aa8df8d4aee9 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -206,7 +206,6 @@ config APPLE_GMUX
 	depends on ACPI && PCI
 	depends on PNP
 	depends on BACKLIGHT_CLASS_DEVICE
-	depends on BACKLIGHT_APPLE=n || BACKLIGHT_APPLE
 	help
 	  This driver provides support for the gmux device found on many
 	  Apple laptops, which controls the display mux for the hybrid
diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 787cf2a7e268..f490565e1ed1 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -16,7 +16,6 @@
 #include <linux/backlight.h>
 #include <linux/acpi.h>
 #include <linux/pnp.h>
-#include <linux/apple_bl.h>
 #include <linux/apple-gmux.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
@@ -884,14 +883,6 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 		gmux_data->bdev = bdev;
 		bdev->props.brightness = gmux_get_brightness(bdev);
 		backlight_update_status(bdev);
-
-		/*
-		 * The backlight situation on Macs is complicated. If the gmux is
-		 * present it's the best choice, because it always works for
-		 * backlight control and supports more levels than other options.
-		 * Disable the other backlight choices.
-		 */
-		apple_bl_unregister();
 	}
 
 	gmux_data->power_state = VGA_SWITCHEROO_ON;
@@ -1008,8 +999,6 @@ static void gmux_remove(struct pnp_dev *pnp)
 		release_region(gmux_data->iostart, gmux_data->iolen);
 	apple_gmux_data = NULL;
 	kfree(gmux_data);
-
-	apple_bl_register();
 }
 
 static const struct pnp_device_id gmux_device_ids[] = {
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 4c33e971c0f0..51387b1ef012 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -285,6 +285,7 @@ config BACKLIGHT_MT6370
 config BACKLIGHT_APPLE
 	tristate "Apple Backlight Driver"
 	depends on X86 && ACPI
+	depends on ACPI_VIDEO=n || ACPI_VIDEO
 	help
 	  If you have an Intel-based Apple say Y to enable a driver for its
 	  backlight.
diff --git a/drivers/video/backlight/apple_bl.c b/drivers/video/backlight/apple_bl.c
index e9e7acb577bf..aaa824437a2a 100644
--- a/drivers/video/backlight/apple_bl.c
+++ b/drivers/video/backlight/apple_bl.c
@@ -24,7 +24,7 @@
 #include <linux/pci.h>
 #include <linux/acpi.h>
 #include <linux/atomic.h>
-#include <linux/apple_bl.h>
+#include <acpi/video.h>
 
 static struct backlight_device *apple_backlight_device;
 
@@ -215,32 +215,21 @@ static struct acpi_driver apple_bl_driver = {
 	},
 };
 
-static atomic_t apple_bl_registered = ATOMIC_INIT(0);
-
-int apple_bl_register(void)
-{
-	if (atomic_xchg(&apple_bl_registered, 1) == 0)
-		return acpi_bus_register_driver(&apple_bl_driver);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(apple_bl_register);
-
-void apple_bl_unregister(void)
-{
-	if (atomic_xchg(&apple_bl_registered, 0) == 1)
-		acpi_bus_unregister_driver(&apple_bl_driver);
-}
-EXPORT_SYMBOL_GPL(apple_bl_unregister);
-
 static int __init apple_bl_init(void)
 {
-	return apple_bl_register();
+	/*
+	 * Use ACPI video detection code to see if this driver should register
+	 * or if another driver, e.g. the apple-gmux driver should be used.
+	 */
+	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
+		return -ENODEV;
+
+	return acpi_bus_register_driver(&apple_bl_driver);
 }
 
 static void __exit apple_bl_exit(void)
 {
-	apple_bl_unregister();
+	acpi_bus_unregister_driver(&apple_bl_driver);
 }
 
 module_init(apple_bl_init);
diff --git a/include/linux/apple_bl.h b/include/linux/apple_bl.h
deleted file mode 100644
index 445af2e3cc21..000000000000
--- a/include/linux/apple_bl.h
+++ /dev/null
@@ -1,27 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * apple_bl exported symbols
- */
-
-#ifndef _LINUX_APPLE_BL_H
-#define _LINUX_APPLE_BL_H
-
-#if defined(CONFIG_BACKLIGHT_APPLE) || defined(CONFIG_BACKLIGHT_APPLE_MODULE)
-
-extern int apple_bl_register(void);
-extern void apple_bl_unregister(void);
-
-#else /* !CONFIG_BACKLIGHT_APPLE */
-
-static inline int apple_bl_register(void)
-{
-	return 0;
-}
-
-static inline void apple_bl_unregister(void)
-{
-}
-
-#endif /* !CONFIG_BACKLIGHT_APPLE */
-
-#endif /* _LINUX_APPLE_BL_H */
-- 
2.39.1

