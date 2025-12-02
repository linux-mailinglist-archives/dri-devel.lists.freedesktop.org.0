Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C364C9A1A9
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 06:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908D310E522;
	Tue,  2 Dec 2025 05:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uDzNujQl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011047.outbound.protection.outlook.com [52.101.52.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D663310E522
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 05:37:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZSSBwaMafwval88c3ucOFGKe5PahG9kELQ6qxOoEtt6f/TwfRUkL8CzJDZc2ROsk5W/uhfM5SDpSXv3rIqxAsbvmQlVRhyjgBSNcvXqUhyxjtgtOopcjD47nRnT8DHwtV1VAKa+HmcCFFTylvmDJjPQyCb2twvuFTKwwuahvIRnGCMmZrN417gyDuAOoDvKKLp4Nqg8O7HvEGvOGLJ6lrk9BXcMaCRR3/UV0zTzrGR+1S8fjOoeTIpwrijYUHtRHDKEEeNcW8fcU8li2ZQIqFKVdhCWV18bkQRMbsjCjO/wdEzhAAN4k687vLfD5LXNHW56s4oONmV5JiAptv2/Y2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNr3HYTzUJY5EjscddqdPKFuexN2dOhpyWYNUlxV6Aw=;
 b=vIqWOI2paSb1X6Z1XoqzhVq3bEzkWpHK8iNpSFblLaveMmZMjVvc4OjRnuuKHw+bVFZmL/HMHPkG5CpJfHozRRW2q5/QuomMoZl3LbTSTbZGFcA+OtLCMGDJMG9aBtgncug4b4oxRyKTw98U5sHcqV9v8K56ZmXaeMW2XRKwWSCHjZ8RhB9e+0IYWH2Ogo58nINBPjt5a8Rs7+uAWm2du0yPeYhw/T6R4kycj1wiDU93SS/NAZdJQnNhNVPIVDXeGLtW6Hx6eHu2kdTQwL6/ZacpcgK/cknhpcsMrcxp4ZAQFCpX1t3FvMCGzupVgGHz8KcMCrhT7DxRYPUbMyKZUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNr3HYTzUJY5EjscddqdPKFuexN2dOhpyWYNUlxV6Aw=;
 b=uDzNujQlhBs+daeSJ7EQbj1FPs/qfkO+2x0UBM2I3P6HEcsFYLBxFloUrWyiqj9REH27zwDSWrKcF9J6lr+lxVOkyCsD9ipx+yrmX17mkXVroEIeokjLUb9VtOorUzIQNYbIobmIEQsdrOAri6Dtyc1hAF0lfL8EciBtrUv71Tk=
Received: from MW4PR03CA0341.namprd03.prod.outlook.com (2603:10b6:303:dc::16)
 by SA1PR12MB6677.namprd12.prod.outlook.com (2603:10b6:806:250::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 05:37:25 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:303:dc:cafe::6f) by MW4PR03CA0341.outlook.office365.com
 (2603:10b6:303:dc::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 05:37:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 05:37:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 1 Dec
 2025 23:37:24 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Dec
 2025 23:37:24 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 1 Dec 2025 21:37:23 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Poll MPNPU_PWAITMODE after requesting
 firmware suspend
Date: Mon, 1 Dec 2025 21:37:17 -0800
Message-ID: <20251202053717.461943-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|SA1PR12MB6677:EE_
X-MS-Office365-Filtering-Correlation-Id: bd732223-5c52-4c20-f7a0-08de3164dfb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HiqEVqAMJ3p1h0LGM5TiNuicWGTJLPdg4CGwRlkUBlFU0LxQREPIDdBGadPt?=
 =?us-ascii?Q?iDmnoF2dmZBffUVw+mL1EE5u4v0veePGyVnkfNhXjQGLGJDcDCFDhZKHY6WA?=
 =?us-ascii?Q?bkhuMiAp4j0cxseDyADDCDSw4zc5Q7nEgu1Xv35Y/qp2u7lQDt2/RrXFXL9b?=
 =?us-ascii?Q?GwbMOXzjPx0cmI0VA2WhNtSCG9A6d39Z8ze0PkHcULsrAdV1I48DCMIRpfmO?=
 =?us-ascii?Q?XiqMHTYSOER1rY+jddH7Mofy2UO0Ab3R4ulmLgHW8BSW/oDLCnUktrhp6dio?=
 =?us-ascii?Q?+5QxlUYwabn02+O4Zqk7l3hR8SclsSKAaoYfJQEHMM7olC4oK/1lVOZhFoh5?=
 =?us-ascii?Q?X9/PEnkJsTEzSKGJrTp6FejPHTCIk1CnRZoQbHvftZb6QKh750Gyecbe6idq?=
 =?us-ascii?Q?09WSJlynADEcHYtvgdUHd0odMRV64qX+sSM5V5KeEbtqIAxlhAMx7i8sH7Tv?=
 =?us-ascii?Q?Uaz8wukqFTbC/oFGPUswH3wRJ3xme5tiJTg2DRnlb/0devYeVooYDySD07fC?=
 =?us-ascii?Q?qShBJ7f07WwuqJHKnupy6zIuN2YlDR2aJ9ideJLN0vEHtK2iw4C/oKisWsbD?=
 =?us-ascii?Q?z+VdhaVisVPcyvxEm/B4zzO5EUKY5xFeJfM2FT0x2CqrqCa5Y40H6nWqHjO+?=
 =?us-ascii?Q?WXTn88uYx/3p8q5qv/euQy7fJ4Vk6Fw1dBAkKcTXPaf1kWrqT4Cl0M/qpceB?=
 =?us-ascii?Q?3CV0yAoVUdQhPQ99n7/uUK5EVoThBT65fLMEFmXOUVZySzHIuXJLIFzzvMhE?=
 =?us-ascii?Q?6JDxt1q48doVuZxq3hRmFzeFla0jq0t6OSX8Dr98nyEnu0CHzIR90EtqCgcX?=
 =?us-ascii?Q?l+VDZUT+V5p3FXARqx1RP1yGtQ3MWef93I5T9Y7ZZms4yhX78qhZ4afRemal?=
 =?us-ascii?Q?iXZVuJskHNE3dFNQGuXbX0rgsA82gkN+4iKiREpQe5CTdDYGdwxhQG7SDhZ5?=
 =?us-ascii?Q?WoeOWG4jw3fj62PAgLgQMlGWkTKm9LjgxFhOCstAEJLV0SbXOhS7uMAfFxMw?=
 =?us-ascii?Q?zMfsuaUd+gVNM2L2YdfqV5J00F8arCiYvTlZTfdK9S5vfsE5axgeWeKAR+ch?=
 =?us-ascii?Q?PBilVRKwxMHMCCoqBDAUPHrpCjKDq2jGSjjiAauHLwUnxenDjqkfJ8W3Abin?=
 =?us-ascii?Q?oShjN97H4EFGPH2W2uM98l4XJS7YiCftAlxEga1VcPnExFFM25H/1rA5r3GY?=
 =?us-ascii?Q?W6TAF2m9b4XUiz70LUmQMGc0DZDq6cOszjBwV14Se6bWiKtHtvKAbG1Mkin4?=
 =?us-ascii?Q?U3Mi3rVZ1fgw04ozqLZEcPa9mTQF3qvEgH2d4mo8aPNYZftVXrulhLoZhsJY?=
 =?us-ascii?Q?4be2zNfh6688O/v5nH0GPVqyK5lqiRPWgPb9WUcQrhFpy5jH4nOk35NacH82?=
 =?us-ascii?Q?xFcdHiUFTr/PE79GSSNY5GYGZb5jEfKG3U1VfxMnTqm2pmn0qfVtIEmqHE/g?=
 =?us-ascii?Q?K3k9TeDOiC2qY3Lbxt/sqSLyP9d1Xp4rS0tEOGuqBL3gqCzNTlGC0s0YuMVF?=
 =?us-ascii?Q?oOm/Qlti7nHUy1R9UJaPDCJwbQ5k4Ryz0rZuaYnMKD93ns1mkN0GQY3wJzTx?=
 =?us-ascii?Q?idp8OZK5WFEZF0A+9Vw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 05:37:25.1857 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd732223-5c52-4c20-f7a0-08de3164dfb9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6677
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

After issuing a firmware suspend request, the driver must ensure that the
suspend operation has completed before proceeding. Add polling of the
MPNPU_PWAITMODE register to confirm that the firmware has fully entered
the suspended state. This prevents race conditions where subsequent
operations assume the firmware is idle before it has actually completed
its suspend sequence.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_message.c |  9 ++++++++-
 drivers/accel/amdxdna/aie2_pci.h     |  2 ++
 drivers/accel/amdxdna/aie2_psp.c     | 15 +++++++++++++++
 drivers/accel/amdxdna/npu1_regs.c    |  2 ++
 drivers/accel/amdxdna/npu2_regs.c    |  2 ++
 drivers/accel/amdxdna/npu4_regs.c    |  2 ++
 drivers/accel/amdxdna/npu5_regs.c    |  4 +++-
 drivers/accel/amdxdna/npu6_regs.c    |  2 ++
 8 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index d493bb1c3360..fee3b0627aba 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -59,8 +59,15 @@ static int aie2_send_mgmt_msg_wait(struct amdxdna_dev_hdl *ndev,
 int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev)
 {
 	DECLARE_AIE2_MSG(suspend, MSG_OP_SUSPEND);
+	int ret;
 
-	return aie2_send_mgmt_msg_wait(ndev, &msg);
+	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
+	if (ret) {
+		XDNA_ERR(ndev->xdna, "Failed to suspend fw, ret %d", ret);
+		return ret;
+	}
+
+	return aie2_psp_waitmode_poll(ndev->psp_hdl);
 }
 
 int aie2_resume_fw(struct amdxdna_dev_hdl *ndev)
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index a5f9c42155d1..cc9f933f80b2 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -70,6 +70,7 @@ enum psp_reg_idx {
 	PSP_INTR_REG = PSP_NUM_IN_REGS,
 	PSP_STATUS_REG,
 	PSP_RESP_REG,
+	PSP_PWAITMODE_REG,
 	PSP_MAX_REGS /* Keep this at the end */
 };
 
@@ -290,6 +291,7 @@ int aie2_pm_set_mode(struct amdxdna_dev_hdl *ndev, enum amdxdna_power_mode_type
 struct psp_device *aie2m_psp_create(struct drm_device *ddev, struct psp_config *conf);
 int aie2_psp_start(struct psp_device *psp);
 void aie2_psp_stop(struct psp_device *psp);
+int aie2_psp_waitmode_poll(struct psp_device *psp);
 
 /* aie2_error.c */
 int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev);
diff --git a/drivers/accel/amdxdna/aie2_psp.c b/drivers/accel/amdxdna/aie2_psp.c
index f28a060a8810..4bc60f458fd4 100644
--- a/drivers/accel/amdxdna/aie2_psp.c
+++ b/drivers/accel/amdxdna/aie2_psp.c
@@ -76,6 +76,21 @@ static int psp_exec(struct psp_device *psp, u32 *reg_vals)
 	return 0;
 }
 
+int aie2_psp_waitmode_poll(struct psp_device *psp)
+{
+	int mode_reg = -1, ret;
+
+	ret = readx_poll_timeout(readl, PSP_REG(psp, PSP_PWAITMODE_REG), mode_reg,
+				 (mode_reg & 0x1) == 1,
+				 PSP_POLL_INTERVAL, PSP_POLL_TIMEOUT);
+	if (ret) {
+		drm_err(psp->ddev, "fw waitmode reg error, ret 0x%x", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 void aie2_psp_stop(struct psp_device *psp)
 {
 	u32 reg_vals[PSP_NUM_IN_REGS] = { PSP_RELEASE_TMR, };
diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
index ec407f3b48fc..ebc6e2802297 100644
--- a/drivers/accel/amdxdna/npu1_regs.c
+++ b/drivers/accel/amdxdna/npu1_regs.c
@@ -13,6 +13,7 @@
 #include "amdxdna_pci_drv.h"
 
 /* Address definition from NPU1 docs */
+#define MPNPU_PWAITMODE			0x3010034
 #define MPNPU_PUB_SEC_INTR		0x3010090
 #define MPNPU_PUB_PWRMGMT_INTR		0x3010094
 #define MPNPU_PUB_SCRATCH2		0x30100A0
@@ -92,6 +93,7 @@ static const struct amdxdna_dev_priv npu1_dev_priv = {
 		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU1_PSP, MPNPU_PUB_SEC_INTR),
 		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU1_PSP, MPNPU_PUB_SCRATCH2),
 		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU1_PSP, MPNPU_PUB_SCRATCH3),
+		DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU1_PSP, MPNPU_PWAITMODE),
 	},
 	.smu_regs_off   = {
 		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU1_SMU, MPNPU_PUB_SCRATCH5),
diff --git a/drivers/accel/amdxdna/npu2_regs.c b/drivers/accel/amdxdna/npu2_regs.c
index 86f87d0d1354..ad0743fb06d5 100644
--- a/drivers/accel/amdxdna/npu2_regs.c
+++ b/drivers/accel/amdxdna/npu2_regs.c
@@ -13,6 +13,7 @@
 #include "amdxdna_pci_drv.h"
 
 /* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
+#define MPNPU_PWAITMODE                0x301003C
 #define MPNPU_PUB_SEC_INTR             0x3010060
 #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
 #define MPNPU_PUB_SCRATCH0             0x301006C
@@ -85,6 +86,7 @@ static const struct amdxdna_dev_priv npu2_dev_priv = {
 		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU2_PSP, MP0_C2PMSG_73),
 		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU2_PSP, MP0_C2PMSG_123),
 		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU2_REG, MPNPU_PUB_SCRATCH3),
+		DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU2_REG, MPNPU_PWAITMODE),
 	},
 	.smu_regs_off   = {
 		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU2_SMU, MP1_C2PMSG_0),
diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
index 986a5f28ba24..4ca21db70478 100644
--- a/drivers/accel/amdxdna/npu4_regs.c
+++ b/drivers/accel/amdxdna/npu4_regs.c
@@ -13,6 +13,7 @@
 #include "amdxdna_pci_drv.h"
 
 /* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
+#define MPNPU_PWAITMODE                0x301003C
 #define MPNPU_PUB_SEC_INTR             0x3010060
 #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
 #define MPNPU_PUB_SCRATCH0             0x301006C
@@ -116,6 +117,7 @@ static const struct amdxdna_dev_priv npu4_dev_priv = {
 		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU4_PSP, MP0_C2PMSG_73),
 		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU4_PSP, MP0_C2PMSG_123),
 		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU4_REG, MPNPU_PUB_SCRATCH3),
+		DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU4_REG, MPNPU_PWAITMODE),
 	},
 	.smu_regs_off   = {
 		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU4_SMU, MP1_C2PMSG_0),
diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
index 75ad97f0b937..f761a6661f40 100644
--- a/drivers/accel/amdxdna/npu5_regs.c
+++ b/drivers/accel/amdxdna/npu5_regs.c
@@ -13,6 +13,7 @@
 #include "amdxdna_pci_drv.h"
 
 /* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
+#define MPNPU_PWAITMODE                0x301003C
 #define MPNPU_PUB_SEC_INTR             0x3010060
 #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
 #define MPNPU_PUB_SCRATCH0             0x301006C
@@ -62,7 +63,7 @@
 #define NPU5_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
 
 static const struct amdxdna_dev_priv npu5_dev_priv = {
-	.fw_path        = "amdnpu/17f0_11/npu.sbin",
+	.fw_path        = "amdnpu/17f0_11/npu.dev.sbin",
 	.protocol_major = 0x6,
 	.protocol_minor = 12,
 	.rt_config	= npu4_default_rt_cfg,
@@ -85,6 +86,7 @@ static const struct amdxdna_dev_priv npu5_dev_priv = {
 		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU5_PSP, MP0_C2PMSG_73),
 		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU5_PSP, MP0_C2PMSG_123),
 		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU5_REG, MPNPU_PUB_SCRATCH3),
+		DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU5_REG, MPNPU_PWAITMODE),
 	},
 	.smu_regs_off   = {
 		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU5_SMU, MP1_C2PMSG_0),
diff --git a/drivers/accel/amdxdna/npu6_regs.c b/drivers/accel/amdxdna/npu6_regs.c
index 758dc013fe13..1f71285655b2 100644
--- a/drivers/accel/amdxdna/npu6_regs.c
+++ b/drivers/accel/amdxdna/npu6_regs.c
@@ -13,6 +13,7 @@
 #include "amdxdna_pci_drv.h"
 
 /* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
+#define MPNPU_PWAITMODE                0x301003C
 #define MPNPU_PUB_SEC_INTR             0x3010060
 #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
 #define MPNPU_PUB_SCRATCH0             0x301006C
@@ -85,6 +86,7 @@ static const struct amdxdna_dev_priv npu6_dev_priv = {
 		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU6_PSP, MP0_C2PMSG_73),
 		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU6_PSP, MP0_C2PMSG_123),
 		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU6_REG, MPNPU_PUB_SCRATCH3),
+		DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU6_REG, MPNPU_PWAITMODE),
 	},
 	.smu_regs_off   = {
 		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU6_SMU, MP1_C2PMSG_0),
-- 
2.34.1

