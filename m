Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D75DD3C6EDE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 12:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D636E077;
	Tue, 13 Jul 2021 10:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D09897C5;
 Tue, 13 Jul 2021 10:47:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="197325321"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="197325321"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 03:47:06 -0700
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="503054375"
Received: from ewaterla-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.5.95])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 03:47:05 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/5] drm/i915/uapi: convert drm_i915_gem_madvise to kernel-doc
Date: Tue, 13 Jul 2021 11:45:51 +0100
Message-Id: <20210713104554.2381406-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210713104554.2381406-1-matthew.auld@intel.com>
References: <20210713104554.2381406-1-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add some kernel doc for this. We can then just reference this later when
documenting madv in the kernel.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 include/uapi/drm/i915_drm.h | 50 +++++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index e334a8b14ef2..a839085b6577 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1492,20 +1492,54 @@ struct drm_i915_get_pipe_from_crtc_id {
 	__u32 pipe;
 };
 
-#define I915_MADV_WILLNEED 0
-#define I915_MADV_DONTNEED 1
-#define __I915_MADV_PURGED 2 /* internal state */
-
+/**
+ * struct drm_i915_gem_madvise - Update the madvise hint for the object.
+ *
+ * The kernel uses this to know when it can safely discard the backing pages for
+ * an object, when under memory pressure.
+ */
 struct drm_i915_gem_madvise {
-	/** Handle of the buffer to change the backing store advice */
+	/**
+	 * @handle: Handle of the buffer to change the backing store advice for.
+	 */
 	__u32 handle;
 
-	/* Advice: either the buffer will be needed again in the near future,
-	 *         or wont be and could be discarded under memory pressure.
+	/**
+	 * @madv: The madvise hint to set for the object.
+	 *
+	 * Supported values:
+	 *
+	 * I915_MADV_WILLNEED:
+	 *
+	 * The buffer will be needed again in the near future. By default all
+	 * objects are set as I915_MADV_WILLNEED. Once the pages become
+	 * dirty, the kernel is no longer allowed to simply discard the pages,
+	 * and instead can only resort to swapping the pages out, if under
+	 * memory pressure, where the page contents must persist when swapping
+	 * the pages back in.
+	 *
+	 * I915_MADV_DONTNEED:
+	 *
+	 * The buffer wont be needed. The pages and their contents can be
+	 * discarded under memory pressure.
+	 *
+	 * Note that if the pages were discarded then the kernel updates the
+	 * internal madvise value of the object to __I915_MADV_PURGED, which
+	 * effectively kills the object, since all further requests to allocate
+	 * pages for the object will be rejected. At this point a new object is
+	 * needed. This will be reflected in @retained.
 	 */
+#define I915_MADV_WILLNEED 0
+#define I915_MADV_DONTNEED 1
+#define __I915_MADV_PURGED 2 /* internal state */
 	__u32 madv;
 
-	/** Whether the backing store still exists. */
+	/**
+	 * @retained: Whether the backing store still exists.
+	 *
+	 * Set to false if the kernel purged the object and marked the object as
+	 * __I915_MADV_PURGED.
+	 */
 	__u32 retained;
 };
 
-- 
2.26.3

