Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3635D6CAD97
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26E310E6F2;
	Mon, 27 Mar 2023 18:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8705210E6CB;
 Mon, 27 Mar 2023 18:43:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgqBcClN06kZ8quOH1RoE7LDnYuZnXcz9DA1w5G1/zg9dTsocna00vXyUPw3fsXA3CC/hh1ojK6A63t/N3HR+K7jqZ0OZIN0MtQT6XV13T+LvwDBsXcy8valen4cDp1oYhTnDf69zN5Z0pl3asQNWETOomF1/a//hLc+12kX0NnaplktCOeIAaDtIjQnvPCshoHMbcI9oeN/5stiqFSkfJZKysjER2K8yIuxcpSKUksruTG9N2P8qcyX1knMSOOtmr5eEHWaBpnPib4YpPTEyAWBI1bhjg+1d0genTcT9kljg/Y/HvzXbeMMKaVKVFh3n2nHHUnT1P/wsGvtypHZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvUyjhqFaOa2NbG3TLcx1osNjzvW9p2fBWXNVlk2NO8=;
 b=bY0oiDLyhrrT8jsOkIjAlfXjQp2hhwd7WT2cOvygV3r8LP7v5lMw3IvHupfJ4cgKqOESN2RKUHMe5xy0n480MumugMHtNzeBNbipdb9McoYKCki1HT22MGNQstue7NonjkCJKw4fg4dAg1YFfF7gK/E/pwVp5xHxEqVxIfyMPpPd0CZ75oj4CU2UkyTuRa+F4esOL81A7Sc0sB8cEP/OUSfLwcOeB6CcKf7evT81NlZmezt83qWMc/jf75RMr5IRQzwYj9vjaTDcztqcbVdProXOHdDN+KALNUCTsmhm4g1baXAGugrif3WpsyxVQwh11apXiohLSxeXTQJ3jFEKhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvUyjhqFaOa2NbG3TLcx1osNjzvW9p2fBWXNVlk2NO8=;
 b=1T+SZ1TnwnegD4XhXq52Fen4oTXnmWPm963rrbU+2tHaQ0f4YQoQBA4TbQ2Ap4MJMc8jZJV3+QLiy8ENMj0Ae7lgJNNKIN12INldlOetD50MmRmXywkgQ7ZzQHkfBoD34X0C7IeZGFPEUYnYh+9ISVaKygZtkpQXE75IokA1mtQ=
Received: from CY5PR18CA0008.namprd18.prod.outlook.com (2603:10b6:930:5::11)
 by MW4PR12MB6825.namprd12.prod.outlook.com (2603:10b6:303:20d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Mon, 27 Mar
 2023 18:43:56 +0000
Received: from CY4PEPF0000C97C.namprd02.prod.outlook.com
 (2603:10b6:930:5:cafe::9f) by CY5PR18CA0008.outlook.office365.com
 (2603:10b6:930:5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97C.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:56 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:54 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 18/34] drm/amdkfd: add raise exception event function
Date: Mon, 27 Mar 2023 14:43:23 -0400
Message-ID: <20230327184339.125016-18-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97C:EE_|MW4PR12MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: 750a80c0-2911-4b53-45ef-08db2ef33881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u27zO54pv153FTZ4ZExiUBxMetoZsBaxJCRV4MWypZnbPJTjDqVRzKYnDMMawNeCOvIqjE24DyMO39lB0oo2YzFmsyG7Qdg322m85wjsEpnWr7K58PQOM1FDFTd2eKCoUW3NjiqThKBw1JDSbT8By2S/w8PV3TYTQNDYZWgjlvQPBhl4E4UyhtbkfzEnQfddWI3m3mZtiNqhufD9G7KSb18KSbBG4geit8hEM77VKhR10hSYHVJRy14WfHH25aRdJiyp4yxKYeoypH0h3a0lxbuzfxUtrYEW+P4006oqpqIwhFmdRSC3Bz0R40APX4xMIMblkgqvRIVAW8NrnRXamnI673Cx6xkyPFWcurUuijnyn+/HuYp8v1ZuNY8yRrK4vlN0YZ+mGap9SR7OIFvXpgMr9pynd0OReFDa7zdR76eT/cGDix2dfnyPRmyt6KfaGRpZCkqMsRSbvZZTXv2q7NankdiI2IEYn5D2TkFHonHu1eXsVSVZSbMpdwB/78aUZiX4afhAFzXK/l9B9znQLfW0V2Eu6TG5eHlf7EBKs03nQdBPSnwZEFee7eoC0lSXP4rARtnwgogtkWV0ZsZ9QLljhGIf1rm6M/GVEAUkAl9KuiTyAi93uprEBooj9jXcy9HYp8cc9nIHrwKp/iGGe1r42vONrUo40FCsorjk5jBGLHxz3MiALaHe+bCNNHPo6Kkf7bQjfN7unk/OoXVVJRG8v+9DkILOC4PROEum+50=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199021)(40470700004)(46966006)(36840700001)(2616005)(47076005)(83380400001)(450100002)(336012)(426003)(41300700001)(44832011)(36860700001)(36756003)(86362001)(5660300002)(356005)(8936002)(81166007)(82740400003)(40460700003)(54906003)(7696005)(478600001)(70586007)(8676002)(4326008)(70206006)(2906002)(40480700001)(82310400005)(6666004)(16526019)(1076003)(316002)(186003)(26005)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:56.1889 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 750a80c0-2911-4b53-45ef-08db2ef33881
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6825
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

Exception events can be generated from interrupts or queue activitity.

The raise event function will save exception status of a queue, device
or process then notify the debugger of the status change by writing to
a debugger polled file descriptor that the debugger provides during
debug attach.

For memory violation exceptions, extra exception data will be saved.

The debugger will be able to query the saved exception states by query
operation that will be provided by follow up patches.

v3: move debug event worker definitions to this patch.

v2: WIP - fix missing brace

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 104 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |   7 ++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  10 +++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c |   2 +
 4 files changed, 123 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 7e6d8694938d..23ca8123f8f5 100644
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
@@ -99,6 +200,9 @@ static void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int
 {
 	int i;
 
+	if (!unwind)
+		cancel_work_sync(&target->debug_event_workarea);
+
 	for (i = 0; i < target->n_pdds; i++) {
 		struct kfd_process_device *pdd = target->pdds[i];
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index bba599bb4665..a6cdbd9f1b54 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -25,6 +25,11 @@
 
 #include "kfd_priv.h"
 
+bool kfd_dbg_ev_raise(uint64_t event_mask,
+			struct kfd_process *process, struct kfd_dev *dev,
+			unsigned int source_id, bool use_worker,
+			void *exception_data,
+			size_t exception_data_size);
 int kfd_dbg_trap_disable(struct kfd_process *target);
 int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 			void __user *runtime_info,
@@ -35,6 +40,8 @@ static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_dev *dev)
 	       KFD_GC_VERSION(dev) >= IP_VERSION(11, 0, 0);
 }
 
+void debug_event_write_work_handler(struct work_struct *work);
+
 /*
  * If GFX off is enabled, chips that do not support RLC restore for the debug
  * registers will disable GFX off temporarily for the entire debug session.
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 799389767455..6031db7123b9 100644
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
@@ -921,12 +927,16 @@ struct kfd_process {
 
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
index 51dde18c4eef..31c10c76f4ec 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1503,6 +1503,8 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	kfd_unref_process(process);
 	get_task_struct(process->lead_thread);
 
+	INIT_WORK(&process->debug_event_workarea, debug_event_write_work_handler);
+
 	return process;
 
 err_register_notifier:
-- 
2.25.1

