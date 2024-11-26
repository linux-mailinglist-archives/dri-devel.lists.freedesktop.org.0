Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B829D9CCF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 18:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE88F10E984;
	Tue, 26 Nov 2024 17:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JiS4gvzv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAEE10E96E;
 Tue, 26 Nov 2024 17:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732643140; x=1764179140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i9vSL4DAuDLWzDNTn8Skfuqr9p6KQPGc9GqEIMr3nrs=;
 b=JiS4gvzvqee/+0fLvKOyvXr0L53TGFbsY91As04Sy9t2x0V7Ha+n+wc3
 UnzyfeOyxux5Iw3OqmMQ+j4Art29xVw53k6C7eIQeNrLq4wShnH4ZRSWW
 hluUx+YegjQ3a93Mmi4m68LjspihlVBszR3sFZCa+9DZjtCn4tHj+GLrQ
 A/lXcd1kaiUpa3fqLFr6ImeDcaCz9OMnVUZ4ZaCPEvT9HIrFm+HaELP22
 5RyhB/pcJn/3YLhhA6yvTSLZI69q4ts0sMhpwdZRMIVdUINH7+U7NsXoC
 aBFGTQZCpmMFG8hF5Q3IDlxZ6Lom56633HujFJmy78/GUemP1lt9iiYQj Q==;
X-CSE-ConnectionGUID: 6PmvAooTRii1dQ2Nm8ZKAQ==
X-CSE-MsgGUID: hcCAzIn2RL671uGKqgaGLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32676915"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32676915"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 09:45:40 -0800
X-CSE-ConnectionGUID: doGWteCgRu2bmYiLSLLpCg==
X-CSE-MsgGUID: hGDpTNrMTEuJ0JPoD4Ff1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="92152582"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 09:45:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v7 4/8] drm/xe: Take PM ref in delayed snapshot capture worker
Date: Tue, 26 Nov 2024 09:46:11 -0800
Message-Id: <20241126174615.2665852-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126174615.2665852-1-matthew.brost@intel.com>
References: <20241126174615.2665852-1-matthew.brost@intel.com>
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

The delayed snapshot capture worker can access the GPU or VRAM both of
which require a PM reference. Take a reference in this worker.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Fixes: 4f04d07c0a94 ("drm/xe: Faster devcoredump")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 0e5edf14a241..0d3a4dc87a7f 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -23,6 +23,7 @@
 #include "xe_guc_submit.h"
 #include "xe_hw_engine.h"
 #include "xe_module.h"
+#include "xe_pm.h"
 #include "xe_sched_job.h"
 #include "xe_vm.h"
 
@@ -167,8 +168,11 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 {
 	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
 	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
+	struct xe_device *xe = coredump_to_xe(coredump);
 	unsigned int fw_ref;
 
+	xe_pm_runtime_get(xe);
+
 	/* keep going if fw fails as we still want to save the memory and SW data */
 	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
@@ -177,6 +181,8 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
 	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
 
+	xe_pm_runtime_put(xe);
+
 	/* Calculate devcoredump size */
 	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
 
-- 
2.34.1

