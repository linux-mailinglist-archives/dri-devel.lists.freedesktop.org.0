Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1147FC1B8D2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 16:07:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C7F10E7F4;
	Wed, 29 Oct 2025 15:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Hnx4mcGW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazhn15010019.outbound.protection.outlook.com [52.102.139.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D4B10E7D8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 15:06:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9R67q7ipd4TQUbF3VmQBLmshuvx5aKowmhMmOt5lgbPyMThRQqS5lkb8nXmy6alX2tRckGrDdjdUvC+yLquPXBnmuyDvJNglWc3nMMXLdMvKY8YjygeyEI4M0/IRTFPcChyUMoWbG4hiaktc7zBILLUS6yZQGGJeZlK1P+XIdnZpCVqkPXa6r+pGMbQ1sMVTrEo5ytPKrz4Py9vXhcDXOEoWhSNP1qMZkOmw9lg0X1+QixOoaiQHTIz2Ln7KWPO1pIaTPqR/ih2XOwTcAR01p+w4ZijwlQkWbVv0HdkH5LmKR3PIdBVJSyrOuuTvT0sjfPGOoCzpHpkjIWA9fwZXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fm88c5mhwbQbI//rDyR3JudELdHZdO5OXiMHVWlaqc=;
 b=yZv9SHLoEtf8tvlz0hvH8f4M+W7L4sh4TIMrihDHTN3GtfEgOHTBjY/XZvTja4tcaDqechpU5DkqokhdcDxAwt77UCGUC3Kmdl1Mysg7VL4s2nd05aj/JhoBZO1GW0HAzmFht/SA/ptzGR8s3fQBrDp0O1kObZYY7ZSh92ZA1cUQhMWLj8qyf3bQDOsLKXRf5gUW8lgHOf+N3t1APx1JpakVyizi87Fzp4/qM+H1D31Nf4M5RRhfNP7r2E/Qh6WTa/Cpuj2YvdAa4qo8aMkqmC27BIis/6+tXdfqEZetcnPjOWXGqO1I2PIVt9z6HxhvtXSSAG0Qtada7kIP6epRyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fm88c5mhwbQbI//rDyR3JudELdHZdO5OXiMHVWlaqc=;
 b=Hnx4mcGWIFXuUssW2SzuD0o4IENhNrY83qPhedXOrjHJjsPfJ0AHMa0rZWxGKLnog4tBfhIMDoh0wbg8C1oB6d/auNR5T0ZfkbHySpIJtGbqA9nCS851M9WF89nAulf13MquPiB4mnmVu8brcW2o/Xc4Rwgmr/CSGaLvZXO36uI=
Received: from MW4PR03CA0079.namprd03.prod.outlook.com (2603:10b6:303:b6::24)
 by CYXPR10MB7921.namprd10.prod.outlook.com (2603:10b6:930:e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 15:06:54 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:303:b6:cafe::bc) by MW4PR03CA0079.outlook.office365.com
 (2603:10b6:303:b6::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Wed,
 29 Oct 2025 15:06:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 15:06:54 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 10:06:44 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 10:06:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 10:06:44 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59TF6i9F022436;
 Wed, 29 Oct 2025 10:06:44 -0500
From: Nishanth Menon <nm@ti.com>
To: Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Robert Foss <rfoss@kernel.org>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Phong LE <ple@baylibre.com>, Dmitry <dmitry.baryshkov@oss.qualcomm.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>, Andrew Davis <afd@ti.com>, Tomi V
 <tomi.valkeinen@ideasonboard.com>, Devarsh <devarsht@ti.com>, Nishanth Menon
 <nm@ti.com>
Subject: [PATCH V6 3/5] drm/bridge: it66121: Sort the compatibles
Date: Wed, 29 Oct 2025 10:06:34 -0500
Message-ID: <20251029150636.3118628-4-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251029150636.3118628-1-nm@ti.com>
References: <20251029150636.3118628-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|CYXPR10MB7921:EE_
X-MS-Office365-Filtering-Correlation-Id: 50aa7124-482f-4df1-ab40-08de16fccc12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|1800799024|36860700013|34020700016|921020|7053199007|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N1L4YqEJxIIVkNOo24Vn9Yzjj4c2eqE4ZWoC+mCKKkg4plIvdgKSIF1s+mEM?=
 =?us-ascii?Q?9ITGt3W03oge2Q7QiozCtPzmOvTDIJsKNJ0wXXEOfX9XRgdvIbpVGFZ1iFk7?=
 =?us-ascii?Q?z7i6FqwqeFtJxtR/w4wgI1TR4CjR31Lki8yARKWjYb9mKQra0rYsc393+SKt?=
 =?us-ascii?Q?0iecXYhxa/TQzGsL9fZvu5x9ihmbS+BBb5kxc+pFHn6cdp/D3OU/urAWDvun?=
 =?us-ascii?Q?yyGhSDPv/nP6O7o84o4hcI466AKKTe4tvY8inKjqrfe79ByzVvz5qY33hvxn?=
 =?us-ascii?Q?crpWfsqxED6TsGdWfeaWNehVuuHXagFGLRy+866bz7//xprjGDoDXKrJRwgU?=
 =?us-ascii?Q?otjAPjMv/InVFAXTDjtFIl6ZNhDgWqW/uA9L0N2DYaGP9YLViGr1MdgAgg1H?=
 =?us-ascii?Q?pd/T3S5I8Jx6V37Ede4terk25m0sE/ccR59Cf5jejZpl4vkGY7IzRUwZdiHv?=
 =?us-ascii?Q?bzlJl5Juqv/ZyMoUEeDI52sxJ+2kdY8O4YeprR6X/MMxmntcBmg55wrTgYS+?=
 =?us-ascii?Q?4EYsqtgtCF3OKEnsjdjP+G3yy+RctTFp/xgONNU7b7vi5wBjhdosRzTISKDt?=
 =?us-ascii?Q?D/KHg0wKtdeqxG0vB2dEhbJUs6Ayx9ueA59im7XbFvWNgzeFHU8xUsAdCs2Q?=
 =?us-ascii?Q?j0VS6EodVTgubK/94rHfqbanUZLOQaxQgV2R9m+86EXLM6J7gVX0tClHmD6u?=
 =?us-ascii?Q?sbbSlF8fRplYo4nBbghfvxXRbPDxm5Hafry+1BMCxldDHQeWjMpK5QTwAVuG?=
 =?us-ascii?Q?STsgDH4d/+ALN+aAbnrj5gj+W7GjOGwvGUKPXB9emcHdGH//teN7nCvXg+X2?=
 =?us-ascii?Q?fbqmfb6g7Z0YKgz+xPsvP98LZWnL0SGkeZT2szkl5CI6tezYhaI6+gAjLmEu?=
 =?us-ascii?Q?5f3iZBm0gmYqOe7hAw+y62+Lc0vSXuyzZ1T5PYDv3Q3FkopCleErWOBqdMLV?=
 =?us-ascii?Q?ZIs8xXJ5UIqIUCOwb/8DP3sWJXySOQExsHAhTssWNGHdkIK7e4oGq+/UgiUn?=
 =?us-ascii?Q?/PeV7L9aKZDcH3KbqHxfIrBpEArwfhLZri3z77bw1mVOBrU+D6ArWH3xcvBx?=
 =?us-ascii?Q?ezsLGI0qtRGGp4nAkf/v3DRNNQJAWXGdAiWQrC8HI+ZANtHtDlVj1ND7U7dp?=
 =?us-ascii?Q?X6y5ROUB/hyygqxHYquFBrTp3pbIz7zglJ17eQrqz837buxOnlOwAh1AvVwX?=
 =?us-ascii?Q?SctBeIdYGDV3ahSGeYwv4KZecLFu9EoYDh3FbC0NYUOGL5zz8HtL7ikBOtbb?=
 =?us-ascii?Q?FW7X7sImAFByEipl7S/4oWPW50Ch0rtMQXvET/AjY30bbqFSRQ0E8PsWSkDC?=
 =?us-ascii?Q?LGHef0cbU9IVnXM5Qcl8Aw0MpDyds/SWpotRw6mnilRFUxRNIa9w0rQHdl6U?=
 =?us-ascii?Q?1sFkiu2g69UAk2nugDr4IcRklWz0fV6Kjd5pa70XWNiZnVO3dQCQlTLd5eMP?=
 =?us-ascii?Q?6iEIbs0Ovuc0W+rHTgs98UJ0P0PfROZfpYb9pqSM1ExIBbdpxbVpXbA/keJz?=
 =?us-ascii?Q?mK0q4u0/WaL0lvAxCdu7w/rjLuBoWwiVRX13P/m8NylknR3e9kSpgE3Na8Se?=
 =?us-ascii?Q?g/l5WpNHVl05ufh3dZHwZcXRTfpBmcsjERFTS0Py?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013)(34020700016)(921020)(7053199007)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 15:06:54.3536 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50aa7124-482f-4df1-ab40-08de16fccc12
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7921
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

Keep the compatibles sorted alpha-numerically.

Signed-off-by: Nishanth Menon <nm@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes since V5:
* Picked Tomi's Ack

V5: https://lore.kernel.org/all/20250827202354.2017972-4-nm@ti.com/
V4: https://lore.kernel.org/all/20250819130807.3322536-4-nm@ti.com/

 drivers/gpu/drm/bridge/ite-it66121.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 9b8ed2fae2f4..cd74f3966560 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1619,15 +1619,15 @@ static const struct it66121_chip_info it6610_chip_info = {
 };
 
 static const struct of_device_id it66121_dt_match[] = {
-	{ .compatible = "ite,it66121", &it66121_chip_info },
 	{ .compatible = "ite,it6610", &it6610_chip_info },
+	{ .compatible = "ite,it66121", &it66121_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, it66121_dt_match);
 
 static const struct i2c_device_id it66121_id[] = {
-	{ "it66121", (kernel_ulong_t) &it66121_chip_info },
-	{ "it6610", (kernel_ulong_t) &it6610_chip_info },
+	{ "it6610", (kernel_ulong_t)&it6610_chip_info },
+	{ "it66121", (kernel_ulong_t)&it66121_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, it66121_id);
-- 
2.47.0

