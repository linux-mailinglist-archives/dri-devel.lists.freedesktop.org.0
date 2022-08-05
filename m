Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6C558B1F9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E2FA2E4A;
	Fri,  5 Aug 2022 21:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A3D12AD57;
 Fri,  5 Aug 2022 21:54:34 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id z8so680427ile.0;
 Fri, 05 Aug 2022 14:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=uYp30Ojt1jK/5mfyka/eQyG2KeHOKeHThqMCysNtsn8=;
 b=YAINrW2ZO9Mx6b5PeAs9/E/VXG2BY6wp7UolfqM3mjkD01Dk2Y3ZGuBT8BCueN1AYE
 Zg4fLo/oxcep9rFyyrTeC0gpfCMVUdZ/5yaktOCwatJ5402yjM1Q8vg+g5QMOkl+wggz
 Cp3YsIYpCPMZJ+etfA+jdiHFcQ0m1iVg4m0s56U0ptJ4avD1efTF2GMK5CvUnyTc65TD
 h75nIkqamrE84rRXbUipEpXPHX/OnQ4F+GL1Ge0sZKOXBenuE45rpYtskO5GsmhlPPYr
 ch4e2R2uyeVJM84EZqx1zmMTsotF47lDWxS7IiK0ZKFXR1cy57H6CZz2qmEaKlCElUj0
 g8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=uYp30Ojt1jK/5mfyka/eQyG2KeHOKeHThqMCysNtsn8=;
 b=UnPPlYl3xdavZQluv65i300U23KsF+acvJWFyCb14zrK90cwSy76Umv5ZNoNtpM/Z9
 2/2QXGIxxRqGOo6Cnf7/o0H52y2qY4ykMOmGMGqZXXD0FHR6mqD5idSXMHaUztkFjOg6
 M6Uo21SS7EbxZY3jkVFyoqyf8OE2ONzzS4UOTeEjXd1VTUCPBMXAGB8LccTbYOHrBubm
 CSv6sf0dwq92NVwM3H/3XQBR5SN3ybRFlw/pVNA6ZJ6R5asaNO9u+O8OnvplM0nD6Pt1
 uLTdbL42N+6pmPFIl8ccmyUTZh68xWcmc30Nt9igNZ3MsRvcrZcQvaFqzOgsuJJItPYJ
 UqTA==
X-Gm-Message-State: ACgBeo13QXa7VXhu0Fm9LwFiURhpqn2rfM16jPWNL2l0CJ6DIjOzuEjB
 QWAXi9cWVQh3P6L1zxpdZWk=
X-Google-Smtp-Source: AA6agR6ialmwjln3K7Ocs8Msxoba/6IEWAhZ45NiYmLAX5sV3hu7QsT+pvJbiwH3fkhKbf/LTYXWcQ==
X-Received: by 2002:a92:2a0a:0:b0:2d9:2571:f57e with SMTP id
 r10-20020a922a0a000000b002d92571f57emr3862647ile.154.1659736473781; 
 Fri, 05 Aug 2022 14:54:33 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:33 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 12/33] dyndbg: add class_id to pr_debug callsites
Date: Fri,  5 Aug 2022 15:53:34 -0600
Message-Id: <20220805215355.3509287-13-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805215355.3509287-1-jim.cromie@gmail.com>
References: <20220805215355.3509287-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>
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

cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 71 +++++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 16 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 6a2001250da1..b6803f7e818f 100644
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
2.37.1

