Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377706CAD6F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6EA10E6C0;
	Mon, 27 Mar 2023 18:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2080.outbound.protection.outlook.com [40.107.95.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A080410E385;
 Mon, 27 Mar 2023 18:43:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkGsYWWSXp4ikqfq/zOEmoXUoQaiDaZw8BxYAzddJ++HXOO/pklwghFJX1ntW5ox2+9dTxZkiXxAt1gQF0XsxfoxR78loAmYVSvb2BNTWUchbQp2yCMIHBM4qytJk4cBf7j+d/VJh7SPNhtyPF+YzXRMb/ialj9kkBOtKDD819Z6G6FXHlcjKZml8Bd1l9YHM8o9nNnPzSZjYJts+qswsJJuzgQm8y9HWzXhdvkmlBFH0qfwlmVt4vveSnOZJOnDY2tL+eVHNKjcOmB4ErNjhFfh9BmB16OeJ2g20z87Y4mYhYUBWWtH9Y91ZKByO4F4zVU0NJ4s6H+dUxO+gGRy1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzFc0VbGrICqXW26jaGFOp27ZAV6Mo/oUomKxTWQ1eM=;
 b=BB3Gc3o1N53tHSe1hBauBt+cnBNcguVh64rEH8XzURPaf9Wxe5GtVeiC5WrNbVCcSh+Fyi1yj85JI23GxOs0VU35NB0Aw1oWFlAqPA1ZV4XTxs601ls1DvjlDNp0n7Sz6yTwfZ8gPvele4BHjjwGgNr5/MxENQNUcW0JVN7t+67uUExzyEnk7xgywxD93F0xTzRE8BE4jO6/XWwHIlL6Uk+fxMX520DTLTtqf9ZLpxXB6Xh3dvOjXwS7EDkb+4z3BasPSC/t6hzP4ZYu2i5uvyJ+YR7/TynPsLcQapAavDSqn/HPfwAf9eoHJFbCR6Ot4muXyeVsqKfUMIVTyG3ung==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzFc0VbGrICqXW26jaGFOp27ZAV6Mo/oUomKxTWQ1eM=;
 b=qTLglDq1ebXuK0wnI4STRC+jBySQPCLT6Y/RL5RWB8pxkCSoX/X05lWOsaC/+1bDnPEP/3KuIB3pT9yM626pWBDD2drs1VvzIuEJLrqX06CzQDZhnO+n4fRLWL3okA3eun+9BkouTKnSCZFSMCuHstu2yjD+H/d5UBLwOPMuzC4=
Received: from CY8PR02CA0009.namprd02.prod.outlook.com (2603:10b6:930:4d::29)
 by BL0PR12MB4947.namprd12.prod.outlook.com (2603:10b6:208:17d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 18:43:50 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:4d:cafe::1) by CY8PR02CA0009.outlook.office365.com
 (2603:10b6:930:4d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.43 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:50 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:49 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 03/34] drm/amdkfd: prepare per-process debug enable and disable
Date: Mon, 27 Mar 2023 14:43:08 -0400
Message-ID: <20230327184339.125016-3-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327184339.125016-1-jonathan.kim@amd.com>
References: <20230327184339.125016-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|BL0PR12MB4947:EE_
X-MS-Office365-Filtering-Correlation-Id: 16102b61-bfb7-4739-e86e-08db2ef33537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Po5GXKpqIfQHamHzSimd8QisOKl1+qb3dEv3kfZSP9WQPUOOknM25aFywLhYxSmxEmJRj2ho0bFs2OjUaWqZPt17MY1xs+HsMeyCkLEmsDTCOw5kCwv0drZF/ywbra209LZq0Y+7ZLRt4ByU1jEZYmQWCG+4iC62lI6nk1BSGLtAcOxO1PCLEtAzK+GBD9stiXzjuTrrCuFKD3yuz5rsCAowSuYxH1MIW01Ee2EzOyiR8gsqESu87PdmYTlyBG8JOs7tuunLPcKVFmm5/hpcOrBdfJMZltA9/iGAP/4wnDs412b3GxXbWS9RPA1f1Avi3AwWrzxK/1U4yJuS4JOHGqE+tX7ESu8zlV2u7k3gkDuD1xHAb6ke/9ep/npPOeFmuPlEav2NO4jodF+SUEMYzhSdY9YHEHA4KkmaEHV2uu91DnKUFkgHBlydO9PXAv9n+Eti1FCM7eJh1htyqQlHWZf56mWwomT8+72MxqpXDgoNo4mhelba0uokFNlLtoOw/eNHKNAgW7xycseybFIA+vtL7iTPP7aEqVomEGiEzCMmWVazGi8R+lQ5z2l1He4idBCFIHlzNFRfaHLPvRHua+jLJmdpwGUIVRZAK0kY/FdHeJCVafaXen0OmhtmNUjQQ6R+zeybHDuPiGWgFxQqb3zgSN0ON87BKFlTERzltvjgm02VVO+pemcR2+pZFEwCUhtnyyrLOusuIOCw6+6YRW4ZvOQOnZteYr6th6G+HA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199021)(46966006)(40470700004)(36840700001)(16526019)(26005)(426003)(1076003)(40480700001)(41300700001)(186003)(6666004)(66899021)(7696005)(83380400001)(336012)(2616005)(47076005)(478600001)(54906003)(110136005)(316002)(36860700001)(45080400002)(40460700003)(4326008)(70206006)(450100002)(44832011)(2906002)(30864003)(70586007)(8676002)(81166007)(82740400003)(356005)(36756003)(82310400005)(86362001)(5660300002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:50.6750 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16102b61-bfb7-4739-e86e-08db2ef33537
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4947
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
Cc: Felix.Kuehling@amd.com, Jonathan.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ROCm debugger will attach to a process to debug by PTRACE and will
expect the KFD to prepare a process for the target PID, whether the
target PID has opened the KFD device or not.

This patch is to explicity handle this requirement.  Further HW mode
setting and runtime coordination requirements will be handled in
following patches.

In the case where the target process has not opened the KFD device,
a new KFD process must be created for the target PID.
The debugger as well as the target process for this case will have not
acquired any VMs so handle process restoration to correctly account for
this.

To coordinate with HSA runtime, the debugger must be aware of the target
process' runtime enablement status and will copy the runtime status
information into the debugged KFD process for later query.

On enablement, the debugger will subscribe to a set of exceptions where
each exception events will notify the debugger through a pollable FIFO
file descriptor that the debugger provides to the KFD to manage.

Finally on process termination of either the debugger or the target,
debugging must be disabled if it has not been done so.

v4: fix up removal of queue eviction counter reset.
move debug event worker to patch 17 where it's actually used.
fix ioctl disable and process termination disable race by having
ioctl disable check and get mm reference first.

v3: fix typo on debug trap disable and PTRACE ATTACH relax check.
remove unnecessary queue eviction counter reset when there's nothing
to evict.
change err code to EALREADY if attaching to an already attached process.
move debug disable to release worker to avoid race with disable from
ioctl call.

v2: relax debug trap disable and PTRACE ATTACH requirement.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/Makefile           |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 102 +++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c        |  80 ++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  32 ++++++
 .../drm/amd/amdkfd/kfd_device_queue_manager.c |  26 +++--
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  31 +++++-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  60 +++++++----
 7 files changed, 304 insertions(+), 30 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_debug.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_debug.h

diff --git a/drivers/gpu/drm/amd/amdkfd/Makefile b/drivers/gpu/drm/amd/amdkfd/Makefile
index e758c2a24cd0..747754428073 100644
--- a/drivers/gpu/drm/amd/amdkfd/Makefile
+++ b/drivers/gpu/drm/amd/amdkfd/Makefile
@@ -55,7 +55,8 @@ AMDKFD_FILES	:= $(AMDKFD_PATH)/kfd_module.o \
 		$(AMDKFD_PATH)/kfd_int_process_v9.o \
 		$(AMDKFD_PATH)/kfd_int_process_v11.o \
 		$(AMDKFD_PATH)/kfd_smi_events.o \
-		$(AMDKFD_PATH)/kfd_crat.o
+		$(AMDKFD_PATH)/kfd_crat.o \
+		$(AMDKFD_PATH)/kfd_debug.o
 
 ifneq ($(CONFIG_AMD_IOMMU_V2),)
 AMDKFD_FILES += $(AMDKFD_PATH)/kfd_iommu.o
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 13a630391a6a..58c08d8a191f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -44,6 +44,7 @@
 #include "amdgpu_amdkfd.h"
 #include "kfd_smi_events.h"
 #include "amdgpu_dma_buf.h"
+#include "kfd_debug.h"
 
 static long kfd_ioctl(struct file *, unsigned int, unsigned long);
 static int kfd_open(struct inode *, struct file *);
@@ -142,10 +143,15 @@ static int kfd_open(struct inode *inode, struct file *filep)
 		return -EPERM;
 	}
 
-	process = kfd_create_process(filep);
+	process = kfd_create_process(current);
 	if (IS_ERR(process))
 		return PTR_ERR(process);
 
+	if (kfd_process_init_cwsr_apu(process, filep)) {
+		kfd_unref_process(process);
+		return -EFAULT;
+	}
+
 	if (kfd_is_locked()) {
 		dev_dbg(kfd_device, "kfd is locked!\n"
 				"process %d unreferenced", process->pasid);
@@ -2723,6 +2729,10 @@ static int kfd_ioctl_runtime_enable(struct file *filep, struct kfd_process *p, v
 static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_dbg_trap_args *args = data;
+	struct task_struct *thread = NULL;
+	struct mm_struct *mm = NULL;
+	struct pid *pid = NULL;
+	struct kfd_process *target = NULL;
 	int r = 0;
 
 	if (sched_policy == KFD_SCHED_POLICY_NO_HWS) {
@@ -2730,9 +2740,81 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 		return -EINVAL;
 	}
 
+	pid = find_get_pid(args->pid);
+	if (!pid) {
+		pr_debug("Cannot find pid info for %i\n", args->pid);
+		r = -ESRCH;
+		goto out;
+	}
+
+	thread = get_pid_task(pid, PIDTYPE_PID);
+	if (!thread) {
+		r = -ESRCH;
+		goto out;
+	}
+
+	mm = get_task_mm(thread);
+	if (!mm) {
+		r = -ESRCH;
+		goto out;
+	}
+
+	if (args->op == KFD_IOC_DBG_TRAP_ENABLE) {
+		bool create_process;
+
+		rcu_read_lock();
+		create_process = thread && thread != current && ptrace_parent(thread) == current;
+		rcu_read_unlock();
+
+		target = create_process ? kfd_create_process(thread) :
+					kfd_lookup_process_by_pid(pid);
+	} else {
+		target = kfd_lookup_process_by_pid(pid);
+	}
+
+	if (!target) {
+		pr_debug("Cannot find process PID %i to debug\n", args->pid);
+		r = -ESRCH;
+		goto out;
+	}
+
+	/* Check if target is still PTRACED. */
+	rcu_read_lock();
+	if (target != p && args->op != KFD_IOC_DBG_TRAP_DISABLE
+				&& ptrace_parent(target->lead_thread) != current) {
+		pr_err("PID %i is not PTRACED and cannot be debugged\n", args->pid);
+		r = -EPERM;
+	}
+	rcu_read_unlock();
+
+	if (r)
+		goto out;
+
+	mutex_lock(&target->mutex);
+
+	if (args->op != KFD_IOC_DBG_TRAP_ENABLE && !target->debug_trap_enabled) {
+		pr_err("PID %i not debug enabled for op %i\n", args->pid, args->op);
+		r = -EINVAL;
+		goto unlock_out;
+	}
+
 	switch (args->op) {
 	case KFD_IOC_DBG_TRAP_ENABLE:
+		if (target != p)
+			target->debugger_process = p;
+
+		r = kfd_dbg_trap_enable(target,
+					args->enable.dbg_fd,
+					(void __user *)args->enable.rinfo_ptr,
+					&args->enable.rinfo_size);
+		if (!r)
+			target->exception_enable_mask = args->enable.exception_mask;
+
+		pr_warn("Debug functions limited\n");
+		break;
 	case KFD_IOC_DBG_TRAP_DISABLE:
+		r = kfd_dbg_trap_disable(target);
+		break;
 	case KFD_IOC_DBG_TRAP_SEND_RUNTIME_EVENT:
 	case KFD_IOC_DBG_TRAP_SET_EXCEPTIONS_ENABLED:
 	case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_OVERRIDE:
@@ -2746,7 +2828,7 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 	case KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO:
 	case KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT:
 	case KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT:
-		pr_warn("Debugging not supported yet\n");
+		pr_warn("Debug op %i not supported yet\n", args->op);
 		r = -EACCES;
 		break;
 	default:
@@ -2754,6 +2836,22 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 		r = -EINVAL;
 	}
 
+unlock_out:
+	mutex_unlock(&target->mutex);
+
+out:
+	if (thread)
+		put_task_struct(thread);
+
+	if (mm)
+		mmput(mm);
+
+	if (pid)
+		put_pid(pid);
+
+	if (target)
+		kfd_unref_process(target);
+
 	return r;
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
new file mode 100644
index 000000000000..2bf2aa21eccc
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -0,0 +1,80 @@
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "kfd_debug.h"
+#include <linux/file.h>
+
+int kfd_dbg_trap_disable(struct kfd_process *target)
+{
+	if (!target->debug_trap_enabled)
+		return 0;
+
+	fput(target->dbg_ev_file);
+	target->dbg_ev_file = NULL;
+
+	if (target->debugger_process) {
+		atomic_dec(&target->debugger_process->debugged_process_count);
+		target->debugger_process = NULL;
+	}
+
+	target->debug_trap_enabled = false;
+	kfd_unref_process(target);
+
+	return 0;
+}
+
+int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
+			void __user *runtime_info, uint32_t *runtime_size)
+{
+	struct file *f;
+	uint32_t copy_size;
+	int r = 0;
+
+	if (target->debug_trap_enabled)
+		return -EALREADY;
+
+	copy_size = min((size_t)(*runtime_size), sizeof(target->runtime_info));
+
+	f = fget(fd);
+	if (!f) {
+		pr_err("Failed to get file for (%i)\n", fd);
+		return -EBADF;
+	}
+
+	target->dbg_ev_file = f;
+
+	/* We already hold the process reference but hold another one for the
+	 * debug session.
+	 */
+	kref_get(&target->ref);
+	target->debug_trap_enabled = true;
+
+	if (target->debugger_process)
+		atomic_inc(&target->debugger_process->debugged_process_count);
+
+	if (copy_to_user(runtime_info, (void *)&target->runtime_info, copy_size))
+		r = -EFAULT;
+
+	*runtime_size = sizeof(target->runtime_info);
+
+	return r;
+}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
new file mode 100644
index 000000000000..a33825f9caf7
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -0,0 +1,32 @@
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef KFD_DEBUG_EVENTS_H_INCLUDED
+#define KFD_DEBUG_EVENTS_H_INCLUDED
+
+#include "kfd_priv.h"
+
+int kfd_dbg_trap_disable(struct kfd_process *target);
+int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
+			void __user *runtime_info,
+			uint32_t *runtime_info_size);
+#endif
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 7a95698d83f7..bf3fe7db76f3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -979,6 +979,14 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
 		goto out;
 
 	pdd = qpd_to_pdd(qpd);
+
+	/* The debugger creates processes that temporarily have not acquired
+	 * all VMs for all devices and has no VMs itself.
+	 * Skip queue eviction on process eviction.
+	 */
+	if (!pdd->drm_priv)
+		goto out;
+
 	pr_debug_ratelimited("Evicting PASID 0x%x queues\n",
 			    pdd->process->pasid);
 
@@ -1100,13 +1108,10 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
 {
 	struct queue *q;
 	struct kfd_process_device *pdd;
-	uint64_t pd_base;
 	uint64_t eviction_duration;
 	int retval = 0;
 
 	pdd = qpd_to_pdd(qpd);
-	/* Retrieve PD base */
-	pd_base = amdgpu_amdkfd_gpuvm_get_process_page_dir(pdd->drm_priv);
 
 	dqm_lock(dqm);
 	if (WARN_ON_ONCE(!qpd->evicted)) /* already restored, do nothing */
@@ -1116,12 +1121,19 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
 		goto out;
 	}
 
+	/* The debugger creates processes that temporarily have not acquired
+	 * all VMs for all devices and has no VMs itself.
+	 * Skip queue restore on process restore.
+	 */
+	if (!pdd->drm_priv)
+		goto vm_not_acquired;
+
 	pr_debug_ratelimited("Restoring PASID 0x%x queues\n",
 			    pdd->process->pasid);
 
 	/* Update PD Base in QPD */
-	qpd->page_table_base = pd_base;
-	pr_debug("Updated PD address to 0x%llx\n", pd_base);
+	qpd->page_table_base = amdgpu_amdkfd_gpuvm_get_process_page_dir(pdd->drm_priv);
+	pr_debug("Updated PD address to 0x%llx\n", qpd->page_table_base);
 
 	/* activate all active queues on the qpd */
 	list_for_each_entry(q, &qpd->queues_list, list) {
@@ -1144,9 +1156,11 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
 	if (!dqm->dev->shared_resources.enable_mes)
 		retval = execute_queues_cpsch(dqm,
 					      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
-	qpd->evicted = 0;
+
 	eviction_duration = get_jiffies_64() - pdd->last_evict_timestamp;
 	atomic64_add(eviction_duration, &pdd->evict_duration_counter);
+vm_not_acquired:
+	qpd->evicted = 0;
 out:
 	dqm_unlock(dqm);
 	return retval;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 7e4d992e48b3..a34b000f1d25 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -886,11 +886,33 @@ struct kfd_process {
 	 */
 	unsigned long last_restore_timestamp;
 
+	/* Indicates device process is debug attached with reserved vmid. */
+	bool debug_trap_enabled;
+
+	/* per-process-per device debug event fd file */
+	struct file *dbg_ev_file;
+
+	/* If the process is a kfd debugger, we need to know so we can clean
+	 * up at exit time.  If a process enables debugging on itself, it does
+	 * its own clean-up, so we don't set the flag here.  We track this by
+	 * counting the number of processes this process is debugging.
+	 */
+	atomic_t debugged_process_count;
+
+	/* If the process is a debugged, this is the debugger process */
+	struct kfd_process *debugger_process;
+
 	/* Kobj for our procfs */
 	struct kobject *kobj;
 	struct kobject *kobj_queues;
 	struct attribute attr_pasid;
 
+	/* Keep track cwsr init */
+	bool has_cwsr;
+
+	/* Exception code enable mask and status */
+	uint64_t exception_enable_mask;
+
 	/* shared virtual memory registered by this process */
 	struct svm_range_list svms;
 
@@ -899,6 +921,10 @@ struct kfd_process {
 	atomic_t poison;
 	/* Queues are in paused stated because we are in the process of doing a CRIU checkpoint */
 	bool queues_paused;
+
+	/* Tracks runtime enable status */
+	struct kfd_runtime_info runtime_info;
+
 };
 
 #define KFD_PROCESS_TABLE_SIZE 5 /* bits: 32 entries */
@@ -929,7 +955,7 @@ bool kfd_dev_is_large_bar(struct kfd_dev *dev);
 int kfd_process_create_wq(void);
 void kfd_process_destroy_wq(void);
 void kfd_cleanup_processes(void);
-struct kfd_process *kfd_create_process(struct file *filep);
+struct kfd_process *kfd_create_process(struct task_struct *thread);
 struct kfd_process *kfd_get_process(const struct task_struct *task);
 struct kfd_process *kfd_lookup_process_by_pasid(u32 pasid);
 struct kfd_process *kfd_lookup_process_by_mm(const struct mm_struct *mm);
@@ -1056,6 +1082,9 @@ void kfd_process_set_trap_handler(struct qcm_process_device *qpd,
 				  uint64_t tba_addr,
 				  uint64_t tma_addr);
 
+/* CWSR initialization */
+int kfd_process_init_cwsr_apu(struct kfd_process *process, struct file *filep);
+
 /* CRIU */
 /*
  * Need to increment KFD_CRIU_PRIV_VERSION each time a change is made to any of the CRIU private
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 95cc63d9f578..1e3795e7e18d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -44,6 +44,7 @@ struct mm_struct;
 #include "kfd_iommu.h"
 #include "kfd_svm.h"
 #include "kfd_smi_events.h"
+#include "kfd_debug.h"
 
 /*
  * List of struct kfd_process (field kfd_process).
@@ -69,7 +70,6 @@ static struct kfd_process *find_process(const struct task_struct *thread,
 					bool ref);
 static void kfd_process_ref_release(struct kref *ref);
 static struct kfd_process *create_process(const struct task_struct *thread);
-static int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep);
 
 static void evict_process_worker(struct work_struct *work);
 static void restore_process_worker(struct work_struct *work);
@@ -798,18 +798,19 @@ static void kfd_process_device_destroy_ib_mem(struct kfd_process_device *pdd)
 	kfd_process_free_gpuvm(qpd->ib_mem, pdd, &qpd->ib_kaddr);
 }
 
-struct kfd_process *kfd_create_process(struct file *filep)
+struct kfd_process *kfd_create_process(struct task_struct *thread)
 {
 	struct kfd_process *process;
-	struct task_struct *thread = current;
 	int ret;
 
-	if (!thread->mm)
+	if (!(thread->mm && mmget_not_zero(thread->mm)))
 		return ERR_PTR(-EINVAL);
 
 	/* Only the pthreads threading model is supported. */
-	if (thread->group_leader->mm != thread->mm)
+	if (thread->group_leader->mm != thread->mm) {
+		mmput(thread->mm);
 		return ERR_PTR(-EINVAL);
+	}
 
 	/*
 	 * take kfd processes mutex before starting of process creation
@@ -827,10 +828,6 @@ struct kfd_process *kfd_create_process(struct file *filep)
 		if (IS_ERR(process))
 			goto out;
 
-		ret = kfd_process_init_cwsr_apu(process, filep);
-		if (ret)
-			goto out_destroy;
-
 		if (!procfs.kobj)
 			goto out;
 
@@ -864,16 +861,9 @@ struct kfd_process *kfd_create_process(struct file *filep)
 	if (!IS_ERR(process))
 		kref_get(&process->ref);
 	mutex_unlock(&kfd_processes_mutex);
+	mmput(thread->mm);
 
 	return process;
-
-out_destroy:
-	hash_del_rcu(&process->kfd_processes);
-	mutex_unlock(&kfd_processes_mutex);
-	synchronize_srcu(&kfd_processes_srcu);
-	/* kfd_process_free_notifier will trigger the cleanup */
-	mmu_notifier_put(&process->mmu_notifier);
-	return ERR_PTR(ret);
 }
 
 struct kfd_process *kfd_get_process(const struct task_struct *thread)
@@ -1174,6 +1164,25 @@ static void kfd_process_notifier_release_internal(struct kfd_process *p)
 
 	/* Indicate to other users that MM is no longer valid */
 	p->mm = NULL;
+	kfd_dbg_trap_disable(p);
+
+	if (atomic_read(&p->debugged_process_count) > 0) {
+		struct kfd_process *target;
+		unsigned int temp;
+		int idx = srcu_read_lock(&kfd_processes_srcu);
+
+		hash_for_each_rcu(kfd_processes_table, temp, target, kfd_processes) {
+			if (target->debugger_process && target->debugger_process == p) {
+				mutex_lock_nested(&target->mutex, 1);
+				kfd_dbg_trap_disable(target);
+				mutex_unlock(&target->mutex);
+				if (atomic_read(&p->debugged_process_count) == 0)
+					break;
+			}
+		}
+
+		srcu_read_unlock(&kfd_processes_srcu, idx);
+	}
 
 	mmu_notifier_put(&p->mmu_notifier);
 }
@@ -1253,11 +1262,14 @@ void kfd_cleanup_processes(void)
 	mmu_notifier_synchronize();
 }
 
-static int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep)
+int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep)
 {
 	unsigned long  offset;
 	int i;
 
+	if (p->has_cwsr)
+		return 0;
+
 	for (i = 0; i < p->n_pdds; i++) {
 		struct kfd_dev *dev = p->pdds[i]->dev;
 		struct qcm_process_device *qpd = &p->pdds[i]->qpd;
@@ -1286,6 +1298,8 @@ static int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep)
 			qpd->tba_addr, qpd->tma_addr, qpd->cwsr_kaddr);
 	}
 
+	p->has_cwsr = true;
+
 	return 0;
 }
 
@@ -1428,6 +1442,10 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	if (err)
 		goto err_event_init;
 	process->is_32bit_user_mode = in_compat_syscall();
+	process->debug_trap_enabled = false;
+	process->debugger_process = NULL;
+	process->exception_enable_mask = 0;
+	atomic_set(&process->debugged_process_count, 0);
 
 	process->pasid = kfd_pasid_alloc();
 	if (process->pasid == 0) {
@@ -1961,8 +1979,10 @@ static void restore_process_worker(struct work_struct *work)
 	 */
 
 	p->last_restore_timestamp = get_jiffies_64();
-	ret = amdgpu_amdkfd_gpuvm_restore_process_bos(p->kgd_process_info,
-						     &p->ef);
+	/* VMs may not have been acquired yet during debugging. */
+	if (p->kgd_process_info)
+		ret = amdgpu_amdkfd_gpuvm_restore_process_bos(p->kgd_process_info,
+							     &p->ef);
 	if (ret) {
 		pr_debug("Failed to restore BOs of pasid 0x%x, retry after %d ms\n",
 			 p->pasid, PROCESS_BACK_OFF_TIME_MS);
-- 
2.25.1

