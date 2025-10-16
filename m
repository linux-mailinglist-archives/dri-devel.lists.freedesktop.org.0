Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C82CBBE5684
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 22:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C1D10E101;
	Thu, 16 Oct 2025 20:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dUR23zhL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012059.outbound.protection.outlook.com
 [40.93.195.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94FA10E101
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:30:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1SeCki2iCQI8qtaRFIPD3n2xE4UW9wUVFnyhYhhYL+MhjvMsWGuLP4ZfErlqu2HSZaLyNfdQOQCBFtcK1zsfhpgTSe9vXIoNiYzlGArHhdfEiPEUmmpaXv0fvzTpzvMu6S+ZSbpbvyDzPXDq0nyzdQQufKJ2/rVKC/lkVrlUENFOVq0gzs5mIPhWD4oqGCyL9jhYoP3nUPuJpTR3eQfHtmeVrBlTnts+/15DaaNkiFyCminZPV4pXlT0d2ywM9hKGuYPAzdALsw85keJ0eo7PLHKusYxVCwYJgcopLsd1FPxaXHo4YoNZgvVTZfwSlVtbqFoolnhd/6tmy44VUHEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jInl9JLkLSrYPvVTI+WDt6cxR3GSc0tYO9HurBqGw/Q=;
 b=Jfz7A/awjkEQONSJyeC9rUCyAUbSAuWa4LLKAQ5OySAuJ9819uUuDVB2QIEVj5yAlWiCttTDlhZTMzIIbViTwX9NQufpD+4tBjRtFIF2112wT+bttJQQEbjmDaiE7zYao0FS5w63W+lgZarqWqyin9ysTlwMCSoYZh62gmKl3PmE2rizjnP4vV02NJTWuYlh69F2BTsgEI9mfKNvAmMfy8Vo1rxIATGFUaxfAkEqiYB2lXzAyQIIeODpSK/UPhpDbV9v9eIIWVDw3P9hKA9eCjP0RjH6MiwgQ7HeQhxZ8NuDkN+AMMPcB8+4fTuDuGPD/e5LIiqFH4RnDNZRH1I/dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jInl9JLkLSrYPvVTI+WDt6cxR3GSc0tYO9HurBqGw/Q=;
 b=dUR23zhLaHij7X7Uu+tIgPwYsXV9lbYiUQCLbEL/oILRXoc0Fn2MNasUcXnzcA1Ebpea8GBAWpho+of4FxFfSNPhjBDkcg/crYl1z6w848QRgR8f72sPBOWZqpRnqKQxHAR8w0jliQyrDQS9aBMoAbrituJdcQ241sVTqgEyXHY=
Received: from BN0PR03CA0022.namprd03.prod.outlook.com (2603:10b6:408:e6::27)
 by DM4PR12MB6062.namprd12.prod.outlook.com (2603:10b6:8:b2::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.10; Thu, 16 Oct 2025 20:30:31 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:408:e6:cafe::34) by BN0PR03CA0022.outlook.office365.com
 (2603:10b6:408:e6::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Thu,
 16 Oct 2025 20:30:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Thu, 16 Oct 2025 20:30:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 16 Oct
 2025 13:30:30 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 16 Oct
 2025 15:30:30 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 16 Oct 2025 13:30:29 -0700
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH] accel/amdxdna:  Support firmware debug buffer
Date: Thu, 16 Oct 2025 13:30:16 -0700
Message-ID: <20251016203016.819441-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|DM4PR12MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: b09bd101-2d19-4157-7fd8-08de0cf2d9ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kKhQjQB1M6yR2N2ZZwO5jmFnZGw0a8RL/yibu7QWZT3Tp1BVGbiizJZYWvnv?=
 =?us-ascii?Q?j5ap8p8af7bmBHGGAQz7BQ8fT6YlUEf0jE/tomjlThHWhQDuekhVL9HR2Un8?=
 =?us-ascii?Q?kPTiHcQ/1NPWeK7AiJ1oDR0JVhspmInASHnkxQ2/6dEbcSRZWv+IYGvVAwrR?=
 =?us-ascii?Q?i1ml0a8Fsp7delUHE15H4sZraqZE0C0q45SiIzCzUvvULeVjNWgHsISlsiVZ?=
 =?us-ascii?Q?Deu994yludex1ckYCZf3kuRjJY11NYcfbd94hpvoBY/MiIYqaxj6hegPJdlA?=
 =?us-ascii?Q?R8gXud1oA3XymRGLPzrw5xeGUiqHm47rQDGA9MKDpLem+LM2Xvl2YS74e3+F?=
 =?us-ascii?Q?gQIgmKbTEJfkBJzS6pKnR2cuGFlLOCscX/+TmO8d6LPOcDZI63UKAbWtR2bh?=
 =?us-ascii?Q?JK20YIU/1P4UyUHEGwRdeFAilv+oiG2MhQgQ3tcLzDmArUZ5A0lq0HV9qG5M?=
 =?us-ascii?Q?e368yDpIbtoo7ki1b/LhI3RJdFckmLJYGlBR0xXUSYbe6vOUtaxny86RzC8/?=
 =?us-ascii?Q?Bl4IsT2EOBMjjNiff1h0cwEs/iEqNkA9djeT3sRj2GljWfd/wk+m4a/9dyHi?=
 =?us-ascii?Q?DPk/RB/4sbTA0/AgMTzrxaGTWURh1/ekUYJCKZuZyDI62w/6NxVVBnF9Q2EE?=
 =?us-ascii?Q?Xhm4PEojyIL3LVnVjpcD4IjXqoGl34JudGOnb4EteQiYttFLS0D6d+vAzWts?=
 =?us-ascii?Q?K4Bt6mReNqWHTIA6Qfyk5CIXL1w4mjekf33LBeBxQxMgBkoh1EGZRfzaG9Ck?=
 =?us-ascii?Q?bThhcBb1fzv7qaoNzAX38ZE6jHk7Aa3vcbmoe+QAjmJW5GIM4Jot6ik7U0LT?=
 =?us-ascii?Q?9KuSPeQg0RAhcYvATWGWZIhfPZZNFt6NrIMjpPgG827A2uDMrxdnTMTHfgXX?=
 =?us-ascii?Q?ta+YCOk2cQVaeIUrOs/wGn/rCtPw/1XCaVIDDICRIWdUz0XGXiX0QMEa3wNu?=
 =?us-ascii?Q?ptFQoySwZMYWQhyZ8dwtmh203zgNx2eAAsD513vLW5Y2YFK4uHb1bY6Ny7PY?=
 =?us-ascii?Q?1nXMxbfploBbzf10brQIQCJ3mRSoZnWqO3KVNafo4cYu9yRQgNWFXwB2NxVc?=
 =?us-ascii?Q?OCI4h0Fod8cZhnOfXEDv9S7Y+gnI39cq57JJrkNhydACSuyC8OJmKvtqwxg1?=
 =?us-ascii?Q?Qp3jxFlmsKgSN3E2wm6cRJCmhpYwk+aEEB4CdSkQa3n3wbEw97uwv4jm3xA2?=
 =?us-ascii?Q?TjUHJZc4Nf/RX1UcQCEBcOfNdUQiQd0nN0CteTj4xEnadjbj5NyD+YlTPtgc?=
 =?us-ascii?Q?3pPgguXWNlJhcZTUWyYCC+WR+h5kNnzl05FJhE5dk4hd8odcykyOz2q/386s?=
 =?us-ascii?Q?Vmkpw35Sd1Cyi9I1vtv+RHw8BG19yA4VfKvQ+vbQm/z4a+CFFwV+FcyCS15/?=
 =?us-ascii?Q?aJttUNM6afL5uz072JcM7/J3VVt08yBeuM3LYAKD/B3y4kY/yn1SJ8Z3uqOE?=
 =?us-ascii?Q?sHaJs0OOdf+kJ+scCOXO7Heu1HFf91c4cF2U3C1VN/uglD85kvJN+cdqNBsL?=
 =?us-ascii?Q?iOEoPQ47CcwHNUhSvMtgWJGqDaL2GJyVfyrirgff4rHfuJJB/SlcDHuCufn2?=
 =?us-ascii?Q?uvmiBcUawNLpSepqrxQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 20:30:31.0401 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b09bd101-2d19-4157-7fd8-08de0cf2d9ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6062
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To collect firmware debug information, the userspace application allocates
a AMDXDNA_BO_DEV buffer object through DRM_IOCTL_AMDXDNA_CREATE_BO.
Then it associates the buffer with the hardware context through
DRM_IOCTL_AMDXDNA_CONFIG_HWCTX which requests firmware to bind the buffer
through a mailbox command. The firmware then writes the debug data into
this buffer. The buffer can be mapped into userspace so that
applications can retrieve and analyze the firmware debug information.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/TODO              |   1 -
 drivers/accel/amdxdna/aie2_ctx.c        | 116 ++++++++++++++++++++++--
 drivers/accel/amdxdna/aie2_message.c    |  31 ++++++-
 drivers/accel/amdxdna/aie2_msg_priv.h   |  13 +++
 drivers/accel/amdxdna/aie2_pci.c        |   1 +
 drivers/accel/amdxdna/aie2_pci.h        |   3 +
 drivers/accel/amdxdna/amdxdna_ctx.c     |  39 +++++++-
 drivers/accel/amdxdna/amdxdna_ctx.h     |  16 +++-
 drivers/accel/amdxdna/amdxdna_gem.c     |   3 +
 drivers/accel/amdxdna/amdxdna_gem.h     |   6 ++
 drivers/accel/amdxdna/amdxdna_pci_drv.c |   3 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 +
 drivers/accel/amdxdna/npu1_regs.c       |   1 +
 drivers/accel/amdxdna/npu4_regs.c       |   1 +
 14 files changed, 221 insertions(+), 14 deletions(-)

diff --git a/drivers/accel/amdxdna/TODO b/drivers/accel/amdxdna/TODO
index ad8ac6e315b6..0e4bbebeaedf 100644
--- a/drivers/accel/amdxdna/TODO
+++ b/drivers/accel/amdxdna/TODO
@@ -1,2 +1 @@
 - Add debugfs support
-- Add debug BO support
diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index ab4d66f1325d..63450b7773ac 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -226,11 +226,10 @@ aie2_sched_resp_handler(void *handle, void __iomem *data, size_t size)
 }
 
 static int
-aie2_sched_nocmd_resp_handler(void *handle, void __iomem *data, size_t size)
+aie2_sched_drvcmd_resp_handler(void *handle, void __iomem *data, size_t size)
 {
 	struct amdxdna_sched_job *job = handle;
 	int ret = 0;
-	u32 status;
 
 	if (unlikely(!data))
 		goto out;
@@ -240,8 +239,7 @@ aie2_sched_nocmd_resp_handler(void *handle, void __iomem *data, size_t size)
 		goto out;
 	}
 
-	status = readl(data);
-	XDNA_DBG(job->hwctx->client->xdna, "Resp status 0x%x", status);
+	job->drv_cmd->result = readl(data);
 
 out:
 	aie2_sched_notify(job);
@@ -314,8 +312,18 @@ aie2_sched_job_run(struct drm_sched_job *sched_job)
 	kref_get(&job->refcnt);
 	fence = dma_fence_get(job->fence);
 
-	if (unlikely(!cmd_abo)) {
-		ret = aie2_sync_bo(hwctx, job, aie2_sched_nocmd_resp_handler);
+	if (job->drv_cmd) {
+		switch (job->drv_cmd->opcode) {
+		case SYNC_DEBUG_BO:
+			ret = aie2_sync_bo(hwctx, job, aie2_sched_drvcmd_resp_handler);
+			break;
+		case ATTACH_DEBUG_BO:
+			ret = aie2_config_debug_bo(hwctx, job, aie2_sched_drvcmd_resp_handler);
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
 		goto out;
 	}
 
@@ -766,6 +774,74 @@ static int aie2_hwctx_cu_config(struct amdxdna_hwctx *hwctx, void *buf, u32 size
 	return ret;
 }
 
+static void aie2_cmd_wait(struct amdxdna_hwctx *hwctx, u64 seq)
+{
+	struct dma_fence *out_fence = aie2_cmd_get_out_fence(hwctx, seq);
+
+	if (!out_fence) {
+		XDNA_ERR(hwctx->client->xdna, "Failed to get fence");
+		return;
+	}
+
+	dma_fence_wait_timeout(out_fence, false, MAX_SCHEDULE_TIMEOUT);
+	dma_fence_put(out_fence);
+}
+
+static int aie2_hwctx_cfg_debug_bo(struct amdxdna_hwctx *hwctx, u32 bo_hdl,
+				   bool attach)
+{
+	struct amdxdna_client *client = hwctx->client;
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_drv_cmd cmd = { 0 };
+	struct amdxdna_gem_obj *abo;
+	u64 seq;
+	int ret;
+
+	abo = amdxdna_gem_get_obj(client, bo_hdl, AMDXDNA_BO_DEV);
+	if (!abo) {
+		XDNA_ERR(xdna, "Get bo %d failed", bo_hdl);
+		return -EINVAL;
+	}
+
+	if (attach) {
+		if (abo->assigned_hwctx != AMDXDNA_INVALID_CTX_HANDLE) {
+			ret = -EBUSY;
+			goto put_obj;
+		}
+		cmd.opcode = ATTACH_DEBUG_BO;
+	} else {
+		if (abo->assigned_hwctx != hwctx->id) {
+			ret = -EINVAL;
+			goto put_obj;
+		}
+		cmd.opcode = DETACH_DEBUG_BO;
+	}
+
+	ret = amdxdna_cmd_submit(client, &cmd, AMDXDNA_INVALID_BO_HANDLE,
+				 &bo_hdl, 1, hwctx->id, &seq);
+	if (ret) {
+		XDNA_ERR(xdna, "Submit command failed");
+		goto put_obj;
+	}
+
+	aie2_cmd_wait(hwctx, seq);
+	if (cmd.result) {
+		XDNA_ERR(xdna, "Response failure 0x%x", cmd.result);
+		goto put_obj;
+	}
+
+	if (attach)
+		abo->assigned_hwctx = hwctx->id;
+	else
+		abo->assigned_hwctx = AMDXDNA_INVALID_CTX_HANDLE;
+
+	XDNA_DBG(xdna, "Config debug BO %d to %s", bo_hdl, hwctx->name);
+
+put_obj:
+	amdxdna_gem_put_obj(abo);
+	return ret;
+}
+
 int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size)
 {
 	struct amdxdna_dev *xdna = hwctx->client->xdna;
@@ -775,14 +851,40 @@ int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *bu
 	case DRM_AMDXDNA_HWCTX_CONFIG_CU:
 		return aie2_hwctx_cu_config(hwctx, buf, size);
 	case DRM_AMDXDNA_HWCTX_ASSIGN_DBG_BUF:
+		return aie2_hwctx_cfg_debug_bo(hwctx, (u32)value, true);
 	case DRM_AMDXDNA_HWCTX_REMOVE_DBG_BUF:
-		return -EOPNOTSUPP;
+		return aie2_hwctx_cfg_debug_bo(hwctx, (u32)value, false);
 	default:
 		XDNA_DBG(xdna, "Not supported type %d", type);
 		return -EOPNOTSUPP;
 	}
 }
 
+int aie2_hwctx_sync_debug_bo(struct amdxdna_hwctx *hwctx, u32 debug_bo_hdl)
+{
+	struct amdxdna_client *client = hwctx->client;
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_drv_cmd cmd = { 0 };
+	u64 seq;
+	int ret;
+
+	cmd.opcode = SYNC_DEBUG_BO;
+	ret = amdxdna_cmd_submit(client, &cmd, AMDXDNA_INVALID_BO_HANDLE,
+				 &debug_bo_hdl, 1, hwctx->id, &seq);
+	if (ret) {
+		XDNA_ERR(xdna, "Submit command failed");
+		return ret;
+	}
+
+	aie2_cmd_wait(hwctx, seq);
+	if (cmd.result) {
+		XDNA_ERR(xdna, "Response failure 0x%x", cmd.result);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 {
 	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 4660e8297ed8..0ec1dc6fe668 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -749,7 +749,7 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 	int ret = 0;
 
 	req.src_addr = 0;
-	req.dst_addr = abo->mem.dev_addr - hwctx->client->dev_heap->mem.dev_addr;
+	req.dst_addr = amdxdna_dev_bo_offset(abo);
 	req.size = abo->mem.size;
 
 	/* Device to Host */
@@ -773,3 +773,32 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 
 	return 0;
 }
+
+int aie2_config_debug_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
+			 int (*notify_cb)(void *, void __iomem *, size_t))
+{
+	struct mailbox_channel *chann = hwctx->priv->mbox_chann;
+	struct amdxdna_gem_obj *abo = to_xdna_obj(job->bos[0]);
+	struct amdxdna_dev *xdna = hwctx->client->xdna;
+	struct config_debug_bo_req req;
+	struct xdna_mailbox_msg msg;
+
+	if (job->drv_cmd->opcode == ATTACH_DEBUG_BO)
+		req.config = DEBUG_BO_REGISTER;
+	else
+		req.config = DEBUG_BO_UNREGISTER;
+
+	req.offset = amdxdna_dev_bo_offset(abo);
+	req.size = abo->mem.size;
+
+	XDNA_DBG(xdna, "offset 0x%llx size 0x%llx config %d",
+		 req.offset, req.size, req.config);
+
+	msg.handle = job;
+	msg.notify_cb = notify_cb;
+	msg.send_data = (u8 *)&req;
+	msg.send_size = sizeof(req);
+	msg.opcode = MSG_OP_CONFIG_DEBUG_BO;
+
+	return xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
+}
diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/amdxdna/aie2_msg_priv.h
index 6df9065b13f6..6a5c70bff5e9 100644
--- a/drivers/accel/amdxdna/aie2_msg_priv.h
+++ b/drivers/accel/amdxdna/aie2_msg_priv.h
@@ -18,6 +18,7 @@ enum aie2_msg_opcode {
 	MSG_OP_CONFIG_CU                   = 0x11,
 	MSG_OP_CHAIN_EXEC_BUFFER_CF        = 0x12,
 	MSG_OP_CHAIN_EXEC_DPU              = 0x13,
+	MSG_OP_CONFIG_DEBUG_BO             = 0x14,
 	MSG_OP_MAX_XRT_OPCODE,
 	MSG_OP_SUSPEND                     = 0x101,
 	MSG_OP_RESUME                      = 0x102,
@@ -365,4 +366,16 @@ struct sync_bo_req {
 struct sync_bo_resp {
 	enum aie2_msg_status	status;
 } __packed;
+
+struct config_debug_bo_req {
+	__u64	offset;
+	__u64	size;
+#define DEBUG_BO_UNREGISTER 0
+#define DEBUG_BO_REGISTER   1
+	__u32	config;
+} __packed;
+
+struct config_debug_bo_resp {
+	enum aie2_msg_status	status;
+} __packed;
 #endif /* _AIE2_MSG_PRIV_H_ */
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index cfca4e456b61..f48045318dc0 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -1004,6 +1004,7 @@ const struct amdxdna_dev_ops aie2_ops = {
 	.hwctx_init = aie2_hwctx_init,
 	.hwctx_fini = aie2_hwctx_fini,
 	.hwctx_config = aie2_hwctx_config,
+	.hwctx_sync_debug_bo = aie2_hwctx_sync_debug_bo,
 	.cmd_submit = aie2_cmd_submit,
 	.hmm_invalidate = aie2_hmm_invalidate,
 	.get_array = aie2_get_array,
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 34bc35479f42..243ac21d50c1 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -287,11 +287,14 @@ int aie2_cmdlist_multi_execbuf(struct amdxdna_hwctx *hwctx,
 			       int (*notify_cb)(void *, void __iomem *, size_t));
 int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 		 int (*notify_cb)(void *, void __iomem *, size_t));
+int aie2_config_debug_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
+			 int (*notify_cb)(void *, void __iomem *, size_t));
 
 /* aie2_hwctx.c */
 int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
 void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx);
 int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
+int aie2_hwctx_sync_debug_bo(struct amdxdna_hwctx *hwctx, u32 debug_bo_hdl);
 void aie2_hwctx_suspend(struct amdxdna_client *client);
 int aie2_hwctx_resume(struct amdxdna_client *client);
 int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index 868ca369e0a0..d18182c59668 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -328,6 +328,38 @@ int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
 	return ret;
 }
 
+int amdxdna_hwctx_sync_debug_bo(struct amdxdna_client *client, u32 debug_bo_hdl)
+{
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_hwctx *hwctx;
+	struct amdxdna_gem_obj *abo;
+	struct drm_gem_object *gobj;
+	int ret, idx;
+
+	if (!xdna->dev_info->ops->hwctx_sync_debug_bo)
+		return -EOPNOTSUPP;
+
+	gobj = drm_gem_object_lookup(client->filp, debug_bo_hdl);
+	if (!gobj)
+		return -EINVAL;
+
+	abo = to_xdna_obj(gobj);
+	guard(mutex)(&xdna->dev_lock);
+	idx = srcu_read_lock(&client->hwctx_srcu);
+	hwctx = xa_load(&client->hwctx_xa, abo->assigned_hwctx);
+	if (!hwctx) {
+		ret = -EINVAL;
+		goto unlock_srcu;
+	}
+
+	ret = xdna->dev_info->ops->hwctx_sync_debug_bo(hwctx, debug_bo_hdl);
+
+unlock_srcu:
+	srcu_read_unlock(&client->hwctx_srcu, idx);
+	drm_gem_object_put(gobj);
+	return ret;
+}
+
 static void
 amdxdna_arg_bos_put(struct amdxdna_sched_job *job)
 {
@@ -393,6 +425,7 @@ void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job)
 }
 
 int amdxdna_cmd_submit(struct amdxdna_client *client,
+		       struct amdxdna_drv_cmd *drv_cmd,
 		       u32 cmd_bo_hdl, u32 *arg_bo_hdls, u32 arg_bo_cnt,
 		       u32 hwctx_hdl, u64 *seq)
 {
@@ -406,6 +439,8 @@ int amdxdna_cmd_submit(struct amdxdna_client *client,
 	if (!job)
 		return -ENOMEM;
 
+	job->drv_cmd = drv_cmd;
+
 	if (cmd_bo_hdl != AMDXDNA_INVALID_BO_HANDLE) {
 		job->cmd_bo = amdxdna_gem_get_obj(client, cmd_bo_hdl, AMDXDNA_BO_CMD);
 		if (!job->cmd_bo) {
@@ -413,8 +448,6 @@ int amdxdna_cmd_submit(struct amdxdna_client *client,
 			ret = -EINVAL;
 			goto free_job;
 		}
-	} else {
-		job->cmd_bo = NULL;
 	}
 
 	ret = amdxdna_arg_bos_lookup(client, job, arg_bo_hdls, arg_bo_cnt);
@@ -508,7 +541,7 @@ static int amdxdna_drm_submit_execbuf(struct amdxdna_client *client,
 		}
 	}
 
-	ret = amdxdna_cmd_submit(client, cmd_bo_hdl, arg_bo_hdls,
+	ret = amdxdna_cmd_submit(client, NULL, cmd_bo_hdl, arg_bo_hdls,
 				 args->arg_count, args->hwctx, &args->seq);
 	if (ret)
 		XDNA_DBG(xdna, "Submit cmds failed, ret %d", ret);
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index 7cd7a55936f0..cbe60efbe60b 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -95,6 +95,17 @@ struct amdxdna_hwctx {
 #define drm_job_to_xdna_job(j) \
 	container_of(j, struct amdxdna_sched_job, base)
 
+enum amdxdna_job_opcode {
+	SYNC_DEBUG_BO,
+	ATTACH_DEBUG_BO,
+	DETACH_DEBUG_BO,
+};
+
+struct amdxdna_drv_cmd {
+	enum amdxdna_job_opcode	opcode;
+	u32			result;
+};
+
 struct amdxdna_sched_job {
 	struct drm_sched_job	base;
 	struct kref		refcnt;
@@ -106,6 +117,7 @@ struct amdxdna_sched_job {
 	struct dma_fence	*out_fence;
 	bool			job_done;
 	u64			seq;
+	struct amdxdna_drv_cmd	*drv_cmd;
 	struct amdxdna_gem_obj	*cmd_bo;
 	size_t			bo_cnt;
 	struct drm_gem_object	*bos[] __counted_by(bo_cnt);
@@ -143,9 +155,11 @@ void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job);
 void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
 int amdxdna_hwctx_walk(struct amdxdna_client *client, void *arg,
 		       int (*walk)(struct amdxdna_hwctx *hwctx, void *arg));
+int amdxdna_hwctx_sync_debug_bo(struct amdxdna_client *client, u32 debug_bo_hdl);
 
 int amdxdna_cmd_submit(struct amdxdna_client *client,
-		       u32 cmd_bo_hdls, u32 *arg_bo_hdls, u32 arg_bo_cnt,
+		       struct amdxdna_drv_cmd *drv_cmd, u32 cmd_bo_hdls,
+		       u32 *arg_bo_hdls, u32 arg_bo_cnt,
 		       u32 hwctx_hdl, u64 *seq);
 
 int amdxdna_cmd_wait(struct amdxdna_client *client, u32 hwctx_hdl,
diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index 7f91863c3f24..61e0136c21a8 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -962,6 +962,9 @@ int amdxdna_drm_sync_bo_ioctl(struct drm_device *dev,
 	XDNA_DBG(xdna, "Sync bo %d offset 0x%llx, size 0x%llx\n",
 		 args->handle, args->offset, args->size);
 
+	if (args->direction == SYNC_DIRECT_FROM_DEVICE)
+		ret = amdxdna_hwctx_sync_debug_bo(abo->client, args->handle);
+
 put_obj:
 	drm_gem_object_put(gobj);
 	return ret;
diff --git a/drivers/accel/amdxdna/amdxdna_gem.h b/drivers/accel/amdxdna/amdxdna_gem.h
index ae29db94a9d3..f79fc7f3c93b 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.h
+++ b/drivers/accel/amdxdna/amdxdna_gem.h
@@ -7,6 +7,7 @@
 #define _AMDXDNA_GEM_H_
 
 #include <linux/hmm.h>
+#include "amdxdna_pci_drv.h"
 
 struct amdxdna_umap {
 	struct vm_area_struct		*vma;
@@ -62,6 +63,11 @@ static inline void amdxdna_gem_put_obj(struct amdxdna_gem_obj *abo)
 	drm_gem_object_put(to_gobj(abo));
 }
 
+static inline u64 amdxdna_dev_bo_offset(struct amdxdna_gem_obj *abo)
+{
+	return abo->mem.dev_addr - abo->client->dev_heap->mem.dev_addr;
+}
+
 void amdxdna_umap_put(struct amdxdna_umap *mapp);
 
 struct drm_gem_object *
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 696fdac8ad3c..3599e713bfcb 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -28,9 +28,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
  * 0.0: Initial version
  * 0.1: Support getting all hardware contexts by DRM_IOCTL_AMDXDNA_GET_ARRAY
  * 0.2: Support getting last error hardware error
+ * 0.3: Support firmware debug buffer
  */
 #define AMDXDNA_DRIVER_MAJOR		0
-#define AMDXDNA_DRIVER_MINOR		2
+#define AMDXDNA_DRIVER_MINOR		3
 
 /*
  * Bind the driver base on (vendor_id, device_id) pair and later use the
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index 626beebf730e..c99477f5e454 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -55,6 +55,7 @@ struct amdxdna_dev_ops {
 	int (*hwctx_init)(struct amdxdna_hwctx *hwctx);
 	void (*hwctx_fini)(struct amdxdna_hwctx *hwctx);
 	int (*hwctx_config)(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
+	int (*hwctx_sync_debug_bo)(struct amdxdna_hwctx *hwctx, u32 debug_bo_hdl);
 	void (*hmm_invalidate)(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
 	int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
 	int (*get_aie_info)(struct amdxdna_client *client, struct amdxdna_drm_get_info *args);
diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
index e4f6dac7d00f..10124cccb102 100644
--- a/drivers/accel/amdxdna/npu1_regs.c
+++ b/drivers/accel/amdxdna/npu1_regs.c
@@ -46,6 +46,7 @@
 
 const struct rt_config npu1_default_rt_cfg[] = {
 	{ 2, 1, AIE2_RT_CFG_INIT }, /* PDI APP LOAD MODE */
+	{ 4, 1, AIE2_RT_CFG_INIT }, /* Debug BO */
 	{ 1, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
 	{ 0 },
 };
diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
index 9f2e33182ec6..e1da882420ec 100644
--- a/drivers/accel/amdxdna/npu4_regs.c
+++ b/drivers/accel/amdxdna/npu4_regs.c
@@ -63,6 +63,7 @@
 
 const struct rt_config npu4_default_rt_cfg[] = {
 	{ 5, 1, AIE2_RT_CFG_INIT }, /* PDI APP LOAD MODE */
+	{ 10, 1, AIE2_RT_CFG_INIT }, /* DEBUG BUF */
 	{ 1, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
 	{ 2, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
 	{ 3, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
-- 
2.34.1

