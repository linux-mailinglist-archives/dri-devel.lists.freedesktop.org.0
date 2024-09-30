Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F91698AD82
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0DC10E595;
	Mon, 30 Sep 2024 19:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZfXZo/3W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABDB10E582
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726045; x=1759262045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UBRUfi1q0QBc4LhPf9C1HnEozrIZOLZUxbL3mkzAZqc=;
 b=ZfXZo/3WzLUR+WwCNDn3swwmChiyIbr7GN+01ai099zR1NYxc9FyaT31
 rkCpAPS/7VkXQWtbZ8dsRIy+CZI+sAEYuN0nEx9JOnzMPALSGMBMGNzx7
 H7fwUpEZ9WFpY7lO95cn1IOEjVjhfS7nouZ+toDRreb2IDh2y4KSJ1GOF
 bBNxpKL5CHII5hqU4soRn9BwK4kg2KMem1UGBNFvfclOn83ZExYvJMK1b
 ZSKQSEf7w7ShfjbEsTI4Q7ytk5RNNDoD+MALQFh+bmm5PDEMuKl0ltZpS
 62rwR3KQErjG2p6kGbALZB3mMuWtoat/wyHlqQ1SRLFSn6GfgtqAsUD7i A==;
X-CSE-ConnectionGUID: ISYmmM8TTmyBYoJKEMk9wA==
X-CSE-MsgGUID: +JxGhEWCRpmKoMcshixiVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962374"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962374"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:54:04 -0700
X-CSE-ConnectionGUID: Al0QKB9jTqWNq/e8P7n6/Q==
X-CSE-MsgGUID: UcLTKEKPSHm6nnFYuyxWyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370229"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:54:03 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 25/31] accel/ivpu: Do not fail on cmdq if failed to
 allocate preemption buffers
Date: Mon, 30 Sep 2024 21:53:16 +0200
Message-ID: <20240930195322.461209-26-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
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
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
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

