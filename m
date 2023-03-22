Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5A16C4612
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 10:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324C710E8D4;
	Wed, 22 Mar 2023 09:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7639010E8D3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679476761; x=1711012761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6RtNGxZ964muzHX34OznnR8wKoX9MmblRrrj6Vq2vRE=;
 b=MFT3ZCuddErLG3Y6jiqdzwSHQIGzbYj/h+1tQpmohVoG0o8gCLmgSD3K
 YwI8op7s4aQ/AfeYYN1xBf9X/FsCEgUab530+snzVQLwh8ThP4HV5J+Ia
 nrsO65qhNMoaXbatMWBW2P9KWPeOXm+isJ/eE8+JaUArfW4BdYPUvmjBe
 DYpAUePKgDzAjMXkKlwrst7FzxM2Ct7V2/v217d1qjSUyr0SDFzIKfysg
 pLDfkXKn8Z3QAL0Ul+/x9W+fzku9NmVUsPMRp8PcGp350NqQAowPIdqOL
 bafJjL++NScckooi5c/95/C14rObnnjnr/7GTme7McWyiIun0XZZ4ug4+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366904298"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="366904298"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="746229785"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="746229785"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:19:19 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] accel/ivpu: Cancel recovery work
Date: Wed, 22 Mar 2023 10:18:55 +0100
Message-Id: <20230322091900.1982453-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
References: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
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

Prevent running recovery_work after device is removed.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c |  2 ++
 drivers/accel/ivpu/ivpu_pm.c  | 15 +++++++++++++--
 drivers/accel/ivpu/ivpu_pm.h  |  1 +
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index ac06bbfca920..d9e311b40348 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -580,6 +580,8 @@ static void ivpu_dev_fini(struct ivpu_device *vdev)
 	ivpu_pm_disable(vdev);
 	ivpu_shutdown(vdev);
 	ivpu_job_done_thread_fini(vdev);
+	ivpu_pm_cancel_recovery(vdev);
+
 	ivpu_ipc_fini(vdev);
 	ivpu_fw_fini(vdev);
 	ivpu_mmu_global_context_fini(vdev);
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index a880f1dd857e..df2e98cc0a56 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -98,11 +98,17 @@ static int ivpu_resume(struct ivpu_device *vdev)
 static void ivpu_pm_recovery_work(struct work_struct *work)
 {
 	struct ivpu_pm_info *pm = container_of(work, struct ivpu_pm_info, recovery_work);
-	struct ivpu_device *vdev =  pm->vdev;
+	struct ivpu_device *vdev = pm->vdev;
 	char *evt[2] = {"IVPU_PM_EVENT=IVPU_RECOVER", NULL};
 	int ret;
 
-	ret = pci_reset_function(to_pci_dev(vdev->drm.dev));
+retry:
+	ret = pci_try_reset_function(to_pci_dev(vdev->drm.dev));
+	if (ret == -EAGAIN && !drm_dev_is_unplugged(&vdev->drm)) {
+		cond_resched();
+		goto retry;
+	}
+
 	if (ret)
 		ivpu_err(vdev, "Failed to reset VPU: %d\n", ret);
 
@@ -302,6 +308,11 @@ int ivpu_pm_init(struct ivpu_device *vdev)
 	return 0;
 }
 
+void ivpu_pm_cancel_recovery(struct ivpu_device *vdev)
+{
+	cancel_work_sync(&vdev->pm->recovery_work);
+}
+
 void ivpu_pm_enable(struct ivpu_device *vdev)
 {
 	struct device *dev = vdev->drm.dev;
diff --git a/drivers/accel/ivpu/ivpu_pm.h b/drivers/accel/ivpu/ivpu_pm.h
index dc1b3758e13f..baca98187255 100644
--- a/drivers/accel/ivpu/ivpu_pm.h
+++ b/drivers/accel/ivpu/ivpu_pm.h
@@ -21,6 +21,7 @@ struct ivpu_pm_info {
 int ivpu_pm_init(struct ivpu_device *vdev);
 void ivpu_pm_enable(struct ivpu_device *vdev);
 void ivpu_pm_disable(struct ivpu_device *vdev);
+void ivpu_pm_cancel_recovery(struct ivpu_device *vdev);
 
 int ivpu_pm_suspend_cb(struct device *dev);
 int ivpu_pm_resume_cb(struct device *dev);
-- 
2.25.1

