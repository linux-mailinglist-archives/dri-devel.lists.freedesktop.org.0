Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B5C616FD0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 22:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D090410E66C;
	Wed,  2 Nov 2022 21:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A77110E66A;
 Wed,  2 Nov 2022 21:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667424675; x=1698960675;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MCvp0zsGIxS6/l36TRNcrfc7KEoySfC/pnuwABAuXl8=;
 b=a/Om4nRdhBP/c6jjzI+XINH9mpBmnWv+ROsBTpkaOwXSbv4wRtRSkIQJ
 /r3YqdIVymB6FRX2THDr4fM9rLuVyBh772LS5ziwOf1XOuzMI8qCz4Ns5
 KnSkUs/9hM0c4C7D9XNgeIxvSWC2GwmwX85w9KHchQdQK3OC9OCDYALVo
 xjZdU0mNhVgYnIXDUzEvMmoISTmKvrai1hv2mwMwciIr1y1SkDh8a2w7q
 5SJV3ucvg/nbGnKFTKPS6dWAm+V3TzBTBI4jAlBqSx/AjRpeyx289tvxJ
 1hGF8nRdk6Sq96OdtX0bbY18Lo6xn8PZnzU7Np3yugol+pbGgPwFbdNqE w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="289235617"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="289235617"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 14:30:59 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="879640488"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="879640488"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 14:30:59 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: rename intel_gsc to intel_heci_gsc
Date: Wed,  2 Nov 2022 14:33:50 -0700
Message-Id: <20221102213350.2818622-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Tomas Winkler <tomas.winkler@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Starting on MTL, the GSC FW is loaded at runtime and will be managed
directly by i915. This means we now have a naming clash around the GSC,
as we have 2 different aspects of it that we need to handle: the HECI
interfaces we export pre-mtl and the new full FW loading and support we
have to introduce starting from MTL. To avoid confusion, rename the
existing intel_gsc structure to intel_heci_gsc, to make it clear it
contains the data related to the HECI interfaces.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tomas Winkler <tomas.winkler@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |  4 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |  4 +-
 drivers/gpu/drm/i915/gt/intel_gt.h            |  4 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |  4 +-
 .../i915/gt/{intel_gsc.c => intel_heci_gsc.c} | 43 ++++++++++---------
 .../i915/gt/{intel_gsc.h => intel_heci_gsc.h} | 22 +++++-----
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        | 10 ++---
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     |  2 +-
 9 files changed, 48 insertions(+), 47 deletions(-)
 rename drivers/gpu/drm/i915/gt/{intel_gsc.c => intel_heci_gsc.c} (84%)
 rename drivers/gpu/drm/i915/gt/{intel_gsc.h => intel_heci_gsc.h} (52%)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 51704b54317c..2fa401dcf087 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -206,8 +206,8 @@ i915-y += gt/uc/intel_uc.o \
 	  gt/uc/intel_huc_debugfs.o \
 	  gt/uc/intel_huc_fw.o
 
-# graphics system controller (GSC) support
-i915-y += gt/intel_gsc.o
+# graphics system controller (GSC) HECI support
+i915-y += gt/intel_heci_gsc.o
 
 # graphics hardware monitoring (HWMON) support
 i915-$(CONFIG_HWMON) += i915_hwmon.o
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 8e914c4066ed..6ca72479c943 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -454,7 +454,7 @@ void intel_gt_chipset_flush(struct intel_gt *gt)
 
 void intel_gt_driver_register(struct intel_gt *gt)
 {
-	intel_gsc_init(&gt->gsc, gt->i915);
+	intel_heci_gsc_init(&gt->heci_gsc, gt->i915);
 
 	intel_rps_driver_register(&gt->rps);
 
@@ -785,7 +785,7 @@ void intel_gt_driver_unregister(struct intel_gt *gt)
 
 	intel_gt_sysfs_unregister(gt);
 	intel_rps_driver_unregister(&gt->rps);
-	intel_gsc_fini(&gt->gsc);
+	intel_heci_gsc_fini(&gt->heci_gsc);
 
 	intel_pxp_fini(&gt->pxp);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index e0365d556248..43f73239a363 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -39,9 +39,9 @@ static inline struct intel_gt *huc_to_gt(struct intel_huc *huc)
 	return container_of(huc, struct intel_gt, uc.huc);
 }
 
-static inline struct intel_gt *gsc_to_gt(struct intel_gsc *gsc)
+static inline struct intel_gt *heci_gsc_to_gt(struct intel_heci_gsc *heci_gsc)
 {
-	return container_of(gsc, struct intel_gt, gsc);
+	return container_of(heci_gsc, struct intel_gt, heci_gsc);
 }
 
 void intel_gt_common_init_early(struct intel_gt *gt);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index f26882fdc24c..3b4bd237659a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -75,7 +75,7 @@ gen11_other_irq_handler(struct intel_gt *gt, const u8 instance,
 		return intel_pxp_irq_handler(&gt->pxp, iir);
 
 	if (instance == OTHER_GSC_INSTANCE)
-		return intel_gsc_irq_handler(gt, iir);
+		return intel_heci_gsc_irq_handler(gt, iir);
 
 	WARN_ONCE(1, "unhandled other interrupt instance=0x%x, iir=0x%x\n",
 		  instance, iir);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index a0cc73b401ef..80a0163dcc01 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -17,7 +17,7 @@
 #include <linux/workqueue.h>
 
 #include "uc/intel_uc.h"
-#include "intel_gsc.h"
+#include "intel_heci_gsc.h"
 
 #include "i915_vma.h"
 #include "i915_perf_types.h"
@@ -100,7 +100,7 @@ struct intel_gt {
 	struct i915_ggtt *ggtt;
 
 	struct intel_uc uc;
-	struct intel_gsc gsc;
+	struct intel_heci_gsc heci_gsc;
 
 	struct {
 		/* Serialize global tlb invalidations */
diff --git a/drivers/gpu/drm/i915/gt/intel_gsc.c b/drivers/gpu/drm/i915/gt/intel_heci_gsc.c
similarity index 84%
rename from drivers/gpu/drm/i915/gt/intel_gsc.c
rename to drivers/gpu/drm/i915/gt/intel_heci_gsc.c
index 976fdf27e790..f57771470dba 100644
--- a/drivers/gpu/drm/i915/gt/intel_gsc.c
+++ b/drivers/gpu/drm/i915/gt/intel_heci_gsc.c
@@ -9,7 +9,7 @@
 #include "i915_reg.h"
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_region.h"
-#include "gt/intel_gsc.h"
+#include "gt/intel_heci_gsc.h"
 #include "gt/intel_gt.h"
 
 #define GSC_BAR_LENGTH  0x00000FFC
@@ -38,10 +38,11 @@ static int gsc_irq_init(int irq)
 	return irq_set_chip_data(irq, NULL);
 }
 
-static int
-gsc_ext_om_alloc(struct intel_gsc *gsc, struct intel_gsc_intf *intf, size_t size)
+static int gsc_ext_om_alloc(struct intel_heci_gsc *gsc,
+			    struct intel_heci_gsc_intf *intf,
+			    size_t size)
 {
-	struct intel_gt *gt = gsc_to_gt(gsc);
+	struct intel_gt *gt = heci_gsc_to_gt(gsc);
 	struct drm_i915_gem_object *obj;
 	int err;
 
@@ -68,7 +69,7 @@ gsc_ext_om_alloc(struct intel_gsc *gsc, struct intel_gsc_intf *intf, size_t size
 	return err;
 }
 
-static void gsc_ext_om_destroy(struct intel_gsc_intf *intf)
+static void gsc_ext_om_destroy(struct intel_heci_gsc_intf *intf)
 {
 	struct drm_i915_gem_object *obj = fetch_and_zero(&intf->gem_obj);
 
@@ -138,15 +139,15 @@ static void gsc_release_dev(struct device *dev)
 }
 
 static void gsc_destroy_one(struct drm_i915_private *i915,
-			    struct intel_gsc *gsc, unsigned int intf_id)
+			    struct intel_heci_gsc *gsc, unsigned int intf_id)
 {
-	struct intel_gsc_intf *intf = &gsc->intf[intf_id];
+	struct intel_heci_gsc_intf *intf = &gsc->intf[intf_id];
 
 	if (intf->adev) {
 		struct auxiliary_device *aux_dev = &intf->adev->aux_dev;
 
 		if (intf_id == 0)
-			intel_huc_unregister_gsc_notifier(&gsc_to_gt(gsc)->uc.huc,
+			intel_huc_unregister_gsc_notifier(&heci_gsc_to_gt(gsc)->uc.huc,
 							  aux_dev->dev.bus);
 
 		auxiliary_device_delete(aux_dev);
@@ -161,14 +162,14 @@ static void gsc_destroy_one(struct drm_i915_private *i915,
 	gsc_ext_om_destroy(intf);
 }
 
-static void gsc_init_one(struct drm_i915_private *i915, struct intel_gsc *gsc,
+static void gsc_init_one(struct drm_i915_private *i915, struct intel_heci_gsc *gsc,
 			 unsigned int intf_id)
 {
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	struct mei_aux_device *adev;
 	struct auxiliary_device *aux_dev;
 	const struct gsc_def *def;
-	struct intel_gsc_intf *intf = &gsc->intf[intf_id];
+	struct intel_heci_gsc_intf *intf = &gsc->intf[intf_id];
 	int ret;
 
 	intf->irq = -1;
@@ -252,14 +253,14 @@ static void gsc_init_one(struct drm_i915_private *i915, struct intel_gsc *gsc,
 	intf->adev = adev; /* needed by the notifier */
 
 	if (intf_id == 0)
-		intel_huc_register_gsc_notifier(&gsc_to_gt(gsc)->uc.huc,
+		intel_huc_register_gsc_notifier(&heci_gsc_to_gt(gsc)->uc.huc,
 						aux_dev->dev.bus);
 
 	ret = auxiliary_device_add(aux_dev);
 	if (ret < 0) {
 		drm_err(&i915->drm, "gsc aux add failed %d\n", ret);
 		if (intf_id == 0)
-			intel_huc_unregister_gsc_notifier(&gsc_to_gt(gsc)->uc.huc,
+			intel_huc_unregister_gsc_notifier(&heci_gsc_to_gt(gsc)->uc.huc,
 							  aux_dev->dev.bus);
 		intf->adev = NULL;
 
@@ -277,7 +278,7 @@ static void gsc_irq_handler(struct intel_gt *gt, unsigned int intf_id)
 {
 	int ret;
 
-	if (intf_id >= INTEL_GSC_NUM_INTERFACES) {
+	if (intf_id >= INTEL_HECI_GSC_NUM_INTERFACES) {
 		drm_warn_once(&gt->i915->drm, "GSC irq: intf_id %d is out of range", intf_id);
 		return;
 	}
@@ -287,15 +288,15 @@ static void gsc_irq_handler(struct intel_gt *gt, unsigned int intf_id)
 		return;
 	}
 
-	if (gt->gsc.intf[intf_id].irq < 0)
+	if (gt->heci_gsc.intf[intf_id].irq < 0)
 		return;
 
-	ret = generic_handle_irq(gt->gsc.intf[intf_id].irq);
+	ret = generic_handle_irq(gt->heci_gsc.intf[intf_id].irq);
 	if (ret)
 		drm_err_ratelimited(&gt->i915->drm, "error handling GSC irq: %d\n", ret);
 }
 
-void intel_gsc_irq_handler(struct intel_gt *gt, u32 iir)
+void intel_heci_gsc_irq_handler(struct intel_gt *gt, u32 iir)
 {
 	if (iir & GSC_IRQ_INTF(0))
 		gsc_irq_handler(gt, 0);
@@ -303,25 +304,25 @@ void intel_gsc_irq_handler(struct intel_gt *gt, u32 iir)
 		gsc_irq_handler(gt, 1);
 }
 
-void intel_gsc_init(struct intel_gsc *gsc, struct drm_i915_private *i915)
+void intel_heci_gsc_init(struct intel_heci_gsc *gsc, struct drm_i915_private *i915)
 {
 	unsigned int i;
 
 	if (!HAS_HECI_GSC(i915))
 		return;
 
-	for (i = 0; i < INTEL_GSC_NUM_INTERFACES; i++)
+	for (i = 0; i < INTEL_HECI_GSC_NUM_INTERFACES; i++)
 		gsc_init_one(i915, gsc, i);
 }
 
-void intel_gsc_fini(struct intel_gsc *gsc)
+void intel_heci_gsc_fini(struct intel_heci_gsc *gsc)
 {
-	struct intel_gt *gt = gsc_to_gt(gsc);
+	struct intel_gt *gt = heci_gsc_to_gt(gsc);
 	unsigned int i;
 
 	if (!HAS_HECI_GSC(gt->i915))
 		return;
 
-	for (i = 0; i < INTEL_GSC_NUM_INTERFACES; i++)
+	for (i = 0; i < INTEL_HECI_GSC_NUM_INTERFACES; i++)
 		gsc_destroy_one(gt->i915, gsc, i);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gsc.h b/drivers/gpu/drm/i915/gt/intel_heci_gsc.h
similarity index 52%
rename from drivers/gpu/drm/i915/gt/intel_gsc.h
rename to drivers/gpu/drm/i915/gt/intel_heci_gsc.h
index fcac1775e9c3..a20632a4316b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gsc.h
+++ b/drivers/gpu/drm/i915/gt/intel_heci_gsc.h
@@ -2,8 +2,8 @@
 /*
  * Copyright(c) 2019-2022, Intel Corporation. All rights reserved.
  */
-#ifndef __INTEL_GSC_DEV_H__
-#define __INTEL_GSC_DEV_H__
+#ifndef __INTEL_HECI_GSC_DEV_H__
+#define __INTEL_HECI_GSC_DEV_H__
 
 #include <linux/types.h>
 
@@ -11,7 +11,7 @@ struct drm_i915_private;
 struct intel_gt;
 struct mei_aux_device;
 
-#define INTEL_GSC_NUM_INTERFACES 2
+#define INTEL_HECI_GSC_NUM_INTERFACES 2
 /*
  * The HECI1 bit corresponds to bit15 and HECI2 to bit14.
  * The reason for this is to allow growth for more interfaces in the future.
@@ -19,22 +19,22 @@ struct mei_aux_device;
 #define GSC_IRQ_INTF(_x)  BIT(15 - (_x))
 
 /**
- * struct intel_gsc - graphics security controller
+ * struct intel_heci_gsc - graphics security controller HECI interfaces
  *
  * @gem_obj: scratch memory GSC operations
  * @intf : gsc interface
  */
-struct intel_gsc {
-	struct intel_gsc_intf {
+struct intel_heci_gsc {
+	struct intel_heci_gsc_intf {
 		struct mei_aux_device *adev;
 		struct drm_i915_gem_object *gem_obj;
 		int irq;
 		unsigned int id;
-	} intf[INTEL_GSC_NUM_INTERFACES];
+	} intf[INTEL_HECI_GSC_NUM_INTERFACES];
 };
 
-void intel_gsc_init(struct intel_gsc *gsc, struct drm_i915_private *dev_priv);
-void intel_gsc_fini(struct intel_gsc *gsc);
-void intel_gsc_irq_handler(struct intel_gt *gt, u32 iir);
+void intel_heci_gsc_init(struct intel_heci_gsc *gsc, struct drm_i915_private *dev_priv);
+void intel_heci_gsc_fini(struct intel_heci_gsc *gsc);
+void intel_heci_gsc_irq_handler(struct intel_gt *gt, u32 iir);
 
-#endif /* __INTEL_GSC_DEV_H__ */
+#endif /* __INTEL_HECI_GSC_DEV_H__ */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index fbc8bae14f76..0fd7baf5b0cf 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -47,10 +47,10 @@
 
 /*
  * MEI-GSC load is an async process. The probing of the exposed aux device
- * (see intel_gsc.c) usually happens a few seconds after i915 probe, depending
- * on when the kernel schedules it. Unless something goes terribly wrong, we're
- * guaranteed for this to happen during boot, so the big timeout is a safety net
- * that we never expect to need.
+ * (see intel_heci_gsc.c) usually happens a few seconds after i915 probe,
+ * depending on when the kernel schedules it. Unless something goes terribly
+ * wrong, we're guaranteed for this to happen during boot, so the big timeout is
+ * a safety net that we never expect to need.
  * MEI-PXP + HuC load usually takes ~300ms, but if the GSC needs to be resumed
  * and/or reset, this can take longer. Note that the kernel might schedule
  * other work between the i915 init/resume and the MEI one, which can add to
@@ -162,7 +162,7 @@ static int gsc_notifier(struct notifier_block *nb, unsigned long action, void *d
 {
 	struct device *dev = data;
 	struct intel_huc *huc = container_of(nb, struct intel_huc, delayed_load.nb);
-	struct intel_gsc_intf *intf = &huc_to_gt(huc)->gsc.intf[0];
+	struct intel_heci_gsc_intf *intf = &huc_to_gt(huc)->heci_gsc.intf[0];
 
 	if (!intf->adev || &intf->adev->aux_dev.dev != dev)
 		return 0;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
index 4f246416db17..cced240ef8a4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
@@ -3,7 +3,7 @@
  * Copyright © 2014-2019 Intel Corporation
  */
 
-#include "gt/intel_gsc.h"
+#include "gt/intel_heci_gsc.h"
 #include "gt/intel_gt.h"
 #include "intel_huc.h"
 #include "intel_huc_fw.h"
-- 
2.37.3

