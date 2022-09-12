Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 975AB5B536D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 07:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047D310E0D1;
	Mon, 12 Sep 2022 05:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF27B10E0AB;
 Mon, 12 Sep 2022 05:29:07 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id a9so4011343ilh.1;
 Sun, 11 Sep 2022 22:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bnCHvGKNAXNGvseJ5Qe9gG23X6P5GOGM0apmqa4fpLc=;
 b=g6XxCUqwa5xgZmbtvXIlvM7H8WCH+JLEDHfNuH6D4MuKTRcQu4V+nAncVQxlQOuW/p
 xQworH3QdEMVrUkcRzUcCbWsMwpLJLyxXh+80viA7j3cveGOj7AYjVGG+h1Zweo3hSrj
 qjbMXP0W5dPiOddfR9bS7ANafeoklyGdkAvKs9FcFESpMNWl3M16ecoZCbfyfl7Thfl8
 87Wfl+biMW+AL5eZDDe+l9GD1rorbsJettPPxmKNrqe/53Gc/ch+Y1uAoiO+yDA8D82+
 R2xXcZVaOHsrC0zs+dhQvcVWHno2znz5ouuY8TMe8UzXYZcBmPqaigYco188i6bzOw2Y
 tjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bnCHvGKNAXNGvseJ5Qe9gG23X6P5GOGM0apmqa4fpLc=;
 b=222Vg9XaDJ/1O5/0TA+luT86Lurw+J7x+rJwcXVt2BvgPLmP5uvGBwl6qWNtPBql3H
 TUkWZrWxsEOrfn95g78PerOAhfF9LtsmX7c39LJLTfiptJxNDvg4dqVY/F+ZkjnqOWQe
 RoM8JjU4OArthXAY8/fOkkCxFp6RvHuUJz1RwCkL8FqDzS2htWWffJ2Znoh4wdn2Hs1E
 sjojsHofKill+qTzevxyktnW010kZXD4vhszNSg1LbH15lFA74q7o13M8UPZF1M6Xebx
 C5VzdsZgIyTV+fqaf3dlIDsfufNnfEvYhCuxuybB1HTnvD9uU8Ry59PJVcKWvra9J7q7
 U5hQ==
X-Gm-Message-State: ACgBeo3wz1hdq2KF8YfEh/uvT6AmTzYMo76Y3yzDQc6B49/ifN705ELf
 FRNT6AjT5W70t1ajqO8WAKh0YQg7AbU60g==
X-Google-Smtp-Source: AA6agR7m+aIr78HestSNGiiCjuBt8mOW2W4BVSV2esuU7Tzrr3TQpjmGtQxoiYu+pDDtV6XRFDk8bQ==
X-Received: by 2002:a05:6e02:1a86:b0:2f0:64bf:83a9 with SMTP id
 k6-20020a056e021a8600b002f064bf83a9mr10040022ilv.270.1662960547137; 
 Sun, 11 Sep 2022 22:29:07 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q16-20020a056e02079000b002eb75fb01dbsm3006057ils.28.2022.09.11.22.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 22:29:06 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/9] drm: POC drm on dyndbg - use in core, 2 helpers,
 3 drivers.
Date: Sun, 11 Sep 2022 23:28:45 -0600
Message-Id: <20220912052852.1123868-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912052852.1123868-1-jim.cromie@gmail.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use DECLARE_DYNDBG_CLASSMAP across DRM:

 - in .c files, since macro defines/initializes a record

 - in drivers, $mod_{drv,drm,param}.c
   ie where param setup is done, since a classmap is param related

 - in drm/drm_print.c
   since existing __drm_debug param is defined there,
   and we ifdef it, and provide an elaborated alternative.

 - in drm_*_helper modules:
   dp/drm_dp - 1st item in makefile target
   drivers/gpu/drm/drm_crtc_helper.c - random pick iirc.

Since these modules all use identical CLASSMAP declarations (ie: names
and .class_id's) they will all respond together to "class DRM_UT_*"
query-commands:

  :#> echo class DRM_UT_KMS +p > /proc/dynamic_debug/control

NOTES:

This changes __drm_debug from int to ulong, so BIT() is usable on it.

DRM's enum drm_debug_category values need to sync with the index of
their respective class-names here.  Then .class_id == category, and
dyndbg's class FOO mechanisms will enable drm_dbg(DRM_UT_KMS, ...).

Though DRM needs consistent categories across all modules, thats not
generally needed; modules X and Y could define FOO differently (ie a
different NAME => class_id mapping), changes are made according to
each module's private class-map.

No callsites are actually selected by this patch, since none are
class'd yet.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 14 +++++++++++++
 drivers/gpu/drm/display/drm_dp_helper.c | 13 ++++++++++++
 drivers/gpu/drm/drm_crtc_helper.c       | 13 ++++++++++++
 drivers/gpu/drm/drm_print.c             | 27 +++++++++++++++++++++++--
 drivers/gpu/drm/i915/i915_params.c      | 12 +++++++++++
 drivers/gpu/drm/nouveau/nouveau_drm.c   | 13 ++++++++++++
 include/drm/drm_print.h                 |  3 ++-
 7 files changed, 92 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 429fcdf28836..5f091cb52de2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -38,6 +38,8 @@
 #include <linux/mmu_notifier.h>
 #include <linux/suspend.h>
 #include <linux/cc_platform.h>
+#include <linux/fb.h>
+#include <linux/dynamic_debug.h>
 
 #include "amdgpu.h"
 #include "amdgpu_irq.h"
@@ -185,6 +187,18 @@ int amdgpu_vcnfw_log;
 
 static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
 
+DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
+			"DRM_UT_CORE",
+			"DRM_UT_DRIVER",
+			"DRM_UT_KMS",
+			"DRM_UT_PRIME",
+			"DRM_UT_ATOMIC",
+			"DRM_UT_VBL",
+			"DRM_UT_STATE",
+			"DRM_UT_LEASE",
+			"DRM_UT_DP",
+			"DRM_UT_DRMRES");
+
 struct amdgpu_mgpu_info mgpu_info = {
 	.mutex = __MUTEX_INITIALIZER(mgpu_info.mutex),
 	.delayed_reset_work = __DELAYED_WORK_INITIALIZER(
diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e5bab236b3ae..196dfb1e8d87 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -30,6 +30,7 @@
 #include <linux/sched.h>
 #include <linux/seq_file.h>
 #include <linux/string_helpers.h>
+#include <linux/dynamic_debug.h>
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_dp_mst_helper.h>
@@ -40,6 +41,18 @@
 
 #include "drm_dp_helper_internal.h"
 
+DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
+			"DRM_UT_CORE",
+			"DRM_UT_DRIVER",
+			"DRM_UT_KMS",
+			"DRM_UT_PRIME",
+			"DRM_UT_ATOMIC",
+			"DRM_UT_VBL",
+			"DRM_UT_STATE",
+			"DRM_UT_LEASE",
+			"DRM_UT_DP",
+			"DRM_UT_DRMRES");
+
 struct dp_aux_backlight {
 	struct backlight_device *base;
 	struct drm_dp_aux *aux;
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 8a6d54515f92..a8cee6694cf6 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -32,6 +32,7 @@
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/moduleparam.h>
+#include <linux/dynamic_debug.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -51,6 +52,18 @@
 
 #include "drm_crtc_helper_internal.h"
 
+DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
+			"DRM_UT_CORE",
+			"DRM_UT_DRIVER",
+			"DRM_UT_KMS",
+			"DRM_UT_PRIME",
+			"DRM_UT_ATOMIC",
+			"DRM_UT_VBL",
+			"DRM_UT_STATE",
+			"DRM_UT_LEASE",
+			"DRM_UT_DP",
+			"DRM_UT_DRMRES");
+
 /**
  * DOC: overview
  *
diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index f783d4963d4b..ec32df35a3e3 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -40,7 +40,7 @@
  * __drm_debug: Enable debug output.
  * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
  */
-unsigned int __drm_debug;
+unsigned long __drm_debug;
 EXPORT_SYMBOL(__drm_debug);
 
 MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug category.\n"
@@ -52,7 +52,30 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 "\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
 "\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
 "\t\tBit 8 (0x100) will enable DP messages (displayport code)");
-module_param_named(debug, __drm_debug, int, 0600);
+
+#if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+module_param_named(debug, __drm_debug, ulong, 0600);
+#else
+/* classnames must match vals of enum drm_debug_category */
+DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
+			"DRM_UT_CORE",
+			"DRM_UT_DRIVER",
+			"DRM_UT_KMS",
+			"DRM_UT_PRIME",
+			"DRM_UT_ATOMIC",
+			"DRM_UT_VBL",
+			"DRM_UT_STATE",
+			"DRM_UT_LEASE",
+			"DRM_UT_DP",
+			"DRM_UT_DRMRES");
+
+static struct ddebug_class_param drm_debug_bitmap = {
+	.bits = &__drm_debug,
+	.flags = "p",
+	.map = &drm_debug_classes,
+};
+module_param_cb(debug, &param_ops_dyndbg_classes, &drm_debug_bitmap, 0600);
+#endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
 {
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 6fc475a5db61..d1e4d528cb17 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -29,6 +29,18 @@
 #include "i915_params.h"
 #include "i915_drv.h"
 
+DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
+			"DRM_UT_CORE",
+			"DRM_UT_DRIVER",
+			"DRM_UT_KMS",
+			"DRM_UT_PRIME",
+			"DRM_UT_ATOMIC",
+			"DRM_UT_VBL",
+			"DRM_UT_STATE",
+			"DRM_UT_LEASE",
+			"DRM_UT_DP",
+			"DRM_UT_DRMRES");
+
 #define i915_param_named(name, T, perm, desc) \
 	module_param_named(name, i915_modparams.name, T, perm); \
 	MODULE_PARM_DESC(name, desc)
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 561309d447e0..fd99ec0f4257 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -28,6 +28,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/vga_switcheroo.h>
 #include <linux/mmu_notifier.h>
+#include <linux/dynamic_debug.h>
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_crtc_helper.h>
@@ -70,6 +71,18 @@
 #include "nouveau_svm.h"
 #include "nouveau_dmem.h"
 
+DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
+			"DRM_UT_CORE",
+			"DRM_UT_DRIVER",
+			"DRM_UT_KMS",
+			"DRM_UT_PRIME",
+			"DRM_UT_ATOMIC",
+			"DRM_UT_VBL",
+			"DRM_UT_STATE",
+			"DRM_UT_LEASE",
+			"DRM_UT_DP",
+			"DRM_UT_DRMRES");
+
 MODULE_PARM_DESC(config, "option string to pass to driver core");
 static char *nouveau_config;
 module_param_named(config, nouveau_config, charp, 0400);
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index b3b470440e46..668273e36c2c 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -35,7 +35,7 @@
 #include <drm/drm.h>
 
 /* Do *not* use outside of drm_print.[ch]! */
-extern unsigned int __drm_debug;
+extern unsigned long __drm_debug;
 
 /**
  * DOC: print
@@ -275,6 +275,7 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
  *
  */
 enum drm_debug_category {
+	/* These names must match those in DYNAMIC_DEBUG_CLASSBITS */
 	/**
 	 * @DRM_UT_CORE: Used in the generic drm code: drm_ioctl.c, drm_mm.c,
 	 * drm_memory.c, ...
-- 
2.37.3

