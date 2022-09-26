Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 160305EAB4E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 17:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD96810E709;
	Mon, 26 Sep 2022 15:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B2E10E6F9;
 Mon, 26 Sep 2022 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664206842; x=1695742842;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yiSHhxd0J6q37jy+IXwqpm9jwf2+qCzcdLgVfHTY4RQ=;
 b=d/t1B2h49o0kEoLsybZiG0W4Jc96sSzmOAnI6evyS2byLaiQUPbulBC8
 KEAG3TVjtbvDwUR/bwRL2K6sJsHhOvR/tzW8dt7+zSzvxP+XqfqM36Qpc
 Ti2R2lqj+aBHfvQesq3U7OVS1bvnic3JWmLjyBMMhIEBwDPQoS0B0nzPA
 N3ne75pGb2I6NlaBChN2e1uIkKtCs6pS3Kn7zbjPfHlfVEcKv8j2xdlDa
 2iE9/1WEFX8THNUckdNpzBCUCD62C+wp87cnWuTcSWaBkpGOOrgC1hqhx
 n7fMvPN0Q1hCAnfVQJWPeYV5lPLi6ycMGZU0MUu6xV4DHagl2nfBQVGQG A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="327413256"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="327413256"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 08:40:41 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="763480881"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="763480881"
Received: from bsochack-mobl2.ger.corp.intel.com (HELO
 paris.ger.corp.intel.com) ([10.249.128.215])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 08:40:33 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v12 3/9] overflow: Introduce overflows_type() and
 __castable_to_type()
Date: Mon, 26 Sep 2022 18:39:47 +0300
Message-Id: <20220926153953.3836470-4-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220926153953.3836470-1-gwan-gyeong.mun@intel.com>
References: <20220926153953.3836470-1-gwan-gyeong.mun@intel.com>
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
Cc: gustavoars@kernel.org, trix@redhat.com, dlatypov@google.com,
 llvm@lists.linux.dev, linux@rasmusvillemoes.dk,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 linux-hardening@vger.kernel.org, andrzej.hajda@intel.com,
 linux-sparse@vger.kernel.org, matthew.auld@intel.com,
 andi.shyti@linux.intel.com, airlied@redhat.com,
 thomas.hellstrom@linux.intel.com, keescook@chromium.org, jani.nikula@intel.com,
 nathan@kernel.org, mchehab@kernel.org, mauro.chehab@linux.intel.com,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org, vitor@massaru.org,
 luc.vanoostenryck@gmail.com, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kees Cook <keescook@chromium.org>

Add overflows_type() to test if a variable or constant value would
overflow another variable or type. This can be used as a constant
expression for static_assert() (which requires a constant
expression[1][2]) when used on constant values. This must be constructed
manually, since __builtin_add_overflow() does not produce a constant
expression[3].

Additionally adds __castable_to_type(), similar to __same_type(), for
checking if a constant value will fit in a given type (i.e. it could
be cast to the type without overflow).

Add unit tests for overflows_type(), __same_type(), and
__castable_to_type() to the existing KUnit "overflow" test.

[1] https://en.cppreference.com/w/c/language/_Static_assert
[2] C11 standard (ISO/IEC 9899:2011): 6.7.10 Static assertions
[3] https://gcc.gnu.org/onlinedocs/gcc/Integer-Overflow-Builtins.html
    6.56 Built-in Functions to Perform Arithmetic with Overflow Checking
    Built-in Function: bool __builtin_add_overflow (type1 a, type2 b,
                                                    type3 *res)

v12: Rebase and remove overflows_type() macro of i915_utils.h (G.G)

Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Tom Rix <trix@redhat.com>
Cc: Daniel Latypov <dlatypov@google.com>
Cc: Vitor Massaru Iha <vitor@massaru.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-hardening@vger.kernel.org
Cc: llvm@lists.linux.dev
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/i915/i915_utils.h |   5 +-
 include/linux/compiler.h          |   1 +
 include/linux/overflow.h          |  48 ++++
 lib/overflow_kunit.c              | 393 +++++++++++++++++++++++++++++-
 4 files changed, 442 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index 6c14d13364bf..efd3d69b78f7 100644
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
diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 7713d7bcdaea..c631107e93b1 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -244,6 +244,7 @@ static inline void *offset_to_ptr(const int *off)
  * bool and also pointer types.
  */
 #define is_signed_type(type) (((type)(-1)) < (__force type)1)
+#define is_unsigned_type(type) (!is_signed_type(type))
 
 /*
  * This is needed in functions which generate the stack canary, see
diff --git a/include/linux/overflow.h b/include/linux/overflow.h
index 8ccbfa46f0ed..6d5da8b052c2 100644
--- a/include/linux/overflow.h
+++ b/include/linux/overflow.h
@@ -171,6 +171,54 @@ static inline bool __must_check __must_check_overflow(bool overflow)
 	check_assign(value, &kptr) ? 1 : (({ ptr = (void __user *)kptr; }), 0);	\
 }))
 
+#define __overflows_type_constexpr(x, T) (			\
+	is_unsigned_type(typeof(x)) ?				\
+		(x) > type_max(typeof(T)) ? 1 : 0		\
+	: is_unsigned_type(typeof(T)) ?				\
+		(x) < 0 || (x) > type_max(typeof(T)) ? 1 : 0	\
+		: (x) < type_min(typeof(T)) ||			\
+		  (x) > type_max(typeof(T)) ? 1 : 0 )
+
+#define __overflows_type(x, T)		({	\
+	typeof(T) v = 0;			\
+	check_add_overflow((x), v, &v);		\
+})
+
+/**
+ * overflows_type - helper for checking the overflows between value, variables,
+ *		    or data type
+ *
+ * @n: source constant value or variable to be checked
+ * @T: destination variable or data type proposed to store @x
+ *
+ * Compares the @x expression for whether or not it can safely fit in
+ * the storage of the type in @T. @x and @T can have different types.
+ * If @x is a constant expression, this will also resolve to a constant
+ * expression.
+ *
+ * Returns: true if overflow can occur, false otherwise.
+ */
+#define overflows_type(n, T)					\
+	__builtin_choose_expr(__is_constexpr(n),		\
+			      __overflows_type_constexpr(n, T),	\
+			      __overflows_type(n, T))
+
+/**
+ * __castable_to_type - like __same_type(), but also allows for casted literals
+ *
+ * @n: variable or constant value
+ * @T: data type or variable
+ *
+ * Unlike the __same_type() macro, this allows a constant value as the
+ * first argument. If this value would not overflow into an assignment
+ * of the second argument's type, it returns true. Otherwise, this falls
+ * back to __same_type().
+ */
+#define __castable_to_type(n, T)					\
+	__builtin_choose_expr(__is_constexpr(n),			\
+			      !__overflows_type_constexpr(n, T),	\
+			      __same_type(n, T))
+
 /**
  * size_mul() - Calculate size_t multiplication with saturation at SIZE_MAX
  *
diff --git a/lib/overflow_kunit.c b/lib/overflow_kunit.c
index 0d98c9bc75da..7691c2cf2e6c 100644
--- a/lib/overflow_kunit.c
+++ b/lib/overflow_kunit.c
@@ -16,6 +16,9 @@
 #include <linux/types.h>
 #include <linux/vmalloc.h>
 
+/* We're expecting to do a lot of "always true" or "always false" tests. */
+#pragma clang diagnostic ignored "-Wtautological-constant-out-of-range-compare"
+
 #define DEFINE_TEST_ARRAY_TYPED(t1, t2, t)			\
 	static const struct test_ ## t1 ## _ ## t2 ## __ ## t {	\
 		t1 a;						\
@@ -246,7 +249,7 @@ DEFINE_TEST_ARRAY(s64) = {
 
 #define DEFINE_TEST_FUNC_TYPED(n, t, fmt)				\
 static void do_test_ ## n(struct kunit *test, const struct test_ ## n *p) \
-{							   		\
+{									\
 	check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);	\
 	check_one_op(t, fmt, add, "+", p->b, p->a, p->sum, p->s_of);	\
 	check_one_op(t, fmt, sub, "-", p->a, p->b, p->diff, p->d_of);	\
@@ -687,6 +690,391 @@ static void overflow_size_helpers_test(struct kunit *test)
 #undef check_one_size_helper
 }
 
+static void overflows_type_test(struct kunit *test)
+{
+	int count = 0;
+	unsigned int var;
+
+#define __TEST_OVERFLOWS_TYPE(func, arg1, arg2, of)	do {		\
+	bool __of = func(arg1, arg2);					\
+	KUNIT_EXPECT_EQ_MSG(test, __of, of,				\
+		"expected " #func "(" #arg1 ", " #arg2 " to%s overflow\n",\
+		of ? "" : " not");					\
+	count++;							\
+} while (0)
+
+/* Args are: first type, second type, value, overflow expected */
+#define TEST_OVERFLOWS_TYPE(__t1, __t2, v, of) do {			\
+	__t1 t1 = (v);							\
+	__t2 t2;							\
+	__TEST_OVERFLOWS_TYPE(__overflows_type, t1, t2, of);		\
+	__TEST_OVERFLOWS_TYPE(__overflows_type, t1, __t2, of);		\
+	__TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);	\
+	__TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
+} while (0)
+
+	TEST_OVERFLOWS_TYPE(u8, u8, U8_MAX, false);
+	TEST_OVERFLOWS_TYPE(u8, u16, U8_MAX, false);
+	TEST_OVERFLOWS_TYPE(u8, s8, U8_MAX, true);
+	TEST_OVERFLOWS_TYPE(u8, s8, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(u8, s8, (u8)S8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u8, s16, U8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s8, u8, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s8, u8, -1, true);
+	TEST_OVERFLOWS_TYPE(s8, u8, S8_MIN, true);
+	TEST_OVERFLOWS_TYPE(s8, u16, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s8, u16, -1, true);
+	TEST_OVERFLOWS_TYPE(s8, u16, S8_MIN, true);
+	TEST_OVERFLOWS_TYPE(s8, u32, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s8, u32, -1, true);
+	TEST_OVERFLOWS_TYPE(s8, u32, S8_MIN, true);
+#if BITS_PER_LONG == 64
+	TEST_OVERFLOWS_TYPE(s8, u64, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s8, u64, -1, true);
+	TEST_OVERFLOWS_TYPE(s8, u64, S8_MIN, true);
+#endif
+	TEST_OVERFLOWS_TYPE(s8, s8, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s8, s8, S8_MIN, false);
+	TEST_OVERFLOWS_TYPE(s8, s16, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s8, s16, S8_MIN, false);
+	TEST_OVERFLOWS_TYPE(u16, u8, U8_MAX, false);
+	TEST_OVERFLOWS_TYPE(u16, u8, (u16)U8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u16, u8, U16_MAX, true);
+	TEST_OVERFLOWS_TYPE(u16, s8, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(u16, s8, (u16)S8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u16, s8, U16_MAX, true);
+	TEST_OVERFLOWS_TYPE(u16, s16, S16_MAX, false);
+	TEST_OVERFLOWS_TYPE(u16, s16, (u16)S16_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u16, s16, U16_MAX, true);
+	TEST_OVERFLOWS_TYPE(u16, u32, U16_MAX, false);
+	TEST_OVERFLOWS_TYPE(u16, s32, U16_MAX, false);
+	TEST_OVERFLOWS_TYPE(s16, u8, U8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s16, u8, (s16)U8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s16, u8, -1, true);
+	TEST_OVERFLOWS_TYPE(s16, u8, S16_MIN, true);
+	TEST_OVERFLOWS_TYPE(s16, u16, S16_MAX, false);
+	TEST_OVERFLOWS_TYPE(s16, u16, -1, true);
+	TEST_OVERFLOWS_TYPE(s16, u16, S16_MIN, true);
+	TEST_OVERFLOWS_TYPE(s16, u32, S16_MAX, false);
+	TEST_OVERFLOWS_TYPE(s16, u32, -1, true);
+	TEST_OVERFLOWS_TYPE(s16, u32, S16_MIN, true);
+#if BITS_PER_LONG == 64
+	TEST_OVERFLOWS_TYPE(s16, u64, S16_MAX, false);
+	TEST_OVERFLOWS_TYPE(s16, u64, -1, true);
+	TEST_OVERFLOWS_TYPE(s16, u64, S16_MIN, true);
+#endif
+	TEST_OVERFLOWS_TYPE(s16, s8, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s16, s8, S8_MIN, false);
+	TEST_OVERFLOWS_TYPE(s16, s8, (s16)S8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s16, s8, (s16)S8_MIN - 1, true);
+	TEST_OVERFLOWS_TYPE(s16, s8, S16_MAX, true);
+	TEST_OVERFLOWS_TYPE(s16, s8, S16_MIN, true);
+	TEST_OVERFLOWS_TYPE(s16, s16, S16_MAX, false);
+	TEST_OVERFLOWS_TYPE(s16, s16, S16_MIN, false);
+	TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
+	TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
+	TEST_OVERFLOWS_TYPE(u32, u8, U8_MAX, false);
+	TEST_OVERFLOWS_TYPE(u32, u8, (u32)U8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u32, u8, U32_MAX, true);
+	TEST_OVERFLOWS_TYPE(u32, s8, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(u32, s8, (u32)S8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u32, s8, U32_MAX, true);
+	TEST_OVERFLOWS_TYPE(u32, u16, U16_MAX, false);
+	TEST_OVERFLOWS_TYPE(u32, u16, U16_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u32, u16, U32_MAX, true);
+	TEST_OVERFLOWS_TYPE(u32, s16, S16_MAX, false);
+	TEST_OVERFLOWS_TYPE(u32, s16, (u32)S16_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u32, s16, U32_MAX, true);
+	TEST_OVERFLOWS_TYPE(u32, u32, U32_MAX, false);
+	TEST_OVERFLOWS_TYPE(u32, s32, S32_MAX, false);
+	TEST_OVERFLOWS_TYPE(u32, s32, U32_MAX, true);
+	TEST_OVERFLOWS_TYPE(u32, s32, (u32)S32_MAX + 1, true);
+#if BITS_PER_LONG == 64
+	TEST_OVERFLOWS_TYPE(u32, u64, U32_MAX, false);
+	TEST_OVERFLOWS_TYPE(u32, s64, U32_MAX, false);
+#endif
+	TEST_OVERFLOWS_TYPE(s32, u8, U8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s32, u8, (s32)U8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s32, u16, S32_MAX, true);
+	TEST_OVERFLOWS_TYPE(s32, u8, -1, true);
+	TEST_OVERFLOWS_TYPE(s32, u8, S32_MIN, true);
+	TEST_OVERFLOWS_TYPE(s32, u16, U16_MAX, false);
+	TEST_OVERFLOWS_TYPE(s32, u16, (s32)U16_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s32, u16, S32_MAX, true);
+	TEST_OVERFLOWS_TYPE(s32, u16, -1, true);
+	TEST_OVERFLOWS_TYPE(s32, u16, S32_MIN, true);
+	TEST_OVERFLOWS_TYPE(s32, u32, S32_MAX, false);
+	TEST_OVERFLOWS_TYPE(s32, u32, -1, true);
+	TEST_OVERFLOWS_TYPE(s32, u32, S32_MIN, true);
+#if BITS_PER_LONG == 64
+	TEST_OVERFLOWS_TYPE(s32, u64, S32_MAX, false);
+	TEST_OVERFLOWS_TYPE(s32, u64, -1, true);
+	TEST_OVERFLOWS_TYPE(s32, u64, S32_MIN, true);
+#endif
+	TEST_OVERFLOWS_TYPE(s32, s8, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s32, s8, S8_MIN, false);
+	TEST_OVERFLOWS_TYPE(s32, s8, (s32)S8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s32, s8, (s32)S8_MIN - 1, true);
+	TEST_OVERFLOWS_TYPE(s32, s8, S32_MAX, true);
+	TEST_OVERFLOWS_TYPE(s32, s8, S32_MIN, true);
+	TEST_OVERFLOWS_TYPE(s32, s16, S16_MAX, false);
+	TEST_OVERFLOWS_TYPE(s32, s16, S16_MIN, false);
+	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MIN - 1, true);
+	TEST_OVERFLOWS_TYPE(s32, s16, S32_MAX, true);
+	TEST_OVERFLOWS_TYPE(s32, s16, S32_MIN, true);
+	TEST_OVERFLOWS_TYPE(s32, s32, S32_MAX, false);
+	TEST_OVERFLOWS_TYPE(s32, s32, S32_MIN, false);
+#if BITS_PER_LONG == 64
+	TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
+	TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
+	TEST_OVERFLOWS_TYPE(u64, u8, U64_MAX, true);
+	TEST_OVERFLOWS_TYPE(u64, u8, U8_MAX, false);
+	TEST_OVERFLOWS_TYPE(u64, u8, (u64)U8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u64, u16, U64_MAX, true);
+	TEST_OVERFLOWS_TYPE(u64, u16, U16_MAX, false);
+	TEST_OVERFLOWS_TYPE(u64, u16, (u64)U16_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u64, u32, U64_MAX, true);
+	TEST_OVERFLOWS_TYPE(u64, u32, U32_MAX, false);
+	TEST_OVERFLOWS_TYPE(u64, u32, (u64)U32_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u64, u64, U64_MAX, false);
+	TEST_OVERFLOWS_TYPE(u64, s8, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(u64, s8, (u64)S8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u64, s8, U64_MAX, true);
+	TEST_OVERFLOWS_TYPE(u64, s16, S16_MAX, false);
+	TEST_OVERFLOWS_TYPE(u64, s16, (u64)S16_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u64, s16, U64_MAX, true);
+	TEST_OVERFLOWS_TYPE(u64, s32, S32_MAX, false);
+	TEST_OVERFLOWS_TYPE(u64, s32, (u64)S32_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u64, s32, U64_MAX, true);
+	TEST_OVERFLOWS_TYPE(u64, s64, S64_MAX, false);
+	TEST_OVERFLOWS_TYPE(u64, s64, U64_MAX, true);
+	TEST_OVERFLOWS_TYPE(u64, s64, (u64)S64_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s64, u8, S64_MAX, true);
+	TEST_OVERFLOWS_TYPE(s64, u8, S64_MIN, true);
+	TEST_OVERFLOWS_TYPE(s64, u8, -1, true);
+	TEST_OVERFLOWS_TYPE(s64, u8, U8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s64, u8, (s64)U8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s64, u16, S64_MAX, true);
+	TEST_OVERFLOWS_TYPE(s64, u16, S64_MIN, true);
+	TEST_OVERFLOWS_TYPE(s64, u16, -1, true);
+	TEST_OVERFLOWS_TYPE(s64, u16, U16_MAX, false);
+	TEST_OVERFLOWS_TYPE(s64, u16, (s64)U16_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s64, u32, S64_MAX, true);
+	TEST_OVERFLOWS_TYPE(s64, u32, S64_MIN, true);
+	TEST_OVERFLOWS_TYPE(s64, u32, -1, true);
+	TEST_OVERFLOWS_TYPE(s64, u32, U32_MAX, false);
+	TEST_OVERFLOWS_TYPE(s64, u32, (s64)U32_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s64, u64, S64_MAX, false);
+	TEST_OVERFLOWS_TYPE(s64, u64, S64_MIN, true);
+	TEST_OVERFLOWS_TYPE(s64, u64, -1, true);
+	TEST_OVERFLOWS_TYPE(s64, s8, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s64, s8, S8_MIN, false);
+	TEST_OVERFLOWS_TYPE(s64, s8, (s64)S8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s64, s8, (s64)S8_MIN - 1, true);
+	TEST_OVERFLOWS_TYPE(s64, s8, S64_MAX, true);
+	TEST_OVERFLOWS_TYPE(s64, s16, S16_MAX, false);
+	TEST_OVERFLOWS_TYPE(s64, s16, S16_MIN, false);
+	TEST_OVERFLOWS_TYPE(s64, s16, (s64)S16_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s64, s16, (s64)S16_MIN - 1, true);
+	TEST_OVERFLOWS_TYPE(s64, s16, S64_MAX, true);
+	TEST_OVERFLOWS_TYPE(s64, s32, S32_MAX, false);
+	TEST_OVERFLOWS_TYPE(s64, s32, S32_MIN, false);
+	TEST_OVERFLOWS_TYPE(s64, s32, (s64)S32_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s64, s32, (s64)S32_MIN - 1, true);
+	TEST_OVERFLOWS_TYPE(s64, s32, S64_MAX, true);
+	TEST_OVERFLOWS_TYPE(s64, s64, S64_MAX, false);
+	TEST_OVERFLOWS_TYPE(s64, s64, S64_MIN, false);
+#endif
+
+	/* Check for macro side-effects. */
+	var = INT_MAX - 1;
+	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, false);
+	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, false);
+	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, true);
+	var = INT_MAX - 1;
+	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, false);
+	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, false);
+	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, true);
+
+	kunit_info(test, "%d overflows_type() tests finished\n", count);
+#undef TEST_OVERFLOWS_TYPE
+#undef __TEST_OVERFLOWS_TYPE
+}
+
+static void same_type_test(struct kunit *test)
+{
+	int count = 0;
+	int var;
+
+#define TEST_SAME_TYPE(t1, t2, same)			do {	\
+	typeof(t1) __t1h = type_max(t1);			\
+	typeof(t1) __t1l = type_min(t1);			\
+	typeof(t2) __t2h = type_max(t2);			\
+	typeof(t2) __t2l = type_min(t2);			\
+	KUNIT_EXPECT_EQ(test, true, __same_type(t1, __t1h));	\
+	KUNIT_EXPECT_EQ(test, true, __same_type(t1, __t1l));	\
+	KUNIT_EXPECT_EQ(test, true, __same_type(__t1h, t1));	\
+	KUNIT_EXPECT_EQ(test, true, __same_type(__t1l, t1));	\
+	KUNIT_EXPECT_EQ(test, true, __same_type(t2, __t2h));	\
+	KUNIT_EXPECT_EQ(test, true, __same_type(t2, __t2l));	\
+	KUNIT_EXPECT_EQ(test, true, __same_type(__t2h, t2));	\
+	KUNIT_EXPECT_EQ(test, true, __same_type(__t2l, t2));	\
+	KUNIT_EXPECT_EQ(test, same, __same_type(t1, t2));	\
+	KUNIT_EXPECT_EQ(test, same, __same_type(t2, __t1h));	\
+	KUNIT_EXPECT_EQ(test, same, __same_type(t2, __t1l));	\
+	KUNIT_EXPECT_EQ(test, same, __same_type(__t1h, t2));	\
+	KUNIT_EXPECT_EQ(test, same, __same_type(__t1l, t2));	\
+	KUNIT_EXPECT_EQ(test, same, __same_type(t1, __t2h));	\
+	KUNIT_EXPECT_EQ(test, same, __same_type(t1, __t2l));	\
+	KUNIT_EXPECT_EQ(test, same, __same_type(__t2h, t1));	\
+	KUNIT_EXPECT_EQ(test, same, __same_type(__t2l, t1));	\
+} while (0)
+
+#if BITS_PER_LONG == 64
+# define TEST_SAME_TYPE64(base, t, m)	TEST_SAME_TYPE(base, t, m)
+#else
+# define TEST_SAME_TYPE64(base, t, m)	do { } while (0)
+#endif
+
+#define TEST_TYPE_SETS(base, mu8, mu16, mu32, ms8, ms16, ms32, mu64, ms64) \
+do {									\
+	TEST_SAME_TYPE(base,  u8,  mu8);				\
+	TEST_SAME_TYPE(base, u16, mu16);				\
+	TEST_SAME_TYPE(base, u32, mu32);				\
+	TEST_SAME_TYPE(base,  s8,  ms8);				\
+	TEST_SAME_TYPE(base, s16, ms16);				\
+	TEST_SAME_TYPE(base, s32, ms32);				\
+	TEST_SAME_TYPE64(base, u64, mu64);				\
+	TEST_SAME_TYPE64(base, s64, ms64);				\
+} while (0)
+
+	TEST_TYPE_SETS(u8,   true, false, false, false, false, false, false, false);
+	TEST_TYPE_SETS(u16, false,  true, false, false, false, false, false, false);
+	TEST_TYPE_SETS(u32, false, false,  true, false, false, false, false, false);
+	TEST_TYPE_SETS(s8,  false, false, false,  true, false, false, false, false);
+	TEST_TYPE_SETS(s16, false, false, false, false,  true, false, false, false);
+	TEST_TYPE_SETS(s32, false, false, false, false, false,  true, false, false);
+#if BITS_PER_LONG == 64
+	TEST_TYPE_SETS(u64, false, false, false, false, false, false,  true, false);
+	TEST_TYPE_SETS(s64, false, false, false, false, false, false, false,  true);
+#endif
+
+	/* Check for macro side-effects. */
+	var = 4;
+	KUNIT_EXPECT_EQ(test, var, 4);
+	KUNIT_EXPECT_TRUE(test, __same_type(var++, int));
+	KUNIT_EXPECT_EQ(test, var, 4);
+	KUNIT_EXPECT_TRUE(test, __same_type(int, var++));
+	KUNIT_EXPECT_EQ(test, var, 4);
+	KUNIT_EXPECT_TRUE(test, __same_type(var++, var++));
+	KUNIT_EXPECT_EQ(test, var, 4);
+
+	kunit_info(test, "%d __same_type() tests finished\n", count);
+
+#undef TEST_TYPE_SETS
+#undef TEST_SAME_TYPE64
+#undef TEST_SAME_TYPE
+}
+
+static void castable_to_type_test(struct kunit *test)
+{
+#if BITS_PER_LONG == 64
+	u64 big;
+	s64 small;
+#else
+	u32 big;
+	s32 small;
+#endif
+	int count = 0;
+
+#define TEST_CASTABLE_TO_TYPE(arg1, arg2, pass)	do {	\
+	bool __pass = __castable_to_type(arg1, arg2);		\
+	KUNIT_EXPECT_EQ_MSG(test, __pass, pass,			\
+		"expected __castable_to_type(" #arg1 ", " #arg2 ") to%s pass\n",\
+		pass ? "" : " not");				\
+	count++;						\
+} while (0)
+
+	TEST_CASTABLE_TO_TYPE(16, u8, true);
+	TEST_CASTABLE_TO_TYPE(16, u16, true);
+	TEST_CASTABLE_TO_TYPE(16, u32, true);
+	TEST_CASTABLE_TO_TYPE(16, s8, true);
+	TEST_CASTABLE_TO_TYPE(16, s16, true);
+	TEST_CASTABLE_TO_TYPE(16, s32, true);
+	TEST_CASTABLE_TO_TYPE(-16, s8, true);
+	TEST_CASTABLE_TO_TYPE(-16, s16, true);
+	TEST_CASTABLE_TO_TYPE(-16, s32, true);
+#if BITS_PER_LONG == 64
+	TEST_CASTABLE_TO_TYPE(16, u64, true);
+	TEST_CASTABLE_TO_TYPE(-16, s64, true);
+#endif
+
+#define TEST_CASTABLE_TO_TYPE_VAR(width)	do {				\
+	u ## width u ## width ## var = 0;					\
+	s ## width s ## width ## var = 0;					\
+										\
+	/* Constant expressions that fit types. */				\
+	TEST_CASTABLE_TO_TYPE(type_max(u ## width), u ## width, true);		\
+	TEST_CASTABLE_TO_TYPE(type_min(u ## width), u ## width, true);		\
+	TEST_CASTABLE_TO_TYPE(type_max(u ## width), u ## width ## var, true);	\
+	TEST_CASTABLE_TO_TYPE(type_min(u ## width), u ## width ## var, true);	\
+	TEST_CASTABLE_TO_TYPE(type_max(s ## width), s ## width, true);		\
+	TEST_CASTABLE_TO_TYPE(type_min(s ## width), s ## width, true);		\
+	TEST_CASTABLE_TO_TYPE(type_max(s ## width), s ## width ## var, true);	\
+	TEST_CASTABLE_TO_TYPE(type_min(u ## width), s ## width ## var, true);	\
+	/* Constant expressions that do not fit types. */			\
+	TEST_CASTABLE_TO_TYPE(type_max(u ## width), s ## width, false);		\
+	TEST_CASTABLE_TO_TYPE(type_max(u ## width), s ## width ## var, false);	\
+	TEST_CASTABLE_TO_TYPE(type_min(s ## width), u ## width, false);		\
+	TEST_CASTABLE_TO_TYPE(type_min(s ## width), u ## width ## var, false);	\
+	/* Non-constant expression with mismatched type. */			\
+	TEST_CASTABLE_TO_TYPE(s ## width ## var, u ## width, false);		\
+	TEST_CASTABLE_TO_TYPE(u ## width ## var, s ## width, false);		\
+} while (0)
+
+#define TEST_CASTABLE_TO_TYPE_RANGE(width)	do {				\
+	unsigned long big = U ## width ## _MAX;					\
+	signed long small = S ## width ## _MIN;					\
+	u ## width u ## width ## var = 0;					\
+	s ## width s ## width ## var = 0;					\
+										\
+	/* Constant expression in range. */					\
+	TEST_CASTABLE_TO_TYPE(U ## width ## _MAX, u ## width, true);		\
+	TEST_CASTABLE_TO_TYPE(U ## width ## _MAX, u ## width ## var, true);	\
+	TEST_CASTABLE_TO_TYPE(S ## width ## _MIN, s ## width, true);		\
+	TEST_CASTABLE_TO_TYPE(S ## width ## _MIN, s ## width ## var, true);	\
+	/* Constant expression out of range. */					\
+	TEST_CASTABLE_TO_TYPE((unsigned long)U ## width ## _MAX + 1, u ## width, false); \
+	TEST_CASTABLE_TO_TYPE((unsigned long)U ## width ## _MAX + 1, u ## width ## var, false); \
+	TEST_CASTABLE_TO_TYPE((signed long)S ## width ## _MIN - 1, s ## width, false); \
+	TEST_CASTABLE_TO_TYPE((signed long)S ## width ## _MIN - 1, s ## width ## var, false); \
+	/* Non-constant expression with mismatched type. */			\
+	TEST_CASTABLE_TO_TYPE(big, u ## width, false);				\
+	TEST_CASTABLE_TO_TYPE(big, u ## width ## var, false);			\
+	TEST_CASTABLE_TO_TYPE(small, s ## width, false);			\
+	TEST_CASTABLE_TO_TYPE(small, s ## width ## var, false);			\
+} while (0)
+
+	TEST_CASTABLE_TO_TYPE_VAR(8);
+	TEST_CASTABLE_TO_TYPE_VAR(16);
+	TEST_CASTABLE_TO_TYPE_VAR(32);
+#if BITS_PER_LONG == 64
+	TEST_CASTABLE_TO_TYPE_VAR(64);
+#endif
+
+	TEST_CASTABLE_TO_TYPE_RANGE(8);
+	TEST_CASTABLE_TO_TYPE_RANGE(16);
+#if BITS_PER_LONG == 64
+	TEST_CASTABLE_TO_TYPE_RANGE(32);
+#endif
+	kunit_info(test, "%d __castable_to_type() tests finished\n", count);
+
+#undef TEST_CASTABLE_TO_TYPE_RANGE
+#undef TEST_CASTABLE_TO_TYPE_VAR
+#undef TEST_CASTABLE_TO_TYPE
+}
+
 static struct kunit_case overflow_test_cases[] = {
 	KUNIT_CASE(u8_u8__u8_overflow_test),
 	KUNIT_CASE(s8_s8__s8_overflow_test),
@@ -706,6 +1094,9 @@ static struct kunit_case overflow_test_cases[] = {
 	KUNIT_CASE(overflow_shift_test),
 	KUNIT_CASE(overflow_allocation_test),
 	KUNIT_CASE(overflow_size_helpers_test),
+	KUNIT_CASE(overflows_type_test),
+	KUNIT_CASE(same_type_test),
+	KUNIT_CASE(castable_to_type_test),
 	{}
 };
 
-- 
2.37.1

