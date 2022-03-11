Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2544D59D4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 05:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1739710E519;
	Fri, 11 Mar 2022 04:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4A010E497;
 Fri, 11 Mar 2022 04:48:18 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id l13so5212970iln.13;
 Thu, 10 Mar 2022 20:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KzXspZ2sHsVi+5ALCIQ5k/5igVC8NcVQPghR6yPzH8w=;
 b=fY1SIv/XhNKWqCeGlwB2/Bb/aVhHowjDaAiImHJJhYGh8jCyUbgkwIxZ5HQ9njvC0Y
 8NF6Xg2ptMg2eOXxmIPiLf7fEXmH7hhjD6Ak+OJowzsAR8EsWMQdpwU2+IYccDdx7BaQ
 pUcO1/sDz5xRuSAqmqdQNf7eNQJiScZfm/1pv6QCvL/40lckUU1N+LpiZNe/KrQEmt8J
 97RORvSzfccY/dNG6IbULEM8v3pTpkOAZemDyN9IGSM4QxLvCNZcaEwn5Ro3YxW6AY8a
 Fu+/hvmKYdO1XArFnkN62Rd8/yhJU3fsmV9Q4usUJeqT/pTtBo+JvOSrupcaCrJSB+BG
 bAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KzXspZ2sHsVi+5ALCIQ5k/5igVC8NcVQPghR6yPzH8w=;
 b=zEBNYHJOSM/vTVD1lNtyeWYBU6odEC+8A8HJfBHNptpZMXqVf+VSgs+DdL1NfLacob
 DN437tiHScIqV8ubfXUgruPuPc1ecClok6SXJXXX67k2VSxYPVHlnagSV5JhdP6ZB5n2
 eybXRongVLXZG5dH2cIcRZ6JUI5H15JUtBu4FISA7rNO5rdwK+4qa7IenEFS16Xep1sa
 Ld/1ykMw2n2V9gptv2nxl6DLjUqqe4DFXIIQvdDxJkVD6G+x+ViY6/ZKzbKqUk/T+udj
 I3/bk4OOtz7zubgWwykN7mw92dfTrgqoMkuwypBem2VvX4aWX8sCLGvKQhcHrekLLxVA
 BOfA==
X-Gm-Message-State: AOAM532FaTDEUwM+mqhVl6/e9Nf1Tc7WNxCBKLHs4I7DvCt20uXngw2B
 9OC8+2kLPe3vDnLcp6jApJQ=
X-Google-Smtp-Source: ABdhPJygvxVm9dbbN1fsjiunWgAh9jHo5gsGbKbLIDc+K1fRb01o6rwc7qQKPhrRRnes0kv/qGvaow==
X-Received: by 2002:a92:6c08:0:b0:2c6:123f:48c9 with SMTP id
 h8-20020a926c08000000b002c6123f48c9mr6693153ilc.22.1646974097869; 
 Thu, 10 Mar 2022 20:48:17 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::f10e])
 by smtp.googlemail.com with ESMTPSA id
 q9-20020a5edb09000000b00645c7a00cbbsm3529834iop.20.2022.03.10.20.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 20:48:17 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] dyndbg: add DEFINE_DYNAMIC_DEBUG_CLASSBITS macro
Date: Thu, 10 Mar 2022 21:47:54 -0700
Message-Id: <20220311044756.425777-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311044756.425777-1-jim.cromie@gmail.com>
References: <20220311044756.425777-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 linux@rasmusvillemoes.dk, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, amd-gfx@lists.freedesktop.org, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DEFINE_DYNAMIC_DEBUG_CLASSBITS(fsname, var, bitmap_desc, classes..)
allows users to create a drm.debug style (bitmap) sysfs interface, to
control sets of pr_debug's according to their .class_id's

This wraps existing "class" keyword and behavior:

   bash-5.1# echo <<END  > /proc/dynamic_debug/control
   > module drm class 0 +p
   > module drm class 2 +p
   > END

With the macro used (in a client), this is basically equivalent:

   # but this also clears other flags, if theyre set
   echo 0x05 > /sys/module/drm/parameters/debug

To use:

DEFINE_DYNAMIC_DEBUG_CLASSBITS(debug, __drm_debug, "pmfl",
	"drm.debug - bits => categories:",
	/* vector of uint:4 symbols, ala enum drm_debug_category, 15 is EOL */
	DRM_UT_CORE,
	DRM_UT_DRIVER,
	DRM_UT_KMS ... );

The 3rd arg is a string with any of the dyndbg.flags [pmflt_]+
Full exposure of the flags here lets the module author:

- fully customize/take-over the decorations of enabled sites.
  generally leaving decorations to user is preferred.

- aim the debug-stream:
  now printk, later tracefs.
  using both together means more work (p or T, in practice)
  iface doesn't care about new flags added later

- declare 2 separate sysfs-knobs, one each for p, T, if desired.

- decorations are per callsite,
  shared across sysfs-knobs for any controlled classes

To support the macro, the patch adds:

 - int param_set_dyndbg_classbits()
 - int param_get_dyndbg_classbits()
 - struct kernel_param_ops param_ops_dyndbg_classbits

Following the model of kernel/params.c STANDARD_PARAM_DEFS, these are
non-static and exported.

get/set use an augmented kernel_param; the arg refs a new struct
dyndbg_bitmap_param containing:

A- the vector of classes (drm.debug "categories") being controlled

This in-line vector of constants (uint [0-14]) specifies a sequence of
controlling bits (by position, starting at 0) with the values naming
the class_id's mapped to that bit.

A value of _DPRINTK_SITE_UNCLASSED terminates the vector processing by
param_set_dyndbg_classbits(), and is appended by the macro to insure a
defined termination after max 15 classes are applied.

Technically, the vector is a flex-array, but its size is practically
limited to max 15 in length (repeats are pointless).

B- a pointer to the user module's ulong holding the bits/state.

By accessing client's bit-state, we coordinate with existing code
that still uses drm_debug_enabled(), so they work unchanged.
The change to ulong allows use of BIT() etc.

NOTES:

_DPRINTK_SITE_UNCLASSED = 15, ie 2**CLS_BITS-1, deserves special
mention; it already marks all existing pr-debug callsites, only the
new drm.debug callsites are initialized to other (DRM_UT_*) values.

_DPRINTK_SITE_UNCLASSED is used in param_set_dyndbg_classbits() to
limit the range of bits that are processed to what fits in uint:4.
It also terminates the class-id list passed into the macro, so dont
use it halfway through your list of classes-to-control.

param_set_dyndbg_classbits() compares new vs old bits, and only
updates each class on changes.  This maximally preserves the
underlying state, which may have been customized at some point via
`echo $cmd >control`.  So if users really want to know that all
prdbgs are set precisely, they must pre-clear then set.

Identity mapping in (A) is encouraged.  Your vector should exclude 15,
if used, it terminates the list prematurely; any following bit
mappings will be ignored (it is the default/non category).

The whole (A) vector/list passed to the macro is:

- not strictly needed: 0-N bits are scanned, only N is needed in the
  macro interface to do this, not the whole list.

- 0-N list allows juggling the bit->class map
  Identity map is preferred.
  15 terminates list if used. (macro impl does this)

That said, (A) is self-documenting; the explicit list is greppable,
'DRM_UT_*' provides lots of clues.  Further, it could be upgraded,
something like:

  _pick_sym_(DRM_UT_CORE, "mumble something useful about CORE debug")

_pick_sym_(a,b) a		// gives us what we need here
_pick_help_(a,b) #a " : " b	// mod-info fodder

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 50 +++++++++++++++++++++++
 lib/dynamic_debug.c           | 77 +++++++++++++++++++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index d4b48f3cc6e8..e83c4e36ad29 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -209,6 +209,10 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 				   KERN_DEBUG, prefix_str, prefix_type,	\
 				   rowsize, groupsize, buf, len, ascii)
 
+struct kernel_param;
+int param_set_dyndbg_classbits(const char *instr, const struct kernel_param *kp);
+int param_get_dyndbg_classbits(char *buffer, const struct kernel_param *kp);
+
 #else /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
 #include <linux/string.h>
@@ -255,6 +259,52 @@ static inline int dynamic_debug_exec_queries(const char *query, const char *modn
 	return 0;
 }
 
+struct kernel_param;
+static inline int param_set_dyndbg_classbits(const char *instr, const struct kernel_param *kp)
+{ return 0; }
+static inline int param_get_dyndbg_classbits(char *buffer, const struct kernel_param *kp)
+{ return 0; }
+
 #endif /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
+#define FLAGS_LEN 8
+struct dyndbg_classbits_param {
+	unsigned long *bits;		/* ref to shared state */
+	const char flags[FLAGS_LEN];	/* toggle these flags on bit-changes */
+	const int classes[];		/* indexed by bitpos */
+};
+
+#if defined(CONFIG_DYNAMIC_DEBUG) || defined(CONFIG_DYNAMIC_DEBUG_CORE)
+/**
+ * DEFINE_DYNAMIC_DEBUG_CLASSBITS() - bitmap control of classed pr_debugs
+ * @sysname: sysfs-node name
+ * @_var:    C-identifier holding bit-vector (Bits 0-14 are usable)
+ * @_flgs:   string with dyndbg flags: 'p' and/or 'T', and maybe "fmlt" also.
+ * @desc:    string summarizing the controls provided
+ * @classes: vector of callsite.class_id's (uint:4, 15 is reserved)
+ *
+ * This macro implements a DRM.debug API style bitmap, mapping bits
+ * 0-14 to classes of prdbg's, as initialized in their .class_id fields.
+ * @_flgs chooses the debug recipient; p - syslog, T - tracefs, and
+ * can include log decorations; m - module, f - function, l - line_num
+ */
+#define DEFINE_DYNAMIC_DEBUG_CLASSBITS(fsname, _var, _flgs, desc, ...)	\
+	MODULE_PARM_DESC(fsname, desc);					\
+	static struct dyndbg_classbits_param ddcats_##_var = {		\
+		.bits = &(_var),					\
+		.flags = _flgs,						\
+		.classes = { __VA_ARGS__, _DPRINTK_SITE_UNCLASSED }	\
+	};								\
+	module_param_cb(fsname, &param_ops_dyndbg_classbits,		\
+			&ddcats_##_var, 0644)
+
+extern const struct kernel_param_ops param_ops_dyndbg_classbits;
+
+#else /* no dyndbg configured, throw error on macro use */
+
+#define DEFINE_DYNAMIC_DEBUG_CLASSBITS(fsname, var, bitmap_desc, ...)	\
+	BUILD_BUG_ON_MSG(1, "CONFIG_DYNAMIC_DEBUG* needed to use this macro: " #fsname)
+
+#endif
+
 #endif
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index ee2129becacc..704361af5b23 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -611,6 +611,83 @@ int dynamic_debug_exec_queries(const char *query, const char *modname)
 }
 EXPORT_SYMBOL_GPL(dynamic_debug_exec_queries);
 
+#ifdef CONFIG_MODULES
+#define KP_MOD_NAME kp->mod->name
+#else
+#define KP_MOD_NAME NULL /* wildcard */
+#endif
+#define FMT_QUERY_SIZE 128 /* typically need <40 */
+/**
+ * param_set_dyndbg_classbits - bits => categories >control setter
+ * @instr: string echo>d to sysfs
+ * @kp:    kp->arg has state: bits, map
+ *
+ * Enable/disable prdbgs by their "category", as specified in the
+ * DEFINE_DYNAMIC_DEBUG_BITGRPS.classbits argument.
+ *
+ * Returns: 0 or <0 if error.
+ */
+int param_set_dyndbg_classbits(const char *instr, const struct kernel_param *kp)
+{
+	unsigned long inbits;
+	int rc, i, matches = 0, totct = 0;
+	char query[FMT_QUERY_SIZE];
+	const struct dyndbg_classbits_param *dcp = kp->arg;
+
+	if (!dcp) {
+		pr_err("set_dyndbg_classbits: no bits=>queries map\n");
+		return -EINVAL;
+	}
+	rc = kstrtoul(instr, 0, &inbits);
+	if (rc) {
+		pr_err("set_dyndbg_classbits: expecting unsigned int\n");
+		return rc;
+	}
+	vpr_info("set_dyndbg_classbits: new 0x%lx old 0x%lx\n", inbits, *dcp->bits);
+
+	for (i = 0; (i < _DPRINTK_SITE_UNCLASSED &&
+		     dcp->classes[i] < _DPRINTK_SITE_UNCLASSED); i++) {
+
+		if (test_bit(i, &inbits) == test_bit(i, dcp->bits))
+			continue;
+		snprintf(query, FMT_QUERY_SIZE, "class %d %cT",
+			 dcp->classes[i], test_bit(i, &inbits) ? '+' : '-');
+
+		matches = ddebug_exec_queries(query, KP_MOD_NAME);
+
+		v2pr_info("bit-%d: %d matches on class:%u\n", i,
+			  matches, dcp->classes[i]);
+		totct += matches;
+	}
+	*dcp->bits = inbits;
+	vpr_info("total matches: %d\n", totct);
+	return 0;
+}
+EXPORT_SYMBOL(param_set_dyndbg_classbits);
+
+/**
+ * param_get_dyndbg_classbits - classbits reader
+ * @buffer: string description of controlled bits -> classes
+ * @kp:     kp->arg has state: bits, map
+ *
+ * Reads last written bits, underlying prdbg state may have changed since.
+ * Returns: #chars written or <0 on error
+ */
+int param_get_dyndbg_classbits(char *buffer, const struct kernel_param *kp)
+{
+	const struct dyndbg_classbits_param *p = kp->arg;
+	unsigned long val = *p->bits;
+
+	return scnprintf(buffer, PAGE_SIZE, "0x%lx\n", val);
+}
+EXPORT_SYMBOL(param_get_dyndbg_classbits);
+
+const struct kernel_param_ops param_ops_dyndbg_classbits = {
+	.set = param_set_dyndbg_classbits,
+	.get = param_get_dyndbg_classbits,
+};
+EXPORT_SYMBOL(param_ops_dyndbg_classbits);
+
 #define PREFIX_SIZE 64
 
 static int remaining(int wrote)
-- 
2.35.1

