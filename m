Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D9B7D6720
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 11:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C6910E620;
	Wed, 25 Oct 2023 09:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E7510E61F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 09:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698227029; x=1729763029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aoNhuIAudxBR/k6R67EQ6XNySilHnJSbxwKv8+cOgpg=;
 b=W0eycO3p+uWE0varPhxEj7NFKtvIoEBsT/DGIvr/fGWTa0oUwDbKplfv
 ZQqON0ToVptWp8CQHJywhAYRdWZuNo1G1e+WQVES7jq/HEJc97Y4PAuWU
 IrgUlidPfQL+XtVAGRzQ9T1LBZtMYO1Rw0kD/47ALkrgqmTWlTCiM8jdS
 Qkd/+5h+PIVFQba+GLhrEzXfzfcTKU3T8K/2hQwEgjfa+YwNhMPgGJaeT
 eo9OBcKciPyQSPvK3qSwJho5caVnzSwYo/ChTEuNCx+W0suvZeiprBqtw
 4cjykrR5tFb1PXgXGpO5k9BfTvtWCnfELv+AEoKM2kYvWkGsPjKJnLbV8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="451498811"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="451498811"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:43:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="882401140"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="882401140"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:43:46 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/11] accel/ivpu: Add support for
 VPU_JOB_FLAGS_NULL_SUBMISSION_MASK
Date: Wed, 25 Oct 2023 11:43:17 +0200
Message-Id: <20231025094323.989987-6-stanislaw.gruszka@linux.intel.com>
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
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>

Add test_mode = 3 that add VPU_JOB_FLAGS_NULL_SUBMISSION_MASK
flag to the job send to the VPU device. Then the VPU will process
the job but won't execute commands (except the command to signal
the fence).

This can b used to estimate job processing overhead in the host
software and VPU firmware.

Unlike the null hardware mode, the null submission mode will
still work even if UMD uses VPU fences to track job completion.

Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 2 +-
 drivers/accel/ivpu/ivpu_drv.h | 7 ++++---
 drivers/accel/ivpu/ivpu_job.c | 2 ++
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 346dd7fdcacb..2a58fb1e2fcc 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -39,7 +39,7 @@ MODULE_PARM_DESC(dbg_mask, "Driver debug mask. See IVPU_DBG_* macros.");
 
 int ivpu_test_mode;
 module_param_named_unsafe(test_mode, ivpu_test_mode, int, 0644);
-MODULE_PARM_DESC(test_mode, "Test mode: 0 - normal operation, 1 - fw unit test, 2 - null hw");
+MODULE_PARM_DESC(test_mode, "Test mode: 0 - disabled , 1 - fw unit test, 2 - null hw, 3 - null submission");
 
 u8 ivpu_pll_min_ratio;
 module_param_named(pll_min_ratio, ivpu_pll_min_ratio, byte, 0644);
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 417ddeca8517..267e03a5edf4 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -148,9 +148,10 @@ extern u8 ivpu_pll_min_ratio;
 extern u8 ivpu_pll_max_ratio;
 extern bool ivpu_disable_mmu_cont_pages;
 
-#define IVPU_TEST_MODE_DISABLED  0
-#define IVPU_TEST_MODE_FW_TEST   1
-#define IVPU_TEST_MODE_NULL_HW   2
+#define IVPU_TEST_MODE_DISABLED        0
+#define IVPU_TEST_MODE_FW_TEST         1
+#define IVPU_TEST_MODE_NULL_HW         2
+#define IVPU_TEST_MODE_NULL_SUBMISSION 3
 extern int ivpu_test_mode;
 
 struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv);
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 689dc0d13b8f..646b8f812901 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -196,6 +196,8 @@ static int ivpu_cmdq_push_job(struct ivpu_cmdq *cmdq, struct ivpu_job *job)
 	entry->batch_buf_addr = job->cmd_buf_vpu_addr;
 	entry->job_id = job->job_id;
 	entry->flags = 0;
+	if (unlikely(ivpu_test_mode == IVPU_TEST_MODE_NULL_SUBMISSION))
+		entry->flags = VPU_JOB_FLAGS_NULL_SUBMISSION_MASK;
 	wmb(); /* Ensure that tail is updated after filling entry */
 	header->tail = next_entry;
 	wmb(); /* Flush WC buffer for jobq header */
-- 
2.25.1

