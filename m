Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6006711259
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4834710E706;
	Thu, 25 May 2023 17:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C18510E6E5;
 Thu, 25 May 2023 17:28:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qo8bFYVTiV6GrNnwnWqgWaw2L9DM474y5lfEl1tbsPDzG/jLFMp4eJepPMQqBVeIajJ1cykSos8X132nny/I5s4fuaijhSKQ7kh8EDY0a9SX4qCWvJjK2KH2t3F3kbOKn1TwPBRLJWBdhfzXV0pm1Z8GGVEKYieMMN9gdVMZuehLAouqIBkwvT3My9AEj3+54TnpEdf899j6k3GwE06PgXMMtADr+A3yFDgzCc58C6hISYVMDwFFVwUBM8p2bSy7K6ag56nGuuwlFI3tEIGKQw9hwSrqIV+GGCegpHKb1aX78yer0XfhWzAsTVlg/1IomjwZVHR3jVdSvApzaAIJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryXuOi8Pflbv5BGZBUgjEGE1yDt2VHLm5le+VSeQSBc=;
 b=PzMvLrg8EZY65D+MPqkeLAt5lhBorCqb4aJ8QEJM266SeV/h6pZi2AgnD1xOQcZhnniexkzkzpe8OqcWN4FyztuxdJyYnZHmzsHCfhSGSguwO9OMlTt69x0t05eXJv1AFIdl3YI9P8J1xIraju0OXfC1PAT2zlkueGAYGlRWWVExONBoJYwscXb7rQwJyycLoNbsWD7JqwCZGQaec9GmeZL4l1Rdn1dfq1Id9RILaXzvB6ReP/Orl4Xgo+2aN+zQFLAnLRSdnmftdSa+vs2N9KL1HRYZJHfxR6LM9ajuaEf2VBRRmZXew0McTf0XHgq5PEPc1CNZ4hknXRUhZTAmVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryXuOi8Pflbv5BGZBUgjEGE1yDt2VHLm5le+VSeQSBc=;
 b=0VrAxZUy2j05TqGvsTdTuCObiDobUhV2DrckFxDFPm2xJAb+l4tL5wTsChC1AIHk6o6D8uwAmz7q+HrBIS/SGiEFb0MWqTmdq+HXy+aSHMZ/DH3HmDdeNMsykZhtDvBegyz7udzCKZpFBG8gSQP7PtxBFcJsmC3F4gwEA+loQOY=
Received: from MW4PR04CA0233.namprd04.prod.outlook.com (2603:10b6:303:87::28)
 by SJ2PR12MB8133.namprd12.prod.outlook.com (2603:10b6:a03:4af::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 17:28:07 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::ee) by MW4PR04CA0233.outlook.office365.com
 (2603:10b6:303:87::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16 via Frontend
 Transport; Thu, 25 May 2023 17:28:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.18 via Frontend Transport; Thu, 25 May 2023 17:28:07 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:28:05 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 26/33] drm/amdkfd: add debug suspend and resume process queues
 operation
Date: Thu, 25 May 2023 13:27:38 -0400
Message-ID: <20230525172745.702700-26-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT052:EE_|SJ2PR12MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e6a2d18-dec9-4067-3b42-08db5d456789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vxVqwgHMjlYoCEBcjd18ksGNZx9EPEVsa/A1LUtUHc3HHMhuFuGBa7GzVW77ITU0icQtMjVCZEa1JwWNrtS+tfrMfHqmwvFwzewdx06b2cRCyGeafy2/jjbkJDu7ajKELpLbtgHJClO5D3xukWkE4OU5hS3tk9Vnqy4h/dsCvV4Xjnoj+Ka/sum9PrObwRpKr8JTvx4/6L7WNaEGdLvmQ5hbNgBr98vh2teUKbjs6jLuPqZdjdGj/bXra7uEb/jEW48jVQPu/moaKxAwD57RhjR0okKz6F9ukBYhAAaFVIg/uFaWFwrR2/WUcgQhv2/MlHEIDy2gTTcHEq8oTJTOZDDyXUqsXk5q+fsw++/jcqRYvHsHcYZwRIwuvdUiSk0owJMUPa9ayT50AfkyJqNmb2jpbMzELUhLMiN4z8uRQTwavZ7Hz62zo/FbgXKxDfbxEHRAHWqMerpYn2ADD0LCMauRz/ui23LXQ2iGEZyXZukv7s0D08b6D82oI4xexjmUL59uIeF7M9lFCxQQWOwExsigIIZys019yT7a29ebKiSl3sbPhhxx7KlsrbJ8p4IbzS0+Klsa5ai3BhZEckgVCiJmzMWnPf6dfxumsE5krcidlIFlrytgnH+mEIauz/lIUxzE5Novch1FYEuDqKtM3zwbwBRhNc0Trt8sTT1A+TqyGuwmZW3Hx+9BuhZ0kmf1WLbR3/UkOhIeAnnifFPlJcS/Eyh7cWg3LsqE8ZHf+UEsyOf6iPHLzVusOtUCaVbnsLSx3WL6YeT1EJHcmz2asg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(6666004)(7696005)(426003)(47076005)(83380400001)(1076003)(26005)(336012)(2906002)(36860700001)(30864003)(186003)(16526019)(41300700001)(86362001)(2616005)(82310400005)(15650500001)(356005)(82740400003)(81166007)(40480700001)(8676002)(44832011)(36756003)(8936002)(70586007)(450100002)(4326008)(70206006)(6636002)(110136005)(478600001)(5660300002)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:07.2824 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e6a2d18-dec9-4067-3b42-08db5d456789
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8133
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

In order to inspect waves from the saved context at any point during a
debug session, the debugger must be able to preempt queues to trigger
context save by suspending them.

On queue suspend, the KFD will copy the context save header information
so that the debugger can correctly crawl the appropriate size of the saved
context. The debugger must then also be allowed to resume suspended queues.

A queue that is newly created cannot be suspended because queue ids are
recycled after destruction so the debugger needs to know that this has
occurred.  Query functions will be later added that will clear a given
queue of its new queue status.

A queue cannot be destroyed while it is suspended to preserve its saved
context during debugger inspection.  Have queue destruction block while
a queue is suspended and unblocked when it is resumed.  Likewise, if a
queue is about to be destroyed, it cannot be suspended.

Return the number of queues successfully suspended or resumed along with
a per queue status array where the upper bits per queue status show that
the request was invalid (new/destroyed queue suspend request, missing
queue) or an error occurred (HWS in a fatal state so it can't suspend or
resume queues).

v2: fixup new kfd_node struct reference for mes fw check.
also fixup missing EC_QUEUE_NEW flagging on newly created queue.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  11 +
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c        |   7 +
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 447 +++++++++++++++++-
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |  10 +
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |  10 +
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c  |  15 +-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   |  14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   5 +-
 .../amd/amdkfd/kfd_process_queue_manager.c    |   1 +
 11 files changed, 512 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 98cd52bb005f..b4fcad0e62f7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -772,6 +772,11 @@ bool amdgpu_amdkfd_have_atomics_support(struct amdgpu_device *adev)
 	return adev->have_atomics_support;
 }
 
+void amdgpu_amdkfd_debug_mem_fence(struct amdgpu_device *adev)
+{
+	amdgpu_device_flush_hdp(adev, NULL);
+}
+
 void amdgpu_amdkfd_ras_poison_consumption_handler(struct amdgpu_device *adev, bool reset)
 {
 	amdgpu_umc_poison_handler(adev, reset);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index dd740e64e6e1..2d0406bff84e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -322,6 +322,7 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 				      uint64_t *mmap_offset);
 int amdgpu_amdkfd_gpuvm_export_dmabuf(struct kgd_mem *mem,
 				      struct dma_buf **dmabuf);
+void amdgpu_amdkfd_debug_mem_fence(struct amdgpu_device *adev);
 int amdgpu_amdkfd_get_tile_config(struct amdgpu_device *adev,
 				struct tile_config *config);
 void amdgpu_amdkfd_ras_poison_consumption_handler(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 4b45d4539d48..adda60273456 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -410,6 +410,7 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
 	pr_debug("Write ptr address   == 0x%016llX\n",
 			args->write_pointer_address);
 
+	kfd_dbg_ev_raise(KFD_EC_MASK(EC_QUEUE_NEW), p, dev, queue_id, false, NULL, 0);
 	return 0;
 
 err_create_queue:
@@ -2996,7 +2997,17 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 				args->launch_mode.launch_mode);
 		break;
 	case KFD_IOC_DBG_TRAP_SUSPEND_QUEUES:
+		r = suspend_queues(target,
+				args->suspend_queues.num_queues,
+				args->suspend_queues.grace_period,
+				args->suspend_queues.exception_mask,
+				(uint32_t *)args->suspend_queues.queue_array_ptr);
+
+		break;
 	case KFD_IOC_DBG_TRAP_RESUME_QUEUES:
+		r = resume_queues(target, args->resume_queues.num_queues,
+				(uint32_t *)args->resume_queues.queue_array_ptr);
+		break;
 	case KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH:
 	case KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH:
 	case KFD_IOC_DBG_TRAP_SET_FLAGS:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 53c3418562d4..f4d3dfb35cb3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -339,6 +339,13 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
 	}
 
 	kfd_dbg_set_workaround(target, false);
+
+	if (!unwind) {
+		int resume_count = resume_queues(target, 0, NULL);
+
+		if (resume_count)
+			pr_debug("Resumed %d queues\n", resume_count);
+	}
 }
 
 static void kfd_dbg_clean_exception_status(struct kfd_process *target)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 9186903aa9ff..03fabe6e9cdb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -952,6 +952,92 @@ static int update_queue(struct device_queue_manager *dqm, struct queue *q,
 	return retval;
 }
 
+/* suspend_single_queue does not lock the dqm like the
+ * evict_process_queues_cpsch or evict_process_queues_nocpsch. You should
+ * lock the dqm before calling, and unlock after calling.
+ *
+ * The reason we don't lock the dqm is because this function may be
+ * called on multiple queues in a loop, so rather than locking/unlocking
+ * multiple times, we will just keep the dqm locked for all of the calls.
+ */
+static int suspend_single_queue(struct device_queue_manager *dqm,
+				      struct kfd_process_device *pdd,
+				      struct queue *q)
+{
+	bool is_new;
+
+	if (q->properties.is_suspended)
+		return 0;
+
+	pr_debug("Suspending PASID %u queue [%i]\n",
+			pdd->process->pasid,
+			q->properties.queue_id);
+
+	is_new = q->properties.exception_status & KFD_EC_MASK(EC_QUEUE_NEW);
+
+	if (is_new || q->properties.is_being_destroyed) {
+		pr_debug("Suspend: skip %s queue id %i\n",
+				is_new ? "new" : "destroyed",
+				q->properties.queue_id);
+		return -EBUSY;
+	}
+
+	q->properties.is_suspended = true;
+	if (q->properties.is_active) {
+		if (dqm->dev->kfd->shared_resources.enable_mes) {
+			int r = remove_queue_mes(dqm, q, &pdd->qpd);
+
+			if (r)
+				return r;
+		}
+
+		decrement_queue_count(dqm, &pdd->qpd, q);
+		q->properties.is_active = false;
+	}
+
+	return 0;
+}
+
+/* resume_single_queue does not lock the dqm like the functions
+ * restore_process_queues_cpsch or restore_process_queues_nocpsch. You should
+ * lock the dqm before calling, and unlock after calling.
+ *
+ * The reason we don't lock the dqm is because this function may be
+ * called on multiple queues in a loop, so rather than locking/unlocking
+ * multiple times, we will just keep the dqm locked for all of the calls.
+ */
+static int resume_single_queue(struct device_queue_manager *dqm,
+				      struct qcm_process_device *qpd,
+				      struct queue *q)
+{
+	struct kfd_process_device *pdd;
+
+	if (!q->properties.is_suspended)
+		return 0;
+
+	pdd = qpd_to_pdd(qpd);
+
+	pr_debug("Restoring from suspend PASID %u queue [%i]\n",
+			    pdd->process->pasid,
+			    q->properties.queue_id);
+
+	q->properties.is_suspended = false;
+
+	if (QUEUE_IS_ACTIVE(q->properties)) {
+		if (dqm->dev->kfd->shared_resources.enable_mes) {
+			int r = add_queue_mes(dqm, q, &pdd->qpd);
+
+			if (r)
+				return r;
+		}
+
+		q->properties.is_active = true;
+		increment_queue_count(dqm, qpd, q);
+	}
+
+	return 0;
+}
+
 static int evict_process_queues_nocpsch(struct device_queue_manager *dqm,
 					struct qcm_process_device *qpd)
 {
@@ -1925,6 +2011,31 @@ static int execute_queues_cpsch(struct device_queue_manager *dqm,
 	return map_queues_cpsch(dqm);
 }
 
+static int wait_on_destroy_queue(struct device_queue_manager *dqm,
+				 struct queue *q)
+{
+	struct kfd_process_device *pdd = kfd_get_process_device_data(q->device,
+								q->process);
+	int ret = 0;
+
+	if (pdd->qpd.is_debug)
+		return ret;
+
+	q->properties.is_being_destroyed = true;
+
+	if (pdd->process->debug_trap_enabled && q->properties.is_suspended) {
+		dqm_unlock(dqm);
+		mutex_unlock(&q->process->mutex);
+		ret = wait_event_interruptible(dqm->destroy_wait,
+						!q->properties.is_suspended);
+
+		mutex_lock(&q->process->mutex);
+		dqm_lock(dqm);
+	}
+
+	return ret;
+}
+
 static int destroy_queue_cpsch(struct device_queue_manager *dqm,
 				struct qcm_process_device *qpd,
 				struct queue *q)
@@ -1944,11 +2055,16 @@ static int destroy_queue_cpsch(struct device_queue_manager *dqm,
 				q->properties.queue_id);
 	}
 
-	retval = 0;
-
 	/* remove queue from list to prevent rescheduling after preemption */
 	dqm_lock(dqm);
 
+	retval = wait_on_destroy_queue(dqm, q);
+
+	if (retval) {
+		dqm_unlock(dqm);
+		return retval;
+	}
+
 	if (qpd->is_debug) {
 		/*
 		 * error, currently we do not allow to destroy a queue
@@ -1995,7 +2111,14 @@ static int destroy_queue_cpsch(struct device_queue_manager *dqm,
 
 	dqm_unlock(dqm);
 
-	/* Do free_mqd after dqm_unlock(dqm) to avoid circular locking */
+	/*
+	 * Do free_mqd and raise delete event after dqm_unlock(dqm) to avoid
+	 * circular locking
+	 */
+	kfd_dbg_ev_raise(KFD_EC_MASK(EC_DEVICE_QUEUE_DELETE),
+				qpd->pqm->process, q->device,
+				-1, false, NULL, 0);
+
 	mqd_mgr->free_mqd(mqd_mgr, q->mqd, q->mqd_mem_obj);
 
 	return retval;
@@ -2460,8 +2583,10 @@ struct device_queue_manager *device_queue_manager_init(struct kfd_node *dev)
 		goto out_free;
 	}
 
-	if (!dqm->ops.initialize(dqm))
+	if (!dqm->ops.initialize(dqm)) {
+		init_waitqueue_head(&dqm->destroy_wait);
 		return dqm;
+	}
 
 out_free:
 	kfree(dqm);
@@ -2601,6 +2726,320 @@ int release_debug_trap_vmid(struct device_queue_manager *dqm,
 	return r;
 }
 
+#define QUEUE_NOT_FOUND		-1
+/* invalidate queue operation in array */
+static void q_array_invalidate(uint32_t num_queues, uint32_t *queue_ids)
+{
+	int i;
+
+	for (i = 0; i < num_queues; i++)
+		queue_ids[i] |= KFD_DBG_QUEUE_INVALID_MASK;
+}
+
+/* find queue index in array */
+static int q_array_get_index(unsigned int queue_id,
+		uint32_t num_queues,
+		uint32_t *queue_ids)
+{
+	int i;
+
+	for (i = 0; i < num_queues; i++)
+		if (queue_id == (queue_ids[i] & ~KFD_DBG_QUEUE_INVALID_MASK))
+			return i;
+
+	return QUEUE_NOT_FOUND;
+}
+
+struct copy_context_work_handler_workarea {
+	struct work_struct copy_context_work;
+	struct kfd_process *p;
+};
+
+static void copy_context_work_handler (struct work_struct *work)
+{
+	struct copy_context_work_handler_workarea *workarea;
+	struct mqd_manager *mqd_mgr;
+	struct queue *q;
+	struct mm_struct *mm;
+	struct kfd_process *p;
+	uint32_t tmp_ctl_stack_used_size, tmp_save_area_used_size;
+	int i;
+
+	workarea = container_of(work,
+			struct copy_context_work_handler_workarea,
+			copy_context_work);
+
+	p = workarea->p;
+	mm = get_task_mm(p->lead_thread);
+
+	if (!mm)
+		return;
+
+	kthread_use_mm(mm);
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+		struct device_queue_manager *dqm = pdd->dev->dqm;
+		struct qcm_process_device *qpd = &pdd->qpd;
+
+		list_for_each_entry(q, &qpd->queues_list, list) {
+			mqd_mgr = dqm->mqd_mgrs[KFD_MQD_TYPE_CP];
+
+			/* We ignore the return value from get_wave_state
+			 * because
+			 * i) right now, it always returns 0, and
+			 * ii) if we hit an error, we would continue to the
+			 *      next queue anyway.
+			 */
+			mqd_mgr->get_wave_state(mqd_mgr,
+					q->mqd,
+					&q->properties,
+					(void __user *)	q->properties.ctx_save_restore_area_address,
+					&tmp_ctl_stack_used_size,
+					&tmp_save_area_used_size);
+		}
+	}
+	kthread_unuse_mm(mm);
+	mmput(mm);
+}
+
+static uint32_t *get_queue_ids(uint32_t num_queues, uint32_t *usr_queue_id_array)
+{
+	size_t array_size = num_queues * sizeof(uint32_t);
+	uint32_t *queue_ids = NULL;
+
+	if (!usr_queue_id_array)
+		return NULL;
+
+	queue_ids = kzalloc(array_size, GFP_KERNEL);
+	if (!queue_ids)
+		return ERR_PTR(-ENOMEM);
+
+	if (copy_from_user(queue_ids, usr_queue_id_array, array_size))
+		return ERR_PTR(-EFAULT);
+
+	return queue_ids;
+}
+
+int resume_queues(struct kfd_process *p,
+		uint32_t num_queues,
+		uint32_t *usr_queue_id_array)
+{
+	uint32_t *queue_ids = NULL;
+	int total_resumed = 0;
+	int i;
+
+	if (usr_queue_id_array) {
+		queue_ids = get_queue_ids(num_queues, usr_queue_id_array);
+
+		if (IS_ERR(queue_ids))
+			return PTR_ERR(queue_ids);
+
+		/* mask all queues as invalid.  unmask per successful request */
+		q_array_invalidate(num_queues, queue_ids);
+	}
+
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+		struct device_queue_manager *dqm = pdd->dev->dqm;
+		struct qcm_process_device *qpd = &pdd->qpd;
+		struct queue *q;
+		int r, per_device_resumed = 0;
+
+		dqm_lock(dqm);
+
+		/* unmask queues that resume or already resumed as valid */
+		list_for_each_entry(q, &qpd->queues_list, list) {
+			int q_idx = QUEUE_NOT_FOUND;
+
+			if (queue_ids)
+				q_idx = q_array_get_index(
+						q->properties.queue_id,
+						num_queues,
+						queue_ids);
+
+			if (!queue_ids || q_idx != QUEUE_NOT_FOUND) {
+				int err = resume_single_queue(dqm, &pdd->qpd, q);
+
+				if (queue_ids) {
+					if (!err) {
+						queue_ids[q_idx] &=
+							~KFD_DBG_QUEUE_INVALID_MASK;
+					} else {
+						queue_ids[q_idx] |=
+							KFD_DBG_QUEUE_ERROR_MASK;
+						break;
+					}
+				}
+
+				if (dqm->dev->kfd->shared_resources.enable_mes) {
+					wake_up_all(&dqm->destroy_wait);
+					if (!err)
+						total_resumed++;
+				} else {
+					per_device_resumed++;
+				}
+			}
+		}
+
+		if (!per_device_resumed) {
+			dqm_unlock(dqm);
+			continue;
+		}
+
+		r = execute_queues_cpsch(dqm,
+					KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES,
+					0,
+					USE_DEFAULT_GRACE_PERIOD);
+		if (r) {
+			pr_err("Failed to resume process queues\n");
+			if (queue_ids) {
+				list_for_each_entry(q, &qpd->queues_list, list) {
+					int q_idx = q_array_get_index(
+							q->properties.queue_id,
+							num_queues,
+							queue_ids);
+
+					/* mask queue as error on resume fail */
+					if (q_idx != QUEUE_NOT_FOUND)
+						queue_ids[q_idx] |=
+							KFD_DBG_QUEUE_ERROR_MASK;
+				}
+			}
+		} else {
+			wake_up_all(&dqm->destroy_wait);
+			total_resumed += per_device_resumed;
+		}
+
+		dqm_unlock(dqm);
+	}
+
+	if (queue_ids) {
+		if (copy_to_user((void __user *)usr_queue_id_array, queue_ids,
+				num_queues * sizeof(uint32_t)))
+			pr_err("copy_to_user failed on queue resume\n");
+
+		kfree(queue_ids);
+	}
+
+	return total_resumed;
+}
+
+int suspend_queues(struct kfd_process *p,
+			uint32_t num_queues,
+			uint32_t grace_period,
+			uint64_t exception_clear_mask,
+			uint32_t *usr_queue_id_array)
+{
+	uint32_t *queue_ids = get_queue_ids(num_queues, usr_queue_id_array);
+	int total_suspended = 0;
+	int i;
+
+	if (IS_ERR(queue_ids))
+		return PTR_ERR(queue_ids);
+
+	/* mask all queues as invalid.  umask on successful request */
+	q_array_invalidate(num_queues, queue_ids);
+
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+		struct device_queue_manager *dqm = pdd->dev->dqm;
+		struct qcm_process_device *qpd = &pdd->qpd;
+		struct queue *q;
+		int r, per_device_suspended = 0;
+
+		mutex_lock(&p->event_mutex);
+		dqm_lock(dqm);
+
+		/* unmask queues that suspend or already suspended */
+		list_for_each_entry(q, &qpd->queues_list, list) {
+			int q_idx = q_array_get_index(q->properties.queue_id,
+							num_queues,
+							queue_ids);
+
+			if (q_idx != QUEUE_NOT_FOUND) {
+				int err = suspend_single_queue(dqm, pdd, q);
+				bool is_mes = dqm->dev->kfd->shared_resources.enable_mes;
+
+				if (!err) {
+					queue_ids[q_idx] &= ~KFD_DBG_QUEUE_INVALID_MASK;
+					if (exception_clear_mask && is_mes)
+						q->properties.exception_status &=
+							~exception_clear_mask;
+
+					if (is_mes)
+						total_suspended++;
+					else
+						per_device_suspended++;
+				} else if (err != -EBUSY) {
+					r = err;
+					queue_ids[q_idx] |= KFD_DBG_QUEUE_ERROR_MASK;
+					break;
+				}
+			}
+		}
+
+		if (!per_device_suspended) {
+			dqm_unlock(dqm);
+			mutex_unlock(&p->event_mutex);
+			if (total_suspended)
+				amdgpu_amdkfd_debug_mem_fence(dqm->dev->adev);
+			continue;
+		}
+
+		r = execute_queues_cpsch(dqm,
+			KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
+			grace_period);
+
+		if (r)
+			pr_err("Failed to suspend process queues.\n");
+		else
+			total_suspended += per_device_suspended;
+
+		list_for_each_entry(q, &qpd->queues_list, list) {
+			int q_idx = q_array_get_index(q->properties.queue_id,
+						num_queues, queue_ids);
+
+			if (q_idx == QUEUE_NOT_FOUND)
+				continue;
+
+			/* mask queue as error on suspend fail */
+			if (r)
+				queue_ids[q_idx] |= KFD_DBG_QUEUE_ERROR_MASK;
+			else if (exception_clear_mask)
+				q->properties.exception_status &=
+							~exception_clear_mask;
+		}
+
+		dqm_unlock(dqm);
+		mutex_unlock(&p->event_mutex);
+		amdgpu_device_flush_hdp(dqm->dev->adev, NULL);
+	}
+
+	if (total_suspended) {
+		struct copy_context_work_handler_workarea copy_context_worker;
+
+		INIT_WORK_ONSTACK(
+				&copy_context_worker.copy_context_work,
+				copy_context_work_handler);
+
+		copy_context_worker.p = p;
+
+		schedule_work(&copy_context_worker.copy_context_work);
+
+
+		flush_work(&copy_context_worker.copy_context_work);
+		destroy_work_on_stack(&copy_context_worker.copy_context_work);
+	}
+
+	if (copy_to_user((void __user *)usr_queue_id_array, queue_ids,
+			num_queues * sizeof(uint32_t)))
+		pr_err("copy_to_user failed on queue suspend\n");
+
+	kfree(queue_ids);
+
+	return total_suspended;
+}
+
 int debug_lock_and_unmap(struct device_queue_manager *dqm)
 {
 	int r;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index bb75d93712eb..d4e6dbffe8c2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -263,6 +263,8 @@ struct device_queue_manager {
 	uint32_t		current_logical_xcc_start;
 
 	uint32_t		wait_times;
+
+	wait_queue_head_t	destroy_wait;
 };
 
 void device_queue_manager_init_cik(
@@ -290,6 +292,14 @@ int reserve_debug_trap_vmid(struct device_queue_manager *dqm,
 			struct qcm_process_device *qpd);
 int release_debug_trap_vmid(struct device_queue_manager *dqm,
 			struct qcm_process_device *qpd);
+int suspend_queues(struct kfd_process *p,
+			uint32_t num_queues,
+			uint32_t grace_period,
+			uint64_t exception_clear_mask,
+			uint32_t *usr_queue_id_array);
+int resume_queues(struct kfd_process *p,
+		uint32_t num_queues,
+		uint32_t *usr_queue_id_array);
 int debug_lock_and_unmap(struct device_queue_manager *dqm);
 int debug_map_and_unlock(struct device_queue_manager *dqm);
 int debug_refresh_runlist(struct device_queue_manager *dqm);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
index a0ac4f2fe6b5..94c0fc2e57b7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
@@ -237,6 +237,7 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 			  u32 *save_area_used_size)
 {
 	struct v10_compute_mqd *m;
+	struct kfd_context_save_area_header header;
 
 	m = get_mqd(mqd);
 
@@ -255,6 +256,15 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	 * accessible to user mode
 	 */
 
+	header.wave_state.control_stack_size = *ctl_stack_used_size;
+	header.wave_state.wave_state_size = *save_area_used_size;
+
+	header.wave_state.wave_state_offset = m->cp_hqd_wg_state_offset;
+	header.wave_state.control_stack_offset = m->cp_hqd_cntl_stack_offset;
+
+	if (copy_to_user(ctl_stack, &header, sizeof(header.wave_state)))
+		return -EFAULT;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
index 9a9b4e853516..31fec5e70d13 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
@@ -291,7 +291,7 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 			  u32 *save_area_used_size)
 {
 	struct v11_compute_mqd *m;
-	/*struct mqd_user_context_save_area_header header;*/
+	struct kfd_context_save_area_header header;
 
 	m = get_mqd(mqd);
 
@@ -309,16 +309,15 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	 * it's part of the context save area that is already
 	 * accessible to user mode
 	 */
-/*
-	header.control_stack_size = *ctl_stack_used_size;
-	header.wave_state_size = *save_area_used_size;
+	header.wave_state.control_stack_size = *ctl_stack_used_size;
+	header.wave_state.wave_state_size = *save_area_used_size;
 
-	header.wave_state_offset = m->cp_hqd_wg_state_offset;
-	header.control_stack_offset = m->cp_hqd_cntl_stack_offset;
+	header.wave_state.wave_state_offset = m->cp_hqd_wg_state_offset;
+	header.wave_state.control_stack_offset = m->cp_hqd_cntl_stack_offset;
 
-	if (copy_to_user(ctl_stack, &header, sizeof(header)))
+	if (copy_to_user(ctl_stack, &header, sizeof(header.wave_state)))
 		return -EFAULT;
-*/
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
index 5b87c244e909..601bb9f68048 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
@@ -311,6 +311,7 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 			  u32 *save_area_used_size)
 {
 	struct v9_mqd *m;
+	struct kfd_context_save_area_header header;
 
 	/* Control stack is located one page after MQD. */
 	void *mqd_ctl_stack = (void *)((uintptr_t)mqd + PAGE_SIZE);
@@ -322,7 +323,18 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	*save_area_used_size = m->cp_hqd_wg_state_offset -
 		m->cp_hqd_cntl_stack_size;
 
-	if (copy_to_user(ctl_stack, mqd_ctl_stack, m->cp_hqd_cntl_stack_size))
+	header.wave_state.control_stack_size = *ctl_stack_used_size;
+	header.wave_state.wave_state_size = *save_area_used_size;
+
+	header.wave_state.wave_state_offset = m->cp_hqd_wg_state_offset;
+	header.wave_state.control_stack_offset = m->cp_hqd_cntl_stack_offset;
+
+	if (copy_to_user(ctl_stack, &header, sizeof(header.wave_state)))
+		return -EFAULT;
+
+	if (copy_to_user(ctl_stack + m->cp_hqd_cntl_stack_offset,
+				mqd_ctl_stack + m->cp_hqd_cntl_stack_offset,
+				*ctl_stack_used_size))
 		return -EFAULT;
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index cd2d56e5cdf0..05da43bf233a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -510,6 +510,8 @@ struct queue_properties {
 	uint32_t doorbell_off;
 	bool is_interop;
 	bool is_evicted;
+	bool is_suspended;
+	bool is_being_destroyed;
 	bool is_active;
 	bool is_gws;
 	uint32_t pm4_target_xcc;
@@ -535,7 +537,8 @@ struct queue_properties {
 #define QUEUE_IS_ACTIVE(q) ((q).queue_size > 0 &&	\
 			    (q).queue_address != 0 &&	\
 			    (q).queue_percent > 0 &&	\
-			    !(q).is_evicted)
+			    !(q).is_evicted &&		\
+			    !(q).is_suspended)
 
 enum mqd_update_flag {
 	UPDATE_FLAG_DBG_WA_ENABLE = 1,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 70852a200d8f..01ccab607a69 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -187,6 +187,7 @@ static int init_user_queue(struct process_queue_manager *pqm,
 
 	/* Doorbell initialized in user space*/
 	q_properties->doorbell_ptr = NULL;
+	q_properties->exception_status = KFD_EC_MASK(EC_QUEUE_NEW);
 
 	/* let DQM handle it*/
 	q_properties->vmid = 0;
-- 
2.25.1

