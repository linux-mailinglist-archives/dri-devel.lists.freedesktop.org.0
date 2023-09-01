Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5589C78FB74
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 11:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F2E10E75F;
	Fri,  1 Sep 2023 09:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D3310E75F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 09:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693561825; x=1725097825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3Q5b9QoLu3shzumgHlLdyjS3o1zkEGV/vR2u3bTXO/o=;
 b=gjWr4CXSr8bZL8Kp5nzpw2e2wPXZ8KPZgPomoU/VTxSxGljkdzGh8kmz
 FwTdkNr0zPVZE2GxT0NGlYRQKUKxHdbaDBITOepn7124c63/A9IhFP7Lx
 E0FAusI8ElvhrsI256FUiNieBYsPAr68J1M3MGa2P+9NiPZwTZ1pF9Qmq
 Z4w+peDOyjTYlDHxV4MkzuOp/j48krQ3amIILAOqCBuJcw3Q/Oc6TWmZ0
 c9qxFYxO4V6E/QDIoNLuDIPJyAemnvxw2nk3ylar4tRD/TZJBqwtYZqYf
 y46W4N+cbxJkKUathLQAJRiDV165yUxneEL+WcDiBB60TDBTShmBTdCwV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361206917"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="361206917"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 02:50:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070679949"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="1070679949"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 02:50:22 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 07/11] accel/ivpu: Move ivpu_fw_load() to ivpu_fw_init()
Date: Fri,  1 Sep 2023 11:49:53 +0200
Message-Id: <20230901094957.168898-8-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230901094957.168898-1-stanislaw.gruszka@linux.intel.com>
References: <20230901094957.168898-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

ivpu_fw_load() doesn't have to be called separately in ivpu_dev_init().

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 4 ----
 drivers/accel/ivpu/ivpu_fw.c  | 6 +++---
 drivers/accel/ivpu/ivpu_fw.h  | 2 +-
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 5310b54f036d..fa0680ba9340 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -561,10 +561,6 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	if (ret)
 		goto err_ipc_fini;
 
-	ret = ivpu_fw_load(vdev);
-	if (ret)
-		goto err_job_done_thread_fini;
-
 	ret = ivpu_boot(vdev);
 	if (ret)
 		goto err_job_done_thread_fini;
diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 9b6ecd3e9537..32a1ea322ca2 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -301,6 +301,8 @@ int ivpu_fw_init(struct ivpu_device *vdev)
 	if (ret)
 		goto err_fw_release;
 
+	ivpu_fw_load(vdev);
+
 	return 0;
 
 err_fw_release:
@@ -314,7 +316,7 @@ void ivpu_fw_fini(struct ivpu_device *vdev)
 	ivpu_fw_release(vdev);
 }
 
-int ivpu_fw_load(struct ivpu_device *vdev)
+void ivpu_fw_load(struct ivpu_device *vdev)
 {
 	struct ivpu_fw_info *fw = vdev->fw;
 	u64 image_end_offset = fw->image_load_offset + fw->image_size;
@@ -331,8 +333,6 @@ int ivpu_fw_load(struct ivpu_device *vdev)
 	}
 
 	wmb(); /* Flush WC buffers after writing fw->mem */
-
-	return 0;
 }
 
 static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_params *boot_params)
diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
index 8567fdf925fe..10ae2847f0ef 100644
--- a/drivers/accel/ivpu/ivpu_fw.h
+++ b/drivers/accel/ivpu/ivpu_fw.h
@@ -31,7 +31,7 @@ struct ivpu_fw_info {
 
 int ivpu_fw_init(struct ivpu_device *vdev);
 void ivpu_fw_fini(struct ivpu_device *vdev);
-int ivpu_fw_load(struct ivpu_device *vdev);
+void ivpu_fw_load(struct ivpu_device *vdev);
 void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params *bp);
 
 static inline bool ivpu_fw_is_cold_boot(struct ivpu_device *vdev)
-- 
2.25.1

