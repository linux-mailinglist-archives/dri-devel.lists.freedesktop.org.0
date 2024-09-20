Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A5F97D033
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 05:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3777D10E789;
	Fri, 20 Sep 2024 03:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1eneOB6";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C17810E6FD;
 Fri, 20 Sep 2024 03:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726802408; x=1758338408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d0jz/sNpxhur+Y9GdZN/bJoyTMBOCVGBWF6yDOExCi0=;
 b=d1eneOB6AMduPHO3VmLRwb3K1Ne59sGb2cuUSMwLoQTaiynxdJiIyspd
 k0KzlCeNNRiBXDR6tSV2BzO5DhQk4z4oefUhJlY8m9LtaX7wTC02xBHdG
 IMFTrXy7frogSRLI5M4KE7mvbZzVLIdZKcSM/AjIKSXpgL98IxOfg7JRU
 NXFsAaSr4XNCpU3hXqEO/BHaLq6CXah8ur0Dh6GjlcouM8LC7r8tP/VtB
 drMM7oPOI2GU6q0HvpgHGWpIKHGynfRobzi24D2FtLD2OHGOeIqU9jnzU
 sdCTruj+2GX3e9GjBo+/h4m/YWemeqCkFwwcnENjvEcJhShLyiKfgGKDz Q==;
X-CSE-ConnectionGUID: Rx1YiTwrQJuciMNhxtnQuw==
X-CSE-MsgGUID: he+YD2H+Q1+OF0SCUYkIdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25269798"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="25269798"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 20:20:08 -0700
X-CSE-ConnectionGUID: NCN/zkzMSwirEMksVObFJg==
X-CSE-MsgGUID: 5jwMRB4xRnKQdCHKi4KjEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="69746173"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa007.fm.intel.com with ESMTP; 19 Sep 2024 20:20:07 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v8 02/11] drm/xe/devcoredump: Use drm_puts and already cached
 local variables
Date: Thu, 19 Sep 2024 20:19:57 -0700
Message-ID: <20240920032007.629624-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920032007.629624-1-John.C.Harrison@Intel.com>
References: <20240920032007.629624-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

There are a bunch of calls to drm_printf with static strings. Switch
them to drm_puts instead.

There are also a bunch of 'coredump->snapshot.XXX' references when
'coredump->snapshot' has alread been cached locally as 'ss'. So use
'ss->XXX' instead.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 40 ++++++++++++++---------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index bdb76e834e4c..d23719d5c2a3 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -85,9 +85,9 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 
 	p = drm_coredump_printer(&iter);
 
-	drm_printf(&p, "**** Xe Device Coredump ****\n");
-	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
-	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
+	drm_puts(&p, "**** Xe Device Coredump ****\n");
+	drm_puts(&p, "kernel: " UTS_RELEASE "\n");
+	drm_puts(&p, "module: " KBUILD_MODNAME "\n");
 
 	ts = ktime_to_timespec64(ss->snapshot_time);
 	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
@@ -96,20 +96,20 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 	drm_printf(&p, "Process: %s\n", ss->process_name);
 	xe_device_snapshot_print(xe, &p);
 
-	drm_printf(&p, "\n**** GuC CT ****\n");
-	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
-	xe_guc_exec_queue_snapshot_print(coredump->snapshot.ge, &p);
+	drm_puts(&p, "\n**** GuC CT ****\n");
+	xe_guc_ct_snapshot_print(ss->ct, &p);
+	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
 
-	drm_printf(&p, "\n**** Job ****\n");
-	xe_sched_job_snapshot_print(coredump->snapshot.job, &p);
+	drm_puts(&p, "\n**** Job ****\n");
+	xe_sched_job_snapshot_print(ss->job, &p);
 
-	drm_printf(&p, "\n**** HW Engines ****\n");
+	drm_puts(&p, "\n**** HW Engines ****\n");
 	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
-		if (coredump->snapshot.hwe[i])
-			xe_hw_engine_snapshot_print(coredump->snapshot.hwe[i],
-						    &p);
-	drm_printf(&p, "\n**** VM state ****\n");
-	xe_vm_snapshot_print(coredump->snapshot.vm, &p);
+		if (ss->hwe[i])
+			xe_hw_engine_snapshot_print(ss->hwe[i], &p);
+
+	drm_puts(&p, "\n**** VM state ****\n");
+	xe_vm_snapshot_print(ss->vm, &p);
 
 	return count - iter.remain;
 }
@@ -247,18 +247,18 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
 		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
 
-	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
-	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(q);
-	coredump->snapshot.job = xe_sched_job_snapshot_capture(job);
-	coredump->snapshot.vm = xe_vm_snapshot_capture(q->vm);
+	ss->ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
+	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
+	ss->job = xe_sched_job_snapshot_capture(job);
+	ss->vm = xe_vm_snapshot_capture(q->vm);
 
 	for_each_hw_engine(hwe, q->gt, id) {
 		if (hwe->class != q->hwe->class ||
 		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
-			coredump->snapshot.hwe[id] = NULL;
+			ss->hwe[id] = NULL;
 			continue;
 		}
-		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe);
+		ss->hwe[id] = xe_hw_engine_snapshot_capture(hwe);
 	}
 
 	queue_work(system_unbound_wq, &ss->work);
-- 
2.46.0

