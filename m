Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3139A90C1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 22:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE1A710E596;
	Mon, 21 Oct 2024 20:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kb5nXyq2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FDD10E3CD;
 Mon, 21 Oct 2024 20:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729541684; x=1761077684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VFeTNJiJ7lL3Wyx7JIq1pnfndPJQjcZDjNTMoynIz8U=;
 b=kb5nXyq2e6ZRqYNLKGcNFyeDh6VHxOIP8SBHUDknIBiz/onJ26BdYNeC
 gKlztKiyks3lcx3SkjiVysdBirb6C2hTgpyo0P01X6BOCmoQB9i2kNtH8
 VDLBTRAFI37WxryHkNhJHEhWBCKmwwSQNPJuTaYZlSE3C5CYSe2Y693/c
 cdUNGc5QS0KVGXR1hWNm3hQBg5FAkk4futCmYWYTykIxT2a5ird1SIsQ8
 nMWivIH/ZjXGXYyQSs/jwLwQfoRGvyGeZsmOA25XZHVY9QDdtyp7ailYN
 UeH2xR4l2MhMdAsbEnvdBE0HsOnX5AWXBqEtRh+EiQpeZTALkn9Wc847A g==;
X-CSE-ConnectionGUID: qDX1KYBMTvKLXhvWELSMrA==
X-CSE-MsgGUID: tsnCozmpQ/SVpRsxpeBwtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40167481"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40167481"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 13:14:44 -0700
X-CSE-ConnectionGUID: fSOrjTTzRWmE8exN17OYHg==
X-CSE-MsgGUID: W1Ji1s4QTFWkDvoXuUb/tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="110472047"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 13:14:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: mika.kuoppala@intel.com, matthew.auld@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v4 4/9] drm/xe: Take PM ref in delayed snapshot capture worker
Date: Mon, 21 Oct 2024 13:15:04 -0700
Message-Id: <20241021201509.1668074-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021201509.1668074-1-matthew.brost@intel.com>
References: <20241021201509.1668074-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 8b0ea77661b2..956bf087d0db 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -23,6 +23,7 @@
 #include "xe_guc_submit.h"
 #include "xe_hw_engine.h"
 #include "xe_module.h"
+#include "xe_pm.h"
 #include "xe_sched_job.h"
 #include "xe_vm.h"
 
@@ -158,8 +159,11 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
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
@@ -168,6 +172,8 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
 	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
 
+	xe_pm_runtime_put(xe);
+
 	/* Calculate devcoredump size */
 	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
 
-- 
2.34.1

