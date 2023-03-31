Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3516D1F33
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 13:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE60010E081;
	Fri, 31 Mar 2023 11:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C8010F1F2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 11:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680262582; x=1711798582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kQ+DnSqdyLa43DsnrXlioUJjbE78r+OIVsPHvrSYOKU=;
 b=bGKFzS7BmPCasP0syU4cT+7jxP/aL6xvz14IoF4/JLBtXT1RAwmGkUCw
 pAShE4HfpX16JSUqF2CWL/AkDHcbFlHHL0DjnRHwZbHBLMbsUYmwP4hBg
 nviIjh3wqqfF3cYswNp4Q6x5GOiS3lbnMcC0sGR9jH5Lr5QczTU2OwxRT
 RMKwu42YUYvd2VaZFkU3Xu9nN7Ripw1V6HZvppoL6V7rVsHx5+OqpZAWX
 PhDFM5u2aOriLi3EMFQTRWg+qRN7NHVEit43xL9lITn9R5kECvRGXsGmN
 3A2LhfjI8RNu3tg5jhx20LnZ/NIUdMo1TsbMek+ctRUV21JGbEh4Z19PF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="321083199"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="321083199"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 04:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="687624689"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="687624689"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 04:36:20 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] accel/ivpu: Fix S3 system suspend when not idle
Date: Fri, 31 Mar 2023 13:36:03 +0200
Message-Id: <20230331113603.2802515-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230331113603.2802515-1-stanislaw.gruszka@linux.intel.com>
References: <20230331113603.2802515-1-stanislaw.gruszka@linux.intel.com>
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

Wait for VPU to be idle in ivpu_pm_suspend_cb() before powering off
the device, so jobs are not lost and TDRs are not triggered after
resume.

Fixes: 852be13f3bd3 ("accel/ivpu: Add PM support")
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_pm.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index da0bbc46a024..aa4d56dc52b3 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -140,32 +140,28 @@ int ivpu_pm_suspend_cb(struct device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct ivpu_device *vdev = to_ivpu_device(drm);
-	int ret;
+	unsigned long timeout;
 
 	ivpu_dbg(vdev, PM, "Suspend..\n");
 
-	ret = ivpu_suspend(vdev);
-	if (ret && vdev->pm->suspend_reschedule_counter) {
-		ivpu_dbg(vdev, PM, "Failed to enter idle, rescheduling suspend, retries left %d\n",
-			 vdev->pm->suspend_reschedule_counter);
-		pm_schedule_suspend(dev, vdev->timeout.reschedule_suspend);
-		vdev->pm->suspend_reschedule_counter--;
-		return -EBUSY;
-	} else if (!vdev->pm->suspend_reschedule_counter) {
-		ivpu_warn(vdev, "Failed to enter idle, force suspend\n");
-		ivpu_pm_prepare_cold_boot(vdev);
-	} else {
-		ivpu_pm_prepare_warm_boot(vdev);
+	timeout = jiffies + msecs_to_jiffies(vdev->timeout.tdr);
+	while (!ivpu_hw_is_idle(vdev)) {
+		cond_resched();
+		if (time_after_eq(jiffies, timeout)) {
+			ivpu_err(vdev, "Failed to enter idle on system suspend\n");
+			return -EBUSY;
+		}
 	}
 
-	vdev->pm->suspend_reschedule_counter = PM_RESCHEDULE_LIMIT;
+	ivpu_suspend(vdev);
+	ivpu_pm_prepare_warm_boot(vdev);
 
 	pci_save_state(to_pci_dev(dev));
 	pci_set_power_state(to_pci_dev(dev), PCI_D3hot);
 
 	ivpu_dbg(vdev, PM, "Suspend done.\n");
 
-	return ret;
+	return 0;
 }
 
 int ivpu_pm_resume_cb(struct device *dev)
-- 
2.25.1

