Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7094D59D5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 05:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B1F10E497;
	Fri, 11 Mar 2022 04:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0689210E497;
 Fri, 11 Mar 2022 04:48:18 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id l18so1671183ioj.2;
 Thu, 10 Mar 2022 20:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p/gDed9mjWquugw1564Om0fYtLE4xfr9AocRWQTn5xo=;
 b=jErl+su4dJeS3EQkkpi1iLYNAS3TmiC0jxACivDDuEtAYLY/eLagJuqigxKlvk64WX
 5WLYdI92cpRdtRFdtk3BUZbdgCRZ6XgZNAgWdXw1U5FPG1WwJ68MQDXNKtNieZof7Cgx
 6e06R3gstJOSvat4MICVWUH0/hEVsr6bAPB+rWAxkrpTl5bJLGgekdwAXt2/jRcuk+wA
 f8+k56xzsAE+JXSLkOjBCOCC1SkX/LAlCDEd4pgkvco+6lCcijf8fzQwU1yH3z9yFZon
 gz8ESQbN83D3wBrlFPC0iF4gUf5SgB3Xkbp6PFtlodS+n0adYiWGauHIS3zweH4Ya5mt
 Ygog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p/gDed9mjWquugw1564Om0fYtLE4xfr9AocRWQTn5xo=;
 b=RHBEqAq9Kz1BMDVuVrbEa08HM1j4pLWwU9FbsPDUuQXaAj2czcC7V2tCtxFVWE44pc
 Pguy0tf9YVeAKA0HKJR1+e86c8DJERih1GuEaTDRHiuYFE/jdIjA8/Kh/+i2q+5intuH
 EinHfHrD6sZZqTGeBh+BZjHVitoC9dZ7JZaMY7IQ5cC4t8bUoGGOJpTFVusTZIaA9Ch4
 AhZXSKcC1mNhSt6Vo1D26qHzb60SnFhi9b54It8oZFJReGqLo25W9pmPB5giTK+Duk/x
 lrNoTXyJkWpusUhb1KtyaapJrq3AKxnw1O3aHKWwXbBI9gjLkGlGyjr640l6lRF/Jmwd
 xV8w==
X-Gm-Message-State: AOAM53285LAiYhVwz5D4WUapTaLae2YhgpxEEkb1+P9RpJH1E6yfNYjp
 e58b0t8AAHJ/kI2GbnUirhY=
X-Google-Smtp-Source: ABdhPJwwdoTGV4SvWOjo2Ipfd01ftsUEq0qX/CG6aBP3wvzzeccqEmHlrksixYn4WBjOarqSuHuZwQ==
X-Received: by 2002:a05:6638:4102:b0:314:32a6:90bc with SMTP id
 ay2-20020a056638410200b0031432a690bcmr7045899jab.168.1646974097052; 
 Thu, 10 Mar 2022 20:48:17 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::f10e])
 by smtp.googlemail.com with ESMTPSA id
 q9-20020a5edb09000000b00645c7a00cbbsm3529834iop.20.2022.03.10.20.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 20:48:16 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] dyndbg: add class_id field and query support
Date: Thu, 10 Mar 2022 21:47:53 -0700
Message-Id: <20220311044756.425777-3-jim.cromie@gmail.com>
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

DRM defines/uses 10 enum drm_debug_category's to create exclusive
classes of debug messages.  To support this directly in dynamic-debug,
add the following:

- struct _ddebug.class_id:4 - 4 bits is enough
- define _DPRINTK_SITE_UNCLASSED 15 - see below

and the query support:
- struct _ddebug_query.class_id
- ddebug_parse_query	- looks for "class" keyword, then calls..
- parse_class		- accepts uint: 0-15, sets query.class_id and marker
- vpr_info_dq		- displays new field
- ddebug_proc_show	- append column with "cls:%d" if !UNCLASSED

With the patch, one can enable current/unclassed callsites by:

  #> echo drm class 15 +p > /proc/dynamic_debug/control

parse_class() accepts 0 .. _DPRINTK_SITE_UNCLASSED, which allows the
>control interface to explicitly manipulate unclassed callsites.

After parsing keywords, ddebug_parse_query() sets .class_id=15, iff it
wasnt explicitly set.  This allows future classed/categorized
callsites to be untouched by legacy (class unaware) queries.

DEFINE_DYNAMIC_DEBUG_METADATA gets _CLS(cls,) suffix and arg, and
initializes the new .class_id=cls field.  The old name gets the default.

Then, these _CLS(cls,...) modifications are repeated up through the
stack of *dynamic_func_call* macros that use the METADATA initializer,
so as to actually supply the category into it.

NOTES:

_DPRINTK_SITE_UNCLASSED: this symbol is used to initialize all
existing/unclassed pr-debug callsites.  Normally, the default would be
zero, but DRM_UT_CORE "uses" that value, in the sense that 0 is
exposed as a bit position in drm.debug.  Using 15 allows identity
mapping from category to class, avoiding fiddly offsets.

Default .class_id = 15 means that ``echo +p > control`` no longer
toggles ALL the callsites, only the unclassed ones.  This was only
useful for static-branch toggle load testing anyway.

RFC:

The new _CLS macro flavor gets a warning from DRM/dri-devel's CI,
but not from checkpatch (on this subject).

a8f6c71f283e dyndbg: add class_id field and query support
-:141: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
+#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
+	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
+	if (DYNAMIC_DEBUG_BRANCH(id))				\
+		func(&id, ##__VA_ARGS__);			\
 } while (0)

I couldn't fix it with a ``typeof(id) _id = id`` construct.  I haven't
seen the warning myself, on the _CLS extended macro, nor the original.

CC: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       |  7 +++
 include/linux/dynamic_debug.h                 | 54 ++++++++++++++-----
 lib/dynamic_debug.c                           | 48 ++++++++++++++---
 3 files changed, 88 insertions(+), 21 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index a89cfa083155..8ef8d7dcd140 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -35,6 +35,7 @@ Dynamic debug has even more useful features:
    - line number (including ranges of line numbers)
    - module name
    - format string
+   - class number:0-15
 
  * Provides a debugfs control file: ``<debugfs>/dynamic_debug/control``
    which can be read to display the complete list of known debug
@@ -143,6 +144,7 @@ against.  Possible keywords are:::
 		 'module' string |
 		 'format' string |
 		 'line' line-range
+		 'class' integer:[0-15]
 
   line-range ::= lineno |
 		 '-'lineno |
@@ -217,6 +219,11 @@ line
 	line -1605          // the 1605 lines from line 1 to line 1605
 	line 1600-          // all lines from line 1600 to the end of the file
 
+class
+    This expects a single integer in range: 0-15.
+    15 is used/reserved for existing/unclassed callsites,
+    and is defaulted in unless specified to >control
+
 The flags specification comprises a change operation followed
 by one or more flag characters.  The change operation is one
 of the characters::
diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index dce631e678dd..d4b48f3cc6e8 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -6,6 +6,8 @@
 #include <linux/jump_label.h>
 #endif
 
+#include <linux/build_bug.h>
+
 /*
  * An instance of this structure is created in a special
  * ELF section at every dynamic debug callsite.  At runtime,
@@ -21,6 +23,9 @@ struct _ddebug {
 	const char *filename;
 	const char *format;
 	unsigned int lineno:18;
+#define CLS_BITS 4
+	unsigned int class_id:CLS_BITS;
+#define _DPRINTK_SITE_UNCLASSED		((1 << CLS_BITS) - 1)
 	/*
 	 * The flags field controls the behaviour at the callsite.
 	 * The bits here are changed dynamically when the user
@@ -87,7 +92,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 			 const struct ib_device *ibdev,
 			 const char *fmt, ...);
 
-#define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)		\
+#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)	\
 	static struct _ddebug  __aligned(8)			\
 	__section("__dyndbg") name = {				\
 		.modname = KBUILD_MODNAME,			\
@@ -96,8 +101,14 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 		.format = (fmt),				\
 		.lineno = __LINE__,				\
 		.flags = _DPRINTK_FLAGS_DEFAULT,		\
+		.class_id = cls,				\
 		_DPRINTK_KEY_INIT				\
-	}
+	};							\
+	BUILD_BUG_ON_MSG(cls > _DPRINTK_SITE_UNCLASSED,		\
+			 "classid value overflow")
+
+#define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)		\
+	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_SITE_UNCLASSED, fmt)
 
 #ifdef CONFIG_JUMP_LABEL
 
@@ -128,18 +139,26 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
 #endif /* CONFIG_JUMP_LABEL */
 
-#define __dynamic_func_call(id, fmt, func, ...) do {	\
-	DEFINE_DYNAMIC_DEBUG_METADATA(id, fmt);		\
-	if (DYNAMIC_DEBUG_BRANCH(id))			\
-		func(&id, ##__VA_ARGS__);		\
+#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
+	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
+	if (DYNAMIC_DEBUG_BRANCH(id))				\
+		func(&id, ##__VA_ARGS__);			\
 } while (0)
 
-#define __dynamic_func_call_no_desc(id, fmt, func, ...) do {	\
-	DEFINE_DYNAMIC_DEBUG_METADATA(id, fmt);			\
-	if (DYNAMIC_DEBUG_BRANCH(id))				\
-		func(__VA_ARGS__);				\
+#define __dynamic_func_call_no_desc_cls(id, cls, fmt, func, ...) do {	\
+	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);		\
+	if (DYNAMIC_DEBUG_BRANCH(id))					\
+		func(__VA_ARGS__);					\
 } while (0)
 
+#define __dynamic_func_call(id, fmt, func, ...)				\
+	__dynamic_func_call_cls(id, _DPRINTK_SITE_UNCLASSED,		\
+				fmt, func, ##__VA_ARGS__)
+
+#define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
+	__dynamic_func_call_no_desc_cls(id, _DPRINTK_SITE_UNCLASSED,	\
+					fmt, func, ##__VA_ARGS__)
+
 /*
  * "Factory macro" for generating a call to func, guarded by a
  * DYNAMIC_DEBUG_BRANCH. The dynamic debug descriptor will be
@@ -148,15 +167,24 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
  * the varargs. Note that fmt is repeated in invocations of this
  * macro.
  */
+#define _dynamic_func_call_cls(cls, fmt, func, ...)			\
+	__dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
 #define _dynamic_func_call(fmt, func, ...)				\
-	__dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
+	_dynamic_func_call_cls(_DPRINTK_SITE_UNCLASSED, fmt, func, ##__VA_ARGS__)
+
 /*
  * A variant that does the same, except that the descriptor is not
  * passed as the first argument to the function; it is only called
  * with precisely the macro's varargs.
  */
-#define _dynamic_func_call_no_desc(fmt, func, ...)	\
-	__dynamic_func_call_no_desc(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
+#define _dynamic_func_call_no_desc_cls(fmt, cat, func, ...)		\
+	__dynamic_func_call_no_desc_cls(__UNIQUE_ID(ddebug), cat,	\
+					fmt, func, ##__VA_ARGS__)
+
+#define _dynamic_func_call_no_desc(fmt, func, ...)			\
+	__dynamic_func_call_no_desc_cls(__UNIQUE_ID(ddebug),		\
+					_DPRINTK_SITE_UNCLASSED,	\
+					fmt, func, ##__VA_ARGS__)
 
 #define dynamic_pr_debug(fmt, ...)				\
 	_dynamic_func_call(fmt,	__dynamic_pr_debug,		\
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index a56c1286ffa4..ee2129becacc 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -55,6 +55,8 @@ struct ddebug_query {
 	const char *function;
 	const char *format;
 	unsigned int first_lineno, last_lineno;
+	unsigned int class_id;
+	unsigned int class_marked:1;
 };
 
 struct ddebug_iter {
@@ -134,13 +136,13 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 			fmtlen--;
 	}
 
-	v3pr_info("%s: func=\"%s\" file=\"%s\" module=\"%s\" format=\"%.*s\" lineno=%u-%u\n",
-		 msg,
-		 query->function ?: "",
-		 query->filename ?: "",
-		 query->module ?: "",
-		 fmtlen, query->format ?: "",
-		 query->first_lineno, query->last_lineno);
+	v3pr_info("%s: func=\"%s\" file=\"%s\" module=\"%s\" format=\"%.*s\" lineno=%u-%u class=%u\n",
+		  msg,
+		  query->function ?: "",
+		  query->filename ?: "",
+		  query->module ?: "",
+		  fmtlen, query->format ?: "",
+		  query->first_lineno, query->last_lineno, query->class_id);
 }
 
 /*
@@ -170,6 +172,10 @@ static int ddebug_change(const struct ddebug_query *query,
 		for (i = 0; i < dt->num_ddebugs; i++) {
 			struct _ddebug *dp = &dt->ddebugs[i];
 
+			/* match against the class_id, either given or default */
+			if (query->class_id != dp->class_id)
+				continue;
+
 			/* match against the source filename */
 			if (query->filename &&
 			    !match_wildcard(query->filename, dp->filename) &&
@@ -308,6 +314,21 @@ static inline int parse_lineno(const char *str, unsigned int *val)
 	return 0;
 }
 
+static inline int parse_class(struct ddebug_query *query, const char *str)
+{
+	int rc;
+	unsigned int val;
+
+	rc = kstrtouint(str, 10, &val);
+	if (rc < 0 || val > _DPRINTK_SITE_UNCLASSED) {
+		pr_err("expecting class:[0-%d], not %s\n", _DPRINTK_SITE_UNCLASSED, str);
+		return -EINVAL;
+	}
+	query->class_id = val;
+	query->class_marked = 1;
+	return 0;
+}
+
 static int parse_linerange(struct ddebug_query *query, const char *first)
 {
 	char *last = strchr(first, '-');
@@ -421,6 +442,9 @@ static int ddebug_parse_query(char *words[], int nwords,
 		} else if (!strcmp(keyword, "line")) {
 			if (parse_linerange(query, arg))
 				return -EINVAL;
+		} else if (!strcmp(keyword, "class")) {
+			if (parse_class(query, arg))
+				return -EINVAL;
 		} else {
 			pr_err("unknown keyword \"%s\"\n", keyword);
 			return -EINVAL;
@@ -428,6 +452,10 @@ static int ddebug_parse_query(char *words[], int nwords,
 		if (rc)
 			return rc;
 	}
+	/* post-validate the query, set default */
+	if (!query->class_marked)
+		query->class_id = _DPRINTK_SITE_UNCLASSED;
+
 	vpr_info_dq(query, "parsed");
 	return 0;
 }
@@ -900,7 +928,11 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		   iter->table->mod_name, dp->function,
 		   ddebug_describe_flags(dp->flags, &flags));
 	seq_escape(m, dp->format, "\t\r\n\"");
-	seq_puts(m, "\"\n");
+	seq_puts(m, "\"");
+
+	if (dp->class_id != _DPRINTK_SITE_UNCLASSED)
+		seq_printf(m, " cls:%u", dp->class_id);
+	seq_puts(m, "\n");
 
 	return 0;
 }
-- 
2.35.1

