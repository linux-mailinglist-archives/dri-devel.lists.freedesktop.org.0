Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2C8A8B6C6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 12:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83E110E03E;
	Wed, 16 Apr 2025 10:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OfLPpLnu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C9610E03E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 10:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744799189; x=1776335189;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OPQuJqqWweMBTS0A0skbFOlTBSzByAB9HICoOoAMYqE=;
 b=OfLPpLnu0NDqv/zYpo7305iy8RXqGPAX3pGtRr+0wHuwsjmdZPAF8eb5
 f4Qqkx/e/70iHtKdnTPylQovYgJcY0jhTOsbY5FB23rS47Oq2jHyzd5rA
 09pTJKu1zNNKxGYZ5ENul8X0ZC4lMxZgjgBxcSL7BGd+fu+xV88DQILn/
 wEtMQEjcbYKS1HIFk80YF07PYUgSZ1x2wUsnsYp20IZxxJTmkUiK9WL47
 gD+/0QjVQfBmCSOZj66yDwwSTZk6bQEjJsw98FBFjNW8lVieqJ6uvMl9u
 vFLPFhZGNu1fJ/iuXV6CukIDbv15z4/mUsSzisfoIDS3+atU6PON8ZzzJ w==;
X-CSE-ConnectionGUID: wXokS3lGSMOKFor0NaYZ2g==
X-CSE-MsgGUID: 6DJbdsY7Qqm9TB+Vy71vRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46355022"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="46355022"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:26:28 -0700
X-CSE-ConnectionGUID: 42WuVF6rRtq1zcUt7K3a+g==
X-CSE-MsgGUID: LVeUgKWpRxGwtwCjLM7xqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="161379919"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:26:25 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Implement heartbeat-based TDR mechanism
Date: Wed, 16 Apr 2025 12:25:55 +0200
Message-ID: <20250416102555.384526-1-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Karol Wachowski <karol.wachowski@intel.com>

Introduce a heartbeat-based Timeout Detection and Recovery (TDR) mechanism.
The enhancement aims to improve the reliability of device hang detection by
monitoring heartbeat updates.

Each progressing inference will update heartbeat counter allowing driver to
monitor its progression. Limit maximum number of reschedules when heartbeat
indicates progression to 30.

The heartbeat mechanism provides a more robust method for detecting device
hangs, potentially reducing false positive recoveries due to long running
inferences.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c |  4 ++++
 drivers/accel/ivpu/ivpu_drv.h |  1 +
 drivers/accel/ivpu/ivpu_fw.h  |  1 +
 drivers/accel/ivpu/ivpu_pm.c  | 20 ++++++++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index eff1d3ca075f..0e7748c5e117 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -374,6 +374,9 @@ int ivpu_boot(struct ivpu_device *vdev)
 {
 	int ret;
 
+	drm_WARN_ON(&vdev->drm, atomic_read(&vdev->job_timeout_counter));
+	drm_WARN_ON(&vdev->drm, !xa_empty(&vdev->submitted_jobs_xa));
+
 	/* Update boot params located at first 4KB of FW memory */
 	ivpu_fw_boot_params_setup(vdev, ivpu_bo_vaddr(vdev->fw->mem));
 
@@ -573,6 +576,7 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	vdev->context_xa_limit.min = IVPU_USER_CONTEXT_MIN_SSID;
 	vdev->context_xa_limit.max = IVPU_USER_CONTEXT_MAX_SSID;
 	atomic64_set(&vdev->unique_id_counter, 0);
+	atomic_set(&vdev->job_timeout_counter, 0);
 	xa_init_flags(&vdev->context_xa, XA_FLAGS_ALLOC | XA_FLAGS_LOCK_IRQ);
 	xa_init_flags(&vdev->submitted_jobs_xa, XA_FLAGS_ALLOC1);
 	xa_init_flags(&vdev->db_xa, XA_FLAGS_ALLOC1);
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 92753effb1c9..5497e7030e91 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -154,6 +154,7 @@ struct ivpu_device {
 	struct mutex submitted_jobs_lock; /* Protects submitted_jobs */
 	struct xarray submitted_jobs_xa;
 	struct ivpu_ipc_consumer job_done_consumer;
+	atomic_t job_timeout_counter;
 
 	atomic64_t unique_id_counter;
 
diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
index 1d0b2bd9d65c..9a3935be1c05 100644
--- a/drivers/accel/ivpu/ivpu_fw.h
+++ b/drivers/accel/ivpu/ivpu_fw.h
@@ -39,6 +39,7 @@ struct ivpu_fw_info {
 	u64 read_only_addr;
 	u32 read_only_size;
 	u32 sched_mode;
+	u64 last_heartbeat;
 };
 
 int ivpu_fw_init(struct ivpu_device *vdev);
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index b5891e91f7ab..1fe03fc16bbc 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -34,6 +34,7 @@ module_param_named(tdr_timeout_ms, ivpu_tdr_timeout_ms, ulong, 0644);
 MODULE_PARM_DESC(tdr_timeout_ms, "Timeout for device hang detection, in milliseconds, 0 - default");
 
 #define PM_RESCHEDULE_LIMIT     5
+#define PM_TDR_HEARTBEAT_LIMIT  30
 
 static void ivpu_pm_prepare_cold_boot(struct ivpu_device *vdev)
 {
@@ -44,6 +45,7 @@ static void ivpu_pm_prepare_cold_boot(struct ivpu_device *vdev)
 	ivpu_fw_log_reset(vdev);
 	ivpu_fw_load(vdev);
 	fw->entry_point = fw->cold_boot_entry_point;
+	fw->last_heartbeat = 0;
 }
 
 static void ivpu_pm_prepare_warm_boot(struct ivpu_device *vdev)
@@ -189,7 +191,24 @@ static void ivpu_job_timeout_work(struct work_struct *work)
 {
 	struct ivpu_pm_info *pm = container_of(work, struct ivpu_pm_info, job_timeout_work.work);
 	struct ivpu_device *vdev = pm->vdev;
+	u64 heartbeat;
 
+	if (ivpu_jsm_get_heartbeat(vdev, 0, &heartbeat) || heartbeat <= vdev->fw->last_heartbeat) {
+		ivpu_err(vdev, "Job timeout detected, heartbeat not progressed\n");
+		goto recovery;
+	}
+
+	if (atomic_fetch_inc(&vdev->job_timeout_counter) > PM_TDR_HEARTBEAT_LIMIT) {
+		ivpu_err(vdev, "Job timeout detected, heartbeat limit exceeded\n");
+		goto recovery;
+	}
+
+	vdev->fw->last_heartbeat = heartbeat;
+	ivpu_start_job_timeout_detection(vdev);
+	return;
+
+recovery:
+	atomic_set(&vdev->job_timeout_counter, 0);
 	ivpu_pm_trigger_recovery(vdev, "TDR");
 }
 
@@ -204,6 +223,7 @@ void ivpu_start_job_timeout_detection(struct ivpu_device *vdev)
 void ivpu_stop_job_timeout_detection(struct ivpu_device *vdev)
 {
 	cancel_delayed_work_sync(&vdev->pm->job_timeout_work);
+	atomic_set(&vdev->job_timeout_counter, 0);
 }
 
 int ivpu_pm_suspend_cb(struct device *dev)
-- 
2.43.0

