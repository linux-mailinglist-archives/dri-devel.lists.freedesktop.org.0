Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FDE8AC48B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 08:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7EF112826;
	Mon, 22 Apr 2024 06:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHbQktwt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71FD112834;
 Mon, 22 Apr 2024 06:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713768928; x=1745304928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YzWiN2qaZ5OOeOp9ajc0LMSxGaArZykX00tv3fGZY2I=;
 b=EHbQktwtl3G4KpQtheDnFmSmoJcnc+bQrpQtJy8Elflb3CAFOkYIp28t
 qC/4x0C45Ed3SzYGzp8eeJaDjhbsm5YMdxTp0bjjgVL30JkNzK6N4/jjG
 uit6wI+cWiB0WV2EsGrAp68hBuqqR7TrIjid0me3SveD65gz1QKCP8cCs
 FhFebIjhwQU1ly7rXePmDzOz2Xql51j9Ykqo5viz8KOmZvDoFUHfFHKlS
 IdDjZDgoQbNPo9HaO/w8KgNc8R9KtDi558S6UiER/7YVmQLVA6mjXwSCD
 meEtbgyw4AEygFVDOme5DJKBtYtPDOLsU0mU3TAt02X/Psw55ZWR9XrCK g==;
X-CSE-ConnectionGUID: xVV+cwsgStuBP3eoLAtW+A==
X-CSE-MsgGUID: uJpodlBAQM6OmLskAedpTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="20715514"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="20715514"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2024 23:55:27 -0700
X-CSE-ConnectionGUID: 49TwrkkaTLm9tzycx63yDA==
X-CSE-MsgGUID: 6CDf3S2nTMSeRpmX8+Hs+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="28584510"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2024 23:55:24 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, mripard@kernel.org,
 tzimmermann@suse.de, rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/4] drm/xe: Save and restore PCI state
Date: Mon, 22 Apr 2024 12:27:54 +0530
Message-Id: <20240422065756.294679-3-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
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
index fb20c9828563..a62300990e19 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -393,6 +393,41 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
 
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
@@ -698,6 +733,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
 
 	xe_device_remove(xe);
 	xe_pm_runtime_fini(xe);
+
+	kfree(xe->pci_state);
 	pci_set_drvdata(pdev, NULL);
 }
 
@@ -798,6 +835,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
 		str_yes_no(xe->d3cold.capable));
 
+	if (xe_save_pci_state(pdev))
+		pci_restore_state(pdev);
+
 	return 0;
 
 err_driver_cleanup:
@@ -849,7 +889,7 @@ static int xe_pci_suspend(struct device *dev)
 	 */
 	d3cold_toggle(pdev, D3COLD_ENABLE);
 
-	pci_save_state(pdev);
+	xe_save_pci_state(pdev);
 	pci_disable_device(pdev);
 
 	return 0;
@@ -873,6 +913,8 @@ static int xe_pci_resume(struct device *dev)
 
 	pci_set_master(pdev);
 
+	xe_load_pci_state(pdev);
+
 	err = xe_pm_resume(pdev_to_xe_device(pdev));
 	if (err)
 		return err;
@@ -890,7 +932,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	if (err)
 		return err;
 
-	pci_save_state(pdev);
+	xe_save_pci_state(pdev);
 
 	if (xe->d3cold.allowed) {
 		d3cold_toggle(pdev, D3COLD_ENABLE);
@@ -915,7 +957,7 @@ static int xe_pci_runtime_resume(struct device *dev)
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

