Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6328079AC68
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 01:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6C110E384;
	Mon, 11 Sep 2023 23:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FBC10E36F;
 Mon, 11 Sep 2023 23:09:01 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-79834a7a5d8so11671939f.3; 
 Mon, 11 Sep 2023 16:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694473740; x=1695078540; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PB3LiUhIzXuAa4xXViPHoKYMaiRTHzf1WidpgS8wmiM=;
 b=NNrRae8qjYNKIDNzyr0wj5BmxkxP0PdZ91/U9Il7ipT7GqVpcW06OSzCwCL2fPF6Tq
 Ok2JBBmAyfDfbGKpuHXE1beo9pJVKJGqaaFtRhn0LoqjvSmPKZeunFY4gmELwXolU/SM
 0n7E8G3bBcCIfeIril9Fhxp01XenGmT292opXuARc8rGtXxNkN7ocV7Bwx/fe9gE/GZd
 k7ffaqim87Kb8SmiagGBX+hMXILcRWi5WeCkNdpHpb55GdX3eKyBHedii3wLUdgo3rnZ
 /HZp3Cf3MseKJnaf2ejUr6OMDSYb8wxdpRtfHkIjQQF1Uu5Tzeop3Jt3RV8BCgEI+Tac
 oRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694473740; x=1695078540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PB3LiUhIzXuAa4xXViPHoKYMaiRTHzf1WidpgS8wmiM=;
 b=b3zTIyuU4vs46slRPZ0k9JtAXqR3q0T/WvWNpoJkCWzd8jKVNgYwNXxREwn4+8Crva
 m6NMs6XTbadFsuGgCkmp4Ea6/UabpRfx9NfAAsWJigmk/bCKt3gkCLVVKysraA6E5ica
 kRs9KUuknqMDdBq1x4/67ldOWzyQNQbm2UlE1HiFlufT1XA665QZBlAjDwoO8l8xL8oH
 y1S/xKf/HQAhhhPDG5ZwMyTEgcZyVV2AfIBhYry4YAiewq8MiTJxdjZvh3B3QAER9MrJ
 yc3+aH1LLUSttgIKinoUJHE4ZFjaU+LPpY+0rnfO0IeFphBtCr6ZXe+RdC/Rt7qa1Voc
 3hBQ==
X-Gm-Message-State: AOJu0Yw2Ira+BzTWD/f9wuuV8DtEa/fRSRf1X9N7KlK1s/FwM01TSs6l
 hdJX3b+uWw4AUvr4jxrIcV0=
X-Google-Smtp-Source: AGHT+IFZlzJvcL7t8HpK3t1MGGrcXjBoJCFaW7ILAZbaIKK8PyB9W0txXEF0mcChge9f5bUy9KPu9w==
X-Received: by 2002:a5e:c80a:0:b0:795:c6f:59ff with SMTP id
 y10-20020a5ec80a000000b007950c6f59ffmr13164380iol.17.1694473740585; 
 Mon, 11 Sep 2023 16:09:00 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 z4-20020a029f04000000b00423240c7296sm2512607jal.69.2023.09.11.16.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 16:09:00 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, mcgrof@kernel.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH v6 15/22] dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API
Date: Mon, 11 Sep 2023 17:08:31 -0600
Message-ID: <20230911230838.14461-16-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230911230838.14461-1-jim.cromie@gmail.com>
References: <20230911230838.14461-1-jim.cromie@gmail.com>
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
Cc: linux-doc@vger.kernel.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

move macro from test-dynamic-debug.c into header, and refine it.

Distinguish the 2 use cases of DYNDBG_CLASSMAP_PARAM*

1.DYNDBG_CLASSMAP_PARAM_REF
    for DRM, to pass in extern __drm_debug by name.
    dyndbg keeps bits in it, so drm can still use it as before

2.DYNDBG_CLASSMAP_PARAM
    new user (test_dynamic_debug) doesn't need to share state,
    decls a static long unsigned int to store the bitvec.

__DYNDBG_CLASSMAP_PARAM
   bottom layer - allocate,init a ddebug-class-param, module-param-cb.

Also clean up and improve comments in test-code, and add
MODULE_DESCRIPTIONs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v5b - parens-on-PARAM
---
 drivers/gpu/drm/drm_print.c     |  8 ++---
 include/drm/drm_print.h         |  6 ++--
 include/linux/dynamic_debug.h   | 39 ++++++++++++++++++++--
 lib/test_dynamic_debug.c        | 58 +++++++++++++--------------------
 lib/test_dynamic_debug_submod.c |  9 ++++-
 5 files changed, 74 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index dabcfa0dd279..8f4b609353a5 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -69,12 +69,8 @@ DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
 		    "DRM_UT_DP",
 		    "DRM_UT_DRMRES");
 
-static struct ddebug_class_param drm_debug_bitmap = {
-	.bits = &__drm_debug,
-	.flags = "p",
-	.map = &drm_debug_classes,
-};
-module_param_cb(debug, &param_ops_dyndbg_classes, &drm_debug_bitmap, 0600);
+DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
+
 #endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 706afc97c79c..94d4f5500030 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -322,11 +322,13 @@ enum drm_debug_category {
 };
 
 #ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
-#define DRM_CLASSMAP_DEFINE(...) DYNDBG_CLASSMAP_DEFINE(__VA_ARGS__)
-#define DRM_CLASSMAP_USE(name)   DYNDBG_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_DEFINE(...)	DYNDBG_CLASSMAP_DEFINE(__VA_ARGS__)
+#define DRM_CLASSMAP_USE(name)		DYNDBG_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...)	DYNDBG_CLASSMAP_PARAM_REF(__VA_ARGS__)
 #else
 #define DRM_CLASSMAP_DEFINE(...)
 #define DRM_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...)
 #endif
 
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index dfd5e39ee4d0..15edac27cb56 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -92,7 +92,7 @@ struct ddebug_class_map {
  * module, and to validate inputs to DD_CLASS_TYPE_*_NAMES typed params.
  */
 #define DYNDBG_CLASSMAP_DEFINE(_var, _maptype, _base, ...)		\
-	const char *_var##_classnames[] = { __VA_ARGS__ };		\
+	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
 	struct ddebug_class_map __aligned(8) __used			\
 		__section("__dyndbg_classes") _var = {			\
 		.mod = THIS_MODULE,					\
@@ -121,7 +121,7 @@ struct ddebug_class_user {
 	DYNDBG_CLASSMAP_USE_(_var, __UNIQUE_ID(ddebug_class_user))
 #define DYNDBG_CLASSMAP_USE_(_var, _uname)				\
 	extern struct ddebug_class_map _var;				\
-	struct ddebug_class_user __used					\
+	static struct ddebug_class_user __used				\
 	__section("__dyndbg_class_users") _uname = {			\
 		.user_mod_name = KBUILD_MODNAME,			\
 		.map = &_var,						\
@@ -146,6 +146,41 @@ struct ddebug_class_param {
 	const struct ddebug_class_map *map;
 };
 
+/**
+ * DYNDBG_CLASSMAP_PARAM - wrap a dyndbg-classmap with a controlling sys-param
+ * @_name  sysfs node name
+ * @_var   name of the struct classmap var defining the controlled classes
+ * @_flags flags to be toggled, typically just 'p'
+ *
+ * Creates a sysfs-param to control the classes defined by the
+ * classmap.  Keeps bits in a private/static
+ */
+#define DYNDBG_CLASSMAP_PARAM(_name, _var, _flags)			\
+	static unsigned long _name##_bvec;				\
+	__DYNDBG_CLASSMAP_PARAM(_name, _name##_bvec, _var, _flags)
+
+/**
+ * DYNDBG_CLASSMAP_PARAM_REF - wrap a dyndbg-classmap with a controlling sys-param
+ * @_name  sysfs node name
+ * @_bits  name of the module's unsigned long bit-vector, ex: __drm_debug
+ * @_var   name of the struct classmap var defining the controlled classes
+ * @_flags flags to be toggled, typically just 'p'
+ *
+ * Creates a sysfs-param to control the classmap, keeping bitvec in user @_bits.
+ * This lets drm use __drm_debug elsewhere too.
+ */
+#define DYNDBG_CLASSMAP_PARAM_REF(_name, _bits, _var, _flags)		\
+	__DYNDBG_CLASSMAP_PARAM(_name, _bits, _var, _flags)
+
+#define __DYNDBG_CLASSMAP_PARAM(_name, _bits, _var, _flags)		\
+	static struct ddebug_class_param _name##_##_flags = {		\
+		.bits = &(_bits),					\
+		.flags = #_flags,					\
+		.map = &(_var),						\
+	};								\
+	module_param_cb(_name, &param_ops_dyndbg_classes,		\
+			&_name##_##_flags, 0600)
+
 /*
  * pr_debug() and friends are globally enabled or modules have selectively
  * enabled them.
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 23967071b60f..84e049c07e77 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Kernel module for testing dynamic_debug
+ * Kernel module to test/demonstrate dynamic_debug features,
+ * particularly classmaps and their support for subsystems like DRM.
  *
  * Authors:
  *      Jim Cromie	<jim.cromie@gmail.com>
@@ -35,24 +36,8 @@ module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
 
 #define CLASSMAP_BITMASK(width, base) (((1UL << (width)) - 1) << base)
 
-/* sysfs param wrapper, proto-API */
-#define DYNDBG_CLASSMAP_PARAM_(_model, _flags, _init)			\
-	static unsigned long bits_##_model = _init;			\
-	static struct ddebug_class_param _flags##_##_model = {		\
-		.bits = &bits_##_model,					\
-		.flags = #_flags,					\
-		.map = &map_##_model,					\
-	};								\
-	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes,	\
-			&_flags##_##_model, 0600)
-#ifdef DEBUG
-#define DYNDBG_CLASSMAP_PARAM(_model, _flags)  DYNDBG_CLASSMAP_PARAM_(_model, _flags, ~0)
-#else
-#define DYNDBG_CLASSMAP_PARAM(_model, _flags)  DYNDBG_CLASSMAP_PARAM_(_model, _flags, 0)
-#endif
-
 /*
- * Demonstrate/test all 4 class-typed classmaps with a sys-param.
+ * Demonstrate/test both types of classmaps, each with a sys-param.
  *
  * Each is 3 part: client-enum decl, _DEFINE, _PARAM.
  * Declare them in blocks to show patterns of use (repetitions and
@@ -64,7 +49,7 @@ module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
  * Modules with multiple CLASSMAPS must have enums with distinct
  * value-ranges, arranged below with explicit enum_sym = X inits.
  *
- * Declare all 4 enums now, for different types
+ * Declare all enums now, for different types
  */
 
 /* numeric input, independent bits */
@@ -83,18 +68,21 @@ enum cat_disjoint_bits {
 /* numeric verbosity, V2 > V1 related */
 enum cat_level_num { V0 = 14, V1, V2, V3, V4, V5, V6, V7 };
 
-/* named-symbolic input, independent bits */
+/*
+  and possibly later, params accepting named-value inputs
+*/
 enum cat_disjoint_names { LOW = 10, MID, HI };
+enum cat_level_names    { L0 = 22, L1, L2, L3, L4, L5, L6, L7 };
 
-/* named-symbolic verbosity */
-enum cat_level_names { L0 = 22, L1, L2, L3, L4, L5, L6, L7 };
-
-/* recapitulate DRM's parent(drm.ko) <-- _submod(drivers,helpers) */
+/*
+ * use/demonstrate multi-module-group classmaps, as for DRM
+ */
 #if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
 /*
- * In single user, or parent / coordinator (drm.ko) modules, define
- * classmaps on the client enums above, and then declares the PARAMS
- * ref'g the classmaps.  Each is exported.
+ * For module-groups of 1+, define classmaps with names (stringified
+ * enum-symbols) copied from above. 1-to-1 mapping is recommended.
+ * The classmap is exported, so that other modules in the group can
+ * link to it and control their prdbgs.
  */
 DYNDBG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
 		       D2_CORE,
@@ -113,19 +101,18 @@ DYNDBG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
 		       V0, "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
 
 /*
- * now add the sysfs-params
+ * for use-cases that want it, provide a sysfs-param to set the
+ * classes in the classmap.  It is at this interface where the
+ * "v3>v2" property is applied to DD_CLASS_TYPE_LEVEL_NUM inputs.
  */
-
-DYNDBG_CLASSMAP_PARAM(disjoint_bits, p);
-DYNDBG_CLASSMAP_PARAM(level_num, p);
+DYNDBG_CLASSMAP_PARAM(p_disjoint_bits,	map_disjoint_bits, p);
+DYNDBG_CLASSMAP_PARAM(p_level_num,	map_level_num, p);
 
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
-
 /*
- * in submod/drm-drivers, use the classmaps defined in top/parent
- * module above.
+ * the +1 members of a multi-module group refer to the classmap
+ * DEFINEd (and exported) above.
  */
-
 DYNDBG_CLASSMAP_USE(map_disjoint_bits);
 DYNDBG_CLASSMAP_USE(map_level_num);
 
@@ -186,5 +173,6 @@ static void __exit test_dynamic_debug_exit(void)
 module_init(test_dynamic_debug_init);
 module_exit(test_dynamic_debug_exit);
 
+MODULE_DESCRIPTION("test/demonstrate dynamic-debug features");
 MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
 MODULE_LICENSE("GPL");
diff --git a/lib/test_dynamic_debug_submod.c b/lib/test_dynamic_debug_submod.c
index 9a893402ce1a..0d15f3ffe466 100644
--- a/lib/test_dynamic_debug_submod.c
+++ b/lib/test_dynamic_debug_submod.c
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Kernel module for testing dynamic_debug
+ * Kernel module to test/demonstrate dynamic_debug features,
+ * particularly classmaps and their support for subsystems, like DRM,
+ * which defines its drm_debug classmap in drm module, and uses it in
+ * helpers & drivers.
  *
  * Authors:
  *      Jim Cromie	<jim.cromie@gmail.com>
@@ -8,3 +11,7 @@
 
 #define TEST_DYNAMIC_DEBUG_SUBMOD
 #include "test_dynamic_debug.c"
+
+MODULE_DESCRIPTION("test/demonstrate dynamic-debug subsystem support");
+MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.41.0

