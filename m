Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A310F52940A
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EC310E8FC;
	Mon, 16 May 2022 22:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781F810E8CF;
 Mon, 16 May 2022 22:57:07 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id i5so11573936ilv.0;
 Mon, 16 May 2022 15:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sVz4wSplNYJeolwmkIVwQxuaib3U9PeK8r0DMH1HXak=;
 b=qlRr9o9J1iRZDGev3s2XHIkpyzd5BVBjqJHfyArjLKIkA6l/fdX3cZMJaMltlMTQ6r
 Fa61jz1uE9GoYUzI9zlpVvrRi1c4utEKzH4piW8YUY86QvxmKYMKlC5V6uY4KieYffKH
 9hfuNb9TnBon+k3vVD1XkckDvPEwq2Hu0AQ0NwcVFhYdwBTVApu+O3SEyUwcPbQ5d3da
 gqmI6X3zkGqfgKADBJIJVIGiQYEucBuhXqvEWuOr//JtOP7xKfm+K0h56awHXx9iCd+5
 qv+OR8qwvCmuTADk7Wx2tJpMX50dxMM8nDYUNlINe2k88Ou25kniQC/eRHTBHjMvcyKJ
 Yvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sVz4wSplNYJeolwmkIVwQxuaib3U9PeK8r0DMH1HXak=;
 b=dcDANIMwrrogthykb0tEesIXwAdvNtpizXRowbuYZwiKc3nwWO/v05f/bWwp7039vQ
 EZC10BMzcbN9z467dIEqwufbwODtARfEwokEKtsBod1ihQ7kI7EwHTA+6fCc9IBu2LKe
 rY43i++MGzdz7X8i3v22lyvNod4jxFmj9HX/rp6IqrJS22dg/vdaiMuOtICfHZVKT1va
 KjA/zrSNFJDapLi4ZCtKlOOT5YboPFiwB6IzQLaCCEg4T+2d3K1Qa6p6+fxyrs0zQZgC
 0/7l/ykPul2L2X3bzNjta8HOckatDYIITj8gsFetXD5XpjHi/k06cveLAtTZ1dKxsscu
 LOgg==
X-Gm-Message-State: AOAM533bp3HTGBk78Bxj5CLAfyEAGWYewI3uBcWbVy7BkiuPslO0+gnD
 UZ3qLmKEVbLP949EIWMHXZw=
X-Google-Smtp-Source: ABdhPJwySl7MUlvXnA+IuDsilswY5WzP4U30CtwupLL4X9+oOZEmW9Rz64np3jYs/BwYTq/QGzQdyg==
X-Received: by 2002:a05:6e02:1c81:b0:2d1:3971:9343 with SMTP id
 w1-20020a056e021c8100b002d139719343mr297731ill.237.1652741826539; 
 Mon, 16 May 2022 15:57:06 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:06 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 05/27] dyndbg: add exclusive class_id to pr_debug callsites
Date: Mon, 16 May 2022 16:56:18 -0600
Message-Id: <20220516225640.3102269-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516225640.3102269-1-jim.cromie@gmail.com>
References: <20220516225640.3102269-1-jim.cromie@gmail.com>
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
Cc: maz@kernel.org, quic_saipraka@quicinc.com, catalin.marinas@arm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 rostedt@goodmis.org, mingo@redhat.com, mathieu.desnoyers@efficios.com,
 quic_psodagud@quicinc.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM issues ~10 exclusive categories of debug messages; to represent
this directly in dyndbg, add a new field: struct _ddebug.class_id:5.

We only need 4 bits for drm, and with that reserved, we have 2 to
spare on 32 bit builds; lets take one extra (5 bits total), and keep a
spare bit.  32 classes-per-bitmap is a practical usability limit
anyway with a bitmap interface:

  #> echo 0x012345678 > /sys/module/drm/parameters/debug

All existing callsites are initialized with _DPRINTK_CLASS_DFLT, which
is 2^5-1.  This reserves 0-30 for use in new categorized/class'd
pr_debugs, which fits perfectly with natural enums (ints: 0..N).

To achieve this, DEFINE_DYNAMIC_DEBUG_METADATA_CLS(cls,...) is added,
and DEFINE_DYNAMIC_DEBUG_METADATA is altered to call it with the
default.  The factory macro chain between there and pr_debug is
adjusted similarly.

No behavior change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 54 ++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 13 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index dd20e825c36f..39550fefcf0f 100644
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
 
@@ -125,18 +136,26 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
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
+	__dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT,		\
+				fmt, func, ##__VA_ARGS__)
+
+#define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
+	__dynamic_func_call_no_desc_cls(id, _DPRINTK_CLASS_DFLT,	\
+					fmt, func, ##__VA_ARGS__)
+
 /*
  * "Factory macro" for generating a call to func, guarded by a
  * DYNAMIC_DEBUG_BRANCH. The dynamic debug descriptor will be
@@ -145,15 +164,24 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
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
+#define _dynamic_func_call_no_desc_cls(fmt, cat, func, ...)		\
+	__dynamic_func_call_no_desc_cls(__UNIQUE_ID(ddebug), cat,	\
+					fmt, func, ##__VA_ARGS__)
+
+#define _dynamic_func_call_no_desc(fmt, func, ...)			\
+	__dynamic_func_call_no_desc_cls(__UNIQUE_ID(ddebug),		\
+					_DPRINTK_CLASS_DFLT,	\
+					fmt, func, ##__VA_ARGS__)
 
 #define dynamic_pr_debug(fmt, ...)				\
 	_dynamic_func_call(fmt,	__dynamic_pr_debug,		\
-- 
2.35.3

