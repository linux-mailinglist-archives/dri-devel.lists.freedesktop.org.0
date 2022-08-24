Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ACA59F5A4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 10:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54832113453;
	Wed, 24 Aug 2022 08:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D062010F378;
 Wed, 24 Aug 2022 08:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661330731; x=1692866731;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+XjYRediJD7IwQVGFW2QA3pPp1WRUo9zWyg1rmydIJA=;
 b=BxhUV+NLMX38WiBwQ3OFROcjNDCv0SwJTNaWWRvKph8H1ANO+j6q+Q7G
 7N1ONhBS0rjXwWew9WkIAhQf9Kug4rPXs46noRz40iy7QEYtYOBmwCYXO
 Phj1fu2sDWvaUQg8toEq9DRr6TQBOi6j+B051H10N2Y1dX5WgBqcJsAzx
 NdcyFRgLy7KZd46IkkAYgFEVg6ZOuc1bIZEnDAr2PISEUQ7UDtot83tyt
 /KgSgoeDvjU/gekMcDsuwDTUgaGh4jgzrnJN9DlXnNhOOrNRT7mWq+0M3
 1Trle7x35qwXyTwwlpYc+K642zMv5Vffjip4yntainSCjBO9INkbekgoh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="291473637"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="291473637"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 01:45:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="785553962"
Received: from yuhsuanc-mobl.gar.corp.intel.com (HELO
 paris.amr.corp.intel.com) ([10.254.38.238])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 01:45:28 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 1/8] overflow: Move and add few utility macros into overflow
Date: Wed, 24 Aug 2022 17:45:07 +0900
Message-Id: <20220824084514.2261614-2-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824084514.2261614-1-gwan-gyeong.mun@intel.com>
References: <20220824084514.2261614-1-gwan-gyeong.mun@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, mauro.chehab@linux.intel.com,
 andi.shyti@linux.intel.com, keescook@chromium.org, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, airlied@linux.ie, andrzej.hajda@intel.com,
 matthew.auld@intel.com, intel-gfx-trybot@lists.freedesktop.org,
 mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It moves overflows_type utility macro into overflow header from i915_utils
header. The overflows_type can be used to catch the truncaion (overflow)
between different data types. And it adds check_assign() macro which
performs an assigning source value into destination ptr along with an
overflow check. overflow_type macro has been improved to handle the signbit
by gcc's built-in overflow check function. And it adds overflows_ptr()
helper macro for checking the overflows between a value and a pointer
type/value.

v3: Add is_type_unsigned() macro (Mauro)
    Modify overflows_type() macro to consider signed data types (Mauro)
    Fix the problem that safe_conversion() macro always returns true
v4: Fix kernel-doc markups
v6: Move macro addition location so that it can be used by other than drm
    subsystem (Jani, Mauro, Andi)
    Change is_type_unsigned to is_unsigned_type to have the same name form
    as is_signed_type macro
v8: Add check_assign() and remove safe_conversion() (Kees)
    Fix overflows_type() to use gcc's built-in overflow function (Andrzej)
    Add overflows_ptr() to allow overflow checking when assigning a value
    into a pointer variable (G.G.)
v9: Fix overflows_type() to use __builtin_add_overflow() instead of
    __builtin_add_overflow_p() (Andrzej)
    Fix overflows_ptr() to use overflows_type() with the unsigned long type
    (Andrzej)

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kees Cook <keescook@chromium.org>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org> (v5)
---
 drivers/gpu/drm/i915/i915_user_extensions.c |  3 +-
 drivers/gpu/drm/i915/i915_utils.h           |  5 +-
 include/linux/overflow.h                    | 62 +++++++++++++++++++++
 3 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_user_extensions.c b/drivers/gpu/drm/i915/i915_user_extensions.c
index c822d0aafd2d..6f6b5b910968 100644
--- a/drivers/gpu/drm/i915/i915_user_extensions.c
+++ b/drivers/gpu/drm/i915/i915_user_extensions.c
@@ -50,8 +50,7 @@ int i915_user_extensions(struct i915_user_extension __user *ext,
 		if (err)
 			return err;
 
-		if (get_user(next, &ext->next_extension) ||
-		    overflows_type(next, ext))
+		if (get_user(next, &ext->next_extension) || overflows_ptr(next))
 			return -EFAULT;
 
 		ext = u64_to_user_ptr(next);
diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index c10d68cdc3ca..eb0ded23fa9c 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -32,6 +32,7 @@
 #include <linux/types.h>
 #include <linux/workqueue.h>
 #include <linux/sched/clock.h>
+#include <linux/overflow.h>
 
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
diff --git a/include/linux/overflow.h b/include/linux/overflow.h
index f1221d11f8e5..6af9df1d67a1 100644
--- a/include/linux/overflow.h
+++ b/include/linux/overflow.h
@@ -52,6 +52,68 @@ static inline bool __must_check __must_check_overflow(bool overflow)
 	return unlikely(overflow);
 }
 
+/**
+ * overflows_type - helper for checking the overflows between data types or
+ *                  values
+ *
+ * @x: Source value or data type for overflow check
+ * @T: Destination value or data type for overflow check
+ *
+ * It compares the values or data type between the first and second argument to
+ * check whether overflow can occur when assigning the first argument to the
+ * variable of the second argument. Source and Destination can be singned or
+ * unsigned data types. Source and Destination can be different data types.
+ *
+ * Returns:
+ * True if overflow can occur, false otherwise.
+ */
+#define overflows_type(x, T) __must_check_overflow(({	\
+	typeof(T) v = 0;				\
+	__builtin_add_overflow((x), v, &v);		\
+}))
+
+/**
+ * overflows_ptr - helper for checking the occurrence of overflows when a value
+ *                 assigns to  the pointer data type
+ *
+ * @x: Source value for overflow check
+ *
+ * gcc's built-in overflow check functions don't support checking between the
+ * pointer type and non-pointer type. And ILP32 and LP64 have the same bit size
+ * between long and pointer. Therefore it internally compares the source value
+ * and unsigned long data type for checking overflow.
+ *
+ * Returns:
+ * True if overflow can occur, false otherwise.
+ */
+#define overflows_ptr(x) __must_check_overflow(overflows_type(x, unsigned long))
+
+/**
+ * check_assign - perform an assigning source value into destination ptr along
+ *                with an overflow check.
+ *
+ * @value: Source value
+ * @ptr: Destination pointer address, If the pointer type is not used,
+ *       a warning message is output during build.
+ *
+ * It checks internally the ptr is a pointer type. And it uses gcc's built-in
+ * overflow check function.
+ * It does not use the check_*() wrapper functions, but directly uses gcc's
+ * built-in overflow check function so that it can be used even when
+ * the type of value and the type pointed to by ptr are different without build
+ * warning messages.
+ *
+ * Returns:
+ * If the value would overflow the destination, it returns true. If not return
+ * false. When overflow does not occur, the assigning into ptr from value
+ * succeeds. It follows the return policy as other check_*_overflow() functions
+ * return non-zero as a failure.
+ */
+#define check_assign(value, ptr) __must_check_overflow(({	\
+	typecheck_pointer(ptr); 		\
+	__builtin_add_overflow(0, value, ptr);	\
+}))
+
 /*
  * For simplicity and code hygiene, the fallback code below insists on
  * a, b and *d having the same type (similar to the min() and max()
-- 
2.37.1

