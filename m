Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6EBA1C167
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8D310EA5B;
	Sat, 25 Jan 2025 06:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WHm0j+eA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318BE10E120;
 Sat, 25 Jan 2025 06:46:56 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3cfc154874eso19217525ab.3; 
 Fri, 24 Jan 2025 22:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787615; x=1738392415; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xde8rOoc7ub5IEPiyVqYWw11iutjj4hEBt+3xz2QfjM=;
 b=WHm0j+eAgoxalVTiWMnB9cvpt328bkL9HF1CgwQzsM5oSkZAWZ8904M5XZuzpPyXD0
 nqJmC217nvP6Gw0CkCuU2ysGrdyxIZR2RozD7qfXpTCsaIlZKZr/s1so3oW9MvWOyGu+
 PF96dI+ppKSjOXEBrsZyDf0/PEZ622i62T6y0VVd6xXceqIQqmQDojiZ1/yZtn0w6llM
 I9q/yCmdXcb+EBk9RVjMtBOVI4QtooUoB1+b4QeY/FZvqiTw4DpKeUd8O/bdm+2Dh6Ta
 00EsCpij0+ZXWaA8fBgbrU9RRuy84qHfrpwsArK5lalwB9KxcDOY0TwsXfNaYqMJoj+5
 S9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787615; x=1738392415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xde8rOoc7ub5IEPiyVqYWw11iutjj4hEBt+3xz2QfjM=;
 b=NsJVLYKAX7WP5sx179c4fT90vKyFh7PnTlU82PzJQJTiPpsSpzSpwmaZYnCzBxV514
 NO7Xyg4LL80bXtjGDKcqbdD7WolhVCgS3hkN+M20mIYbijU6d9ql9H6Vqddis/5N1sB/
 ly1WpxAkBaufo6KV9E/5vtQbn+7pv1zOnRFPPhnacidouYyFrr71j+bAZYbeRrZjwTSZ
 0PTOYneyiYU7W2T3tUjA6XLG4eUjGmCjFMRUyHSCqRPeEobEXQDk0EPTx8dYcLO22LgG
 6G8+XY0uOK3dUEW17DHa0wYaCMhUGZ+ukDHP6ohHVZD4bQ1AGmHCExp7ox7iN9q/fufm
 mYZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx4RMJiVEZ/TUPtsMa69XWVJqmD7z0J7C5tUgJXSc7rqeoc27kUOw3N3RIt8Y6rTu310lYffT1g0Cr@lists.freedesktop.org,
 AJvYcCVI0hlXZYLjlikj0DKKsgBioaKz8bVWmgTLGEdU2WQeOY3K4vl8VteTJtUhAcy5I5fZqfMHypyG@lists.freedesktop.org,
 AJvYcCVhJHmZkaTp+7vIbA6US3G3L0FJ1YO0pWz4tKyZ01aFx5kjI0SFr9OwPfvSy+cM0Zl+eoKqSqmWFx70/ehzSA==@lists.freedesktop.org,
 AJvYcCVo7QpwjkDmue31zSn7HeZ231ou0MVC3uHzEUrvO6XC0QjNIKMJBLtgRgo4FVB+jRCVSDOR+WTMdWAn@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+i/Hnq/UoOqHy9n6LkQqeo6F0lQ4QqFFylFxMalGcKBND2qGX
 5qyNbbEE1q7WW0v7MQvj7CNXpum4Qa/eDVsRDkLhUXSEVXF2fO49NSlOxQ==
X-Gm-Gg: ASbGnctpG1br02MwHp7ot9KabhbUVaxUSuj6c0qnF5jj+DfEuyMZS6QbU2kSQazpMQY
 TqSIrlYQPFMKFQsVRIxkhkl6PMbVOuTtnL8yejYG8cUgQzTr40FcqCopq1C+jDcG18IVfHQjIKJ
 KXgBxwNHC+lOrM1iecqz2h7ot4X2IFSW8nXmUm9DFUwH1eN3n8+4tk3mdDZqH4dig4EBgCkW2BF
 QEgH0ngdL/NHA/lc6NB/5AIqdcqe31qmysgwNQiI78wsiQIIw4M0DH7wD9TRRPOu4H8f+H3wgKw
 oB92onLsASXdEj0mwBGQEuTuVE5O9Tob7q2wCQ==
X-Google-Smtp-Source: AGHT+IG0fqXZTCvCCnwL9vi7cYB4QP6opHHV2Qe7YcKfvhFM9yUxKYXJHOh6jRvUhuTThLQuLUmipg==
X-Received: by 2002:a05:6e02:174a:b0:3cf:ce7c:b8b1 with SMTP id
 e9e14a558f8ab-3cfce7cb91cmr43838095ab.18.1737787615489; 
 Fri, 24 Jan 2025 22:46:55 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:46:55 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 17/63] dyndbg: check DYNDBG_CLASSMAP_DEFINE args at
 compile-time
Date: Fri, 24 Jan 2025 23:45:31 -0700
Message-ID: <20250125064619.8305-18-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

Add __DYNDBG_CLASSMAP_CHECK to implement these arg-checks at compile:
	0 <= _base < 63
	class_names is not empty
	class_names[0] is a string
	(class_names.length + _base) < 63

These compile-time checks will prevent several misuses; 4 such
examples are added to test_dynamic_debug_submod.ko, and will fail
compilation if -DDD_MACRO_ARGCHECK is added to cflags.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
- split static-asserts to __DYNDBG_CLASSMAP_CHECK
- move __DYNDBG_CLASSMAP_CHECK above kdoc for DYNDBG_CLASSMAP_DEFINE
  silences kernel-doc warnings
---
 include/linux/dynamic_debug.h |  9 +++++++++
 lib/test_dynamic_debug.c      | 11 +++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index dc610a12b91c..2b0c943af330 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -99,6 +99,14 @@ struct ddebug_class_map {
 	enum ddebug_class_map_type map_type;
 };
 
+#define __DYNDBG_CLASSMAP_CHECK(_clnames, _base)			\
+	static_assert(((_base) >= 0 && (_base) < _DPRINTK_CLASS_DFLT),	\
+		      "_base must be in 0..62");			\
+	static_assert(ARRAY_SIZE(_clnames) > 0,				\
+		      "classnames array size must be > 0");		\
+	static_assert((ARRAY_SIZE(_clnames) + (_base)) < _DPRINTK_CLASS_DFLT, \
+		      "_base + classnames.length exceeds range")
+
 /**
  * DYNDBG_CLASSMAP_DEFINE - define debug classes used by a module.
  * @_var:   name of the classmap, exported for other modules coordinated use.
@@ -112,6 +120,7 @@ struct ddebug_class_map {
  */
 #define DYNDBG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)		\
 	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	__DYNDBG_CLASSMAP_CHECK(_var##_classnames, (_base));		\
 	extern struct ddebug_class_map _var;				\
 	struct ddebug_class_map __aligned(8) __used			\
 		__section("__dyndbg_classes") _var = {			\
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 1838f62738c4..b1555b0a2bb1 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -123,8 +123,19 @@ DYNDBG_CLASSMAP_PARAM(level_num, p);
 DYNDBG_CLASSMAP_USE(map_disjoint_bits);
 DYNDBG_CLASSMAP_USE(map_level_num);
 
+#if defined(DD_MACRO_ARGCHECK)
+/*
+ * Exersize compile-time arg-checks in DYNDBG_CLASSMAP_DEFINE.
+ * These will break compilation.
+ */
+DYNDBG_CLASSMAP_DEFINE(fail_base_neg, 0, -1, "NEGATIVE_BASE_ARG");
+DYNDBG_CLASSMAP_DEFINE(fail_base_big, 0, 100, "TOOBIG_BASE_ARG");
+DYNDBG_CLASSMAP_DEFINE(fail_str_type, 0, 0, 1 /* not a string */);
+DYNDBG_CLASSMAP_DEFINE(fail_emptyclass, 0, 0 /* ,empty */);
 #endif
 
+#endif /* TEST_DYNAMIC_DEBUG_SUBMOD */
+
 /* stand-in for all pr_debug etc */
 #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
 
-- 
2.48.1

