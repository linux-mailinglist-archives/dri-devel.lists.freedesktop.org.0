Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A276D1F32
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 13:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF1B10F1F0;
	Fri, 31 Mar 2023 11:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB30810F1F2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 11:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680262578; x=1711798578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GeaDuD9QfoYDuKkRimpE8ryCDBYDuDFt2jp+Zc5MVaI=;
 b=FHD0k1fhz3K9vPYiLb/rUcfdBr2dkVctn1h6NsIoDhrI7Hp7PlxaOQ/D
 elal7pQ20PnpWXQD25Gh0o067cU14So/51jm8Sy9No85qRfXfabAx1ZnG
 2bgWgsLx+wzAs4JYFEbCEDv7Nw7joBsTCD+04V9TB9OkIjfD6gTpISkba
 RFkccngX4QYeH59nmDRt+OIx5gBh579CmnWQ5aA3a6FriQrTSrHzH7fFv
 MCyopSB84hOHU74BhZtXNHKQMkoinisMErVPUQCA1D9CByxSHIletbboH
 ZjbXkEKqC0VFS5MssP9OhTQjBS80f91+QMYoYz7ZBXUW7Os/57lB3YE+E Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="321083188"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="321083188"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 04:36:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="687624684"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="687624684"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 04:36:17 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] accel/ivpu: Add dma fence to command buffers only
Date: Fri, 31 Mar 2023 13:36:02 +0200
Message-Id: <20230331113603.2802515-2-stanislaw.gruszka@linux.intel.com>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karol Wachowski <karol.wachowski@linux.intel.com>

Currently job->done_fence is added to every BO handle within a job. If job
handle (command buffer) is shared between multiple submits, KMD will add
the fence in each of them. Then bo_wait_ioctl() executed on command buffer
will exit only when all jobs containing that handle are done.

This creates deadlock scenario for user mode driver in case when job handle
is added as dependency of another job, because bo_wait_ioctl() of first job
will wait until second job finishes, and second job can not finish before
first one.

Having fences added only to job buffer handle allows user space to execute
bo_wait_ioctl() on the job even if it's handle is submitted with other job.

Fixes: cd7272215c44 ("accel/ivpu: Add command buffer submission logic")
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 910301fae435..3c6f1e16cf2f 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -461,26 +461,22 @@ ivpu_job_prepare_bos_for_submit(struct drm_file *file, struct ivpu_job *job, u32
 
 	job->cmd_buf_vpu_addr = bo->vpu_addr + commands_offset;
 
-	ret = drm_gem_lock_reservations((struct drm_gem_object **)job->bos, buf_count,
-					&acquire_ctx);
+	ret = drm_gem_lock_reservations((struct drm_gem_object **)job->bos, 1, &acquire_ctx);
 	if (ret) {
 		ivpu_warn(vdev, "Failed to lock reservations: %d\n", ret);
 		return ret;
 	}
 
-	for (i = 0; i < buf_count; i++) {
-		ret = dma_resv_reserve_fences(job->bos[i]->base.resv, 1);
-		if (ret) {
-			ivpu_warn(vdev, "Failed to reserve fences: %d\n", ret);
-			goto unlock_reservations;
-		}
+	ret = dma_resv_reserve_fences(bo->base.resv, 1);
+	if (ret) {
+		ivpu_warn(vdev, "Failed to reserve fences: %d\n", ret);
+		goto unlock_reservations;
 	}
 
-	for (i = 0; i < buf_count; i++)
-		dma_resv_add_fence(job->bos[i]->base.resv, job->done_fence, DMA_RESV_USAGE_WRITE);
+	dma_resv_add_fence(bo->base.resv, job->done_fence, DMA_RESV_USAGE_WRITE);
 
 unlock_reservations:
-	drm_gem_unlock_reservations((struct drm_gem_object **)job->bos, buf_count, &acquire_ctx);
+	drm_gem_unlock_reservations((struct drm_gem_object **)job->bos, 1, &acquire_ctx);
 
 	wmb(); /* Flush write combining buffers */
 
-- 
2.25.1

