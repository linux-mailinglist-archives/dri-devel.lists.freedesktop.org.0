Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3661903B61
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 14:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7E510E5E9;
	Tue, 11 Jun 2024 12:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MPzmuuZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF4410E5E9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 12:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718107482; x=1749643482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LAQUFj1EQs2snSPSAodymzctzrPwSnX9rp9SnzexAuU=;
 b=MPzmuuZA4u3cQveofB5arnxUAh+ri43trZvT+ufg9Lj0ClLLEe1KKE5x
 Sk/E4ZUKw+K6x7NMZgAjj1rdyjcewFjSN4QuKvt3D08/wMAobkLU7BTgF
 Z5Jd5FWvhJC2vmoZoAKuMNEGLQ4/G/NkMREPlxB+OfMiiYhJdd5x1X26e
 eWSV4UW1taZIPxz7Q3HupqwhGrRsgpNfqSe94CKO+vbFkJscq8AfcOuu4
 Ac3pEt/p0tSPI4bJisAtVK0C37QU1vQOHqvvFyJqvz/z5uzsAdzFdGsxg
 UTOP1NI+2Dryk1kGTrVbhErnsfg/1w4LP0f/XUexVriyPqW7UNoIxOcSw g==;
X-CSE-ConnectionGUID: zNBacGJiSLu3O5HF+iLt3Q==
X-CSE-MsgGUID: A6hhvWSbRY+A+XFjh/mieQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32296034"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="32296034"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:42 -0700
X-CSE-ConnectionGUID: muTbC5w6QSaFS256KeTiKA==
X-CSE-MsgGUID: Z4ACEOJKSyKuM2fblcvC+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39876953"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:40 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 03/15] accel/ivpu: Remove suspend_reschedule_counter
Date: Tue, 11 Jun 2024 14:04:20 +0200
Message-ID: <20240611120433.1012423-4-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
References: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
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

Don't retry runtime suspend. It is now expected to succeed on the first
try. After autosuspend_delay passed, FW should already be idle and
ready for warm suspend.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_pm.c | 31 +++++++++++--------------------
 drivers/accel/ivpu/ivpu_pm.h |  3 +--
 2 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 02b4eac13f8b..9d5f500afd20 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -237,33 +237,28 @@ int ivpu_pm_runtime_suspend_cb(struct device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct ivpu_device *vdev = to_ivpu_device(drm);
-	bool hw_is_idle = true;
-	int ret;
+	int ret, ret_d0i3;
+	bool is_idle;
 
 	drm_WARN_ON(&vdev->drm, !xa_empty(&vdev->submitted_jobs_xa));
 	drm_WARN_ON(&vdev->drm, work_pending(&vdev->pm->recovery_work));
 
 	ivpu_dbg(vdev, PM, "Runtime suspend..\n");
 
-	if (!ivpu_hw_is_idle(vdev) && vdev->pm->suspend_reschedule_counter) {
-		ivpu_dbg(vdev, PM, "Failed to enter idle, rescheduling suspend, retries left %d\n",
-			 vdev->pm->suspend_reschedule_counter);
-		pm_schedule_suspend(dev, vdev->timeout.reschedule_suspend);
-		vdev->pm->suspend_reschedule_counter--;
-		return -EAGAIN;
-	}
+	is_idle = ivpu_hw_is_idle(vdev);
+	if (!is_idle)
+		ivpu_err(vdev, "NPU is not idle before autosuspend\n");
 
-	if (!vdev->pm->suspend_reschedule_counter)
-		hw_is_idle = false;
-	else if (ivpu_jsm_pwr_d0i3_enter(vdev))
-		hw_is_idle = false;
+	ret_d0i3 = ivpu_jsm_pwr_d0i3_enter(vdev);
+	if (ret_d0i3)
+		ivpu_err(vdev, "Failed to prepare for d0i3: %d\n", ret_d0i3);
 
 	ret = ivpu_suspend(vdev);
 	if (ret)
 		ivpu_err(vdev, "Failed to suspend NPU: %d\n", ret);
 
-	if (!hw_is_idle) {
-		ivpu_err(vdev, "NPU failed to enter idle, force suspended.\n");
+	if (!is_idle || ret_d0i3) {
+		ivpu_err(vdev, "Forcing cold boot due to previous errors\n");
 		atomic_inc(&vdev->pm->reset_counter);
 		ivpu_fw_log_dump(vdev);
 		ivpu_pm_prepare_cold_boot(vdev);
@@ -271,8 +266,6 @@ int ivpu_pm_runtime_suspend_cb(struct device *dev)
 		ivpu_pm_prepare_warm_boot(vdev);
 	}
 
-	vdev->pm->suspend_reschedule_counter = PM_RESCHEDULE_LIMIT;
-
 	ivpu_dbg(vdev, PM, "Runtime suspend done.\n");
 
 	return 0;
@@ -300,8 +293,7 @@ int ivpu_rpm_get(struct ivpu_device *vdev)
 	int ret;
 
 	ret = pm_runtime_resume_and_get(vdev->drm.dev);
-	if (!drm_WARN_ON(&vdev->drm, ret < 0))
-		vdev->pm->suspend_reschedule_counter = PM_RESCHEDULE_LIMIT;
+	drm_WARN_ON(&vdev->drm, ret < 0);
 
 	return ret;
 }
@@ -365,7 +357,6 @@ void ivpu_pm_init(struct ivpu_device *vdev)
 	int delay;
 
 	pm->vdev = vdev;
-	pm->suspend_reschedule_counter = PM_RESCHEDULE_LIMIT;
 
 	init_rwsem(&pm->reset_lock);
 	atomic_set(&pm->reset_pending, 0);
diff --git a/drivers/accel/ivpu/ivpu_pm.h b/drivers/accel/ivpu/ivpu_pm.h
index ec60fbeefefc..e524412765be 100644
--- a/drivers/accel/ivpu/ivpu_pm.h
+++ b/drivers/accel/ivpu/ivpu_pm.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #ifndef __IVPU_PM_H__
@@ -19,7 +19,6 @@ struct ivpu_pm_info {
 	atomic_t reset_counter;
 	atomic_t reset_pending;
 	bool is_warmboot;
-	u32 suspend_reschedule_counter;
 };
 
 void ivpu_pm_init(struct ivpu_device *vdev);
-- 
2.45.1

