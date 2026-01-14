Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34588D1C06F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 03:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897AB10E5BD;
	Wed, 14 Jan 2026 02:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BwFqIdBH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F7910E5BB
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 02:00:16 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id
 46e09a7af769-7ce2b14202fso3530241a34.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 18:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768356015; x=1768960815; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ekbNT1OfK8aGhMhy2w3gZ5CU/UUE92pgkgzIatZ/Ils=;
 b=BwFqIdBHA1FRmriXLKZQbUMdmS7gV3Lf9+LtKCIRW/aT8nLU/MoThaE1WGdyja2lF/
 tPSOcVNchrw5cmsTNuNltbt/ft396FTCgWpDT7tbUlC9rKaADX4FkpgsF7gvQQDP7ROc
 xiRRbbq0et9Riyn+QcosyO38gkcObDWzvEw1+Z3Wwggtc4833LWEC8ElBh4qMKRm4b/q
 BV/HMGlXoRb0QrmT33hfJzYJOSjze8yLyk9hP/DwYueLZpa8G6a0jTsB7BBFg/mmnJXJ
 eT1BUa0KivMJw7/mxJvOUyLuX4uFE3kFdkzYju+sSdLeQDi+X30K7tScIUxPKA8MSboc
 OEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768356015; x=1768960815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ekbNT1OfK8aGhMhy2w3gZ5CU/UUE92pgkgzIatZ/Ils=;
 b=TQJDXEBA7eI1z5IfH3NdqiruxnOK9YvC9XjshZNpbLmCiObrVZVxiyx4TyworwoCtm
 oDRiSBRL1TFkAwC6dEjroKUX3da9j+7H8HaJrfG8B45P4yBCIQ+03/uxhnlZFAYl2PEG
 hfkML9VsqJIc0R3xWqHzs8gbU4bbNhqOGUrsxTD75k0OKUfXvsEhTIy2VMJwqna1XTh3
 XL3KWR+mr80p9NBW9f6v72+HhbpVg+WreN/JlJWfw2m5gCXn97VPuNCpyQ0cyNQhAlmR
 UCZBIoNyYMxr0ISNj8/QVqJaBP5mLIbVBOwK/Lk1zNjYt5Z6uNKj4FGWsChefBApBjPg
 uCsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6Z9LDYJLTpgJPn0Z5NeQN2l+023OWMr0J4e4f6I+C64Li1wHRi5mYVSSWLhtZI8SkY0JNERR2AvE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUCmKXp0qDqBH3y9W8mjl+mjWCQFDsmGI1zEHKeiyjmZfm/B1h
 DAYxR1PPCNxK2rVJlb1pvNLjjChzSZHa9i8M8xciClz5ZGvGwENohxEz
X-Gm-Gg: AY/fxX6rjxQ/VlEjiJuxXZIzbVdJdLud7eiUhhEv7wv4Om7VPp/sP8oo/iAQXBZbAGU
 9n1dpKm/ZuAZsQp73Iq/5UXGchfaqTswdj3012SxilJ3ZQt5McbR1iVJS6lsWG7tT/VYQTpTdEz
 iZnu7SrirwFDYBw0YcVpUFAGp3QIkQgcZMHjJ7eQdc+Uddoq8QUceQPrsPgGwSx7NZ4cpoB1rmU
 Fb4f2hctmu0bsAclPau7u2Bhm8lDypX4N7oBa1fLh24BBAcHDD+8r0eNFdUXAbxz5Jt7hiFV06y
 8vJtWY3QBEof3Ny+xxqDFbhRW7428s1he1cdP+9VIWCQiFSAFYrtYK6aPeo1CQw95VVi0bdepmI
 ALjBAYi30bH8rCqvI1FI02t6yoiHoio0tk2SIr7RxQecNRpvANcNoS1xJVpynmGjyKcQFRD4d2a
 CLSta53yCoZHXJ01oNKRikhFW68rrn3WRnWTDZ9149uyibACU=
X-Received: by 2002:a05:6830:4c82:b0:7ce:2b34:deca with SMTP id
 46e09a7af769-7cfcb66f5fdmr225302a34.28.1768356015134; 
 Tue, 13 Jan 2026 18:00:15 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 46e09a7af769-7ce478ee883sm17634530a34.28.2026.01.13.18.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 18:00:14 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 23/31] dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at
 compile-time
Date: Tue, 13 Jan 2026 18:57:39 -0700
Message-ID: <20260114015815.1565725-24-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
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

Add __DYNAMIC_DEBUG_CLASSMAP_CHECK to implement the following
arg-checks at compile-time:

	0 <= _base < 63
	class_names is not empty
	class_names[0] is a string
	(class_names.length + _base) < 63

These compile-time checks will prevent several simple misuses, and
will issue obvious errors if violated.

4 such examples are added to test_dynamic_debug_submod.ko, and will
fail compilation if -DDD_MACRO_ARGCHECK is added to cflags.  This
wouldn't be a useful CONFIG_ item, since it breaks the build.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  9 +++++++++
 lib/test_dynamic_debug.c      | 13 ++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index ad3dc10ff03a..d8bfd19efde6 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -180,6 +180,14 @@ struct _ddebug_class_param {
  * __pr_debug_cls(22, "no such class"); compiles but is not reachable
  */
 
+#define __DYNAMIC_DEBUG_CLASSMAP_CHECK(_clnames, _base)			\
+	static_assert(((_base) >= 0 && (_base) < _DPRINTK_CLASS_DFLT),	\
+		      "_base must be in 0..62");			\
+	static_assert(ARRAY_SIZE(_clnames) > 0,				\
+		      "classnames array size must be > 0");		\
+	static_assert((ARRAY_SIZE(_clnames) + (_base)) < _DPRINTK_CLASS_DFLT, \
+		      "_base + classnames.length exceeds range")
+
 /**
  * DYNAMIC_DEBUG_CLASSMAP_DEFINE - define debug classes used by a module.
  * @_var:   name of the classmap, exported for other modules coordinated use.
@@ -193,6 +201,7 @@ struct _ddebug_class_param {
  */
 #define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)		\
 	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	__DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));	\
 	extern struct _ddebug_class_map _var;				\
 	struct _ddebug_class_map __aligned(8) __used			\
 		__section("__dyndbg_class_maps") _var = {		\
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 1ba4be9a403a..b2bdfdfb6ba1 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -133,7 +133,7 @@ DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
  * Enable with -Dflag on compile to test overlapping class-id range
  * detection.  This should warn on modprobes.
  */
-DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
 #endif
 
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
@@ -146,8 +146,19 @@ DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
 DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
 DYNAMIC_DEBUG_CLASSMAP_USE(map_level_num);
 
+#if defined(DD_MACRO_ARGCHECK)
+/*
+ * Exersize compile-time arg-checks in DYNAMIC_DEBUG_CLASSMAP_DEFINE.
+ * These will break compilation.
+ */
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_neg, 0, -1, "NEGATIVE_BASE_ARG");
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_big, 0, 100, "TOOBIG_BASE_ARG");
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_str_type, 0, 0, 1 /* not a string */);
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_emptyclass, 0, 0 /* ,empty */);
 #endif
 
+#endif /* TEST_DYNAMIC_DEBUG_SUBMOD */
+
 /* stand-in for all pr_debug etc */
 #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
 
-- 
2.52.0

