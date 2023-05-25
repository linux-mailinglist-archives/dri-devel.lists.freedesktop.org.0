Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01739711226
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED2210E0BD;
	Thu, 25 May 2023 17:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B585010E49C;
 Thu, 25 May 2023 17:28:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXnOl4rO9b9MTN7PR2YWETlqChEOzHAewWBNcPu80H27BwEnX3slGahiyuC5IP8EF8umUKS1C4j4YCeTHAdERLGR0nIruXFq63Po+Gokxh2qmFebUGmqIyQbQfFigVB1ze1KFvA77YR1bgC5FLaQ8staiBj5xppxU66z8cbaiGj3DDsU/fax65YEJSOl0kJJpmWMolZf41DOVrL6Gz5hp/3bYTesW2Wo/fbCLI0316kKXn0GiwAMvyv+R/U/YeaGGSYzVRsGLCsCUHKsvGOFu9QPz26QpSz5QdIRJaNXlR4qVhvG3yWNWGUCCDUZlk88kIUyLYN1aS089KCwScrQTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0Rquvmh1j9yIcLEePFw3vEo0nKc0OqqsvQ+aGBRu7w=;
 b=nvDXj0KjGT6R5kXgvwTpH0m7N3sn8WY6Xb20asKwuc4byn4JEb8dX6vB8eVfj+zE1yPlKxgSajf26RcHt8NDssrrHRJjmx0CfoVOg8I/fOIJwOKAEus7Rr1gUPDH3Obb5Rkp0pXTntD/9k8jA0xWBT5xRDnYGDsTJyuHg+5SsOm4AIg3cb139wXwLNXUZiJGHiLgOvlPSc6jODu4s3Z1sh0yFDu2Xb1STvI0qRTHodA7PyUmyVKwRBeW/KtF73vgtEyilDlf2fBUwTxQvW9KI8ZecfqWuqiHeYTFbNQHdBFQFRP1oQpY4hwQjZh9QnHWdeOiqWqWKeMoneZwIpIPPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0Rquvmh1j9yIcLEePFw3vEo0nKc0OqqsvQ+aGBRu7w=;
 b=2KBuuL/nnw3kiT88uc+PI2ucKb4g4PBFo4TAtCEDwdJtfXtCpM7wgouDw/ooHVH1dXdNENYoRHswKBLnO0RElMmsV6h+L/ILWrlF+Tf5kWgz0aA/ANayGoc2xWrO4n2K2iUPWYYCBa+k8fAYrgebzVjJ7K37NaQBTfNiznRTog0=
Received: from MW4PR03CA0132.namprd03.prod.outlook.com (2603:10b6:303:8c::17)
 by LV3PR12MB9234.namprd12.prod.outlook.com (2603:10b6:408:1a0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 17:27:56 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::ad) by MW4PR03CA0132.outlook.office365.com
 (2603:10b6:303:8c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 17:27:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 17:27:56 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:27:54 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 03/33] drm/amdkfd: prepare per-process debug enable and disable
Date: Thu, 25 May 2023 13:27:15 -0400
Message-ID: <20230525172745.702700-3-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525172745.702700-1-jonathan.kim@amd.com>
References: <20230525172745.702700-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|LV3PR12MB9234:EE_
X-MS-Office365-Filtering-Correlation-Id: 63dfae44-9119-429a-94d7-08db5d45610b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xpp+NVjt2VbK47ViJ+AR+hHtvT1gzhdCU2JswaywvMp+B/zqjmdyYFuiBNWdcjQopWzhQv78lPtVd+zcJGEicdyDcLFBxSmIcYQolbxcdLTuWOpipLslXm92Ad1EU2+Aoq0FYzlEEooHqYeDFTnsdB3ThppwXfbrMP/B/5MwHCKbQF/2cQ6PFR+rU4VPAe6mJ3pmI3ivNcNd0BjTKhlCNTexfcnF/8iqCbtr/EF7sJ02SA1PhR7CRFnHBJeiru153nqp1amSt1Os9gKVztQkrNVfFvRuu9DaUwl8NHpDWR9Ezjavz3+H0WO+3VqDtIu7c5DxJnCFGs57Cp1cLWRtEEEcQCgC4kYm4CJxjWvlnznWPc23Nxm2ST58F+kU5SJgm564881YT1LKD1JumDYKkg7xarXOTf9laaQs1D3nys8nEF0U4WE6W3Jv9koLt2dg7b6z1gEY2YIAnH6NMV+ze1T/Cj1ZtPEaNptoj/SO92tyiYyLapHZbicp5GbA+tcH9ux0ju21sjryqTTBxJnVGiGOI9YY/xhTBwZmrfg9pUG+7f/beQnTZ1qswXdLx+0yoIx2d7uMzc3DMimR13U2ClnpdiIMNrUrOtoHPiMjdqu+wL+8ETN9IhARheBGTecYzXiWEutpCpVf746qeuCWHnZee21E/wtnq8apivuUtrue21W+ElkmU/CQNcm3D35Be61QxHNzLeD7GxUEagXedL8lWJ9ii/PfEHtZ8fEzMmaPQgMVvEZGQTwFu+zZc4IXBpzwoEoTwVqo4Qc70pNZgg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(110136005)(450100002)(82740400003)(356005)(81166007)(45080400002)(82310400005)(478600001)(70586007)(70206006)(4326008)(6636002)(66899021)(6666004)(41300700001)(47076005)(7696005)(83380400001)(36860700001)(316002)(40460700003)(336012)(2616005)(426003)(40480700001)(86362001)(8676002)(44832011)(5660300002)(8936002)(16526019)(36756003)(186003)(26005)(1076003)(30864003)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:27:56.3926 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63dfae44-9119-429a-94d7-08db5d45610b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9234
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
Cc: Jinhuieric.Huang@amd.com
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

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
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
index f4b50b74818e..7082d5d0f0e9 100644
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
 	/* filep now owns the reference returned by kfd_create_process */
 	filep->private_data = process;
 
@@ -2737,6 +2743,10 @@ static int kfd_ioctl_runtime_enable(struct file *filep, struct kfd_process *p, v
 static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_dbg_trap_args *args = data;
+	struct task_struct *thread = NULL;
+	struct mm_struct *mm = NULL;
+	struct pid *pid = NULL;
+	struct kfd_process *target = NULL;
 	int r = 0;
 
 	if (sched_policy == KFD_SCHED_POLICY_NO_HWS) {
@@ -2744,9 +2754,81 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
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
@@ -2760,7 +2842,7 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 	case KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO:
 	case KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT:
 	case KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT:
-		pr_warn("Debugging not supported yet\n");
+		pr_warn("Debug op %i not supported yet\n", args->op);
 		r = -EACCES;
 		break;
 	default:
@@ -2768,6 +2850,22 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
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
index 000000000000..898cc1fe3d13
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -0,0 +1,80 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
index 000000000000..a8abfe2a0a14
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -0,0 +1,32 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
index 493b4b66f180..0d58431a6658 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -1006,6 +1006,14 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
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
 
@@ -1127,13 +1135,10 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
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
@@ -1143,12 +1148,19 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
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
@@ -1171,9 +1183,11 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
 	if (!dqm->dev->kfd->shared_resources.enable_mes)
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
index 3bd222e8f6c3..1b272f879b4c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -920,11 +920,33 @@ struct kfd_process {
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
 
@@ -933,6 +955,10 @@ struct kfd_process {
 	atomic_t poison;
 	/* Queues are in paused stated because we are in the process of doing a CRIU checkpoint */
 	bool queues_paused;
+
+	/* Tracks runtime enable status */
+	struct kfd_runtime_info runtime_info;
+
 };
 
 #define KFD_PROCESS_TABLE_SIZE 5 /* bits: 32 entries */
@@ -963,7 +989,7 @@ bool kfd_dev_is_large_bar(struct kfd_node *dev);
 int kfd_process_create_wq(void);
 void kfd_process_destroy_wq(void);
 void kfd_cleanup_processes(void);
-struct kfd_process *kfd_create_process(struct file *filep);
+struct kfd_process *kfd_create_process(struct task_struct *thread);
 struct kfd_process *kfd_get_process(const struct task_struct *task);
 struct kfd_process *kfd_lookup_process_by_pasid(u32 pasid);
 struct kfd_process *kfd_lookup_process_by_mm(const struct mm_struct *mm);
@@ -1108,6 +1134,9 @@ void kfd_process_set_trap_handler(struct qcm_process_device *qpd,
 				  uint64_t tba_addr,
 				  uint64_t tma_addr);
 
+/* CWSR initialization */
+int kfd_process_init_cwsr_apu(struct kfd_process *process, struct file *filep);
+
 /* CRIU */
 /*
  * Need to increment KFD_CRIU_PRIV_VERSION each time a change is made to any of the CRIU private
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index c2c7d34fd46d..af0a4b5257cc 100644
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
@@ -833,10 +834,6 @@ struct kfd_process *kfd_create_process(struct file *filep)
 		if (IS_ERR(process))
 			goto out;
 
-		ret = kfd_process_init_cwsr_apu(process, filep);
-		if (ret)
-			goto out_destroy;
-
 		if (!procfs.kobj)
 			goto out;
 
@@ -870,16 +867,9 @@ struct kfd_process *kfd_create_process(struct file *filep)
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
@@ -1180,6 +1170,25 @@ static void kfd_process_notifier_release_internal(struct kfd_process *p)
 
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
@@ -1259,11 +1268,14 @@ void kfd_cleanup_processes(void)
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
 		struct kfd_node *dev = p->pdds[i]->dev;
 		struct qcm_process_device *qpd = &p->pdds[i]->qpd;
@@ -1292,6 +1304,8 @@ static int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep)
 			qpd->tba_addr, qpd->tma_addr, qpd->cwsr_kaddr);
 	}
 
+	p->has_cwsr = true;
+
 	return 0;
 }
 
@@ -1434,6 +1448,10 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	if (err)
 		goto err_event_init;
 	process->is_32bit_user_mode = in_compat_syscall();
+	process->debug_trap_enabled = false;
+	process->debugger_process = NULL;
+	process->exception_enable_mask = 0;
+	atomic_set(&process->debugged_process_count, 0);
 
 	process->pasid = kfd_pasid_alloc();
 	if (process->pasid == 0) {
@@ -1967,8 +1985,10 @@ static void restore_process_worker(struct work_struct *work)
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

