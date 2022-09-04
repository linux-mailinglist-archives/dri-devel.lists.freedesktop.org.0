Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B41145AC723
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3755D10E2CE;
	Sun,  4 Sep 2022 21:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAEF10E135;
 Sun,  4 Sep 2022 21:42:23 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id s11so3868035ilt.7;
 Sun, 04 Sep 2022 14:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=xIjcpB1yObanMGjMFeMKYjIQWCM49hxUe0Q+YC489GU=;
 b=MLaOUG1eQyDNFysR3kFQ1CuvqHjhT0aQXApMqF4gTtmKSNtSjX/I5UlLfKj7GXM5dJ
 ERh08+wfPW/pY1uDfq/mQRn9W4pI+ZknWQk0O9BgR5Mk9AjPJWG5zDfHLcpmenzVQTzo
 579HyQFoNP2ls47VGJ5G3weYDitOixMG/+//9S/xiAYoLVVWBuJc+DV/rYYNjDLyRLfb
 HNDjMkbf5rFexzATxXpZ556L2eM2E51BpzYlMdQx5ufJQGJ8cauf0lUEASuflYmkRnFq
 wm3CJLRAjYbtQSKbcHHo9KjCQC9bF3ISuBv6sJ+vPDbFd2H4Yl4b8qIqAqmbssefUuAQ
 LhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xIjcpB1yObanMGjMFeMKYjIQWCM49hxUe0Q+YC489GU=;
 b=dnyMjdQi4CDVcB0bDokE1qY0QNKe0Hx5/Q3cwNIUpaoORwakQh9sBdFrVirKxWnuop
 b/QVYh3xw4X9ewj/SpZxQSH83hFV1lFKNAZAr7OlDZa152ULGN0n2DTapG3Pg7CbjOui
 xKfZZZa7kZn8ERdtf37HIo0BaBswXQQhNr9g6qBPlSoP7uYGM1KAkKv6nYa5OvJjCLZq
 WjuMv3jmHxv3HTd/btM1UK55LT6vqaodsTsUQdMklH53o3b3c0SaJOBVZdVMAMFA6/do
 ZN3It2tIys9UssHYV+ehFMZkWetZUKeLMZbycURQ5MSsf8d/JnpxliWGDj7TW4dxRRA3
 964g==
X-Gm-Message-State: ACgBeo2XKk06gCAQUkiDztQKyWOONyEwouZAdccgcNv3mifxw9T/IGjr
 5fwCXss9vVfv5j8altTQRts=
X-Google-Smtp-Source: AA6agR67iR6BYXhMU24o7aSNMqzyMctDSZZTQcZ/yxizOCzV0f4LJSYbYSri4MSdNRuTGB/KPRJVfw==
X-Received: by 2002:a05:6e02:15c9:b0:2e1:a5b6:7e25 with SMTP id
 q9-20020a056e0215c900b002e1a5b67e25mr23241731ilu.185.1662327741691; 
 Sun, 04 Sep 2022 14:42:21 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:21 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 12/57] dyndbg: add class_id to pr_debug callsites
Date: Sun,  4 Sep 2022 15:40:49 -0600
Message-Id: <20220904214134.408619-13-jim.cromie@gmail.com>
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
Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, daniel.vetter@ffwll.ch,
 linux@rasmusvillemoes.dk, seanpaul@chromium.org, joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM issues ~10 exclusive categories of debug messages; to represent
this directly in dyndbg, add a new 6-bit field: struct _ddebug.class_id.
This gives us 64 classes, which should be more than enough.

  #> echo 0x012345678 > /sys/module/drm/parameters/debug

All existing callsites are initialized with _DPRINTK_CLASS_DFLT, which
is 2^6-1.  This reserves 0-62 for use in new categorized/class'd
pr_debugs, which fits perfectly with natural enums (ints: 0..N).

Thats done by extending the init macro: DEFINE_DYNAMIC_DEBUG_METADATA()
with _CLS(cls, ...) suffix, and redefing old name using extended name.

Then extend the factory macro callchain with _cls() versions to provide
the callsite.class_id, with old-names passing _DPRINTK_CLASS_DFLT.

This sets us up to create class'd prdebug callsites (class'd callsites
are those with .class_id != _DPRINTK_CLASS_DFLT).

No behavior change.

cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 71 +++++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 16 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 6a2001250da1..633f4e463766 100644
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
+#define CLS_BITS 6
+	unsigned int class_id:CLS_BITS;
+#define _DPRINTK_CLASS_DFLT		((1 << CLS_BITS) - 1)
 	/*
 	 * The flags field controls the behaviour at the callsite.
 	 * The bits here are changed dynamically when the user
@@ -88,7 +93,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 			 const struct ib_device *ibdev,
 			 const char *fmt, ...);
 
-#define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)		\
+#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)	\
 	static struct _ddebug  __aligned(8)			\
 	__section("__dyndbg") name = {				\
 		.modname = KBUILD_MODNAME,			\
@@ -97,8 +102,14 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 		.format = (fmt),				\
 		.lineno = __LINE__,				\
 		.flags = _DPRINTK_FLAGS_DEFAULT,		\
+		.class_id = cls,				\
 		_DPRINTK_KEY_INIT				\
-	}
+	};							\
+	BUILD_BUG_ON_MSG(cls > _DPRINTK_CLASS_DFLT,		\
+			 "classid value overflow")
+
+#define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)		\
+	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt)
 
 #ifdef CONFIG_JUMP_LABEL
 
@@ -129,17 +140,34 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
 #endif /* CONFIG_JUMP_LABEL */
 
-#define __dynamic_func_call(id, fmt, func, ...) do {	\
-	DEFINE_DYNAMIC_DEBUG_METADATA(id, fmt);		\
-	if (DYNAMIC_DEBUG_BRANCH(id))			\
-		func(&id, ##__VA_ARGS__);		\
-} while (0)
-
-#define __dynamic_func_call_no_desc(id, fmt, func, ...) do {	\
-	DEFINE_DYNAMIC_DEBUG_METADATA(id, fmt);			\
+/*
+ * Factory macros: ($prefix)dynamic_func_call($suffix)
+ *
+ * Lower layer (with __ prefix) gets the callsite metadata, and wraps
+ * the func inside a debug-branch/static-key construct.  Upper layer
+ * (with _ prefix) does the UNIQUE_ID once, so that lower can ref the
+ * name/label multiple times, and tie the elements together.
+ * Multiple flavors:
+ * (|_cls):	adds in _DPRINT_CLASS_DFLT as needed
+ * (|_no_desc):	former gets callsite descriptor as 1st arg (for prdbgs)
+ */
+#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
+	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
 	if (DYNAMIC_DEBUG_BRANCH(id))				\
-		func(__VA_ARGS__);				\
+		func(&id, ##__VA_ARGS__);			\
 } while (0)
+#define __dynamic_func_call(id, fmt, func, ...)				\
+	__dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,		\
+				func, ##__VA_ARGS__)
+
+#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) do {	\
+	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);		\
+	if (DYNAMIC_DEBUG_BRANCH(id))					\
+		func(__VA_ARGS__);					\
+} while (0)
+#define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
+	__dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,	\
+					fmt, func, ##__VA_ARGS__)
 
 /*
  * "Factory macro" for generating a call to func, guarded by a
@@ -149,22 +177,33 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
  * the varargs. Note that fmt is repeated in invocations of this
  * macro.
  */
+#define _dynamic_func_call_cls(cls, fmt, func, ...)			\
+	__dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
 #define _dynamic_func_call(fmt, func, ...)				\
-	__dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
+	_dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
+
 /*
  * A variant that does the same, except that the descriptor is not
  * passed as the first argument to the function; it is only called
  * with precisely the macro's varargs.
  */
-#define _dynamic_func_call_no_desc(fmt, func, ...)	\
-	__dynamic_func_call_no_desc(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
+#define _dynamic_func_call_cls_no_desc(cls, fmt, func, ...)		\
+	__dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,	\
+					func, ##__VA_ARGS__)
+#define _dynamic_func_call_no_desc(fmt, func, ...)			\
+	_dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,	\
+				       func, ##__VA_ARGS__)
+
+#define dynamic_pr_debug_cls(cls, fmt, ...)				\
+	_dynamic_func_call_cls(cls, fmt, __dynamic_pr_debug,		\
+			   pr_fmt(fmt), ##__VA_ARGS__)
 
 #define dynamic_pr_debug(fmt, ...)				\
-	_dynamic_func_call(fmt,	__dynamic_pr_debug,		\
+	_dynamic_func_call(fmt, __dynamic_pr_debug,		\
 			   pr_fmt(fmt), ##__VA_ARGS__)
 
 #define dynamic_dev_dbg(dev, fmt, ...)				\
-	_dynamic_func_call(fmt,__dynamic_dev_dbg, 		\
+	_dynamic_func_call(fmt, __dynamic_dev_dbg, 		\
 			   dev, fmt, ##__VA_ARGS__)
 
 #define dynamic_netdev_dbg(dev, fmt, ...)			\
-- 
2.37.2

