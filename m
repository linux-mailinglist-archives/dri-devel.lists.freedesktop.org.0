Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25741A069B7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 00:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230BA10E1C4;
	Wed,  8 Jan 2025 23:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e84OSHep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A640810E1C4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 23:56:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kATsV3DFuDZWUgQiAM928+Ij80NdV5X37/Cz6MHQhIohfHx5r6I+VTp6djKot/gk2ed8MHDvdOZoKO2kctN0Ni4hUD0hx5l30/+Ipg4Jic/1wRaIL4HRLvZkVdwqOCMbmqlJevAqP1WFHAA7ARtI0axw7HzXF/faltclgsLCkuExHgPSsixWU/FR8YqjKMIpOpydyq3dP2HbLzrllbiwoFcYeW4fN7SroJS6yfR2c+QxPZE+pNmeZx4OgLXTABKir4HKpo4Auhde2hRRYVEtH7JxjspxBmmnH4WFIYVR3CI0PwGIFQ2jYkm1yI5y/KhoVi9WtMHn/ldJBMsbWbhgMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLIIj4WCSG+yx0uvDjA1+jEmJL1W/1AAjqu75Q11WGk=;
 b=S6J9e0Ug18Wo23JXYGFUS97NYLA7jliw8v3xU6d9+N3EMTYtiyNEnPW1BSr+tiiQ//6DjeDt2m51U04j0OtZ/iitfAm7SAu8JiJOswV0Vq2Fyd51pzR3i+1glsvbfLv0dqoFbg5jsSOf1zJ5zgvbOfkBrdrfcAgU1u2M+D99aGajUk1LTPMGJ+I22TNou8CTXBVYegN6GGSHGlUitkDgDfYYaa9QvTtZKDj0PsFYof6dNiBY1ODQIO4CnLLDMCePt1MLZq3ZB2lHs+7Fb2Z4kD5Iv/6pH9jHzYa4+wolF5eqD1xc/f8JCmX7jp6VwCGoPvkLqJzpkG6UWT6P8RjZew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLIIj4WCSG+yx0uvDjA1+jEmJL1W/1AAjqu75Q11WGk=;
 b=e84OSHepXmizik9UMaWx87BcA4yF0Na9KR0pfnGQsjVxvi2FQEFdLqXT7NEsRMsSIJrTvkuvUbjcFcMcleorJRrHgKhauCWctMgq3t0AItDoDdk6ZuCOwa3taIMVdyI5ausEW0eckjA2Fc4bXCI3nOMomOAnE4/aHeGUs5WFtkA=
Received: from SA9PR11CA0019.namprd11.prod.outlook.com (2603:10b6:806:6e::24)
 by CY5PR12MB6432.namprd12.prod.outlook.com (2603:10b6:930:38::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 23:41:59 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:806:6e:cafe::57) by SA9PR11CA0019.outlook.office365.com
 (2603:10b6:806:6e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Wed,
 8 Jan 2025 23:41:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 23:41:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 8 Jan
 2025 17:41:58 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 8 Jan
 2025 17:41:57 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 8 Jan 2025 17:41:57 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>, Dan Carpenter
 <dan.carpenter@linaro.org>
Subject: [PATCH] accel/amdxdna: Return error when setting clock failed for npu1
Date: Wed, 8 Jan 2025 15:41:50 -0800
Message-ID: <20250108234150.354703-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|CY5PR12MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: 504abcc0-2e86-4f86-ed5a-08dd303e0b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1LuuzWPhX8NJM2LFISOJonXWuB7QhLgjB+ovw5nI9dOOqWarutPUxl8ORHvx?=
 =?us-ascii?Q?iikd3j+iSK32yB5+ZnC+tQxDSNjxCTtfElxt4UiKffJTQkCVboBe9LJ3JGA7?=
 =?us-ascii?Q?tt+1AXCed3430xowHOV/tDSjWmMepELIda2Vys1PZoQFQI1IQqywqOxgZ19o?=
 =?us-ascii?Q?4PipzJCIJ/CgUqIJO30p/amFcB4YNeVZfY+oz7TepN1r/p1nzPTPU0r/wVyK?=
 =?us-ascii?Q?Ogjl4k7YDKg5ZbVN4WiD7/vgYcWhl6lIGZpHarcdFpquqZ0C02P+xn+DyVoY?=
 =?us-ascii?Q?ycaxhJEIb2awcWybbF5iZ+eX2fz5o15ewdP74DAWhKe67fIstegELznlodl0?=
 =?us-ascii?Q?e5W7TqzT6YOAOZU+pm3hBsz/qfVvdNVBthX8BfUB3biXN4UZ0PRapAjcbDvE?=
 =?us-ascii?Q?7P6CwB7yi55kOK5uQfhbThKJxjt2RXPSyz6Odnrl/JrBKeUkA8wNgRnKWCMi?=
 =?us-ascii?Q?9dEQOUmAqplWvHA9IlVMBvmlGmmnUCrBicyhuLVq+u9Biix/h83F+XPfiYxO?=
 =?us-ascii?Q?CAMVkoug9MK6gPmctTkqA+fe8SP/jx8N1c+Bl2kaMGKb5+5Qy3xtYHK56haB?=
 =?us-ascii?Q?v1fuV1W762v62CMjkvfLfP8Oof40Ooqipet7ip1+3eN8EDGdt4Cx2a21TvKf?=
 =?us-ascii?Q?CzVyCKiY3aAPYT7U9Z2qdj1TmyFBXaGze7YORfSFi+tj5GVlTNeacIJADHt3?=
 =?us-ascii?Q?zcOHP/3IPDfu0ZkGYXXRCeT3SJb5aTjZN+5kXHyNSyrHl9gTzPKWQ4LV6eqj?=
 =?us-ascii?Q?nACBxTWYbaIBlkpnebbWPiVvNqO56LGQz3+q2PyIttCBAAlByhSbXxqp5x+G?=
 =?us-ascii?Q?nu57xouHPZBjt1kjmGdiDtD6pKEEn97/V9ODAxMN2rhtaxX4zQlSRaZLIV10?=
 =?us-ascii?Q?0xX/Wk/G8JiNrYczuWQoqNvQ+lqUwZesi+gkPoe+ZeUAbHEcj31tDDb+MVQx?=
 =?us-ascii?Q?poveaVuOaYAtVPfIwtRPvtbuAsz203dmIVckIjqxsw+iTeBW49Dy3kPGcI7O?=
 =?us-ascii?Q?GSexAsDLMCOHHpXAcbe2dEs0j4/wtTxkc3fbQeo/smeUsCwWfCG82c6FFSqU?=
 =?us-ascii?Q?B3jol8zdzo9j6mLrwVV1fMV1dvR9CWnuxfm0vD14QJN8FBt4BCyt5KmU/qOa?=
 =?us-ascii?Q?OqSMnxZXstz/Tn47MqsaagxReRs/nPn3RbZlGp78FckYkEJifqhRKMyFxnu8?=
 =?us-ascii?Q?36w41seAwZPI/lC9nq6fcF3xWgQkaPoQJx0T4RG4c3+sga/D2EtERyYpDsKI?=
 =?us-ascii?Q?eLjldUmI9o5PknbAlAkEwLBX39dDAMKYEMGHAeosF/YeyPDRZNEaEawu/eAD?=
 =?us-ascii?Q?bLdudBSdtNTk/ZyJsq6OZnJytgzSl35yxrhOnFrG9eXhmw37DVEtDW3AzSOu?=
 =?us-ascii?Q?eR+f1pUrNwwAlsToz4KDDVmSyWfoxBST39t/3/9ZMhI0gefSedrh5A1CEUtG?=
 =?us-ascii?Q?sWsDpDUPsbs2c1IWGzKG/MBPZ3hCnMZwAK/n6P8GdelJ/0Tx2pj9rajA6TIK?=
 =?us-ascii?Q?y7D5tpsHFefABR8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 23:41:58.8233 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 504abcc0-2e86-4f86-ed5a-08dd303e0b17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6432
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

Due to miss returning error when setting clock, the smatch static
checker reports warning:
  drivers/accel/amdxdna/aie2_smu.c:68 npu1_set_dpm()
  error: uninitialized symbol 'freq'.

Fixes: f4d7b8a6bc8c ("accel/amdxdna: Enhance power management settings")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/dri-devel/202267d0-882e-4593-b58d-be9274592f9b@stanley.mountain/
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_smu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
index 73388443c676..e68aaf7cd9f2 100644
--- a/drivers/accel/amdxdna/aie2_smu.c
+++ b/drivers/accel/amdxdna/aie2_smu.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
+ * Copyright (C) 2022-2025, Advanced Micro Devices, Inc.
  */
 
 #include <drm/drm_device.h>
@@ -64,6 +64,7 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
 	if (ret) {
 		XDNA_ERR(ndev->xdna, "Set npu clock to %d failed, ret %d\n",
 			 ndev->priv->dpm_clk_tbl[dpm_level].npuclk, ret);
+		return ret;
 	}
 	ndev->npuclk_freq = freq;
 
@@ -72,6 +73,7 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
 	if (ret) {
 		XDNA_ERR(ndev->xdna, "Set h clock to %d failed, ret %d\n",
 			 ndev->priv->dpm_clk_tbl[dpm_level].hclk, ret);
+		return ret;
 	}
 	ndev->hclk_freq = freq;
 	ndev->dpm_level = dpm_level;
-- 
2.34.1

