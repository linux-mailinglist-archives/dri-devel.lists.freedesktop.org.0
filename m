Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E44457BA2F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E955A8F4E7;
	Wed, 20 Jul 2022 15:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA098EE21;
 Wed, 20 Jul 2022 15:33:08 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id l24so14528861ion.13;
 Wed, 20 Jul 2022 08:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nhd8qJ7I05C4NfInmDTLZUmBRFQDnJsPcIiw+jpRsQw=;
 b=VqBSJlTpGMxp0Cn0j4L8emVMeBwdl7lPayGqja9UiJqhfzK9sgaRRTLONPpNRWgB1Z
 5dQHfpdpbVuJWAH9z0UtcfwGSE26WxUObjIy5UIQAgEUNNai3gqyQgS9zMP4AP+4GH9V
 I94I2ig6fylnm6rV8/zjqIwUPjP3DTdptlAJ7u543VKhz62hnxmbRII82zebVDQiMYpy
 RI1NI3CQZHpAwE8ZpkaofmF2HdegLLmzHsRQIb3NW7VBbtZIsAQQ4F8IOt0slE/5LALj
 Co3eB1zbMfFTg/Uhs9k1OW1kZhQtSFUoTfb69nCvWqUtcgyMfMUTlh2D+BFLwurkiJfg
 +SLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nhd8qJ7I05C4NfInmDTLZUmBRFQDnJsPcIiw+jpRsQw=;
 b=FtUGJRqsbxMU2BKxf4r/AX6yXizFsVsfvRSluVzCoYq3MGie1UMhDAY7OA1RgiHZGe
 xekLVD2YIRXKiUFbVyiIJ23/JJKEi2i8xc5/SJ2XTOKUQACtFnBNXF2ZStcjh56myqA7
 8A71cr4xDCy1PdguiPulc6jdXEUudYPE98nUfWX/7IrERtC5YDEL6bOwiaj07Obac2Hz
 ljq1fveBRjSVjJ04gYUyHgthQyZ+Xq2PVxCKjO3DhT0J07EbTLFqRua+xWWrKKCn/pkT
 obS0tkpN+ZRzSKcynvbeF2iCQK2ckvKrCdMM6np8Oie2J/rHe4BVIqA7yuZXN3+tCaxh
 yUCw==
X-Gm-Message-State: AJIora8kMP+NrvBlogoXG5LL9Q5lN1CoPhQbr2onW8nGc2bxyceBJ1BW
 Hsjt9wCqSqffNaPQzaGpMdcGLXjydAOYDg==
X-Google-Smtp-Source: AGRyM1vmjWVK7Bm1qOBEmHIotttN2nZUGEOl0QuHVd0wPh0uTAGU5PKDQev0QbPKCNKGBlkJa+gS0w==
X-Received: by 2002:a05:6638:2642:b0:33f:5172:e77 with SMTP id
 n2-20020a056638264200b0033f51720e77mr19654846jat.85.1658331187195; 
 Wed, 20 Jul 2022 08:33:07 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:06 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 10/41] dyndbg: add class_id to pr_debug callsites
Date: Wed, 20 Jul 2022 09:32:02 -0600
Message-Id: <20220720153233.144129-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
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

DRM issues ~10 exclusive categories of debug messages; to represent
this directly in dyndbg, add a new field: struct _ddebug.class_id:5.

This gives us 32 classes, which is a practical usability limit
with a bitmap interface:

  #> echo 0x012345678 > /sys/module/drm/parameters/debug

All existing callsites are initialized with _DPRINTK_CLASS_DFLT, which
is 2^5-1.  This reserves 0-30 for use in new categorized/class'd
pr_debugs, which fits perfectly with natural enums (ints: 0..N).

Then extend the init macro: DEFINE_DYNAMIC_DEBUG_METADATA() with
_CLS(cls, ...), and redef old name using extended name.

And extend the factory macro callchain with _cls() versions to provide
the callsite.class_id, with old-names passing _DPRINTK_CLASS_DFLT.

This sets us up to create class'd prdebug callsites (class'd callsites
are those with .class_id != _DPRINTK_CLASS_DFLT).

No behavior change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 71 +++++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 16 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 8d9eec5f6d8b..d1429812be2e 100644
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
+#define CLS_BITS 5
+	unsigned int class_id:CLS_BITS;
+#define _DPRINTK_CLASS_DFLT		((1 << CLS_BITS) - 1)
 	/*
 	 * The flags field controls the behaviour at the callsite.
 	 * The bits here are changed dynamically when the user
@@ -84,7 +89,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 			 const struct ib_device *ibdev,
 			 const char *fmt, ...);
 
-#define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)		\
+#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)	\
 	static struct _ddebug  __aligned(8)			\
 	__section("__dyndbg") name = {				\
 		.modname = KBUILD_MODNAME,			\
@@ -93,8 +98,14 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
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
 
@@ -125,17 +136,34 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
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
@@ -145,22 +173,33 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
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
2.36.1

