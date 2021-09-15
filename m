Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3A940CABD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 18:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D0B6E9AB;
	Wed, 15 Sep 2021 16:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BF66E99D;
 Wed, 15 Sep 2021 16:40:39 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id b7so4276377iob.4;
 Wed, 15 Sep 2021 09:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u25aMngBaY78F52SVc2AsNtjypgGqVj6UQzWAzDxNCQ=;
 b=Th2cFA5vlr3AxgKtzICu4GGuFdsJjrzLfZW0z61PHHTMg+TePP5+A+xjEAVUNYdiqB
 vdlwOIYg3fz7JNUy699BF/kDmvoXB95d7TgK2oCK6QxXXPeusrucYB/4umzn7fZovM19
 ssXYHxn8AO7OSRV3TV21wNqHc5WWTzFtldNEi9aYx+C+Zm6Kl8GH1f9QYQ02I4Mz0Z+q
 XhjTqiv+3bUSmb43wrnM3pIIPMyK8qpm9OAMHWJpMFQEga4S/jzpZQFjnZ7PZGdtjtmM
 RiIskucY3Nflf2Mr3z4KfXWKWEzO/ac9HF4/z2FIHe0OHqHimW1Et//Q3CbmrLHQpkfc
 8UcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u25aMngBaY78F52SVc2AsNtjypgGqVj6UQzWAzDxNCQ=;
 b=DGP1qtJ2PBRDHF2j8w6pEcpPPP+KoKlohetbbqbdfNt63RfpJGjShPS/kFWDoaJvgU
 zGvifxaNI6fVwFMEw8CMu+yvBH+oZdITydeIIKypYd7h+MYJhOqZ+6YotOl5kT/SD4Qd
 oaie+PFKGPTuSKzF72tlrY3CpYMU1oW9YmPDZhazEAaR4PXwKqi3kbbBOBLaePZWuJEc
 jjSzwQb/eBs1QfIHRjYzxRnP1dIZnK5qR6xgwjBpK5/bBRETd8NViZh2QYzGhVRq+0Nn
 KQjwEzItdns/wpEjVXzVHmXtoATN0AM6GqUllh29x2lAinkfQ3dxf7QUYgJhHue5//Nn
 Pesw==
X-Gm-Message-State: AOAM531LToVAWEFzGHCqjVMPFhpjDxlXX5eA3rJ83tn55ijA57Ze9qeV
 0SMF2uanUV9Y9dM42GHDVEk=
X-Google-Smtp-Source: ABdhPJzFFKZ7kshC5/QhsO+ZDERwR9LD1Xu00nOxDTfeX2rfAUmlgpmlqXRuRxLqjGaSRoQj4wn2+w==
X-Received: by 2002:a02:94e4:: with SMTP id x91mr751538jah.99.1631724038926;
 Wed, 15 Sep 2021 09:40:38 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a5sm299540ilf.27.2021.09.15.09.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 09:40:38 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 08/16] dyndbg: add DEFINE_DYNAMIC_DEBUG_CATEGORIES bitmap
 and callbacks
Date: Wed, 15 Sep 2021 10:39:49 -0600
Message-Id: <20210915163957.2949166-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210915163957.2949166-1-jim.cromie@gmail.com>
References: <20210915163957.2949166-1-jim.cromie@gmail.com>
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

DEFINE_DYNAMIC_DEBUG_CATEGORIES(fsname, var, bitmap_desc, @bit_descs)
allows users to create a drm.debug style (bitmap) sysfs interface,
mapping each bit to a pr_debug "category".

Unlike drm, dyndbg has no coding of "category", but it can select a
set of pr_debugs with a substr match on their formats.  Since many
pr_debugs use a system of format prefixes, dyndbg can en/disable those
existing groupings as sets/categories.

the new macro's categories are used like so:

    echo format '^$category ' +/-p >control

DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_gvt, __gvt_debug,
	"i915/gvt bitmap desc",
	/*
	 * map each bit to a category
	 * helper macro adds ^ prefix and ' ' suffix seen above
	 */
	_DD_cat_(0, "gvt:cmd:"),
	_DD_cat_(1, "gvt:core:"),
	_DD_cat_(2, "gvt:dpy:"),
	_DD_cat_(3, "gvt:el:"),
	_DD_cat_(4, "gvt:irq:"),
	_DD_cat_(5, "gvt:mm:"),
	_DD_cat_(6, "gvt:mmio:"),
	_DD_cat_(7, "gvt:render:"),
	_DD_cat_(8, "gvt:sched:"));

 - int param_set_dyndbg()
 - int param_get_dyndbg()
 - struct kernel_param_ops param_ops_dyndbg

Following the model of kernel/params.c STANDARD_PARAM_DEFS, these are
non-static and exported.

get/set use an augmented kernel_param; the arg refs a new struct
dyndbg_bitmap_param containing:

A- the map (array, indexed by bitpos) of "categories" (strings to find
   in prdbg.formats).  These define the set/category of callsites per bit.

B- a pointer to the user's ulong holding the bits/state.
   by sharing state, we coordinate with code that still uses it directly

B allows drm-debug api to be converted incrementally, while still
using __drm_debug & drm_debug_enabled() in other parts.

param_set_dyndbg() compares new vs old bits, and only updates prdbgs
on changes.  This maximally preserves the underlying state, which may
have been customized via later `echo $cmd >control`.  So if a user
really wants to know that all prdbgs are set precisely, they must
pre-clear then set.

dynamic_debug.h:

Add DEFINE_DYNAMIC_DEBUG_CATEGORIES() described above, and a stub
throwing a BUILD_BUG (RFC) when used without DYNAMIC_DEBUG support.

Add structs dyndbg_bitdesc, dyndbg_bitmap_param to support the main
macro, and several helper macros wrapping the given categories with
^prefix and ' ' suffix.  This way the callback can be more broadly
used, by using the right helper macro.

Also externs the struct kernel_param param_ops_dyndbg symbol, as is
done in moduleparams.h for all the STANDARD params.

USAGE NOTES:

Using dyndbg to query on "format ^$prefix" requires that $prefix must be
present in the compiled-in format string.  Searching on "%s" does not
define a useful set of callsites.

Using DEFINE_DYNAMIC_DEBUG_CATEGORIES wo support gets a BUILD_BUG.
ISTM there is already action at a declarative distance, nobody needs
mystery as to why the /sysfs thingy didn't appear.

Dyndbg is completely agnostic wrt the categorization scheme used, in
order to play well with any prefix convention already in use in the
codebase.  Ad-hoc categories and sub-categories are implicitly
allowed, author discipline and review is expected.

In fact, the ^anchor is not required; "format $floating_substr" is the
default meaning.  The _DD_cat_() helper macro adds the ^anchor, and a
trailing space (see below for why).

Here are some examples: (these all need ^anchor to be practical)

"^1","^2","^3"		2 doesn't imply 1.
   			otherwize, sorta like printk levels
"^1:","^2:","^3:"	are better, avoiding [1-9]\d+ ambiguity
"^hi:","^mid:","^low:"	are reasonable, and imply independence
"^todo:","^rfc:"	might be handy
"^A:".."^Z:"		uhm, yeah

Hierarchical classes/categories are natural:

"^drm:<CAT>:"		is used in a later commit
"^drm:<CAT>:<SUB>:"	is a natural extension.
"^drm:atomic:fail:"	has been proposed, sounds directly useful

High density "punctuation" tld classification is possible:
  "^.","^:","^!","^#","^@", etc.

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

Ad-Hoc categories & sub-categories:

Ad-hoc categories are those format-prefixes already in use; both
amdgpu and i915 have numerous (120,~1800) pr_debugs, most of these use
a system, a small set (9,13) of prefixes, to categorize the output.
Dyndbg already works on these, this patch just adds a bitmap knob.

ad-hoc sub-categories are slightly trickier.
If drm_dbg_atomic("fail: ...") is a macro:
    pr_debug("drm:atomic:" " " format,...) // cpp-paste in a trailing space

We get "drm:atomic: fail:", with that undesirable embedded space;
obviously not ideal wrt clear and simple prefixes.

a fix: drm_dbg_atomic_("fail: ..."); // trailing _ for ad-hoc subcat

Summarizing:

 - "drm:kms: " & "drm:kms:" are different
 - "drm:kms"		also different - includes drm:kms2:
 - "drm:kms:\t"		also different - could be troublesome
 - "drm:kms:*"		doesn't work, no wildcard on format atm.

Order matters in DEFINE_DYNAMIC_DEBUG_CATEGORIES(... @bit_descs)

Since bits are/will-stay applied 0-N, the later bits can countermand
the earlier ones, but it is tricky - consider;

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

v8:
. drop help field from dyndbg_bitdesc
. move ^ constraint from callback to helper macro: _DD_cat_
. add other helper macros
---
 include/linux/dynamic_debug.h | 62 ++++++++++++++++++++++++++++
 lib/dynamic_debug.c           | 76 +++++++++++++++++++++++++++++++++++
 2 files changed, 138 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index dce631e678dd..233e3cddf6de 100644
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
@@ -227,6 +231,64 @@ static inline int dynamic_debug_exec_queries(const char *query, const char *modn
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
+	const char *match;	/* search format for this substr */
+};
+
+struct dyndbg_bitmap_param {
+	unsigned long *bits;		/* ref to shared state */
+	struct dyndbg_bitdesc map[];	/* indexed by bitpos */
+};
+
+#if defined(CONFIG_DYNAMIC_DEBUG) || \
+	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
+/**
+ * DEFINE_DYNAMIC_DEBUG_CATEGORIES() - bitmap control of categorized prdbgs
+ * @fsname: parameter basename under /sys
+ * @_var:    C-identifier holding bitmap
+ * @desc:  string summarizing the controls provided
+ * @...:    list of struct dyndbg_bitdesc initializations
+ *
+ * Intended for modules with substantial use of "categorized" prdbgs
+ * (those with some systematic prefix in the format string), this lets
+ * modules using pr_debug to control them in groups according to their
+ * format prefixes, and map them to bits 0-N of a sysfs control point.
+ * Each @... gives the index and prefix map.
+ */
+#define DEFINE_DYNAMIC_DEBUG_CATEGORIES(fsname, _var, desc, ...)	\
+	MODULE_PARM_DESC(fsname, desc);					\
+	static struct dyndbg_bitmap_param ddcats_##_var =		\
+	{ .bits = &(_var), .map = { __VA_ARGS__, { .match = NULL }}};	\
+	module_param_cb(fsname, &param_ops_dyndbg, &ddcats_##_var, 0644)
+
+/* helper macros provide combos of ^prefix and ' ' postfix */
+#define _DD_cat_(N, pfx)	[N] = { .match = "^" pfx " " }
+#define _DD_cats_(N, pfx)	[N] = { .match = "^" pfx }
+#define _DD_subtr_(N, flt)	[N] = { .match = flt }
+
+extern const struct kernel_param_ops param_ops_dyndbg;
+
+#elif (defined(CONFIG_DYNAMIC_DEBUG_CORE) && !defined(DYNAMIC_DEBUG_MODULE))
+
+#define DEFINE_DYNAMIC_DEBUG_CATEGORIES(fsname, var, bitmap_desc, ...)	\
+	BUILD_BUG_ON_MSG(1, "you need -DDYNAMIC_DEBUG_MODULE in compile")
+#define _DD_cat_(pfx)
+#define _DD_cats_(N, pfx)
+#define _DD_subtr_(N, flt)
+#else
+#define DEFINE_DYNAMIC_DEBUG_CATEGORIES(fsname, var, bitmap_desc, ...)	\
+	BUILD_BUG_ON_MSG(1, "CONFIG_DYNAMIC_DEBUG needed to use this macro: " #var)
+#define _DD_cat_(pfx)
+#define _DD_cats_(pfx)
+#define _DD_subtr_(N, flt)
+#endif
+
 #endif
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 356c8231175f..03ef9865fd5d 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -580,6 +580,82 @@ int dynamic_debug_exec_queries(const char *query, const char *modname)
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
+ * Enable/disable prdbgs by their "category", as specified in
+ * DEFINE_DYNAMIC_DEBUG_CATEGORIES arguments.
+ *
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
+		pr_err("set_dyndbg: expecting unsigned int\n");
+		return rc;
+	}
+	vpr_info("set_dyndbg: new 0x%lx old 0x%lx\n", inbits, *p->bits);
+
+	for (i = 0; map->match && i < BITS_PER_LONG; map++, i++) {
+		if (test_bit(i, &inbits) == test_bit(i, p->bits))
+			continue;
+		snprintf(query, FMT_QUERY_SIZE, "format '%s' %cp", map->match,
+			 test_bit(i, &inbits) ? '+' : '-');
+
+		matches = ddebug_exec_queries(query, KP_MOD_NAME);
+
+		v2pr_info("bit-%d: %d matches on format '%s'\n", i,
+			  matches, map->match);
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
+EXPORT_SYMBOL(param_ops_dyndbg);
+
 #define PREFIX_SIZE 64
 
 static int remaining(int wrote)
-- 
2.31.1

