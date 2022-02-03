Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26964A8110
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E2810EB19;
	Thu,  3 Feb 2022 09:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC2410EA48;
 Thu,  3 Feb 2022 09:09:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlPIpwVVqJlcrjiYyGxNm44LimqFfdB9hI5TrSXjopXPtII+h8G8URZVXvjnJJZCl1swg4Zgptgn7vP/bmikIuOkxw1klBn6a6FKm7dEMvdnwQnKs9HkVWtu/+pi33IrmfYOz8YbcLcGIWQbKMUYYVn5gIJVgr4Rh52SsMlHkhwJgmVce9XYFZJUud69CJyy79lGC+kDdnS6NEd/maSGlIzjf3n7cWeHh3GxOn54H/VdMHt27e2a41hWbQy6P1aqosmeO9/0+S69H18I05J4fUHkFCjPOWWTRhAGXAhoXDE/EObukaWvVZ20D1TUQGAOKOKvQ15lMWu1JXDgvp27Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVJNpG0VpziNfTKmnPEqXYMLShYGGEIraZ+gBSYdgCM=;
 b=gtsS6XIKc1pzaj+sKOK/rGTmc5xJVx5Jy/bo9/ZIrYgXGDdIoRIei0DloU+JOF50ML36+XYE/u/71BUa8FXjaGzrAcqwIlOpNt2Lvfj8pzYGZzyygfOqzb02ddjEwCqaOXUNVZK4sX6OpiQzoMAGguF+8i+9Rb7eGzSiVpIEkQ6GCf2hUjIQl3jrhnfwMxYoFAAm5ijtaLsZYxy98CbvhTFVXmOdtbVHtfHMl+eQmAA8EuG5MNS2ueVdv//GA+5rlkQ3fkb53CtJBC3YM7X/uoWF4kl6uJy1xJmu6Fk8PukScmXnMhAgx2ZlCmwIr4b7cI0ZZPsiEIEmv3PHXXFukg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVJNpG0VpziNfTKmnPEqXYMLShYGGEIraZ+gBSYdgCM=;
 b=dWrZ0uTiRsWvKmwRxdXCnk7vLQVK7v7lBNbHB8aCtwwRvBQ08JnuihF+p0dMUVJt132Pa8ddRWF2WK/YnVSny8T8mssSCUqdwWkpD4trsp1xZonZSKQku0Xj7RTcFFjVk8djY+6QUrj9PAHVXM5Er/gJRxwZIiTBC25Awis2/Hk=
Received: from BN9PR03CA0384.namprd03.prod.outlook.com (2603:10b6:408:f7::29)
 by MWHPR1201MB2542.namprd12.prod.outlook.com (2603:10b6:300:e8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 09:09:35 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::e) by BN9PR03CA0384.outlook.office365.com
 (2603:10b6:408:f7::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 09:09:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:35 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:33 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 02/24] drm/amdkfd: CRIU Introduce Checkpoint-Restore APIs
Date: Thu, 3 Feb 2022 04:08:56 -0500
Message-ID: <20220203090918.11520-3-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
References: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ada1f4d-403f-4c59-9cf0-08d9e6f4e5de
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2542:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2542EA4AB99DF7AE9E50ADF7FE289@MWHPR1201MB2542.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ypW6tJE/gptD5j7tCjQZdIbNo5vdXYSbpK6ZzrRhUwpi/+KneZR/pm4ZgA5dhs3Xk17ykTxmf4ZvY3M+oVDvm66sokg298OZQnVkkyM89b8gLdRJMJvPnN8+yeuJ5p1WlG/LpUyemkwajv0/5JYPdPmeYmx/KANZuzkCsivP68MOtl7yWfOZgsXPq5suCju0HR1e3RmoZvwtbuVfRpzkPzVb/HHeHu4/S2ZNHWCdCJfXq1MnI7GbSM3vOSlHuLBG0viG1+7BO/I/oWRnZSSBMCijplCByzDEs3W0/qHJf4jBuNlxxAwOWIRuyIokYk5bvxW1Y/yRFQeOqyrSPXpomMeWJ87ttptvNJKGkWHxqxGfd2LBba6lJk4ghCI/f1Rz17+LzFCdL7WQ7N76DACpA1R8jRG3lSZwhg5ZBQrSVk9iTunm47D1xeDzAg++Xi95FoURoYMCubrg+8S86h+mxLDSl91oZ7MUhxU5OxobR08FvZuOrmVca/nL0G2AqGunYXiOOcTG83fz7VlxSXsvJvtx4r7fheaC4IxatlKaqYs7VR3MmJxkidvs8zK56gOlkocZYq/AvMSzlGAKqtRow5sVEdvdPeIZRwgQRwj3S0AQKEGUQlsA2zobnEpOTbWXJryYL0YAB6Iz01ELlKmrv8UMCO8LDj+1vewRDWlqsHH73fAq3mlPz8K+83BgsYWf8sNsPnQLlvd5E0l84szXqw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(7696005)(6666004)(2616005)(1076003)(450100002)(16526019)(336012)(186003)(26005)(426003)(316002)(6916009)(82310400004)(81166007)(356005)(54906003)(86362001)(508600001)(2906002)(40460700003)(30864003)(44832011)(5660300002)(8676002)(4326008)(8936002)(36860700001)(83380400001)(47076005)(70206006)(70586007)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:35.1834 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ada1f4d-403f-4c59-9cf0-08d9e6f4e5de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2542
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
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com, david.yatsin@amd.com,
 Rajneesh
 Bhardwaj <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Checkpoint-Restore in userspace (CRIU) is a powerful tool that can
snapshot a running process and later restore it on same or a remote
machine but expects the processes that have a device file (e.g. GPU)
associated with them, provide necessary driver support to assist CRIU
and its extensible plugin interface. Thus, In order to support the
Checkpoint-Restore of any ROCm process, the AMD Radeon Open Compute
Kernel driver, needs to provide a set of new APIs that provide
necessary VRAM metadata and its contents to a userspace component
(CRIU plugin) that can store it in form of image files.

This introduces some new ioctls which will be used to checkpoint-Restore
any KFD bound user process. KFD only allows ioctl calls from the same
process that opened the KFD file descriptor. Since these ioctls are
expected to be called from a KFD criu plugin which has elevated ptrace
attached privileges and CAP_CHECKPOINT_RESTORE capabilities attached with
the file descriptors so modify KFD to allow such calls.

(API redesigned by David Yat Sin)
Suggested-by: Felix Kuehling <felix.kuehling@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 98 +++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    | 65 +++++++++++++++-
 include/uapi/linux/kfd_ioctl.h           | 81 +++++++++++++++++++-
 3 files changed, 241 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 214a2c67fba4..90e6d9e335a5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -33,6 +33,7 @@
 #include <linux/time.h>
 #include <linux/mm.h>
 #include <linux/mman.h>
+#include <linux/ptrace.h>
 #include <linux/dma-buf.h>
 #include <asm/processor.h>
 #include "kfd_priv.h"
@@ -1859,6 +1860,75 @@ static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
 }
 #endif
 
+static int criu_checkpoint(struct file *filep,
+			   struct kfd_process *p,
+			   struct kfd_ioctl_criu_args *args)
+{
+	return 0;
+}
+
+static int criu_restore(struct file *filep,
+			struct kfd_process *p,
+			struct kfd_ioctl_criu_args *args)
+{
+	return 0;
+}
+
+static int criu_unpause(struct file *filep,
+			struct kfd_process *p,
+			struct kfd_ioctl_criu_args *args)
+{
+	return 0;
+}
+
+static int criu_resume(struct file *filep,
+			struct kfd_process *p,
+			struct kfd_ioctl_criu_args *args)
+{
+	return 0;
+}
+
+static int criu_process_info(struct file *filep,
+				struct kfd_process *p,
+				struct kfd_ioctl_criu_args *args)
+{
+	return 0;
+}
+
+static int kfd_ioctl_criu(struct file *filep, struct kfd_process *p, void *data)
+{
+	struct kfd_ioctl_criu_args *args = data;
+	int ret;
+
+	dev_dbg(kfd_device, "CRIU operation: %d\n", args->op);
+	switch (args->op) {
+	case KFD_CRIU_OP_PROCESS_INFO:
+		ret = criu_process_info(filep, p, args);
+		break;
+	case KFD_CRIU_OP_CHECKPOINT:
+		ret = criu_checkpoint(filep, p, args);
+		break;
+	case KFD_CRIU_OP_UNPAUSE:
+		ret = criu_unpause(filep, p, args);
+		break;
+	case KFD_CRIU_OP_RESTORE:
+		ret = criu_restore(filep, p, args);
+		break;
+	case KFD_CRIU_OP_RESUME:
+		ret = criu_resume(filep, p, args);
+		break;
+	default:
+		dev_dbg(kfd_device, "Unsupported CRIU operation:%d\n", args->op);
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret)
+		dev_dbg(kfd_device, "CRIU operation:%d err:%d\n", args->op, ret);
+
+	return ret;
+}
+
 #define AMDKFD_IOCTL_DEF(ioctl, _func, _flags) \
 	[_IOC_NR(ioctl)] = {.cmd = ioctl, .func = _func, .flags = _flags, \
 			    .cmd_drv = 0, .name = #ioctl}
@@ -1962,6 +2032,10 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
 
 	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SET_XNACK_MODE,
 			kfd_ioctl_set_xnack_mode, 0),
+
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_CRIU_OP,
+			kfd_ioctl_criu, KFD_IOC_FLAG_CHECKPOINT_RESTORE),
+
 };
 
 #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
@@ -1976,6 +2050,7 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	char *kdata = NULL;
 	unsigned int usize, asize;
 	int retcode = -EINVAL;
+	bool ptrace_attached = false;
 
 	if (nr >= AMDKFD_CORE_IOCTL_COUNT)
 		goto err_i1;
@@ -2001,7 +2076,15 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	 * processes need to create their own KFD device context.
 	 */
 	process = filep->private_data;
-	if (process->lead_thread != current->group_leader) {
+
+	rcu_read_lock();
+	if ((ioctl->flags & KFD_IOC_FLAG_CHECKPOINT_RESTORE) &&
+	    ptrace_parent(process->lead_thread) == current)
+		ptrace_attached = true;
+	rcu_read_unlock();
+
+	if (process->lead_thread != current->group_leader
+	    && !ptrace_attached) {
 		dev_dbg(kfd_device, "Using KFD FD in wrong process\n");
 		retcode = -EBADF;
 		goto err_i1;
@@ -2016,6 +2099,19 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 		goto err_i1;
 	}
 
+	/*
+	 * Versions of docker shipped in Ubuntu 18.xx and 20.xx do not support
+	 * CAP_CHECKPOINT_RESTORE, so we also allow access if CAP_SYS_ADMIN as CAP_SYS_ADMIN is a
+	 * more priviledged access.
+	 */
+	if (unlikely(ioctl->flags & KFD_IOC_FLAG_CHECKPOINT_RESTORE)) {
+		if (!capable(CAP_CHECKPOINT_RESTORE) &&
+						!capable(CAP_SYS_ADMIN)) {
+			retcode = -EACCES;
+			goto err_i1;
+		}
+	}
+
 	if (cmd & (IOC_IN | IOC_OUT)) {
 		if (asize <= sizeof(stack_kdata)) {
 			kdata = stack_kdata;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index ea68f3b3a4e9..f928878196ef 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -121,7 +121,26 @@
  */
 #define KFD_QUEUE_DOORBELL_MIRROR_OFFSET 512
 
-
+/**
+ * enum kfd_ioctl_flags - KFD ioctl flags
+ * Various flags that can be set in &amdkfd_ioctl_desc.flags to control how
+ * userspace can use a given ioctl.
+ */
+enum kfd_ioctl_flags {
+	/*
+	 * @KFD_IOC_FLAG_CHECKPOINT_RESTORE:
+	 * Certain KFD ioctls such as AMDKFD_IOC_CRIU_OP can potentially
+	 * perform privileged operations and load arbitrary data into MQDs and
+	 * eventually HQD registers when the queue is mapped by HWS. In order to
+	 * prevent this we should perform additional security checks.
+	 *
+	 * This is equivalent to callers with the CHECKPOINT_RESTORE capability.
+	 *
+	 * Note: Since earlier versions of docker do not support CHECKPOINT_RESTORE,
+	 * we also allow ioctls with SYS_ADMIN capability.
+	 */
+	KFD_IOC_FLAG_CHECKPOINT_RESTORE = BIT(0),
+};
 /*
  * Kernel module parameter to specify maximum number of supported queues per
  * device
@@ -1006,6 +1025,50 @@ void kfd_process_set_trap_handler(struct qcm_process_device *qpd,
 				  uint64_t tba_addr,
 				  uint64_t tma_addr);
 
+/* CRIU */
+/*
+ * Need to increment KFD_CRIU_PRIV_VERSION each time a change is made to any of the CRIU private
+ * structures:
+ * kfd_criu_process_priv_data
+ * kfd_criu_device_priv_data
+ * kfd_criu_bo_priv_data
+ * kfd_criu_queue_priv_data
+ * kfd_criu_event_priv_data
+ * kfd_criu_svm_range_priv_data
+ */
+
+#define KFD_CRIU_PRIV_VERSION 1
+
+struct kfd_criu_process_priv_data {
+	uint32_t version;
+};
+
+struct kfd_criu_device_priv_data {
+	/* For future use */
+	uint64_t reserved;
+};
+
+struct kfd_criu_bo_priv_data {
+	uint64_t reserved;
+};
+
+struct kfd_criu_svm_range_priv_data {
+	uint32_t object_type;
+	uint32_t reserved;
+};
+
+struct kfd_criu_queue_priv_data {
+	uint32_t object_type;
+	uint32_t reserved;
+};
+
+struct kfd_criu_event_priv_data {
+	uint32_t object_type;
+	uint32_t reserved;
+};
+
+/* CRIU - End */
+
 /* Queue Context Management */
 int init_queue(struct queue **q, const struct queue_properties *properties);
 void uninit_queue(struct queue *q);
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index af96af174dc4..49429a6c42fc 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -468,6 +468,82 @@ struct kfd_ioctl_smi_events_args {
 	__u32 anon_fd;	/* from KFD */
 };
 
+/**************************************************************************************************
+ * CRIU IOCTLs (Checkpoint Restore In Userspace)
+ *
+ * When checkpointing a process, the userspace application will perform:
+ * 1. PROCESS_INFO op to determine current process information. This pauses execution and evicts
+ *    all the queues.
+ * 2. CHECKPOINT op to checkpoint process contents (BOs, queues, events, svm-ranges)
+ * 3. UNPAUSE op to un-evict all the queues
+ *
+ * When restoring a process, the CRIU userspace application will perform:
+ *
+ * 1. RESTORE op to restore process contents
+ * 2. RESUME op to start the process
+ *
+ * Note: Queues are forced into an evicted state after a successful PROCESS_INFO. User
+ * application needs to perform an UNPAUSE operation after calling PROCESS_INFO.
+ */
+
+enum kfd_criu_op {
+	KFD_CRIU_OP_PROCESS_INFO,
+	KFD_CRIU_OP_CHECKPOINT,
+	KFD_CRIU_OP_UNPAUSE,
+	KFD_CRIU_OP_RESTORE,
+	KFD_CRIU_OP_RESUME,
+};
+
+/**
+ * kfd_ioctl_criu_args - Arguments perform CRIU operation
+ * @devices:		[in/out] User pointer to memory location for devices information.
+ * 			This is an array of type kfd_criu_device_bucket.
+ * @bos:		[in/out] User pointer to memory location for BOs information
+ * 			This is an array of type kfd_criu_bo_bucket.
+ * @priv_data:		[in/out] User pointer to memory location for private data
+ * @priv_data_size:	[in/out] Size of priv_data in bytes
+ * @num_devices:	[in/out] Number of GPUs used by process. Size of @devices array.
+ * @num_bos		[in/out] Number of BOs used by process. Size of @bos array.
+ * @num_objects:	[in/out] Number of objects used by process. Objects are opaque to
+ *				 user application.
+ * @pid:		[in/out] PID of the process being checkpointed
+ * @op			[in] Type of operation (kfd_criu_op)
+ *
+ * Return: 0 on success, -errno on failure
+ */
+struct kfd_ioctl_criu_args {
+	__u64 devices;		/* Used during ops: CHECKPOINT, RESTORE */
+	__u64 bos;		/* Used during ops: CHECKPOINT, RESTORE */
+	__u64 priv_data;	/* Used during ops: CHECKPOINT, RESTORE */
+	__u64 priv_data_size;	/* Used during ops: PROCESS_INFO, RESTORE */
+	__u32 num_devices;	/* Used during ops: PROCESS_INFO, RESTORE */
+	__u32 num_bos;		/* Used during ops: PROCESS_INFO, RESTORE */
+	__u32 num_objects;	/* Used during ops: PROCESS_INFO, RESTORE */
+	__u32 pid;		/* Used during ops: PROCESS_INFO, RESUME */
+	__u32 op;
+};
+
+struct kfd_criu_device_bucket {
+	__u32 user_gpu_id;
+	__u32 actual_gpu_id;
+	__u32 drm_fd;
+	__u32 pad;
+};
+
+struct kfd_criu_bo_bucket {
+	__u64 addr;
+	__u64 size;
+	__u64 offset;
+	__u64 restored_offset;    /* During restore, updated offset for BO */
+	__u32 gpu_id;             /* This is the user_gpu_id */
+	__u32 alloc_flags;
+	__u32 dmabuf_fd;
+	__u32 pad;
+};
+
+/* CRIU IOCTLs - END */
+/**************************************************************************************************/
+
 /* Register offset inside the remapped mmio page
  */
 enum kfd_mmio_remap {
@@ -742,7 +818,10 @@ struct kfd_ioctl_set_xnack_mode_args {
 #define AMDKFD_IOC_SET_XNACK_MODE		\
 		AMDKFD_IOWR(0x21, struct kfd_ioctl_set_xnack_mode_args)
 
+#define AMDKFD_IOC_CRIU_OP			\
+		AMDKFD_IOWR(0x22, struct kfd_ioctl_criu_args)
+
 #define AMDKFD_COMMAND_START		0x01
-#define AMDKFD_COMMAND_END		0x22
+#define AMDKFD_COMMAND_END		0x23
 
 #endif
-- 
2.17.1

