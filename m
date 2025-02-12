Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265C4A325B2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 13:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F41B10E873;
	Wed, 12 Feb 2025 12:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngFvldEb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEDE10E08E;
 Wed, 12 Feb 2025 12:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739362303; x=1770898303;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8xRczJ+6fuozmOIp68FujAD48HuqeNLP1OX5kCweabY=;
 b=ngFvldEblZq8NHg/BWoShOoDtU8dhre/6drm/0QmRH9g/rOQxYTTSnMF
 L/7lrfhaGKyMVVWj7K6lc8Zlyqm0+uHu0x2qfobUTtGcEpF4BwW0+F52n
 LedUNWal+UA+lMjDHhrMj78SJhcyvSyyaSgdcTAtzdCBgDpLoCYyDEs90
 64Lwmv/4sDrcfuBJOPd2cS+4kAaLJLrXUzqjg4af4hzgwa+hpX3EOVNca
 v/w2fqv62loom7xe8wjTfQ8Cfn5VkfnQr0di+1VtcXgOQS+Pws7stk96X
 etTlZEUOdOnZQWVlNo9S+LCgW6C9SSX8xhHSCmciyz/ferh3akbUkJpYE g==;
X-CSE-ConnectionGUID: SIUJ0juWQmOODVyWs+RqAA==
X-CSE-MsgGUID: hWtl+110RpOUiMPc27WT8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39899315"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="39899315"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 04:11:43 -0800
X-CSE-ConnectionGUID: iOOkBSbiQB+QCJTd40GSbA==
X-CSE-MsgGUID: aWUBImtFQdahoVBpSxcsJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="112571965"
Received: from unknown (HELO tejas-super-server.iind.intel.com)
 ([10.190.239.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 04:11:40 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, vinay.belgaumkar@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V9] drm/xe/uapi: Use hint for guc to set GT frequency
Date: Wed, 12 Feb 2025 17:48:14 +0530
Message-Id: <20250212121814.9947-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
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

Allow user to provide a low latency hint. When set, KMD sends a hint
to GuC which results in special handling for that process. SLPC will
ramp the GT frequency aggressively every time it switches to this
process.

We need to enable the use of SLPC Compute strategy during init, but
it will apply only to processes that set this bit during process
creation.

Improvement with this approach as below:

Before,

:~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
Platform: Intel(R) OpenCL Graphics
  Device: Intel(R) Graphics [0xe20b]
    Driver version  : 24.52.0 (Linux x64)
    Compute units   : 160
    Clock frequency : 2850 MHz
    Kernel launch latency : 283.16 us

After,

:~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
Platform: Intel(R) OpenCL Graphics
  Device: Intel(R) Graphics [0xe20b]
    Driver version  : 24.52.0 (Linux x64)
    Compute units   : 160
    Clock frequency : 2850 MHz

    Kernel launch latency : 63.38 us

UMD Compute PR : https://github.com/intel/compute-runtime/pull/794
UMD Mesa PR :  https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33214

v9(Vinay):
  - remove extra line, align commit message
v8(Vinay):
  - Add separate example for using low latency hint
v7(Jose):
  - Update UMD PR
  - applicable to all gpus
V6:
  - init flags, remove redundant flags check (MAuld)
V5:
  - Move uapi doc to documentation and GuC ABI specific change (Rodrigo)
  - Modify logic to restrict exec queue flags (MAuld)
V4:
  - To make it clear, dont use exec queue word (Vinay)
  - Correct typo in description of flag (Jose/Vinay)
  - rename set_strategy api and replace ctx with exec queue(Vinay)
  - Start with 0th bit to indentify user flags (Jose)
V3:
  - Conver user flag to kernel internal flag and use (Oak)
  - Support query config for use to check kernel support (Jose)
  - Dont need to take runtime pm (Vinay)
V2:
  - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 planned for other hint(Szymon)
  - Add motivation to description (Lucas)

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 Documentation/gpu/drm-uapi.rst                | 18 +++++++++++++++++
 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  3 +++
 drivers/gpu/drm/xe/xe_exec_queue.c            | 10 +++++++---
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |  2 ++
 drivers/gpu/drm/xe/xe_guc_pc.c                | 16 +++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c            |  8 ++++++++
 drivers/gpu/drm/xe/xe_query.c                 |  2 ++
 include/uapi/drm/xe_drm.h                     | 20 ++++++++++++++++++-
 8 files changed, 75 insertions(+), 4 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index b75cc9a70d1f..7337d1be45ef 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -583,3 +583,21 @@ dma-buf interoperability
 
 Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
 information on how dma-buf is integrated and exposed within DRM.
+
+Low latency hint by user
+========================
+
+Allow users to provide a hint to kernel for cases demanding low latency
+profile. Please note it will have impact on power consumption. User can
+indicate low latency hint with flag while creating exec queue as
+mentioned below,
+
+     struct drm_xe_exec_queue_create exec_queue_create = {
+          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT,
+          .extensions = 0,
+          .vm_id = vm,
+          .num_bb_per_exec = 1,
+          .num_eng_per_bb = 1,
+          .instances = to_user_pointer(&instance),
+     };
+     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
index 85abe4f09ae2..b28c8fa061f7 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
@@ -174,6 +174,9 @@ struct slpc_task_state_data {
 	};
 } __packed;
 
+#define SLPC_CTX_FREQ_REQ_IS_COMPUTE		REG_BIT(28)
+#define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
+
 struct slpc_shared_data_header {
 	/* Total size in bytes of this shared buffer. */
 	u32 size;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6051db78d706..f68b597f5270 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -605,11 +605,12 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_tile *tile;
 	struct xe_exec_queue *q = NULL;
 	u32 logical_mask;
+	u32 flags = 0;
 	u32 id;
 	u32 len;
 	int err;
 
-	if (XE_IOCTL_DBG(xe, args->flags) ||
+	if (XE_IOCTL_DBG(xe, args->flags & ~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
@@ -626,6 +627,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
 		return -EINVAL;
 
+	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
+		flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
+
 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
 		if (XE_IOCTL_DBG(xe, args->width != 1) ||
 		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
@@ -634,8 +638,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 
 		for_each_tile(tile, xe, id) {
 			struct xe_exec_queue *new;
-			u32 flags = EXEC_QUEUE_FLAG_VM;
 
+			flags |= EXEC_QUEUE_FLAG_VM;
 			if (id)
 				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
 
@@ -682,7 +686,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		}
 
 		q = xe_exec_queue_create(xe, vm, logical_mask,
-					 args->width, hwe, 0,
+					 args->width, hwe, flags,
 					 args->extensions);
 		up_read(&vm->lock);
 		xe_vm_put(vm);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 6eb7ff091534..cc1cffb5c87f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -85,6 +85,8 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
 /* kernel exec_queue only, set priority to highest level */
 #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
+/* flag to indicate low latency hint to guc */
+#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 02409eedb914..25040efa043f 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -995,6 +995,17 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
 	return ret;
 }
 
+static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val)
+{
+	int ret = 0;
+
+	ret = pc_action_set_param(pc,
+				  SLPC_PARAM_STRATEGIES,
+				  val);
+
+	return ret;
+}
+
 /**
  * xe_guc_pc_start - Start GuC's Power Conservation component
  * @pc: Xe_GuC_PC instance
@@ -1054,6 +1065,11 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	}
 
 	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
+	if (ret)
+		goto out;
+
+	/* Enable SLPC Optimized Strategy for compute */
+	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
 
 out:
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 913c74d6e2ae..f2ce3086838c 100644
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
+MAKE_EXEC_QUEUE_POLICY_ADD(slpc_exec_queue_freq_req, SLPM_GT_FREQUENCY)
 #undef MAKE_EXEC_QUEUE_POLICY_ADD
 
 static const int xe_exec_queue_prio_to_guc[] = {
@@ -414,14 +416,20 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
 	struct exec_queue_policy policy;
 	enum xe_exec_queue_priority prio = q->sched_props.priority;
 	u32 timeslice_us = q->sched_props.timeslice_us;
+	u32 slpc_exec_queue_freq_req = 0;
 	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
 
 	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
 
+	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
+		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
+
 	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
 	__guc_exec_queue_policy_add_priority(&policy, xe_exec_queue_prio_to_guc[prio]);
 	__guc_exec_queue_policy_add_execution_quantum(&policy, timeslice_us);
 	__guc_exec_queue_policy_add_preemption_timeout(&policy, preempt_timeout_us);
+	__guc_exec_queue_policy_add_slpc_exec_queue_freq_req(&policy,
+							     slpc_exec_queue_freq_req);
 
 	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
 		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 042f87a688e7..102923d3dc74 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -336,6 +336,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
+	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
+			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 892f54d3aa09..de2f3887d30b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -393,6 +393,8 @@ struct drm_xe_query_mem_regions {
  *
  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
  *      has usable VRAM
+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - Flag is set if the device
+ *      has low latency hint support
  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
  *    required by this device, typically SZ_4K or SZ_64K
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
@@ -409,6 +411,7 @@ struct drm_xe_query_config {
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
@@ -1204,6 +1207,20 @@ struct drm_xe_vm_bind {
  *     };
  *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
  *
+ *     Allow users to provide a hint to kernel for cases demanding low latency
+ *     profile. User can indicate low latency hint with flag while creating
+ *     exec queue as mentioned below,
+ *
+ *     struct drm_xe_exec_queue_create exec_queue_create = {
+ *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT,
+ *          .extensions = 0,
+ *          .vm_id = vm,
+ *          .num_bb_per_exec = 1,
+ *          .num_eng_per_bb = 1,
+ *          .instances = to_user_pointer(&instance),
+ *     };
+ *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
+ *
  */
 struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
@@ -1222,7 +1239,8 @@ struct drm_xe_exec_queue_create {
 	/** @vm_id: VM to use for this exec queue */
 	__u32 vm_id;
 
-	/** @flags: MBZ */
+#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
+	/** @flags: flags to use for this exec queue */
 	__u32 flags;
 
 	/** @exec_queue_id: Returned exec queue ID */
-- 
2.34.1

