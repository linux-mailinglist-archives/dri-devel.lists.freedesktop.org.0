Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BEBA0422A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A6710EAD5;
	Tue,  7 Jan 2025 14:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QL9WAwPt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF7A10EAD2
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736259771; x=1767795771;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C26uqehIV44Ey7h6fgbfatipHKXpWPX0QHGSujbPVGQ=;
 b=QL9WAwPtrTaVs9debZW/S9EG/DtbMYdDlDBbt/vklOXJVoz7bCclWcUb
 /uw4Ye72vUTeZtxfDZS1bZIxM2xaEp1xSfgLPgDC2JdOKJRZZAW05Fp/P
 rkFBWF9HXentDxPUUNfZNJTVRYNrdfp50ZXwr/Pi10y/XWNDKIZmuZMXn
 ofjsE17WbHbDm98iIRkXcrYPxvfEdWoj5MhdzugLHCCmsdDcwsIutQ11z
 jkCfXbDBjIban0Ka0mD/k21h6VgQGqCXNtWd3EnJDAMRpQTCTyiVwrPkj
 HVe7d/4WHTW1w4iGzBzkFjW71zm0tDX8gMmG5eQQMQDhNGnwwn2QCA58c Q==;
X-CSE-ConnectionGUID: nC60pkvHSPmoK6FF7fPpUw==
X-CSE-MsgGUID: +WwZzturSm+GoZb9LnYi3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36324473"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36324473"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:22:51 -0800
X-CSE-ConnectionGUID: GACU82ruSrmXlAbd2T0ylA==
X-CSE-MsgGUID: m19jbJsmR0yXxIufBTwClA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103635510"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:22:49 -0800
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH 12/14] accel/ivpu: Add handling of
 VPU_JSM_STATUS_MVNCI_CONTEXT_VIOLATION_HW
Date: Tue,  7 Jan 2025 18:32:35 +0100
Message-ID: <20250107173238.381120-13-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
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

Mark as invalid context of a job that returned HW context violation
error and queue work that aborts jobs from faulty context.
Add engine reset to the context abort thread handler to not only abort
currently executing jobs but also to ensure NPU invalid state recovery.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index c93ea37062d7..3c162ac41a1d 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -533,6 +533,26 @@ static int ivpu_job_signal_and_destroy(struct ivpu_device *vdev, u32 job_id, u32
 
 	lockdep_assert_held(&vdev->submitted_jobs_lock);
 
+	job = xa_load(&vdev->submitted_jobs_xa, job_id);
+	if (!job)
+		return -ENOENT;
+
+	if (job_status == VPU_JSM_STATUS_MVNCI_CONTEXT_VIOLATION_HW) {
+		guard(mutex)(&job->file_priv->lock);
+
+		if (job->file_priv->has_mmu_faults)
+			return 0;
+
+		/*
+		 * Mark context as faulty and defer destruction of the job to jobs abort thread
+		 * handler to synchronize between both faults and jobs returning context violation
+		 * status and ensure both are handled in the same way
+		 */
+		job->file_priv->has_mmu_faults = true;
+		queue_work(system_wq, &vdev->context_abort_work);
+		return 0;
+	}
+
 	job = ivpu_job_remove_from_submitted_jobs(vdev, job_id);
 	if (!job)
 		return -ENOENT;
@@ -946,6 +966,9 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
 	unsigned long ctx_id;
 	unsigned long id;
 
+	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW)
+		ivpu_jsm_reset_engine(vdev, 0);
+
 	mutex_lock(&vdev->context_list_lock);
 	xa_for_each(&vdev->context_xa, ctx_id, file_priv) {
 		if (!file_priv->has_mmu_faults || file_priv->aborted)
@@ -959,6 +982,8 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
 
 	if (vdev->fw->sched_mode != VPU_SCHEDULING_MODE_HW)
 		return;
+
+	ivpu_jsm_hws_resume_engine(vdev, 0);
 	/*
 	 * In hardware scheduling mode NPU already has stopped processing jobs
 	 * and won't send us any further notifications, thus we have to free job related resources
-- 
2.43.0

