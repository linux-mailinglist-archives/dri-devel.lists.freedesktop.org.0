Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5105F5AC747
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B997810E2DD;
	Sun,  4 Sep 2022 21:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08B610E133;
 Sun,  4 Sep 2022 21:42:34 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id l16so3889010ilj.2;
 Sun, 04 Sep 2022 14:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Yb6CWV+TDDmM9onUuCxvFgBnmtmfnm46mq8t0HXB9jg=;
 b=lHCcfKuE75YvbApb3Q3ZrFKS/VLaGwoG8AzIOt7lRvkN6SBFDFxisWcCRiGMiVWTmH
 Kt63m7En4yLxNz7W7gTVWvhHgavhPV4rIN/E8gjWDoz36fXVQ8TufnV5YiPONZdg0wA9
 PSC+3lVcstXByssTzg5qYKmlsp30bseonqBYHx7jAS4+G7wvrNp/c/1zAFFPf+Zb+I+C
 bM52a0v8IgrcQsDr4+T74tV0XI154yB2HOw02ZrUn321+0Geo88H4CTT7pj1lgDKjIx/
 lz/D5+FWjXkDEy4M7lN8ydHYZ3SpeaGHxvF6OeZEhZdGSQrj5iVYVDwQgerulqIfnVFo
 NX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Yb6CWV+TDDmM9onUuCxvFgBnmtmfnm46mq8t0HXB9jg=;
 b=VV+h+iCxcnMtU4hjwqnYkNPpjh1QYOTa7mGMTk2lCPFyBeqYJtowAwSaQ2LnvWXD2c
 Jn8XOBuqeSlraEiBF/k2tjVMBj72Mm2Jt17Hy5P8OdCMjVwhgC3qJ4ADjNozWd/jEXsH
 DEKvuP7lOtXSlmTlz9Y5hx/3rye1xNSAPxO92t9aN+ST4eJb1EimfZxASU0t505QYIW1
 emx8gH7Repsp9+D2zxKQqJuVZKZxPvf3rG/lpjdYETIhopYknAYpsN6ApNXonSGeciJT
 ViQX+Z9UHGJIZSN0vnOQCCNvv3x6dFuf6x9HoH2AIx+W09F81agKu6UDUdlJfBSBSnyU
 +GYA==
X-Gm-Message-State: ACgBeo13KEwzmOF2ay+lr4W2dU78TFUXDidCB0QE7nEGm4BAXkPCn0Rg
 RHBJDdeT3Adro+xVoqpBOpc=
X-Google-Smtp-Source: AA6agR5Cx+ajN8UUSivj7N6vamViDhkJkE8U1oCqTJYgtKCcaD95EUgEYEoUpvP503z2jlMiKd37Xg==
X-Received: by 2002:a92:6a0d:0:b0:2e5:afe7:8d95 with SMTP id
 f13-20020a926a0d000000b002e5afe78d95mr24687711ilc.262.1662327752155; 
 Sun, 04 Sep 2022 14:42:32 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:31 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 23/57] drm: POC drm on dyndbg - use in core, 2 helpers,
 3 drivers.
Date: Sun,  4 Sep 2022 15:41:00 -0600
Message-Id: <20220904214134.408619-24-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
index de7144b06e93..97e184f44a52 100644
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
index 92990a3d577a..cbb9c4d6d8f2 100644
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
index 457448cc60f7..7d86020b5244 100644
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
2.37.2

