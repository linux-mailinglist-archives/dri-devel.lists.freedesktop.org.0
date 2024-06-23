Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DCF913911
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 10:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EC910E187;
	Sun, 23 Jun 2024 08:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="gmudr6v2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB77910E187;
 Sun, 23 Jun 2024 08:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1719132689;
 bh=U89xBvF/tNccWlyocvy/F0+d2O1P/5jRg3TgAdYjLq0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gmudr6v2hsgdWWkFdCfOtDLeVaNc09pZB6JmCf2Myzz2r9Bhlst/R7OeG/c8ZIw+L
 wnqFLw82rbsDtqUvuN5YC2RsFcnsmEpa317SXaI5WHxK8H2CQzxJl3lTqYIHVgWiDz
 /QdMfWp5Sfg6AB+VtbWBoHjgu5i+wxW0Lrw17giw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 23 Jun 2024 10:51:27 +0200
Subject: [PATCH v2 1/3] drm: Add panel backlight quirks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240623-amdgpu-min-backlight-quirk-v2-1-cecf7f49da9b@weissschuh.net>
References: <20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net>
In-Reply-To: <20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net>
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719132688; l=4963;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=U89xBvF/tNccWlyocvy/F0+d2O1P/5jRg3TgAdYjLq0=;
 b=j7PdKVU7XA1ADyOGT5eCUR1fny6sQZ0P4ss8CBhBMGm/8qslhxBEOU5lMnzocNkCS3whjtSvz
 S8mOs42IvHqCAPzKOg63gsrr1V+WBvyH9XdWm379XlQDGOHIz1ifMGv
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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

Panels using a PWM-controlled backlight source without an do not have a
standard way to communicate their valid PWM ranges.
On x86 the ranges are read from ACPI through driver-specific tables.
The built-in ranges are not necessarily correct, or may grow stale if an
older device can be retrofitted with newer panels.

Add a quirk infrastructure with which the valid backlight ranges can be
maintained as part of the kernel.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Documentation/gpu/drm-kms-helpers.rst        |  3 ++
 drivers/gpu/drm/Kconfig                      |  4 ++
 drivers/gpu/drm/Makefile                     |  1 +
 drivers/gpu/drm/drm_panel_backlight_quirks.c | 67 ++++++++++++++++++++++++++++
 include/drm/drm_utils.h                      | 11 +++++
 5 files changed, 86 insertions(+)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 59cfe8a7a8ba..1998a2675210 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -224,6 +224,9 @@ Panel Helper Reference
 .. kernel-doc:: drivers/gpu/drm/drm_panel_orientation_quirks.c
    :export:
 
+.. kernel-doc:: drivers/gpu/drm/drm_panel_backlight_quirks.c
+   :export:
+
 Panel Self Refresh Helper Reference
 ===================================
 
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 959b19a04101..50ccb43315bf 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -443,6 +443,10 @@ config DRM_EXPORT_FOR_TESTS
 config DRM_PANEL_ORIENTATION_QUIRKS
 	tristate
 
+# Separate option as not all DRM drivers use it
+config DRM_PANEL_BACKLIGHT_QUIRKS
+	tristate
+
 config DRM_LIB_RANDOM
 	bool
 	default n
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index f9ca4f8fa6c5..6669913b907e 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -92,6 +92,7 @@ drm-$(CONFIG_DRM_PANIC) += drm_panic.o
 obj-$(CONFIG_DRM)	+= drm.o
 
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
+obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) += drm_panel_backlight_quirks.o
 
 #
 # Memory-management helpers
diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
new file mode 100644
index 000000000000..a89b5fd1940e
--- /dev/null
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/array_size.h>
+#include <linux/dmi.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_utils.h>
+
+struct drm_panel_backlight_entry {
+	struct {
+		enum dmi_field field;
+		const char * const value;
+	} dmi_match;
+	struct drm_edid_ident ident;
+	struct drm_panel_backlight_quirk quirk;
+};
+
+static const struct drm_panel_backlight_entry drm_panel_backlight_entries[] = {
+};
+
+static bool drm_panel_backlight_entry_matches(const struct drm_panel_backlight_entry *entry,
+					      const struct drm_edid *edid)
+{
+	if (!dmi_match(entry->dmi_match.field, entry->dmi_match.value))
+		return false;
+
+	if (!drm_edid_match(edid, &entry->ident))
+		return false;
+
+	return true;
+}
+
+/**
+ * drm_get_panel_panel_quirk - Check for panel backlight quirks
+ * @edid: EDID of the panel to check
+ *
+ * This function checks for platform specific (e.g. DMI based) quirks
+ * providing info on backlight control for systems where this cannot be
+ * probed from the hard-/firm-ware.
+ *
+ * Returns:
+ * A struct drm_panel_backlight_quirk if a quirk is found or NULL otherwise.
+ */
+const struct drm_panel_backlight_quirk *drm_get_panel_backlight_quirk(const struct drm_edid *edid)
+{
+	const struct drm_panel_backlight_entry *entry;
+	size_t i;
+
+	if (!IS_ENABLED(CONFIG_DMI))
+		return NULL;
+
+	if (!edid)
+		return NULL;
+
+	for (i = 0; i < ARRAY_SIZE(drm_panel_backlight_entries); i++) {
+		entry = &drm_panel_backlight_entries[i];
+
+		if (drm_panel_backlight_entry_matches(entry, edid))
+			return &entry->quirk;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL(drm_get_panel_backlight_quirk);
+
+MODULE_LICENSE("GPL");
diff --git a/include/drm/drm_utils.h b/include/drm/drm_utils.h
index 70775748d243..37cc6de1a01a 100644
--- a/include/drm/drm_utils.h
+++ b/include/drm/drm_utils.h
@@ -11,9 +11,20 @@
 #define __DRM_UTILS_H__
 
 #include <linux/types.h>
+#include <drm/drm_edid.h>
+
+struct drm_panel_backlight_quirk {
+	struct {
+		bool pwm_min_brightness:1;
+	} overrides;
+
+	u8 pwm_min_brightness; /* min_brightness/255 of max */
+};
 
 int drm_get_panel_orientation_quirk(int width, int height);
 
+const struct drm_panel_backlight_quirk *drm_get_panel_backlight_quirk(const struct drm_edid *edid);
+
 signed long drm_timeout_abs_to_jiffies(int64_t timeout_nsec);
 
 #endif

-- 
2.45.2

