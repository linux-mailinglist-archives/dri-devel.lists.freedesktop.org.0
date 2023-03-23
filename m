Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D316C68ED
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 13:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774B110E70B;
	Thu, 23 Mar 2023 12:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A7410E529
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 12:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679576120; x=1711112120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KUz7H+rU4R8x/Ewgxegc9RcoKvsyu8g0bivPo9oUcBc=;
 b=UaItl3GZANYErI7seZ+k7tCjNDLvumtKDUNixH3iApp/T7GkrMTgUDpN
 wSiWZ5hXigBPEUfxyZogujWgJuJ1j1yspLElpq3EoqTyiiY4n3ChL+tOh
 RPDEeK1I2RxD9gI1tPGtrPflefEh/0Mo6QfgxEsbLbc+m2xl3f6NAb+cu
 nEY67taq53SZmPlrZxu4nrHNm28/QoV/O0Obog6eVQX2+AhZv8AVDiLCc
 YNrkp3wq2eADdUcihWf1y5DgOQgx+ZpFgJ3WQyPLZVjP76pRa+9jq5j0U
 ZF91ElsZw++LAQxwBlMbVhkjtdkwwxbbDtUe7unuYKd9SVRS+4Q+58ezc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="404362713"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="404362713"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:55:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="682294657"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="682294657"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:55:18 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/8] accel/ivpu: Cancel recovery work
Date: Thu, 23 Mar 2023 13:54:58 +0100
Message-Id: <20230323125504.2586442-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323125504.2586442-1-stanislaw.gruszka@linux.intel.com>
References: <20230323125504.2586442-1-stanislaw.gruszka@linux.intel.com>
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

Fixes: 852be13f3bd3 ("accel/ivpu: Add PM support")
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c |  2 ++
 drivers/accel/ivpu/ivpu_pm.c  | 17 ++++++++++++++---
 drivers/accel/ivpu/ivpu_pm.h  |  1 +
 3 files changed, 17 insertions(+), 3 deletions(-)

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
index a880f1dd857e..da0bbc46a024 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -98,12 +98,18 @@ static int ivpu_resume(struct ivpu_device *vdev)
 static void ivpu_pm_recovery_work(struct work_struct *work)
 {
 	struct ivpu_pm_info *pm = container_of(work, struct ivpu_pm_info, recovery_work);
-	struct ivpu_device *vdev =  pm->vdev;
+	struct ivpu_device *vdev = pm->vdev;
 	char *evt[2] = {"IVPU_PM_EVENT=IVPU_RECOVER", NULL};
 	int ret;
 
-	ret = pci_reset_function(to_pci_dev(vdev->drm.dev));
-	if (ret)
+retry:
+	ret = pci_try_reset_function(to_pci_dev(vdev->drm.dev));
+	if (ret == -EAGAIN && !drm_dev_is_unplugged(&vdev->drm)) {
+		cond_resched();
+		goto retry;
+	}
+
+	if (ret && ret != -EAGAIN)
 		ivpu_err(vdev, "Failed to reset VPU: %d\n", ret);
 
 	kobject_uevent_env(&vdev->drm.dev->kobj, KOBJ_CHANGE, evt);
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

