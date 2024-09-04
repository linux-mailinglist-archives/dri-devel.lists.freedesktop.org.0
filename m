Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D14F96C4BB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 19:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7361D10E80B;
	Wed,  4 Sep 2024 17:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpCzbBEL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1141710E7AA;
 Wed,  4 Sep 2024 17:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725469444; x=1757005444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X4lj0MhEzQzlklp2HvAQHOTCcZzMLk+5St7fbj90pCc=;
 b=YpCzbBELij4Cn+7wBXhTDMeUe1DY6+y45qXwZ7ePhX22n8OrwzXzOocB
 pTEVDk+T3Ok95dmOhJ3lEww6cUH9pYZiIFba7gDtz1lbr3/uJn11Tf2bJ
 pQZq3Z1oSVOuNCpm3hzh2UT7c+lHo+/bao/kLn+amcLskqM8cPtbTeTJx
 sEYcHdAh5mRu+Zre0bR+mmJE8eyDRsT/PK+MQV7XIRdwwxGuUH0Po7kp8
 QIleJ9bDOaVNdVFSD+uTMQ4lcsRoxJtqFwtXkDfdQY2hmTt0QrgSB2Wtw
 EmfFSgwGB1Ohy+ismsUzIMDsPlv7V2xgVZv/ogs1vwnE4ZGZhKqyasgcQ Q==;
X-CSE-ConnectionGUID: t6Nsl07oSIa6yZ07e4Os0A==
X-CSE-MsgGUID: 8KPU7M9qSyWU7/WTMwzWAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="27067475"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="27067475"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 10:04:02 -0700
X-CSE-ConnectionGUID: SX2JreO0R+m2AiD0/NU0Dg==
X-CSE-MsgGUID: e/Igj+3YQkmz57yucZ1RPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="70151022"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 10:04:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, boris.brezillon@collabora.com,
 lionel.g.landwerlin@intel.com, kenneth.w.graunke@intel.com
Subject: [PATCH 2/2] drm/xe: Wire up DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP
Date: Wed,  4 Sep 2024 10:05:00 -0700
Message-Id: <20240904170500.3303081-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904170500.3303081-1-matthew.brost@intel.com>
References: <20240904170500.3303081-1-matthew.brost@intel.com>
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

Fix external BO's dma-resv usage in exec IOCTL with an opt into bookkeep
slot. This leaves syncing to user space rather than the KMD blindly
enforcing write semantics on every external BO.

Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2673
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c     | 11 +++++++++--
 drivers/gpu/drm/xe/xe_vm.c       |  5 ++++-
 drivers/gpu/drm/xe/xe_vm_types.h |  5 +++--
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 7b38485817dc..ea0aba77db84 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -302,9 +302,16 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	 * the job and let the DRM scheduler / backend clean up the job.
 	 */
 	xe_sched_job_arm(job);
-	if (!xe_vm_in_lr_mode(vm))
+	if (!xe_vm_in_lr_mode(vm)) {
+		enum dma_resv_usage extobj_resv_usage = DMA_RESV_USAGE_WRITE;
+
+		/* Override original incorrect behavior */
+		if (vm->flags & XE_VM_FLAG_EXTOBJ_BOOKKEEP)
+			extobj_resv_usage = DMA_RESV_USAGE_BOOKKEEP;
+
 		drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, &job->drm.s_fence->finished,
-					 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_WRITE);
+					 DMA_RESV_USAGE_BOOKKEEP, extobj_resv_usage);
+	}
 
 	for (i = 0; i < num_syncs; i++) {
 		xe_sync_entry_signal(&syncs[i], &job->drm.s_fence->finished);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7acd5fc9d032..a1f98f233c37 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1713,7 +1713,8 @@ find_ufence_get(struct xe_sync_entry *syncs, u32 num_syncs)
 
 #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
 				    DRM_XE_VM_CREATE_FLAG_LR_MODE | \
-				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
+				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE | \
+				    DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP)
 
 int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 		       struct drm_file *file)
@@ -1760,6 +1761,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 		flags |= XE_VM_FLAG_LR_MODE;
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
 		flags |= XE_VM_FLAG_FAULT_MODE;
+	if (args->flags & DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP)
+		flags |= XE_VM_FLAG_EXTOBJ_BOOKKEEP;
 
 	vm = xe_vm_create(xe, flags);
 	if (IS_ERR(vm))
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 7f9a303e51d8..b7056d63d8dc 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -162,8 +162,9 @@ struct xe_vm {
 #define XE_VM_FLAG_SCRATCH_PAGE		BIT(3)
 #define XE_VM_FLAG_FAULT_MODE		BIT(4)
 #define XE_VM_FLAG_BANNED		BIT(5)
-#define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(7, 6), flags)
-#define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(7, 6), (tile)->id)
+#define XE_VM_FLAG_EXTOBJ_BOOKKEEP	BIT(6)
+#define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(8, 7), flags)
+#define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(8, 7), (tile)->id)
 	unsigned long flags;
 
 	/** @composite_fence_ctx: context composite fence */
-- 
2.34.1

