Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15165A26D84
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF4A10E5B5;
	Tue,  4 Feb 2025 08:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hauMOlti";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4F710E5B3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 08:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738658790; x=1770194790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CXeZOu2Sfg+nBksYHxVPgfDbPl0OpiBp0xZA+D45oCg=;
 b=hauMOltiRWRFKVeA4LCnKtzbYeJV6qFrF8tUKGlQo/UUJJq1i6ZNoOsz
 KKIfrnMqgBmfOeMF8JqEAhAnRfsnlOKNlZN97g+EJeAgaAQP9fLpaRAnS
 wjQobtArELm7/goJ40YJGNpecS7A079oiTRpxNjHscqRrsbQelJjZCQOE
 XCZdik284WpVisL9Py0zQdLZB37SBld5FsvC4NaAWSvQBEAi4mdo5MvWM
 krvwPxQCUth12Jt6uKJ1T7RShrXlZxGu7EovALfhk0ih2PBQ4bRTzvS9E
 Wo75VpUbNB5hl3h7lT6OiXkudHgfgMVLU9sQniAOwcfbJzjPMNlZuoZ1r Q==;
X-CSE-ConnectionGUID: jAavQFq+QquoSNBBxSkr8Q==
X-CSE-MsgGUID: 1/+KNdMoQ1Gg1cPOr2C2/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39434720"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="39434720"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 00:46:30 -0800
X-CSE-ConnectionGUID: Nn73Va2BSnez40AKPDBC5w==
X-CSE-MsgGUID: PD4I/k3zQFy2IHKDKCm0zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="115531583"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 00:46:28 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 2/6] accel/ivpu: Prevent runtime suspend during context abort
 work
Date: Tue,  4 Feb 2025 09:46:18 +0100
Message-ID: <20250204084622.2422544-3-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
References: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
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

From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>

Increment the runtime PM counter when entering
ivpu_context_abort_work_fn() to prevent the device
from suspending while the function is executing.

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index c1013f511efa6..004059e4f1e89 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -8,6 +8,7 @@
 #include <linux/bitfield.h>
 #include <linux/highmem.h>
 #include <linux/pci.h>
+#include <linux/pm_runtime.h>
 #include <linux/module.h>
 #include <uapi/drm/ivpu_accel.h>
 
@@ -965,6 +966,9 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
 	unsigned long ctx_id;
 	unsigned long id;
 
+	if (drm_WARN_ON(&vdev->drm, pm_runtime_get_if_active(vdev->drm.dev) <= 0))
+		return;
+
 	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW)
 		ivpu_jsm_reset_engine(vdev, 0);
 
@@ -987,7 +991,7 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
 	ivpu_mmu_discard_events(vdev);
 
 	if (vdev->fw->sched_mode != VPU_SCHEDULING_MODE_HW)
-		return;
+		goto runtime_put;
 
 	ivpu_jsm_hws_resume_engine(vdev, 0);
 	/*
@@ -1000,4 +1004,8 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
 		if (job->file_priv->aborted)
 			ivpu_job_signal_and_destroy(vdev, job->job_id, DRM_IVPU_JOB_STATUS_ABORTED);
 	mutex_unlock(&vdev->submitted_jobs_lock);
+
+runtime_put:
+	pm_runtime_mark_last_busy(vdev->drm.dev);
+	pm_runtime_put_autosuspend(vdev->drm.dev);
 }
-- 
2.45.1

