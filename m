Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BE798403E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D82F10E67B;
	Tue, 24 Sep 2024 08:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQfegs//";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE26510E66E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165930; x=1758701930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IQTSZTwFFigIomnW57zV0LPK2/sP50wBjzbJ86xkKD8=;
 b=SQfegs//QYXhIrWnZE/+5x+ts5axPSwYcOdRa0YaDeT9oviZFG5Le6Rm
 ExUrkRgU91kZ3ZhrA+fCfiQ6GBIvHtRD958YHZEgapstxepe2RsP4B4Z3
 dwF5airtsZpp2LOGajd89N8ndxrh6jQ78SoJidVKs8FQpnhPoT0D8wpFx
 3oLMr8lFHBXYWdrtqzETsU+Eb2bcxsLBQ2incWdXgQWUzptTMcyRACkZz
 A/ye/m/yV3xQauP+CaunoJd2SDz4igJ4l3whtRaiA3wDZVaQccWmP1law
 ru/wHxSmOysyW0WOhFl1+HVzr+SouOmdw1Hs6TVALdVaZ9X/G9wLG9bMD g==;
X-CSE-ConnectionGUID: b58oivY7QcWcwlw1oNHMIw==
X-CSE-MsgGUID: oO14lZheSUqQp5TVbjRAhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37507008"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37507008"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:49 -0700
X-CSE-ConnectionGUID: XhZ1A3bWQbSlbLEazmsdLw==
X-CSE-MsgGUID: SmOgxJIcRT6JL7vfGYtcvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170754"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:47 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 23/29] accel/ivpu: Do not fail on cmdq if failed to allocate
 preemption buffers
Date: Tue, 24 Sep 2024 10:17:48 +0200
Message-ID: <20240924081754.209728-24-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
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

Allow to proceed with job command queue creation even if preemption
buffers failed to be allocated, print warning that preemption on such
command queue will be disabled.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index dc5cf7ded9439..48272bc853e0c 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -60,6 +60,7 @@ static int ivpu_preemption_buffers_create(struct ivpu_device *vdev,
 
 err_free_primary:
 	ivpu_bo_free(cmdq->primary_preempt_buf);
+	cmdq->primary_preempt_buf = NULL;
 	return -ENOMEM;
 }
 
@@ -69,10 +70,10 @@ static void ivpu_preemption_buffers_free(struct ivpu_device *vdev,
 	if (vdev->fw->sched_mode != VPU_SCHEDULING_MODE_HW)
 		return;
 
-	drm_WARN_ON(&vdev->drm, !cmdq->primary_preempt_buf);
-	drm_WARN_ON(&vdev->drm, !cmdq->secondary_preempt_buf);
-	ivpu_bo_free(cmdq->primary_preempt_buf);
-	ivpu_bo_free(cmdq->secondary_preempt_buf);
+	if (cmdq->primary_preempt_buf)
+		ivpu_bo_free(cmdq->primary_preempt_buf);
+	if (cmdq->secondary_preempt_buf)
+		ivpu_bo_free(cmdq->secondary_preempt_buf);
 }
 
 static int ivpu_id_alloc(struct xarray *xa, u32 *id, void *entry, struct xa_limit *limit,
@@ -120,12 +121,10 @@ static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv)
 
 	ret = ivpu_preemption_buffers_create(vdev, file_priv, cmdq);
 	if (ret)
-		goto err_free_cmdq_mem;
+		ivpu_warn(vdev, "Failed to allocate preemption buffers, preemption limited\n");
 
 	return cmdq;
 
-err_free_cmdq_mem:
-	ivpu_bo_free(cmdq->mem);
 err_erase_xa:
 	xa_erase(&vdev->db_xa, cmdq->db_id);
 err_free_cmdq:
@@ -388,10 +387,16 @@ static int ivpu_cmdq_push_job(struct ivpu_cmdq *cmdq, struct ivpu_job *job)
 
 	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW &&
 	    (unlikely(!(ivpu_test_mode & IVPU_TEST_MODE_PREEMPTION_DISABLE)))) {
-		entry->primary_preempt_buf_addr = cmdq->primary_preempt_buf->vpu_addr;
-		entry->primary_preempt_buf_size = ivpu_bo_size(cmdq->primary_preempt_buf);
-		entry->secondary_preempt_buf_addr = cmdq->secondary_preempt_buf->vpu_addr;
-		entry->secondary_preempt_buf_size = ivpu_bo_size(cmdq->secondary_preempt_buf);
+		if (cmdq->primary_preempt_buf) {
+			entry->primary_preempt_buf_addr = cmdq->primary_preempt_buf->vpu_addr;
+			entry->primary_preempt_buf_size = ivpu_bo_size(cmdq->primary_preempt_buf);
+		}
+
+		if (cmdq->secondary_preempt_buf) {
+			entry->secondary_preempt_buf_addr = cmdq->secondary_preempt_buf->vpu_addr;
+			entry->secondary_preempt_buf_size =
+				ivpu_bo_size(cmdq->secondary_preempt_buf);
+		}
 	}
 
 	wmb(); /* Ensure that tail is updated after filling entry */
-- 
2.45.1

