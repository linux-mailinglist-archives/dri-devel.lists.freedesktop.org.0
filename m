Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD4B5747C2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 11:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AB712A292;
	Thu, 14 Jul 2022 09:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AEF18B23C;
 Thu, 14 Jul 2022 09:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657789694; x=1689325694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tw4yw729KI+I/3nX2PNmxTTIYlEFEN5nPXIhKCG3oGs=;
 b=LgPRK6Koz1PCC9F1EkW70khoLFNf0BB06mkVrbD7BBFjBEQygcdC+m6w
 gn7nBsZdwdRW5o3kqcduaf6neT3EO5VMrkzXD5U4lfk3fd3gCvJIFkHVP
 g7li+iXz4ZhFUUuNwyvxieP8m5gUQyDBrpDQut8dHt36hjV+1IZLJp251
 47RnHzhPmpbx+G/dg37r2PNUNjeZh35MqBtMV3Sdtqntx4v9ha+Xo9uVV
 RoJW52FloeMgPp58U6/gfz2mqX9t32OHqe8aHFvazOX8NM+SFRnYysc6T
 scFrdHYlQVm63f8Wf8pouBQGxNoPbRNVD7neQTEhFwpcRrLr47izR4y3u g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="284217885"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="284217885"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 02:08:14 -0700
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="623337791"
Received: from akaleem-mobl1.gar.corp.intel.com (HELO
 hades.ger.corp.intel.com) ([10.252.37.114])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 02:08:12 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/7] drm: Move and add a few utility macros into drm util
 header
Date: Thu, 14 Jul 2022 12:08:01 +0300
Message-Id: <20220714090807.2340818-2-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220714090807.2340818-1-gwan-gyeong.mun@intel.com>
References: <20220714090807.2340818-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 matthew.auld@intel.com, mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It moves overflows_type utility macro into drm util header from i915_utils
header. The overflows_type can be used to catch the truncation between data
types. And it adds safe_conversion() macro which performs a type conversion
(cast) of an source value into a new variable, checking that the
destination is large enough to hold the source value.
And it adds exact_type and exactly_pgoff_t macro to catch type mis-match
while compiling.

v3: Add is_type_unsigned() macro (Mauro)
    Modify overflows_type() macro to consider signed data types (Mauro)
    Fix the problem that safe_conversion() macro always returns true

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_utils.h |  5 +-
 include/drm/drm_util.h            | 77 +++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index c10d68cdc3ca..345e5b2dc1cd 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -32,6 +32,7 @@
 #include <linux/types.h>
 #include <linux/workqueue.h>
 #include <linux/sched/clock.h>
+#include <drm/drm_util.h>
 
 #ifdef CONFIG_X86
 #include <asm/hypervisor.h>
@@ -111,10 +112,6 @@ bool i915_error_injected(void);
 #define range_overflows_end_t(type, start, size, max) \
 	range_overflows_end((type)(start), (type)(size), (type)(max))
 
-/* Note we don't consider signbits :| */
-#define overflows_type(x, T) \
-	(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
-
 #define ptr_mask_bits(ptr, n) ({					\
 	unsigned long __v = (unsigned long)(ptr);			\
 	(typeof(ptr))(__v & -BIT(n));					\
diff --git a/include/drm/drm_util.h b/include/drm/drm_util.h
index 79952d8c4bba..d594ef34b537 100644
--- a/include/drm/drm_util.h
+++ b/include/drm/drm_util.h
@@ -62,6 +62,83 @@
  */
 #define for_each_if(condition) if (!(condition)) {} else
 
+/**
+ * is_type_unsigned - helper for checking data type which is an unsigned data
+ * type or not
+ * @x: The data type to check
+ *
+ * Returns:
+ * True if the data type is an unsigned data type, false otherwise.
+ */
+#define is_type_unsigned(x) ((typeof(x))-1 >= (typeof(x))0)
+
+/**
+ * overflows_type - helper for checking the truncation between data types
+ * @x: Source for overflow type comparison
+ * @T: Destination for overflow type comparison
+ *
+ * It compares the values and size of each data type between the first and
+ * second argument to check whether truncation can occur when assigning the
+ * first argument to the variable of the second argument.
+ * Source and Destination can be used with or without sign bit.
+ * Composite data structures such as union and structure are not considered.
+ * Enum data types are not considered.
+ * Floating point data types are not considered.
+ *
+ * Returns:
+ * True if truncation can occur, false otherwise.
+ */
+
+#define overflows_type(x, T) \
+	(is_type_unsigned(x) ? \
+		is_type_unsigned(T) ? \
+			(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
+			: (sizeof(x) >= sizeof(T) && (x) >> (BITS_PER_TYPE(T) - 1)) ? 1 : 0 \
+	: is_type_unsigned(T) ? \
+		((x) < 0) ? 1 : (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
+		: (sizeof(x) > sizeof(T)) ? \
+			((x) < 0) ? (((x) * -1) >> BITS_PER_TYPE(T)) ? 1 : 0 \
+				: ((x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
+			: 0)
+
+/**
+ * exact_type - break compile if source type and destination value's type are
+ * not the same
+ * @T: Source type
+ * @n: Destination value
+ *
+ * It is a helper macro for a poor man's -Wconversion: only allow variables of
+ * an exact type. It determines whether the source type and destination value's
+ * type are the same while compiling, and it breaks compile if two types are
+ * not the same
+ */
+#define exact_type(T, n) \
+	BUILD_BUG_ON(!__builtin_constant_p(n) && !__builtin_types_compatible_p(T, typeof(n)))
+
+/**
+ * exactly_pgoff_t - helper to check if the type of a value is pgoff_t
+ * @n: value to compare pgoff_t type
+ *
+ * It breaks compile if the argument value's type is not pgoff_t type.
+ */
+#define exactly_pgoff_t(n) exact_type(pgoff_t, n)
+
+/*
+ * safe_conversion - perform a type conversion (cast) of an source value into
+ * a new variable, checking that the destination is large enough to hold the
+ * source value.
+ * @ptr: Destination pointer address
+ * @value: Source value
+ *
+ * Returns:
+ * If the value would overflow the destination, it returns false.
+ */
+#define safe_conversion(ptr, value) ({ \
+	typeof(value) __v = (value); \
+	typeof(ptr) __ptr = (ptr); \
+	overflows_type(__v, *__ptr) ? 0 : ((*__ptr = (typeof(*__ptr))__v), 1); \
+})
+
 /**
  * drm_can_sleep - returns true if currently okay to sleep
  *
-- 
2.34.1

