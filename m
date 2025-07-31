Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3136EB17505
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 18:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7B810E0BA;
	Thu, 31 Jul 2025 16:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vXyErkzr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFD510E0BA
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 16:35:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1Ctbur3rIIqPT/euH43LlKAYVrXyNqHdXoW8p8jAJWaFU3hCGepcbFmIAMXX8s8t3snQ+0EXLSFIG+pJR4ufbhEepN/1Xsc7Kwx6FOb8OW6+L+PsMPa7cBBxHaV3PJCG46y8G4Gfp3TWjQU+CYGscDG81a5jB3dORsbmf6GYZiXv8v4ZmMYx1i2SjUhj8j89JcaQMA9yqGw0TKhs8tUH5MlbQpbsrHLjqhA+Mp9ErIKnP1s7+uWE/pcsqs+/qHOjd5vgVSMSUu3hhGcOaNAiQu3BGtMNJIz4K7KdfvmiDvdwu6ZCCclGi+q9LwlA88wiu1oN6ESopAGfyul1wpr2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frOOz3YiJhz7ONxFzV8lAqPd+dqAM1fdKPBpDtYxjoI=;
 b=mjeP+bm5NfVqwTRNSvXUMUQynre6YWPwVzZbCORVJYEj7MtGqjn81Z3Kd+FNMbGNcuo9YBEOvhH9NQPmZsrFg1My3XsPOaGQ1UBRH+asaI81uQzt+r2EGBBddg7IXFu+W0y/1ULlkUQ+ED+LgARR85pT7kXKf0/4A3RVT7mCH/wXesXISUVGFlnPq1xOV4aOgMt2j9sFwvG/tzcDy+szsQANXVV1Vx8Mpu7HjoZnZGGSfd0Og0aMPRPQDyhZKqoXpy6mFxbCYAJGNE5BGvfql3neyMV2UOmPaE62i9mdrRTB8mpssLXNBa7kbpIMNsMWt+bu+P40l3QnctZ9nkOnXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frOOz3YiJhz7ONxFzV8lAqPd+dqAM1fdKPBpDtYxjoI=;
 b=vXyErkzrDa9kLE2sflVq2GRa2FTNqEheOvFPnGgrkBtEyybTRmIR8bJ0sv6PxmHLUKWx7PceuBMypOG4HORtHArgMHr54eMndg/3RylYQfVUX0UH/vdcaSAp+M6GnvDDiEp3jb5PLxiGDbBGKWdGkgtKpM58yZqxIoDLLjBjEKI=
Received: from BN1PR10CA0009.namprd10.prod.outlook.com (2603:10b6:408:e0::14)
 by CY8PR12MB7196.namprd12.prod.outlook.com (2603:10b6:930:58::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 16:35:54 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:408:e0:cafe::68) by BN1PR10CA0009.outlook.office365.com
 (2603:10b6:408:e0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.12 via Frontend Transport; Thu,
 31 Jul 2025 16:35:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.0 via Frontend Transport; Thu, 31 Jul 2025 16:35:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 11:35:53 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 31 Jul 2025 11:35:52 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Unify pm and rpm suspend and resume
 callbacks
Date: Thu, 31 Jul 2025 09:35:50 -0700
Message-ID: <20250731163550.960686-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|CY8PR12MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4c9242-4375-4946-8e7b-08ddd050517d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3uyI80iBuKNZjFRIhZ3ChJ3d5jrHy7XqvSpFoDa3KnawMQJgC/WcYJTLcphb?=
 =?us-ascii?Q?EAu6tRc6shwsFg+lbSZjrnX4Gc4BwaOu8gbcQFPE3gsh7yaBtna++XBkb8f9?=
 =?us-ascii?Q?pour2gPIVlq2eLfH9DmaBDssjJ9tFfVsSh6I6UQ/dKVs8fTXyM0MRQ9oa0lW?=
 =?us-ascii?Q?s4g/Z91TrUP5ohoR6U6CSay3IlXdHVsIoy/Yu0xg30RoGQpVraS7iWp8oA9T?=
 =?us-ascii?Q?HKm72bCvvnsXxQSpVcFMGMH0Qrh8TEzDvCKdAOMEbX9gbtDunl6Rlt4jGS5m?=
 =?us-ascii?Q?fn5NvKgGl6EAU3nLtGGLzTSIf14EtdWv6mvfTohc0MkAXPLSsfDTqFh3gRpb?=
 =?us-ascii?Q?oZjKSVl0eWzyVuIOgw4LlmF5xncVXc9mJ/q1A4/hRNyGNSp3SnGNKitAb4+8?=
 =?us-ascii?Q?PqbO6j5Ks/VhJpjI+/HUHLGKX2UTq5dSYF1UmE7gDq5pwh7RvBJLDFSE4E10?=
 =?us-ascii?Q?0I4oOksoHINbC/6x0BptnytZKoru9ohl3Q2L+irZ7pR/xiAbeVPRkVWLaMHd?=
 =?us-ascii?Q?MRHiCDJiJvhxZkKgaQydcb0v6AqkFnEKWGLeEnx4A23c24xb+CMzLriGIiVJ?=
 =?us-ascii?Q?49yCxSrH35zhQEDuIxWDDAtyog0JwXcTdYy4hHxQPNcYjglRzEe5/d1K+BpG?=
 =?us-ascii?Q?RlDBTOplb0I24B1vIyOyHlT+FhqctLpH6DOejh5rr9gI+YwgkLh4B27plCmW?=
 =?us-ascii?Q?2ivgajuEajBMMGslaoo9i6b2sJCYfheBAcB1LhrbUCkCPAgVVcbssnNJYK13?=
 =?us-ascii?Q?vRudefoAySN5cd2DfiuDx6ryu1LWorR1I+7PMmCqd8PTY/hLHFvIJDKObi3L?=
 =?us-ascii?Q?T5cTjf2tlcyqH/8RrlLlaGe6AA7+xV/rIuPyoSUf73MobS772R0mYGQwAUS5?=
 =?us-ascii?Q?3wojYV9/BJJ6Pkx5RnWQWrpuneCGuoORCd37eMN1/WiObMhiSLj/iael4W18?=
 =?us-ascii?Q?74PYL8EKiOf0FTCgPOoI9rCsuAqaHTJg9pyTtSyjBIvKQPCOYPV2Kt9wC9iS?=
 =?us-ascii?Q?gNHZb+3twt3wZw7qzC1IeHu/uiSb5mzV3vIG0oKc2k6aGy/FQ9ll4PU+VPLB?=
 =?us-ascii?Q?HBxKVlixUDGuZZvJNL6jbR/2paC7Bqd8VT6m1ge9vNZIx5aJN+/Nx8vVzVbF?=
 =?us-ascii?Q?QdLgtAe36hiFmga97oARohYHijBlx4awLNyZkL1AEMQMV4Vc7h5+Ep5FVGi7?=
 =?us-ascii?Q?g6jZriUCygZabOy29LX4RkCv6uF3EQFMpnIOJU/xTjFI6xeieg9aiEUBcgBj?=
 =?us-ascii?Q?ZErxNXEK+TXEAF4rjngOUDlemuW4wsEtIjSl5tOd5VNJIwbN4DOtM9v43sHz?=
 =?us-ascii?Q?FmaBrwJhconYPpjcl2tsULSkWDPd4pEzLydx2j9KjhD/hhz2DMQGWgP8AF0K?=
 =?us-ascii?Q?7rB7uwrATwFrDFlusbBVxIZNao15ueBVIlXCmZ0RHzr4KYgGMVRjmgnQKgvV?=
 =?us-ascii?Q?vhoZLPOzSDmc+CO3r7UlWGBuC9+tcgJfLlg9o0WlnvEtomeoNYBPKtbhEv0o?=
 =?us-ascii?Q?UdxeIqPdjcLg8XRfVdCyd1EbN1s9wpKjBs3c?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 16:35:53.9187 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4c9242-4375-4946-8e7b-08ddd050517d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7196
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

The suspend and resume callbacks for pm and runtime pm should be same.
During suspending, it needs to stop all hardware contexts first. And
the hardware contexts will be restarted after the device is resumed.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c        | 32 +++++++----
 drivers/accel/amdxdna/aie2_pci.c        | 41 ++++++++++++--
 drivers/accel/amdxdna/aie2_pci.h        |  4 +-
 drivers/accel/amdxdna/amdxdna_ctx.c     | 26 ---------
 drivers/accel/amdxdna/amdxdna_ctx.h     |  2 -
 drivers/accel/amdxdna/amdxdna_pci_drv.c | 74 +++----------------------
 drivers/accel/amdxdna/amdxdna_pci_drv.h |  4 +-
 7 files changed, 69 insertions(+), 114 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 2cff5419bd2f..7444117f0e17 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -141,9 +141,11 @@ static void aie2_hwctx_wait_for_idle(struct amdxdna_hwctx *hwctx)
 	dma_fence_put(fence);
 }
 
-void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx)
+void aie2_hwctx_suspend(struct amdxdna_client *client)
 {
-	struct amdxdna_dev *xdna = hwctx->client->xdna;
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_hwctx *hwctx;
+	unsigned long hwctx_id;
 
 	/*
 	 * Command timeout is unlikely. But if it happens, it doesn't
@@ -151,15 +153,21 @@ void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx)
 	 * and abort all commands.
 	 */
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
-	aie2_hwctx_wait_for_idle(hwctx);
-	aie2_hwctx_stop(xdna, hwctx, NULL);
-	hwctx->old_status = hwctx->status;
-	hwctx->status = HWCTX_STAT_STOP;
+	mutex_lock(&client->hwctx_lock);
+	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
+		aie2_hwctx_wait_for_idle(hwctx);
+		aie2_hwctx_stop(xdna, hwctx, NULL);
+		hwctx->old_status = hwctx->status;
+		hwctx->status = HWCTX_STAT_STOP;
+	}
+	mutex_unlock(&client->hwctx_lock);
 }
 
-void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx)
+void aie2_hwctx_resume(struct amdxdna_client *client)
 {
-	struct amdxdna_dev *xdna = hwctx->client->xdna;
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_hwctx *hwctx;
+	unsigned long hwctx_id;
 
 	/*
 	 * The resume path cannot guarantee that mailbox channel can be
@@ -167,8 +175,12 @@ void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx)
 	 * mailbox channel, error will return.
 	 */
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
-	hwctx->status = hwctx->old_status;
-	aie2_hwctx_restart(xdna, hwctx);
+	mutex_lock(&client->hwctx_lock);
+	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
+		hwctx->status = hwctx->old_status;
+		aie2_hwctx_restart(xdna, hwctx);
+	}
+	mutex_unlock(&client->hwctx_lock);
 }
 
 static void
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 3474a8d4e560..8b6f17430d3a 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -440,6 +440,41 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
 	return ret;
 }
 
+static int aie2_hw_suspend(struct amdxdna_dev *xdna)
+{
+	struct amdxdna_client *client;
+
+	mutex_lock(&xdna->dev_lock);
+	list_for_each_entry(client, &xdna->client_list, node)
+		aie2_hwctx_suspend(client);
+
+	aie2_hw_stop(xdna);
+	mutex_unlock(&xdna->dev_lock);
+
+	return 0;
+}
+
+static int aie2_hw_resume(struct amdxdna_dev *xdna)
+{
+	struct amdxdna_client *client;
+	int ret;
+
+	mutex_lock(&xdna->dev_lock);
+	ret = aie2_hw_start(xdna);
+	if (ret) {
+		XDNA_ERR(xdna, "Start hardware failed, %d", ret);
+		goto unlock;
+	}
+
+	list_for_each_entry(client, &xdna->client_list, node)
+		aie2_hwctx_resume(client);
+
+unlock:
+	mutex_unlock(&xdna->dev_lock);
+
+	return ret;
+}
+
 static int aie2_init(struct amdxdna_dev *xdna)
 {
 	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
@@ -901,8 +936,8 @@ static int aie2_set_state(struct amdxdna_client *client,
 const struct amdxdna_dev_ops aie2_ops = {
 	.init           = aie2_init,
 	.fini           = aie2_fini,
-	.resume         = aie2_hw_start,
-	.suspend        = aie2_hw_stop,
+	.resume         = aie2_hw_resume,
+	.suspend        = aie2_hw_suspend,
 	.get_aie_info   = aie2_get_info,
 	.set_aie_state	= aie2_set_state,
 	.hwctx_init     = aie2_hwctx_init,
@@ -910,6 +945,4 @@ const struct amdxdna_dev_ops aie2_ops = {
 	.hwctx_config   = aie2_hwctx_config,
 	.cmd_submit     = aie2_cmd_submit,
 	.hmm_invalidate = aie2_hmm_invalidate,
-	.hwctx_suspend  = aie2_hwctx_suspend,
-	.hwctx_resume   = aie2_hwctx_resume,
 };
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 385914840eaa..6b21909841e0 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -288,8 +288,8 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
 void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx);
 int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
-void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx);
-void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx);
+void aie2_hwctx_suspend(struct amdxdna_client *client);
+void aie2_hwctx_resume(struct amdxdna_client *client);
 int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
 void aie2_hmm_invalidate(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
 void aie2_restart_ctx(struct amdxdna_client *client);
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index be073224bd69..b47a7f8e9017 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -60,32 +60,6 @@ static struct dma_fence *amdxdna_fence_create(struct amdxdna_hwctx *hwctx)
 	return &fence->base;
 }
 
-void amdxdna_hwctx_suspend(struct amdxdna_client *client)
-{
-	struct amdxdna_dev *xdna = client->xdna;
-	struct amdxdna_hwctx *hwctx;
-	unsigned long hwctx_id;
-
-	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
-	mutex_lock(&client->hwctx_lock);
-	amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
-		xdna->dev_info->ops->hwctx_suspend(hwctx);
-	mutex_unlock(&client->hwctx_lock);
-}
-
-void amdxdna_hwctx_resume(struct amdxdna_client *client)
-{
-	struct amdxdna_dev *xdna = client->xdna;
-	struct amdxdna_hwctx *hwctx;
-	unsigned long hwctx_id;
-
-	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
-	mutex_lock(&client->hwctx_lock);
-	amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
-		xdna->dev_info->ops->hwctx_resume(hwctx);
-	mutex_unlock(&client->hwctx_lock);
-}
-
 static void amdxdna_hwctx_destroy_rcu(struct amdxdna_hwctx *hwctx,
 				      struct srcu_struct *ss)
 {
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index f0a4a8586d85..c652229547a3 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -147,8 +147,6 @@ static inline u32 amdxdna_hwctx_col_map(struct amdxdna_hwctx *hwctx)
 
 void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job);
 void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
-void amdxdna_hwctx_suspend(struct amdxdna_client *client);
-void amdxdna_hwctx_resume(struct amdxdna_client *client);
 
 int amdxdna_cmd_submit(struct amdxdna_client *client,
 		       u32 cmd_bo_hdls, u32 *arg_bo_hdls, u32 arg_bo_cnt,
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index f2bf1d374cc7..fbca94183f96 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -343,89 +343,29 @@ static void amdxdna_remove(struct pci_dev *pdev)
 	mutex_unlock(&xdna->dev_lock);
 }
 
-static int amdxdna_dev_suspend_nolock(struct amdxdna_dev *xdna)
-{
-	if (xdna->dev_info->ops->suspend)
-		xdna->dev_info->ops->suspend(xdna);
-
-	return 0;
-}
-
-static int amdxdna_dev_resume_nolock(struct amdxdna_dev *xdna)
-{
-	if (xdna->dev_info->ops->resume)
-		return xdna->dev_info->ops->resume(xdna);
-
-	return 0;
-}
-
 static int amdxdna_pmops_suspend(struct device *dev)
 {
 	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
-	struct amdxdna_client *client;
-
-	mutex_lock(&xdna->dev_lock);
-	list_for_each_entry(client, &xdna->client_list, node)
-		amdxdna_hwctx_suspend(client);
 
-	amdxdna_dev_suspend_nolock(xdna);
-	mutex_unlock(&xdna->dev_lock);
+	if (!xdna->dev_info->ops->suspend)
+		return -EOPNOTSUPP;
 
-	return 0;
+	return xdna->dev_info->ops->suspend(xdna);
 }
 
 static int amdxdna_pmops_resume(struct device *dev)
 {
 	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
-	struct amdxdna_client *client;
-	int ret;
-
-	XDNA_INFO(xdna, "firmware resuming...");
-	mutex_lock(&xdna->dev_lock);
-	ret = amdxdna_dev_resume_nolock(xdna);
-	if (ret) {
-		XDNA_ERR(xdna, "resume NPU firmware failed");
-		mutex_unlock(&xdna->dev_lock);
-		return ret;
-	}
 
-	XDNA_INFO(xdna, "hardware context resuming...");
-	list_for_each_entry(client, &xdna->client_list, node)
-		amdxdna_hwctx_resume(client);
-	mutex_unlock(&xdna->dev_lock);
-
-	return 0;
-}
-
-static int amdxdna_rpmops_suspend(struct device *dev)
-{
-	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
-	int ret;
-
-	mutex_lock(&xdna->dev_lock);
-	ret = amdxdna_dev_suspend_nolock(xdna);
-	mutex_unlock(&xdna->dev_lock);
-
-	XDNA_DBG(xdna, "Runtime suspend done ret: %d", ret);
-	return ret;
-}
-
-static int amdxdna_rpmops_resume(struct device *dev)
-{
-	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
-	int ret;
-
-	mutex_lock(&xdna->dev_lock);
-	ret = amdxdna_dev_resume_nolock(xdna);
-	mutex_unlock(&xdna->dev_lock);
+	if (!xdna->dev_info->ops->resume)
+		return -EOPNOTSUPP;
 
-	XDNA_DBG(xdna, "Runtime resume done ret: %d", ret);
-	return ret;
+	return xdna->dev_info->ops->resume(xdna);
 }
 
 static const struct dev_pm_ops amdxdna_pm_ops = {
 	SYSTEM_SLEEP_PM_OPS(amdxdna_pmops_suspend, amdxdna_pmops_resume)
-	RUNTIME_PM_OPS(amdxdna_rpmops_suspend, amdxdna_rpmops_resume, NULL)
+	RUNTIME_PM_OPS(amdxdna_pmops_suspend, amdxdna_pmops_resume, NULL)
 };
 
 static struct pci_driver amdxdna_pci_driver = {
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index ab79600911aa..40bbb3c06320 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -50,13 +50,11 @@ struct amdxdna_dev_ops {
 	int (*init)(struct amdxdna_dev *xdna);
 	void (*fini)(struct amdxdna_dev *xdna);
 	int (*resume)(struct amdxdna_dev *xdna);
-	void (*suspend)(struct amdxdna_dev *xdna);
+	int (*suspend)(struct amdxdna_dev *xdna);
 	int (*hwctx_init)(struct amdxdna_hwctx *hwctx);
 	void (*hwctx_fini)(struct amdxdna_hwctx *hwctx);
 	int (*hwctx_config)(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
 	void (*hmm_invalidate)(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
-	void (*hwctx_suspend)(struct amdxdna_hwctx *hwctx);
-	void (*hwctx_resume)(struct amdxdna_hwctx *hwctx);
 	int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
 	int (*get_aie_info)(struct amdxdna_client *client, struct amdxdna_drm_get_info *args);
 	int (*set_aie_state)(struct amdxdna_client *client, struct amdxdna_drm_set_state *args);
-- 
2.34.1

