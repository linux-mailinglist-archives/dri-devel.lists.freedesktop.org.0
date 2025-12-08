Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D400CADCA9
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 17:54:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E847E10E49C;
	Mon,  8 Dec 2025 16:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fB37onH1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011017.outbound.protection.outlook.com [40.107.208.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE13710E035
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 16:54:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvBph4dmDv9pQZUsPHZZjjQo5RxU28P/jKt4RR6DL/mHI4oCUk1+ndbgifnxga6VTBLlagq8fxYximbuoucftddgaMrXafFQYe2PLFo2H5/KKek2rPtZ7mBvvW+JbKKbyKkLS2dlGaE+KruTLQ8a9CnCZXpTx2xx6Nt6V6cGc+lSwzSuqoxdl2SmPAkGeqKqEz4vjZSkfasA27vUWJ0VF04qaristN+98fnQjSoWvjYDoPu1M5s9NPJekiLdxP7ryDc4UCrsH+7Docjr3efLx1BAV7Y/KZHbgTun/4g5jfDXAdMYku1i01DXpOaE+Zn732KxjIMRmlv9l+A9Y76Qig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZ2gkVoIXtHo9UbgZf17DNbATeVHud8RV8ph17h8TCc=;
 b=Bc0VpYJOwcg5bQa+QO3Y+OrVlGVo6uqITOiR0NVpMTnHsbgZ+meBKO6IQUPIsXrhsR+w/P7L2OBD77OgxCvqOksYy32/jKuXA5ViTIJLlHNLokkbV7xiYBN/3RCjZAs0/AANs3czMdrLuCUZMv7gRvqAF0yN0TPSgOgStA2xweH7yhlMw+DjgUNFlz81k3wmMqJ2B3Ymxfze//A1stVJyiEAJfyIWVDckiWrlIMEfsXqQ8iwo2qUlHBH3AgEJxb7zu2+YY92sfTYttw+WM/LHXgi6uKNboqGGEfL+LH4LEJTYUoCA+gN1SkvlIq1yZtIPukFlE15zE0377LuBE0JvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZ2gkVoIXtHo9UbgZf17DNbATeVHud8RV8ph17h8TCc=;
 b=fB37onH1raDsZq//cTzgYQ8udoIg+9ceep1kfUuZFZaPOWPsFtbjlJZ2eOWnqNCWdQRE+HgyAdT70UymSFacmMdpd3y0Edh65sWC0txtmrzDC3ZS0xVYCQ1dTRIttoIqvdmfy2BThzP8Jl0dhMcPtWVEWGs/S9Iak1CU/2Xuv9o=
Received: from DM6PR07CA0121.namprd07.prod.outlook.com (2603:10b6:5:330::33)
 by LV5PR12MB9801.namprd12.prod.outlook.com (2603:10b6:408:2fc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 16:54:00 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:5:330:cafe::7d) by DM6PR07CA0121.outlook.office365.com
 (2603:10b6:5:330::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 16:54:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 16:54:00 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Dec
 2025 10:53:59 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 8 Dec 2025 08:53:58 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V2] accel/amdxdna: Fix race condition when checking rpm_on
Date: Mon, 8 Dec 2025 08:53:56 -0800
Message-ID: <20251208165356.1549237-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|LV5PR12MB9801:EE_
X-MS-Office365-Filtering-Correlation-Id: 43be993f-fdb3-4d1e-974d-08de367a62d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NvspZcOK2pODyNE6hLQUnhk6FgkTP1b0hWmb8IESAbASb6dM4CYTrDCh+xQQ?=
 =?us-ascii?Q?fEsobS5AHf9i1Dy4A5LZeXEhPLN2xt2eRQOJx/Se1SkDhUGOrPb25Q4hb57H?=
 =?us-ascii?Q?5hxiMChWzKIiGbeQKS5LMkKI8ijD1YZcPLGLyqZuIsjSYIIORVmF3aO5ZL7J?=
 =?us-ascii?Q?kE4bBZPR5mjHaUdCAp+eZiX/DYhgF5amtwPY6Mrj2oyb3+prwb3Ics5ujWIc?=
 =?us-ascii?Q?XQ+8oOiUpFv2Ld2/eRkJUByQKRvImqunQy8dryBjYD2Mz3lcdd2hyK2dn6CS?=
 =?us-ascii?Q?iU7pOSM+gsZe/+x4AdpeuRdwc1Q33toY7rOW4I/TqfQjNRZdj39kgPYqeS7V?=
 =?us-ascii?Q?/W6lnoreOlNUdns8PpfQ/JCQzY7YyTJWcXIFHVV/USX8ow9iOnLTMU2Blo5j?=
 =?us-ascii?Q?kCUy6Y6PNuJltTJgh5h/TGJym//E0ymYIWWQNfMDJKoK2x4uUPdOzQVV1V99?=
 =?us-ascii?Q?olmUia5DItZC0hfD8uVQj1DjE7of0JNbUQ9izS4Yp5WNqwz3JhI21qZsMpqm?=
 =?us-ascii?Q?dyIDmKdSMndbt1WriV+C3v3XcfG8Oozabzloa0kRlQI4VUaLa8v2iA/HzxkT?=
 =?us-ascii?Q?pxvYTzD39kJHKFhohWQi4jaA13delTWOz6zh3Cxx8sQcFZsDrXbcR9UD1lL6?=
 =?us-ascii?Q?3TXLZ7XasvBw5l0BpIssd1B48y1HUFFg5nmjOugNG6OlxthijHpJRws+7VL8?=
 =?us-ascii?Q?EDwe+qiw5JrTUEBqZD9OpuXtQM8jjpz+jpaeuVZYxRyirrjZmiAcBubj3EKc?=
 =?us-ascii?Q?YmPb+48++SYtpkd5uUvqnf5LBg+g/4OPOlebOUZwbj0hKo9ZxM4j5YTao00N?=
 =?us-ascii?Q?a1kjl7iDQtjp/GxvqV/3EhPGsF2w0kVEnMS/NEHMqc0BhN5PrvlUv80F0s0y?=
 =?us-ascii?Q?WhaY4ikqVYSG1M5zZIFlEboX9A14Jd2Cu31XzQaRuHuoFSBXklsJQyVPicTx?=
 =?us-ascii?Q?l8FM2kzgbHt/U4GYLMvaHuCBxRjHvas0xxLnUvcXcTkZIAzFK2ABgP9hQPJi?=
 =?us-ascii?Q?6P75HRmabKWaqXky+lCiUeWbBoIS2BGsJTFTypHH1kkcgfHioX8U3LDGN4Vu?=
 =?us-ascii?Q?rlVLwsaMaFggF2ZcJgEcWMBEmH/5hmfri3KtnYoHzab9b5Zvl8vR2UlbHFUL?=
 =?us-ascii?Q?YTw/Db/G35qRnoW3z4aIOXCYV0kcAtyTuHS4xYUl0PU0duF8/2haD1RpAPhq?=
 =?us-ascii?Q?1uvPbyJaVfMzJjCjuNM/NQc6nRIir8MvDC39B8nvAIOwHVcJZ1LR2V6sZlnU?=
 =?us-ascii?Q?qEw5lrWKAPYc2EEOR3gCEs7I33eHwliHJJuZNPA7mPZmsMsG74M9nvH+JKUH?=
 =?us-ascii?Q?j1uTCE63BhlzW4nd+XZqrwVqekhzlsCs74oAE8AQ3qJNsUX1SJgU5RYaskBl?=
 =?us-ascii?Q?xjS50bq3tq2NvhANtcdOyvUGulCTGnSetMH60sMLOnTdcb+7kql9OU9x+0jV?=
 =?us-ascii?Q?Pyl7GK/9kcMG9ootGjEgLitK5ksyDqczB8OXTcZl98fqFbipS1V6JGjEYQi+?=
 =?us-ascii?Q?iIkNqP9FZZ7v8aJBuLEVjKnDxr5KIQxd9b+hChHMxaBn0zwD9A8d1NJ39ibG?=
 =?us-ascii?Q?kmJrGIKvjAraEodDHqY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 16:54:00.4191 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43be993f-fdb3-4d1e-974d-08de367a62d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9801
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

The set_dpm() is called by suspend/resume, it relied on rpm_on flag to
avoid calling into rpm suspend/resume recursivly. So to fix this, remove
the use of the rpm_on flag entirely. Instead, introduce aie2_pm_set_dpm()
which explicitly resumes the device before invoking set_dpm(). With this
change, set_dpm() is called directly inside the suspend or resume execution
path. Otherwise, aie2_pm_set_dpm() is called.

Fixes: 063db451832b ("accel/amdxdna: Enhance runtime power management")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
v2:
    Removed drm_WARN_ON() from aie2_send_mgmt_msg_wait().
    Revise the description.

 drivers/accel/amdxdna/aie2_message.c    |  1 -
 drivers/accel/amdxdna/aie2_pci.c        |  2 +-
 drivers/accel/amdxdna/aie2_pci.h        |  1 +
 drivers/accel/amdxdna/aie2_pm.c         | 17 +++++++++++++++-
 drivers/accel/amdxdna/aie2_smu.c        | 27 ++++---------------------
 drivers/accel/amdxdna/amdxdna_pci_drv.h |  1 -
 drivers/accel/amdxdna/amdxdna_pm.c      | 22 ++------------------
 7 files changed, 24 insertions(+), 47 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index fee3b0627aba..a75156800467 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -39,7 +39,6 @@ static int aie2_send_mgmt_msg_wait(struct amdxdna_dev_hdl *ndev,
 	if (!ndev->mgmt_chann)
 		return -ENODEV;
 
-	drm_WARN_ON(&xdna->ddev, xdna->rpm_on && !mutex_is_locked(&xdna->dev_lock));
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

