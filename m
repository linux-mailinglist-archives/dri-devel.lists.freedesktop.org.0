Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E74D08CE637
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 15:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8225B10EA4C;
	Fri, 24 May 2024 13:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DW3HaRkg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19D710EA2E;
 Fri, 24 May 2024 13:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716557767; x=1748093767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=adL9d0OqQ8jBQXKsqMmD7jTs2GJRfmPiISsOuz0C5Kk=;
 b=DW3HaRkglrJXnOxhp4uFttMYVgjhcHcFVt8bgPp9hZnj33eFYMCQzZwL
 IuK/czlpAujUmwhyLQq1TxPd5BtJAgjaZ/dicBGpuIinC8719tbNGC9qJ
 KI5q1/KrgV+Mc2B2DjtzANmmnTrvlG/pH47RU7Mf/eSlaWXc0eFBEsO72
 rDI+lCjDY/AhdQKBNPs5oAvs8m11OG9fAVp+YQUE9b0LF6U/toC3PNxAj
 B8ECQvEgtXFE4OmreiWXHx1Ve078HWujnSfYXV0jyoqWnRM74wWJoHK7z
 hquyWIJk9pPVqWcY3bIodRa9QURsxaiRDqyYJSU5ZvFfs2+J8GpDJsLhf Q==;
X-CSE-ConnectionGUID: itEmdULxQIyUzbhuc1HVag==
X-CSE-MsgGUID: /3GZ7kadT2enPoK5hUgrzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13110042"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="13110042"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 06:36:07 -0700
X-CSE-ConnectionGUID: gU3p0ngVSD+E/AWr6km3fw==
X-CSE-MsgGUID: 4ImQhWf/QsaqFiI4UxyUXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="64834723"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.49.231])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 06:36:05 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 1/2] drm: Add DRM-managed drm_mm_init()
Date: Fri, 24 May 2024 15:35:17 +0200
Message-Id: <20240524133518.976-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240524133518.976-1-michal.wajdeczko@intel.com>
References: <20240524133518.976-1-michal.wajdeczko@intel.com>
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

Add drmm_mm_init(), a helper that provides managed allocator cleanup.
The allocator will be cleaned up with the final reference of the DRM
device.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_managed.c | 27 +++++++++++++++++++++++++++
 include/drm/drm_managed.h     |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index 7646f67bda4e..2fb9656bada3 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -13,6 +13,7 @@
 #include <linux/spinlock.h>
 
 #include <drm/drm_device.h>
+#include <drm/drm_mm.h>
 #include <drm/drm_print.h>
 
 #include "drm_internal.h"
@@ -310,3 +311,29 @@ void __drmm_mutex_release(struct drm_device *dev, void *res)
 	mutex_destroy(lock);
 }
 EXPORT_SYMBOL(__drmm_mutex_release);
+
+static void __drmm_mm_takedown(struct drm_device *dev, void *res)
+{
+	struct drm_mm *mm = res;
+
+	drm_mm_takedown(mm);
+}
+
+/**
+ * drmm_mm_init - &drm_device managed drm_mm_init()
+ * @dev: DRM device
+ * @mm: the drm_mm structure to initialize
+ * @start: start of the range managed by @mm
+ * @size: end of the range managed by @mm
+ *
+ * This is a &drm_device managed version of drm_mm_init().
+ * The initialized allocator will be cleaned up on the final drm_dev_put().
+ *
+ * Return: 0 on success, or a negative errno code otherwise.
+ */
+int drmm_mm_init(struct drm_device *dev, struct drm_mm *mm, u64 start, u64 size)
+{
+	drm_mm_init(mm, start, size);
+	return drmm_add_action_or_reset(dev, __drmm_mm_takedown, mm);
+}
+EXPORT_SYMBOL(drmm_mm_init);
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index f547b09ca023..e8c2f29cb88a 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -8,6 +8,7 @@
 #include <linux/types.h>
 
 struct drm_device;
+struct drm_mm;
 struct mutex;
 
 typedef void (*drmres_release_t)(struct drm_device *dev, void *res);
@@ -127,4 +128,6 @@ void __drmm_mutex_release(struct drm_device *dev, void *res);
 	drmm_add_action_or_reset(dev, __drmm_mutex_release, lock);	     \
 })									     \
 
+int drmm_mm_init(struct drm_device *dev, struct drm_mm *mm, u64 start, u64 size);
+
 #endif
-- 
2.43.0

