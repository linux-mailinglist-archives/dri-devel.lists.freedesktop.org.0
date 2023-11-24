Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211057F7414
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 13:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B02810E7D9;
	Fri, 24 Nov 2023 12:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8836110E1E3;
 Fri, 24 Nov 2023 12:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700829858; x=1732365858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yoZ/pLcQXwKab2BZfEW6m+djBny7r2aeIH6LWQGKa6U=;
 b=lWpwnVqzfT1NkaE9qyJMdJHgJcj5UpOAp5jrm0xZPI+60czrMRRLyvnD
 wT782mOdxSbpMmZWs5PQwKbqdV8e9VunF2+b5T5KJhProN3foT+Y+GtO5
 K5mJ7c09HQ0xqWGp85J5TyJkEPRf1zcpW4uEinKKtgCZorpeM/a5ew7He
 cqnmCTNufF3VjtNFd+k9lqvjjCUa8xQxfeH4Em9eANLGgiTvS2Ovbucnu
 TBT8y/buqgQ+oZvm+VhcgvZiPWkU1fFJ23RNufJ4MdBqeWVbxjofoTxtM
 nACk2AQm2tj0n8hvM82ga1u1pJ0AJHJxX5p6gTm1L/NFVwiYmivm1VTYQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="396322596"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="396322596"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:44:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="891057735"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="891057735"
Received: from dashah-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.230])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:44:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] drm/print: move enum drm_debug_category etc. earlier in
 drm_print.h
Date: Fri, 24 Nov 2023 14:43:56 +0200
Message-Id: <1da528bb2c4b9b695efff9ddd617be1992acac62.1700829750.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1700829750.git.jani.nikula@intel.com>
References: <cover.1700829750.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid forward declarations in subsequent changes, but separate this
movement to an independent change.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_print.h | 190 ++++++++++++++++++++--------------------
 1 file changed, 95 insertions(+), 95 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 3d899fb0793c..2d57939429a9 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -69,6 +69,101 @@ extern unsigned long __drm_debug;
  *     }
  */
 
+/**
+ * enum drm_debug_category - The DRM debug categories
+ *
+ * Each of the DRM debug logging macros use a specific category, and the logging
+ * is filtered by the drm.debug module parameter. This enum specifies the values
+ * for the interface.
+ *
+ * Each DRM_DEBUG_<CATEGORY> macro logs to DRM_UT_<CATEGORY> category, except
+ * DRM_DEBUG() logs to DRM_UT_CORE.
+ *
+ * Enabling verbose debug messages is done through the drm.debug parameter, each
+ * category being enabled by a bit:
+ *
+ *  - drm.debug=0x1 will enable CORE messages
+ *  - drm.debug=0x2 will enable DRIVER messages
+ *  - drm.debug=0x3 will enable CORE and DRIVER messages
+ *  - ...
+ *  - drm.debug=0x1ff will enable all messages
+ *
+ * An interesting feature is that it's possible to enable verbose logging at
+ * run-time by echoing the debug value in its sysfs node::
+ *
+ *   # echo 0xf > /sys/module/drm/parameters/debug
+ *
+ */
+enum drm_debug_category {
+	/* These names must match those in DYNAMIC_DEBUG_CLASSBITS */
+	/**
+	 * @DRM_UT_CORE: Used in the generic drm code: drm_ioctl.c, drm_mm.c,
+	 * drm_memory.c, ...
+	 */
+	DRM_UT_CORE,
+	/**
+	 * @DRM_UT_DRIVER: Used in the vendor specific part of the driver: i915,
+	 * radeon, ... macro.
+	 */
+	DRM_UT_DRIVER,
+	/**
+	 * @DRM_UT_KMS: Used in the modesetting code.
+	 */
+	DRM_UT_KMS,
+	/**
+	 * @DRM_UT_PRIME: Used in the prime code.
+	 */
+	DRM_UT_PRIME,
+	/**
+	 * @DRM_UT_ATOMIC: Used in the atomic code.
+	 */
+	DRM_UT_ATOMIC,
+	/**
+	 * @DRM_UT_VBL: Used for verbose debug message in the vblank code.
+	 */
+	DRM_UT_VBL,
+	/**
+	 * @DRM_UT_STATE: Used for verbose atomic state debugging.
+	 */
+	DRM_UT_STATE,
+	/**
+	 * @DRM_UT_LEASE: Used in the lease code.
+	 */
+	DRM_UT_LEASE,
+	/**
+	 * @DRM_UT_DP: Used in the DP code.
+	 */
+	DRM_UT_DP,
+	/**
+	 * @DRM_UT_DRMRES: Used in the drm managed resources code.
+	 */
+	DRM_UT_DRMRES
+};
+
+static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
+{
+	return unlikely(__drm_debug & BIT(category));
+}
+
+#define drm_debug_enabled_instrumented(category)			\
+	({								\
+		pr_debug("todo: is this frequent enough to optimize ?\n"); \
+		drm_debug_enabled_raw(category);			\
+	})
+
+#if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+/*
+ * the drm.debug API uses dyndbg, so each drm_*dbg macro/callsite gets
+ * a descriptor, and only enabled callsites are reachable.  They use
+ * the private macro to avoid re-testing the enable-bit.
+ */
+#define __drm_debug_enabled(category)	true
+#define drm_debug_enabled(category)	drm_debug_enabled_instrumented(category)
+#else
+#define __drm_debug_enabled(category)	drm_debug_enabled_raw(category)
+#define drm_debug_enabled(category)	drm_debug_enabled_raw(category)
+#endif
+
 /**
  * struct drm_printer - drm output "stream"
  *
@@ -255,101 +350,6 @@ static inline struct drm_printer drm_err_printer(struct drm_device *drm,
 	return p;
 }
 
-/**
- * enum drm_debug_category - The DRM debug categories
- *
- * Each of the DRM debug logging macros use a specific category, and the logging
- * is filtered by the drm.debug module parameter. This enum specifies the values
- * for the interface.
- *
- * Each DRM_DEBUG_<CATEGORY> macro logs to DRM_UT_<CATEGORY> category, except
- * DRM_DEBUG() logs to DRM_UT_CORE.
- *
- * Enabling verbose debug messages is done through the drm.debug parameter, each
- * category being enabled by a bit:
- *
- *  - drm.debug=0x1 will enable CORE messages
- *  - drm.debug=0x2 will enable DRIVER messages
- *  - drm.debug=0x3 will enable CORE and DRIVER messages
- *  - ...
- *  - drm.debug=0x1ff will enable all messages
- *
- * An interesting feature is that it's possible to enable verbose logging at
- * run-time by echoing the debug value in its sysfs node::
- *
- *   # echo 0xf > /sys/module/drm/parameters/debug
- *
- */
-enum drm_debug_category {
-	/* These names must match those in DYNAMIC_DEBUG_CLASSBITS */
-	/**
-	 * @DRM_UT_CORE: Used in the generic drm code: drm_ioctl.c, drm_mm.c,
-	 * drm_memory.c, ...
-	 */
-	DRM_UT_CORE,
-	/**
-	 * @DRM_UT_DRIVER: Used in the vendor specific part of the driver: i915,
-	 * radeon, ... macro.
-	 */
-	DRM_UT_DRIVER,
-	/**
-	 * @DRM_UT_KMS: Used in the modesetting code.
-	 */
-	DRM_UT_KMS,
-	/**
-	 * @DRM_UT_PRIME: Used in the prime code.
-	 */
-	DRM_UT_PRIME,
-	/**
-	 * @DRM_UT_ATOMIC: Used in the atomic code.
-	 */
-	DRM_UT_ATOMIC,
-	/**
-	 * @DRM_UT_VBL: Used for verbose debug message in the vblank code.
-	 */
-	DRM_UT_VBL,
-	/**
-	 * @DRM_UT_STATE: Used for verbose atomic state debugging.
-	 */
-	DRM_UT_STATE,
-	/**
-	 * @DRM_UT_LEASE: Used in the lease code.
-	 */
-	DRM_UT_LEASE,
-	/**
-	 * @DRM_UT_DP: Used in the DP code.
-	 */
-	DRM_UT_DP,
-	/**
-	 * @DRM_UT_DRMRES: Used in the drm managed resources code.
-	 */
-	DRM_UT_DRMRES
-};
-
-static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
-{
-	return unlikely(__drm_debug & BIT(category));
-}
-
-#define drm_debug_enabled_instrumented(category)			\
-	({								\
-		pr_debug("todo: is this frequent enough to optimize ?\n"); \
-		drm_debug_enabled_raw(category);			\
-	})
-
-#if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
-/*
- * the drm.debug API uses dyndbg, so each drm_*dbg macro/callsite gets
- * a descriptor, and only enabled callsites are reachable.  They use
- * the private macro to avoid re-testing the enable-bit.
- */
-#define __drm_debug_enabled(category)	true
-#define drm_debug_enabled(category)	drm_debug_enabled_instrumented(category)
-#else
-#define __drm_debug_enabled(category)	drm_debug_enabled_raw(category)
-#define drm_debug_enabled(category)	drm_debug_enabled_raw(category)
-#endif
-
 /*
  * struct device based logging
  *
-- 
2.39.2

