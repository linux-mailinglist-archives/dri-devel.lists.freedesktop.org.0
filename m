Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBF4AB82A8
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 11:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C01010E7DB;
	Thu, 15 May 2025 09:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mxf2AEnQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99F810E7DB
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 09:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747301493; x=1778837493;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Hg2QHPQhoRX9kgEQJ8nRwxs5ZrhDa1U3afpAr7dV3KI=;
 b=Mxf2AEnQI3JQQF4MCXB2u5Z+9dRkc+PDrAzNU2C7xBn6IkkAq87rDMon
 BZ3cwOsxvtpN4j8LtcBK4HhpCGTJt1iJmfMlPcPOyClOzhcjGBxWyMYs1
 qjtq1qMGwKlnICtLPs9dEuNt07CpG379Jx6F4gpoubaCLC4nHL0z53z/x
 FzF2u9w/h7dLhyvoVZyanN8hWQp7rUMlo6jjDGrbUb7yHPrNg9V6zIf86
 4pOQo369SxFJpcFE2sgZO40KqhzPz/0rdSFL88qzQiUtlklCG+rv//YVU
 sz8hTbpwEkwN50ic1fyc8fCuhQghTKOd9Wy0MeGNHN7tGRsd53UpSFU9J Q==;
X-CSE-ConnectionGUID: ixROxDQQTECh7cAdvkEVQw==
X-CSE-MsgGUID: 5ROp5mZ9TpOqtedBSz6aHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="71737530"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="71737530"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 02:31:33 -0700
X-CSE-ConnectionGUID: GZs7LCTeQlSIkcEm6hrMvA==
X-CSE-MsgGUID: 6iuYori/S9m5Hgh4OjFBGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="143511816"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 02:31:31 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH] accel/ivpu: Add inference_timeout_ms module parameter
Date: Thu, 15 May 2025 11:31:28 +0200
Message-ID: <20250515093128.252041-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

Add new inference_timeout_ms parameter that allows specifying
maximum allowed duration in milliseconds that inference can take before
triggering a recovery.

Calculate maximum number of heartbeat retries based on ratio between
inference timeout and tdr timeout.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.h |  1 +
 drivers/accel/ivpu/ivpu_hw.c  |  4 ++++
 drivers/accel/ivpu/ivpu_pm.c  | 15 ++++++++++++---
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 5497e7030e915..b6d6b3238b596 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -165,6 +165,7 @@ struct ivpu_device {
 		int boot;
 		int jsm;
 		int tdr;
+		int inference;
 		int autosuspend;
 		int d0i3_entry_msg;
 		int state_dump_msg;
diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
index 633160470c939..08dcc31b56f4d 100644
--- a/drivers/accel/ivpu/ivpu_hw.c
+++ b/drivers/accel/ivpu/ivpu_hw.c
@@ -94,12 +94,14 @@ static void timeouts_init(struct ivpu_device *vdev)
 		vdev->timeout.boot = -1;
 		vdev->timeout.jsm = -1;
 		vdev->timeout.tdr = -1;
+		vdev->timeout.inference = -1;
 		vdev->timeout.autosuspend = -1;
 		vdev->timeout.d0i3_entry_msg = -1;
 	} else if (ivpu_is_fpga(vdev)) {
 		vdev->timeout.boot = 50;
 		vdev->timeout.jsm = 15000;
 		vdev->timeout.tdr = 30000;
+		vdev->timeout.inference = 900000;
 		vdev->timeout.autosuspend = -1;
 		vdev->timeout.d0i3_entry_msg = 500;
 		vdev->timeout.state_dump_msg = 10000;
@@ -107,6 +109,7 @@ static void timeouts_init(struct ivpu_device *vdev)
 		vdev->timeout.boot = 50;
 		vdev->timeout.jsm = 500;
 		vdev->timeout.tdr = 10000;
+		vdev->timeout.inference = 300000;
 		vdev->timeout.autosuspend = 100;
 		vdev->timeout.d0i3_entry_msg = 100;
 		vdev->timeout.state_dump_msg = 10;
@@ -114,6 +117,7 @@ static void timeouts_init(struct ivpu_device *vdev)
 		vdev->timeout.boot = 1000;
 		vdev->timeout.jsm = 500;
 		vdev->timeout.tdr = 2000;
+		vdev->timeout.inference = 60000;
 		if (ivpu_hw_ip_gen(vdev) == IVPU_HW_IP_37XX)
 			vdev->timeout.autosuspend = 10;
 		else
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index ea30db181cd75..eacda1dbe8405 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -33,8 +33,11 @@ static unsigned long ivpu_tdr_timeout_ms;
 module_param_named(tdr_timeout_ms, ivpu_tdr_timeout_ms, ulong, 0644);
 MODULE_PARM_DESC(tdr_timeout_ms, "Timeout for device hang detection, in milliseconds, 0 - default");
 
+static unsigned long ivpu_inference_timeout_ms;
+module_param_named(inference_timeout_ms, ivpu_inference_timeout_ms, ulong, 0644);
+MODULE_PARM_DESC(inference_timeout_ms, "Inference maximum duration, in milliseconds, 0 - default");
+
 #define PM_RESCHEDULE_LIMIT     5
-#define PM_TDR_HEARTBEAT_LIMIT  30
 
 static void ivpu_pm_prepare_cold_boot(struct ivpu_device *vdev)
 {
@@ -191,6 +194,10 @@ static void ivpu_job_timeout_work(struct work_struct *work)
 {
 	struct ivpu_pm_info *pm = container_of(work, struct ivpu_pm_info, job_timeout_work.work);
 	struct ivpu_device *vdev = pm->vdev;
+	unsigned long timeout_ms = ivpu_tdr_timeout_ms ? ivpu_tdr_timeout_ms : vdev->timeout.tdr;
+	unsigned long inference_timeout_ms = ivpu_inference_timeout_ms ? ivpu_inference_timeout_ms :
+					     vdev->timeout.inference;
+	u64 inference_max_retries;
 	u64 heartbeat;
 
 	if (ivpu_jsm_get_heartbeat(vdev, 0, &heartbeat) || heartbeat <= vdev->fw->last_heartbeat) {
@@ -198,8 +205,10 @@ static void ivpu_job_timeout_work(struct work_struct *work)
 		goto recovery;
 	}
 
-	if (atomic_fetch_inc(&vdev->job_timeout_counter) > PM_TDR_HEARTBEAT_LIMIT) {
-		ivpu_err(vdev, "Job timeout detected, heartbeat limit exceeded\n");
+	inference_max_retries = DIV_ROUND_UP(inference_timeout_ms, timeout_ms);
+	if (atomic_fetch_inc(&vdev->job_timeout_counter) >= inference_max_retries) {
+		ivpu_err(vdev, "Job timeout detected, heartbeat limit (%lld) exceeded\n",
+			 inference_max_retries);
 		goto recovery;
 	}
 
-- 
2.45.1

