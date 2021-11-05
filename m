Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AECD44692A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 20:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C4B6ECC7;
	Fri,  5 Nov 2021 19:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBBA6E9C1;
 Fri,  5 Nov 2021 19:27:18 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id k1so10497387ilo.7;
 Fri, 05 Nov 2021 12:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n/0tQR5BpJZ9bVE3G8Pw4uEtnqzagR6FF9UWRqR5LUA=;
 b=VFh7kk6rmkbyBEaBBE8EAeYMnYmch+fKseAL9IpypFQ0g7vJ6X2R6+TsGIL+ZLL2rB
 oDySfAbuSAlgQORllpYedIJ6l37vkN+AEmLoE3dGzf/tNkKaqvoy5NWOHPAOyigRJ+07
 v288eAKjslVMlmjFkT1HxTrOjDv3ZG2lDYHlqVNvdJiYGPpCtskCzybJzhsC+sFQkDGx
 u2icpEXHG6rwkpKEUNBNogPevSrrSSHe0Vjz8GQmDdicUoQERl8IoJQ3zfDWbuYvd44u
 /cBf/GdO7FI9bIjpDWQW/9HPismFLL3/oco9vQJ4hjrJciwPFDbjIV8dn2xFzcWCL3Vx
 OsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n/0tQR5BpJZ9bVE3G8Pw4uEtnqzagR6FF9UWRqR5LUA=;
 b=TVNzDGc6rUulIfKULgCLP7iEJRs7GZqCFlDn7ASaZ7RDLjFMrmpa9V40M6fbIUOV5U
 Kbr0NAGzVyPvYdi2Nt8zdkaTCCYDR9f/ycYqiigYaLEzDep2R1k8QxjZ3iJYhSjoFwRJ
 2zTSxdVO1rfVu1nzylLry+ihyqdY/evXAS7zTmIYL9OTtOi46TEKNWzhwLCC1crSKFCQ
 /YeFIT/fhVGOwJtxkVncsmGRwCeGqC/V65CcfSPLG60r+KUTCXNr8LhRWKHpKsB0BfT0
 JCO7oBR4Toopm6rEmTXFEDZn0iB/fUAxGu4CuA0+SfPfgbIxr0TV7ryCKEQt680UZl/Q
 d7+g==
X-Gm-Message-State: AOAM533FkjjYy7ktRW1iY61JoGC8sFDC/0WgnJ3SkhbNC5RdO6xW6MJ0
 lSYLrW3gBtyyEJgDSwklY4o=
X-Google-Smtp-Source: ABdhPJwfGK0MglT2j9BEO5vKoWuD6Zb53HZZCdpEtkHiP7PO8O7I1G/vJUnT9RgtUfIqDcRUqNhTIQ==
X-Received: by 2002:a05:6e02:1aa2:: with SMTP id
 l2mr30625213ilv.114.1636140435346; 
 Fri, 05 Nov 2021 12:27:15 -0700 (PDT)
Received: from samwise.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id l18sm4338617iob.17.2021.11.05.12.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 12:27:14 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, lyude@redhat.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 08/10] dyndbg: add print-to-tracefs, selftest with it - RFC
Date: Fri,  5 Nov 2021 13:26:35 -0600
Message-Id: <20211105192637.2370737-9-jim.cromie@gmail.com>
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

Sean Paul proposed, in:
https://patchwork.freedesktop.org/series/78133/
drm/trace: Mirror DRM debug logs to tracefs

His patchset's objective is to be able to independently steer some of
the drm.debug stream to an alternate tracing destination, by splitting
drm_debug_enabled() into syslog & trace flavors, and enabling them
separately.  2 advantages were identified:

1- syslog is heavyweight, tracefs is much lighter
2- separate selection of enabled categories means less traffic

Dynamic-Debug can do 2nd exceedingly well:

A- all work is behind jump-label's NOOP, zero off cost.
B- exact site selectivity, precisely the useful traffic.
   can tailor enabled set interactively, at shell.

Since the tracefs interface is effective for drm (the threads suggest
so), adding that interface to dynamic-debug has real potential for
everyone including drm.

if CONFIG_TRACING:

Grab Sean's trace_init/cleanup code, use it to provide tracefs
available by default to all pr_debugs.  This will likely need some
further per-module treatment; perhaps something reflecting hierarchy
of module,file,function,line, maybe with a tuned flattening.

endif CONFIG_TRACING

Add a new +T flag to enable tracing, independent of +p, and add and
use 3 macros: dyndbg_site_is_enabled/logging/tracing(), to encapsulate
the flag checks.  Existing code treats T like other flags.

Add ddebug_validate_flags() as last step in ddebug_parse_flags().  Its
only job is to fail on +T for non-CONFIG_TRACING builds.  It only sees
the new flags, and cannot validate specific state transitions.  This
is fine, since we have no need for that; such a test would have to be
done in ddebug_change(), which actually updates the callsites.

ddebug_change() adjusts the static-key-enable/disable condition to use
_DPRINTK_ENABLED / abstraction macros.

dynamic_emit_prefix() now gates on _DPRINTK_ENABLED too, as an
optimization but mostly to allow decluttering of its users.

__dynamic_pr_debug() etal get minor changes:

 - call dynamic_emit_prefix() 1st, _enabled() optimizes.
 - if (T) call trace_array_printk
 - if (!p) go around original printk code.
   done to minimize diff,
   goto-ectomy + reindent later/separately
 - share vaf across p|T

WRT <net|ib>_dev, I skipped all the <T,!!dev> specific dev_emit_prefix
additions for now.  tracefs is a fast customer with different needs,
its not clear that pretty device-ID-ish strings is useful tracefs
content (on ingest), or that couldn't be done more efficiently while
analysing or postprocesing the tracefs buffer.

SELFTEST: test_dynamic_debug.ko:

Uses the tracer facility to implement a kernel module selftest.

TODO:

Earlier core code had (tracerfn)() indirection, allowing a plugin
side-effector we could test the results of.

ATM all the tests which count +T'd callsite executions (and which
expect >0) are failing.

Now it needs a rethink to test from userspace, rather than the current
test-once at module-load.  It needs a parameters/testme button.

So remainder of this is a bit stale ....

- A custom tracer counts the number of calls (of T-enabled pr_debugs),
- do_debugging(x) calls a set of categorized pr_debugs x times

- test registers the tracer on the module
  then iteratively:
  manipulates dyndbg states via query-cmds, mostly format ^prefix
  runs do_debugging()
  counts enabled callsite executions
  reports mismatches

- modprobe test_dynamic_debug use_bad_tracer=1
  attaches a bad/recursive tracer
  Bad Things (did) Happen.
  has thrown me interesting panics.
  cannot replicate atm.

RFC: (DONE)

The "tracer" interface probably needs work and a new name.  It is only
1/2 way towards a real tracefs interface; and the code I lifted from
Sean Paul in the next patch could be implemented in dynamic_debug.c
instead, and made available for all pr_debug users.

This would also eliminate need for dynamic_debug_(un)register_tracer(),
since dyndbg could just provide it when TRACING is on.

NOTES:

$> modprobe test_dynamic_debug dyndbg=+p

   it fails 3/29 tests. havent looked at why.

$> modprobe test_dynamic_debug use_bad_tracer=1

Earlier in dev, bad_tracer() exploded in recursion, I havent been able
to replicate that lately.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       |   7 +-
 MAINTAINERS                                   |   1 +
 include/linux/dynamic_debug.h                 |  12 +-
 lib/Kconfig.debug                             |  11 +
 lib/Makefile                                  |   1 +
 lib/dynamic_debug.c                           | 127 ++++++++--
 lib/test_dynamic_debug.c                      | 222 ++++++++++++++++++
 7 files changed, 355 insertions(+), 26 deletions(-)
 create mode 100644 lib/test_dynamic_debug.c

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index b119b8277b3e..48d32782bb11 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -227,7 +227,8 @@ of the characters::
 
 The flags are::
 
-  p    enables the pr_debug() callsite.
+  p    enables the pr_debug() callsite to syslog
+  T    enables the pr_debug() callsite to tracefs
   f    Include the function name in the printed message
   l    Include line number in the printed message
   m    Include module name in the printed message
@@ -240,8 +241,8 @@ have meaning, other flags ignored.
 For display, the flags are preceded by ``=``
 (mnemonic: what the flags are currently equal to).
 
-Note the regexp ``^[-+=][flmpt_]+$`` matches a flags specification.
-To clear all flags at once, use ``=_`` or ``-flmpt``.
+Note the regexp ``^[-+=][flmptT_]+$`` matches a flags specification.
+To clear all flags at once, use ``=_`` or ``-flmptT``.
 
 
 Debug messages during Boot Process
diff --git a/MAINTAINERS b/MAINTAINERS
index 2c9070aeba2a..ead3332db862 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6615,6 +6615,7 @@ M:	Jason Baron <jbaron@akamai.com>
 S:	Maintained
 F:	include/linux/dynamic_debug.h
 F:	lib/dynamic_debug.c
+F:	lib/test_dynamic_debug.c
 
 DYNAMIC INTERRUPT MODERATION
 M:	Tal Gilboa <talgi@nvidia.com>
diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index a9430168b072..792bcff0297e 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -28,15 +28,25 @@ struct _ddebug {
 	 */
 #define _DPRINTK_FLAGS_NONE	0
 #define _DPRINTK_FLAGS_PRINT	(1<<0) /* printk() a message using the format */
+#define _DPRINTK_FLAGS_TRACE	(1<<5) /* trace_printk() the message */
+#define _DPRINTK_ENABLED	(_DPRINTK_FLAGS_PRINT | _DPRINTK_FLAGS_TRACE)
+
+/* internal, need type protection for external use */
+#define __dyndbg_site_is_enabled(desc) (!!(desc->flags & _DPRINTK_ENABLED))
+#define __dyndbg_site_is_logging(desc) (!!(desc->flags & _DPRINTK_FLAGS_PRINT))
+#define __dyndbg_site_is_tracing(desc) (!!(desc->flags & _DPRINTK_FLAGS_TRACE))
+
 #define _DPRINTK_FLAGS_INCL_MODNAME	(1<<1)
 #define _DPRINTK_FLAGS_INCL_FUNCNAME	(1<<2)
 #define _DPRINTK_FLAGS_INCL_LINENO	(1<<3)
 #define _DPRINTK_FLAGS_INCL_TID		(1<<4)
 
-#define _DPRINTK_FLAGS_INCL_ANY		\
+#define _DPRINTK_FLAGS_INCL_ANY						\
 	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |\
 	 _DPRINTK_FLAGS_INCL_LINENO  | _DPRINTK_FLAGS_INCL_TID)
 
+#define __dyndbg_site_is_decorated(desc) (!!(desc->flags & _DPRINTK_FLAGS_INCL_ANY))
+
 #if defined DEBUG
 #define _DPRINTK_FLAGS_DEFAULT _DPRINTK_FLAGS_PRINT
 #else
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 6fdbf9613aec..cf48a242b3a2 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2480,6 +2480,17 @@ config TEST_STATIC_KEYS
 
 	  If unsure, say N.
 
+config TEST_DYNAMIC_DEBUG
+	tristate "Test DYNAMIC_DEBUG"
+	depends on m
+	depends on DYNAMIC_DEBUG
+	help
+	  This module registers a tracer callback to count enabled
+	  pr_debugs in a 'do_debugging' function, then alters their
+	  enablements, calls the function, and compares counts.
+
+	  If unsure, say N.
+
 config TEST_KMOD
 	tristate "kmod stress tester"
 	depends on m
diff --git a/lib/Makefile b/lib/Makefile
index 364c23f15578..5dd4cb7c02c6 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -82,6 +82,7 @@ obj-$(CONFIG_TEST_SORT) += test_sort.o
 obj-$(CONFIG_TEST_USER_COPY) += test_user_copy.o
 obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_keys.o
 obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_key_base.o
+obj-$(CONFIG_TEST_DYNAMIC_DEBUG) += test_dynamic_debug.o
 obj-$(CONFIG_TEST_PRINTF) += test_printf.o
 obj-$(CONFIG_TEST_SCANF) += test_scanf.o
 obj-$(CONFIG_TEST_BITMAP) += test_bitmap.o
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 71ffa19ae9a5..d6e9c833f5d4 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -36,6 +36,7 @@
 #include <linux/sched.h>
 #include <linux/device.h>
 #include <linux/netdevice.h>
+#include <linux/trace.h>
 
 #include <rdma/ib_verbs.h>
 
@@ -72,6 +73,7 @@ static LIST_HEAD(ddebug_tables);
 static int verbose;
 module_param(verbose, int, 0644);
 
+
 /* Return the path relative to source root */
 static inline const char *trim_prefix(const char *path)
 {
@@ -85,6 +87,7 @@ static inline const char *trim_prefix(const char *path)
 
 static struct { unsigned flag:8; char opt_char; } opt_array[] = {
 	{ _DPRINTK_FLAGS_PRINT, 'p' },
+	{ _DPRINTK_FLAGS_TRACE, 'T' },
 	{ _DPRINTK_FLAGS_INCL_MODNAME, 'm' },
 	{ _DPRINTK_FLAGS_INCL_FUNCNAME, 'f' },
 	{ _DPRINTK_FLAGS_INCL_LINENO, 'l' },
@@ -205,11 +208,12 @@ static int ddebug_change(const struct ddebug_query *query,
 			newflags = (dp->flags & modifiers->mask) | modifiers->flags;
 			if (newflags == dp->flags)
 				continue;
+
 #ifdef CONFIG_JUMP_LABEL
-			if (dp->flags & _DPRINTK_FLAGS_PRINT) {
-				if (!(modifiers->flags & _DPRINTK_FLAGS_PRINT))
+			if (__dyndbg_site_is_enabled(dp)) {
+				if (!__dyndbg_site_is_enabled(modifiers))
 					static_branch_disable(&dp->key.dd_key_true);
-			} else if (modifiers->flags & _DPRINTK_FLAGS_PRINT)
+			} else if (__dyndbg_site_is_enabled(modifiers))
 				static_branch_enable(&dp->key.dd_key_true);
 #endif
 			dp->flags = newflags;
@@ -427,6 +431,16 @@ static int ddebug_parse_query(char *words[], int nwords,
 	return 0;
 }
 
+static int ddebug_validate_flags(struct flag_settings *modifiers)
+{
+#if !defined(CONFIG_TRACING)
+	if (__dyndbg_site_is_tracing(modifiers)) {
+		WARN_ONCE(1, "cannot enable T, CONFIG_TRACE=n\n");
+		return -EINVAL;
+	}
+#endif
+	return 0;
+}
 /*
  * Parse `str' as a flags specification, format [-+=][p]+.
  * Sets up *maskp and *flagsp to be used when changing the
@@ -479,7 +493,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 	}
 	vpr_info("*flagsp=0x%x *maskp=0x%x\n", modifiers->flags, modifiers->mask);
 
-	return 0;
+	return ddebug_validate_flags(modifiers);
 }
 
 static int ddebug_exec_query(char *query_string, const char *modname)
@@ -694,11 +708,24 @@ static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
 
 static inline char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
 {
-	if (unlikely(desc->flags & _DPRINTK_FLAGS_INCL_ANY))
+	if (unlikely(__dyndbg_site_is_enabled(desc) &&
+		     __dyndbg_site_is_decorated(desc)))
 		return __dynamic_emit_prefix(desc, buf);
 	return buf;
 }
 
+static struct trace_array *trace_arr;
+
+#if !defined(CONFIG_TRACING)
+/* private stub for 4 users below */
+static inline int __printf(3, 0)
+	trace_array_printk(struct trace_array *tr, unsigned long ip,
+			   const char *fmt, ...)
+{
+	return 0;
+}
+#endif
+
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
 {
 	va_list args;
@@ -713,7 +740,13 @@ void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
-	printk(KERN_DEBUG "%s%pV", dynamic_emit_prefix(descriptor, buf), &vaf);
+	dynamic_emit_prefix(descriptor, buf);
+
+	if (__dyndbg_site_is_tracing(descriptor))
+		trace_array_printk(trace_arr, _THIS_IP_, "%s%pV", buf, &vaf);
+
+	if (__dyndbg_site_is_logging(descriptor))
+		printk(KERN_DEBUG "%s%pV", buf, &vaf);
 
 	va_end(args);
 }
@@ -724,6 +757,7 @@ void __dynamic_dev_dbg(struct _ddebug *descriptor,
 {
 	struct va_format vaf;
 	va_list args;
+	char buf[PREFIX_SIZE] = "";
 
 	BUG_ON(!descriptor);
 	BUG_ON(!fmt);
@@ -733,17 +767,21 @@ void __dynamic_dev_dbg(struct _ddebug *descriptor,
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
+	dynamic_emit_prefix(descriptor, buf);
+
+	if (__dyndbg_site_is_tracing(descriptor))
+		trace_array_printk(trace_arr, _THIS_IP_, "%s%pV", buf, &vaf);
+
+	if (!__dyndbg_site_is_logging(descriptor))
+		goto out;
+
 	if (!dev) {
 		printk(KERN_DEBUG "(NULL device *): %pV", &vaf);
 	} else {
-		char buf[PREFIX_SIZE] = "";
-
 		dev_printk_emit(LOGLEVEL_DEBUG, dev, "%s%s %s: %pV",
-				dynamic_emit_prefix(descriptor, buf),
-				dev_driver_string(dev), dev_name(dev),
-				&vaf);
+				buf, dev_driver_string(dev), dev_name(dev), &vaf);
 	}
-
+out:
 	va_end(args);
 }
 EXPORT_SYMBOL(__dynamic_dev_dbg);
@@ -755,6 +793,7 @@ void __dynamic_netdev_dbg(struct _ddebug *descriptor,
 {
 	struct va_format vaf;
 	va_list args;
+	char buf[PREFIX_SIZE] = "";
 
 	BUG_ON(!descriptor);
 	BUG_ON(!fmt);
@@ -764,12 +803,17 @@ void __dynamic_netdev_dbg(struct _ddebug *descriptor,
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
-	if (dev && dev->dev.parent) {
-		char buf[PREFIX_SIZE] = "";
+	dynamic_emit_prefix(descriptor, buf);
+
+	if (__dyndbg_site_is_tracing(descriptor))
+		trace_array_printk(trace_arr, _THIS_IP_, "%s%pV", buf, &vaf);
 
+	if (!__dyndbg_site_is_logging(descriptor))
+		goto out;
+
+	if (dev && dev->dev.parent) {
 		dev_printk_emit(LOGLEVEL_DEBUG, dev->dev.parent,
-				"%s%s %s %s%s: %pV",
-				dynamic_emit_prefix(descriptor, buf),
+				"%s%s %s %s%s: %pV", buf,
 				dev_driver_string(dev->dev.parent),
 				dev_name(dev->dev.parent),
 				netdev_name(dev), netdev_reg_state(dev),
@@ -780,7 +824,7 @@ void __dynamic_netdev_dbg(struct _ddebug *descriptor,
 	} else {
 		printk(KERN_DEBUG "(NULL net_device): %pV", &vaf);
 	}
-
+out:
 	va_end(args);
 }
 EXPORT_SYMBOL(__dynamic_netdev_dbg);
@@ -794,18 +838,24 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 {
 	struct va_format vaf;
 	va_list args;
+	char buf[PREFIX_SIZE] = "";
 
 	va_start(args, fmt);
 
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
-	if (ibdev && ibdev->dev.parent) {
-		char buf[PREFIX_SIZE] = "";
+	dynamic_emit_prefix(descriptor, buf);
+
+	if (__dyndbg_site_is_tracing(descriptor))
+		trace_array_printk(trace_arr, _THIS_IP_, "%s%pV", buf, &vaf);
+
+	if (!__dyndbg_site_is_logging(descriptor))
+		goto out;
 
+	if (ibdev && ibdev->dev.parent) {
 		dev_printk_emit(LOGLEVEL_DEBUG, ibdev->dev.parent,
-				"%s%s %s %s: %pV",
-				dynamic_emit_prefix(descriptor, buf),
+				"%s%s %s %s: %pV", buf,
 				dev_driver_string(ibdev->dev.parent),
 				dev_name(ibdev->dev.parent),
 				dev_name(&ibdev->dev),
@@ -815,7 +865,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 	} else {
 		printk(KERN_DEBUG "(NULL ib_device): %pV", &vaf);
 	}
-
+out:
 	va_end(args);
 }
 EXPORT_SYMBOL(__dynamic_ibdev_dbg);
@@ -1130,6 +1180,35 @@ static void ddebug_remove_all_tables(void)
 	mutex_unlock(&ddebug_lock);
 }
 
+#if defined(CONFIG_TRACING)
+
+static void ddebug_trace_cleanup(void)
+{
+	if (trace_arr) {
+		trace_array_put(trace_arr);
+		trace_array_destroy(trace_arr);
+		trace_arr = NULL;
+	}
+}
+
+static void ddebug_trace_init(void)
+{
+	int ret;
+
+	trace_arr = trace_array_get_by_name("dyndbg-tracefs");
+	if (!trace_arr)
+		return;
+
+	ret = trace_array_init_printk(trace_arr);
+	if (ret)
+		ddebug_trace_cleanup();
+}
+
+#else
+static inline void ddebug_trace_init(void) {}
+static inline void ddebug_trace_cleanup(void) {}
+#endif
+
 static __initdata int ddebug_init_success;
 
 static int __init dynamic_debug_init_control(void)
@@ -1172,6 +1251,9 @@ static int __init dynamic_debug_init(void)
 		ddebug_init_success = 1;
 		return 0;
 	}
+
+	ddebug_trace_init();
+
 	iter = __start___dyndbg;
 	modname = iter->modname;
 	iter_start = iter;
@@ -1223,6 +1305,7 @@ static int __init dynamic_debug_init(void)
 
 out_err:
 	ddebug_remove_all_tables();
+	ddebug_trace_cleanup();
 	return 0;
 }
 /* Allow early initialization for boot messages via boot param */
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
new file mode 100644
index 000000000000..dd41a09fd9c8
--- /dev/null
+++ b/lib/test_dynamic_debug.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Kernel module for testing dynamic_debug
+ *
+ * Authors:
+ *      Jim Cromie	<jim.cromie@gmail.com>
+ */
+
+/*
+ * test-setup: use trace_print attachment interface as a test harness,
+ * define a custom trace_printer which counts invocations, and a
+ * pr_debug event generator function which calls a set of categorized
+ * pr_debugs.
+ * test-run: manipulate the pr_debug's enablement, run the event
+ * generator, and check for the expected side effects.
+ */
+
+#define pr_fmt(fmt) "test_dd: " fmt
+
+#include <linux/module.h>
+
+static int hit_ct;
+static int test_ct;
+static int errors;
+
+static int __verbose;
+module_param_named(verbose, __verbose, int, 0444);
+MODULE_PARM_DESC(verbose, "enable print from trace (output verify)");
+
+static int __bad_tracer;
+module_param_named(use_bad_tracer, __bad_tracer, int, 0444);
+MODULE_PARM_DESC(use_bad_tracer,
+		 "use broken tracer, recursing with pr_debug\n"
+		 "\tonly works at modprobe time\n");
+
+static void (*my_tracer)(const char *lbl, struct va_format *vaf);
+
+static void good_tracer(const char *lbl, struct va_format *vaf)
+{
+	hit_ct++;
+
+	if (__verbose)
+		pr_notice("%s%pV", lbl, vaf);
+}
+
+static void bad_tracer(const char *lbl, struct va_format *vaf)
+{
+	hit_ct++;
+	if (__verbose)
+		pr_notice("%s%pV", lbl, vaf);
+
+	pr_debug("%s.%pV", lbl, vaf);
+}
+
+static void pick_tracer(void)
+{
+	if (__bad_tracer) {
+		pr_notice("using bad tracer - fails hit count tests\n");
+		my_tracer = bad_tracer;
+	} else
+		my_tracer = good_tracer;
+}
+
+static int expect_count(int want, const char *story)
+{
+	test_ct++;
+	if (want != hit_ct) {
+		pr_err("nok %d: want %d, got %d: %s\n", test_ct, want, hit_ct, story);
+		errors++;
+		hit_ct = 0;
+		return 1;
+	}
+	pr_info("ok %d: hits %d, on <%s>\n", test_ct, want, story);
+	hit_ct = 0;
+	return 0;
+}
+
+/* call pr_debug (4 * reps) + 2 times, for tracer side-effects */
+static void do_debugging(int reps)
+{
+	int i;
+
+	pr_debug("Entry:\n");
+	pr_info("%s %d time(s)\n", __func__, reps);
+	for (i = 0; i < reps; i++) {
+		pr_debug("hi: %d\n", i);
+		pr_debug("mid: %d\n", i);
+		pr_debug("low: %d\n", i);
+		pr_debug("low:lower: %d subcategory test\n", i);
+	}
+	pr_debug("Exit:\n");
+}
+
+static void expect_matches(int want, int got, const char *story)
+{
+	/* todo: got <0 are errors, bubbled up. no test for that */
+	test_ct++;
+	if (got != want) {
+		pr_warn("nok %d: want %d matches, got %d on <%s>\n", test_ct, want, got, story);
+		errors++;
+	} else
+		pr_info("ok %d: %d matches on <%s>\n", test_ct, want, story);
+}
+
+static int report(char *who)
+{
+	if (errors)
+		pr_err("%s failed %d of %d tests\n", who, errors, test_ct);
+	else
+		pr_info("%s passed %d tests\n", who, test_ct);
+	return errors;
+}
+
+struct exec_test {
+	int matches;
+	int loops;
+	int hits;
+	const char *mod;
+	const char *qry;
+};
+
+static void do_exec_test(struct exec_test *tst)
+{
+	int match_count;
+
+	match_count = dynamic_debug_exec_queries(tst->qry, tst->mod);
+	expect_matches(tst->matches, match_count, tst->qry);
+	do_debugging(tst->loops);
+	expect_count(tst->hits, tst->qry);
+}
+
+/* these tests rely on register stuff having been done ?? */
+struct exec_test exec_tests[] = {
+	/*
+	 * use original single string query style once, to test it.
+	 * standard use is with separate module param, like:
+	 * dynamic_debug_exec_queries("func do_debugging +_", "test_dynamic_debug");
+	 */
+	{ 6, 1, 0, NULL, "module test_dynamic_debug func do_debugging -T" },
+
+	/* no modification probe */
+	{ 6, 3, 0, KBUILD_MODNAME, "func do_debugging +_" },
+
+	/* enable all prdbgs in DUT */
+	{ 6, 4, 18, KBUILD_MODNAME, "func do_debugging +T" },
+
+	/* disable hi call */
+	{ 1, 4, 14, KBUILD_MODNAME, "format '^hi:' -T" },
+
+	/* disable mid call */
+	{ 1, 4, 10, KBUILD_MODNAME, "format '^mid:' -T" },
+
+	/* repeat same disable */
+	{ 1, 4, 10, KBUILD_MODNAME, "format '^mid:' -T" },
+
+	/* repeat same disable, diff run ct */
+	{ 1, 5, 12, KBUILD_MODNAME, "format '^mid:' -T" },
+
+	/* include subclass */
+	{ 2, 4, 2, KBUILD_MODNAME, "format '^low:' -T" },
+
+	/* re-disable, exclude subclass */
+	{ 1, 4, 2, KBUILD_MODNAME, "format '^low: ' -T" },
+
+	/* enable, exclude subclass */
+	{ 1, 4, 6, KBUILD_MODNAME, "format '^low: ' +T" },
+
+	/* enable the subclass */
+	{ 1, 4, 10, KBUILD_MODNAME, "format '^low:lower:' +T" },
+
+	/* enable the subclass */
+	{ 1, 6, 14, KBUILD_MODNAME, "format '^low:lower:' +T" },
+};
+
+static int __init test_dynamic_debug_init(void)
+{
+	int i;
+
+	pick_tracer();
+
+	pr_debug("Entry:\n");
+	do_debugging(1);
+	expect_count(0, "nothing on");
+
+	//dynamic_debug_register_tracer(THIS_MODULE, my_tracer);
+	/* 2nd time gets a complaint */
+	//dynamic_debug_register_tracer(THIS_MODULE, my_tracer);
+
+	for (i = 0; i < ARRAY_SIZE(exec_tests); i++)
+		do_exec_test(&exec_tests[i]);
+
+	//dynamic_debug_unregister_tracer(THIS_MODULE, my_tracer);
+
+	/* this gets missing tracer warnings, cuz +T is still on */
+	do_debugging(1);
+	expect_count(0, "unregistered, but +T still on");
+
+	/* reuse test 0 to turn off T */
+	do_exec_test(&exec_tests[0]);
+
+	/* this draws warning about failed deregistration */
+	//dynamic_debug_unregister_tracer(THIS_MODULE, my_tracer);
+
+	do_debugging(1);
+	expect_count(0, "all off");
+
+	report("init");
+	pr_debug("Exit:\n");
+	return 0;
+}
+
+static void __exit test_dynamic_debug_exit(void)
+{
+	report("exit");
+	pr_debug("Exit:");
+}
+
+module_init(test_dynamic_debug_init);
+module_exit(test_dynamic_debug_exit);
+
+MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.31.1

