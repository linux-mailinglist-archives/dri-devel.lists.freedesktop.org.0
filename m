Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 027D998646C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 18:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4274D10EA59;
	Wed, 25 Sep 2024 16:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sAjVFa45";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E44910EA59
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 16:05:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXq2z/65RWCz/GDCvyM2j6jmqBOKNzkn52qFFS8JhEmo7nPaWpnHR2VXgK23hSKLu9wjGlWUBbUCH8o22pSpT/1MLaLFwPXOHpRJHsBDUBNaPyK7moPgKx5kScgZVLY35RHJur9Nh3FwwQozyZxfM9fiUaG6lNG1QBzglRN3R7JsD0sMs2oN5pqi3ExpTGR/3UevHHfED+pdTjthlelHU4n2lRDpHjfd7fASRo/kheDAt61pVoWgvkku4AcrRO7GixDt3uJSrzlxolHt9Zw3D09Z3d9+KWO6cde7Fb8/akAwEYypdZdQbYcyV+8Y1WP//O4zNGbZjiS578GfzmVHvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIO88w+BSdkHVxp6eKRIFqh72+VZCvhgmy8auYeWk+Q=;
 b=yAsuutVypV5HjK+8f95CBDHBuPPUQ/zZPGg6pd/lFiSWeCrqOsONXqmcPZlTT5iP+w73YTps/A7wiveKC4jgnItt0ymc/jPVc0xaEF7rdP8p+5xyE5E+d+1BMVAAG61J2E4ptW/AerDPfjuqEQ5OPTFCuntq+UWE6lT0XEX9ydqBa7hY0t8+sbxLHdAQmClziGRtkEzfWV6fGxadnKD0o/QeQvQyv6uEwKnM9QdS0WONnJObriFb8D4o17HDVs91ucpPNynI1tO56gmLmrBUgbutsoC+tSlKqVZnROtBW2iFwOu4wEyZ4IqJ7w6xJbGdiLqIzOJld/yU7jkMfpVbIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIO88w+BSdkHVxp6eKRIFqh72+VZCvhgmy8auYeWk+Q=;
 b=sAjVFa45p9tgbIbCM1i8x84NY6aC4JVkH/sPpfsk7NtW6F5+yc8CqGbNNK0q88vqlHJxlIOgYCBGthY6tv0bGMOJnODBojHiTBRMjG99cNX8GGnFtgaRttab+ohLOXtg1ohQwZvdxyQ6d2KjEXjy2eNapLb6Z32sTFBndtZOH6OpW024Y83bBC/TiPBa+D+5cqSZJrNkbzoJGCX+f62MN2P/73tCLjpY+bmHPZTUlU6sOJ/RmHguEWv9flAAc6Kizs8vVnFF7+mX7upz2GBMcT6kUBmeBg7wHOBfTwtFyl7yM1Mow+8kqq8mv1ojFMmc0GSzHwKuftVclkiP5r7EPw==
Received: from SA1PR04CA0018.namprd04.prod.outlook.com (2603:10b6:806:2ce::23)
 by DM6PR12MB4203.namprd12.prod.outlook.com (2603:10b6:5:21f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 16:05:23 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:2ce:cafe::4d) by SA1PR04CA0018.outlook.office365.com
 (2603:10b6:806:2ce::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Wed, 25 Sep 2024 16:05:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.15 via Frontend Transport; Wed, 25 Sep 2024 16:05:23 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 25 Sep
 2024 09:05:08 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 25 Sep
 2024 09:05:07 -0700
Received: from moonraker.home (10.127.8.9) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 25 Sep
 2024 09:05:06 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen
 <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>, "Jon
 Hunter" <jonathanh@nvidia.com>
Subject: [PATCH] gpu: host1x: Fix boot regression for Tegra
Date: Wed, 25 Sep 2024 17:05:04 +0100
Message-ID: <20240925160504.60221-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|DM6PR12MB4203:EE_
X-MS-Office365-Filtering-Correlation-Id: 199fcd69-e080-4462-8e1b-08dcdd7bdcf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t2973iBgZYa7pxgzUekzAPVRF1gcDl+O+OSVmzF7K7uAGCfFriV9r0od8f5c?=
 =?us-ascii?Q?dxSqVFHINh99+e9k0rZYXyEIlIGkTVIyh9onGPvu6heZ6wgj0nNFPEF6Uij4?=
 =?us-ascii?Q?v9W3o9M21C1Q3TGdOF3wVp6d033H6FEHaB5gS/WwS8XTf2iOk+CON64RGdnZ?=
 =?us-ascii?Q?ygyBSgeSG4ZsWlzn366xaFOYFgLX1fBGJEAejRRDIL5dPDiDeag7xjuFuaKT?=
 =?us-ascii?Q?LFzAUgdo+BO5cI+zY7Gz5KnPIamumkj25+7fl4VD/XxzDDSwsiOWlY5FZ68O?=
 =?us-ascii?Q?f2G7SDUK6iRB6x58rPu08jCYr6Muke9iMzsdaqJm86EkWcHIHg2jq7rMEz04?=
 =?us-ascii?Q?yC4H8lnfa0pyqS+Bd93bl4ocFRrFBPuIIuowCJpYMpMWRSSpf40NWusLQA7d?=
 =?us-ascii?Q?NVIE/p537kJpIAHfGG6jDrgxmpyvMZDdcTl1n4UVf8+9qljf+18rcCyfEQAH?=
 =?us-ascii?Q?LTQcA2jh1nbePpHhcRfNcP0u8cYPCMdsnbSlJOY2D2WBiyTK72VBBMVkJ/6i?=
 =?us-ascii?Q?T26Ubyb41C9PVvFE10U1U8VnbET6prYIs2lcuyOsLL9gBSZe67AG9rEUBRjW?=
 =?us-ascii?Q?XF5XYpds4rE8j+h8xr0aJxyX4iuJ2fydL4QeyV52K95D8EVXH3XJlLbw5jBj?=
 =?us-ascii?Q?JZ6QFgPMDORSXvSKG2fHeLr1+bQHQZ7H8RtKWU7bhb5839wCNcfBqHnIc1Yw?=
 =?us-ascii?Q?16B1fIVcXziuplZ8qqqM9d5paQzl3XjwcTHv8S30CKQdjrUunzpw3xG5FEBv?=
 =?us-ascii?Q?9GXfdXahLJqsRMJMXj33bbjGOqIisAdlIjmmXeoLUsNPFtDTUhZjP/oMYCg8?=
 =?us-ascii?Q?6x66XJq2mjWuqIHJYdNnNhcD1DHhW44oqyYnwC/Mcc/E02DxZcej266NNPeS?=
 =?us-ascii?Q?osavIfyi2vmztPWzfPR91BiC2H/WmjqhnftU56wOgAfIb0QDdWreKN1HuyHD?=
 =?us-ascii?Q?hb6QA2yC00uthqdg4RAJ5omB9/EETkVeHXuzDt01+oguYfxMmjQhUu82ztmT?=
 =?us-ascii?Q?6khRJKmA8/70RT8YvkGDal490SdzXTM/7yPYmJY21GsVSXSVuSLcejFzzXcY?=
 =?us-ascii?Q?fbhEEURlDZt1xg4mMrxrQQwZyzuWPSCGCyne9MhMu47/O0fwd4EMre9r7oxj?=
 =?us-ascii?Q?fqe/M6tNIK+w8Mgj8cLcM5S1tnHYr42hs5Ihg8RTRmpgq7+fh7wsQLxBtiFG?=
 =?us-ascii?Q?h8rx8qIV8yW6wBqM+eVm7b4dC1hZgswOu401tjtYHF9Ha3dYR68qKpsyf+fS?=
 =?us-ascii?Q?gyIorDur9VFA68q9Ge2izhXSGCPQuQ2hsU14IFzj6XplB/yUEK0QPom60Ejv?=
 =?us-ascii?Q?NrgwvldOIZl/nXcue/c7MuPBkkzJdvT2JNoVO8kTe75TeoqTw/MnulfTufxJ?=
 =?us-ascii?Q?JTmZEdWSkMOkh3UFFnukHOjQAu60?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 16:05:23.5961 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 199fcd69-e080-4462-8e1b-08dcdd7bdcf2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4203
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

Commit 4c27ac45e622 ("gpu: host1x: Request syncpoint IRQs only during
probe") caused a boot regression for the Tegra186 device. Following this
update the function host1x_intr_init() now calls
host1x_hw_intr_disable_all_syncpt_intrs() during probe. However,
host1x_intr_init() is called before runtime power-management is enabled
for Host1x and the function host1x_hw_intr_disable_all_syncpt_intrs() is
accessing hardware registers. So if the Host1x hardware is not enabled
prior to probing then the device will now hang on attempting to access
the registers. So far this is only observed on Tegra186, but potentially
could be seen on other devices.

Fix this by moving the call to the function host1x_intr_init() in probe
to after enabling the runtime power-management in the probe and update
the failure path in probe as necessary.

Fixes: 4c27ac45e622 ("gpu: host1x: Request syncpoint IRQs only during probe")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index b62e4f0e8130..e98528777faa 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -625,12 +625,6 @@ static int host1x_probe(struct platform_device *pdev)
 		goto free_contexts;
 	}
 
-	err = host1x_intr_init(host);
-	if (err) {
-		dev_err(&pdev->dev, "failed to initialize interrupts\n");
-		goto deinit_syncpt;
-	}
-
 	pm_runtime_enable(&pdev->dev);
 
 	err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
@@ -642,6 +636,12 @@ static int host1x_probe(struct platform_device *pdev)
 	if (err)
 		goto pm_disable;
 
+	err = host1x_intr_init(host);
+	if (err) {
+		dev_err(&pdev->dev, "failed to initialize interrupts\n");
+		goto pm_put;
+	}
+
 	host1x_debug_init(host);
 
 	err = host1x_register(host);
@@ -658,13 +658,11 @@ static int host1x_probe(struct platform_device *pdev)
 	host1x_unregister(host);
 deinit_debugfs:
 	host1x_debug_deinit(host);
-
+	host1x_intr_deinit(host);
+pm_put:
 	pm_runtime_put_sync_suspend(&pdev->dev);
 pm_disable:
 	pm_runtime_disable(&pdev->dev);
-
-	host1x_intr_deinit(host);
-deinit_syncpt:
 	host1x_syncpt_deinit(host);
 free_contexts:
 	host1x_memory_context_list_free(&host->context_list);
-- 
2.34.1

