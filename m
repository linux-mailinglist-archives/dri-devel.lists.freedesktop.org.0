Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDFB9DBD27
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 22:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA88310ED48;
	Thu, 28 Nov 2024 21:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CKwsiEDu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F66510ED48;
 Thu, 28 Nov 2024 21:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732828106; x=1764364106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MVIf3lAQXUUcAa1h7rIJUF4U8spZDzJhVw7InbCKqTc=;
 b=CKwsiEDuP04+9Gj3dXokFJNFkt7/sGfI6KzzytdHsofPeXuLSuPfvcY8
 0qoGBM1ShAhWWo1VMhxMdnuQsyMfC2dPkqbPi7JYQpMHsRn7aSnKBcx65
 FDLdCwPrTvAMVdmASJn0sumHNXPCiZZGo8B0fIKsDr4ed80v7HNXNxyq9
 OvUUc5j9aMeHWYU0MUdpOzcEOU4EeuhCE9kDfmJ9QPqgW+Y8DfTto9dTV
 0qw72Eai+KjOP5hZljbO9ouVcSOgJW/Pw9CE+5jTb3L/+2wipQAShUYSR
 0MvIt+H3mO9DwgSDvw9RoK7Ly/OXZbzMB19l/EuCkZqfCkBP4110fr1iQ w==;
X-CSE-ConnectionGUID: GKHP4L7qRJ2D6SKdllK5SQ==
X-CSE-MsgGUID: 1O8OnqiPRM+jiqkxPoK+cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33311948"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="33311948"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 13:08:25 -0800
X-CSE-ConnectionGUID: z5s8YQJ3RSKN67t21E94iw==
X-CSE-MsgGUID: QMJkUFVjSkeurIYxqvhEyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="93165065"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 28 Nov 2024 13:08:25 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org
Subject: [PATCH v6 2/3] drm/xe: Move the coredump registration to the worker
 thread
Date: Thu, 28 Nov 2024 13:08:23 -0800
Message-ID: <20241128210824.3302147-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128210824.3302147-1-John.C.Harrison@Intel.com>
References: <20241128210824.3302147-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Adding lockdep checking to the coredump code showed that there was an
existing violation. The dev_coredumpm_timeout() call is used to
register the dump with the base coredump subsystem. However, that
makes multiple memory allocations, only some of which use the GFP_
flags passed in. So that also needs to be deferred to the worker
function where it is safe to allocate with arbitrary flags.

In order to not add protoypes for the callback functions, moving the
_timeout call also means moving the worker thread function to later in
the file.

v2: Rebased after other changes to the worker function.

Fixes: e799485044cb ("drm/xe: Introduce the dev_coredump infrastructure.")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: intel-xe@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 73 +++++++++++++++--------------
 1 file changed, 39 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index baac50f6dd7e..d24f1088e298 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -168,36 +168,6 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 	ss->vm = NULL;
 }
 
-static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
-{
-	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
-	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
-	struct xe_device *xe = coredump_to_xe(coredump);
-	unsigned int fw_ref;
-
-	xe_pm_runtime_get(xe);
-
-	/* keep going if fw fails as we still want to save the memory and SW data */
-	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
-		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
-	xe_vm_snapshot_capture_delayed(ss->vm);
-	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
-	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
-
-	xe_pm_runtime_put(xe);
-
-	/* Calculate devcoredump size */
-	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
-
-	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
-	if (!ss->read.buffer)
-		return;
-
-	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
-	xe_devcoredump_snapshot_free(ss);
-}
-
 static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
@@ -246,6 +216,45 @@ static void xe_devcoredump_free(void *data)
 		 "Xe device coredump has been deleted.\n");
 }
 
+static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
+{
+	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
+	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
+	struct xe_device *xe = coredump_to_xe(coredump);
+	unsigned int fw_ref;
+
+	/*
+	 * NB: Despite passing a GFP_ flags parameter here, more allocations are done
+	 * internally using GFP_KERNEL expliictly. Hence this call must be in the worker
+	 * thread and not in the initial capture call.
+	 */
+	dev_coredumpm_timeout(gt_to_xe(ss->gt)->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
+			      xe_devcoredump_read, xe_devcoredump_free,
+			      XE_COREDUMP_TIMEOUT_JIFFIES);
+
+	xe_pm_runtime_get(xe);
+
+	/* keep going if fw fails as we still want to save the memory and SW data */
+	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
+		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
+	xe_vm_snapshot_capture_delayed(ss->vm);
+	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
+	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
+
+	xe_pm_runtime_put(xe);
+
+	/* Calculate devcoredump size */
+	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
+
+	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
+	if (!ss->read.buffer)
+		return;
+
+	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
+	xe_devcoredump_snapshot_free(ss);
+}
+
 static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 				 struct xe_exec_queue *q,
 				 struct xe_sched_job *job)
@@ -334,10 +343,6 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
 	drm_info(&xe->drm, "Xe device coredump has been created\n");
 	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
 		 xe->drm.primary->index);
-
-	dev_coredumpm_timeout(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
-			      xe_devcoredump_read, xe_devcoredump_free,
-			      XE_COREDUMP_TIMEOUT_JIFFIES);
 }
 
 static void xe_driver_devcoredump_fini(void *arg)
-- 
2.47.0

