Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4455EC9C4C1
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 17:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FFE10E14D;
	Tue,  2 Dec 2025 16:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oRLFN/iw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013007.outbound.protection.outlook.com
 [40.93.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E6A10E14D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 16:54:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJRNYqtQt6/6+4XvFfZoidL5lv2HT+cjeCU8jAVow/oxN3N/W7b72CI/k22ZaIcNMJENiyanM6XhZcZ9JUsQJRbZkxW5kP+TG79XTCms5Zb849gdZBMM6+Z6KxDpYLS/NhKOLWS2AvQn7+wRslAUewXeyl5Dbfo/4kAwYieviPVR4nHqygX0yZl2CeQw9NcGr2LyBBmifGtd7e3S29BKfB0dVDiWfgbLy+hxU4p8fHscA8wJD0PBC9oa/xl4LB9UloVMgoASs/1gdsISTtGtStl2v66jPEdnbTRClIAnn/mfS7LQXxI2IIj1ETo2wDmabJYTOPIrOljehxc6qSpNrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BB8IvRgVzwF29M1ZkjO8xUwq7lKRKV305G+rrB/G9WE=;
 b=r42qJ33AXUIBzS9YPbG7nW7la3CwuAtEghE21ArA3G3U5h7H+pnOBlF8FtscGrstz4XwSJ3dnyoKWJ46oV7VeSlHNF7C1IOuWe9lyJr1UQzaOV28b1AcuAEO2GrOiygzwZBsVQLqfFUSsiALqJ5XypQcpfEGfTsVIQo3CPbGiERCFZNYeBClnTX8omHaV41RxAge93MItMXU9Z2cbUSqYWpyM2Z2v4CrR89GkVXdUXMUrsNYGqd/Zpt+Gnwp3DKUzglgLuPNCEm6NG5U9nukBdRHxCFzP8MsLrx88HRTBd2NEy0uB7qZ4S/58y0qAnJeIbunyMz7ZbhOZrIXdaKm8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BB8IvRgVzwF29M1ZkjO8xUwq7lKRKV305G+rrB/G9WE=;
 b=oRLFN/iwWukcz+8irHaHDLOG39F0xYH/FJIIrZGTb8pbLVjGBOGqivv/4UYhuBaQaAmGCXqMOq7ne9b9StdprhdB6reiEHaPgyIYMi9cW3K+7NkNXtSJHdDbM782fTBVtTFt60DuoYhgbAywq15URuBLo4C7yqI/N9oPEZ/sQ2U=
Received: from BYAPR05CA0001.namprd05.prod.outlook.com (2603:10b6:a03:c0::14)
 by CH3PR12MB8971.namprd12.prod.outlook.com (2603:10b6:610:177::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 16:54:42 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a03:c0:cafe::bf) by BYAPR05CA0001.outlook.office365.com
 (2603:10b6:a03:c0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 16:54:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 16:54:41 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 2 Dec
 2025 10:54:39 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 2 Dec 2025 08:54:38 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V2] accel/amdxdna: Poll MPNPU_PWAITMODE after requesting
 firmware suspend
Date: Tue, 2 Dec 2025 08:54:27 -0800
Message-ID: <20251202165427.507414-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|CH3PR12MB8971:EE_
X-MS-Office365-Filtering-Correlation-Id: 3689d174-93fa-44b1-0611-08de31c37d02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YOXM5F6Q7Qel9w0c7uYXXKwkm4V9Fx9w8DuIrN+AJ4bByl3hBmLbY672Z17F?=
 =?us-ascii?Q?mMf6J90Oy/UsD2hfdIyOdrypRDvwP5ip26/hFpuXo62Y61/PRXyupqMoAUi+?=
 =?us-ascii?Q?k9455xL5q320t1uWBgFZh/GKSqpMxwKFyGGTuYj8qBXXsNueI3H6ViiJONaX?=
 =?us-ascii?Q?lLDokAVIAldRNdGWrLMs37ysEb52nH2OkFPAPKCvvI+EffHO3egRlbvccXMW?=
 =?us-ascii?Q?4HcobW/4MhdloheiK16RCH+dgDqmDgbiGQxk1HeZqnCO7rCTN9ti1b2slkCT?=
 =?us-ascii?Q?66o+M4LUjiHhM4Wxhix7kaSr7kBmnAU3tnSTsJWswrVJGKt6mEeaLh7lfy/S?=
 =?us-ascii?Q?Ybe+qXuqOh1wVZYVy1BAwJ6zyBj7CVjlPbUe4iyhZ9pHlM4Ch9bF1aI5vger?=
 =?us-ascii?Q?rl1bevQeWrrFfuMh1BtjbnyGoSRa6T8hdvLp72mbM2JXgEmQwee9/A976dEE?=
 =?us-ascii?Q?/teiY2fsq+hFWLM5bR1rQrnZHNVXGD/M+PpfhxHB/WU66dwU/BYrbQ/wfhqi?=
 =?us-ascii?Q?BTMIC0pBH3CoKCrw8a73e8FqAVQB4ZBHh8hr1Jg1wRc2RGUnoMEWn3x2xbpE?=
 =?us-ascii?Q?FcyRbqRjFOSbhY3YCXfFcit7PX1GBI8OLuvpHKF7DbcUbi6hBs33aWYNr2Sj?=
 =?us-ascii?Q?F6noAbyawGsZEywpcEwpq1Z90S5qUVMU2G5aXfnClqs7R+588nr94hSlXoNz?=
 =?us-ascii?Q?RTOASGXXs5LAPTv1J1rb/BQ9d6G1IH5aAtMeQO9ryaOFTVexYhonB6YBVpXQ?=
 =?us-ascii?Q?cGy0MxpLuDMc9eEdknxbmlx+LJ3UN6Gj5/5pxA5QBVCxatloQEWyYClLUsAo?=
 =?us-ascii?Q?xh8Gs9l8uJjRMlXGT8y4v83waNxT1Wc46bVa7Rvl2wtbWEqVA2Dg6JBWs6/v?=
 =?us-ascii?Q?3JQgBaou5f/WRlUUMR1rzVU6q1CM4XRVlaTwQThrZjH5bErUlH+U5mQ4kBqN?=
 =?us-ascii?Q?lbG+FbbPoR/rSWgs6QYjU+1ZMrYLNII2jb4bz2i0TKyeiptsgVsbLxqRUIvq?=
 =?us-ascii?Q?Dp0Jf1SyKXeMpg8JaSyKSlKRBkMsVXLVo7XvULZatCnmrLSQSPTULu0GnJ9B?=
 =?us-ascii?Q?L8tc5XuKo5lkUAW9BjxyBjU9unDi5zGDnzE53G9zNzTPn9qCgJ+zEPJzA/BZ?=
 =?us-ascii?Q?EyvKyUIqI9F8RQ+2EoKQFATyKJgVeu1csHhk5gFUayYur9aKcmMsy8q85LQR?=
 =?us-ascii?Q?QV6vHGmnsQ4qpffeV//wivj3URXUNzMfYAS4U6xjwRNpIocfkpB8fk3OhQCV?=
 =?us-ascii?Q?Hyy5eHhQv6Mn+5nKHkiQyMXw3bFy4dUkyFmx7vt8Xv/po0jsqNzJf7q9uAoE?=
 =?us-ascii?Q?RQ3xcTN4nIRVeUd5IZXLXA/F7FoVaCHm1fTDEhF2/MnO9Cln2VrwWjZ1OAGq?=
 =?us-ascii?Q?nt9gn3+/x7XIV+6gKdde1WmvWO7JrNKH6F0XeczaUoCvjZ/zV6/Ni1sMhNbW?=
 =?us-ascii?Q?YnzpsD3sPaVewCBW5uqkcSbkE3AS8YpJQbYBTwWOrGTQt+hj+uN1LAqwUS5K?=
 =?us-ascii?Q?ipyb9cOSA50JYMajVj2lQavuEMNFsl1gOyuUl3hEUOOlc7wcaNDGW5hbDxL8?=
 =?us-ascii?Q?A/5D2gMbREGOZq9JOvk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 16:54:41.7523 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3689d174-93fa-44b1-0611-08de31c37d02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8971
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
 drivers/accel/amdxdna/npu5_regs.c    |  2 ++
 drivers/accel/amdxdna/npu6_regs.c    |  2 ++
 8 files changed, 35 insertions(+), 1 deletion(-)

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
index f28a060a8810..3a7130577e3e 100644
--- a/drivers/accel/amdxdna/aie2_psp.c
+++ b/drivers/accel/amdxdna/aie2_psp.c
@@ -76,6 +76,21 @@ static int psp_exec(struct psp_device *psp, u32 *reg_vals)
 	return 0;
 }
 
+int aie2_psp_waitmode_poll(struct psp_device *psp)
+{
+	struct amdxdna_dev *xdna = to_xdna_dev(psp->ddev);
+	u32 mode_reg;
+	int ret;
+
+	ret = readx_poll_timeout(readl, PSP_REG(psp, PSP_PWAITMODE_REG), mode_reg,
+				 (mode_reg & 0x1) == 1,
+				 PSP_POLL_INTERVAL, PSP_POLL_TIMEOUT);
+	if (ret)
+		XDNA_ERR(xdna, "fw waitmode reg error, ret %d", ret);
+
+	return ret;
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
index 75ad97f0b937..131080652ef0 100644
--- a/drivers/accel/amdxdna/npu5_regs.c
+++ b/drivers/accel/amdxdna/npu5_regs.c
@@ -13,6 +13,7 @@
 #include "amdxdna_pci_drv.h"
 
 /* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
+#define MPNPU_PWAITMODE                0x301003C
 #define MPNPU_PUB_SEC_INTR             0x3010060
 #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
 #define MPNPU_PUB_SCRATCH0             0x301006C
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

