Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE377DA74D
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 15:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36DA910E0BC;
	Sat, 28 Oct 2023 13:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF3A10E0C8
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 13:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698500085; x=1730036085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YT8RKx1KzflURi2lfaNDaseVjUxNXQbo/Jc1HUgmOIg=;
 b=j4ztvaMvFefjT4P4ax/V0l7M5pPLGzMv30paQ+Ae0QUnL4R2hnycb2aj
 eJEVc26ZV7ClWAQhxgqG+TGcLKayAemRio7mpE1PPeDqOVeP4jM+WBm7W
 6tdDZ0BfSQvtWqj60B1AllFdaZGH870YznUVyzKgYC0qrvEjN4V1A98yW
 5WX9qusNgj7nyJlYkxgqiuJ+FJaFbCfyzCaR68cE1eztZ/p373tJsT+B6
 /GHbz/kOl9MMAC0g3NFkXZDORlwWwz2wDdOUFseLGlLbADEelxJ9PzfHB
 D5KLwWMk1vxRlSTH/xknEAjQMvincMCQ+V2+W9OVVgUwyE2H0u8HkU6rA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="474136730"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="474136730"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 06:34:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="794871487"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="794871487"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 06:34:42 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/11] accel/ivpu: Change test_mode module param to bitmask
Date: Sat, 28 Oct 2023 15:34:10 +0200
Message-Id: <20231028133415.1169975-7-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231028133415.1169975-1-stanislaw.gruszka@linux.intel.com>
References: <20231028133415.1169975-1-stanislaw.gruszka@linux.intel.com>
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

Change meaning of test_mode module parameter from integer value
to bitmask allowing setting different test features with corresponding
bits.

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 4 ++--
 drivers/accel/ivpu/ivpu_drv.h | 7 +++----
 drivers/accel/ivpu/ivpu_job.c | 4 ++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 4ec8d25a120c..39bac45d88b5 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -39,7 +39,7 @@ MODULE_PARM_DESC(dbg_mask, "Driver debug mask. See IVPU_DBG_* macros.");
 
 int ivpu_test_mode;
 module_param_named_unsafe(test_mode, ivpu_test_mode, int, 0644);
-MODULE_PARM_DESC(test_mode, "Test mode: 0 - disabled , 1 - fw unit test, 2 - null hw, 3 - null submission");
+MODULE_PARM_DESC(test_mode, "Test mode mask. See IVPU_TEST_MODE_* macros.");
 
 u8 ivpu_pll_min_ratio;
 module_param_named(pll_min_ratio, ivpu_pll_min_ratio, byte, 0644);
@@ -315,7 +315,7 @@ static int ivpu_wait_for_ready(struct ivpu_device *vdev)
 	unsigned long timeout;
 	int ret;
 
-	if (ivpu_test_mode == IVPU_TEST_MODE_FW_TEST)
+	if (ivpu_test_mode & IVPU_TEST_MODE_FW_TEST)
 		return 0;
 
 	ivpu_ipc_consumer_add(vdev, &cons, IVPU_IPC_CHAN_BOOT_MSG);
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index fdec8272da8c..ada43ba565c4 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -147,10 +147,9 @@ extern u8 ivpu_pll_min_ratio;
 extern u8 ivpu_pll_max_ratio;
 extern bool ivpu_disable_mmu_cont_pages;
 
-#define IVPU_TEST_MODE_DISABLED        0
-#define IVPU_TEST_MODE_FW_TEST         1
-#define IVPU_TEST_MODE_NULL_HW         2
-#define IVPU_TEST_MODE_NULL_SUBMISSION 3
+#define IVPU_TEST_MODE_FW_TEST         BIT(0)
+#define IVPU_TEST_MODE_NULL_HW         BIT(1)
+#define IVPU_TEST_MODE_NULL_SUBMISSION BIT(2)
 extern int ivpu_test_mode;
 
 struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv);
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 646b8f812901..6e96c921547d 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -196,7 +196,7 @@ static int ivpu_cmdq_push_job(struct ivpu_cmdq *cmdq, struct ivpu_job *job)
 	entry->batch_buf_addr = job->cmd_buf_vpu_addr;
 	entry->job_id = job->job_id;
 	entry->flags = 0;
-	if (unlikely(ivpu_test_mode == IVPU_TEST_MODE_NULL_SUBMISSION))
+	if (unlikely(ivpu_test_mode & IVPU_TEST_MODE_NULL_SUBMISSION))
 		entry->flags = VPU_JOB_FLAGS_NULL_SUBMISSION_MASK;
 	wmb(); /* Ensure that tail is updated after filling entry */
 	header->tail = next_entry;
@@ -404,7 +404,7 @@ static int ivpu_direct_job_submission(struct ivpu_job *job)
 		 job->job_id, job->cmd_buf_vpu_addr, file_priv->ctx.id,
 		 job->engine_idx, cmdq->jobq->header.tail);
 
-	if (ivpu_test_mode == IVPU_TEST_MODE_NULL_HW) {
+	if (ivpu_test_mode & IVPU_TEST_MODE_NULL_HW) {
 		ivpu_job_done(vdev, job->job_id, VPU_JSM_STATUS_SUCCESS);
 		cmdq->jobq->header.head = cmdq->jobq->header.tail;
 		wmb(); /* Flush WC buffer for jobq header */
-- 
2.25.1

