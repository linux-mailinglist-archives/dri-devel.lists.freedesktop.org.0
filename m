Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 781E5A9C3AC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 11:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A8210E8F5;
	Fri, 25 Apr 2025 09:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVlaDBxd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EF510E8F8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745573625; x=1777109625;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/jkhNUvlWb9lP0DSr6vAf640i2Vth6+58hzLCTGx8NY=;
 b=BVlaDBxdcysX9BhVlhj4Hmfn5Sox0RgoZ89gHjwzWf4JliQP+LxR7O02
 TU5BbwyL2twnu2fGqgyo8/YBgs2BdKLd3050hEu6xTKC5QFfALcUEC92f
 XCjoVtgTNuoxo9FJXa95GRaHvSbW1300hkmTXaus8pxkXjg2foCzy+P1v
 L3yNUOAJPtCzbGC4vLkMK5OxHs9bPvO32UWxuE+T7PSW2cd945hx34EvC
 NipcEtTwYw/JOt7fJc146Hp2sbZJ+PohsZUetLIUkoXoDEDtSWY9B259d
 VfxJpH4gplW16/KRzp7PRR8gQemrkncaiM1jLyh436SEeSVirctNjG9/t A==;
X-CSE-ConnectionGUID: F12RwoWYQGCH7BxkKEp0Xg==
X-CSE-MsgGUID: I0o8l+YYSum0kmISuFnodw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47248030"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="47248030"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 02:33:45 -0700
X-CSE-ConnectionGUID: B+qGfPoqSZapqwe8LnG9lA==
X-CSE-MsgGUID: joUPQAROTI+WSsgqQK3Riw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="138025165"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 02:33:44 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: quic_jhugo@quicinc.com, lizhi.hou@amd.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH] accel/ivpu: Fix pm related deadlocks in cmdq ioctls
Date: Fri, 25 Apr 2025 11:33:40 +0200
Message-ID: <20250425093341.2202895-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

Fix deadlocks in ivpu_cmdq_create_ioctl() and ivpu_cmdq_destroy_ioctl()
related to runtime suspend.

Runtime suspend acquires file_priv->lock mutex by calling
ivpu_cmdq_reset_all_contexts(). The same lock is acquired in the cmdq
ioctls. If one of the cmdq ioctls is called while runtime suspend is in
progress, it can lead to a deadlock.

Call stacks from example deadlock below.

Runtime suspend thread:
[ 3443.179717] Call Trace:
[ 3443.179724]  __schedule+0x4b6/0x16b0
[ 3443.179732]  ? __mod_timer+0x27d/0x3a0
[ 3443.179738]  schedule+0x2f/0x140
[ 3443.179741]  schedule_preempt_disabled+0x19/0x30
[ 3443.179743]  __mutex_lock.constprop.0+0x335/0x7d0
[ 3443.179745]  ? xas_find+0x1ed/0x260
[ 3443.179747]  ? xa_find+0x8e/0xf0
[ 3443.179749]  __mutex_lock_slowpath+0x13/0x20
[ 3443.179751]  mutex_lock+0x41/0x60
[ 3443.179757]  ivpu_cmdq_reset_all_contexts+0x82/0x150 [intel_vpu a9bd091a97f28f0235f161316b29f8234f437295]
[ 3443.179786]  ivpu_pm_runtime_suspend_cb+0x1f1/0x3f0 [intel_vpu a9bd091a97f28f0235f161316b29f8234f437295]
[ 3443.179850]  pci_pm_runtime_suspend+0x6e/0x1f0
[ 3443.179870]  ? __pfx_pci_pm_runtime_suspend+0x10/0x10
[ 3443.179886]  __rpm_callback+0x48/0x130
[ 3443.179899]  rpm_callback+0x64/0x70
[ 3443.179911]  rpm_suspend+0x12c/0x630
[ 3443.179922]  ? __schedule+0x4be/0x16b0
[ 3443.179941]  pm_runtime_work+0xca/0xf0
[ 3443.179955]  process_one_work+0x188/0x3d0
[ 3443.179971]  worker_thread+0x2b9/0x3c0
[ 3443.179984]  kthread+0xfb/0x220
[ 3443.180001]  ? __pfx_worker_thread+0x10/0x10
[ 3443.180013]  ? __pfx_kthread+0x10/0x10
[ 3443.180029]  ret_from_fork+0x47/0x70
[ 3443.180044]  ? __pfx_kthread+0x10/0x10
[ 3443.180059]  ret_from_fork_asm+0x1a/0x30

User space thread:
[ 3443.180128] Call Trace:
[ 3443.180138]  __schedule+0x4b6/0x16b0
[ 3443.180159]  schedule+0x2f/0x140
[ 3443.180163]  rpm_resume+0x1a7/0x6a0
[ 3443.180165]  ? __pfx_autoremove_wake_function+0x10/0x10
[ 3443.180169]  __pm_runtime_resume+0x56/0x90
[ 3443.180171]  ivpu_rpm_get+0x28/0xb0 [intel_vpu a9bd091a97f28f0235f161316b29f8234f437295]
[ 3443.180181]  ivpu_ipc_send_receive+0x6d/0x120 [intel_vpu a9bd091a97f28f0235f161316b29f8234f437295]
[ 3443.180193]  ? free_frozen_pages+0x395/0x670
[ 3443.180199]  ? __free_pages+0xa7/0xc0
[ 3443.180202]  ivpu_jsm_hws_destroy_cmdq+0x76/0xf0 [intel_vpu a9bd091a97f28f0235f161316b29f8234f437295]
[ 3443.180213]  ? locks_dispose_list+0x6c/0xa0
[ 3443.180219]  ? kmem_cache_free+0x342/0x470
[ 3443.180222]  ? vm_area_free+0x19/0x30
[ 3443.180225]  ? xas_load+0x17/0xf0
[ 3443.180229]  ? xa_load+0x72/0xb0
[ 3443.180230]  ivpu_cmdq_unregister.isra.0+0xb1/0x100 [intel_vpu a9bd091a97f28f0235f161316b29f8234f437295]
[ 3443.180241]  ivpu_cmdq_destroy_ioctl+0x8d/0x130 [intel_vpu a9bd091a97f28f0235f161316b29f8234f437295]
[ 3443.180251]  ? __pfx_ivpu_cmdq_destroy_ioctl+0x10/0x10 [intel_vpu a9bd091a97f28f0235f161316b29f8234f437295]
[ 3443.180260]  drm_ioctl_kernel+0xb3/0x110
[ 3443.180265]  drm_ioctl+0x2ca/0x580
[ 3443.180266]  ? __pfx_ivpu_cmdq_destroy_ioctl+0x10/0x10 [intel_vpu a9bd091a97f28f0235f161316b29f8234f437295]
[ 3443.180275]  ? __fput+0x1ae/0x2f0
[ 3443.180279]  ? kmem_cache_free+0x342/0x470
[ 3443.180282]  __x64_sys_ioctl+0xa9/0xe0
[ 3443.180286]  x64_sys_call+0x13b7/0x26f0
[ 3443.180289]  do_syscall_64+0x62/0x180
[ 3443.180291]  entry_SYSCALL_64_after_hwframe+0x71/0x79

Fixes: 465a3914b254 ("accel/ivpu: Add API for command queue create/destroy/submit")
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 863e3cd6ace51..e17b3deda2012 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -874,15 +874,21 @@ int ivpu_cmdq_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *
 int ivpu_cmdq_create_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct ivpu_file_priv *file_priv = file->driver_priv;
+	struct ivpu_device *vdev = file_priv->vdev;
 	struct drm_ivpu_cmdq_create *args = data;
 	struct ivpu_cmdq *cmdq;
+	int ret;
 
-	if (!ivpu_is_capable(file_priv->vdev, DRM_IVPU_CAP_MANAGE_CMDQ))
+	if (!ivpu_is_capable(vdev, DRM_IVPU_CAP_MANAGE_CMDQ))
 		return -ENODEV;
 
 	if (args->priority > DRM_IVPU_JOB_PRIORITY_REALTIME)
 		return -EINVAL;
 
+	ret = ivpu_rpm_get(vdev);
+	if (ret < 0)
+		return ret;
+
 	mutex_lock(&file_priv->lock);
 
 	cmdq = ivpu_cmdq_create(file_priv, ivpu_job_to_jsm_priority(args->priority), false);
@@ -891,6 +897,8 @@ int ivpu_cmdq_create_ioctl(struct drm_device *dev, void *data, struct drm_file *
 
 	mutex_unlock(&file_priv->lock);
 
+	ivpu_rpm_put(vdev);
+
 	return cmdq ? 0 : -ENOMEM;
 }
 
@@ -900,28 +908,35 @@ int ivpu_cmdq_destroy_ioctl(struct drm_device *dev, void *data, struct drm_file
 	struct ivpu_device *vdev = file_priv->vdev;
 	struct drm_ivpu_cmdq_destroy *args = data;
 	struct ivpu_cmdq *cmdq;
-	u32 cmdq_id;
+	u32 cmdq_id = 0;
 	int ret;
 
 	if (!ivpu_is_capable(vdev, DRM_IVPU_CAP_MANAGE_CMDQ))
 		return -ENODEV;
 
+	ret = ivpu_rpm_get(vdev);
+	if (ret < 0)
+		return ret;
+
 	mutex_lock(&file_priv->lock);
 
 	cmdq = xa_load(&file_priv->cmdq_xa, args->cmdq_id);
 	if (!cmdq || cmdq->is_legacy) {
 		ret = -ENOENT;
-		goto err_unlock;
+	} else {
+		cmdq_id = cmdq->id;
+		ivpu_cmdq_destroy(file_priv, cmdq);
+		ret = 0;
 	}
 
-	cmdq_id = cmdq->id;
-	ivpu_cmdq_destroy(file_priv, cmdq);
 	mutex_unlock(&file_priv->lock);
-	ivpu_cmdq_abort_all_jobs(vdev, file_priv->ctx.id, cmdq_id);
-	return 0;
 
-err_unlock:
-	mutex_unlock(&file_priv->lock);
+	/* Abort any pending jobs only if cmdq was destroyed */
+	if (!ret)
+		ivpu_cmdq_abort_all_jobs(vdev, file_priv->ctx.id, cmdq_id);
+
+	ivpu_rpm_put(vdev);
+
 	return ret;
 }
 
-- 
2.45.1

