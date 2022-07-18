Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAA8577B59
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F77A9CF3;
	Mon, 18 Jul 2022 06:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B674A9CBA;
 Mon, 18 Jul 2022 06:38:43 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id w16so5094297ilh.0;
 Sun, 17 Jul 2022 23:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BNS0w3QJhu2C9zSwVf1bIN998VE3nZkuL7IReih3E8I=;
 b=fq+biAjyDAbzUqXTvJHNE11ULG1kX4A+EoskH5sXn+4AnKh0INAuWsWTvZodTik8pi
 MwSQl7oCYc7i2Iwc++8eERAijtpp1tTkNgASC4P4FV2m19jizStsiUuV4+oS6hu1TwrC
 HbBdcbHHLaQEabUsN4c+Jnk99LiFQ1uYEP3bBpcGTdEU2on8VBcmTKRJf7NrpZHunD9k
 khcLK+OGCH4q+lkKnlYkvqmQOK3KTL1TecouMaV9fUePO0NFkQxcrhhVT4PIhwbgs6uf
 viqRa2+X1iO9LlrM3rezHkLk5DCdgXS7qJWMbL4c3svnV9e5kewNw2mPs1tOJzvJc8AU
 6o+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BNS0w3QJhu2C9zSwVf1bIN998VE3nZkuL7IReih3E8I=;
 b=hPq9h/Hsnb5X4CCTi1sdg0Kx4NCQyPbajBF90yBLGqDNRtVVMzxrWoaD07uNVDZ5VC
 EW2aqrOrZxhGYxUDTf/xQipx4eqepCUkZDIaOa5KHp8/w4+XCo6rwT2a8VR4hNR38hCh
 fWS84lom077+3BHKPrifQ3+e1s4rUi4QhoL92675YCJ31VuVGmY5ZtVW1RDVDDkxI++P
 DRK5H4jcbY5R2C04LBPhjrBQEnerGR7TN+XOQsL7SL1FFCJ0rZeVDluG6C80ELd9jWS3
 /vLKNlEK0Be/DQ7n14E6QLS785fl/3YXlt6PMfQUIXai+QVSTudQttWxa94l/87NM1Es
 z4pQ==
X-Gm-Message-State: AJIora/ABT6IaIIl3A3kEMRU+Laz1CuT7o6Oh7YzQs5WWJ3C3PjUQEK/
 IAtZ/BpqerC5FdKpGRPe+OERsqO8uR8=
X-Google-Smtp-Source: AGRyM1uHfm3VrWLk5XhWmywd4azOthSSe45BhPmXMYOdNeuAkBEFJEEzoaijgtSD/Au8raYg46uJ9w==
X-Received: by 2002:a92:ca4c:0:b0:2dc:864f:8a53 with SMTP id
 q12-20020a92ca4c000000b002dc864f8a53mr12954390ilo.299.1658126322988; 
 Sun, 17 Jul 2022 23:38:42 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:42 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 21/41] drm: POC drm on dyndbg - use in core, 2 helpers,
 3 drivers.
Date: Mon, 18 Jul 2022 00:36:05 -0600
Message-Id: <20220718063641.9179-22-jim.cromie@gmail.com>
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

Use DECLARE_DYNDBG_CLASSMAP across DRM:

 - in .c files, since macro defines/initializes a record

 - in drivers, $mod_{drv,drm,param}.c
   ie where param setup is done (since a class-bitmap is a param)

 - in drm/drm_print.c, since thats where it
   adds the class-bitmap, and replaces module_param_named.

 - in drm_*_helper modules:
   dp/drm_dp - 1st item in makefile target
   drivers/gpu/drm/drm_crtc_helper.c - random pick iirc.

Since these modules all use identical class-maps (ie: names and
.class_id's) they all will respond together to class FOO changes:

  :#> echo class DRM_UT_KMS +p > /proc/dynamic_debug/control

ttm and video have 2,8 callsites each, I havent looked.

NOTES:

DRM's enum drm_debug_category values need to sync with the index of
their respective class-names here.  Then .class_id == category, and
dyndbg's class FOO mechanisms will enable drm_dbg(DRM_UT_KMS, ...).

Though DRM needs consistent categories across all modules, thats not
generally needed; modules X and Y could define FOO differently (ie
different corresponding .class_id), changes are made according to each
module's private class-map.

No callsites are actually selected here, since none are class'd yet.

change __drm_debug from int to long, so BIT() is usable on it.

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
index 8890300766a5..ba96d33137b6 100644
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
@@ -183,6 +185,18 @@ int amdgpu_vcnfw_log;
 
 static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
 
+DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT, 0,
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
index e7c22c2ca90c..eb7aef22e7fd 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -29,6 +29,7 @@
 #include <linux/sched.h>
 #include <linux/seq_file.h>
 #include <linux/string_helpers.h>
+#include <linux/dynamic_debug.h>
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_dp_mst_helper.h>
@@ -38,6 +39,18 @@
 
 #include "drm_dp_helper_internal.h"
 
+DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT, 0,
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
index b632825654a9..80f2cf807dae 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -32,6 +32,7 @@
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/moduleparam.h>
+#include <linux/dynamic_debug.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -50,6 +51,18 @@
 
 #include "drm_crtc_helper_internal.h"
 
+DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT, 0,
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
index f783d4963d4b..44be95fac164 100644
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
+DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT, 0,
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
+static struct ddebug_classes_bitmap_param drm_debug_bitmap = {
+	.bits = &__drm_debug,
+	.flags = "p",
+	.map = &drm_debug_classes,
+};
+module_param_cb(debug, &param_ops_dyndbg_classes, &drm_debug_bitmap, 0600);
+#endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
 {
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 701fbc98afa0..b0ce128e245a 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -29,6 +29,18 @@
 #include "i915_params.h"
 #include "i915_drv.h"
 
+DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT, 0,
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
index 561309d447e0..76e3a8d50b01 100644
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
 
+DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT, 0,
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
2.36.1

