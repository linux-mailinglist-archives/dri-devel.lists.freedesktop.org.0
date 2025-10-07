Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EDCBC0A7B
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 10:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEB210E5B6;
	Tue,  7 Oct 2025 08:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hq8HOPY5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E21910E5B6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 08:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759826124; x=1791362124;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gzWCPLO0v4sckXdmDFYnpOwDJWmvi9R4+FfQM7YYRXA=;
 b=Hq8HOPY5fl/fQ/HT9WrtNuZKmnTf0eeUIaPIfHV5B6lkdi8q/py+khhA
 BEhOH3Wx1kHR4/H6HnjiHMrkPMkVXrfnmCeg5MU1kyaYaQa/DlE46rrM3
 rPRoRgE/z0fDJOJXeIlr25ayqgWh28+8lo9Tzo9IwKvNlyq8D4GbhpeLE
 grRVUivdcw9uA3oO8PM3fRWJ1rwoJNmUeqVSx8LqCDN7QVV83zgA9PQM7
 PnKrhr3QwufeiqLSyIgM34KJ0FX/rGMgIRPyBdsNgQldyt2EAtkYqeh0P
 yOsi/+OcfhgNTJpnHZ7ybpO2FUQyxBG1xputPIab0lgei77W48ogRJcKv w==;
X-CSE-ConnectionGUID: FfDKFDMXS7uDey/5vE7G3w==
X-CSE-MsgGUID: vOSSxYPAQneo6llogLsV7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="62167666"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="62167666"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 01:35:23 -0700
X-CSE-ConnectionGUID: kGmprpOTTe+NhITsL4W8Pg==
X-CSE-MsgGUID: 1zNkA+5LSHSDE+klFqqy1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="211062252"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 01:35:20 -0700
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Trigger engine reset for additional job status
 codes
Date: Tue,  7 Oct 2025 10:35:11 +0200
Message-ID: <20251007083511.2817021-1-karol.wachowski@linux.intel.com>
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

From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>

Trigger engine reset for any status code in the range.
This allows to add additional status codes in the future without
breaking compatibility between the firmware and the driver.

Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 17273c68f84c..fd548028f1d6 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -574,7 +574,11 @@ static int ivpu_job_signal_and_destroy(struct ivpu_device *vdev, u32 job_id, u32
 	if (!job)
 		return -ENOENT;
 
-	if (job_status == VPU_JSM_STATUS_MVNCI_CONTEXT_VIOLATION_HW) {
+	switch (job_status) {
+	case VPU_JSM_STATUS_PROCESSING_ERR:
+	case VPU_JSM_STATUS_ENGINE_RESET_REQUIRED_MIN ... VPU_JSM_STATUS_ENGINE_RESET_REQUIRED_MAX:
+	{
+		/* Trigger an engine reset */
 		guard(mutex)(&job->file_priv->lock);
 
 		if (job->file_priv->has_mmu_faults)
@@ -589,6 +593,10 @@ static int ivpu_job_signal_and_destroy(struct ivpu_device *vdev, u32 job_id, u32
 		queue_work(system_wq, &vdev->context_abort_work);
 		return 0;
 	}
+	default:
+		/* Complete job with error status, engine reset not required */
+		break;
+	}
 
 	job = ivpu_job_remove_from_submitted_jobs(vdev, job_id);
 	if (!job)
-- 
2.43.0

