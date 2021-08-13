Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4953EB795
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 17:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BE06E861;
	Fri, 13 Aug 2021 15:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03096E858;
 Fri, 13 Aug 2021 15:19:06 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id r6so10151147ilt.13;
 Fri, 13 Aug 2021 08:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yKE/DnB6ot6PeuK3SnkRlX364oRS4ReVzqSKgo+0MdA=;
 b=kocPJO0M+ozerMliXarKE0vTYfJan7ogOB0QZdeEmatDNM/aoEbZYi6branaELXBZU
 wsvxPlgJzhPm3a9fE0JCZ1G4enk6guUz9ML5jZLsXixkw9p7wiuVhe01xdCSxZMqn+aO
 wJ8XAGK3RCKGmnyfcEt4pTdAtBKvcPthERC0rQ5gRn1KNqsMUml9g78I8D5Wr6GGXO7I
 K+aCkAgEHefhFjhRCnVdiSyfp/vkpOCsDk96nWlqrECmQriXDqamQsU58dUeIENetNY/
 RNU7hG19lyNkonmNrsTAWbijC/PSGIHOfV0BywL+R+NGd7wVUVmAzkHhgxFOVRkxqAKX
 8iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yKE/DnB6ot6PeuK3SnkRlX364oRS4ReVzqSKgo+0MdA=;
 b=pKZO5ZbQ4qQe4pFWQlOaLnXbxuhgjUcI9Y/GOgaZwxJwlBLSrFF0bCBpj74rTmQuQy
 a6sPzu1cEhlY9g8zwCHBX+lp4WSK0Be/2y1tX64ucYv7KF3v0M+K8UhcERfzVyofSHnS
 mfJtJqimUCEJoS0RBn2VCWPM/0oegwYNMaQbrHLtspu4+B58W9pZ9NU2MpWHVeyf/h3l
 RkjAAFjk4qI1h160gPZMaCsTqw64fno7iz3bYldqFGqGxJhjzO3PMUZjk2rYjjUGrk6H
 w00jevLYbwci5pZhcnTsqDIHPTXrvtBJwH8KuelnOsOgsUaZIy4tg0NpmdpsafluZYGl
 Cp/w==
X-Gm-Message-State: AOAM532JpTJP1hWc+CbK8ULN3yYiNrG9xp1WyOVdXNH1n8Nk913RzhA0
 kb0RRxRaCLBQ/RnVKpgPx7g=
X-Google-Smtp-Source: ABdhPJyj96S76u38n1uwGHQFVlubvf9Yera8ntOkhKO2uftKmZEdQtooOZ/4OU/inm1rtWqiBaPbEA==
X-Received: by 2002:a92:de07:: with SMTP id x7mr1966400ilm.293.1628867945968; 
 Fri, 13 Aug 2021 08:19:05 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id d4sm921145ilo.29.2021.08.13.08.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 08:19:05 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org, seanpaul@chromium.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Baron <jbaron@akamai.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Huang Rui <ray.huang@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Chengming Gui <Jack.Gui@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 John Clements <john.clements@amd.com>, Jim Cromie <jim.cromie@gmail.com>,
 Ashley Thomas <Ashley.Thomas2@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Wyatt Wood <Wyatt.Wood@amd.com>, Johan Hovold <johan@kernel.org>,
 Jessica Yu <jeyu@kernel.org>, Joe Perches <joe@perches.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Nick Desaulniers <ndesaulniers@gooogle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vitor Massaru Iha <vitor@massaru.org>, Sedat Dilek <sedat.dilek@gmail.com>,
 Changbin Du <changbin.du@intel.com>, Marco Elver <elver@google.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Alexander Potapenko <glider@google.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Albert van der Linde <alinde@google.com>,
 Johannes Berg <johannes.berg@intel.com>,
 Arvind Sankar <nivedita@alum.mit.edu>,
 Patricia Alfonso <trishalfonso@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Andrey Konovalov <andreyknvl@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 3/9] dyndbg: add DEFINE_DYNAMIC_DEBUG_CATEGORIES and
 callbacks
Date: Fri, 13 Aug 2021 09:17:11 -0600
Message-Id: <20210813151734.1236324-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210813151734.1236324-1-jim.cromie@gmail.com>
References: <20210813151734.1236324-1-jim.cromie@gmail.com>
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

"1","2","3"		2 doesnt imply 1.
   			otherwize, sorta like printk levels
"1:","2:","3:"		are better, avoiding [1-9]\d+ ambiguity
"hi:","mid:","low:"	are reasonable, and imply independence
"todo:","rfc:"		might be handy
"A:".."Z:"		uhm, yeah

Hierarchical classes/categories are natural:

"drm:<CAT>:"		is used in later commit
"drm:<CAT>:<SUB>:"	is a natural extension.
"drm:atomic:fail:"	has been proposed, sounds directly useful

Some properties of a hierarchical category deserve explication:

Trailing spaces matter !

With 1..3-space ("drm: ", "drm:atomic: ", "drm:atomic:fail: "), the
":" doesnt terminate the search-space, the trailing space does.
So a "drm:" search specification will match all DRM categories &
subcategories, and will not be useful in an interface where all
categories are controlled together.  That said, "drm:atomic:" &
"drm:atomic: " are different, and both are useful in cases.

Ad-Hoc sub-categories:

These have a caveat wrt wrapper macros adding prefixes like
"drm:atomic: "; the trailing space in the prefix means that
drm_dbg("fail: ...") renders as "drm:atomic: fail: ", which obviously
isn't ideal wrt clear and simple bitmaps.

A possible solution is to have a FOO_() version of every FOO() macro
which (anti-mnemonically) elides the trailing space, which is normally
inserted by a modified FOO().  Doing this would enforce a policy
decision that "debug categories will be space terminated", with an
pressure-relief valve.

Summarizing:

 - "drm:kms: " & "drm:kms:" are different
 - "drm:kms"		also different - includes drm:kms2:
 - "drm:kms:\t"		also different
 - "drm:kms:*"		doesnt work, no wildcard on format atm.

Order matters in DEFINE_DYNAMIC_DEBUG_CATEGORIES(... @bit_descs)

@bit_descs (array) position determines the bit mapping to the prefix,
so to keep a stable map, new categories or 3rd level categories must
be added to the end.

Since bits are/will-stay applied 0-N, the later bits can countermand
the earlier ones, but its tricky - consider;

    DD_CATs(... "drm:atomic:", ""drm:atomic:fail:" ) // misleading

The 1st search-term is misleading, because it includes (modifies)
subcategories, but then 2nd overrides it.  So don't do that.

There is still plenty of bikeshedding to do.

---
v4+:

. rename to DEFINE_DYNAMIC_DEBUG_CATEGORIES from DEFINE_DYNDBG_BITMAP
. in query, replace hardcoded "i915" w kp->mod->name
. static inline the stubs
. const *str in structs, const array. -Emil
. dyndbg: add do-nothing DEFINE_DYNAMIC_DEBUG_CATEGORIES if !DD_CORE
. call MOD_PARM_DESC(name, "$desc") for users
. simplify callback, remove bit-change detection
. config errs reported by <lkp@intel.com>

ddh-helpers

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 50 ++++++++++++++++++++++++++++
 lib/dynamic_debug.c           | 62 ++++++++++++++++++++++++++++++++++-
 2 files changed, 111 insertions(+), 1 deletion(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index dce631e678dd..42cfb37d4870 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -52,6 +52,7 @@ struct _ddebug {
 } __attribute__((aligned(8)));
 
 
+struct kernel_param;
 
 #if defined(CONFIG_DYNAMIC_DEBUG_CORE)
 
@@ -181,6 +182,9 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 				   KERN_DEBUG, prefix_str, prefix_type,	\
 				   rowsize, groupsize, buf, len, ascii)
 
+int param_set_dyndbg(const char *instr, const struct kernel_param *kp);
+int param_get_dyndbg(char *buffer, const struct kernel_param *kp);
+
 #else /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
 #include <linux/string.h>
@@ -227,6 +231,52 @@ static inline int dynamic_debug_exec_queries(const char *query, const char *modn
 	return 0;
 }
 
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
+	static struct dyndbg_bitdesc const dyndbg_cats_##fsname[] =	\
+		{ __VA_ARGS__, { NULL, NULL } };			\
+	module_param_cbd(fsname, &param_ops_dyndbg, &var, 0644,		\
+			 &dyndbg_cats_##fsname);
+
+#define _DD_cat_(pfx)		{ .prefix = pfx, .help = "help for " pfx }
+#define _DD_cat_help_(pfx)	"\t   " pfx "\t- help for " pfx "\n"
+
+extern const struct kernel_param_ops param_ops_dyndbg;
+#else
+#define DEFINE_DYNAMIC_DEBUG_CATEGORIES(fsname, var, bitmap_desc, ...) \
+	MODULE_PARM_DESC(fsname, "auto: " bitmap_desc);
+#define _DD_cat_(pfx)
+#define _DD_cat_help_(pfx)
+#endif
+
 #endif
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index cb5abb42c16a..6bc645a663e7 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -529,7 +529,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		if (!query || !*query || *query == '#')
 			continue;
 
-		vpr_info("query %d: \"%s\"\n", i, query);
+		vpr_info("query %d: \"%s\" %s\n", i, query, (modname) ? modname : "");
 
 		rc = ddebug_exec_query(query, modname);
 		if (rc < 0) {
@@ -1154,3 +1154,63 @@ early_initcall(dynamic_debug_init);
 
 /* Debugfs setup must be done later */
 fs_initcall(dynamic_debug_init_control);
+
+#include <linux/moduleparam.h>
+
+#define OUR_QUERY_SIZE 128 /* typically need <40 */
+
+/**
+ * param_set_dyndbg() - drm.debug style bitmap to format-prefix categories
+ * @instr: string echo>d to sysfs
+ * @kp:    struct kernel_param* ->data has bitmap
+ * Exported to support DEFINE_DYNAMIC_DEBUG_CATEGORIES
+ */
+int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
+{
+	unsigned long inbits;
+	int rc, i, chgct = 0, totct = 0;
+	char query[OUR_QUERY_SIZE];
+	struct dyndbg_bitdesc *bitmap = (struct dyndbg_bitdesc *) kp->data;
+
+	rc = kstrtoul(instr, 0, &inbits);
+	if (rc) {
+		pr_err("set_dyndbg: failed\n");
+		return -EINVAL;
+	}
+	vpr_info("set_dyndbg: input 0x%lx\n", inbits);
+
+	for (i = 0; !!bitmap[i].prefix; i++) {
+
+		sprintf(query, "format '^%s' %cp", bitmap[i].prefix,
+			test_bit(i, &inbits) ? '+' : '-');
+
+		chgct = dynamic_debug_exec_queries(query, kp->mod->name);
+
+		v2pr_info("bit-%d: %d changes by '%s'\n", i, chgct, query);
+		totct += chgct;
+	}
+	vpr_info("total changes: %d\n", totct);
+	return 0;
+}
+EXPORT_SYMBOL(param_set_dyndbg);
+
+/**
+ * param_get_dyndbg() - drm.debug style bitmap to format-prefix categories
+ * @buffer: string returned to user via sysfs
+ * @kp:     struct kernel_param*
+ * Exported to support DEFINE_DYNAMIC_DEBUG_CATEGORIES interfaces, not
+ * useful; pr_debugs may be altered after setting via >control
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
-- 
2.31.1

