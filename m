Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4FCA1C8BE
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954AA10E384;
	Sun, 26 Jan 2025 14:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pIkZQ86D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDEC10E384
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 14:53:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 716B15C5FCC;
 Sun, 26 Jan 2025 14:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECB6C4CEE8;
 Sun, 26 Jan 2025 14:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737903196;
 bh=+ECe4fzrYv0SET9Ee7tX8FTwbNt/UaWzPa4F/8JTmus=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pIkZQ86DKb+qTe3HhTE/vYh7r3DYDlqOAPkR8qemYaJGE+PhFZBOJvWsjzJ0OIEHn
 Cm09jL3jLLoGhS+yKPpzx3hUT6QkoVc0RL1vvcic+gdZFTwbnYnwPjmqwpHOUE2Vav
 hPNSmtJefnlBNhomGf1BP0Mn3v/XWE0HoIVTj6v4li26yHukKueDzlUmLeBMP4VPmw
 yPyxG49ztK86a3GPncIR4fHWKACLuj6knu1aCHRaqp9/7hZV0n3FNZTwHhRND89JfN
 Y9ZTkdQYG1hp2o0Mau1M9hyXs+WsDHXZgCuS2vi+FMdPZC1Y/8bKozUBMvRpv/01b9
 sS8NBgxSinOgA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Dustin L . Howett" <dustin@howett.net>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Sasha Levin <sashal@kernel.org>,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 02/34] drm: Add panel backlight quirks
Date: Sun, 26 Jan 2025 09:52:38 -0500
Message-Id: <20250126145310.926311-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126145310.926311-1-sashal@kernel.org>
References: <20250126145310.926311-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
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

From: Thomas Weißschuh <linux@weissschuh.net>

[ Upstream commit 22e5c7ae12145af13785e3ff138395d5b1a22116 ]

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
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241111-amdgpu-min-backlight-quirk-v7-1-f662851fda69@weissschuh.net
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/gpu/drm-kms-helpers.rst        |  3 +
 drivers/gpu/drm/Kconfig                      |  4 ++
 drivers/gpu/drm/Makefile                     |  1 +
 drivers/gpu/drm/drm_panel_backlight_quirks.c | 70 ++++++++++++++++++++
 include/drm/drm_utils.h                      |  4 ++
 5 files changed, 82 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_panel_backlight_quirks.c

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 8cf2f041af470..b4ee25af1702b 100644
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
index 772fc7625639d..b55be8889e2ca 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -530,6 +530,10 @@ config DRM_HYPERV
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
index 463afad1b5ca6..06b73068d2483 100644
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
index 0000000000000..6b8bbed77c7f1
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
index 70775748d243b..15fa9b6865f44 100644
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
2.39.5

