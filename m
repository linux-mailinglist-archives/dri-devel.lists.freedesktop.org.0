Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8570C9C449A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 19:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97DD10E4FB;
	Mon, 11 Nov 2024 18:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="epNCb3Hc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0081D10E4FB;
 Mon, 11 Nov 2024 18:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1731348626;
 bh=gewAwPO3qh+Y2D06hY+c1ZA4Hu3N5AEkx64t58yChhM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=epNCb3HcWya8/k6UgupdIzbxQy82pH1heFJLvO4WW2MfeH3NWW5ReW8871AmNvzfP
 qWevV1OGGL/202xTojJxz6M7cfwELsJEgxld7SzSyjriM4g/TRaqd36E5ZUfTcbQEX
 QcVFqBZFxwGhidV9TmJbdgU6XqSHlFrGcLpzqTBY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 11 Nov 2024 19:09:35 +0100
Subject: [PATCH v7 1/4] drm: Add panel backlight quirks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241111-amdgpu-min-backlight-quirk-v7-1-f662851fda69@weissschuh.net>
References: <20241111-amdgpu-min-backlight-quirk-v7-0-f662851fda69@weissschuh.net>
In-Reply-To: <20241111-amdgpu-min-backlight-quirk-v7-0-f662851fda69@weissschuh.net>
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Xinhui Pan <Xinhui.Pan@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>, 
 linux-doc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731348626; l=5343;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=gewAwPO3qh+Y2D06hY+c1ZA4Hu3N5AEkx64t58yChhM=;
 b=hLG1EO9WPBkOmEDx9wct4UzFPecXrB0Ab7ovzP1gQPbF8nRt5Qwf4fp/+m+3Wx3sXU2VEt4Co
 kYY0JomVu6kCDwjjDv8iF7Xk+Ls/7LBtX0U5Zg7PkalOQCO6rDHO6tJ
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

Panels using a PWM-controlled backlight source do not have a standard
way to communicate their valid PWM ranges.
On x86 the ranges are read from ACPI through driver-specific tables.
The built-in ranges are not necessarily correct, or may grow stale if an
older device can be retrofitted with newer panels.

Add a quirk infrastructure with which the minimum valid backlight value
can be maintained as part of the kernel.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Tested-by: Dustin L. Howett <dustin@howett.net>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 Documentation/gpu/drm-kms-helpers.rst        |  3 ++
 drivers/gpu/drm/Kconfig                      |  4 ++
 drivers/gpu/drm/Makefile                     |  1 +
 drivers/gpu/drm/drm_panel_backlight_quirks.c | 70 ++++++++++++++++++++++++++++
 include/drm/drm_utils.h                      |  4 ++
 5 files changed, 82 insertions(+)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 8cf2f041af4704875910ce8228ae04615d0f21bd..b4ee25af1702b0019e0de5f9ee66d2dbdac2c664 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -221,6 +221,9 @@ Panel Helper Reference
 .. kernel-doc:: drivers/gpu/drm/drm_panel_orientation_quirks.c
    :export:
 
+.. kernel-doc:: drivers/gpu/drm/drm_panel_backlight_quirks.c
+   :export:
+
 Panel Self Refresh Helper Reference
 ===================================
 
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 5504721007cc190e7d768d42aa9633baa0115f5e..7cf9aa476b4745419f1002a7866fe974d852a2be 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -526,6 +526,10 @@ config DRM_HYPERV
 config DRM_EXPORT_FOR_TESTS
 	bool
 
+# Separate option as not all DRM drivers use it
+config DRM_PANEL_BACKLIGHT_QUIRKS
+	tristate
+
 config DRM_LIB_RANDOM
 	bool
 	default n
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 463afad1b5ca6275e61223adc8ca036c3d4d6b03..06b73068d2483045f819b35095c7dc83d6fcbd53 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -95,6 +95,7 @@ drm-$(CONFIG_DRM_PANIC_SCREEN_QR_CODE) += drm_panic_qr.o
 obj-$(CONFIG_DRM)	+= drm.o
 
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
+obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) += drm_panel_backlight_quirks.o
 
 #
 # Memory-management helpers
diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
new file mode 100644
index 0000000000000000000000000000000000000000..6b8bbed77c7f1f3570a6e68c276244cfe4386f6c
--- /dev/null
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/array_size.h>
+#include <linux/dmi.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_utils.h>
+
+struct drm_panel_min_backlight_quirk {
+	struct {
+		enum dmi_field field;
+		const char * const value;
+	} dmi_match;
+	struct drm_edid_ident ident;
+	u8 min_brightness;
+};
+
+static const struct drm_panel_min_backlight_quirk drm_panel_min_backlight_quirks[] = {
+};
+
+static bool drm_panel_min_backlight_quirk_matches(const struct drm_panel_min_backlight_quirk *quirk,
+						  const struct drm_edid *edid)
+{
+	if (!dmi_match(quirk->dmi_match.field, quirk->dmi_match.value))
+		return false;
+
+	if (!drm_edid_match(edid, &quirk->ident))
+		return false;
+
+	return true;
+}
+
+/**
+ * drm_get_panel_min_brightness_quirk - Get minimum supported brightness level for a panel.
+ * @edid: EDID of the panel to check
+ *
+ * This function checks for platform specific (e.g. DMI based) quirks
+ * providing info on the minimum backlight brightness for systems where this
+ * cannot be probed correctly from the hard-/firm-ware.
+ *
+ * Returns:
+ * A negative error value or
+ * an override value in the range [0, 255] representing 0-100% to be scaled to
+ * the drivers target range.
+ */
+int drm_get_panel_min_brightness_quirk(const struct drm_edid *edid)
+{
+	const struct drm_panel_min_backlight_quirk *quirk;
+	size_t i;
+
+	if (!IS_ENABLED(CONFIG_DMI))
+		return -ENODATA;
+
+	if (!edid)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(drm_panel_min_backlight_quirks); i++) {
+		quirk = &drm_panel_min_backlight_quirks[i];
+
+		if (drm_panel_min_backlight_quirk_matches(quirk, edid))
+			return quirk->min_brightness;
+	}
+
+	return -ENODATA;
+}
+EXPORT_SYMBOL(drm_get_panel_min_brightness_quirk);
+
+MODULE_DESCRIPTION("Quirks for panel backlight overrides");
+MODULE_LICENSE("GPL");
diff --git a/include/drm/drm_utils.h b/include/drm/drm_utils.h
index 70775748d243b0fd6e13a088d05c45f31cf34a4a..15fa9b6865f448cc8338c935874015fd74cb7bb2 100644
--- a/include/drm/drm_utils.h
+++ b/include/drm/drm_utils.h
@@ -12,8 +12,12 @@
 
 #include <linux/types.h>
 
+struct drm_edid;
+
 int drm_get_panel_orientation_quirk(int width, int height);
 
+int drm_get_panel_min_brightness_quirk(const struct drm_edid *edid);
+
 signed long drm_timeout_abs_to_jiffies(int64_t timeout_nsec);
 
 #endif

-- 
2.47.0

