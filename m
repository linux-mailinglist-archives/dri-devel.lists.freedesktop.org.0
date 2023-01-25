Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1319867BCED
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 21:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9221110E893;
	Wed, 25 Jan 2023 20:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9613610E88E;
 Wed, 25 Jan 2023 20:38:10 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id u8so9238267ilq.13;
 Wed, 25 Jan 2023 12:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RDPJAYdKLEdQblt6ktavPWelw6rNVhYcEEPUN0RMT1I=;
 b=W3Ky8nLoAb0y3R+ldW3oKmbw8upJ6lBigDDP/1rAfqL8jzNIsn/awIbfzxEaY8iR3i
 x1myMKLV8cd0LN642UUqu8W7Uog7BY58vazhhjrE5y/1yOTGODvCP47tKkURTUffuMj+
 CZyG1f7vFCWXgECumJsj40T+ncpB5uGq1XLf6I0hP2pkz7ieithxxQZlJxmNA+Ks+xUP
 wtSclTO/8NBPqzrxKo867fgnFA3mtDcslqn8149p1szWdKYuLWLJJO3KEwSrlQW/jZ1M
 IxbyBdTWLVKoGgLEdXuAZHFUDZwvAM7lXSWn7lqcZH7t3Mxbb7h5JS1cxEmXkO/Zbnwp
 9zUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RDPJAYdKLEdQblt6ktavPWelw6rNVhYcEEPUN0RMT1I=;
 b=NoYbZyzmTnCDD+IBNFF/zSHaSTMvULGJbqZrdab2KAzcxsokJp9XfvB5SPicKaAC2q
 xFT+DEnrY1sgQ+/JKE2MeHHI7d61Gqn5giqolsYVdBLwnB0YyHf0VVs4yXPBQhqVB9rV
 Lu1GlampFzXGybNWWjFO32jpNnXGjSVQd883jgFhEtjNsCXBdMQHcAT0d6kYFBgrw8To
 twrl6LxqaJwaRQrxNueUAHST9OL+pV1DH3W4okVEg3KteU1hmbJEoou9jgWOQTVNMBls
 RAByyAXgoOUGEoDCqLbqiWAiylR3RjitoaBosvnyq6VInQLKGWfZPtvmlmIBZOV8FQfH
 KgMg==
X-Gm-Message-State: AO0yUKXzqeZJog20/R08vlMhyH7EEkhrEnvU5GkhzLNiHWRUEOOR4lD8
 aXTUxynWlzLKKZyqJAM/eNxtg92a7Wg=
X-Google-Smtp-Source: AK7set8gR1dUF61yRz2B6WQ5tB9/qCT1EGwv6OZBRZQ8Mqy1amfGMF+KfW6lsG7TNb/srUF58lcnRA==
X-Received: by 2002:a05:6e02:214b:b0:310:937d:7644 with SMTP id
 d11-20020a056e02214b00b00310937d7644mr6286473ilv.18.1674679089818; 
 Wed, 25 Jan 2023 12:38:09 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y11-20020a056e02128b00b00310a599fd43sm665104ilq.46.2023.01.25.12.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:38:09 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 12/19] dyndbg-API: DYNDBG_CLASSMAP_USE drop extra args
Date: Wed, 25 Jan 2023 13:37:36 -0700
Message-Id: <20230125203743.564009-13-jim.cromie@gmail.com>
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

Drop macro args after _var.  Since DYNDBG_CLASSMAP_USE no longer
forwards to DYNDBG_CLASSMAP_DEFINE, it doesn't need those args to
forward.  Keep only the _var arg, which is the extern'd struct
classmap with all the class info.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 12 +---------
 drivers/gpu/drm/display/drm_dp_helper.c | 12 +---------
 drivers/gpu/drm/drm_crtc_helper.c       | 12 +---------
 drivers/gpu/drm/i915/i915_params.c      | 12 +---------
 drivers/gpu/drm/nouveau/nouveau_drm.c   | 12 +---------
 include/linux/dynamic_debug.h           | 30 ++++++++++++++-----------
 6 files changed, 22 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index a7a3a382c4a6..6c57e598b7d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -190,17 +190,7 @@ int amdgpu_vcnfw_log;
 static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
 
 #if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
-DYNDBG_CLASSMAP_USE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
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
+DYNDBG_CLASSMAP_USE(drm_debug_classes);
 #endif
 
 struct amdgpu_mgpu_info mgpu_info = {
diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 8fa7a88299e7..3bc188cb1116 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -42,17 +42,7 @@
 #include "drm_dp_helper_internal.h"
 
 #if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
-DYNDBG_CLASSMAP_USE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
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
+DYNDBG_CLASSMAP_USE(drm_debug_classes);
 #endif
 
 struct dp_aux_backlight {
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 7e6b25446303..1780db9de069 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -51,17 +51,7 @@
 #include "drm_crtc_helper_internal.h"
 
 #if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
-DYNDBG_CLASSMAP_USE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
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
+DYNDBG_CLASSMAP_USE(drm_debug_classes);
 #endif
 
 /**
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index b5b2542ae364..e959d0384ead 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -30,17 +30,7 @@
 #include "i915_drv.h"
 
 #if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
-DYNDBG_CLASSMAP_USE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
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
+DYNDBG_CLASSMAP_USE(drm_debug_classes);
 #endif
 
 #define i915_param_named(name, T, perm, desc) \
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index e4146b9af357..ad341411687f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -72,17 +72,7 @@
 #include "nouveau_dmem.h"
 
 #if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
-DYNDBG_CLASSMAP_USE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
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
+DYNDBG_CLASSMAP_USE(drm_debug_classes);
 #endif
 
 MODULE_PARM_DESC(config, "option string to pass to driver core");
diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 397ac8294230..91015d1a04e0 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -90,13 +90,15 @@ struct ddebug_class_map {
 };
 
 /**
- * DYNDBG_CLASSMAP_DEFINE - define the class_map that names the
- * debug classes used in this module.  This tells dyndbg the authorized
- * classnames it should manipulate.
- * @_var:   a struct ddebug_class_map, passed to module_param_cb
+ * DYNDBG_CLASSMAP_DEFINE - define debug-classes used by a module.
+ * @_var:   name of the classmap, exported for other modules coordinated use.
  * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
  * @_base:  offset of 1st class-name. splits .class_id space
- * @classes: class-names used to control class'd prdbgs
+ * @classes: enum-map - symbol names are "classnames", vals are .class_ids
+ *
+ * @classes vals are _ddebug.class_ids used in the module, the symbol
+ * names are stringified; they authorize "class FOO" to >control.
+ * Connection to a kernel-param is done separately.
  */
 #define DYNDBG_CLASSMAP_DEFINE(_var, _maptype, _base, ...)		\
 	const char *_var##_classnames[] = { __VA_ARGS__ };		\
@@ -116,16 +118,18 @@ struct ddebug_class_user {
 	struct ddebug_class_map *map;
 };
 /**
- * DYNDBG_CLASSMAP_USE - Use a classmap DEFINEd in another module.
- * This lets dyndbg initialize the dependent module's prdbgs from the
- * other module's controlling sysfs node.
+ * DYNDBG_CLASSMAP_USE - refer to a classmap, DEFINEd elsewhere.
+ * @_var: name of the exported classmap
+ *
+ * This registers the module's use of another module's classmap defn,
+ * allowing dyndbg to find the controlling kparam, and propagate its
+ * settings to the dependent module being loaded.
  */
-#define DYNDBG_CLASSMAP_USE(_var, ...)					\
-	DYNDBG_CLASSMAP_USE_(_var, __UNIQUE_ID(ddebug_class_user),	\
-			     __VA_ARGS__)
-#define DYNDBG_CLASSMAP_USE_(_var, _uname, ...)				\
+#define DYNDBG_CLASSMAP_USE(_var)					\
+	DYNDBG_CLASSMAP_USE_(_var, __UNIQUE_ID(ddebug_class_user))
+#define DYNDBG_CLASSMAP_USE_(_var, _uname)				\
 	extern struct ddebug_class_map _var;				\
-	static struct ddebug_class_user __used				\
+	struct ddebug_class_user __used					\
 	__section("__dyndbg_class_refs") _uname = {			\
 		.user_mod_name = KBUILD_MODNAME,			\
 		.map = &_var,						\
-- 
2.39.1

