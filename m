Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF50EC2F713
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 07:26:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D9A10E523;
	Tue,  4 Nov 2025 06:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mBG1RbaC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010062.outbound.protection.outlook.com [52.101.61.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BACF10E24D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 06:26:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzQS5eN74jr6st7eUcFn502wAgxkPRgI3eVhOUFuOYNS2bPQ7N0IAkXX2u1mgyLlxoi8gg7gKpbhTf0eqBR6pxYqC/j6vCroB4OX0vbETCvdxhKyVc+oX4qbkIUXG7Ly8RBiTaosAq/n52aUvz19H1aqOVBTIT531gW2FI6LOdW3bf9C6ms7KvEDbuHQucl5yV/icHOWBcVv4qTdF9v47hTFWdZ5dxPIPnC4bAtRbBSBOdbg4eP3aw7eqrPMXX9mb5WHq7s4Xqd16EqzRD6ggO7pDC34E5zMj656FZNRLylmhaBoPj5oKP7iKenlw7FqSn7FS4uot4QZDGb+S1t3hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gh+DeF38u2lw+EI/r2wI0zgkOASYqaJNxZTPUxKs1E4=;
 b=VPR/m3UJJuohGVD0BLQUtf6B36COpowkmJ0EdjnLo3XX81xZyz87EFPmHsKDHXimn2zNflcU5banzHFw7MT0EBp+z/ug9bVqfh1eWHeIRAti59uUhgdnXKZpvs7/pV9KZLnN8En53vqcPSFov5Mjju8ghMetUr0x9oNPs3gTAGGExweaGF5znY1NNUXRFpeOLrub7ZRi3J0CsI16424jRp7HsXBpgl+5TkCh+k6L3zloTTEdk/f9UOR2qfffdg6E4VeV2yMXSU4b3FtOukxtept2RuvsI/2NvnkUhET715wr7sxeTme0nE66mJYvGItxjuRxpSgpnCCMo6s7kMXMqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gh+DeF38u2lw+EI/r2wI0zgkOASYqaJNxZTPUxKs1E4=;
 b=mBG1RbaC4HO31ioMjUj2ZKGPTxbzba8FpnlByqDZQKWU8hMZ6S8nZreCbu/zRoqjCoUx46ysFUysjNkdQpP8T64vGvVft6+ZxH7AFLP0F5NMDDC+/pS8dx65gjqO8GVjT3zK3tvYIzEDLw33d0H57KBfxIe0MMRXVDsKmYiK4M4=
Received: from MN2PR01CA0052.prod.exchangelabs.com (2603:10b6:208:23f::21) by
 IA1PR12MB6482.namprd12.prod.outlook.com (2603:10b6:208:3a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 06:26:20 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:23f:cafe::80) by MN2PR01CA0052.outlook.office365.com
 (2603:10b6:208:23f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 06:27:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 06:26:20 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 3 Nov
 2025 22:26:09 -0800
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 3 Nov 2025 22:26:09 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH 1/3] accel/amdxdna: Add hardware specific attributes
Date: Mon, 3 Nov 2025 22:25:43 -0800
Message-ID: <20251104062546.833771-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|IA1PR12MB6482:EE_
X-MS-Office365-Filtering-Correlation-Id: 68281c57-944b-47dc-097b-08de1b6b11a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d0sF+puj/+VJjSeNanREatjN0hAZh7yp18LXH0n3wT8lFKBiWJXvJk4mKPQj?=
 =?us-ascii?Q?4hw7TNDxdPCS5OCTrKrtdEoFN9J8Sxrmp2slcv+0lVA2bHa7XmfRwo8mSMf/?=
 =?us-ascii?Q?HhQaBXCW7X0g3eknMJLeTIWRhN2Z5gEV0IafW6g7eSkBnsmxcAXjrznjnO8N?=
 =?us-ascii?Q?BH2ZfKdrBfSeKGii6QGyK6GWR5UOMpwgvPci7G2ggFAzGEaMSMN4AlxK9VFK?=
 =?us-ascii?Q?q5jB5Y7m1ncQGHjsWxqJm9oKmzCB4a2RholtNQSt2JSC7oM8dbvqw5vFiHph?=
 =?us-ascii?Q?G9t0/COt+Z8nClloGO9LNOCIMfzYdK5x2lA8+DIVyLMrsKhpAi6p9oMCf/ob?=
 =?us-ascii?Q?fmS8xSXp+kZJOYJZxZULBHU31dLl6TlZX5S1hSI7NVTiB4rYnXVlJmp4HTkK?=
 =?us-ascii?Q?uqulwHKRStXs4vgIyA3oBSVJvWzI5ufSvabQQrSO20xWA209NUwHCo6YwhVL?=
 =?us-ascii?Q?tfLu/WU4WUT3X2XGjgbxjO7oSvcUv3OLzGUg86eyrrfwu2JYqf05ONJLtw1d?=
 =?us-ascii?Q?kQPt4Bozu1orME/UnS4hG7h6JB7phwoGH0vri2BXhw8fjwS+USq4RIkKreYo?=
 =?us-ascii?Q?QiUMVSUJ/qujyUylkYZ2UZz5deebakz0uYGLayHTUJadJgNSTrqbTQQzibIP?=
 =?us-ascii?Q?phClcJPbLYfHKr17I2DPoHAFvyHSePrfO4sbGMTV2972rEd0iAHqOKB8cAQ/?=
 =?us-ascii?Q?qNLYvtyQjTQG+BUoobDiZs1131hTHWBxRs6N8LpGMBjfXZ51tV7ijhCLDEyu?=
 =?us-ascii?Q?JU1d2wOmLa4R5vNZwVBg48u/TWHKt3SOb2CkcjdHDzCPBAtto/T5fua41FPI?=
 =?us-ascii?Q?ElayMk5Qd9P2RTyHd3Rk1G7ocXFbm5lJoIgKuveVM6Kg28ET+P0ilKd4BhJx?=
 =?us-ascii?Q?Pl4NBc6fpueKQRVMeeHbMv0oLRyhJsLec951Y65OVHacezU3D1AMIpi9gVV9?=
 =?us-ascii?Q?6IQbefnFoXU5hQPicoDRiGIDOFYGawGwB4N7sPC6usT/PDnRPzyuQtF4gSZu?=
 =?us-ascii?Q?oMaSYtjt8C8lf8SiV0ud/hvKm6xlikHC+jQQ5j7ls2WUBOh/zCYy+Y+mrqcW?=
 =?us-ascii?Q?wh23/pE2yFWWUfhrdpdF1a4+vuQ+cGDkqb3E3Zk7yY7JYWexPWcjHm2bgBU4?=
 =?us-ascii?Q?kgnzWRB8kqJBAuDiQEEQUhPU2GTH+7Tj3nj9tNQ4MCAj4axAo1/zlHNHKGUV?=
 =?us-ascii?Q?5QgBFiYGw70SNBnJJWxl+NcjmXhuEg/euEgUpnn3CwSUmdT+hmzSFGgvDpG8?=
 =?us-ascii?Q?NHFeNk0h50BfmdEp0bfzNJxntgBd1Bijrm5ufaxtE3nAnUpw6dAeVmmWlLRz?=
 =?us-ascii?Q?50JNSICwpL0Rn9YQ73WHzEPzwQSeZhOJEJff76cJHwQi6LBxunMRg6s37BuJ?=
 =?us-ascii?Q?qy1bJ4zwTKMMyldH4os/zkUYlYI8zxytqWTKEYm8Pb/IaLX93fEuYcvYVOxD?=
 =?us-ascii?Q?Lkh0TEYhmp03kf1g82Wrr/egJGJHdNEHO7G2K3XIYgZLog4llKC+sAtFqzO0?=
 =?us-ascii?Q?HjlOsDvpgg43lps8cCOeTIp7hoifp5OVWbLYpb2Cng7CGgmlrlwCj3NDZYOt?=
 =?us-ascii?Q?2Rzgao9FDjC4/wk8u0U=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 06:26:20.4279 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68281c57-944b-47dc-097b-08de1b6b11a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6482
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

Add three hardware specific attributes to describe device capabilities:
  hwctx_limit: The maximum number of hardware context supported.
  max_tops: The maximum TOPS supported.
  curr_tops: The TOPS achievable with the current power and frequency
             configuration.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_pci.h  |  3 +++
 drivers/accel/amdxdna/aie2_smu.c  | 11 +++++++++++
 drivers/accel/amdxdna/npu1_regs.c |  1 +
 drivers/accel/amdxdna/npu2_regs.c |  1 +
 drivers/accel/amdxdna/npu4_regs.c |  1 +
 drivers/accel/amdxdna/npu5_regs.c |  1 +
 drivers/accel/amdxdna/npu6_regs.c |  1 +
 7 files changed, 19 insertions(+)

diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 6cc24641d3db..a79f4f71ff6b 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -195,6 +195,8 @@ struct amdxdna_dev_hdl {
 	u32				clk_gating;
 	u32				npuclk_freq;
 	u32				hclk_freq;
+	u32				max_tops;
+	u32				curr_tops;
 
 	/* Mailbox and the management channel */
 	struct mailbox			*mbox;
@@ -246,6 +248,7 @@ struct amdxdna_dev_priv {
 	u32				mbox_dev_addr;
 	/* If mbox_size is 0, use BAR size. See MBOX_SIZE macro */
 	u32				mbox_size;
+	u32				hwctx_limit;
 	u32				sram_dev_addr;
 	struct aie2_bar_off_pair	sram_offs[SRAM_MAX_INDEX];
 	struct aie2_bar_off_pair	psp_regs_off[PSP_MAX_REGS];
diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
index 7f292a615ed8..11c0e9e7b03a 100644
--- a/drivers/accel/amdxdna/aie2_smu.c
+++ b/drivers/accel/amdxdna/aie2_smu.c
@@ -23,6 +23,13 @@
 #define AIE2_SMU_SET_SOFT_DPMLEVEL	0x7
 #define AIE2_SMU_SET_HARD_DPMLEVEL	0x8
 
+#define NPU4_DPM_TOPS(ndev, dpm_level) \
+({ \
+	typeof(ndev) _ndev = ndev; \
+	(4096 * (_ndev)->total_col * \
+	 (_ndev)->priv->dpm_clk_tbl[dpm_level].hclk / 1000000); \
+})
+
 static int aie2_smu_exec(struct amdxdna_dev_hdl *ndev, u32 reg_cmd,
 			 u32 reg_arg, u32 *out)
 {
@@ -84,6 +91,8 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
 	amdxdna_pm_suspend_put(ndev->xdna);
 	ndev->hclk_freq = freq;
 	ndev->dpm_level = dpm_level;
+	ndev->max_tops = 2 * ndev->total_col;
+	ndev->curr_tops = ndev->max_tops * freq / 1028;
 
 	XDNA_DBG(ndev->xdna, "MP-NPU clock %d, H clock %d\n",
 		 ndev->npuclk_freq, ndev->hclk_freq);
@@ -121,6 +130,8 @@ int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
 	ndev->npuclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].npuclk;
 	ndev->hclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].hclk;
 	ndev->dpm_level = dpm_level;
+	ndev->max_tops = NPU4_DPM_TOPS(ndev, ndev->max_dpm_level);
+	ndev->curr_tops = NPU4_DPM_TOPS(ndev, dpm_level);
 
 	XDNA_DBG(ndev->xdna, "MP-NPU clock %d, H clock %d\n",
 		 ndev->npuclk_freq, ndev->hclk_freq);
diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
index 4a43d02404d1..ec407f3b48fc 100644
--- a/drivers/accel/amdxdna/npu1_regs.c
+++ b/drivers/accel/amdxdna/npu1_regs.c
@@ -79,6 +79,7 @@ static const struct amdxdna_dev_priv npu1_dev_priv = {
 	.mbox_dev_addr  = NPU1_MBOX_BAR_BASE,
 	.mbox_size      = 0, /* Use BAR size */
 	.sram_dev_addr  = NPU1_SRAM_BAR_BASE,
+	.hwctx_limit    = 6,
 	.sram_offs      = {
 		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU1_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
 		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU1_SRAM, MPNPU_SRAM_I2X_MAILBOX_15),
diff --git a/drivers/accel/amdxdna/npu2_regs.c b/drivers/accel/amdxdna/npu2_regs.c
index 97df2f09356a..86f87d0d1354 100644
--- a/drivers/accel/amdxdna/npu2_regs.c
+++ b/drivers/accel/amdxdna/npu2_regs.c
@@ -72,6 +72,7 @@ static const struct amdxdna_dev_priv npu2_dev_priv = {
 	.mbox_dev_addr  = NPU2_MBOX_BAR_BASE,
 	.mbox_size      = 0, /* Use BAR size */
 	.sram_dev_addr  = NPU2_SRAM_BAR_BASE,
+	.hwctx_limit    = 16,
 	.sram_offs      = {
 		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU2_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
 		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU2_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
index 5a4ed0c363f8..d90777275a9f 100644
--- a/drivers/accel/amdxdna/npu4_regs.c
+++ b/drivers/accel/amdxdna/npu4_regs.c
@@ -99,6 +99,7 @@ static const struct amdxdna_dev_priv npu4_dev_priv = {
 	.mbox_dev_addr  = NPU4_MBOX_BAR_BASE,
 	.mbox_size      = 0, /* Use BAR size */
 	.sram_dev_addr  = NPU4_SRAM_BAR_BASE,
+	.hwctx_limit    = 16,
 	.sram_offs      = {
 		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU4_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
 		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU4_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
index dadd72df6263..75ad97f0b937 100644
--- a/drivers/accel/amdxdna/npu5_regs.c
+++ b/drivers/accel/amdxdna/npu5_regs.c
@@ -72,6 +72,7 @@ static const struct amdxdna_dev_priv npu5_dev_priv = {
 	.mbox_dev_addr  = NPU5_MBOX_BAR_BASE,
 	.mbox_size      = 0, /* Use BAR size */
 	.sram_dev_addr  = NPU5_SRAM_BAR_BASE,
+	.hwctx_limit    = 16,
 	.sram_offs      = {
 		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU5_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
 		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU5_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
diff --git a/drivers/accel/amdxdna/npu6_regs.c b/drivers/accel/amdxdna/npu6_regs.c
index f73f92869b23..758dc013fe13 100644
--- a/drivers/accel/amdxdna/npu6_regs.c
+++ b/drivers/accel/amdxdna/npu6_regs.c
@@ -72,6 +72,7 @@ static const struct amdxdna_dev_priv npu6_dev_priv = {
 	.mbox_dev_addr  = NPU6_MBOX_BAR_BASE,
 	.mbox_size      = 0, /* Use BAR size */
 	.sram_dev_addr  = NPU6_SRAM_BAR_BASE,
+	.hwctx_limit    = 16,
 	.sram_offs      = {
 		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU6_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
 		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU6_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
-- 
2.34.1

