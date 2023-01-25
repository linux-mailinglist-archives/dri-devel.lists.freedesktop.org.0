Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AEE67BB48
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3533610E391;
	Wed, 25 Jan 2023 19:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE9F10E39B;
 Wed, 25 Jan 2023 19:54:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9wlFgWR34KGvx++szPUd5UJ4IB1UN5m00eA9DlNBpIYkzXYIbNmOvSuM6fZjmrNG8f4AOCvs+tomoxZktlVKiRTpf6EqEtzJPPeP/BC4GY6dY+dDIPHVkNcyTZMiKU7uiGIOlYDdhwnM7q68DaackjbQLdwzU6Tn3hJKXMpDEWxWElzx6TcMMuAY0UnbRwYwoB1kAX4jaKRi2XJSNUOPxRpxPhLqQua4LSpAGaxoADUCHf0RdakgU0ejovlImXFv7aGR+5FSta8R79UhpeI0Rf3whSQE5d9jST7DPKuEW09FoMBI9fQaD5JaBtNk07FOs6Bt5pW/cCL64jGCS65jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtFRdAGhNYWXQKlVLOPeRxZZhiEatcSkYMWQ50UJFTk=;
 b=X5tFvt6lO2An5E5/T/8WVFa9j+ezjGSTYNewXOJAMK5lM8jCK4tFqunMCxw4QnG3vwDTReOgA6TiRwRkXczsGWs+B4z2AnoQKb62189DNRE3mqsx9YuaKEtUP5R1hM9FJkiLUBq35E3qF1jth0diFhWrfI6qCTqrGqlBV9Z5cEvbx85WkZX0omOKOjwaXN0H2eJJ9WEaQmqe6oPLH9tYYIzIP6sz5x4P74fbMRkKSX5LayBKGH3w4tYS5r97vAvHYBjLe7ep2ni8rBz/GE5WSfWZiwvy/jhbVROFigjih9ePfFsr7v2kalCvHAIvr5aajTYtN9R9iX+TCAg0toTVPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtFRdAGhNYWXQKlVLOPeRxZZhiEatcSkYMWQ50UJFTk=;
 b=1zWkwuhTP1SYIkvSfZ8qnJQD8S6R9qCYXBkPsYnT6jHVST/9y4Mt4gUe14GvkbIZk0rCqyseiWGnMaKoyHlvo/8m2dNRSzKrMPkSUQRQcw29P7rFZgFsfQ4C7ZdeChpnmuEFDAXKEqaFWevj5pzqGvMsPQ59FVWlzWXpi+oPJEk=
Received: from BN8PR15CA0013.namprd15.prod.outlook.com (2603:10b6:408:c0::26)
 by SA0PR12MB4416.namprd12.prod.outlook.com (2603:10b6:806:99::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 19:54:22 +0000
Received: from BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:c0:cafe::ce) by BN8PR15CA0013.outlook.office365.com
 (2603:10b6:408:c0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT073.mail.protection.outlook.com (10.13.177.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 19:54:22 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:18 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/32] drm/amdkfd: prepare map process for single process
 debug devices
Date: Wed, 25 Jan 2023 14:53:41 -0500
Message-ID: <20230125195401.4183544-13-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT073:EE_|SA0PR12MB4416:EE_
X-MS-Office365-Filtering-Correlation-Id: e2d8045c-49ed-4a02-898d-08daff0df40f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l3O0ujC6scEx9QAUVv4qgaI2TmZGBUq6NsKYI5niwQ3UcBnnwd+3pkFN/cuLcEhEyBF/HYQ+SZ2eq2BFB/E6G29v050eBHFjYEmUmSXZLxJZ5iYB1hCc9D0FyPB2mLhbH15Q+O4oaLNNvPKvPztxjjKLFZpDuBVOphLf3P+Gy10IWxeih09AhVH8LMYikdImE2DsFPPDaARcBYLPvhtdiZb8l53w3JABKueTbjauwIqDJXUtuJqja4SL/na5AAU4BwXeq36afLaRZsFBk1c+sp69+f37cHBHw435V9doDtA2PS5oL8Mk0IaxLqyRATrjQn3WFzQglgaI7RwTstnS2Uz+twoNlMnSOTdBOa4LYd+QwAnfTutChqMT8m44bTk25+Rqooka8EtjcaAPDyNh2SVUBwaojnDSi0FCSymwVaeweJ705ol/Db1bkwyVsW0IK/2RahkziR3+WZemFG6RBfOhe6B8jrvaa6eeybCT7o2X4meK/TsJmvFTf2BOGVdhHz7tTFrJwBxgWM5khpP5+lqAtAJxEZD0JGBWAEC+1B4yyaWRU/a/BYuEbBcdYUQAGiBZEJbM2UwFViuc2o4yiKS06qpMzFMZLuIfiSC4yPMo9C8qymR8uylBnX+OBtT33pSFDbDaWgQIupHkO+mMzq5mbN+FVh00S5/crsT+fge6HpDJ/KLj4No9um4Ql2jSwQy70cj804p0uP2FbZm0w3X6qfNpHMoF7Fclj8ubSCk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199018)(40470700004)(36840700001)(46966006)(83380400001)(81166007)(4326008)(36860700001)(70206006)(16526019)(1076003)(70586007)(336012)(26005)(426003)(47076005)(7696005)(478600001)(110136005)(2616005)(450100002)(40480700001)(36756003)(54906003)(186003)(356005)(41300700001)(8936002)(2906002)(40460700003)(86362001)(5660300002)(44832011)(316002)(6666004)(8676002)(82740400003)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:22.0194 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d8045c-49ed-4a02-898d-08daff0df40f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4416
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

Older HW only supports debugging on a single process because the
SPI debug mode setting registers are device global.

The HWS has supplied a single pinned VMID (0xf) for MAP_PROCESS
for debug purposes. To pin the VMID, the KFD will remove the VMID from
the HWS dynamic VMID allocation via SET_RESOUCES so that a debugged
process will never migrate away from its pinned VMID.

The KFD is responsible for reserving and releasing this pinned VMID
accordingly whenever the debugger attaches and detaches respectively.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 101 +++++++++++++++++-
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |   5 +
 .../drm/amd/amdkfd/kfd_packet_manager_v9.c    |   9 ++
 .../gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h   |   5 +-
 4 files changed, 114 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 7556f80d41e4..0cd3a5e9ff25 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -1490,7 +1490,7 @@ static int initialize_cpsch(struct device_queue_manager *dqm)
 	dqm->active_cp_queue_count = 0;
 	dqm->gws_queue_count = 0;
 	dqm->active_runlist = false;
-	INIT_WORK(&dqm->hw_exception_work, kfd_process_hw_exception);
+	dqm->trap_debug_vmid = 0;
 
 	init_sdma_bitmaps(dqm);
 
@@ -1933,8 +1933,7 @@ static int destroy_queue_cpsch(struct device_queue_manager *dqm,
 		if (!dqm->dev->shared_resources.enable_mes) {
 			decrement_queue_count(dqm, qpd, q);
 			retval = execute_queues_cpsch(dqm,
-						      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
-						      USE_DEFAULT_GRACE_PERIOD);
+						      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0, USE_DEFAULT_GRACE_PERIOD);
 			if (retval == -ETIME)
 				qpd->reset_wavefronts = true;
 		} else {
@@ -2463,6 +2462,98 @@ static void kfd_process_hw_exception(struct work_struct *work)
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
@@ -2563,8 +2654,8 @@ int dqm_debugfs_hang_hws(struct device_queue_manager *dqm)
 		return r;
 	}
 	dqm->active_runlist = true;
-	r = execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES,
-				0, USE_DEFAULT_GRACE_PERIOD);
+	r = execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0,
+			USE_DEFAULT_GRACE_PERIOD);
 	dqm_unlock(dqm);
 
 	return r;
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

