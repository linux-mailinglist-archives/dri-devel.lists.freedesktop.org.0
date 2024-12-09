Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE549EAFD7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 12:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC4410E8A6;
	Tue, 10 Dec 2024 11:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dpiB5M2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8903410E2B5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 17:26:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQDywiRwpFkXi4nrSMMKXK3NQxK+Y1PxtI2flrISbeytguBDsVl7MKBcBfySPbs4ilkmkvFaftYeiXlKiDbaCoEWVxGDFLTy8i8C5T9RIJNTlKvOewd4+avcScDnleQ/yRT7nwm13dQT2T9l06TdkOiXFf1nF5WvJj5fa7ODKvna+epwsScGGyiFA13GQ5J8Yp079ogPMrJ3cANxfb1N9ovF0r49kAmMBJohBPCvt4DG9YvGjpGKnjX1phy/XPVKtP70QdjKnf4MT9IbvRcZ7jq/LrUv7PYADgpJPfSprpCx8Yq+mGzpS8BIfRA/55FdT7l8IJmyhgdvI40NXFXR2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvSPjiHQE1JGgGbLhhm3JMtlOwLlMfxxNXE4P/q6KW8=;
 b=aZPniZHz1TbZQ0OVqjPSv0f2Pj8+xK7xmCxs1/maksAO1m1yqhfsksM2O+8JCBEqsbvN0AK4vj2zM1u2oRuwE+sLgoWO/vAU6UcbJ8XBXP8KDtsgqueA6b0BMtJGq1S73+TinECFHsG/uoAtjiJkVxS8q8F05Ho3ZZIjLoR2fPXSA9ogSOIP55p3SxrOQS0oYII50Oz7azs/luI1maEjOZuphLF1bzSfoyXxAlbSpOOQcPKk3yup3nNX6Gl34tEz+KmZbOlImGoRAfx2Qx97SfhG5w0slzQomYUOerZFK3VN59gfgJZ0zOZNCXtrEAlDgcXHm9kf16XUkfH3thRsaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvSPjiHQE1JGgGbLhhm3JMtlOwLlMfxxNXE4P/q6KW8=;
 b=dpiB5M2P+wGSZlZv/iSzgNI7ns/ut3GQZAm+RVUQbR8x+OERkQohIyxXF7XY6yGSo72ChGxmXf0Dyj1B93EUH77dN3E1eNZuWeXDQJVTvs+xwLw3ehAC58otUWWBjQc8JYnMZcQmTvZIoCqZnaVrACket/PVUvT0cn/RAMGBbkOUXVCM4k4LXl+U5uifEYyR1heZ5kW0B2+fHd9YnjxDijlgiaXpaT86yVbo45C3lJc6SZfbJ+MNkgxw3dLy+vYjKn6qzsVZGSr+y5g/Efxe1SWyVGuFLLfDq0cBtkXjDCgkPG84TY7p987or0mVMoiusWxSTvFEbUXgOzD+yNoUMQ==
Received: from PH7PR17CA0038.namprd17.prod.outlook.com (2603:10b6:510:323::17)
 by DS0PR12MB7770.namprd12.prod.outlook.com (2603:10b6:8:138::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 17:26:24 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:510:323:cafe::45) by PH7PR17CA0038.outlook.office365.com
 (2603:10b6:510:323::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.14 via Frontend Transport; Mon,
 9 Dec 2024 17:26:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Mon, 9 Dec 2024 17:26:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Dec 2024
 09:26:05 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Dec 2024
 09:26:04 -0800
Received: from thinkpad-t480.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 9 Dec 2024 09:26:04 -0800
From: Johnny Liu <johnliu@nvidia.com>
To: <thierry.reding@gmail.com>, <mperttunen@nvidia.com>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>
CC: <jonathanh@nvidia.com>, <rkasirajan@nvidia.com>, <bbasu@nvidia.com>,
 <johnliu@nvidia.com>
Subject: [PATCH 5/5] drm/tegra: vic: Register the device with actmon
Date: Mon, 9 Dec 2024 09:25:49 -0800
Message-ID: <20241209172549.5624-6-johnliu@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241209172549.5624-1-johnliu@nvidia.com>
References: <20241209172549.5624-1-johnliu@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|DS0PR12MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 9532aea0-0979-493a-b237-08dd18769ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UobFKeMJvc0x9nr2y6J2He6BK+RR/W1VEBVx931FXN0xk4N9vU788IqO0lmz?=
 =?us-ascii?Q?fJpTOFYz2+aNhpbwc0kO5imnCj1FI4Qim47SRuhnTaLkapeNdqeRFccYjglY?=
 =?us-ascii?Q?1cqwbvhUBU9SOCJb4aAjznEkFOI2pDFNeOgThdswFerm794uOLp6sU89qhJT?=
 =?us-ascii?Q?fen9kfX3zYR9oxv3fBB78F0nxjRSRzN7+Wjv8ww41PIVztjBJ7OU+vqMDHgq?=
 =?us-ascii?Q?DOzvLrM5d79dimQcVK4IsUv1B0bxxs6efbq78xQuTwsJAwVeeiVd9KwwEdoT?=
 =?us-ascii?Q?tpH6FwQq0dNr8P0l8Slh5cD1u8fMtSPd4FRMN/Lj51mR8oHWKSF8VXACqUOV?=
 =?us-ascii?Q?SRjxpEOKoJA6hIYHhGwRmJmNX0hGIgqj43JAgTv2exLPLkpJZslKN8KsaQXt?=
 =?us-ascii?Q?kmQjuPQOlx5dU56DM+CDkVJaoa90YEVXzfr7m940pW3MBQfwhMHkIV8IqQRn?=
 =?us-ascii?Q?NZyYv3FPm57NOd4uLBdX5IQYZUqCu5AbXbbdm7eEUsVkDJCCDhTkOJnG5FuX?=
 =?us-ascii?Q?w9VjXauaZ8SrjjKriq/8jZVc5+FzqCLlHjIUP8z49vXg/1+49ofnC5U6zx+L?=
 =?us-ascii?Q?GLonSezipDDlrXqmYsgdSDrkUnhKvBB41m82vGCE4RLM6pHBFSRc221lPeWJ?=
 =?us-ascii?Q?mdr9lyAAKByKogB1jsxxlhN1OiESDwaZ65kwF8tkpcxsNKsIpKa62nMUo6ey?=
 =?us-ascii?Q?1YZ2qDPBRji5jHuBYKo3315rrIO3xEXmW3OeGuWdpHjXZiLwt6zRyxIq/YX6?=
 =?us-ascii?Q?vumF8NIjFTDhDExbTSKeiveWt/S3eIQPoZ+JIlMLfp8d8AsoGexJXgap7EZ5?=
 =?us-ascii?Q?lfoPo8e2ayNKHqZC1sUOLUIYtjvXVGwL/5gKhfBiou7J4bHIkJWL0pMXsX9v?=
 =?us-ascii?Q?zdKU2yNk16h5U00Ooi1cX8Qexj2bP9mRfxLp2w2JNGZCeaRerROBrpZ7BCCn?=
 =?us-ascii?Q?if5oKLSgtAjpyl4jucyoPqTQyi4CDFdmy5J4bKdpILUG4nj6nMgpAGTdbg2e?=
 =?us-ascii?Q?INMi7H7zeqxPVgWnudJb6D1Dz3kRStXU1jaka+OAFO3s28EuyO/5WfOzzXRE?=
 =?us-ascii?Q?wpRgbO5U4SGh0xuWD1Sbg0Z5PUE6PtTZ5L+LwT/Jbd5XiHxNEpeM3huStDDM?=
 =?us-ascii?Q?uTwqikX4pQ04+msUyRpTo91NPz4Fgi5d5ocgMf3N4P9ZI/pnYtlYbBwMeEPk?=
 =?us-ascii?Q?fbOw13CTxYcuyiPfp/itMUpbFHUb+N8JULK/ZHWC14F+H8bw6/loFGsN/4Ct?=
 =?us-ascii?Q?kSqwr0m3nY+VkWOAckE9EBv1Ehxz/LFtJD1fdZxiXVrfZHWBqan1xEqcCK3l?=
 =?us-ascii?Q?FOwhCfqpFI9HeOnOKdE4+DidUNVx2xyDMLhStBM9xOtms4DEWryotlCYmaFo?=
 =?us-ascii?Q?7dr/xwEodubMvVlq5fpR1Vzcfh1ZTH3HTRGxBKE1cnU7FAslQpuMOfIs0ToF?=
 =?us-ascii?Q?q7Z81EK4K2UKJZRS1+LA8ib2a5OGeDuc?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 17:26:23.6060 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9532aea0-0979-493a-b237-08dd18769ab3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7770
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

By registering the vic with actmon, engine load information can be
exported to the user through debugfs for engine profiling purpose.

Signed-off-by: Johnny Liu <johnliu@nvidia.com>
---
 drivers/gpu/drm/tegra/vic.c | 39 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/tegra/vic.h |  9 +++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 73c356f1c9012..629cc8244c285 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2015, NVIDIA Corporation.
+ * SPDX-FileCopyrightText: Copyright (c) 2015-2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  */
 
 #include <linux/clk.h>
@@ -302,6 +302,28 @@ static int vic_load_firmware(struct vic *vic)
 	return err;
 }
 
+static void vic_actmon_reg_init(struct vic *vic)
+{
+	vic_writel(vic,
+		   VIC_TFBIF_ACTMON_ACTIVE_MASK_STARVED |
+		   VIC_TFBIF_ACTMON_ACTIVE_MASK_STALLED |
+		   VIC_TFBIF_ACTMON_ACTIVE_MASK_DELAYED,
+		   NV_PVIC_TFBIF_ACTMON_ACTIVE_MASK);
+	vic_writel(vic,
+		   VIC_TFBIF_ACTMON_ACTIVE_BORPS_ACTIVE,
+		   NV_PVIC_TFBIF_ACTMON_ACTIVE_BORPS);
+}
+
+static void vic_count_weight_init(struct vic *vic, unsigned long rate)
+{
+	struct host1x_client *client = &vic->client.base;
+	u32 weight = 0;
+
+	host1x_actmon_update_client_rate(client, rate, &weight);
+
+	if (weight)
+		vic_writel(vic, weight, NV_PVIC_TFBIF_ACTMON_ACTIVE_WEIGHT);
+}
 
 static int __maybe_unused vic_runtime_resume(struct device *dev)
 {
@@ -328,6 +350,10 @@ static int __maybe_unused vic_runtime_resume(struct device *dev)
 	if (err < 0)
 		goto assert;
 
+	vic_actmon_reg_init(vic);
+	vic_count_weight_init(vic, clk_get_rate(vic->clk));
+	host1x_actmon_enable(&vic->client.base);
+
 	return 0;
 
 assert:
@@ -352,6 +378,8 @@ static int __maybe_unused vic_runtime_suspend(struct device *dev)
 
 	clk_disable_unprepare(vic->clk);
 
+	host1x_actmon_disable(&vic->client.base);
+
 	return 0;
 }
 
@@ -520,12 +548,20 @@ static int vic_probe(struct platform_device *pdev)
 		goto exit_falcon;
 	}
 
+	err = host1x_actmon_register(&vic->client.base);
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
+	host1x_client_unregister(&vic->client.base);
 exit_falcon:
 	falcon_exit(&vic->falcon);
 
@@ -537,6 +573,7 @@ static void vic_remove(struct platform_device *pdev)
 	struct vic *vic = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
+	host1x_actmon_unregister(&vic->client.base);
 	host1x_client_unregister(&vic->client.base);
 	falcon_exit(&vic->falcon);
 }
diff --git a/drivers/gpu/drm/tegra/vic.h b/drivers/gpu/drm/tegra/vic.h
index acf35aac948b2..905cd7bfde2f6 100644
--- a/drivers/gpu/drm/tegra/vic.h
+++ b/drivers/gpu/drm/tegra/vic.h
@@ -21,6 +21,15 @@
 #define CG_IDLE_CG_EN				(1 << 6)
 #define CG_WAKEUP_DLY_CNT(val)			((val & 0xf) << 16)
 
+#define NV_PVIC_TFBIF_ACTMON_ACTIVE_MASK	0x0000204c
+#define NV_PVIC_TFBIF_ACTMON_ACTIVE_BORPS	0x00002050
+#define NV_PVIC_TFBIF_ACTMON_ACTIVE_WEIGHT	0x00002054
+
+#define VIC_TFBIF_ACTMON_ACTIVE_MASK_STARVED	BIT(0)
+#define VIC_TFBIF_ACTMON_ACTIVE_MASK_STALLED	BIT(1)
+#define VIC_TFBIF_ACTMON_ACTIVE_MASK_DELAYED	BIT(2)
+#define VIC_TFBIF_ACTMON_ACTIVE_BORPS_ACTIVE	BIT(7)
+
 #define VIC_TFBIF_TRANSCFG	0x00002044
 #define  TRANSCFG_ATT(i, v)	(((v) & 0x3) << (i * 4))
 #define  TRANSCFG_SID_HW	0
-- 
2.34.1

