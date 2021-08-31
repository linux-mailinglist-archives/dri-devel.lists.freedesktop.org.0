Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EB53FCE62
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 22:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0706E09C;
	Tue, 31 Aug 2021 20:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E857C898F1;
 Tue, 31 Aug 2021 20:21:40 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id b4so492715ilr.11;
 Tue, 31 Aug 2021 13:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mpi93sZnTxKQZcUX7nJx0AmPJvhRVKwMPXoz3L+ENEM=;
 b=KbDtfHAAedw7NnNekrgaJFuIdRLMzt7sxJNovK2h3icRe9FcFuXNLLVfe2lKfgHAo4
 O/Dz9T3hJKfWRv279F2SMLGcS3qRUJ0XZGdcgSfHPt+2xGMrflwB+Iuh8mFRhnqtXO+5
 avJJtS0ykVnaek41oz6Z4krS70vi3Z6r8k2oe9HuGJXAn1UWsWMkmgfmeZ/7F9Kj4dgc
 creXmU65tnHYA9YShxgAR5mporRXeJtkl6KCq0+CcyvCGmC8rqCn3P5QMPYx4vlOLnUb
 SiZfmKlHS+yWMZolfT0LKUT9JMafibFU13sR/zPmWxOWxZTjhqruPcc9B/BEruIY/CvT
 SIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mpi93sZnTxKQZcUX7nJx0AmPJvhRVKwMPXoz3L+ENEM=;
 b=Ms2L4vSbXx7GC3F2AFnv4RKseHHijPO3bA8j7eWqpfuRg6t009lVucqGN30k6UGas/
 xG5DrepLRVI71dwQuWtMp6Oujbl3u5b/st+wlGdmqsnJPfh3oqFmhb6/PT0h7BPfJe/3
 r3N138ZDWw4bVND7aJ+eZEwW3EEJqSy8/5gKK9jIMyZVQUWHv9buBsW0oaHH+OkAd23F
 3IjFYFEOm0CtKm9kn2z+5bY9950frfnrX3lr2Q8Pp8H2BQ/qwmLLkopnySksygu5zXlF
 vnNA+n+qL089kW6BW4hgBsPzqHO+kbYlOTcLvMYEMoKeW51Y9rpSwBf95zBrm9nI7XDr
 ieCw==
X-Gm-Message-State: AOAM533GfXL8VQm6P8OrqiU15SH9qj4zh8uCqjvQ7AosfmwAO4psEsZP
 ue79HDlgfHE7Av/UNnCxrHE=
X-Google-Smtp-Source: ABdhPJx7Bj853LuYa2edoUKw8Uupm1SiCk6KGHz30Xn4QJAqgQAAsmcGNbNfzoKWIzaGGfc2gMVZwQ==
X-Received: by 2002:a05:6e02:1aa8:: with SMTP id
 l8mr20558629ilv.226.1630441300258; 
 Tue, 31 Aug 2021 13:21:40 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id u15sm10597384ilk.53.2021.08.31.13.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 13:21:39 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v7 1/8] dyndbg: add DEFINE_DYNAMIC_DEBUG_CATEGORIES and
 callbacks
Date: Tue, 31 Aug 2021 14:21:26 -0600
Message-Id: <20210831202133.2165222-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210831202133.2165222-1-jim.cromie@gmail.com>
References: <20210831202133.2165222-1-jim.cromie@gmail.com>
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

DEFINE_DYNAMIC_DEBUG_CATEGORIES(name, var, bitmap_desc, @bit_descs)
allows users to define a drm.debug style (bitmap) sysfs interface, and
to specify the desired mapping from bits[0-N] to the format-prefix'd
pr_debug()s to be controlled.

DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_gvt, __gvt_debug,
	"i915/gvt bitmap desc",
	/**
	 * search-prefixes, passed to dd-exec_queries
	 * defines bits 0-N in order.
	 * leading ^ is tacitly inserted (by callback currently)
	 * trailing space used here excludes subcats.
	 * helper macro needs more work
	 * macro to autogen ++$i, 0x%x$i ?
	 */
	_DD_cat_("gvt:cmd: "),
	_DD_cat_("gvt:core: "),
	_DD_cat_("gvt:dpy: "),
	_DD_cat_("gvt:el: "),
	_DD_cat_("gvt:irq: "),
	_DD_cat_("gvt:mm: "),
	_DD_cat_("gvt:mmio: "),
	_DD_cat_("gvt:render: "),
	_DD_cat_("gvt:sched: "));

dynamic_debug.c: add 2 new elements:

 - int param_set_dyndbg()
 - int param_get_dyndbg()
 - struct kernel_param_ops param_ops_dyndbg

Following the model of kernel/params.c STANDARD_PARAM_DEFS, these are
non-static and exported.

get/set use an augmented kernel_param; the arg refs a new struct
dyndbg_bitmap_param containing:

- the map (array, indexed by bitpos) of format-prefix strings, which
  define the set/category of prdbgs to be changed per each bit.

- pointer to the user's ulong holding the bits/state.
  by sharing state, we coordinate with code that still uses it directly

This will allow drm-debug to be converted incrementally, while still
using __drm_debug & drm_debug_enabled() in other parts.

param_set_dyndbg() compares new vs old bits, and only updates prdbgs
on changes.  This maximally preserves the underlying state, which may
have been customized via later `echo $cmd >control`.  So if a user
really wants to know that all prdbgs are set precisely, they must
pre-clear then set.

TLDR: this also doesn't affect the decorator flags "mflt" set per prdbg.

dynamic_debug.h:

Add DEFINE_DYNAMIC_DEBUG_CATEGORIES() described above, and a stub
throwing a BUILD_BUG (RFC) when used without DYNAMIC_DEBUG support.
Add structs dyndbg_bitdesc, dyndbg_bitmap_param to support the macro.

Note that it also calls MODULE_PARM_DESC for the user, but expects the
user to catenate all the bit-descriptions together (as is done in
drm.debug), and in the following uses in amdgpu, i915.

The intent is to regenerate this output from per-bit help given in
VA_ARGS, including a bit_label(); but this can wait.

Also externs the struct kernel_param param_ops_dyndbg symbol, as is
done in moduleparams.h for all the STANDARD params.

USAGE NOTES:

Using dyndbg to query on "format ^$prefix" requires that the prefix be
present in the compiled-in format string; where run-time prefixing is
used, that format would be "%s...", which is not usefully selectable.

Using DEFINE_DYNAMIC_DEBUG_CATEGORIES wo support gets a BUILD_BUG.
ISTM there is already action at a declarative distance, nobody needs
mystery as to why the /sysfs thingy didn't appear.

Dyndbg is completely agnostic wrt the categorization scheme used, in
order to play well with any prefix convention already in use in the
codebase.  Ad-hoc categories and sub-categories are implicitly
allowed, author discipline and review is expected.

Here are some examples:

"1","2","3"		2 doesn't imply 1.
   			otherwize, sorta like printk levels
"1:","2:","3:"		are better, avoiding [1-9]\d+ ambiguity
"hi:","mid:","low:"	are reasonable, and imply independence
"todo:","rfc:","fixme:" might be handy
"A:".."Z:"		uhm, yeah

Hierarchical classes/categories are natural:

"drm:<CAT>:"		is used in a later commit
"drm:<CAT>:<SUB>:"	is a natural extension.
"drm:atomic:fail:"	has been proposed, sounds directly useful

NB: in a real sense we abandon enum strictures here, and lose some
compiler help, on spelling errs for example.  Obviously "drm:" != "DRM:".

Some properties of a hierarchical category deserve explication:

Trailing spaces matter !

With 1..3-space ("drm: ", "drm:atomic: ", "drm:atomic:fail: "), the
":" doesn't terminate the search-space, the trailing space does.  So a
"drm:" search spec will match all DRM categories & subcategories, and
will not be useful in an interface where all categories are already
controlled together.  That said, "drm:atomic:" & "drm:atomic: " are
different, and both are useful in cases.

Ad-Hoc sub-categories:

These have a caveat wrt wrapper macros adding prefixes like
"drm:atomic: "; the trailing space in the prefix means that
drm_dbg_atomic("fail: ...") pastes as "drm:atomic: fail: ", which
obviously isn't ideal wrt clear and simple bitmaps.

A possible solution is to have a FOO_() version of every FOO() macro
which (anti-mnemonically) elides the trailing space, which is normally
inserted by a newer FOO().

IE: drm_dbg_atomic_("fail: ..."); // trailing _ means ad-hoc subcat

Summarizing:

 - "drm:kms: " & "drm:kms:" are different
 - "drm:kms"		also different - includes drm:kms2:
 - "drm:kms:\t"		also different - could be troublesome
 - "drm:kms:*"		doesn't work, no wildcard on format atm.

Order matters in DEFINE_DYNAMIC_DEBUG_CATEGORIES(... @bit_descs)

@bit_descs (array) position determines the bit mapping to the prefix,
so to keep a stable map, new categories or 3rd level categories must
be added to the end.

Since bits are/will-stay applied 0-N, the later bits can countermand
the earlier ones, but it's tricky - consider;

    DD_CATs(... "drm:atomic:", "drm:atomic:fail:" ) // misleading

The 1st search-term is misleading, because it includes (modifies)
subcategories, but then 2nd overrides it.  So don't do that.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v5:
. rename to DEFINE_DYNAMIC_DEBUG_CATEGORIES from DEFINE_DYNDBG_BITMAP
. in set_dyndbg, replace hardcoded "i915" w kp->mod->name
. static inline the stubs
. const *str in structs, const array. - Emil
. dyndbg: add do-nothing DEFINE_DYNAMIC_DEBUG_CATEGORIES if !DD_CORE
. call MOD_PARM_DESC(name, "$desc") for users
. simplify callback, remove bit-change detection
. config errs reported by <lkp@intel.com>

v6:
. return rc, bitmap->, snprintf, ws - Andy Shevchenko
. s/chgct/matches/ - old varname is misleading
. move code off file bottom to a "better" place
. change ##fsname to ##var for less generic varname (ie: not "debug")
. add KP_MOD_NAME workaround for !CONFIG_MODULES
. move forward decl down to where its needed

v7:
. use kp->arg, dont need kp->data or previous patch-1 - jbaron
. use client's ulong for bits, share state
. throw BUILD_BUG if DEFINE_DYNAMIC_DEBUG_CATEGORIES used wo support
---
 include/linux/dynamic_debug.h | 60 ++++++++++++++++++++++++++
 lib/dynamic_debug.c           | 79 ++++++++++++++++++++++++++++++++++-
 2 files changed, 138 insertions(+), 1 deletion(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index dce631e678dd..f51b738668a0 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -181,6 +181,10 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 				   KERN_DEBUG, prefix_str, prefix_type,	\
 				   rowsize, groupsize, buf, len, ascii)
 
+struct kernel_param;
+int param_set_dyndbg(const char *instr, const struct kernel_param *kp);
+int param_get_dyndbg(char *buffer, const struct kernel_param *kp);
+
 #else /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
 #include <linux/string.h>
@@ -227,6 +231,62 @@ static inline int dynamic_debug_exec_queries(const char *query, const char *modn
 	return 0;
 }
 
+struct kernel_param;
+static inline int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
+{ return 0; }
+static inline int param_get_dyndbg(char *buffer, const struct kernel_param *kp)
+{ return 0; }
+
 #endif /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
+struct dyndbg_bitdesc {
+	/* bitpos is inferred from index in containing array */
+	const char *prefix;
+	const char *help;
+};
+
+struct dyndbg_bitmap_param {
+	unsigned long *bits;
+	struct dyndbg_bitdesc map[];
+};
+
+#if defined(CONFIG_DYNAMIC_DEBUG) || \
+	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
+/**
+ * DEFINE_DYNAMIC_DEBUG_CATEGORIES() - bitmap control of categorized prdbgs
+ * @fsname: parameter basename under /sys
+ * @var:    C-identifier holding bitmap
+ * @_desc:  string summarizing the controls provided
+ * @...:    list of struct dyndbg_bitdesc initializations
+ *
+ * Intended for modules with substantial use of "categorized" prdbgs
+ * (those with some systematic prefix in the format string), this lets
+ * modules (using dyndbg) control those prdbg groups according to
+ * their prefixes, and map them to bits 0-N of a sysfs control point.
+ * The @bits... identifies the prefixes to be used by dyndbg to
+ * select and alter those categorized prdbgs, order defines bitpos.
+ */
+#define DEFINE_DYNAMIC_DEBUG_CATEGORIES(fsname, _var, _desc, ...)	\
+	MODULE_PARM_DESC(fsname, _desc);				\
+	static struct dyndbg_bitmap_param ddcats_##_var =		\
+	{ .bits = &_var, .map = { __VA_ARGS__, { .prefix = NULL }}};	\
+	module_param_cb(fsname, &param_ops_dyndbg, &ddcats_##_var, 0644)
+
+#define _DD_cat_(pfx)		{ .prefix = pfx, .help = "help for " pfx }
+#define _DD_cat_help_(pfx)	"\t   " pfx "\t- help for " pfx "\n"
+
+extern const struct kernel_param_ops param_ops_dyndbg;
+
+#elif (defined(CONFIG_DYNAMIC_DEBUG_CORE) && !defined(DYNAMIC_DEBUG_MODULE))
+
+#define DEFINE_DYNAMIC_DEBUG_CATEGORIES(fsname, var, bitmap_desc, ...)	\
+	BUILD_BUG_ON_MSG(1, "you need -DDYNAMIC_DEBUG_MODULE in compile")
+
+#else
+#define DEFINE_DYNAMIC_DEBUG_CATEGORIES(fsname, var, bitmap_desc, ...) \
+	BUILD_BUG_ON_MSG(1, "DYNAMIC_DEBUG support required to use this macro: " #var)
+#define _DD_cat_(pfx)
+#define _DD_cat_help_(pfx)
+#endif
+
 #endif
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index cb5abb42c16a..9f9e70023aa4 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -529,7 +529,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		if (!query || !*query || *query == '#')
 			continue;
 
-		vpr_info("query %d: \"%s\"\n", i, query);
+		vpr_info("query %d: \"%s\" mod:%s\n", i, query, modname ?: "*");
 
 		rc = ddebug_exec_query(query, modname);
 		if (rc < 0) {
@@ -577,6 +577,83 @@ int dynamic_debug_exec_queries(const char *query, const char *modname)
 }
 EXPORT_SYMBOL_GPL(dynamic_debug_exec_queries);
 
+#ifdef CONFIG_MODULES
+#define KP_MOD_NAME kp->mod->name
+#else
+#define KP_MOD_NAME NULL /* wildcard */
+#endif
+#define FMT_QUERY_SIZE 128 /* typically need <40 */
+/**
+ * param_set_dyndbg - bits => categories >control setter
+ * @instr: string echo>d to sysfs
+ * @kp:    kp->arg has state: bits, map
+ *
+ * Enable/disable prdbgs by their "category", as defined in args to
+ * DEFINE_DYNAMIC_DEBUG_CATEGORIES
+ * Returns: 0 or <0 if error.
+ */
+int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
+{
+	unsigned long inbits;
+	int rc, i, matches = 0, totct = 0;
+	char query[FMT_QUERY_SIZE];
+	const struct dyndbg_bitmap_param *p = kp->arg;
+	const struct dyndbg_bitdesc *map = p->map;
+
+	if (!map) {
+		pr_err("set_dyndbg: no bits=>queries map\n");
+		return -EINVAL;
+	}
+	rc = kstrtoul(instr, 0, &inbits);
+	if (rc) {
+		pr_err("set_dyndbg: failed\n");
+		return rc;
+	}
+	vpr_info("set_dyndbg: new 0x%lx old 0x%lx\n", inbits, *p->bits);
+
+	for (i = 0; map->prefix && i < BITS_PER_LONG; map++, i++) {
+
+		if (test_bit(i, &inbits) == test_bit(i, p->bits))
+			continue;
+		snprintf(query, FMT_QUERY_SIZE, "format '^%s' %cp", map->prefix,
+			 test_bit(i, &inbits) ? '+' : '-');
+
+		matches = ddebug_exec_queries(query, KP_MOD_NAME);
+
+		v2pr_info("bit-%d: %d matches on format '^%s'\n", i,
+			  matches, map->prefix);
+		totct += matches;
+	}
+	*p->bits = inbits;
+	vpr_info("total matches: %d\n", totct);
+	return 0;
+}
+EXPORT_SYMBOL(param_set_dyndbg);
+
+/**
+ * param_get_dyndbg - bitmap reader
+ * @buffer: receives string rep of bitmap
+ * @kp:    kp->arg has state: bits, map
+ *
+ * Reads last written bits, underlying prdbg state may have changed since.
+ * Returns: #chars written
+ */
+int param_get_dyndbg(char *buffer, const struct kernel_param *kp)
+{
+	const struct dyndbg_bitmap_param *p = kp->arg;
+	unsigned long val = *p->bits;
+
+	return scnprintf(buffer, PAGE_SIZE, "0x%lx\n", val);
+}
+EXPORT_SYMBOL(param_get_dyndbg);
+
+const struct kernel_param_ops param_ops_dyndbg = {
+	.set = param_set_dyndbg,
+	.get = param_get_dyndbg,
+};
+/* support DEFINE_DYNAMIC_DEBUG_CATEGORIES users */
+EXPORT_SYMBOL(param_ops_dyndbg);
+
 #define PREFIX_SIZE 64
 
 static int remaining(int wrote)
-- 
2.31.1

