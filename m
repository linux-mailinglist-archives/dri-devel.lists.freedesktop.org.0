Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 006F56E0711
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 08:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E425710EA33;
	Thu, 13 Apr 2023 06:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558F910E0BC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 06:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681368028; x=1712904028;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R4sbbKw9SV+4dv7MA96nuaYarlE3GDKMuXZCsO8qFDg=;
 b=E4IYuB04thmubx+xDYiAUKBB9KIObAxPoCz52s6Vth82XpFalnKah0cE
 HJsYh2XK0JTiW5EpjZYWbMLzP0E43mWcVN4dthchF9ImQofb+jvqyTdpJ
 g9n9w+nk9qCOMbN8EIC6iX4lI6AswWFdTxpP5jc0kvGvLR9/noUVe+Zcc
 UtJPWUbdWvu4dHxUBZWwcsA0ShO78eDQegMycfsIzu747TE91RpKUlbfo
 /0OF0h4IqqrzaRu80XqL1voqTj8BtvKcjMmavxsPJK3htlvPgVU610adT
 RsAOn8uiDsAgpFRnFnaB4NLZpHj4u14hsvea9YT9JB/GBumfR8Rr6FwhR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="345893873"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="345893873"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 23:40:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="1019047808"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="1019047808"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 23:40:24 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/ivpu: Reserve all non-command bo's using
 DMA_RESV_USAGE_BOOKKEEP
Date: Thu, 13 Apr 2023 08:38:10 +0200
Message-Id: <20230413063810.3167511-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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

Use DMA_RESV_USAGE_BOOKKEEP reservation for buffer objects, except for
command buffers for which we use DMA_RESV_USAGE_WRITE (since VPU can
write to command buffer context save area).

Fixes: 0ec8671837a6 ("accel/ivpu: Fix S3 system suspend when not idle")
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 3c6f1e16cf2f..d45be0615b47 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -431,6 +431,7 @@ ivpu_job_prepare_bos_for_submit(struct drm_file *file, struct ivpu_job *job, u32
 	struct ivpu_file_priv *file_priv = file->driver_priv;
 	struct ivpu_device *vdev = file_priv->vdev;
 	struct ww_acquire_ctx acquire_ctx;
+	enum dma_resv_usage usage;
 	struct ivpu_bo *bo;
 	int ret;
 	u32 i;
@@ -461,22 +462,28 @@ ivpu_job_prepare_bos_for_submit(struct drm_file *file, struct ivpu_job *job, u32
 
 	job->cmd_buf_vpu_addr = bo->vpu_addr + commands_offset;
 
-	ret = drm_gem_lock_reservations((struct drm_gem_object **)job->bos, 1, &acquire_ctx);
+	ret = drm_gem_lock_reservations((struct drm_gem_object **)job->bos, buf_count,
+					&acquire_ctx);
 	if (ret) {
 		ivpu_warn(vdev, "Failed to lock reservations: %d\n", ret);
 		return ret;
 	}
 
-	ret = dma_resv_reserve_fences(bo->base.resv, 1);
-	if (ret) {
-		ivpu_warn(vdev, "Failed to reserve fences: %d\n", ret);
-		goto unlock_reservations;
+	for (i = 0; i < buf_count; i++) {
+		ret = dma_resv_reserve_fences(job->bos[i]->base.resv, 1);
+		if (ret) {
+			ivpu_warn(vdev, "Failed to reserve fences: %d\n", ret);
+			goto unlock_reservations;
+		}
 	}
 
-	dma_resv_add_fence(bo->base.resv, job->done_fence, DMA_RESV_USAGE_WRITE);
+	for (i = 0; i < buf_count; i++) {
+		usage = (i == CMD_BUF_IDX) ? DMA_RESV_USAGE_WRITE : DMA_RESV_USAGE_BOOKKEEP;
+		dma_resv_add_fence(job->bos[i]->base.resv, job->done_fence, usage);
+	}
 
 unlock_reservations:
-	drm_gem_unlock_reservations((struct drm_gem_object **)job->bos, 1, &acquire_ctx);
+	drm_gem_unlock_reservations((struct drm_gem_object **)job->bos, buf_count, &acquire_ctx);
 
 	wmb(); /* Flush write combining buffers */
 
-- 
2.25.1

