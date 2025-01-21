Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACF2A18817
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 00:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735AC10E2ED;
	Tue, 21 Jan 2025 23:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="TLXdl1HA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7A310E269
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 23:01:49 +0000 (UTC)
Received: from wse-pc.fritz.box (pd9e59556.dip0.t-ipconnect.de
 [217.229.149.86]) (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPA id E75172FC0055;
 Tue, 21 Jan 2025 23:55:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1737500125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kp4YU8Pnr8xa+ucuXUNzQLfY+y2XGmkd8Rvo/k1P7Cw=;
 b=TLXdl1HAShNW9qZ4iOrkZMaZQsUfYmJyPs2IK8TyITFEfvSO8r2Q53UDMr861H4wk80mf+
 aWr7lw5qTLzQlh8bH+Z62w5F95uGcTG2PUASx/Y3mdjbr5oz6wEJKTcy31Vkm/eQ9s+CQl
 jNoTtO6ujCiMxRhBDJ5gehAQmmpf9c0=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 wse@tuxedocomputers.com, bentiss@kernel.org
Cc: dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, pavel@ucw.cz, cs@tuxedo.de,
 platform-driver-x86@vger.kernel.org
Subject: [PATCH v5 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
Date: Tue, 21 Jan 2025 23:31:10 +0100
Message-ID: <20250121225510.751444-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121225510.751444-1-wse@tuxedocomputers.com>
References: <20250121225510.751444-1-wse@tuxedocomputers.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The TUXEDO Sirius 16 Gen1 and TUXEDO Sirius 16 Gen2 devices have a per-key
controllable RGB keyboard backlight. The firmware API for it is implemented
via WMI.

To make the backlight userspace configurable this driver emulates a
LampArray HID device and translates the input from hidraw to the
corresponding WMI calls. This is a new approach as the leds subsystem lacks
a suitable UAPI for per-key keyboard backlights, and like this no new UAPI
needs to be established.

v2: Integrated Armins feedback and fixed kernel test robot warnings.
v3: Fixed borked subject line of v2.
v4: Remove unrequired WMI mutex.
    Move device checking from probe to init.
    Fix device checking working exactly reverse as it should.
    Fix null pointer dereference because,
        hdev->driver_data != hdev->dev.driver_data.
v5: Move everything to subfolder nb04 in preparation for the eventual
        upstreaming of other tuxedo-driver parts
    Integrated Ilpos coding style feedback
    Use dev_set/get_drvdata() based on Armins feedback

Co-developed-by: Christoffer Sandberg <cs@tuxedo.de>
Signed-off-by: Christoffer Sandberg <cs@tuxedo.de>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Link: https://lore.kernel.org/all/1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com/
---
 MAINTAINERS                                   |   6 +
 drivers/platform/x86/Kconfig                  |   2 +
 drivers/platform/x86/Makefile                 |   3 +
 drivers/platform/x86/tuxedo/Kbuild            |   6 +
 drivers/platform/x86/tuxedo/Kconfig           |   6 +
 drivers/platform/x86/tuxedo/nb04/Kbuild       |   9 +
 drivers/platform/x86/tuxedo/nb04/Kconfig      |  14 +
 .../platform/x86/tuxedo/nb04/wmi_ab_init.c    | 103 +++
 .../platform/x86/tuxedo/nb04/wmi_ab_init.h    |  18 +
 .../x86/tuxedo/nb04/wmi_ab_virt_lamparray.c   | 772 ++++++++++++++++++
 .../x86/tuxedo/nb04/wmi_ab_virt_lamparray.h   |  18 +
 .../platform/x86/tuxedo/nb04/wmi_xx_util.c    |  97 +++
 .../platform/x86/tuxedo/nb04/wmi_xx_util.h    | 112 +++
 13 files changed, 1166 insertions(+)
 create mode 100644 drivers/platform/x86/tuxedo/Kbuild
 create mode 100644 drivers/platform/x86/tuxedo/Kconfig
 create mode 100644 drivers/platform/x86/tuxedo/nb04/Kbuild
 create mode 100644 drivers/platform/x86/tuxedo/nb04/Kconfig
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_ab_init.c
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_ab_init.h
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_ab_virt_lamparray.c
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_ab_virt_lamparray.h
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_xx_util.c
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_xx_util.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 0fa7c5728f1e6..2d3fe9de4e9cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23916,6 +23916,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git turbostat
 F:	tools/power/x86/turbostat/
 F:	tools/testing/selftests/turbostat/
 
+TUXEDO DRIVERS
+M:	Werner Sembach <wse@tuxedocomputers.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Supported
+F:	drivers/platform/x86/tuxedo/
+
 TW5864 VIDEO4LINUX DRIVER
 M:	Bluecherry Maintainers <maintainers@bluecherrydvr.com>
 M:	Andrey Utkin <andrey.utkin@corp.bluecherry.net>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0258dd879d64b..9b78a1255c08e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1199,3 +1199,5 @@ config P2SB
 	  The main purpose of this library is to unhide P2SB device in case
 	  firmware kept it hidden on some platforms in order to access devices
 	  behind it.
+
+source "drivers/platform/x86/tuxedo/Kconfig"
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index e1b1429470674..1562dcd7ad9a5 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -153,3 +153,6 @@ obj-$(CONFIG_WINMATE_FM07_KEYS)		+= winmate-fm07-keys.o
 
 # SEL
 obj-$(CONFIG_SEL3350_PLATFORM)		+= sel3350-platform.o
+
+# TUXEDO
+obj-y					+= tuxedo/
diff --git a/drivers/platform/x86/tuxedo/Kbuild b/drivers/platform/x86/tuxedo/Kbuild
new file mode 100644
index 0000000000000..a42cc9228230b
--- /dev/null
+++ b/drivers/platform/x86/tuxedo/Kbuild
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# TUXEDO X86 Platform Specific Drivers
+#
+
+obj-y	+= nb04/
diff --git a/drivers/platform/x86/tuxedo/Kconfig b/drivers/platform/x86/tuxedo/Kconfig
new file mode 100644
index 0000000000000..b61c0ab9b895e
--- /dev/null
+++ b/drivers/platform/x86/tuxedo/Kconfig
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# TUXEDO X86 Platform Specific Drivers
+#
+
+source "drivers/platform/x86/tuxedo/nb04/Kconfig"
diff --git a/drivers/platform/x86/tuxedo/nb04/Kbuild b/drivers/platform/x86/tuxedo/nb04/Kbuild
new file mode 100644
index 0000000000000..e26597c05dd12
--- /dev/null
+++ b/drivers/platform/x86/tuxedo/nb04/Kbuild
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# TUXEDO X86 Platform Specific Drivers
+#
+
+tuxedo_nb04_wmi_ab-y			:= wmi_ab_init.o
+tuxedo_nb04_wmi_ab-y			+= wmi_xx_util.o
+tuxedo_nb04_wmi_ab-y			+= wmi_ab_virt_lamparray.o
+obj-$(CONFIG_TUXEDO_NB04_WMI_AB)	+= tuxedo_nb04_wmi_ab.o
diff --git a/drivers/platform/x86/tuxedo/nb04/Kconfig b/drivers/platform/x86/tuxedo/nb04/Kconfig
new file mode 100644
index 0000000000000..b1f7c6ceeaae4
--- /dev/null
+++ b/drivers/platform/x86/tuxedo/nb04/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# TUXEDO X86 Platform Specific Drivers
+#
+
+menuconfig TUXEDO_NB04_WMI_AB
+	tristate "TUXEDO NB04 WMI AB Platform Driver"
+	default m
+	help
+	  This driver implements the WMI AB device found on TUXEDO Notebooks
+	  with board vendor NB04. For the time being only the keyboard backlight
+	  control is implemented.
+
+	  When compiled as a module it will be called tuxedo_nb04_wmi_ab.
diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab_init.c b/drivers/platform/x86/tuxedo/nb04/wmi_ab_init.c
new file mode 100644
index 0000000000000..aa2b20a3bdb08
--- /dev/null
+++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab_init.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This driver implements the WMI AB device found on TUXEDO Notebooks with board
+ * vendor NB04.
+ *
+ * Copyright (C) 2024-2025 Werner Sembach <wse@tuxedocomputers.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/dmi.h>
+#include <linux/hid.h>
+#include <linux/module.h>
+#include <linux/wmi.h>
+
+#include "wmi_ab_virt_lamparray.h"
+
+#include "wmi_ab_init.h"
+
+static const struct wmi_device_id tuxedo_nb04_wmi_ab_device_ids[] = {
+	{ .guid_string = "80C9BAA6-AC48-4538-9234-9F81A55E7C85" },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, tuxedo_nb04_wmi_ab_device_ids);
+
+static int probe(struct wmi_device *wdev, const void __always_unused *context)
+{
+	struct tux_wmi_ab_driver_data_t *driver_data;
+	int ret;
+
+	driver_data = devm_kzalloc(&wdev->dev, sizeof(*driver_data),
+				   GFP_KERNEL);
+	if (!driver_data)
+		return -ENOMEM;
+
+	dev_set_drvdata(&wdev->dev, driver_data);
+
+	ret = tux_virt_lamparray_add_device(wdev,
+					    &driver_data->virt_lamparray_hdev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void remove(struct wmi_device *wdev)
+{
+	struct tux_wmi_ab_driver_data_t *driver_data = dev_get_drvdata(&wdev->dev);
+
+	hid_destroy_device(driver_data->virt_lamparray_hdev);
+}
+
+static struct wmi_driver tuxedo_nb04_wmi_ab_driver = {
+	.driver = {
+		.name = "tuxedo_nb04_wmi_ab",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = tuxedo_nb04_wmi_ab_device_ids,
+	.probe = probe,
+	.remove = remove,
+	.no_singleton = true,
+};
+
+/* We don't know if the WMI API is stable and how unique the GUID is for this
+ * ODM. To be on the safe side we therefore only run this driver on tested
+ * devices defined by this list.
+ */
+static const struct dmi_system_id tested_devices_dmi_table[] __initconst = {
+	{
+		// TUXEDO Sirius 16 Gen1
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "APX958"),
+		},
+	},
+	{
+		// TUXEDO Sirius 16 Gen2
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AHP958"),
+		},
+	},
+	{ }
+};
+
+static int __init tuxedo_nb04_wmi_ab_init(void)
+{
+	if (!dmi_check_system(tested_devices_dmi_table))
+		return -ENODEV;
+
+	return wmi_driver_register(&tuxedo_nb04_wmi_ab_driver);
+}
+module_init(tuxedo_nb04_wmi_ab_init);
+
+static void __exit tuxedo_nb04_wmi_ab_exit(void)
+{
+	return wmi_driver_unregister(&tuxedo_nb04_wmi_ab_driver);
+}
+module_exit(tuxedo_nb04_wmi_ab_exit);
+
+MODULE_DESCRIPTION("Virtual HID LampArray interface for TUXEDO NB04 devices");
+MODULE_AUTHOR("Werner Sembach <wse@tuxedocomputers.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab_init.h b/drivers/platform/x86/tuxedo/nb04/wmi_ab_init.h
new file mode 100644
index 0000000000000..935237a18ce59
--- /dev/null
+++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab_init.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This driver implements the WMI AB device found on TUXEDO Notebooks with board
+ * vendor NB04.
+ *
+ * Copyright (C) 2024-2025 Werner Sembach <wse@tuxedocomputers.com>
+ */
+
+#ifndef TUXEDO_NB04_WMI_AB_INIT_H
+#define TUXEDO_NB04_WMI_AB_INIT_H
+
+#include <linux/hid.h>
+
+struct tux_wmi_ab_driver_data_t {
+	struct hid_device *virt_lamparray_hdev;
+};
+
+#endif
diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab_virt_lamparray.c b/drivers/platform/x86/tuxedo/nb04/wmi_ab_virt_lamparray.c
new file mode 100644
index 0000000000000..065c1460f23c8
--- /dev/null
+++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab_virt_lamparray.c
@@ -0,0 +1,772 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This code gives the built in RGB lighting of the TUXEDO NB04 devices a
+ * standardised interface, namely HID LampArray.
+ *
+ * Copyright (C) 2024-2025 Werner Sembach <wse@tuxedocomputers.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/hid.h>
+#include <linux/minmax.h>
+#include <linux/wmi.h>
+
+#include "wmi_xx_util.h"
+
+#include "wmi_ab_virt_lamparray.h"
+
+enum report_ids {
+	LAMP_ARRAY_ATTRIBUTES_REPORT_ID		= 0x01,
+	LAMP_ATTRIBUTES_REQUEST_REPORT_ID	= 0x02,
+	LAMP_ATTRIBUTES_RESPONSE_REPORT_ID	= 0x03,
+	LAMP_MULTI_UPDATE_REPORT_ID		= 0x04,
+	LAMP_RANGE_UPDATE_REPORT_ID		= 0x05,
+	LAMP_ARRAY_CONTROL_REPORT_ID		= 0x06,
+};
+
+static const u8 sirius_16_ansii_kbl_mapping[] = {
+	0x29, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x41, 0x42,
+	0x43, 0x44, 0x45, 0xf1, 0x46, 0x4c,   0x4a, 0x4d, 0x4b, 0x4e,
+	0x35, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
+	0x27, 0x2d, 0x2e, 0x2a,               0x53, 0x55, 0x54, 0x56,
+	0x2b, 0x14, 0x1a, 0x08, 0x15, 0x17, 0x1c, 0x18, 0x0c, 0x12,
+	0x13, 0x2f, 0x30, 0x31,               0x5f, 0x60, 0x61,
+	0x39, 0x04, 0x16, 0x07, 0x09, 0x0a, 0x0b, 0x0d, 0x0e, 0x0f,
+	0x33, 0x34, 0x28,                     0x5c, 0x5d, 0x5e, 0x57,
+	0xe1, 0x1d, 0x1b, 0x06, 0x19, 0x05, 0x11, 0x10, 0x36, 0x37,
+	0x38, 0xe5, 0x52,                     0x59, 0x5a, 0x5b,
+	0xe0, 0xfe, 0xe3, 0xe2, 0x2c, 0xe6, 0x65, 0xe4, 0x50, 0x51,
+	0x4f,                                 0x62, 0x63, 0x58
+};
+
+static const u32 sirius_16_ansii_kbl_mapping_pos_x[] = {
+	 25000,  41700,  58400,  75100,  91800, 108500, 125200, 141900, 158600, 175300,
+	192000, 208700, 225400, 242100, 258800, 275500,   294500, 311200, 327900, 344600,
+	 24500,  42500,  61000,  79500,  98000, 116500, 135000, 153500, 172000, 190500,
+	209000, 227500, 246000, 269500,                   294500, 311200, 327900, 344600,
+	 31000,  51500,  70000,  88500, 107000, 125500, 144000, 162500, 181000, 199500,
+	218000, 236500, 255000, 273500,                   294500, 311200, 327900,
+	 33000,  57000,  75500,  94000, 112500, 131000, 149500, 168000, 186500, 205000,
+	223500, 242000, 267500,                           294500, 311200, 327900, 344600,
+	 37000,  66000,  84500, 103000, 121500, 140000, 158500, 177000, 195500, 214000,
+	232500, 251500, 273500,                           294500, 311200, 327900,
+	 28000,  47500,  66000,  84500, 140000, 195500, 214000, 234000, 255000, 273500,
+	292000,                                           311200, 327900, 344600
+};
+
+static const u32 sirius_16_ansii_kbl_mapping_pos_y[] = {
+	 53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000,
+	 53000,  53000,  53000,  53000,  53000,  53000,    53000,  53000,  53000,  53000,
+	 67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500,
+	 67500,  67500,  67500,  67500,                    67500,  67500,  67500,  67500,
+	 85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500,
+	 85500,  85500,  85500,  85500,                    85500,  85500,  85500,
+	103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500,
+	103500, 103500, 103500,                           103500, 103500, 103500,  94500,
+	121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500,
+	121500, 121500, 129000,                           121500, 121500, 121500,
+	139500, 139500, 139500, 139500, 139500, 139500, 139500, 139500, 147000, 147000,
+	147000,                                           139500, 139500, 130500
+};
+
+static const u32 sirius_16_ansii_kbl_mapping_pos_z[] = {
+	  5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000,
+	  5000,   5000,   5000,   5000,   5000,   5000,     5000,   5000,   5000,   5000,
+	  5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250,
+	  5250,   5250,   5250,   5250,                     5250,   5250,   5250,   5250,
+	  5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500,
+	  5500,   5500,   5500,   5500,                     5500,   5500,   5500,
+	  5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750,
+	  5750,   5750,   5750,                             5750,   5750,   5750,   5625,
+	  6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000,
+	  6000,   6000,   6125,                             6000,   6000,   6000,
+	  6250,   6250,   6250,   6250,   6250,   6250,   6250,   6250,   6375,   6375,
+	  6375,                                             6250,   6250,   6125
+};
+
+static const u8 sirius_16_iso_kbl_mapping[] = {
+	0x29, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x41, 0x42,
+	0x43, 0x44, 0x45, 0xf1, 0x46, 0x4c,   0x4a, 0x4d, 0x4b, 0x4e,
+	0x35, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
+	0x27, 0x2d, 0x2e, 0x2a,               0x53, 0x55, 0x54, 0x56,
+	0x2b, 0x14, 0x1a, 0x08, 0x15, 0x17, 0x1c, 0x18, 0x0c, 0x12,
+	0x13, 0x2f, 0x30,                     0x5f, 0x60, 0x61,
+	0x39, 0x04, 0x16, 0x07, 0x09, 0x0a, 0x0b, 0x0d, 0x0e, 0x0f,
+	0x33, 0x34, 0x32, 0x28,               0x5c, 0x5d, 0x5e, 0x57,
+	0xe1, 0x64, 0x1d, 0x1b, 0x06, 0x19, 0x05, 0x11, 0x10, 0x36,
+	0x37, 0x38, 0xe5, 0x52,               0x59, 0x5a, 0x5b,
+	0xe0, 0xfe, 0xe3, 0xe2, 0x2c, 0xe6, 0x65, 0xe4, 0x50, 0x51,
+	0x4f,                                 0x62, 0x63, 0x58
+};
+
+static const u32 sirius_16_iso_kbl_mapping_pos_x[] = {
+	 25000,  41700,  58400,  75100,  91800, 108500, 125200, 141900, 158600, 175300,
+	192000, 208700, 225400, 242100, 258800, 275500,   294500, 311200, 327900, 344600,
+	 24500,  42500,  61000,  79500,  98000, 116500, 135000, 153500, 172000, 190500,
+	209000, 227500, 246000, 269500,                   294500, 311200, 327900, 344600,
+	 31000,  51500,  70000,  88500, 107000, 125500, 144000, 162500, 181000, 199500,
+	218000, 234500, 251000,                           294500, 311200, 327900,
+	 33000,  57000,  75500,  94000, 112500, 131000, 149500, 168000, 186500, 205000,
+	223500, 240000, 256500, 271500,                   294500, 311200, 327900, 344600,
+	 28000,  47500,  66000,  84500, 103000, 121500, 140000, 158500, 177000, 195500,
+	214000, 232500, 251500, 273500,                   294500, 311200, 327900,
+	 28000,  47500,  66000,  84500, 140000, 195500, 214000, 234000, 255000, 273500,
+	292000,                                           311200, 327900, 344600
+};
+
+static const u32 sirius_16_iso_kbl_mapping_pos_y[] = {
+	 53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000,
+	 53000,  53000,  53000,  53000,  53000,  53000,    53000,  53000,  53000,  53000,
+	 67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500,
+	 67500,  67500,  67500,  67500,                    67500,  67500,  67500,  67500,
+	 85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500,
+	 85500,  85500,  85500,                            85500,  85500,  85500,
+	103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500,
+	103500, 103500, 103500,  94500,                   103500, 103500, 103500,  94500,
+	121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500,
+	121500, 121500, 121500, 129000,                   121500, 121500, 121500,
+	139500, 139500, 139500, 139500, 139500, 139500, 139500, 139500, 147000, 147000,
+	147000,                                           139500, 139500, 130500
+};
+
+static const u32 sirius_16_iso_kbl_mapping_pos_z[] = {
+	  5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000,
+	  5000,   5000,   5000,   5000, 5000, 5000,         5000,   5000,   5000,   5000,
+	  5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250,
+	  5250,   5250,   5250,   5250,                     5250,   5250,   5250,   5250,
+	  5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500,
+	  5500,   5500,   5500,                             5500,   5500,   5500,
+	  5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750,
+	  5750,   5750,   5750,   5750,                     5750,   5750,   5750,   5625,
+	  6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000,
+	  6000,   6000,   6000,   6125,                     6000,   6000,   6000,
+	  6250,   6250,   6250,   6250,   6250,   6250,   6250,   6250,   6375,   6375,
+	  6375,                                             6250,   6250,   6125
+};
+
+struct driver_data_t {
+	u8 keyboard_type;
+	u8 lamp_count;
+	u8 next_lamp_id;
+	union tux_wmi_xx_496in_80out_in_t next_kbl_set_multiple_keys_input;
+};
+
+
+static int ll_start(struct hid_device *hdev)
+{
+	struct wmi_device *wdev = to_wmi_device(hdev->dev.parent);
+	struct driver_data_t *driver_data;
+	int ret;
+
+	union tux_wmi_xx_8in_80out_in_t input;
+	union tux_wmi_xx_8in_80out_out_t output;
+
+	driver_data = devm_kzalloc(&hdev->dev, sizeof(*driver_data), GFP_KERNEL);
+	if (!driver_data)
+		return -ENOMEM;
+
+	input.get_device_status_input.device_type = WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_KEYBOARD;
+	ret = tux_wmi_xx_8in_80out(wdev, WMI_AB_GET_DEVICE_STATUS, &input,
+				   &output);
+	if (ret)
+		return ret;
+
+	driver_data->keyboard_type = output.get_device_status_output.keyboard_physical_layout;
+	driver_data->lamp_count = sizeof(sirius_16_ansii_kbl_mapping);
+	driver_data->next_lamp_id = 0;
+
+	dev_set_drvdata(&hdev->dev, driver_data);
+
+	return ret;
+}
+
+
+static void ll_stop(struct hid_device __always_unused *hdev)
+{
+}
+
+
+static int ll_open(struct hid_device __always_unused *hdev)
+{
+	return 0;
+}
+
+
+static void ll_close(struct hid_device __always_unused *hdev)
+{
+}
+
+
+static u8 report_descriptor[327] = {
+	0x05, 0x59,			// Usage Page (Lighting and Illumination)
+	0x09, 0x01,			// Usage (Lamp Array)
+	0xa1, 0x01,			// Collection (Application)
+	0x85, LAMP_ARRAY_ATTRIBUTES_REPORT_ID, //  Report ID (1)
+	0x09, 0x02,			//  Usage (Lamp Array Attributes Report)
+	0xa1, 0x02,			//  Collection (Logical)
+	0x09, 0x03,			//   Usage (Lamp Count)
+	0x15, 0x00,			//   Logical Minimum (0)
+	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
+	0x75, 0x10,			//   Report Size (16)
+	0x95, 0x01,			//   Report Count (1)
+	0xb1, 0x03,			//   Feature (Cnst,Var,Abs)
+	0x09, 0x04,			//   Usage (Bounding Box Width In Micrometers)
+	0x09, 0x05,			//   Usage (Bounding Box Height In Micrometers)
+	0x09, 0x06,			//   Usage (Bounding Box Depth In Micrometers)
+	0x09, 0x07,			//   Usage (Lamp Array Kind)
+	0x09, 0x08,			//   Usage (Min Update Interval In Microseconds)
+	0x15, 0x00,			//   Logical Minimum (0)
+	0x27, 0xff, 0xff, 0xff, 0x7f,	//   Logical Maximum (2147483647)
+	0x75, 0x20,			//   Report Size (32)
+	0x95, 0x05,			//   Report Count (5)
+	0xb1, 0x03,			//   Feature (Cnst,Var,Abs)
+	0xc0,				//  End Collection
+	0x85, LAMP_ATTRIBUTES_REQUEST_REPORT_ID, //  Report ID (2)
+	0x09, 0x20,			//  Usage (Lamp Attributes Request Report)
+	0xa1, 0x02,			//  Collection (Logical)
+	0x09, 0x21,			//   Usage (Lamp Id)
+	0x15, 0x00,			//   Logical Minimum (0)
+	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
+	0x75, 0x10,			//   Report Size (16)
+	0x95, 0x01,			//   Report Count (1)
+	0xb1, 0x02,			//   Feature (Data,Var,Abs)
+	0xc0,				//  End Collection
+	0x85, LAMP_ATTRIBUTES_RESPONSE_REPORT_ID, //  Report ID (3)
+	0x09, 0x22,			//  Usage (Lamp Attributes Response Report)
+	0xa1, 0x02,			//  Collection (Logical)
+	0x09, 0x21,			//   Usage (Lamp Id)
+	0x15, 0x00,			//   Logical Minimum (0)
+	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
+	0x75, 0x10,			//   Report Size (16)
+	0x95, 0x01,			//   Report Count (1)
+	0xb1, 0x02,			//   Feature (Data,Var,Abs)
+	0x09, 0x23,			//   Usage (Position X In Micrometers)
+	0x09, 0x24,			//   Usage (Position Y In Micrometers)
+	0x09, 0x25,			//   Usage (Position Z In Micrometers)
+	0x09, 0x27,			//   Usage (Update Latency In Microseconds)
+	0x09, 0x26,			//   Usage (Lamp Purposes)
+	0x15, 0x00,			//   Logical Minimum (0)
+	0x27, 0xff, 0xff, 0xff, 0x7f,	//   Logical Maximum (2147483647)
+	0x75, 0x20,			//   Report Size (32)
+	0x95, 0x05,			//   Report Count (5)
+	0xb1, 0x02,			//   Feature (Data,Var,Abs)
+	0x09, 0x28,			//   Usage (Red Level Count)
+	0x09, 0x29,			//   Usage (Green Level Count)
+	0x09, 0x2a,			//   Usage (Blue Level Count)
+	0x09, 0x2b,			//   Usage (Intensity Level Count)
+	0x09, 0x2c,			//   Usage (Is Programmable)
+	0x09, 0x2d,			//   Usage (Input Binding)
+	0x15, 0x00,			//   Logical Minimum (0)
+	0x26, 0xff, 0x00,		//   Logical Maximum (255)
+	0x75, 0x08,			//   Report Size (8)
+	0x95, 0x06,			//   Report Count (6)
+	0xb1, 0x02,			//   Feature (Data,Var,Abs)
+	0xc0,				//  End Collection
+	0x85, LAMP_MULTI_UPDATE_REPORT_ID, //  Report ID (4)
+	0x09, 0x50,			//  Usage (Lamp Multi Update Report)
+	0xa1, 0x02,			//  Collection (Logical)
+	0x09, 0x03,			//   Usage (Lamp Count)
+	0x09, 0x55,			//   Usage (Lamp Update Flags)
+	0x15, 0x00,			//   Logical Minimum (0)
+	0x25, 0x08,			//   Logical Maximum (8)
+	0x75, 0x08,			//   Report Size (8)
+	0x95, 0x02,			//   Report Count (2)
+	0xb1, 0x02,			//   Feature (Data,Var,Abs)
+	0x09, 0x21,			//   Usage (Lamp Id)
+	0x15, 0x00,			//   Logical Minimum (0)
+	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
+	0x75, 0x10,			//   Report Size (16)
+	0x95, 0x08,			//   Report Count (8)
+	0xb1, 0x02,			//   Feature (Data,Var,Abs)
+	0x09, 0x51,			//   Usage (Red Update Channel)
+	0x09, 0x52,			//   Usage (Green Update Channel)
+	0x09, 0x53,			//   Usage (Blue Update Channel)
+	0x09, 0x54,			//   Usage (Intensity Update Channel)
+	0x09, 0x51,			//   Usage (Red Update Channel)
+	0x09, 0x52,			//   Usage (Green Update Channel)
+	0x09, 0x53,			//   Usage (Blue Update Channel)
+	0x09, 0x54,			//   Usage (Intensity Update Channel)
+	0x09, 0x51,			//   Usage (Red Update Channel)
+	0x09, 0x52,			//   Usage (Green Update Channel)
+	0x09, 0x53,			//   Usage (Blue Update Channel)
+	0x09, 0x54,			//   Usage (Intensity Update Channel)
+	0x09, 0x51,			//   Usage (Red Update Channel)
+	0x09, 0x52,			//   Usage (Green Update Channel)
+	0x09, 0x53,			//   Usage (Blue Update Channel)
+	0x09, 0x54,			//   Usage (Intensity Update Channel)
+	0x09, 0x51,			//   Usage (Red Update Channel)
+	0x09, 0x52,			//   Usage (Green Update Channel)
+	0x09, 0x53,			//   Usage (Blue Update Channel)
+	0x09, 0x54,			//   Usage (Intensity Update Channel)
+	0x09, 0x51,			//   Usage (Red Update Channel)
+	0x09, 0x52,			//   Usage (Green Update Channel)
+	0x09, 0x53,			//   Usage (Blue Update Channel)
+	0x09, 0x54,			//   Usage (Intensity Update Channel)
+	0x09, 0x51,			//   Usage (Red Update Channel)
+	0x09, 0x52,			//   Usage (Green Update Channel)
+	0x09, 0x53,			//   Usage (Blue Update Channel)
+	0x09, 0x54,			//   Usage (Intensity Update Channel)
+	0x09, 0x51,			//   Usage (Red Update Channel)
+	0x09, 0x52,			//   Usage (Green Update Channel)
+	0x09, 0x53,			//   Usage (Blue Update Channel)
+	0x09, 0x54,			//   Usage (Intensity Update Channel)
+	0x15, 0x00,			//   Logical Minimum (0)
+	0x26, 0xff, 0x00,		//   Logical Maximum (255)
+	0x75, 0x08,			//   Report Size (8)
+	0x95, 0x20,			//   Report Count (32)
+	0xb1, 0x02,			//   Feature (Data,Var,Abs)
+	0xc0,				//  End Collection
+	0x85, LAMP_RANGE_UPDATE_REPORT_ID, //  Report ID (5)
+	0x09, 0x60,			//  Usage (Lamp Range Update Report)
+	0xa1, 0x02,			//  Collection (Logical)
+	0x09, 0x55,			//   Usage (Lamp Update Flags)
+	0x15, 0x00,			//   Logical Minimum (0)
+	0x25, 0x08,			//   Logical Maximum (8)
+	0x75, 0x08,			//   Report Size (8)
+	0x95, 0x01,			//   Report Count (1)
+	0xb1, 0x02,			//   Feature (Data,Var,Abs)
+	0x09, 0x61,			//   Usage (Lamp Id Start)
+	0x09, 0x62,			//   Usage (Lamp Id End)
+	0x15, 0x00,			//   Logical Minimum (0)
+	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
+	0x75, 0x10,			//   Report Size (16)
+	0x95, 0x02,			//   Report Count (2)
+	0xb1, 0x02,			//   Feature (Data,Var,Abs)
+	0x09, 0x51,			//   Usage (Red Update Channel)
+	0x09, 0x52,			//   Usage (Green Update Channel)
+	0x09, 0x53,			//   Usage (Blue Update Channel)
+	0x09, 0x54,			//   Usage (Intensity Update Channel)
+	0x15, 0x00,			//   Logical Minimum (0)
+	0x26, 0xff, 0x00,		//   Logical Maximum (255)
+	0x75, 0x08,			//   Report Size (8)
+	0x95, 0x04,			//   Report Count (4)
+	0xb1, 0x02,			//   Feature (Data,Var,Abs)
+	0xc0,				//  End Collection
+	0x85, LAMP_ARRAY_CONTROL_REPORT_ID, //  Report ID (6)
+	0x09, 0x70,			//  Usage (Lamp Array Control Report)
+	0xa1, 0x02,			//  Collection (Logical)
+	0x09, 0x71,			//   Usage (Autonomous Mode)
+	0x15, 0x00,			//   Logical Minimum (0)
+	0x25, 0x01,			//   Logical Maximum (1)
+	0x75, 0x08,			//   Report Size (8)
+	0x95, 0x01,			//   Report Count (1)
+	0xb1, 0x02,			//   Feature (Data,Var,Abs)
+	0xc0,				//  End Collection
+	0xc0				// End Collection
+};
+
+static int ll_parse(struct hid_device *hdev)
+{
+	return hid_parse_report(hdev, report_descriptor,
+				sizeof(report_descriptor));
+}
+
+
+struct __packed lamp_array_attributes_report_t {
+	const u8 report_id;
+	u16 lamp_count;
+	u32 bounding_box_width_in_micrometers;
+	u32 bounding_box_height_in_micrometers;
+	u32 bounding_box_depth_in_micrometers;
+	u32 lamp_array_kind;
+	u32 min_update_interval_in_microseconds;
+};
+
+static int handle_lamp_array_attributes_report(struct hid_device *hdev,
+					       struct lamp_array_attributes_report_t *rep)
+{
+	struct driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
+
+
+	rep->lamp_count = driver_data->lamp_count;
+	rep->bounding_box_width_in_micrometers = 368000;
+	rep->bounding_box_height_in_micrometers = 266000;
+	rep->bounding_box_depth_in_micrometers = 30000;
+	/* LampArrayKindKeyboard, see "26.2.1 LampArrayKind Values" of
+	 * "HID Usage Tables v1.5"
+	 */
+	rep->lamp_array_kind = 1;
+	// Some guessed value for interval microseconds
+	rep->min_update_interval_in_microseconds = 500;
+
+	return sizeof(*rep);
+}
+
+
+struct __packed lamp_attributes_request_report_t {
+	const u8 report_id;
+	u16 lamp_id;
+};
+
+static int handle_lamp_attributes_request_report(struct hid_device *hdev,
+						 struct lamp_attributes_request_report_t *rep)
+{
+	struct driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
+
+	if (rep->lamp_id < driver_data->lamp_count)
+		driver_data->next_lamp_id = rep->lamp_id;
+	else
+		driver_data->next_lamp_id = 0;
+
+	return sizeof(*rep);
+}
+
+
+struct __packed lamp_attributes_response_report_t {
+	const u8 report_id;
+	u16 lamp_id;
+	u32 position_x_in_micrometers;
+	u32 position_y_in_micrometers;
+	u32 position_z_in_micrometers;
+	u32 update_latency_in_microseconds;
+	u32 lamp_purpose;
+	u8 red_level_count;
+	u8 green_level_count;
+	u8 blue_level_count;
+	u8 intensity_level_count;
+	u8 is_programmable;
+	u8 input_binding;
+};
+
+static int handle_lamp_attributes_response_report(struct hid_device *hdev,
+						  struct lamp_attributes_response_report_t *rep)
+{
+	struct driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
+
+	u16 lamp_id = driver_data->next_lamp_id;
+
+	const u32 *kbl_mapping_pos_x, *kbl_mapping_pos_y, *kbl_mapping_pos_z;
+	const u8 *kbl_mapping;
+
+	rep->lamp_id = lamp_id;
+	// Some guessed value for latency microseconds
+	rep->update_latency_in_microseconds = 100;
+	/* LampPurposeControl, see "26.3.1 LampPurposes Flags" of
+	 * "HID Usage Tables v1.5"
+	 */
+	rep->lamp_purpose = 1;
+	rep->red_level_count = 0xff;
+	rep->green_level_count = 0xff;
+	rep->blue_level_count = 0xff;
+	rep->intensity_level_count = 0xff;
+	rep->is_programmable = 1;
+
+	if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII) {
+		kbl_mapping = &sirius_16_ansii_kbl_mapping[0];
+		kbl_mapping_pos_x = &sirius_16_ansii_kbl_mapping_pos_x[0];
+		kbl_mapping_pos_y = &sirius_16_ansii_kbl_mapping_pos_y[0];
+		kbl_mapping_pos_z = &sirius_16_ansii_kbl_mapping_pos_z[0];
+	} else if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO) {
+		kbl_mapping = &sirius_16_iso_kbl_mapping[0];
+		kbl_mapping_pos_x = &sirius_16_iso_kbl_mapping_pos_x[0];
+		kbl_mapping_pos_y = &sirius_16_iso_kbl_mapping_pos_y[0];
+		kbl_mapping_pos_z = &sirius_16_iso_kbl_mapping_pos_z[0];
+	} else
+		return -EINVAL;
+
+	if (kbl_mapping[lamp_id] <= 0xe8)
+		rep->input_binding = kbl_mapping[lamp_id];
+	else
+		/* Everything bigger is reserved/undefined, see
+		 * "10 Keyboard/Keypad Page (0x07)" of "HID Usage Tables v1.5"
+		 * and should return 0, see "26.8.3 Lamp Attributes" of the same
+		 * document.
+		 */
+		rep->input_binding = 0;
+	rep->position_x_in_micrometers = kbl_mapping_pos_x[lamp_id];
+	rep->position_y_in_micrometers = kbl_mapping_pos_y[lamp_id];
+	rep->position_z_in_micrometers = kbl_mapping_pos_z[lamp_id];
+
+	driver_data->next_lamp_id = (driver_data->next_lamp_id + 1) % driver_data->lamp_count;
+
+	return sizeof(*rep);
+}
+
+
+#define LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE	BIT(0)
+
+struct __packed lamp_multi_update_report_t {
+	const u8 report_id;
+	u8 lamp_count;
+	u8 lamp_update_flags;
+	u16 lamp_id[8];
+	struct {
+		u8 red;
+		u8 green;
+		u8 blue;
+		u8 intensity;
+	} update_channels[8];
+};
+
+static int handle_lamp_multi_update_report(struct hid_device *hdev,
+					   struct lamp_multi_update_report_t *rep)
+{
+	struct driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
+	struct wmi_device *wdev = to_wmi_device(hdev->dev.parent);
+	int ret;
+
+	union tux_wmi_xx_496in_80out_in_t *next = &driver_data->next_kbl_set_multiple_keys_input;
+	union tux_wmi_xx_496in_80out_out_t output;
+	u8 lamp_count = 0, key_id, key_id_j, intensity_i;
+
+	/* Catching missformated lamp_multi_update_report and fail silently
+	 * according to "HID Usage Tables v1.5"
+	 */
+	for (unsigned int i = 0; i < rep->lamp_count; ++i) {
+		if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII)
+			lamp_count = sizeof(sirius_16_ansii_kbl_mapping);
+		else if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO)
+			lamp_count = sizeof(sirius_16_ansii_kbl_mapping);
+
+		if (rep->lamp_id[i] > lamp_count) {
+			hid_dbg(hdev, "Out of bounds lamp_id in lamp_multi_update_report. Skippng whole report!\n");
+			return sizeof(*rep);
+		}
+
+		for (unsigned int j = i + 1; j < rep->lamp_count; ++j) {
+			if (rep->lamp_id[i] == rep->lamp_id[j]) {
+				hid_dbg(hdev, "Duplicate lamp_id in lamp_multi_update_report. Skippng whole report!\n");
+				return sizeof(*rep);
+			}
+		}
+	}
+
+	for (unsigned int i = 0; i < rep->lamp_count; ++i) {
+		if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII)
+			key_id = sirius_16_ansii_kbl_mapping[rep->lamp_id[i]];
+		else if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO)
+			key_id = sirius_16_iso_kbl_mapping[rep->lamp_id[i]];
+
+		for (unsigned int j = 0;
+		     j < WMI_AB_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_COUNT_MAX; ++j) {
+			key_id_j = next->kbl_set_multiple_keys_input.lighting_settings[j].key_id;
+			if (key_id_j == 0x00 || key_id_j == key_id) {
+				if (key_id_j == 0x00)
+					next->kbl_set_multiple_keys_input.lighting_setting_count =
+						j + 1;
+				next->kbl_set_multiple_keys_input.lighting_settings[j].key_id =
+					key_id;
+				/* While this driver respects
+				 * intensity_update_channel according to "HID
+				 * Usage Tables v1.5" also on RGB leds, the
+				 * Microsoft MacroPad reference implementation
+				 * (https://github.com/microsoft/RP2040MacropadHidSample
+				 * 1d6c3ad) does not and ignores it. If it turns
+				 * out that Windows writes intensity = 0 for RGB
+				 * leds instead of intensity = 255, this driver
+				 * should also ignore the
+				 * intensity_update_channel.
+				 */
+				intensity_i = rep->update_channels[i].intensity;
+				next->kbl_set_multiple_keys_input.lighting_settings[j].red =
+					rep->update_channels[i].red * intensity_i / 0xff;
+				next->kbl_set_multiple_keys_input.lighting_settings[j].green =
+					rep->update_channels[i].green * intensity_i / 0xff;
+				next->kbl_set_multiple_keys_input.lighting_settings[j].blue =
+					rep->update_channels[i].blue * intensity_i / 0xff;
+
+				break;
+			}
+		}
+	}
+
+	if (rep->lamp_update_flags & LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE) {
+		ret = tux_wmi_xx_496in_80out(wdev, WMI_AB_KBL_SET_MULTIPLE_KEYS,
+					     next, &output);
+		memset(next, 0, sizeof(union tux_wmi_xx_496in_80out_in_t));
+		if (ret)
+			return ret;
+	}
+
+	return sizeof(*rep);
+}
+
+
+struct __packed lamp_range_update_report_t {
+	const u8 report_id;
+	u8 lamp_update_flags;
+	u16 lamp_id_start;
+	u16 lamp_id_end;
+	u8 red_update_channel;
+	u8 green_update_channel;
+	u8 blue_update_channel;
+	u8 intensity_update_channel;
+};
+
+static int handle_lamp_range_update_report(struct hid_device *hdev,
+					   struct lamp_range_update_report_t *rep)
+{
+	struct driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
+	int ret;
+
+	u8 lamp_count;
+
+	struct lamp_multi_update_report_t lamp_multi_update_report = {
+		.report_id = LAMP_MULTI_UPDATE_REPORT_ID
+	};
+
+	/* Catching missformated lamp_range_update_report and fail silently
+	 * according to "HID Usage Tables v1.5"
+	 */
+	if (rep->lamp_id_start > rep->lamp_id_end) {
+		hid_dbg(hdev, "lamp_id_start > lamp_id_end in lamp_range_update_report. Skippng whole report!\n");
+		return sizeof(*rep);
+	}
+
+	if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII)
+		lamp_count = sizeof(sirius_16_ansii_kbl_mapping);
+	else if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO)
+		lamp_count = sizeof(sirius_16_ansii_kbl_mapping);
+
+	if (rep->lamp_id_end > lamp_count - 1) {
+		hid_dbg(hdev, "Out of bounds lamp_id_* in lamp_range_update_report. Skippng whole report!\n");
+		return sizeof(*rep);
+	}
+
+	/* Break handle_lamp_range_update_report call down to multiple
+	 * handle_lamp_multi_update_report calls to easily ensure that mixing
+	 * handle_lamp_range_update_report and handle_lamp_multi_update_report
+	 * does not break things.
+	 */
+	for (unsigned int i = rep->lamp_id_start; i < rep->lamp_id_end + 1; i = i + 8) {
+		lamp_multi_update_report.lamp_count = min(rep->lamp_id_end + 1 - i, 8);
+		if (i + lamp_multi_update_report.lamp_count == rep->lamp_id_end + 1)
+			lamp_multi_update_report.lamp_update_flags |=
+				LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE;
+
+		for (unsigned int j = 0; j < lamp_multi_update_report.lamp_count; ++j) {
+			lamp_multi_update_report.lamp_id[j] = i + j;
+			lamp_multi_update_report.update_channels[j].red =
+				rep->red_update_channel;
+			lamp_multi_update_report.update_channels[j].green =
+				rep->green_update_channel;
+			lamp_multi_update_report.update_channels[j].blue =
+				rep->blue_update_channel;
+			lamp_multi_update_report.update_channels[j].intensity =
+				rep->intensity_update_channel;
+		}
+
+		ret = handle_lamp_multi_update_report(hdev, &lamp_multi_update_report);
+		if (ret < 0)
+			return ret;
+		else if (ret != sizeof(struct lamp_multi_update_report_t))
+			return -EIO;
+	}
+
+	return sizeof(*rep);
+}
+
+
+struct __packed lamp_array_control_report_t {
+	const u8 report_id;
+	u8 autonomous_mode;
+};
+
+static int handle_lamp_array_control_report(struct hid_device __always_unused *hdev,
+					    struct lamp_array_control_report_t __always_unused *rep)
+{
+	/* The keyboard firmware doesn't have any built in effects or controls
+	 * so this is a NOOP.
+	 * According to the HID Documentation (HID Usage Tables v1.5) this
+	 * function is optional and can be removed from the HID Report
+	 * Descriptor, but it should first be confirmed that userspace respects
+	 * this possibility too. The Microsoft MacroPad reference implementation
+	 * (https://github.com/microsoft/RP2040MacropadHidSample 1d6c3ad)
+	 * already deviates from the spec at another point, see
+	 * handle_lamp_*_update_report.
+	 */
+
+	return sizeof(*rep);
+}
+
+
+static int ll_raw_request(struct hid_device *hdev,
+			  unsigned char reportnum, __u8 *buf,
+			  size_t len,
+			  unsigned char rtype,
+			  int reqtype)
+{
+	if (rtype != HID_FEATURE_REPORT)
+		return -EINVAL;
+
+	switch (reqtype) {
+	case HID_REQ_GET_REPORT:
+		switch (reportnum) {
+		case LAMP_ARRAY_ATTRIBUTES_REPORT_ID:
+			if (len != sizeof(struct lamp_array_attributes_report_t))
+				return -EINVAL;
+			return handle_lamp_array_attributes_report(hdev,
+				(struct lamp_array_attributes_report_t *)buf);
+		case LAMP_ATTRIBUTES_RESPONSE_REPORT_ID:
+			if (len != sizeof(struct lamp_attributes_response_report_t))
+				return -EINVAL;
+			return handle_lamp_attributes_response_report(hdev,
+				(struct lamp_attributes_response_report_t *)buf);
+		}
+		break;
+	case HID_REQ_SET_REPORT:
+		switch (reportnum) {
+		case LAMP_ATTRIBUTES_REQUEST_REPORT_ID:
+			if (len != sizeof(struct lamp_attributes_request_report_t))
+				return -EINVAL;
+			return handle_lamp_attributes_request_report(hdev,
+				(struct lamp_attributes_request_report_t *)buf);
+		case LAMP_MULTI_UPDATE_REPORT_ID:
+			if (len != sizeof(struct lamp_multi_update_report_t))
+				return -EINVAL;
+			return handle_lamp_multi_update_report(hdev,
+				(struct lamp_multi_update_report_t *)buf);
+		case LAMP_RANGE_UPDATE_REPORT_ID:
+			if (len != sizeof(struct lamp_range_update_report_t))
+				return -EINVAL;
+			return handle_lamp_range_update_report(hdev,
+				(struct lamp_range_update_report_t *)buf);
+		case LAMP_ARRAY_CONTROL_REPORT_ID:
+			if (len != sizeof(struct lamp_array_control_report_t))
+				return -EINVAL;
+			return handle_lamp_array_control_report(hdev,
+				(struct lamp_array_control_report_t *)buf);
+		}
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static const struct hid_ll_driver ll_driver = {
+	.start = &ll_start,
+	.stop = &ll_stop,
+	.open = &ll_open,
+	.close = &ll_close,
+	.parse = &ll_parse,
+	.raw_request = &ll_raw_request,
+};
+
+int tux_virt_lamparray_add_device(struct wmi_device *wdev,
+				  struct hid_device **hdev_out)
+{
+	struct hid_device *hdev;
+	int ret;
+
+	dev_dbg(&wdev->dev, "Adding TUXEDO NB04 Virtual LampArray device.\n");
+
+	hdev = hid_allocate_device();
+	if (IS_ERR(hdev))
+		return PTR_ERR(hdev);
+	*hdev_out = hdev;
+
+	strscpy(hdev->name, "TUXEDO NB04 RGB Lighting", sizeof(hdev->name));
+
+	hdev->ll_driver = &ll_driver;
+	hdev->bus = BUS_VIRTUAL;
+	hdev->vendor = 0x21ba;
+	hdev->product = 0x0400;
+	hdev->dev.parent = &wdev->dev;
+
+	ret = hid_add_device(hdev);
+	if (ret)
+		hid_destroy_device(hdev);
+	return ret;
+}
+EXPORT_SYMBOL(tux_virt_lamparray_add_device);
diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab_virt_lamparray.h b/drivers/platform/x86/tuxedo/nb04/wmi_ab_virt_lamparray.h
new file mode 100644
index 0000000000000..2a8c986734777
--- /dev/null
+++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab_virt_lamparray.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This code gives the built in RGB lighting of the TUXEDO NB04 devices a
+ * standardised interface, namely HID LampArray.
+ *
+ * Copyright (C) 2024-2025 Werner Sembach <wse@tuxedocomputers.com>
+ */
+
+#ifndef TUXEDO_NB04_WMI_AB_VIRTUAL_LAMP_ARRAY_H
+#define TUXEDO_NB04_WMI_AB_VIRTUAL_LAMP_ARRAY_H
+
+#include <linux/hid.h>
+#include <linux/wmi.h>
+
+int tux_virt_lamparray_add_device(struct wmi_device *wdev,
+				  struct hid_device **hdev_out);
+
+#endif
diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_xx_util.c b/drivers/platform/x86/tuxedo/nb04/wmi_xx_util.c
new file mode 100644
index 0000000000000..c370f2cdfe205
--- /dev/null
+++ b/drivers/platform/x86/tuxedo/nb04/wmi_xx_util.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This code gives functions to avoid code duplication while interacting with
+ * the TUXEDO NB04 wmi interfaces.
+ *
+ * Copyright (C) 2024-2025 Werner Sembach <wse@tuxedocomputers.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/wmi.h>
+
+#include "wmi_ab_init.h"
+
+#include "wmi_xx_util.h"
+
+static int __wmi_method_acpi_object_out(struct wmi_device *wdev,
+					u32 wmi_method_id,
+					u8 *in,
+					acpi_size in_len,
+					union acpi_object **out)
+{
+	struct acpi_buffer acpi_buffer_in = { in_len, in };
+	struct acpi_buffer acpi_buffer_out = { ACPI_ALLOCATE_BUFFER, NULL };
+
+	dev_dbg(&wdev->dev, "Evaluate WMI method: %u in:\n", wmi_method_id);
+	print_hex_dump_bytes("", DUMP_PREFIX_OFFSET, in, in_len);
+
+	acpi_status status = wmidev_evaluate_method(wdev, 0, wmi_method_id,
+						    &acpi_buffer_in,
+						    &acpi_buffer_out);
+	if (ACPI_FAILURE(status)) {
+		dev_err(&wdev->dev, "Failed to evaluate WMI method.\n");
+		return -EIO;
+	}
+	if (!acpi_buffer_out.pointer) {
+		dev_err(&wdev->dev, "Unexpected empty out buffer.\n");
+		return -ENODATA;
+	}
+
+	*out = acpi_buffer_out.pointer;
+
+	return 0;
+}
+
+static int __wmi_method_buffer_out(struct wmi_device *wdev,
+				   u32 wmi_method_id,
+				   u8 *in,
+				   acpi_size in_len,
+				   u8 *out,
+				   acpi_size out_len)
+{
+	int ret;
+
+	union acpi_object *acpi_object_out = NULL;
+
+	ret = __wmi_method_acpi_object_out(wdev, wmi_method_id,
+					   in, in_len,
+					   &acpi_object_out);
+	if (ret)
+		return ret;
+
+	if (acpi_object_out->type != ACPI_TYPE_BUFFER) {
+		dev_err(&wdev->dev, "Unexpected out buffer type. Expected: %u Got: %u\n",
+			ACPI_TYPE_BUFFER, acpi_object_out->type);
+		goto err;
+	}
+	if (acpi_object_out->buffer.length < out_len) {
+		dev_err(&wdev->dev, "Unexpected out buffer length.\n");
+		goto err;
+	}
+
+	memcpy(out, acpi_object_out->buffer.pointer, out_len);
+	kfree(acpi_object_out);
+
+	return ret;
+
+err:
+	kfree(acpi_object_out);
+	return -EIO;
+}
+
+int tux_wmi_xx_8in_80out(struct wmi_device *wdev,
+			 enum tux_wmi_xx_8in_80out_methods method,
+			 union tux_wmi_xx_8in_80out_in_t *in,
+			 union tux_wmi_xx_8in_80out_out_t *out)
+{
+	return __wmi_method_buffer_out(wdev, method, in->raw, 8, out->raw, 80);
+}
+
+int tux_wmi_xx_496in_80out(struct wmi_device *wdev,
+			   enum tux_wmi_xx_496in_80out_methods method,
+			   union tux_wmi_xx_496in_80out_in_t *in,
+			   union tux_wmi_xx_496in_80out_out_t *out)
+{
+	return __wmi_method_buffer_out(wdev, method, in->raw, 496, out->raw, 80);
+}
diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_xx_util.h b/drivers/platform/x86/tuxedo/nb04/wmi_xx_util.h
new file mode 100644
index 0000000000000..59d2cc236bc5f
--- /dev/null
+++ b/drivers/platform/x86/tuxedo/nb04/wmi_xx_util.h
@@ -0,0 +1,112 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This code gives functions to avoid code duplication while interacting with
+ * the TUXEDO NB04 wmi interfaces.
+ *
+ * Copyright (C) 2024-2025 Werner Sembach <wse@tuxedocomputers.com>
+ */
+
+#ifndef TUXEDO_NB04_WMI_UTIL_H
+#define TUXEDO_NB04_WMI_UTIL_H
+
+#include <linux/wmi.h>
+
+#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_TOUCHPAD	1
+#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_KEYBOARD	2
+#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_APP_PAGES	3
+
+#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_NONE		0
+#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_PER_KEY	1
+#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_FOUR_ZONE	2
+#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_WHITE_ONLY	3
+
+#define WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII	0
+#define WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO	1
+
+#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_RED		1
+#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_GREEN		2
+#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_YELLOW	3
+#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_BLUE		4
+#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_PURPLE	5
+#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_INDIGO	6
+#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_WHITE		7
+
+#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_DASHBOARD	BIT(0)
+#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_SYSTEMINFOS	BIT(1)
+#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_KBL		BIT(2)
+#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_HOTKEYS	BIT(3)
+
+
+union tux_wmi_xx_8in_80out_in_t {
+	u8 raw[8];
+	struct __packed {
+		u8 device_type;
+		u8 reserved[7];
+	} get_device_status_input;
+};
+
+union tux_wmi_xx_8in_80out_out_t {
+	u8 raw[80];
+	struct __packed {
+		u16 return_status;
+		u8 device_enabled;
+		u8 kbl_type;
+		u8 kbl_side_bar_supported;
+		u8 keyboard_physical_layout;
+		u8 app_pages;
+		u8 per_key_kbl_default_color;
+		u8 four_zone_kbl_default_color_1;
+		u8 four_zone_kbl_default_color_2;
+		u8 four_zone_kbl_default_color_3;
+		u8 four_zone_kbl_default_color_4;
+		u8 light_bar_kbl_default_color;
+		u8 reserved_0[1];
+		u16 dedicated_gpu_id;
+		u8 reserved_1[64];
+	} get_device_status_output;
+};
+
+enum tux_wmi_xx_8in_80out_methods {
+	WMI_AB_GET_DEVICE_STATUS	= 2,
+};
+
+
+#define WMI_AB_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_COUNT_MAX	120
+
+union tux_wmi_xx_496in_80out_in_t {
+	u8 raw[496];
+	struct __packed {
+		u8 reserved[15];
+		u8 lighting_setting_count;
+		struct {
+			u8 key_id;
+			u8 red;
+			u8 green;
+			u8 blue;
+		} lighting_settings[WMI_AB_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_COUNT_MAX];
+	}  kbl_set_multiple_keys_input;
+};
+
+union tux_wmi_xx_496in_80out_out_t {
+	u8 raw[80];
+	struct __packed {
+		u8 return_value;
+		u8 reserved[79];
+	} kbl_set_multiple_keys_output;
+};
+
+enum tux_wmi_xx_496in_80out_methods {
+	WMI_AB_KBL_SET_MULTIPLE_KEYS	= 6,
+};
+
+
+int tux_wmi_xx_8in_80out(struct wmi_device *wdev,
+			 enum tux_wmi_xx_8in_80out_methods method,
+			 union tux_wmi_xx_8in_80out_in_t *in,
+			 union tux_wmi_xx_8in_80out_out_t *out);
+int tux_wmi_xx_496in_80out(struct wmi_device *wdev,
+			   enum tux_wmi_xx_496in_80out_methods method,
+			   union tux_wmi_xx_496in_80out_in_t *in,
+			   union tux_wmi_xx_496in_80out_out_t *out);
+
+#endif
-- 
2.43.0

