Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD0D9EAFD5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 12:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1F910E8A2;
	Tue, 10 Dec 2024 11:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lbE7VDe9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AE310E2B5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 17:26:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcqVPoPYyZ5TnB3d+lUf1FHX9ZDbp3nq6HQP3iHgdd2oC2qHptfTWzv7JR7MrpIICSKgxuyKS10CvuOSDpfABdvWuFiRgB7TnZ1RYfdwYJ/yxBlbczWYM+CmGAsz2V3s6JD3kQkQHhbinaohXc123bH9upBR/hkbMc+ZVn5TIAQ4vq5GSkQ1di8f5yCZRCN4Y5vzgpzJRqOpxxHS3SHe3pUCLvbwLOpw0bR9N4GlIJyPgoTbVZD2r+wLAf3d8Ce0Qul0hOXLS1lOcOpp4kmQhpVpkRkhNj8+cdHdo2ZWUCajYZCFFDhHIgWv2gihIoAJfM2XNf8AwIRbSkY/lOrezQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRLU0Y1jIAJ0Kr6fHZqX9NIDge58TCJwLlqzB9v9K9g=;
 b=Gbkg7hxa5dMU2ldyx5v8WgcU2bVwd5kYwc2MeW13jNmXCD465oPRvcvEDjbB2vwnLOcLYoRLM/xZFNcQZV0Quw/iJo0/zah/VHuq4zua3xIDrbFKaEtGFPHV2eOhAj2amti4PEopigOQ42BXJ89oEZ0jzJ3sU2pA79vvHa2/Ijl+yXJPFzQ+lMDjBgH/OzcCWk+9tNSa3sMsr4UEhPriE2EiHGfMiBrooeng+3f0HrNJuw4STDEwGnpJZWU5LJ7PYJGpUZTwTO4epREJy6v6+AzQDluSQQd0kM4oW78scaauV63uba6KbJrLNQqsyQo0vGuzDLE7C3E7C3fS89Tktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRLU0Y1jIAJ0Kr6fHZqX9NIDge58TCJwLlqzB9v9K9g=;
 b=lbE7VDe9DEqcWukfr6Oer6VHhH6TWXAPUuF1/RPHzkDIMaA8lKG6SeQUAUVOYcRQLHumhAyWDuFWAPsyqbTPX0+JrdeMYbAXAfBOedkeiNtfnHvFWDq3DOKuomzbO7h0tLG527yuIvGF4VRrFzf3HAODbcO1SFiNEiWgouz7E8OOERiTOIQW9ZujaSG+bituraXxzoasGHLLn03yB2kMiyu871J0Qu3noSV5CYh8+f5yt8qWgCIxD2Z2QXmJoaqgc3dLjfm+xuzPNuge9M8kPABwTQ+f+MAUCyrugtrjnluHhPCHBBwZY5H6jPT4Vkj9SSvwX4JJ5Q3bAgkt3gC1RA==
Received: from MN2PR20CA0009.namprd20.prod.outlook.com (2603:10b6:208:e8::22)
 by SA1PR12MB7318.namprd12.prod.outlook.com (2603:10b6:806:2b3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.23; Mon, 9 Dec
 2024 17:26:24 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:e8:cafe::fe) by MN2PR20CA0009.outlook.office365.com
 (2603:10b6:208:e8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.18 via Frontend Transport; Mon,
 9 Dec 2024 17:26:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Mon, 9 Dec 2024 17:26:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Dec 2024
 09:26:04 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Dec 2024
 09:26:04 -0800
Received: from thinkpad-t480.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 9 Dec 2024 09:26:03 -0800
From: Johnny Liu <johnliu@nvidia.com>
To: <thierry.reding@gmail.com>, <mperttunen@nvidia.com>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>
CC: <jonathanh@nvidia.com>, <rkasirajan@nvidia.com>, <bbasu@nvidia.com>,
 <johnliu@nvidia.com>
Subject: [PATCH 4/5] drm/tegra: nvdec: Register the device with actmon
Date: Mon, 9 Dec 2024 09:25:48 -0800
Message-ID: <20241209172549.5624-5-johnliu@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241209172549.5624-1-johnliu@nvidia.com>
References: <20241209172549.5624-1-johnliu@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|SA1PR12MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: e6735625-51fb-4737-a55a-08dd18769ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jv9YbBUir9qdVQWGUURjI5+4z/HNv6Yz+1ZgvMnVokWpPw2FABjcYnKjI865?=
 =?us-ascii?Q?ZrFd+dEmA9nZAqAZHMd7/bGCJxHOjzMyCN7LxuRTdE8fFSQ3watx5YRpxs0e?=
 =?us-ascii?Q?SZRgRFa3yCrrkxxb2Ce3+TIc8yijjQIIDpqws0PvjKMt3OsBIIzltixSJiU3?=
 =?us-ascii?Q?Z9QCG78ONGBPB3GkR+JbDxYfedwVWJOsy2jzXvJDfujkdTGuqrAGZI8jmLXl?=
 =?us-ascii?Q?Jw+Th6e0W7Q0t/dETnCOqF9Ct1ys4NK2EBQCF9oiNp2azJOB35ePRLf1BcjB?=
 =?us-ascii?Q?b8MN8jBWmVTfh5SXr001s2gEz8PGSaMIYmT4F6aTESLYZg1jOmsvxS7+Cm+N?=
 =?us-ascii?Q?I8x5Ogwvxe/9vTNIHdoBVfZTL8eZwtHOnEGT0etTczYMwsMzQEsiDVzaFDlA?=
 =?us-ascii?Q?mMQ4BXxditNgEuwP9M6puH5Al6q/njPiQaf7Dngbo4Jdeq3lNYm2UTWlubEM?=
 =?us-ascii?Q?i/nPn75XIPOmAzGzYMebqrhPnScJ2/bzR1zMSRqx3japzO2hYRubc6NZzNJI?=
 =?us-ascii?Q?Ust+XgEcwp1rYnF6dSZM40QumTgHgh3r+1ZGCyEWBS/Iq7jf1l58yC3n5k2N?=
 =?us-ascii?Q?VQjT8EMa+ktNh4IqROVe1dU5AO2w6az87wBjZRMeSgQBwzwsq6OrUaKv266t?=
 =?us-ascii?Q?/ODR49FL9mPPDWsZXxN7PcJX+xC8J5k2zJ7d8Y8FgfSXY+InCT7NE30iN8fB?=
 =?us-ascii?Q?ax/TiU1CcrAj6JV5KXzO/0kyL+ADIczpKjrfCucB9jwm51Oiw5sZl6uPXHOr?=
 =?us-ascii?Q?7nDlMMhkjqyucmrwczPrnFa/vz+/ux/lnZDUkeK5jU75DPPvy8GqxVjhqllK?=
 =?us-ascii?Q?8oSe8r6sUka0a1xu/tV6eX4JTwpRCFC/7lr+9qKYxcthlaD9q4b/Bq4syswx?=
 =?us-ascii?Q?7Icza8eyC9oji1RgMmn7BKyPU4L+cjv1SEdnX8TlWwkZOXBce3+qF7moYfEf?=
 =?us-ascii?Q?h37OFUEDVOZPfmXQoAOxV/JAPNtGL7spjyJaA5t2etV5S0/Sj9mhucf+5uJU?=
 =?us-ascii?Q?Uv1rLTN3r3ebBBPJhAQOI2qwFT/jnbkc2glzk7+4pUFf9a8eyVHpIVaeslQJ?=
 =?us-ascii?Q?PF/K2C1wEHfxbA8gPZmVg6mAJmPENYZa8VrcYHaBM2EptqsBLALNxFug00Uk?=
 =?us-ascii?Q?9xwOB3hjJgxEnLPEGP5kLTwgFxqbhfICDC0E6fcI3d0TiEjLIPoZ5GofLoKX?=
 =?us-ascii?Q?fW+hyP0j8REOCDfZKwMGPOw8/KciQYFDu76FEU7Gykyrp0+8mtcF30fILXw6?=
 =?us-ascii?Q?Bt69JPuaPr/0KK/GDvek7UZzCISrwK6NSURfgSrMZ6p+rXm3FLVh+bPiEK7p?=
 =?us-ascii?Q?6+cbDzRctr/Us8v4w2PtgvbYGC+LFY5nSQs8TaivC+pchR6ckfJs6iwS8A2q?=
 =?us-ascii?Q?yxTm+9wFk4kgxf1mvvCmTVd9wL2j7y5Z2HF5oBI7EkRnE16wakl84yrzjx18?=
 =?us-ascii?Q?wJ6dcgKpuufpiWD2CDmeHikO8gisYJtt?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 17:26:23.8406 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6735625-51fb-4737-a55a-08dd18769ade
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7318
X-Mailman-Approved-At: Tue, 10 Dec 2024 11:26:10 +0000
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

By registering the nvdec with actmon, engine load information can be
exported to the user through debugfs for engine profiling purpose.

Signed-off-by: Johnny Liu <johnliu@nvidia.com>
---
 drivers/gpu/drm/tegra/nvdec.c | 82 ++++++++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 4860790666af5..f546e89b2bbd0 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2015-2022, NVIDIA Corporation.
+ * SPDX-FileCopyrightText: Copyright (c) 2015-2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  */
 
 #include <linux/clk.h>
@@ -22,8 +22,21 @@
 #include "riscv.h"
 #include "vic.h"
 
-#define NVDEC_FALCON_DEBUGINFO			0x1094
+#define NVDEC_FW_MTHD_ADDR_ACTMON_ACTIVE_MASK	0xCAU
+#define NVDEC_FW_MTHD_ADDR_ACTMON_ACTIVE_BORPS	0xCBU
+#define NVDEC_FW_MTHD_ADDR_ACTMON_ACTIVE_WEIGHT	0xC9U
+#define NVDEC_FALCON_UCLASS_METHOD_OFFSET       0x40
+#define NVDEC_FALCON_UCLASS_METHOD_DATA         0x44
+#define NVDEC_FALCON_DEBUGINFO                  0x1094
 #define NVDEC_TFBIF_TRANSCFG			0x2c44
+#define NVDEC_TFBIF_ACTMON_ACTIVE_MASK		0x2c4c
+#define NVDEC_TFBIF_ACTMON_ACTIVE_BORPS		0x2c50
+#define NVDEC_TFBIF_ACTMON_ACTIVE_WEIGHT	0x2c54
+
+#define NVDEC_TFBIF_ACTMON_ACTIVE_MASK_STARVED	BIT(0)
+#define NVDEC_TFBIF_ACTMON_ACTIVE_MASK_STALLED	BIT(1)
+#define NVDEC_TFBIF_ACTMON_ACTIVE_MASK_DELAYED	BIT(2)
+#define NVDEC_TFBIF_ACTMON_ACTIVE_BORPS_ACTIVE	BIT(7)
 
 struct nvdec_config {
 	const char *firmware;
@@ -306,6 +319,56 @@ static int nvdec_load_falcon_firmware(struct nvdec *nvdec)
 	return err;
 }
 
+static void nvdec_actmon_reg_init(struct nvdec *nvdec)
+{
+	if (nvdec->config->has_riscv) {
+		nvdec_writel(nvdec,
+			     NVDEC_FW_MTHD_ADDR_ACTMON_ACTIVE_MASK,
+			     NVDEC_FALCON_UCLASS_METHOD_OFFSET);
+		nvdec_writel(nvdec,
+			     NVDEC_TFBIF_ACTMON_ACTIVE_MASK_DELAYED |
+			     NVDEC_TFBIF_ACTMON_ACTIVE_MASK_STALLED |
+			     NVDEC_TFBIF_ACTMON_ACTIVE_MASK_STARVED,
+			     NVDEC_FALCON_UCLASS_METHOD_DATA);
+		nvdec_writel(nvdec,
+			     NVDEC_FW_MTHD_ADDR_ACTMON_ACTIVE_BORPS,
+			     NVDEC_FALCON_UCLASS_METHOD_OFFSET);
+		nvdec_writel(nvdec,
+			     NVDEC_TFBIF_ACTMON_ACTIVE_BORPS_ACTIVE,
+			     NVDEC_FALCON_UCLASS_METHOD_DATA);
+	} else {
+		nvdec_writel(nvdec,
+			     NVDEC_TFBIF_ACTMON_ACTIVE_MASK_DELAYED |
+			     NVDEC_TFBIF_ACTMON_ACTIVE_MASK_STALLED |
+			     NVDEC_TFBIF_ACTMON_ACTIVE_MASK_STARVED,
+			     NVDEC_TFBIF_ACTMON_ACTIVE_MASK);
+		nvdec_writel(nvdec,
+			     NVDEC_TFBIF_ACTMON_ACTIVE_BORPS_ACTIVE,
+			     NVDEC_TFBIF_ACTMON_ACTIVE_BORPS);
+	}
+}
+
+static void nvdec_count_weight_init(struct nvdec *nvdec, unsigned long rate)
+{
+	const struct nvdec_config *config = nvdec->config;
+	struct host1x_client *client = &nvdec->client.base;
+	u32 weight;
+
+	host1x_actmon_update_client_rate(client, rate, &weight);
+
+	if (!weight)
+		return;
+
+	if (!config->has_riscv) {
+		nvdec_writel(nvdec, weight, NVDEC_TFBIF_ACTMON_ACTIVE_WEIGHT);
+	} else {
+		nvdec_writel(nvdec,
+			     NVDEC_FW_MTHD_ADDR_ACTMON_ACTIVE_WEIGHT,
+			     NVDEC_FALCON_UCLASS_METHOD_OFFSET);
+		nvdec_writel(nvdec, weight, NVDEC_FALCON_UCLASS_METHOD_DATA);
+	}
+}
+
 static __maybe_unused int nvdec_runtime_resume(struct device *dev)
 {
 	struct nvdec *nvdec = dev_get_drvdata(dev);
@@ -331,6 +394,10 @@ static __maybe_unused int nvdec_runtime_resume(struct device *dev)
 			goto disable;
 	}
 
+	nvdec_actmon_reg_init(nvdec);
+	nvdec_count_weight_init(nvdec, clk_get_rate(nvdec->clks[0].clk));
+	host1x_actmon_enable(&nvdec->client.base);
+
 	return 0;
 
 disable:
@@ -346,6 +413,8 @@ static __maybe_unused int nvdec_runtime_suspend(struct device *dev)
 
 	clk_bulk_disable_unprepare(nvdec->num_clks, nvdec->clks);
 
+	host1x_actmon_disable(&nvdec->client.base);
+
 	return 0;
 }
 
@@ -532,12 +601,20 @@ static int nvdec_probe(struct platform_device *pdev)
 		goto exit_falcon;
 	}
 
+	err = host1x_actmon_register(&nvdec->client.base);
+	if (err < 0) {
+		dev_info(&pdev->dev, "failed to register host1x actmon: %d\n", err);
+		goto exit_client;
+	}
+
 	pm_runtime_enable(dev);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_autosuspend_delay(dev, 500);
 
 	return 0;
 
+exit_client:
+	host1x_client_unregister(&nvdec->client.base);
 exit_falcon:
 	falcon_exit(&nvdec->falcon);
 
@@ -549,6 +626,7 @@ static void nvdec_remove(struct platform_device *pdev)
 	struct nvdec *nvdec = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
+	host1x_actmon_unregister(&nvdec->client.base);
 	host1x_client_unregister(&nvdec->client.base);
 	falcon_exit(&nvdec->falcon);
 }
-- 
2.34.1

