Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F36E4AD5C7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD0910E69C;
	Tue,  8 Feb 2022 10:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B9810E65F;
 Tue,  8 Feb 2022 10:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644317379; x=1675853379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FckM1zrypGTJoNdtrrMS/dV/Ay2roxwm2jhMhf2GAi0=;
 b=g8/f2w+saMuFSuBoloqOxYSSLTrqTwOBC7Hx//So5SjT/Vzn7CHCSdr+
 cQfmH7SwgJzJuX12TLMmvmyfEbvOAAd7aTEYWHQhBj+Lm8Ikt1VwV22qY
 OmYGXTypGMNgiOn/bSUu1de2URNSgbAqOSUVn+ALXpVXSuT0TlmlrUqkJ
 Ciuyu9Utl85CBMvH+h3f/pzt747gwBKqyjdmxHuIPf1HEhPISWhg3t/N5
 xNyPZ+/aHyJgYHaVuPdyPHfh2LlErdokukcPiAWt0PgaDiNfVMmknJU/M
 P0Ept/xLetuzMMwG/GZ2TiBMkdNyxr7Dci99dmarFvfOhAsOY00GEbuZf Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="247758993"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="247758993"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:49:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="540547018"
Received: from fpaillet-mobl.amr.corp.intel.com (HELO localhost)
 ([10.209.65.117])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:49:37 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v2 3/4] drm/i915/uapi: Add struct
 drm_i915_query_hwconfig_blob_item
Date: Tue,  8 Feb 2022 02:49:32 -0800
Message-Id: <20220208104933.867812-4-jordan.l.justen@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208104933.867812-1-jordan.l.justen@intel.com>
References: <20220208104933.867812-1-jordan.l.justen@intel.com>
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

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
---
 include/uapi/drm/i915_drm.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 069d2fadfbd9..280e7e2e04d8 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3276,6 +3276,36 @@ struct drm_i915_gem_create_ext_protected_content {
 	__u32 flags;
 };
 
+/**
+ * DOC: GuC HWCONFIG blob uAPI
+ *
+ * The GuC produces a blob with information about the current device.
+ * i915 reads this blob from GuC and makes it available via this uAPI.
+ *
+ * The returned blob is an sequence of items of variable length
+ * described by struct drm_i915_query_hwconfig_blob_item. The
+ * drm_i915_query_hwconfig_blob_item length field gives the length of
+ * the drm_i915_query_hwconfig_blob_item data[] array for the item and
+ * thereby determines the length of that item.
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

