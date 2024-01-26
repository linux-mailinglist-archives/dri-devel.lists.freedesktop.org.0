Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569C683DA31
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 13:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54FA10E5DF;
	Fri, 26 Jan 2024 12:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B61B10F9FE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 12:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706272098; x=1737808098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sgrbJeIX/rgTZUuGgLvyF7PgXYTq183/tdrXDv++PkM=;
 b=ngYSgPgzu64Sem09M13k74jj4NZmXCw2gYKPdFrJpjG63t5CcVlVvQhD
 bLnU/79aU/dCAN8BfHG8IGTQMpP8TDSLZtl5HwCpWwNE/C5D9rsWZtlm2
 w2LGG31/iaaYPyE9Q2FmIL9DM5eFU5zMScuThJk+LUsguAgbKDPp3DL73
 nliCVj3sT/+UQYNTmVLkk4OT3oUTkXMb6/j5gOvn+QOQHRcCNagJia47k
 PjCk3VQ8mN78FzqYnisltbBTdWSXHUKOCJjNNzBn+Q56xLjxHmuWeY35v
 kgjy2yFf5U2zZwtaHoL3erwPi/cMtAWfmYmoCAB8iVAxQ5119jwhPPUNt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9207485"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9207485"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 04:28:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2731976"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 04:28:17 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] accel/ivpu: Add job status for jobs aborted by the driver
Date: Fri, 26 Jan 2024 13:28:04 +0100
Message-ID: <20240126122804.2169129-8-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126122804.2169129-1-jacek.lawrynowicz@linux.intel.com>
References: <20240126122804.2169129-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Grzegorz Trzebiatowski <grzegorz.trzebiatowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Grzegorz Trzebiatowski <grzegorz.trzebiatowski@intel.com>

Add DRM_IVPU_JOB_STATUS_ABORTED to indicate that the job was aborted
by the driver due to e.g. TDR or user context MMU faults.

This will help UMD and tests distinguish if job was aborted by the FW
or the driver.

Signed-off-by: Grzegorz Trzebiatowski <grzegorz.trzebiatowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 4 ++--
 include/uapi/drm/ivpu_accel.h | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 0440bee3ecaf..e70cfb859339 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -294,7 +294,7 @@ static int ivpu_job_signal_and_destroy(struct ivpu_device *vdev, u32 job_id, u32
 		return -ENOENT;
 
 	if (job->file_priv->has_mmu_faults)
-		job_status = VPU_JSM_STATUS_ABORTED;
+		job_status = DRM_IVPU_JOB_STATUS_ABORTED;
 
 	job->bos[CMD_BUF_IDX]->job_status = job_status;
 	dma_fence_signal(job->done_fence);
@@ -315,7 +315,7 @@ void ivpu_jobs_abort_all(struct ivpu_device *vdev)
 	unsigned long id;
 
 	xa_for_each(&vdev->submitted_jobs_xa, id, job)
-		ivpu_job_signal_and_destroy(vdev, id, VPU_JSM_STATUS_ABORTED);
+		ivpu_job_signal_and_destroy(vdev, id, DRM_IVPU_JOB_STATUS_ABORTED);
 }
 
 static int ivpu_job_submit(struct ivpu_job *job)
diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
index 63c49318a863..19a13468eca5 100644
--- a/include/uapi/drm/ivpu_accel.h
+++ b/include/uapi/drm/ivpu_accel.h
@@ -305,6 +305,7 @@ struct drm_ivpu_submit {
 
 /* drm_ivpu_bo_wait job status codes */
 #define DRM_IVPU_JOB_STATUS_SUCCESS 0
+#define DRM_IVPU_JOB_STATUS_ABORTED 256
 
 /**
  * struct drm_ivpu_bo_wait - Wait for BO to become inactive
-- 
2.43.0

