Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CBA4C5A01
	for <lists+dri-devel@lfdr.de>; Sun, 27 Feb 2022 09:18:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F3510E874;
	Sun, 27 Feb 2022 08:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1D110E605;
 Sun, 27 Feb 2022 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645949920; x=1677485920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8ZciRwQiSwDHpRBFxFqqvha+fcgKRjXdJiEt8ELXRck=;
 b=etL88AfasoIwkZzAZ6aIadjpfR5ylkofrZWjtjtB02JHfnoBj9NTY/Qq
 ONGejlgdyTg2k8IEHtF4nHBfyX5htuhGXi9tMFPPgK/6gBzA+BGKp2b8Y
 pcoOF7a+A5moJSyDEblukCeUmYWw1PXn5NGn2EGw6tkfG0DdgQnhBvezw
 n7ldAwV0jCi5dKHQ3otyh8cUorge4I666BDu09G1Yvu6JugxdZLdzXK2e
 pNGsCxdybymkcNGdVi79xCIJIAo8Z5S3scisdlUdIwMbS8uTBHrfYLUD4
 qmigU5UEATlj0BXZK9KWJrY/NIzRB5l8+ElZK3lreM20mcHs7bzR7c33Q w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10270"; a="250296016"
X-IronPort-AV: E=Sophos;i="5.90,140,1643702400"; d="scan'208";a="250296016"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 00:18:39 -0800
X-IronPort-AV: E=Sophos;i="5.90,140,1643702400"; d="scan'208";a="685041169"
Received: from jingyiji-mobl.amr.corp.intel.com (HELO localhost)
 ([10.209.25.43])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 00:18:35 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v6 3/4] drm/i915/uapi: Add struct
 drm_i915_query_hwconfig_blob_item
Date: Sun, 27 Feb 2022 00:18:30 -0800
Message-Id: <20220227081831.1089720-4-jordan.l.justen@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220227081831.1089720-1-jordan.l.justen@intel.com>
References: <20220227081831.1089720-1-jordan.l.justen@intel.com>
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
 Jon Bloomfield <jon.bloomfield@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
 include/uapi/drm/i915_drm.h | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 069d2fadfbd9..d033211cb862 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3279,6 +3279,49 @@ struct drm_i915_gem_create_ext_protected_content {
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
2.34.1

