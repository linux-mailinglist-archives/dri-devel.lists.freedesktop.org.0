Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C15278A939
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 11:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD45710E26C;
	Mon, 28 Aug 2023 09:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD9E10E26A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 09:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693216073; x=1724752073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=faSro375OWJJpnMOvOTiaRu7pfSGaJ2DR/J7PM3GVkI=;
 b=G0H3aK6A8VTZV1RY9lgtILIBBiFV2tKgqzP0eAXHdQOMMGnq+dF1CDO6
 LL3zsYIEdJJ8WjAUysrXo7xVxS9GuQV0S3TGALJIfnec8UzgBfuDIv3DE
 NyH9S5FIOxjkTiVe5SY9dsbfpPEnJDZG7lIroL01oPiZxmVsKLEUxNAWi
 EDgERbS/pJJ9vkBJf0Q6aSQxXYuVWw5KthHBsxvxJZOYwqFIVSsj+L2df
 qGMii6OIo0+YwnXoUTCNSL6uU8LvuH+lixRO8sDRpRL6su/AVli63qot+
 AsBrpXa77jC+AfbwDEyoAzJcrq5enC72QxQeBA5h+BNoWIcaMYcCLCUCj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="439011838"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; d="scan'208";a="439011838"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 02:47:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="852778824"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; d="scan'208";a="852778824"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 02:47:51 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/9] accel/ivpu: Initialize context with SSID = 1
Date: Mon, 28 Aug 2023 11:47:31 +0200
Message-Id: <20230828094736.4137092-5-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230828094736.4137092-1-stanislaw.gruszka@linux.intel.com>
References: <20230828094736.4137092-1-stanislaw.gruszka@linux.intel.com>
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

