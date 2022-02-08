Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA554AE2CC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 22:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A5710E388;
	Tue,  8 Feb 2022 21:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9683610E275;
 Tue,  8 Feb 2022 21:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644354311; x=1675890311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WDHseBhjzcsQgn9JFZ5GO43d+BRnMramJiKZw+0ghmM=;
 b=CKMsBZK1Ntd2hmmaWule4tA6Szj43Xeq2V76drHOXNi0rf6QT97GKFU4
 o7TLo9uFLuRgEkyLt4p6mEhnH/SN1fnPmLDRmOAniVD023A7OmZtIPByY
 J0t5YqRFS4HHXD/kCLGBFts50PB8KO2+i/8s0gWBZOvCL5hOfLRoaQotD
 JXZEG0U9CXuLe/+dntPz3+Pd2Gx+0aqxyAyHoDUzEqPBExc1c9mdfo/Z9
 ub1OOW8ziacujdH9KB0Ov9ZckEB9gY6RWRjk7Mnn2Ta9RrA4L6ajHk/xV
 gO9PIEWcA3su1Q1D5jFMRRihTePHKgH3FVYxqVal+YwJoii7RduxKs9f1 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="335454244"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="335454244"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 13:05:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="482080859"
Received: from fpaillet-mobl.amr.corp.intel.com (HELO localhost)
 ([10.209.65.117])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 13:05:10 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v3 3/4] drm/i915/uapi: Add struct
 drm_i915_query_hwconfig_blob_item
Date: Tue,  8 Feb 2022 13:05:02 -0800
Message-Id: <20220208210503.869491-4-jordan.l.justen@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208210503.869491-1-jordan.l.justen@intel.com>
References: <20220208210503.869491-1-jordan.l.justen@intel.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also, document DRM_I915_QUERY_HWCONFIG_BLOB with this struct.

v3:
 * Add various changes suggested by Tvrtko

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
---
 include/uapi/drm/i915_drm.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 069d2fadfbd9..c3faee3b3f70 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3276,6 +3276,38 @@ struct drm_i915_gem_create_ext_protected_content {
 	__u32 flags;
 };
 
+/**
+ * DOC: GuC HWCONFIG blob uAPI
+ *
+ * The GuC produces a blob with information about the current device.
+ * i915 reads this blob from GuC and makes it available via this uAPI.
+ *
+ * The returned blob is a sequence of items of variable length
+ * described by struct drm_i915_query_hwconfig_blob_item. The
+ * drm_i915_query_hwconfig_blob_item length field gives the length of
+ * the drm_i915_query_hwconfig_blob_item data[] array for the item and
+ * thereby determines the length of that item. The key and length
+ * fields are required, so the minimum item size is 2 x __u32, or 8
+ * bytes.
+ *
+ * The overall blob returned by DRM_I915_QUERY_HWCONFIG_BLOB will end
+ * at the same location as the end of the final
+ * drm_i915_query_hwconfig_blob_item. In other words, walking through
+ * the individual items is guaranteed to eventually arrive at the
+ * exact end of the entire blob.
+ *
+ * The meaning of the key field and the data values are documented in
+ * the Programmer's Reference Manual.
+ */
+struct drm_i915_query_hwconfig_blob_item {
+	/** @key: Enum which defines how to interpret @data values. */
+	__u32 key;
+	/** @length: Length of the @data array. */
+	__u32 length;
+	/** @key: Array of values with meaning defined by @key */
+	__u32 data[];
+};
+
 /* ID of the protected content session managed by i915 when PXP is active */
 #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
 
-- 
2.34.1

