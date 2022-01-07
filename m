Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B0E487272
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 06:30:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19815113236;
	Fri,  7 Jan 2022 05:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E21D113229;
 Fri,  7 Jan 2022 05:29:58 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id o1so3643591ilo.6;
 Thu, 06 Jan 2022 21:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hyui/9XEFQbqGCcGYlhpIzLPjJi33gkvYHXo74A0/3Q=;
 b=IU3vT52kge4VoDiJuwOsA8j+GKfxVgh5ey5XO3SiQoirl1BeyHVYMo3q9CdLNtpcrs
 SGcsf4M78LC6wtFBycVFPoB5fENHSmO4Vb/eBtGxCEDJc934TMbmZwW0crFlubOMlBf0
 XY3zJUPST8ImY4vMCKatw4pF6DgsnMvhzgzhOJRpvM82Y3gvtScwll9A7sDQKM5RYxod
 4ROxDZVJYThqdML5j3sjprkEa9EVX7AKYTfmLUXt6iNlLuJHTbCHz7/rEndJ5kagH2MD
 GiNBT/4z1uCWwd/ulQzeyx2L39/iZUWfZi7Vp9VwgSB1L06MzoIweOQSh2Q78XiPNc1A
 CcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hyui/9XEFQbqGCcGYlhpIzLPjJi33gkvYHXo74A0/3Q=;
 b=A1x9MpRr3RrB5nwxaiRveuoVE0MzUplf1y1JOLxWwQPnBQ0WwAjyeGNE+o475KdCur
 F8K7bsIgtDR9gobrFxI1QILE/jcjlYW2tO2HwPoeeUEH4xSfNg6MrmpGolZv3yWf4GFM
 BE+y9tpY5dPO60j5jq1q1RTl4MBxhER0Sla4KlvrQ8EemHs98WB0gOLX8KsiKcShjh+J
 FQoDHaTeHGZ9tDWEr42TYG1kI2jAIxFzFWQcCGD7iJzYkRenzk9GNzxlj/T74XHr83AK
 Lbeq2J6D6c6xth+v7d4fnoQhzxr7S7hEyGWCsmUhUT4TGVF1mH/aYSSg+owTijxE8VNL
 Op5Q==
X-Gm-Message-State: AOAM530XnaDkuVkat7COKuAA2tQh5YcW75Wy+OOue/B4UUMgDWdg7J7f
 i4HDDqBuun2HvqB78aTf0qU=
X-Google-Smtp-Source: ABdhPJzRNIRXh2SqL/+c3H8HIxlpBdAWgefXUkquh+C0fyO1fTdoZd3yCc+Z25Fbeh8t3hY83ngwJg==
X-Received: by 2002:a05:6e02:18ce:: with SMTP id
 s14mr28271765ilu.0.1641533397322; 
 Thu, 06 Jan 2022 21:29:57 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id c18sm1843446iod.18.2022.01.06.21.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 21:29:56 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, linux@rasmusvillemoes.dk,
 rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v11 06/19] dyndbg: add class_id to callsites
Date: Thu,  6 Jan 2022 22:29:29 -0700
Message-Id: <20220107052942.1349447-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107052942.1349447-1-jim.cromie@gmail.com>
References: <20220107052942.1349447-1-jim.cromie@gmail.com>
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
Cc: quic_saipraka@quicinc.com, arnd@arndb.de, jim.cromie@gmail.com,
 catalin.marinas@arm.com, linux-arm-msm@vger.kernel.org, mingo@redhat.com,
 quic_psodagud@quicinc.com, maz@kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM defines/uses a 10 enum drm_debug_category to create exclusive
classes of debug messages.  To support this directly in dynamic-debug,
add the following:

- struct _ddebug.class_id	4 bits is enough for drm_debug_category

and the query support:

- struct _ddebug_query.class_id
- ddebug_change		- looks for "class" keyword
- parse_class   	- accepts uint: 1-15, sets query->class_id
- vpr_info_dq		- displays new field
- ddebug_proc_show	- append column with "cls:%d"

With this patch, the following cmd is accepted w/o error:

  #> echo module drm class 2 +p > /proc/dynamic_debug/control

It currently does nothing, since no pr_debug callsites can yet be
initialized with class_id != 0.

Note that this is specifically an error:

  #> echo module drm class 0 +p > /proc/dynamic_debug/control

parse_class() prohibits this, we reserve "class 0" as a non-category.
This means that all good inputs are true, and 0 is special.

NOTES:

Patch extends DEFINE_DYNAMIC_DEBUG_METADATA() with a _CLS suffix, and
a new cls param, and re-adds old name using extended name.  Then,
repeats those mods up through the Factory macros that use the
METADATA* .data constructors, so as to actually supply the category
into the initializer.

CC: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       | 11 +++++
 include/linux/dynamic_debug.h                 | 41 +++++++++++++------
 lib/dynamic_debug.c                           | 30 ++++++++++++--
 3 files changed, 67 insertions(+), 15 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 3c8f104a143f..7e1322660b10 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -35,6 +35,7 @@ Dynamic debug has even more useful features:
    - line number (including ranges of line numbers)
    - module name
    - format string
+   - class number:1-15
 
  * Provides a debugfs control file: ``<debugfs>/dynamic_debug/control``
    which can be read to display the complete list of known debug
@@ -143,6 +144,7 @@ against.  Possible keywords are:::
 		 'module' string |
 		 'format' string |
 		 'line' line-range
+		 'class' integer:[1-15]
 
   line-range ::= lineno |
 		 '-'lineno |
@@ -217,6 +219,15 @@ line
 	line -1605          // the 1605 lines from line 1 to line 1605
 	line 1600-          // all lines from line 1600 to the end of the file
 
+class
+    This expects a single integer, in range: 1-15.
+    Using this specification constrains to exact class_id matches.
+    This is intended for DRM.debug enumerated categories, plus 1.
+    class_id = 0 is reserved, returns an error currently.
+
+    This differs from the others primarily in that it is not displayed
+    in the control file currently, add later as an extra column.
+
 The flags specification comprises a change operation followed
 by one or more flag characters.  The change operation is one
 of the characters::
diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index e0c2d7c0938b..e9483cd9ac1c 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -20,6 +20,7 @@ struct _ddebug {
 	const char *function;
 	const char *filename;
 	const char *format;
+	unsigned int class_id:4;
 	unsigned int lineno:18;
 	/*
 	 * The flags field controls the behaviour at the callsite.
@@ -91,7 +92,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 			 const struct ib_device *ibdev,
 			 const char *fmt, ...);
 
-#define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)		\
+#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)	\
 	static struct _ddebug  __aligned(8)			\
 	__section("__dyndbg") name = {				\
 		.modname = KBUILD_MODNAME,			\
@@ -100,9 +101,13 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 		.format = (fmt),				\
 		.lineno = __LINE__,				\
 		.flags = _DPRINTK_FLAGS_DEFAULT,		\
+		.class_id = cls,				\
 		_DPRINTK_KEY_INIT				\
 	}
 
+#define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)	\
+	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, 0, fmt)
+
 #ifdef CONFIG_JUMP_LABEL
 
 #ifdef DEBUG
@@ -132,17 +137,21 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
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
+#define __dynamic_func_call(id, fmt, func, ...)				\
+	__dynamic_func_call_cls(id, 0, fmt, func, ##__VA_ARGS__)
 
-#define __dynamic_func_call_no_desc(id, fmt, func, ...) do {	\
-	DEFINE_DYNAMIC_DEBUG_METADATA(id, fmt);			\
-	if (DYNAMIC_DEBUG_BRANCH(id))				\
-		func(__VA_ARGS__);				\
+#define __dynamic_func_call_no_desc_cls(id, cls, fmt, func, ...) do {	\
+	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);		\
+	if (DYNAMIC_DEBUG_BRANCH(id))					\
+		func(__VA_ARGS__);					\
 } while (0)
+#define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
+	__dynamic_func_call_no_desc_cls(id, 0, fmt, func, ##__VA_ARGS__)
 
 /*
  * "Factory macro" for generating a call to func, guarded by a
@@ -152,15 +161,23 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
  * the varargs. Note that fmt is repeated in invocations of this
  * macro.
  */
+#define _dynamic_func_call_cls(cls, fmt, func, ...)			\
+	__dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
 #define _dynamic_func_call(fmt, func, ...)				\
-	__dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
+	__dynamic_func_call_cls(__UNIQUE_ID(ddebug), 0, fmt, func, ##__VA_ARGS__)
+
 /*
  * A variant that does the same, except that the descriptor is not
  * passed as the first argument to the function; it is only called
  * with precisely the macro's varargs.
  */
-#define _dynamic_func_call_no_desc(fmt, func, ...)	\
-	__dynamic_func_call_no_desc(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
+#define _dynamic_func_call_no_desc_cls(fmt, eCat, func, ...)		\
+	__dynamic_func_call_no_desc_cls(__UNIQUE_ID(ddebug), eCat,	\
+					fmt, func, ##__VA_ARGS__)
+
+#define _dynamic_func_call_no_desc(fmt, func, ...)		\
+	__dynamic_func_call_no_desc_cls(__UNIQUE_ID(ddebug), 0,	\
+					fmt, func, ##__VA_ARGS__)
 
 #define dynamic_pr_debug(fmt, ...)				\
 	_dynamic_func_call(fmt,	__dynamic_pr_debug,		\
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 2efdc4f1553f..419d4664e724 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -58,6 +58,7 @@ struct ddebug_query {
 	const char *function;
 	const char *format;
 	unsigned int first_lineno, last_lineno;
+	unsigned int class_id;
 };
 
 struct ddebug_iter {
@@ -138,13 +139,13 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 			fmtlen--;
 	}
 
-	v3pr_info("%s: func=\"%s\" file=\"%s\" module=\"%s\" format=\"%.*s\" lineno=%u-%u\n",
+	v3pr_info("%s: func=\"%s\" file=\"%s\" module=\"%s\" format=\"%.*s\" lineno=%u-%u class=%u\n",
 		 msg,
 		 query->function ?: "",
 		 query->filename ?: "",
 		 query->module ?: "",
 		 fmtlen, query->format ?: "",
-		 query->first_lineno, query->last_lineno);
+		 query->first_lineno, query->last_lineno, query->class_id);
 }
 
 /*
@@ -174,6 +175,10 @@ static int ddebug_change(const struct ddebug_query *query,
 		for (i = 0; i < dt->num_ddebugs; i++) {
 			struct _ddebug *dp = &dt->ddebugs[i];
 
+			/* match against the class_id, if > 0 */
+			if (query->class_id && query->class_id != dp->class_id)
+				continue;
+
 			/* match against the source filename */
 			if (query->filename &&
 			    !match_wildcard(query->filename, dp->filename) &&
@@ -310,6 +315,22 @@ static inline int parse_lineno(const char *str, unsigned int *val)
 	}
 	return 0;
 }
+/*
+ * class_id is 0-15. 0 is default, is nonsense in active search
+ */
+static inline int parse_class(struct ddebug_query *query, const char *str)
+{
+	int rc;
+	unsigned int val;
+
+	rc = kstrtouint(str, 10, &val);
+	if (rc < 0 || !val || val > 15) {
+		pr_err("expecting class:[1-15], not %s\n", str);
+		return -EINVAL;
+	}
+	query->class_id = val;
+	return 0;
+}
 
 static int parse_linerange(struct ddebug_query *query, const char *first)
 {
@@ -424,6 +445,9 @@ static int ddebug_parse_query(char *words[], int nwords,
 		} else if (!strcmp(keyword, "line")) {
 			if (parse_linerange(query, arg))
 				return -EINVAL;
+		} else if (!strcmp(keyword, "class")) {
+			if (parse_class(query, arg))
+				return -EINVAL;
 		} else {
 			pr_err("unknown keyword \"%s\"\n", keyword);
 			return -EINVAL;
@@ -1007,7 +1031,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		   iter->table->mod_name, dp->function,
 		   ddebug_describe_flags(dp->flags, &flags));
 	seq_escape(m, dp->format, "\t\r\n\"");
-	seq_puts(m, "\"\n");
+	seq_printf(m, "\" cls:%u\n", dp->class_id);
 
 	return 0;
 }
-- 
2.33.1

