Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BD46CAD88
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A264F10E6E7;
	Mon, 27 Mar 2023 18:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE2610E6C6;
 Mon, 27 Mar 2023 18:43:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HsuxiaOE2eIsO+Oa2MGwrVq/cy3PsIUZoMduRpTpnwzhlJtOGKbv2fQ6mUJOGxX9YFZQRNWLqhpxJRgZSoOa5DypkShZsQMiqEbSuuR3vyqSnif/ZbUOUuKSXtKZQBpfviKWC8e2Gg7e176+VIX1BlMFnovtRZVnZNhSLAq/mUz5AdOPMxiJ25oz1tf/fy6c9gI8WLagMYwt6B9apvUs5pVd0aEQ4VdoWWR0H+75K5RG1queNDZEFARy0wGs5IJapXQDGrcj8Gdrsih7wSf0513eBXQY0GKO5UPGJjN9odU1Zg7G11jIH7FAog7dBcfGdwCZ+gzQNrZRPXLHdfJgBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCtXzVosZSCqUtOO1XS3cBWLO9p8vkiQdVGII2Rxt60=;
 b=QmzK2XWGJFSY40ZgD9rMV4ntRw8TWpEPWF8dxZRqHX+hBUru40MJzgsj7QZ8jHWAIcJZkMo05jLZCZMHbRnw/zwlkBadr2KjfJHzZIi6xDjO60R9oecI/iUkc8k23nluPKH9HYkQ6ynT1vPwB9FtjyqlYjkCrMeotwWFblrdXH6wYVDWYWJJtBgyD0ABfsAicR2uwA3MhWosyoO12QHfnm/fXKuX7Bjvxp6Nk0NvMWATvJ3niIHRBCn/NPMjY62ut01E/RHgLNvS8XoMQMxdeAsS8SvTAtZQvtazdjJX/KBR53SfBg+/T/b4oYQ1V0W+Q9+NN1Jl1n5z+69zBvvuEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCtXzVosZSCqUtOO1XS3cBWLO9p8vkiQdVGII2Rxt60=;
 b=jSTVm3XcwHmcTmrhbl347lM0I0m6NMlm7HmlzdTs4rQc8Isu1D2FicThK6ipHnWJKIO2PcyL657wBpVrlQbn5/vfKezK6mPMi6OIo8/4HfKVetFA2N/Yrdgcc6ORWL38aHY9AMfZpYEkp9uJW4nUV2Y77aaljG1jd0HtSnSVCNU=
Received: from CY5PR18CA0008.namprd18.prod.outlook.com (2603:10b6:930:5::11)
 by CY8PR12MB8266.namprd12.prod.outlook.com (2603:10b6:930:79::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 18:43:55 +0000
Received: from CY4PEPF0000C97C.namprd02.prod.outlook.com
 (2603:10b6:930:5:cafe::35) by CY5PR18CA0008.outlook.office365.com
 (2603:10b6:930:5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97C.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:55 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:53 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 14/34] drm/amdgpu: prepare map process for multi-process debug
 devices
Date: Mon, 27 Mar 2023 14:43:19 -0400
Message-ID: <20230327184339.125016-14-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97C:EE_|CY8PR12MB8266:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf11add-1297-4d8e-6038-08db2ef337f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +u7oAWtEiYDX112VPcolRcXZ7WYGc6WpQmu/ZXfj0v8jtXwsnvxQUh2BbYVTPnnTzM6CTYRLSgruWEmpa6MFouqYVoTkMRuXwaZH2Hg1kT9u8DUxfmE41AOyevCyw2xn0wXVStoCYnpzvTKzhDqGK/jvgj4eiUuOrOkoS/Em5guf4cNZmyQ54sxjM7Z5wg5HlyTYPSn0Rz4fZLi+e7qo21mrWuD+tAKPxys47lW+DAz8FkYJ7m7Xjh0USweUBRGLAoQnuUXi8/f4pixoMo0HKDSRNg5i8jGEIh2MItexoSDp4ziZ1AcsMCPR/J0dshZb+1Z5ND9ZSqLfQyUTKOkZDv6pd8tpBG+kSpQqHWMU13cfLIdwJj98HzXoE44KQNhO6QEqjx4StCaDO8joOuHsxmeWD+1eAQ8Ii/fX2akms3/6Orda4u0Wom0+sy9E8PEQrfjaIge+un3hr23nJXnDgx4y+GuW+LUkAxP3HJkRqCFTIbs06aTaFJhUpA1OyGsDQnFq+Qe/5t1eZi/21PIdcNv8pELI2Ar0fDuXGHc7Jao0kcbUihEqjVAqyH8z/FEL+QNTM60LMimhp4MOmK/yNkXXUAhp52f/mKADR7pAs3pkO4rwNARB+dtbq9y682bLUIoQryBP5c3gMF/+HQLrcz3AELpaSIUfn4c96hNUgD7vzhqg/ly+0+ZkVNHhl8zJhNYYkM4XpFY5iMCsNna65DQwnhVhrVV7IXGf0X1vNwo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199021)(46966006)(40470700004)(36840700001)(86362001)(82310400005)(36756003)(2906002)(40480700001)(40460700003)(478600001)(426003)(83380400001)(6666004)(336012)(26005)(2616005)(1076003)(7696005)(47076005)(110136005)(54906003)(4326008)(36860700001)(70586007)(70206006)(316002)(81166007)(8676002)(450100002)(41300700001)(186003)(82740400003)(16526019)(356005)(5660300002)(44832011)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:55.2984 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf11add-1297-4d8e-6038-08db2ef337f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8266
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

v3: remove unneeded comment.  also add missing kfd_debug.h include
in dqm file.

v2: remove asic family code name comment in per vmid support check

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
index a33825f9caf7..20b8a3e97d8e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -29,4 +29,9 @@ int kfd_dbg_trap_disable(struct kfd_process *target);
 int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 			void __user *runtime_info,
 			uint32_t *runtime_info_size);
+static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_dev *dev)
+{
+	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2);
+}
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 40744dc3db57..a39bd8f3d4bb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -36,6 +36,7 @@
 #include "kfd_kernel_queue.h"
 #include "amdgpu_amdkfd.h"
 #include "mes_api_def.h"
+#include "kfd_debug.h"
 
 /* Size of the per-pipe EOP queue */
 #define CIK_HPD_EOP_BYTES_LOG2 11
@@ -2558,6 +2559,56 @@ int release_debug_trap_vmid(struct device_queue_manager *dqm,
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
index 0cb1504d24cf..bef3be84c5cc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -286,6 +286,9 @@ int reserve_debug_trap_vmid(struct device_queue_manager *dqm,
 			struct qcm_process_device *qpd);
 int release_debug_trap_vmid(struct device_queue_manager *dqm,
 			struct qcm_process_device *qpd);
+int debug_lock_and_unmap(struct device_queue_manager *dqm);
+int debug_map_and_unlock(struct device_queue_manager *dqm);
+int debug_refresh_runlist(struct device_queue_manager *dqm);
 
 static inline unsigned int get_sh_mem_bases_32(struct kfd_process_device *pdd)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
index 363cf8e005cc..81c190337e34 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
@@ -88,6 +88,10 @@ static int pm_map_process_aldebaran(struct packet_manager *pm,
 {
 	struct pm4_mes_map_process_aldebaran *packet;
 	uint64_t vm_page_table_base_addr = qpd->page_table_base;
+	struct kfd_dev *kfd = pm->dqm->dev;
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
index c5f99a471211..8c34a1e725a1 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -782,6 +782,12 @@ struct kfd_process_device {
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
@@ -918,6 +924,9 @@ struct kfd_process {
 
 	bool xnack_enabled;
 
+	/* Tracks debug per-vmid request for debug flags */
+	bool dbg_flags;
+
 	atomic_t poison;
 	/* Queues are in paused stated because we are in the process of doing a CRIU checkpoint */
 	bool queues_paused;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 55a4ddd35e12..ac3b7c245807 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1606,6 +1606,11 @@ struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
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

