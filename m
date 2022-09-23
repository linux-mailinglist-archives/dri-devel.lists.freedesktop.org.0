Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6445E75C0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 10:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EFF10E787;
	Fri, 23 Sep 2022 08:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2DF10E50C;
 Fri, 23 Sep 2022 08:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663921628; x=1695457628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3OMmPJzbpg1ed43aaEppDeyTkksfH/91vVUpM5aF62o=;
 b=LeT+spCsmozNceczZTd/YQ2a1Gl6z5BnN0cBhnNcjpm9gI81hvttdUru
 Gj2ShtZ7F5wOeKyimWmbbHQLlPQ897etoTQQ9Mkx5lUtWGHb0LH5QcWte
 p11XKqnTcbuw+BIQSc75AxW42TyuhfDSqT4TObne2o1KsndwZ+5GQzYv1
 +3Jy4JgsSMHApjUvBGvzJWP4m7LaRP3eHl1Nm6e4wSlKAOI3FbQP98LLN
 uw1rBYiAH8EDX3y9xEIHgY5/x0aR9VcKbdTYxoE5951I5lYqFbr4T48UC
 T4Od2fUh+XyLZdSmkyiDVz3TSZNBO193j5XKBWHqwL5UOYmD6/cZ1zAZz g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="301989016"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="301989016"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 01:27:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="622444172"
Received: from ngoncia-mobl2.ger.corp.intel.com (HELO
 paris.ger.corp.intel.com) ([10.249.143.58])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 01:27:01 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v11 3/9] compiler_types.h: Add assert_same_type to catch type
 mis-match while compiling
Date: Fri, 23 Sep 2022 11:26:22 +0300
Message-Id: <20220923082628.3061408-4-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220923082628.3061408-1-gwan-gyeong.mun@intel.com>
References: <20220923082628.3061408-1-gwan-gyeong.mun@intel.com>
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
 ndesaulniers@google.com, dlatypov@google.com, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, andrzej.hajda@intel.com, matthew.auld@intel.com,
 airlied@redhat.com, mchehab@kernel.org, vitor@massaru.org,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds assert_same_type and assert_same_typable macros to catch type
mis-match while compiling. The existing typecheck() macro outputs build
warnings, but the newly added assert_same_type() macro uses the
static_assert macro (which uses _Static_assert keyword and it introduced
in C11) to generate a build break when the types are different and can be
used to detect explicit build errors. Unlike the assert_same_type() macro,
assert_same_typable() macro allows a constant value as the second argument.
Since static_assert is used at compile time and it requires
constant-expression as an argument [1][2], overflows_type_ret_const_expr()
is newly added. There is overflows_type() that has the same behavior, but
the macro uses __builtin_add_overflow() internally, and
__builtin_add_overflows returns a bool type [3], so it is difficult to use
as an argument of _Static_assert. The assert_same_type and
assert_same_typable macros have been added to compiler_types.h, but the
overflows_type_ret_const_expr macro has been added to overflow.h
So, overflow.h has to be included to use assert_same_typable which
internally uses overflows_type_ret_const_expr.
And it adds unit tests for overflows_type, overflows_type_ret_const_expr,
assert_same_type and assert_same_typable. The overflows_type has been added
as well to compare whether the overflows_type_ret_const_expr unit test has
the same as the result.

[1] https://en.cppreference.com/w/c/language/_Static_assert
[2] C11 standard (ISO/IEC 9899:2011): 6.7.10 Static assertions
[3] https://gcc.gnu.org/onlinedocs/gcc/Integer-Overflow-Builtins.html
    6.56 Built-in Functions to Perform Arithmetic with Overflow Checking
    Built-in Function: bool __builtin_add_overflow (type1 a, type2 b,
                                                    type3 *res)

v11: Update macro description (Andi)
     Change _Static_assert to static_assert (Rasmus)
     Rename assert_type to assert_same_type and  assert_typable to
     assert_same_typable (Rasmus)
     Update assert_same_typable macro to handle an overflow check on the
     target type when a constant value is used. (Kees)
     Add overflows_type_ret_const_expr which returns constant-expression
     value (G.G)
     Add is_unsigned_type (G.G)
     Add unit tests for overflows_type, overflows_type_ret_const_expr,
     assert_same_type and assert_same_typable. (Kees)

Suggested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 include/linux/compiler.h       |   1 +
 include/linux/compiler_types.h |  43 +++++
 include/linux/overflow.h       |  27 ++++
 lib/overflow_kunit.c           | 283 +++++++++++++++++++++++++++++++++
 4 files changed, 354 insertions(+)

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
diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 4f2a819fd60a..e6f5d68e5eba 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -294,6 +294,49 @@ struct ftrace_likely_data {
 /* Are two types/vars the same type (ignoring qualifiers)? */
 #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
 
+/**
+ * assert_same_type - abort compilation if the first argument's data type and
+ *                    the second argument's data type are not the same
+ * @t1: data type or variable
+ * @t2: data type or variable
+ *
+ * The first and second arguments can be data types or variables or mixed (the
+ * first argument is the data type and the second argument is variable or vice
+ * versa). It determines whether the first argument's data type and the second
+ * argument's data type are the same while compiling, and it aborts compilation
+ * if the two types are not the same.
+ * See also assert_same_typable().
+ */
+#define assert_same_type(t1, t2) static_assert(__same_type(t1, t2))
+
+/**
+ * assert_same_typable - abort compilation if the first argument's data type and
+ *                       the second argument's data type are not the same
+ * @t: data type or variable
+ * @n: data type or variable or constant value
+ *
+ * The first and second arguments can be data types or variables or mixed (the
+ * first argument is the data type and the second argument is variable or vice
+ * versa). Unlike the assert_same_type() macro, this macro allows a constant
+ * value as the second argument. And if the second argument is a constant
+ * value, it checks overflows between the first argument's data type and the
+ * second argument's constant value to check whether overflow can occur when
+ * assigning the second argument to the variable of the first argument. And it
+ * aborts compilation if the overflow can occur. Since static assert used at
+ * compile time requires constant-expression as an argument,
+ * overflows_type_ret_const_expr() is used internally instead of
+ * overflows_type(). When a constant value is not used as a second argument, it
+ * determines whether the first argument's data type and the second argument's
+ * data type are the same while compiling, and it aborts compilation if the two
+ * types are not the same.
+ * See also assert_same_type(), overflows_type_ret_const_expr() and
+ * overflows_type().
+ */
+#define assert_same_typable(t, n) static_assert(			       \
+		__builtin_choose_expr(__builtin_constant_p(n),		       \
+				      overflows_type_ret_const_expr(n,t) == 0, \
+				      __same_type(t, n)))
+
 /*
  * __unqual_scalar_typeof(x) - Declare an unqualified scalar type, leaving
  *			       non-scalar types unchanged.
diff --git a/include/linux/overflow.h b/include/linux/overflow.h
index 0eca3d8281b2..6e481ad2e46e 100644
--- a/include/linux/overflow.h
+++ b/include/linux/overflow.h
@@ -191,6 +191,33 @@ static inline bool __must_check __must_check_overflow(bool overflow)
 	check_add_overflow((x), v, &v);			\
 }))
 
+/**
+ * overflows_type_ret_const_expr - helper for checking the overflows between
+ *                                 value, variables, or data type
+ *
+ * @x: source constant value or variable for overflow check
+ * @T: destination variable or data type for overflow check
+ *
+ * It compares the value, variables, or data type between the first and second
+ * argument to check whether overflow can occur when assigning the first
+ * argument to the variable of the second argument data type. Source and
+ * Destination can be different data types. Unlike overflows_type(), it returns
+ * a constant-expression value. It is recommended to use this macro only when a
+ * constant-expression value is absolutely necessary at compile time. In other
+ * cases, it is recommended to use overflows_type().
+ *
+ * See also overflows_type() and assert_same_typable().
+ *
+ * Returns:
+ * 1 if overflow can occur, 0 otherwise.
+ */
+#define overflows_type_ret_const_expr(x,T) (			\
+	is_unsigned_type(typeof(x)) ? 				\
+		x > type_max(typeof(T)) ? 1 : 0			\
+	: is_unsigned_type(typeof(T)) ? 			\
+		x < 0 || x > type_max(typeof(T)) ? 1 : 0	\
+		: x < type_min(typeof(T)) || x > type_max(typeof(T)) ? 1 : 0 )
+
 /**
  * size_mul() - Calculate size_t multiplication with saturation at SIZE_MAX
  *
diff --git a/lib/overflow_kunit.c b/lib/overflow_kunit.c
index 0d98c9bc75da..a9c99a116e3c 100644
--- a/lib/overflow_kunit.c
+++ b/lib/overflow_kunit.c
@@ -687,6 +687,287 @@ static void overflow_size_helpers_test(struct kunit *test)
 #undef check_one_size_helper
 }
 
+static void overflows_type_test(struct kunit *test)
+{
+/* Args are: first type, secound type, value, overflow expected */
+#define TEST_OVERFLOWS_TYPE(t1, t2, v, of) do {				\
+	t1 __t1 = v;							\
+	t2 __t2;							\
+	bool __of;							\
+	__of = overflows_type(v, t2);					\
+	if (__of != of) {						\
+		KUNIT_EXPECT_EQ_MSG(test, __of, of,			\
+			"expected overflows_type(%s, %s) to%s overflow\n", \
+			#v, #t2, of ? "" : " not");			\
+	}								\
+	__of = overflows_type(v, __t2);					\
+	if (__of != of) {						\
+		KUNIT_EXPECT_EQ_MSG(test, __of, of,			\
+			"expected overflows_type(%s, %s) to%s overflow\n", \
+			#v, #t2" __t2", of ? "" : " not");		\
+	}								\
+	__of = overflows_type(__t1, t2);				\
+	if (__of != of) {						\
+		KUNIT_EXPECT_EQ_MSG(test, __of, of,			\
+			"expected overflows_type(%s, %s) to%s overflow\n", \
+			#t1" __t1 = "#v, #t2, of ? "" : " not");		\
+	}								\
+	__of = overflows_type(__t1, __t2);				\
+	if (__of != of) {						\
+		KUNIT_EXPECT_EQ_MSG(test, __of, of,			\
+			"expected overflows_type(%s, %s) to%s overflow\n", \
+			#t1" __t1 = "#v, #t2" __t2", of ? "" : " not");	\
+	}								\
+	__of = overflows_type_ret_const_expr(v, t2) ? true : false;	\
+	if (__of != of) {						\
+		KUNIT_EXPECT_EQ_MSG(test, __of, of,			\
+			"expected overflows_type_ret_const_expr(%s, %s) to%s overflow\n", \
+			#v, #t2, of ? "" : " not");			\
+	}								\
+	__of = overflows_type_ret_const_expr(v, __t2) ? true : false;	\
+	if (__of != of) {						\
+		KUNIT_EXPECT_EQ_MSG(test, __of, of,			\
+			"expected overflows_type_ret_const_expr(%s, %s) to%s overflow\n", \
+			#v, #t2" __t2", of ? "" : " not");		\
+	}								\
+	__of = overflows_type_ret_const_expr(__t1, t2) ? true : false;	\
+	if (__of != of) {						\
+		KUNIT_EXPECT_EQ_MSG(test, __of, of,			\
+			"expected overflows_type_ret_const_expr(%s, %s) to%s overflow\n", \
+			#t1" __t1 = "#v, #t2, of ? "" : " not");		\
+	}								\
+	__of = overflows_type_ret_const_expr(__t1, __t2) ? true : false;\
+	if (__of != of) {						\
+		KUNIT_EXPECT_EQ_MSG(test, __of, of,			\
+			"expected overflows_type_ret_const_expr(%s, %s) to%s overflow\n", \
+			#t1" __t1 = "#v, #t2" __t2", of ? "" : " not");	\
+	}								\
+} while(0)
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
+#undef TEST_OVERFLOWS_TYPE
+}
+
+static void assert_same_type_test(struct kunit *test)
+{
+/* Arg is: type */
+#define TEST_ASSERT_SAME_TYPE(t) do {	\
+   typeof(t) __t1 = type_max(t);	\
+   typeof(t) __t2 = type_min(t);	\
+   assert_same_type(t, t);		\
+   assert_same_type(t, __t1);		\
+   assert_same_type(__t1, t);		\
+   assert_same_type(__t1, __t2);	\
+} while (0)
+
+/* Arg is: type */
+#define TEST_ASSERT_SAME_TYPABLE(t) do {	\
+   typeof(t) __t1 = type_max(t);		\
+   typeof(t) __t2 = type_min(t);		\
+   assert_same_typable(t, __t1);		\
+   assert_same_typable(t, type_max(t));		\
+   assert_same_typable(t, type_min(t));		\
+   assert_same_typable(__t1, type_max(t));	\
+   assert_same_typable(__t1, type_min(t));	\
+   assert_same_typable(__t1, __t2);		\
+} while (0)
+
+	TEST_ASSERT_SAME_TYPE(u8);
+	TEST_ASSERT_SAME_TYPE(u16);
+	TEST_ASSERT_SAME_TYPE(u32);
+	TEST_ASSERT_SAME_TYPE(s8);
+	TEST_ASSERT_SAME_TYPE(s16);
+	TEST_ASSERT_SAME_TYPE(s32);
+	TEST_ASSERT_SAME_TYPABLE(u8);
+	TEST_ASSERT_SAME_TYPABLE(u16);
+	TEST_ASSERT_SAME_TYPABLE(u32);
+	TEST_ASSERT_SAME_TYPABLE(s8);
+	TEST_ASSERT_SAME_TYPABLE(s16);
+	TEST_ASSERT_SAME_TYPABLE(s32);
+
+#if BITS_PER_LONG == 64
+	TEST_ASSERT_SAME_TYPE(u64);
+	TEST_ASSERT_SAME_TYPE(s64);
+	TEST_ASSERT_SAME_TYPABLE(u64);
+	TEST_ASSERT_SAME_TYPABLE(s64);
+#endif
+
+#undef TEST_ASSERT_SAME_TYPABLE
+#undef TEST_ASSERT_SAME_TYPE
+}
+
 static struct kunit_case overflow_test_cases[] = {
 	KUNIT_CASE(u8_u8__u8_overflow_test),
 	KUNIT_CASE(s8_s8__s8_overflow_test),
@@ -706,6 +987,8 @@ static struct kunit_case overflow_test_cases[] = {
 	KUNIT_CASE(overflow_shift_test),
 	KUNIT_CASE(overflow_allocation_test),
 	KUNIT_CASE(overflow_size_helpers_test),
+	KUNIT_CASE(overflows_type_test),
+	KUNIT_CASE(assert_same_type_test),
 	{}
 };
 
-- 
2.37.1

