Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 619038950C3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 12:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C9F10FC49;
	Tue,  2 Apr 2024 10:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mcjzIbw1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E7110FC49
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 10:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712055009; x=1743591009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1v24rfsaUcTQewvJFH8ogT+nveEKJAOpCNjjU3Aj2To=;
 b=mcjzIbw1dhpHW+2461EtYWdJCTCIpBZnEwjS9QL0ZIeNWgqdwG2Ffj3Z
 mGfeeEx+iTmTHSHthO+16J7bzvs4HG3zPWXotjZxltcWKF4k/nIkpfigI
 4tMbGAUc5mT0nfTLUTb2yXOF/ibPJ2WOinSiaQ7VcBYGVSw15hLPlajre
 BOkiIBqdDFoy7l837npYafuVGVCRVZ2IHP2tgkHiSQH1mysqgm5Z8SrI5
 ZTHBq0YL3M7k55hLN+XUL8v46NOC9Pr4xFYKAS8aJP2zgJ573+0SCEajL
 6qdl6NXtHhUoYfvQxW+Pf39e+zlXW6+j9JWNMk955Ket0VevDFEfOVCuY g==;
X-CSE-ConnectionGUID: dEAserOrQIS/x3Es68AK8w==
X-CSE-MsgGUID: U6lSBA70SCOky60j9Mqm4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17944415"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="17944415"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 03:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="18002494"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 03:50:08 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 2/8] accel/ivpu: Remove d3hot_after_power_off WA
Date: Tue,  2 Apr 2024 12:49:23 +0200
Message-ID: <20240402104929.941186-3-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
References: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Always enter D3hot after entering D0i3 an all platforms.
This minimizes power usage.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c     | 20 ++++++++++----------
 drivers/accel/ivpu/ivpu_drv.h     |  3 +--
 drivers/accel/ivpu/ivpu_hw_37xx.c |  4 +---
 drivers/accel/ivpu/ivpu_pm.c      |  7 ++-----
 4 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 39f6d1b98fd6..303d92753387 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #include <linux/firmware.h>
@@ -387,12 +387,15 @@ int ivpu_shutdown(struct ivpu_device *vdev)
 {
 	int ret;
 
-	ivpu_prepare_for_reset(vdev);
+	/* Save PCI state before powering down as it sometimes gets corrupted if NPU hangs */
+	pci_save_state(to_pci_dev(vdev->drm.dev));
 
 	ret = ivpu_hw_power_down(vdev);
 	if (ret)
 		ivpu_warn(vdev, "Failed to power down HW: %d\n", ret);
 
+	pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D3hot);
+
 	return ret;
 }
 
@@ -560,11 +563,11 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	/* Power up early so the rest of init code can access VPU registers */
 	ret = ivpu_hw_power_up(vdev);
 	if (ret)
-		goto err_power_down;
+		goto err_shutdown;
 
 	ret = ivpu_mmu_global_context_init(vdev);
 	if (ret)
-		goto err_power_down;
+		goto err_shutdown;
 
 	ret = ivpu_mmu_init(vdev);
 	if (ret)
@@ -601,10 +604,8 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	ivpu_mmu_reserved_context_fini(vdev);
 err_mmu_gctx_fini:
 	ivpu_mmu_global_context_fini(vdev);
-err_power_down:
-	ivpu_hw_power_down(vdev);
-	if (IVPU_WA(d3hot_after_power_off))
-		pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D3hot);
+err_shutdown:
+	ivpu_shutdown(vdev);
 err_xa_destroy:
 	xa_destroy(&vdev->db_xa);
 	xa_destroy(&vdev->submitted_jobs_xa);
@@ -628,9 +629,8 @@ static void ivpu_bo_unbind_all_user_contexts(struct ivpu_device *vdev)
 static void ivpu_dev_fini(struct ivpu_device *vdev)
 {
 	ivpu_pm_disable(vdev);
+	ivpu_prepare_for_reset(vdev);
 	ivpu_shutdown(vdev);
-	if (IVPU_WA(d3hot_after_power_off))
-		pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D3hot);
 
 	ivpu_jobs_abort_all(vdev);
 	ivpu_job_done_consumer_fini(vdev);
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 7be0500d9bb8..bb4374d0eaec 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #ifndef __IVPU_DRV_H__
@@ -90,7 +90,6 @@
 struct ivpu_wa_table {
 	bool punit_disabled;
 	bool clear_runtime_mem;
-	bool d3hot_after_power_off;
 	bool interrupt_clear_with_0;
 	bool disable_clock_relinquish;
 	bool disable_d0i3_msg;
diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index 9a0c9498baba..5e2865f9f7d6 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #include "ivpu_drv.h"
@@ -75,7 +75,6 @@ static void ivpu_hw_wa_init(struct ivpu_device *vdev)
 {
 	vdev->wa.punit_disabled = false;
 	vdev->wa.clear_runtime_mem = false;
-	vdev->wa.d3hot_after_power_off = true;
 
 	REGB_WR32(VPU_37XX_BUTTRESS_INTERRUPT_STAT, BUTTRESS_ALL_IRQ_MASK);
 	if (REGB_RD32(VPU_37XX_BUTTRESS_INTERRUPT_STAT) == BUTTRESS_ALL_IRQ_MASK) {
@@ -86,7 +85,6 @@ static void ivpu_hw_wa_init(struct ivpu_device *vdev)
 
 	IVPU_PRINT_WA(punit_disabled);
 	IVPU_PRINT_WA(clear_runtime_mem);
-	IVPU_PRINT_WA(d3hot_after_power_off);
 	IVPU_PRINT_WA(interrupt_clear_with_0);
 }
 
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 7cce1c928a7f..9cbd7af6576b 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #include <linux/highmem.h>
@@ -58,15 +58,12 @@ static int ivpu_suspend(struct ivpu_device *vdev)
 {
 	int ret;
 
-	/* Save PCI state before powering down as it sometimes gets corrupted if NPU hangs */
-	pci_save_state(to_pci_dev(vdev->drm.dev));
+	ivpu_prepare_for_reset(vdev);
 
 	ret = ivpu_shutdown(vdev);
 	if (ret)
 		ivpu_err(vdev, "Failed to shutdown VPU: %d\n", ret);
 
-	pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D3hot);
-
 	return ret;
 }
 
-- 
2.43.2

