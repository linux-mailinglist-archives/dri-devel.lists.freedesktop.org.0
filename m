Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE5C7887AB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE1410E679;
	Fri, 25 Aug 2023 12:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9C510E676
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 12:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692967320; x=1724503320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=faSro375OWJJpnMOvOTiaRu7pfSGaJ2DR/J7PM3GVkI=;
 b=Aw6pQKFRsb9+hPwWw+FfaFwPD+ZdNjxWyt64K8j0K7RMewa6IGb4IGUo
 pwciotdsgwH7ul/vuGbdA31h8h/PpkCqy54xMV53t2zMg1TluaudMTUwz
 Ilf6IpHbTAY1C0O2f+/q9X39dTDg0pngv88jr2e2tAym4+FTR7GIxHaFT
 v3G7su3WZkUN/2i+YFwBAUTxMKdhFFqDb8g/4VqYvR16aPS+Pb7xhdazI
 KD/crveczQhQ8SA0k31jT4uaQAZeiYc/XhG5TMFHKtvuujC6OAxuYbLI/
 7uMxJ64NDgy1+7MuDZzvzrZowtC5M+Nhhc1PmKEHPfR7zBMnHhInxHJIc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373573901"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="373573901"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 05:41:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="911272280"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="911272280"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 05:41:53 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/9] accel/ivpu: Initialize context with SSID = 1
Date: Fri, 25 Aug 2023 14:41:30 +0200
Message-Id: <20230825124135.4086628-5-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230825124135.4086628-1-stanislaw.gruszka@linux.intel.com>
References: <20230825124135.4086628-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karol Wachowski <karol.wachowski@linux.intel.com>

Context with SSID = 1 is reserved and accesses on that context happen
only when context is uninitialized on the VPU side. Such access triggers
MMU fault (0xa) "Invalid CD Fetch", which doesn't contain any useful
information besides context ID.

This commit will change that state, now (0x10) "Translation fault" will
be triggered and accessed address will shown in the log.

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c         |  9 ++++++++-
 drivers/accel/ivpu/ivpu_drv.h         | 12 +++++++-----
 drivers/accel/ivpu/ivpu_mmu_context.c | 10 ++++++++++
 drivers/accel/ivpu/ivpu_mmu_context.h |  2 ++
 4 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index b10b2909f05f..5310b54f036d 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -543,10 +543,14 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	if (ret)
 		goto err_mmu_gctx_fini;
 
-	ret = ivpu_fw_init(vdev);
+	ret = ivpu_mmu_reserved_context_init(vdev);
 	if (ret)
 		goto err_mmu_gctx_fini;
 
+	ret = ivpu_fw_init(vdev);
+	if (ret)
+		goto err_mmu_rctx_fini;
+
 	ret = ivpu_ipc_init(vdev);
 	if (ret)
 		goto err_fw_fini;
@@ -575,6 +579,8 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	ivpu_ipc_fini(vdev);
 err_fw_fini:
 	ivpu_fw_fini(vdev);
+err_mmu_rctx_fini:
+	ivpu_mmu_reserved_context_fini(vdev);
 err_mmu_gctx_fini:
 	ivpu_mmu_global_context_fini(vdev);
 err_power_down:
@@ -598,6 +604,7 @@ static void ivpu_dev_fini(struct ivpu_device *vdev)
 
 	ivpu_ipc_fini(vdev);
 	ivpu_fw_fini(vdev);
+	ivpu_mmu_reserved_context_fini(vdev);
 	ivpu_mmu_global_context_fini(vdev);
 
 	drm_WARN_ON(&vdev->drm, !xa_empty(&vdev->submitted_jobs_xa));
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 060c09402227..12a63f8a73e8 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -28,12 +28,13 @@
 #define IVPU_HW_37XX	37
 #define IVPU_HW_40XX	40
 
-#define IVPU_GLOBAL_CONTEXT_MMU_SSID 0
-/* SSID 1 is used by the VPU to represent invalid context */
-#define IVPU_USER_CONTEXT_MIN_SSID   2
-#define IVPU_USER_CONTEXT_MAX_SSID   (IVPU_USER_CONTEXT_MIN_SSID + 63)
+#define IVPU_GLOBAL_CONTEXT_MMU_SSID   0
+/* SSID 1 is used by the VPU to represent reserved context */
+#define IVPU_RESERVED_CONTEXT_MMU_SSID 1
+#define IVPU_USER_CONTEXT_MIN_SSID     2
+#define IVPU_USER_CONTEXT_MAX_SSID     (IVPU_USER_CONTEXT_MIN_SSID + 63)
 
-#define IVPU_NUM_ENGINES	     2
+#define IVPU_NUM_ENGINES 2
 
 #define IVPU_PLATFORM_SILICON 0
 #define IVPU_PLATFORM_SIMICS  2
@@ -109,6 +110,7 @@ struct ivpu_device {
 	struct ivpu_pm_info *pm;
 
 	struct ivpu_mmu_context gctx;
+	struct ivpu_mmu_context rctx;
 	struct xarray context_xa;
 	struct xa_limit context_xa_limit;
 
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index 1144d6eb5120..e5336adc5e59 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -469,6 +469,16 @@ void ivpu_mmu_global_context_fini(struct ivpu_device *vdev)
 	return ivpu_mmu_context_fini(vdev, &vdev->gctx);
 }
 
+int ivpu_mmu_reserved_context_init(struct ivpu_device *vdev)
+{
+	return ivpu_mmu_user_context_init(vdev, &vdev->rctx, IVPU_RESERVED_CONTEXT_MMU_SSID);
+}
+
+void ivpu_mmu_reserved_context_fini(struct ivpu_device *vdev)
+{
+	return ivpu_mmu_user_context_fini(vdev, &vdev->rctx);
+}
+
 void ivpu_mmu_user_context_mark_invalid(struct ivpu_device *vdev, u32 ssid)
 {
 	struct ivpu_file_priv *file_priv;
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.h b/drivers/accel/ivpu/ivpu_mmu_context.h
index 961a0d6a6c7f..f15d8c630d8a 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.h
+++ b/drivers/accel/ivpu/ivpu_mmu_context.h
@@ -32,6 +32,8 @@ struct ivpu_mmu_context {
 
 int ivpu_mmu_global_context_init(struct ivpu_device *vdev);
 void ivpu_mmu_global_context_fini(struct ivpu_device *vdev);
+int ivpu_mmu_reserved_context_init(struct ivpu_device *vdev);
+void ivpu_mmu_reserved_context_fini(struct ivpu_device *vdev);
 
 int ivpu_mmu_user_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx, u32 ctx_id);
 void ivpu_mmu_user_context_fini(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx);
-- 
2.25.1

