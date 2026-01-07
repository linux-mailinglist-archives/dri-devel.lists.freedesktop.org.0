Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69939CFF2DF
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 18:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18BF10E60D;
	Wed,  7 Jan 2026 17:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="H69Q77Ff";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013050.outbound.protection.outlook.com
 [40.107.201.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D8510E60D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 17:46:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwyvniaUkkJgBXOqJyRo2f2CXd0074YXuQtamH8J1zqQ6iigr1tGUDgjSZgG9plEpFyZNrdLOBI8c3tD3fiEyoWLYNR5VKA51R25Mn8siHfK9vJfsTLIVQ9Wsa/yJasBohTKMEirEXtfXKd7Mr0hkHVbuyhK4iTBMaJbqvb1rSb+Ct9XRoNrwbDOonvAQuhui+dwYhp/tlD1gH8rSKEhz184kygxEFyoZd7S+KeTQ9LTdEe3arz9QVsVkx+si1mELtNu3TvsiO0mlDQ+Rr8HdNB5EEdXbvqUEM+n6w4/6dISm5g/gfcEzPCdKn0ddk2xJGbx56u7YYU2B49NhrzuSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDswSvPms4/ARHmihKilLeli36EtdBaVt5Rcx9LNVwM=;
 b=VAZOUWuzxkcSEzKYAnZCqV7h4tEwMAzZy2vKP5NTSJfAADefb14Opeo5ZpkGCyJSFr6X02By7l+LlEqz/k6PsZG7Mno8AyNG9Ed8CqDB60WEyjq1cQlU1lToPvL5hP+Gh7mxZCTseMXgOKOUQhy7BamdU1X7IJTb77fTuvbEP7VOrQg8+CIJ88h0H9Ue+hARZeLs2cBwL11FJSwcTkxh8Q3KE+MhiItemtYWFHidRWD+11wyVMjcB5wklItcQl/wuRfxphffnfNXTmir5QiVlwQ7B9+GRHfuBzMIfpb1+VviSTspbU1nnrakg2Aux2Z3FVcmnw9Tx7V4h9IWguY8Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDswSvPms4/ARHmihKilLeli36EtdBaVt5Rcx9LNVwM=;
 b=H69Q77Ff50KyAp0ENd7OIzySvHpTMBCMZnKqV9RtrGYDQOpNCCA0NgBObI1dJoJCF2ZaiVSAgZxJkjJ6qJxjjCWXb43dpXXUcHAv+D6mUx2UWVktYqNAyEYMGc8gHa4xAWuN+LEYntFDF9sZJEx4bReuUgaKrA8brvbV9GiWzuc=
Received: from BN0PR04CA0100.namprd04.prod.outlook.com (2603:10b6:408:ec::15)
 by DM4PR10MB7402.namprd10.prod.outlook.com (2603:10b6:8:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 17:45:57 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:408:ec:cafe::50) by BN0PR04CA0100.outlook.office365.com
 (2603:10b6:408:ec::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 17:45:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Wed, 7 Jan 2026 17:45:55 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 11:45:46 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 11:45:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 7 Jan 2026 11:45:46 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 607HjQlX1103883;
 Wed, 7 Jan 2026 11:45:42 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <h-shenoy@ti.com>, <u-kumar1@ti.com>, <s-jain1@ti.com>
Subject: [PATCH v3 3/3] drm: tidss: tidss_drv: Add support for AM62P display
 subsystem
Date: Wed, 7 Jan 2026 23:15:25 +0530
Message-ID: <20260107174525.1702585-4-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107174525.1702585-1-s-jain1@ti.com>
References: <20260107174525.1702585-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|DM4PR10MB7402:EE_
X-MS-Office365-Filtering-Correlation-Id: bf1d711a-1bd2-4a7a-9d02-08de4e149c27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I8bfHPrqVUgab1vpIDllNoKo6ECT+QEXkEmfY08k9V8Fq/gR6P5P056b1SIU?=
 =?us-ascii?Q?THeSW3WW7d86HvX7jitVwVhqI7SpARx4abPkLdNrzItP+m3AZ0WIyhlypVWB?=
 =?us-ascii?Q?UfpGTdXjwae+hflV9xnUFLrDXGLsrPk60+XBy/31tchM667LvmblLx5meb3T?=
 =?us-ascii?Q?b7LIGM4PKHHXbTaS3L4jM1CicRr5xceSxGqrgNZUeqDx4gYJaqJUTTBf2UTW?=
 =?us-ascii?Q?iHWcZjisS3Eyc5NVINTYN3RQyRpQrUHdw2DwFRY8oNotp4vRI2GEBNLSS21P?=
 =?us-ascii?Q?lBgGdiGZvShRZ5j36x7DacXUxVydkuvFMmCo76P/n9PypG/VT/hNPROkKvAa?=
 =?us-ascii?Q?rnSq0yYOQziiu7WSS+YFihC24xFEZcD2yZ1PM6RG42VuOkKd9T0n1zrM0/PJ?=
 =?us-ascii?Q?U7Z7aRIOEJzV6fzQy/9/E8Qck1ktutIJ5OyNuXHk/1okJtzudXxZADoJyEr0?=
 =?us-ascii?Q?Sq44G5MHiiE4sI8QbnVQVlcvOI6macb+SCTil6xqDX6iHg2TGkUQkFBbt0iL?=
 =?us-ascii?Q?8viLc5jiDnZJMgpPCfGZbXvYHQvHF4G/B6Z8X2LKzeMBvfI1wgfaWf7xMbzh?=
 =?us-ascii?Q?6L1fabVr+9V3zMfUdCIuFolQCgNbKk36S1430g5fcyAd9NfplKzCBNwHgZXq?=
 =?us-ascii?Q?usdHX/rkgIZV1crKXMMhh+jugWPtWEFcV61ywA2W7N2eP5+Xr4DbryIb+6ay?=
 =?us-ascii?Q?oEHofKhmXPxG0B0z8rC1vwr/tn6327jqQjPworXPY2hWYZ2UkLTaBtjBSlw5?=
 =?us-ascii?Q?VlaaWityQSfq7reQIs+Kcn9pj1qLxYYcDn2Xw3sbCoJM0IWml7GndWyMvH6b?=
 =?us-ascii?Q?x4efpEl8t5XyOsIKCTN+AEZy04jdwFMFbrH2WSQMWXD8tw/3eRs7oxgzUlQl?=
 =?us-ascii?Q?TbIHL6tuN0LfHus+3P1fT8VJkFP1J0Qr9dMC+Zhr2/Q5DJtmLz+fJmZy1GOw?=
 =?us-ascii?Q?/aY2dUmWImwdjl0526lYd3Hx9gYqdvJTQjh9J6BovzEcipXuEcAChFxzX62s?=
 =?us-ascii?Q?K4UbnCJ6kOPGGProqNIejXjww3ra8FwdO6l8QfXqv1I1IpFer08Ft3t6Rcej?=
 =?us-ascii?Q?iGv/lMI0MN9GFF/s8yyqMsakDSDP6NPkeO5Wjlo+LwNu1jLlQIur87Cr4FxG?=
 =?us-ascii?Q?hSraEkX/RVSsG5cymorCEHDIB9vr99bQCUP9mgaO0Y/W3Fr94qb6X21LC+lu?=
 =?us-ascii?Q?f/xUkXI5HZRUTW1+yZq7MBvRFkzYcBIe/1i1c+yd3A1LMmh4U0VMi+tE4SG2?=
 =?us-ascii?Q?gwR715b/nIGegz/MYW/by+BY3hO+0fRl2xGtNoLIweu91XxkEa0+PbdXyogX?=
 =?us-ascii?Q?69djEY1Fq5ZzQ5YytrQLNPmCU0iak4FDTEBWGcLbbdL3GQoRPJu3tQ5zOjka?=
 =?us-ascii?Q?YRkKU5i1+MpZOglpUwxC0sW0ioKDdQ6MWcBj5ziUelxzLd0ukfYcVjfFgmMj?=
 =?us-ascii?Q?weGAvLqG2fvV3mUadL06kiFwioSh9vtkBDdr8LBl4Ad5LB++skXViZgMRRWg?=
 =?us-ascii?Q?5sOxwf7qcb62A0zvI5E0VfGldM5mQNkeXEfNXQNiWTZZ8S+ciET70oehM3/p?=
 =?us-ascii?Q?ffGLbsyXFOsiSCVPTWEa0yz319eje73VxEogp/Yp?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 17:45:55.8131 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1d711a-1bd2-4a7a-9d02-08de4e149c27
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7402
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

The DSS controller on TI's AM62P SoC features two instances of the TI
DSS. Each DSS instance supports two video ports, similar to the DSS
controller found on the TI AM62X SoC. This allows three independent
video streams to be supported: OLDI, DPI, and DSI.

Since the DSS instances on AM62P are architecturally similar to those
on the AM62X DSS controller, the existing dispc_am625_feats
configuration can be reused for the AM62P DSS support.

This patch adds the necessary device tree compatibility entry for
"ti,am62p-dss" in the tidss driver, pointing to dispc_am625_feats,
thereby enabling DSS support on AM62P devices.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 33a10fba4325..0c6087adee2c 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -320,6 +320,7 @@ static const struct of_device_id tidss_of_table[] = {
 	{ .compatible = "ti,am625-dss", .data = &dispc_am625_feats, },
 	{ .compatible = "ti,am62a7-dss", .data = &dispc_am62a7_feats, },
 	{ .compatible = "ti,am62l-dss", .data = &dispc_am62l_feats, },
+	{ .compatible = "ti,am62p-dss", .data = &dispc_am625_feats, },
 	{ .compatible = "ti,am65x-dss", .data = &dispc_am65x_feats, },
 	{ .compatible = "ti,j721e-dss", .data = &dispc_j721e_feats, },
 	{ }
