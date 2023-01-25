Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DFE67BCF1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 21:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9305510E899;
	Wed, 25 Jan 2023 20:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC45410E236;
 Wed, 25 Jan 2023 20:38:08 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id d10so9240846ilc.12;
 Wed, 25 Jan 2023 12:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bpy0cOVfK4F6f9ncMq3cj66TYMa4mKfP9CUrXJEdxTg=;
 b=TWV8wMFDKNXBp8LyUMYYmYWrF8cZDRtuzuNXn1mLzLMypVaSkOh8oTER+04ZDuh2mV
 BrmASw+dQ4yN0ZpvuhBe3oNPNSfyAMgyijDgVCuU1mVNhRCIMTT7/S1SDSgS0eEcoG6d
 JKPNFOrHb05Q5fEnybVwPaiJ/Qe53gsfj1bP8Tb5gB/My2TSuAXhUkMMljGE2aYsZIL3
 cET+MdfylZ5fGqe8jmNit3RkPKRSs2VvPnfPSciZHHJQfF2dcu9eRCbk2yOPkT6J30Jl
 xv4dXo3obpUy64/PjI6AkjYfukIMG5DRtDV2m71Y4D9ZBJGifprxy1Jfb0riNjxuEFPe
 QNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bpy0cOVfK4F6f9ncMq3cj66TYMa4mKfP9CUrXJEdxTg=;
 b=T+QUKewAIWf+v3ggSGR5QeYLTHKgqNR4Gk4b4/QzsJqIzTHlQSpEaamqB+3IxzZatE
 6znfEy9Kgwdh1nk7ubmro4LT05co76AUJxt+K//a0GP+c2s4WHKOp2UHjE7kU78R8/1B
 gENS95vEiAtBa3ysPxFAJzm5lunAVLLZFfkM9RBAgyQZgjc6mvQw3rwaBphhFcYPy4f/
 ffAU67py11ERN2Xzc8E6wc+NwSafK5g1Y1M3crlSRa30b/yPmpdS5bjQbW+6uhxXKXsg
 2Q7CLgZN4tlhWQQ92Ng6MNLucnaQanktAsUdMUlIJhYsWpw6o6x4ne3NWVILx+oTXVqF
 f5rg==
X-Gm-Message-State: AO0yUKVcg35pWpGcnWh5W3mzB+51R4uty8JzY/YZ4sZL7eny8TY1n3wm
 1+w8G4AteqvP3NLwm4ZzOhE=
X-Google-Smtp-Source: AK7set91Vk82/inU4wE1cqLdpZl7tyW1wrabuUXppQ+nvECvIdXf4JiVXdt7yWOy4lHnA34aQpJiLg==
X-Received: by 2002:a92:c267:0:b0:310:ae72:32a0 with SMTP id
 h7-20020a92c267000000b00310ae7232a0mr820233ild.21.1674679087884; 
 Wed, 25 Jan 2023 12:38:07 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y11-20020a056e02128b00b00310a599fd43sm665104ilq.46.2023.01.25.12.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:38:07 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 10/19] dyndbg-API: split DECLARE_(DYNDBG_CLASSMAP) to
 $1(_DEFINE|_USE)
Date: Wed, 25 Jan 2023 13:37:34 -0700
Message-Id: <20230125203743.564009-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125203743.564009-1-jim.cromie@gmail.com>
References: <20230125203743.564009-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org
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
index cd4caaa29528..a7a3a382c4a6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -189,7 +189,8 @@ int amdgpu_vcnfw_log;
 
 static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
+#if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+DYNDBG_CLASSMAP_USE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_CORE",
 			"DRM_UT_DRIVER",
 			"DRM_UT_KMS",
@@ -200,6 +201,7 @@ DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
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
index a209659a996c..7e6b25446303 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -50,7 +50,8 @@
 
 #include "drm_crtc_helper_internal.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
+#if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+DYNDBG_CLASSMAP_USE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_CORE",
 			"DRM_UT_DRIVER",
 			"DRM_UT_KMS",
@@ -61,6 +62,7 @@ DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
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
index 80f154b6adab..e4146b9af357 100644
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
2.39.1

