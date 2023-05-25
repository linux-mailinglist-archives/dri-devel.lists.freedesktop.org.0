Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E2971124D
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D607210E6FB;
	Thu, 25 May 2023 17:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8294F10E6DD;
 Thu, 25 May 2023 17:28:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxRxw3cnXXkrRJbPPY16AT+PiPxfOOV8uiilD0SwU2MAduYNrayh/8KRMQe4vKTs2Lx0UXIzolFgpNwNuRU2h/DYT94jBGMu6aQ+nmNH1w0LPMkjqxLYpzxJ0I9SVn+LPoEv+m0uELjiFQ+IiFZVYFvs4bdomHrb+V23l2ZhQ2wzwQZ25PgFtmIiFATzBWnaBOiqxh9jV/Mhl3gvKSWSbrV3DFlzPuuAmbYvr0KFG/2DORDxCEEJDr4Aa8tIfxHzB/PfuwIcxczi+V+PggbMVMThwLym3ZJcMAHEl5P2kq6/8zINMEylgEAlola/6bRPR7Wv7pFSsePmqeaAbMGi4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzzrNzwgkeecPZfIm9eKx83c5v1hFo8YW/p2JvHb6zc=;
 b=Fngv/ETn4Qu3tXn6AdDLVnZEFvyiUPijBJoEqLqpfRsIUqRFs/QVkhIQUK2Q1hEuSQUCrPil6wvLqalhZDnCi1fJuin7Ss4YHiDoil4kYV4U+P0vlco6Bl/ABAuqhYgPgPkdN0zX56yPHQ+u/+KVHDKWMge6WStwmXPhlUSOOaGQNehPORhcue1ueXWY5zme2s8xpF3sJIYsi9/8J3WzTmdkpCFJDamRwc/XtMIOytH399rR7LNPbe+KC/S68lVoeUHvVvmON1XptPurZRP24JtexnwMMfn4x+MAxIPza074AUdPakXee0vUhjDmSBkLNmNISqDQnIGpT1IZr93ReQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzzrNzwgkeecPZfIm9eKx83c5v1hFo8YW/p2JvHb6zc=;
 b=ok6S6grYTj/q7va3FWxAwhyqLvDbFF7XT5WUmuJPsKD9d5QNjO4g6YclMYBEpbpIoTCgar3uAgqfp/6+lJwZlJ9+1gZ0tyBvaZ6P9M045MrAA5ZiCTRHefzd8HevCu8nEGV+Iqhpzm984PurAG6ZN8mxEjtGj7ScbiWo6u5tTzw=
Received: from MW4PR04CA0219.namprd04.prod.outlook.com (2603:10b6:303:87::14)
 by DS7PR12MB6192.namprd12.prod.outlook.com (2603:10b6:8:97::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Thu, 25 May 2023 17:28:05 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::bc) by MW4PR04CA0219.outlook.office365.com
 (2603:10b6:303:87::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 17:28:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.18 via Frontend Transport; Thu, 25 May 2023 17:28:05 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:28:01 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 18/33] drm/amdkfd: add raise exception event function
Date: Thu, 25 May 2023 13:27:30 -0400
Message-ID: <20230525172745.702700-18-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT052:EE_|DS7PR12MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fd5f27c-cbad-4e9d-15a5-08db5d456639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MawaYJh2jLabH6Ka5NUQ97NcHEDFrwfCyiplwIMa0btZJ9MisL3IQmrfmHAK9ip6eT1EAOHUpRsXGotiyBQodMUaujLEFlLtA6QbYS29o5rXj4Z+RJBhNaHHTL9WCOZQlriqBi2gd5TeVPBCzFv7PY/u/JQ1Qmvz0AorKigNcTfB7mSZlr6kvV+P7lvthDGFvyfSVzFsSK4E2WJvA24YIaW51CSX/mZXO9kmASF1PUYLL9ggS/AcATxEiK86zw1IV2ErAXvMyGmjQ5R8eMHUOlHsBfZSIFgZOSZmS+bjBsHpRj+J9asJEt8QEgjT83/nMUyewu9qeIsK4ul4QoqYTnhN/YDQ8PjC+jLil8j9qtGb/GTmbYA7ha5JWiajnGvwvSkLFOaDLoqRSjjuL/NK/pZD34LPeYvVnl3SQIxDEPYqdLNk9YWFt8o9RIojd3Mnck9Fh1fJqpC4WywfKA/oWz5ZV++eomTE09MP6j0Zkmou/n0zXk9JRQfjEhMsRDX2lT6yowL+UFbO8100oFflfW4J9qKRCyAYCFfQIXF6o0oDu1inZLKV7tR4pCiwtac5qeruFYReGvMOIEeV7X/aJSk/L9L+ureWy2qhBDLope2NCYvmK8vBe0xvmPVk6H/eP+cGI9Yn4ok/SSlL5VX/VVrvvZEtpnUUXh2HS7JSi8dRR7kOVPvob759txd1MFoLy9LkiOSP+9tcpemC6Qh319c9gbRIgMTfkcLXEY4+84BzYVfM6+aVAJq/07zfK8oDZPaAiHVv5FtTg/saEFGgcQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199021)(36840700001)(46966006)(40470700004)(356005)(82740400003)(1076003)(26005)(186003)(16526019)(40460700003)(81166007)(44832011)(2616005)(36860700001)(47076005)(36756003)(83380400001)(426003)(336012)(2906002)(40480700001)(7696005)(110136005)(41300700001)(316002)(6666004)(82310400005)(70206006)(6636002)(4326008)(70586007)(86362001)(450100002)(8676002)(8936002)(5660300002)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:05.0794 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd5f27c-cbad-4e9d-15a5-08db5d456639
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6192
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

Exception events can be generated from interrupts or queue activitity.

The raise event function will save exception status of a queue, device
or process then notify the debugger of the status change by writing to
a debugger polled file descriptor that the debugger provides during
debug attach.

For memory violation exceptions, extra exception data will be saved.

The debugger will be able to query the saved exception states by query
operation that will be provided by follow up patches.

v2: use new kfd_node struct in prototype.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 104 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |   7 ++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  10 +++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c |   2 +
 4 files changed, 123 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 5e2ee2d1acc4..dccb27fc764b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -24,6 +24,107 @@
 #include "kfd_device_queue_manager.h"
 #include <linux/file.h>
 
+void debug_event_write_work_handler(struct work_struct *work)
+{
+	struct kfd_process *process;
+
+	static const char write_data = '.';
+	loff_t pos = 0;
+
+	process = container_of(work,
+			struct kfd_process,
+			debug_event_workarea);
+
+	kernel_write(process->dbg_ev_file, &write_data, 1, &pos);
+}
+
+/* update process/device/queue exception status, write to descriptor
+ * only if exception_status is enabled.
+ */
+bool kfd_dbg_ev_raise(uint64_t event_mask,
+			struct kfd_process *process, struct kfd_node *dev,
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
@@ -99,6 +200,9 @@ static void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int
 {
 	int i;
 
+	if (!unwind)
+		cancel_work_sync(&target->debug_event_workarea);
+
 	for (i = 0; i < target->n_pdds; i++) {
 		struct kfd_process_device *pdd = target->pdds[i];
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index 3e56225f6ef6..66ee7b95d08a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -25,6 +25,11 @@
 
 #include "kfd_priv.h"
 
+bool kfd_dbg_ev_raise(uint64_t event_mask,
+			struct kfd_process *process, struct kfd_node *dev,
+			unsigned int source_id, bool use_worker,
+			void *exception_data,
+			size_t exception_data_size);
 int kfd_dbg_trap_disable(struct kfd_process *target);
 int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 			void __user *runtime_info,
@@ -35,6 +40,8 @@ static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_node *dev)
 	       KFD_GC_VERSION(dev) >= IP_VERSION(11, 0, 0);
 }
 
+void debug_event_write_work_handler(struct work_struct *work);
+
 /*
  * If GFX off is enabled, chips that do not support RLC restore for the debug
  * registers will disable GFX off temporarily for the entire debug session.
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index f0a45d184c8f..b18cd4bf76bf 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -529,6 +529,7 @@ struct queue_properties {
 	uint32_t ctl_stack_size;
 	uint64_t tba_addr;
 	uint64_t tma_addr;
+	uint64_t exception_status;
 };
 
 #define QUEUE_IS_ACTIVE(q) ((q).queue_size > 0 &&	\
@@ -820,6 +821,11 @@ struct kfd_process_device {
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
@@ -955,12 +961,16 @@ struct kfd_process {
 
 	/* Exception code enable mask and status */
 	uint64_t exception_enable_mask;
+	uint64_t exception_status;
 
 	/* shared virtual memory registered by this process */
 	struct svm_range_list svms;
 
 	bool xnack_enabled;
 
+	/* Work area for debugger event writer worker. */
+	struct work_struct debug_event_workarea;
+
 	/* Tracks debug per-vmid request for debug flags */
 	bool dbg_flags;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index a3846bb87510..fa19c1218748 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1509,6 +1509,8 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	kfd_unref_process(process);
 	get_task_struct(process->lead_thread);
 
+	INIT_WORK(&process->debug_event_workarea, debug_event_write_work_handler);
+
 	return process;
 
 err_register_notifier:
-- 
2.25.1

