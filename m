Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2E682DA6B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 14:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA28110E2E9;
	Mon, 15 Jan 2024 13:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9323B10E2D7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 13:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705326284; x=1736862284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a50DWiFuwQXW/rYPp5vYvJFxZ7/3CkGS9pXshvmuBnI=;
 b=Nvqb5+YisVafkVcGicYx0+zJYET4Isw0c7PXOsKIsJHLl1b2y9Woskk0
 t+VfvhfXAKZinTCoQPG46bpI3ERlpPdVAKWsO8SLSzRmEsTEV9xHMzaGN
 vPgPcS6gg0/Zb0jUifaLhWpbHYuASTICxdVE0Eu+ssgPC49yOeLzC9GR2
 POSo1zNLrIE3lWQiM6cb+1qcsyLnKXhax00OFbKizKCq0zL8hNM9nivRU
 9HXNaF2G7GJE8865DPoabrqtf/cpdELXQHD9A18tR4BvFRfDUC5WVGXcT
 24FOxAeBvHXStuPduKNXwtqVLg4cYYyk22hZqaJxnttAmBFWThyxt0sYW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="403378749"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="403378749"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 05:44:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="25472219"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 05:44:43 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/9] accel/ivpu: Add diagnostic messages when VPU fails to
 boot or suspend
Date: Mon, 15 Jan 2024 14:44:29 +0100
Message-ID: <20240115134434.493839-5-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115134434.493839-1-jacek.lawrynowicz@linux.intel.com>
References: <20240115134434.493839-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, "Wachowski,
 Karol" <karol.wachowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Wachowski, Karol" <karol.wachowski@intel.com>

Make boot/suspend failure debugging easier by dumping FW logs and error
registers.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 5 +++--
 drivers/accel/ivpu/ivpu_pm.c  | 4 +++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 0c3180411b0e..ec66c2c39877 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -17,6 +17,7 @@
 #include "ivpu_debugfs.h"
 #include "ivpu_drv.h"
 #include "ivpu_fw.h"
+#include "ivpu_fw_log.h"
 #include "ivpu_gem.h"
 #include "ivpu_hw.h"
 #include "ivpu_ipc.h"
@@ -340,8 +341,6 @@ static int ivpu_wait_for_ready(struct ivpu_device *vdev)
 
 	if (!ret)
 		ivpu_dbg(vdev, PM, "VPU ready message received successfully\n");
-	else
-		ivpu_hw_diagnose_failure(vdev);
 
 	return ret;
 }
@@ -369,7 +368,9 @@ int ivpu_boot(struct ivpu_device *vdev)
 	ret = ivpu_wait_for_ready(vdev);
 	if (ret) {
 		ivpu_err(vdev, "Failed to boot the firmware: %d\n", ret);
+		ivpu_hw_diagnose_failure(vdev);
 		ivpu_mmu_evtq_dump(vdev);
+		ivpu_fw_log_dump(vdev);
 		return ret;
 	}
 
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 0af8864cb3b5..8407f1d8c99c 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -13,6 +13,7 @@
 #include "ivpu_drv.h"
 #include "ivpu_hw.h"
 #include "ivpu_fw.h"
+#include "ivpu_fw_log.h"
 #include "ivpu_ipc.h"
 #include "ivpu_job.h"
 #include "ivpu_jsm_msg.h"
@@ -247,7 +248,8 @@ int ivpu_pm_runtime_suspend_cb(struct device *dev)
 		ivpu_err(vdev, "Failed to set suspend VPU: %d\n", ret);
 
 	if (!hw_is_idle) {
-		ivpu_warn(vdev, "VPU failed to enter idle, force suspended.\n");
+		ivpu_err(vdev, "VPU failed to enter idle, force suspended.\n");
+		ivpu_fw_log_dump(vdev);
 		ivpu_pm_prepare_cold_boot(vdev);
 	} else {
 		ivpu_pm_prepare_warm_boot(vdev);
-- 
2.43.0

