Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CEA3F421D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 00:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86AE89F5F;
	Sun, 22 Aug 2021 22:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5EA89EA3;
 Sun, 22 Aug 2021 22:20:55 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 s21-20020a4ae495000000b0028e499b5921so2100317oov.12; 
 Sun, 22 Aug 2021 15:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+7FYNm5UBeRDqGoPhhPraOa2pvrHJnPY3XEkED5ZDqA=;
 b=fnO6PKGQQSUN8VhZEa7Zys/iQpS+5xtWxK2YfpNXmnZwJzYrar7e4dzBmCxW6AplJt
 gejCFW78l0Qge7D9cMTnjMRFAJOF39GNpNxzy0qKRwule6/cVYfMpxL87+vJLA656ohJ
 nUmQl3Wb+m9kL+VoVO2HgL4+XoJhUaWtvk7LcYIIYzr+cJII+cGJnEjSHiFtkHjAu213
 Ym8B9OaqipsdjBasHFG1rADZ4m48ceZgFOFC5uyuKJ31e6nTTQYcvcqcKO8f9TpgDsIL
 kCY3FPmFich5+9kap1pzcaAVvPaLGk+mhZKp+acxNdh1vo92zYbC3Vb/7q8rpSLFwpO6
 WmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+7FYNm5UBeRDqGoPhhPraOa2pvrHJnPY3XEkED5ZDqA=;
 b=ikqu4YU1ntYuMDOVoWV++xCCiS63uci839LY1EOZAA/jrUOlafopuv6/NJdFs5Ow4+
 MtDAqsCQzX98ej4iJJ4qaBIYPWTtgEyUOGqnYMrCaXiPeCnzEKSWjDfU9ff81oGikXQ5
 LT5GDmZDC2kzzbJOH1kKLs2yFwJD72mEhFdXmmX9G7sukzTb3T5yV5PbuofbBljPvS7z
 91+1YCHG53etZG3ZNmRs1Rd0z+/rSH4sNf93gUAAgFE8orXPbDb2voUW8nKMgDTxlaGJ
 U8y0R7MHImpJG/ZLSZqWRVFAirt2JkbCRcdCk/oFVE4RmsYxEv/Mk/X96GLzsDqQozSr
 6FiQ==
X-Gm-Message-State: AOAM530UyxCh+PJDVscqCxrKAAio4jUEs11GS31Cs67SBZfX+zFIvqTu
 4AzFXMRWu4/v+p8kFJIhBEY=
X-Google-Smtp-Source: ABdhPJxBaoDdtAfOBnm2SLyUi8ihoQP9Lczrb5kWjSS2mRe2P3euXC3pmocfiZqvQugnu58brND6RA==
X-Received: by 2002:a4a:c60e:: with SMTP id l14mr23784729ooq.80.1629670853502; 
 Sun, 22 Aug 2021 15:20:53 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id x198sm2964122ooa.43.2021.08.22.15.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 15:20:52 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, seanpaul@chromium.org,
 jeyu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 06/11] drm_print: add choice to use dynamic debug in
 drm-debug
Date: Sun, 22 Aug 2021 16:20:04 -0600
Message-Id: <20210822222009.2035788-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822222009.2035788-1-jim.cromie@gmail.com>
References: <20210822222009.2035788-1-jim.cromie@gmail.com>
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

drm's debug system writes 10 distinct categories of messages to syslog
using a small API[1]: drm_dbg*(10 names), DRM_DEBUG*(8 names),
DRM_DEV_DEBUG*(3 names).  There are thousands of these callsites, each
categorized by their authors.

These callsites can be enabled at runtime by their category, each
controlled by a bit in drm.debug (/sys/modules/drm/parameter/debug).
In the current "basic" implementation, drm_debug_enabled() tests these
bits in __drm_debug each time an API[1] call is executed; while cheap
individually, the costs accumulate.

This patch uses dynamic-debug with jump-label to patch enabled calls
onto their respective NOOP slots, avoiding all runtime bit-checks of
__drm_debug.

Dynamic debug has no concept of category, but we can emulate one by
replacing enum categories with a set of prefix-strings; "drm:core:",
"drm:kms:" "drm:driver:" etc, and prepend them (at compile time) to
the given formats.

Then we can use:
  `echo module drm format "^drm:core: " +p > control`

to enable the whole category with one query.

This conversion yields ~2100 new callsites on my i7/i915 laptop:

  dyndbg: 195 debug prints in module drm_kms_helper
  dyndbg: 298 debug prints in module drm
  dyndbg: 1630 debug prints in module i915

CONFIG_DRM_USE_DYNAMIC_DEBUG enables this, and is available if
CONFIG_DYNAMIC_DEBUG or CONFIG_DYNAMIC_DEBUG_CORE is chosen, and if
CONFIG_JUMP_LABEL is enabled; this because its required to get the
promised optimizations.

The "basic" -> "dyndbg" switchover is layered into the macro scheme

A. use DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug, __drm_debug,
		"DRM debug category-per-bit control",
   	  	{ "drm:core:", "enable CORE debug messages" },
   	  	{ "drm:kms:", "enable KMS debug messages" }, ...);

B. A "classy" version of DRM_UT_<CATs> map, named DRM_DBG_CAT_<CATs>

   DRM_DBG_CLASS_<CATs> was proposed, I had agreed, but reconsidered;
   CATEGORY is already DRM's term-of-art, and adding a near-synonym
   'CLASS' only adds ambiguity.

   "basic":  DRM_DBG_CAT_<CATs>  <===  DRM_UT_<CATs>.  Identity map.
   "dyndbg":
     #define DRM_DBG_CAT_KMS    "drm:kms: "
     #define DRM_DBG_CAT_PRIME  "drm:prime: "
     #define DRM_DBG_CAT_ATOMIC "drm:atomic: "

   DRM_UT_* are preserved, since theyre used elsewhere.
   We can probably reduce its use further, but thats a separate thing.

C. drm_dev_dbg() & drm_debug() are interposed with macros

     basic:	forward to renamed fn, with args preserved
     enabled:	redirect to pr_debug, dev_dbg, with CATEGORY # format

   this is where drm_debug_enabled() is avoided.
   prefix is prepended at compile-time, no category at runtime.

D. API[1] uses DRM_DBG_CAT_<CAT>s
   these already use (C), now they use (B) too,
   to get the correct token type for "basic" and "dyndbg" configs.

NOTES:

Because the dyndbg callback is watching __drm_debug, it is coherent
with drm_debug_enabled(), the switchover should be transparent.

Code Review is expected to catch lack of correspondence between
bit=>prefix definitions (the selector) and the prefixes used in the
API[1] layer above pr_debug()

I've coded the search-prefixes/categories with a trailing space, which
excludes any sub-categories added later.  This convention protects any
"drm:atomic:fail:" callsites from getting stomped on by `echo 0 > debug`.
Other categories could differ, but we need some default.

Dyndbg requires that the prefix be in the compiled-in format string;
run-time prefixing evades callsite selection by category.

	pr_debug("%s: ...", __func__, ...) // not ideal

With "lineno X" in a query, its possible to enable single callsites,
but it is tedious, and useless in a category context.

Unfortunately __func__ is not a macro, and cannot be catenated at
preprocess/compile time.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v6:
. add kernel doc
. fix cpp paste, drop '#'
v5:
. use DEFINE_DYNAMIC_DEBUG_CATEGORIES in drm_print.c
. s/DRM_DBG_CLASS_/DRM_DBG_CAT_/ - dont need another term
. default=y in KBuild entry - per @DanVet
. move some commit-log prose to dyndbg commit
. add-prototyes to (param_get/set)_dyndbg
. more wrinkles found by <lkp@intel.com>
. relocate ratelimit chunk from elsewhere
---
 drivers/gpu/drm/Kconfig     |  13 ++++
 drivers/gpu/drm/drm_print.c |  49 +++++++++----
 include/drm/drm_print.h     | 142 ++++++++++++++++++++++++++++--------
 3 files changed, 160 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 7ff89690a976..97e38d86fd27 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -57,6 +57,19 @@ config DRM_DEBUG_MM
 
 	  If in doubt, say "N".
 
+config DRM_USE_DYNAMIC_DEBUG
+	bool "use dynamic debug to implement drm.debug"
+	default y
+	depends on DRM
+	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
+	depends on JUMP_LABEL
+	help
+	  The "basic" drm.debug facility does a lot of unlikely
+	  bit-field tests at runtime; while cheap individually, the
+	  cost accumulates.  DYNAMIC_DEBUG patches pr_debug()s in/out
+	  of the running kernel, so avoids those bit-test overheads,
+	  and is therefore recommended.
+
 config DRM_DEBUG_SELFTEST
 	tristate "kselftests for DRM"
 	depends on DRM
diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 111b932cf2a9..72b940a30779 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -28,6 +28,7 @@
 #include <stdarg.h>
 
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
@@ -43,16 +44,36 @@
 unsigned int __drm_debug;
 EXPORT_SYMBOL(__drm_debug);
 
-MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug category.\n"
-"\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n"
-"\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller code)\n"
-"\t\tBit 2 (0x04)  will enable KMS messages (modesetting code)\n"
-"\t\tBit 3 (0x08)  will enable PRIME messages (prime code)\n"
-"\t\tBit 4 (0x10)  will enable ATOMIC messages (atomic code)\n"
-"\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
-"\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
-"\t\tBit 8 (0x100) will enable DP messages (displayport code)");
+#define DRM_DEBUG_DESC \
+"Enable debug output, where each bit enables a debug category.\n"	\
+"\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n"		\
+"\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller code)\n"	\
+"\t\tBit 2 (0x04)  will enable KMS messages (modesetting code)\n"	\
+"\t\tBit 3 (0x08)  will enable PRIME messages (prime code)\n"		\
+"\t\tBit 4 (0x10)  will enable ATOMIC messages (atomic code)\n"		\
+"\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"		\
+"\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"		\
+"\t\tBit 8 (0x100) will enable DP messages (displayport code)."
+
+#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
+#include <linux/dynamic_debug.h>
+DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug, __drm_debug,
+	DRM_DEBUG_DESC,
+	_DD_cat_(DRM_DBG_CAT_CORE),
+	_DD_cat_(DRM_DBG_CAT_DRIVER),
+	_DD_cat_(DRM_DBG_CAT_KMS),
+	_DD_cat_(DRM_DBG_CAT_PRIME),
+	_DD_cat_(DRM_DBG_CAT_ATOMIC),
+	_DD_cat_(DRM_DBG_CAT_VBL),
+	_DD_cat_(DRM_DBG_CAT_STATE),
+	_DD_cat_(DRM_DBG_CAT_LEASE),
+	_DD_cat_(DRM_DBG_CAT_DP),
+	_DD_cat_(DRM_DBG_CAT_DRMRES));
+
+#else
+MODULE_PARM_DESC(debug, DRM_DEBUG_DESC);
 module_param_named(debug, __drm_debug, int, 0600);
+#endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
 {
@@ -256,8 +277,8 @@ void drm_dev_printk(const struct device *dev, const char *level,
 }
 EXPORT_SYMBOL(drm_dev_printk);
 
-void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		 const char *format, ...)
+void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
+		   const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -278,9 +299,9 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
 	va_end(args);
 }
-EXPORT_SYMBOL(drm_dev_dbg);
+EXPORT_SYMBOL(__drm_dev_dbg);
 
-void __drm_dbg(enum drm_debug_category category, const char *format, ...)
+void ___drm_dbg(enum drm_debug_category category, const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -297,7 +318,7 @@ void __drm_dbg(enum drm_debug_category category, const char *format, ...)
 
 	va_end(args);
 }
-EXPORT_SYMBOL(__drm_dbg);
+EXPORT_SYMBOL(___drm_dbg);
 
 void __drm_err(const char *format, ...)
 {
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 9b66be54dd16..8775b67ecb30 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -252,15 +252,15 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
 /**
  * enum drm_debug_category - The DRM debug categories
  *
- * Each of the DRM debug logging macros use a specific category, and the logging
- * is filtered by the drm.debug module parameter. This enum specifies the values
- * for the interface.
+ * The drm.debug logging API[1] has 10 enumerated categories of
+ * messages, issued by 3 families of macros: 10 drm_dbg_<CATs>, 8
+ * DRM_DEBUG_<CATs>, and 3 DRM_DEV_DEBUG_<CATs>.
  *
  * Each DRM_DEBUG_<CATEGORY> macro logs to DRM_UT_<CATEGORY> category, except
  * DRM_DEBUG() logs to DRM_UT_CORE.
  *
- * Enabling verbose debug messages is done through the drm.debug parameter, each
- * category being enabled by a bit:
+ * Enabling categories of debug messages is done through the drm.debug
+ * parameter, each category being enabled by a bit:
  *
  *  - drm.debug=0x1 will enable CORE messages
  *  - drm.debug=0x2 will enable DRIVER messages
@@ -319,6 +319,86 @@ enum drm_debug_category {
 	DRM_UT_DRMRES		= 0x200,
 };
 
+/**
+ * DOC: DRM_USE_DYNAMIC_DEBUG - using dyndbg in drm.debug
+ *
+ * In the "basic" drm.debug implementation outlined above, each time a
+ * drm-debug API[1] call is executed, drm_debug_enabled(cat) tests
+ * drm.debug vs cat before printing.
+ *
+ * DYNAMIC_DEBUG (aka: dyndbg) patches pr_debug()s in^out of the
+ * running kernel, so it can avoid drm_debug_enabled() and skip lots
+ * of unlikely bit tests.
+ *
+ * dyndbg has no concept of category, but we can prepend a
+ * class-prefix string: "drm:core: ", "drm:kms: ", "drm:driver: " etc,
+ * to pr_debug's format (at compile time).
+ *
+ * Then control the category
+ *    `echo module drm format "^drm:core: " +p > control`
+ *    `dynamic_debug_exec_queries("format '^drm:core: ' +p", "drm");`
+ *
+ * To do this for "basic" | "dyndbg", adaptation adds some macro indirection:
+ *
+ * 0. use dyndbg support to define the bits => prefixes map, attach callback.
+ *
+ *    DYNDBG_BITMAP_DESC(debug, __drm_debug,
+ *			 "drm.debug - overview",
+ *			 { "drm:core:", "enable CORE debug messages" },
+ *			 { "drm:kms:", "enable KMS debug messages" }, ...);
+ *
+ * 1. DRM_DBG_CAT_<CAT>
+ *
+ * This set of symbols replaces DRM_UT_<CAT> in the drm-debug API; it
+ * is either a copy of DRM_UT_<CAT>, or the class-prefix strings.
+ *
+ * 2. drm_dev_dbg & drm_debug are called by drm.debug API
+ *
+ * These are now macros, either forwarding to renamed functions, or
+ * prepending the class string to the format, and invoking pr_debug
+ * directly.  Since the API is all macros, dyndbg remembers
+ * per-pr_debug: module,file,func,line,format and uses that to find
+ * and enable them.
+ */
+#if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+
+#define __drm_dbg(cls, fmt, ...)			\
+	___drm_dbg(cls, fmt, ##__VA_ARGS__)
+#define drm_dev_dbg(dev, cls, fmt, ...)			\
+	__drm_dev_dbg(dev, cls, fmt, ##__VA_ARGS__)
+
+#define DRM_DBG_CAT_CORE	DRM_UT_CORE
+#define DRM_DBG_CAT_DRIVER	DRM_UT_DRIVER
+#define DRM_DBG_CAT_KMS		DRM_UT_KMS
+#define DRM_DBG_CAT_PRIME	DRM_UT_PRIME
+#define DRM_DBG_CAT_ATOMIC	DRM_UT_ATOMIC
+#define DRM_DBG_CAT_VBL		DRM_UT_VBL
+#define DRM_DBG_CAT_STATE	DRM_UT_STATE
+#define DRM_DBG_CAT_LEASE	DRM_UT_LEASE
+#define DRM_DBG_CAT_DP		DRM_UT_DP
+#define DRM_DBG_CAT_DRMRES	DRM_UT_DRMRES
+
+#else /* CONFIG_DRM_USE_DYNAMIC_DEBUG */
+
+/* join prefix+format in cpp so dyndbg can see it */
+#define __drm_dbg(cls, fmt, ...)		\
+	pr_debug(cls fmt, ##__VA_ARGS__)
+#define drm_dev_dbg(dev, cls, fmt, ...)		\
+	dev_dbg(dev, cls fmt, ##__VA_ARGS__)
+
+#define DRM_DBG_CAT_CORE	"drm:core: "
+#define DRM_DBG_CAT_DRIVER	"drm:drvr: "
+#define DRM_DBG_CAT_KMS		"drm:kms: "
+#define DRM_DBG_CAT_PRIME	"drm:prime: "
+#define DRM_DBG_CAT_ATOMIC	"drm:atomic: "
+#define DRM_DBG_CAT_VBL		"drm:vbl: "
+#define DRM_DBG_CAT_STATE	"drm:state: "
+#define DRM_DBG_CAT_LEASE	"drm:lease: "
+#define DRM_DBG_CAT_DP		"drm:dp: "
+#define DRM_DBG_CAT_DRMRES	"drm:res: " /* not in MODULE_PARM_DESC */
+
+#endif /* CONFIG_DRM_USE_DYNAMIC_DEBUG */
+
 static inline bool drm_debug_enabled(enum drm_debug_category category)
 {
 	return unlikely(__drm_debug & category);
@@ -334,8 +414,8 @@ __printf(3, 4)
 void drm_dev_printk(const struct device *dev, const char *level,
 		    const char *format, ...);
 __printf(3, 4)
-void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		 const char *format, ...);
+void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
+		   const char *format, ...);
 
 /**
  * DRM_DEV_ERROR() - Error output.
@@ -383,7 +463,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
  * @fmt: printf() like format string.
  */
 #define DRM_DEV_DEBUG(dev, fmt, ...)					\
-	drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(dev, DRM_DBG_CAT_CORE, fmt, ##__VA_ARGS__)
 /**
  * DRM_DEV_DEBUG_DRIVER() - Debug output for vendor specific part of the driver
  *
@@ -391,7 +471,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
  * @fmt: printf() like format string.
  */
 #define DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)				\
-	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
+	drm_dev_dbg(dev, DRM_DBG_CAT_DRIVER, fmt, ##__VA_ARGS__)
 /**
  * DRM_DEV_DEBUG_KMS() - Debug output for modesetting code
  *
@@ -399,7 +479,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
  * @fmt: printf() like format string.
  */
 #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
-	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(dev, DRM_DBG_CAT_KMS, fmt, ##__VA_ARGS__)
 
 /*
  * struct drm_device based logging
@@ -443,25 +523,25 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
 
 #define drm_dbg_core(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_CORE, fmt, ##__VA_ARGS__)
 #define drm_dbg(drm, fmt, ...)						\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_DRIVER, fmt, ##__VA_ARGS__)
 #define drm_dbg_kms(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_KMS, fmt, ##__VA_ARGS__)
 #define drm_dbg_prime(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_PRIME, fmt, ##__VA_ARGS__)
 #define drm_dbg_atomic(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_ATOMIC, fmt, ##__VA_ARGS__)
 #define drm_dbg_vbl(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_VBL, fmt, ##__VA_ARGS__)
 #define drm_dbg_state(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_STATE, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_STATE, fmt, ##__VA_ARGS__)
 #define drm_dbg_lease(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_LEASE, fmt, ##__VA_ARGS__)
 #define drm_dbg_dp(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_DP, fmt, ##__VA_ARGS__)
 #define drm_dbg_drmres(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_DRMRES, fmt, ##__VA_ARGS__)
 
 
 /*
@@ -471,7 +551,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
  */
 
 __printf(2, 3)
-void __drm_dbg(enum drm_debug_category category, const char *format, ...);
+void ___drm_dbg(enum drm_debug_category category, const char *format, ...);
 __printf(1, 2)
 void __drm_err(const char *format, ...);
 
@@ -500,29 +580,30 @@ void __drm_err(const char *format, ...);
 #define DRM_ERROR_RATELIMITED(fmt, ...)					\
 	DRM_DEV_ERROR_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
 
+
 #define DRM_DEBUG(fmt, ...)						\
-	__drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CAT_CORE, fmt, ##__VA_ARGS__)
 
 #define DRM_DEBUG_DRIVER(fmt, ...)					\
-	__drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CAT_DRIVER, fmt, ##__VA_ARGS__)
 
 #define DRM_DEBUG_KMS(fmt, ...)						\
-	__drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CAT_KMS, fmt, ##__VA_ARGS__)
 
 #define DRM_DEBUG_PRIME(fmt, ...)					\
-	__drm_dbg(DRM_UT_PRIME, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CAT_PRIME, fmt, ##__VA_ARGS__)
 
 #define DRM_DEBUG_ATOMIC(fmt, ...)					\
-	__drm_dbg(DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CAT_ATOMIC, fmt, ##__VA_ARGS__)
 
 #define DRM_DEBUG_VBL(fmt, ...)						\
-	__drm_dbg(DRM_UT_VBL, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CAT_VBL, fmt, ##__VA_ARGS__)
 
 #define DRM_DEBUG_LEASE(fmt, ...)					\
-	__drm_dbg(DRM_UT_LEASE, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CAT_LEASE, fmt, ##__VA_ARGS__)
 
 #define DRM_DEBUG_DP(fmt, ...)						\
-	__drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
+	__drm_dbg(DRM_DBG_CAT_DP, fmt, ## __VA_ARGS__)
 
 #define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)					\
 ({												\
@@ -530,7 +611,8 @@ void __drm_err(const char *format, ...);
 	const struct drm_device *drm_ = (drm);							\
 												\
 	if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))			\
-		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
+		drm_dev_dbg((drm_) ? (drm_)->dev : NULL,					\
+			    DRM_DBG_CAT_ ## category, fmt, ##__VA_ARGS__);			\
 })
 
 #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
-- 
2.31.1

