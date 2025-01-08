Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B80A05F82
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 16:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABFD10EBD8;
	Wed,  8 Jan 2025 15:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gpBG8oOe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C9210EBD6;
 Wed,  8 Jan 2025 15:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736348450; x=1767884450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nJHXFtWa6HD4I1W+rXPzDGKV9a8V5kjoqdoS1Q31AZo=;
 b=gpBG8oOeWmcIcSRVE3FuSYTlr0c0liuhrXgjC0IpkfknY8Vod4y+J9id
 ZMpcLp8LMjUll8SRgUpWAz5Ji3h1FArhmTnhM3t3BwMjQ87uBFZk+6Bfm
 yE3FkY42iIhmTGed4qXzCflsJiM7WZDqltv6bGFJZ5ZhePVyfzeFftiV/
 luo/+RYWGow90m1EdERrt10gF+kKvdgr3+WiFFJlOu/H99SdI5B3isRkM
 MDJ4ZPk8IK/p2aTOPRlxaBSqkb6wqeawljkwN1JXye4yYCmVZ8Us0dWRv
 WFNvtkDaBThvwAAT7LJc72kuTnSHrQscB3zogY4+/zRJxCmLsKysmg+Is g==;
X-CSE-ConnectionGUID: AUdrQdclQ6CVT3tN/QkGnw==
X-CSE-MsgGUID: yUTYgzMvRViIZ1XWEDKFqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="35805118"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="35805118"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 07:00:50 -0800
X-CSE-ConnectionGUID: F07u+9cFTza9BAcSECsdqQ==
X-CSE-MsgGUID: nmeVOCPLQB+VM2zJjry8iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="103337168"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 07:00:48 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH 1/2] drm/xe/guc: Use exec queue hints for GT frequency
Date: Wed,  8 Jan 2025 20:36:02 +0530
Message-Id: <20250108150603.2995709-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108150603.2995709-1-tejas.upadhyay@intel.com>
References: <20250108150603.2995709-1-tejas.upadhyay@intel.com>
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

Allow user to provide a low latency hint per exec queue. When set,
KMD sends a hint to GuC which results in special handling for this
exec queue. SLPC will ramp the GT frequency aggressively every time
it switches to this exec queue.

We need to enable the use of SLPC Compute strategy during init, but
it will apply only to exec queues that set this bit during exec queue
creation.

UMD will indicate low latency hint with flag as mentioned below,

*     struct drm_xe_exec_queue_create exec_queue_create = {
*          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT or 0
*          .extensions = 0,
*          .vm_id = vm,
*          .num_bb_per_exec = 1,
*          .num_eng_per_bb = 1,
*          .instances = to_user_pointer(&instance),
*     };
*     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);

Note: UMD is implementing respecitve usage example, once pull request is
ready, will reference here.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  3 +++
 drivers/gpu/drm/xe/xe_exec_queue.c            |  7 ++++---
 drivers/gpu/drm/xe/xe_guc_pc.c                | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c            |  7 +++++++
 include/uapi/drm/xe_drm.h                     |  3 ++-
 5 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
index 85abe4f09ae2..c50075b8270f 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
@@ -174,6 +174,9 @@ struct slpc_task_state_data {
 	};
 } __packed;
 
+#define SLPC_EXEC_QUEUE_FREQ_REQ_IS_COMPUTE	REG_BIT(28)
+#define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
+
 struct slpc_shared_data_header {
 	/* Total size in bytes of this shared buffer. */
 	u32 size;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 8948f50ee58f..7747ba6c4bb8 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -553,7 +553,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	u32 len;
 	int err;
 
-	if (XE_IOCTL_DBG(xe, args->flags) ||
+	if (XE_IOCTL_DBG(xe, args->flags &&
+			 !(args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
@@ -578,7 +579,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 
 		for_each_tile(tile, xe, id) {
 			struct xe_exec_queue *new;
-			u32 flags = EXEC_QUEUE_FLAG_VM;
+			u32 flags = args->flags | EXEC_QUEUE_FLAG_VM;
 
 			if (id)
 				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
@@ -626,7 +627,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		}
 
 		q = xe_exec_queue_create(xe, vm, logical_mask,
-					 args->width, hwe, 0,
+					 args->width, hwe, args->flags,
 					 args->extensions);
 		up_read(&vm->lock);
 		xe_vm_put(vm);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index e8b9faeaef64..828d09808399 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -955,6 +955,19 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
 	return ret;
 }
 
+static int xe_guc_pc_set_strategy(struct xe_guc_pc *pc, u32 val)
+{
+	int ret = 0;
+
+	xe_pm_runtime_get(pc_to_xe(pc));
+	ret = pc_action_set_param(pc,
+				  SLPC_PARAM_STRATEGIES,
+				  val);
+	xe_pm_runtime_put(pc_to_xe(pc));
+
+	return ret;
+}
+
 /**
  * xe_guc_pc_start - Start GuC's Power Conservation component
  * @pc: Xe_GuC_PC instance
@@ -1015,6 +1028,9 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 
 	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
 
+	/* Enable SLPC Optimized Strategy for compute */
+	xe_guc_pc_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
+
 out:
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9c36329fe857..88a1987ac360 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -15,6 +15,7 @@
 #include <drm/drm_managed.h>
 
 #include "abi/guc_actions_abi.h"
+#include "abi/guc_actions_slpc_abi.h"
 #include "abi/guc_klvs_abi.h"
 #include "regs/xe_lrc_layout.h"
 #include "xe_assert.h"
@@ -400,6 +401,7 @@ static void __guc_exec_queue_policy_add_##func(struct exec_queue_policy *policy,
 MAKE_EXEC_QUEUE_POLICY_ADD(execution_quantum, EXECUTION_QUANTUM)
 MAKE_EXEC_QUEUE_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
 MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
+MAKE_EXEC_QUEUE_POLICY_ADD(slpc_ctx_freq_req, SLPM_GT_FREQUENCY)
 #undef MAKE_EXEC_QUEUE_POLICY_ADD
 
 static const int xe_exec_queue_prio_to_guc[] = {
@@ -414,14 +416,19 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
 	struct exec_queue_policy policy;
 	enum xe_exec_queue_priority prio = q->sched_props.priority;
 	u32 timeslice_us = q->sched_props.timeslice_us;
+	u32 slpc_ctx_freq_req = 0;
 	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
 
 	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
 
+	if (q->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
+		slpc_ctx_freq_req |= SLPC_EXEC_QUEUE_FREQ_REQ_IS_COMPUTE;
+
 	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
 	__guc_exec_queue_policy_add_priority(&policy, xe_exec_queue_prio_to_guc[prio]);
 	__guc_exec_queue_policy_add_execution_quantum(&policy, timeslice_us);
 	__guc_exec_queue_policy_add_preemption_timeout(&policy, preempt_timeout_us);
+	__guc_exec_queue_policy_add_slpc_ctx_freq_req(&policy, slpc_ctx_freq_req);
 
 	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
 		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index f62689ca861a..62447f5422d8 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1097,6 +1097,7 @@ struct drm_xe_vm_bind {
  *         .engine_class = DRM_XE_ENGINE_CLASS_RENDER,
  *     };
  *     struct drm_xe_exec_queue_create exec_queue_create = {
+ *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT or 0
  *          .extensions = 0,
  *          .vm_id = vm,
  *          .num_bb_per_exec = 1,
@@ -1110,7 +1111,6 @@ struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
-
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -1123,6 +1123,7 @@ struct drm_xe_exec_queue_create {
 	/** @vm_id: VM to use for this exec queue */
 	__u32 vm_id;
 
+#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	1
 	/** @flags: MBZ */
 	__u32 flags;
 
-- 
2.34.1

