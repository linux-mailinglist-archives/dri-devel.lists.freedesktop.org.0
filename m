Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B89403F4221
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 00:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A0F89FA9;
	Sun, 22 Aug 2021 22:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4ACC89EA3;
 Sun, 22 Aug 2021 22:20:58 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 x9-20020a056830278900b0051b8be1192fso10541714otu.7; 
 Sun, 22 Aug 2021 15:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VYVQy6m4spgyAy47lswjXm32T/lBY5R7toaPgMGuuEE=;
 b=Lbsy7HQJ+YPCz5rK+/1Fje/UedQ8mZi+1VFEO5dyj1i2LRhB45lBGWKkyjQFhGu8Xe
 aAKnYkOj23l51olJyb2qVVuOnK897gHIzcCnOpQCH4cBk5vpFjmNPPYc3BO9Oo4kMnFF
 7SGss8bsJPl0MkCGL6/MJ/83VFNuw6qftG3b+nKcCoNzpqUvDwKtyakZ5SuXGia+QxfC
 wgUkTgRDJHhXWfwkISZ7mSYnYispzpSQ4DYEPYkBDMTTlPn1K7srI9/NElZyGmIKHT4D
 CWmh53WrqdaqLw2PUzb1l1Us3bPw/W8gcLzAjXtlBXOwgMWCWo2fZ97BPbbC0mmIVat0
 qysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VYVQy6m4spgyAy47lswjXm32T/lBY5R7toaPgMGuuEE=;
 b=GMrjvq+/EHAxlYUPdoTr+KGPd45uvu5exMf8PFw/8mE/LEqhiXV1srxmJNjDuoCNov
 mtj0q0YRn7iQNN9SP1DLufK5Xee/Nb9QUewq8c/OWJavzQTSWpGd0b4VOcMnQrsuIhfO
 iceKI892hDZsjGtLe4GcQBrktJQ98Cg++pbPD7f35Mq4J7RHoOcrz9wMibL+LUJO694C
 mj9syIg4eg4m6ydU6Pafe/hDsZ8Zw2MjAhneaRNKDb/Ex9Wmnus/WzQ8pyT7pEvFx3iH
 +6VBe0KxLEZT249TQoj0JJL5jM1GqOd0fFbuOQYVcrLK0MraGc0B5BV2ZvZV5biEdnLG
 ageQ==
X-Gm-Message-State: AOAM533gRMxPIftM+korly5KHTIlqXmk9Fljd7VY/zdykMWZ0zLkTHxx
 3qTLvMbK5gEEYH0QcaMgTrM=
X-Google-Smtp-Source: ABdhPJzd8+1bqXijSVpozSCDzusSUX9D2OoL4n5SEftVrb1FexinQlHRXm0PmsifSWJLiT2aLPng6w==
X-Received: by 2002:aca:db42:: with SMTP id s63mr9679774oig.2.1629670857812;
 Sun, 22 Aug 2021 15:20:57 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id x198sm2964122ooa.43.2021.08.22.15.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 15:20:57 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, seanpaul@chromium.org,
 jeyu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 10/11] dyndbg: RFC add debug-trace callback,
 selftest with it. RFC
Date: Sun, 22 Aug 2021 16:20:08 -0600
Message-Id: <20210822222009.2035788-11-jim.cromie@gmail.com>
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

Sean Paul seanpaul@chromium.org proposed, in
https://patchwork.freedesktop.org/series/78133/
drm/trace: Mirror DRM debug logs to tracefs

That patchset's objective is to be able to independently steer some of
the debug stream to an alternate tracing destination, by splitting
drm_debug_enabled() into syslog & trace flavors, and enabling them
separately with a drm.debug_trace knob.

2 advantages are identified:
  - syslog is heavyweight, alternate stream is lighter
  - steering selected categories separately means less traffic

Dynamic-Debug can do this better:

1- all work is behind jump-label's NOOP, Zero overhead when off.

2- perfect site selectivity, no unwanted traffic.

drm's debug categories are a general classification system, not one
tailored to pick out the exact pool of pr_debugs to watch/trace.

With drm.debug built on dyndbg, the given "drm:<cat>:" system can be
used to select a base trace-set, which can then be adjusted +/-,
and/or augmented with unrelated pr_debugs that just happen to be
useful.  And this tweaking can be done at the command-line, and
reduced to a script.

Then the string-prefix "drm:<cat>:" system can be extended to suit.

The basic elements:

 - add a new struct _ddebug member: (*tracer)(char *format, ...)
 - add a new T flag to enable tracer
 - adjust the static-key-enable/disable condition for (p|T)
 - if (p) before printk, since T enables too.
 - if (T) call tracer if its true

 = int dynamic_debug_register_tracer(query, modname, tracer);
 = int dynamic_debug_unregister_tracer(query, modname, cookie);

This new interface lets clients set/unset a tracer function on each
callsite matching the query, for example: "drm:atomic:fail:".

Clients must unregister the same callsites they register, allowing
protection of each client's dyndbg-state setup against overwrites by
others, while allowing maximal sharing of 1 slot/callsite.

The internal call-chain gets some rework: it gets new void* tracer
param, which dynamic_debug_exec_queries() hides from public.

And convert ddebug_exec_queries() to wrap __ddebug_exec_queries(), and
move the query copy code to it.

public:					passing down:
  dynamic_debug_(un)register_tracer	tracer
  dynamic_debug_exec_queries		tracer=NULL
  calling:
      ddebug_exec_queries		copies ro-query, tracer
          __ddebug_exec_queries		modifies query, tracer
              ddebug_exec_query		modifies query, tracer

Then adjust most ddebug_exec_queries users to __ddebug_exec_queries

Intended Behavior: (things are in flux, RFC)

- register sets empty slot, doesn't overwrite
  the query selects callsites, and sets +T (grammar requires +-action)

- register allows same-tracer over-set wo warn
  2nd register can then enable superset, subset, disjoint set

- unregister clears slot if it matches cookie/tracer
  query selects set, -T (as tested)
  tolerates over-clears

- dd-exec-queries(+/-T) can modify the enablements
  not sure its needed, but it falls out..

The code is currently in-line in ddebug_change(), to be moved to
separate fn, rc determines flow, may also veto/alter changes by
altering flag-settings - tbd.

TBD: Im not sure what happens when exec-queries(+T) hits a site wo a
tracer (silence I think. maybe not ideal).

SELFTEST: test_dynamic_debug.ko:

Uses the tracer facility to implement a selftest:

- DUT(x) calls a set of categorized pr_debugs x times
- A custom tracer counts the number of calls (of T-enabled pr_debugs),

- test registers the tracer on the function,
  then iteratively:
  manipulates dyndbg states via query-cmds
  calls DUT(x)
  counts enabled callsite executions
  reports mismatches

- modprobe test_dynamic_debug broken_tracer=1
  attaches a broken tracer: recursive on pr_debug
  Bad Things Happen.
  has thrown me interesting panics.

This needs more work. RFC.
waste of time due to use_bad_tracer properties ?

NOTES:

Next step: replace tracer member with a hashtable lookup, done only
when T.  Registration then becomes populating the hashtable; mod->name
would make a good key, which would limit tracer mapping granularity to
1 registrant per module, but not enablement, which is still the
per-callsite bit.

ERRORS (or WARNINGS):

It should be an error to +T a callsite which has no aux_print set (ie
already registered with a query that selected that callsite).  This
tacitly enforces registration.

Then +T,-T can toggle those aux_print callsites (or subsets of them)
to tailor the debug-stream for the purpose.  Controlling flow is the
best work limiter.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---

v5: (this patch sent after (on top of) v4)

. fix "too many arguments to function", and name the args:
  int (*aux_print)(const char *fmt, char *prefix, char *label, void *);
   prefix : is a slot for dynamic_emit_prefix, or for custom buffer insert
   label  : for builtin-caller used by drm-trace-print
   void*  : vaf, add type constraint later.

. fix printk (to syslog) needs if (+p), since +T also enables
. add prototypes for un/register_aux_print
. change iface names: s/aux_print/tracer/
. also s/trace_print/tracer/
. struct va_format *vaf - tighten further ?

v6: (this version)
. add test module
. add mod arg to *register, following exec_queries pattern
. move code off file bottom to "better" spot
. move kdoc to c from h

__dxq
---
 include/linux/dynamic_debug.h |  12 +-
 lib/Kconfig.debug             |  11 ++
 lib/Makefile                  |   1 +
 lib/dynamic_debug.c           | 145 ++++++++++++++----
 lib/test_dynamic_debug.c      | 279 ++++++++++++++++++++++++++++++++++
 5 files changed, 418 insertions(+), 30 deletions(-)
 create mode 100644 lib/test_dynamic_debug.c

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 51b7254daee0..8807367c7903 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -20,6 +20,7 @@ struct _ddebug {
 	const char *function;
 	const char *filename;
 	const char *format;
+	int (*tracer)(const char *fmt, char *prefix, char *label, struct va_format *vaf);
 	unsigned int lineno:18;
 	/*
 	 * The flags field controls the behaviour at the callsite.
@@ -27,7 +28,11 @@ struct _ddebug {
 	 * writes commands to <debugfs>/dynamic_debug/control
 	 */
 #define _DPRINTK_FLAGS_NONE	0
-#define _DPRINTK_FLAGS_PRINT	(1<<0) /* printk() a message using the format */
+#define _DPRINTK_FLAGS_PRINT		(1<<0) /* printk() a message */
+#define _DPRINTK_FLAGS_PRINT_TRACE	(1<<5) /* call (*tracer) */
+
+#define _DPRINTK_ENABLED (_DPRINTK_FLAGS_PRINT | _DPRINTK_FLAGS_PRINT_TRACE)
+
 #define _DPRINTK_FLAGS_INCL_MODNAME	(1<<1)
 #define _DPRINTK_FLAGS_INCL_FUNCNAME	(1<<2)
 #define _DPRINTK_FLAGS_INCL_LINENO	(1<<3)
@@ -277,4 +282,9 @@ extern const struct kernel_param_ops param_ops_dyndbg;
 #define _DD_cat_help_(pfx)
 #endif
 
+int dynamic_debug_register_tracer(const char *query, const char *mod,
+	int (*tracer)(const char *fmt, char *prefix, char *label, struct va_format *vaf));
+int dynamic_debug_unregister_tracer(const char *query, const char *mod,
+	int (*cookie)(const char *fmt, char *prefix, char *label, struct va_format *vaf));
+
 #endif
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 5ddd575159fb..f3454b2bfc8e 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2486,6 +2486,17 @@ config TEST_STATIC_KEYS
 
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
index 5efd1b435a37..01c3c76980ba 100644
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
index a43427c67c3f..60bf2c01db1a 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -85,6 +85,7 @@ static inline const char *trim_prefix(const char *path)
 
 static struct { unsigned flag:8; char opt_char; } opt_array[] = {
 	{ _DPRINTK_FLAGS_PRINT, 'p' },
+	{ _DPRINTK_FLAGS_PRINT_TRACE, 'T' },
 	{ _DPRINTK_FLAGS_INCL_MODNAME, 'm' },
 	{ _DPRINTK_FLAGS_INCL_FUNCNAME, 'f' },
 	{ _DPRINTK_FLAGS_INCL_LINENO, 'l' },
@@ -146,7 +147,8 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
  * logs the changes.  Takes ddebug_lock.
  */
 static int ddebug_change(const struct ddebug_query *query,
-			 struct flag_settings *modifiers)
+			 struct flag_settings *modifiers,
+			 int (*tracer)(const char *, char *, char *, struct va_format *))
 {
 	int i;
 	struct ddebug_table *dt;
@@ -205,11 +207,42 @@ static int ddebug_change(const struct ddebug_query *query,
 			newflags = (dp->flags & modifiers->mask) | modifiers->flags;
 			if (newflags == dp->flags)
 				continue;
+
+			/* handle T flag */
+			if (newflags & _DPRINTK_FLAGS_PRINT_TRACE) {
+				if (!tracer)
+					v2pr_info("ok: tracer enable\n");
+				else {
+					/* register attempt */
+					if (!dp->tracer) {
+						v2pr_info("register tracer\n");
+						dp->tracer = tracer;
+
+					} else if (tracer == dp->tracer)
+						v2pr_info("ok: tracer over-set\n");
+					else
+						pr_warn("tracer register error\n");
+				}
+			} else if (dp->flags & _DPRINTK_FLAGS_PRINT_TRACE) {
+				if (!tracer)
+					v2pr_info("ok: disable\n");
+				else {
+					/* only unregister has a !!tracer */
+					if (!dp->tracer)
+						pr_warn("nok: tracer already unset\n");
+
+					else if (dp->tracer == tracer) {
+						v2pr_info("ok: cookie match, unregistering\n");
+						dp->tracer = NULL;
+					} else
+						pr_warn("nok: tracer cookie match fail\n");
+				}
+			}
 #ifdef CONFIG_JUMP_LABEL
-			if (dp->flags & _DPRINTK_FLAGS_PRINT) {
-				if (!(modifiers->flags & _DPRINTK_FLAGS_PRINT))
+			if (dp->flags & _DPRINTK_ENABLED) {
+				if (!(modifiers->flags & _DPRINTK_ENABLED))
 					static_branch_disable(&dp->key.dd_key_true);
-			} else if (modifiers->flags & _DPRINTK_FLAGS_PRINT)
+			} else if (modifiers->flags & _DPRINTK_ENABLED)
 				static_branch_enable(&dp->key.dd_key_true);
 #endif
 			dp->flags = newflags;
@@ -482,7 +515,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 	return 0;
 }
 
-static int ddebug_exec_query(char *query_string, const char *modname)
+static int ddebug_exec_query(char *query_string, const char *modname, void *tracer)
 {
 	struct flag_settings modifiers = {};
 	struct ddebug_query query = {};
@@ -505,7 +538,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 		return -EINVAL;
 	}
 	/* actually go and implement the change */
-	nfound = ddebug_change(&query, &modifiers);
+	nfound = ddebug_change(&query, &modifiers, tracer);
 	vpr_info_dq(&query, nfound ? "applied" : "no-match");
 
 	return nfound;
@@ -516,7 +549,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
  * last error or number of matching callsites.  Module name is either
  * in param (for boot arg) or perhaps in query string.
  */
-static int ddebug_exec_queries(char *query, const char *modname)
+static int __ddebug_exec_queries(char *query, const char *modname, void *tracer)
 {
 	char *split;
 	int i, errs = 0, exitcode = 0, rc, nfound = 0;
@@ -532,7 +565,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 		vpr_info("query %d: \"%s\" %s\n", i, query, (modname) ? modname : "");
 
-		rc = ddebug_exec_query(query, modname);
+		rc = ddebug_exec_query(query, modname, tracer);
 		if (rc < 0) {
 			errs++;
 			exitcode = rc;
@@ -549,6 +582,22 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
+static int ddebug_exec_queries(const char *query_in, const char *modname, void *tracer)
+{
+	int rc;
+
+	if (!query_in) {
+		pr_err("non-null query/command string expected\n");
+		return -EINVAL;
+	}
+	query = kstrndup(query_in, PAGE_SIZE, GFP_KERNEL);
+	if (!query)
+		return -ENOMEM;
+
+	rc = __ddebug_exec_queries(query, modname, tracer);
+	kfree(query);
+	return rc;
+
 /**
  * dynamic_debug_exec_queries - select and change dynamic-debug prints
  * @query: query-string described in admin-guide/dynamic-debug-howto
@@ -556,25 +605,12 @@ static int ddebug_exec_queries(char *query, const char *modname)
  *
  * This uses the >/proc/dynamic_debug/control reader, allowing module
  * authors to modify their dynamic-debug callsites. The modname is
- * canonically struct module.mod_name, but can also be null or a
+ * canonically struct module.name, but can also be null or a
  * module-wildcard, for example: "drm*".
  */
 int dynamic_debug_exec_queries(const char *query, const char *modname)
 {
-	int rc;
-	char *qry; /* writable copy of query */
-
-	if (!query) {
-		pr_err("non-null query/command string expected\n");
-		return -EINVAL;
-	}
-	qry = kstrndup(query, PAGE_SIZE, GFP_KERNEL);
-	if (!qry)
-		return -ENOMEM;
-
-	rc = ddebug_exec_queries(qry, modname);
-	kfree(qry);
-	return rc;
+	return ddebug_exec_queries(qry, modname, NULL);
 }
 EXPORT_SYMBOL_GPL(dynamic_debug_exec_queries);
 
@@ -603,7 +639,7 @@ int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
 	}
 	rc = kstrtoul(instr, 0, &inbits);
 	if (rc) {
-		pr_err("set_dyndbg: failed\n");
+		pr_err("set_dyndbg: bad input: %s\n", instr);
 		return rc;
 	}
 	vpr_info("set_dyndbg: input 0x%lx\n", inbits);
@@ -612,7 +648,7 @@ int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
 		snprintf(query, FMT_QUERY_SIZE, "format '^%s' %cp", bitmap->prefix,
 			 test_bit(i, &inbits) ? '+' : '-');
 
-		matches = ddebug_exec_queries(query, KP_MOD_NAME);
+		matches = __ddebug_exec_queries(query, KP_MOD_NAME, NULL);
 
 		v2pr_info("bit-%d: %d matches on '%s'\n", i, matches, query);
 		totct += matches;
@@ -703,8 +739,20 @@ void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
-	printk(KERN_DEBUG "%s%pV", dynamic_emit_prefix(descriptor, buf), &vaf);
+	if (descriptor->flags & _DPRINTK_ENABLED)
+		dynamic_emit_prefix(descriptor, buf);
+
+	if (descriptor->flags & _DPRINTK_FLAGS_PRINT)
+		printk(KERN_DEBUG "%s%pV", buf, &vaf);
+
+	if (descriptor->flags & _DPRINTK_FLAGS_PRINT_TRACE) {
 
+		if (descriptor->tracer) {
+			(*descriptor->tracer)("%s:%ps %pV", buf,
+						 __builtin_return_address(0), &vaf);
+		}
+		/* else shouldn't matter, but maybe for consistency */
+	}
 	va_end(args);
 }
 EXPORT_SYMBOL(__dynamic_pr_debug);
@@ -849,7 +897,7 @@ static ssize_t ddebug_proc_write(struct file *file, const char __user *ubuf,
 		return PTR_ERR(tmpbuf);
 	vpr_info("read %d bytes from userspace\n", (int)len);
 
-	ret = ddebug_exec_queries(tmpbuf, NULL);
+	ret = __ddebug_exec_queries(tmpbuf, NULL, NULL);
 	kfree(tmpbuf);
 	if (ret < 0)
 		return ret;
@@ -1055,7 +1103,7 @@ static int ddebug_dyndbg_param_cb(char *param, char *val,
 	if (strcmp(param, "dyndbg"))
 		return on_err; /* determined by caller */
 
-	ddebug_exec_queries((val ? val : "+p"), modname);
+	__ddebug_exec_queries((val ? val : "+p"), modname, NULL);
 
 	return 0; /* query failure shouldn't stop module load */
 }
@@ -1190,7 +1238,7 @@ static int __init dynamic_debug_init(void)
 	/* apply ddebug_query boot param, dont unload tables on err */
 	if (ddebug_setup_string[0] != '\0') {
 		pr_warn("ddebug_query param name is deprecated, change it to dyndbg\n");
-		ret = ddebug_exec_queries(ddebug_setup_string, NULL);
+		ret = __ddebug_exec_queries(ddebug_setup_string, NULL, NULL);
 		if (ret < 0)
 			pr_warn("Invalid ddebug boot param %s\n",
 				ddebug_setup_string);
@@ -1220,3 +1268,42 @@ early_initcall(dynamic_debug_init);
 
 /* Debugfs setup must be done later */
 fs_initcall(dynamic_debug_init_control);
+
+/**
+ * dynamic_debug_register_tracer() - register a "printer" function
+ * @query:   query-command string to select callsites getting the function
+ * @modname: added into query-command, may include wildcards
+ * @tracer:  &vprintf-ish accepting 3 char* ptrs & a vaf
+ *
+ * Attach a tracer callback callsites selected by the query.  If
+ * another tracer is already attached, warn and skip, applying the
+ * rest of the query.  This protects existing setups, while allowing
+ * maximal coexistence of (mostly) non-competing listeners. RFC.
+ *
+ * Returns: <0   error
+ *	    >=0  matches on query, not changes by query
+ */
+int dynamic_debug_register_tracer(const char *query, const char *modname,
+	int (*tracer)(const char *fmt, char *prefix, char *label, struct va_format *vaf))
+{
+	return ddebug_exec_queries(query, modname, tracer);
+}
+EXPORT_SYMBOL(dynamic_debug_register_tracer);
+
+/**
+ * dynamic_debug_unregister_tracer - unregister your "printer" function
+ * @query:   query-command string to select callsites to reset
+ * @modname: name of module, or search string (ex: "drm*"), or null
+ * @tracer:  reserved to validate unregisters against pirates
+ *
+ * Detach the tracer callback from callsites selected by the query, if
+ * it matches the callsite's tracer.  This protects existing setups,
+ * while allowing maximal coexistence of (mostly) non-competing
+ * listeners. RFC.
+ */
+int dynamic_debug_unregister_tracer(const char *query, const char *modname,
+	int (*tracer)(const char *fmt, char *prefix, char *label, struct va_format *vaf))
+{
+	return ddebug_exec_queries(query, modname, tracer);
+}
+EXPORT_SYMBOL(dynamic_debug_unregister_tracer);
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
new file mode 100644
index 000000000000..802199e2507a
--- /dev/null
+++ b/lib/test_dynamic_debug.c
@@ -0,0 +1,279 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Kernel module for testing dynamic_debug
+ *
+ * Author:
+ *      Jim Cromie	<jim.cromie@gmail.com>
+ */
+
+/*
+ * test-setup:
+ * - use register_tracer to attach a test harness
+ * - a custom trace_printer which counts invocations of enabled pr_debugs
+ * - a DUT (device under test), calling categorized pr_debugs
+ * test-run:
+ * - manipulate the pr_debugs' enablements -> match_ct
+ * - call event generator with loop-ct
+ *   its pr_debug()s are Traced: trace_ct++
+ * - count and compare: mainly trace_ct, but also match_ct
+ */
+
+#include <linux/module.h>
+
+static int trace_ct;	/* the state var */
+static int test_ct;
+static int errors;
+
+static int verbose;
+module_param_named(verbose, verbose, int, 0444);
+MODULE_PARM_DESC(verbose, "notice on tracer");
+
+static int __test_resv;
+module_param_named(test_reserve, __test_resv, int, 0444);
+MODULE_PARM_DESC(test_reserve, "test 'reservation' against 'poaching'\n");
+
+static int __broken_tracer;
+module_param_named(broken_tracer, __broken_tracer, int, 0444);
+MODULE_PARM_DESC(broken_tracer,
+		 "use broken tracer, recursing with pr_debug\n"
+		 "\tonly works at modprobe time\n");
+
+static int good_tracer(const char *decorator, char *prefix, char *label, struct va_format *vaf)
+{
+	trace_ct++;
+	if (verbose)
+		pr_notice("my_tracer: %pV", vaf);
+	return 0;
+}
+
+static int bad_tracer(const char *decorator, char *prefix, char *label, struct va_format *vaf)
+{
+	/* dont try pr_debug, it recurses back here */
+	pr_debug("oops! recursion, crash?\n");
+	return 0;
+}
+
+static int (*my_tracer)
+	(const char *decorator, char *prefix, char *label, struct va_format *vaf);
+
+static void pick_tracer(void)
+{
+	if (__broken_tracer)
+		my_tracer = bad_tracer;
+	else
+		my_tracer = good_tracer;
+}
+
+/* call pr_debug (4 * reps) + 2 times, for tracer side-effects */
+static void DUT(int reps)
+{
+	int i;
+
+	pr_debug("Entry:\n");
+	pr_info(" DUT %d time(s)\n", reps);
+	for (i = 0; i < reps; i++) {
+		pr_debug("hi: %d\n", i);
+		pr_debug("mid: %d\n", i);
+		pr_debug("low: %d\n", i);
+		pr_debug("low:lower: %d subcategory test\n", i);
+	}
+	pr_debug("Exit:\n");
+}
+
+struct test_spec {
+	int matches;	/* expected rc from applying qry */
+	int loops;	/* passed to DUT */
+	int hits;	/* should match trace_ct after gen */
+	const char *mod;	/* Anyof: wildcarded-string, null, &mod.name */
+	const char *qry;	/* echo $qry > control */
+	const char *story;	/* test purpose explanation progress */
+};
+
+static void expect_count(struct test_spec *t)
+{
+	test_ct++;
+	if (trace_ct != t->hits) {
+		pr_err("fail#%d: got %d != %d by \"%s\"\tfor \"%s\"\n",
+		       test_ct, trace_ct, t->hits, t->qry, t->story);
+		errors++;
+	} else
+		pr_info("pass#%d, hits %d, on \"%s\"\n", test_ct, t->hits, t->story);
+
+	trace_ct = 0;
+}
+
+static void expect_matches(int got, struct test_spec *t)
+{
+	if (got != t->matches) {
+		pr_warn(" nok: got %d != %d on \"%s\"\n", got, t->matches, t->qry);
+		errors++;
+	} else
+		pr_info(" ok: %d matches by \"%s\"\t for \"%s\"\n", got, t->qry, t->story);
+}
+
+static void do_test_spec(struct test_spec *t)
+{
+	int match_count;
+
+	match_count = dynamic_debug_exec_queries(t->qry, t->mod);
+	if (match_count < 0) {
+		pr_err("exec-queries fail rc:%d\n", match_count);
+		return;
+	}
+	expect_matches(match_count, t);
+	DUT(t->loops);
+	expect_count(t);
+}
+
+static const char modnm[] = "test_dynamic_debug";
+
+static void do_register_test(struct test_spec *t, int deep)
+{
+	int match_count;
+
+	pr_debug("enter: %s\n", t->story);
+	if (deep)
+		pr_debug("register good tracer\n");
+
+	match_count = dynamic_debug_register_tracer(t->qry, t->mod, good_tracer);
+	if (match_count < 0) {
+		pr_err("exec-queries fail rc:%d\n", match_count);
+		return;
+	}
+	expect_matches(match_count, t);
+	DUT(t->loops);
+	expect_count(t);
+
+	if (!deep)
+		return;
+
+	pr_debug("unregister bad tracer\n");
+	match_count = dynamic_debug_unregister_tracer(t->qry, t->mod, bad_tracer);
+	if (match_count < 0) {
+		pr_err("exec-queries fail rc:%d\n", match_count);
+		return;
+	}
+	expect_matches(match_count, t);
+	DUT(t->loops);
+	expect_count(t);
+
+	pr_debug("unregister good tracer\n");
+	match_count = dynamic_debug_unregister_tracer(t->qry, t->mod, good_tracer);
+	if (match_count < 0) {
+		pr_err("exec-queries fail rc:%d\n", match_count);
+		return;
+	}
+	expect_matches(match_count, t);
+	DUT(t->loops);
+	expect_count(t);
+}
+
+struct test_spec registry_tests[] = {
+
+	/* matches, loops, hits, modname, query, story */
+	{ 6, 1, 0,   modnm, "func DUT +_",	"probe: DUT 1" },
+	{ 6, 1, 2+4, modnm, "func DUT +T",	"enable (T)" },
+	{ 6, 2, 10,  modnm, "func DUT -_",	"probe: DUT 2" },
+	{ 6, 3, 14,  modnm, "func DUT +T",	"over-enable, ok" },
+	{ 6, 2, 10,  modnm, "func DUT -_",	"probe: DUT 3" },
+	{ 6, 3, 0,   modnm, "func DUT -T",	"disable" },
+
+	/* 5 other callsites here */
+	{ 11, 1, 0,  modnm, "+_",	"probe: whole module" },
+	{ 11, 5, 22, modnm, "+T",	"enable (T) whole module" },
+	{ 11, 1, 7, modnm, "+T",	"re-enable whole module" },
+	{ 11, 3, 1,  modnm, "-T",	"disable whole module" },
+
+	{ 3, 2, 0,  modnm, "func test_* +_",	"probe: count test_*" },
+	{ 3, 2, 0,  modnm, "func test_* +_",	"probe: count test_*" },
+
+	/* terminate registry tests in a known T state */
+	{ 6, 3, 14, modnm, "func DUT +T",	"enable just function" },
+};
+
+/* these tests rely on register stuff having been done ?? */
+struct test_spec exec_tests[] = {
+	/*
+	 * preferred use of exec_queries(qry, modnm) is with true
+	 * modnm, since that removes 'module $modnm' from the query
+	 * string. (supports modprobe $modname dyndbg=+p).
+	 *
+	 * But start the old way. with Ts enabled.
+	 */
+	{ 6, 1, 6, NULL, "module test_dynamic_debug func DUT +p",
+			 "Hello! using original module-in-query style" },
+
+	{ 11, 1, 6, modnm, "+p",	"enable (p) whole module, run DUT 1x" },
+	{ 11, 1, 0, modnm, "-p",	"disable (p) whole module, run DUT(1x)" },
+
+	{ 6, 4, 18, modnm, "func DUT +T", "enable (T) DUT(4)" },
+
+	{ 1, 4, 14, modnm, "format '^hi:' -T",		"disable 1 callsite" },
+	{ 1, 4, 10, modnm, "format '^mid:' -T",		"disable 1 callsite" },
+	{ 1, 4, 10, modnm, "format '^mid:' -T",		"re-disable" },
+	{ 1, 5, 12, modnm, "format '^mid:' -T",		"re-disable with more loops" },
+	{ 2, 4, 2, modnm, "format '^low:' -T",		"disable with subclass" },
+	{ 1, 4, 2, modnm, "format '^low: ' -T",		"re-disable, exclude subclass" },
+	{ 1, 4, 6, modnm, "format '^low: ' +T",		"enable, exclude subclass" },
+	{ 1, 4, 10, modnm, "format '^low:lower:' +T",	"enable the subclass" },
+	{ 1, 6, 14, modnm, "format '^low:lower:' +T",	"re-enable the subclass" },
+};
+
+struct test_spec ratelimit_tests[] = {
+	{ 6, 3000, 0, modnm, "func DUT +Tr" }
+};
+
+static void do_test_vec(struct test_spec *t, int len)
+{
+	int i;
+
+	for (i = 0; i < len; i++, t++)
+		do_test_spec(t);
+}
+
+static void test_all(void)
+{
+	int i;
+
+	pr_debug("Entry:\n");
+	pick_tracer();
+
+	for (i = 0; i < ARRAY_SIZE(registry_tests); i++)
+		; //do_register_test(&registry_tests[i], __test_resv);
+
+	for (i = 0; i < ARRAY_SIZE(registry_tests); i++)
+		do_register_test(&registry_tests[i], 0);
+
+	do_test_vec(exec_tests, ARRAY_SIZE(exec_tests));
+	do_test_vec(ratelimit_tests, ARRAY_SIZE(ratelimit_tests));
+}
+
+static void report(char *who)
+{
+	if (errors)
+		pr_err("%s: failed %d of %d tests\n", who, errors, test_ct);
+	else
+		pr_notice("%s: passed %d tests\n", who, test_ct);
+}
+
+static int __init test_dynamic_debug_init(void)
+{
+	pr_debug("Init:\n");
+
+	test_all();
+	report("complete");
+
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

