Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28857A77FB2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 17:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E55010E609;
	Tue,  1 Apr 2025 15:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+gvklvk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC5510E605
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 15:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743523191; x=1775059191;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zbQfy37o69TuWt7m62dMHv9PkN/WEzw63IHLDroXJmY=;
 b=H+gvklvkwuuGpWxzeGRJSCiTh7coILG0T5PSTcuWUxWZK6yPEKSq5Fhf
 Yr6Wl7N9IKSxHO1WttBeRzCdZKrLXYqMnExLSKfwI04ESeGG6wRxOMmgz
 ysr/9anp9bGZc/h2iiyMFnhVw7OwkDLJcWVW/jwX7vK5XLa5za2I/ub0U
 ZcsmyC3ZGszTnPdP3H1NIAHSqZOI3RRDpXnM0XxcEvDSFWCe7Ax8bG7eq
 tDox/tEH1yf1pOKECsk0NJAKoCZ3yyQ3jvqjypAk1F8+LjJEUPCzQIp+l
 +SDz52xg2y3yoWsT1h0AfyD6SklYshzywKGbPAg36EK9bBUptICrtEJmL w==;
X-CSE-ConnectionGUID: d0sHkWHxTuS57NVgv3WamA==
X-CSE-MsgGUID: Mn6YwA7kQkW2K40FfTExTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44004575"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="44004575"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:59:51 -0700
X-CSE-ConnectionGUID: mA0gcTM+Tp6vWTQq1AHj+A==
X-CSE-MsgGUID: WU8qsStvS1+mdZOk5LavLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="131434013"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:59:49 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Add cmdq_id to job related logs
Date: Tue,  1 Apr 2025 17:59:39 +0200
Message-ID: <20250401155939.4049467-1-maciej.falkowski@linux.intel.com>
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

Add tracking of command queue ID in JOB debug message to improve
debugging capabilities.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 004059e4f1e8..863e3cd6ace5 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -470,8 +470,8 @@ static void ivpu_job_destroy(struct ivpu_job *job)
 	struct ivpu_device *vdev = job->vdev;
 	u32 i;
 
-	ivpu_dbg(vdev, JOB, "Job destroyed: id %3u ctx %2d engine %d",
-		 job->job_id, job->file_priv->ctx.id, job->engine_idx);
+	ivpu_dbg(vdev, JOB, "Job destroyed: id %3u ctx %2d cmdq_id %u engine %d",
+		 job->job_id, job->file_priv->ctx.id, job->cmdq_id, job->engine_idx);
 
 	for (i = 0; i < job->bo_count; i++)
 		if (job->bos[i])
@@ -564,8 +564,8 @@ static int ivpu_job_signal_and_destroy(struct ivpu_device *vdev, u32 job_id, u32
 	dma_fence_signal(job->done_fence);
 
 	trace_job("done", job);
-	ivpu_dbg(vdev, JOB, "Job complete:  id %3u ctx %2d engine %d status 0x%x\n",
-		 job->job_id, job->file_priv->ctx.id, job->engine_idx, job_status);
+	ivpu_dbg(vdev, JOB, "Job complete:  id %3u ctx %2d cmdq_id %u engine %d status 0x%x\n",
+		 job->job_id, job->file_priv->ctx.id, job->cmdq_id, job->engine_idx, job_status);
 
 	ivpu_job_destroy(job);
 	ivpu_stop_job_timeout_detection(vdev);
@@ -664,8 +664,8 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority, u32 cmdq_id)
 	}
 
 	trace_job("submit", job);
-	ivpu_dbg(vdev, JOB, "Job submitted: id %3u ctx %2d engine %d prio %d addr 0x%llx next %d\n",
-		 job->job_id, file_priv->ctx.id, job->engine_idx, cmdq->priority,
+	ivpu_dbg(vdev, JOB, "Job submitted: id %3u ctx %2d cmdq_id %u engine %d prio %d addr 0x%llx next %d\n",
+		 job->job_id, file_priv->ctx.id, cmdq->id, job->engine_idx, cmdq->priority,
 		 job->cmd_buf_vpu_addr, cmdq->jobq->header.tail);
 
 	mutex_unlock(&file_priv->lock);
@@ -777,7 +777,8 @@ static int ivpu_submit(struct drm_file *file, struct ivpu_file_priv *file_priv,
 		goto err_free_handles;
 	}
 
-	ivpu_dbg(vdev, JOB, "Submit ioctl: ctx %u buf_count %u\n", file_priv->ctx.id, buffer_count);
+	ivpu_dbg(vdev, JOB, "Submit ioctl: ctx %u cmdq_id %u buf_count %u\n",
+		 file_priv->ctx.id, cmdq_id, buffer_count);
 
 	job = ivpu_job_create(file_priv, engine, buffer_count);
 	if (!job) {
-- 
2.43.0

