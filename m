Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB2D3F4224
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 00:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922F389FD9;
	Sun, 22 Aug 2021 22:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BE789F0A;
 Sun, 22 Aug 2021 22:20:59 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso19981066ots.5; 
 Sun, 22 Aug 2021 15:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NT6h/vX8/m+JyGE497yUqs4gMn2gwLq39tH0mvJ26zw=;
 b=Bg49Iv+NZHZQ93bYuVhwSLRbiaXHxeMoTZmB/19ZVGm+BQIsrLKxOM8ZLUU/O2YYCI
 baUJS/ID2PwDbJs53NSgQLD25POivw/EVdofYsE6/D6SSvIdCCNCSHxPiiwOQIR7c/gO
 v28EcicS7T3FGMSVJanT+/AvlSoOygsgOBkTwq7NOicEL9HLmE4QzY9apX5Jaly8ZFFD
 phP+CsW18iUW13wSaEuW477fWBC1n7McWqBH1BiqeLG49pGC4W8gJmv2qBtqNc6/eVsd
 hVs7HjO6kAD2fg+H/7JX0qj+Ec40yFJv5mZqgMncTScO1QbUKrYpuUPrlQOZXafVdq6t
 M13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NT6h/vX8/m+JyGE497yUqs4gMn2gwLq39tH0mvJ26zw=;
 b=rbROul8iG0sWHtViQQGrb7Vit76DYHXsc29KSJVipieQKv0ETBS/iVth9w0BriqJSS
 Iy7IW5acVI6LanulSjTfEwimtl7TFNHfQvzD2uxqMmfYfyMYof19AuxrQESEhRCeWaAq
 vDhiQb+WGkDE5+XsTVWBLDuhP+MZseJKzs/IaKmOWk9sgNEGQoOAaEJrbKV4t/nNn0eI
 i7W5MSVOsaDjKj7z6vJjy41ECPCIgV5ragqH9wOFDq0kKYKtHeFv6dgC7Pt5K+KTxlMJ
 YvZfHR4nYvXGgBsDHd4pfszoXU6L54otYcqhM+bdIF5oP74k0UCEWJfNhWsjlBZeruZd
 3ZmA==
X-Gm-Message-State: AOAM533t9qOf2HnOa/cexobvtazrA8oQ7ZnaSrxscKNVzeo/Ig0jOPU3
 Fng0rsmAQi+B4RL8vyULU+s=
X-Google-Smtp-Source: ABdhPJzmgfDFyb89NVScQRBo6vHUydrRuZzr9LAhQELwlcEu+wSy+ll6ZO0Jze5LKytd1DwXtsf3gQ==
X-Received: by 2002:a05:6830:85:: with SMTP id
 a5mr25869142oto.268.1629670859014; 
 Sun, 22 Aug 2021 15:20:59 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id x198sm2964122ooa.43.2021.08.22.15.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 15:20:58 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, seanpaul@chromium.org,
 jeyu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 11/11] dyndbg: RFC add print-once and print-ratelimited
 features. RFC.
Date: Sun, 22 Aug 2021 16:20:09 -0600
Message-Id: <20210822222009.2035788-12-jim.cromie@gmail.com>
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

Its tautological that having pr_debug()s with optional print-once and
rate-limiting features could be useful.  Build it, they will come.

The advantages:

- dynamically configured with flags
- can use them on existing callsites
- printonce is easy, (almost) just new flags
  no additional resources
- ratelimiting is pooled, expecting rare use
  provisioned only for enabled & ratelimited callsites
- RFC ratelimit grouping
  mostly to reduce resources
  reduces to choice of hash key: module, function, file, line

Whats done here:

Expand ddebug.flags to 11 bits, and define new flags to support
print-once and ratelimited semantics:

  echo file init/main.c +o > control	# init/main runs just once anyway
  echo module foo +r > control		# turn on ratelimiting
  echo module foo +g > control		# turn on group flag

is_onced_or_ratelimited() tests these conditions, it is called from
__dynamic_pr_debug() and others (which are all behind the '+p'
enablement test).

NB: test_dynamic_debug.ko ratelimiting test triggers reports on
is_onced_or_ratelimited() as the limited source.

PRINT-ONCE: can be done with just +2 bits in flags;

.o _DPRINTK_FLAGS_ONCE     enables state test and set
.P _DPRINTK_FLAGS_PRINTED  state bit

Just adding the flags lets the existing code operate on them.
We will need new code to enforce constraints on flag combos;
'+ro' is nonsense, but this can wait, or can take a new meaning.

RATE-LIMITING:

.r _DPRINTK_FLAGS_RATELIMITED - track & limit prdbgs callrate

We wait until a prdebug is called, and if RATELIMITED is set, THEN
lookup a RateLimitState (RL) for it.  If found, bump its state and
return true/false, otherwise create & initialize one and return false.

RFC: GROUP-FLAG:

.g _DPRINTK_FLAGS_GROUPED

Currently, the hash-key is just the prdebug descriptor, so is unique
per prdebug.  With the 'g' flag, we could use a different key, for
example desc->site.function, to get a shared ratelimit for whole
functions.

This gets subtly different behavior at the ratelimit transition, but
it is predictable for a given function (except perhaps recursive, but
thats not done anyway).

Note also that any function can have a single group of prdebugs, plus
any number of prdbgs without 'g', either with or without 'r'.  So
grouping should be flexible enough to use advantageously.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v6: new to patchset
---
 include/linux/dynamic_debug.h |  19 ++++--
 lib/dynamic_debug.c           | 125 +++++++++++++++++++++++++++++++++-
 2 files changed, 137 insertions(+), 7 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 8807367c7903..e9871557cff1 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -28,26 +28,33 @@ struct _ddebug {
 	 * writes commands to <debugfs>/dynamic_debug/control
 	 */
 #define _DPRINTK_FLAGS_NONE	0
-#define _DPRINTK_FLAGS_PRINT		(1<<0) /* printk() a message */
+#define _DPRINTK_FLAGS_PRINT		(1<<4) /* printk() a message */
 #define _DPRINTK_FLAGS_PRINT_TRACE	(1<<5) /* call (*tracer) */
 
 #define _DPRINTK_ENABLED (_DPRINTK_FLAGS_PRINT | _DPRINTK_FLAGS_PRINT_TRACE)
 
-#define _DPRINTK_FLAGS_INCL_MODNAME	(1<<1)
-#define _DPRINTK_FLAGS_INCL_FUNCNAME	(1<<2)
-#define _DPRINTK_FLAGS_INCL_LINENO	(1<<3)
-#define _DPRINTK_FLAGS_INCL_TID		(1<<4)
+#define _DPRINTK_FLAGS_INCL_MODNAME	(1<<0)
+#define _DPRINTK_FLAGS_INCL_FUNCNAME	(1<<1)
+#define _DPRINTK_FLAGS_INCL_LINENO	(1<<2)
+#define _DPRINTK_FLAGS_INCL_TID		(1<<3)
 
 #define _DPRINTK_FLAGS_INCL_ANY		\
 	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |\
 	 _DPRINTK_FLAGS_INCL_LINENO  | _DPRINTK_FLAGS_INCL_TID)
 
+#define _DPRINTK_FLAGS_ONCE		(1<<6) /* print once flag */
+#define _DPRINTK_FLAGS_PRINTED		(1<<7) /* print once state */
+#define _DPRINTK_FLAGS_RATELIMITED	(1<<8)
+#define _DPRINTK_FLAGS_GROUPED		(1<<9) /* manipulate as a group */
+#define _DPRINTK_FLAGS_DELETE_SITE	(1<<10) /* drop site info to save ram */
+
 #if defined DEBUG
 #define _DPRINTK_FLAGS_DEFAULT _DPRINTK_FLAGS_PRINT
 #else
 #define _DPRINTK_FLAGS_DEFAULT 0
 #endif
-	unsigned int flags:8;
+	unsigned int flags:11;
+
 #ifdef CONFIG_JUMP_LABEL
 	union {
 		struct static_key_true dd_key_true;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 60bf2c01db1a..16e4db04082b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -83,13 +83,19 @@ static inline const char *trim_prefix(const char *path)
 	return path + skip;
 }
 
-static struct { unsigned flag:8; char opt_char; } opt_array[] = {
+static struct { unsigned flag:12; char opt_char; } opt_array[] = {
 	{ _DPRINTK_FLAGS_PRINT, 'p' },
 	{ _DPRINTK_FLAGS_PRINT_TRACE, 'T' },
 	{ _DPRINTK_FLAGS_INCL_MODNAME, 'm' },
 	{ _DPRINTK_FLAGS_INCL_FUNCNAME, 'f' },
 	{ _DPRINTK_FLAGS_INCL_LINENO, 'l' },
 	{ _DPRINTK_FLAGS_INCL_TID, 't' },
+
+	{ _DPRINTK_FLAGS_ONCE, 'o' },
+	{ _DPRINTK_FLAGS_PRINTED, 'P' },
+	{ _DPRINTK_FLAGS_RATELIMITED, 'r' },
+	{ _DPRINTK_FLAGS_GROUPED, 'g' },
+	{ _DPRINTK_FLAGS_DELETE_SITE, 'D' },
 	{ _DPRINTK_FLAGS_NONE, '_' },
 };
 
@@ -119,6 +125,8 @@ do {								\
 
 #define vpr_info(fmt, ...)	vnpr_info(1, fmt, ##__VA_ARGS__)
 #define v2pr_info(fmt, ...)	vnpr_info(2, fmt, ##__VA_ARGS__)
+#define v3pr_info(fmt, ...)	vnpr_info(3, fmt, ##__VA_ARGS__)
+#define v4pr_info(fmt, ...)	vnpr_info(4, fmt, ##__VA_ARGS__)
 
 static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 {
@@ -725,6 +733,49 @@ static inline char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
 	return buf;
 }
 
+struct ddebug_ratelimit {
+	struct hlist_node hnode;
+	struct ratelimit_state rs;
+	u64 key;
+};
+
+/* test print-once or ratelimited conditions */
+#define is_rated(desc) unlikely(desc->flags & _DPRINTK_FLAGS_RATELIMITED)
+#define is_once(desc) unlikely(desc->flags & _DPRINTK_FLAGS_ONCE)
+#define is_onced(desc)						\
+	unlikely((desc->flags & _DPRINTK_FLAGS_ONCE)		\
+		 && (desc->flags & _DPRINTK_FLAGS_PRINTED))
+
+static struct ddebug_ratelimit *ddebug_rl_fetch(struct _ddebug *desc);
+
+static inline bool is_onced_or_limited(struct _ddebug *desc)
+{
+	if (unlikely(desc->flags & _DPRINTK_FLAGS_ONCE &&
+		     desc->flags & _DPRINTK_FLAGS_RATELIMITED))
+		pr_info(" ONCE & RATELIMITED together is nonsense\n");
+
+	if (is_once(desc)) {
+		if (is_onced(desc)) {
+			v4pr_info("already printed once\n");
+			return true;
+		}
+		desc->flags |= _DPRINTK_FLAGS_PRINTED;
+		return false;
+
+	} else if (is_rated(desc)) {
+		/* test rate-limits */
+		bool state = __ratelimit(&ddebug_rl_fetch(desc)->rs);
+
+		v4pr_info("RLstate{%s}=%d on %s.%s.%d\n",
+			  (desc->flags & _DPRINTK_FLAGS_GROUPED
+			   ? "grouped" : "solo"), state,
+			  desc->modname, desc->function, desc->lineno);
+
+		return state;
+	}
+	return false;
+}
+
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
 {
 	va_list args;
@@ -734,6 +785,9 @@ void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
 	BUG_ON(!descriptor);
 	BUG_ON(!fmt);
 
+	if (is_onced_or_limited(descriptor))
+		return;
+
 	va_start(args, fmt);
 
 	vaf.fmt = fmt;
@@ -766,6 +820,9 @@ void __dynamic_dev_dbg(struct _ddebug *descriptor,
 	BUG_ON(!descriptor);
 	BUG_ON(!fmt);
 
+	if (is_onced_or_limited(descriptor))
+		return;
+
 	va_start(args, fmt);
 
 	vaf.fmt = fmt;
@@ -797,6 +854,9 @@ void __dynamic_netdev_dbg(struct _ddebug *descriptor,
 	BUG_ON(!descriptor);
 	BUG_ON(!fmt);
 
+	if (is_onced_or_limited(descriptor))
+		return;
+
 	va_start(args, fmt);
 
 	vaf.fmt = fmt;
@@ -833,6 +893,9 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 	struct va_format vaf;
 	va_list args;
 
+	if (is_onced_or_limited(descriptor))
+		return;
+
 	va_start(args, fmt);
 
 	vaf.fmt = fmt;
@@ -1307,3 +1370,63 @@ int dynamic_debug_unregister_tracer(const char *query, const char *modname,
 	return ddebug_exec_queries(query, modname, tracer);
 }
 EXPORT_SYMBOL(dynamic_debug_unregister_tracer);
+
+/*
+ * Rate-Limited debug is expected to rarely be needed, so it is
+ * provisioned on-demand when an enabled and rate-limit-flagged
+ * pr_debug is called, by ddebug_rl_fetch().  For now, key is just
+ * descriptor, so is unique per site.
+
+ * Plan: for 'gr' flagged callsites, choose a key that is same across
+ * all prdebugs in a function, to apply a single rate-limit to the
+ * whole function.  This should give nearly identical behavior at much
+ * lower memory cost.
+ */
+static DEFINE_HASHTABLE(ddebug_rl_map, 6);
+
+static struct ddebug_ratelimit *ddebug_rl_find(u64 key)
+{
+	struct ddebug_ratelimit *limiter;
+
+	hash_for_each_possible(ddebug_rl_map, limiter, hnode, key) {
+		if (limiter->key == key)
+			return limiter;
+	}
+	return NULL;
+}
+
+/* Must be called with ddebug_rl_lock locked. */
+static struct ddebug_ratelimit *ddebug_rl_add(u64 key)
+{
+	struct ddebug_ratelimit *limiter;
+
+	limiter = ddebug_rl_find(key);
+	if (limiter)
+		return limiter;
+	limiter = kmalloc(sizeof(*limiter), GFP_ATOMIC);
+	if (!limiter)
+		return ERR_PTR(-ENOMEM);
+
+	limiter->key = key;
+	ratelimit_default_init(&limiter->rs);
+	hash_add(ddebug_rl_map, &limiter->hnode, key);
+
+	v3pr_info("added %llx\n", key);
+	return limiter;
+}
+
+/*
+ * called when enabled callsite has _DPRINTK_FLAGS_RATELIMITED flag
+ * set (echo +pr >control), it hashes on &table-header+index
+ */
+static struct ddebug_ratelimit *ddebug_rl_fetch(struct _ddebug *desc)
+{
+	u64 key = (u64)desc;
+	struct ddebug_ratelimit *ddebug_rl = ddebug_rl_find(key);
+
+	if (ddebug_rl) {
+		v4pr_info("found %llx\n", key);
+		return ddebug_rl;
+	}
+	return ddebug_rl_add(key);
+}
-- 
2.31.1

