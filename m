Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3976C69350
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 12:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D00810E48A;
	Tue, 18 Nov 2025 11:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="RN8E4ZuG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010004.outbound.protection.outlook.com [52.101.56.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735DC10E48A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 11:53:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmy9zvP4OlqFbhkWFGOcto323+x4UAqMwgLH+BAE+/mVWRO/CbQ40MYhOM0ZgNU+DyPVz5D1cF1HCilMcUODN3jo83ApTiC/n3v0m1OuVtTGhJvmqg/mh7K/VcIib4flyf5vgxxkY/ILnHilg6AuknnjdceN2X5ActAUSzmlng8+QIC9xLEesWgZ7LuCMJkqoIpQqp9xM1uN3wahMwUG7QhcY9MVRvh6Jbp5l/9GliEtMbTdfYu8ptSeChKXfGcSPRR5LP7yyhLMUuKyTRJgdiJ/BsrM0X2KpllE9CaPA8u9c4vkVisKZ8QuN4iWdvYtwAxoY8IYH6a6x2aMLS5gzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zo2yAB64mQbhFoNPbrHpiXafZf3Ft4t6a6E+Q3vDpws=;
 b=Fw3svtc+dtirsUlzQZBz45kTDi5rBLbHPlBV5iY5LyFGncb9EOUW3536xYopGth5avHTdcZ0r1tjn5TGP8VMPPDmCHfkOkj6GFeJSepEycDOMfRHDp0hgujXFeW7nrC64QRDokmWlspuf6rwTzgcO1JbMYiFdxjpmKytJ8X7irfWFi9BmOQi80ApxWfKxOuELY3b2vwU0Coc7AQ/BoCT7xZvNBs+qCdWJbvMXWidwJiB+E1jn04UcRA8BsoJPeQCajVExZDd/Du/UkWDgn1bq6ZcHS0RWY6dwxmP8ckW+b5K6Wmki8TJQoRGgCeYgldLdRAJ+GYjfuisgGq4Qp15XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zo2yAB64mQbhFoNPbrHpiXafZf3Ft4t6a6E+Q3vDpws=;
 b=RN8E4ZuG4zc0OoCdjAp5C2v+aNm2ql8kBatVB/E14aCUdLLW/O5QFH74QiN1/pRYr8yXs4SyVdd/xjzP0/atrbadjHycl52pOKG+d1TDYhIdLiHOJfEl+23Zf+/p0BdddJi/cQg9AQlkeDdCxGrQ7eAZG98rfCDue+XYO6ZgNqw=
Received: from SJ0PR03CA0060.namprd03.prod.outlook.com (2603:10b6:a03:33e::35)
 by SN7PR10MB6497.namprd10.prod.outlook.com (2603:10b6:806:2a4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 11:53:46 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:33e:cafe::a1) by SJ0PR03CA0060.outlook.office365.com
 (2603:10b6:a03:33e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 11:53:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Tue, 18 Nov 2025 11:53:46 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 05:53:43 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 05:53:43 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 05:53:43 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AIBqulT006869;
 Tue, 18 Nov 2025 05:53:36 -0600
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <Laurent.pinchart@ideasonboard.com>, <airlied@gmail.com>,
 <andrzej.hajda@intel.com>, <andy.yan@rock-chips.com>,
 <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <javierm@redhat.com>,
 <jernej.skrabec@gmail.com>, <jonas@kwiboo.se>,
 <linux-kernel@vger.kernel.org>, <linux@treblig.org>,
 <luca.ceresoli@bootlin.com>, <lumag@kernel.org>, <lyude@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <mordan@ispras.ru>,
 <mripard@kernel.org>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <s-jain1@ti.com>, <simona@ffwll.ch>, <tomi.valkeinen@ideasonboard.com>,
 <tzimmermann@suse.de>, <u-kumar1@ti.com>
Subject: [PATCH v9 6/6] drm/bridge: cadence: cdns-mhdp8546-core: Reduce log
 level for DPCD read/write
Date: Tue, 18 Nov 2025 17:22:55 +0530
Message-ID: <20251118115255.108225-7-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118115255.108225-1-h-shenoy@ti.com>
References: <20251118115255.108225-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|SN7PR10MB6497:EE_
X-MS-Office365-Filtering-Correlation-Id: 760d3da9-9e1f-44a1-f09c-08de2699213f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rhrk2dzXsVSECEl3a95I5Ya7ezYohp092iJWmB30iDMAOyQSt7WIxHD2UDbX?=
 =?us-ascii?Q?xzSSQ2n2mBp1hy9PNFNrE3mDQHS3UpoY4rD/FXjo3s+Rx5zQXIUoT8raeRDx?=
 =?us-ascii?Q?FrmT9FtOB9NGsBhoaTETxVIItcMRM1cnE7C4XH1UGzDtaDaKBa+xci/CFYyu?=
 =?us-ascii?Q?c5JEJ2QpS5ICjfO0LMi3/c/ZwJN3co5aqhf5nCADusyzCffYBUj2fIlL5SJa?=
 =?us-ascii?Q?oZVeoqs3g1EhhIMX6tO3NVyoAu1qd55pzY83JIugTnChP/W6gHeFzdoMnYMT?=
 =?us-ascii?Q?zIk1LFR8yx2KdWvB9datqe7ujdQDsHcUheezn15Fqm7EZgFEr1mLelgsPQtf?=
 =?us-ascii?Q?22iQhSFdmPoshFSpTrwyrKxTUU2MueIbyfJ/trB63qSp/1+beubA09pHPR3Q?=
 =?us-ascii?Q?RiQw16SOLdpvzrG4Ilgqiz3ETtglPAQDs2wKVPBFnAgATq5vjoWNzuFsHlY/?=
 =?us-ascii?Q?KlPqBQzH5OAyVcR2uKMiWi7kTc33CQ8b02ynS+AHy+DpR2ekW+OTDdJsbzg8?=
 =?us-ascii?Q?O3fm8p4h3bCDU5YQpJRWsWr8ReLnnBPzTnVTrK7PRyytgPAdF8obCUP5nn9n?=
 =?us-ascii?Q?7YybKEIe8qD5nwzNEEVuC5SE7aCkOZrgnyoAj4g7gOPzergTJKnSzQDM1M9b?=
 =?us-ascii?Q?7VLLeKKPn/m+Wc9nryfaeqSL2/EYmZdT4XbzR+VGdldlHkAmFQlbYJQstVMM?=
 =?us-ascii?Q?Bb9Hr0yI4Ax9tSLBnWdjgfFaGPdmWyOGm0NP+vCl7db+F7G62nN6ipDqS7wP?=
 =?us-ascii?Q?7NRPvegMzOEtU7tzzPGhlemRps7HKP7kVp7u+ctOIDRep69NLAj8wgKgAaF5?=
 =?us-ascii?Q?ONAu9C5mt62LzpL597BY5jleU2kvV2cgIZVTvTThPvxK4zer50c/tOVfG1Qa?=
 =?us-ascii?Q?SnnLl0rLitaZf4pRxDqg80aj+ifOrLZjV5KwLRuXdelQgFJiIjGvYA0CYMMt?=
 =?us-ascii?Q?7zYU9D0HMukFySKWe6R2ao3EVp9euW/ZAXk08ufKgL/yUuXDhKjO4bEvKA3Z?=
 =?us-ascii?Q?E8yaeFQilq3XgkfFazAPQ0UKoqYR20XwbLIQtUTxw2EIJvVrib4idarFNxGh?=
 =?us-ascii?Q?NlZxgyhjfxIqdczrBd0USsi6rR+K1yI1FnxA/BK1T6yBOV76dW6A5lORylSO?=
 =?us-ascii?Q?LOF4heeNwSDe9KmDP+xaxmtrE8spI7971JhjbrCV6J0XQMr1lAWPZ1AKoeOK?=
 =?us-ascii?Q?fB8q7R4E0OMVT+hZRxMHIJAg0xEKrYcNOF3VcsBsfgGlsOMh4XldoUS44K4q?=
 =?us-ascii?Q?8HXGgMAmijqQg2dd91t0LCUQq+xov7sIS7gA9ixpFNTpC3awZRYPjUfoFR/D?=
 =?us-ascii?Q?6Wdil6gXs+MyHSvIOhb0acukXz2iVpHlXS3P89liQ/8rvfX9VIyKiK1UqiTK?=
 =?us-ascii?Q?GsDySy9mgeuRcicKDaG3LK5B8EZEm5wuMbaIzgC4gLGtB5j600BLZOHn1GT+?=
 =?us-ascii?Q?/W54nRRtp/Yc59rK8xr7TLtzlyuUhkksGA/Gm+1q0iUY8sNf2DedrOTFzew6?=
 =?us-ascii?Q?9Vfxf4nVMk89H3TZo09Eff2jd23cdtFprrBGLpSoygrADjgDGtTR1kSGczNf?=
 =?us-ascii?Q?rc5fbPoJZVL5y5BsorwSkp5zPqtux3YM2ws/5a6T?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 11:53:46.1592 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 760d3da9-9e1f-44a1-f09c-08de2699213f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6497
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

From: Jayesh Choudhary <j-choudhary@ti.com>

Reduce the log level for cdns_mhdp_dpcd_read and cdns_mhdp_dpcd_write
errors in cdns_mhdp_transfer function as in case of failure, there is
flooding of these prints along with other indicators like EDID failure
logs which are fairly intuitive in themselves rendering these error logs
useless.
Also, the caller functions for the cdns_mhdp_transfer in drm_dp_helper.c
(which calls it 32 times), has debug log level in case transfer fails.
So having a superseding log level in cdns_mhdp_transfer seems bad.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 002b4be3de674..120eb7ffe20c0 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -778,7 +778,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux,
 			if (!ret)
 				continue;
 
-			dev_err(mhdp->dev,
+			dev_dbg(mhdp->dev,
 				"Failed to write DPCD addr %u\n",
 				msg->address + i);
 
@@ -788,7 +788,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux,
 		ret = cdns_mhdp_dpcd_read(mhdp, msg->address,
 					  msg->buffer, msg->size);
 		if (ret) {
-			dev_err(mhdp->dev,
+			dev_dbg(mhdp->dev,
 				"Failed to read DPCD addr %u\n",
 				msg->address);
 
-- 
2.34.1

