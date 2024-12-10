Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7089EC52F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 07:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1134E10E603;
	Wed, 11 Dec 2024 06:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fZsstPEJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2042.outbound.protection.outlook.com [40.107.96.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14CC10E140
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 17:46:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGOPdpD7U/29YS6FAv00G3MDcMiYU6bKyZbng+0hYI1IjP+JplBGtXdaa4Fsu5JxU07Pgg3GjUs7FZBffmbVA+Cy36+DW3Ocso+0Hz1vk7gDka9cYtQuNjs6Z8GyKCmHzkHlq0d8MQ+dJrlj77s5oS649v1DasXkuqegS5+KYWH9BI3Vj8D2BPj7Lxg/iAZvy5Bs56wqpbxrlmdtkllwpO073cOJ/X+URvnkXaJJ2PM5u+s0MYf5gZcpCReYesnyswj1kyFDzsiF2IwogCqTqWY8g1Iw70HgnFm0XsF60hW0mg2Pyjzx3IzJ5rl2tO0jgRaljGdEb9dGkCfC3E+jwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeBOyrNndl2/rz2H1q2Ts3sA89Xg/HljkXeaX38HY8I=;
 b=T+yy3k338IuaQssJXiQXRvmpZxkYYgH0Ram3x7cCi7BFJmpJlgMdQVHznJxXKnuEU0g20N4q4M3lH/C7sCydU8SEhuOSFO6SBJiop6D5rZyNn1tcLSinzWMAFenNWgppGUr7ILAIAyh4iwRQc3Pv4SmVBHEG7R1v6iI0QCWEYY3P15E7nMbSv5yPHMXeOtKL2Hv4y4zOAb5IR8CdG4aGlyIWu1GrH57+TyEaoV0BCEzUk40dsWOtS/Zb/ItRzpdhachwuMWJIVvJWoZS8+iL9pwGwJlPeBIdl43sXGS6+YGgxSgwe1r8VStEscJGkYGkIKW5sAjseN/2SQgOj+BzZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeBOyrNndl2/rz2H1q2Ts3sA89Xg/HljkXeaX38HY8I=;
 b=fZsstPEJKAbvYcFkZpssytsLSWTQflPx2BtZc7maQG6A/IDRmNiOmVACuTfzbGIx8TisZcTzGDmy/NFSSDe+QXeNpBVqr+E/kSmpv4FaRLMYoB/QCVUVxWe4VgyMG/nwwxNSrLXbxugHyMhsPK5oQsi5UrFfyXEr81STUyTgBX3LM2QzVGQMmAAB0f4FE0qpkJ8yFjkPBR52Ktw+286h63+MxqaZqh0RMzITqZxhG7cl7NeLOcrHW59C/xgwKpSrM0Np5UMEZiEK52vWgOZNtTQW12Js/g9Mpp6liPBxculHsKUMUTpNs/jQLKaKiar85PerQc7ZNYxYSIJ+6mDNaQ==
Received: from BN9PR03CA0977.namprd03.prod.outlook.com (2603:10b6:408:109::22)
 by SA3PR12MB7974.namprd12.prod.outlook.com (2603:10b6:806:307::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.24; Tue, 10 Dec
 2024 17:46:18 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:408:109:cafe::37) by BN9PR03CA0977.outlook.office365.com
 (2603:10b6:408:109::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.14 via Frontend Transport; Tue,
 10 Dec 2024 17:46:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15 via Frontend Transport; Tue, 10 Dec 2024 17:46:17 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 10 Dec
 2024 09:46:00 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 10 Dec 2024 09:46:00 -0800
Received: from thinkpad-t480.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 10 Dec 2024 09:45:59 -0800
From: Johnny Liu <johnliu@nvidia.com>
To: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <skomatineni@nvidia.com>, <luca.ceresoli@bootlin.com>,
 <mperttunen@nvidia.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Johnny Liu <johnliu@nvidia.com>
Subject: [PATCH v1 4/5] drm/tegra: nvdec: Register the device with actmon
Date: Tue, 10 Dec 2024 09:45:53 -0800
Message-ID: <20241210174554.18869-5-johnliu@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241210174554.18869-1-johnliu@nvidia.com>
References: <20241210174554.18869-1-johnliu@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|SA3PR12MB7974:EE_
X-MS-Office365-Filtering-Correlation-Id: fef6495c-1897-491a-e844-08dd19428cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|376014|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4itRbsl9mcXzJMRbA96zMK6surKwasRGmAo0bTJAnfPK/+YJXgldNbUuZ3Io?=
 =?us-ascii?Q?Vz9sESJY33ReCKpsPnN3OleTdvsdbnuMUrfUM/hF5MRLQhSbHBtaXt1Q22qd?=
 =?us-ascii?Q?9j1xaSkwqZNGm8kX624jKrm6fKj/AphN3MzfqnRHq8R/v0dsnk+0Q6RjRj+7?=
 =?us-ascii?Q?K2IStvF/Ya4gdXz+lnoI7ujJ4PRPUhUsAcjNJEsoI8M1vQkmAtEvUEu1dXBl?=
 =?us-ascii?Q?UNbx6cyWclWPNPvC3AZpK+HShvmbHL+ORty449JLSK81XHv4IJSyLsl9/Cu8?=
 =?us-ascii?Q?OR4S3yqwqKc4baUa6+TSSBKE67NhcC+uA1sWZL6dCXAyxI46h1h1pLNWGvJX?=
 =?us-ascii?Q?UQhpANk3YlB63G9NXtfg8rxqo1LmNUIqrP55Lp61rgxTo6zN33o5eMxNKTbS?=
 =?us-ascii?Q?RimEnFD/7wyJeNxNzHgpCjI0kdpIb6B8Gu+lf5o+rmkKTydnr1pFun+QMlfU?=
 =?us-ascii?Q?7Coq6gF3VXOWj4uO2tctm/HCD/dp06YtN1e/R6nt/DhQIZPx+Fmmk/EhJ3mD?=
 =?us-ascii?Q?S6sjyA70eq3TcKXLK2NEk5a5KKg0ORqVOsWF10MToqA1ROr5hteVsrfXM2nL?=
 =?us-ascii?Q?un02x7fIBkae50AyO5jIiaIRrcSlmZFWuweShkXJ51cwLIEKMceiK9Y/3OYe?=
 =?us-ascii?Q?jWqTv6q8e9kQh3pl7Air9ngT3SYJ+6+Xyapoh7yO2Q0S1/IApq1+7y5BgM4/?=
 =?us-ascii?Q?aQbUnnxelhQh7z635t6/ys4OZ7FAZ4Dj+a6AHfTE2PgifmUMQL0kt0HnopQj?=
 =?us-ascii?Q?xLEp3nhPNvamdu3oTO0LnVuR3JeTpv+oNv2rbQpoBo9DUG7XH2Ra4bzzIoqP?=
 =?us-ascii?Q?CfHWGiAixo04TqRhFDt7hrZtCp8KGqjQEdJp1g5DB+0F0zX8BBx6soeCu8kL?=
 =?us-ascii?Q?uUzBy1k5+TVL0/44Ac5QAlrOjAEDRRd6suUpgBcKSHt/eoZqYLu3yJPQ5e/x?=
 =?us-ascii?Q?3NYMfw68wyemTorwoLjvaiZaux9VNIObp1pJv2WPAJDQVo93WnjCEcDewDu9?=
 =?us-ascii?Q?BxFmEfHnSUEUSvkWD9Ths4I3FNQMPuqNP6CfvTCZkeLJ8c1rw2UpGDXO+zrZ?=
 =?us-ascii?Q?FcYPMZmE+AgmXT2LpXnfSEYmm5trnDSJXx8w5b9CmcjI7ngQ8DYK0/TGn6I7?=
 =?us-ascii?Q?6+/mXyZ/hxP3Qtwa+P2mZjxU3nKXWSwWF2ZUwTyRpWqa8uv303VsXNn5ucTg?=
 =?us-ascii?Q?JS3lEQj0KLLhMNIb9jN1fjtGU9pb6LJ57maSEtxYU8ryqtQQgzvGMTZ5u7lc?=
 =?us-ascii?Q?KG0Em7Rt9imZqYV3Ww6QEK+aIdfcid9LtlgLZ6UONvyEReN/m30G//hCmyEH?=
 =?us-ascii?Q?Cw/tU0mlGDzRctFu7Rhpq4sWBxR8wZax1cE4rNbXIqxf9i4uCQszFMjKzwaj?=
 =?us-ascii?Q?TizcP5kJhiEER0ioxM4COXQxlHTqBZfSONqh3JH3bYVr/poLoGjWsl2ECS/h?=
 =?us-ascii?Q?r5G8SGoyOQkQjPo1CeourFsGgvaPbAGyfUSSbRdV86yBhly0kk23nQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 17:46:17.8065 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fef6495c-1897-491a-e844-08dd19428cf5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7974
X-Mailman-Approved-At: Wed, 11 Dec 2024 06:58:14 +0000
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
index 2d9a0a3f6c381..b7c572484d1be 100644
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

