Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7A83F4208
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 00:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8E589EAC;
	Sun, 22 Aug 2021 22:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE0889E5B;
 Sun, 22 Aug 2021 22:20:49 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 v33-20020a0568300921b0290517cd06302dso31188792ott.13; 
 Sun, 22 Aug 2021 15:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qNprUD8hx6lLbnsQ+b9zWsJtznkA0GlDWNTqt7qa1rI=;
 b=B4+92go5TiifGw320k3+HNmvxaD+BnUj4/BD+27D+wxdTb5X6TXBtfYDLU9m8wL1FX
 NoSi3VhEuz1Ja0dXr34cQLm4qX7aiBnlAb4rBipw27HKfmlO33CNiePm/ebqMTvZpzcq
 K2RHRcvv2bNvVMtUejPqAKXM85ADBOPZovk9S7Bf/J9mmgVRV1JuR/mUHeQgIXMxRz37
 qWwCnSbxX50EMxLm4KwquOI6f4E042x8QO/2DcuIY3opCaRmB8MCInuUPjMjLsDoBcIK
 IyF75/rJETGjKx9ui9qU24YkiNV2um3HCpVCEutI5Cb0B6qQdM1nRDP1razpbL12caev
 4gTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qNprUD8hx6lLbnsQ+b9zWsJtznkA0GlDWNTqt7qa1rI=;
 b=disfB1NW1pdKkupZJqhl6zLnjQOxc9f2SvoI8pU1/Wd6MFdkVAJ7WUkFZlvjAQih0m
 Eo4u+q90JQmw6yvfzyRQ+uNb26Ejm5tm6hmCFdRP7uzJ32hCo6X3o8yp/GqXkohheq/j
 LK1Zv5eRZ5jnbVsJ069zGUKWVxo/0S8w/W0xIz5/SIxgV70Z/pOnut0h20TBX6noi+Se
 1wuETPVe83n2oIgNes6J/PAWwfHCTobk9/jqVZtxUxBxJGhXimXvSOg0q+nTWE+U3/Wu
 KilDLI28dBdFFGu1Tvbeto3Ne4U4fs2QXFFWFbYoybF4CZcr4zhNMW/wpzh6MyE2NUAR
 /8lw==
X-Gm-Message-State: AOAM530aMg1jUnZshvGYFjoZ87Cm1Tn3sEIE1t75U7+aRgbNxOqt+T9j
 COx9WUyjME8cPFY0q29bN5M=
X-Google-Smtp-Source: ABdhPJzUaVnTFwRxMlG31uvWKN4EWDT4TijYfyiN0l7pGScbLFmVvSYxNp1xHsikFPciwluJosk5/Q==
X-Received: by 2002:a9d:6d02:: with SMTP id o2mr24864027otp.302.1629670848668; 
 Sun, 22 Aug 2021 15:20:48 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id x198sm2964122ooa.43.2021.08.22.15.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 15:20:48 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, seanpaul@chromium.org,
 jeyu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 02/11] dyndbg: add DEFINE_DYNAMIC_DEBUG_CATEGORIES and
 callbacks
Date: Sun, 22 Aug 2021 16:20:00 -0600
Message-Id: <20210822222009.2035788-3-jim.cromie@gmail.com>
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

dynamic_debug.c: add 3 new elements:

 - int param_set_dyndbg()
 - int param_get_dyndbg()
 - struct kernel_param_ops param_ops_dyndbg

Following the model of kernel/params.c STANDARD_PARAM_DEFS, All 3 are
non-static and exported.

dynamic_debug.h:

Add DEFINE_DYNAMIC_DEBUG_CATEGORIES() described above, and a do-nothing stub.

Note that it also calls MODULE_PARM_DESC for the user, but expects the
user to catenate all the bit-descriptions together (as is done in
drm.debug), and in the following uses in amdgpu, i915.

This in the hope that someone can offer an auto-incrementing
label-generating macro, producing "\tbit-4 0x10\t" etc, and can show
how to apply it to __VA_ARGS__.

Also extern the struct kernel_param param_ops_dyndbg symbol, as is
done in moduleparams.h for all the STANDARD params.

USAGE NOTES:

Using dyndbg to query on "format ^$prefix" requires that the prefix be
present in the compiled-in format string; where run-time prefixing is
used, that format would be "%s...", which is not usefully selectable.

Adding structural query terms (func,file,lineno) could help (module is
already done), but DEFINE_DYNAMIC_DEBUG_CATEGORIES can't do that now,
adding it needs a better reason imo.

Dyndbg is completely agnostic wrt the categorization scheme used, to
play well with any prefix convention already in use.  Ad-hoc
categories and sub-categories are implicitly allowed, author
discipline and review is expected.

Here are some examples:

"1","2","3"		2 doesn't imply 1.
   			otherwize, sorta like printk levels
"1:","2:","3:"		are better, avoiding [1-9]\d+ ambiguity
"hi:","mid:","low:"	are reasonable, and imply independence
"todo:","rfc:","fixme:" might be handy
"A:".."Z:"		uhm, yeah

Hierarchical classes/categories are natural:

"drm:<CAT>:"		is used in later commit
"drm:<CAT>:<SUB>:"	is a natural extension.
"drm:atomic:fail:"	has been proposed, sounds directly useful

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
inserted by a modified FOO().  Doing this would enforce a policy
decision that "debug categories will be space terminated", with an
pressure-relief valve.

Summarizing:

 - "drm:kms: " & "drm:kms:" are different
 - "drm:kms"		also different - includes drm:kms2:
 - "drm:kms:\t"		also different
 - "drm:kms:*"		doesn't work, no wildcard on format atm.

Order matters in DEFINE_DYNAMIC_DEBUG_CATEGORIES(... @bit_descs)

@bit_descs (array) position determines the bit mapping to the prefix,
so to keep a stable map, new categories or 3rd level categories must
be added to the end.

Since bits are/will-stay applied 0-N, the later bits can countermand
the earlier ones, but its tricky - consider;

    DD_CATs(... "drm:atomic:", "drm:atomic:fail:" ) // misleading

The 1st search-term is misleading, because it includes (modifies)
subcategories, but then 2nd overrides it.  So don't do that.

For "drm:atomic:fail:" in particular, its best not to add it into an
existing bitmap, because the current setting would be lost at every
(unrelated) write, and a separate bitmap is much more stable.

There is still plenty of bikeshedding to do.

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
. change ##fsname to ##var for safer varname construct
. workaround for !CONFIG_MODULES
. move forward decl down to where its needed
---
 include/linux/dynamic_debug.h | 52 +++++++++++++++++++++++-
 lib/dynamic_debug.c           | 76 ++++++++++++++++++++++++++++++++---
 2 files changed, 121 insertions(+), 7 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index dce631e678dd..51b7254daee0 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -51,8 +51,6 @@ struct _ddebug {
 #endif
 } __attribute__((aligned(8)));
 
-
-
 #if defined(CONFIG_DYNAMIC_DEBUG_CORE)
 
 /* exported for module authors to exercise >control */
@@ -181,6 +179,10 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 				   KERN_DEBUG, prefix_str, prefix_type,	\
 				   rowsize, groupsize, buf, len, ascii)
 
+struct kernel_param;
+int param_set_dyndbg(const char *instr, const struct kernel_param *kp);
+int param_get_dyndbg(char *buffer, const struct kernel_param *kp);
+
 #else /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
 #include <linux/string.h>
@@ -227,6 +229,52 @@ static inline int dynamic_debug_exec_queries(const char *query, const char *modn
 	return 0;
 }
 
+static inline int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
+	{ return 0; }
+static inline int param_get_dyndbg(char *buffer, const struct kernel_param *kp)
+	{ return 0; }
+
 #endif /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
+struct dyndbg_bitdesc {
+	/* bitpos is inferred from index in containing array */
+	const char *prefix;
+	const char *help;
+};
+
+#if defined(CONFIG_DYNAMIC_DEBUG) || \
+	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
+/**
+ * DEFINE_DYNAMIC_DEBUG_CATEGORIES() - define debug categories, bitmap, sysfs-knob
+ * @fsname: parameter basename under /sys
+ * @var:    C-identifier holding state
+ * @_desc:  string summarizing the controls provided
+ * @...:    list of struct dyndbg_bitdesc initializations
+ *
+ * Defines /sys/modules/$modname/parameters/@fsname, and @bit_descs,
+ * which maps bits 0-N to categories of pr_debugs to be controlled.
+ * This is effectively write only, because controlled callsites can be
+ * further modified via >control.
+ *
+ * Also calls MODULE_PARM_DESC(fsname, _desc), with the intent to
+ * generate the bit_legend and apply it to the given bit_descs
+ */
+#define DEFINE_DYNAMIC_DEBUG_CATEGORIES(fsname, var, _desc, ...)	\
+	MODULE_PARM_DESC(fsname, _desc);				\
+	static const struct dyndbg_bitdesc dyndbg_cats_##var[] =	\
+		{ __VA_ARGS__, { NULL, NULL } };			\
+	module_param_cb_data(fsname, &param_ops_dyndbg, &var, 0644,	\
+			     &dyndbg_cats_##var)
+
+#define _DD_cat_(pfx)		{ .prefix = pfx, .help = "help for " pfx }
+#define _DD_cat_help_(pfx)	"\t   " pfx "\t- help for " pfx "\n"
+
+extern const struct kernel_param_ops param_ops_dyndbg;
+#else
+#define DEFINE_DYNAMIC_DEBUG_CATEGORIES(fsname, var, bitmap_desc, ...) \
+	MODULE_PARM_DESC(fsname, "auto: " bitmap_desc)
+#define _DD_cat_(pfx)
+#define _DD_cat_help_(pfx)
+#endif
+
 #endif
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index cb5abb42c16a..a43427c67c3f 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -511,10 +511,11 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 	return nfound;
 }
 
-/* handle multiple queries in query string, continue on error, return
-   last error or number of matching callsites.  Module name is either
-   in param (for boot arg) or perhaps in query string.
-*/
+/*
+ * handle multiple queries in query string, continue on error, return
+ * last error or number of matching callsites.  Module name is either
+ * in param (for boot arg) or perhaps in query string.
+ */
 static int ddebug_exec_queries(char *query, const char *modname)
 {
 	char *split;
@@ -529,7 +530,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		if (!query || !*query || *query == '#')
 			continue;
 
-		vpr_info("query %d: \"%s\"\n", i, query);
+		vpr_info("query %d: \"%s\" %s\n", i, query, (modname) ? modname : "");
 
 		rc = ddebug_exec_query(query, modname);
 		if (rc < 0) {
@@ -577,6 +578,71 @@ int dynamic_debug_exec_queries(const char *query, const char *modname)
 }
 EXPORT_SYMBOL_GPL(dynamic_debug_exec_queries);
 
+#ifdef MODULES
+#define KP_MOD_NAME kp->mod->name
+#else
+#define KP_MOD_NAME NULL /* wildcard */
+#endif
+#define FMT_QUERY_SIZE 128 /* typically need <40 */
+/**
+ * param_set_dyndbg() - drm.debug style bits=>categories setter
+ * @instr: string echo>d to sysfs
+ * @kp:    struct kernel_param* ->data has bitmap
+ * Exported to support DEFINE_DYNAMIC_DEBUG_CATEGORIES
+ */
+int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
+{
+	unsigned long inbits;
+	int rc, i, matches = 0, totct = 0;
+	char query[FMT_QUERY_SIZE];
+	const struct dyndbg_bitdesc *bitmap = kp->data;
+
+	if (!bitmap) {
+		pr_err("set_dyndbg: no bits=>queries map\n");
+		return -EINVAL;
+	}
+	rc = kstrtoul(instr, 0, &inbits);
+	if (rc) {
+		pr_err("set_dyndbg: failed\n");
+		return rc;
+	}
+	vpr_info("set_dyndbg: input 0x%lx\n", inbits);
+
+	for (i = 0; bitmap->prefix; i++, bitmap++) {
+		snprintf(query, FMT_QUERY_SIZE, "format '^%s' %cp", bitmap->prefix,
+			 test_bit(i, &inbits) ? '+' : '-');
+
+		matches = ddebug_exec_queries(query, KP_MOD_NAME);
+
+		v2pr_info("bit-%d: %d matches on '%s'\n", i, matches, query);
+		totct += matches;
+	}
+	vpr_info("total matches: %d\n", totct);
+	return 0;
+}
+EXPORT_SYMBOL(param_set_dyndbg);
+
+/**
+ * param_get_dyndbg() - drm.debug style bitmap to format-prefix categories
+ * @buffer: string returned to user via sysfs
+ * @kp:     struct kernel_param*
+ * Exported to provide required .get interface, not useful.
+ * pr_debugs may be altered after .set via `echo $foo >control`
+ */
+int param_get_dyndbg(char *buffer, const struct kernel_param *kp)
+{
+	return scnprintf(buffer, PAGE_SIZE, "%u\n",
+			 *((unsigned int *)kp->arg));
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

