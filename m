Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 812B5367455
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 22:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4885889F24;
	Wed, 21 Apr 2021 20:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B3E6EA0B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 20:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619038105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OQuBmg3MoSWWm1tU73jrw+1vKzevGcmSLLh43Uy96Wk=;
 b=LYjMkxrQorNjciuh8YW6qmTE9J0ok53ZYNmcFHdoIWR0ewp6+o1nqpjVLwmigHH6DB/hyh
 tUvlDX5TPR5jihuj9Y/mgJwDlnUsxEqlA00MvXx6iHXywG0X0N5Hiq3Th87uYthgWemvU2
 YR6tJdpSgBbYotDZvFMc8L45zaUe4KI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-6qI_brSCM3OgYmQPIEJkGA-1; Wed, 21 Apr 2021 16:48:23 -0400
X-MC-Unique: 6qI_brSCM3OgYmQPIEJkGA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB27E8189C7;
 Wed, 21 Apr 2021 20:48:20 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-17.ams2.redhat.com [10.36.112.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70C275D736;
 Wed, 21 Apr 2021 20:48:17 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Rajat Jain <rajatja@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mark Gross <mgross@linux.intel.com>,
 Andy Shevchenko <andy@infradead.org>
Subject: [PATCH v2 3/9] drm/privacy-screen: Add X86 specific arch init code
Date: Wed, 21 Apr 2021 22:47:58 +0200
Message-Id: <20210421204804.589962-4-hdegoede@redhat.com>
In-Reply-To: <20210421204804.589962-1-hdegoede@redhat.com>
References: <20210421204804.589962-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Marco Trevisan <marco.trevisan@canonical.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Sebastien Bacher <seb128@ubuntu.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Mark Pearson <markpearson@lenovo.com>,
 Mario Limonciello <mario.limonciello@outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add X86 specific arch init code, which fills the privacy-screen lookup
table by checking for various vendor specific ACPI interfaces for
controlling the privacy-screen.

This initial version only checks for the Lenovo Thinkpad specific ACPI
methods for privacy-screen control.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/Makefile                 |  2 +-
 drivers/gpu/drm/drm_privacy_screen_x86.c | 86 ++++++++++++++++++++++++
 include/drm/drm_privacy_screen_machine.h |  5 ++
 3 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_privacy_screen_x86.c

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 578853d18a3d..2e226b57de24 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -32,7 +32,7 @@ drm-$(CONFIG_AGP) += drm_agpsupport.o
 drm-$(CONFIG_PCI) += drm_pci.o
 drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
 drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
-drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o
+drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o drm_privacy_screen_x86.o
 
 drm_vram_helper-y := drm_gem_vram_helper.o
 obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
new file mode 100644
index 000000000000..a2cafb294ca6
--- /dev/null
+++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (C) 2020 Red Hat, Inc.
+ *
+ * Authors:
+ * Hans de Goede <hdegoede@redhat.com>
+ */
+
+#include <linux/acpi.h>
+#include <drm/drm_privacy_screen_machine.h>
+
+#ifdef CONFIG_X86
+static struct drm_privacy_screen_lookup arch_lookup;
+
+struct arch_init_data {
+	struct drm_privacy_screen_lookup lookup;
+	bool (*detect)(void);
+};
+
+#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
+static acpi_status __init acpi_set_handle(acpi_handle handle, u32 level,
+					  void *context, void **return_value)
+{
+	*(acpi_handle *)return_value = handle;
+	return AE_CTRL_TERMINATE;
+}
+
+static bool __init detect_thinkpad_privacy_screen(void)
+{
+	union acpi_object obj = { .type = ACPI_TYPE_INTEGER };
+	struct acpi_object_list args = { .count = 1, .pointer = &obj, };
+	acpi_handle ec_handle = NULL;
+	unsigned long long output;
+	acpi_status status;
+
+	/* Get embedded-controller handle */
+	status = acpi_get_devices("PNP0C09", acpi_set_handle, NULL, &ec_handle);
+	if (ACPI_FAILURE(status) || !ec_handle)
+		return false;
+
+	/* And call the privacy-screen get-status method */
+	status = acpi_evaluate_integer(ec_handle, "HKEY.GSSS", &args, &output);
+	if (ACPI_FAILURE(status))
+		return false;
+
+	return (output & 0x10000) ? true : false;
+}
+#endif
+
+static const struct arch_init_data arch_init_data[] __initconst = {
+#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
+	{
+		.lookup = {
+			.dev_id = NULL,
+			.con_id = NULL,
+			.provider = "privacy_screen-thinkpad_acpi",
+		},
+		.detect = detect_thinkpad_privacy_screen,
+	},
+#endif
+};
+
+void __init drm_privacy_screen_lookup_init(void)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(arch_init_data); i++) {
+		if (!arch_init_data[i].detect())
+			continue;
+
+		pr_info("Found '%s' privacy-screen provider\n",
+			arch_init_data[i].lookup.provider);
+
+		/* Make a copy because arch_init_data is __initconst */
+		arch_lookup = arch_init_data[i].lookup;
+		drm_privacy_screen_lookup_add(&arch_lookup);
+		break;
+	}
+}
+
+void drm_privacy_screen_lookup_exit(void)
+{
+	if (arch_lookup.provider)
+		drm_privacy_screen_lookup_remove(&arch_lookup);
+}
+#endif /* ifdef CONFIG_X86 */
diff --git a/include/drm/drm_privacy_screen_machine.h b/include/drm/drm_privacy_screen_machine.h
index aaa0d38cce92..02e5371904d3 100644
--- a/include/drm/drm_privacy_screen_machine.h
+++ b/include/drm/drm_privacy_screen_machine.h
@@ -31,11 +31,16 @@ struct drm_privacy_screen_lookup {
 void drm_privacy_screen_lookup_add(struct drm_privacy_screen_lookup *lookup);
 void drm_privacy_screen_lookup_remove(struct drm_privacy_screen_lookup *lookup);
 
+#if IS_ENABLED(CONFIG_DRM_PRIVACY_SCREEN) && IS_ENABLED(CONFIG_X86)
+void drm_privacy_screen_lookup_init(void);
+void drm_privacy_screen_lookup_exit(void);
+#else
 static inline void drm_privacy_screen_lookup_init(void)
 {
 }
 static inline void drm_privacy_screen_lookup_exit(void)
 {
 }
+#endif
 
 #endif
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
