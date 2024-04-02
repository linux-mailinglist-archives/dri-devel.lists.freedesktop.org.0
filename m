Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD09894E0B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 10:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C4510FB88;
	Tue,  2 Apr 2024 08:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TWzDV+j6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D07D10FB85;
 Tue,  2 Apr 2024 08:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712048179; x=1743584179;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TbngyseStKWjV3NchFChycJLcCbW4YQ5eyax2z1Pvwc=;
 b=TWzDV+j6MPo6pgNfYLjqg+201XuKbeW/MXIkrbPyL2uUX1JmYO+jOZUw
 rfgU59BPSdg1ja5DmZ0S5hM7vPtUCsuOa3W1vsgRi4NnqO42GuxVGevic
 MEqM/R74IGimoY4fI14tfnQ1KhPU5D38SxdRDudRXfObXqfQtHQ9lOBcX
 XapmagxnuqceYTolC0sDlmO1SmJY2XqldV5HWkcvwx4spM4F7iJSKOZOp
 hLhBObgGSPtslR6p6fvEVdVZcRhu4J2VNizGnh9qmX9IrcpusvUWpXhOo
 XFkduloztS1LfC96h72ny8RvWpi/W/N23timBhSasgUvCy30YkTQMxzhV Q==;
X-CSE-ConnectionGUID: JmNPTbwvRQSrrGxTH5K95Q==
X-CSE-MsgGUID: skqgL1UoRXGT4NHL6srkVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="18654777"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="18654777"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 01:56:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="49225978"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 01:56:17 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/xe: Save and restore PCI state
Date: Tue,  2 Apr 2024 14:28:57 +0530
Message-Id: <20240402085859.1591264-3-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240402085859.1591264-1-aravind.iddamsetty@linux.intel.com>
References: <20240402085859.1591264-1-aravind.iddamsetty@linux.intel.com>
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
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 ++
 drivers/gpu/drm/xe/xe_pci.c          | 48 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pci.h          |  4 ++-
 3 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 1df3dcc17d75..3bfde4b59284 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -455,6 +455,9 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
+	/** @pci_state: PCI state of device */
+	struct pci_saved_state *pci_state;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c401d4890386..e9e10f8d5f2b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -383,6 +383,41 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
 
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
@@ -688,6 +723,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
 
 	xe_device_remove(xe);
 	xe_pm_runtime_fini(xe);
+
+	kfree(xe->pci_state);
 	pci_set_drvdata(pdev, NULL);
 }
 
@@ -786,6 +823,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
 		str_yes_no(xe->d3cold.capable));
 
+	if (xe_save_pci_state(pdev))
+		pci_restore_state(pdev);
+
 	return 0;
 }
 
@@ -833,7 +873,7 @@ static int xe_pci_suspend(struct device *dev)
 	 */
 	d3cold_toggle(pdev, D3COLD_ENABLE);
 
-	pci_save_state(pdev);
+	xe_save_pci_state(pdev);
 	pci_disable_device(pdev);
 
 	return 0;
@@ -857,6 +897,8 @@ static int xe_pci_resume(struct device *dev)
 
 	pci_set_master(pdev);
 
+	xe_load_pci_state(pdev);
+
 	err = xe_pm_resume(pdev_to_xe_device(pdev));
 	if (err)
 		return err;
@@ -874,7 +916,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	if (err)
 		return err;
 
-	pci_save_state(pdev);
+	xe_save_pci_state(pdev);
 
 	if (xe->d3cold.allowed) {
 		d3cold_toggle(pdev, D3COLD_ENABLE);
@@ -899,7 +941,7 @@ static int xe_pci_runtime_resume(struct device *dev)
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

