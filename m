Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453E6CA01CD
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 17:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1364D10E15D;
	Wed,  3 Dec 2025 16:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yIrHzIjI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010050.outbound.protection.outlook.com [52.101.61.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A14310E15D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 16:48:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhLMEaVSUeq/0aPBwlU0s8kIxs2g/sgJ7vIvf3veWQX8ZBfewxUBwCakcb/hbHVBMMYlqw5YmCHl01nZyY/qpDfIW0A2KsfTFo/ySUKdCgQpqc7+7F9/4IalSsyI3mP5RGV7D4mUqH6tNu+SZ19LYjwqk3zHGEAXt8zaXrsMJubTkybSMaLJUs4sw/tPHMt7wDmugyqzD3Jf9q5g0YWqq+rtY6h18KhOX8u2jcZGZg8YUBwtsZJq5/yQB15nCqInRmDPhcFg3iERHrsXy/ASYRgibrM4S1ICJlt3gpxrnXrgeMP4pE5Ji0my15sjRBN1eb2b3j2yyOV82qk+9W4/JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVAZXARTlRo8D3/NCOQypid+iH970+kY6k2pAICBWj0=;
 b=Z1WB8Q6fz2tj4vgn/x0ihQro4H7QHLoefFf2qsYOhYpS1mB12b6ZaI033QFSUE0tWkhcGm2IBOPo4T/vfQxx9ZRarphO5XIdH03gVfX4KMNfsrOxr0vmjPO27rlBSpdG7P7x3rKq6meJ3hWliSDuGbdpdB9czbIBkI+xTgYWEPFnzNyTZ4CPkA2m+SHU5t+sDSQJCdcfb+JicIFEtd5o+gaIQbun/7iUTbV1o1MA7JZJRFTUKMpKNF7SrhZZOYMGfvOMMbEGiAArsyEiwOc0ZG28odT1Xxey3W0oxcUVtOkeKHjpZ6yKAdpaUkvyQiGTQdI8V8oTmlD3NBsUTVtpYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVAZXARTlRo8D3/NCOQypid+iH970+kY6k2pAICBWj0=;
 b=yIrHzIjId0S/6dMg/vgaW5VG0Xoka6B0aB9tiD9Pbz4Ht36/uZKTnfZuTd2JDXXgVUngWy5dFp/LkVsEz3QRuWtF+v1NW9/KiDLRUutuxVFj78Of+FHO/WAczL4cCUDlXKJwpgKNSgXi2NI8PIjTgkTVmToMXJtK/O4XyPqfQx0=
Received: from SJ0PR03CA0180.namprd03.prod.outlook.com (2603:10b6:a03:338::35)
 by BY5PR12MB4260.namprd12.prod.outlook.com (2603:10b6:a03:206::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 16:48:45 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:338:cafe::93) by SJ0PR03CA0180.outlook.office365.com
 (2603:10b6:a03:338::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 16:48:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 16:48:45 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 10:48:43 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 3 Dec 2025 08:48:42 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Fix race condition when checking rpm_on
Date: Wed, 3 Dec 2025 08:48:36 -0800
Message-ID: <20251203164836.695866-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|BY5PR12MB4260:EE_
X-MS-Office365-Filtering-Correlation-Id: b1230d9b-ecdf-4bdf-74f0-08de328bd332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v5lP62HHJUkasWLLUVtvdBMi+p8rprgHbcgYB1g8QP8B8n1okPaunqpK+hAk?=
 =?us-ascii?Q?yKOZfcnSZ/ggJE+3FYEUvH2IaYM7awzWZ9okW379ScmQQb952B9Wle9ZNEdd?=
 =?us-ascii?Q?CBTioRbenlepG+TaPTDfHFTUQw4+nFvdE+uNBTs368Nu5XUsS4zbURaF9WUa?=
 =?us-ascii?Q?QDf5D9KZqhp6iZx6Sh5+AFVLPgP9804viJVy9ZjA/3G8QP05szxcqP9qb/Tx?=
 =?us-ascii?Q?+ppLn0tLUXmCuunlEYZ9+gmYSomiDZKX1wn+c1+fUZo/R8KmV1IiU6gj/Ido?=
 =?us-ascii?Q?6U2prPEMHz2WdWLILNXY8P2vikhTUl6BmwFPxbRcaE8onQKX7/tor/rgtFCw?=
 =?us-ascii?Q?XmVmkYZLVaS2KRcIoK1JY8wsboaIcxPUGyd6dwftIeQiuLl/kYnDukUw7GD2?=
 =?us-ascii?Q?qsHlxTJN0NA7KQQCyh2iVhS6KdBPqojpjP5wDTyWC96c0npAdCLS7ZakPo/B?=
 =?us-ascii?Q?6JwN19KlZ6BCMIYRFVpmtffUd56HfkBpVucMpLBZBkppcfPTslbFZ3KNFZiT?=
 =?us-ascii?Q?+ejfb0Jbfm0X7b4jSwnlO7JNHP/5Zq4mAK19VwfF2Hg0xGgb48V9zIB8cNCp?=
 =?us-ascii?Q?0H/AKrtrnW2wF6OT9ZrC3Hmi7GKMiCP2FrDWb+rgJBTnKenZc8fHByxOSgMk?=
 =?us-ascii?Q?mg9/bN/S1lOqDnby2YwxL316lRZSMRcCGqzrUoIxawahL9N88MhAKQL88C7J?=
 =?us-ascii?Q?Hmy/gWThjkd1fokdYZH67k+oqCmVatwvn7IohhNyGAdWNFKj9ACrUr/FfJre?=
 =?us-ascii?Q?4ob4A1WcYhGPk65ymjLY85Srgkx9h524NYUo6McU9TSVz8lqjADLogEBhQy6?=
 =?us-ascii?Q?Vjz/EKxxWESxIr/nzJ7uOFBZTdQV7KM/v4ZOx5VGxNFTQb3TAQdm8siTiSk2?=
 =?us-ascii?Q?3x0m8ug/hmdW/gcYq2UQ/m2wNt7B0HErRcIBQGy2C3vlxe1ricRhfoHh2qAO?=
 =?us-ascii?Q?fcsGU+KRe9ez4GL5RPYHgf21ffqBUl13cY1sbzAYUVlisU2+h1ZER1AZTMe6?=
 =?us-ascii?Q?v0oJ4bYsLnBjAZ6GuSDjR26eM9+dtFzmoa5i0DZvLXyl37mCXsNaiRpTW9D8?=
 =?us-ascii?Q?9OzEAXyrHUcARs8CwcadyfS9Ub+3AL/o34cq0EfWCQykEP6BYSWkXXTbWlNy?=
 =?us-ascii?Q?iotY9EY5cbsDR5vNic0RSl3vqXCVcJyz68ADkPtXgS4oO/JiXY4B4vaj4Di5?=
 =?us-ascii?Q?k1PS/y4eSSefpdLQ09SvI0Lyz8HU+D8MwXFHS5i+URU5Ql8uZQheyfCnN6qu?=
 =?us-ascii?Q?giKXn3Wqi24FDjyuk+UW/O6tFRDcYfX71gHtAhBFJLWQVAv92UQQ69hB0Amo?=
 =?us-ascii?Q?UFMup8VxQYqHJ8eZpGevYINBl4bpr0fy2E2WNYqlnXCajV1JBt3k/B9LvChZ?=
 =?us-ascii?Q?KBkT3duwU200DVW+ElK9rLjmQsxhHPholtvcBHLBCOnanEQPtHuJ0LXgwuo5?=
 =?us-ascii?Q?89OiQKSLvQhjVfWN1k1Y7A2+EUW+J1clQxU/rAmrr56BYfFwFZ3jb0JPW16h?=
 =?us-ascii?Q?m4SeqE/NlRBIStZYohx8E/DUk89ATM8VwLikaUbdKrVPpJkFJS0X8zHvE7If?=
 =?us-ascii?Q?rcp1i+k/jbsVd1ByDEk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 16:48:45.6985 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1230d9b-ecdf-4bdf-74f0-08de328bd332
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4260
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

When autosuspend is triggered, driver rpm_on flag is set to indicate that
a suspend/resume is already in progress. However, when a userspace
application submits a command during this narrow window,
amdxdna_pm_resume_get() may incorrectly skip the resume operation because
the rpm_on flag is still set. This results in commands being submitted
while the device has not actually resumed, causing unexpected behavior.

The set_dpm() is the only function which is called by suspend/resume and
by user application. So to fix this, remove the use of the rpm_on flag
entirely. Instead, introduce aie2_pm_set_dpm() which explicitly resumes
the device before invoking set_dpm(). With this change, set_dpm() is called
directly inside the suspend or resume execution path. Otherwise,
aie2_pm_set_dpm() is called.

Fixes: 063db451832b ("accel/amdxdna: Enhance runtime power management")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_message.c    |  2 +-
 drivers/accel/amdxdna/aie2_pci.c        |  2 +-
 drivers/accel/amdxdna/aie2_pci.h        |  1 +
 drivers/accel/amdxdna/aie2_pm.c         | 17 +++++++++++++++-
 drivers/accel/amdxdna/aie2_smu.c        | 27 ++++---------------------
 drivers/accel/amdxdna/amdxdna_pci_drv.h |  1 -
 drivers/accel/amdxdna/amdxdna_pm.c      | 22 ++------------------
 7 files changed, 25 insertions(+), 47 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index fee3b0627aba..c171ef19a438 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -39,7 +39,7 @@ static int aie2_send_mgmt_msg_wait(struct amdxdna_dev_hdl *ndev,
 	if (!ndev->mgmt_chann)
 		return -ENODEV;
 
-	drm_WARN_ON(&xdna->ddev, xdna->rpm_on && !mutex_is_locked(&xdna->dev_lock));
+	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
 	ret = xdna_send_msg_wait(xdna, ndev->mgmt_chann, msg);
 	if (ret == -ETIME) {
 		xdna_mailbox_stop_channel(ndev->mgmt_chann);
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index ceef1c502e9e..81a8e4137bfd 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -321,7 +321,7 @@ static int aie2_xrs_set_dft_dpm_level(struct drm_device *ddev, u32 dpm_level)
 	if (ndev->pw_mode != POWER_MODE_DEFAULT || ndev->dpm_level == dpm_level)
 		return 0;
 
-	return ndev->priv->hw_ops.set_dpm(ndev, dpm_level);
+	return aie2_pm_set_dpm(ndev, dpm_level);
 }
 
 static struct xrs_action_ops aie2_xrs_actions = {
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index cc9f933f80b2..c6b5cf4ae5c4 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -286,6 +286,7 @@ int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level);
 /* aie2_pm.c */
 int aie2_pm_init(struct amdxdna_dev_hdl *ndev);
 int aie2_pm_set_mode(struct amdxdna_dev_hdl *ndev, enum amdxdna_power_mode_type target);
+int aie2_pm_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level);
 
 /* aie2_psp.c */
 struct psp_device *aie2m_psp_create(struct drm_device *ddev, struct psp_config *conf);
diff --git a/drivers/accel/amdxdna/aie2_pm.c b/drivers/accel/amdxdna/aie2_pm.c
index 426c38fce848..afcd6d4683e5 100644
--- a/drivers/accel/amdxdna/aie2_pm.c
+++ b/drivers/accel/amdxdna/aie2_pm.c
@@ -10,6 +10,7 @@
 
 #include "aie2_pci.h"
 #include "amdxdna_pci_drv.h"
+#include "amdxdna_pm.h"
 
 #define AIE2_CLK_GATING_ENABLE	1
 #define AIE2_CLK_GATING_DISABLE	0
@@ -26,6 +27,20 @@ static int aie2_pm_set_clk_gating(struct amdxdna_dev_hdl *ndev, u32 val)
 	return 0;
 }
 
+int aie2_pm_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
+{
+	int ret;
+
+	ret = amdxdna_pm_resume_get(ndev->xdna);
+	if (ret)
+		return ret;
+
+	ret = ndev->priv->hw_ops.set_dpm(ndev, dpm_level);
+	amdxdna_pm_suspend_put(ndev->xdna);
+
+	return ret;
+}
+
 int aie2_pm_init(struct amdxdna_dev_hdl *ndev)
 {
 	int ret;
@@ -94,7 +109,7 @@ int aie2_pm_set_mode(struct amdxdna_dev_hdl *ndev, enum amdxdna_power_mode_type
 		return -EOPNOTSUPP;
 	}
 
-	ret = ndev->priv->hw_ops.set_dpm(ndev, dpm_level);
+	ret = aie2_pm_set_dpm(ndev, dpm_level);
 	if (ret)
 		return ret;
 
diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
index bd94ee96c2bc..2d195e41f83d 100644
--- a/drivers/accel/amdxdna/aie2_smu.c
+++ b/drivers/accel/amdxdna/aie2_smu.c
@@ -11,7 +11,6 @@
 
 #include "aie2_pci.h"
 #include "amdxdna_pci_drv.h"
-#include "amdxdna_pm.h"
 
 #define SMU_RESULT_OK		1
 
@@ -67,16 +66,12 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
 	u32 freq;
 	int ret;
 
-	ret = amdxdna_pm_resume_get(ndev->xdna);
-	if (ret)
-		return ret;
-
 	ret = aie2_smu_exec(ndev, AIE2_SMU_SET_MPNPUCLK_FREQ,
 			    ndev->priv->dpm_clk_tbl[dpm_level].npuclk, &freq);
 	if (ret) {
 		XDNA_ERR(ndev->xdna, "Set npu clock to %d failed, ret %d\n",
 			 ndev->priv->dpm_clk_tbl[dpm_level].npuclk, ret);
-		goto suspend_put;
+		return ret;
 	}
 	ndev->npuclk_freq = freq;
 
@@ -85,10 +80,9 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
 	if (ret) {
 		XDNA_ERR(ndev->xdna, "Set h clock to %d failed, ret %d\n",
 			 ndev->priv->dpm_clk_tbl[dpm_level].hclk, ret);
-		goto suspend_put;
+		return ret;
 	}
 
-	amdxdna_pm_suspend_put(ndev->xdna);
 	ndev->hclk_freq = freq;
 	ndev->dpm_level = dpm_level;
 	ndev->max_tops = 2 * ndev->total_col;
@@ -98,35 +92,26 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
 		 ndev->npuclk_freq, ndev->hclk_freq);
 
 	return 0;
-
-suspend_put:
-	amdxdna_pm_suspend_put(ndev->xdna);
-	return ret;
 }
 
 int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
 {
 	int ret;
 
-	ret = amdxdna_pm_resume_get(ndev->xdna);
-	if (ret)
-		return ret;
-
 	ret = aie2_smu_exec(ndev, AIE2_SMU_SET_HARD_DPMLEVEL, dpm_level, NULL);
 	if (ret) {
 		XDNA_ERR(ndev->xdna, "Set hard dpm level %d failed, ret %d ",
 			 dpm_level, ret);
-		goto suspend_put;
+		return ret;
 	}
 
 	ret = aie2_smu_exec(ndev, AIE2_SMU_SET_SOFT_DPMLEVEL, dpm_level, NULL);
 	if (ret) {
 		XDNA_ERR(ndev->xdna, "Set soft dpm level %d failed, ret %d",
 			 dpm_level, ret);
-		goto suspend_put;
+		return ret;
 	}
 
-	amdxdna_pm_suspend_put(ndev->xdna);
 	ndev->npuclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].npuclk;
 	ndev->hclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].hclk;
 	ndev->dpm_level = dpm_level;
@@ -137,10 +122,6 @@ int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
 		 ndev->npuclk_freq, ndev->hclk_freq);
 
 	return 0;
-
-suspend_put:
-	amdxdna_pm_suspend_put(ndev->xdna);
-	return ret;
 }
 
 int aie2_smu_init(struct amdxdna_dev_hdl *ndev)
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index c99477f5e454..0d50c4c8b353 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -101,7 +101,6 @@ struct amdxdna_dev {
 	struct amdxdna_fw_ver		fw_ver;
 	struct rw_semaphore		notifier_lock; /* for mmu notifier*/
 	struct workqueue_struct		*notifier_wq;
-	bool				rpm_on;
 };
 
 /*
diff --git a/drivers/accel/amdxdna/amdxdna_pm.c b/drivers/accel/amdxdna/amdxdna_pm.c
index fa38e65d617c..d024d480521c 100644
--- a/drivers/accel/amdxdna/amdxdna_pm.c
+++ b/drivers/accel/amdxdna/amdxdna_pm.c
@@ -15,14 +15,9 @@ int amdxdna_pm_suspend(struct device *dev)
 {
 	struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
 	int ret = -EOPNOTSUPP;
-	bool rpm;
 
-	if (xdna->dev_info->ops->suspend) {
-		rpm = xdna->rpm_on;
-		xdna->rpm_on = false;
+	if (xdna->dev_info->ops->suspend)
 		ret = xdna->dev_info->ops->suspend(xdna);
-		xdna->rpm_on = rpm;
-	}
 
 	XDNA_DBG(xdna, "Suspend done ret %d", ret);
 	return ret;
@@ -32,14 +27,9 @@ int amdxdna_pm_resume(struct device *dev)
 {
 	struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
 	int ret = -EOPNOTSUPP;
-	bool rpm;
 
-	if (xdna->dev_info->ops->resume) {
-		rpm = xdna->rpm_on;
-		xdna->rpm_on = false;
+	if (xdna->dev_info->ops->resume)
 		ret = xdna->dev_info->ops->resume(xdna);
-		xdna->rpm_on = rpm;
-	}
 
 	XDNA_DBG(xdna, "Resume done ret %d", ret);
 	return ret;
@@ -50,9 +40,6 @@ int amdxdna_pm_resume_get(struct amdxdna_dev *xdna)
 	struct device *dev = xdna->ddev.dev;
 	int ret;
 
-	if (!xdna->rpm_on)
-		return 0;
-
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret) {
 		XDNA_ERR(xdna, "Resume failed: %d", ret);
@@ -66,9 +53,6 @@ void amdxdna_pm_suspend_put(struct amdxdna_dev *xdna)
 {
 	struct device *dev = xdna->ddev.dev;
 
-	if (!xdna->rpm_on)
-		return;
-
 	pm_runtime_put_autosuspend(dev);
 }
 
@@ -81,14 +65,12 @@ void amdxdna_pm_init(struct amdxdna_dev *xdna)
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_allow(dev);
 	pm_runtime_put_autosuspend(dev);
-	xdna->rpm_on = true;
 }
 
 void amdxdna_pm_fini(struct amdxdna_dev *xdna)
 {
 	struct device *dev = xdna->ddev.dev;
 
-	xdna->rpm_on = false;
 	pm_runtime_get_noresume(dev);
 	pm_runtime_forbid(dev);
 }
-- 
2.34.1

