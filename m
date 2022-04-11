Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 969084FC7CD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 00:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0CE10E414;
	Mon, 11 Apr 2022 22:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848B010E0FC;
 Mon, 11 Apr 2022 22:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649717005; x=1681253005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q0IAn+1+/DcmLaHcG9wId5Ak9o3EYK1AC1U+YefCK3E=;
 b=Av47VM5qVjk2i3LQgsm4zX8kx4uCDGqvYc9pIQw5qz71/GXdCCfo7TuB
 IThN4EPfFrQAVj7/FAWLwZeKsHawjugTPXfbr/sa6YKvb3UoZ719F9k1f
 wGYW0is0CbeCoSo+o0dk+6wd2nPluU46lzi5H1QUmC2ddfCCzPjM220+A
 BUiVWs3UKoLbB0nZjwjTK6WRGQd85L/Kj8dSP0BfocIGqvXafqAlkuoko
 JP0e/gU/YSIzK8iFD7dWdh62o5DPTZG/maGt+cWDBK2pfg/X7FA2iNJPE
 3dkOZ8ItCVQNJHNkNsi3o6o/5iPdnuzKTtEiCV1zUCZZtJ3cS46ti4SQd A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="249513171"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="249513171"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 15:43:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="551432089"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 15:43:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/i915/doc: Convert perf UAPI comments to kerneldoc
Date: Mon, 11 Apr 2022 15:43:17 -0700
Message-Id: <20220411224319.467166-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220411224319.467166-1-matthew.d.roper@intel.com>
References: <20220411224319.467166-1-matthew.d.roper@intel.com>
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

Convert the comments for  drm_i915_query_perf_config and
drm_i915_perf_oa_config to kerneldoc so that they will show up in the
generated documentation.  Also correct a couple places that referred to
query_id when they actually meant to refer to query_item.flags.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 include/uapi/drm/i915_drm.h | 116 ++++++++++++++++++++++++++----------
 1 file changed, 86 insertions(+), 30 deletions(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 73e1c6180ddb..787dab98f7b0 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -2657,24 +2657,65 @@ enum drm_i915_perf_record_type {
 	DRM_I915_PERF_RECORD_MAX /* non-ABI */
 };
 
-/*
+/**
+ * struct drm_i915_perf_oa_config
+ *
  * Structure to upload perf dynamic configuration into the kernel.
  */
 struct drm_i915_perf_oa_config {
-	/** String formatted like "%08x-%04x-%04x-%04x-%012x" */
+	/**
+	 * @uuid:
+	 *
+	 * String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x"
+	 */
 	char uuid[36];
 
+	/**
+	 * @n_mux_regs:
+	 *
+	 * Number of mux regs in &mux_regs_ptr.
+	 */
 	__u32 n_mux_regs;
+
+	/**
+	 * @n_boolean_regs:
+	 *
+	 * Number of boolean regs in &boolean_regs_ptr.
+	 */
 	__u32 n_boolean_regs;
+
+	/**
+	 * @n_flex_regs:
+	 *
+	 * Number of flex regs in &flex_regs_ptr.
+	 */
 	__u32 n_flex_regs;
 
-	/*
-	 * These fields are pointers to tuples of u32 values (register address,
-	 * value). For example the expected length of the buffer pointed by
-	 * mux_regs_ptr is (2 * sizeof(u32) * n_mux_regs).
+	/**
+	 * @mux_regs_ptr:
+	 *
+	 * Pointer to tuples of u32 values (register address, value) for mux
+	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
+	 * &n_mux_regs).
 	 */
 	__u64 mux_regs_ptr;
+
+	/**
+	 * @boolean_regs_ptr:
+	 *
+	 * Pointer to tuples of u32 values (register address, value) for mux
+	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
+	 * &n_boolean_regs).
+	 */
 	__u64 boolean_regs_ptr;
+
+	/**
+	 * @flex_regs_ptr:
+	 *
+	 * Pointer to tuples of u32 values (register address, value) for mux
+	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
+	 * &n_flex_regs).
+	 */
 	__u64 flex_regs_ptr;
 };
 
@@ -3001,52 +3042,67 @@ struct drm_i915_query_engine_info {
 	struct drm_i915_engine_info engines[];
 };
 
-/*
- * Data written by the kernel with query DRM_I915_QUERY_PERF_CONFIG.
+/**
+ * struct drm_i915_query_perf_config
+ *
+ * Data written by the kernel with query %DRM_I915_QUERY_PERF_CONFIG.
  */
 struct drm_i915_query_perf_config {
 	union {
-		/*
-		 * When query_item.flags == DRM_I915_QUERY_PERF_CONFIG_LIST, i915 sets
-		 * this fields to the number of configurations available.
+		/**
+		 * @n_configs:
+		 *
+		 * When &drm_i915_query_item.flags ==
+		 * %DRM_I915_QUERY_PERF_CONFIG_LIST, i915 sets this fields to
+		 * the number of configurations available.
 		 */
 		__u64 n_configs;
 
-		/*
-		 * When query_id == DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_ID,
-		 * i915 will use the value in this field as configuration
-		 * identifier to decide what data to write into config_ptr.
+		/**
+		 * @config:
+		 *
+		 * When &drm_i915_query_item.flags ==
+		 * %DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_ID, i915 will use the
+		 * value in this field as configuration identifier to decide
+		 * what data to write into config_ptr.
 		 */
 		__u64 config;
 
-		/*
-		 * When query_id == DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID,
-		 * i915 will use the value in this field as configuration
-		 * identifier to decide what data to write into config_ptr.
+		/**
+		 * @uuid:
+		 *
+		 * When &drm_i915_query_item.flags ==
+		 * %DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID, i915 will use the
+		 * value in this field as configuration identifier to decide
+		 * what data to write into config_ptr.
 		 *
 		 * String formatted like "%08x-%04x-%04x-%04x-%012x"
 		 */
 		char uuid[36];
 	};
 
-	/*
+	/**
+	 * @flags:
+	 *
 	 * Unused for now. Must be cleared to zero.
 	 */
 	__u32 flags;
 
-	/*
-	 * When query_item.flags == DRM_I915_QUERY_PERF_CONFIG_LIST, i915 will
-	 * write an array of __u64 of configuration identifiers.
+	/**
+	 * @data:
+	 *
+	 * When &drm_i915_query_item.flags == %DRM_I915_QUERY_PERF_CONFIG_LIST,
+	 * i915 will write an array of __u64 of configuration identifiers.
 	 *
-	 * When query_item.flags == DRM_I915_QUERY_PERF_CONFIG_DATA, i915 will
-	 * write a struct drm_i915_perf_oa_config. If the following fields of
-	 * drm_i915_perf_oa_config are set not set to 0, i915 will write into
-	 * the associated pointers the values of submitted when the
+	 * When &drm_i915_query_item.flags == %DRM_I915_QUERY_PERF_CONFIG_DATA,
+	 * i915 will write a struct drm_i915_perf_oa_config. If the following
+	 * fields of struct drm_i915_perf_oa_config are not set to 0, i915 will
+	 * write into the associated pointers the values of submitted when the
 	 * configuration was created :
 	 *
-	 *         - n_mux_regs
-	 *         - n_boolean_regs
-	 *         - n_flex_regs
+	 *  - &drm_i915_perf_oa_config.n_mux_regs
+	 *  - &drm_i915_perf_oa_config.n_boolean_regs
+	 *  - &drm_i915_perf_oa_config.n_flex_regs
 	 */
 	__u8 data[];
 };
-- 
2.34.1

