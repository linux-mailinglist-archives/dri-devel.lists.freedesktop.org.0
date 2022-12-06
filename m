Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1043D643A48
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 01:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C6E10E305;
	Tue,  6 Dec 2022 00:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B9310E2DB;
 Tue,  6 Dec 2022 00:35:11 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id i83so2365968ioa.11;
 Mon, 05 Dec 2022 16:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dhgn9wX8VnoKy4gzdEAPvv/+WdYNfhhNGem4xWUo+54=;
 b=cFjT5uBYIfbwjn+ZYskaH0i9/7ogEYuVuZP+PF9wO1tDwTZn2NY6q3tcELecZeDsOZ
 VhfUVTL1zEHCFF34UEGr17MYKK/GCq3rjL8KrLVSpUuORuCV2lxsdXUJICDQu9Odwq4u
 x8lhsRupAN+pUzghCYZtaekjHz15L1SFI4VKPoZ2TXiSJQdXojgaOpY8rPlafl9obLgQ
 zUUidFrJdbJR6Hwt8NYCRizAFopS3vBpAex2augWlW9eu3efXR9QtnJGD1+FSbTYsvw3
 f3coPez/qgNUkvfvISWWzsnxOj08VAx0m0sdpXQgIbo3eQ2yw3L8iUzUqodpM3IBPSCa
 PABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dhgn9wX8VnoKy4gzdEAPvv/+WdYNfhhNGem4xWUo+54=;
 b=GUvaShebnt8gSc5l2MEKY/ZHVnNEkMzRPYimwH6no0xTuAJy3anjbGvQYEPMI1/AFl
 uowJrr3uRrMIoRSiGe9B4vufG7xshW2549FWIf4UgnJn3xlrNF7P+QKi1HUQg7mEUVcd
 0UnHbf54g8IIe7lMUtMDySjoc1JxlGWo1iicryG+wFsetGHA2bDam+t/YcFIXy9nCVxJ
 fehjuzEdsWVIVhqtC1Vfhh1HKpZjTRNKngqr6E7FPZgeuvWTIDqN3d1K6B9RqjUe4H7o
 HnWQGwBrPABy7Q0KEjk3o/iGH+T4XL3kuKl3E4JvdWWqu9sxxMSPoHyER3TR7UvCVnMG
 8twg==
X-Gm-Message-State: ANoB5pkkHqVYAaQicQOwNQrqedNbg90QtKAqFyaoXW4efg6upN2jD83R
 mc7+G7kuAN9fyoWUy4mWsCs=
X-Google-Smtp-Source: AA0mqf4UrGwrWW8ayZpYFUogOfCrj+KdhRKQlLYKVBdzN70o9Io7J3UShL/h1FTcWu9T3atRD0XnnA==
X-Received: by 2002:a6b:fd17:0:b0:6df:eed3:42c3 with SMTP id
 c23-20020a6bfd17000000b006dfeed342c3mr6238175ioi.63.1670286910901; 
 Mon, 05 Dec 2022 16:35:10 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 x3-20020a056602160300b006bba42f7822sm6408213iow.52.2022.12.05.16.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 16:35:10 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 12/17] dyndbg-API: DYNDBG_CLASSMAP_DEFINE() improvements
Date: Mon,  5 Dec 2022 17:34:19 -0700
Message-Id: <20221206003424.592078-13-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206003424.592078-1-jim.cromie@gmail.com>
References: <20221206003424.592078-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, jbaron@akamai.com,
 seanpaul@chromium.org, gregkh@linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

patch 1 in this series fixed a CLASSMAP usage error, this improves the
api so that misuse is less likely.

changes here:

0- Add William Swanson's public domain map macro:
   https://github.com/swansontec/map-macro/blob/master/map.h
   this makes 1 possible.

1- classnames were formerly specified as strings: "DRM_UT_CORE"
   now they are the actual enum const symbols:     DRM_UT_CORE
   direct use of symbols is tighter, more comprehensible by tools, grep

2- drop _base arg.
   _base was the value of the 1st classname
   that is now available due to 1, no need to require it 2x

So take _base out of the API/kdoc.  Note that the macro impl keeps the
_base arg so that it can be used to set classmap.base, but reuses it
in the MAP-stringify _base, __VA_ARGS__ expression.

Also cleanup the API usage comment in test_dynamic_debug.c, and since
comments in test-code might not be noticed, restate that here.

Using the CLASSMAP api:

  - class-specifications are enum consts/symbols,
    like DRM_UT_CORE, DRM_UT_KMS, etc.
    their values define bit positions to drm.debug (as before)

  - they are stringified and accepted at >control
    echo class DRM_UT_CORE +p >control

  - multiple class-maps must share the per-module: 0-62 class_id space
    (by setting initial enum values to non-overlapping subranges)

todo: fixup the 'i' prefix, a quick/dirty avoidance of MAP.

NOTE: test_dynamic_debug.c also has this helper macro to wire a
classmap to a drm.debug style parameter; its easier to just use it as
a model/template as needed, rather than try to make it general enough
to be an official API helper.

 define DD_SYS_WRAP(_model, _flags)					\
	static unsigned long bits_##_model;				\
	static struct ddebug_class_param _flags##_model = {		\
		.bits = &bits_##_model,					\
		.flags = #_flags,					\
		.map = &map_##_model,					\
	};								\
	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes, &_flags##_model, 0600)

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c   | 22 +++++++-------
 include/drm/drm_print.h       |  1 +
 include/linux/dynamic_debug.h | 17 ++++++-----
 include/linux/map.h           | 54 +++++++++++++++++++++++++++++++++++
 lib/test_dynamic_debug.c      | 43 ++++++++++++++--------------
 5 files changed, 95 insertions(+), 42 deletions(-)
 create mode 100644 include/linux/map.h

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 4b697e18238d..07c25241e8cc 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -56,17 +56,17 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 module_param_named(debug, __drm_debug, ulong, 0600);
 #else
 /* classnames must match vals of enum drm_debug_category */
-DYNDBG_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DYNDBG_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
+		       DRM_UT_CORE,
+		       DRM_UT_DRIVER,
+		       DRM_UT_KMS,
+		       DRM_UT_PRIME,
+		       DRM_UT_ATOMIC,
+		       DRM_UT_VBL,
+		       DRM_UT_STATE,
+		       DRM_UT_LEASE,
+		       DRM_UT_DP,
+		       DRM_UT_DRMRES);
 
 static struct ddebug_class_param drm_debug_bitmap = {
 	.bits = &__drm_debug,
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index a44fb7ef257f..6a27e8f26770 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -333,6 +333,7 @@ static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
 	})
 
 #if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+//extern struct ddebug_class_map drm_debug_classes[];
 /*
  * the drm.debug API uses dyndbg, so each drm_*dbg macro/callsite gets
  * a descriptor, and only enabled callsites are reachable.  They use
diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 0088fc354c98..6f53a687cb32 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -7,6 +7,7 @@
 #endif
 
 #include <linux/build_bug.h>
+#include <linux/map.h>
 
 /*
  * An instance of this structure is created in a special
@@ -92,18 +93,16 @@ struct ddebug_class_map {
 };
 
 /**
- * DYNDBG_CLASSMAP_DEFINE - define debug-classes used by a module.
- * @_var:   name of the classmap, exported for other modules coordinated use.
- * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
- * @_base:  offset of 1st class-name. splits .class_id space
- * @classes: enum-map - symbol names are "classnames", vals are .class_ids
+ * DYNDBG_CLASSMAP_DEFINE - define the debug classes used in this module.
+ * This tells dyndbg what debug classes it should control for the client.
  *
- * @classes vals are _ddebug.class_ids used in the module, the symbol
- * names are stringified; they authorize "class FOO" to >control.
- * Connection to a kernel-param is done separately.
+ * @_var:    struct ddebug_class_map, as passed to module_param_cb
+ * @_type:   enum ddebug_class_map_type, chooses bits/verbose, numeric/symbolic
+ * @classes: enum class values used in module, such as: DRM_UT_*
  */
 #define DYNDBG_CLASSMAP_DEFINE(_var, _maptype, _base, ...)		\
-	const char *_var##_classnames[] = { __VA_ARGS__ };		\
+	const char *_var##_classnames[] = {				\
+		iMAP_LIST(__stringify, _base, __VA_ARGS__) };		\
 	struct ddebug_class_map __aligned(8) __used			\
 		__section("__dyndbg_classes") _var = {			\
 		.mod = THIS_MODULE,					\
diff --git a/include/linux/map.h b/include/linux/map.h
new file mode 100644
index 000000000000..4348313a596f
--- /dev/null
+++ b/include/linux/map.h
@@ -0,0 +1,54 @@
+/*
+ * Created by William Swanson in 2012.
+ *
+ * I, William Swanson, dedicate this work to the public domain.
+ * I waive all rights to the work worldwide under copyright law,
+ * including all related and neighboring rights,
+ * to the extent allowed by law.
+ *
+ * You can copy, modify, distribute and perform the work,
+ * even for commercial purposes, all without asking permission.
+ */
+
+#ifndef MAP_H_INCLUDED
+#define MAP_H_INCLUDED
+
+#define iEVAL0(...) __VA_ARGS__
+#define iEVAL1(...) iEVAL0(iEVAL0(iEVAL0(__VA_ARGS__)))
+#define iEVAL2(...) iEVAL1(iEVAL1(iEVAL1(__VA_ARGS__)))
+#define iEVAL3(...) iEVAL2(iEVAL2(iEVAL2(__VA_ARGS__)))
+#define iEVAL4(...) iEVAL3(iEVAL3(iEVAL3(__VA_ARGS__)))
+#define iEVAL(...)  iEVAL4(iEVAL4(iEVAL4(__VA_ARGS__)))
+
+#define iMAP_END(...)
+#define iMAP_OUT
+#define iMAP_COMMA ,
+
+#define iMAP_GET_END2() 0, iMAP_END
+#define iMAP_GET_END1(...) iMAP_GET_END2
+#define iMAP_GET_END(...) iMAP_GET_END1
+#define iMAP_NEXT0(test, next, ...) next iMAP_OUT
+#define iMAP_NEXT1(test, next) iMAP_NEXT0(test, next, 0)
+#define iMAP_NEXT(test, next)  iMAP_NEXT1(iMAP_GET_END test, next)
+
+#define iMAP0(f, x, peek, ...) f(x) iMAP_NEXT(peek, iMAP1)(f, peek, __VA_ARGS__)
+#define iMAP1(f, x, peek, ...) f(x) iMAP_NEXT(peek, iMAP0)(f, peek, __VA_ARGS__)
+
+#define iMAP_LIST_NEXT1(test, next) iMAP_NEXT0(test, iMAP_COMMA next, 0)
+#define iMAP_LIST_NEXT(test, next)  iMAP_LIST_NEXT1(iMAP_GET_END test, next)
+
+#define iMAP_LIST0(f, x, peek, ...) f(x) iMAP_LIST_NEXT(peek, iMAP_LIST1)(f, peek, __VA_ARGS__)
+#define iMAP_LIST1(f, x, peek, ...) f(x) iMAP_LIST_NEXT(peek, iMAP_LIST0)(f, peek, __VA_ARGS__)
+
+/**
+ * Applies the function macro `f` to each of the remaining parameters.
+ */
+#define iMAP(f, ...) iEVAL(iMAP1(f, __VA_ARGS__, ()()(), ()()(), ()()(), 0))
+
+/**
+ * Applies the function macro `f` to each of the remaining parameters and
+ * inserts commas between the results.
+ */
+#define iMAP_LIST(f, ...) iEVAL(iMAP_LIST1(f, __VA_ARGS__, ()()(), ()()(), ()()(), 0))
+
+#endif
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 4ae01f7fa920..f471737fdfc3 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -33,11 +33,10 @@ module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
 
 /*
  * Using the CLASSMAP api:
- * - classmaps must have corresponding enum
- * - enum symbols must match/correlate with class-name strings in the map.
- * - base must equal enum's 1st value
- * - multiple maps must set their base to share the 0-30 class_id space !!
- *   (build-bug-on tips welcome)
+ * - class-names are enum consts/symbols, like DRM_UT_CORE, DRM_UT_KMS, etc
+ * - those names are accepted at >control interface
+ * - multiple class-maps must share the per-module: 0-62 class_id space
+ *   (by setting initial enum values to non-overlapping subranges)
  * Additionally, here:
  * - tie together sysname, mapname, bitsname, flagsname
  */
@@ -62,38 +61,38 @@ enum cat_disjoint_bits {
 	D2_LEASE,
 	D2_DP,
 	D2_DRMRES };
-DYNDBG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-		       "D2_CORE",
-		       "D2_DRIVER",
-		       "D2_KMS",
-		       "D2_PRIME",
-		       "D2_ATOMIC",
-		       "D2_VBL",
-		       "D2_STATE",
-		       "D2_LEASE",
-		       "D2_DP",
-		       "D2_DRMRES");
+DYNDBG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
+		       D2_CORE,
+		       D2_DRIVER,
+		       D2_KMS,
+		       D2_PRIME,
+		       D2_ATOMIC,
+		       D2_VBL,
+		       D2_STATE,
+		       D2_LEASE,
+		       D2_DP,
+		       D2_DRMRES);
 DD_SYS_WRAP(disjoint_bits, p);
 DD_SYS_WRAP(disjoint_bits, T);
 
 /* symbolic input, independent bits */
 enum cat_disjoint_names { LOW = 10, MID, HI };
-DYNDBG_CLASSMAP_DEFINE(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
-		       "LOW", "MID", "HI");
+DYNDBG_CLASSMAP_DEFINE(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES,
+		       LOW, MID, HI);
 DD_SYS_WRAP(disjoint_names, p);
 DD_SYS_WRAP(disjoint_names, T);
 
 /* numeric verbosity, V2 > V1 related */
 enum cat_level_num { V0 = 14, V1, V2, V3, V4, V5, V6, V7 };
-DYNDBG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM, 14,
-		       "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
+DYNDBG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
+		       V0, V1, V2, V3, V4, V5, V6, V7);
 DD_SYS_WRAP(level_num, p);
 DD_SYS_WRAP(level_num, T);
 
 /* symbolic verbosity */
 enum cat_level_names { L0 = 22, L1, L2, L3, L4, L5, L6, L7 };
-DYNDBG_CLASSMAP_DEFINE(map_level_names, DD_CLASS_TYPE_LEVEL_NAMES, 22,
-		       "L0", "L1", "L2", "L3", "L4", "L5", "L6", "L7");
+DYNDBG_CLASSMAP_DEFINE(map_level_names, DD_CLASS_TYPE_LEVEL_NAMES,
+		       L0, L1, L2, L3, L4, L5, L6, L7);
 DD_SYS_WRAP(level_names, p);
 DD_SYS_WRAP(level_names, T);
 
-- 
2.38.1

