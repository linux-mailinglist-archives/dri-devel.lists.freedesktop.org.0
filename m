Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D893A6CAD7F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E5510E6D8;
	Mon, 27 Mar 2023 18:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2079.outbound.protection.outlook.com [40.107.101.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668BA10E6C8;
 Mon, 27 Mar 2023 18:43:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOrCUneZFwWFBkDQoF0DjAe9ZoDl0miidwVUUUUAeOz6aHaCI5LZMLPHkn/e+mu48APOBM2X8HgTNc3Yftp4W2RsxgDHSsJoaIMVZBALeKEePTNbmek9Dv6jY2KUBE05KWG2q2TpRAqKHwkFW9AYNS2qTSow47pf/XANTemOaDHyaGw50yVK7eHA2/bqrJ/0DhLJHYmjCABp/zqPQBTj7lzd8BXMjAGxlgFky/AKoNzlr1th6evsAkc2/NldwnGkrTKjsa2EBylwSaNtiUCWXNmOifdNTrza0vs0Em+JgMMo4MM0p6t1Y/1FiiRefs+PWApT8Xo+Dg9XYGK8bn49xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmP2algl0r2qEkqYr6Xk5n6wMMDRMegTGo93p9jlMsI=;
 b=ZSq7FZwTUewdHgedtyddgllUv9tGCgwgWM+HkBDfct5aLus9efXnUGTzG6gE7jGjP4i+LB+r1CZFHeMdRtBVJYAfkZdp1RX1+5n2Zb6HvObjqkV1oEsRDAF3xj7+6BAeJh5GJl6YFZsOnW4mifwgqTRGX2B0CcwlmIWlv2TXKKMc5Q61xikNIp6bdBrOhPtV4kwRM3k4fVtStqWktCdBOESRnDyS6jdf+9mQ9uClqI4v5Y4qjJcLEKGuvl+3cw+VM3mCo+3EwJdBdVjiULgREtIBKc+JTrNI7054K+OWj9RGJqvarIwYCh2DERyO+aty1VbpXg/RHlt3jEMl0aIWRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmP2algl0r2qEkqYr6Xk5n6wMMDRMegTGo93p9jlMsI=;
 b=1I06doiGglNp1i8q6rWd6CrF5vEMiD486tO6REsJizU+E/QE2U6rRUdqOGjC4/m3oOKapX7F77lYriB4NmaIPwCwxBJkkEKgor2I4UsHNseCBMRv5VioY4oUr5wk/OdgcYJY8MVb7piYqZhy7s284VV/qhrJvV7YsDXVSfg9bS0=
Received: from CY8PR02CA0014.namprd02.prod.outlook.com (2603:10b6:930:4d::28)
 by PH7PR12MB7820.namprd12.prod.outlook.com (2603:10b6:510:268::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 18:43:56 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:4d:cafe::a9) by CY8PR02CA0014.outlook.office365.com
 (2603:10b6:930:4d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.43 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:56 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:54 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 17/34] drm/amdkfd: apply trap workaround for gfx11
Date: Mon, 27 Mar 2023 14:43:22 -0400
Message-ID: <20230327184339.125016-17-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|PH7PR12MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: 345e1029-4d49-420e-7478-08db2ef3386e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AoNyeKDX+msX6lBcyu/Af20JbXKfisZS2ileqiB3HaCsnwKEs3bY6z+q3Kxevd3Pqy2Xdbk52RVEvfz5EyZDcRIAStI5Kp4N6pvifRCJjclQz3ZzdxifJ+1ZzP61mPWqxmXTk/9vR+WsuKTiAAqU/ErEhqHn2jHrkAKIsgTTT0jE6CFEWZNQgVJf8JRkPK7DtSp1eq4nbpPBgqCNcWdruj/yQeBagKPcc9PhzbvHypjVmysnZWyzMM0LHMMPA94P9aqm2Mizcrdtjon8fgCm2XZRjpHskO/hMcJGqABhmlDWoPS0GGW0CB8V4FFXi4KVTMKkwhkOzTwv8L6F7Q61i7a0NjVLhMOpgGrAfXRVtnpyPxU9bfcvyNWQYo298jwk/+22uaHO6mfJv/ot3EYCS7wIfWtgS8IC6JHWin79DQVbp/pz7lphHJHbhzpn/w8Wc2cV/bSshYsXdKWAMEZbr8W7RVau5kO6rpaq49Qv0+eDCpLGicvlRq75AhSqZ2zhnVQ7n0R645hJHHUK7YDOZVatZvakONVInkgHlLTTBmJ4M1X2lzJUPEE3uzPIP5TXbTQd8T8FmImrvBlPKbj2dGBGj0uSF1hWRYRAXbg/xX6bWXS6lzN+iTxZJl/k3u79/hPQIBx/3Ij4QDfjpsh3HRnqsRPk9XcQRqyy+imT+oM5t7GKM9g01PIEz2iD87Ho86QPN48eotFsBd7gaOzljEdgVEDSRQ1Q0aWvbJdIov+0Xs3GQ5JoD3NOB45kPPMmjmvbysugWAVmapADnMKOxw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199021)(36840700001)(40470700004)(46966006)(47076005)(2906002)(426003)(83380400001)(30864003)(336012)(5660300002)(44832011)(8936002)(82740400003)(356005)(36756003)(40480700001)(81166007)(86362001)(82310400005)(40460700003)(36860700001)(26005)(316002)(1076003)(110136005)(54906003)(8676002)(4326008)(70206006)(70586007)(450100002)(186003)(16526019)(7696005)(6666004)(478600001)(41300700001)(2616005)(66899021)(36900700001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:56.0812 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 345e1029-4d49-420e-7478-08db2ef3386e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7820
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

v2: move this after debug trap enable disable patch to better illustrate
application.
disable debugging for now on gfx11 due to broken fw.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
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
index 08793dac618c..4fff158e231f 100644
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
index c0c54206b1c2..acbed2a25a1e 100644
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
index fe5b965ac8f6..7e6d8694938d 100644
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
index 68a95c8105e5..bba599bb4665 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -31,7 +31,8 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 			uint32_t *runtime_info_size);
 static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_dev *dev)
 {
-	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2);
+	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2) ||
+	       KFD_GC_VERSION(dev) >= IP_VERSION(11, 0, 0);
 }
 
 /*
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index a39bd8f3d4bb..19859f3f0778 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -215,6 +215,10 @@ static int add_queue_mes(struct device_queue_manager *dqm, struct queue *q,
 	queue_input.paging = false;
 	queue_input.tba_addr = qpd->tba_addr;
 	queue_input.tma_addr = qpd->tma_addr;
+	queue_input.trap_en = KFD_GC_VERSION(q->device) < IP_VERSION(11, 0, 0) ||
+			      KFD_GC_VERSION(q->device) >= IP_VERSION(12, 0, 0) ||
+			      q->properties.is_dbg_wa;
+	queue_input.skip_process_ctx_clear = qpd->pqm->process->debug_trap_enabled;
 
 	queue_type = convert_to_mes_queue_type(q->properties.type);
 	if (queue_type < 0) {
@@ -1682,6 +1686,9 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
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
index 61147f5532ef..bad8d4d6e4cf 100644
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
index 8c34a1e725a1..799389767455 100644
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
index 4236539d9f93..b02433b15929 100644
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
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index 0deeb87e5a2d..15e9064807c9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -1871,10 +1871,13 @@ static void kfd_topology_set_dbg_firmware_support(struct kfd_topology_device *de
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

