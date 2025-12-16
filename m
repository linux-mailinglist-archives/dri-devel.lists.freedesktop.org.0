Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A564CC5424
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 22:49:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFD610E99A;
	Tue, 16 Dec 2025 21:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlI8Hy8y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA4610E9A0;
 Tue, 16 Dec 2025 21:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765921761; x=1797457761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=laq1cGCAasO1tKveWVCQfFDMvVtKB7Y42zgcez1net4=;
 b=ZlI8Hy8yjfgUrWHZeKqAnwKcUUihEbTyexq1bJEOuQNz/OL8YL4rHSpm
 wwFdOIzFknWudiI3W+IBaqw7qM6qAjW4SfLrTjXcvYbS1ISODwlg6TkNF
 sP29dQnTf9KkM+x/2VsXUqmwxcTXwiIROgG1jYUxBbCcKMcBb0p4Zd7BC
 ufdxhfvWt2XtkXjmbH0CP4wsmyYMWpcKtxawXZPDLpVUNfPODcPqs7LVO
 gIk28FOOVG8XZIfAAZzqHXuuGITWW3p9YAIlYQ2Ba89qk06HGxYHzuWtE
 uI26vcBNUaE+RzMyaLgr0SlY2ZSLQy8ofbA7E3tk+zb2x6omkNn/TRw5l w==;
X-CSE-ConnectionGUID: RWEvTMSET9mNVcwbV3PFTg==
X-CSE-MsgGUID: wRsrFnPUQjCl9ZR3UbVdgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67045816"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="67045816"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 13:49:21 -0800
X-CSE-ConnectionGUID: t1a5Iaj2QgWLBVfH+Xwuhg==
X-CSE-MsgGUID: dwbwhvwTQeqoOJwAkOKm1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="198615326"
Received: from mrbroom-desk1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 13:49:19 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 1/4] drm/xe: Introduce IF_ARGS macro utility
Date: Tue, 16 Dec 2025 22:48:56 +0100
Message-ID: <20251216214902.1429-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216214902.1429-1-michal.wajdeczko@intel.com>
References: <20251216214902.1429-1-michal.wajdeczko@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to extend our macro-based KLV list definitions with new
information about the version from which given KLV is supported.
Add utility IF_ARGS macro that can be used in code generators to
emit different code based on the presence of additional arguments.

Introduce macro itself and extend our kunit tests to cover it.
We will use this macro in next patch.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Acked-by: Matthew Brost <matthew.brost@intel.com>
---
v3: add alternate implementation for older GCC (Michal)
    as kernel test robot reported errors on GCC 8.5.0
    same errors seen also on 9.5.0 but not on 10.1.0
---
 drivers/gpu/drm/xe/tests/xe_args_test.c | 54 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_args.h            | 27 +++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_args_test.c b/drivers/gpu/drm/xe/tests/xe_args_test.c
index f3fb23aa5d2e..8bef24cf8c70 100644
--- a/drivers/gpu/drm/xe/tests/xe_args_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_args_test.c
@@ -78,6 +78,24 @@ static void pick_arg_example(struct kunit *test)
 #undef buz
 }
 
+static void if_args_example(struct kunit *test)
+{
+	enum { Z = 1, Q };
+
+#define foo	X, Y
+#define bar	IF_ARGS(Z, Q, foo)
+#define buz	IF_ARGS(Z, Q, DROP_FIRST_ARG(FIRST_ARG(foo)))
+
+	KUNIT_EXPECT_EQ(test, bar, Z);
+	KUNIT_EXPECT_EQ(test, buz, Q);
+	KUNIT_EXPECT_STREQ(test, __stringify(bar), "Z");
+	KUNIT_EXPECT_STREQ(test, __stringify(buz), "Q");
+
+#undef foo
+#undef bar
+#undef buz
+}
+
 static void sep_comma_example(struct kunit *test)
 {
 #define foo(f)	f(X) f(Y) f(Z) f(Q)
@@ -198,6 +216,40 @@ static void last_arg_test(struct kunit *test)
 	KUNIT_EXPECT_STREQ(test, __stringify(LAST_ARG(MAX_ARGS)), "-12");
 }
 
+static void if_args_test(struct kunit *test)
+{
+	bool with_args = true;
+	bool no_args = false;
+	enum { X = 100 };
+
+	KUNIT_EXPECT_TRUE(test, IF_ARGS(true, false, FOO_ARGS));
+	KUNIT_EXPECT_FALSE(test, IF_ARGS(true, false, NO_ARGS));
+
+	KUNIT_EXPECT_TRUE(test, CONCATENATE(IF_ARGS(with, no, FOO_ARGS), _args));
+	KUNIT_EXPECT_FALSE(test, CONCATENATE(IF_ARGS(with, no, NO_ARGS), _args));
+
+	KUNIT_EXPECT_STREQ(test, __stringify(IF_ARGS(yes, no, FOO_ARGS)), "yes");
+	KUNIT_EXPECT_STREQ(test, __stringify(IF_ARGS(no, no, NO_ARGS)), "no");
+
+	KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, FOO_ARGS), -1, FOO_ARGS), 4);
+	KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, FOO_ARGS), -1, NO_ARGS), -1);
+	KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, NO_ARGS), -1, FOO_ARGS), 0);
+	KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, NO_ARGS), -1, NO_ARGS), -1);
+
+	KUNIT_EXPECT_EQ(test,
+			CALL_ARGS(FIRST_ARG,
+				  CALL_ARGS(CONCATENATE, IF_ARGS(FOO, MAX, FOO_ARGS), _ARGS)), X);
+	KUNIT_EXPECT_EQ(test,
+			CALL_ARGS(FIRST_ARG,
+				  CALL_ARGS(CONCATENATE, IF_ARGS(FOO, MAX, NO_ARGS), _ARGS)), -1);
+	KUNIT_EXPECT_EQ(test,
+			CALL_ARGS(COUNT_ARGS,
+				  CALL_ARGS(CONCATENATE, IF_ARGS(FOO, MAX, FOO_ARGS), _ARGS)), 4);
+	KUNIT_EXPECT_EQ(test,
+			CALL_ARGS(COUNT_ARGS,
+				  CALL_ARGS(CONCATENATE, IF_ARGS(FOO, MAX, NO_ARGS), _ARGS)), 12);
+}
+
 static struct kunit_case args_tests[] = {
 	KUNIT_CASE(count_args_test),
 	KUNIT_CASE(call_args_example),
@@ -209,6 +261,8 @@ static struct kunit_case args_tests[] = {
 	KUNIT_CASE(last_arg_example),
 	KUNIT_CASE(last_arg_test),
 	KUNIT_CASE(pick_arg_example),
+	KUNIT_CASE(if_args_example),
+	KUNIT_CASE(if_args_test),
 	KUNIT_CASE(sep_comma_example),
 	{}
 };
diff --git a/drivers/gpu/drm/xe/xe_args.h b/drivers/gpu/drm/xe/xe_args.h
index 4dbc7e53c624..f550b5e3b993 100644
--- a/drivers/gpu/drm/xe/xe_args.h
+++ b/drivers/gpu/drm/xe/xe_args.h
@@ -121,6 +121,33 @@
 #define PICK_ARG11(args...)		PICK_ARG10(DROP_FIRST_ARG(args))
 #define PICK_ARG12(args...)		PICK_ARG11(DROP_FIRST_ARG(args))
 
+/**
+ * IF_ARGS() - Make selection based on optional argument list.
+ * @then: token to return if arguments are present
+ * @else: token to return if arguments are empty
+ * @...: arguments to check (optional)
+ *
+ * This macro allows to select a token based on the presence of the argument list.
+ *
+ * Example:
+ *
+ *	#define foo	X, Y
+ *	#define bar	IF_ARGS(Z, Q, foo)
+ *	#define buz	IF_ARGS(Z, Q, DROP_FIRST_ARG(FIRST_ARG(foo)))
+ *
+ *	With above definitions bar expands to Z while buz expands to Q.
+ */
+#if defined(CONFIG_CC_IS_CLANG) || GCC_VERSION >= 100100
+#define IF_ARGS(then, else, ...)	FIRST_ARG(__VA_OPT__(then,) else)
+#else
+#define IF_ARGS(then, else, ...)	_IF_ARGS(then, else, CALL_ARGS(FIRST_ARG, __VA_ARGS__))
+#define _IF_ARGS(then, else, ...)	__IF_ARGS(then, else, CALL_ARGS(COUNT_ARGS, __VA_ARGS__))
+#define __IF_ARGS(then, else, n)	___IF_ARGS(then, else, CALL_ARGS(CONCATENATE, ___IF_ARG, n))
+#define ___IF_ARGS(then, else, if)	CALL_ARGS(if, then, else)
+#define ___IF_ARG1(then, else)		then
+#define ___IF_ARG0(then, else)		else
+#endif
+
 /**
  * ARGS_SEP_COMMA - Definition of a comma character.
  *
-- 
2.47.1

