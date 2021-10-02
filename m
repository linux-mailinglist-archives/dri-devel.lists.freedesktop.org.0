Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182C941FD28
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 18:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5903F6F4BE;
	Sat,  2 Oct 2021 16:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A58D6F4C3
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 16:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633192601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5tO4HhhKcsXmHZhIxRf3go0snF7w7P7Q9y2c21+kmiM=;
 b=fFepmicoFZz7I7PY7rK0MJkA6Rd+bgcv3fiBbi60acYOPhVCPnnBvWLLxYytUteLNQQ1I1
 6HR5d/mi3k448ptcKFVbXOnCfR6U+uImfsNpCw4cp6js9sMTH7BqU98LN0iz0qCBigbJIv
 V8bEJhX/3G35om6uWH8RWIn0ndoSL0w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-RjnzllY2P6CD3FpwmbmxyA-1; Sat, 02 Oct 2021 12:36:40 -0400
X-MC-Unique: RjnzllY2P6CD3FpwmbmxyA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D4E41005E4D;
 Sat,  2 Oct 2021 16:36:37 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A79B1100763D;
 Sat,  2 Oct 2021 16:36:33 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rajat Jain <rajatja@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude <lyude@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 Mark Pearson <markpearson@lenovo.com>,
 Sebastien Bacher <seb128@ubuntu.com>,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH 03/10] drm/privacy-screen: Add X86 specific arch init code
Date: Sat,  2 Oct 2021 18:36:11 +0200
Message-Id: <20211002163618.99175-4-hdegoede@redhat.com>
In-Reply-To: <20211002163618.99175-1-hdegoede@redhat.com>
References: <20211002163618.99175-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Add X86 specific arch init code, which fills the privacy-screen lookup
table by checking for various vendor specific ACPI interfaces for
controlling the privacy-screen.

This initial version only checks for the Lenovo Thinkpad specific ACPI
methods for privacy-screen control.

Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/Makefile                 |  2 +-
 drivers/gpu/drm/drm_privacy_screen_x86.c | 86 ++++++++++++++++++++++++
 include/drm/drm_privacy_screen_machine.h |  5 ++
 3 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_privacy_screen_x86.c

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 788fc37096f6..12997ca5670d 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -32,7 +32,7 @@ drm-$(CONFIG_OF) += drm_of.o
 drm-$(CONFIG_PCI) += drm_pci.o
 drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
 drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
-drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o
+drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o drm_privacy_screen_x86.o
 
 obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
 
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

