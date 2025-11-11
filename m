Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE45C4CF4A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 11:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F4710E53E;
	Tue, 11 Nov 2025 10:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="JkqUWrQm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013058.outbound.protection.outlook.com
 [40.107.201.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597F410E53E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 10:15:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6DWOslSWFV8frtGMnrryWdZHK22CId2nXX0hcwcqCUtfKpiw12IVp/6HzGlaIV24V4ezEN0ED2vII2gV4STa38lErLEo1upwloeD7ueq4kWwQ+KpZtijW/EKjhc+tNli+VuN+NRJZm0B4LETvmp5UG6d2z6Oo5t2WCr4EIVnitYvbE8pmuIZIz4ccXCXr79HS5aAn6vFLh40j3bs9SDNIHypRhn29wjHvzQZfpC2xeGTBKQk5jiQTAZdsvnKrycmOXm+zcGpw3LBxbuIHocNjY7Qy7eFMyL9wTuhEPHVyfC3UfdScsLV7UzEcZPPa5AsdhT1P7JD3FX7ZjioEz0Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxLTEw1wbmrYbdIYn+VHy3lKwPk7oPIOcjhjOIOC5uI=;
 b=xLn8rBB51nZXmPpBKm6KpWm6fh9AZFkeDe+eyX6+SRgf1DjFxzIt1Xj8h5VIVFnQK1/LT9zXMAuc4bK5pmbuk2iuNb8zd3dT7iBbOjF4zxTMM/oWr1Ze9rbW6Lu4bY2z5auYIXVUKPOfi+UvZV0atS0HVDXghitKMr2pmedkQ8HS6PNT/RqKNEigP0+Pzy2suW8BH1Mynn0fYSi7iL5lP62FodcmVYw682Q3G/x6xhjDo7MFPYehDDZ0hZOLWgyF0EMgXk3azNFf+uVCQQH2fRa2523Ozl3RV0WJ2783NGQ+LAM1cExih4AKLg9WcPFV7DzwkwZlzGlV/CMehe4zJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxLTEw1wbmrYbdIYn+VHy3lKwPk7oPIOcjhjOIOC5uI=;
 b=JkqUWrQm2JN67HviqIYa1UddVr3E8B67CH5jNPPnrp3OZP0BCUNvvbwQ/qyd9Lmx/3iCyf0Uya3er0zj1yOK7rcv9m1E8yUUdJPakNMz+zSYktMtTkWYcZy8gmPYTbssT/2L4tdsLpbHfVaEvoPJS+GheFdPbuEJ2aiKxbY4EAM=
Received: from DM6PR13CA0023.namprd13.prod.outlook.com (2603:10b6:5:bc::36) by
 PH8PR10MB6315.namprd10.prod.outlook.com (2603:10b6:510:1ce::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 10:15:50 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:5:bc:cafe::7) by DM6PR13CA0023.outlook.office365.com
 (2603:10b6:5:bc::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Tue,
 11 Nov 2025 10:15:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 10:15:48 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 04:15:43 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 04:15:43 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 04:15:43 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
 by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ABAFh5Y1794247;
 Tue, 11 Nov 2025 04:15:43 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
 by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 5ABAFg65011926;
 Tue, 11 Nov 2025 04:15:42 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <horms@kernel.org>, <namcao@linutronix.de>, <vadim.fedorenko@linux.dev>,
 <jacob.e.keller@intel.com>, <m-malladi@ti.com>, <christian.koenig@amd.com>,
 <sumit.semwal@linaro.org>, <sdf@fomichev.me>, <john.fastabend@gmail.com>,
 <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
 <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
 <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net-next v5 6/6] net: ti: icssg-prueth: Enable zero copy in
 XDP features
Date: Tue, 11 Nov 2025 15:45:23 +0530
Message-ID: <20251111101523.3160680-7-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111101523.3160680-1-m-malladi@ti.com>
References: <20251111101523.3160680-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|PH8PR10MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: 152e3b73-675f-4afd-9c0c-08de210b4902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rrHFTcOQdB0zWlOaLBZnsyEDipppBamaEXTMcMv+c/JEkCuBCYiTdY0ZYrFp?=
 =?us-ascii?Q?DJ5BJXvE6ZABHuqOmpiz+nGLx++aEmM4jlpwqrsWkp0prFBOMatlnLg7jbpg?=
 =?us-ascii?Q?D5wzvhBBCv9GE9qhp2quBqtQgy2IW1GbcFSkA1D4yuICoJDVOJzpZhaKXOa5?=
 =?us-ascii?Q?jKF1cMIOW2Bz1PtRK/wmYdGUe1cc3Iy6zcxN1owgVSN4CYQ0Qb658c+ufKn4?=
 =?us-ascii?Q?9C/YZ0gatN2NRvbBPLIW2y6pvxTCABh1a+O4AKI8NX1fr5UcTm6RPFzLCJRr?=
 =?us-ascii?Q?tydCngX+ELY0++3nWU/a4WAOxhb1p4PSwc7t+fKt14HhlM80smqVQsO2Vwbm?=
 =?us-ascii?Q?42UifKxoBC8gDNo4K01C2+daOgKYM/OABembqGsLA3JmItDVAkCXDgqFZaNW?=
 =?us-ascii?Q?TXHE/Mfbl7m5MblrVQjxualiixIV9Ragrq+Px00F0Nw8aWshjJA+VySUfvm5?=
 =?us-ascii?Q?s/H8B7G/hOhfeuY3O4rvl24/ZNXC24nXvC5R+eISV4ykXT0GJ0t7LB+666jm?=
 =?us-ascii?Q?KsqbvePL2Xc+HGpxChNU/U7fzmG6cPxMoDceOyOueBLaxdvypLLGztYw0cNB?=
 =?us-ascii?Q?klFR5CaK0pY8G6DyFq/8M1kvCtvNTQI8snq3xDA/iTayL6+dnKttn9fwnhro?=
 =?us-ascii?Q?hBzBYBm0mN+a1rGRdNEV+HPjVF8GL29o8xuVu4rC1eeRCUuKNu3XNxMTBp/B?=
 =?us-ascii?Q?e1Fs3nfTa6xw5RtzXUVPyzkpKPj642pI1Ou9c4e/9MFXuFt+ARUhrFJprFf0?=
 =?us-ascii?Q?3mcI4jRQvJhytCUVhBHGmQdY15JbawTa3PVrYUfsdEuVBeyhE6MvQarEZ6cw?=
 =?us-ascii?Q?gYTu+PbjP9BQXZDNdsjnwrx5r5Fl9wwAcETFTkYVjqb6lm4s6StM614GCCS4?=
 =?us-ascii?Q?GidXDxL34Zb4RemE3cn6coUIg/Muh6MwVEXDm4kDSTc5alT2EBLQ+7qxJRIE?=
 =?us-ascii?Q?WpticweaDZdjv9017ORX/1DEsM4LpGmwwHmrldYrpUWwdkB/h+oWe+0XNEe9?=
 =?us-ascii?Q?0sKOkNVgOGKE1Rw3Q9Jl7D4+x7b2NAolk8xy77m1Z5fHDBOyPBBGFSXgbFxE?=
 =?us-ascii?Q?CjlbvP7W4pcZ3YDHN85v/SEIesuMocW7Xu+SwlmYtUYE4STz7FtCjOGCBxRY?=
 =?us-ascii?Q?+oTwvx2FqUMEHig39Lvua2uKfmtQm6+yy6bPv/kODVCP8ewuVkmabzGh1Bkh?=
 =?us-ascii?Q?Z4UcOLlH5lPdOWqrzoGSXJ8CMIZIbK77aAsdVyBtK/i2XtyakiWWcEfdXF/0?=
 =?us-ascii?Q?bs+bBUUch+f0JuqHr2Y+iTy4JCIsBbGYtsWVfpA0K+rY5cJd79uivwvG8SPx?=
 =?us-ascii?Q?2aWjywjmh9xx45a2tWuwFDED1ccQ0AbgD5lQQhoaFtSVcSwleHZQv7FjyS6F?=
 =?us-ascii?Q?pJGhdsgkDDQszXlmj9rwtpsCn9urHNmb2Qzuwb5sYULBzJBomX851HkzTle8?=
 =?us-ascii?Q?Mb5OxKKDRAW0wjkmoYfdqS7DI9jyVigvHSI5MTWrhMPTiFVL+DaLPAGU6Kte?=
 =?us-ascii?Q?7ZdWP1vHY81iWMQzQbuQY1hA7+wk9sl8fdsi8yGXL8UfE6dj4A8JrSUvVHS4?=
 =?us-ascii?Q?2JueUzmFUSIu1oyOyIE=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 10:15:48.6069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 152e3b73-675f-4afd-9c0c-08de210b4902
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6315
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

Enable the zero copy feature flag in xdp_set_features_flag()
for a given ndev to get the AF-XDP zero copy support running
for both Tx and Rx.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 22de04ac18cb..f65041662173 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -1554,7 +1554,8 @@ static int prueth_netdev_init(struct prueth *prueth,
 	xdp_set_features_flag(ndev,
 			      NETDEV_XDP_ACT_BASIC |
 			      NETDEV_XDP_ACT_REDIRECT |
-			      NETDEV_XDP_ACT_NDO_XMIT);
+			      NETDEV_XDP_ACT_NDO_XMIT |
+			      NETDEV_XDP_ACT_XSK_ZEROCOPY);
 
 	netif_napi_add(ndev, &emac->napi_rx, icssg_napi_rx_poll);
 	hrtimer_setup(&emac->rx_hrtimer, &emac_rx_timer_callback, CLOCK_MONOTONIC,
-- 
2.43.0

