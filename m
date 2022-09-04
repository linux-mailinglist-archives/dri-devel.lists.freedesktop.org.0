Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A544C5AC773
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F5110E253;
	Sun,  4 Sep 2022 21:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF40810E252;
 Sun,  4 Sep 2022 21:42:48 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id l16so3889171ilj.2;
 Sun, 04 Sep 2022 14:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Rm4xzfpSQrPPtx8VSoa62A66wbCtcyyvqJRRKDZL61w=;
 b=Ztu8i1PzYXrrBIVkF2DTluW99gf/zMexybwuV049ePkV9na4V8i7w1QCN6zxYTzykr
 gWJHK2OLUi+Boeahy3lUbVhZndOD18gcDpF5to3yTILayNYKZ4bgsx/ilM5F1cusady1
 0detNR1/ZaP4mXE3QDeOJN3Ua6Em4qgA+SRN1gU8L2pJeKLHb8ULMMjczUSsBwLn+TZH
 Fl7fIusVg1NIux1kE9DvOselusKgLkhoeoH81jzxT3c3JfNvfJFAW9TRgtjIQDm0ayCV
 KSsA2K0pqsDfZfpv6h3kPC2JEitI9SjrLzqxJmiXXq4ZsLTfwXk71OymdVL0+ct6JMQE
 1v3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Rm4xzfpSQrPPtx8VSoa62A66wbCtcyyvqJRRKDZL61w=;
 b=dgq5/+UDGlMz4laV8b7orThFS0M73/fcZ2Ba9Zw0+bKhOiBVLebeONyzOoggppwf+a
 +TRcZ+94cuAa6VKt4QM91vlbO22izXDBf5oOOmgDBYcWJ35IJB8poA5KnrBKTNnwnHyH
 dgPtGT77mlNsU/XsNpSyT6i/xWA+zmFFY/Qt9YGtUMUQb4MyDe/yh0nh9ekQlMDLlKvh
 KZY6RCb5/rwORzJvGHqvvuYP/w9Lzrllg9MpDQM6ArR1wIqjVbsVn/+dst1TRIEMkWwz
 ZYKhhnhu7FFuVyZ/txJoy/11mNEEk9GTnvdyBdkZhfc+C3LqlWBcXtqLaWnk1CIKBZAe
 ueDA==
X-Gm-Message-State: ACgBeo3IXJmK/q0RTxr98+wAQT2qLUi+jSZIBIKB9rS2yJgasBf+yPh0
 xP5w9zXBoiWVtGkcBkwRGjY=
X-Google-Smtp-Source: AA6agR7t0GY+1q5uTZb5We3a9PhT8Nv5YKHpftI6ooRy+sYIdJ0LN14CtXVDeZuK1HJNkFdvbQHENw==
X-Received: by 2002:a92:dc8c:0:b0:2e9:469f:e5a3 with SMTP id
 c12-20020a92dc8c000000b002e9469fe5a3mr23264515iln.251.1662327768480; 
 Sun, 04 Sep 2022 14:42:48 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:48 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 40/57] dyndbg: abstraction macros for modname, function,
 filename fields
Date: Sun,  4 Sep 2022 15:41:17 -0600
Message-Id: <20220904214134.408619-41-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .data table built of struct _ddebug[]s has about 40% repetition in
the "decorator" fields: modname, function, filename.  The real fix is
to "normalize the db", but 1st we need a layer of accessor macros,
giving us just one field deref to alter later.

So:
 define 3 field-abstraction macros: desc_{modname,function,filename}(desc).
 replace all raw field refs in lib/dynamic_debug.c with them.

The macros protect against NULL pointer derefs, substituting "_na_"
otherwise.  This provides a generic guard, opening options to drop the
contents of __dyndbg_sites[] opportunistically, and trim kernel/module
data.  DRM, which could use only .class_id to control drm.debug, could
drop them.

The 3 macros use a common foundation: _ddebug_map_site(), which will
adapt to follow the coming table-split.

Also change field names; adding '_' prefix to insure that bare
field-refs are found and fixed.  Most field uses get the macros,
except for dynamic_debug_init(), which will need to follow the
rearrangements.

NOTE: macros are private, not currently for general use.

trace/events/dyndbg.h was a candidate to use these macros, for which I
included the header. On rethink, these macros are wrong abstraction
for tracing; better to expose a dynamic_prefix_emit(1) flavor, and use
it in TP_printk to "decorate" enabled trace-logs like it does for
sys-logs.

So this patch removes the raw field-refs rather than use the macros.
I left the include to mark the intention to use privatish interfaces,
see if it draws objections or compile errs.

[1] fills caller provided char-buffer, perhaps not ideal for tracefs.
A fixed max-size-possible per-callsite (or globally) is practical, but
the struct _ddebug_site * val is probably best; it refs a prdbg's
site-rec of a builtin or loadable module, which is unique over the
pertinent lifetime, and has all the info.

WAG,TLDR: "decorating" could be defered until `cat trace`, modulo
loadable sites[] data being needed to render after module is unloaded.

no functional changes.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

TP-print-dont-use-desc-foo
---
 include/linux/dynamic_debug.h | 12 ++++++------
 include/trace/events/dyndbg.h |  7 +++----
 lib/dynamic_debug.c           | 37 ++++++++++++++++++++++-------------
 3 files changed, 32 insertions(+), 24 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 04f49df308a7..e04f5b0a31e2 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -18,9 +18,9 @@ struct _ddebug {
 	 * These fields are used to drive the user interface
 	 * for selecting and displaying debug callsites.
 	 */
-	const char *modname;
-	const char *function;
-	const char *filename;
+	const char *_modname;
+	const char *_function;
+	const char *_filename;
 	const char *format;
 	unsigned int lineno:18;
 #define CLS_BITS 6
@@ -166,9 +166,9 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 #define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)	\
 	static struct _ddebug  __aligned(8)			\
 	__section("__dyndbg") name = {				\
-		.modname = KBUILD_MODNAME,			\
-		.function = __func__,				\
-		.filename = __FILE__,				\
+		._modname = KBUILD_MODNAME,			\
+		._function = __func__,				\
+		._filename = __FILE__,				\
 		.format = (fmt),				\
 		.lineno = __LINE__,				\
 		.flags = _DPRINTK_FLAGS_DEFAULT,		\
diff --git a/include/trace/events/dyndbg.h b/include/trace/events/dyndbg.h
index e19fcb56566c..2997289c0e3f 100644
--- a/include/trace/events/dyndbg.h
+++ b/include/trace/events/dyndbg.h
@@ -6,6 +6,7 @@
 #define _TRACE_DYNDBG_H
 
 #include <linux/tracepoint.h>
+#include <linux/dynamic_debug.h>
 
 /* capture pr_debug() callsite descriptor and message */
 TRACE_EVENT(prdbg,
@@ -32,8 +33,7 @@ TRACE_EVENT(prdbg,
 		    __get_str(msg)[len] = 0;
 		    ),
 
-	    TP_printk("%s.%s %s", __entry->desc->modname,
-		      __entry->desc->function, __get_str(msg))
+	    TP_printk("%s", __get_str(msg))
 );
 
 /* capture dev_dbg() callsite descriptor, device, and message */
@@ -64,8 +64,7 @@ TRACE_EVENT(devdbg,
 		    __get_str(msg)[len] = 0;
 		    ),
 
-	    TP_printk("%s.%s %s", __entry->desc->modname,
-		      __entry->desc->function, __get_str(msg))
+	    TP_printk("%s", __get_str(msg))
 );
 
 #endif /* _TRACE_DYNDBG_H */
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 0870e939f255..5a22708679a7 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -167,6 +167,15 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	return NULL;
 }
 
+static inline struct _ddebug_site * _ddebug_map_site(const struct _ddebug *desc)
+{
+	return desc->site;
+}
+#define _desc_field(desc, _fld)	(desc ? (_ddebug_map_site(desc)->_fld) : "_na_")
+#define desc_modname(desc)	_desc_field(desc, _modname)
+#define desc_function(desc)	_desc_field(desc, _function)
+#define desc_filename(desc)	_desc_field(desc, _filename)
+
 #define __outvar /* filled by callee */
 /*
  * Search the tables for _ddebug's which match the given `query' and
@@ -212,16 +221,16 @@ static int ddebug_change(const struct ddebug_query *query,
 
 			/* match against the source filename */
 			if (query->filename &&
-			    !match_wildcard(query->filename, dp->filename) &&
+			    !match_wildcard(query->filename, desc_filename(dp)) &&
 			    !match_wildcard(query->filename,
-					   kbasename(dp->filename)) &&
+					    kbasename(desc_filename(dp))) &&
 			    !match_wildcard(query->filename,
-					   trim_prefix(dp->filename)))
+					    trim_prefix(desc_filename(dp))))
 				continue;
 
 			/* match against the function */
 			if (query->function &&
-			    !match_wildcard(query->function, dp->function))
+			    !match_wildcard(query->function, desc_function(dp)))
 				continue;
 
 			/* match against the format */
@@ -257,9 +266,9 @@ static int ddebug_change(const struct ddebug_query *query,
 				static_branch_enable(&dp->key.dd_key_true);
 			}
 #endif
-			v4pr_info("changed %s:%d [%s]%s %s => %s\n",
-				  trim_prefix(dp->filename), dp->lineno,
-				  dt->mod_name, dp->function,
+			v4pr_info("changed %s:%d [%s]%s %s to %s\n",
+				  trim_prefix(desc_filename(dp)), dp->lineno,
+				  dt->mod_name, desc_function(dp),
 				  ddebug_describe_flags(dp->flags, &fbuf),
 				  ddebug_describe_flags(newflags, &nbuf));
 			dp->flags = newflags;
@@ -836,10 +845,10 @@ static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
 	pos_after_tid = pos;
 	if (desc->flags & _DPRINTK_FLAGS_INCL_MODNAME)
 		pos += snprintf(buf + pos, remaining(pos), "%s:",
-				desc->modname);
+				desc_modname(desc));
 	if (desc->flags & _DPRINTK_FLAGS_INCL_FUNCNAME)
 		pos += snprintf(buf + pos, remaining(pos), "%s:",
-				desc->function);
+				desc_function(desc));
 	if (desc->flags & _DPRINTK_FLAGS_INCL_LINENO)
 		pos += snprintf(buf + pos, remaining(pos), "%d:",
 				desc->lineno);
@@ -1241,8 +1250,8 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 	}
 
 	seq_printf(m, "%s:%u [%s]%s =%s \"",
-		   trim_prefix(dp->filename), dp->lineno,
-		   iter->table->mod_name, dp->function,
+		   trim_prefix(desc_filename(dp)), dp->lineno,
+		   iter->table->mod_name, desc_function(dp),
 		   ddebug_describe_flags(dp->flags, &flags));
 	seq_escape_str(m, dp->format, ESCAPE_SPACE, "\t\r\n\"");
 	seq_puts(m, "\"");
@@ -1504,12 +1513,12 @@ static int __init dynamic_debug_init(void)
 	}
 
 	iter = iter_mod_start = __start___dyndbg;
-	modname = iter->modname;
+	modname = iter->_modname;
 	i = mod_sites = mod_ct = 0;
 
 	for (; iter < __stop___dyndbg; iter++, i++, mod_sites++) {
 
-		if (strcmp(modname, iter->modname)) {
+		if (strcmp(modname, iter->_modname)) {
 			mod_ct++;
 			di.num_descs = mod_sites;
 			di.descs = iter_mod_start;
@@ -1518,7 +1527,7 @@ static int __init dynamic_debug_init(void)
 				goto out_err;
 
 			mod_sites = 0;
-			modname = iter->modname;
+			modname = iter->_modname;
 			iter_mod_start = iter;
 		}
 	}
-- 
2.37.2

