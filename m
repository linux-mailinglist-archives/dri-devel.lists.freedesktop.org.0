Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7211577B42
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3F8A9C82;
	Mon, 18 Jul 2022 06:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B060A9C7E;
 Mon, 18 Jul 2022 06:38:29 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id u20so8541425iob.8;
 Sun, 17 Jul 2022 23:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nhd8qJ7I05C4NfInmDTLZUmBRFQDnJsPcIiw+jpRsQw=;
 b=L99eaSkCTSA35MhKz0x7C9xNYgKSHDL/L/XePjAJsgfJYzWhyXwwgNNY9pmEV1jOou
 7uN6opNRb9erRJAvM5i6B1PgtmDDEJumrTddNbqBqmzXgA7Nafa7LeXrpsCpSw0WY1BV
 CbnvSFytGopwIUkmGPdmhyBsn6TkI0l+RURb1nC+xgyYXoyI6p9z2rY9RVYJMzLCdwW3
 JOAo2evBdQV2TM6qvtaXZWC4x6WZ5q/kxyx/8P7E4eEEMoBfIjf41adf1PSSbBhQdpqI
 h9ibsR3Z8NCNu3MQrJOPS2fCdLMyosxWpz6UiiueOUU3Z6k6UdcW3kbVT3y2xIo5HaqV
 3RLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nhd8qJ7I05C4NfInmDTLZUmBRFQDnJsPcIiw+jpRsQw=;
 b=D1N9Cn/VrP+9TVEsjh7g/cV8j/IUAKoHPoKeiUvLFpj7gsbSSk0B9XfFdm+berB+Nb
 6vW+6kxbEaRYdSKLQ7aP/nSy3uUeAR74Js3KepDetrBfTfTAGIuAm1LJTk37/qk6Z4JA
 sEekyFFP1ZtDoLANF0Pf1FFpsss6NWqS65LCo9IevukrskjSqwbtgoEMPYC2k3YquM8M
 5NJkjQUsJmi9CC08Te2vOwOiS/KPC6ayawmtMNabdHW4kQ62Yqp8xjW/9a7V177/yZho
 HufNHRKFMAibfuiV/Swfl9XaYg1M8fbkVvcLnKbg5F5HcLdEPK4brzn9SBIx5Jvx6/Jk
 yqCQ==
X-Gm-Message-State: AJIora864FiSBE9B5yAtqTpeWJOrinhYRvA1YdaWU2sc3wlRoC83gqmQ
 ATQ8vQDc374G+24LD1t2Pic=
X-Google-Smtp-Source: AGRyM1uS1u733ovErXQrEskbv/gQ/LdDNrgYNlubXAGs/kcaW6UqXmzr1O4pBXSokm5CH3mHJOML2w==
X-Received: by 2002:a5d:9b85:0:b0:675:31ec:97dd with SMTP id
 r5-20020a5d9b85000000b0067531ec97ddmr12587226iom.111.1658126308736; 
 Sun, 17 Jul 2022 23:38:28 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:28 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 10/41] dyndbg: add class_id to pr_debug callsites
Date: Mon, 18 Jul 2022 00:35:54 -0600
Message-Id: <20220718063641.9179-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

