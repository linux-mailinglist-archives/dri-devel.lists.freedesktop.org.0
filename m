Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B285F67BB56
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CE010E82D;
	Wed, 25 Jan 2023 19:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2046.outbound.protection.outlook.com [40.107.102.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB4310E81E;
 Wed, 25 Jan 2023 19:54:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdzmeR2oQLOvvmT1nPeboMiQk7smaKBHCD5WvjGF6DZTCG5sKpFIMT2a/AjosPvzJGtHD5G7EIeZnSaiIgzNdF3RVoJnPCWZ8nrnBHGgBBGWB1KeqQkZ0hK+078KhCbOCkt/7BwFhTQWvYRwIOs+eGDrkPVFHZEkS4q8O0o0Xv9wy6JaFSI/l9NsAofLq0LeevsTHo5TZDlQCd8vpWCeSX34X1ps+K29lDbTTu1efzgVLcUW+LZnlWKglDMBqMhvMSgb+zPhDYJtjFK6g7SrIUcl5LomM54whlfeRg6IRvRo+/TALsj6kWbw0x+UvyDSsTiF8XPlqgJvaB6RrgrJQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLW7hIBazelPeIRzseo88C93gZdIMQS5LgLV4AJI/IM=;
 b=aeZhxLCfB1w1Hkc0PJFfEgEAdqqb1Bi4zzZBPoYJkJCW8w4AwaGRzoVYbu7SuL07DoecnkeStLt6cvAnNC93gjBAgOsDRHTWKv3+yVhSVrsxIH9y3AD3K3Tnl1I5998hlOHpwodD9pnDIqHiUY+oMPTubdWTKsiqFEVx+HrMV9Lx7gaAgkKHCgCWiRl/yLozQqV48UQIQDrbQoN3HAuVOtf9O+1jf5cJhNBhweFgl7IrlUGGeHMZMuF1bLeJaW5Mrgq8A9ENLVbRE9pPFGnswJYH+c+2I9Gjx6Y5qE8S4sdAiAc4GWlSFRcmIuSUDF4kU5uxVVi23NDcstrP2Uhhpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLW7hIBazelPeIRzseo88C93gZdIMQS5LgLV4AJI/IM=;
 b=VQ4YShA0k+l4kEU8CxeEP2Kf+EXTomt9qRvPTCNTheUcKUrbjxXEr5AK6MQBbvvNNPAL4XqjjP/esadBrLOiUviTJRhbNYZoOPcbrtJ4msl7J18o4M+7XIS5g7XtpcNZsfqKf+WLg2KvR0qd+QUUuZx7j/dqHs6+YPvIIoi9l0U=
Received: from BN9PR03CA0706.namprd03.prod.outlook.com (2603:10b6:408:ef::21)
 by BL1PR12MB5061.namprd12.prod.outlook.com (2603:10b6:208:310::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 19:54:24 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::6e) by BN9PR03CA0706.outlook.office365.com
 (2603:10b6:408:ef::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 19:54:23 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:21 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 18/32] drm/amdkfd: add send exception operation
Date: Wed, 25 Jan 2023 14:53:47 -0500
Message-ID: <20230125195401.4183544-19-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125195401.4183544-1-jonathan.kim@amd.com>
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|BL1PR12MB5061:EE_
X-MS-Office365-Filtering-Correlation-Id: db60c4cb-9ece-48b4-ad97-08daff0df52b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 79RN3aihJQUXLGApQ7+YtI6pKsDKmHmvDiQk/kPLHls1d1QpGL/eJPqRBwDy7zaqstHAHe89bsxsrVRtlMssaFdItpLz+4r+QsHm5ur2Z53d6KJ/P9zF+jmY9pfJSvLXy7CGU9qvLqzh9azKirhcCWJALrEw1q7lEKPKx/gosN9hIuD71tNerttoyMNqmE3eAAGaf+zHZtr9+Mt4I0pkbF+8N8UdTgNa41p7/P7z4eSR7FofgFV6hdlFTCWBhxzF5v3HsMNLOrZOJlGdUXzG+CByPQImSnFRKGRwtbMjdJoH1FcwFgd+N4+XL58Hg25hrP9Wo/zAGPzKSwXAiDyQTEad3aViQS1aRcBZ+LkRL2KRS7wEbvEFQbvBfp/AXLfOdCuStL1FfC75QEbfiidL1ItDv63ynRMOgbpkw4U5DlZ6APQ7oBglFN37twuc1Hria2Zbj2TBZsNMqbjd3C7gsL4s/rukTQKpjJrt2XCe9S0fExhu4R+KtQCi4AIRTEkGdiZIPIm+mw8mRgVFvqUzAGDgJBWknim5uXu62JURzXLk1mB2zQ3MEEXeHdF38BD1fK4P1pXx1WvSee/8bNOhEZ7hX/VTxIJ4BM1Uf9Ws1ZTG9Qc0lmBDQsBjSG4bhQNwb5HwXs04/6amQhSr6Ftp1TZLxynmcsVTXvnzC8S3YDVPh46YrVEVknGlnQAMfPRaGLpkHlJwnjOtHfaNfRGXLM6ASoJjy035uimaNi7L/qo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(5660300002)(86362001)(36860700001)(83380400001)(186003)(2616005)(1076003)(478600001)(336012)(316002)(47076005)(110136005)(70206006)(426003)(8676002)(6666004)(450100002)(26005)(81166007)(70586007)(36756003)(16526019)(7696005)(2906002)(82740400003)(82310400005)(356005)(54906003)(40480700001)(40460700003)(8936002)(44832011)(41300700001)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:23.8815 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db60c4cb-9ece-48b4-ad97-08daff0df52b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5061
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
Cc: Felix.Kuehling@amd.com, Jonathan.Kim@amd.com
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

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 .../gpu/drm/amd/amdkfd/cik_event_interrupt.c  |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  5 ++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 44 ++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  5 ++
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
index 628178126d3b..09fe8576dc8c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2738,6 +2738,11 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
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
index fcd064b13f6a..4174b479ea6f 100644
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
@@ -175,6 +218,7 @@ static int kfd_dbg_set_workaround(struct kfd_process *target, bool enable)
 	}
 
 	return r;
+}
 
 static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index 2d5bc102f6b4..fefb9dc5cf69 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -38,6 +38,11 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 			void __user *runtime_info,
 			uint32_t *runtime_info_size);
 
+int kfd_dbg_send_exception_to_runtime(struct kfd_process *p,
+					unsigned int dev_id,
+					unsigned int queue_id,
+					uint64_t error_reason);
+
 static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_dev *dev)
 {
 	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2) ||
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
index 729d26d648af..0efd447762d6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
@@ -1225,7 +1225,8 @@ void kfd_signal_hw_exception_event(u32 pasid)
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
index e503bd94dda6..4cb433a21e3d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -945,6 +945,7 @@ struct kfd_process {
 	bool queues_paused;
 
 	/* Tracks runtime enable status */
+	struct semaphore runtime_enable_sema;
 	struct kfd_runtime_info runtime_info;
 
 };
@@ -1394,7 +1395,8 @@ int kfd_get_num_events(struct kfd_process *p);
 int kfd_event_destroy(struct kfd_process *p, uint32_t event_id);
 
 void kfd_signal_vm_fault_event(struct kfd_dev *dev, u32 pasid,
-				struct kfd_vm_fault_info *info);
+				struct kfd_vm_fault_info *info,
+				struct kfd_hsa_memory_exception_data *data);
 
 void kfd_signal_reset_event(struct kfd_dev *dev);
 
@@ -1410,6 +1412,9 @@ static inline bool kfd_flush_tlb_after_unmap(struct kfd_dev *dev)
 	       KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 0);
 }
 
+int kfd_send_exception_to_runtime(struct kfd_process *p,
+				unsigned int queue_id,
+				uint64_t error_reason);
 bool kfd_is_locked(void);
 
 /* Compute profile */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 0ef2d00af8b1..8519604f7249 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1403,6 +1403,7 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	process->debugger_process = NULL;
 	process->exception_enable_mask = 0;
 	atomic_set(&process->debugged_process_count, 0);
+	sema_init(&process->runtime_enable_sema, 0);
 
 	process->pasid = kfd_pasid_alloc();
 	if (process->pasid == 0) {
@@ -2058,6 +2059,75 @@ void kfd_flush_tlb(struct kfd_process_device *pdd, enum TLB_FLUSH_TYPE type)
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
@@ -2117,4 +2187,3 @@ int kfd_debugfs_mqds_by_process(struct seq_file *m, void *data)
 }
 
 #endif
-
-- 
2.25.1

