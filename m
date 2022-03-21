Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 406F34E2B2D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 15:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F2110E339;
	Mon, 21 Mar 2022 14:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE7210E327;
 Mon, 21 Mar 2022 14:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647874056; x=1679410056;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8znLqj1un3A06e6Kx1qL+vD5ZhunJnu6m83ZxrdYX2o=;
 b=g64zCSWpMiWNmevzzJc2MB6VeQMoPBxrbhtv11K9ndxu3WeO7ZOrj70u
 YQIbrM0Xzk+6QOGiGHPaV010nLERHMNBezNjvCkcJFvUN2LQzrKe8uCt3
 sKgHW39Waf2W6l6KoMcFPR3crw7E7vFZhpJR7gdqittO/8q4DqB9LMCV9
 rb1nztCqSy1nlIx9y3Vf8inB1WYDNyVqrNwmsiqc17H858qr8oEKL0P0s
 5pCTUiAV7Ndrdm31bxC4SFXq3NR3zgpWztaJ0UxS6Myrnf71cBsFOkGY3
 D++IOi2uSiNNNiyJjtZrSWhOFDq6PLBEP4BEdewL4+drUlETsqtqlnn9H g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="257286316"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="257286316"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 07:47:35 -0700
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="518461921"
Received: from atnordon-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.230.67])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 07:47:34 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [CI] drm/i915/uapi: Add struct drm_i915_query_hwconfig_blob_item
Date: Mon, 21 Mar 2022 14:47:22 +0000
Message-Id: <20220321144722.2020519-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jordan Justen <jordan.l.justen@intel.com>

Also, document DRM_I915_QUERY_HWCONFIG_BLOB with this struct.

v3:
 * Add various changes suggested by Tvrtko

v5:
 * Fix documenation formatting and verified with `make htmldocs` as
   suggested by Daniel

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
Acked-by: Jon Bloomfield <jon.bloomfield@intel.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
I am resurrecthing this since I think it is the minimum we need for an
open source friendly stack.
---
 include/uapi/drm/i915_drm.h | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 071ffd9d51f1..34ad66ddd320 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3314,6 +3314,49 @@ struct drm_i915_gem_create_ext_protected_content {
 /* ID of the protected content session managed by i915 when PXP is active */
 #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
 
+/**
+ * DOC: GuC HWCONFIG blob uAPI
+ *
+ * The GuC produces a blob with information about the current device.
+ * i915 reads this blob from GuC and makes it available via this uAPI.
+ *
+ * The returned blob is a sequence of items of variable length
+ * described by struct drm_i915_query_hwconfig_blob_item.
+ *
+ * The overall blob returned by DRM_I915_QUERY_HWCONFIG_BLOB will end
+ * at the same location as the end of the final struct
+ * drm_i915_query_hwconfig_blob_item. In other words, walking through
+ * the individual items is guaranteed to eventually arrive at the
+ * exact end of the entire blob.
+ */
+
+/**
+ * struct drm_i915_query_hwconfig_blob_item - A single hwconfig item
+ * within the sequence of hwconfig items returned by
+ * DRM_I915_QUERY_HWCONFIG_BLOB.
+ *
+ * The length field gives the length of the data[] array. The length
+ * is the number of u32 items in the data[] array, and *not* the
+ * number of bytes.
+ *
+ * The key and length fields are required, so the minimum item size is
+ * 2 x u32, or 8 bytes, when the length field is 0. If the length
+ * field is 1, then the item's size is 12 bytes.
+ *
+ * The meaning of the key field and the data values are documented in
+ * the Programmer's Reference Manual.
+ */
+struct drm_i915_query_hwconfig_blob_item {
+	/** @key: Enum which defines how to interpret @data values. */
+	__u32 key;
+
+	/** @length: The number of u32 values in the @data array. */
+	__u32 length;
+
+	/** @data: Array of values with meaning defined by @key. */
+	__u32 data[];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.32.0

