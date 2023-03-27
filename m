Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F22906CAD8E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A1A10E6EF;
	Mon, 27 Mar 2023 18:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679A710E6C6;
 Mon, 27 Mar 2023 18:44:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yhwa9W6Rh1iSzwB7C0TGGoY/V9lJbnHfZlzO2Bm4TSL4A4Zt6eosFlXpY0AQkdhQDDbxRVGrxzB1Npn2NhVhGf5UZwaI3lhB1dvD1UUfVaM46kE5D09VH8E4LbIGuvGyiS+vBhBjTKEM5YSkovHiMfVTdMnq16h77uXONw06mbk7Vqz9y8mibeZ3fD4awpC4CQ7PMynfZhtgQdns8lDPo3u32jPdG20Y9Hsi2HIf+jHdQL5dYsg4hUSoYoYdSC88r3vIR+WWhRjKgKgufQ28GWKd4puEN793TUAqZHaW4hDjg+pfDT37yC75X3IYsYfdQhdBVa1m7lgKcvBhqP+eAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PY/ws3Sg3gkCDyeXsRCPMAaj5jqjrnN9OghDeb/WV/A=;
 b=L9V/s9Syh3k3YUnQ9UGA4SMDlLOPS2DJ+20xWWdtoV9BF+FXnDmo5jhp5jBaMcmM3vyvtedZxVHay3HqjSfPj4XWx11UnBwppsD7i+tAE0Ko42K2YJflZv8u7AEeBZFk6+xrSuuZNmRx9EV0SByZfK52XBwvhsRW8zLzO3tezp2nZISAPDsn5U9376ZX/icuTlYjc3Y1l2LTtAB4oN7Yp59hNzrw9YPvLCV+ncK9bNNTOxfe63ySnBvLmo561J4UZcNc6Gvnsrzk9Wc/PK6QzVPnr4C4LW2jEhJBbP7mAEVGcN3n++ShiRwl4zjK+/nIVijcNrRPoQltpMMjdMN4oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PY/ws3Sg3gkCDyeXsRCPMAaj5jqjrnN9OghDeb/WV/A=;
 b=f7SUZeupSfwwrWdQsrIkLPQGKLruRmWvJtkyHFghmayxa/qgOpXXhqaHdg8ItwZ835srDa8VXXBdAbXcKer+jVip2LnQWGCdKeA2r/ClkvjRNKByKSuON5b42Lq0O3HVbJdvr3vyRKvauOb0FupS5g4x/fQEC80YPYwWC1YKpsQ=
Received: from CY8PR02CA0014.namprd02.prod.outlook.com (2603:10b6:930:4d::28)
 by SN7PR12MB7785.namprd12.prod.outlook.com (2603:10b6:806:346::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.32; Mon, 27 Mar
 2023 18:43:56 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:4d:cafe::a9) by CY8PR02CA0014.outlook.office365.com
 (2603:10b6:930:4d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.43 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:56 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:55 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 19/34] drm/amdkfd: add send exception operation
Date: Mon, 27 Mar 2023 14:43:24 -0400
Message-ID: <20230327184339.125016-19-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|SN7PR12MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: affd6010-d28a-4016-8336-08db2ef338bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wk3yojC3lGnh0rSYSmFAUIoOLGMqkULNBxL7/HoqRcKspDZ1C/FqMxziU2cm6oxRah4F2nQxyrvaqafIBLcS4jGUOqpYcSwwuG0oKqWCM/hAry30VtJmxqe8HvBrtwunS3mgAwP7WJlhSpeQ6m3M2sil+HMDz8gLapzfzgEdaaX1wOa4CuuHBe0f/ASwzAgo6WCTcQhd+B9z8cmBSTg2apUz/HRjy8yOFPuzZ1LG5JAgWTt9KIQvdVmmEstZlGW0FlOyNzoeAEjY1Tzxhp65vWcv0LJ2Q5I6n/mklqRGZInnUJ8nF0/RfOJ5FemRAqT0y1wo7/noInlSlJkRrUv06Z8vmrjL2yaCrsb4faCLX/43eXAbZG0yfVqvQsjyqsVAIUjzB/CyKhMbjZIxKIVndl2GWXQhRxkDrUfZFnYBu79i3cU4AbLFVfaviWGoj0I7lVNBONL8BhC3gMDYijULvY/3bm5pgPPURs7OBlwdMrCLgBxITcO+fNqIUsOgeQdKXZ9XqHDnxYOaDO8nyZ2qFCREVfUl4oyY6eIOchrgYhHqcdp4xPsN/vc8v8d91E4z10wV3Bm3upN4FZ9OGR4Ps6Qh0l0XSpfM5gIDW86d209QcVwUIHd9vzzfYVQSXb9jw1H2ymaUu2CqeSVNVevMZvAKr1x5yXW9FjIVSpn4i91/cAwyJuNeHG6OGyD6FReUmwXdOUW/xnmBp26vd4cxctpEDGq4A0Bw9p4T8KQCcvs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(450100002)(81166007)(8676002)(70206006)(4326008)(54906003)(36860700001)(70586007)(316002)(82740400003)(8936002)(356005)(5660300002)(41300700001)(44832011)(26005)(186003)(1076003)(16526019)(83380400001)(7696005)(2616005)(47076005)(6666004)(478600001)(426003)(336012)(110136005)(40480700001)(86362001)(2906002)(82310400005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:56.5968 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: affd6010-d28a-4016-8336-08db2ef338bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7785
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

Add a debug operation that allows the debugger to send an exception
directly to runtime through a payload address.

For memory violations, normal vmfault signals will be applied to
notify runtime instead after passing in the saved exception data
when a memory violation was raised to the debugger.

For runtime exceptions, this will unblock the runtime enable
function which will be explained and implemented in a follow up
patch.

v2: missing closing brace in set workaround function got fixed
in patch 17.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 .../gpu/drm/amd/amdkfd/cik_event_interrupt.c  |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  5 ++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 43 +++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  6 ++
 drivers/gpu/drm/amd/amdkfd/kfd_events.c       |  3 +-
 .../gpu/drm/amd/amdkfd/kfd_int_process_v9.c   |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 71 ++++++++++++++++++-
 8 files changed, 135 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c b/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
index 5c8023cba196..62a38cd820fc 100644
--- a/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
+++ b/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
@@ -118,9 +118,9 @@ static void cik_event_interrupt_wq(struct kfd_dev *dev,
 			return;
 
 		if (info.vmid == vmid)
-			kfd_signal_vm_fault_event(dev, pasid, &info);
+			kfd_signal_vm_fault_event(dev, pasid, &info, NULL);
 		else
-			kfd_signal_vm_fault_event(dev, pasid, NULL);
+			kfd_signal_vm_fault_event(dev, pasid, NULL, NULL);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index acbed2a25a1e..c48d4598583a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2819,6 +2819,11 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 		r = kfd_dbg_trap_disable(target);
 		break;
 	case KFD_IOC_DBG_TRAP_SEND_RUNTIME_EVENT:
+		r = kfd_dbg_send_exception_to_runtime(target,
+				args->send_runtime_event.gpu_id,
+				args->send_runtime_event.queue_id,
+				args->send_runtime_event.exception_mask);
+		break;
 	case KFD_IOC_DBG_TRAP_SET_EXCEPTIONS_ENABLED:
 	case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_OVERRIDE:
 	case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 23ca8123f8f5..b3bd101b3b34 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -125,6 +125,49 @@ bool kfd_dbg_ev_raise(uint64_t event_mask,
 	return is_subscribed;
 }
 
+int kfd_dbg_send_exception_to_runtime(struct kfd_process *p,
+					unsigned int dev_id,
+					unsigned int queue_id,
+					uint64_t error_reason)
+{
+	if (error_reason & KFD_EC_MASK(EC_DEVICE_MEMORY_VIOLATION)) {
+		struct kfd_process_device *pdd = NULL;
+		struct kfd_hsa_memory_exception_data *data;
+		int i;
+
+		for (i = 0; i < p->n_pdds; i++) {
+			if (p->pdds[i]->dev->id == dev_id) {
+				pdd = p->pdds[i];
+				break;
+			}
+		}
+
+		if (!pdd)
+			return -ENODEV;
+
+		data = (struct kfd_hsa_memory_exception_data *)
+						pdd->vm_fault_exc_data;
+
+		kfd_dqm_evict_pasid(pdd->dev->dqm, p->pasid);
+		kfd_signal_vm_fault_event(pdd->dev, p->pasid, NULL, data);
+		error_reason &= ~KFD_EC_MASK(EC_DEVICE_MEMORY_VIOLATION);
+	}
+
+	if (error_reason & (KFD_EC_MASK(EC_PROCESS_RUNTIME))) {
+		/*
+		 * block should only happen after the debugger receives runtime
+		 * enable notice.
+		 */
+		up(&p->runtime_enable_sema);
+		error_reason &= ~KFD_EC_MASK(EC_PROCESS_RUNTIME);
+	}
+
+	if (error_reason)
+		return kfd_send_exception_to_runtime(p, queue_id, error_reason);
+
+	return 0;
+}
+
 static int kfd_dbg_set_queue_workaround(struct queue *q, bool enable)
 {
 	struct mqd_update_info minfo = {0};
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index a6cdbd9f1b54..adde17c45b4f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -34,6 +34,12 @@ int kfd_dbg_trap_disable(struct kfd_process *target);
 int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 			void __user *runtime_info,
 			uint32_t *runtime_info_size);
+
+int kfd_dbg_send_exception_to_runtime(struct kfd_process *p,
+					unsigned int dev_id,
+					unsigned int queue_id,
+					uint64_t error_reason);
+
 static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_dev *dev)
 {
 	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2) ||
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
index 2880ed96ac2e..10b9d72e617b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
@@ -1222,7 +1222,8 @@ void kfd_signal_hw_exception_event(u32 pasid)
 }
 
 void kfd_signal_vm_fault_event(struct kfd_dev *dev, u32 pasid,
-				struct kfd_vm_fault_info *info)
+				struct kfd_vm_fault_info *info,
+				struct kfd_hsa_memory_exception_data *data)
 {
 	struct kfd_event *ev;
 	uint32_t id;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
index 0b75a37b689b..e092563f22de 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
@@ -362,7 +362,7 @@ static void event_interrupt_wq_v9(struct kfd_dev *dev,
 
 		kfd_smi_event_update_vmfault(dev, pasid);
 		kfd_dqm_evict_pasid(dev->dqm, pasid);
-		kfd_signal_vm_fault_event(dev, pasid, &info);
+		kfd_signal_vm_fault_event(dev, pasid, &info, NULL);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 6031db7123b9..ee579b27586a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -945,6 +945,7 @@ struct kfd_process {
 	bool queues_paused;
 
 	/* Tracks runtime enable status */
+	struct semaphore runtime_enable_sema;
 	struct kfd_runtime_info runtime_info;
 
 };
@@ -1395,7 +1396,8 @@ int kfd_get_num_events(struct kfd_process *p);
 int kfd_event_destroy(struct kfd_process *p, uint32_t event_id);
 
 void kfd_signal_vm_fault_event(struct kfd_dev *dev, u32 pasid,
-				struct kfd_vm_fault_info *info);
+				struct kfd_vm_fault_info *info,
+				struct kfd_hsa_memory_exception_data *data);
 
 void kfd_signal_reset_event(struct kfd_dev *dev);
 
@@ -1411,6 +1413,9 @@ static inline bool kfd_flush_tlb_after_unmap(struct kfd_dev *dev)
 	       KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 0);
 }
 
+int kfd_send_exception_to_runtime(struct kfd_process *p,
+				unsigned int queue_id,
+				uint64_t error_reason);
 bool kfd_is_locked(void);
 
 /* Compute profile */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 31c10c76f4ec..c6a4d01bb1b5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1456,6 +1456,7 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	process->debugger_process = NULL;
 	process->exception_enable_mask = 0;
 	atomic_set(&process->debugged_process_count, 0);
+	sema_init(&process->runtime_enable_sema, 0);
 
 	process->pasid = kfd_pasid_alloc();
 	if (process->pasid == 0) {
@@ -2111,6 +2112,75 @@ void kfd_flush_tlb(struct kfd_process_device *pdd, enum TLB_FLUSH_TYPE type)
 	}
 }
 
+struct send_exception_work_handler_workarea {
+	struct work_struct work;
+	struct kfd_process *p;
+	unsigned int queue_id;
+	uint64_t error_reason;
+};
+
+static void send_exception_work_handler(struct work_struct *work)
+{
+	struct send_exception_work_handler_workarea *workarea;
+	struct kfd_process *p;
+	struct queue *q;
+	struct mm_struct *mm;
+	struct kfd_context_save_area_header __user *csa_header;
+	uint64_t __user *err_payload_ptr;
+	uint64_t cur_err;
+	uint32_t ev_id;
+
+	workarea = container_of(work,
+				struct send_exception_work_handler_workarea,
+				work);
+	p = workarea->p;
+
+	mm = get_task_mm(p->lead_thread);
+
+	if (!mm)
+		return;
+
+	kthread_use_mm(mm);
+
+	q = pqm_get_user_queue(&p->pqm, workarea->queue_id);
+
+	if (!q)
+		goto out;
+
+	csa_header = (void __user *)q->properties.ctx_save_restore_area_address;
+
+	get_user(err_payload_ptr, (uint64_t __user **)&csa_header->err_payload_addr);
+	get_user(cur_err, err_payload_ptr);
+	cur_err |= workarea->error_reason;
+	put_user(cur_err, err_payload_ptr);
+	get_user(ev_id, &csa_header->err_event_id);
+
+	kfd_set_event(p, ev_id);
+
+out:
+	kthread_unuse_mm(mm);
+	mmput(mm);
+}
+
+int kfd_send_exception_to_runtime(struct kfd_process *p,
+			unsigned int queue_id,
+			uint64_t error_reason)
+{
+	struct send_exception_work_handler_workarea worker;
+
+	INIT_WORK_ONSTACK(&worker.work, send_exception_work_handler);
+
+	worker.p = p;
+	worker.queue_id = queue_id;
+	worker.error_reason = error_reason;
+
+	schedule_work(&worker.work);
+	flush_work(&worker.work);
+	destroy_work_on_stack(&worker.work);
+
+	return 0;
+}
+
 struct kfd_process_device *kfd_process_device_data_by_id(struct kfd_process *p, uint32_t gpu_id)
 {
 	int i;
@@ -2170,4 +2240,3 @@ int kfd_debugfs_mqds_by_process(struct seq_file *m, void *data)
 }
 
 #endif
-
-- 
2.25.1

