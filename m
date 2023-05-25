Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE4171122C
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDBB10E6E9;
	Thu, 25 May 2023 17:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994B710E6E9;
 Thu, 25 May 2023 17:28:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdQDxtQ/Oq/D1VjN+ofN3WKU40yN+Ff6m4MoDH4NE/XKA6Iv91tFdNuGIajI/AutdCxhlTO2SJkeabgHDScUNIBVQBOH4cD5TJ2fa9YcXzoY4FmoaqK4akyblOzoI8UPEdGM6wcuUc4Y2EOchmyxsmq1vc7/KaOWvLXDb2s3BN2ikW70G943dZ0TZ6IHry1c2XYA/7wDEID/5do2FDjrySslkg2h1Nq76k5dltQbjqTGYIWeThJlCx3PXOxEx4+dXkJ8KfTtFI+U2IhsZX0wJeoy/tY+xlTr2LS2OfJcJ/1/UsNg9c7dgdyxwWIhcPOiddDnOB88u6wfpopY78oOqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgHcDUbcYZ92gxFK0yV4eV1Tt/+rTujUPALZ7ffDRzw=;
 b=oSBVasHOeoM4dRnI5RrcF+RH2fP/Zj8m6wVzaOdICeUVW2JyG0rlw57uzruqDrrlbdZ0cWYPM9Y6CAhTMmV9OPqKDx68EnwMDvkGSrTt8ywskrqiitLVhLJrlWKg/BXMkOYK6u5G2sI1yufelVDtQ0vM0qmQEtGyTt8Oarsnd1T0ENIk7hG/0oaaWuNOOmHknFkATHgdK5BlHo/WKZ7KJ/cxP58kuvPFItGYNHwswy+9tiLqZQueMI93YsXP/Dsko1OYlP7wBqv1QNqkjbM5f1liHWZqZHDbZfMaP4NMIzL4zjiMLB2TcECJ2rePQCigDBeFft30LPu8h+/wm+Mp1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgHcDUbcYZ92gxFK0yV4eV1Tt/+rTujUPALZ7ffDRzw=;
 b=2S3MSp7K2h2CbCHQeGnTocbmfBn65RnQGkRWWTVUiDyRpJ7GS/08jYgrsudsorezbyE1q66CuAvyDfy2k7wWnRbB2t1ZGzpqCjAfSzqg8jQr1y1IpETB4cDCmZPxut0PjuVD4P7jwXQko+qqWqiiGxcnw1LdpzpBSrWTFhwgWfA=
Received: from MW4PR03CA0144.namprd03.prod.outlook.com (2603:10b6:303:8c::29)
 by DS0PR12MB6557.namprd12.prod.outlook.com (2603:10b6:8:d3::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Thu, 25 May 2023 17:28:03 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::36) by MW4PR03CA0144.outlook.office365.com
 (2603:10b6:303:8c::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
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
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 17:28:02 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:27:59 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 13/33] drm/amdkfd: prepare map process for single process
 debug devices
Date: Thu, 25 May 2023 13:27:25 -0400
Message-ID: <20230525172745.702700-13-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|DS0PR12MB6557:EE_
X-MS-Office365-Filtering-Correlation-Id: b75de3bf-aa46-406d-7b79-08db5d4564f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oR6EiF5i+6IyFTE2YjEehAvF5yPOZHQGxvOqfWVrsfQiotgkt8VEow7ilGYgx7x3FzCBh4M7PBvV87fsABt7KyIZ705Y5Sk7JAcp9+ivNd4iwNq9wTl/DpC6PJwAk3oFnzWDDi/mXcXnKnt/k/JSJ7h49ooB+uhtEJU+KmAi2hEPgogn0Ho7qBod4hPo5SizvHqpc/FcQipc25miMcy8m/8zqi2a9gwtyFBo2CGRGNx+k7J5U0T0ecUYq1zWHAKGy8ug4QZLugZe4VPasTGJAOEsg36GrI8c2G/VvQo7WCrXVSL/LNmEf6GPSPYsZw1Ahf38xj8uPbY29sGK0p5JnUBEnsb7vETamCKqzkb5f1GG9gzK7DR0oD05G6DTjZ4SDms9ixestrmHlsBOA1xA+6hM+JOZ4sB4SO2zUXwhoWgZbkYOt+/ozLu7dvwXtevaPdCOrMNoz564fro1Guey51G2CUc5oJQmVgmAZ8ahGAKuTVIj1E5J5aBTiwIKXdff1uRH5k+kbbAguVjU28OTx+Z3r8vFsuzTuot+eDEBzTeq9ZjIY6+ZlF8IH3gAPmghscS7bPKT/iXubO9gWO9voRJFuAcxYAMWZNwd9kD6ie43m+CJx0zu/pi8zS6N1jFCs8KGywH+FD1QoUTNrB2RMb4vBzG0jd5kK213A9Wwu0GKIXWKwUzfKLDTiJLxJ+tAsPto5smHX/SSwUeXUzOKQpDJ2LyS+ij8eUIHSPIlpLnbKWocDIRTSQFkOm2IlANMgv7FTW41UKBnxiUUMSrAqQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(8676002)(44832011)(8936002)(5660300002)(41300700001)(16526019)(82740400003)(186003)(26005)(1076003)(70206006)(478600001)(40480700001)(86362001)(110136005)(82310400005)(70586007)(4326008)(7696005)(6666004)(450100002)(316002)(6636002)(81166007)(356005)(40460700003)(2906002)(36756003)(36860700001)(83380400001)(2616005)(426003)(336012)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:02.9390 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b75de3bf-aa46-406d-7b79-08db5d4564f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6557
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

Older HW only supports debugging on a single process because the
SPI debug mode setting registers are device global.

The HWS has supplied a single pinned VMID (0xf) for MAP_PROCESS
for debug purposes. To pin the VMID, the KFD will remove the VMID from
the HWS dynamic VMID allocation via SET_RESOUCES so that a debugged
process will never migrate away from its pinned VMID.

The KFD is responsible for reserving and releasing this pinned VMID
accordingly whenever the debugger attaches and detaches respectively.

v2: spot fix ups using new kfd_node references

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 93 +++++++++++++++++++
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |  5 +
 .../drm/amd/amdkfd/kfd_packet_manager_v9.c    |  9 ++
 .../gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h   |  5 +-
 4 files changed, 111 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index d1f44feb7084..c8519adc89ac 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -1524,6 +1524,7 @@ static int initialize_cpsch(struct device_queue_manager *dqm)
 	dqm->gws_queue_count = 0;
 	dqm->active_runlist = false;
 	INIT_WORK(&dqm->hw_exception_work, kfd_process_hw_exception);
+	dqm->trap_debug_vmid = 0;
 
 	init_sdma_bitmaps(dqm);
 
@@ -2500,6 +2501,98 @@ static void kfd_process_hw_exception(struct work_struct *work)
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
+	updated_vmid_mask = dqm->dev->kfd->shared_resources.compute_vmid_bitmap;
+	updated_vmid_mask &= ~(1 << dqm->dev->vm_info.last_vmid_kfd);
+
+	dqm->dev->kfd->shared_resources.compute_vmid_bitmap = updated_vmid_mask;
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
+	updated_vmid_mask = dqm->dev->kfd->shared_resources.compute_vmid_bitmap;
+	updated_vmid_mask |= (1 << dqm->dev->vm_info.last_vmid_kfd);
+
+	dqm->dev->kfd->shared_resources.compute_vmid_bitmap = updated_vmid_mask;
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
index d4dd3b4acbf0..bf7aa3f84182 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -250,6 +250,7 @@ struct device_queue_manager {
 	struct kfd_mem_obj	*fence_mem;
 	bool			active_runlist;
 	int			sched_policy;
+	uint32_t		trap_debug_vmid;
 
 	/* hw exception  */
 	bool			is_hws_hang;
@@ -285,6 +286,10 @@ unsigned int get_queues_per_pipe(struct device_queue_manager *dqm);
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
index 1fda6dcf84b1..0fe73dbd28af 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
@@ -34,6 +34,9 @@ static int pm_map_process_v9(struct packet_manager *pm,
 {
 	struct pm4_mes_map_process *packet;
 	uint64_t vm_page_table_base_addr = qpd->page_table_base;
+	struct kfd_node *kfd = pm->dqm->dev;
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
index 206f1960857f..8b6b2bd5c148 100644
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

