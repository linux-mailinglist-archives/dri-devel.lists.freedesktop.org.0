Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6994B008D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 23:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1169B10E64F;
	Wed,  9 Feb 2022 22:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232CB10E63D;
 Wed,  9 Feb 2022 22:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644446717; x=1675982717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pkou0Cckx+kuKoD04srq2qIAXBpqa06Nqavx51dfLCU=;
 b=NdWdEOZ6Xi5Ffw2LQTzadd1Yxd0OXC4kK9TJfWhNCN580zcqFuESfEDP
 aD6Ue/kIDeQdB3inapwXyPqEZzvDzwQS1FgDokgsxEAJyyluIByoaKbU2
 o80aGhSXvMqGAv/TvYk1A41rgl4tckRgI52jb6WT9YN2dbbkhyiAQx86y
 obYhf3btfbhy2fll9IuO9C2n+VXyePp72KVGjIHEIy0qtr9HZgJ8v2nOp
 QzlS1QQowlYjDBAOxo/Cx4i+/WzlKXa37nNWIoQnHr1ApzhVrEsvhxJTn
 HM+vyS0psr8Rz6jqXuAQi9+2Rrop0tUVj3LKPG3l0Np+4V9MhHj2+aLc5 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="230008455"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="230008455"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 14:45:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="771526188"
Received: from unknown (HELO localhost) ([10.212.169.188])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 14:45:14 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 3/4] drm/i915/uapi: Add struct
 drm_i915_query_hwconfig_blob_item
Date: Wed,  9 Feb 2022 14:45:06 -0800
Message-Id: <20220209224507.874751-4-jordan.l.justen@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209224507.874751-1-jordan.l.justen@intel.com>
References: <20220209224507.874751-1-jordan.l.justen@intel.com>
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

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
Acked-by: Jon Bloomfield <jon.bloomfield@intel.com>
---
 include/uapi/drm/i915_drm.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 069d2fadfbd9..8279515ae2ce 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3276,6 +3276,41 @@ struct drm_i915_gem_create_ext_protected_content {
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
+ * the drm_i915_query_hwconfig_blob_item data[] array. The length is
+ * the number of u32 items in the data[] array, and *not* the number
+ * of bytes.
+ *
+ * The key and length fields are required, so the minimum item size is
+ * 2 x u32, or 8 bytes, when the length field is 0. If the length
+ * field is 1, then the item's size is 12 bytes.
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
+	/** @length: The number of u32 values in the @data array. */
+	__u32 length;
+	/** @key: Array of values with meaning defined by @key */
+	__u32 data[];
+};
+
 /* ID of the protected content session managed by i915 when PXP is active */
 #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
 
-- 
2.34.1

