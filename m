Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC46C7528C3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26AA10E710;
	Thu, 13 Jul 2023 16:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F1710E752;
 Thu, 13 Jul 2023 16:37:01 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-78362f574c9so29811939f.3; 
 Thu, 13 Jul 2023 09:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689266221; x=1691858221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=utQH+brkTHZoOvReum7R2ktr/sBK5CmFUpoSFYGWWyA=;
 b=Y2xNn+k95UAYxdC65PxUWdECMmWg5H8QO529F96NVSQI1Q7+c91cjOO556Pt+Y9yof
 viWj3m3Dfs6nbPP4m4imeWpZ9JTfrFYPN9jeuIA6WTdaecTh1YxKr23DECzd0TNp6LwG
 Oq7p3S/fpdfp+fVFWFdQ9W+pBcnCnUS1j9fmqLVHwhSYTm6LXo7vDk9oc5IyTDUiIFwC
 l50n5velfskvdm4X9QunLF/RUHqO6OF/JbxKRHU09cddqyJsZnqV8fTmcsFgAr/qpDlq
 ss+z/Be0Chqu3stERxukuBWHm9hP1MR41hEdVb3LCcYVmexIExefuy5RlEtFEV00/Kh6
 Pp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689266221; x=1691858221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=utQH+brkTHZoOvReum7R2ktr/sBK5CmFUpoSFYGWWyA=;
 b=erhBxVHxlJuuFYShYDVOPxalPJWqiMUVNpSwsnCEcSvrQqBew6MVASMz3tIZjfAnMi
 sLSbTKGJ28LVIB+8hXMHiDMCE3YGU2b+WS8dFCNF38AThmyvJ9pRqEhvrCa1Wnvji8xw
 ppjk8paJaQO5aaVYEQSxJQG9z8HbIaNCrtcMK74nCNZEBmpTkaHyTRxqhM25vckiuXX+
 hw8Cnjh6wKUmQ3KPsiP1r3RRSno10kn6kH9jXzYLLg8TVdwI3vHuBJ9+w4/FBBKz2iGR
 z2Yi0JfOZcDBGbmadYwCyRjU14Et3BsOn7pm4gqoBq2SBvSm5LBpkzsO1hbGGBLysLZm
 sUAA==
X-Gm-Message-State: ABy/qLbXLimULenJsdbXdr39gI0kwGkgQy9ljfh2Fp0Z62rtTg1jK04S
 yNW5O6Lyp3UlSRVo7u46AxE=
X-Google-Smtp-Source: APBJJlGvMp/On2vUPbobjjmmD6JVqAuT+Lq07GsyfsccBEoQcumR22KgWqK8JhRxe0MMtFZFHc250A==
X-Received: by 2002:a92:cc43:0:b0:346:e96:7cba with SMTP id
 t3-20020a92cc43000000b003460e967cbamr2180423ilq.27.1689266220748; 
 Thu, 13 Jul 2023 09:37:00 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 s7-20020a92d907000000b00345950d7e94sm2147571iln.20.2023.07.13.09.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:37:00 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 15/21] dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API
Date: Thu, 13 Jul 2023 10:36:20 -0600
Message-ID: <20230713163626.31338-16-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713163626.31338-1-jim.cromie@gmail.com>
References: <20230713163626.31338-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, gregkh@linuxfoundation.org, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

move macro from test-dynamic-debug.c into header, and refine it.

Distinguish the 2 use cases of DYNDBG_CLASSMAP_PARAM*

1.DYNDBG_CLASSMAP_PARAM_REF
    for DRM, to pass in extern __drm_debug by name.
    dyndbg keeps bits in it, so drm can still use it as before/remaining.

2.DYNDBG_CLASSMAP_PARAM
    new user (test_dynamic_debug) doesnt need to share state,
    decls,inits a static long unsigned int to store the bitvec.

__DYNDBG_CLASSMAP_PARAM
   bottom layer - allocate,init a ddebug-class-param, module-param-cb.

1. doesnt initialize bits properly.
   macro seems to lose type of previously decl'd extern,
   then whines about type mistmatch
   punt now - following commit trys to fix it, draws warning.

2. init seems to work
   maybe masked by sync-bits
   not validated

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c   |  8 ++-----
 include/drm/drm_print.h       |  6 ++++--
 include/linux/dynamic_debug.h | 39 +++++++++++++++++++++++++++++++++--
 lib/test_dynamic_debug.c      | 22 +++-----------------
 4 files changed, 46 insertions(+), 29 deletions(-)

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
index 2604fda3abe3..95a6b3882b76 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -90,7 +90,7 @@ struct ddebug_class_map {
  * module, and to validate inputs to DD_CLASS_TYPE_*_NAMES typed params.
  */
 #define DYNDBG_CLASSMAP_DEFINE(_var, _maptype, _base, ...)		\
-	const char *_var##_classnames[] = { __VA_ARGS__ };		\
+	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
 	struct ddebug_class_map __aligned(8) __used			\
 		__section("__dyndbg_classes") _var = {			\
 		.mod = THIS_MODULE,					\
@@ -118,7 +118,7 @@ struct ddebug_class_user {
 	DYNDBG_CLASSMAP_USE_(_var, __UNIQUE_ID(ddebug_class_user))
 #define DYNDBG_CLASSMAP_USE_(_var, _uname)				\
 	extern struct ddebug_class_map _var;				\
-	struct ddebug_class_user __used					\
+	static struct ddebug_class_user __used				\
 	__section("__dyndbg_class_users") _uname = {			\
 		.user_mod_name = KBUILD_MODNAME,			\
 		.map = &_var,						\
@@ -143,6 +143,41 @@ struct ddebug_class_param {
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
+		.bits = &_bits,						\
+		.flags = #_flags,					\
+		.map = &_var,						\
+	};								\
+	module_param_cb(_name, &param_ops_dyndbg_classes,		\
+			&_name##_##_flags, 0600)
+
 /*
  * pr_debug() and friends are globally enabled or modules have selectively
  * enabled them.
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 23967071b60f..df41963d9faf 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -35,22 +35,6 @@ module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
 
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
  * Demonstrate/test all 4 class-typed classmaps with a sys-param.
  *
@@ -113,11 +97,11 @@ DYNDBG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
 		       V0, "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
 
 /*
- * now add the sysfs-params
+ * now add the sysfs-params: name, classmap, flags-toggled
  */
 
-DYNDBG_CLASSMAP_PARAM(disjoint_bits, p);
-DYNDBG_CLASSMAP_PARAM(level_num, p);
+DYNDBG_CLASSMAP_PARAM(p_disjoint_bits,	map_disjoint_bits, p);
+DYNDBG_CLASSMAP_PARAM(p_level_num,	map_level_num, p);
 
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
 
-- 
2.41.0

