Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06218AAAF8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 10:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F413810FE5F;
	Fri, 19 Apr 2024 08:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nxMoLtQ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99EB10FE5F;
 Fri, 19 Apr 2024 08:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713516953; x=1745052953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BgAFvYdClgCdHbN2f09QhyKkMBik53tx4VXsBPQf+fg=;
 b=nxMoLtQ5t8bna6XT0KQ1XztO1zGc2Ndu2wdm+4vSQVN2VsIwnHqM/IDv
 P5XWwzxxjNVhNsLQ1T2PeoHMbfLVckuvjfy5LXfgHOCrzfxv2FKpKWl+y
 100RNC+zA5IPvFVEf48WHkzC5d7UORh++BAm2r4EqbrER0tlZeDPtbHdE
 7ioLUEJ9cpH3wpl09Cp6CZITuizVmbbbF2X8BlHzYVghaI4xTLyDrpzC0
 X374qiPjALp0WSzbtI+s6uyO3TBpS3yYjsjlZmUopztQH6w0vVqONXXVr
 kY85d4R4ZkkFRW8baTMla67dhEXaz1vKif7P1pN105CntIKJPYSO2gbxG A==;
X-CSE-ConnectionGUID: r7AGS1DVSbu8ZQ10u9nTiA==
X-CSE-MsgGUID: YVIlCitFTlO3cy+kjN3gfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12051609"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="12051609"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 01:55:52 -0700
X-CSE-ConnectionGUID: EcgVVzS2TI6q8yRubX/6hA==
X-CSE-MsgGUID: nvQRPoNRS6Kqfg3MvP4Nag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="27890729"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 01:55:49 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, mripard@kernel.org,
 tzimmermann@suse.de, rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/4] drm/xe: Save and restore PCI state
Date: Fri, 19 Apr 2024 14:28:24 +0530
Message-Id: <20240419085826.263743-3-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419085826.263743-1-aravind.iddamsetty@linux.intel.com>
References: <20240419085826.263743-1-aravind.iddamsetty@linux.intel.com>
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

Save and restore PCI states where ever needed.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 ++
 drivers/gpu/drm/xe/xe_pci.c          | 48 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pci.h          |  4 ++-
 3 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8244b177a6a3..0a66555229e9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -462,6 +462,9 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
+	/** @pci_state: PCI state of device */
+	struct pci_saved_state *pci_state;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 65ea44672cab..fd45f235b35c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -391,6 +391,41 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
 
 #undef INTEL_VGA_DEVICE
 
+static bool xe_save_pci_state(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+
+	if (pci_save_state(pdev))
+		return false;
+
+	kfree(xe->pci_state);
+
+	xe->pci_state = pci_store_saved_state(pdev);
+	if (!xe->pci_state) {
+		drm_err(&xe->drm, "Failed to store PCI saved state\n");
+		return false;
+	}
+
+	return true;
+}
+
+void xe_load_pci_state(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+	int ret;
+
+	if (!xe->pci_state)
+		return;
+
+	ret = pci_load_saved_state(pdev, xe->pci_state);
+	if (ret) {
+		drm_warn(&xe->drm, "Failed to load PCI state err:%d\n", ret);
+		return;
+	}
+
+	pci_restore_state(pdev);
+}
+
 /* is device_id present in comma separated list of ids */
 static bool device_id_in_list(u16 device_id, const char *devices, bool negative)
 {
@@ -696,6 +731,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
 
 	xe_device_remove(xe);
 	xe_pm_runtime_fini(xe);
+
+	kfree(xe->pci_state);
 	pci_set_drvdata(pdev, NULL);
 }
 
@@ -796,6 +833,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
 		str_yes_no(xe->d3cold.capable));
 
+	if (xe_save_pci_state(pdev))
+		pci_restore_state(pdev);
+
 	return 0;
 
 err_driver_cleanup:
@@ -847,7 +887,7 @@ static int xe_pci_suspend(struct device *dev)
 	 */
 	d3cold_toggle(pdev, D3COLD_ENABLE);
 
-	pci_save_state(pdev);
+	xe_save_pci_state(pdev);
 	pci_disable_device(pdev);
 
 	return 0;
@@ -871,6 +911,8 @@ static int xe_pci_resume(struct device *dev)
 
 	pci_set_master(pdev);
 
+	xe_load_pci_state(pdev);
+
 	err = xe_pm_resume(pdev_to_xe_device(pdev));
 	if (err)
 		return err;
@@ -888,7 +930,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	if (err)
 		return err;
 
-	pci_save_state(pdev);
+	xe_save_pci_state(pdev);
 
 	if (xe->d3cold.allowed) {
 		d3cold_toggle(pdev, D3COLD_ENABLE);
@@ -913,7 +955,7 @@ static int xe_pci_runtime_resume(struct device *dev)
 	if (err)
 		return err;
 
-	pci_restore_state(pdev);
+	xe_load_pci_state(pdev);
 
 	if (xe->d3cold.allowed) {
 		err = pci_enable_device(pdev);
diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
index 611c1209b14c..73b90a430d1f 100644
--- a/drivers/gpu/drm/xe/xe_pci.h
+++ b/drivers/gpu/drm/xe/xe_pci.h
@@ -6,7 +6,9 @@
 #ifndef _XE_PCI_H_
 #define _XE_PCI_H_
 
+struct pci_dev;
+
 int xe_register_pci_driver(void);
 void xe_unregister_pci_driver(void);
-
+void xe_load_pci_state(struct pci_dev *pdev);
 #endif
-- 
2.25.1

