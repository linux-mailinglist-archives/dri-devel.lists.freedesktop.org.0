Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD76566D84
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 14:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE4A10E626;
	Tue,  5 Jul 2022 12:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B39C10E30A;
 Tue,  5 Jul 2022 12:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657023904; x=1688559904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+4kEEAnXF0yyM7JtzkZFaHrnyjAjEbzB7khuK36H9yU=;
 b=JKwK3u4sWEcPtGSXl4BuNuza/74Ibmr2XcjgKuu3CHHt218YGckh+wSz
 SYbXxABlXDYd9v0izZBY9lmGquvsjFys72ABiYi/pl8pvV1R4aUFicfne
 O+nwv0iBSLlyr+VH+n4rTdVryjR/x1c3hIJgcIiwo2EjwKFRmTJ5u4vNc
 XXTRyjjZRrNvF/o2iT3jggwa5qGdgiWvqHRhD2u9lsh4bm1LclsA2kGhD
 zrHjhMeKKokwHJk8jkHU1S3Bk9QtcJj12KvSSjoWCZPOyH11yiEMIqfeX
 2G9IJpV/5al2LQgASG3ezXrQWda9OOuSlFWZmlNB+xlVev/HiE/g5nmHz Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="345019745"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="345019745"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 05:25:04 -0700
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="650119420"
Received: from mmckenzi-mobl.ger.corp.intel.com (HELO
 hades.ger.corp.intel.com) ([10.252.50.45])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 05:25:02 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/7] drm: Move and add a few utility macros into drm util
 header
Date: Tue,  5 Jul 2022 15:24:49 +0300
Message-Id: <20220705122455.3866745-2-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705122455.3866745-1-gwan-gyeong.mun@intel.com>
References: <20220705122455.3866745-1-gwan-gyeong.mun@intel.com>
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
 matthew.auld@intel.com, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It moves overflows_type utility macro into drm util header from i915_utils
header. The overflows_type can be used to catch the truncation between data
types. And it adds safe_conversion() macro which performs a type conversion
(cast) of an source value into a new variable, checking that the
destination is large enough to hold the source value.
And it adds exact_type and exactly_pgoff_t macro to catch type mis-match
while compiling.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_utils.h |  5 +--
 include/drm/drm_util.h            | 54 +++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 4 deletions(-)

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
index 79952d8c4bba..c56230e39e37 100644
--- a/include/drm/drm_util.h
+++ b/include/drm/drm_util.h
@@ -62,6 +62,60 @@
  */
 #define for_each_if(condition) if (!(condition)) {} else
 
+/**
+ * overflows_type - helper for checking the truncation between data types
+ * @x: Source for overflow type comparison
+ * @T: Destination for overflow type comparison
+ *
+ * It compares the values and size of each data type between the first and
+ * second argument to check whether truncation can occur when assigning the
+ * first argument to the variable of the second argument.
+ * It does't consider signbits.
+ *
+ * Returns:
+ * True if truncation can occur, false otherwise.
+ */
+#define overflows_type(x, T) \
+	(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
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
+	overflows_type(__v, *__ptr) ? 0 : (*__ptr = (typeof(*__ptr))__v), 1; \
+})
+
 /**
  * drm_can_sleep - returns true if currently okay to sleep
  *
-- 
2.34.1

