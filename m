Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 169D75B35CA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072C910EC68;
	Fri,  9 Sep 2022 10:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2738E10EC6A;
 Fri,  9 Sep 2022 10:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662721191; x=1694257191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sw25/VEVNzYbUpj2DtWImbIBzsU8rdEcHgaL9vecVhE=;
 b=imY5ckQ6J1W1c5oH3/RBA6JWA7LW6AiYVNsvEL9xWPtLNp/ktJo2M6BE
 oOhfvAp4wx9Y7O6kT4z1XXjO5OyUGVsyX5OwQZDMZwG48doUO6R2WFkHk
 UpBUuI9Nt8RN/CnfqS0FiFK1CP8QYDH9XwQwjiTy1gN+rMYlDBfXwC6pk
 TMG/aYpeOLUhlt8TBZKcteGGWoYDs/7S6+ayu2TSHbf053csJvBsBZjQY
 5M3jmi6ojiiBMxAGF+5wo9prq6izcyGsD00/JJE1pAKbW6SzGF9HqUuvG
 0QKcsIOBm3WiquEWjCIE4z9M9GeYnrlvS9EsYNgDr0D4oBC4SR4B5kk4L w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359174665"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="359174665"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 03:59:48 -0700
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="704370341"
Received: from clbarnes-mobl.amr.corp.intel.com (HELO
 paris.amr.corp.intel.com) ([10.254.42.92])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 03:59:44 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 3/9] compiler_types.h: Add assert_type to catch type
 mis-match while compiling
Date: Fri,  9 Sep 2022 19:59:07 +0900
Message-Id: <20220909105913.752049-4-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220909105913.752049-1-gwan-gyeong.mun@intel.com>
References: <20220909105913.752049-1-gwan-gyeong.mun@intel.com>
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

It adds assert_type and assert_typable macros to catch type mis-match while
compiling. The existing typecheck() macro outputs build warnings, but the
newly added assert_type() macro uses the _Static_assert() keyword (which is
introduced in C11) to generate a build break when the types are different
and can be used to detect explicit build errors.
Unlike the assert_type() macro, assert_typable() macro allows a constant
value as the second argument.

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
---
 include/linux/compiler_types.h | 39 ++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 4f2a819fd60a..19cc125918bb 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -294,6 +294,45 @@ struct ftrace_likely_data {
 /* Are two types/vars the same type (ignoring qualifiers)? */
 #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
 
+/**
+ * assert_type - break compile if the first argument's data type and the second
+ *               argument's data type are not the same
+ *
+ * @t1: data type or variable
+ * @t2: data type or variable
+ *
+ * The first and second arguments can be data types or variables or mixed (the
+ * first argument is the data type and the second argument is variable or vice
+ * versa). It determines whether the first argument's data type and the second
+ * argument's data type are the same while compiling, and it breaks compile if
+ * the two types are not the same.
+ * See also assert_typable().
+ */
+#define assert_type(t1, t2) _Static_assert(__same_type(t1, t2))
+
+/**
+ * assert_typable - break compile if the first argument's data type and the
+ *                  second argument's data type are not the same
+ *
+ * @t: data type or variable
+ * @n: data type or variable or constant value
+ *
+ * The first and second arguments can be data types or variables or mixed (the
+ * first argument is the data type and the second argument is variable or vice
+ * versa). Unlike the assert_type() macro, this macro allows a constant value
+ * as the second argument. And if the second argument is a constant value, it
+ * always passes. And it doesn't mean that the types are explicitly the same.
+ * When a constant value is used as the second argument, if you need an
+ * overflow check when assigning a constant value to a variable of the type of
+ * the first argument, you can use the overflows_type() macro. When a constant
+ * value is not used as a second argument, it determines whether the first
+ * argument's data type and the second argument's data type are the same while
+ * compiling, and it breaks compile if the two types are not the same.
+ * See also assert_type() and overflows_type().
+ */
+#define assert_typable(t, n) _Static_assert(__builtin_constant_p(n) ||	\
+					    __same_type(t, typeof(n)))
+
 /*
  * __unqual_scalar_typeof(x) - Declare an unqualified scalar type, leaving
  *			       non-scalar types unchanged.
-- 
2.37.1

