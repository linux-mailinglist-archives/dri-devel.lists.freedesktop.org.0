Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA01D13E99
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 17:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D89A10E411;
	Mon, 12 Jan 2026 16:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="cjfrvp37";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azhn15012023.outbound.protection.outlook.com [52.102.149.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE4410E055
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 09:12:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aI4ETuDEcUMyOybWWFjivQ9v4gBCBir7MkQ3p7eUTIkGJZd86ZZGT6JL5/1ag4TRZgTGVzfevtIaSQewedDACDEKAkwE4HIuegDhfVB0iwCjoFSlKsonbwgP1qnH/2rwwzQbPEV1lKoNmi1m03KAhPDpAyzlIFJyESlDO0RfyWHZ8iSYK3NUjnL1pentjhk2naA0cbkI+ZF+XZPhIFLqegW+iGhA2RnX2QdPD4numQal9wtWqI4YLd4lJwTZD0Bk+CsODeSXZz2fVTw8o0TINFNG6j21Cv+sO78s4Hl6G/2kF4oRpWbMuVKDfIsXOJvRRUlq2mM3YcrknQYX5eFvrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgWH2W7r3EyBaDwSYnSbvV8TNZoCNA/rHy71pjVdDlQ=;
 b=Jpfb8RXE5wvqlPL0fjBDL/I/P6/FnO3M5nDyIXTCu2ZLYuuuZPJMk/5MnUoCIfRzMCi4qzSqZjD864hOIv4j3+8wL+Oz4tDYEQpF5zpL2W7cctXeGUSGpL6P9X8WCbFTuvMHJYKgrUnawwCQppnAMWUhLd8M07+oL3oyeSBcA9Q8I90fXFf+XkwQhkevRWGO9gK8WrFn6RdhrvAKFIduvXeGB8TlRSP5YeZrUALbq+O9IIlHM44BHZMUda7sfTQVkyI4hb+yU9rs5bkoTmYkjcp6r8XmmvquoK16v+nQyX0L2pIBolZ5et4IZL9kZNjAVBFfqeeZGBoE+pxHLM2Wmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgWH2W7r3EyBaDwSYnSbvV8TNZoCNA/rHy71pjVdDlQ=;
 b=cjfrvp37r53o3Bt+vlTbwzggnG9cPr35xE3Oy0iCe4pDEEXCJEHOsle2z2OK89DT5q/TdHkbMZWtrrjNGj/tvRqsXwqjyHp2Cbz7b5ExjOtUyHqXZv0tJAsWKWu5F3VWUt6hE+ogNIpPcCJl3h38KJK05VVFHe1krcB95PxWaq8=
Received: from BN0PR03CA0045.namprd03.prod.outlook.com (2603:10b6:408:e7::20)
 by SA6PR10MB8038.namprd10.prod.outlook.com (2603:10b6:806:43c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 09:12:45 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:e7:cafe::83) by BN0PR03CA0045.outlook.office365.com
 (2603:10b6:408:e7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 09:12:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 09:12:43 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 03:12:42 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 03:12:42 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 12 Jan 2026 03:12:42 -0600
Received: from uda0543015.dhcp.ti.com (uda0543015.dhcp.ti.com [10.24.69.9])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60C9CYcc245717;
 Mon, 12 Jan 2026 03:12:35 -0600
From: Abhash Kumar Jha <a-kumar2@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <mripard@kernel.org>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <devarsht@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <s-jain1@ti.com>, <p-mantena@ti.com>,
 <aradhya.bhatia@linux.dev>, <tomi.valkeinen@ideasonboard.com>,
 <p.zabel@pengutronix.de>
Subject: [PATCH v2] drm/bridge: cdns-dsi: Split pm_ops into runtime_pm and
 system_sleep ops
Date: Mon, 12 Jan 2026 14:42:10 +0530
Message-ID: <20260112091210.3505622-1-a-kumar2@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|SA6PR10MB8038:EE_
X-MS-Office365-Filtering-Correlation-Id: c5745309-082d-4198-b68d-08de51babe4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|34020700016|7416014|376014|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B3FS4eoSjQ4hj5bJNEH4dXUBCv8RrrPeUhpfB4YpyL7z1DlQHalgjEVTCMjH?=
 =?us-ascii?Q?UzbySx/L4b4TxB0OcrT1ZWDIdHeb4uR1RpccZQe6HKBEcsb/TpO4CJ5n+YbX?=
 =?us-ascii?Q?kJJa/9F803ZSO0J7Sqo2drOCB1Sb4uvZMajmjl3zv/6jmT/Pkf3RLPRrsXCq?=
 =?us-ascii?Q?4FGNi5Y1L6E22ND+Ct7dnLmabT3ofqgVmO1ykZ8J4TxG92R+gmmsAB8SpCHS?=
 =?us-ascii?Q?aG5//LFnscyHwCC7W1Ffo+JmzgPTOxQBBkzmtFyu1SDy0ROlfol9OOgY6bUu?=
 =?us-ascii?Q?vmlFdaJ/6Ow2HAc66qErHMiXv9xHNC6ssmDT+KHTvUB7nOYCU9JB/yvja5J9?=
 =?us-ascii?Q?ERBPxqApQflD9VoWj6+jfYpEeN13yWWQa4rVYqLCo998NFqFPZhwsW9cuQUn?=
 =?us-ascii?Q?OgLGzHB4auJ0WF3wYVK2V7u7XhVOcAB7gXt+PL2DZmEdGsXEqXLvlx031vLT?=
 =?us-ascii?Q?1I/GWrq4edekO0TmzNVq1o/jxdBwH2u5DJjz32mlv56oaBcwXC9Gr3cSBmLD?=
 =?us-ascii?Q?fSyDPzc7w2D1TqOtF/+XakeL6DR55QplwnpEBBnZytTmRBIlWjl2L8CLjpow?=
 =?us-ascii?Q?01gtJBzeA5BXPYawdmQMkDGgVH0OVGBQs8rKtBCLiHkhMj+TiiC1fCnW7Bls?=
 =?us-ascii?Q?wxHu1zumsbgwc/q+L8SEhDBgQTnGaT5pLxZP5hG4jzn6p9wODLcfIzMPvGV0?=
 =?us-ascii?Q?Bv07zW26O1KN1UiKQiWyIKeoHiRG6a5Elg3qQM1RMSfANalzFbuULSS+Rvsb?=
 =?us-ascii?Q?YnAmgPsZYW4KhRrsZZ4DOYW+u3Ceb75AQuY82Q9+CDnkIbeWIskxcY/77EhG?=
 =?us-ascii?Q?7EJdHwDLvjPA0w+9KRufB8M/inTDFlgnqBRuUTDBuFxFXZI8JgpSfu3kI4RR?=
 =?us-ascii?Q?kvkPUS86vNHcnTKG9gLYhqmZoJFqMfRTh63ZtQNj4uHyPg49Bmsks+9K0GgE?=
 =?us-ascii?Q?3DMFaIssnYuYLYjiHyFBAjPEakstKkOYxQgwFYOyKDNvi7vUI5CaJMD9VNSA?=
 =?us-ascii?Q?tu4P15UYkb0WVvnlgF+WJ/53awfYToaVddwSoZ0RlJete3cfHgMdeRTfSmwG?=
 =?us-ascii?Q?a8tGb0leGQ40I2qp/bpi7k6cWPBrETlVwqu7yc3sOYaCOngcbz4XaG6FAFY7?=
 =?us-ascii?Q?15VYnZlvlr9vVEhkG6TKmYLvJSHvD31ffUb+7zmMW5frWv96/kESvBtHlxIz?=
 =?us-ascii?Q?uVgbRkJaSm66mQh1KtB4OFVT1EAB7eUOU35DH4PY5/Y5N7I4szdxFbXRTf1D?=
 =?us-ascii?Q?nkp84Yo35pYo/yaXNZPgGeAVmCMqDIV42ZuOLeKHAt2H4bGMxBdQfCb3Evxn?=
 =?us-ascii?Q?7SwaILpyRKzy81mGYh/SOwqMXwD8Nja9QaP+bvFgxM0hTlyjDea0V+yowNuI?=
 =?us-ascii?Q?iZAuA2GPCXxLeajZeFU9tgMvR2LCb8NYCZ69V11zp7dfC3pLbRFEBo4JzD4D?=
 =?us-ascii?Q?LZ4Koe7dKmflVGhl1Kdzn6DU2uWYhC+hdJzftoiK99VTRCijzl1uJTyELLQo?=
 =?us-ascii?Q?jSJn/de3jk96aPrxGFYBaIkHHouWylkuC/yShUwbOrSZ+iyeGaGyfYGS7LjP?=
 =?us-ascii?Q?tl8Na2JjCDUwwg//QvQ=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(34020700016)(7416014)(376014)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 09:12:43.0572 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5745309-082d-4198-b68d-08de51babe4d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8038
X-Mailman-Approved-At: Mon, 12 Jan 2026 16:13:39 +0000
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

If runtime-pm has already suspended the device and a system suspend
occurs, then we see a kernel crash when disabling and unpreparing the
clocks.

Use pm_runtime_force_suspend/resume in system_sleep pm callbacks to let
runtime-pm take care of the coordination between system suspend and
itself. This ensures that they do not interfere with each other.

Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
---
Hi,

If a device is runtime_pm suspended and a system wide suspend is triggered,
we see a kernel crash. Hence split the power management ops into separate
system_sleep and runtime_pm ops.

Changes in v2:
- Improve the commit description and subject.
- Link to v1: https://lore.kernel.org/all/20260109060312.2853133-1-a-kumar2@ti.com/

Thanks,
Abhash

 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 32 +++++++++++++------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 09b289f0fcbf..25eaf0192013 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -1230,7 +1230,18 @@ static const struct mipi_dsi_host_ops cdns_dsi_ops = {
 	.transfer = cdns_dsi_transfer,
 };
 
-static int __maybe_unused cdns_dsi_resume(struct device *dev)
+static int cdns_dsi_runtime_suspend(struct device *dev)
+{
+	struct cdns_dsi *dsi = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(dsi->dsi_sys_clk);
+	clk_disable_unprepare(dsi->dsi_p_clk);
+	reset_control_assert(dsi->dsi_p_rst);
+
+	return 0;
+}
+
+static int cdns_dsi_runtime_resume(struct device *dev)
 {
 	struct cdns_dsi *dsi = dev_get_drvdata(dev);
 
@@ -1241,18 +1252,21 @@ static int __maybe_unused cdns_dsi_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cdns_dsi_suspend(struct device *dev)
+static int cdns_dsi_suspend(struct device *dev)
 {
-	struct cdns_dsi *dsi = dev_get_drvdata(dev);
+	return pm_runtime_force_suspend(dev);
+}
 
-	clk_disable_unprepare(dsi->dsi_sys_clk);
-	clk_disable_unprepare(dsi->dsi_p_clk);
-	reset_control_assert(dsi->dsi_p_rst);
-	return 0;
+static int cdns_dsi_resume(struct device *dev)
+{
+	return pm_runtime_force_resume(dev);
 }
 
-static UNIVERSAL_DEV_PM_OPS(cdns_dsi_pm_ops, cdns_dsi_suspend, cdns_dsi_resume,
-			    NULL);
+static const struct dev_pm_ops cdns_dsi_pm_ops = {
+	SET_RUNTIME_PM_OPS(cdns_dsi_runtime_suspend,
+			cdns_dsi_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(cdns_dsi_suspend, cdns_dsi_resume)
+};
 
 static int cdns_dsi_drm_probe(struct platform_device *pdev)
 {
-- 
2.34.1

