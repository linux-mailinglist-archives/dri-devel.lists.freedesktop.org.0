Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E44711237
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1302D10E6FE;
	Thu, 25 May 2023 17:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E570E10E6E6;
 Thu, 25 May 2023 17:28:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKeRmXhQ49utozHhvVvqj6qjO+F1p2KRQGVFKpVmDnqfX1d9Oatr3ei4Z/VnXYVhWlyl9YVjR4PsGcymQo2ESLB4z3e8rlfkx7J4e4dhne67c1/+4oNfExWFUoMTL3UDCX6e7crDub2As94il6sxnDF5oj5Ksk1Ar9P88QWqV0MJjbjgwGXAbylFAb8XIT9jc+hEorZCeKtfpmU5sDEwZCEd56Ju9bhLe0eLbVbFGV9HxOWM9bSM4igjpDKrNvUCcNlpfL2XwuZi2IWCmaG3EfrEqBG9GzXkzHg9ZOV2+9iBT4/lFg/Sq9HKYxmeuBWXIcf+C5zQXrKHV4vOLErCig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7R8ubulLdUGcwdCP5Qjgo43zvRwzL3S/iFmMurAJtE4=;
 b=Xq0JksaIeEPY6T7GrneB6Wp9Yf00EsfxLBcR8WBuqMFQ8lX3AVhrzmRUvkUl5Jq0Ze0ryWrBMVr/48EQtxk26ibBVeOkUflSsWaVkKDvzWGl+IpPOT0BOH2vv8cNJOwLWjPQyudyEuPltlw0znYUMXPOUvV62FaHwPIuzRPKHHu5K+L9Lci8elcunGtY2TZLuzT7YHpeejvzMkafwoScTU02WA2tt4pap4Mcy9jdMIcBPYfQFShI24h/IKaNLfVkURBC7DMo5kSIfg7UhXHv8zNqSgOvgpJLcd80y7BjGYYpwuIJ+rYoBcN5LANW96XZ/JeI23IVy9Rd8r1s1tQGmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7R8ubulLdUGcwdCP5Qjgo43zvRwzL3S/iFmMurAJtE4=;
 b=NHDMTNPxTi/pc/OqRLfnHjCJJapIqCHsnF+y5/It+qMqEYqRCXUFgi2dSDIbAfgnI+ZLRQdlQoz/F/otb6T2ORW7u74Z3+GEF4UzjTaIWbkV7Gr8GQDZc78UseDCUJOWg2DkRBg1kEt2Y9XCqXfHXHriHzCHtYeONsEB0m7c4xQ=
Received: from MW4PR03CA0132.namprd03.prod.outlook.com (2603:10b6:303:8c::17)
 by MN2PR12MB4174.namprd12.prod.outlook.com (2603:10b6:208:15f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 17:28:05 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::2d) by MW4PR03CA0132.outlook.office365.com
 (2603:10b6:303:8c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 17:28:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 17:28:05 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:28:02 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 19/33] drm/amdkfd: add send exception operation
Date: Thu, 25 May 2023 13:27:31 -0400
Message-ID: <20230525172745.702700-19-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|MN2PR12MB4174:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c0f03b-b863-4b9c-0315-08db5d456645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R2CzPoBukITzGI/MqN+WwFKk/MAN6MGb4QWJ6Egz3SLijgeh7f+v2J4EnGoYsOzwvpbQj75Yql5qsJriaNXMblWHL4Zk7/xjsGkpecpgNjSr5IOzof0LbEy7HyuLj7nOkOQvp7bt6kBXF9Fiyb7HPKK3kBmTDXRuMBigmV+ZG8dUqAcmjLRj2O+Cs70e+0hdYNc6xXEuD9fsh2FonBC8YEpgFt0WxSpxb3iaBOCq84sCvVwFi1JjPSGHgM+LfReMp5v+j6zqp+JAfbytRhqJ+2MsHIQy6n+h5/BxubgHkhmzB9qE8Y76L8EfiiazIQ/egIt0ByJ5lFeD/bYLdmOJMgQuLQv8MLgK8qR4jserfM3keRlkudNO0/JVzA+/zwwfeFvB+yi029Npex8lEZEcy2P0kAsGHM2FYYxQR9DcGkkqiE96bpUU+WlYQrBM8EXe3kwNMXJwP0tc2A6ulyzgupwgGBhGoSI2hWEL2Jf2KuadTpwO4vfXbQWf1zxBDKlYtB6RHjtWZj6oz7LsDifQI5xYJ3IM3u2umdkKFO0JvojUuIHZ9uiQSSh9kLOF282PXsBfkfRd3HoTpE//+tQyBXuvCVpU1GeEkKJUpVPbZsVmqSCPsrd/f9aeG3cLDwERqFSOMIMsS8XKV3iQ/7N2vmZlU7j3wMG55pPAN3iIxbcGsVDy6799lQz0o9g9u2PXhcMd6RO3Hv9HW9ntZ8vlnuULSs2jgI/RDBXXe54sgdFCVZ75mMASsmQF3KiHbE4CM3s3WmO5SLTUJIOJKfme8Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(44832011)(82740400003)(81166007)(16526019)(186003)(82310400005)(26005)(336012)(1076003)(426003)(2616005)(83380400001)(36860700001)(47076005)(356005)(478600001)(2906002)(6666004)(86362001)(7696005)(40480700001)(36756003)(110136005)(70206006)(70586007)(4326008)(450100002)(6636002)(316002)(41300700001)(8676002)(8936002)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:05.1576 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c0f03b-b863-4b9c-0315-08db5d456645
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4174
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

Add a debug operation that allows the debugger to send an exception
directly to runtime through a payload address.

For memory violations, normal vmfault signals will be applied to
notify runtime instead after passing in the saved exception data
when a memory violation was raised to the debugger.

For runtime exceptions, this will unblock the runtime enable
function which will be explained and implemented in a follow up
patch.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
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
index 4ebfff6b6c55..795382b55e0a 100644
--- a/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
+++ b/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
@@ -118,9 +118,9 @@ static void cik_event_interrupt_wq(struct kfd_node *dev,
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
index a5c457863048..ec5a85454192 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2833,6 +2833,11 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
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
index dccb27fc764b..61098975bb0e 100644
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
index 66ee7b95d08a..2c6866bb8850 100644
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
 static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_node *dev)
 {
 	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2) ||
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
index c02e4e680237..7ff5c4e1b7e2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
@@ -1222,7 +1222,8 @@ void kfd_signal_hw_exception_event(u32 pasid)
 }
 
 void kfd_signal_vm_fault_event(struct kfd_node *dev, u32 pasid,
-			       struct kfd_vm_fault_info *info)
+				struct kfd_vm_fault_info *info,
+				struct kfd_hsa_memory_exception_data *data)
 {
 	struct kfd_event *ev;
 	uint32_t id;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
index 861bccb1e9dc..8cf58be80f4e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
@@ -362,7 +362,7 @@ static void event_interrupt_wq_v9(struct kfd_node *dev,
 
 		kfd_smi_event_update_vmfault(dev, pasid);
 		kfd_dqm_evict_pasid(dev->dqm, pasid);
-		kfd_signal_vm_fault_event(dev, pasid, &info);
+		kfd_signal_vm_fault_event(dev, pasid, &info, NULL);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index b18cd4bf76bf..58b82fa59584 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -979,6 +979,7 @@ struct kfd_process {
 	bool queues_paused;
 
 	/* Tracks runtime enable status */
+	struct semaphore runtime_enable_sema;
 	struct kfd_runtime_info runtime_info;
 
 };
@@ -1447,7 +1448,8 @@ int kfd_get_num_events(struct kfd_process *p);
 int kfd_event_destroy(struct kfd_process *p, uint32_t event_id);
 
 void kfd_signal_vm_fault_event(struct kfd_node *dev, u32 pasid,
-				struct kfd_vm_fault_info *info);
+				struct kfd_vm_fault_info *info,
+				struct kfd_hsa_memory_exception_data *data);
 
 void kfd_signal_reset_event(struct kfd_node *dev);
 
@@ -1463,6 +1465,9 @@ static inline bool kfd_flush_tlb_after_unmap(struct kfd_dev *dev)
 	       KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 0);
 }
 
+int kfd_send_exception_to_runtime(struct kfd_process *p,
+				unsigned int queue_id,
+				uint64_t error_reason);
 bool kfd_is_locked(void);
 
 /* Compute profile */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index fa19c1218748..8bfd0c91fb92 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1462,6 +1462,7 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	process->debugger_process = NULL;
 	process->exception_enable_mask = 0;
 	atomic_set(&process->debugged_process_count, 0);
+	sema_init(&process->runtime_enable_sema, 0);
 
 	process->pasid = kfd_pasid_alloc();
 	if (process->pasid == 0) {
@@ -2120,6 +2121,75 @@ void kfd_flush_tlb(struct kfd_process_device *pdd, enum TLB_FLUSH_TYPE type)
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
@@ -2179,4 +2249,3 @@ int kfd_debugfs_mqds_by_process(struct seq_file *m, void *data)
 }
 
 #endif
-
-- 
2.25.1

