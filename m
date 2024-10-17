Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D90B9A25C6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 16:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37E110E858;
	Thu, 17 Oct 2024 14:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SgGHPlam";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75BF10E856
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 14:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729177116; x=1760713116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hJATJST04ef4teyciM1uKRkWyOtrDHrAWWdepwNehqU=;
 b=SgGHPlamcveuRMBqrF9AY4QvRsaogEc48dNZUsvFvDKZC92ephZdfkNF
 EIrskNj2QfJlwf8A4WcKZ2qd0VhVQe0EB6WCy3F8Kc2/RnDNX15HBar/S
 o+CXxzrW0vUzeuwPehJftsBe7yvBrILOpxCY/SYb+1dartUpN3UHJcaYb
 aLQ32SEXet+dUUnGGBQM/tiQ4NGsdQ4WOe3rYNSn0s0mYeavHheaO0+lE
 8WgagOb3sQKvccMCtQQcPS+M0Ckj2wAvujtZmGml13UXvicQAlxwFNNTa
 MM/Kp59KttXKK+VYK7fZ74TgxtohD15b9K2SvhpACPLWK85LSbSdLBHqG Q==;
X-CSE-ConnectionGUID: Hli6i6ekQEWCi7SFPxQk0A==
X-CSE-MsgGUID: 4otmU4ABQWiQzyGkHABwaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39790356"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39790356"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:35 -0700
X-CSE-ConnectionGUID: y8NH3Xi3T0ikZa3D18UF7g==
X-CSE-MsgGUID: 4nuJqYJDTyKFmzO5ur18Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="109374553"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:34 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 08/11] accel/ivpu: Don't allocate preemption buffers when MIP
 is disabled
Date: Thu, 17 Oct 2024 16:58:14 +0200
Message-ID: <20241017145817.121590-9-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
References: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
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

Do not allocate preemption buffers when Mid Inference Preemption (MIP)
is disabled through test mode.

Rename IVPU_TEST_MODE_PREEMPTION_DISABLE to IVPU_TEST_MODE_MIP_DISABLE
to better describe that this test mode only disables MIP - job level
preemption will still occur.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.h | 2 +-
 drivers/accel/ivpu/ivpu_job.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 8e79d78906bfe..3fdff3f6cffd8 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -197,7 +197,7 @@ extern bool ivpu_force_snoop;
 #define IVPU_TEST_MODE_NULL_SUBMISSION    BIT(2)
 #define IVPU_TEST_MODE_D0I3_MSG_DISABLE   BIT(4)
 #define IVPU_TEST_MODE_D0I3_MSG_ENABLE    BIT(5)
-#define IVPU_TEST_MODE_PREEMPTION_DISABLE BIT(6)
+#define IVPU_TEST_MODE_MIP_DISABLE        BIT(6)
 #define IVPU_TEST_MODE_DISABLE_TIMEOUTS   BIT(8)
 #define IVPU_TEST_MODE_TURBO		  BIT(9)
 extern int ivpu_test_mode;
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 82a57a30244d3..39ba6d3d8b0de 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -35,7 +35,8 @@ static int ivpu_preemption_buffers_create(struct ivpu_device *vdev,
 	u64 primary_size = ALIGN(vdev->fw->primary_preempt_buf_size, PAGE_SIZE);
 	u64 secondary_size = ALIGN(vdev->fw->secondary_preempt_buf_size, PAGE_SIZE);
 
-	if (vdev->fw->sched_mode != VPU_SCHEDULING_MODE_HW)
+	if (vdev->fw->sched_mode != VPU_SCHEDULING_MODE_HW ||
+	    ivpu_test_mode & IVPU_TEST_MODE_MIP_DISABLE)
 		return 0;
 
 	cmdq->primary_preempt_buf = ivpu_bo_create(vdev, &file_priv->ctx, &vdev->hw->ranges.user,
@@ -347,8 +348,7 @@ static int ivpu_cmdq_push_job(struct ivpu_cmdq *cmdq, struct ivpu_job *job)
 	if (unlikely(ivpu_test_mode & IVPU_TEST_MODE_NULL_SUBMISSION))
 		entry->flags = VPU_JOB_FLAGS_NULL_SUBMISSION_MASK;
 
-	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW &&
-	    (unlikely(!(ivpu_test_mode & IVPU_TEST_MODE_PREEMPTION_DISABLE)))) {
+	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW) {
 		if (cmdq->primary_preempt_buf) {
 			entry->primary_preempt_buf_addr = cmdq->primary_preempt_buf->vpu_addr;
 			entry->primary_preempt_buf_size = ivpu_bo_size(cmdq->primary_preempt_buf);
-- 
2.45.1

