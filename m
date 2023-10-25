Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 856E47D6722
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 11:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D52810E621;
	Wed, 25 Oct 2023 09:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B768F10E61F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 09:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698227033; x=1729763033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tevUJ2UIdPVMdGjtXQzE+hWWXQdt7+ThcKeIQZsHJBY=;
 b=X03fmf7rbqydW9SYg27xqkDoWRhOYj2M0DucJfETs9PwgrqdmOJsKQtE
 x+zuHGF0W2mEo6yaVvl18ObeFODAnkwHHl//7jMXcsg1Va7hGiERFcERJ
 I0pbPoz1klcnD3xX3U2b8Thb8dSvLXiAJMTYCQkrFYEZOTte2FusNO839
 HdfaKPyPnCd6EQQIdehRhoLp/4s/EEZdHMX0wai/wgIVfTeB0PxWFQkqE
 11wN+KuTkU/l27GhbEQ74am23UFTu509EPdd3chfhBcFtaduTmL1xv9As
 ZwBpCRs0YD1dmcg/PuqgZwfYMNJ5C/fqOJkEEJTq1xrqD+G+1o3cEEXof Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="451498822"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="451498822"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="882401156"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="882401156"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:43:51 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/11] accel/ivpu: Change test_mode module param to bitmask
Date: Wed, 25 Oct 2023 11:43:18 +0200
Message-Id: <20231025094323.989987-7-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
References: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
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
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 4 ++--
 drivers/accel/ivpu/ivpu_drv.h | 7 +++----
 drivers/accel/ivpu/ivpu_job.c | 4 ++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 2a58fb1e2fcc..4dbfd05680ce 100644
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
index 267e03a5edf4..5432b5ee90df 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -148,10 +148,9 @@ extern u8 ivpu_pll_min_ratio;
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

