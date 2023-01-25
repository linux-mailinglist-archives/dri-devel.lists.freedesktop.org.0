Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F244767BB71
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C5310E84C;
	Wed, 25 Jan 2023 19:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB9C10E3A1;
 Wed, 25 Jan 2023 19:54:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QP8AQbmLhEinvdj1Ha0IZu5jYn5yXCBsS1OZ6zMftEtExPP1PTKNnxOM3wK+xPqCywx1E4DnhVF1dTLRSLFVBB0wxCiNEewEudlp1pdhyVwuX3LRZUjq8xAXhXk3/mtMJgzTXJYVGoGVa/1eRBcYKQaLAQ+0Xf/IApfcBbBChvxN5+PRm0ITZQ6QNKNZHgskFj2FiSK3HW7orBESMhJW3n/88fOYMqDbeYAI2ERy6sjgwqjAlcqQhPL48mz8zo0xEmnKk4HpphSWFSr4nMRmBctOnD1+2fAxIGQTY0LIdi9ftBjss6BQjNheekKmoT2Kte2XOxvXNagFr2C2uD5bSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjNyP5bD3zOLHDPwlYblKIeJxzvFEJDsAP8Qk7x86Ho=;
 b=lGplwvRWniSKw+scyzjxBxdrJLy7w4INfOPVdsfCtOCOyDTmkYxICRwGMqCfq0F8hC+Nb0HYzIjI+9+LuInCAQ8KRvnOa/xqb/kx7BUicrZ6NGHARaGckcJE82j1u4Ie/1O2T/dgCi0fHw7ZwrQaPrjrQctOFjlfupCn5VXdnraIjzn6fAavyec1I1aziDNBejPxWBHZIKzlVBSm+iHOJ+Sr1PWH9UYioJyMKvYUoDoyPAIJdcoS6/Uecqzz9V8CRXV6SoivZ1T1zjkvXCeTPWQikt+YAbI7qKfiJDI6RueSz0BjoFE6041/SH3MMAelJKo/3zHZ9hNHeC6lIgBW/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjNyP5bD3zOLHDPwlYblKIeJxzvFEJDsAP8Qk7x86Ho=;
 b=bcDv6S760ENoiYuCHaLsO7fGX0izOH3cPX7oJPWQWaB2Pzxq2BQ0DBNwJtq2W44qxHtp1rGgMp7PKXz3ZTqlutyBUB9wQ50ZGFwaFAls5FsQde6X7KPqYko3wPKAuGD93mz1d3POswSOvtAu+bQrlvNcNOMp6EXoKUsB6V8QDYU=
Received: from BN8PR15CA0013.namprd15.prod.outlook.com (2603:10b6:408:c0::26)
 by MW4PR12MB7015.namprd12.prod.outlook.com (2603:10b6:303:218::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 19:54:23 +0000
Received: from BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:c0:cafe::5a) by BN8PR15CA0013.outlook.office365.com
 (2603:10b6:408:c0::26) with Microsoft SMTP Server (version=TLS1_2,
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
 2023 13:54:19 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 15/32] drm/amdkfd: prepare trap workaround for gfx11
Date: Wed, 25 Jan 2023 14:53:44 -0500
Message-ID: <20230125195401.4183544-16-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT073:EE_|MW4PR12MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: 50b39af8-26bc-40fe-69f1-08daff0df4b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bThCbaQuXys7gfltyiMJ5fgIbL/beFw2GZu4Vy1gHZkmF03JBAFAYR08pIDhGLp1H0c/q770yZi7S0ZTEC+KQj9uxHk+vUjmXxfNxmFtYog+m4jDXZR2jmVEQ6IOmrYATpBiECJwQ2yRHKglb3sLcAfoUYLN6LqucmuyndUaR/PMcjndFHbODncMYJBFXm6rYIUi9ggjmS2CKX2/l3U3OqBmMfsZzFCbLVxjWFrIbPMaAueVSAZeigbOxuxNyL2HyfyUuPd7y2mWwVEAqFTibI0HbqJHz1kLuoJcPt3S9WE1ojVOTHq19aQ71kTsHOLQ9WDcEE+03CoKRoLgwXy7cw8G2UcVVA5q3Qo2LZKu2CbLOxFzImsSRGJ1/LtNdEGlP9SizJl6mK4qbZ3ENg58UrPXeFw8L3ciGzMqO0Nwq2gC8b0VVFiC9losoR5uP2uQAII71Ck3c9c9wkX/H0AmshdRwQ3yPdXT1gcczSpZONLK4K/0COhAe7fDBwceFZBDtIfmy8iagUpFZnlNGKyUDQ3eD2puc0MCyEd6Tg+g4HGRA/y4yNIKrxj9siZR4s8mMj3PfOugc2B3bVSvDRk0UW2kWCfATv7RWhCKciQdeLRu0KOthC7mv6FD0DuQQ5NmN/MN4HY/g42dg3UXIFXEfEQp06/43VfAwURMTKZqP7e0iSELEuL1RPA/Avq3tgdQMftbFBiEZ+SxIEHF69mlK+oOZJg94wMF0bLHG1MZvt7shw0+2ZdptgFdnvLivo27AVpb4WOY8gJdtSnWz/1IBQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199018)(46966006)(36840700001)(40470700004)(82310400005)(2616005)(36756003)(82740400003)(30864003)(356005)(2906002)(5660300002)(41300700001)(8676002)(8936002)(26005)(70206006)(7696005)(110136005)(40480700001)(316002)(1076003)(47076005)(336012)(426003)(16526019)(6666004)(70586007)(54906003)(44832011)(86362001)(83380400001)(186003)(36860700001)(40460700003)(4326008)(450100002)(81166007)(478600001)(36900700001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:23.1130 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b39af8-26bc-40fe-69f1-08daff0df4b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7015
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
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h       |  2 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        |  7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  2 -
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 64 +++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  3 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager.c |  7 ++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c  |  3 +-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |  3 +-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c  | 42 ++++++++----
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   |  3 +-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c   |  3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  5 +-
 .../amd/amdkfd/kfd_process_queue_manager.c    |  9 ++-
 13 files changed, 124 insertions(+), 29 deletions(-)

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
index fbacdc42efac..38c7a0cbf264 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -197,17 +197,14 @@ static int mes_v11_0_add_hw_queue(struct amdgpu_mes *mes,
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
index ee05c2e54ef6..f5f639de28f0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -530,8 +530,6 @@ static int kfd_ioctl_set_cu_mask(struct file *filp, struct kfd_process *p,
 		goto out;
 	}
 
-	minfo.update_flag = UPDATE_FLAG_CU_MASK;
-
 	mutex_lock(&p->mutex);
 
 	retval = pqm_update_mqd(&p->pqm, args->queue_id, &minfo);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index f6ea6db266b4..6e99a0160275 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -37,6 +37,70 @@ void debug_event_write_work_handler(struct work_struct *work)
 	kernel_write(process->dbg_ev_file, &write_data, 1, &pos);
 }
 
+static int kfd_dbg_set_queue_workaround(struct queue *q, bool enable)
+{
+	struct mqd_update_info minfo = {0};
+	int err;
+
+	if (!q || (!q->properties.is_dbg_wa && !enable))
+		return 0;
+
+	if (KFD_GC_VERSION(q->device) < IP_VERSION(11, 0, 0) ||
+			KFD_GC_VERSION(q->device) >= IP_VERSION(12, 0, 0))
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
+	if (enable) {
+		target->runtime_info.runtime_state = r == -EBUSY ?
+				DEBUG_RUNTIME_STATE_ENABLED_BUSY :
+				DEBUG_RUNTIME_STATE_ENABLED_ERROR;
+	}
+
+	return r;
+}
+
+static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
+{
+	uint32_t spi_dbg_cntl = pdd->spi_dbg_override | pdd->spi_dbg_launch_mode;
+	uint32_t flags = pdd->process->dbg_flags;
+
+	if (!kfd_dbg_is_per_vmid_supported(pdd->dev))
+		return 0;
+
+	return amdgpu_mes_set_shader_debugger(pdd->dev->adev, pdd->proc_ctx_gpu_addr, spi_dbg_cntl,
+						pdd->watch_points, flags);
+}
+
 int kfd_dbg_trap_disable(struct kfd_process *target)
 {
 	if (!target->debug_trap_enabled)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index 53c5a3e55bd2..0c09f1729325 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -35,7 +35,8 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 
 static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_dev *dev)
 {
-	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2);
+	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2) ||
+	       KFD_GC_VERSION(dev) >= IP_VERSION(11, 0, 0);
 }
 
 void debug_event_write_work_handler(struct work_struct *work);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 2517716d7cbc..be1985b87ea7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -214,6 +214,10 @@ static int add_queue_mes(struct device_queue_manager *dqm, struct queue *q,
 	queue_input.paging = false;
 	queue_input.tba_addr = qpd->tba_addr;
 	queue_input.tma_addr = qpd->tma_addr;
+	queue_input.trap_en = KFD_GC_VERSION(q->device) < IP_VERSION(11, 0, 0) ||
+			      KFD_GC_VERSION(q->device) >= IP_VERSION(12, 0, 0) ||
+			      q->properties.is_dbg_wa;
+	queue_input.skip_process_ctx_clear = qpd->pqm->process->debug_trap_enabled;
 
 	queue_type = convert_to_mes_queue_type(q->properties.type);
 	if (queue_type < 0) {
@@ -1679,6 +1683,9 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 	 * updates the is_evicted flag but is a no-op otherwise.
 	 */
 	q->properties.is_evicted = !!qpd->evicted;
+	q->properties.is_dbg_wa = qpd->pqm->process->debug_trap_enabled &&
+			KFD_GC_VERSION(q->device) >= IP_VERSION(11, 0, 0) &&
+			KFD_GC_VERSION(q->device) < IP_VERSION(12, 0, 0);
 
 	if (qd)
 		mqd_mgr->restore_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj, &q->gart_mqd_addr,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
index 4889865c725c..c2a7226fc588 100644
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
index cb484ace17de..8248e77751e7 100644
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
index ac7c8fc83c94..18ab613e787c 100644
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
index 86f1cf090246..50da16dd4c96 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
@@ -49,8 +49,7 @@ static void update_cu_mask(struct mqd_manager *mm, void *mqd,
 	struct v9_mqd *m;
 	uint32_t se_mask[KFD_MAX_NUM_SE] = {0};
 
-	if (!minfo || (minfo->update_flag != UPDATE_FLAG_CU_MASK) ||
-	    !minfo->cu_mask.ptr)
+	if (!minfo || !minfo->cu_mask.ptr)
 		return;
 
 	mqd_symmetrically_map_cu_mask(mm,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
index 530ba6f5b57e..58b40bff3e0c 100644
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
index 8f1e2f9023db..75521d96e937 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -479,6 +479,8 @@ struct queue_properties {
 	bool is_evicted;
 	bool is_active;
 	bool is_gws;
+	bool is_dbg_wa;
+	bool is_user_cu_masked;
 	/* Not relevant for user mode queues in cp scheduling */
 	unsigned int vmid;
 	/* Relevant only for sdma queues*/
@@ -501,7 +503,8 @@ struct queue_properties {
 			    !(q).is_evicted)
 
 enum mqd_update_flag {
-	UPDATE_FLAG_CU_MASK = 0,
+	UPDATE_FLAG_DBG_WA_ENABLE = 1,
+	UPDATE_FLAG_DBG_WA_DISABLE = 2,
 };
 
 struct mqd_update_info {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 5137476ec18e..d8f032214481 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -498,8 +498,12 @@ int pqm_update_mqd(struct process_queue_manager *pqm,
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
 
@@ -518,6 +522,9 @@ int pqm_update_mqd(struct process_queue_manager *pqm,
 	if (retval != 0)
 		return retval;
 
+	if (minfo && minfo->cu_mask.ptr)
+		pqn->q->properties.is_user_cu_masked = true;
+
 	return 0;
 }
 
-- 
2.25.1

