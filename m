Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE3966A33A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 20:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB2710EAC3;
	Fri, 13 Jan 2023 19:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B886210EACE;
 Fri, 13 Jan 2023 19:30:53 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id g2so11237166ila.4;
 Fri, 13 Jan 2023 11:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o7Sl1+m4M1j8WJgjkZsfCE83lfCieUADdLatlJyRZk4=;
 b=UUxPReOyE5t2HK4g3+OiK0lJfS7/W5SiXi/8dvJndexPbWrHrdVdIo6sQjwZlnO4lj
 d59I4bJA9ZwCaFkDJAxDuPtwYhnPd2+m2ZzYHyKvVSu2qesPO9ALPgC8VloEAGLPx8fr
 nvQxe7ZKAyOjOzmtWq2kBmHryqo9YGZuZlOtkKMjTx4ZdqgYndz6jLJHNILIVIy9gUIf
 38sLBdjg1nQ4iB0Z3nIJaIY0HqawzML21AvTtPCXuUpCVhwAwB2grcVFsoc6/yaOczT4
 zdCw+bZttVV46laSVa8WlT6TshEVma9255f5uHQrpeAfe2wB2QuqcnG1L3sZ6bVg+B4U
 ldPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o7Sl1+m4M1j8WJgjkZsfCE83lfCieUADdLatlJyRZk4=;
 b=ynVU3CiBlWxq+ovfC67LV8Z4ewTeTBFfSk2vWrnzu37UbnBHyUTbBYz0jWJgoILiZ6
 PnYIUIDXWgHG8hFFUwGdrX45awssgOZ6vQ1+Y6WXDTunuvOTwI8MH/BM4MUYmFQIbxnq
 bR1QQHktmEtFk3f1gcqYMWGiiiBVEUoMcvZdJyuumWiHDv01u6k9ukk2ULNKEGDcJROz
 i7t0Mw60HtEEPOpvA6Gks8XUElMv+J0hInjYKp/7GO21vAnN/SJMWFQeJGbaoyg8bA/R
 kVQnWGcy//lYKteJbDZNLtX827YNXRfajO5H9kDqnkcj+FZp/9ulNn58azjxM+jkXNZq
 hOsw==
X-Gm-Message-State: AFqh2koaPzwLHce5lVkwx+S6UE2RcYgXNEwq9NB6GBOBwvI8g4IjsjfN
 2UDy/h0N0VHRyXLC1+fWL6s=
X-Google-Smtp-Source: AMrXdXs2Th/FC8QIUvum624SW69rbU6V6fiQLmXzAJwJ9NWflwnDm4Bse4NZu0eswCOCjqmrJHAT9w==
X-Received: by 2002:a92:cb4a:0:b0:30e:e000:ad3d with SMTP id
 f10-20020a92cb4a000000b0030ee000ad3dmr2159127ilq.4.1673638252662; 
 Fri, 13 Jan 2023 11:30:52 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e32-20020a026d60000000b0039e583abceasm6497289jaf.68.2023.01.13.11.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 11:30:52 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 10/20] dyndbg-API: split DECLARE_(DYNDBG_CLASSMAP) to
 $1(_DEFINE|_USE)
Date: Fri, 13 Jan 2023 12:30:06 -0700
Message-Id: <20230113193016.749791-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113193016.749791-1-jim.cromie@gmail.com>
References: <20230113193016.749791-1-jim.cromie@gmail.com>
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

DECLARE_DYNDBG_CLASSMAP's job was to allow modules to declare the debug
classes/categories they want dyndbg to >control on their behalf.  Its
args give the class-names, their mapping to class_ids, and the sysfs
interface style (usually a class-bitmap).  Modules wanting a drm.debug
style knob need to create the kparam, and call module_param_cb() to
wire the sysfs node to the classmap.  DRM does this is in drm_print.c

In DRM, multiple modules declare identical DRM_UT_* classmaps, so that
the class'd prdbgs are modified across those modules in a coordinated
way across the subsystem, by either explicit class DRM_UT_* queries to
>control, or by writes to /sys/module/drm/parameters/debug (drm.debug)

This coordination-by-identical-declarations is weird, so this patch
splits the macro into _DEFINE and _USE flavors.  This distinction
follows the definition vs declaration that K&R gave us, improving the
api; _DEFINE is used once to specify the classmap, and multiple users
_USE the single definition explicitly.

Currently the latter just reuses the former, and still needs all the
same args, but that can be tuned later; the _DEFINE can initialize an
(extern/global) struct classmap, and _USE can, well use/reference
that struct.

Also wrap DYNDBG_CLASSMAP_USEs with ifdef DRM_USE_DYNAMIC_DEBUG to
balance with the one around drm_print's use of DYNDBG_CLASSMAP_DEFINE.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  4 +++-
 drivers/gpu/drm/display/drm_dp_helper.c |  4 +++-
 drivers/gpu/drm/drm_crtc_helper.c       |  4 +++-
 drivers/gpu/drm/drm_print.c             |  2 +-
 drivers/gpu/drm/i915/i915_params.c      |  4 +++-
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  4 +++-
 include/linux/dynamic_debug.h           | 20 ++++++++++++----
 lib/test_dynamic_debug.c                | 32 ++++++++++++-------------
 8 files changed, 48 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index bf2d50c8c92a..0075184b5d93 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -188,7 +188,8 @@ int amdgpu_vcnfw_log;
 
 static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
+#if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+DYNDBG_CLASSMAP_USE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_CORE",
 			"DRM_UT_DRIVER",
 			"DRM_UT_KMS",
@@ -199,6 +200,7 @@ DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_LEASE",
 			"DRM_UT_DP",
 			"DRM_UT_DRMRES");
+#endif
 
 struct amdgpu_mgpu_info mgpu_info = {
 	.mutex = __MUTEX_INITIALIZER(mgpu_info.mutex),
diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 16565a0a5da6..8fa7a88299e7 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -41,7 +41,8 @@
 
 #include "drm_dp_helper_internal.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
+#if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+DYNDBG_CLASSMAP_USE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_CORE",
 			"DRM_UT_DRIVER",
 			"DRM_UT_KMS",
@@ -52,6 +53,7 @@ DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_LEASE",
 			"DRM_UT_DP",
 			"DRM_UT_DRMRES");
+#endif
 
 struct dp_aux_backlight {
 	struct backlight_device *base;
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 7d86020b5244..2f747c9c8f60 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -51,7 +51,8 @@
 
 #include "drm_crtc_helper_internal.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
+#if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+DYNDBG_CLASSMAP_USE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_CORE",
 			"DRM_UT_DRIVER",
 			"DRM_UT_KMS",
@@ -62,6 +63,7 @@ DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_LEASE",
 			"DRM_UT_DP",
 			"DRM_UT_DRMRES");
+#endif
 
 /**
  * DOC: overview
diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 5b93c11895bb..4b697e18238d 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -56,7 +56,7 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 module_param_named(debug, __drm_debug, ulong, 0600);
 #else
 /* classnames must match vals of enum drm_debug_category */
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
+DYNDBG_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_CORE",
 			"DRM_UT_DRIVER",
 			"DRM_UT_KMS",
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index d1e4d528cb17..b5b2542ae364 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -29,7 +29,8 @@
 #include "i915_params.h"
 #include "i915_drv.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
+#if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+DYNDBG_CLASSMAP_USE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_CORE",
 			"DRM_UT_DRIVER",
 			"DRM_UT_KMS",
@@ -40,6 +41,7 @@ DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_LEASE",
 			"DRM_UT_DP",
 			"DRM_UT_DRMRES");
+#endif
 
 #define i915_param_named(name, T, perm, desc) \
 	module_param_named(name, i915_modparams.name, T, perm); \
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index fd99ec0f4257..2963cf5b0807 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -71,7 +71,8 @@
 #include "nouveau_svm.h"
 #include "nouveau_dmem.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
+#if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+DYNDBG_CLASSMAP_USE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_CORE",
 			"DRM_UT_DRIVER",
 			"DRM_UT_KMS",
@@ -82,6 +83,7 @@ DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_LEASE",
 			"DRM_UT_DP",
 			"DRM_UT_DRMRES");
+#endif
 
 MODULE_PARM_DESC(config, "option string to pass to driver core");
 static char *nouveau_config;
diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 81b643ab7f6e..1cdfd62fd2e4 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -56,7 +56,7 @@ struct _ddebug {
 #endif
 } __attribute__((aligned(8)));
 
-enum class_map_type {
+enum ddebug_class_map_type {
 	DD_CLASS_TYPE_DISJOINT_BITS,
 	/**
 	 * DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, one per bit.
@@ -86,17 +86,19 @@ struct ddebug_class_map {
 	const char **class_names;
 	const int length;
 	const int base;		/* index of 1st .class_id, allows split/shared space */
-	enum class_map_type map_type;
+	enum ddebug_class_map_type map_type;
 };
 
 /**
- * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
+ * DYNDBG_CLASSMAP_DEFINE - define the class_map that names the
+ * debug classes used in this module.  This tells dyndbg the authorized
+ * classnames it should manipulate.
  * @_var:   a struct ddebug_class_map, passed to module_param_cb
  * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
  * @_base:  offset of 1st class-name. splits .class_id space
  * @classes: class-names used to control class'd prdbgs
  */
-#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
+#define DYNDBG_CLASSMAP_DEFINE(_var, _maptype, _base, ...)		\
 	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
 	static struct ddebug_class_map __aligned(8) __used		\
 		__section("__dyndbg_classes") _var = {			\
@@ -108,6 +110,16 @@ struct ddebug_class_map {
 		.class_names = _var##_classnames,			\
 	}
 
+/*
+ * refer to the classmap instantiated once, by the macro above.  This
+ * distinguishes the multiple users of drm.debug from the single
+ * definition, allowing them to specialize.  ATM its a pass-thru, but
+ * it should help regularize the admittedly wierd sharing by identical
+ * definitions.
+ */
+#define DYNDBG_CLASSMAP_USE(_var, _maptype, _base, ...)		\
+	DYNDBG_CLASSMAP_DEFINE(_var, _maptype, _base, __VA_ARGS__)
+
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
 	struct _ddebug *descs;
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 89dd7f285e31..8d384b979e74 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -62,38 +62,38 @@ enum cat_disjoint_bits {
 	D2_LEASE,
 	D2_DP,
 	D2_DRMRES };
-DECLARE_DYNDBG_CLASSMAP(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"D2_CORE",
-			"D2_DRIVER",
-			"D2_KMS",
-			"D2_PRIME",
-			"D2_ATOMIC",
-			"D2_VBL",
-			"D2_STATE",
-			"D2_LEASE",
-			"D2_DP",
-			"D2_DRMRES");
+DYNDBG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS, 0,
+		       "D2_CORE",
+		       "D2_DRIVER",
+		       "D2_KMS",
+		       "D2_PRIME",
+		       "D2_ATOMIC",
+		       "D2_VBL",
+		       "D2_STATE",
+		       "D2_LEASE",
+		       "D2_DP",
+		       "D2_DRMRES");
 DD_SYS_WRAP(disjoint_bits, p);
 DD_SYS_WRAP(disjoint_bits, T);
 
 /* symbolic input, independent bits */
 enum cat_disjoint_names { LOW = 10, MID, HI };
-DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
-			"LOW", "MID", "HI");
+DYNDBG_CLASSMAP_DEFINE(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
+		       "LOW", "MID", "HI");
 DD_SYS_WRAP(disjoint_names, p);
 DD_SYS_WRAP(disjoint_names, T);
 
 /* numeric verbosity, V2 > V1 related */
 enum cat_level_num { V0 = 14, V1, V2, V3, V4, V5, V6, V7 };
-DECLARE_DYNDBG_CLASSMAP(map_level_num, DD_CLASS_TYPE_LEVEL_NUM, 14,
+DYNDBG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM, 14,
 		       "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
 DD_SYS_WRAP(level_num, p);
 DD_SYS_WRAP(level_num, T);
 
 /* symbolic verbosity */
 enum cat_level_names { L0 = 22, L1, L2, L3, L4, L5, L6, L7 };
-DECLARE_DYNDBG_CLASSMAP(map_level_names, DD_CLASS_TYPE_LEVEL_NAMES, 22,
-			"L0", "L1", "L2", "L3", "L4", "L5", "L6", "L7");
+DYNDBG_CLASSMAP_DEFINE(map_level_names, DD_CLASS_TYPE_LEVEL_NAMES, 22,
+		       "L0", "L1", "L2", "L3", "L4", "L5", "L6", "L7");
 DD_SYS_WRAP(level_names, p);
 DD_SYS_WRAP(level_names, T);
 
-- 
2.39.0

