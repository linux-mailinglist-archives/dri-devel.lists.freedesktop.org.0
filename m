Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A193E4468FD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 20:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6327E6E44C;
	Fri,  5 Nov 2021 19:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A746E212;
 Fri,  5 Nov 2021 19:27:01 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id l19so10581937ilk.0;
 Fri, 05 Nov 2021 12:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SjCJ58CQyiSWMKlHWlIbt6nS/T4m+0AeKl7pMTS7/yU=;
 b=LiRRzv3W8bfSmNfjPs/hpq2YOdfxd8dKLZBDFLJKEUgB1NJNzEvuwsbKIpKvWUZ/4s
 K18vn7jG83a5s7S581l5jIZm8FqsuBqT29tHrjUjXY7V9H3LW5ewYL//nOjInNs6O3yw
 Hb+AEB/nlD8glXs3moe16VmWtdb+Y7yFFDJEFQCbMwvGzaQTsTWtiF35wZQGKh5S+xUp
 xeseOaIOjs95cCbthOtG1348dd7AnaCHyeqAO934taM/cgpVZ2C/4zaZBsI55fpv7n7n
 JvdJtq2pB6SQfmXxI+xuJplihw6UgP5V3MNIEwp2/PLnREE+37UE32zFplAMLh3RYjvS
 iGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SjCJ58CQyiSWMKlHWlIbt6nS/T4m+0AeKl7pMTS7/yU=;
 b=gPhKtBILbTAwRCH6l/CkZQkA4RORr6dogF6bK20hWXIT2mSngDcEV+IfrWukeg8Rgu
 Z8GSMUP862KcTyOvfVBNA22ktWrYPItW7kE30o0ExaWiFCarwbZsyp8bEELysyhmWAZi
 jLNXSosK4i6bplIo6+uAzKo2XWk/4CII2iWnda2LIOtrLbVFP6kWU6rMh0Qg25enZIzP
 dtvc0G0kMQAfFCO6cP4h9d8Z4S9E3haGMH6gOxo5T0uZe1XxuEB0eL/dmngaQcczsDMR
 KJGbgNN2QPCurPsFCOG6JWiw+8g0Bu/d/0TPooKbrylwyZQu/nzrqQNBhmo8JYUqWYf1
 W38A==
X-Gm-Message-State: AOAM5333MpXO78RBc8VGDIY9THOlj/Wt+1RUC6whW8glZoaVhX+wMkfy
 iVZudQewCRE87Z9sIreCNTY/7S293G9d0Q==
X-Google-Smtp-Source: ABdhPJwBbx8KV75LtvOrG5jnEaBacWJKn310qQpo1qw2qlBbQcF5Az/N3s+r+QDC4fEg94gNuDG66g==
X-Received: by 2002:a05:6e02:1c4a:: with SMTP id
 d10mr28223278ilg.157.1636140420596; 
 Fri, 05 Nov 2021 12:27:00 -0700 (PDT)
Received: from samwise.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id l18sm4338617iob.17.2021.11.05.12.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 12:27:00 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, lyude@redhat.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 01/10] dyndbg: add DEFINE_DYNAMIC_DEBUG_BITGRPS macro and
 callbacks
Date: Fri,  5 Nov 2021 13:26:28 -0600
Message-Id: <20211105192637.2370737-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105192637.2370737-1-jim.cromie@gmail.com>
References: <20211105192637.2370737-1-jim.cromie@gmail.com>
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
Cc: Jim Cromie <jim.cromie@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DEFINE_DYNAMIC_DEBUG_BITGRPS(fsname, var, bitmap_desc, bitmap)
allows users to create a drm.debug style (bitmap) sysfs interface,
mapping each bit to a group of pr_debugs, matching on their formats.

This works well when the formats systematically include a prefix
string such as ERR|WARN|INFO, etc.

Such groups can (already) be manipulated like so:

    echo "format $prefix +p" >control

This macro merely makes it easier to operate them as groups

/* standard usage */
static struct dyndbg_bitdesc my_bitmap[] = {
	[0] = { "gvt:cmd:" },
	[1] = { "gvt:core:" },
	[2] = { "gvt:dpy:" },
	[3] = { "gvt:el:" },
	[4] = { "gvt:irq:" },
	[5] = { "gvt:mm:" },
	[6] = { "gvt:mmio:" },
	[7] = { "gvt:render:" },
	[8] = { "gvt:sched:" }
};
DEFINE_DYNAMIC_DEBUG_BITGRPS(debug_gvt, __gvt_debug,
			     "i915/gvt bitmap desc", my_bitmap);

In addition to the macro, patch adds:

 - int param_set_dyndbg()
 - int param_get_dyndbg()
 - struct kernel_param_ops param_ops_dyndbg

Following the model of kernel/params.c STANDARD_PARAM_DEFS, these are
non-static and exported.

get/set use an augmented kernel_param; the arg refs a new struct
dyndbg_bitmap_param containing:

A- the map of "categories", an array of struct dyndbg_bitdescs,
   indexed by bitpos, defining the match against pr_debug formats.

B- a pointer to the user module's ulong holding the bits/state.
   By sharing state, we coordinate with code that still uses it
   directly.  This allows drm-debug api to be converted incrementally,
   while still using __drm_debug & drm_debug_enabled() in other parts.

param_set_dyndbg() compares new vs old bits, and only updates prdbgs
on changes.  This maximally preserves the underlying state, which may
have been customized via later `echo $cmd >control`.  So if a user
really wants to know that all prdbgs are set precisely, they must
pre-clear then set.

dynamic_debug.h:

Add DEFINE_DYNAMIC_DEBUG_BITGRPS() described above, and a stub
throwing a BUILD_BUG (RFC) when used without DYNAMIC_DEBUG support.

Add structs dyndbg_bitdesc, dyndbg_bitmap_param to support the main
macro, and several helper macros wrapping the given categories with
^prefix and ' ' suffix.  This way the callback can be more broadly
used, by using the right helper macro.

Also externs the struct kernel_param param_ops_dyndbg symbol, as is
done in moduleparams.h for all the STANDARD params.

USAGE NOTES:

Using dyndbg to query on "format $str" requires that $str must be
present in the compiled-in format string.  Searching on "%s" does not
define a useful set of callsites.

Using DEFINE_DYNAMIC_DEBUG_CATEGORIES wo support gets a BUILD_BUG.
ISTM there is already action at a declarative distance, nobody needs
mystery as to why the /sysfs thingy didn't appear.

Dyndbg is agnostic wrt the categorization scheme used, in order to
play well with any prefix convention already in use in the codebase.
In fact, "prefix" is not strictly accurate without ^ anchor.

Ad-hoc categories and sub-categories are implicitly allowed, author
discipline and review is expected.

Hierarchical classes/categories are natural:

"^drm:<CAT>:"		is used in a later commit
"^drm:<CAT>:<SUB>:"	is a natural extension.
"^drm:atomic:fail:"	has been proposed, sounds directly useful

RFC: in a real sense we abandon enum strictures here, and lose some
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
Dyndbg already works on these, this patch just allows adding a new
bitmap knob to control them.

Ad-hoc sub-categories are slightly trickier.
  since drm_dbg_atomic("fail: ...") is a macro:
    pr_debug("drm:atomic:" " " format,...) // cpp-paste in a trailing space

We get "drm:atomic: fail:", with that undesirable embedded space;
obviously not ideal wrt clear and simple prefixes.

a possible fix: drm_dbg_atomic_("fail: ..."); // trailing _ for ad-hoc subcat

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

vlatest:
. change /CATEGORIES/BITGRP/, leave former for app use
---
 include/linux/dynamic_debug.h | 54 +++++++++++++++++++++++++
 lib/dynamic_debug.c           | 76 +++++++++++++++++++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index dce631e678dd..a9430168b072 100644
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
@@ -227,6 +231,56 @@ static inline int dynamic_debug_exec_queries(const char *query, const char *modn
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
+	unsigned int maplen;
+	struct dyndbg_bitdesc *map;	/* indexed by bitpos */
+};
+
+#if defined(CONFIG_DYNAMIC_DEBUG) || \
+	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
+/**
+ * DEFINE_DYNAMIC_DEBUG_BITGRPS() - bitmap control of pr_debugs, by format match
+ * @fsname: parameter basename under /sys
+ * @_var:   C-identifier holding bitmap
+ * @desc:   string summarizing the controls provided
+ * @bitmap: C array of struct dyndbg_bitdescs
+ *
+ * Intended for modules with a systematic use of pr_debug prefixes in
+ * the format strings, this allows modules calling pr_debugs to
+ * control them in groups by matching against their formats, and map
+ * them to bits 0-N of a sysfs control point.
+ */
+#define DEFINE_DYNAMIC_DEBUG_BITGRPS(fsname, _var, desc, data)	\
+	MODULE_PARM_DESC(fsname, desc);					\
+	static struct dyndbg_bitmap_param ddcats_##_var =		\
+	{ .bits = &(_var), .map = data,					\
+	  .maplen = ARRAY_SIZE(data) };				\
+	module_param_cb(fsname, &param_ops_dyndbg, &ddcats_##_var, 0644)
+
+extern const struct kernel_param_ops param_ops_dyndbg;
+
+#else /* no dyndbg configured, throw error on macro use */
+
+#if (defined(CONFIG_DYNAMIC_DEBUG_CORE) && !defined(DYNAMIC_DEBUG_MODULE))
+#define DEFINE_DYNAMIC_DEBUG_BITGRPS(fsname, var, bitmap_desc, ...)	\
+	BUILD_BUG_ON_MSG(1, "you need -DDYNAMIC_DEBUG_MODULE in compile")
+#else
+#define DEFINE_DYNAMIC_DEBUG_BITGRPS(fsname, var, bitmap_desc, ...)	\
+	BUILD_BUG_ON_MSG(1, "CONFIG_DYNAMIC_DEBUG needed to use this macro: " #var)
+#endif
+#endif
+
 #endif
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index cb5abb42c16a..71ffa19ae9a5 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -577,6 +577,82 @@ int dynamic_debug_exec_queries(const char *query, const char *modname)
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
+ * Enable/disable prdbgs by their "category", as specified in the
+ * DEFINE_DYNAMIC_DEBUG_BITGRPS.bitmap argument.
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
+	for (i = 0; i < p->maplen && i < BITS_PER_LONG; map++, i++) {
+		if (test_bit(i, &inbits) == test_bit(i, p->bits))
+			continue;
+		snprintf(query, FMT_QUERY_SIZE, "format '%s' %cp", map->match,
+			 test_bit(i, &inbits) ? '+' : '-');
+
+		matches = ddebug_exec_queries(query, KP_MOD_NAME);
+
+		v2pr_info("bit-%d: %d matches on format <%s>\n", i,
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

