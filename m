Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD227824126
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 12:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF77F10E46F;
	Thu,  4 Jan 2024 11:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B671610E46A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 11:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704369467; x=1735905467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U+ItTXLBqv7kDg1IBdHJtPA/W/pb+Lgw/JetGe4sI/Q=;
 b=GSbA1tFAPPY0Z+oKpJg8lL4dmIzRJFBZhCnWc2nDJ5T0VY78IGiCM+O1
 qc4Mnz5Rygn4RzMQk/quY66e4OFEIesk5lf+omjSfz0Wl5wQub7wlVadP
 NufYgtiru3iDHSKAOfWg7beN92MD3QLM7/xDA19TJTHc380USlHOxIzu0
 EyzcrO+K3SeNJTS3IylxOZS7SGVIIUSh4iTZ4jf2jeTfuHczHi/wgju6z
 ihTrnNKlYXSrwMFGcH/99RFWRh9YXk4e0OjEzS82tLFPw+kjV4T/GU++n
 WK+skDCzBsZ7CFTyjt/2CwOV05p6YPfusACwkdF5mpbWbSGKxwYpQOYgz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="4584211"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="4584211"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 03:57:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="899275849"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="899275849"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 03:57:44 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 16/16] accel/ivpu: New job status for jobs aborted by the
 driver
Date: Thu,  4 Jan 2024 12:57:13 +0100
Message-ID: <20240104115713.8657-17-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104115713.8657-1-jacek.lawrynowicz@linux.intel.com>
References: <20240104115713.8657-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: quic_jhugo@quicinc.com,
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
index cc9a0504ee2f..1254ec9bee70 100644
--- a/include/uapi/drm/ivpu_accel.h
+++ b/include/uapi/drm/ivpu_accel.h
@@ -309,6 +309,7 @@ struct drm_ivpu_submit {
 
 /* drm_ivpu_bo_wait job status codes */
 #define DRM_IVPU_JOB_STATUS_SUCCESS 0
+#define DRM_IVPU_JOB_STATUS_ABORTED 256
 
 /**
  * struct drm_ivpu_bo_wait - Wait for BO to become inactive
-- 
2.43.0

