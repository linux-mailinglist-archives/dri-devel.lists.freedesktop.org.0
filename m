Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE1367BB6F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D52B10E84D;
	Wed, 25 Jan 2023 19:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F273210E391;
 Wed, 25 Jan 2023 19:54:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXqzA2d5qcpjlU6MBt/0D6rudr+YnlEcqpDNz/t5P4Sa1k1dDEBLj7RXXkIU6YHP93V805eCsm+HgHDDok2DPoHQXqaDT7nQw9YM358mGokKOkyV9q5GuSveORgaGswVOSz8CYZt76oAfBjxjIFd8yZKrVhxwEsFeL5Q/Mzz/fTRvigg9va/cfIvxcOIKQgzZsSSNs5WveZ7DXvQBQi0BpBAkCavi7leoEGZY9nuZDz0xlWJ2HdnvBqSwUzYgft0798WhSvSs2gGCsilZidQv1rtmU02wjplcWkMyu/zGvnqcrKJh1/BZmdVnE4l59TS9w5bq/j7gUsIuig4SWMvLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z22ZSe3XTBncViPfnfY1Z3Wc8r8jsIOAII+nXRMWz8o=;
 b=NGfFSeQ7Rg0lX9/6Fozp3Fb+da43k1lMXvDubE5pcgYD2Xx0u4JXOESAx423B7Q7RT+6aHqEEhbnZUbI6xehV1+/GQMPZy3HU2YWaJg1G1Hvuu5VqMcdoiv8HvfcIDdrz4ehzxgWrrS31rEeF+kkvueLKlbZiYmVYNFjs/6uQyQhWB45GfSlqxZH45I8yaWc/Wf9AJyGgA+526rycfk8n50tpcG4/z+X+zrkVyBMRI8e66/RSidpCBAb+EI2ZJf3cVJSFE4wY/VMZkedgIm0wf4DDqpWYWSjgFI5hCiKGqZPyf662PagXo5F+R6iYmBT5e2Lxu3bClZdLFQV5t1zzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z22ZSe3XTBncViPfnfY1Z3Wc8r8jsIOAII+nXRMWz8o=;
 b=q2hdFkoWDPGE6lkEzMesoaZk3VGb7EntKCSQo1IcJFu92vNll76wGEjy5ODA9CRurtKOhr7PYaDi7Yr3gUW4AdGBX0Ht3gJBQ2SQvMeiaDN7pE2fTb0sYc2AYMOQ/SfI6MDay3SOudVLbuqtlH1kiGq/fonVIJQr+orsDcUrCio=
Received: from BN8PR15CA0012.namprd15.prod.outlook.com (2603:10b6:408:c0::25)
 by SN7PR12MB6959.namprd12.prod.outlook.com (2603:10b6:806:261::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 19:54:23 +0000
Received: from BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:c0:cafe::b9) by BN8PR15CA0012.outlook.office365.com
 (2603:10b6:408:c0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT073.mail.protection.outlook.com (10.13.177.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 19:54:23 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:20 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 17/32] drm/amdkfd: add raise exception event function
Date: Wed, 25 Jan 2023 14:53:46 -0500
Message-ID: <20230125195401.4183544-18-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT073:EE_|SN7PR12MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f1a1dd6-b9f5-4209-5103-08daff0df500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 86qGLAA57cPDZGh+wVA/M61RdEEtGyCnLOJEWpvZfBGvQX5jJgAKHJMAgKFgv+kO+8rN+9ACDGXz8Ioji7yu1z4i8C931e82pEG9/y1LVBT1G1fTn/0gxFE92oJgTXvJDppqfs9ifEunwsp1c3UuhfGPLdSqNUF32qxqft6ameYuHvnsycgKdBXJlYciJyfBqgOA6dCeLpDhhrSPErpN/vbuTR5aQMVfmlD8ZRVF+emewhAumWJvrNLJd/j3lVMkJQlQzxzWDZKSB4BHZbpF2ElrAQ3QCuUNdaztl7kxKJRqljAWItlsstNllT0cHJKc+DRkRsj1jENt77pBFCQIsH/Y323yArziJerpmW0t2+QHGhrPeZdIW57uXjM3ChkfMAJ3OTG0wzt1ryKjvJV2KqNZ5f+cWt4cNre+r/qrsvG5JS//RWfog666TZqbd0pIwWrRipfYvDVJGNXeTzC5UX4GeM/QvoHThiRcWFuJWCuNry+JS+a7uqFO8bG6fcu5XoX810pYRPGM+IxZXFioWdP7oIRm1zDpvrFH4T4N+gx/tF43213H4WHCjGknrCR1ElJ5mplqKDgvwapLg54+Wecp3LXJ4y2XNdVuWkKj18okp57OZXL+PEfVrWdu9AxDUjKUOniDx9p3L6DW0NDy5z/1QdF0iEMYBPJQ5NUZtfcy+v9KRz5X/q0bggbYPYwgqCWbp8KC6T+byCKC8XXN7kAGFcKVB3UeplsXjLgbjr0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199018)(36840700001)(46966006)(40470700004)(4326008)(70586007)(450100002)(86362001)(54906003)(70206006)(36860700001)(36756003)(8936002)(44832011)(5660300002)(426003)(2906002)(82740400003)(41300700001)(82310400005)(40460700003)(47076005)(6666004)(83380400001)(16526019)(26005)(8676002)(40480700001)(1076003)(110136005)(186003)(316002)(2616005)(478600001)(81166007)(336012)(7696005)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:23.6130 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1a1dd6-b9f5-4209-5103-08daff0df500
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6959
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

Exception events can be generated from interrupts or queue activitity.

The raise event function will save exception status of a queue, device
or process then notify the debugger of the status change by writing to
a debugger polled file descriptor that the debugger provides during
debug attach.

For memory violation exceptions, extra exception data will be saved.

The debugger will be able to query the saved exception states by query
operation that will be provided by follow up patches.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c | 91 +++++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h |  5 ++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h  |  7 ++
 3 files changed, 102 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 659dfc7411fe..fcd064b13f6a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -38,6 +38,93 @@ void debug_event_write_work_handler(struct work_struct *work)
 	kernel_write(process->dbg_ev_file, &write_data, 1, &pos);
 }
 
+/* update process/device/queue exception status, write to descriptor
+ * only if exception_status is enabled.
+ */
+bool kfd_dbg_ev_raise(uint64_t event_mask,
+			struct kfd_process *process, struct kfd_dev *dev,
+			unsigned int source_id, bool use_worker,
+			void *exception_data, size_t exception_data_size)
+{
+	struct process_queue_manager *pqm;
+	struct process_queue_node *pqn;
+	int i;
+	static const char write_data = '.';
+	loff_t pos = 0;
+	bool is_subscribed = true;
+
+	if (!(process && process->debug_trap_enabled))
+		return false;
+
+	mutex_lock(&process->event_mutex);
+
+	if (event_mask & KFD_EC_MASK_DEVICE) {
+		for (i = 0; i < process->n_pdds; i++) {
+			struct kfd_process_device *pdd = process->pdds[i];
+
+			if (pdd->dev != dev)
+				continue;
+
+			pdd->exception_status |= event_mask & KFD_EC_MASK_DEVICE;
+
+			if (event_mask & KFD_EC_MASK(EC_DEVICE_MEMORY_VIOLATION)) {
+				if (!pdd->vm_fault_exc_data) {
+					pdd->vm_fault_exc_data = kmemdup(
+							exception_data,
+							exception_data_size,
+							GFP_KERNEL);
+					if (!pdd->vm_fault_exc_data)
+						pr_debug("Failed to allocate exception data memory");
+				} else {
+					pr_debug("Debugger exception data not saved\n");
+					print_hex_dump_bytes("exception data: ",
+							DUMP_PREFIX_OFFSET,
+							exception_data,
+							exception_data_size);
+				}
+			}
+			break;
+		}
+	} else if (event_mask & KFD_EC_MASK_PROCESS) {
+		process->exception_status |= event_mask & KFD_EC_MASK_PROCESS;
+	} else {
+		pqm = &process->pqm;
+		list_for_each_entry(pqn, &pqm->queues,
+				process_queue_list) {
+			int target_id;
+
+			if (!pqn->q)
+				continue;
+
+			target_id = event_mask & KFD_EC_MASK(EC_QUEUE_NEW) ?
+					pqn->q->properties.queue_id :
+							pqn->q->doorbell_id;
+
+			if (pqn->q->device != dev || target_id != source_id)
+				continue;
+
+			pqn->q->properties.exception_status |= event_mask;
+			break;
+		}
+	}
+
+	if (process->exception_enable_mask & event_mask) {
+		if (use_worker)
+			schedule_work(&process->debug_event_workarea);
+		else
+			kernel_write(process->dbg_ev_file,
+					&write_data,
+					1,
+					&pos);
+	} else {
+		is_subscribed = false;
+	}
+
+	mutex_unlock(&process->event_mutex);
+
+	return is_subscribed;
+}
+
 static int kfd_dbg_set_queue_workaround(struct queue *q, bool enable)
 {
 	struct mqd_update_info minfo = {0};
@@ -88,7 +175,6 @@ static int kfd_dbg_set_workaround(struct kfd_process *target, bool enable)
 	}
 
 	return r;
-}
 
 static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
 {
@@ -114,6 +200,9 @@ static void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int
 {
 	int i, count = 0;
 
+	if (!unwind)
+		cancel_work_sync(&target->debug_event_workarea);
+
 	for (i = 0; i < target->n_pdds; i++) {
 		struct kfd_process_device *pdd = target->pdds[i];
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index f199698d8d60..2d5bc102f6b4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -28,6 +28,11 @@
 void kgd_gfx_v9_set_wave_launch_stall(struct amdgpu_device *adev,
 					uint32_t vmid,
 					bool stall);
+bool kfd_dbg_ev_raise(uint64_t event_mask,
+			struct kfd_process *process, struct kfd_dev *dev,
+			unsigned int source_id, bool use_worker,
+			void *exception_data,
+			size_t exception_data_size);
 int kfd_dbg_trap_disable(struct kfd_process *target);
 int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 			void __user *runtime_info,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 75521d96e937..e503bd94dda6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -495,6 +495,7 @@ struct queue_properties {
 	uint32_t ctl_stack_size;
 	uint64_t tba_addr;
 	uint64_t tma_addr;
+	uint64_t exception_status;
 };
 
 #define QUEUE_IS_ACTIVE(q) ((q).queue_size > 0 &&	\
@@ -786,6 +787,11 @@ struct kfd_process_device {
 	uint64_t page_in;
 	uint64_t page_out;
 
+	/* Exception code status*/
+	uint64_t exception_status;
+	void *vm_fault_exc_data;
+	size_t vm_fault_exc_data_size;
+
 	/* Tracks debug per-vmid request settings */
 	uint32_t spi_dbg_override;
 	uint32_t spi_dbg_launch_mode;
@@ -921,6 +927,7 @@ struct kfd_process {
 
 	/* Exception code enable mask and status */
 	uint64_t exception_enable_mask;
+	uint64_t exception_status;
 
 	/* shared virtual memory registered by this process */
 	struct svm_range_list svms;
-- 
2.25.1

