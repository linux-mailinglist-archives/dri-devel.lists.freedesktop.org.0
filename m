Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6ABBA3728
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 13:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D7010EA22;
	Fri, 26 Sep 2025 11:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iBJD2heD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E63910E06B;
 Fri, 26 Sep 2025 11:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758885045; x=1790421045;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HeCI+Pu6Se1VVcRSvV8eV0vTtgy0zdiTkmmosHTzzpo=;
 b=iBJD2heDNAlq0CvERDSEuFIOJr/P/ojqnYV/UajLgYrdt8yzjXOcMNbm
 5Zm/GvdAqD2X0lSJ+stN9QOiO6G8gm06mfyt+OtdfH2dU7KcYoxu8BFqz
 Qszbwab8GdWfNb7B9cd5wZO5alILQKro97HVEypNkpnPe5doGh4sH+2X3
 5CEp2TfUk+f9tZNGDZShkpaQy+aaPPa1Dp7UiL5HpSzNE779+2LEjlOGH
 M2IlXv323CwjdtvEMeuhutQ/BuOYR2AKF3dpXZPK9Ew7+qKp8McRyXTrb
 5qz4TOxv0fpWwn1AFIL4rkxdIYendYVUOfnYVyj8U4ThR211D9CLCAL3k g==;
X-CSE-ConnectionGUID: KM0ROv0rQn+ASGt8LirZmg==
X-CSE-MsgGUID: dca+nubsS36QbM9I9CyxMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="83825342"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="83825342"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 04:10:45 -0700
X-CSE-ConnectionGUID: Sn5eL1B9SXy5KXvjsxKwQg==
X-CSE-MsgGUID: q6KmP7eOQfWHXtmiUbFn9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="178345547"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.10])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 04:10:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH] drm/{i915,xe}: driver agnostic drm to display pointer chase
Date: Fri, 26 Sep 2025 14:10:32 +0300
Message-ID: <20250926111032.1188876-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
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

The display driver needs to get from the struct drm_device pointer to
the struct intel_display pointer. Currently, this depends on knowledge
of the struct drm_i915_private and struct xe_device definitions, but
we'd like to hide those definitions from display.

Require the struct drm_device and struct intel_display * members within
struct drm_i915_private and struct xe_device to be placed next to each
other, to be able to figure out the display pointer without knowledge of
the structures.

Use a generic dummy device structure to define the relative offsets of
the drm and display members, and add static assertions to ensure this
holds for both i915 and xe. Use the dummy structure to do the pointer
chase from struct drm_device * to struct intel_display *.

This requires moving the display member in struct xe_device after the
drm member.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../i915/display/intel_display_conversion.c   | 20 +++++----
 drivers/gpu/drm/i915/i915_driver.c            |  4 ++
 drivers/gpu/drm/i915/i915_drv.h               |  1 +
 drivers/gpu/drm/xe/display/xe_display.c       |  4 ++
 drivers/gpu/drm/xe/xe_device_types.h          |  7 +++-
 include/drm/intel/display_member.h            | 42 +++++++++++++++++++
 6 files changed, 69 insertions(+), 9 deletions(-)
 create mode 100644 include/drm/intel/display_member.h

diff --git a/drivers/gpu/drm/i915/display/intel_display_conversion.c b/drivers/gpu/drm/i915/display/intel_display_conversion.c
index d56065f22655..9a47aa38cf82 100644
--- a/drivers/gpu/drm/i915/display/intel_display_conversion.c
+++ b/drivers/gpu/drm/i915/display/intel_display_conversion.c
@@ -1,15 +1,21 @@
 // SPDX-License-Identifier: MIT
 /* Copyright © 2024 Intel Corporation */
 
-#include "i915_drv.h"
-#include "intel_display_conversion.h"
+#include <drm/intel/display_member.h>
 
-static struct intel_display *__i915_to_display(struct drm_i915_private *i915)
-{
-	return i915->display;
-}
+#include "intel_display_conversion.h"
 
 struct intel_display *__drm_to_display(struct drm_device *drm)
 {
-	return __i915_to_display(to_i915(drm));
+	/*
+	 * Note: This relies on both struct drm_i915_private and struct
+	 * xe_device having the struct drm_device and struct intel_display *
+	 * members at the same relative offsets, as defined by struct
+	 * __intel_generic_device.
+	 *
+	 * See also INTEL_DISPLAY_MEMBER_STATIC_ASSERT().
+	 */
+	struct __intel_generic_device *d = container_of(drm, struct __intel_generic_device, drm);
+
+	return d->display;
 }
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 95165e45de74..b46cb54ef5dc 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -46,6 +46,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/intel/display_member.h>
 
 #include "display/i9xx_display_sr.h"
 #include "display/intel_bw.h"
@@ -737,6 +738,9 @@ static void i915_welcome_messages(struct drm_i915_private *dev_priv)
 			 "DRM_I915_DEBUG_RUNTIME_PM enabled\n");
 }
 
+/* Ensure drm and display members are placed properly. */
+INTEL_DISPLAY_MEMBER_STATIC_ASSERT(struct drm_i915_private, drm, display);
+
 static struct drm_i915_private *
 i915_driver_create(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 03e497d2081e..6e159bb8ad2f 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -174,6 +174,7 @@ struct i915_selftest_stash {
 struct drm_i915_private {
 	struct drm_device drm;
 
+	/* display device data, must be placed after drm device member */
 	struct intel_display *display;
 
 	/* FIXME: Device release actions should all be moved to drmm_ */
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 19e691fccf8c..5f4044e63185 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -13,6 +13,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/intel/display_member.h>
 #include <uapi/drm/xe_drm.h>
 
 #include "soc/intel_dram.h"
@@ -35,6 +36,9 @@
 #include "skl_watermark.h"
 #include "xe_module.h"
 
+/* Ensure drm and display members are placed properly. */
+INTEL_DISPLAY_MEMBER_STATIC_ASSERT(struct xe_device, drm, display);
+
 /* Xe device functions */
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a6c361db11d9..53264b2bb832 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -217,6 +217,11 @@ struct xe_device {
 	/** @drm: drm device */
 	struct drm_device drm;
 
+#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
+	/** @display: display device data, must be placed after drm device member */
+	struct intel_display *display;
+#endif
+
 	/** @devcoredump: device coredump */
 	struct xe_devcoredump devcoredump;
 
@@ -617,8 +622,6 @@ struct xe_device {
 	 * drm_i915_private during build. After cleanup these should go away,
 	 * migrating to the right sub-structs
 	 */
-	struct intel_display *display;
-
 	const struct dram_info *dram_info;
 
 	/*
diff --git a/include/drm/intel/display_member.h b/include/drm/intel/display_member.h
new file mode 100644
index 000000000000..0319ea560b60
--- /dev/null
+++ b/include/drm/intel/display_member.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright © 2025 Intel Corporation */
+
+#ifndef __DRM_INTEL_DISPLAY_H__
+#define __DRM_INTEL_DISPLAY_H__
+
+#include <linux/build_bug.h>
+#include <linux/stddef.h>
+#include <linux/stringify.h>
+
+#include <drm/drm_device.h>
+
+struct intel_display;
+
+/*
+ * A dummy device struct to define the relative offsets of drm and display
+ * members. With the members identically placed in struct drm_i915_private and
+ * struct xe_device, this allows figuring out the struct intel_display pointer
+ * without the definition of either driver specific structure.
+ */
+struct __intel_generic_device {
+	struct drm_device drm;
+	struct intel_display *display;
+};
+
+/**
+ * INTEL_DISPLAY_MEMBER_STATIC_ASSERT() - ensure correct placing of drm and display members
+ * @type: The struct to check
+ * @drm_member: Name of the struct drm_device member
+ * @display_member: Name of the struct intel_display * member.
+ *
+ * Use this static assert macro to ensure the struct drm_i915_private and struct
+ * xe_device struct drm_device and struct intel_display * members are at the
+ * same relative offsets.
+ */
+#define INTEL_DISPLAY_MEMBER_STATIC_ASSERT(type, drm_member, display_member) \
+	static_assert( \
+		offsetof(struct __intel_generic_device, display) - offsetof(struct __intel_generic_device, drm) == \
+		offsetof(type, display_member) - offsetof(type, drm_member), \
+		__stringify(type) " " __stringify(drm_member) " and " __stringify(display_member) " members at invalid offsets")
+
+#endif
-- 
2.47.3

