Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EB5AAA0A4
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048EE10E4EB;
	Mon,  5 May 2025 22:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SzNJ28bV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDE810E4EB;
 Mon,  5 May 2025 22:37:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DE16C447F3;
 Mon,  5 May 2025 22:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04371C4CEED;
 Mon,  5 May 2025 22:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484669;
 bh=gFi6sHJ6tPLpA0YfCiCoQ4kFfd40G6cmYkYcUli5dVY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SzNJ28bVsmbegV0D5v2iEuU5uJzEApCOWDT/B1DBCNMv9F3UqBPn+AEDTgAA9bfB7
 K59vcmK4eq4sdS7nHfwGo2vQQfZYsLhJJNDO6xNMmhgFiOwIQat85kc8ZKPX3hTyUc
 wxJ80aPPjtXJCJ2niT3+0sBbmPFKcbRl3BW8o5UmoANdx3WXJW76nA/H1qSwu4zE0J
 XYhplWuuLZ4/AnGnh680nr1RE20WGW2XMkwPwW/0CUBMTmp9YZ1qAMDuH9bg02vDya
 UzXS9dqMbjxCxWrcIizyiW/e9dUv//7I7Q/fpNy6YjdgU+cz2/FfqwO1Z5NZZdWScQ
 VNtworCnMOizw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Stuart Summers <stuart.summers@intel.com>, Sasha Levin <sashal@kernel.org>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, airlied@gmail.com,
 simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 597/642] drm/xe/pf: Move VFs reprovisioning to
 worker
Date: Mon,  5 May 2025 18:13:33 -0400
Message-Id: <20250505221419.2672473-597-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

[ Upstream commit a4d1c5d0b99b75263a5626d2e52d569db3844b33 ]

Since the GuC is reset during GT reset, we need to re-send the
entire SR-IOV provisioning configuration to the GuC. But since
this whole configuration is protected by the PF master mutex and
we can't avoid making allocations under this mutex (like during
LMEM provisioning), we can't do this reprovisioning from gt-reset
path if we want to be reclaim-safe. Move VFs reprovisioning to a
async worker that we will start from the gt-reset path.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250125215505.720-1-michal.wajdeczko@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c       | 43 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h | 10 ++++++
 2 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index b80930a6bc1a2..c08efca6420e7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -15,7 +15,11 @@
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_gt_sriov_pf_service.h"
+#include "xe_gt_sriov_printk.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
+
+static void pf_worker_restart_func(struct work_struct *w);
 
 /*
  * VF's metadata is maintained in the flexible array where:
@@ -41,6 +45,11 @@ static int pf_alloc_metadata(struct xe_gt *gt)
 	return 0;
 }
 
+static void pf_init_workers(struct xe_gt *gt)
+{
+	INIT_WORK(&gt->sriov.pf.workers.restart, pf_worker_restart_func);
+}
+
 /**
  * xe_gt_sriov_pf_init_early - Prepare SR-IOV PF data structures on PF.
  * @gt: the &xe_gt to initialize
@@ -65,6 +74,8 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	pf_init_workers(gt);
+
 	return 0;
 }
 
@@ -161,6 +172,35 @@ void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid)
 	pf_clear_vf_scratch_regs(gt, vfid);
 }
 
+static void pf_restart(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	xe_pm_runtime_get(xe);
+	xe_gt_sriov_pf_config_restart(gt);
+	xe_gt_sriov_pf_control_restart(gt);
+	xe_pm_runtime_put(xe);
+
+	xe_gt_sriov_dbg(gt, "restart completed\n");
+}
+
+static void pf_worker_restart_func(struct work_struct *w)
+{
+	struct xe_gt *gt = container_of(w, typeof(*gt), sriov.pf.workers.restart);
+
+	pf_restart(gt);
+}
+
+static void pf_queue_restart(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	xe_gt_assert(gt, IS_SRIOV_PF(xe));
+
+	if (!queue_work(xe->sriov.wq, &gt->sriov.pf.workers.restart))
+		xe_gt_sriov_dbg(gt, "restart already in queue!\n");
+}
+
 /**
  * xe_gt_sriov_pf_restart - Restart SR-IOV support after a GT reset.
  * @gt: the &xe_gt
@@ -169,6 +209,5 @@ void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid)
  */
 void xe_gt_sriov_pf_restart(struct xe_gt *gt)
 {
-	xe_gt_sriov_pf_config_restart(gt);
-	xe_gt_sriov_pf_control_restart(gt);
+	pf_queue_restart(gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
index 0426b1a77069a..a64a6835ad656 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
@@ -35,8 +35,17 @@ struct xe_gt_sriov_metadata {
 	struct xe_gt_sriov_state_snapshot snapshot;
 };
 
+/**
+ * struct xe_gt_sriov_pf_workers - GT level workers used by the PF.
+ */
+struct xe_gt_sriov_pf_workers {
+	/** @restart: worker that executes actions post GT reset */
+	struct work_struct restart;
+};
+
 /**
  * struct xe_gt_sriov_pf - GT level PF virtualization data.
+ * @workers: workers data.
  * @service: service data.
  * @control: control data.
  * @policy: policy data.
@@ -45,6 +54,7 @@ struct xe_gt_sriov_metadata {
  * @vfs: metadata for all VFs.
  */
 struct xe_gt_sriov_pf {
+	struct xe_gt_sriov_pf_workers workers;
 	struct xe_gt_sriov_pf_service service;
 	struct xe_gt_sriov_pf_control control;
 	struct xe_gt_sriov_pf_policy policy;
-- 
2.39.5

