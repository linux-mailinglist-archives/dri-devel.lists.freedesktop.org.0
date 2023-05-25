Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0FB71123F
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1576E10E6EF;
	Thu, 25 May 2023 17:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0B110E6ED;
 Thu, 25 May 2023 17:28:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gx/JgfSkmZjhLpzhX3ps+/wdSYU8BEBUUNi43UcwQQffLdfublSKl/ag6Wt3uSd6GntTpyyFH+rxjOPIY33Ys/m55HBFJKPe5txEwJ0oQky+C+nxCZ50qcTB8BGOhUfBAD+3XM/d0QiIPXyGxK63aKaeL2kw5wtbXr1LcCJIwfw+b2otlHuq7QqJWRliRbAwy94FdRiAojnHA1JfhVe9pm9ywmOP5AKYozIdFiO/K36KmJVuF5TKYg4dE1qufdgkvl65i5ECV0/f8nW5W0wq/IA8zM+M+ISXaeVxTSPH1NS1/XZY23FLGeEtVy0dEVka8X5zF4cZ3f2kzHQujyIRmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VKqXj2KP7lDssbhfU63Cq9nszyKzRQgUNKQREaSPWw=;
 b=GixeVuC3+lavy7AN7ss8IwTt721CzBRigxsIUKp4pNBVR3i1FYS517s3sMR+HHTIJLsVKhnSG9A4d/cKn2PckyD5/6OoJCoiLg9gT7XcGc5P9mIfvESui4hR48Xwm5n4NjB1ebpUb53MFKm3rx1JLEZBa4tKnvYy0jUINYgLnsvjweLWc8lCt21bv6gcdyR2ILyv1w/uZyGcFXfMZDG/xekuYwHdPy+Vqm6JXgykEI74yxCF49uoNQmB1MhW+S4O/COe378X9S1QLgyHDtV1Ad3br/Q1S7Gf/UaUl9GzJw+3cTX19RGbOrlFzZUAlzs7KhtfGu3IO+V6Ykj453n/Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VKqXj2KP7lDssbhfU63Cq9nszyKzRQgUNKQREaSPWw=;
 b=2Psx5SpBEpXd1GP91LaofDAtmxyM2h3T0zwHV6Z4KeKg31UD2U7mg/hlOrRGBUO5SqjSuiiu//edYEGJe7Y78mohHSM6SC8tUI/TLa/dZ8/grN6XC+nbEFk+QzZAl/QPgBvniI8VWkt29c7o4HJnf0oRv2QP0DUARzI87B41Bps=
Received: from MW4PR04CA0224.namprd04.prod.outlook.com (2603:10b6:303:87::19)
 by DS7PR12MB6357.namprd12.prod.outlook.com (2603:10b6:8:96::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 17:28:04 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::e4) by MW4PR04CA0224.outlook.office365.com
 (2603:10b6:303:87::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 17:28:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.18 via Frontend Transport; Thu, 25 May 2023 17:28:04 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:28:01 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 17/33] drm/amdkfd: apply trap workaround for gfx11
Date: Thu, 25 May 2023 13:27:29 -0400
Message-ID: <20230525172745.702700-17-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT052:EE_|DS7PR12MB6357:EE_
X-MS-Office365-Filtering-Correlation-Id: 02138be1-b5ff-4649-697b-08db5d4565ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Ir67udBj1pe3nQsZrq8ijvJc26CCthLybv+tlU2p7MJXsS+XCzIy8gaW4AjWDwPzQnhGiGMrG7FYDoEj/krJGelkQW3Ag0lW5/j91tz9w/2QOvd5H/fw2h3/9+B6soQMd+ILotS9cVBQKpTuqkPcpqiAO480h9TQuHW4MD7LOM1KdhHA9CcGj1yR7xuFW71cxExx3WWJkCt7jhAOPULpAVLKANZnz1TOGXAicb1DWu4JMwm/cZmKZapZr2qbbP2JU7HUq/a1xHcv0zdUWh2DkNYNgffAVxK1/LZps6f/wcAHrpuFiq6pph8OYPBLPwMRUOGq5i+EBDha5e7P4kBj0Rqedr6CzXX+EOA5yObM5l8oL+E8isJDB60lVpJ85LNk3dXMlxUrPWPHyEuYDOl9CugMhm4Vao4Tgp9+Wyx3n9jWQ1RhO9JHa1tM2UFKtmTvykVqnIRlXONuW6QyP7FVixtO8KnitFLu28mXBJrVL9XGniDmHCELRbIYFmCT7YwoZYAtoiJ5NKZkSAQpB3FG0Zt0YSeGTJ10F39v3B8k+nAYPkYMFA5ZqfaKcseX8c5q5Gt3GXqQ8OU6zUR6HC4TYBl/uwqJFOxbDJQy+hRTM9Q5oNVysd8U2Nvedd8l4+UVXQSBO//8WE2pzLcDQVRGypDZdfUuz4dDef9HOQk4sehl/kFFOXCMtWzzaQLabcVwzZ9wu8aEWrcHdUf2Kz95lhR0gu5jqoyG8DdKqf0g8Y2UOI4v3eDG555OMupL1rl0/RvwxqmQXGDsKZGXAJzUySL5QBSiFlhy8K2GAjP+wk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199021)(46966006)(36840700001)(40470700004)(30864003)(2906002)(66899021)(5660300002)(47076005)(36860700001)(82310400005)(8936002)(44832011)(8676002)(450100002)(6666004)(40460700003)(6636002)(41300700001)(70206006)(316002)(4326008)(110136005)(36756003)(70586007)(478600001)(7696005)(40480700001)(81166007)(26005)(86362001)(2616005)(83380400001)(186003)(16526019)(356005)(336012)(426003)(1076003)(82740400003)(36900700001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:04.5638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02138be1-b5ff-4649-697b-08db5d4565ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6357
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

Due to a HW bug, waves in only half the shader arrays can enter trap.

When starting a debug session, relocate all waves to the first shader
array of each shader engine and mask off the 2nd shader array as
unavailable.

When ending a debug session, re-enable the 2nd shader array per
shader engine.

User CU masking per queue cannot be guaranteed to remain functional
if requested during debugging (e.g. user cu mask requests only 2nd shader
array as an available resource leading to zero HW resources available)
nor can runtime be alerted of any of these changes during execution.

Make user CU masking and debugging mutual exclusive with respect to
availability.

If the debugger tries to attach to a process with a user cu masked
queue, return the runtime status as enabled but busy.

If the debugger tries to attach and fails to reallocate queue waves to
the first shader array of each shader engine, return the runtime status
as enabled but with an error.

In addition, like any other mutli-process debug supported devices,
disable trap temporary setup per-process to avoid performance impact from
setup overhead.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h       |  2 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        |  7 +--
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  2 -
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 57 +++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  3 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager.c |  7 +++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c  |  3 +-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |  3 +-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c  | 42 ++++++++++----
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   |  3 +-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c   |  3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  5 +-
 .../amd/amdkfd/kfd_process_queue_manager.c    |  9 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c     |  7 ++-
 14 files changed, 122 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
index d20df0cf0d88..b5f5eed2b5ef 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
@@ -219,6 +219,8 @@ struct mes_add_queue_input {
 	uint32_t        gws_size;
 	uint64_t	tba_addr;
 	uint64_t	tma_addr;
+	uint32_t	trap_en;
+	uint32_t	skip_process_ctx_clear;
 	uint32_t	is_kfd_process;
 	uint32_t	is_aql_queue;
 	uint32_t	queue_size;
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index 861910a6662d..c4e3cb8d44de 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -202,17 +202,14 @@ static int mes_v11_0_add_hw_queue(struct amdgpu_mes *mes,
 	mes_add_queue_pkt.gws_size = input->gws_size;
 	mes_add_queue_pkt.trap_handler_addr = input->tba_addr;
 	mes_add_queue_pkt.tma_addr = input->tma_addr;
+	mes_add_queue_pkt.trap_en = input->trap_en;
+	mes_add_queue_pkt.skip_process_ctx_clear = input->skip_process_ctx_clear;
 	mes_add_queue_pkt.is_kfd_process = input->is_kfd_process;
 
 	/* For KFD, gds_size is re-used for queue size (needed in MES for AQL queues) */
 	mes_add_queue_pkt.is_aql_queue = input->is_aql_queue;
 	mes_add_queue_pkt.gds_size = input->queue_size;
 
-	if (!(((adev->mes.sched_version & AMDGPU_MES_VERSION_MASK) >= 4) &&
-		  (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(11, 0, 0)) &&
-		  (adev->ip_versions[GC_HWIP][0] <= IP_VERSION(11, 0, 3))))
-		mes_add_queue_pkt.trap_en = 1;
-
 	/* For KFD, gds_size is re-used for queue size (needed in MES for AQL queues) */
 	mes_add_queue_pkt.is_aql_queue = input->is_aql_queue;
 	mes_add_queue_pkt.gds_size = input->queue_size;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 9d0c247f80fe..a5c457863048 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -537,8 +537,6 @@ static int kfd_ioctl_set_cu_mask(struct file *filp, struct kfd_process *p,
 		goto out;
 	}
 
-	minfo.update_flag = UPDATE_FLAG_CU_MASK;
-
 	mutex_lock(&p->mutex);
 
 	retval = pqm_update_mqd(&p->pqm, args->queue_id, &minfo);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 73b07b5f17f1..5e2ee2d1acc4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -24,6 +24,57 @@
 #include "kfd_device_queue_manager.h"
 #include <linux/file.h>
 
+static int kfd_dbg_set_queue_workaround(struct queue *q, bool enable)
+{
+	struct mqd_update_info minfo = {0};
+	int err;
+
+	if (!q)
+		return 0;
+
+	if (KFD_GC_VERSION(q->device) < IP_VERSION(11, 0, 0) ||
+	    KFD_GC_VERSION(q->device) >= IP_VERSION(12, 0, 0))
+		return 0;
+
+	if (enable && q->properties.is_user_cu_masked)
+		return -EBUSY;
+
+	minfo.update_flag = enable ? UPDATE_FLAG_DBG_WA_ENABLE : UPDATE_FLAG_DBG_WA_DISABLE;
+
+	q->properties.is_dbg_wa = enable;
+	err = q->device->dqm->ops.update_queue(q->device->dqm, q, &minfo);
+	if (err)
+		q->properties.is_dbg_wa = false;
+
+	return err;
+}
+
+static int kfd_dbg_set_workaround(struct kfd_process *target, bool enable)
+{
+	struct process_queue_manager *pqm = &target->pqm;
+	struct process_queue_node *pqn;
+	int r = 0;
+
+	list_for_each_entry(pqn, &pqm->queues, process_queue_list) {
+		r = kfd_dbg_set_queue_workaround(pqn->q, enable);
+		if (enable && r)
+			goto unwind;
+	}
+
+	return 0;
+
+unwind:
+	list_for_each_entry(pqn, &pqm->queues, process_queue_list)
+		kfd_dbg_set_queue_workaround(pqn->q, false);
+
+	if (enable)
+		target->runtime_info.runtime_state = r == -EBUSY ?
+				DEBUG_RUNTIME_STATE_ENABLED_BUSY :
+				DEBUG_RUNTIME_STATE_ENABLED_ERROR;
+
+	return r;
+}
+
 static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
 {
 	uint32_t spi_dbg_cntl = pdd->spi_dbg_override | pdd->spi_dbg_launch_mode;
@@ -77,6 +128,8 @@ static void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int
 		else
 			kfd_dbg_set_mes_debug_mode(pdd);
 	}
+
+	kfd_dbg_set_workaround(target, false);
 }
 
 int kfd_dbg_trap_disable(struct kfd_process *target)
@@ -111,6 +164,10 @@ static int kfd_dbg_trap_activate(struct kfd_process *target)
 {
 	int i, r = 0;
 
+	r = kfd_dbg_set_workaround(target, true);
+	if (r)
+		return r;
+
 	for (i = 0; i < target->n_pdds; i++) {
 		struct kfd_process_device *pdd = target->pdds[i];
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index 17481f824647..3e56225f6ef6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -31,7 +31,8 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 			uint32_t *runtime_info_size);
 static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_node *dev)
 {
-	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2);
+	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2) ||
+	       KFD_GC_VERSION(dev) >= IP_VERSION(11, 0, 0);
 }
 
 /*
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index badfe1210bc4..9186903aa9ff 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -226,6 +226,10 @@ static int add_queue_mes(struct device_queue_manager *dqm, struct queue *q,
 	queue_input.paging = false;
 	queue_input.tba_addr = qpd->tba_addr;
 	queue_input.tma_addr = qpd->tma_addr;
+	queue_input.trap_en = KFD_GC_VERSION(q->device) < IP_VERSION(11, 0, 0) ||
+			      KFD_GC_VERSION(q->device) >= IP_VERSION(12, 0, 0) ||
+			      q->properties.is_dbg_wa;
+	queue_input.skip_process_ctx_clear = qpd->pqm->process->debug_trap_enabled;
 
 	queue_type = convert_to_mes_queue_type(q->properties.type);
 	if (queue_type < 0) {
@@ -1715,6 +1719,9 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 	 * updates the is_evicted flag but is a no-op otherwise.
 	 */
 	q->properties.is_evicted = !!qpd->evicted;
+	q->properties.is_dbg_wa = qpd->pqm->process->debug_trap_enabled &&
+			KFD_GC_VERSION(q->device) >= IP_VERSION(11, 0, 0) &&
+			KFD_GC_VERSION(q->device) < IP_VERSION(12, 0, 0);
 
 	if (qd)
 		mqd_mgr->restore_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj, &q->gart_mqd_addr,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
index eb11940bec34..65c9f01a1f86 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
@@ -48,8 +48,7 @@ static void update_cu_mask(struct mqd_manager *mm, void *mqd,
 	struct cik_mqd *m;
 	uint32_t se_mask[4] = {0}; /* 4 is the max # of SEs */
 
-	if (!minfo || (minfo->update_flag != UPDATE_FLAG_CU_MASK) ||
-	    !minfo->cu_mask.ptr)
+	if (!minfo || !minfo->cu_mask.ptr)
 		return;
 
 	mqd_symmetrically_map_cu_mask(mm,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
index eaaa4f4ddaaa..a0ac4f2fe6b5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
@@ -48,8 +48,7 @@ static void update_cu_mask(struct mqd_manager *mm, void *mqd,
 	struct v10_compute_mqd *m;
 	uint32_t se_mask[4] = {0}; /* 4 is the max # of SEs */
 
-	if (!minfo || (minfo->update_flag != UPDATE_FLAG_CU_MASK) ||
-	    !minfo->cu_mask.ptr)
+	if (!minfo || !minfo->cu_mask.ptr)
 		return;
 
 	mqd_symmetrically_map_cu_mask(mm,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
index 3a48bbc589fe..9a9b4e853516 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
@@ -46,15 +46,33 @@ static void update_cu_mask(struct mqd_manager *mm, void *mqd,
 {
 	struct v11_compute_mqd *m;
 	uint32_t se_mask[KFD_MAX_NUM_SE] = {0};
+	bool has_wa_flag = minfo && (minfo->update_flag & (UPDATE_FLAG_DBG_WA_ENABLE |
+			UPDATE_FLAG_DBG_WA_DISABLE));
 
-	if (!minfo || (minfo->update_flag != UPDATE_FLAG_CU_MASK) ||
-	    !minfo->cu_mask.ptr)
+	if (!minfo || !(has_wa_flag || minfo->cu_mask.ptr))
 		return;
 
+	m = get_mqd(mqd);
+
+	if (has_wa_flag) {
+		uint32_t wa_mask = minfo->update_flag == UPDATE_FLAG_DBG_WA_ENABLE ?
+						0xffff : 0xffffffff;
+
+		m->compute_static_thread_mgmt_se0 = wa_mask;
+		m->compute_static_thread_mgmt_se1 = wa_mask;
+		m->compute_static_thread_mgmt_se2 = wa_mask;
+		m->compute_static_thread_mgmt_se3 = wa_mask;
+		m->compute_static_thread_mgmt_se4 = wa_mask;
+		m->compute_static_thread_mgmt_se5 = wa_mask;
+		m->compute_static_thread_mgmt_se6 = wa_mask;
+		m->compute_static_thread_mgmt_se7 = wa_mask;
+
+		return;
+	}
+
 	mqd_symmetrically_map_cu_mask(mm,
 		minfo->cu_mask.ptr, minfo->cu_mask.count, se_mask);
 
-	m = get_mqd(mqd);
 	m->compute_static_thread_mgmt_se0 = se_mask[0];
 	m->compute_static_thread_mgmt_se1 = se_mask[1];
 	m->compute_static_thread_mgmt_se2 = se_mask[2];
@@ -109,6 +127,7 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
 	uint64_t addr;
 	struct v11_compute_mqd *m;
 	int size;
+	uint32_t wa_mask = q->is_dbg_wa ? 0xffff : 0xffffffff;
 
 	m = (struct v11_compute_mqd *) mqd_mem_obj->cpu_ptr;
 	addr = mqd_mem_obj->gpu_addr;
@@ -122,14 +141,15 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
 
 	m->header = 0xC0310800;
 	m->compute_pipelinestat_enable = 1;
-	m->compute_static_thread_mgmt_se0 = 0xFFFFFFFF;
-	m->compute_static_thread_mgmt_se1 = 0xFFFFFFFF;
-	m->compute_static_thread_mgmt_se2 = 0xFFFFFFFF;
-	m->compute_static_thread_mgmt_se3 = 0xFFFFFFFF;
-	m->compute_static_thread_mgmt_se4 = 0xFFFFFFFF;
-	m->compute_static_thread_mgmt_se5 = 0xFFFFFFFF;
-	m->compute_static_thread_mgmt_se6 = 0xFFFFFFFF;
-	m->compute_static_thread_mgmt_se7 = 0xFFFFFFFF;
+
+	m->compute_static_thread_mgmt_se0 = wa_mask;
+	m->compute_static_thread_mgmt_se1 = wa_mask;
+	m->compute_static_thread_mgmt_se2 = wa_mask;
+	m->compute_static_thread_mgmt_se3 = wa_mask;
+	m->compute_static_thread_mgmt_se4 = wa_mask;
+	m->compute_static_thread_mgmt_se5 = wa_mask;
+	m->compute_static_thread_mgmt_se6 = wa_mask;
+	m->compute_static_thread_mgmt_se7 = wa_mask;
 
 	m->cp_hqd_persistent_state = CP_HQD_PERSISTENT_STATE__PRELOAD_REQ_MASK |
 			0x55 << CP_HQD_PERSISTENT_STATE__PRELOAD_SIZE__SHIFT;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
index b7c95158d4a0..5b87c244e909 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
@@ -65,8 +65,7 @@ static void update_cu_mask(struct mqd_manager *mm, void *mqd,
 	struct v9_mqd *m;
 	uint32_t se_mask[KFD_MAX_NUM_SE] = {0};
 
-	if (!minfo || (minfo->update_flag != UPDATE_FLAG_CU_MASK) ||
-	    !minfo->cu_mask.ptr)
+	if (!minfo || !minfo->cu_mask.ptr)
 		return;
 
 	mqd_symmetrically_map_cu_mask(mm,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
index fe69492b1bb3..d1e962da51dd 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
@@ -51,8 +51,7 @@ static void update_cu_mask(struct mqd_manager *mm, void *mqd,
 	struct vi_mqd *m;
 	uint32_t se_mask[4] = {0}; /* 4 is the max # of SEs */
 
-	if (!minfo || (minfo->update_flag != UPDATE_FLAG_CU_MASK) ||
-	    !minfo->cu_mask.ptr)
+	if (!minfo || !minfo->cu_mask.ptr)
 		return;
 
 	mqd_symmetrically_map_cu_mask(mm,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 8fca7175daab..f0a45d184c8f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -513,6 +513,8 @@ struct queue_properties {
 	bool is_active;
 	bool is_gws;
 	uint32_t pm4_target_xcc;
+	bool is_dbg_wa;
+	bool is_user_cu_masked;
 	/* Not relevant for user mode queues in cp scheduling */
 	unsigned int vmid;
 	/* Relevant only for sdma queues*/
@@ -535,7 +537,8 @@ struct queue_properties {
 			    !(q).is_evicted)
 
 enum mqd_update_flag {
-	UPDATE_FLAG_CU_MASK = 0,
+	UPDATE_FLAG_DBG_WA_ENABLE = 1,
+	UPDATE_FLAG_DBG_WA_DISABLE = 2,
 };
 
 struct mqd_update_info {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index b100933340d2..43d432b5c5bc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -506,8 +506,12 @@ int pqm_update_mqd(struct process_queue_manager *pqm,
 		return -EFAULT;
 	}
 
+	/* CUs are masked for debugger requirements so deny user mask  */
+	if (pqn->q->properties.is_dbg_wa && minfo && minfo->cu_mask.ptr)
+		return -EBUSY;
+
 	/* ASICs that have WGPs must enforce pairwise enabled mask checks. */
-	if (minfo && minfo->update_flag == UPDATE_FLAG_CU_MASK && minfo->cu_mask.ptr &&
+	if (minfo && minfo->cu_mask.ptr &&
 			KFD_GC_VERSION(pqn->q->device) >= IP_VERSION(10, 0, 0)) {
 		int i;
 
@@ -526,6 +530,9 @@ int pqm_update_mqd(struct process_queue_manager *pqm,
 	if (retval != 0)
 		return retval;
 
+	if (minfo && minfo->cu_mask.ptr)
+		pqn->q->properties.is_user_cu_masked = true;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index 3def25b2bdbb..faa7939f35bd 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -1863,10 +1863,13 @@ static void kfd_topology_set_dbg_firmware_support(struct kfd_topology_device *de
 {
 	bool firmware_supported = true;
 
+	/*
+	 * FIXME: GFX11 FW currently not sufficient to deal with CWSR WA.
+	 * Updated FW with API changes coming soon.
+	 */
 	if (KFD_GC_VERSION(dev->gpu) >= IP_VERSION(11, 0, 0) &&
 			KFD_GC_VERSION(dev->gpu) < IP_VERSION(12, 0, 0)) {
-		firmware_supported =
-			(dev->gpu->adev->mes.sched_version & AMDGPU_MES_VERSION_MASK) >= 9;
+		firmware_supported = false;
 		goto out;
 	}
 
-- 
2.25.1

