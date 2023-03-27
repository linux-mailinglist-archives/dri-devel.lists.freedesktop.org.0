Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAC76CAD98
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFBF10E6E8;
	Mon, 27 Mar 2023 18:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CD510E6BE;
 Mon, 27 Mar 2023 18:43:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrG7lh6Rk4x1dRsYGqNS6Pq0gGI2S6fmp+RmK+rbgVsU7YGX638gvKNGIfv3h7o7w5nILVxMit6oBkuYfX7aMy66gmUAMAYPdZIwq0WsQTbagupxaOolYm6Ww+uGsL8k4e5SCcrjwo5QdzEg/AMCl6h426OBJE0xtEfHCVmUHM3O4UeiteHMSbfvMYZbPgLEN5M1rW4rfYQPO8XPz58KgEn4cbhw8cQkXgNLf1IrEvIuncp4sQAQGhORbIwy3qT0fcjELgVDMMbs3CPyr/aTDNMOnb6F3VmsVjOX5qkJffZBnjHr6oSat/dllvQAakXl7/4ENnpU8tEuwoYQKPdWNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynbhxscDe6MGXdd1+KdDsTyQ6OmtJzww+fJiDjlmMCM=;
 b=KAj9QawI+Dc0k7pg3qX+I6OwuNxBZ0uYTwC72v0sp2rhfc6n7XXc7WAEA5iy8GrIlZkCpkYBb/GkuJjLXA9LmPOse4qgT6kw8++usnS4nccz4sM8SfEVEPV2PWCGoaqBoJbsSq/tz72q7onyR9GiZuhmhxIF7DZ09V6OZS3NC36mVkk09NOr8OBjbkAZpTqJZp8M039bELmwhr0LvnegP8KZB0PIlql4Im9QlsuQ4tlRKH7MjFAXsxnOifO2s5QUw9BDQp5DqIgsJz/kgL5s4XYI6Ed+vC+3G/ZFQv7yhGZiLbwt5Is1Yf84NnLOTk36KHalgEnRxc0spg6Ba+UPKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynbhxscDe6MGXdd1+KdDsTyQ6OmtJzww+fJiDjlmMCM=;
 b=gUAZXFzGgv7Xsqx+A/av3xNsXOVHe6JpaDBjFtOo4Xh66rvAQDTKoHRY3HCpUF3yY+luOtPidXUF0rwO0SHG/giGZqAC4pgRuX//jyfJkui+vtd9Mbiu+tNpNLCuYuylOCDXYcMPiLrj7Q9/+FI3UWrlWPKoDQJmpGypHm/4Pxs=
Received: from CY8PR02CA0015.namprd02.prod.outlook.com (2603:10b6:930:4d::18)
 by MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 18:43:55 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:4d:cafe::ea) by CY8PR02CA0015.outlook.office365.com
 (2603:10b6:930:4d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.43 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:54 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:52 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 13/34] drm/amdkfd: prepare map process for single process
 debug devices
Date: Mon, 27 Mar 2023 14:43:18 -0400
Message-ID: <20230327184339.125016-13-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|MW3PR12MB4409:EE_
X-MS-Office365-Filtering-Correlation-Id: 3518b28b-f9b0-47ac-8d6f-08db2ef337c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AmUZ7/jX24xIjuo1jfIaS2RzgjmOJBnHikKhaJqwKVFnjJV6ecaUQ1iaCdpb8izdaoR6PcHAF4IZ4o7Wv9+1lyCGl1vr+PLkbuQwlze+AmisPqja5PDDbq9gdbCBNy+bY8DLoH7poPQ2rSIwzSBPRmWs8NAE4XvFWp3mblovtkTf+WEl4FmFosVifdUzw0ebzHx39iIysSt86EKDKDwd418Ygu8ioDt7Q2ec0B2jR5DI2gqdJ8CG46brvkxYi55HZAVhTT58wFZhDPg6T0jRfropjJcoxnHC7U/HFpnqZLXyrQSaC3SACLvFiV6hGBFwMWa9NwEadvUqExne3WFJ9bTvZK6Vv72eBqsp8vkE4pG54k9p2fG/8EyMqW2GLI/BThRYm0p280JB3Sqqwtez2eupn/ypbyxoNZq5Wjk+03BSkhU8MieXo8fTZe5Dd/fBtGoEuW4IXOCTq2cutX2cghUqk4Xmh/alBf4xj0rPF0a8yffqfcPAXq1sPYI9uACJwf6trRVmf8vlI5YVCNUrdmyrQpKlxYf9FgWmPkmZyvWilqpBX8fpn0uKEhqeES9wfcHPfZdGwKBQBFV72/ZTJ9PdHsPH0JOhibOxAbZtwzD7U/o9N8ADr1qr254R7kp9A+IQTzV+Z8VmUJCLquB4AdkJVCXdDeHaA8PH4UOj2HaAWVyFaxeQ/G6GcD4Dw2zTU2gjisyRda4fyiM3Q+O43bbnEswyCW64NaFJtz8QH4s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(36860700001)(478600001)(316002)(54906003)(110136005)(81166007)(82310400005)(8936002)(5660300002)(86362001)(36756003)(2906002)(44832011)(356005)(70206006)(70586007)(450100002)(8676002)(40480700001)(41300700001)(4326008)(336012)(16526019)(186003)(2616005)(426003)(1076003)(26005)(83380400001)(82740400003)(6666004)(7696005)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:54.9874 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3518b28b-f9b0-47ac-8d6f-08db2ef337c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4409
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

Older HW only supports debugging on a single process because the
SPI debug mode setting registers are device global.

The HWS has supplied a single pinned VMID (0xf) for MAP_PROCESS
for debug purposes. To pin the VMID, the KFD will remove the VMID from
the HWS dynamic VMID allocation via SET_RESOUCES so that a debugged
process will never migrate away from its pinned VMID.

The KFD is responsible for reserving and releasing this pinned VMID
accordingly whenever the debugger attaches and detaches respectively.

v2: remove unneeded formatting and add back mistakenly removed worker.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 93 +++++++++++++++++++
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |  5 +
 .../drm/amd/amdkfd/kfd_packet_manager_v9.c    |  9 ++
 .../gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h   |  5 +-
 4 files changed, 111 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 807cad60d21e..40744dc3db57 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -1492,6 +1492,7 @@ static int initialize_cpsch(struct device_queue_manager *dqm)
 	dqm->gws_queue_count = 0;
 	dqm->active_runlist = false;
 	INIT_WORK(&dqm->hw_exception_work, kfd_process_hw_exception);
+	dqm->trap_debug_vmid = 0;
 
 	init_sdma_bitmaps(dqm);
 
@@ -2465,6 +2466,98 @@ static void kfd_process_hw_exception(struct work_struct *work)
 	amdgpu_amdkfd_gpu_reset(dqm->dev->adev);
 }
 
+int reserve_debug_trap_vmid(struct device_queue_manager *dqm,
+				struct qcm_process_device *qpd)
+{
+	int r;
+	int updated_vmid_mask;
+
+	if (dqm->sched_policy == KFD_SCHED_POLICY_NO_HWS) {
+		pr_err("Unsupported on sched_policy: %i\n", dqm->sched_policy);
+		return -EINVAL;
+	}
+
+	dqm_lock(dqm);
+
+	if (dqm->trap_debug_vmid != 0) {
+		pr_err("Trap debug id already reserved\n");
+		r = -EBUSY;
+		goto out_unlock;
+	}
+
+	r = unmap_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0,
+			USE_DEFAULT_GRACE_PERIOD, false);
+	if (r)
+		goto out_unlock;
+
+	updated_vmid_mask = dqm->dev->shared_resources.compute_vmid_bitmap;
+	updated_vmid_mask &= ~(1 << dqm->dev->vm_info.last_vmid_kfd);
+
+	dqm->dev->shared_resources.compute_vmid_bitmap = updated_vmid_mask;
+	dqm->trap_debug_vmid = dqm->dev->vm_info.last_vmid_kfd;
+	r = set_sched_resources(dqm);
+	if (r)
+		goto out_unlock;
+
+	r = map_queues_cpsch(dqm);
+	if (r)
+		goto out_unlock;
+
+	pr_debug("Reserved VMID for trap debug: %i\n", dqm->trap_debug_vmid);
+
+out_unlock:
+	dqm_unlock(dqm);
+	return r;
+}
+
+/*
+ * Releases vmid for the trap debugger
+ */
+int release_debug_trap_vmid(struct device_queue_manager *dqm,
+			struct qcm_process_device *qpd)
+{
+	int r;
+	int updated_vmid_mask;
+	uint32_t trap_debug_vmid;
+
+	if (dqm->sched_policy == KFD_SCHED_POLICY_NO_HWS) {
+		pr_err("Unsupported on sched_policy: %i\n", dqm->sched_policy);
+		return -EINVAL;
+	}
+
+	dqm_lock(dqm);
+	trap_debug_vmid = dqm->trap_debug_vmid;
+	if (dqm->trap_debug_vmid == 0) {
+		pr_err("Trap debug id is not reserved\n");
+		r = -EINVAL;
+		goto out_unlock;
+	}
+
+	r = unmap_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0,
+			USE_DEFAULT_GRACE_PERIOD, false);
+	if (r)
+		goto out_unlock;
+
+	updated_vmid_mask = dqm->dev->shared_resources.compute_vmid_bitmap;
+	updated_vmid_mask |= (1 << dqm->dev->vm_info.last_vmid_kfd);
+
+	dqm->dev->shared_resources.compute_vmid_bitmap = updated_vmid_mask;
+	dqm->trap_debug_vmid = 0;
+	r = set_sched_resources(dqm);
+	if (r)
+		goto out_unlock;
+
+	r = map_queues_cpsch(dqm);
+	if (r)
+		goto out_unlock;
+
+	pr_debug("Released VMID for trap debug: %i\n", trap_debug_vmid);
+
+out_unlock:
+	dqm_unlock(dqm);
+	return r;
+}
+
 #if defined(CONFIG_DEBUG_FS)
 
 static void seq_reg_dump(struct seq_file *m,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index fb48b124161f..0cb1504d24cf 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -250,6 +250,7 @@ struct device_queue_manager {
 	struct kfd_mem_obj	*fence_mem;
 	bool			active_runlist;
 	int			sched_policy;
+	uint32_t		trap_debug_vmid;
 
 	/* hw exception  */
 	bool			is_hws_hang;
@@ -281,6 +282,10 @@ unsigned int get_queues_per_pipe(struct device_queue_manager *dqm);
 unsigned int get_pipes_per_mec(struct device_queue_manager *dqm);
 unsigned int get_num_sdma_queues(struct device_queue_manager *dqm);
 unsigned int get_num_xgmi_sdma_queues(struct device_queue_manager *dqm);
+int reserve_debug_trap_vmid(struct device_queue_manager *dqm,
+			struct qcm_process_device *qpd);
+int release_debug_trap_vmid(struct device_queue_manager *dqm,
+			struct qcm_process_device *qpd);
 
 static inline unsigned int get_sh_mem_bases_32(struct kfd_process_device *pdd)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
index f0cdc8695b8c..363cf8e005cc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
@@ -34,6 +34,9 @@ static int pm_map_process_v9(struct packet_manager *pm,
 {
 	struct pm4_mes_map_process *packet;
 	uint64_t vm_page_table_base_addr = qpd->page_table_base;
+	struct kfd_dev *kfd = pm->dqm->dev;
+	struct kfd_process_device *pdd =
+			container_of(qpd, struct kfd_process_device, qpd);
 
 	packet = (struct pm4_mes_map_process *)buffer;
 	memset(buffer, 0, sizeof(struct pm4_mes_map_process));
@@ -49,6 +52,12 @@ static int pm_map_process_v9(struct packet_manager *pm,
 	packet->bitfields14.sdma_enable = 1;
 	packet->bitfields14.num_queues = (qpd->is_debug) ? 0 : qpd->queue_count;
 
+	if (kfd->dqm->trap_debug_vmid && pdd->process->debug_trap_enabled &&
+			pdd->process->runtime_info.runtime_state == DEBUG_RUNTIME_STATE_ENABLED) {
+		packet->bitfields2.debug_vmid = kfd->dqm->trap_debug_vmid;
+		packet->bitfields2.new_debug = 1;
+	}
+
 	packet->sh_mem_config = qpd->sh_mem_config;
 	packet->sh_mem_bases = qpd->sh_mem_bases;
 	if (qpd->tba_addr) {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h b/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
index 795001c947e1..bb6edbc27de7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
@@ -146,7 +146,10 @@ struct pm4_mes_map_process {
 	union {
 		struct {
 			uint32_t pasid:16;
-			uint32_t reserved1:8;
+			uint32_t reserved1:2;
+			uint32_t debug_vmid:4;
+			uint32_t new_debug:1;
+			uint32_t reserved2:1;
 			uint32_t diq_enable:1;
 			uint32_t process_quantum:7;
 		} bitfields2;
-- 
2.25.1

