Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9435B3C202
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278AB10EC2B;
	Fri, 29 Aug 2025 17:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FdHDF/OR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD44E10EC1F;
 Fri, 29 Aug 2025 17:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756489588; x=1788025588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ffhQYsIDiciYhH+b5mTnOldlYmqjRKlLJpxwdY8kaKM=;
 b=FdHDF/ORjTykHzDvfkMrhDXH5I5Kc+BOEsEYQQ6KMHkk4kdBfwO/80bm
 d03ac4CK0tPqbEuUHm+M6/vpxaA/LFl06YPZzaApZ1yfP9P4KHaJD2p9o
 f4VwdcHtA3i58NTpfXq3gbir4/ssRAyoSIJcAKVv4BUP1c9XH5OvYHiwT
 f4VeWYcpLXGaJDXPK1y+w65bQ5fg++jOmZiXU2IRM6JqmDPBPHMGovu4n
 fgEf9TxuNXnKG7Z61vSLVNfxETMH294PSmx/zVtaDnpbGHm14MnYBpKv8
 xNT837i0FM5CmbEdY1Kc9ttosoMlbnnkBvt/2TChnqyve6I45UsaigoZv A==;
X-CSE-ConnectionGUID: IgAFV+yrQ/KIqiYc6/9A9w==
X-CSE-MsgGUID: Hp776OS3SiCD7X1kPS4LqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58851405"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58851405"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:46:28 -0700
X-CSE-ConnectionGUID: fGPMj5/lRymVIoM1KyC6qA==
X-CSE-MsgGUID: oKGJbnFSTQKo7EXZ0qa+Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="175716544"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.58])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:46:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, jani.nikula@intel.com,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH 3/3] overflow: add range_overflows() and range_end_overflows()
Date: Fri, 29 Aug 2025 20:46:01 +0300
Message-ID: <20250829174601.2163064-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250829174601.2163064-1-jani.nikula@intel.com>
References: <20250829174601.2163064-1-jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the range_overflows() and range_end_overflows() along with the _t
variants over from drm/i915 and drm/buddy to overflow.h.

Cc: Kees Cook <kees@kernel.org>
Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_utils.h | 70 -------------------------------
 include/drm/drm_buddy.h           |  9 ----
 include/linux/overflow.h          | 70 +++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index 968dae941532..eb4d43c40009 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -67,76 +67,6 @@ bool i915_error_injected(void);
 		drm_err(&(i915)->drm, fmt, ##__VA_ARGS__); \
 })
 
-/**
- * range_overflows() - Check if a range is out of bounds
- * @start: Start of the range.
- * @size:  Size of the range.
- * @max:   Exclusive upper boundary.
- *
- * A strict check to determine if the range [@start, @start + @size) is
- * invalid with respect to the allowable range [0, @max). Any range
- * starting at or beyond @max is considered an overflow, even if @size is 0.
- *
- * Returns: true if the range is out of bounds.
- */
-#define range_overflows(start, size, max) ({ \
-	typeof(start) start__ = (start); \
-	typeof(size) size__ = (size); \
-	typeof(max) max__ = (max); \
-	(void)(&start__ == &size__); \
-	(void)(&start__ == &max__); \
-	start__ >= max__ || size__ > max__ - start__; \
-})
-
-/**
- * range_overflows_t() - Check if a range is out of bounds
- * @type:  Data type to use.
- * @start: Start of the range.
- * @size:  Size of the range.
- * @max:   Exclusive upper boundary.
- *
- * Same as range_overflows() but forcing the parameters to @type.
- *
- * Returns: true if the range is out of bounds.
- */
-#define range_overflows_t(type, start, size, max) \
-	range_overflows((type)(start), (type)(size), (type)(max))
-
-/**
- * range_end_overflows() - Check if a range's endpoint is out of bounds
- * @start: Start of the range.
- * @size:  Size of the range.
- * @max:   Exclusive upper boundary.
- *
- * Checks only if the endpoint of a range (@start + @size) exceeds @max.
- * Unlike range_overflows(), a zero-sized range at the boundary (@start == @max)
- * is not considered an overflow. Useful for iterator-style checks.
- *
- * Returns: true if the endpoint exceeds the boundary.
- */
-#define range_end_overflows(start, size, max) ({ \
-	typeof(start) start__ = (start); \
-	typeof(size) size__ = (size); \
-	typeof(max) max__ = (max); \
-	(void)(&start__ == &size__); \
-	(void)(&start__ == &max__); \
-	start__ > max__ || size__ > max__ - start__; \
-})
-
-/**
- * range_end_overflows_t() - Check if a range's endpoint is out of bounds
- * @type:  Data type to use.
- * @start: Start of the range.
- * @size:  Size of the range.
- * @max:   Exclusive upper boundary.
- *
- * Same as range_end_overflows() but forcing the parameters to @type.
- *
- * Returns: true if the endpoint exceeds the boundary.
- */
-#define range_end_overflows_t(type, start, size, max) \
-	range_end_overflows((type)(start), (type)(size), (type)(max))
-
 #define ptr_mask_bits(ptr, n) ({					\
 	unsigned long __v = (unsigned long)(ptr);			\
 	(typeof(ptr))(__v & -BIT(n));					\
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 513837632b7d..04afd7c21a82 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -13,15 +13,6 @@
 
 #include <drm/drm_print.h>
 
-#define range_overflows(start, size, max) ({ \
-	typeof(start) start__ = (start); \
-	typeof(size) size__ = (size); \
-	typeof(max) max__ = (max); \
-	(void)(&start__ == &size__); \
-	(void)(&start__ == &max__); \
-	start__ >= max__ || size__ > max__ - start__; \
-})
-
 #define DRM_BUDDY_RANGE_ALLOCATION		BIT(0)
 #define DRM_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
 #define DRM_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
diff --git a/include/linux/overflow.h b/include/linux/overflow.h
index 154ed0dbb43f..725f95f7e416 100644
--- a/include/linux/overflow.h
+++ b/include/linux/overflow.h
@@ -238,6 +238,76 @@ static inline bool __must_check __must_check_overflow(bool overflow)
 			      __overflows_type_constexpr(n, T),	\
 			      __overflows_type(n, T))
 
+/**
+ * range_overflows() - Check if a range is out of bounds
+ * @start: Start of the range.
+ * @size:  Size of the range.
+ * @max:   Exclusive upper boundary.
+ *
+ * A strict check to determine if the range [@start, @start + @size) is
+ * invalid with respect to the allowable range [0, @max). Any range
+ * starting at or beyond @max is considered an overflow, even if @size is 0.
+ *
+ * Returns: true if the range is out of bounds.
+ */
+#define range_overflows(start, size, max) ({ \
+	typeof(start) start__ = (start); \
+	typeof(size) size__ = (size); \
+	typeof(max) max__ = (max); \
+	(void)(&start__ == &size__); \
+	(void)(&start__ == &max__); \
+	start__ >= max__ || size__ > max__ - start__; \
+})
+
+/**
+ * range_overflows_t() - Check if a range is out of bounds
+ * @type:  Data type to use.
+ * @start: Start of the range.
+ * @size:  Size of the range.
+ * @max:   Exclusive upper boundary.
+ *
+ * Same as range_overflows() but forcing the parameters to @type.
+ *
+ * Returns: true if the range is out of bounds.
+ */
+#define range_overflows_t(type, start, size, max) \
+	range_overflows((type)(start), (type)(size), (type)(max))
+
+/**
+ * range_end_overflows() - Check if a range's endpoint is out of bounds
+ * @start: Start of the range.
+ * @size:  Size of the range.
+ * @max:   Exclusive upper boundary.
+ *
+ * Checks only if the endpoint of a range (@start + @size) exceeds @max.
+ * Unlike range_overflows(), a zero-sized range at the boundary (@start == @max)
+ * is not considered an overflow. Useful for iterator-style checks.
+ *
+ * Returns: true if the endpoint exceeds the boundary.
+ */
+#define range_end_overflows(start, size, max) ({ \
+	typeof(start) start__ = (start); \
+	typeof(size) size__ = (size); \
+	typeof(max) max__ = (max); \
+	(void)(&start__ == &size__); \
+	(void)(&start__ == &max__); \
+	start__ > max__ || size__ > max__ - start__; \
+})
+
+/**
+ * range_end_overflows_t() - Check if a range's endpoint is out of bounds
+ * @type:  Data type to use.
+ * @start: Start of the range.
+ * @size:  Size of the range.
+ * @max:   Exclusive upper boundary.
+ *
+ * Same as range_end_overflows() but forcing the parameters to @type.
+ *
+ * Returns: true if the endpoint exceeds the boundary.
+ */
+#define range_end_overflows_t(type, start, size, max) \
+	range_end_overflows((type)(start), (type)(size), (type)(max))
+
 /**
  * castable_to_type - like __same_type(), but also allows for casted literals
  *
-- 
2.47.2

