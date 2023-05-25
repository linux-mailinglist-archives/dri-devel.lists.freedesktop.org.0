Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8EF711249
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11CF10E70D;
	Thu, 25 May 2023 17:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FCE10E49C;
 Thu, 25 May 2023 17:28:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7TfyQwOmR06XN+1jVM7NQwLq+afXynEq2ZMJfhW4/ZnkGPHpsK8NsruBi20apy4iz9yNURpxdZYYJPDdh2qy1qz/J3SH8/8aDg+FoEEx3P8NFbg2GBfO2B+y7Bg9Ap5yMUhoPQC7DEnf6CiX7f5pWICXBDycQt0bVzOtQLCg2zX9k4OfLRnZKNtNtTGo9ZJ3b0zdf6A9D/fuRcc0IoajlV8zo79eMkh1A1jIaqFsblsyns9g9huH3O/gj5f2s3SHVItoEVQzTZeeEEbdH3K4MCReYmlzt1Gw5oHikR84aCv5VinTIM5c/urLuWL0V7ZLqUDbN7xjp7LAu0H05er2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=US3YC9KUwsqdX/ttSoBoAIxXM0aaSEvVYpwOSx7X8jc=;
 b=DnsN0EyKDjAzFuw99nZoNWO0W4IWhUVoapNo6YIJsPDsJk8VYfGqNPa3vyYfgtGphRQzi+kKHDWdjP6N3eAb2lYKCpIJQ+lDkEcqUoBpGKTDvTAsbU5UtQrkmzNdA5Q/1/MtO3SQEL4ea928ryUD1aho2pwh0E+gGP4R/W6/VBAeo4TRjZgiHkdaFFpYP5X3VllwSlcdvmEkHmYXNsSec9whiNCezbgseN5Im8jEDl+roVMsApof16EoWTFiM8WGlu55YZ9BReTh0b8F5OqfVEEmyEaSXAUuogubgxUHyfeMcMa59KmCWUl+4xhKzctGOKZldpEwM7OpJi9dIKVRCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=US3YC9KUwsqdX/ttSoBoAIxXM0aaSEvVYpwOSx7X8jc=;
 b=fUu6FPCf52lv/ZuzaSnIdDCpUdLq3eoFY/U034N/DLftJPWqXoV/Lo11nAG4ruvPZoxQRhHZB8NlOWBgEcBm7VS2/Kp2WutnS4e1GATlRyy/po7CQD4Psjkls6XxtU9wOoA1o4K0mTzFFTbkZuADCR3BhsmczqF08TFt75ALYew=
Received: from MW4PR03CA0121.namprd03.prod.outlook.com (2603:10b6:303:8c::6)
 by BN9PR12MB5049.namprd12.prod.outlook.com (2603:10b6:408:132::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 17:28:03 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::a4) by MW4PR03CA0121.outlook.office365.com
 (2603:10b6:303:8c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 17:28:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 17:28:03 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:28:00 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 14/33] drm/amdgpu: prepare map process for multi-process debug
 devices
Date: Thu, 25 May 2023 13:27:26 -0400
Message-ID: <20230525172745.702700-14-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|BN9PR12MB5049:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aad4bdc-40bd-4ad5-279c-08db5d456541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a+MsWk7tLxbqZpOXijP28BGikUWIai3vq9uDfWCyGBY0W7MqhFu2I9V0pIrtwbJq9VZW6fgFqIOrj0cZyiD/HXcSBA0RvIFGXYSN9Jmef887XnjFI1FI2h82DVv2A9+z4TZXYyCouP7DdlzedFOdUdl8lJm0Rui5SbCbbPI4X85sKFZkru33R2xko8S1/skWA5frYRHVdKT2hbbsgKIZ00nvrJL8o9ry6zdEFpgIdKvRKbEWyb8+TxWJd2L/lyxpEs1XpZ/A3XE690BF1s7PEHwBmPzMHSKe3KdaQjt3fAgwerSsrAsh5WKUqU9xrepmj8miBaB//W9b3PmaQbpsFpcPrlAke9zTUdtYHdTaJDZH0qwRt5Ma8cF39mGgsWGee+2XHbbwMaBOztbHKt73EWJRMgNkKt3cKkXGJ1MrgO7+5V9F1RkuqRdx5XIp85ZttrrLj8P8aW5LJPQxkffYz6FIOLr+ySV8KKCa/Q+5ylMN99awSPJ0ZIdi1zqUD/Wz2pFULfmt+yU5/sFSoMV87eH8jHAFYYQu7f7DnP7Y2Ve+HyO37SGCBhYvwn8dzvmuZSBJsBZ8EPq0gbnokuNlY0WwKxOuT0j1TDUDrF03ayHHXxb4wqCIQzcYvG0gvThCUMzHTDgDcbW5NoI7T/c3SRbm6zpLAwjRUvP0Zzv696AG9HnR54jOUunpFn9M5CbKFObQjamuFplaM35jL2zMeRU4Ych8oLY6T7gASdnTwkl+HdNwBsVWVv+jdHk0YvBT+UpH4lUWuENhxhBpUeLsdg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(26005)(81166007)(356005)(1076003)(186003)(16526019)(44832011)(2616005)(36860700001)(47076005)(36756003)(426003)(2906002)(336012)(82740400003)(83380400001)(40480700001)(7696005)(316002)(110136005)(6666004)(41300700001)(82310400005)(478600001)(70586007)(70206006)(6636002)(4326008)(8676002)(86362001)(450100002)(8936002)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:03.4546 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aad4bdc-40bd-4ad5-279c-08db5d456541
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5049
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

Unlike single process debug devices, multi-process debug devices allow
debug mode setting per-VMID (non-device-global).

Because the HWS manages PASID-VMID mapping, the new MAP_PROCESS API allows
the KFD to forward the required SPI debug register write requests.

To request a new debug mode setting change, the KFD must be able to
preempt all queues then remap all queues with these new setting
requests for MAP_PROCESS to take effect.

Note that by default, trap enablement in non-debug mode must be disabled
for performance reasons for multi-process debug devices due to setup
overhead in FW.

v2: spot fixup new kfd_node references

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  5 ++
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 51 +++++++++++++++++++
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |  3 ++
 .../drm/amd/amdkfd/kfd_packet_manager_v9.c    | 14 +++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  9 ++++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  5 ++
 6 files changed, 87 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index a8abfe2a0a14..db6d72e7930f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -29,4 +29,9 @@ int kfd_dbg_trap_disable(struct kfd_process *target);
 int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 			void __user *runtime_info,
 			uint32_t *runtime_info_size);
+static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_node *dev)
+{
+	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2);
+}
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index c8519adc89ac..badfe1210bc4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -36,6 +36,7 @@
 #include "kfd_kernel_queue.h"
 #include "amdgpu_amdkfd.h"
 #include "mes_api_def.h"
+#include "kfd_debug.h"
 
 /* Size of the per-pipe EOP queue */
 #define CIK_HPD_EOP_BYTES_LOG2 11
@@ -2593,6 +2594,56 @@ int release_debug_trap_vmid(struct device_queue_manager *dqm,
 	return r;
 }
 
+int debug_lock_and_unmap(struct device_queue_manager *dqm)
+{
+	int r;
+
+	if (dqm->sched_policy == KFD_SCHED_POLICY_NO_HWS) {
+		pr_err("Unsupported on sched_policy: %i\n", dqm->sched_policy);
+		return -EINVAL;
+	}
+
+	if (!kfd_dbg_is_per_vmid_supported(dqm->dev))
+		return 0;
+
+	dqm_lock(dqm);
+
+	r = unmap_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0, 0, false);
+	if (r)
+		dqm_unlock(dqm);
+
+	return r;
+}
+
+int debug_map_and_unlock(struct device_queue_manager *dqm)
+{
+	int r;
+
+	if (dqm->sched_policy == KFD_SCHED_POLICY_NO_HWS) {
+		pr_err("Unsupported on sched_policy: %i\n", dqm->sched_policy);
+		return -EINVAL;
+	}
+
+	if (!kfd_dbg_is_per_vmid_supported(dqm->dev))
+		return 0;
+
+	r = map_queues_cpsch(dqm);
+
+	dqm_unlock(dqm);
+
+	return r;
+}
+
+int debug_refresh_runlist(struct device_queue_manager *dqm)
+{
+	int r = debug_lock_and_unmap(dqm);
+
+	if (r)
+		return r;
+
+	return debug_map_and_unlock(dqm);
+}
+
 #if defined(CONFIG_DEBUG_FS)
 
 static void seq_reg_dump(struct seq_file *m,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index bf7aa3f84182..bb75d93712eb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -290,6 +290,9 @@ int reserve_debug_trap_vmid(struct device_queue_manager *dqm,
 			struct qcm_process_device *qpd);
 int release_debug_trap_vmid(struct device_queue_manager *dqm,
 			struct qcm_process_device *qpd);
+int debug_lock_and_unmap(struct device_queue_manager *dqm);
+int debug_map_and_unlock(struct device_queue_manager *dqm);
+int debug_refresh_runlist(struct device_queue_manager *dqm);
 
 static inline unsigned int get_sh_mem_bases_32(struct kfd_process_device *pdd)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
index 0fe73dbd28af..29a2d0499b67 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
@@ -88,6 +88,10 @@ static int pm_map_process_aldebaran(struct packet_manager *pm,
 {
 	struct pm4_mes_map_process_aldebaran *packet;
 	uint64_t vm_page_table_base_addr = qpd->page_table_base;
+	struct kfd_dev *kfd = pm->dqm->dev->kfd;
+	struct kfd_process_device *pdd =
+			container_of(qpd, struct kfd_process_device, qpd);
+	int i;
 
 	packet = (struct pm4_mes_map_process_aldebaran *)buffer;
 	memset(buffer, 0, sizeof(struct pm4_mes_map_process_aldebaran));
@@ -102,6 +106,16 @@ static int pm_map_process_aldebaran(struct packet_manager *pm,
 	packet->bitfields14.num_oac = qpd->num_oac;
 	packet->bitfields14.sdma_enable = 1;
 	packet->bitfields14.num_queues = (qpd->is_debug) ? 0 : qpd->queue_count;
+	packet->spi_gdbg_per_vmid_cntl = pdd->spi_dbg_override |
+						pdd->spi_dbg_launch_mode;
+
+	if (pdd->process->debug_trap_enabled) {
+		for (i = 0; i < kfd->device_info.num_of_watch_points; i++)
+			packet->tcp_watch_cntl[i] = pdd->watch_points[i];
+
+		packet->bitfields2.single_memops =
+				!!(pdd->process->dbg_flags & KFD_DBG_TRAP_FLAG_SINGLE_MEM_OP);
+	}
 
 	packet->sh_mem_config = qpd->sh_mem_config;
 	packet->sh_mem_bases = qpd->sh_mem_bases;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 4c912b7735b5..8fca7175daab 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -816,6 +816,12 @@ struct kfd_process_device {
 	uint64_t faults;
 	uint64_t page_in;
 	uint64_t page_out;
+
+	/* Tracks debug per-vmid request settings */
+	uint32_t spi_dbg_override;
+	uint32_t spi_dbg_launch_mode;
+	uint32_t watch_points[4];
+
 	/*
 	 * If this process has been checkpointed before, then the user
 	 * application will use the original gpu_id on the
@@ -952,6 +958,9 @@ struct kfd_process {
 
 	bool xnack_enabled;
 
+	/* Tracks debug per-vmid request for debug flags */
+	bool dbg_flags;
+
 	atomic_t poison;
 	/* Queues are in paused stated because we are in the process of doing a CRIU checkpoint */
 	bool queues_paused;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index d63a764dafb9..0281f79fcd7d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1612,6 +1612,11 @@ struct kfd_process_device *kfd_create_process_device_data(struct kfd_node *dev,
 	}
 
 	p->pdds[p->n_pdds++] = pdd;
+	if (kfd_dbg_is_per_vmid_supported(pdd->dev))
+		pdd->spi_dbg_override = pdd->dev->kfd2kgd->disable_debug_trap(
+							pdd->dev->adev,
+							false,
+							0);
 
 	/* Init idr used for memory handle translation */
 	idr_init(&pdd->alloc_idr);
-- 
2.25.1

