Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62834897023
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 15:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7C110FB98;
	Wed,  3 Apr 2024 13:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YNB5eMCz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A6B112214
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 13:19:44 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-29ddfada0d0so4768448a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 06:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712150384; x=1712755184; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QLppDGinW0QyvnpiYq8klDjFNvdzQ2Nr+inin7jIp4I=;
 b=YNB5eMCzd7v1aOAgxYw+3JL1NpKzSaxm/7ckFPZ0DmYxsRf5uPBav4/Ffp6j85lPTf
 ZopYvFaOnn355n9psKJqzKwaas0A0N7Dxhfk3zKA+9IiE8b6VEae0sWkrxth2JoeQF4r
 Sn3fvW+u6tP0HKBZ4nXq94QI/iCgDTW261kxq676X6Y3e1X2woKN0UlpM/kEPXwblEqw
 L8RQ62qAu5wTlcMpfYA2qCD6SCk2REMIMzM+RbS+Des31GwpmjF3Mj9CJlIUHgSAGDjX
 fRtV4xGQzCpfe2ZqqkLzewFT3m7iP/1Eu1TwXy7dIyZEqUWHZTxa6FTg/rtE/r7skSfg
 KnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712150384; x=1712755184;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QLppDGinW0QyvnpiYq8klDjFNvdzQ2Nr+inin7jIp4I=;
 b=tREhgfs/Q01osvYbv8ESJmsS6kx8rhNH/SXsaPa385vYAOCQ7jJwVWHU76pZ+O0e8G
 Kq7VPVlXi+Lakjfxpiam/aX/vD9FcgHs0Xoq/DyUfX4xfz/lSpnr9h1N6DsOeK5UUHvS
 328gqykxY3VUw7pkZjfRXVVilgjMLIuUoggFh5cTwMQPsDqDgvrBjz/wc//ZC311k1x1
 e/YX1JlqdMspsgcWS2gr7Pz3hmlzu7bbgdJk4BoJD0x0q8vCwgr5FWQLDPcpCOUBNe+p
 ZmyKgiS7N4rnCiHd+VifivKh41rC+h61oeM6ZUDn++LGtIb1oFJk8++5WVvJnd3cfAa6
 JReQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe51rEdVbY2kSeN8Eu1LYu22HF5P4AYKEafP/jz7ZoylJQ6JVxbMDiMjU5ZDGFUsfcQu1NPSwwaS6bzWcdX+ezczIoCN2+D+P7F8PyI0Lj
X-Gm-Message-State: AOJu0YzomzjEjseTZy1ac8y/TNxwZMy471r4UjR4jsIXR39Sb033MCw0
 Vu9jtwkAMCI+AQ9s0VCSELcBhFt2mZjW0BayiGojcuwUknbGMFQz
X-Google-Smtp-Source: AGHT+IHLZzwj8QjdIOumZZwMTdNJboOCUuRmYTlmuXcu4rWvyLRFqzzHLCDPQsEEK1PiSQ2OkIhUJQ==
X-Received: by 2002:a17:90a:e691:b0:29c:7544:54df with SMTP id
 s17-20020a17090ae69100b0029c754454dfmr13682150pjy.23.1712150383662; 
 Wed, 03 Apr 2024 06:19:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a17090a658600b0029bc1c931d9sm13588667pjj.51.2024.04.03.06.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 06:19:42 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, x86@kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v3 01/15] bug/kunit: Core support for suppressing warning
 backtraces
Date: Wed,  3 Apr 2024 06:19:22 -0700
Message-Id: <20240403131936.787234-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403131936.787234-1-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
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

Some unit tests intentionally trigger warning backtraces by passing
bad parameters to API functions. Such unit tests typically check the
return value from those calls, not the existence of the warning backtrace.

Such intentionally generated warning backtraces are neither desirable
nor useful for a number of reasons.
- They can result in overlooked real problems.
- A warning that suddenly starts to show up in unit tests needs to be
  investigated and has to be marked to be ignored, for example by
  adjusting filter scripts. Such filters are ad-hoc because there is
  no real standard format for warnings. On top of that, such filter
  scripts would require constant maintenance.

One option to address problem would be to add messages such as "expected
warning backtraces start / end here" to the kernel log.  However, that
would again require filter scripts, it might result in missing real
problematic warning backtraces triggered while the test is running, and
the irrelevant backtrace(s) would still clog the kernel log.

Solve the problem by providing a means to identify and suppress specific
warning backtraces while executing test code. Since the new functionality
results in an image size increase of about 1% if CONFIG_KUNIT is enabled,
provide configuration option KUNIT_SUPPRESS_BACKTRACE to be able to disable
the new functionality. This option is by default enabled since almost all
systems with CONFIG_KUNIT enabled will want to benefit from it.

Cc: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Daniel Diaz <daniel.diaz@linaro.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Kees Cook <keescook@chromium.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Added CONFIG_KUNIT_SUPPRESS_BACKTRACE configuration option,
  enabled by default
v3:
- Rebased to v6.9-rc2

 include/asm-generic/bug.h | 16 +++++++++---
 include/kunit/bug.h       | 51 +++++++++++++++++++++++++++++++++++++++
 include/kunit/test.h      |  1 +
 include/linux/bug.h       | 13 ++++++++++
 lib/bug.c                 | 51 ++++++++++++++++++++++++++++++++++++---
 lib/kunit/Kconfig         |  9 +++++++
 lib/kunit/Makefile        |  6 +++--
 lib/kunit/bug.c           | 40 ++++++++++++++++++++++++++++++
 8 files changed, 178 insertions(+), 9 deletions(-)
 create mode 100644 include/kunit/bug.h
 create mode 100644 lib/kunit/bug.c

diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
index 6e794420bd39..c170b6477689 100644
--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -18,6 +18,7 @@
 #endif
 
 #ifndef __ASSEMBLY__
+#include <kunit/bug.h>
 #include <linux/panic.h>
 #include <linux/printk.h>
 
@@ -39,8 +40,14 @@ struct bug_entry {
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 #ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 	const char	*file;
+#ifdef HAVE_BUG_FUNCTION
+	const char      *function;
+#endif
 #else
 	signed int	file_disp;
+#ifdef HAVE_BUG_FUNCTION
+	signed int	function_disp;
+#endif
 #endif
 	unsigned short	line;
 #endif
@@ -96,15 +103,18 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 #define __WARN()		__WARN_printf(TAINT_WARN, NULL)
 #define __WARN_printf(taint, arg...) do {				\
 		instrumentation_begin();				\
-		warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);	\
+		if (!IS_SUPPRESSED_WARNING(__func__))			\
+			warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);\
 		instrumentation_end();					\
 	} while (0)
 #else
 #define __WARN()		__WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
 #define __WARN_printf(taint, arg...) do {				\
 		instrumentation_begin();				\
-		__warn_printk(arg);					\
-		__WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
+		if (!IS_SUPPRESSED_WARNING(__func__)) {			\
+			__warn_printk(arg);				\
+			__WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
+		}							\
 		instrumentation_end();					\
 	} while (0)
 #define WARN_ON_ONCE(condition) ({				\
diff --git a/include/kunit/bug.h b/include/kunit/bug.h
new file mode 100644
index 000000000000..bd0fe047572b
--- /dev/null
+++ b/include/kunit/bug.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * KUnit helpers for backtrace suppression
+ *
+ * Copyright (c) 2024 Guenter Roeck <linux@roeck-us.net>
+ */
+
+#ifndef _KUNIT_BUG_H
+#define _KUNIT_BUG_H
+
+#ifndef __ASSEMBLY__
+
+#include <linux/kconfig.h>
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+
+#include <linux/stringify.h>
+#include <linux/types.h>
+
+struct __suppressed_warning {
+	struct list_head node;
+	const char *function;
+};
+
+void __start_suppress_warning(struct __suppressed_warning *warning);
+void __end_suppress_warning(struct __suppressed_warning *warning);
+bool __is_suppressed_warning(const char *function);
+
+#define DEFINE_SUPPRESSED_WARNING(func)	\
+	struct __suppressed_warning __kunit_suppress_##func = \
+		{ .function = __stringify(func) }
+
+#define START_SUPPRESSED_WARNING(func) \
+	__start_suppress_warning(&__kunit_suppress_##func)
+
+#define END_SUPPRESSED_WARNING(func) \
+	__end_suppress_warning(&__kunit_suppress_##func)
+
+#define IS_SUPPRESSED_WARNING(func) \
+	__is_suppressed_warning(func)
+
+#else /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
+#define DEFINE_SUPPRESSED_WARNING(func)
+#define START_SUPPRESSED_WARNING(func)
+#define END_SUPPRESSED_WARNING(func)
+#define IS_SUPPRESSED_WARNING(func) (false)
+
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+#endif /* __ASSEMBLY__ */
+#endif /* _KUNIT_BUG_H */
diff --git a/include/kunit/test.h b/include/kunit/test.h
index 61637ef32302..d0c44594d34c 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -10,6 +10,7 @@
 #define _KUNIT_TEST_H
 
 #include <kunit/assert.h>
+#include <kunit/bug.h>
 #include <kunit/try-catch.h>
 
 #include <linux/args.h>
diff --git a/include/linux/bug.h b/include/linux/bug.h
index 348acf2558f3..c668762dc76a 100644
--- a/include/linux/bug.h
+++ b/include/linux/bug.h
@@ -36,6 +36,9 @@ static inline int is_warning_bug(const struct bug_entry *bug)
 	return bug->flags & BUGFLAG_WARNING;
 }
 
+void bug_get_file_function_line(struct bug_entry *bug, const char **file,
+				const char **function, unsigned int *line);
+
 void bug_get_file_line(struct bug_entry *bug, const char **file,
 		       unsigned int *line);
 
@@ -62,6 +65,16 @@ static inline enum bug_trap_type report_bug(unsigned long bug_addr,
 }
 
 struct bug_entry;
+static inline void bug_get_file_function_line(struct bug_entry *bug,
+					      const char **file,
+					      const char **function,
+					      unsigned int *line)
+{
+	*file = NULL;
+	*function = NULL;
+	*line = 0;
+}
+
 static inline void bug_get_file_line(struct bug_entry *bug, const char **file,
 				     unsigned int *line)
 {
diff --git a/lib/bug.c b/lib/bug.c
index e0ff21989990..aa8bb12b9809 100644
--- a/lib/bug.c
+++ b/lib/bug.c
@@ -26,6 +26,14 @@
        when CONFIG_DEBUG_BUGVERBOSE is not enabled, so you must generate
        the values accordingly.
 
+  2a.Optionally implement support for the "function" entry in struct
+     bug_entry. This entry must point to the name of the function triggering
+     the warning or bug trap (normally __func__). This is only needed if
+     both CONFIG_DEBUG_BUGVERBOSE and CONFIG_KUNIT_SUPPRESS_BACKTRACE are
+     enabled and if the architecture wants to implement support for suppressing
+     warning backtraces. The architecture must define HAVE_BUG_FUNCTION if it
+     adds pointers to function names to struct bug_entry.
+
   3. Implement the trap
      - In the illegal instruction trap handler (typically), verify
        that the fault was in kernel mode, and call report_bug()
@@ -127,14 +135,21 @@ static inline struct bug_entry *module_find_bug(unsigned long bugaddr)
 }
 #endif
 
-void bug_get_file_line(struct bug_entry *bug, const char **file,
-		       unsigned int *line)
+void bug_get_file_function_line(struct bug_entry *bug, const char **file,
+				const char **function, unsigned int *line)
 {
+	*function = NULL;
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 	*file = (const char *)&bug->file_disp + bug->file_disp;
+#ifdef HAVE_BUG_FUNCTION
+	*function = (const char *)&bug->function_disp + bug->function_disp;
+#endif
 #else
 	*file = bug->file;
+#ifdef HAVE_BUG_FUNCTION
+	*function = bug->function;
+#endif
 #endif
 	*line = bug->line;
 #else
@@ -143,6 +158,13 @@ void bug_get_file_line(struct bug_entry *bug, const char **file,
 #endif
 }
 
+void bug_get_file_line(struct bug_entry *bug, const char **file, unsigned int *line)
+{
+	const char *function;
+
+	bug_get_file_function_line(bug, file, &function, line);
+}
+
 struct bug_entry *find_bug(unsigned long bugaddr)
 {
 	struct bug_entry *bug;
@@ -157,8 +179,9 @@ struct bug_entry *find_bug(unsigned long bugaddr)
 static enum bug_trap_type __report_bug(unsigned long bugaddr, struct pt_regs *regs)
 {
 	struct bug_entry *bug;
-	const char *file;
+	const char *file, *function;
 	unsigned line, warning, once, done;
+	char __maybe_unused sym[KSYM_SYMBOL_LEN];
 
 	if (!is_valid_bugaddr(bugaddr))
 		return BUG_TRAP_TYPE_NONE;
@@ -169,12 +192,32 @@ static enum bug_trap_type __report_bug(unsigned long bugaddr, struct pt_regs *re
 
 	disable_trace_on_warning();
 
-	bug_get_file_line(bug, &file, &line);
+	bug_get_file_function_line(bug, &file, &function, &line);
+#if defined(CONFIG_KUNIT_SUPPRESS_BACKTRACE) && defined(CONFIG_KALLSYMS)
+	if (!function) {
+		/*
+		 * This will be seen if report_bug is called on an architecture
+		 * with no architecture-specific support for suppressing warning
+		 * backtraces, if CONFIG_DEBUG_BUGVERBOSE is not enabled, or if
+		 * the calling code is from assembler which does not record a
+		 * function name. Extracting the function name from the bug
+		 * address is less than perfect since compiler optimization may
+		 * result in 'bugaddr' pointing to a function which does not
+		 * actually trigger the warning, but it is better than no
+		 * suppression at all.
+		 */
+		sprint_symbol_no_offset(sym, bugaddr);
+		function = sym;
+	}
+#endif /* defined(CONFIG_KUNIT_SUPPRESS_BACKTRACE) && defined(CONFIG_KALLSYMS) */
 
 	warning = (bug->flags & BUGFLAG_WARNING) != 0;
 	once = (bug->flags & BUGFLAG_ONCE) != 0;
 	done = (bug->flags & BUGFLAG_DONE) != 0;
 
+	if (warning && IS_SUPPRESSED_WARNING(function))
+		return BUG_TRAP_TYPE_WARN;
+
 	if (warning && once) {
 		if (done)
 			return BUG_TRAP_TYPE_WARN;
diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
index 68a6daec0aef..b1b899265acc 100644
--- a/lib/kunit/Kconfig
+++ b/lib/kunit/Kconfig
@@ -15,6 +15,15 @@ menuconfig KUNIT
 
 if KUNIT
 
+config KUNIT_SUPPRESS_BACKTRACE
+	bool "KUnit - Enable backtrace suppression"
+	default y
+	help
+	  Enable backtrace suppression for KUnit. If enabled, backtraces
+	  generated intentionally by KUnit tests are suppressed. Disable
+	  to reduce kernel image size if image size is more important than
+	  suppression of backtraces generated by KUnit tests.
+
 config KUNIT_DEBUGFS
 	bool "KUnit - Enable /sys/kernel/debug/kunit debugfs representation" if !KUNIT_ALL_TESTS
 	default KUNIT_ALL_TESTS
diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
index 309659a32a78..545b57c3be48 100644
--- a/lib/kunit/Makefile
+++ b/lib/kunit/Makefile
@@ -14,8 +14,10 @@ ifeq ($(CONFIG_KUNIT_DEBUGFS),y)
 kunit-objs +=				debugfs.o
 endif
 
-# KUnit 'hooks' are built-in even when KUnit is built as a module.
-obj-y +=				hooks.o
+# KUnit 'hooks' and bug handling are built-in even when KUnit is built
+# as a module.
+obj-y +=				hooks.o \
+					bug.o
 
 obj-$(CONFIG_KUNIT_TEST) +=		kunit-test.o
 
diff --git a/lib/kunit/bug.c b/lib/kunit/bug.c
new file mode 100644
index 000000000000..f93544d7a9d1
--- /dev/null
+++ b/lib/kunit/bug.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit helpers for backtrace suppression
+ *
+ * Copyright (c) 2024 Guenter Roeck <linux@roeck-us.net>
+ */
+
+#include <kunit/bug.h>
+#include <linux/export.h>
+#include <linux/list.h>
+#include <linux/string.h>
+
+static LIST_HEAD(suppressed_warnings);
+
+void __start_suppress_warning(struct __suppressed_warning *warning)
+{
+	list_add(&warning->node, &suppressed_warnings);
+}
+EXPORT_SYMBOL_GPL(__start_suppress_warning);
+
+void __end_suppress_warning(struct __suppressed_warning *warning)
+{
+	list_del(&warning->node);
+}
+EXPORT_SYMBOL_GPL(__end_suppress_warning);
+
+bool __is_suppressed_warning(const char *function)
+{
+	struct __suppressed_warning *warning;
+
+	if (!function)
+		return false;
+
+	list_for_each_entry(warning, &suppressed_warnings, node) {
+		if (!strcmp(function, warning->function))
+			return true;
+	}
+	return false;
+}
+EXPORT_SYMBOL_GPL(__is_suppressed_warning);
-- 
2.39.2

